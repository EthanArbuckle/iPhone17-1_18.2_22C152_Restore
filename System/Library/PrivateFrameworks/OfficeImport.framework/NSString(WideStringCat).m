@interface NSString(WideStringCat)
- (uint64_t)cWideString;
@end

@implementation NSString(WideStringCat)

- (uint64_t)cWideString
{
  unint64_t v2 = [a1 length];
  if (v2 >= 0x7FFFFFFFFFFFFFFFLL) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF570] format:@"Error allocating temporary string"];
  }
  v3 = [MEMORY[0x263EFF990] dataWithLength:2 * v2 + 2];
  if (!v3) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF570] format:@"Error allocating temporary string"];
  }
  id v4 = v3;
  uint64_t v5 = [v4 mutableBytes];
  if (v2)
  {
    for (uint64_t i = 0; i != v2; ++i)
      *(_WORD *)(v5 + 2 * i) = [a1 characterAtIndex:i];
  }
  *(_WORD *)(v5 + 2 * v2) = 0;
  id v7 = v4;
  uint64_t v8 = [v7 bytes];

  return v8;
}

@end