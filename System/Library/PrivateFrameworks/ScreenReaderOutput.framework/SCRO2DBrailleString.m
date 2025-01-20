@interface SCRO2DBrailleString
+ (id)brailleStringsFromBrailleData:(id)a3;
- (SCRO2DBrailleString)initWithText:(id)a3;
- (_NSRange)_wordRangeAtIndex:(unint64_t)a3 inBraille:(id)a4;
- (id)brailleLinesForWidth:(unint64_t)a3 indent:(unint64_t)a4 focused:(BOOL)a5 wordWrap:(BOOL)a6;
@end

@implementation SCRO2DBrailleString

- (SCRO2DBrailleString)initWithText:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SCRO2DBrailleString;
  v5 = [(SCRO2DBrailleString *)&v21 init];
  if (v5)
  {
    v6 = +[SCROBrailleTranslationManager sharedManager];
    v7 = (NSArray *)objc_opt_new();
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v8 = [v4 componentsSeparatedByString:@"\n"];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(v6, "printBrailleForText:language:mode:textPositionsRange:locations:textFormattingRanges:", *(void *)(*((void *)&v17 + 1) + 8 * v12), 0, 1, 0x7FFFFFFFFFFFFFFFLL, 0, 0, 0);
          [(NSArray *)v7 addObject:v13];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v10);
    }

    brailleParagraphs = v5->_brailleParagraphs;
    v5->_brailleParagraphs = v7;

    v15 = v5;
  }

  return v5;
}

+ (id)brailleStringsFromBrailleData:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  v5 = [v3 strings];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      v8 = [v3 strings];
      uint64_t v9 = [v8 objectAtIndex:i];

      uint64_t v10 = [[SCRO2DBrailleString alloc] initWithText:v9];
      [v4 addObject:v10];
    }
  }

  return v4;
}

- (id)brailleLinesForWidth:(unint64_t)a3 indent:(unint64_t)a4 focused:(BOOL)a5 wordWrap:(BOOL)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  if (a3)
  {
    BOOL v6 = a5;
    uint64_t v9 = objc_opt_new();
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    obj = self->_brailleParagraphs;
    uint64_t v31 = [(NSArray *)obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v31)
    {
      uint64_t v29 = *(void *)v34;
      if (a4) {
        BOOL v10 = v6;
      }
      else {
        BOOL v10 = 0;
      }
      BOOL v28 = v10;
      int v11 = 1;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v34 != v29) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          if ((v28 & v11) != 0) {
            v14 = @"⣿";
          }
          else {
            v14 = &stru_26CCE0B50;
          }
          v32 = [(__CFString *)v14 stringByPaddingToLength:a4 withString:@"⠀" startingAtIndex:0];
          id v15 = [v32 stringByAppendingString:v13];
          v16 = v15;
          if ([v15 length])
          {
            long long v17 = v15;
            do
            {
              if ([v17 length] < a3)
              {
                uint64_t v18 = [v17 stringByPaddingToLength:a3 withString:@"⠀" startingAtIndex:0];

                long long v17 = (void *)v18;
              }
              unint64_t v19 = [(SCRO2DBrailleString *)self _wordRangeAtIndex:a3 inBraille:v17];
              if (v19 < a3 && (unint64_t v21 = v19) != 0 && v19 + v20 > a3)
              {
                v22 = [v17 substringToIndex:v19];
                uint64_t v23 = [v22 stringByPaddingToLength:a3 withString:@"⠀" startingAtIndex:0];

                [v9 addObject:v23];
                v16 = [v17 substringFromIndex:v21];

                long long v17 = (void *)v23;
              }
              else
              {
                v24 = [v17 substringToIndex:a3];
                [v9 addObject:v24];

                v16 = [v17 substringFromIndex:a3];
              }

              long long v17 = v16;
            }
            while ([v16 length]);
          }

          int v11 = 0;
        }
        int v11 = 0;
        uint64_t v31 = [(NSArray *)obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v31);
    }

    v25 = (void *)[v9 copy];
  }
  else
  {
    v25 = objc_opt_new();
  }

  return v25;
}

- (_NSRange)_wordRangeAtIndex:(unint64_t)a3 inBraille:(id)a4
{
  id v5 = a4;
  if ([v5 length] >= a3)
  {
    unint64_t v8 = a3;
    do
    {
      uint64_t v7 = v8;
      if (!v8) {
        break;
      }
      --v8;
    }
    while ([v5 characterAtIndex:v7 - 1] != 10240);
    for (; a3 < [v5 length]; ++a3)
    {
      if ([v5 characterAtIndex:a3] == 10240) {
        break;
      }
    }
    NSUInteger v6 = a3 - v7;
  }
  else
  {
    NSUInteger v6 = 0;
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v9 = v7;
  NSUInteger v10 = v6;
  result.length = v10;
  result.location = v9;
  return result;
}

- (void).cxx_destruct
{
}

@end