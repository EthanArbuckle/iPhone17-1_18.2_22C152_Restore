@interface NSRegularExpression(SafariCoreExtras)
+ (id)safari_escapedPatternForString:()SafariCoreExtras charactersToEscape:;
@end

@implementation NSRegularExpression(SafariCoreExtras)

+ (id)safari_escapedPatternForString:()SafariCoreExtras charactersToEscape:
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length] && objc_msgSend(v6, "length"))
  {
    v7 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:v6];
    uint64_t v8 = [v5 rangeOfCharacterFromSet:v7];
    if (v9)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v9;
      id v12 = (id)[v5 mutableCopy];
      do
      {
        [v12 insertString:@"\\"" atIndex:v10];
        uint64_t v13 = v10 + v11;
        if (v13 + 1 >= (unint64_t)[v12 length]) {
          break;
        }
        uint64_t v10 = objc_msgSend(v12, "rangeOfCharacterFromSet:options:range:", v7, 0, v13 + 1, objc_msgSend(v12, "length") + ~v13);
        uint64_t v11 = v14;
      }
      while (v14);
    }
    else
    {
      id v12 = v5;
    }
  }
  else
  {
    id v12 = v5;
  }

  return v12;
}

@end