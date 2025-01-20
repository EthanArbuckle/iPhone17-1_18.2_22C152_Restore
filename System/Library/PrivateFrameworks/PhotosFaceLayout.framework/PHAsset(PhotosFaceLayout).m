@interface PHAsset(PhotosFaceLayout)
- (id)pfl_modificationDate;
@end

@implementation PHAsset(PhotosFaceLayout)

- (id)pfl_modificationDate
{
  v2 = [a1 modificationDate];
  if (!v2)
  {
    v2 = [a1 creationDate];
    if (!v2)
    {
      v2 = [MEMORY[0x263EFF910] distantPast];
    }
  }
  return v2;
}

@end