@interface PXAppleMusicCueProvider
- (id)requestCuesForAudioAsset:(id)a3 resultHandler:(id)a4;
@end

@implementation PXAppleMusicCueProvider

- (id)requestCuesForAudioAsset:(id)a3 resultHandler:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void (**)(id, void *, void))a4;
  uint64_t v7 = [v5 catalog];
  if (v7 == 3)
  {
    v9 = [v5 originalAsset];
    v8 = [v9 cueSource];
  }
  else
  {
    if (v7 == 2)
    {
      v8 = [v5 cueSource];
      goto LABEL_9;
    }
    v8 = 0;
  }
  v10 = PLAudioPlaybackGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    int v12 = 138412290;
    id v13 = v5;
    _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_ERROR, "Unable to provide audio cues for asset %@ because it does not respond to -cueSource as expected.", (uint8_t *)&v12, 0xCu);
  }

LABEL_9:
  v6[2](v6, v8, 0);

  return 0;
}

@end