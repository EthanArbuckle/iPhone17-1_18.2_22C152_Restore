@interface PEAudioMixModeAction
- (NSString)audioMixMode;
- (int64_t)actionType;
- (void)applyToLoadResult:(id)a3 completion:(id)a4;
- (void)setAudioMixMode:(id)a3;
@end

@implementation PEAudioMixModeAction

- (void).cxx_destruct
{
}

- (void)setAudioMixMode:(id)a3
{
}

- (NSString)audioMixMode
{
  return self->_audioMixMode;
}

- (int64_t)actionType
{
  return 8;
}

- (void)applyToLoadResult:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  v8 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v6 asset];
    v10 = [v9 uuid];
    *(_DWORD *)buf = 138543362;
    v23 = v10;
    _os_log_impl(&dword_217B65000, v8, OS_LOG_TYPE_DEFAULT, "PEAudioMixModeAction: applyToLoadResult on asset: %{public}@", buf, 0xCu);
  }
  v11 = [v6 compositionController];
  v12 = [v6 contentEditingInput];
  v13 = [v12 audiovisualAsset];

  if ([MEMORY[0x263F586C0] assetIsCinematicAudio:v13])
  {
    char v14 = [MEMORY[0x263F5D558] assetIsCinematicVideo:v13];
    v15 = [(PEAudioMixModeAction *)self audioMixMode];
    int v16 = [v15 isEqualToString:*MEMORY[0x263F5D6C8]];
    uint64_t v17 = *MEMORY[0x263F5D6B8];
    if (!v16 || (v14 & 1) != 0)
    {
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __53__PEAudioMixModeAction_applyToLoadResult_completion___block_invoke;
      v21[3] = &unk_2642BEBE8;
      v21[4] = self;
      [v11 modifyAdjustmentWithKey:v17 modificationBlock:v21];
    }
    else
    {
      [v11 removeAdjustmentWithKey:v17];
    }
    v7[2](v7, 1);
  }
  else
  {
    v18 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = [v6 asset];
      v20 = [v19 uuid];
      *(_DWORD *)buf = 138543362;
      v23 = v20;
      _os_log_impl(&dword_217B65000, v18, OS_LOG_TYPE_ERROR, "PEAudioMixModeAction: audio mix modes not supported on asset: %{public}@", buf, 0xCu);
    }
    v7[2](v7, 0);
  }
}

void __53__PEAudioMixModeAction_applyToLoadResult_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setEnabled:1];
  v3 = [*(id *)(a1 + 32) audioMixMode];
  [v4 setRenderingStyle:v3];

  [v4 setDialogMixBias:1.0];
}

@end