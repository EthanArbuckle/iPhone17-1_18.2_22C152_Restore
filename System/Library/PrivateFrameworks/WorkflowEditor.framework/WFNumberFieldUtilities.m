@interface WFNumberFieldUtilities
+ (BOOL)shouldChangeText:(id)a3 allowMinus:(BOOL)a4;
+ (id)decimalSymbol;
+ (id)negateText:(id)a3;
+ (id)stringBySanitizingNumberString:(id)a3 allowDecimalNumbers:(BOOL)a4;
+ (unint64_t)numberOfOccurrencesOfString:(id)a3 inString:(id)a4;
+ (void)negateTextInput:(id)a3;
@end

@implementation WFNumberFieldUtilities

+ (unint64_t)numberOfOccurrencesOfString:(id)a3 inString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = 0;
  if ([v6 length])
  {
    uint64_t v8 = 0;
    do
    {
      uint64_t v9 = objc_msgSend(v6, "rangeOfString:options:range:", v5, 0, v8, objc_msgSend(v6, "length") - v8);
      if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      ++v7;
      uint64_t v8 = v9 + v10;
    }
    while (v9 + v10 < (unint64_t)[v6 length]);
  }

  return v7;
}

+ (id)stringBySanitizingNumberString:(id)a3 allowDecimalNumbers:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (void *)MEMORY[0x263F089C0];
  id v7 = a3;
  uint64_t v8 = [v6 decimalDigitCharacterSet];
  [v8 addCharactersInString:@"-"];
  if (v4)
  {
    uint64_t v9 = [a1 decimalSymbol];
    [v8 addCharactersInString:v9];
  }
  uint64_t v10 = [v8 invertedSet];
  v11 = [v7 componentsSeparatedByCharactersInSet:v10];

  v12 = [v11 componentsJoinedByString:&stru_26E7AB6D0];

  if ((unint64_t)[v12 length] >= 2 && objc_msgSend(v12, "hasPrefix:", @"0"))
  {
    uint64_t v13 = [v12 substringFromIndex:1];

    v12 = (void *)v13;
  }
  v14 = [a1 decimalSymbol];
  int v15 = [v12 hasPrefix:v14];

  if (v15)
  {
    uint64_t v16 = [@"0" stringByAppendingString:v12];

    v12 = (void *)v16;
  }

  return v12;
}

+ (BOOL)shouldChangeText:(id)a3 allowMinus:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [MEMORY[0x263F087B0] minimumDecimalNumber];
  uint64_t v8 = [v7 stringValue];
  unint64_t v9 = [v8 length] + 1;

  BOOL v12 = [v6 length] <= v9
     && ([a1 decimalSymbol],
         uint64_t v10 = objc_claimAutoreleasedReturnValue(),
         unint64_t v11 = [a1 numberOfOccurrencesOfString:v10 inString:v6],
         v10,
         v11 <= 1)
     && [a1 numberOfOccurrencesOfString:@"-" inString:v6] <= (unint64_t)v4;

  return v12;
}

+ (void)negateTextInput:(id)a3
{
  id v18 = a3;
  v3 = [v18 selectedTextRange];
  BOOL v4 = [v18 beginningOfDocument];
  id v5 = [v18 positionFromPosition:v4 offset:1];
  id v6 = [v18 textRangeFromPosition:v4 toPosition:v5];
  id v7 = [v18 textInRange:v6];
  if ([v7 isEqualToString:@"-"])
  {
    [v18 replaceRange:v6 withText:&stru_26E7AB6D0];
    uint64_t v8 = [v3 start];
    unint64_t v9 = [v18 positionFromPosition:v8 offset:-1];

    uint64_t v10 = [v3 end];
    unint64_t v11 = v18;
    BOOL v12 = v10;
    uint64_t v13 = -1;
  }
  else
  {
    v14 = [@"-" stringByAppendingString:v7];
    [v18 replaceRange:v6 withText:v14];

    int v15 = [v3 start];
    unint64_t v9 = [v18 positionFromPosition:v15 offset:1];

    uint64_t v10 = [v3 end];
    unint64_t v11 = v18;
    BOOL v12 = v10;
    uint64_t v13 = 1;
  }
  uint64_t v16 = [v11 positionFromPosition:v12 offset:v13];

  v17 = [v18 textRangeFromPosition:v9 toPosition:v16];
  [v18 setSelectedTextRange:v17];
}

+ (id)negateText:(id)a3
{
  v3 = (__CFString *)a3;
  if ([(__CFString *)v3 length]
    && ([(__CFString *)v3 substringToIndex:1],
        BOOL v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 isEqualToString:@"-"],
        v4,
        v5))
  {
    uint64_t v6 = [(__CFString *)v3 substringFromIndex:1];
  }
  else
  {
    id v7 = &stru_26E7AB6D0;
    if (v3) {
      id v7 = v3;
    }
    uint64_t v6 = [NSString stringWithFormat:@"%@%@", @"-", v7];
  }
  uint64_t v8 = (void *)v6;

  return v8;
}

+ (id)decimalSymbol
{
  v2 = [MEMORY[0x263EFF960] currentLocale];
  v3 = [v2 decimalSeparator];

  return v3;
}

@end