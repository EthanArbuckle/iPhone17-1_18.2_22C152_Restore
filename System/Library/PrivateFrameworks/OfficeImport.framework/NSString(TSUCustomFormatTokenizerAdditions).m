@interface NSString(TSUCustomFormatTokenizerAdditions)
+ (uint64_t)tsu_customNumberFormatDecimalTokenRepresentedStringWithDigits:()TSUCustomFormatTokenizerAdditions digitString:;
+ (uint64_t)tsu_customNumberFormatIntegerTokenRepresentedStringWithDigits:()TSUCustomFormatTokenizerAdditions separator:digitString:;
+ (uint64_t)tsu_customNumberFormatTokenStringOfType:()TSUCustomFormatTokenizerAdditions content:;
+ (void)tsu_customNumberFormatDecimalFormatStringWithDigits:()TSUCustomFormatTokenizerAdditions digitString:includeDecimalSeparator:;
+ (void)tsu_customNumberFormatDecimalTokenDisplayStringWithDigits:()TSUCustomFormatTokenizerAdditions digitString:;
+ (void)tsu_customNumberFormatIntegerFormatStringWithDigits:()TSUCustomFormatTokenizerAdditions digitString:;
+ (void)tsu_customNumberFormatIntegerTokenDisplayStringWithDigits:()TSUCustomFormatTokenizerAdditions separator:digitString:locale:;
- (BOOL)tsu_customFormatIntegerTokenUsesSeparator;
- (BOOL)tsu_isSpecialCustomNumberFormatToken;
- (BOOL)tsu_isSpecialCustomNumberFormatTokenOfType:()TSUCustomFormatTokenizerAdditions;
- (__CFString)tsu_digitPlaceholderStringInDigitToken;
- (id)tsu_currencyCodeFromCustomNumberFormatCurrencyToken;
- (uint64_t)tsu_formatStringFromCustomNumberFormatScaleToken;
- (uint64_t)tsu_fractionAccuracyFromCustomNumberFormatFractionToken;
- (uint64_t)tsu_numberOfDigitsInCustomNumberFormatDecimalToken;
- (uint64_t)tsu_numberOfDigitsInCustomNumberFormatIntegerToken;
- (uint64_t)tsu_scaleCharacterInCustomNumberFormatScaleToken;
- (uint64_t)tsu_spaceCharacterInCustomNumberFormatSpaceToken;
- (void)tsu_stringByInsertingFormatGroupingSeparators:()TSUCustomFormatTokenizerAdditions;
@end

@implementation NSString(TSUCustomFormatTokenizerAdditions)

+ (uint64_t)tsu_customNumberFormatTokenStringOfType:()TSUCustomFormatTokenizerAdditions content:
{
  uint64_t v5 = TSUCustomFormatTokenIdentifierCharacterForTokenType(a3);
  if (a4) {
    return [MEMORY[0x263F089D8] stringWithFormat:@"%C%C%@", 63743, v5, a4];
  }
  else {
    return objc_msgSend(MEMORY[0x263F089D8], "stringWithFormat:", @"%C%C", 63743, v5, v7);
  }
}

- (BOOL)tsu_isSpecialCustomNumberFormatToken
{
  return (unint64_t)[a1 length] >= 2
      && [a1 characterAtIndex:0] == 63743;
}

- (BOOL)tsu_isSpecialCustomNumberFormatTokenOfType:()TSUCustomFormatTokenizerAdditions
{
  if ((unint64_t)[a1 length] < 2
    || [a1 characterAtIndex:0] != 63743)
  {
    return 0;
  }
  int v5 = [a1 characterAtIndex:1];
  return TSUCustomFormatTokenIdentifierCharacterForTokenType(a3) == v5;
}

- (uint64_t)tsu_numberOfDigitsInCustomNumberFormatIntegerToken
{
  if ((objc_msgSend(a1, "tsu_isSpecialCustomNumberFormatTokenOfType:", 1) & 1) == 0)
  {
    uint64_t v2 = [NSString stringWithUTF8String:"-[NSString(TSUCustomFormatTokenizerAdditions) tsu_numberOfDigitsInCustomNumberFormatIntegerToken]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUCustomFormatTokenizer.m"], 403, 0, "Wrong token type!");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  if ((unint64_t)[a1 length] < 3) {
    return 0;
  }
  uint64_t v3 = 0;
  unint64_t v4 = 2;
  do
  {
    if ([a1 characterAtIndex:v4] != 44) {
      ++v3;
    }
    ++v4;
  }
  while (v4 < [a1 length]);
  return v3;
}

- (BOOL)tsu_customFormatIntegerTokenUsesSeparator
{
  if ((objc_msgSend(a1, "tsu_isSpecialCustomNumberFormatTokenOfType:", 1) & 1) == 0)
  {
    uint64_t v2 = [NSString stringWithUTF8String:"-[NSString(TSUCustomFormatTokenizerAdditions) tsu_customFormatIntegerTokenUsesSeparator]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUCustomFormatTokenizer.m"], 413, 0, "Wrong token type!");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  return objc_msgSend(a1, "characterAtIndex:", objc_msgSend(a1, "length") - 1) == 44;
}

- (void)tsu_stringByInsertingFormatGroupingSeparators:()TSUCustomFormatTokenizerAdditions
{
  if (!a3)
  {
    uint64_t v5 = [NSString stringWithUTF8String:"-[NSString(TSUCustomFormatTokenizerAdditions) tsu_stringByInsertingFormatGroupingSeparators:]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUCustomFormatTokenizer.m"], 418, 0, "Need locale here.");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  v6 = (void *)[MEMORY[0x263F089D8] string];
  unint64_t v7 = [a3 groupingSize];
  uint64_t v8 = [a1 length];
  if (v8)
  {
    uint64_t v9 = v8 - 1;
    unint64_t v10 = 1;
    do
    {
      [v6 insertString:objc_msgSend(NSString, "stringWithFormat:", @"%C", objc_msgSend(a1, "characterAtIndex:", v9)), 0 atIndex];
      if (v9 && v7 && !(v10 % v7)) {
        [v6 insertString:@"," atIndex:0];
      }
      --v9;
      ++v10;
    }
    while (v9 != -1);
  }
  return v6;
}

+ (void)tsu_customNumberFormatIntegerTokenDisplayStringWithDigits:()TSUCustomFormatTokenizerAdditions separator:digitString:locale:
{
  if (!a6)
  {
    uint64_t v10 = [NSString stringWithUTF8String:"+[NSString(TSUCustomFormatTokenizerAdditions) tsu_customNumberFormatIntegerTokenDisplayStringWithDigits:separator:digitString:locale:]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUCustomFormatTokenizer.m"], 438, 0, "Need locale here.");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  v11 = (void *)[MEMORY[0x263F089D8] string];
  uint64_t v12 = [a6 groupingSize];
  if (a3)
  {
    unint64_t v13 = v12;
    uint64_t v14 = 0;
    uint64_t v15 = *MEMORY[0x263EFF4F8];
    do
    {
      if (v14 && v13)
      {
        if ((a3 + v14) % v13) {
          BOOL v16 = 1;
        }
        else {
          BOOL v16 = a4 == 0;
        }
        if (!v16) {
          objc_msgSend(v11, "appendString:", objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF960], "currentLocale"), "objectForKey:", v15));
        }
      }
      [v11 appendString:a5];
      --v14;
    }
    while (a3 + v14);
  }
  return v11;
}

+ (uint64_t)tsu_customNumberFormatIntegerTokenRepresentedStringWithDigits:()TSUCustomFormatTokenizerAdditions separator:digitString:
{
  for (i = objc_msgSend(MEMORY[0x263F089D8], "stringWithCapacity:"); a3; --a3)
    [i appendString:a5];
  if (a4) {
    [i appendString:@","];
  }
  uint64_t v9 = (void *)MEMORY[0x263F089D8];
  return objc_msgSend(v9, "tsu_customNumberFormatTokenStringOfType:content:", 1, i);
}

+ (void)tsu_customNumberFormatIntegerFormatStringWithDigits:()TSUCustomFormatTokenizerAdditions digitString:
{
  for (i = (void *)[MEMORY[0x263F089D8] string]; a3; --a3)
    [i appendString:a4];
  return i;
}

- (uint64_t)tsu_numberOfDigitsInCustomNumberFormatDecimalToken
{
  if ((objc_msgSend(a1, "tsu_isSpecialCustomNumberFormatTokenOfType:", 2) & 1) == 0)
  {
    uint64_t v2 = [NSString stringWithUTF8String:"-[NSString(TSUCustomFormatTokenizerAdditions) tsu_numberOfDigitsInCustomNumberFormatDecimalToken]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUCustomFormatTokenizer.m"], 472, 0, "Wrong token type!");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  return [a1 length] - 3;
}

+ (void)tsu_customNumberFormatDecimalTokenDisplayStringWithDigits:()TSUCustomFormatTokenizerAdditions digitString:
{
  v6 = (void *)[MEMORY[0x263F089D8] string];
  unint64_t v7 = (void *)[MEMORY[0x263EFF960] currentLocale];
  objc_msgSend(v6, "appendString:", objc_msgSend(v7, "objectForKey:", *MEMORY[0x263EFF4E8]));
  for (; a3; --a3)
    [v6 appendString:a4];
  return v6;
}

+ (uint64_t)tsu_customNumberFormatDecimalTokenRepresentedStringWithDigits:()TSUCustomFormatTokenizerAdditions digitString:
{
  v6 = objc_msgSend(MEMORY[0x263F089D8], "stringWithCapacity:");
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
  uint64_t v8 = (void *)MEMORY[0x263F089D8];
  return objc_msgSend(v8, "tsu_customNumberFormatTokenStringOfType:content:", 2, v6);
}

+ (void)tsu_customNumberFormatDecimalFormatStringWithDigits:()TSUCustomFormatTokenizerAdditions digitString:includeDecimalSeparator:
{
  uint64_t v8 = (void *)[MEMORY[0x263F089D8] string];
  uint64_t v9 = v8;
  if (a5) {
    [v8 appendString:@"."];
  }
  for (; a3; --a3)
    [v9 appendString:a4];
  return v9;
}

- (__CFString)tsu_digitPlaceholderStringInDigitToken
{
  uint64_t v2 = @"0";
  if ([a1 rangeOfString:@"0"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v2 = @"#";
    if ([a1 rangeOfString:@"#"] == 0x7FFFFFFFFFFFFFFFLL) {
      return @"?";
    }
  }
  return v2;
}

- (id)tsu_currencyCodeFromCustomNumberFormatCurrencyToken
{
  if ((unint64_t)[a1 length] < 3)
  {
    return +[OITSUNumberFormatter currentLocaleCurrencyCode];
  }
  else
  {
    return (id)[a1 substringFromIndex:2];
  }
}

- (uint64_t)tsu_fractionAccuracyFromCustomNumberFormatFractionToken
{
  v1 = (void *)[a1 substringFromIndex:2];
  return [v1 intValue];
}

- (uint64_t)tsu_formatStringFromCustomNumberFormatScaleToken
{
  return [a1 substringFromIndex:3];
}

- (uint64_t)tsu_scaleCharacterInCustomNumberFormatScaleToken
{
  return [a1 characterAtIndex:2];
}

- (uint64_t)tsu_spaceCharacterInCustomNumberFormatSpaceToken
{
  return [a1 characterAtIndex:2];
}

@end