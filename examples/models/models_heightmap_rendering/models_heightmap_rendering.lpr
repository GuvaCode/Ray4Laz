program models_heightmap_rendering;

{$mode objfpc}{$H+}

uses cmem, raylib;

const
  screenWidth = 800;
  screenHeight = 450;

var
  camera: TCamera3D;
  image: TImage;
  texture: TTexture2D;
  mesh: TMesh;
  model: TModel;
  mapPosition: TVector3;
begin
  InitWindow(screenWidth, screenHeight, 'raylib [models] example - heightmap rendering');

  camera.position := Vector3Create(18.0, 21.0, 18.0);
  camera.target := Vector3Create(0.0, 0.0, 0.0);
  camera.up := Vector3Create(0.0, 1.0, 0.0);
  camera.fovy := 45.0;
  camera.projection := CAMERA_PERSPECTIVE;

  image := LoadImage(PChar(GetApplicationDirectory + 'resources/heightmap.png'));
  texture := LoadTextureFromImage(image);

  mesh := GenMeshHeightmap(image, Vector3Create(16, 8, 16));
  model := LoadModelFromMesh(mesh);

  model.materials[0].maps[Ord(MATERIAL_MAP_DIFFUSE)].texture := texture;
  mapPosition := Vector3Create(-8.0, 0.0, -8.0);

  UnloadImage(image);

  SetTargetFPS(60);

  while not WindowShouldClose() do
  begin
    UpdateCamera(@camera, CAMERA_ORBITAL);

    BeginDrawing();
      ClearBackground(RAYWHITE);

      BeginMode3D(camera);
        DrawModel(model, mapPosition, 1.0, RED);
        DrawGrid(20, 1.0);
      EndMode3D();

     DrawTexture(texture, screenWidth - texture.width - 20, 20, WHITE);
     DrawRectangleLines(screenWidth - texture.width - 20, 20, texture.width, texture.height, GREEN);

      DrawFPS(10, 10);
    EndDrawing();
  end;

  UnloadTexture(texture);
  UnloadModel(model);

  CloseWindow();
end.
