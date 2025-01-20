@interface MRSetNowPlayingInfo
@end

@implementation MRSetNowPlayingInfo

void ___MRSetNowPlayingInfo_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = ___MRSetNowPlayingInfo_block_invoke_2;
  v7[3] = &unk_1E57D0DB8;
  v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t ___MRSetNowPlayingInfo_block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

@end