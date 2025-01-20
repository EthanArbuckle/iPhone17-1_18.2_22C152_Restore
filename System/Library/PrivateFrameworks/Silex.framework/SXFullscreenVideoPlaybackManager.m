@interface SXFullscreenVideoPlaybackManager
- (SXFullscreenVideoPlaybackManager)init;
- (uint64_t)addCandidate:(uint64_t)result;
- (uint64_t)didLayoutForSize:(uint64_t)result;
- (uint64_t)didTransitionToSize:(uint64_t)result;
- (uint64_t)enterFullscreenIfNeeded;
- (uint64_t)removeCandidate:(uint64_t)result;
- (uint64_t)willLayoutAndTransitionToSize:(uint64_t)result;
@end

@implementation SXFullscreenVideoPlaybackManager

- (SXFullscreenVideoPlaybackManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)SXFullscreenVideoPlaybackManager;
  v2 = [(SXFullscreenVideoPlaybackManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F088B0] hashTableWithOptions:5];
    candidates = v2->_candidates;
    v2->_candidates = (NSHashTable *)v3;
  }
  return v2;
}

- (uint64_t)addCandidate:(uint64_t)result
{
  if (result) {
    return [*(id *)(result + 16) addObject:a2];
  }
  return result;
}

- (uint64_t)removeCandidate:(uint64_t)result
{
  if (result) {
    return [*(id *)(result + 16) removeObject:a2];
  }
  return result;
}

- (uint64_t)enterFullscreenIfNeeded
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (result)
  {
    uint64_t v1 = result;
    memset(v4, 0, sizeof(v4));
    id v2 = *(id *)(result + 16);
    if ([v2 countByEnumeratingWithState:v4 objects:v5 count:16])
    {
      uint64_t v3 = (void *)**((void **)&v4[0] + 1);
      if (objc_msgSend(**((id **)&v4[0] + 1), "canEnterFullscreen", *(void *)&v4[0])) {
        [v3 enterFullscreen];
      }
    }

    return [*(id *)(v1 + 16) removeAllObjects];
  }
  return result;
}

- (uint64_t)willLayoutAndTransitionToSize:(uint64_t)result
{
  if (result) {
    *(_WORD *)(result + 8) = 257;
  }
  return result;
}

- (uint64_t)didTransitionToSize:(uint64_t)result
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 8))
    {
      if (!*(unsigned char *)(result + 9)) {
        result = -[SXFullscreenVideoPlaybackManager enterFullscreenIfNeeded](result);
      }
    }
    *(unsigned char *)(v1 + 8) = 0;
  }
  return result;
}

- (uint64_t)didLayoutForSize:(uint64_t)result
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 9))
    {
      if (!*(unsigned char *)(result + 8)) {
        result = -[SXFullscreenVideoPlaybackManager enterFullscreenIfNeeded](result);
      }
    }
    *(unsigned char *)(v1 + 9) = 0;
  }
  return result;
}

- (void).cxx_destruct
{
}

@end