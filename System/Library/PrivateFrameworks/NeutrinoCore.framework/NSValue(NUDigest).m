@interface NSValue(NUDigest)
- (void)nu_updateDigest:()NUDigest;
@end

@implementation NSValue(NUDigest)

- (void)nu_updateDigest:()NUDigest
{
  sizep[1] = *MEMORY[0x1E4F143B8];
  sizep[0] = 0;
  id v4 = a1;
  id v5 = a3;
  v6 = (const char *)[v4 objCType];
  NSGetSizeAndAlignment(v6, sizep, 0);
  v7 = (char *)sizep - ((sizep[0] + 15) & 0xFFFFFFFFFFFFFFF0);
  [v4 getValue:v7];
  [v5 addCString:v6];
  [v5 addCString:":"];
  [v5 addBytes:v7 length:sizep[0]];
}

@end