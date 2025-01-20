@interface AVPlayerItem(PhotosPlayer)
- (BOOL)is_isHighFramerate;
- (void)is_enableColorMatching;
- (void)is_setAudioTracksEnabled:()PhotosPlayer;
@end

@implementation AVPlayerItem(PhotosPlayer)

- (void)is_setAudioTracksEnabled:()PhotosPlayer
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v4 = objc_msgSend(a1, "tracks", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    uint64_t v8 = *MEMORY[0x1E4F15BA8];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = [v10 assetTrack];
        v12 = [v11 mediaType];
        int v13 = [v12 isEqualToString:v8];

        if (v13)
        {
          if (a3) {
            uint64_t v14 = [v11 isEnabled];
          }
          else {
            uint64_t v14 = 0;
          }
          [v10 setEnabled:v14];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

- (void)is_enableColorMatching
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v1 = objc_msgSend(a1, "tracks", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * v5++) setDisableColorMatching:0];
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (BOOL)is_isHighFramerate
{
  v1 = [a1 asset];
  uint64_t v2 = [MEMORY[0x1E4F8CC38] tracksWithMediaType:*MEMORY[0x1E4F15C18] forAsset:v1];
  uint64_t v3 = [v2 firstObject];

  [v3 nominalFrameRate];
  BOOL v5 = v4 >= 30.0;

  return v5;
}

@end