@interface NSValue(ActionIdentifier)
- (uint64_t)re_actionIdentifierHashValue;
@end

@implementation NSValue(ActionIdentifier)

- (uint64_t)re_actionIdentifierHashValue
{
  sizep[1] = *MEMORY[0x263EF8340];
  sizep[0] = 0;
  id v1 = a1;
  NSGetSizeAndAlignment((const char *)[v1 objCType], sizep, 0);
  v2 = (char *)sizep - ((sizep[0] + 15) & 0xFFFFFFFFFFFFFFF0);
  NSUInteger v3 = sizep[0];
  bzero(v2, sizep[0]);
  [v1 getValue:v2 size:v3];
  return REHashDataUInt64((uint64_t)v2, sizep[0]);
}

@end