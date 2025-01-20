@interface MRResolveAndRequestPlaybackQueue
@end

@implementation MRResolveAndRequestPlaybackQueue

void ___MRResolveAndRequestPlaybackQueue_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 isResolved])
  {
    v7 = +[MRNowPlayingOriginClientManager sharedManager];
    v8 = [v7 playerClientRequestsForPlayerPath:v5];

    v9 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = ___MRResolveAndRequestPlaybackQueue_block_invoke_2;
    v11[3] = &unk_1E57D57F0;
    id v12 = v5;
    id v13 = *(id *)(a1 + 40);
    _MRRequestPlaybackQueue(v9, v8, v11);
  }
  else
  {
    if (v6) {
      Error = 0;
    }
    else {
      Error = (void *)MRMediaRemoteNowPlayingPlayerPathCreateError(v5);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void ___MRResolveAndRequestPlaybackQueue_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v7 setResolvedPlayerPath:v5];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end