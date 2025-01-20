@interface NSValue(PXMemoryFontsSpecIdentifier)
+ (uint64_t)px_valueWithMemoryFontsSpecIdentifier:()PXMemoryFontsSpecIdentifier;
- (uint64_t)px_memoryFontsSpecIdentifierValue;
@end

@implementation NSValue(PXMemoryFontsSpecIdentifier)

- (uint64_t)px_memoryFontsSpecIdentifierValue
{
  *(void *)(x8_0 + 48) = 0;
  *(_OWORD *)(x8_0 + 16) = 0u;
  *(_OWORD *)(x8_0 + 32) = 0u;
  *(_OWORD *)x8_0 = 0u;
  return [a1 getValue:x8_0];
}

+ (uint64_t)px_valueWithMemoryFontsSpecIdentifier:()PXMemoryFontsSpecIdentifier
{
  return [MEMORY[0x1E4F29238] valueWithBytes:a3 objCType:"{PXMemoryFontsSpecIdentifier=qqq{CGSize=dd}dB}"];
}

@end