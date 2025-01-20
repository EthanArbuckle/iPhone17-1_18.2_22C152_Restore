@interface NSString(TSUNumberFormatStringUtilities)
+ (id)tsu_numberSymbols;
- (BOOL)tsu_isNumberFormatPattern;
- (__CFString)tsu_negativeSubpatternOfNumberFormatPattern;
- (id)tsu_positiveSubpatternOfNumberFormatPattern;
- (id)tsu_stringByRemovingEscapedCharactersFromNumberFormatPattern;
- (uint64_t)tsu_indexOfLastNonSuffixCharacterInNumberFormatSubpattern;
- (uint64_t)tsu_numberPortionOfNumberFormatSubpattern;
- (uint64_t)tsu_prefixOfNumberFormatSubpattern;
- (uint64_t)tsu_suffixOfNumberFormatSubpattern;
- (unint64_t)tsu_indexOfFirstNonPrefixCharacterInNumberFormatSubpattern;
- (unint64_t)tsu_indexOfNumberFormatSubpatternSeparator;
- (void)tsu_newRangesOfEscapedCharactersInNumberFormatPattern;
@end

@implementation NSString(TSUNumberFormatStringUtilities)

+ (id)tsu_numberSymbols
{
  if (tsu_numberSymbols_onceToken != -1) {
    dispatch_once(&tsu_numberSymbols_onceToken, &__block_literal_global_5);
  }
  v0 = (void *)tsu_numberSymbols_symbols;
  return v0;
}

- (BOOL)tsu_isNumberFormatPattern
{
  v2 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"0123456789@#"];
  v3 = objc_msgSend(a1, "tsu_stringByRemovingEscapedCharactersFromNumberFormatPattern");
  uint64_t v4 = [v3 rangeOfCharacterFromSet:v2];

  return v4 != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)tsu_newRangesOfEscapedCharactersInNumberFormatPattern
{
  uint64_t v2 = [a1 length];
  uint64_t v3 = 0;
  uint64_t v4 = 0;
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
    v10 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v6, v9);
    if (v4) {
      [v4 addObject:v10];
    }
    else {
      uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v10, 0);
    }
  }
  while (v6 != 0x7FFFFFFFFFFFFFFFLL && v8 != 0x7FFFFFFFFFFFFFFFLL);
  return v4;
}

- (id)tsu_stringByRemovingEscapedCharactersFromNumberFormatPattern
{
  uint64_t v2 = objc_msgSend(a1, "tsu_newRangesOfEscapedCharactersInNumberFormatPattern");
  if (v2)
  {
    id v3 = [MEMORY[0x263F089D8] stringWithString:a1];
    uint64_t v4 = [a1 length];
    if ([v2 count])
    {
      unint64_t v5 = 0;
      do
      {
        uint64_t v6 = [v2 objectAtIndex:v5];
        uint64_t v7 = [v6 rangeValue];
        uint64_t v9 = v8;

        objc_msgSend(v3, "replaceCharactersInRange:withString:", v7 - v4 + objc_msgSend(v3, "length"), v9, &stru_26EBF24D8);
        ++v5;
      }
      while (v5 < [v2 count]);
    }
  }
  else
  {
    id v3 = a1;
  }

  return v3;
}

- (unint64_t)tsu_indexOfNumberFormatSubpatternSeparator
{
  uint64_t v2 = objc_msgSend(a1, "tsu_newRangesOfEscapedCharactersInNumberFormatPattern");
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

- (id)tsu_positiveSubpatternOfNumberFormatPattern
{
  uint64_t v2 = objc_msgSend(a1, "tsu_indexOfNumberFormatSubpatternSeparator");
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v3 = a1;
  }
  else
  {
    id v3 = [a1 substringToIndex:v2];
  }
  return v3;
}

- (__CFString)tsu_negativeSubpatternOfNumberFormatPattern
{
  uint64_t v2 = objc_msgSend(a1, "tsu_indexOfNumberFormatSubpatternSeparator");
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v3 = &stru_26EBF24D8;
  }
  else
  {
    id v3 = [a1 substringFromIndex:v2 + 1];
  }
  return v3;
}

- (uint64_t)tsu_numberPortionOfNumberFormatSubpattern
{
  uint64_t v2 = objc_msgSend(a1, "tsu_indexOfFirstNonPrefixCharacterInNumberFormatSubpattern");
  uint64_t v3 = objc_msgSend(a1, "tsu_indexOfLastNonSuffixCharacterInNumberFormatSubpattern") - v2 + 1;
  return objc_msgSend(a1, "substringWithRange:", v2, v3);
}

- (uint64_t)tsu_indexOfLastNonSuffixCharacterInNumberFormatSubpattern
{
  uint64_t v2 = objc_msgSend(a1, "tsu_newRangesOfEscapedCharactersInNumberFormatPattern");
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "tsu_numberSymbols");
  uint64_t v4 = [a1 length];
  while (1)
  {
    unint64_t v5 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v3, 4, 0, v4);
    uint64_t v4 = v5;
    if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    if (!TSULocationInRanges(v5, v2)) {
      goto LABEL_6;
    }
  }
  uint64_t v6 = [NSString stringWithUTF8String:"-[NSString(TSUNumberFormatStringUtilities) tsu_indexOfLastNonSuffixCharacterInNumberFormatSubpattern]"];
  uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUNumberFormatter.m"];
  +[OITSUAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:194 isFatal:0 description:"invalid number format subpattern"];

  +[OITSUAssertionHandler logBacktraceThrottled];
LABEL_6:

  return v4;
}

- (uint64_t)tsu_suffixOfNumberFormatSubpattern
{
  uint64_t v2 = objc_msgSend(a1, "tsu_indexOfLastNonSuffixCharacterInNumberFormatSubpattern") + 1;
  return [a1 substringFromIndex:v2];
}

- (unint64_t)tsu_indexOfFirstNonPrefixCharacterInNumberFormatSubpattern
{
  uint64_t v2 = objc_msgSend(a1, "tsu_newRangesOfEscapedCharactersInNumberFormatPattern");
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "tsu_numberSymbols");
  uint64_t v4 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v3, 0, 0, objc_msgSend(a1, "length"));
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_5:
    uint64_t v6 = [NSString stringWithUTF8String:"-[NSString(TSUNumberFormatStringUtilities) tsu_indexOfFirstNonPrefixCharacterInNumberFormatSubpattern]"];
    uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUNumberFormatter.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:223 isFatal:0 description:"invalid number format subpattern"];

    +[OITSUAssertionHandler logBacktraceThrottled];
    unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    unint64_t v5 = v4;
    while (TSULocationInRanges(v5, v2))
    {
      unint64_t v5 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v3, 0, v5 + 1, objc_msgSend(a1, "length") - (v5 + 1));
      if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_5;
      }
    }
  }

  return v5;
}

- (uint64_t)tsu_prefixOfNumberFormatSubpattern
{
  uint64_t v2 = objc_msgSend(a1, "tsu_indexOfFirstNonPrefixCharacterInNumberFormatSubpattern");
  return [a1 substringToIndex:v2];
}

@end