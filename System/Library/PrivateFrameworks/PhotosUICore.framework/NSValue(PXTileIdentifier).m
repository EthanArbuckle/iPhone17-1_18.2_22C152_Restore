@interface NSValue(PXTileIdentifier)
+ (id)valueWithPXTileIdentifier:()PXTileIdentifier;
- (uint64_t)PXTileIdentifierValue;
@end

@implementation NSValue(PXTileIdentifier)

- (uint64_t)PXTileIdentifierValue
{
  *(void *)(x8_0 + 80) = 0;
  *(_OWORD *)(x8_0 + 48) = 0u;
  *(_OWORD *)(x8_0 + 64) = 0u;
  *(_OWORD *)(x8_0 + 16) = 0u;
  *(_OWORD *)(x8_0 + 32) = 0u;
  *(_OWORD *)x8_0 = 0u;
  return [a1 getValue:x8_0];
}

+ (id)valueWithPXTileIdentifier:()PXTileIdentifier
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F29238]) initWithBytes:a3 objCType:"{PXTileIdentifier=Q[10Q]}"];
  return v3;
}

@end