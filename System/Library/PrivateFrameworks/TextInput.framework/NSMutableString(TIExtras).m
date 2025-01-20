@interface NSMutableString(TIExtras)
- (void)_removeCharactersFromSet:()TIExtras;
- (void)_removeOccurrencesOfCharacter:()TIExtras;
- (void)_replaceOccurrencesOfCharacter:()TIExtras withCharacter:;
@end

@implementation NSMutableString(TIExtras)

- (void)_removeCharactersFromSet:()TIExtras
{
  if (a3)
  {
    v4 = result;
    result = objc_msgSend(result, "rangeOfCharacterFromSet:options:range:", a3, 2, 0, objc_msgSend(result, "length"));
    if (result != (void *)0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = result;
      do
      {
        objc_msgSend(v4, "deleteCharactersInRange:", v6, v5);
        result = objc_msgSend(v4, "rangeOfCharacterFromSet:options:range:", a3, 2, v6, objc_msgSend(v4, "length") - (void)v6);
        v6 = result;
      }
      while (result != (void *)0x7FFFFFFFFFFFFFFFLL);
    }
  }
  return result;
}

- (void)_removeOccurrencesOfCharacter:()TIExtras
{
  objc_msgSend(NSString, "_stringWithUnichar:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", v2, &stru_1EDBDCE38, 2, 0, objc_msgSend(a1, "length"));
}

- (void)_replaceOccurrencesOfCharacter:()TIExtras withCharacter:
{
  objc_msgSend(NSString, "_stringWithUnichar:");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = [NSString _stringWithUnichar:a4];
  objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", v7, v6, 2, 0, objc_msgSend(a1, "length"));
}

@end