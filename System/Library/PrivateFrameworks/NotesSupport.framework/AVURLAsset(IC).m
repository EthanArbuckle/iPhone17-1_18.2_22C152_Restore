@interface AVURLAsset(IC)
+ (id)ic_safeURLAssetWithURL:()IC;
- (Float64)ic_durationInSeconds;
@end

@implementation AVURLAsset(IC)

- (Float64)ic_durationInSeconds
{
  [a1 duration];
  return CMTimeGetSeconds(&time);
}

+ (id)ic_safeURLAssetWithURL:()IC
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v8 = *MEMORY[0x263EFA2A8];
  v9[0] = &unk_26C144BE0;
  v3 = NSDictionary;
  id v4 = a3;
  v5 = [v3 dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v6 = [MEMORY[0x263EFA8D0] URLAssetWithURL:v4 options:v5];

  return v6;
}

@end