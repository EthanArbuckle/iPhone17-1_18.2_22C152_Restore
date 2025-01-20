@interface NSString(TSUCustomNumberFormatAdditions)
+ (uint64_t)customNumberFormatDecimalTokenRepresentedStringWithDigits:()TSUCustomNumberFormatAdditions digitString:;
+ (uint64_t)customNumberFormatIntegerTokenRepresentedStringWithDigits:()TSUCustomNumberFormatAdditions separator:digitString:;
+ (uint64_t)customNumberFormatTokenStringOfType:()TSUCustomNumberFormatAdditions content:;
+ (void)customNumberFormatDecimalFormatStringWithDigits:()TSUCustomNumberFormatAdditions digitString:includeDecimalSeparator:;
+ (void)customNumberFormatDecimalTokenDisplayStringWithDigits:()TSUCustomNumberFormatAdditions digitString:;
+ (void)customNumberFormatIntegerFormatStringWithDigits:()TSUCustomNumberFormatAdditions digitString:;
+ (void)customNumberFormatIntegerTokenDisplayStringWithDigits:()TSUCustomNumberFormatAdditions separator:digitString:;
- (BOOL)customFormatIntegerTokenUsesSeparator;
- (BOOL)isSpecialCustomNumberFormatToken;
- (BOOL)isSpecialCustomNumberFormatTokenOfType:()TSUCustomNumberFormatAdditions;
- (__CFString)digitPlaceholderStringInDigitToken;
- (id)currencyCodeFromCustomNumberFormatCurrencyToken;
- (uint64_t)formatStringFromCustomNumberFormatScaleToken;
- (uint64_t)fractionAccuracyFromCustomNumberFormatFractionToken;
- (uint64_t)numberOfDigitsInCustomNumberFormatDecimalToken;
- (uint64_t)numberOfDigitsInCustomNumberFormatIntegerToken;
- (uint64_t)scaleCharacterInCustomNumberFormatScaleToken;
- (uint64_t)spaceCharacterInCustomNumberFormatSpaceToken;
- (void)stringByInsertingFormatGroupingSeparators;
@end

@implementation NSString(TSUCustomNumberFormatAdditions)

+ (uint64_t)customNumberFormatTokenStringOfType:()TSUCustomNumberFormatAdditions content:
{
  uint64_t v5 = TSUCustomNumberFormatTokenIdentifierCharacterForTokenType(a3);
  if (a4) {
    return [MEMORY[0x263F089D8] stringWithFormat:@"%C%C%@", (unsigned __int16)TSUCustomNumberFormatSentinelCharacter, v5, a4];
  }
  else {
    return objc_msgSend(MEMORY[0x263F089D8], "stringWithFormat:", @"%C%C", (unsigned __int16)TSUCustomNumberFormatSentinelCharacter, v5, v7);
  }
}

- (BOOL)isSpecialCustomNumberFormatToken
{
  if ((unint64_t)[a1 length] < 2) {
    return 0;
  }
  int v3 = [a1 characterAtIndex:0];
  return (unsigned __int16)TSUCustomNumberFormatSentinelCharacter == v3;
}

- (BOOL)isSpecialCustomNumberFormatTokenOfType:()TSUCustomNumberFormatAdditions
{
  if ((unint64_t)[a1 length] < 2) {
    return 0;
  }
  int v5 = [a1 characterAtIndex:0];
  if ((unsigned __int16)TSUCustomNumberFormatSentinelCharacter != v5) {
    return 0;
  }
  int v6 = [a1 characterAtIndex:1];
  return TSUCustomNumberFormatTokenIdentifierCharacterForTokenType(a3) == v6;
}

- (uint64_t)numberOfDigitsInCustomNumberFormatIntegerToken
{
  if (([a1 isSpecialCustomNumberFormatTokenOfType:1] & 1) == 0)
  {
    id v2 = +[TSUAssertionHandler currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"-[NSString(TSUCustomNumberFormatAdditions) numberOfDigitsInCustomNumberFormatIntegerToken]"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUCustomFormatNumberTokenDelegate.m"), 135, @"Wrong token type!");
  }
  if ((unint64_t)[a1 length] < 3) {
    return 0;
  }
  LODWORD(v4) = 0;
  unsigned int v5 = 3;
  uint64_t v6 = 2;
  do
  {
    if ([a1 characterAtIndex:v6] == 44) {
      uint64_t v4 = v4;
    }
    else {
      uint64_t v4 = (v4 + 1);
    }
    uint64_t v6 = v5;
  }
  while ([a1 length] > (unint64_t)v5++);
  return v4;
}

- (BOOL)customFormatIntegerTokenUsesSeparator
{
  if (([a1 isSpecialCustomNumberFormatTokenOfType:1] & 1) == 0)
  {
    id v2 = +[TSUAssertionHandler currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"-[NSString(TSUCustomNumberFormatAdditions) customFormatIntegerTokenUsesSeparator]"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUCustomFormatNumberTokenDelegate.m"), 146, @"Wrong token type!");
  }
  return objc_msgSend(a1, "characterAtIndex:", objc_msgSend(a1, "length") - 1) == 44;
}

- (void)stringByInsertingFormatGroupingSeparators
{
  id v2 = (void *)[MEMORY[0x263F089D8] string];
  unsigned int v3 = TSUNumberFormatterGroupingSizeForLocale(0);
  uint64_t v4 = [a1 length];
  uint64_t v5 = v4 - 1;
  if (v4 >= 1)
  {
    unint64_t v6 = 1;
    do
    {
      [v2 insertString:objc_msgSend(NSString, "stringWithFormat:", @"%C", objc_msgSend(a1, "characterAtIndex:", v5)), 0 atIndex];
      if (v5 && v3 && !(v6 % v3)) {
        [v2 insertString:@"," atIndex:0];
      }
      --v5;
      ++v6;
    }
    while (v5 != -1);
  }
  return v2;
}

+ (void)customNumberFormatIntegerTokenDisplayStringWithDigits:()TSUCustomNumberFormatAdditions separator:digitString:
{
  v8 = (void *)[MEMORY[0x263F089D8] string];
  unsigned int v9 = TSUNumberFormatterGroupingSizeForLocale(0);
  if (a3)
  {
    unsigned int v10 = v9;
    int v11 = 0;
    uint64_t v12 = *MEMORY[0x263EFF4F8];
    do
    {
      if (v11 && v10)
      {
        if ((a3 + v11) % v10) {
          BOOL v13 = 1;
        }
        else {
          BOOL v13 = a4 == 0;
        }
        if (!v13) {
          objc_msgSend(v8, "appendString:", objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF960], "currentLocale"), "objectForKey:", v12));
        }
      }
      [v8 appendString:a5];
      --v11;
    }
    while (a3 + v11);
  }
  return v8;
}

+ (uint64_t)customNumberFormatIntegerTokenRepresentedStringWithDigits:()TSUCustomNumberFormatAdditions separator:digitString:
{
  v8 = objc_msgSend(MEMORY[0x263F089D8], "stringWithCapacity:");
  if (a3)
  {
    unsigned int v9 = 1;
    do
    {
      [v8 appendString:a5];
      unint64_t v10 = v9++;
    }
    while (v10 < a3);
  }
  if (a4) {
    [v8 appendString:@","];
  }
  int v11 = (void *)MEMORY[0x263F089D8];
  return [v11 customNumberFormatTokenStringOfType:1 content:v8];
}

+ (void)customNumberFormatIntegerFormatStringWithDigits:()TSUCustomNumberFormatAdditions digitString:
{
  for (i = (void *)[MEMORY[0x263F089D8] string]; a3; --a3)
    [i appendString:a4];
  return i;
}

- (uint64_t)numberOfDigitsInCustomNumberFormatDecimalToken
{
  if (([a1 isSpecialCustomNumberFormatTokenOfType:2] & 1) == 0)
  {
    id v2 = +[TSUAssertionHandler currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"-[NSString(TSUCustomNumberFormatAdditions) numberOfDigitsInCustomNumberFormatDecimalToken]"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUCustomFormatNumberTokenDelegate.m"), 209, @"Wrong token type!");
  }
  if ((unint64_t)[a1 length] <= 2)
  {
    id v4 = +[TSUAssertionHandler currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[NSString(TSUCustomNumberFormatAdditions) numberOfDigitsInCustomNumberFormatDecimalToken]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUCustomFormatNumberTokenDelegate.m"), 212, @"Bad token format");
  }
  return [a1 length] - 3;
}

+ (void)customNumberFormatDecimalTokenDisplayStringWithDigits:()TSUCustomNumberFormatAdditions digitString:
{
  unint64_t v6 = (void *)[MEMORY[0x263F089D8] string];
  uint64_t v7 = (void *)[MEMORY[0x263EFF960] currentLocale];
  objc_msgSend(v6, "appendString:", objc_msgSend(v7, "objectForKey:", *MEMORY[0x263EFF4E8]));
  for (; a3; --a3)
    [v6 appendString:a4];
  return v6;
}

+ (uint64_t)customNumberFormatDecimalTokenRepresentedStringWithDigits:()TSUCustomNumberFormatAdditions digitString:
{
  unint64_t v6 = objc_msgSend(MEMORY[0x263F089D8], "stringWithCapacity:");
  if (a3 != -1)
  {
    uint64_t v7 = a3 + 1;
    do
    {
      [v6 appendString:a4];
      --v7;
    }
    while (v7);
  }
  v8 = (void *)MEMORY[0x263F089D8];
  return [v8 customNumberFormatTokenStringOfType:2 content:v6];
}

+ (void)customNumberFormatDecimalFormatStringWithDigits:()TSUCustomNumberFormatAdditions digitString:includeDecimalSeparator:
{
  v8 = (void *)[MEMORY[0x263F089D8] string];
  unsigned int v9 = v8;
  if (a5) {
    [v8 appendString:@"."];
  }
  if (a3 >= 1)
  {
    unsigned int v10 = a3 + 1;
    do
    {
      [v9 appendString:a4];
      --v10;
    }
    while (v10 > 1);
  }
  return v9;
}

- (__CFString)digitPlaceholderStringInDigitToken
{
  id v2 = @"0";
  if ([a1 rangeOfString:@"0"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v2 = @"#";
    if ([a1 rangeOfString:@"#"] == 0x7FFFFFFFFFFFFFFFLL) {
      return @"?";
    }
  }
  return v2;
}

- (id)currencyCodeFromCustomNumberFormatCurrencyToken
{
  if ((unint64_t)[a1 length] < 3)
  {
    return +[TSUNumberFormatter currentLocaleCurrencyCode];
  }
  else
  {
    return (id)[a1 substringFromIndex:2];
  }
}

- (uint64_t)fractionAccuracyFromCustomNumberFormatFractionToken
{
  v1 = (void *)[a1 substringFromIndex:2];
  return [v1 intValue];
}

- (uint64_t)formatStringFromCustomNumberFormatScaleToken
{
  return [a1 substringFromIndex:3];
}

- (uint64_t)scaleCharacterInCustomNumberFormatScaleToken
{
  return [a1 characterAtIndex:2];
}

- (uint64_t)spaceCharacterInCustomNumberFormatSpaceToken
{
  return [a1 characterAtIndex:2];
}

@end