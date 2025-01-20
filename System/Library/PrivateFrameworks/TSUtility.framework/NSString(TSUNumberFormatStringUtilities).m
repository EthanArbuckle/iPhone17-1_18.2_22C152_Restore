@interface NSString(TSUNumberFormatStringUtilities)
+ (uint64_t)numberSymbols;
- (BOOL)isNumberFormatPattern;
- (__CFString)negativeSubpatternOfNumberFormatPattern;
- (id)newStringBySubstitutingCharactersCFNumberFormatterDoesntUnderstand;
- (uint64_t)indexOfLastNonSuffixCharacterInNumberFormatSubpattern;
- (uint64_t)numberPortionOfNumberFormatSubpattern;
- (uint64_t)positiveSubpatternOfNumberFormatPattern;
- (uint64_t)prefixOfNumberFormatSubpattern;
- (uint64_t)suffixOfNumberFormatSubpattern;
- (unint64_t)indexOfFirstNonPrefixCharacterInNumberFormatSubpattern;
- (unint64_t)indexOfNumberFormatSubpatternSeparator;
- (void)newRangesOfEscapedCharactersInNumberFormatPattern;
- (void)stringByRemovingEscapedCharactersFromNumberFormatPattern;
@end

@implementation NSString(TSUNumberFormatStringUtilities)

+ (uint64_t)numberSymbols
{
  uint64_t result = numberSymbols_symbols;
  if (!numberSymbols_symbols)
  {
    v1 = objc_opt_class();
    objc_sync_enter(v1);
    if (!numberSymbols_symbols)
    {
      id v2 = (id)[MEMORY[0x263F08708] characterSetWithCharactersInString:@"0123456789#@"];
      __dmb(0xBu);
      numberSymbols_symbols = (uint64_t)v2;
    }
    objc_sync_exit(v1);
    return numberSymbols_symbols;
  }
  return result;
}

- (id)newStringBySubstitutingCharactersCFNumberFormatterDoesntUnderstand
{
  id v8 = a1;
  if (newStringBySubstitutingCharactersCFNumberFormatterDoesntUnderstand_once != -1)
  {
    dispatch_once(&newStringBySubstitutingCharactersCFNumberFormatterDoesntUnderstand_once, &__block_literal_global_1);
    a1 = v8;
  }
  uint64_t v1 = objc_msgSend(a1, "rangeOfCharacterFromSet:", newStringBySubstitutingCharactersCFNumberFormatterDoesntUnderstand_replacedCharacterSet, v8);
  if (v1 == 0x7FFFFFFFFFFFFFFFLL)
  {
    return v9;
  }
  else
  {
    uint64_t v3 = v1;
    v4 = (void *)[v9 mutableCopy];
    uint64_t v5 = [v4 length];
    uint64_t v6 = v5 - v3;
    objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"−", @"-", 0, v3, v5 - v3);
    objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"﹣", @"-", 0, v3, v6);
    objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"－", @"-", 0, v3, v6);
    objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"﹢", @"+", 0, v3, v6);
    objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"＋", @"+", 0, v3, v6);
    uint64_t v7 = [[NSString alloc] initWithString:v4];

    return (id)v7;
  }
}

- (BOOL)isNumberFormatPattern
{
  return objc_msgSend((id)objc_msgSend(a1, "stringByRemovingEscapedCharactersFromNumberFormatPattern"), "rangeOfCharacterFromSet:", objc_msgSend(MEMORY[0x263F08708], "characterSetWithCharactersInString:", @"0123456789@#")) != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)newRangesOfEscapedCharactersInNumberFormatPattern
{
  uint64_t v2 = [a1 length];
  uint64_t v3 = 0;
  v4 = 0;
  do
  {
    uint64_t v5 = objc_msgSend(a1, "rangeOfString:options:range:", @"'", 0, v3, v2 - v3);
    uint64_t v6 = v5;
    if (v5 == v2 - 1 || v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
      if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
        return v4;
      }
    }
    else
    {
      uint64_t v8 = objc_msgSend(a1, "rangeOfString:options:range:", @"'", 0, v5 + 1, v2 - (v5 + 1));
    }
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v9 = v2 - v6;
    }
    else
    {
      uint64_t v3 = v8 + 1;
      uint64_t v9 = v8 - v6 + 1;
    }
    uint64_t v10 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v6, v9);
    if (v4) {
      [v4 addObject:v10];
    }
    else {
      v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v10, 0);
    }
  }
  while (v6 != 0x7FFFFFFFFFFFFFFFLL && v8 != 0x7FFFFFFFFFFFFFFFLL);
  return v4;
}

- (void)stringByRemovingEscapedCharactersFromNumberFormatPattern
{
  uint64_t v2 = [a1 newRangesOfEscapedCharactersInNumberFormatPattern];
  if (!v2) {
    return a1;
  }
  uint64_t v3 = (void *)v2;
  v4 = (void *)[MEMORY[0x263F089D8] stringWithString:a1];
  uint64_t v5 = [a1 length];
  if ([v3 count])
  {
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = objc_msgSend((id)objc_msgSend(v3, "objectAtIndex:", v6), "rangeValue");
      objc_msgSend(v4, "replaceCharactersInRange:withString:", objc_msgSend(v4, "length") - v5 + v7, v8, &stru_26D4F03D0);
      ++v6;
    }
    while (v6 < [v3 count]);
  }

  return v4;
}

- (unint64_t)indexOfNumberFormatSubpatternSeparator
{
  uint64_t v2 = (void *)[a1 newRangesOfEscapedCharactersInNumberFormatPattern];
  uint64_t v3 = objc_msgSend(a1, "rangeOfString:options:range:", @";", 0, 0, objc_msgSend(a1, "length"));
  unint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v4 = v3;
    while (TSULocationInRanges(v4, v2))
    {
      unint64_t v4 = objc_msgSend(a1, "rangeOfString:options:range:", @";",
             0,
             v4 + 1,
             [a1 length] - (v4 + 1));
      if (v4 == 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
        break;
      }
    }
  }

  return v4;
}

- (uint64_t)positiveSubpatternOfNumberFormatPattern
{
  uint64_t v2 = [a1 indexOfNumberFormatSubpatternSeparator];
  if (v2 == 0x7FFFFFFFFFFFFFFFLL) {
    return (uint64_t)a1;
  }
  return [a1 substringToIndex:v2];
}

- (__CFString)negativeSubpatternOfNumberFormatPattern
{
  uint64_t v2 = [a1 indexOfNumberFormatSubpatternSeparator];
  if (v2 == 0x7FFFFFFFFFFFFFFFLL) {
    return &stru_26D4F03D0;
  }
  return (__CFString *)[a1 substringFromIndex:v2 + 1];
}

- (uint64_t)numberPortionOfNumberFormatSubpattern
{
  uint64_t v2 = [a1 indexOfFirstNonPrefixCharacterInNumberFormatSubpattern];
  uint64_t v3 = [a1 indexOfLastNonSuffixCharacterInNumberFormatSubpattern] - v2 + 1;
  return objc_msgSend(a1, "substringWithRange:", v2, v3);
}

- (uint64_t)indexOfLastNonSuffixCharacterInNumberFormatSubpattern
{
  uint64_t v2 = (void *)[a1 newRangesOfEscapedCharactersInNumberFormatPattern];
  uint64_t v3 = [(id)objc_opt_class() numberSymbols];
  uint64_t v4 = [a1 length];
  while (1)
  {
    unint64_t v5 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v3, 4, 0, v4);
    uint64_t v4 = v5;
    if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    if ((TSULocationInRanges(v5, v2) & 1) == 0) {
      goto LABEL_6;
    }
  }
  id v6 = +[TSUAssertionHandler currentHandler];
  uint64_t v7 = [NSString stringWithUTF8String:"-[NSString(TSUNumberFormatStringUtilities) indexOfLastNonSuffixCharacterInNumberFormatSubpattern]"];
  objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUNumberFormatter.m"), 254, @"invalid number format subpattern");
LABEL_6:

  return v4;
}

- (uint64_t)suffixOfNumberFormatSubpattern
{
  uint64_t v2 = [a1 indexOfLastNonSuffixCharacterInNumberFormatSubpattern] + 1;
  return [a1 substringFromIndex:v2];
}

- (unint64_t)indexOfFirstNonPrefixCharacterInNumberFormatSubpattern
{
  uint64_t v2 = (void *)[a1 newRangesOfEscapedCharactersInNumberFormatPattern];
  uint64_t v3 = [(id)objc_opt_class() numberSymbols];
  uint64_t v4 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v3, 0, 0, objc_msgSend(a1, "length"));
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_5:
    id v6 = +[TSUAssertionHandler currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[NSString(TSUNumberFormatStringUtilities) indexOfFirstNonPrefixCharacterInNumberFormatSubpattern]"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUNumberFormatter.m"), 286, @"invalid number format subpattern");
    unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    unint64_t v5 = v4;
    while ((TSULocationInRanges(v5, v2) & 1) != 0)
    {
      unint64_t v5 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v3, 0, v5 + 1, objc_msgSend(a1, "length") - (v5 + 1));
      if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_5;
      }
    }
  }

  return v5;
}

- (uint64_t)prefixOfNumberFormatSubpattern
{
  uint64_t v2 = [a1 indexOfFirstNonPrefixCharacterInNumberFormatSubpattern];
  return [a1 substringToIndex:v2];
}

@end