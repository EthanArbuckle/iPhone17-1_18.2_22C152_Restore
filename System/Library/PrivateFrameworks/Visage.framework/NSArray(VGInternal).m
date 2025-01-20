@interface NSArray(VGInternal)
+ (id)vg_arrayWithNumbersFromVectorf:()VGInternal;
@end

@implementation NSArray(VGInternal)

+ (id)vg_arrayWithNumbersFromVectorf:()VGInternal
{
  v5 = [MEMORY[0x263EFF980] arrayWithCapacity:*(unsigned int *)(a3 + 16)];
  uint64_t v7 = *(unsigned int *)(a3 + 16);
  if (v7)
  {
    v8 = *(_DWORD **)a3;
    uint64_t v9 = 4 * v7;
    do
    {
      LODWORD(v6) = *v8;
      v10 = [NSNumber numberWithFloat:v6];
      [v5 addObject:v10];

      ++v8;
      v9 -= 4;
    }
    while (v9);
  }
  v11 = [a1 arrayWithArray:v5];

  return v11;
}

@end