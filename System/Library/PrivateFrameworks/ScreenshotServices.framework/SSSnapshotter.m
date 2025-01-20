@interface SSSnapshotter
- (SSSnapshotter)init;
- (id)_captureScreen:(id)a3 withScreenshotOptions:(id)a4;
- (id)_screensThatAreCaptureableDidFindOnenessScreens:(BOOL *)a3;
- (id)captureAvailableSnapshotsWithOptionsCollection:(id)a3 didFindOnenessScreens:(BOOL *)a4;
@end

@implementation SSSnapshotter

- (SSSnapshotter)init
{
  v9.receiver = self;
  v9.super_class = (Class)SSSnapshotter;
  v2 = [(SSSnapshotter *)&v9 init];
  if (v2 && CarKitLibraryCore())
  {
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x2050000000;
    v3 = (void *)getCARSessionStatusClass_softClass;
    uint64_t v18 = getCARSessionStatusClass_softClass;
    if (!getCARSessionStatusClass_softClass)
    {
      uint64_t v10 = MEMORY[0x263EF8330];
      uint64_t v11 = 3221225472;
      v12 = __getCARSessionStatusClass_block_invoke;
      v13 = &unk_2644ED6B8;
      v14 = &v15;
      CarKitLibraryCore();
      Class Class = objc_getClass("CARSessionStatus");
      *(void *)(v14[1] + 24) = Class;
      getCARSessionStatusClass_softClass Class = *(void *)(v14[1] + 24);
      v3 = (void *)v16[3];
    }
    v5 = v3;
    _Block_object_dispose(&v15, 8);
    uint64_t v6 = [[v5 alloc] initWithOptions:0];
    carSessionStatus = v2->_carSessionStatus;
    v2->_carSessionStatus = (CARSessionStatus *)v6;
  }
  return v2;
}

- (id)captureAvailableSnapshotsWithOptionsCollection:(id)a3 didFindOnenessScreens:(BOOL *)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v19 = [MEMORY[0x263EFF980] array];
  [(SSSnapshotter *)self _screensThatAreCaptureableDidFindOnenessScreens:a4];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v7 = long long v23 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v13 = [v6 screenshotOptionsForScreen:v12];
        v14 = [(SSSnapshotter *)self _captureScreen:v12 withScreenshotOptions:v13];

        uint64_t v15 = [v14 image];

        if (v15)
        {
          v16 = [v14 image];
          uint64_t v17 = +[SSScreenSnapshot snapshotWithImage:v16 fromScreen:v12];

          [v19 addObject:v17];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  return v19;
}

- (id)_screensThatAreCaptureableDidFindOnenessScreens:(BOOL *)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  v5 = (void *)MEMORY[0x263EFF980];
  id v6 = [MEMORY[0x263F1C920] mainScreen];
  v7 = [v5 arrayWithObject:v6];

  uint64_t v8 = (void *)MEMORY[0x263EFF9C0];
  uint64_t v9 = [MEMORY[0x263F1C920] mainScreen];
  uint64_t v10 = [v9 displayConfiguration];
  uint64_t v11 = [v10 identity];
  uint64_t v12 = [v11 rootIdentity];
  v13 = [v8 setWithObject:v12];

  v14 = [(CARSessionStatus *)self->_carSessionStatus currentSession];
  LOBYTE(self) = v14 != 0;

  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __65__SSSnapshotter__screensThatAreCaptureableDidFindOnenessScreens___block_invoke_2;
  v44[3] = &unk_2644EDC98;
  id v47 = &__block_literal_global_5;
  char v48 = (char)self;
  id v15 = v7;
  id v45 = v15;
  id v35 = v13;
  id v46 = v35;
  v16 = (uint64_t (**)(void, void))MEMORY[0x223C399D0](v44);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v17 = [MEMORY[0x263F1C408] sharedApplication];
  uint64_t v18 = [v17 connectedScenes];

  uint64_t v19 = [v18 countByEnumeratingWithState:&v40 objects:v50 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v41 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v24 = [v23 screen];
          uint64_t v25 = ((uint64_t (**)(void, void *))v16)[2](v16, v24);
          if (a3 && !*a3) {
            *a3 = __65__SSSnapshotter__screensThatAreCaptureableDidFindOnenessScreens___block_invoke(v25, v24);
          }
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v40 objects:v50 count:16];
    }
    while (v20);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v26 = [MEMORY[0x263F1C920] screens];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v36 objects:v49 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v37 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = *(void **)(*((void *)&v36 + 1) + 8 * j);
        uint64_t v32 = ((uint64_t (**)(void, void *))v16)[2](v16, v31);
        if (a3 && !*a3) {
          *a3 = __65__SSSnapshotter__screensThatAreCaptureableDidFindOnenessScreens___block_invoke(v32, v31);
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v36 objects:v49 count:16];
    }
    while (v28);
  }

  id v33 = v15;
  return v33;
}

uint64_t __65__SSSnapshotter__screensThatAreCaptureableDidFindOnenessScreens___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 displayConfiguration];
  v3 = [v2 identity];
  uint64_t v4 = [v3 isContinuityDisplay];

  return v4;
}

void __65__SSSnapshotter__screensThatAreCaptureableDidFindOnenessScreens___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 displayConfiguration];
  v5 = [v4 identity];

  unsigned __int8 v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  BOOL v7 = (([v5 isCarDisplay] & 1) != 0 || objc_msgSend(v5, "isCarInstrumentsDisplay"))
    && *(unsigned char *)(a1 + 56) == 0;
  if (([*(id *)(a1 + 32) containsObject:v3] & 1) == 0)
  {
    uint64_t v8 = [v3 mirroredScreen];
    if (v8
      || (uint64_t v9 = *(void **)(a1 + 40),
          [v5 rootIdentity],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          ([v9 containsObject:v8] & 1) != 0))
    {
    }
    else
    {

      if (((v6 | v7) & 1) == 0)
      {
        [*(id *)(a1 + 32) addObject:v3];
        uint64_t v11 = *(void **)(a1 + 40);
        uint64_t v12 = [v5 rootIdentity];
        [v11 addObject:v12];

        goto LABEL_13;
      }
    }
  }
  if (v7)
  {
    uint64_t v10 = os_log_create("com.apple.screenshotservices", "Capture");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v13 = 138543362;
      id v14 = v3;
      _os_log_impl(&dword_21ECED000, v10, OS_LOG_TYPE_INFO, "Ignoring defunct car screen %{public}@", (uint8_t *)&v13, 0xCu);
    }
  }
LABEL_13:
}

- (id)_captureScreen:(id)a3 withScreenshotOptions:(id)a4
{
  id v5 = a4;
  unsigned __int8 v6 = +[SSScreenSnapshotter snapshotterForScreen:a3];
  BOOL v7 = [v5 preparedImage];

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    id v8 = [v6 takeScreenshot];
  }
  uint64_t v9 = v8;

  uint64_t v10 = objc_opt_new();
  [v10 setImage:v9];
  if (v9) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = @"Unknown";
  }
  [v10 setFailureReasonIfImageIsNil:v11];

  return v10;
}

- (void).cxx_destruct
{
}

@end