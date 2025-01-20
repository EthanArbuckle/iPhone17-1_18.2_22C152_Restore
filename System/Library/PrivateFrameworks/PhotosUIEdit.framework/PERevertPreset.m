@interface PERevertPreset
- (BOOL)forceRunAsUnadjustedAsset;
- (int64_t)actionType;
- (void)applyToLoadResult:(id)a3 completion:(id)a4;
@end

@implementation PERevertPreset

- (BOOL)forceRunAsUnadjustedAsset
{
  return 1;
}

- (void)applyToLoadResult:(id)a3 completion:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  v7 = [v5 contentEditingInput];
  if (v7)
  {
    id v36 = 0;
    v8 = +[PESerializationUtility editSourceForContentEditingInput:v7 useEmbeddedPreview:0 error:&v36];
    id v9 = v36;
    if (v8)
    {
      v10 = [v5 compositionController];
      id v35 = 0;
      v11 = +[PESerializationUtility compositionControllerForContentEditingInput:v7 asShot:1 source:v8 error:&v35];
      id v12 = v35;
      v13 = v12;
      if (v11)
      {
        id v32 = v12;
        id v33 = v9;
        uint64_t v14 = [v5 adjustedSourceCompositionController];
        v15 = (void *)v14;
        if (v14) {
          v16 = (void *)v14;
        }
        else {
          v16 = v10;
        }
        id v34 = v16;

        v17 = [v5 imageURL];
        if (v17)
        {
          id v18 = objc_alloc(MEMORY[0x263F5DF20]);
          v19 = [v5 imageURL];
          v20 = (void *)[v18 initWithMediaURL:v19 timeZoneLookup:0];
        }
        else
        {
          v20 = 0;
        }

        v24 = [v7 livePhoto];
        v25 = +[PESupport repairedAsShotCompositionController:v11 forCurrentCompositionController:v34 isLivePhoto:v24 != 0 metadata:v20];

        [v10 applyChangesFromCompositionController:v25];
        if ([MEMORY[0x263F5D8D0] isIdentityCompositionController:v10]) {
          goto LABEL_20;
        }
        uint64_t v27 = [v10 slomoAdjustmentController];
        if (!v27) {
          goto LABEL_23;
        }
        v28 = (void *)v27;
        v29 = [v10 slomoAdjustmentController];
        [v29 rate];
        double v31 = v30;

        if (v31 != 1.0) {
LABEL_20:
        }
          uint64_t v26 = 2;
        else {
LABEL_23:
        }
          uint64_t v26 = 1;
        v6[2](v6, v26);

        v13 = v32;
        id v9 = v33;
      }
      else
      {
        v23 = PLPhotoEditGetLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v38 = v13;
          _os_log_impl(&dword_217B65000, v23, OS_LOG_TYPE_ERROR, "PERevertPreset failed to deserialize the as-shot adjustment data: %@", buf, 0xCu);
        }

        v6[2](v6, 0);
      }
    }
    else
    {
      v22 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v38 = v9;
        _os_log_impl(&dword_217B65000, v22, OS_LOG_TYPE_ERROR, "PERevertPreset could not retrieve edit source from the contentEditingInput: %@", buf, 0xCu);
      }

      v6[2](v6, 0);
    }
  }
  else
  {
    v21 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217B65000, v21, OS_LOG_TYPE_ERROR, "PERevertPreset failed to find contentEditingInput", buf, 2u);
    }

    v6[2](v6, 0);
  }
}

- (int64_t)actionType
{
  return 4;
}

@end