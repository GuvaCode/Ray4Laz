{********************************************************************************************
*                                                                                           *
*   rcamera - Basic camera system with support for multiple camera modes                    *
*                                                                                           *
*   DESCRIPTION:                                                                            *
*                                                                                           *
*   Pascal binding for rcamera library (raylib helper). Based on rcamera.h from raylib      *
*   contributors: Ramon Santamaria, Christoph Wagner, Marc Palau.                           *
*                                                                                           *
*   Pascal header 2026   Gunko Vadim (@guvacode)                                            *
*                                                                                           *
*********************************************************************************************}

unit rcamera;

{$mode objfpc}{$H+}
{$packrecords c}
{$ALIGN 8}
{$MINENUMSIZE 4}
// Include configuration file
{$I raylib.inc}

interface

uses
  raylib;

const
  RCAMERA_VERSION_MAJOR = 1;
  RCAMERA_VERSION_MINOR = 0;
  RCAMERA_VERSION_PATCH = 0;

//----------------------------------------------------------------------------------
// Defines and Macros
//----------------------------------------------------------------------------------
// Camera projection / mode constants (also declared in raylib.pas, but declared here
// for standalone-compatibility of this binding header)

const
  CAMERA_CULL_DISTANCE_NEAR = 0.05;
  CAMERA_CULL_DISTANCE_FAR  = 4000.0;

//----------------------------------------------------------------------------------
// Types and Structures Definition
// NOTE: In standalone mode these would be defined here, but since we depend on
//       raylib.pas we reuse the existing types: TVector3, TMatrix, TCamera3D, TCamera
//----------------------------------------------------------------------------------

//----------------------------------------------------------------------------------
// Module Functions Declaration
//----------------------------------------------------------------------------------

// Returns the camera forward vector (normalized)
function GetCameraForward(camera: PCamera): TVector3; cdecl; external {$IFNDEF RAY_STATIC}cDllName{$ENDIF} name 'GetCameraForward';

// Returns the camera up vector (normalized)
// NOTE: The up vector might not be perpendicular to the forward vector
function GetCameraUp(camera: PCamera): TVector3; cdecl; external {$IFNDEF RAY_STATIC}cDllName{$ENDIF} name 'GetCameraUp';

// Returns the camera right vector (normalized)
function GetCameraRight(camera: PCamera): TVector3; cdecl; external {$IFNDEF RAY_STATIC}cDllName{$ENDIF} name 'GetCameraRight';

// Camera movement
procedure CameraMoveForward(camera: PCamera; distance: Single; moveInWorldPlane: Boolean); cdecl; external {$IFNDEF RAY_STATIC}cDllName{$ENDIF} name 'CameraMoveForward';
procedure CameraMoveUp(camera: PCamera; distance: Single); cdecl; external {$IFNDEF RAY_STATIC}cDllName{$ENDIF} name 'CameraMoveUp';
procedure CameraMoveRight(camera: PCamera; distance: Single; moveInWorldPlane: Boolean); cdecl; external {$IFNDEF RAY_STATIC}cDllName{$ENDIF} name 'CameraMoveRight';
procedure CameraMoveToTarget(camera: PCamera; delta: Single); cdecl; external {$IFNDEF RAY_STATIC}cDllName{$ENDIF} name 'CameraMoveToTarget';

// Camera rotation
procedure CameraYaw(camera: PCamera; angle: Single; rotateAroundTarget: Boolean); cdecl; external {$IFNDEF RAY_STATIC}cDllName{$ENDIF} name 'CameraYaw';
procedure CameraPitch(camera: PCamera; angle: Single; lockView: Boolean; rotateAroundTarget: Boolean; rotateUp: Boolean); cdecl; external {$IFNDEF RAY_STATIC}cDllName{$ENDIF} name 'CameraPitch';
procedure CameraRoll(camera: PCamera; angle: Single); cdecl; external {$IFNDEF RAY_STATIC}cDllName{$ENDIF} name 'CameraRoll';

// Camera matrices
function GetCameraViewMatrix(camera: PCamera): TMatrix; cdecl; external {$IFNDEF RAY_STATIC}cDllName{$ENDIF} name 'GetCameraViewMatrix';
function GetCameraProjectionMatrix(camera: PCamera; aspect: Single): TMatrix; cdecl; external {$IFNDEF RAY_STATIC}cDllName{$ENDIF} name 'GetCameraProjectionMatrix';

implementation

end.
