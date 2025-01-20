@interface PLVideoPlaybackResourceChoiceOptimizer
- (NSArray)preferredVideoResources;
- (PLVideoPlaybackResourceChoiceOptimizer)initWithVideoResources:(id)a3;
@end

@implementation PLVideoPlaybackResourceChoiceOptimizer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playableVideos, 0);
  objc_storeStrong((id *)&self->_videoResources, 0);
}

- (NSArray)preferredVideoResources
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  playableVideos = self->_playableVideos;
  if (!playableVideos)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v4 = self->_videoResources;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v24 != v7) {
            objc_enumerationMutation(v4);
          }
          if (!self->_masterVideoIsPresent)
          {
            v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            if ([v9 hasAssociatedMediaMetadata])
            {
              self->_masterVideoIsPresent = 1;
              self->_masterVideoIsPlayable = [v9 isPlayable];
            }
          }
        }
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v6);
    }

    v10 = [(NSArray *)self->_videoResources firstObject];
    char v11 = [(id)objc_opt_class() deviceSupportsHDR];

    BOOL v12 = [(NSArray *)self->_videoResources indexOfObjectPassingTest:&__block_literal_global_63327] != 0x7FFFFFFFFFFFFFFFLL;
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    videoResources = self->_videoResources;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __65__PLVideoPlaybackResourceChoiceOptimizer_preferredVideoResources__block_invoke_2;
    v19[3] = &unk_1E586C9E0;
    char v21 = v11;
    BOOL v22 = v12;
    v19[4] = self;
    v15 = (NSArray *)v13;
    v20 = v15;
    [(NSArray *)videoResources enumerateObjectsUsingBlock:v19];
    v16 = self->_playableVideos;
    self->_playableVideos = v15;
    v17 = v15;

    playableVideos = self->_playableVideos;
  }
  return playableVideos;
}

void __65__PLVideoPlaybackResourceChoiceOptimizer_preferredVideoResources__block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  int v3 = [v6 isHDRDerivative];
  int v4 = [v6 isSDRFallback];
  int v5 = [v6 isHDROrSDRDependingOnMasterVideo];
  if (v3)
  {
    if (!*(unsigned char *)(a1 + 48)) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (v4)
  {
    if (!*(unsigned char *)(a1 + 48) || !*(unsigned char *)(a1 + 49)) {
      goto LABEL_10;
    }
  }
  else
  {
    if (v5)
    {
      if (!*(unsigned char *)(*(void *)(a1 + 32) + 25)) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if ([v6 isPlayable]) {
LABEL_10:
    }
      [*(id *)(a1 + 40) addObject:v6];
  }
LABEL_11:
}

uint64_t __65__PLVideoPlaybackResourceChoiceOptimizer_preferredVideoResources__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isHDRDerivative];
}

- (PLVideoPlaybackResourceChoiceOptimizer)initWithVideoResources:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLVideoPlaybackResourceChoiceOptimizer;
  id v6 = [(PLVideoPlaybackResourceChoiceOptimizer *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_videoResources, a3);
  }

  return v7;
}

@end