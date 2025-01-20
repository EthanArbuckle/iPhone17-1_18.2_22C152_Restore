@interface MRGetNowPlayingInfo
@end

@implementation MRGetNowPlayingInfo

void ___MRGetNowPlayingInfo_block_invoke_27(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) isResolved]
    && [*(id *)(a1 + 32) isSystemMediaApplication])
  {
    v4 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
      v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;

      v4 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    }
    [v4 setObject:MEMORY[0x1E4F1CC38] forKey:@"kMRMediaRemoteNowPlayingInfoIsMusicApp"];
  }
  if ([v3 isGroupLeader] && *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    v8 = [*(id *)(a1 + 32) client];
    v9 = v8;
    if (v8)
    {
      v10 = [v8 data];
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setObject:v10 forKey:@"kMRMediaRemoteNowPlayingInfoClientPropertiesData"];
    }
  }
  v11 = *(NSObject **)(a1 + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___MRGetNowPlayingInfo_block_invoke_2;
  block[3] = &unk_1E57D4CC0;
  id v12 = *(id *)(a1 + 56);
  uint64_t v13 = *(void *)(a1 + 64);
  id v16 = v12;
  uint64_t v17 = v13;
  id v15 = *(id *)(a1 + 48);
  dispatch_async(v11, block);
}

uint64_t ___MRGetNowPlayingInfo_block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], *(void *)(*(void *)(a1[6] + 8) + 40), a1[4]);
}

void ___MRGetNowPlayingInfo_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__20;
  v30 = __Block_byref_object_dispose__20;
  id v31 = 0;
  v4 = [v3 resolvedPlayerPath];
  if (v3)
  {
    id v5 = [v3 nowPlayingInfo];
    uint64_t v6 = v5;
    if (v5)
    {
      uint64_t v7 = [v5 mutableCopy];
      v8 = (void *)v27[5];
      v27[5] = v7;

      v9 = [v3 contentItemWithOffset:0];
      v10 = [v9 artwork];
      v11 = [v10 imageData];

      id v12 = [v9 metadata];
      uint64_t v13 = [v12 artworkMIMEType];

      if (v11) {
        v14 = (void *)MRNowPlayingArtworkCreateWithImageData((uint64_t)v11, (uint64_t)v13);
      }
      else {
        v14 = 0;
      }
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }
  id v15 = +[MRMediaRemoteServiceClient sharedServiceClient];
  id v16 = [v15 workerQueue];

  uint64_t v17 = +[MROrigin localOrigin];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = ___MRGetNowPlayingInfo_block_invoke_27;
  v20[3] = &unk_1E57D4CE8;
  id v18 = v4;
  id v21 = v18;
  v25 = &v26;
  id v22 = *(id *)(a1 + 32);
  id v24 = *(id *)(a1 + 40);
  id v19 = v14;
  id v23 = v19;
  +[MRDeviceInfoRequest deviceInfoForOrigin:v17 queue:v16 completion:v20];

  _Block_object_dispose(&v26, 8);
}

@end