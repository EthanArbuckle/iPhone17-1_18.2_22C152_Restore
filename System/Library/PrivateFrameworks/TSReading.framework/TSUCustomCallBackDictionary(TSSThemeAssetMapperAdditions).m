@interface TSUCustomCallBackDictionary(TSSThemeAssetMapperAdditions)
- (uint64_t)initForThemeAssetMapperWithCapacity:()TSSThemeAssetMapperAdditions;
@end

@implementation TSUCustomCallBackDictionary(TSSThemeAssetMapperAdditions)

- (uint64_t)initForThemeAssetMapperWithCapacity:()TSSThemeAssetMapperAdditions
{
  v6[0] = *MEMORY[0x263EFFF88];
  v6[1] = 0;
  uint64_t v3 = *(void *)(MEMORY[0x263EFFF88] + 24);
  v6[2] = 0;
  v6[3] = v3;
  uint64_t v4 = *(void *)(MEMORY[0x263EFFF88] + 40);
  v6[4] = String;
  v6[5] = v4;
  return [a1 initWithCapacity:a3 keyCallBacks:v6 valueCallBacks:MEMORY[0x263EFFF90]];
}

@end