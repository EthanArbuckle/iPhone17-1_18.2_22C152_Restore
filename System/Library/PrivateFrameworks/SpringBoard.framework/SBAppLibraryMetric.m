@interface SBAppLibraryMetric
- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4;
- (SBAppLibraryMetric)init;
@end

@implementation SBAppLibraryMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = v6;
  if (a3 == 53)
  {
    if (+[SBFloatingDockController isFloatingDockSupported])
    {
      v9 = [v7 eventPayload];
      v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4FA74D0]];
      uint64_t v11 = [v10 unsignedIntegerValue];

      modalLibraryPresentedTracker = self->_modalLibraryPresentedTracker;
      v13 = [NSNumber numberWithUnsignedInteger:v11];
      v17[0] = v13;
      BOOL v8 = 1;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
      [(PETScalarEventTracker *)modalLibraryPresentedTracker trackEventWithPropertyValues:v14];

      goto LABEL_7;
    }
LABEL_6:
    BOOL v8 = 0;
    goto LABEL_7;
  }
  if (a3 != 11) {
    goto LABEL_6;
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __46__SBAppLibraryMetric_handleEvent_withContext___block_invoke;
  v16[3] = &unk_1E6AF9508;
  v16[4] = self;
  [v6 stateForQueryName:3 completion:v16];
  BOOL v8 = 1;
LABEL_7:

  return v8;
}

- (SBAppLibraryMetric)init
{
  v37[2] = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)SBAppLibraryMetric;
  v2 = [(SBAppLibraryMetric *)&v28 init];
  if (v2)
  {
    v3 = PETEventPropertyForLayoutLocations(@"newAppDownloadLocation");
    v4 = (void *)MEMORY[0x1E4F93720];
    uint64_t v5 = MEMORY[0x1E4F1CC38];
    uint64_t v6 = MEMORY[0x1E4F1CC28];
    v36[0] = MEMORY[0x1E4F1CC38];
    v36[1] = MEMORY[0x1E4F1CC28];
    v37[0] = @"Y";
    v37[1] = @"N";
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
    BOOL v8 = [v4 propertyWithName:@"haveEverHiddenAPage" enumMapping:v7];

    id v9 = objc_alloc(MEMORY[0x1E4F93738]);
    v35[0] = v3;
    v35[1] = v8;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
    uint64_t v11 = [v9 initWithFeatureId:@"SpringBoard" event:@"AppDownloadsSettings" registerProperties:v10];
    appDownloadSettingsTracker = v2->_appDownloadSettingsTracker;
    v2->_appDownloadSettingsTracker = (PETScalarEventTracker *)v11;

    if (+[SBFloatingDockController isFloatingDockSupported])
    {
      v13 = (void *)MEMORY[0x1E4F93720];
      v33[0] = v5;
      v33[1] = v6;
      v34[0] = @"Y";
      v34[1] = @"N";
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
      v15 = [v13 propertyWithName:@"isLibraryPodIconInDockHidden" enumMapping:v14];

      id v16 = objc_alloc(MEMORY[0x1E4F93738]);
      v32 = v15;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
      uint64_t v18 = [v16 initWithFeatureId:@"SpringBoard" event:@"LibraryDockSettings" registerProperties:v17];
      libraryDockSettingsTracker = v2->_libraryDockSettingsTracker;
      v2->_libraryDockSettingsTracker = (PETScalarEventTracker *)v18;

      v20 = (void *)MEMORY[0x1E4F93720];
      v30[0] = &unk_1F334B168;
      v30[1] = &unk_1F334B180;
      v31[0] = @"HomeDock";
      v31[1] = @"AppDock";
      v30[2] = &unk_1F334B198;
      v31[2] = @"HomeSwipe";
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:3];
      v22 = [v20 propertyWithName:@"libraryPresentationSource" enumMapping:v21];

      id v23 = objc_alloc(MEMORY[0x1E4F93738]);
      v29 = v22;
      v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
      uint64_t v25 = [v23 initWithFeatureId:@"SpringBoard" event:@"ModalLibraryPresented" registerProperties:v24];
      modalLibraryPresentedTracker = v2->_modalLibraryPresentedTracker;
      v2->_modalLibraryPresentedTracker = (PETScalarEventTracker *)v25;
    }
  }
  return v2;
}

void __46__SBAppLibraryMetric_handleEvent_withContext___block_invoke(uint64_t a1, void *a2)
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4FA75E8]];
  uint64_t v5 = PETStringValueForIconLocation(v4);

  uint64_t v6 = SBAnalyticsLayoutLocationFromString((uint64_t)v5);
  v7 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4FA75E0]];
  BOOL v8 = v7 != 0;

  id v9 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4FA7520]];
  uint64_t v10 = [v9 BOOLValue];

  uint64_t v11 = *(void **)(*(void *)(a1 + 32) + 8);
  v12 = [NSNumber numberWithInteger:v6];
  v21[0] = v12;
  v13 = [NSNumber numberWithBool:v10];
  v21[1] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  [v11 trackEventWithPropertyValues:v14 value:v8];

  if (+[SBFloatingDockController isFloatingDockSupported])
  {
    v15 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4FA7578]];
    uint64_t v16 = [v15 BOOLValue];

    v17 = *(void **)(*(void *)(a1 + 32) + 16);
    uint64_t v18 = [NSNumber numberWithBool:v16];
    v20 = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    [v17 trackEventWithPropertyValues:v19];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modalLibraryPresentedTracker, 0);
  objc_storeStrong((id *)&self->_libraryDockSettingsTracker, 0);
  objc_storeStrong((id *)&self->_appDownloadSettingsTracker, 0);
}

@end