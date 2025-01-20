@interface SBExternalDisplaySettings
+ (id)settingsControllerModule;
- (BOOL)fakeStorageForChamois97748869Enabling;
- (BOOL)fakeStorageForUnderpoweredDeviceSupport;
- (BOOL)fakeStorageForWirelessDisplaySupport;
- (PTOutlet)killSpringBoardOutlet;
- (SBExternalDisplayRuntimeAvailabilitySettings)availabilitySettings;
- (double)fakeStorageForContentsScale;
- (int64_t)activeDisplayTrackingMethodology;
- (void)setActiveDisplayTrackingMethodology:(int64_t)a3;
- (void)setAvailabilitySettings:(id)a3;
- (void)setDefaultValues;
- (void)setFakeStorageForChamois97748869Enabling:(BOOL)a3;
- (void)setFakeStorageForContentsScale:(double)a3;
- (void)setFakeStorageForUnderpoweredDeviceSupport:(BOOL)a3;
- (void)setFakeStorageForWirelessDisplaySupport:(BOOL)a3;
- (void)setKillSpringBoardOutlet:(id)a3;
@end

@implementation SBExternalDisplaySettings

- (int64_t)activeDisplayTrackingMethodology
{
  return self->_activeDisplayTrackingMethodology;
}

- (void)setDefaultValues
{
  v5.receiver = self;
  v5.super_class = (Class)SBExternalDisplaySettings;
  [(PTSettings *)&v5 setDefaultValues];
  [(SBExternalDisplayRuntimeAvailabilitySettings *)self->_availabilitySettings setDefaultValues];
  v3 = +[SBDefaults localDefaults];
  v4 = [v3 externalDisplayDefaults];

  -[SBExternalDisplaySettings setFakeStorageForWirelessDisplaySupport:](self, "setFakeStorageForWirelessDisplaySupport:", [v4 allowWirelessDisplaysForExtendedDisplayMode]);
  [v4 contentsScale];
  -[SBExternalDisplaySettings setFakeStorageForContentsScale:](self, "setFakeStorageForContentsScale:");
  [(SBExternalDisplaySettings *)self setActiveDisplayTrackingMethodology:1];
  -[SBExternalDisplaySettings setFakeStorageForUnderpoweredDeviceSupport:](self, "setFakeStorageForUnderpoweredDeviceSupport:", [v4 chamois]);
}

+ (id)settingsControllerModule
{
  v52[4] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  v37 = [MEMORY[0x1E4F1CA48] array];
  v3 = [MEMORY[0x1E4F94110] rowWithTitle:@"Active Display Tracking" valueKeyPath:@"activeDisplayTrackingMethodology"];
  v4 = [v3 possibleValues:&unk_1F3347988 titles:&unk_1F33479A0];
  [v37 addObject:v4];

  v35 = [MEMORY[0x1E4F94168] sectionWithRows:v37 title:0];
  v36 = +[SBExternalDisplayRuntimeAvailabilitySettings _moduleWithSectionTitle:@"Runtime Requirements (Deprecated)"];
  v34 = [MEMORY[0x1E4F94168] submoduleWithModule:v36 childSettingsKeyPath:@"availabilitySettings" condition:v2];
  objc_super v5 = +[SBDefaults localDefaults];
  v6 = [v5 externalDisplayDefaults];

  v7 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Enable Testing for rdar://97748869" valueKeyPath:@"fakeStorageForChamois97748869Enabling"];
  v8 = [v7 condition:v2];

  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __53__SBExternalDisplaySettings_settingsControllerModule__block_invoke;
  v48[3] = &unk_1E6AF99A0;
  id v9 = v6;
  id v49 = v9;
  [v8 setValueValidatator:v48];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __53__SBExternalDisplaySettings_settingsControllerModule__block_invoke_2;
  v46[3] = &unk_1E6AF99A0;
  id v10 = v9;
  id v47 = v10;
  [v8 setValueFormatter:v46];
  v11 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Allow Wireless Displays" valueKeyPath:@"fakeStorageForWirelessDisplaySupport"];
  v12 = [v11 condition:v2];

  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __53__SBExternalDisplaySettings_settingsControllerModule__block_invoke_3;
  v44[3] = &unk_1E6AF99A0;
  id v13 = v10;
  id v45 = v13;
  [v12 setValueValidatator:v44];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __53__SBExternalDisplaySettings_settingsControllerModule__block_invoke_4;
  v42[3] = &unk_1E6AF99A0;
  id v14 = v13;
  id v43 = v14;
  v32 = v12;
  [v12 setValueFormatter:v42];
  v15 = [MEMORY[0x1E4F94140] rowWithTitle:@"Override Display Scale" valueKeyPath:@"fakeStorageForContentsScale"];
  v16 = [v15 condition:v2];

  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __53__SBExternalDisplaySettings_settingsControllerModule__block_invoke_5;
  v40[3] = &unk_1E6AF99A0;
  id v17 = v14;
  id v41 = v17;
  [v16 setValueValidatator:v40];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __53__SBExternalDisplaySettings_settingsControllerModule__block_invoke_6;
  v38[3] = &unk_1E6AF99A0;
  id v39 = v17;
  id v33 = v17;
  [v16 setValueFormatter:v38];
  v18 = [MEMORY[0x1E4F94100] rowWithTitle:@"Kill SpringBoard to Traverse the Mist" outletKeyPath:@"killSpringBoardOutlet"];
  v19 = (void *)MEMORY[0x1E4F94168];
  v52[0] = v8;
  v52[1] = v12;
  v52[2] = v16;
  v52[3] = v18;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:4];
  v21 = [v19 sectionWithRows:v20 title:@"Devs Helping Devs (DO NOT FILE RADARS IF YOU CHANGE THESE)" condition:v2];

  v22 = (void *)MEMORY[0x1E4F94100];
  v23 = [MEMORY[0x1E4F94188] actionWithHandler:&__block_literal_global_44];
  v24 = [v22 rowWithTitle:@"Restore All Defaults" action:v23];

  v25 = (void *)MEMORY[0x1E4F94168];
  v51 = v24;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
  v27 = [v25 sectionWithRows:v26 title:@"Restore Defaults" condition:v2];

  v28 = (void *)MEMORY[0x1E4F94168];
  v50[0] = v35;
  v50[1] = v34;
  v50[2] = v21;
  v50[3] = v27;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:4];
  v30 = [v28 moduleWithTitle:@"Runtime Requirements" contents:v29];

  return v30;
}

id __53__SBExternalDisplaySettings_settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setChamois_97748869:", objc_msgSend(v3, "BOOLValue"));
  return v3;
}

uint64_t __53__SBExternalDisplaySettings_settingsControllerModule__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a3;
  uint64_t v5 = [v3 chamois];
  [v4 setFakeStorageForChamois97748869Enabling:v5];

  v6 = NSNumber;
  return [v6 numberWithBool:v5];
}

id __53__SBExternalDisplaySettings_settingsControllerModule__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setAllowWirelessDisplaysForExtendedDisplayMode:", objc_msgSend(v3, "BOOLValue"));
  return v3;
}

uint64_t __53__SBExternalDisplaySettings_settingsControllerModule__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a3;
  uint64_t v5 = [v3 allowWirelessDisplaysForExtendedDisplayMode];
  [v4 setFakeStorageForWirelessDisplaySupport:v5];

  v6 = NSNumber;
  return [v6 numberWithBool:v5];
}

id __53__SBExternalDisplaySettings_settingsControllerModule__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 floatValue];
  [*(id *)(a1 + 32) setContentsScale:v4];
  return v3;
}

uint64_t __53__SBExternalDisplaySettings_settingsControllerModule__block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a3;
  [v3 contentsScale];
  double v6 = v5;
  objc_msgSend(v4, "setFakeStorageForContentsScale:");

  v7 = NSNumber;
  return [v7 numberWithDouble:v6];
}

uint64_t __53__SBExternalDisplaySettings_settingsControllerModule__block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = +[SBDefaults localDefaults];
  double v5 = [v4 externalDisplayDefaults];
  [v5 resetPrototypeSettingAdjustableDefaults];

  double v6 = [v3 settings];

  [v6 setDefaultValues];
  return 1;
}

- (SBExternalDisplayRuntimeAvailabilitySettings)availabilitySettings
{
  return self->_availabilitySettings;
}

- (void)setAvailabilitySettings:(id)a3
{
}

- (void)setActiveDisplayTrackingMethodology:(int64_t)a3
{
  self->_activeDisplayTrackingMethodology = a3;
}

- (PTOutlet)killSpringBoardOutlet
{
  return self->_killSpringBoardOutlet;
}

- (void)setKillSpringBoardOutlet:(id)a3
{
}

- (double)fakeStorageForContentsScale
{
  return self->_fakeStorageForContentsScale;
}

- (void)setFakeStorageForContentsScale:(double)a3
{
  self->_fakeStorageForContentsScale = a3;
}

- (BOOL)fakeStorageForWirelessDisplaySupport
{
  return self->_fakeStorageForWirelessDisplaySupport;
}

- (void)setFakeStorageForWirelessDisplaySupport:(BOOL)a3
{
  self->_fakeStorageForWirelessDisplaySupport = a3;
}

- (BOOL)fakeStorageForUnderpoweredDeviceSupport
{
  return self->_fakeStorageForUnderpoweredDeviceSupport;
}

- (void)setFakeStorageForUnderpoweredDeviceSupport:(BOOL)a3
{
  self->_fakeStorageForUnderpoweredDeviceSupport = a3;
}

- (BOOL)fakeStorageForChamois97748869Enabling
{
  return self->_fakeStorageForChamois97748869Enabling;
}

- (void)setFakeStorageForChamois97748869Enabling:(BOOL)a3
{
  self->_fakeStorageForChamois97748869Enabling = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_killSpringBoardOutlet, 0);
  objc_storeStrong((id *)&self->_availabilitySettings, 0);
}

@end