@interface SCROBrailleTranslationUtility
+ (id)_dotDescriptionForBrailleString:(id)a3;
+ (id)_japaneseIndicatorNameForBrailleString:(id)a3;
+ (id)_spokenStringForBrailleString:(id)a3 isDelete:(BOOL)a4 speakLiterally:(BOOL *)a5 modifiers:(id)a6;
+ (id)_translatedTextForPrefixBraille:(id)a3 printBraille:(id)a4 translationMode:(unint64_t)a5;
+ (id)_trimCommonPrefixWithString:(id)a3 fromString:(id)a4;
+ (id)spokenStringForDeletedBrailleString:(id)a3 speakLiterally:(BOOL *)a4;
+ (id)spokenStringForInsertedBrailleString:(id)a3 speakLiterally:(BOOL *)a4 modifiers:(id)a5;
+ (id)translatedTextInIsolationForBraille:(id)a3 translationMode:(unint64_t)a4;
@end

@implementation SCROBrailleTranslationUtility

+ (id)translatedTextInIsolationForBraille:(id)a3 translationMode:(unint64_t)a4
{
  if (a3)
  {
    id v5 = a3;
    v6 = +[SCROBrailleTranslationManager inputManager];
    v7 = [v6 textForPrintBraille:v5 language:0 mode:a4 locations:0];
  }
  else
  {
    v7 = &stru_26CCE0B50;
  }

  return v7;
}

+ (id)spokenStringForInsertedBrailleString:(id)a3 speakLiterally:(BOOL *)a4 modifiers:(id)a5
{
  return (id)[a1 _spokenStringForBrailleString:a3 isDelete:0 speakLiterally:a4 modifiers:a5];
}

+ (id)spokenStringForDeletedBrailleString:(id)a3 speakLiterally:(BOOL *)a4
{
  return (id)[a1 _spokenStringForBrailleString:a3 isDelete:1 speakLiterally:a4 modifiers:0];
}

+ (id)_translatedTextForPrefixBraille:(id)a3 printBraille:(id)a4 translationMode:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [a1 translatedTextInIsolationForBraille:@"⠿" translationMode:a5];
  v46 = v9;
  if (SCROJapaneseInputBrailleSelected()) {
    goto LABEL_2;
  }
  if (SCROCustomBrailleEnabled())
  {
    if (![v10 length])
    {
LABEL_2:
      a5 = 1;
LABEL_3:
      v11 = [a1 translatedTextInIsolationForBraille:v9 translationMode:a5];
      goto LABEL_28;
    }
    a5 = 1;
    v12 = [a1 translatedTextInIsolationForBraille:@"⠿⠿⠿" translationMode:1];
    v13 = [v12 stringByReplacingOccurrencesOfString:@" " withString:&stru_26CCE0B50];

    v14 = [NSString stringWithFormat:@"%@%@%@", v10, v10, v10];
    char v15 = [v13 isEqualToString:v14];

    if ((v15 & 1) == 0) {
      goto LABEL_3;
    }
  }
  else if (a5 != 3)
  {
    goto LABEL_3;
  }
  if ([v8 length])
  {
    v16 = [NSString stringWithFormat:@"%@%@%@", v8, v9, @"⠿"];
    v17 = [a1 translatedTextInIsolationForBraille:v16 translationMode:3];

    uint64_t v18 = [v17 rangeOfString:v10 options:0];
    if (v18 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v20 = &stru_26CCE0B50;
    }
    else
    {
      v20 = [v17 substringFromIndex:v18 + v19];
    }

    uint64_t v26 = [(__CFString *)v20 rangeOfString:v10 options:4];
    if (v26 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v21 = &stru_26CCE0B50;
    }
    else
    {
      v21 = [(__CFString *)v20 substringToIndex:v26];
    }

    v27 = [@"⠿" stringByAppendingString:v9];
    v28 = [a1 translatedTextInIsolationForBraille:v27 translationMode:3];

    uint64_t v29 = [v28 rangeOfString:v10];
    if (v29 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v25 = &stru_26CCE0B50;
    }
    else
    {
      v25 = [v28 substringFromIndex:v29 + v30];
    }

    if (!v21 || (uint64_t v31 = [(__CFString *)v21 length], v32 = v21, !v31)) {
      v32 = v25;
    }
    goto LABEL_27;
  }
  v21 = [a1 translatedTextInIsolationForBraille:v9 translationMode:3];
  v22 = [v9 stringByAppendingString:@"⠿"];
  v23 = [a1 translatedTextInIsolationForBraille:v22 translationMode:3];

  uint64_t v24 = [v23 rangeOfString:v10 options:4];
  if (v24 == 0x7FFFFFFFFFFFFFFFLL)
  {

    v25 = &stru_26CCE0B50;
  }
  else
  {
    v25 = [v23 substringToIndex:v24];

    if (!v25)
    {
LABEL_26:
      v32 = v21;
      goto LABEL_27;
    }
  }
  uint64_t v33 = [(__CFString *)v25 length];
  v32 = v25;
  if (!v33) {
    goto LABEL_26;
  }
LABEL_27:
  v11 = v32;

  a5 = 3;
LABEL_28:
  v34 = [v8 stringByAppendingString:v9];
  v35 = [a1 translatedTextInIsolationForBraille:v8 translationMode:a5];
  v36 = [a1 translatedTextInIsolationForBraille:v34 translationMode:a5];
  v37 = [a1 _trimCommonPrefixWithString:v35 fromString:v36];
  v38 = [(__CFString *)v11 uppercaseString];
  uint64_t v39 = [v37 length];
  if (v39 == [(__CFString *)v11 length])
  {
    if ([v37 isEqualToString:v38]) {
      v40 = v38;
    }
    else {
      v40 = v37;
    }
    v42 = v11;
    v11 = v40;
  }
  else
  {
    v41 = [a1 translatedTextInIsolationForBraille:v34 translationMode:1];
    v42 = v41;
    if (v38 && [(__CFString *)v41 hasSuffix:v38])
    {
      v43 = v38;

      v11 = v43;
    }
  }

  v44 = v11;
  return v44;
}

+ (id)_trimCommonPrefixWithString:(id)a3 fromString:(id)a4
{
  id v5 = a4;
  v6 = [v5 commonPrefixWithString:a3 options:0];
  v7 = objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v6, "length"));

  return v7;
}

+ (id)_spokenStringForBrailleString:(id)a3 isDelete:(BOOL)a4 speakLiterally:(BOOL *)a5 modifiers:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  if ([v10 length])
  {
    if (a5) {
      *a5 = 0;
    }
    v12 = (void *)[&stru_26CCE0B50 mutableCopy];
    if (SCROCustomBrailleEnabled()
      && ([MEMORY[0x263F2BA78] sharedModel],
          v13 = objc_claimAutoreleasedReturnValue(),
          [v13 bufferBrailleString],
          v14 = objc_claimAutoreleasedReturnValue(),
          v13,
          v14))
    {
      uint64_t v33 = v14;
      if (v8)
      {
        id v15 = v14;
        if ((unint64_t)[v15 length] >= 0xB)
        {
          uint64_t v16 = objc_msgSend(v15, "substringFromIndex:", objc_msgSend(v15, "length") - 10);

          id v15 = (id)v16;
        }
        id v17 = v10;
      }
      else if (SCROCustomBrailleEnabled())
      {
        uint64_t v19 = [MEMORY[0x263F2BA78] sharedModel];
        v20 = [v19 bufferBrailleString];

        if ([v20 length])
        {
          objc_msgSend(v20, "substringToIndex:", objc_msgSend(v20, "length") - 1);
          id v15 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v15 = 0;
        }
        id v17 = v10;
      }
      else
      {
        id v17 = 0;
        id v15 = 0;
      }
      v21 = [a1 _translatedTextForPrefixBraille:v15 printBraille:v17 translationMode:1];
      v22 = [MEMORY[0x263F08708] whitespaceCharacterSet];
      v23 = [v21 stringByTrimmingCharactersInSet:v22];

      id v31 = v17;
      if ([v23 length])
      {
        id v24 = v23;

        v25 = [NSNumber numberWithUnsignedInt:*MEMORY[0x263F2BB08]];
        int v26 = [v11 containsObject:v25];

        if (v26)
        {
          v21 = [v24 uppercaseString];
        }
        else
        {
          v21 = v24;
        }
      }
      if (objc_msgSend(v21, "length", v31) == 1
        && [v21 characterAtIndex:0] >> 11 >= 5
        && [v21 characterAtIndex:0] >> 8 <= 0x28)
      {
        v27 = [a1 _dotDescriptionForBrailleString:v10];
        v28 = v32;
        if (v27) {
          [v12 appendString:v27];
        }
      }
      else if ([v21 length])
      {
        [v12 appendString:v21];
        v28 = v32;
        if (a5) {
          *a5 = 1;
        }
      }
      else
      {
        uint64_t v29 = [a1 _dotDescriptionForBrailleString:v10];
        if (v29) {
          [v12 appendString:v29];
        }

        v28 = v32;
      }
      id v18 = v12;
    }
    else
    {
      id v18 = 0;
    }
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

+ (id)_japaneseIndicatorNameForBrailleString:(id)a3
{
  id v3 = a3;
  if ([v3 length] == 1)
  {
    int v4 = [v3 characterAtIndex:0];
    id v5 = [MEMORY[0x263F2BA98] manager];
    int v6 = [v5 isCandidateSelectionActive];

    if (v6)
    {
      v7 = &stru_26CCE0B50;
      if (v4 == 10248) {
        v7 = @"つぎのこうほ";
      }
      if (v4 == 10241) {
        BOOL v8 = @"まえのこうほ";
      }
      else {
        BOOL v8 = v7;
      }
    }
    else
    {
      BOOL v8 = 0;
      if (v4 <= 10277)
      {
        if (v4 > 10263)
        {
          if (v4 == 10264)
          {
            BOOL v8 = @"ようだくてん";
          }
          else if (v4 == 10272)
          {
            BOOL v8 = @"はんだくてん";
          }
        }
        else if (v4 == 10248)
        {
          BOOL v8 = @"ようおんてん";
        }
        else if (v4 == 10256)
        {
          BOOL v8 = @"だくてん";
        }
      }
      else if (v4 <= 10287)
      {
        if (v4 == 10278)
        {
          BOOL v8 = @"がいこくごはじめ";
        }
        else if (v4 == 10280)
        {
          BOOL v8 = @"ようはんだくてん";
        }
      }
      else
      {
        switch(v4)
        {
          case 10288:
            BOOL v8 = @"がいじふ";
            break;
          case 10290:
            BOOL v8 = @"くてん";
            break;
          case 10300:
            BOOL v8 = @"すうふ";
            break;
        }
      }
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (id)_dotDescriptionForBrailleString:(id)a3
{
  id v3 = a3;
  if (_dotDescriptionForBrailleString___AXNumberFormatterWithOptionsOnceToken != -1) {
    dispatch_once(&_dotDescriptionForBrailleString___AXNumberFormatterWithOptionsOnceToken, &__block_literal_global_3);
  }
  LODWORD(v4) = 0;
  uint64_t v5 = 0;
  int v6 = &stru_26CCE0B50;
  int v7 = [v3 characterAtIndex:0] + 2147473408;
  do
  {
    if ((v7 & (1 << v4)) != 0)
    {
      if (v5)
      {
        uint64_t v8 = [(__CFString *)v6 stringByAppendingString:@" "];

        int v6 = (__CFString *)v8;
      }
      id v9 = (void *)_dotDescriptionForBrailleString___brailleDotNumberFormatter;
      uint64_t v4 = (v4 + 1);
      id v10 = [NSNumber numberWithInt:v4];
      id v11 = [v9 stringFromNumber:v10];
      uint64_t v12 = [(__CFString *)v6 stringByAppendingString:v11];

      ++v5;
      int v6 = (__CFString *)v12;
    }
    else
    {
      LODWORD(v4) = v4 + 1;
    }
  }
  while (v4 != 8);
  if (v5)
  {
    if (v5 == 1) {
      v13 = @"braille.unknown.key.format";
    }
    else {
      v13 = @"braille.unknown.key.format.multiple";
    }
    v14 = [(id)_dotDescriptionForBrailleString___bundle localizedStringForKey:v13 value:&stru_26CCE0B50 table:@"Server"];
    id v15 = SCRCFormattedString();
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

uint64_t __65__SCROBrailleTranslationUtility__dotDescriptionForBrailleString___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A30]);
  v1 = (void *)_dotDescriptionForBrailleString___brailleDotNumberFormatter;
  _dotDescriptionForBrailleString___brailleDotNumberFormatter = (uint64_t)v0;

  v2 = (void *)_dotDescriptionForBrailleString___brailleDotNumberFormatter;
  id v3 = [MEMORY[0x263EFF960] currentLocale];
  [v2 setLocale:v3];

  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  _dotDescriptionForBrailleString___bundle = v4;

  return MEMORY[0x270F9A758](v4);
}

@end