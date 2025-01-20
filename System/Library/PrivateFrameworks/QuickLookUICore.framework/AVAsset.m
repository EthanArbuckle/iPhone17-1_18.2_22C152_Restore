@interface AVAsset
@end

@implementation AVAsset

void __64__AVAsset__QLUtilities__assetIsAutoloopMedia_completionHandler___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F16558];
  v3 = [*(id *)(a1 + 32) metadataForFormat:*MEMORY[0x1E4F15D20]];
  v4 = [v2 metadataItemsFromArray:v3 withKey:@"LOOP" keySpace:*MEMORY[0x1E4F15E00]];

  if ([v4 count])
  {
    int v8 = 0;
    v5 = [v4 objectAtIndexedSubscript:0];
    v6 = [v5 dataValue];
    v7 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v8 length:4];
    [v6 isEqualToData:v7];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end