@interface POXSStringDefinition
+ (void)initialize;
- (id)_stringSuitableForHTML:(id)a3;
- (id)valueFromString:(id)a3;
@end

@implementation POXSStringDefinition

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = objc_opt_new();
    v3 = (void *)sCharactersToConvert;
    sCharactersToConvert = v2;

    objc_msgSend((id)sCharactersToConvert, "addCharactersInRange:", 9, 1);
    objc_msgSend((id)sCharactersToConvert, "addCharactersInRange:", 10, 1);
    objc_msgSend((id)sCharactersToConvert, "addCharactersInRange:", 13, 1);
    objc_msgSend((id)sCharactersToConvert, "addCharactersInRange:", 32, 55264);
    objc_msgSend((id)sCharactersToConvert, "addCharactersInRange:", 57344, 8190);
    objc_msgSend((id)sCharactersToConvert, "addCharactersInRange:", 0x10000, 0x100000);
    [(id)sCharactersToConvert invert];
    v4 = (void *)sCharactersToConvert;
    [v4 addCharactersInString:@"&<>"];
  }
}

- (id)valueFromString:(id)a3
{
  id v3 = a3;
  return v3;
}

- (id)_stringSuitableForHTML:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 length];
  uint64_t v5 = objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", sCharactersToConvert, 0, 0, v4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = (__CFString *)v3;
    goto LABEL_17;
  }
  uint64_t v8 = v5;
  uint64_t v9 = v6;
  v10 = (UniChar *)malloc_type_malloc(2 * v4 + 2, 0x1000040BDFB0063uLL);
  [v3 getCharacters:v10];
  v7 = [MEMORY[0x263F089D8] string];
  if (v4)
  {
    uint64_t v11 = 0;
    while (1)
    {
      CFStringAppendCharacters(v7, &v10[v11], v8 - v11);
      int v12 = [v3 characterAtIndex:v8];
      if (v12 == 38) {
        break;
      }
      if (v12 == 62)
      {
        v13 = @"&gt;";
        goto LABEL_11;
      }
      if (v12 == 60)
      {
        v13 = @"&lt;";
LABEL_11:
        [(__CFString *)v7 appendString:v13];
      }
      uint64_t v11 = v9 + v8;
      CFIndex v14 = v4 - (v9 + v8);
      uint64_t v15 = objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", sCharactersToConvert, 0, v9 + v8, v14);
      if (!v14) {
        goto LABEL_15;
      }
      uint64_t v8 = v15;
      uint64_t v9 = v16;
      if (v15 == 0x7FFFFFFFFFFFFFFFLL)
      {
        CFStringAppendCharacters(v7, &v10[v11], v14);
        goto LABEL_15;
      }
    }
    v13 = @"&amp;";
    goto LABEL_11;
  }
LABEL_15:
  if (v10) {
    free(v10);
  }
LABEL_17:

  return v7;
}

@end