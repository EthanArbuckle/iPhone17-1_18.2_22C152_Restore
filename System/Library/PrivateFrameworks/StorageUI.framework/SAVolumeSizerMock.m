@interface SAVolumeSizerMock
+ (void)computeSizeOfVolumeAtURL:(id)a3 completionHandler:(id)a4;
@end

@implementation SAVolumeSizerMock

+ (void)computeSizeOfVolumeAtURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  NSLog(&cfstr_SavolumesizerC.isa, v5);
  v7 = dispatch_get_global_queue(17, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__SAVolumeSizerMock_computeSizeOfVolumeAtURL_completionHandler___block_invoke;
  block[3] = &unk_265528FF8;
  id v11 = v5;
  id v12 = v6;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, block);
}

void __64__SAVolumeSizerMock_computeSizeOfVolumeAtURL_completionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void *)(a1 + 32);
  id v4 = [NSNumber numberWithUnsignedLong:844000000000];
  v3 = [NSNumber numberWithUnsignedLong:200000000000];
  NSLog(&cfstr_SavolumesizerC_0.isa, v2, v4, v3);
}

@end