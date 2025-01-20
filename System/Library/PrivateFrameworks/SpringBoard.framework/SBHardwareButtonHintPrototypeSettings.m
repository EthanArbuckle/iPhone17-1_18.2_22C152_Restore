@interface SBHardwareButtonHintPrototypeSettings
+ (id)settingsControllerModule;
- (SBFFluidBehaviorSettings)centerXBehaviorSettings;
- (SBFFluidBehaviorSettings)centerYBehaviorSettings;
- (SBFFluidBehaviorSettings)containerHeightBehaviorSettings;
- (SBFFluidBehaviorSettings)containerWidthBehaviorSettings;
- (SBFFluidBehaviorSettings)intelligentEdgeLightKeylineStyleBehaviorSettings;
- (double)allButtonKeylineWidth;
- (double)cameraCaptureDropletHeight;
- (double)cameraCaptureDropletWidth;
- (double)cameraCaptureFlattenedCornerRadius;
- (double)cameraCaptureFlattenedDropletRadius;
- (double)cameraCaptureFlattenedProtrusionFromEdge;
- (double)cameraCaptureInitialCornerRadius;
- (double)cameraCaptureInitialDropletRadius;
- (double)cameraCaptureInitialProtrusionFromEdge;
- (double)cameraCapturePresentedCornerRadius;
- (double)cameraCapturePresentedDropletRadius;
- (double)cameraCapturePresentedProtrusionFromEdge;
- (double)lockDropletHeight;
- (double)lockDropletWidth;
- (double)lockFlattenedCornerRadius;
- (double)lockFlattenedDropletRadius;
- (double)lockFlattenedProtrusionFromEdge;
- (double)lockInitialCornerRadius;
- (double)lockInitialDropletRadius;
- (double)lockInitialProtrusionFromEdge;
- (double)lockPresentedCornerRadius;
- (double)lockPresentedDropletRadius;
- (double)lockPresentedProtrusionFromEdge;
- (double)staccatoDropletHeight;
- (double)staccatoDropletWidth;
- (double)staccatoFlattenedCornerRadius;
- (double)staccatoFlattenedDropletRadius;
- (double)staccatoFlattenedProtrusionFromEdge;
- (double)staccatoInitialCornerRadius;
- (double)staccatoInitialDropletRadius;
- (double)staccatoInitialProtrusionFromEdge;
- (double)staccatoPresentedCornerRadius;
- (double)staccatoPresentedDropletRadius;
- (double)staccatoPresentedProtrusionFromEdge;
- (double)volumeDropletHeight;
- (double)volumeDropletWidth;
- (double)volumeFlattenedCornerRadius;
- (double)volumeFlattenedDropletRadius;
- (double)volumeFlattenedProtrusionFromEdge;
- (double)volumeInitialCornerRadius;
- (double)volumeInitialDropletRadius;
- (double)volumeInitialProtrusionFromEdge;
- (double)volumePresentedCornerRadius;
- (double)volumePresentedDropletRadius;
- (double)volumePresentedProtrusionFromEdge;
- (void)setAllButtonKeylineWidth:(double)a3;
- (void)setCameraCaptureDropletHeight:(double)a3;
- (void)setCameraCaptureDropletWidth:(double)a3;
- (void)setCameraCaptureFlattenedCornerRadius:(double)a3;
- (void)setCameraCaptureFlattenedDropletRadius:(double)a3;
- (void)setCameraCaptureFlattenedProtrusionFromEdge:(double)a3;
- (void)setCameraCaptureInitialCornerRadius:(double)a3;
- (void)setCameraCaptureInitialDropletRadius:(double)a3;
- (void)setCameraCaptureInitialProtrusionFromEdge:(double)a3;
- (void)setCameraCapturePresentedCornerRadius:(double)a3;
- (void)setCameraCapturePresentedDropletRadius:(double)a3;
- (void)setCameraCapturePresentedProtrusionFromEdge:(double)a3;
- (void)setCenterXBehaviorSettings:(id)a3;
- (void)setCenterYBehaviorSettings:(id)a3;
- (void)setContainerHeightBehaviorSettings:(id)a3;
- (void)setContainerWidthBehaviorSettings:(id)a3;
- (void)setDefaultValues;
- (void)setIntelligentEdgeLightKeylineStyleBehaviorSettings:(id)a3;
- (void)setLockDropletHeight:(double)a3;
- (void)setLockDropletWidth:(double)a3;
- (void)setLockFlattenedCornerRadius:(double)a3;
- (void)setLockFlattenedDropletRadius:(double)a3;
- (void)setLockFlattenedProtrusionFromEdge:(double)a3;
- (void)setLockInitialCornerRadius:(double)a3;
- (void)setLockInitialDropletRadius:(double)a3;
- (void)setLockInitialProtrusionFromEdge:(double)a3;
- (void)setLockPresentedCornerRadius:(double)a3;
- (void)setLockPresentedDropletRadius:(double)a3;
- (void)setLockPresentedProtrusionFromEdge:(double)a3;
- (void)setStaccatoDropletHeight:(double)a3;
- (void)setStaccatoDropletWidth:(double)a3;
- (void)setStaccatoFlattenedCornerRadius:(double)a3;
- (void)setStaccatoFlattenedDropletRadius:(double)a3;
- (void)setStaccatoFlattenedProtrusionFromEdge:(double)a3;
- (void)setStaccatoInitialCornerRadius:(double)a3;
- (void)setStaccatoInitialDropletRadius:(double)a3;
- (void)setStaccatoInitialProtrusionFromEdge:(double)a3;
- (void)setStaccatoPresentedCornerRadius:(double)a3;
- (void)setStaccatoPresentedDropletRadius:(double)a3;
- (void)setStaccatoPresentedProtrusionFromEdge:(double)a3;
- (void)setVolumeDropletHeight:(double)a3;
- (void)setVolumeDropletWidth:(double)a3;
- (void)setVolumeFlattenedCornerRadius:(double)a3;
- (void)setVolumeFlattenedDropletRadius:(double)a3;
- (void)setVolumeFlattenedProtrusionFromEdge:(double)a3;
- (void)setVolumeInitialCornerRadius:(double)a3;
- (void)setVolumeInitialDropletRadius:(double)a3;
- (void)setVolumeInitialProtrusionFromEdge:(double)a3;
- (void)setVolumePresentedCornerRadius:(double)a3;
- (void)setVolumePresentedDropletRadius:(double)a3;
- (void)setVolumePresentedProtrusionFromEdge:(double)a3;
@end

@implementation SBHardwareButtonHintPrototypeSettings

- (void)setDefaultValues
{
  self->_lockDropletHeight = 140.0;
  self->_lockDropletWidth = 50.0;
  self->_lockInitialProtrusionFromEdge = 0.0;
  self->_lockFlattenedProtrusionFromEdge = 5.0;
  self->_lockPresentedProtrusionFromEdge = 5.0;
  self->_lockInitialCornerRadius = 21.0;
  self->_lockFlattenedCornerRadius = 21.0;
  self->_lockPresentedCornerRadius = 21.0;
  self->_lockInitialDropletRadius = 8.0;
  self->_lockFlattenedDropletRadius = 8.0;
  self->_lockPresentedDropletRadius = 8.0;
  self->_volumeDropletHeight = 100.0;
  self->_volumeDropletWidth = 50.0;
  self->_volumeInitialProtrusionFromEdge = 0.0;
  self->_volumeFlattenedProtrusionFromEdge = 5.0;
  self->_volumePresentedProtrusionFromEdge = 5.0;
  self->_volumeInitialCornerRadius = 21.0;
  self->_volumeFlattenedCornerRadius = 21.0;
  self->_volumePresentedCornerRadius = 21.0;
  self->_volumeInitialDropletRadius = 8.0;
  self->_volumeFlattenedDropletRadius = 8.0;
  self->_volumePresentedDropletRadius = 8.0;
  self->_staccatoDropletHeight = 80.0;
  self->_staccatoDropletWidth = 50.0;
  self->_staccatoInitialProtrusionFromEdge = 0.0;
  self->_staccatoFlattenedProtrusionFromEdge = 5.0;
  self->_staccatoPresentedProtrusionFromEdge = 5.0;
  self->_staccatoInitialCornerRadius = 21.0;
  self->_staccatoFlattenedCornerRadius = 21.0;
  self->_staccatoPresentedCornerRadius = 21.0;
  self->_staccatoInitialDropletRadius = 6.0;
  self->_staccatoFlattenedDropletRadius = 6.0;
  self->_staccatoPresentedDropletRadius = 6.0;
  self->_cameraCaptureDropletHeight = 137.0;
  self->_cameraCaptureDropletWidth = 50.0;
  self->_cameraCaptureInitialProtrusionFromEdge = 0.0;
  self->_cameraCaptureFlattenedProtrusionFromEdge = 5.0;
  self->_cameraCapturePresentedProtrusionFromEdge = 5.0;
  self->_cameraCaptureInitialCornerRadius = 21.0;
  self->_cameraCaptureFlattenedCornerRadius = 21.0;
  self->_cameraCapturePresentedCornerRadius = 21.0;
  self->_cameraCaptureInitialDropletRadius = 8.0;
  self->_cameraCaptureFlattenedDropletRadius = 8.0;
  self->_cameraCapturePresentedDropletRadius = 8.0;
  self->_allButtonKeylineWidth = 1.5;
  [(SBFFluidBehaviorSettings *)self->_centerXBehaviorSettings _setDefaultButtonHintGeometryFastValues];
  [(SBFFluidBehaviorSettings *)self->_centerXBehaviorSettings setName:@"centerX"];
  [(SBFFluidBehaviorSettings *)self->_centerYBehaviorSettings _setDefaultButtonHintGeometryFastValues];
  [(SBFFluidBehaviorSettings *)self->_centerYBehaviorSettings setName:@"centerY"];
  [(SBFFluidBehaviorSettings *)self->_containerWidthBehaviorSettings _setDefaultButtonHintGeometryFastValues];
  [(SBFFluidBehaviorSettings *)self->_containerWidthBehaviorSettings setName:@"containerWidth"];
  [(SBFFluidBehaviorSettings *)self->_containerHeightBehaviorSettings _setDefaultButtonHintGeometryFastValues];
  [(SBFFluidBehaviorSettings *)self->_containerHeightBehaviorSettings setName:@"containerHeight"];
  [(SBFFluidBehaviorSettings *)self->_intelligentEdgeLightKeylineStyleBehaviorSettings setDefaultValues];
  [(SBFFluidBehaviorSettings *)self->_intelligentEdgeLightKeylineStyleBehaviorSettings setDampingRatio:1.0];
  [(SBFFluidBehaviorSettings *)self->_intelligentEdgeLightKeylineStyleBehaviorSettings setResponse:0.2];
  [(SBFFluidBehaviorSettings *)self->_intelligentEdgeLightKeylineStyleBehaviorSettings setBehaviorType:1];
  intelligentEdgeLightKeylineStyleBehaviorSettings = self->_intelligentEdgeLightKeylineStyleBehaviorSettings;
  CAFrameRateRange v6 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](intelligentEdgeLightKeylineStyleBehaviorSettings, "setFrameRateRange:highFrameRateReason:", 1114149, *(double *)&v6.minimum, *(double *)&v6.maximum, *(double *)&v6.preferred);
  v4 = self->_intelligentEdgeLightKeylineStyleBehaviorSettings;
  [(SBFFluidBehaviorSettings *)v4 setName:@"intelligentEdgeLightHardKeylineStyle"];
}

+ (id)settingsControllerModule
{
  v74[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94168];
  v3 = (void *)MEMORY[0x1E4F94100];
  v4 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v5 = [v3 rowWithTitle:@"Restore Defaults" action:v4];
  v74[0] = v5;
  CAFrameRateRange v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:1];
  v68 = [v2 sectionWithRows:v6];

  v66 = (void *)MEMORY[0x1E4F94168];
  v63 = [MEMORY[0x1E4F94140] rowWithTitle:@"Droplet Height" valueKeyPath:@"lockDropletHeight"];
  v73[0] = v63;
  v59 = [MEMORY[0x1E4F94140] rowWithTitle:@"Droplet Width" valueKeyPath:@"lockDropletWidth"];
  v73[1] = v59;
  v56 = [MEMORY[0x1E4F94140] rowWithTitle:@"Initial Protrusion From Edge" valueKeyPath:@"lockInitialProtrusionFromEdge"];
  v73[2] = v56;
  v7 = [MEMORY[0x1E4F94140] rowWithTitle:@"Flattened Protrusion From Edge" valueKeyPath:@"lockFlattenedProtrusionFromEdge"];
  v73[3] = v7;
  v8 = [MEMORY[0x1E4F94140] rowWithTitle:@"Presented Protrusion From Edge" valueKeyPath:@"lockPresentedProtrusionFromEdge"];
  v73[4] = v8;
  v9 = [MEMORY[0x1E4F94140] rowWithTitle:@"Initial Corner Radius" valueKeyPath:@"lockInitialCornerRadius"];
  v73[5] = v9;
  v10 = [MEMORY[0x1E4F94140] rowWithTitle:@"Flattened Corner Radius" valueKeyPath:@"lockFlattenedCornerRadius"];
  v73[6] = v10;
  v11 = [MEMORY[0x1E4F94140] rowWithTitle:@"Presented Corner Radius" valueKeyPath:@"lockPresentedCornerRadius"];
  v73[7] = v11;
  v12 = [MEMORY[0x1E4F94140] rowWithTitle:@"Initial Droplet Radius" valueKeyPath:@"lockInitialDropletRadius"];
  v73[8] = v12;
  v13 = [MEMORY[0x1E4F94140] rowWithTitle:@"Flattened Droplet Radius" valueKeyPath:@"lockFlattenedDropletRadius"];
  v73[9] = v13;
  v14 = [MEMORY[0x1E4F94140] rowWithTitle:@"Presented Droplet Radius" valueKeyPath:@"lockPresentedDropletRadius"];
  v73[10] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:11];
  v67 = [v66 sectionWithRows:v15 title:@"Lock Button"];

  v64 = (void *)MEMORY[0x1E4F94168];
  v60 = [MEMORY[0x1E4F94140] rowWithTitle:@"Droplet Height" valueKeyPath:@"volumeDropletHeight"];
  v72[0] = v60;
  v57 = [MEMORY[0x1E4F94140] rowWithTitle:@"Droplet Width" valueKeyPath:@"volumeDropletWidth"];
  v72[1] = v57;
  v54 = [MEMORY[0x1E4F94140] rowWithTitle:@"Initial Protrusion From Edge" valueKeyPath:@"volumeInitialProtrusionFromEdge"];
  v72[2] = v54;
  v16 = [MEMORY[0x1E4F94140] rowWithTitle:@"Flattened Protrusion From Edge" valueKeyPath:@"volumeFlattenedProtrusionFromEdge"];
  v72[3] = v16;
  v17 = [MEMORY[0x1E4F94140] rowWithTitle:@"Presented Protrusion From Edge" valueKeyPath:@"volumePresentedProtrusionFromEdge"];
  v72[4] = v17;
  v18 = [MEMORY[0x1E4F94140] rowWithTitle:@"Initial Corner Radius" valueKeyPath:@"volumeInitialCornerRadius"];
  v72[5] = v18;
  v19 = [MEMORY[0x1E4F94140] rowWithTitle:@"Flattened Corner Radius" valueKeyPath:@"volumeFlattenedCornerRadius"];
  v72[6] = v19;
  v20 = [MEMORY[0x1E4F94140] rowWithTitle:@"Presented Corner Radius" valueKeyPath:@"volumePresentedCornerRadius"];
  v72[7] = v20;
  v21 = [MEMORY[0x1E4F94140] rowWithTitle:@"Initial Droplet Radius" valueKeyPath:@"volumeInitialDropletRadius"];
  v72[8] = v21;
  v22 = [MEMORY[0x1E4F94140] rowWithTitle:@"Flattened Droplet Radius" valueKeyPath:@"volumeFlattenedDropletRadius"];
  v72[9] = v22;
  v23 = [MEMORY[0x1E4F94140] rowWithTitle:@"Presented Droplet Radius" valueKeyPath:@"volumePresentedDropletRadius"];
  v72[10] = v23;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:11];
  v65 = [v64 sectionWithRows:v24 title:@"Volume Button"];

  v61 = (void *)MEMORY[0x1E4F94168];
  v58 = [MEMORY[0x1E4F94140] rowWithTitle:@"Droplet Height" valueKeyPath:@"staccatoDropletHeight"];
  v71[0] = v58;
  v55 = [MEMORY[0x1E4F94140] rowWithTitle:@"Droplet Width" valueKeyPath:@"staccatoDropletWidth"];
  v71[1] = v55;
  v53 = [MEMORY[0x1E4F94140] rowWithTitle:@"Initial Protrusion From Edge" valueKeyPath:@"staccatoInitialProtrusionFromEdge"];
  v71[2] = v53;
  v25 = [MEMORY[0x1E4F94140] rowWithTitle:@"Flattened Protrusion From Edge" valueKeyPath:@"staccatoFlattenedProtrusionFromEdge"];
  v71[3] = v25;
  v26 = [MEMORY[0x1E4F94140] rowWithTitle:@"Presented Protrusion From Edge" valueKeyPath:@"staccatoPresentedProtrusionFromEdge"];
  v71[4] = v26;
  v27 = [MEMORY[0x1E4F94140] rowWithTitle:@"Initial Corner Radius" valueKeyPath:@"staccatoInitialCornerRadius"];
  v71[5] = v27;
  v28 = [MEMORY[0x1E4F94140] rowWithTitle:@"Flattened Corner Radius" valueKeyPath:@"staccatoFlattenedCornerRadius"];
  v71[6] = v28;
  v29 = [MEMORY[0x1E4F94140] rowWithTitle:@"Presented Corner Radius" valueKeyPath:@"staccatoPresentedCornerRadius"];
  v71[7] = v29;
  v30 = [MEMORY[0x1E4F94140] rowWithTitle:@"Initial Droplet Radius" valueKeyPath:@"staccatoInitialDropletRadius"];
  v71[8] = v30;
  v31 = [MEMORY[0x1E4F94140] rowWithTitle:@"Flattened Droplet Radius" valueKeyPath:@"staccatoFlattenedDropletRadius"];
  v71[9] = v31;
  v32 = [MEMORY[0x1E4F94140] rowWithTitle:@"Presented Droplet Radius" valueKeyPath:@"staccatoPresentedDropletRadius"];
  v71[10] = v32;
  v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:11];
  v62 = [v61 sectionWithRows:v33 title:@"Staccato Button"];

  v34 = (void *)MEMORY[0x1E4F94168];
  v35 = [MEMORY[0x1E4F94140] rowWithTitle:@"Keyline Width" valueKeyPath:@"allButtonKeylineWidth"];
  v70[0] = v35;
  v36 = [MEMORY[0x1E4F94138] rowWithTitle:@"Center X Behavior Settings" childSettingsKeyPath:@"centerXBehaviorSettings"];
  v70[1] = v36;
  v37 = [MEMORY[0x1E4F94138] rowWithTitle:@"Center Y Behavior Settings" childSettingsKeyPath:@"centerYBehaviorSettings"];
  v70[2] = v37;
  v38 = [MEMORY[0x1E4F94138] rowWithTitle:@"Container Width Behavior Settings" childSettingsKeyPath:@"containerWidthBehaviorSettings"];
  v70[3] = v38;
  v39 = [MEMORY[0x1E4F94138] rowWithTitle:@"Container Height Behavior Settings" childSettingsKeyPath:@"containerHeightBehaviorSettings"];
  v70[4] = v39;
  v40 = [MEMORY[0x1E4F94138] rowWithTitle:@"Intelligent Edge Light Keyline Style Behavior Settings" childSettingsKeyPath:@"intelligentEdgeLightKeylineStyleBehaviorSettings"];
  v70[5] = v40;
  v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:6];
  v42 = [v34 sectionWithRows:v41 title:@"Settings for All Buttons"];

  v43 = [MEMORY[0x1E4F1CA48] array];
  int v44 = 20;
  do
  {
    v45 = (void *)MEMORY[0x1E4F94100];
    v46 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
    v47 = [v45 rowWithTitle:@"Restore Defaults" action:v46];
    [v43 addObject:v47];

    --v44;
  }
  while (v44);
  v48 = [MEMORY[0x1E4F94168] sectionWithRows:v43 title:@"Workaround Keyboard Bug"];
  v49 = (void *)MEMORY[0x1E4F94168];
  v69[0] = v68;
  v69[1] = v67;
  v69[2] = v65;
  v69[3] = v62;
  v69[4] = v42;
  v69[5] = v48;
  v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:6];
  v51 = [v49 moduleWithTitle:@"Hardware Button Hint" contents:v50];

  return v51;
}

- (double)lockDropletHeight
{
  return self->_lockDropletHeight;
}

- (void)setLockDropletHeight:(double)a3
{
  self->_lockDropletHeight = a3;
}

- (double)lockDropletWidth
{
  return self->_lockDropletWidth;
}

- (void)setLockDropletWidth:(double)a3
{
  self->_lockDropletWidth = a3;
}

- (double)lockInitialProtrusionFromEdge
{
  return self->_lockInitialProtrusionFromEdge;
}

- (void)setLockInitialProtrusionFromEdge:(double)a3
{
  self->_lockInitialProtrusionFromEdge = a3;
}

- (double)lockFlattenedProtrusionFromEdge
{
  return self->_lockFlattenedProtrusionFromEdge;
}

- (void)setLockFlattenedProtrusionFromEdge:(double)a3
{
  self->_lockFlattenedProtrusionFromEdge = a3;
}

- (double)lockPresentedProtrusionFromEdge
{
  return self->_lockPresentedProtrusionFromEdge;
}

- (void)setLockPresentedProtrusionFromEdge:(double)a3
{
  self->_lockPresentedProtrusionFromEdge = a3;
}

- (double)lockInitialCornerRadius
{
  return self->_lockInitialCornerRadius;
}

- (void)setLockInitialCornerRadius:(double)a3
{
  self->_lockInitialCornerRadius = a3;
}

- (double)lockFlattenedCornerRadius
{
  return self->_lockFlattenedCornerRadius;
}

- (void)setLockFlattenedCornerRadius:(double)a3
{
  self->_lockFlattenedCornerRadius = a3;
}

- (double)lockPresentedCornerRadius
{
  return self->_lockPresentedCornerRadius;
}

- (void)setLockPresentedCornerRadius:(double)a3
{
  self->_lockPresentedCornerRadius = a3;
}

- (double)lockInitialDropletRadius
{
  return self->_lockInitialDropletRadius;
}

- (void)setLockInitialDropletRadius:(double)a3
{
  self->_lockInitialDropletRadius = a3;
}

- (double)lockFlattenedDropletRadius
{
  return self->_lockFlattenedDropletRadius;
}

- (void)setLockFlattenedDropletRadius:(double)a3
{
  self->_lockFlattenedDropletRadius = a3;
}

- (double)lockPresentedDropletRadius
{
  return self->_lockPresentedDropletRadius;
}

- (void)setLockPresentedDropletRadius:(double)a3
{
  self->_lockPresentedDropletRadius = a3;
}

- (double)volumeDropletHeight
{
  return self->_volumeDropletHeight;
}

- (void)setVolumeDropletHeight:(double)a3
{
  self->_volumeDropletHeight = a3;
}

- (double)volumeDropletWidth
{
  return self->_volumeDropletWidth;
}

- (void)setVolumeDropletWidth:(double)a3
{
  self->_volumeDropletWidth = a3;
}

- (double)volumeInitialProtrusionFromEdge
{
  return self->_volumeInitialProtrusionFromEdge;
}

- (void)setVolumeInitialProtrusionFromEdge:(double)a3
{
  self->_volumeInitialProtrusionFromEdge = a3;
}

- (double)volumeFlattenedProtrusionFromEdge
{
  return self->_volumeFlattenedProtrusionFromEdge;
}

- (void)setVolumeFlattenedProtrusionFromEdge:(double)a3
{
  self->_volumeFlattenedProtrusionFromEdge = a3;
}

- (double)volumePresentedProtrusionFromEdge
{
  return self->_volumePresentedProtrusionFromEdge;
}

- (void)setVolumePresentedProtrusionFromEdge:(double)a3
{
  self->_volumePresentedProtrusionFromEdge = a3;
}

- (double)volumeInitialCornerRadius
{
  return self->_volumeInitialCornerRadius;
}

- (void)setVolumeInitialCornerRadius:(double)a3
{
  self->_volumeInitialCornerRadius = a3;
}

- (double)volumeFlattenedCornerRadius
{
  return self->_volumeFlattenedCornerRadius;
}

- (void)setVolumeFlattenedCornerRadius:(double)a3
{
  self->_volumeFlattenedCornerRadius = a3;
}

- (double)volumePresentedCornerRadius
{
  return self->_volumePresentedCornerRadius;
}

- (void)setVolumePresentedCornerRadius:(double)a3
{
  self->_volumePresentedCornerRadius = a3;
}

- (double)volumeInitialDropletRadius
{
  return self->_volumeInitialDropletRadius;
}

- (void)setVolumeInitialDropletRadius:(double)a3
{
  self->_volumeInitialDropletRadius = a3;
}

- (double)volumeFlattenedDropletRadius
{
  return self->_volumeFlattenedDropletRadius;
}

- (void)setVolumeFlattenedDropletRadius:(double)a3
{
  self->_volumeFlattenedDropletRadius = a3;
}

- (double)volumePresentedDropletRadius
{
  return self->_volumePresentedDropletRadius;
}

- (void)setVolumePresentedDropletRadius:(double)a3
{
  self->_volumePresentedDropletRadius = a3;
}

- (double)staccatoDropletHeight
{
  return self->_staccatoDropletHeight;
}

- (void)setStaccatoDropletHeight:(double)a3
{
  self->_staccatoDropletHeight = a3;
}

- (double)staccatoDropletWidth
{
  return self->_staccatoDropletWidth;
}

- (void)setStaccatoDropletWidth:(double)a3
{
  self->_staccatoDropletWidth = a3;
}

- (double)staccatoInitialProtrusionFromEdge
{
  return self->_staccatoInitialProtrusionFromEdge;
}

- (void)setStaccatoInitialProtrusionFromEdge:(double)a3
{
  self->_staccatoInitialProtrusionFromEdge = a3;
}

- (double)staccatoFlattenedProtrusionFromEdge
{
  return self->_staccatoFlattenedProtrusionFromEdge;
}

- (void)setStaccatoFlattenedProtrusionFromEdge:(double)a3
{
  self->_staccatoFlattenedProtrusionFromEdge = a3;
}

- (double)staccatoPresentedProtrusionFromEdge
{
  return self->_staccatoPresentedProtrusionFromEdge;
}

- (void)setStaccatoPresentedProtrusionFromEdge:(double)a3
{
  self->_staccatoPresentedProtrusionFromEdge = a3;
}

- (double)staccatoInitialCornerRadius
{
  return self->_staccatoInitialCornerRadius;
}

- (void)setStaccatoInitialCornerRadius:(double)a3
{
  self->_staccatoInitialCornerRadius = a3;
}

- (double)staccatoFlattenedCornerRadius
{
  return self->_staccatoFlattenedCornerRadius;
}

- (void)setStaccatoFlattenedCornerRadius:(double)a3
{
  self->_staccatoFlattenedCornerRadius = a3;
}

- (double)staccatoPresentedCornerRadius
{
  return self->_staccatoPresentedCornerRadius;
}

- (void)setStaccatoPresentedCornerRadius:(double)a3
{
  self->_staccatoPresentedCornerRadius = a3;
}

- (double)staccatoInitialDropletRadius
{
  return self->_staccatoInitialDropletRadius;
}

- (void)setStaccatoInitialDropletRadius:(double)a3
{
  self->_staccatoInitialDropletRadius = a3;
}

- (double)staccatoFlattenedDropletRadius
{
  return self->_staccatoFlattenedDropletRadius;
}

- (void)setStaccatoFlattenedDropletRadius:(double)a3
{
  self->_staccatoFlattenedDropletRadius = a3;
}

- (double)staccatoPresentedDropletRadius
{
  return self->_staccatoPresentedDropletRadius;
}

- (void)setStaccatoPresentedDropletRadius:(double)a3
{
  self->_staccatoPresentedDropletRadius = a3;
}

- (double)cameraCaptureDropletHeight
{
  return self->_cameraCaptureDropletHeight;
}

- (void)setCameraCaptureDropletHeight:(double)a3
{
  self->_cameraCaptureDropletHeight = a3;
}

- (double)cameraCaptureDropletWidth
{
  return self->_cameraCaptureDropletWidth;
}

- (void)setCameraCaptureDropletWidth:(double)a3
{
  self->_cameraCaptureDropletWidth = a3;
}

- (double)cameraCaptureInitialProtrusionFromEdge
{
  return self->_cameraCaptureInitialProtrusionFromEdge;
}

- (void)setCameraCaptureInitialProtrusionFromEdge:(double)a3
{
  self->_cameraCaptureInitialProtrusionFromEdge = a3;
}

- (double)cameraCaptureFlattenedProtrusionFromEdge
{
  return self->_cameraCaptureFlattenedProtrusionFromEdge;
}

- (void)setCameraCaptureFlattenedProtrusionFromEdge:(double)a3
{
  self->_cameraCaptureFlattenedProtrusionFromEdge = a3;
}

- (double)cameraCapturePresentedProtrusionFromEdge
{
  return self->_cameraCapturePresentedProtrusionFromEdge;
}

- (void)setCameraCapturePresentedProtrusionFromEdge:(double)a3
{
  self->_cameraCapturePresentedProtrusionFromEdge = a3;
}

- (double)cameraCaptureInitialCornerRadius
{
  return self->_cameraCaptureInitialCornerRadius;
}

- (void)setCameraCaptureInitialCornerRadius:(double)a3
{
  self->_cameraCaptureInitialCornerRadius = a3;
}

- (double)cameraCaptureFlattenedCornerRadius
{
  return self->_cameraCaptureFlattenedCornerRadius;
}

- (void)setCameraCaptureFlattenedCornerRadius:(double)a3
{
  self->_cameraCaptureFlattenedCornerRadius = a3;
}

- (double)cameraCapturePresentedCornerRadius
{
  return self->_cameraCapturePresentedCornerRadius;
}

- (void)setCameraCapturePresentedCornerRadius:(double)a3
{
  self->_cameraCapturePresentedCornerRadius = a3;
}

- (double)cameraCaptureInitialDropletRadius
{
  return self->_cameraCaptureInitialDropletRadius;
}

- (void)setCameraCaptureInitialDropletRadius:(double)a3
{
  self->_cameraCaptureInitialDropletRadius = a3;
}

- (double)cameraCaptureFlattenedDropletRadius
{
  return self->_cameraCaptureFlattenedDropletRadius;
}

- (void)setCameraCaptureFlattenedDropletRadius:(double)a3
{
  self->_cameraCaptureFlattenedDropletRadius = a3;
}

- (double)cameraCapturePresentedDropletRadius
{
  return self->_cameraCapturePresentedDropletRadius;
}

- (void)setCameraCapturePresentedDropletRadius:(double)a3
{
  self->_cameraCapturePresentedDropletRadius = a3;
}

- (double)allButtonKeylineWidth
{
  return self->_allButtonKeylineWidth;
}

- (void)setAllButtonKeylineWidth:(double)a3
{
  self->_allButtonKeylineWidth = a3;
}

- (SBFFluidBehaviorSettings)centerXBehaviorSettings
{
  return self->_centerXBehaviorSettings;
}

- (void)setCenterXBehaviorSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)centerYBehaviorSettings
{
  return self->_centerYBehaviorSettings;
}

- (void)setCenterYBehaviorSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)containerWidthBehaviorSettings
{
  return self->_containerWidthBehaviorSettings;
}

- (void)setContainerWidthBehaviorSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)containerHeightBehaviorSettings
{
  return self->_containerHeightBehaviorSettings;
}

- (void)setContainerHeightBehaviorSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)intelligentEdgeLightKeylineStyleBehaviorSettings
{
  return self->_intelligentEdgeLightKeylineStyleBehaviorSettings;
}

- (void)setIntelligentEdgeLightKeylineStyleBehaviorSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intelligentEdgeLightKeylineStyleBehaviorSettings, 0);
  objc_storeStrong((id *)&self->_containerHeightBehaviorSettings, 0);
  objc_storeStrong((id *)&self->_containerWidthBehaviorSettings, 0);
  objc_storeStrong((id *)&self->_centerYBehaviorSettings, 0);
  objc_storeStrong((id *)&self->_centerXBehaviorSettings, 0);
}

@end