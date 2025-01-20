@interface DRPDropletViewConfiguration(ButtonHinting)
+ (id)hardwareButtonHintForButton:()ButtonHinting stage:keylineStyle:rectEdge:buttonRect:canvasSize:;
@end

@implementation DRPDropletViewConfiguration(ButtonHinting)

+ (id)hardwareButtonHintForButton:()ButtonHinting stage:keylineStyle:rectEdge:buttonRect:canvasSize:
{
  v22 = +[SBHardwareButtonHintPrototypeDomain rootSettings];
  v77.origin.x = a1;
  v77.origin.y = a2;
  v77.size.width = a3;
  v77.size.height = a4;
  double MidY = CGRectGetMidY(v77);
  v78.origin.x = a1;
  v78.origin.y = a2;
  v78.size.width = a3;
  v78.size.height = a4;
  double Height = CGRectGetHeight(v78);
  double v25 = 0.0;
  v26 = 0;
  switch(a9)
  {
    case 0:
    case 1:
    case 5:
    case 6:
    case 7:
    case 9:
    case 10:
      objc_msgSend(v22, "cameraCaptureDropletWidth", Height);
      double v28 = v27;
      [v22 cameraCaptureDropletHeight];
      double v30 = v29;
      if (a10 == 2)
      {
        [v22 cameraCaptureFlattenedCornerRadius];
        double v32 = v40;
        [v22 cameraCaptureFlattenedProtrusionFromEdge];
        double v34 = v41;
        [v22 cameraCaptureFlattenedDropletRadius];
      }
      else if (a10 == 1)
      {
        [v22 cameraCapturePresentedCornerRadius];
        double v32 = v42;
        [v22 cameraCapturePresentedProtrusionFromEdge];
        double v34 = v43;
        [v22 cameraCapturePresentedDropletRadius];
      }
      else
      {
        if (a10) {
          goto LABEL_21;
        }
        [v22 cameraCaptureInitialCornerRadius];
        double v32 = v31;
        [v22 cameraCaptureInitialProtrusionFromEdge];
        double v34 = v33;
        [v22 cameraCaptureInitialDropletRadius];
      }
      goto LABEL_28;
    case 2:
      objc_msgSend(v22, "lockDropletWidth", Height);
      double v28 = v44;
      [v22 lockDropletHeight];
      double v30 = v45;
      if (a10 == 2)
      {
        [v22 lockFlattenedCornerRadius];
        double v32 = v56;
        [v22 lockFlattenedProtrusionFromEdge];
        double v34 = v57;
        [v22 lockFlattenedDropletRadius];
      }
      else if (a10 == 1)
      {
        [v22 lockPresentedCornerRadius];
        double v32 = v58;
        [v22 lockPresentedProtrusionFromEdge];
        double v34 = v59;
        [v22 lockPresentedDropletRadius];
      }
      else
      {
        if (a10) {
          goto LABEL_21;
        }
        [v22 lockInitialCornerRadius];
        double v32 = v46;
        [v22 lockInitialProtrusionFromEdge];
        double v34 = v47;
        [v22 lockInitialDropletRadius];
      }
      goto LABEL_28;
    case 3:
    case 4:
      objc_msgSend(v22, "volumeDropletWidth", Height);
      double v28 = v36;
      [v22 volumeDropletHeight];
      double v30 = v37;
      if (a10 == 2)
      {
        [v22 volumeFlattenedCornerRadius];
        double v32 = v52;
        [v22 volumeFlattenedProtrusionFromEdge];
        double v34 = v53;
        [v22 volumeFlattenedDropletRadius];
      }
      else if (a10 == 1)
      {
        [v22 volumePresentedCornerRadius];
        double v32 = v54;
        [v22 volumePresentedProtrusionFromEdge];
        double v34 = v55;
        [v22 volumePresentedDropletRadius];
      }
      else
      {
        if (a10) {
          goto LABEL_21;
        }
        [v22 volumeInitialCornerRadius];
        double v32 = v38;
        [v22 volumeInitialProtrusionFromEdge];
        double v34 = v39;
        [v22 volumeInitialDropletRadius];
      }
      goto LABEL_28;
    case 8:
      objc_msgSend(v22, "staccatoDropletWidth", Height);
      double v28 = v48;
      [v22 staccatoDropletHeight];
      double v30 = v49;
      if (a10 == 2)
      {
        [v22 staccatoFlattenedCornerRadius];
        double v32 = v60;
        [v22 staccatoFlattenedProtrusionFromEdge];
        double v34 = v61;
        [v22 staccatoFlattenedDropletRadius];
      }
      else if (a10 == 1)
      {
        [v22 staccatoPresentedCornerRadius];
        double v32 = v62;
        [v22 staccatoPresentedProtrusionFromEdge];
        double v34 = v63;
        [v22 staccatoPresentedDropletRadius];
      }
      else
      {
        if (a10)
        {
LABEL_21:
          double v32 = 0.0;
          double v34 = 0.0;
          goto LABEL_29;
        }
        [v22 staccatoInitialCornerRadius];
        double v32 = v50;
        [v22 staccatoInitialProtrusionFromEdge];
        double v34 = v51;
        [v22 staccatoInitialDropletRadius];
      }
LABEL_28:
      double v25 = v35;
LABEL_29:
      long long v64 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
      v75[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
      v75[5] = v64;
      long long v65 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
      v75[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
      v75[7] = v65;
      long long v66 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
      v75[0] = *MEMORY[0x1E4F39B10];
      v75[1] = v66;
      long long v67 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
      v75[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
      v75[3] = v67;
      v26 = objc_msgSend(MEMORY[0x1E4F5FA18], "edgeAdaptiveKeylineWithCanvasSize:edge:protrusionFromEdge:centerAlongEdge:containerSize:containerCornerRadius:transform3D:dropletRadius:", a12, v75, a5, a6, v34, MidY, v28, v30, v32, v25);
      v68 = [v26 keylineStyle];
      [v22 allButtonKeylineWidth];
      objc_msgSend(v68, "setOuterWidth:");

      if ((a11 == 2 || a11 == 1 && a9 == 2) && a10)
      {
        objc_msgSend(v26, "changeToIntelligentLightStyle:preferAudioReactivity:canvasSize:", a11, 1, a5, a6);
        v69 = [v22 intelligentEdgeLightKeylineStyleBehaviorSettings];
        [v26 setBehaviorSettingsForKeyPath:@"keylineStyle" behaviorSettings:v69];
      }
      v70 = [v22 centerXBehaviorSettings];
      [v26 setBehaviorSettingsForKeyPath:@"centerX" behaviorSettings:v70];

      v71 = [v22 centerYBehaviorSettings];
      [v26 setBehaviorSettingsForKeyPath:@"centerY" behaviorSettings:v71];

      v72 = [v22 containerWidthBehaviorSettings];
      [v26 setBehaviorSettingsForKeyPath:@"containerWidth" behaviorSettings:v72];

      v73 = [v22 containerHeightBehaviorSettings];
      [v26 setBehaviorSettingsForKeyPath:@"containerHeight" behaviorSettings:v73];

LABEL_35:
      return v26;
    case 11:
      goto LABEL_35;
    default:
      double v30 = Height;
      double v28 = 0.0;
      goto LABEL_21;
  }
}

@end