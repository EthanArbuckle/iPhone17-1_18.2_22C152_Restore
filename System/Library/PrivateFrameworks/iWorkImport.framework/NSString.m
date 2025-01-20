@interface NSString
+ (id)customNumberFormatDecimalFormatStringWithDigits:(unsigned int)a3 digitString:(id)a4 includeDecimalSeparator:(BOOL)a5;
+ (id)customNumberFormatDecimalTokenDisplayStringWithDigits:(unsigned int)a3 digitString:(id)a4;
+ (id)customNumberFormatDecimalTokenRepresentedStringWithDigits:(unsigned int)a3 digitString:(id)a4;
+ (id)customNumberFormatIntegerFormatStringWithDigits:(unsigned int)a3 digitString:(id)a4;
+ (id)customNumberFormatIntegerTokenDisplayStringWithDigits:(unsigned int)a3 separator:(BOOL)a4 digitString:(id)a5;
+ (id)customNumberFormatIntegerTokenRepresentedStringWithDigits:(unsigned int)a3 separator:(BOOL)a4 digitString:(id)a5;
+ (id)customNumberFormatTokenStringOfType:(int)a3 content:(id)a4;
+ (id)sfu_numberSymbols;
- (BOOL)customFormatIntegerTokenUsesSeparator;
- (BOOL)isSpecialCustomNumberFormatToken;
- (BOOL)isSpecialCustomNumberFormatTokenOfType:(int)a3;
- (BOOL)sfu_isNumberFormatPattern;
- (id)currencyCodeFromCustomNumberFormatCurrencyToken;
- (id)digitPlaceholderStringInDigitToken;
- (id)formatStringFromCustomNumberFormatScaleToken;
- (id)sfu_createRangesOfEscapedCharactersInNumberFormatPattern;
- (id)sfu_createStringBySubstitutingCharactersCFNumberFormatterDoesntUnderstand;
- (id)sfu_negativeSubpatternOfNumberFormatPattern;
- (id)sfu_numberPortionOfNumberFormatSubpattern;
- (id)sfu_positiveSubpatternOfNumberFormatPattern;
- (id)sfu_prefixOfNumberFormatSubpattern;
- (id)sfu_stringByRemovingEscapedCharactersFromNumberFormatPattern;
- (id)sfu_suffixOfNumberFormatSubpattern;
- (id)stringByInsertingGroupingSeparators;
- (int)fractionAccuracyFromCustomNumberFormatFractionToken;
- (int)sfu_indexOfFirstNonPrefixCharacterInNumberFormatSubpattern;
- (int)sfu_indexOfLastNonSuffixCharacterInNumberFormatSubpattern;
- (int)sfu_indexOfNumberFormatSubpatternSeparator;
- (unsigned)numberOfDigitsInCustomNumberFormatDecimalToken;
- (unsigned)numberOfDigitsInCustomNumberFormatIntegerToken;
- (unsigned)scaleCharacterInCustomNumberFormatScaleToken;
- (unsigned)spaceCharacterInCustomNumberFormatSpaceToken;
@end

@implementation NSString

+ (id)customNumberFormatTokenStringOfType:(int)a3 content:(id)a4
{
  if ((a3 - 1) > 5) {
    v4 = aSidcptf;
  }
  else {
    v4 = (__int16 *)*(&off_80528 + a3 - 1);
  }
  uint64_t v5 = (unsigned __int16)*v4;
  if (a4) {
    return +[NSMutableString stringWithFormat:@"%C%C%@", (unsigned __int16)word_9CC1A, v5, a4];
  }
  else {
    return +[NSMutableString stringWithFormat:@"%C%C", (unsigned __int16)word_9CC1A, v5, v7];
  }
}

- (BOOL)isSpecialCustomNumberFormatToken
{
  if ([(NSString *)self length] < 2) {
    return 0;
  }
  unsigned int v4 = [(NSString *)self characterAtIndex:0];
  return (unsigned __int16)word_9CC1A == v4;
}

- (BOOL)isSpecialCustomNumberFormatTokenOfType:(int)a3
{
  if ([(NSString *)self length] < 2) {
    return 0;
  }
  unsigned int v5 = [(NSString *)self characterAtIndex:0];
  if ((unsigned __int16)word_9CC1A != v5) {
    return 0;
  }
  unsigned int v6 = [(NSString *)self characterAtIndex:1];
  if ((a3 - 1) > 5) {
    uint64_t v7 = aSidcptf;
  }
  else {
    uint64_t v7 = (__int16 *)*(&off_80528 + a3 - 1);
  }
  return (unsigned __int16)*v7 == v6;
}

- (unsigned)numberOfDigitsInCustomNumberFormatIntegerToken
{
  if ([(NSString *)self length] < 3) {
    return 0;
  }
  unsigned int v3 = 0;
  unsigned int v4 = 3;
  uint64_t v5 = 2;
  do
  {
    if ([(NSString *)self characterAtIndex:v5] != 44) {
      ++v3;
    }
    uint64_t v5 = v4;
  }
  while ([(NSString *)self length] > v4++);
  return v3;
}

- (BOOL)customFormatIntegerTokenUsesSeparator
{
  return [(NSString *)self characterAtIndex:(char *)[(NSString *)self length] - 1] == 44;
}

- (id)stringByInsertingGroupingSeparators
{
  id v3 = +[NSMutableString string];
  unsigned int v4 = sub_52E14(0);
  signed int v5 = [(NSString *)self length] - 1;
  if (v5 >= 0)
  {
    unsigned int v6 = 1;
    do
    {
      [v3 insertString:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%C", -[NSString characterAtIndex:](self, "characterAtIndex:", v5)), 0 atIndex];
      if (v5 && !(v6 % v4)) {
        objc_msgSend(v3, "insertString:atIndex:", -[NSLocale objectForKey:](+[NSLocale currentLocale](NSLocale, "currentLocale"), "objectForKey:", NSLocaleGroupingSeparator), 0);
      }
      --v5;
      ++v6;
    }
    while (v5 != -1);
  }
  return v3;
}

+ (id)customNumberFormatIntegerTokenDisplayStringWithDigits:(unsigned int)a3 separator:(BOOL)a4 digitString:(id)a5
{
  BOOL v6 = a4;
  id v8 = +[NSMutableString string];
  unsigned int v9 = sub_52E14(0);
  if ((int)a3 >= 1)
  {
    unsigned int v10 = v9;
    int v11 = 0;
    do
    {
      if (v11)
      {
        if ((a3 + v11) % v10) {
          BOOL v12 = 1;
        }
        else {
          BOOL v12 = !v6;
        }
        if (!v12) {
          objc_msgSend(v8, "appendString:", -[NSLocale objectForKey:](+[NSLocale currentLocale](NSLocale, "currentLocale"), "objectForKey:", NSLocaleGroupingSeparator));
        }
      }
      [v8 appendString:a5];
      --v11;
    }
    while ((int)(a3 + v11 + 1) > 1);
  }
  return v8;
}

+ (id)customNumberFormatIntegerTokenRepresentedStringWithDigits:(unsigned int)a3 separator:(BOOL)a4 digitString:(id)a5
{
  BOOL v6 = a4;
  signed int v7 = a3;
  id v8 = +[NSMutableString stringWithCapacity:a3];
  if (v7 >= 1)
  {
    do
    {
      [(NSMutableString *)v8 appendString:a5];
      --v7;
    }
    while (v7);
  }
  if (v6) {
    [(NSMutableString *)v8 appendString:@","];
  }
  return +[NSMutableString customNumberFormatTokenStringOfType:1 content:v8];
}

+ (id)customNumberFormatIntegerFormatStringWithDigits:(unsigned int)a3 digitString:(id)a4
{
  id v6 = +[NSMutableString string];
  if ((int)a3 >= 1)
  {
    unsigned int v7 = a3 + 1;
    do
    {
      [v6 appendString:a4];
      --v7;
    }
    while (v7 > 1);
  }
  return v6;
}

- (unsigned)numberOfDigitsInCustomNumberFormatDecimalToken
{
  return [(NSString *)self length] - 3;
}

+ (id)customNumberFormatDecimalTokenDisplayStringWithDigits:(unsigned int)a3 digitString:(id)a4
{
  id v6 = +[NSMutableString string];
  objc_msgSend(v6, "appendString:", -[NSLocale objectForKey:](+[NSLocale currentLocale](NSLocale, "currentLocale"), "objectForKey:", NSLocaleDecimalSeparator));
  if ((int)a3 >= 1)
  {
    unsigned int v7 = a3 + 1;
    do
    {
      [v6 appendString:a4];
      --v7;
    }
    while (v7 > 1);
  }
  return v6;
}

+ (id)customNumberFormatDecimalTokenRepresentedStringWithDigits:(unsigned int)a3 digitString:(id)a4
{
  id v6 = +[NSMutableString stringWithCapacity:a3];
  if ((a3 & 0x80000000) == 0)
  {
    unsigned int v7 = a3 + 1;
    do
    {
      [(NSMutableString *)v6 appendString:a4];
      --v7;
    }
    while (v7);
  }
  return +[NSMutableString customNumberFormatTokenStringOfType:2 content:v6];
}

+ (id)customNumberFormatDecimalFormatStringWithDigits:(unsigned int)a3 digitString:(id)a4 includeDecimalSeparator:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = +[NSMutableString string];
  unsigned int v9 = v8;
  if (v5) {
    [v8 appendString:@"."];
  }
  if ((int)a3 >= 1)
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

- (id)digitPlaceholderStringInDigitToken
{
  id v3 = @"0";
  if ([(NSString *)self rangeOfString:@"0"] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v3 = @"#";
    if ([(NSString *)self rangeOfString:@"#"] == (id)0x7FFFFFFFFFFFFFFFLL) {
      return @"?";
    }
  }
  return v3;
}

- (id)currencyCodeFromCustomNumberFormatCurrencyToken
{
  if ([(NSString *)self length] < 3)
  {
    return +[GQNumberFormatter currentLocaleCurrencyCode];
  }
  else
  {
    return [(NSString *)self substringFromIndex:2];
  }
}

- (int)fractionAccuracyFromCustomNumberFormatFractionToken
{
  v2 = [(NSString *)self substringFromIndex:2];
  return [(NSString *)v2 intValue];
}

- (id)formatStringFromCustomNumberFormatScaleToken
{
  return [(NSString *)self substringFromIndex:3];
}

- (unsigned)scaleCharacterInCustomNumberFormatScaleToken
{
  return [(NSString *)self characterAtIndex:2];
}

- (unsigned)spaceCharacterInCustomNumberFormatSpaceToken
{
  return [(NSString *)self characterAtIndex:2];
}

+ (id)sfu_numberSymbols
{
  id result = (id)qword_A4540;
  if (!qword_A4540)
  {
    id result = +[NSCharacterSet characterSetWithCharactersInString:@"0123456789#@"];
    qword_A4540 = (uint64_t)result;
  }
  return result;
}

- (id)sfu_createStringBySubstitutingCharactersCFNumberFormatterDoesntUnderstand
{
  unsigned int v10 = self;
  if (!qword_A4580)
  {
    qword_A4548 = (uint64_t)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%C", 45);
    qword_A4550 = (uint64_t)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%C", 8722);
    qword_A4558 = (uint64_t)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%C", 65123);
    qword_A4560 = (uint64_t)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%C", 65293);
    qword_A4568 = (uint64_t)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%C", 43);
    qword_A4570 = (uint64_t)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%C", 65122);
    qword_A4578 = (uint64_t)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%C", 65291);
    id v2 = objc_alloc_init((Class)NSMutableString);
    [v2 appendString:qword_A4550];
    [v2 appendString:qword_A4558];
    [v2 appendString:qword_A4560];
    [v2 appendString:qword_A4570];
    [v2 appendString:qword_A4578];
    qword_A4580 = +[NSCharacterSet characterSetWithCharactersInString:v2];

    self = v10;
  }
  id v3 = -[NSString rangeOfCharacterFromSet:](self, "rangeOfCharacterFromSet:");
  if (v3 == (unsigned char *)0x7FFFFFFFFFFFFFFFLL)
  {
    return v10;
  }
  else
  {
    BOOL v5 = v3;
    id v6 = [(NSString *)v10 mutableCopy];
    unsigned int v7 = (char *)[v6 length];
    id v8 = (char *)(v7 - v5);
    objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", qword_A4550, qword_A4548, 0, v5, v7 - v5);
    objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", qword_A4558, qword_A4548, 0, v5, v8);
    objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", qword_A4560, qword_A4548, 0, v5, v8);
    objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", qword_A4570, qword_A4568, 0, v5, v8);
    objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", qword_A4578, qword_A4568, 0, v5, v8);
    id v9 = [objc_alloc((Class)NSString) initWithString:v6];

    return v9;
  }
}

- (BOOL)sfu_isNumberFormatPattern
{
  return objc_msgSend(-[NSString sfu_stringByRemovingEscapedCharactersFromNumberFormatPattern](self, "sfu_stringByRemovingEscapedCharactersFromNumberFormatPattern"), "rangeOfCharacterFromSet:", +[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", @"0123456789@#")) != (id)0x7FFFFFFFFFFFFFFFLL;
}

- (id)sfu_createRangesOfEscapedCharactersInNumberFormatPattern
{
  signed int v3 = [(NSString *)self length];
  unsigned int v4 = 0;
  id v5 = 0;
  do
  {
    id v6 = (char *)[(NSString *)self rangeOfString:@"'", 0, v4, v3 - v4 options range];
    if (v6 == (char *)0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    unsigned int v7 = v6;
    if (v6 == (char *)(v3 - 1)) {
      uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v8 = (uint64_t)[(NSString *)self rangeOfString:@"'", 0, v6 + 1, v3 - (void)(v6 + 1) options range];
    }
    unsigned int v9 = v8 - v7 + 1;
    if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
      unsigned int v9 = v3 - v7;
    }
    unsigned int v10 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v7, v9);
    if (v5) {
      [v5 addObject:v10];
    }
    else {
      id v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", v10, 0);
    }
    unsigned int v4 = v8 + 1;
  }
  while (v8 != 0x7FFFFFFFFFFFFFFFLL);
  return v5;
}

- (id)sfu_stringByRemovingEscapedCharactersFromNumberFormatPattern
{
  id v3 = [(NSString *)self sfu_createRangesOfEscapedCharactersInNumberFormatPattern];
  if (!v3) {
    return self;
  }
  unsigned int v4 = v3;
  id v5 = +[NSMutableString stringWithString:self];
  unsigned int v6 = [(NSString *)self length];
  if ([v4 count])
  {
    uint64_t v7 = 0;
    unsigned int v8 = 1;
    do
    {
      id v9 = objc_msgSend(objc_msgSend(v4, "objectAtIndex:", v7), "rangeValue");
      -[NSMutableString replaceCharactersInRange:withString:](v5, "replaceCharactersInRange:withString:", (char *)[(NSMutableString *)v5 length] + (void)v9 - v6, v10, &stru_85630);
      uint64_t v7 = v8;
    }
    while ((unint64_t)[v4 count] > v8++);
  }

  return v5;
}

- (int)sfu_indexOfNumberFormatSubpatternSeparator
{
  id v3 = [(NSString *)self sfu_createRangesOfEscapedCharactersInNumberFormatPattern];
  unsigned int v4 = -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", @";",
         0,
         0,
         [(NSString *)self length]);
  if (v4 == (unsigned char *)0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_5:
    LODWORD(v5) = -1;
  }
  else
  {
    id v5 = v4;
    while (sub_5290C(v5, v3))
    {
      id v5 = -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", @";",
             0,
             v5 + 1,
             (unsigned char *)[(NSString *)self length] - (v5 + 1));
      if (v5 == (unsigned char *)0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_5;
      }
    }
  }

  return (int)v5;
}

- (id)sfu_positiveSubpatternOfNumberFormatPattern
{
  signed int v3 = [(NSString *)self sfu_indexOfNumberFormatSubpatternSeparator];
  if (v3 == -1) {
    return self;
  }
  return [(NSString *)self substringToIndex:v3];
}

- (id)sfu_negativeSubpatternOfNumberFormatPattern
{
  unsigned int v3 = [(NSString *)self sfu_indexOfNumberFormatSubpatternSeparator];
  if (v3 == -1) {
    return &stru_85630;
  }
  return [(NSString *)self substringFromIndex:(int)(v3 + 1)];
}

- (id)sfu_numberPortionOfNumberFormatSubpattern
{
  signed int v3 = [(NSString *)self sfu_indexOfFirstNonPrefixCharacterInNumberFormatSubpattern];
  uint64_t v4 = [(NSString *)self sfu_indexOfLastNonSuffixCharacterInNumberFormatSubpattern]- v3+ 1;
  return -[NSString substringWithRange:](self, "substringWithRange:", v3, v4);
}

- (int)sfu_indexOfLastNonSuffixCharacterInNumberFormatSubpattern
{
  id v3 = [(NSString *)self sfu_createRangesOfEscapedCharactersInNumberFormatPattern];
  id v4 = objc_msgSend((id)objc_opt_class(), "sfu_numberSymbols");
  NSUInteger v5 = [(NSString *)self length];
  while (1)
  {
    id v6 = -[NSString rangeOfCharacterFromSet:options:range:](self, "rangeOfCharacterFromSet:options:range:", v4, 4, 0, v5);
    if (v6 == (id)0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    NSUInteger v5 = (NSUInteger)v6;
    if (!sub_5290C(v6, v3)) {
      goto LABEL_6;
    }
  }
  LODWORD(v5) = -1;
LABEL_6:

  return v5;
}

- (id)sfu_suffixOfNumberFormatSubpattern
{
  uint64_t v3 = [(NSString *)self sfu_indexOfLastNonSuffixCharacterInNumberFormatSubpattern]+ 1;
  return [(NSString *)self substringFromIndex:v3];
}

- (int)sfu_indexOfFirstNonPrefixCharacterInNumberFormatSubpattern
{
  id v3 = [(NSString *)self sfu_createRangesOfEscapedCharactersInNumberFormatPattern];
  id v4 = objc_msgSend((id)objc_opt_class(), "sfu_numberSymbols");
  NSUInteger v5 = -[NSString rangeOfCharacterFromSet:options:range:](self, "rangeOfCharacterFromSet:options:range:", v4, 0, 0, [(NSString *)self length]);
  if (v5 == (unsigned char *)0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_5:
    LODWORD(v6) = -1;
  }
  else
  {
    id v6 = v5;
    while (sub_5290C(v6, v3))
    {
      id v6 = -[NSString rangeOfCharacterFromSet:options:range:](self, "rangeOfCharacterFromSet:options:range:", v4, 0, v6 + 1, (unsigned char *)[(NSString *)self length] - (v6 + 1));
      if (v6 == (unsigned char *)0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_5;
      }
    }
  }

  return (int)v6;
}

- (id)sfu_prefixOfNumberFormatSubpattern
{
  uint64_t v3 = [(NSString *)self sfu_indexOfFirstNonPrefixCharacterInNumberFormatSubpattern];
  return [(NSString *)self substringToIndex:v3];
}

@end