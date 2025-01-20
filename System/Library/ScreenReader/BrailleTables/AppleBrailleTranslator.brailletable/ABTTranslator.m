@interface ABTTranslator
- (ABTTranslator)init;
- (BOOL)activeTableSupportsContractedBraille;
- (BOOL)activeTableSupportsEightDotBraille;
- (BOOL)activeTableSupportsIPA;
- (BOOL)activeTableSupportsTechnicalBraille;
- (id)_applyNumeralReadings:(id)a3 locations:(id *)a4;
- (id)_brailleForProcessedText:(id)a3 locations:(id *)a4;
- (id)_compositionOf:(id)a3 then:(id)a4;
- (id)_identityMapOfSize:(int64_t)a3;
- (id)_longVowelExpressedFor:(id)a3 partOfSpeech:(int64_t)a4;
- (id)_normalize:(id)a3;
- (id)_printBrailleForText:(id)a3 locations:(id *)a4;
- (id)_processKanjiNumbers:(id)a3 locations:(id *)a4;
- (id)_replaceWords:(id)a3 locations:(id *)a4;
- (id)_textForPrintBraille:(id)a3;
- (id)_yomiWithSpacingOf:(id)a3 locations:(id *)a4;
- (id)_zeroMapOfSize:(int64_t)a3;
- (id)activeTable;
- (id)applyNumeralReadings:(id)a3 locations:(id *)a4;
- (id)printBrailleForText:(id)a3 mode:(unint64_t)a4 locations:(id *)a5 textPositionsRange:(_NSRange)a6 textFormattingRanges:(id)a7;
- (id)processKanjiNumbers:(id)a3 locations:(id *)a4;
- (id)replaceWords:(id)a3 locations:(id *)a4;
- (id)textForPrintBraille:(id)a3;
- (id)textForPrintBraille:(id)a3 mode:(unint64_t)a4 locations:(id *)a5;
- (unint64_t)interfaceVersion;
@end

@implementation ABTTranslator

- (ABTTranslator)init
{
  v54.receiver = self;
  v54.super_class = (Class)ABTTranslator;
  v2 = [(ABTTranslator *)&v54 init];
  if (v2)
  {
    v3 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v4 = [v3 pathForResource:@"JapaneseNormalization" ofType:@"plist"];

    v53 = (void *)v4;
    uint64_t v5 = +[NSDictionary dictionaryWithContentsOfFile:v4];
    normalizer = v2->_normalizer;
    v2->_normalizer = (NSDictionary *)v5;

    if (!v2->_normalizer)
    {
      v7 = sub_5EFC();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_61CC();
      }
    }
    rules = v2->_rules;
    v2->_rules = (NSDictionary *)&off_B8E0;

    v9 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v10 = [v9 pathForResource:@"JapaneseNumeralReadings" ofType:@"plist"];

    v52 = (void *)v10;
    uint64_t v11 = +[NSDictionary dictionaryWithContentsOfFile:v10];
    numeralInfo = v2->_numeralInfo;
    v2->_numeralInfo = (NSDictionary *)v11;

    if (!v2->_numeralInfo)
    {
      v13 = sub_5EFC();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_6198();
      }
    }
    v14 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v15 = [v14 pathForResource:@"kataToHira" ofType:@"plist"];

    v51 = (void *)v15;
    uint64_t v16 = +[NSDictionary dictionaryWithContentsOfFile:v15];
    kataToHira = v2->_kataToHira;
    v2->_kataToHira = (NSDictionary *)v16;

    if (!v2->_kataToHira)
    {
      v18 = sub_5EFC();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_6164();
      }
    }
    v19 = +[NSBundle bundleForClass:objc_opt_class()];
    v20 = [v19 pathForResource:@"kanaToBraille" ofType:@"plist"];

    uint64_t v21 = +[NSDictionary dictionaryWithContentsOfFile:v20];
    kanaToBraille = v2->_kanaToBraille;
    v2->_kanaToBraille = (NSDictionary *)v21;

    if (!v2->_kanaToBraille)
    {
      v23 = sub_5EFC();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_6130();
      }
    }
    v24 = +[NSBundle bundleForClass:objc_opt_class()];
    v25 = [v24 pathForResource:@"numberToBraille" ofType:@"plist"];

    uint64_t v26 = +[NSDictionary dictionaryWithContentsOfFile:v25];
    numberToBraille = v2->_numberToBraille;
    v2->_numberToBraille = (NSDictionary *)v26;

    if (!v2->_numberToBraille)
    {
      v28 = sub_5EFC();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_60FC();
      }
    }
    v29 = +[NSBundle bundleForClass:objc_opt_class()];
    v30 = [v29 pathForResource:@"romajiToBraille" ofType:@"plist"];

    uint64_t v31 = +[NSDictionary dictionaryWithContentsOfFile:v30];
    romajiToBraille = v2->_romajiToBraille;
    v2->_romajiToBraille = (NSDictionary *)v31;

    if (!v2->_romajiToBraille)
    {
      v33 = sub_5EFC();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        sub_60C8();
      }
    }
    unknownPlaceholder = v2->_unknownPlaceholder;
    v2->_unknownPlaceholder = (NSString *)@"⠢";

    v35 = +[NSBundle bundleForClass:objc_opt_class()];
    v36 = [v35 pathForResource:@"BrailleToKana" ofType:@"plist"];

    uint64_t v37 = +[NSDictionary dictionaryWithContentsOfFile:v36];
    brailleToKana = v2->_brailleToKana;
    v2->_brailleToKana = (NSDictionary *)v37;

    if (!v2->_brailleToKana)
    {
      v39 = sub_5EFC();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        sub_6094();
      }
    }
    v40 = +[NSBundle bundleForClass:objc_opt_class()];
    v41 = [v40 pathForResource:@"BrailleToNumber" ofType:@"plist"];

    uint64_t v42 = +[NSDictionary dictionaryWithContentsOfFile:v41];
    brailleToNumber = v2->_brailleToNumber;
    v2->_brailleToNumber = (NSDictionary *)v42;

    if (!v2->_brailleToNumber)
    {
      v44 = sub_5EFC();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
        sub_6060();
      }
    }
    v45 = +[NSBundle bundleForClass:objc_opt_class()];
    v46 = [v45 pathForResource:@"BrailleToRomaji" ofType:@"plist"];

    uint64_t v47 = +[NSDictionary dictionaryWithContentsOfFile:v46];
    brailleToRomaji = v2->_brailleToRomaji;
    v2->_brailleToRomaji = (NSDictionary *)v47;

    if (!v2->_brailleToRomaji)
    {
      v49 = sub_5EFC();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
        sub_602C();
      }
    }
  }
  return v2;
}

- (id)activeTable
{
  return @"ja";
}

- (BOOL)activeTableSupportsContractedBraille
{
  return 0;
}

- (BOOL)activeTableSupportsEightDotBraille
{
  return 0;
}

- (BOOL)activeTableSupportsIPA
{
  return 0;
}

- (BOOL)activeTableSupportsTechnicalBraille
{
  return 0;
}

- (unint64_t)interfaceVersion
{
  return 7;
}

- (id)printBrailleForText:(id)a3 mode:(unint64_t)a4 locations:(id *)a5 textPositionsRange:(_NSRange)a6 textFormattingRanges:(id)a7
{
  id v7 = a3;
  id v8 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithCapacity:", 8 * (void)objc_msgSend(v7, "length"));
  if ([v7 length])
  {
    unint64_t v9 = 0;
    do
    {
      unint64_t v42 = v9;
      [v8 appendBytes:&v42 length:8];
      ++v9;
    }
    while (v9 < (unint64_t)[v7 length]);
  }
  id v10 = [objc_alloc((Class)BRLTEmojiPrintPreprocessor) initWithPrimaryLanguageCode:@"ja-JP"];
  uint64_t v31 = objc_opt_new();
  v32 = v10;
  id v11 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v10, v31, 0);
  id v12 = v8;
  id v13 = v7;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v14 = v11;
  id v15 = [v14 countByEnumeratingWithState:&v38 objects:v43 count:16];
  v34 = v13;
  v35 = v12;
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v39;
    do
    {
      v18 = 0;
      v19 = v13;
      v20 = v12;
      do
      {
        if (*(void *)v39 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v21 = *(void **)(*((void *)&v38 + 1) + 8 * (void)v18);
        id v37 = 0;
        id v13 = [v21 preprocessPrintString:v19 withLocationMap:&v37 isEightDot:1 textFormattingRanges:0];
        id v22 = v37;

        id v12 = +[BRLTPreprocessorHelper mergeLocationMap:v20 withLocationMap:v22];

        v18 = (char *)v18 + 1;
        v19 = v13;
        v20 = v12;
      }
      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v16);
  }

  id v36 = 0;
  v23 = [(ABTTranslator *)self _printBrailleForText:v13 locations:&v36];
  id v24 = v36;
  if (a5)
  {
    v25 = malloc_type_malloc(8 * (void)[v23 length], 0x100004000313F17uLL);
    if ([v23 length])
    {
      unint64_t v26 = 0;
      do
      {
        v27 = [v24 objectAtIndex:v26];
        v25[v26] = [v27 integerValue];

        ++v26;
      }
      while (v26 < (unint64_t)[v23 length]);
    }
    v28 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v25, 8 * (void)[v23 length]);
    *a5 = +[BRLTPreprocessorHelper mergeLocationMap:v12 withLocationMap:v28];
    if (v25) {
      free(v25);
    }
  }

  return v23;
}

- (id)textForPrintBraille:(id)a3 mode:(unint64_t)a4 locations:(id *)a5
{
  return -[ABTTranslator _textForPrintBraille:](self, "_textForPrintBraille:", a3, a4, a5);
}

- (id)_printBrailleForText:(id)a3 locations:(id *)a4
{
  v6 = [(ABTTranslator *)self _normalize:a3];
  id v7 = -[ABTTranslator _identityMapOfSize:](self, "_identityMapOfSize:", [v6 length]);
  if ([v6 length])
  {
    uint64_t v8 = 0;
    unint64_t v9 = 0;
    do
    {
      uint64_t v10 = 1;
      id v11 = objc_msgSend(v6, "substringWithRange:", v9, 1);
      if (([v11 isEqual:@" "] & 1) == 0)
      {
        id v12 = [(NSDictionary *)self->_kanaToBraille objectForKey:v11];

        uint64_t v10 = v8;
        if (!v12)
        {

          goto LABEL_9;
        }
      }

      ++v9;
      uint64_t v8 = v10;
    }
    while (v9 < (unint64_t)[v6 length]);
    id v13 = v6;
    if ((v10 & 1) == 0) {
      goto LABEL_10;
    }
    id v14 = v13;
    id v15 = 0;
  }
  else
  {
LABEL_9:
    id v16 = v6;
LABEL_10:
    id v34 = 0;
    uint64_t v17 = [(ABTTranslator *)self _replaceWords:v6 locations:&v34];
    id v18 = v34;
    v19 = [(ABTTranslator *)self _compositionOf:v18 then:v7];

    id v33 = v18;
    v20 = [(ABTTranslator *)self _processKanjiNumbers:v17 locations:&v33];
    id v21 = v33;

    id v22 = [(ABTTranslator *)self _compositionOf:v21 then:v19];

    id v32 = v21;
    v23 = [(ABTTranslator *)self _applyNumeralReadings:v20 locations:&v32];
    id v24 = v32;

    v25 = [(ABTTranslator *)self _compositionOf:v24 then:v22];

    id v31 = v24;
    id v14 = [(ABTTranslator *)self _yomiWithSpacingOf:v23 locations:&v31];
    id v15 = v31;

    id v7 = [(ABTTranslator *)self _compositionOf:v15 then:v25];
  }
  id v30 = v15;
  unint64_t v26 = [(ABTTranslator *)self _brailleForProcessedText:v14 locations:&v30];
  id v27 = v30;

  v28 = [(ABTTranslator *)self _compositionOf:v27 then:v7];

  if (a4) {
    *a4 = v28;
  }

  return v26;
}

- (id)_identityMapOfSize:(int64_t)a3
{
  id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:a3];
  if (a3 >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      v6 = +[NSNumber numberWithInteger:v5];
      [v4 addObject:v6];

      ++v5;
    }
    while (a3 != v5);
  }

  return v4;
}

- (id)_zeroMapOfSize:(int64_t)a3
{
  int64_t v3 = a3;
  id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:a3];
  if (v3 >= 1)
  {
    do
    {
      [v4 addObject:&off_9E88];
      --v3;
    }
    while (v3);
  }

  return v4;
}

- (id)_compositionOf:(id)a3 then:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count] && !objc_msgSend(v6, "count"))
  {
    id v7 = 0;
  }
  else
  {
    id v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v5, "count"));
    if ([v5 count])
    {
      unint64_t v8 = 0;
      do
      {
        unint64_t v9 = [v5 objectAtIndex:v8];
        unint64_t v10 = (unint64_t)[v9 integerValue];

        if ((v10 & 0x8000000000000000) != 0)
        {
          unint64_t v10 = 0;
        }
        else if (v10 >= (unint64_t)[v6 count])
        {
          unint64_t v10 = (unint64_t)[v6 count] - 1;
        }
        id v11 = [v6 objectAtIndex:v10];
        [v7 addObject:v11];

        ++v8;
      }
      while (v8 < (unint64_t)[v5 count]);
    }
  }

  return v7;
}

- (id)_normalize:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithCapacity:", objc_msgSend(v4, "length"));
  if ([v4 length])
  {
    unint64_t v6 = 0;
    do
    {
      id v7 = objc_msgSend(v4, "substringWithRange:", v6, 1);
      unint64_t v8 = [(NSDictionary *)self->_normalizer objectForKey:v7];
      if (v8) {
        unint64_t v9 = v8;
      }
      else {
        unint64_t v9 = v7;
      }
      [v5 appendString:v9];

      ++v6;
    }
    while (v6 < (unint64_t)[v4 length]);
  }

  return v5;
}

- (id)_replaceWords:(id)a3 locations:(id *)a4
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)NSAttributedString) initWithString:v5];
  id v31 = v5;
  id v7 = -[ABTTranslator _identityMapOfSize:](self, "_identityMapOfSize:", [v5 length]);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = [(NSDictionary *)self->_rules allKeys];
  id v36 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v36)
  {
    uint64_t v8 = 1;
    uint64_t v34 = *(void *)v44;
    v35 = self;
    do
    {
      uint64_t v9 = 0;
      unint64_t v10 = v7;
      id v11 = v6;
      do
      {
        long long v38 = v10;
        if (*(void *)v44 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v39 = v9;
        unint64_t v42 = *(void **)(*((void *)&v43 + 1) + 8 * v9);
        id v12 = -[NSDictionary objectForKey:](self->_rules, "objectForKey:");
        id v13 = [v12 objectAtIndex:0];
        id v14 = [v12 objectAtIndex:1];
        long long v40 = [v12 objectAtIndex:2];
        id v6 = (id)objc_opt_new();
        id v15 = objc_opt_new();
        id v37 = v12;
        if ([v11 length])
        {
          unint64_t v16 = 0;
          long long v41 = v6;
          do
          {
            uint64_t v17 = (char *)[v42 length] + v16;
            if (v17 <= [v11 length]
              && ([v11 string],
                  id v18 = objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v18, "substringWithRange:", v16, objc_msgSend(v42, "length")),
                  v19 = objc_claimAutoreleasedReturnValue(),
                  unsigned int v20 = [v42 isEqual:v19],
                  v19,
                  v18,
                  v20))
            {
              if ([v13 length])
              {
                unint64_t v21 = 0;
                do
                {
                  id v22 = [v14 objectAtIndex:v21];
                  v23 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v22 integerValue] + v16);
                  [v15 addObject:v23];

                  ++v21;
                }
                while (v21 < (unint64_t)[v13 length]);
              }
              id v24 = objc_alloc((Class)NSAttributedString);
              v47[0] = @"token";
              v25 = +[NSNumber numberWithInteger:v8];
              v47[1] = @"partOfSpeech";
              v48[0] = v25;
              v48[1] = v40;
              unint64_t v26 = +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:2];
              id v27 = [v24 initWithString:v13 attributes:v26];

              ++v8;
              id v6 = v41;
              [v41 appendAttributedString:v27];
              uint64_t v28 = (uint64_t)[v42 length];
            }
            else
            {
              v29 = +[NSNumber numberWithInteger:v16];
              [v15 addObject:v29];

              objc_msgSend(v11, "attributedSubstringFromRange:", v16, 1);
              id v27 = (id)objc_claimAutoreleasedReturnValue();
              id v6 = v41;
              [v41 appendAttributedString:v27];
              uint64_t v28 = 1;
            }

            v16 += v28;
          }
          while (v16 < (unint64_t)[v11 length]);
        }

        self = v35;
        id v7 = [(ABTTranslator *)v35 _compositionOf:v15 then:v38];

        uint64_t v9 = v39 + 1;
        unint64_t v10 = v7;
        id v11 = v6;
      }
      while ((id)(v39 + 1) != v36);
      id v36 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v36);
  }

  if (a4) {
    *a4 = v7;
  }

  return v6;
}

- (id)_processKanjiNumbers:(id)a3 locations:(id *)a4
{
  id v5 = a3;
  v62 = +[NSCharacterSet decimalDigitCharacterSet];
  id v6 = objc_opt_new();
  id v7 = objc_opt_new();
  if (![v5 length]) {
    goto LABEL_59;
  }
  v65 = v7;
  char v66 = 0;
  v61 = a4;
  char v8 = 0;
  int v9 = 0;
  id v63 = 0;
  v64 = v6;
  unint64_t v10 = 0;
  uint64_t v11 = 4;
  id v12 = &CFLocaleCreate_ptr;
  v67 = v5;
  do
  {
    id v13 = objc_msgSend(v5, "attributedSubstringFromRange:", v10, 1);
    id v14 = v13;
    int v68 = v9;
    if (v11 > 3) {
      goto LABEL_10;
    }
    if ([v13 isEqual:@"千"]) {
      goto LABEL_5;
    }
    if (v11 > 2) {
      goto LABEL_10;
    }
    if ([v14 isEqual:@"百"])
    {
LABEL_5:
      unsigned int v15 = 1;
      goto LABEL_11;
    }
    if (v11 > 1) {
LABEL_10:
    }
      unsigned int v15 = 0;
    else {
      unsigned int v15 = [v14 isEqual:@"十"];
    }
LABEL_11:
    unint64_t v16 = [v14 string];
    uint64_t v17 = [&off_B908 objectForKey:v16];

    if (v17)
    {
      unsigned int v18 = 1;
    }
    else
    {
      v19 = [v14 string];
      unsigned int v18 = [&off_B838 containsObject:v19];

      id v5 = v67;
    }
    v71 = [v5 attributesAtIndex:v10 effectiveRange:0];
    v70 = [v71 objectForKey:@"token"];
    if (v70) {
      unsigned int v20 = 0;
    }
    else {
      unsigned int v20 = v18;
    }
    v72 = v14;
    v73 = v17;
    if ((v8 & 1) == 0)
    {
      char v8 = 0;
      goto LABEL_32;
    }
    if (((v20 ^ 1 | v15) & 1) == 0 && (v66 & (v17 != 0)) == 0)
    {
      char v8 = 1;
      goto LABEL_32;
    }
    if (v66)
    {
      if ((v11 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        uint64_t v21 = v11 - 1;
        do
        {
          id v22 = [objc_alloc((Class)v12[53]) initWithString:@"0"];
          [v6 appendAttributedString:v22];

          v23 = +[NSNumber numberWithInteger:v10 - 2];
          [v65 addObject:v23];

          --v21;
        }
        while (v21);
      }
      id v24 = objc_alloc((Class)v12[53]);
      v25 = +[NSNumber numberWithInteger:v63];
      unint64_t v26 = +[NSString stringWithFormat:@"%@", v25];
      id v27 = [v24 initWithString:v26];

      [v6 appendAttributedString:v27];
      uint64_t v28 = +[NSNumber numberWithInteger:v10 - 1];
      [v65 addObject:v28];

LABEL_31:
      char v66 = 0;
      char v8 = 0;
      uint64_t v11 = 4;
LABEL_32:
      if ((v20 & 1) == 0) {
        goto LABEL_30;
      }
      goto LABEL_33;
    }
    if ((unint64_t)(v11 - 1) > 2) {
      goto LABEL_31;
    }
    do
    {
      id v29 = [objc_alloc((Class)v12[53]) initWithString:@"0"];
      [v6 appendAttributedString:v29];

      id v30 = +[NSNumber numberWithInteger:v10 - 1];
      [v65 addObject:v30];

      --v11;
    }
    while (v11);
    char v66 = 0;
    char v8 = 0;
    uint64_t v11 = 4;
    if ((v20 & 1) == 0)
    {
LABEL_30:
      id v6 = v64;
      id v31 = v72;
      [v64 appendAttributedString:v72];
      id v32 = +[NSNumber numberWithInteger:v10];
      [v65 addObject:v32];

      int v9 = 0;
      id v5 = v67;
      id v12 = &CFLocaleCreate_ptr;
      goto LABEL_49;
    }
LABEL_33:
    if (v10)
    {
      id v5 = v67;
      id v33 = [v67 string];
      unsigned int v34 = objc_msgSend(v62, "characterIsMember:", objc_msgSend(v33, "characterAtIndex:", v10 - 1));
    }
    else
    {
      unsigned int v34 = 0;
      id v5 = v67;
    }
    id v6 = v64;
    id v12 = &CFLocaleCreate_ptr;
    if ((v68 | v34))
    {
      id v31 = v72;
      [v64 appendAttributedString:v72];
      v35 = +[NSNumber numberWithInteger:v10];
      [v65 addObject:v35];

      int v9 = 1;
    }
    else
    {
      id v36 = v17;
      if (v17)
      {
        id v63 = [v17 integerValue];
        int v9 = 0;
        char v66 = 1;
        char v8 = 1;
        id v31 = v72;
        goto LABEL_50;
      }
      uint64_t v37 = (uint64_t)v63;
      if ((v66 & 1) == 0) {
        uint64_t v37 = 1;
      }
      id v63 = (id)v37;
      long long v38 = [v72 string];
      uint64_t v39 = [&off_B930 objectForKey:v38];
      uint64_t v69 = (uint64_t)[v39 integerValue];

      if (v11 <= 3)
      {
        uint64_t v40 = v11 + ~v69;
        if (v40 >= 1)
        {
          uint64_t v41 = -2;
          if ((v66 & 1) == 0) {
            uint64_t v41 = -1;
          }
          unint64_t v42 = v41 + v10;
          do
          {
            id v43 = [objc_alloc((Class)NSAttributedString) initWithString:@"0"];
            [v64 appendAttributedString:v43];

            long long v44 = +[NSNumber numberWithInteger:v42];
            [v65 addObject:v44];

            --v40;
          }
          while (v40);
        }
      }
      id v45 = objc_alloc((Class)NSAttributedString);
      long long v46 = +[NSNumber numberWithInteger:v63];
      uint64_t v47 = +[NSString stringWithFormat:@"%@", v46];
      id v48 = [v45 initWithString:v47];

      [v64 appendAttributedString:v48];
      v49 = +[NSNumber numberWithInteger:v10 - (v66 & 1)];
      [v65 addObject:v49];

      char v66 = 0;
      int v9 = 0;
      char v8 = 1;
      uint64_t v11 = v69;
      id v31 = v72;
    }
LABEL_49:
    id v36 = v73;
LABEL_50:

    ++v10;
  }
  while (v10 < (unint64_t)[v5 length]);
  a4 = v61;
  id v7 = v65;
  if (v8)
  {
    if (v66)
    {
      if ((v11 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        uint64_t v50 = v11 - 1;
        do
        {
          id v51 = [objc_alloc((Class)NSAttributedString) initWithString:@"0"];
          [v6 appendAttributedString:v51];

          v52 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)[v5 length] - 2);
          [v65 addObject:v52];

          --v50;
        }
        while (v50);
      }
      id v53 = objc_alloc((Class)NSAttributedString);
      objc_super v54 = +[NSNumber numberWithInteger:v63];
      v55 = +[NSString stringWithFormat:@"%@", v54];
      id v56 = [v53 initWithString:v55];

      [v6 appendAttributedString:v56];
      v57 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)[v5 length] - 1);
      [v65 addObject:v57];

      id v7 = v65;
    }
    else
    {
      id v7 = v65;
      if ((unint64_t)(v11 - 1) <= 2)
      {
        do
        {
          id v58 = [objc_alloc((Class)NSAttributedString) initWithString:@"0"];
          [v6 appendAttributedString:v58];

          v59 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)[v5 length] - 1);
          [v65 addObject:v59];

          --v11;
        }
        while (v11);
      }
    }
  }
LABEL_59:
  if (a4) {
    *a4 = v7;
  }

  return v6;
}

- (id)_applyNumeralReadings:(id)a3 locations:(id *)a4
{
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", @"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"〇", @"一", @"二", @"三", @"四", @"五", @"六",
         @"七",
         @"八",
         @"九",
         @"十",
         @"百",
         @"千",
         @"万",
         @"億",
         @"兆",
         0);
  id v6 = objc_opt_new();
  id v7 = objc_opt_new();
  if ([v4 length])
  {
    char v8 = 0;
    uint64_t v59 = -1;
    id v60 = v5;
    v62 = v6;
    while (1)
    {
      if (v8 >= [v4 length]) {
        goto LABEL_8;
      }
      int v9 = [v4 attributesAtIndex:v8 effectiveRange:0];
      unint64_t v10 = [v9 objectForKey:@"token"];

      uint64_t v11 = [v4 string];
      id v12 = objc_msgSend(v11, "substringWithRange:", v8, 1);

      if (!v10 && [v5 containsObject:v12])
      {

LABEL_8:
        if (v8 == [v4 length]) {
          break;
        }
        unint64_t v15 = (unint64_t)(v8 + 1);
        unint64_t v16 = v8;
        if (v8 + 1 < [v4 length])
        {
          unint64_t v16 = v8;
          while (1)
          {
            unint64_t v15 = (unint64_t)(v16 + 1);
            uint64_t v17 = [v4 attributesAtIndex:v8 effectiveRange:0];
            unsigned int v18 = [v17 objectForKey:@"token"];

            v19 = [v4 string];
            unsigned int v20 = objc_msgSend(v19, "substringWithRange:", v16 + 1, 1);

            if (v18 || ([v5 containsObject:v20] & 1) == 0) {
              break;
            }

            id v21 = [v4 length];
            id v22 = v16 + 1;
            unint64_t v23 = (unint64_t)(v16 + 2);
            ++v16;
            if (v23 >= (unint64_t)v21)
            {
              unint64_t v15 = (unint64_t)(v22 + 1);
              unint64_t v16 = v22;
              goto LABEL_16;
            }
          }
        }
LABEL_16:
        if (v15 >= (unint64_t)[v4 length])
        {
          unint64_t v25 = v15 - (void)v8;
LABEL_30:
          unint64_t v26 = objc_msgSend(v4, "attributedSubstringFromRange:", v8, v25);
          if ([v26 length])
          {
            unint64_t v53 = 0;
            do
            {
              objc_super v54 = +[NSNumber numberWithInteger:&v8[v53]];
              [v7 addObject:v54];

              ++v53;
            }
            while (v53 < (unint64_t)[v26 length]);
            v8 += v53;
          }
          [v6 appendAttributedString:v26];
          goto LABEL_35;
        }
        id v24 = [v4 string];
        unint64_t v25 = v15 - (void)v8;
        unint64_t v26 = objc_msgSend(v24, "substringWithRange:", v8, v15 - (void)v8 + 1);

        numeralInfo = self->_numeralInfo;
        if (numeralInfo
          && ([(NSDictionary *)numeralInfo objectForKey:v26],
              (uint64_t v28 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          id v29 = v28;
          v57 = v26;
          id v30 = [v28 objectForKey:@"reading"];
          id v58 = v29;
          id v31 = [v29 objectForKey:@"locations"];
          id v32 = &CFLocaleCreate_ptr;
          if ([v30 length])
          {
            unint64_t v33 = 0;
            do
            {
              unsigned int v34 = v32[62];
              [v31 objectAtIndex:v33];
              v35 = v31;
              uint64_t v37 = v36 = v32;
              long long v38 = objc_msgSend(v34, "numberWithInteger:", &v8[(void)objc_msgSend(v37, "integerValue")]);
              [v7 addObject:v38];

              id v32 = v36;
              id v31 = v35;
              ++v33;
            }
            while (v33 < (unint64_t)[v30 length]);
          }
          id v39 = objc_alloc((Class)NSAttributedString);
          v63[0] = @"token";
          uint64_t v40 = [v32[62] numberWithInteger:v59];
          v63[1] = @"partOfSpeech";
          v64[0] = v40;
          v64[1] = &off_9E88;
          uint64_t v41 = +[NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:2];
          id v42 = [v39 initWithString:v30 attributes:v41];
          [v62 appendAttributedString:v42];

          --v59;
          unint64_t v26 = v57;
          id v43 = v58;
        }
        else
        {
          long long v44 = [v4 string];
          unsigned int v45 = [v44 characterAtIndex:v15];

          if (v45 != 26085)
          {

            id v5 = v60;
            goto LABEL_30;
          }
          long long v46 = objc_msgSend(v4, "attributedSubstringFromRange:", v8, v15 - (void)v8);
          [v6 appendAttributedString:v46];

          if ((uint64_t)v8 <= (uint64_t)v16)
          {
            do
            {
              uint64_t v47 = +[NSNumber numberWithInteger:v8];
              [v7 addObject:v47];

              ++v8;
            }
            while (v16 + 1 != v8);
          }
          id v48 = objc_alloc((Class)NSAttributedString);
          v49 = +[NSBundle mainBundle];
          uint64_t v50 = [v49 localizedStringForKey:@"にち" value:&stru_93A0 table:0];
          id v51 = [v48 initWithString:v50];
          [v62 appendAttributedString:v51];

          v52 = +[NSNumber numberWithInteger:v15];
          [v7 addObject:v52];

          id v43 = +[NSNumber numberWithInteger:v15];
          [v7 addObject:v43];
        }

        char v8 = v16 + 2;
        id v6 = v62;
        id v5 = v60;
LABEL_35:

        if (v8 >= [v4 length]) {
          break;
        }
      }
      else
      {
        id v13 = objc_msgSend(v4, "attributedSubstringFromRange:", v8, 1);
        [v6 appendAttributedString:v13];

        id v14 = +[NSNumber numberWithInteger:v8];
        [v7 addObject:v14];

        ++v8;
      }
    }
  }
  if (a4) {
    *a4 = v7;
  }

  return v6;
}

- (id)_yomiWithSpacingOf:(id)a3 locations:(id *)a4
{
  id v5 = a3;
  id v6 = +[NSCharacterSet decimalDigitCharacterSet];
  CFStringRef v7 = (const __CFString *)[v5 string];
  CFLocaleRef v8 = CFLocaleCreate(kCFAllocatorDefault, @"ja");
  v105.CFIndex location = 0;
  v105.CFIndex length = 0;
  int v9 = CFStringTokenizerCreate(kCFAllocatorDefault, 0, v105, 0, v8);
  CFRelease(v8);
  v106.CFIndex length = CFStringGetLength(v7);
  CFStringRef v10 = v7;
  uint64_t v11 = v9;
  v106.CFIndex location = 0;
  CFStringTokenizerSetString(v9, v10, v106);
  id v98 = (id)objc_opt_new();
  id v12 = objc_opt_new();
  tokenizer = v9;
  v83 = a4;
  if (CFStringTokenizerAdvanceToNextToken(v9))
  {
    CFIndex v13 = 0;
    BOOL v14 = 0;
    unsigned int v15 = 0;
    int v99 = 0;
    BOOL v16 = 0;
    uint64_t v17 = &CFLocaleCreate_ptr;
    v87 = v12;
    v100 = v5;
    v85 = v6;
    while (1)
    {
      int v93 = v16;
      unsigned int v89 = v15;
      CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v11);
      CFIndex v19 = v13;
      unsigned int v20 = [v5 string];
      id v21 = objc_msgSend(v20, "substringWithRange:", v13, CurrentTokenRange.location - v13);
      [v98 appendString:v21];

      CFIndex v22 = v19;
      CFIndex v96 = v19;
      if (CurrentTokenRange.location > v19)
      {
        do
        {
          unint64_t v23 = objc_msgSend(v17[62], "numberWithInteger:", v22, v83);
          [v12 addObject:v23];

          ++v22;
        }
        while (CurrentTokenRange.location != v22);
      }
      id v24 = (void *)CFStringTokenizerCopyCurrentTokenAttribute(v11, 0x400000uLL);
      int CurrentTokenPartOfSpeech = _CFStringTokenizerGetCurrentTokenPartOfSpeech();
      CFIndex length = CurrentTokenRange.length;
      BOOL v90 = v14;
      if (CurrentTokenRange.length < 1)
      {
        BOOL v103 = 1;
        int v28 = v99;
        if (!CurrentTokenRange.length) {
          goto LABEL_22;
        }
      }
      else
      {
        BOOL v103 = 0;
        uint64_t v27 = 0;
        int v28 = v99;
        do
        {
          id v29 = objc_msgSend(v5, "string", v83);
          unsigned int v30 = [v29 characterAtIndex:CurrentTokenRange.location + v27];

          if (v30 > 0x7F)
          {
            if (!__maskrune(v30, 0x100uLL)) {
              break;
            }
          }
          else if ((_DefaultRuneLocale.__runetype[v30] & 0x100) == 0)
          {
            break;
          }
          BOOL v103 = ++v27 >= CurrentTokenRange.length;
        }
        while (CurrentTokenRange.length != v27);
      }
      id v31 = objc_msgSend(v5, "string", v83);
      unsigned int v32 = objc_msgSend(v6, "characterIsMember:", objc_msgSend(v31, "characterAtIndex:", CurrentTokenRange.location)) ^ 1;

      if (v32)
      {
LABEL_22:
        int v37 = 1;
        int v88 = v28;
        goto LABEL_23;
      }
      if (CurrentTokenRange.length < 1)
      {
        int v37 = 0;
        int v88 = v28;
        int v99 = 1;
        goto LABEL_26;
      }
      unsigned int v91 = v32;
      CFIndex location = CurrentTokenRange.location;
      CFIndex v34 = CurrentTokenRange.length;
      while (1)
      {
        v35 = [v5 string];
        id v36 = [v35 characterAtIndex:location];

        if (([v6 characterIsMember:v36] & 1) == 0 && (v36 | 2) != 0x2E) {
          break;
        }
        ++location;
        if (!--v34) {
          goto LABEL_21;
        }
      }
      int v28 = 0;
LABEL_21:
      int v88 = v28;
      CFIndex length = CurrentTokenRange.length;
      int v37 = v91;
LABEL_23:
      int v99 = v37 ^ 1;
      if (((v103 | v37 ^ 1) & 1) == 0)
      {
        id v38 = (id)CurrentTokenPartOfSpeech;
        goto LABEL_27;
      }
LABEL_26:
      id v39 = objc_msgSend(v5, "string", v83);
      uint64_t v40 = objc_msgSend(v39, "substringWithRange:", CurrentTokenRange.location, length);

      id v38 = 0;
      id v24 = (void *)v40;
LABEL_27:
      uint64_t v41 = objc_msgSend(v5, "attributesAtIndex:effectiveRange:", CurrentTokenRange.location, 0, v83);
      if (CurrentTokenRange.location < 1)
      {
        id v42 = 0;
      }
      else
      {
        id v42 = [v5 attributesAtIndex:CurrentTokenRange.location - 1 effectiveRange:0];
      }
      if (length < 1)
      {
        uint64_t v92 = 0;
      }
      else
      {
        uint64_t v92 = [v5 attributesAtIndex:CurrentTokenRange.location + length - 1 effectiveRange:0];
      }
      unint64_t v102 = CurrentTokenRange.location + length;
      v94 = v42;
      v95 = v41;
      if (v42 && v41)
      {
        id v43 = [v42 objectForKey:@"token"];
        long long v44 = v41;
        uint64_t v45 = [v41 objectForKey:@"token"];
        long long v46 = (void *)v45;
        unsigned int v47 = 0;
        if (v43 && v45) {
          unsigned int v47 = [v43 isEqual:v45];
        }

        uint64_t v41 = v44;
      }
      else
      {
        unsigned int v47 = 0;
        if (!v41) {
          goto LABEL_42;
        }
      }
      [v41 objectForKey:@"partOfSpeech"];
      v49 = id v48 = v41;

      if (v49)
      {
        uint64_t v50 = [v48 objectForKey:@"partOfSpeech"];
        id v38 = [v50 integerValue];
      }
LABEL_42:
      if (v38 == (char *)&dword_C + 2) {
        unsigned int v51 = 1;
      }
      else {
        unsigned int v51 = [&off_B850 containsObject:v24];
      }
      if ([v98 length]) {
        BOOL v52 = CurrentTokenRange.location == v96;
      }
      else {
        BOOL v52 = 0;
      }
      if (v52) {
        int v53 = v47;
      }
      else {
        int v53 = 1;
      }
      if (((v38 == &dword_4) & ~v93) == 0 && ((v90 | v89 | v53) & 1) == 0)
      {
        int v54 = (v93 ^ 1) & (v38 == (char *)&dword_8 + 2);
        if (v38 == &dword_C) {
          int v54 = 1;
        }
        if ((v54 | v51 | v88) & 1) == 0 && ((v93 ^ 1 | v37))
        {
          [v98 appendString:@" "];
          if ([v87 count]) {
            objc_msgSend(v87, "objectAtIndex:", (char *)objc_msgSend(v87, "count") - 1);
          }
          else {
          v55 = +[NSNumber numberWithInteger:v96 - 1];
          }
          [v87 addObject:v55];
        }
      }
      v97 = (int *)v38;
      unint64_t v56 = 0;
      uint64_t v57 = -1;
      uint64_t v17 = &CFLocaleCreate_ptr;
      unint64_t v58 = v102;
      while ((CurrentTokenRange.length & ~(CurrentTokenRange.length >> 63)) != v56)
      {
        uint64_t v59 = (unsigned char *)v56;
        if (v56 < (unint64_t)[v24 length])
        {
          id v60 = [v100 string];
          v61 = objc_msgSend(v60, "substringWithRange:", v58 + v57, 1);

          v62 = objc_msgSend(v24, "substringWithRange:", (char *)objc_msgSend(v24, "length") + v57, 1);
          id v63 = [(NSDictionary *)self->_kataToHira objectForKey:v61];
          v64 = v63;
          if (v63)
          {
            id v65 = v63;

            v61 = v65;
          }
          unsigned __int8 v66 = [v61 isEqual:v62];
          ++v56;

          --v57;
          uint64_t v17 = &CFLocaleCreate_ptr;
          unint64_t v58 = v102;
          if (v66) {
            continue;
          }
        }
        goto LABEL_69;
      }
      uint64_t v59 = (unsigned char *)(CurrentTokenRange.length & ~(CurrentTokenRange.length >> 63));
LABEL_69:
      id v12 = v87;
      if ([v24 length] != v59)
      {
        v67 = 0;
        do
        {
          int v68 = [v17[62] numberWithLong:CurrentTokenRange.location];
          [v87 addObject:v68];

          ++v67;
        }
        while ((unint64_t)v67 < (unsigned char *)[v24 length] - v59);
      }
      id v6 = v85;
      if (v59)
      {
        uint64_t v69 = (uint64_t)(v59 + 1);
        CFIndex v70 = CurrentTokenRange.location + CurrentTokenRange.length - (void)v59;
        do
        {
          v71 = [v17[62] numberWithInteger:v70];
          [v87 addObject:v71];

          --v69;
          ++v70;
        }
        while (v69 > 1);
      }
      v72 = [(ABTTranslator *)self _longVowelExpressedFor:v24 partOfSpeech:v97];

      if (v97 == &dword_4)
      {
        CFStringRef v74 = @"わ";
        id v5 = v100;
        v73 = (void *)v92;
        if (([v72 isEqual:@"は"] & 1) != 0
          || (CFStringRef v74 = @"え", [v72 isEqual:@"へ"]))
        {

          v72 = (void *)v74;
        }
      }
      else
      {
        id v5 = v100;
        v73 = (void *)v92;
      }
      [v98 appendString:v72];
      if (v73)
      {
        v75 = [v73 objectForKey:@"partOfSpeech"];

        if (v75)
        {
          v76 = [v73 objectForKey:@"partOfSpeech"];
          v97 = (int *)[v76 integerValue];
        }
      }
      BOOL v14 = v97 == (int *)((char *)&dword_8 + 3);
      if (v97 == (int *)((char *)&dword_C + 2)) {
        unsigned int v15 = 1;
      }
      else {
        unsigned int v15 = [&off_B868 containsObject:v72];
      }

      uint64_t v11 = tokenizer;
      CFStringTokenizerTokenType Token = CFStringTokenizerAdvanceToNextToken(tokenizer);
      CFIndex v13 = v58;
      BOOL v16 = v103;
      if (!Token) {
        goto LABEL_89;
      }
    }
  }
  unint64_t v58 = 0;
LABEL_89:
  v78 = (char *)objc_msgSend(v5, "length", v83) - v58;
  v79 = [v5 string];
  v80 = objc_msgSend(v79, "substringWithRange:", v58, v78);
  [v98 appendString:v80];

  for (; v58 < (unint64_t)[v5 length]; ++v58)
  {
    v81 = +[NSNumber numberWithInteger:v58];
    [v12 addObject:v81];
  }
  if (v84) {
    void *v84 = v12;
  }
  CFRelease(tokenizer);

  return v98;
}

- (id)_longVowelExpressedFor:(id)a3 partOfSpeech:(int64_t)a4
{
  id v5 = a3;
  if (([v5 isEqual:@"うろうろ"] & 1) != 0
    || [v5 isEqual:@"こうり"])
  {
    id v6 = v5;
    goto LABEL_4;
  }
  id v6 = (id)objc_opt_new();
  if ([v5 length])
  {
    unsigned __int8 v8 = 0;
    for (i = 0; i < [v5 length]; ++i)
    {
      objc_msgSend(v5, "substringWithRange:", i, 1);
      CFStringRef v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = v10;
      if (v8) {
        unsigned int v12 = [(__CFString *)v10 isEqual:@"う"];
      }
      else {
        unsigned int v12 = 0;
      }
      if (a4 == 1)
      {
        BOOL v13 = i == (char *)[v5 length] - 1;
        if (!v12) {
          goto LABEL_18;
        }
      }
      else
      {
        BOOL v13 = 0;
        if (!v12) {
          goto LABEL_18;
        }
      }
      if (v13)
      {
LABEL_18:
        BOOL v14 = v6;
        CFStringRef v15 = v11;
        goto LABEL_19;
      }
      BOOL v14 = v6;
      CFStringRef v15 = @"ー";
LABEL_19:
      [v14 appendString:v15];
      if ([&off_B880 containsObject:v11]) {
        unsigned __int8 v8 = 1;
      }
      else {
        unsigned __int8 v8 = [&off_B898 containsObject:v11];
      }
    }
  }
LABEL_4:

  return v6;
}

- (id)_brailleForProcessedText:(id)a3 locations:(id *)a4
{
  id v6 = a3;
  CFStringRef v7 = +[NSCharacterSet newlineCharacterSet];
  unsigned __int8 v8 = [v6 stringByTrimmingCharactersInSet:v7];

  int v9 = objc_opt_new();
  CFStringRef v10 = objc_opt_new();
  if (![v8 length]) {
    goto LABEL_231;
  }
  v73 = a4;
  uint64_t v74 = 0;
  int v11 = 0;
  char v78 = 0;
  BOOL v82 = 0;
  uint64_t v75 = 0;
  uint64_t v76 = 0;
  uint64_t v72 = 0;
  uint64_t v12 = 0;
  uint64_t v77 = -1;
  v79 = v9;
  v80 = self;
  do
  {
    __darwin_ct_rune_t v13 = [v8 characterAtIndex:v12];
    v84 = objc_msgSend(v8, "substringWithRange:", v12, 1);
    if ([v9 length]) {
      BOOL v14 = objc_msgSend(v9, "characterAtIndex:", (char *)objc_msgSend(v9, "length") - 1) == 10240;
    }
    else {
      BOOL v14 = 0;
    }
    if (v13 == 32)
    {
      if (v11 == 2 && v82)
      {
        unint64_t v15 = v12 + 1;
        do
        {
          unint64_t v16 = v15;
          if (v15 >= (unint64_t)[v8 length]) {
            break;
          }
          unsigned int v17 = [v8 characterAtIndex:v16];
          unint64_t v15 = v16 + 1;
        }
        while (v17 == 32);
        if (v16 >= (unint64_t)[v8 length])
        {
          int v11 = 2;
          BOOL v82 = 1;
        }
        else
        {
          unsigned int v18 = objc_msgSend(v8, "substringWithRange:", v16, 1);
          CFIndex v19 = [(NSDictionary *)self->_romajiToBraille objectForKey:v18];
          BOOL v82 = v19 != 0;

          if (v19)
          {
            int v11 = 2;
          }
          else
          {
            [v9 appendString:@"⠴"];
            uint64_t v41 = objc_msgSend(v10, "objectAtIndex:", (char *)objc_msgSend(v10, "count") - 1);
            [v10 addObject:v41];

            int v11 = 0;
          }
        }
      }
      int v83 = v11;
      [v9 appendString:@"⠀"];
      id v36 = +[NSNumber numberWithInteger:v12];
      [v10 addObject:v36];
      goto LABEL_96;
    }
    if (!v11)
    {
      unsigned int v20 = &CFLocaleCreate_ptr;
      if (v13 > 0x7F)
      {
        if (__maskrune(v13, 0x100uLL)) {
          goto LABEL_43;
        }
        __uint32_t v22 = __maskrune(v13, 0x400uLL);
      }
      else
      {
        if ((_DefaultRuneLocale.__runetype[v13] & 0x100) != 0) {
          goto LABEL_43;
        }
        __uint32_t v22 = _DefaultRuneLocale.__runetype[v13] & 0x400;
      }
      BOOL v28 = v22 != 0;
      BOOL v29 = v82;
      if (v22) {
        goto LABEL_78;
      }
      goto LABEL_140;
    }
    unsigned int v20 = &CFLocaleCreate_ptr;
    if (v11 != 1)
    {
      if (v82 || v13 != 45)
      {
        if (v82) {
          goto LABEL_64;
        }
        if (v14)
        {
          if (v13 > 0x7F) {
            __uint32_t v21 = __maskrune(v13, 0x100uLL);
          }
          else {
            __uint32_t v21 = _DefaultRuneLocale.__runetype[v13] & 0x100;
          }
          BOOL v46 = v21 != 0;
        }
        else
        {
          BOOL v46 = 0;
        }
        if (v13 <= 0x3B && ((1 << v13) & 0xC00F00000000000) != 0 || v13 == 8212 || v13 == 8230 || v46)
        {
          if (v77 == -1)
          {
            BOOL v82 = 0;
          }
          else
          {
            BOOL v82 = 1;
            objc_msgSend(v9, "replaceCharactersInRange:withString:", v77, 1, @"⠦");
          }
LABEL_105:
          if (v78)
          {
            if ((v13 - 97) <= 0x19)
            {
              unsigned int v32 = v9;
              CFStringRef v33 = @"⠰";
LABEL_50:
              [v32 appendString:v33];
              char v78 = 0;
              goto LABEL_51;
            }
            char v78 = 1;
LABEL_52:
            v35 = [(NSDictionary *)self->_romajiToBraille objectForKey:v84];
            if (!v35) {
              v35 = self->_unknownPlaceholder;
            }
            id v36 = (__CFString *)v35;
            uint64_t v37 = 0;
            uint64_t v38 = 0;
            uint64_t v39 = 0;
            int v40 = 2;
LABEL_83:
            int v83 = v40;
            goto LABEL_84;
          }
LABEL_44:
          if ((v13 - 65) > 0x19)
          {
            char v78 = 0;
          }
          else
          {
            if (v12 + 1 >= (unint64_t)[v8 length]
              || [v8 characterAtIndex:v12 + 1] - 65 > 0x19)
            {
              unsigned int v32 = v9;
              CFStringRef v33 = @"⠠";
              goto LABEL_50;
            }
            [v9 appendString:@"⠠⠠"];
            id v31 = [v20[62] numberWithInteger:v12];
            [v10 addObject:v31];

            char v78 = 1;
LABEL_51:
            CFIndex v34 = [v20[62] numberWithInteger:v12];
            [v10 addObject:v34];
          }
          goto LABEL_52;
        }
        if (v13 > 0x7F)
        {
          BOOL v82 = 0;
          if (__maskrune(v13, 0x100uLL) || (v13 & 0xFFFE) == 0x2E) {
            goto LABEL_105;
          }
          __uint32_t v56 = __maskrune(v13, 0x400uLL);
        }
        else
        {
          BOOL v82 = 0;
          if ((_DefaultRuneLocale.__runetype[v13] & 0x100) != 0 || (v13 & 0xFFFE) == 0x2E) {
            goto LABEL_105;
          }
          __uint32_t v56 = _DefaultRuneLocale.__runetype[v13] & 0x400;
        }
        BOOL v28 = v56 != 0;
        if (v56) {
          char v60 = 1;
        }
        else {
          char v60 = v14;
        }
        if (v60) {
          goto LABEL_77;
        }
        BOOL v82 = 0;
        if (v13 <= 12288)
        {
          if (v13 != 38 && v13 != 64) {
            goto LABEL_71;
          }
        }
        else if ((v13 - 12289) >= 2 && v13 != 65281 && v13 != 65311)
        {
          goto LABEL_71;
        }
        goto LABEL_140;
      }
      if (v12 >= (unint64_t)[v8 length])
      {
        unsigned int v26 = 45;
        unint64_t v24 = v12;
      }
      else
      {
        unint64_t v24 = v12;
        do
        {
          unsigned int v25 = [v8 characterAtIndex:v24];
          unsigned int v26 = v25;
          if (v25 > 0x7F) {
            __uint32_t v27 = __maskrune(v25, 0x100uLL);
          }
          else {
            __uint32_t v27 = _DefaultRuneLocale.__runetype[v25] & 0x100;
          }
          if (v26 - 48 <= 0xFFFFFFFC && !v27) {
            break;
          }
          ++v24;
        }
        while (v24 < (unint64_t)[v8 length]);
      }
      if (v24 >= (unint64_t)[v8 length])
      {
LABEL_122:
        [v9 appendString:@"⠤"];
        id v36 = +[NSNumber numberWithInteger:v12];
        [v10 addObject:v36];
        BOOL v82 = 0;
        int v83 = 0;
        goto LABEL_96;
      }
      if (v26 > 0x3B) {
        goto LABEL_121;
      }
      if (((1 << v26) & 0xC00F00000000000) != 0) {
        goto LABEL_62;
      }
      if (v26 == 32)
      {
        unint64_t v57 = v24 + 1;
        if (v57 >= (unint64_t)[v8 length]) {
          goto LABEL_122;
        }
        unsigned int v58 = [v8 characterAtIndex:v57];
        if (!(v58 > 0x7F ? __maskrune(v58, 0x100uLL) : _DefaultRuneLocale.__runetype[v58] & 0x100)) {
          goto LABEL_122;
        }
      }
      else
      {
LABEL_121:
        if (v26 != 8212 && v26 != 8230) {
          goto LABEL_122;
        }
      }
LABEL_62:
      if (v77 == -1) {
        goto LABEL_122;
      }
      objc_msgSend(v9, "replaceCharactersInRange:withString:", v77, 1, @"⠦");
LABEL_64:
      id v42 = [(NSDictionary *)self->_romajiToBraille objectForKey:v84];

      if (v42)
      {
        BOOL v82 = 1;
        unsigned int v20 = &CFLocaleCreate_ptr;
        goto LABEL_105;
      }
      [v9 appendString:@"⠴"];
      long long v44 = objc_msgSend(v10, "objectAtIndex:", (char *)objc_msgSend(v10, "count") - 1);
      [v10 addObject:v44];
      if (v13 > 0x7F) {
        __uint32_t v45 = __maskrune(v13, 0x400uLL);
      }
      else {
        __uint32_t v45 = _DefaultRuneLocale.__runetype[v13] & 0x400;
      }
      BOOL v28 = v45 != 0;

LABEL_77:
      BOOL v29 = 0;
LABEL_78:
      BOOL v82 = v29;
      if (!v28) {
        goto LABEL_140;
      }
      [v9 appendString:@"⠼"];
      unsigned int v47 = +[NSNumber numberWithInteger:v12];
      [v10 addObject:v47];

LABEL_80:
      id v48 = [(NSDictionary *)self->_numberToBraille objectForKey:v84];
      if (!v48) {
        id v48 = self->_unknownPlaceholder;
      }
      id v36 = (__CFString *)v48;
      uint64_t v37 = 0;
      uint64_t v38 = 0;
      uint64_t v39 = 0;
      int v40 = 1;
      goto LABEL_83;
    }
    if (v13 > 0x7F)
    {
      if (__maskrune(v13, 0x100uLL))
      {
LABEL_43:
        uint64_t v77 = (uint64_t)[v9 length];
        [v9 appendString:@"⠰"];
        unsigned int v30 = [v20[62] numberWithInteger:v12];
        [v10 addObject:v30];

        goto LABEL_44;
      }
      if (__maskrune(v13, 0x400uLL)) {
        goto LABEL_80;
      }
    }
    else
    {
      __uint32_t v23 = _DefaultRuneLocale.__runetype[v13];
      if ((v23 & 0x100) != 0) {
        goto LABEL_43;
      }
      if ((v23 & 0x400) != 0) {
        goto LABEL_80;
      }
    }
    if ((v13 | 2) == 0x2E) {
      goto LABEL_80;
    }
    if (!v14 && [&off_B8B0 containsObject:v84] && v12 > 0)
    {
LABEL_71:
      [v9 appendString:@"⠤"];
      id v43 = objc_msgSend(v10, "objectAtIndex:", (char *)objc_msgSend(v10, "count") - 1);
      [v10 addObject:v43];
    }
LABEL_140:
    if (v12 + 1 < (unint64_t)[v8 length]
      && (objc_msgSend(v8, "substringWithRange:", v12, 2),
          v61 = objc_claimAutoreleasedReturnValue(),
          [(NSDictionary *)self->_kanaToBraille objectForKey:v61],
          id v36 = (__CFString *)objc_claimAutoreleasedReturnValue(),
          v61,
          v36))
    {
      uint64_t v37 = 0;
      uint64_t v38 = 0;
      int v83 = 0;
      uint64_t v39 = 1;
    }
    else
    {
      if (v13 <= 8220)
      {
        if (v13 == 40)
        {
          uint64_t v37 = 0;
          uint64_t v38 = 0;
          uint64_t v39 = 0;
          int v83 = 0;
          if (v74 <= 0) {
            id v36 = @"⠶";
          }
          else {
            id v36 = @"⠰⠶";
          }
          ++v74;
          goto LABEL_84;
        }
        if (v13 == 41)
        {
          uint64_t v37 = 0;
          uint64_t v38 = 0;
          uint64_t v39 = 0;
          int v83 = 0;
          if (v74 <= 1) {
            id v36 = @"⠶";
          }
          else {
            id v36 = @"⠶⠆";
          }
          v74 -= v74 > 0;
          goto LABEL_84;
        }
      }
      else
      {
        switch(v13)
        {
          case 8221:
            goto LABEL_167;
          case 12301:
            uint64_t v37 = 0;
            uint64_t v38 = 0;
            uint64_t v39 = 0;
            int v83 = 0;
            if (v75 <= 1) {
              id v36 = @"⠤";
            }
            else {
              id v36 = @"⠤⠆";
            }
            v75 -= v75 > 0;
            goto LABEL_84;
          case 12300:
            uint64_t v37 = 0;
            uint64_t v38 = 0;
            uint64_t v39 = 0;
            int v83 = 0;
            if (v75 <= 0) {
              id v36 = @"⠤";
            }
            else {
              id v36 = @"⠰⠤";
            }
            ++v75;
            goto LABEL_84;
        }
      }
      if (v13 == 34 && v76 >= 1)
      {
LABEL_167:
        uint64_t v37 = 0;
        uint64_t v38 = 0;
        uint64_t v39 = 0;
        int v83 = 0;
        --v76;
LABEL_168:
        id v36 = @"⠠⠆";
        goto LABEL_84;
      }
      BOOL v63 = v13 == 34 && v76 == 0;
      if (v13 == 8220 || v63)
      {
        uint64_t v37 = 0;
        uint64_t v38 = 0;
        uint64_t v39 = 0;
        int v83 = 0;
        ++v76;
LABEL_182:
        id v36 = @"⠰⠄";
        goto LABEL_84;
      }
      if (v13 == 8217 || v13 == 39 && v72 >= 1)
      {
        uint64_t v37 = 0;
        uint64_t v38 = 0;
        uint64_t v39 = 0;
        int v83 = 0;
        --v72;
        goto LABEL_168;
      }
      BOOL v65 = v13 == 39 && v72 == 0;
      if (v13 == 8216 || v65)
      {
        uint64_t v37 = 0;
        uint64_t v38 = 0;
        uint64_t v39 = 0;
        int v83 = 0;
        ++v72;
        goto LABEL_182;
      }
      if (v13 <= 125)
      {
        uint64_t v37 = 0;
        uint64_t v39 = 0;
        int v83 = 0;
        CFStringRef v66 = @"⠰⠯";
        uint64_t v38 = 1;
        id v36 = @"⠰⠏";
        switch(v13)
        {
          case '#':
            uint64_t v37 = 0;
            uint64_t v39 = 0;
            int v83 = 0;
            uint64_t v38 = 1;
            id v36 = @"⠰⠩";
            goto LABEL_84;
          case '$':
          case '\'':
          case '(':
          case ')':
          case '+':
          case '-':
            goto LABEL_218;
          case '%':
            goto LABEL_84;
          case '&':
            goto LABEL_212;
          case '*':
            uint64_t v37 = 0;
            uint64_t v39 = 0;
            int v83 = 0;
            uint64_t v38 = 1;
            id v36 = @"⠰⠡";
            goto LABEL_84;
          case ',':
            goto LABEL_206;
          case '.':
            uint64_t v39 = 0;
            int v83 = 0;
            uint64_t v37 = 1;
            uint64_t v38 = 1;
            goto LABEL_226;
          case '/':
            uint64_t v37 = 0;
            uint64_t v38 = 0;
            uint64_t v39 = 0;
            int v83 = 0;
            id v36 = @"⠌";
            goto LABEL_84;
          default:
            if (v13 != 64) {
              goto LABEL_218;
            }
            CFStringRef v66 = @"⠰⠪";
LABEL_212:
            char v67 = v12 < 1 || v14;
            if ((v67 & 1) == 0)
            {
              [v9 appendString:@"⠀"];
              int v68 = objc_msgSend(v10, "objectAtIndex:", (char *)objc_msgSend(v10, "count") - 1);
              [v10 addObject:v68];
            }
            uint64_t v39 = 0;
            int v83 = 0;
            uint64_t v37 = 1;
            uint64_t v38 = 1;
            id v36 = (__CFString *)v66;
            break;
        }
        goto LABEL_84;
      }
      if (v13 > 12289)
      {
        if (v13 > 65280)
        {
          if (v13 == 65281)
          {
            uint64_t v39 = 0;
            int v83 = 0;
            uint64_t v37 = 2;
            uint64_t v38 = 2;
            id v36 = @"⠖";
          }
          else
          {
            if (v13 != 65311) {
              goto LABEL_218;
            }
            uint64_t v39 = 0;
            int v83 = 0;
            uint64_t v37 = 2;
            uint64_t v38 = 2;
            id v36 = @"⠢";
          }
        }
        else
        {
          if (v13 == 12290)
          {
            uint64_t v39 = 0;
            int v83 = 0;
            uint64_t v37 = 2;
            uint64_t v38 = 2;
LABEL_226:
            id v36 = @"⠲";
            goto LABEL_84;
          }
          if (v13 != 12539)
          {
LABEL_218:
            uint64_t v69 = [(NSDictionary *)v80->_kanaToBraille objectForKey:v84];
            if (!v69) {
              uint64_t v69 = v80->_unknownPlaceholder;
            }
            id v36 = v69;
            uint64_t v37 = 0;
            uint64_t v38 = 0;
            uint64_t v39 = 0;
            int v83 = 0;
            goto LABEL_84;
          }
          uint64_t v39 = 0;
          int v83 = 0;
          uint64_t v37 = 1;
          uint64_t v38 = 1;
          id v36 = @"⠐";
        }
      }
      else if (v13 > 8450)
      {
        if (v13 == 8451)
        {
          uint64_t v37 = 0;
          uint64_t v39 = 0;
          int v83 = 0;
          uint64_t v38 = 1;
          id v36 = @"⠰⠙⠠⠉";
        }
        else
        {
          if (v13 != 12289) {
            goto LABEL_218;
          }
LABEL_206:
          uint64_t v39 = 0;
          int v83 = 0;
          uint64_t v37 = 1;
          uint64_t v38 = 1;
          id v36 = @"⠰";
        }
      }
      else if (v13 == 126)
      {
        uint64_t v37 = 0;
        uint64_t v38 = 0;
        uint64_t v39 = 0;
        int v83 = 0;
        id v36 = @"⠤⠤";
      }
      else
      {
        if (v13 != 176) {
          goto LABEL_218;
        }
        uint64_t v37 = 0;
        uint64_t v39 = 0;
        int v83 = 0;
        uint64_t v38 = 1;
        id v36 = @"⠰⠙";
      }
    }
LABEL_84:
    uint64_t v81 = v39;
    [v9 appendString:v36];
    if ([(__CFString *)v36 length])
    {
      unint64_t v49 = 0;
      do
      {
        uint64_t v50 = +[NSNumber numberWithInteger:v12];
        [v10 addObject:v50];

        ++v49;
      }
      while (v49 < (unint64_t)[(__CFString *)v36 length]);
    }
    if (v12 + 1 < (unint64_t)[v8 length])
    {
      unsigned int v51 = objc_msgSend(v8, "substringWithRange:", v12 + 1, 1);
      BOOL v52 = [(NSDictionary *)v80->_kanaToBraille objectForKey:v51];

      if (v52) {
        uint64_t v37 = v38;
      }
    }
    if (v12 + 1 < (unint64_t)[v8 length])
    {
      int v53 = objc_msgSend(v8, "substringWithRange:", v12 + 1, 1);
      unsigned __int8 v54 = [&off_B8C8 containsObject:v53];
      if (v37 && (v54 & 1) == 0)
      {
        do
        {
          [v79 appendString:@"⠀"];
          v55 = +[NSNumber numberWithInteger:v12];
          [v10 addObject:v55];

          --v37;
        }
        while (v37);
      }
    }
    self = v80;
    v12 += v81;
    int v9 = v79;
LABEL_96:

    ++v12;
    int v11 = v83;
  }
  while (v12 < (unint64_t)[v8 length]);
  a4 = v73;
  if (v82)
  {
    [v9 appendString:@"⠴"];
    CFIndex v70 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)[v8 length] - 1);
    [v10 addObject:v70];
  }
LABEL_231:
  if (a4) {
    *a4 = v10;
  }

  return v9;
}

- (id)_textForPrintBraille:(id)a3
{
  id v3 = a3;
  id v40 = (id)objc_opt_new();
  if ([v3 length])
  {
    int v4 = 0;
    int v5 = 0;
    uint64_t v39 = 0;
    uint64_t v36 = 0;
    char v38 = 0;
    for (unint64_t i = 0; i < (unint64_t)[v3 length]; ++i)
    {
      CFStringRef v7 = objc_msgSend(v3, "substringWithRange:", i, 1);
      unsigned __int8 v8 = &stru_93A0;
      if (i + 1 < (unint64_t)[v3 length])
      {
        objc_msgSend(v3, "substringWithRange:", i, 2);
        unsigned __int8 v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      int v9 = &stru_93A0;
      if (i + 2 < (unint64_t)[v3 length])
      {
        objc_msgSend(v3, "substringWithRange:", i, 3);
        int v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      if ([v7 isEqual:@"⠀"])
      {
        if (v4)
        {
          if (v4 != 2) {
            goto LABEL_22;
          }
          if ((v5 & 1) == 0) {
            goto LABEL_21;
          }
        }
        [v40 appendString:@" "];
      }
      else if (i + 1 < (unint64_t)[v3 length] {
             && [v7 isEqual:@"⠰"]
      }
             && (v4
              || ([(NSDictionary *)self->_brailleToKana objectForKey:v8],
                  CFStringRef v10 = objc_claimAutoreleasedReturnValue(),
                  v10,
                  !v10)))
      {
        uint64_t v39 = 0;
        int v4 = 2;
      }
      else if ([v7 isEqual:@"⠦"])
      {
        char v38 = 0;
        uint64_t v39 = 0;
        int v4 = 2;
        int v5 = 1;
      }
      else
      {
        if (v5 & 1) != 0 && ([v7 isEqual:@"⠴"]) {
          goto LABEL_21;
        }
        if ([v7 isEqual:@"⠼"])
        {
          int v4 = 1;
          goto LABEL_23;
        }
        if ([v7 isEqual:@"⠤"]
          && ([(__CFString *)v8 isEqual:@"⠤⠤"] & 1) == 0)
        {
          if (v4 == 1) {
            goto LABEL_22;
          }
          if (v4 != 2)
          {
            [(__CFString *)v8 isEqual:@"⠠⠠"];
            [v7 isEqual:@"⠠"];
            BOOL v11 = 0;
            goto LABEL_42;
          }
          if ((v5 & 1) == 0)
          {
LABEL_21:
            int v5 = 0;
LABEL_22:
            int v4 = 0;
            goto LABEL_23;
          }
        }
        BOOL v11 = v4 == 2;
        if ([(__CFString *)v8 isEqual:@"⠠⠠"] && v4 == 2)
        {
          int v4 = 2;
          HIDWORD(v39) = 1;
          ++i;
        }
        else
        {
          if (![v7 isEqual:@"⠠"] || v4 != 2)
          {
            if (v4 == 1)
            {
              uint64_t v12 = [(NSDictionary *)self->_brailleToNumber objectForKey:v7];
              BOOL v13 = v12 != 0;

              int v14 = 1;
              int v4 = v13;
              goto LABEL_43;
            }
LABEL_42:
            int v14 = !v11;
LABEL_43:
            if ((v14 | v5))
            {
              if (v14) {
                int v15 = v4;
              }
              else {
                int v15 = 2;
              }
              if (v15 != 2)
              {
                if (v15 != 1) {
                  goto LABEL_55;
                }
                __uint32_t v27 = [(NSDictionary *)self->_brailleToNumber objectForKey:v7];
                BOOL v28 = v27;
                if (v27) {
                  __uint32_t v21 = v27;
                }
                else {
                  __uint32_t v21 = &stru_93A0;
                }

                uint64_t v22 = 0;
                int v4 = 1;
LABEL_85:
                [v40 appendString:v21];
                i += v22;

                goto LABEL_23;
              }
LABEL_57:
              if ((v5 & 1) != 0 && [v7 isEqual:@"⠶"])
              {
                unsigned int v20 = CFSTR("(");
                if (v38) {
                  unsigned int v20 = @"");
                }
                __uint32_t v21 = v20;
                v38 ^= 1u;
LABEL_62:
                uint64_t v22 = 0;
                int v4 = 2;
                goto LABEL_85;
              }
              uint64_t v23 = [(NSDictionary *)self->_brailleToRomaji objectForKey:v9];
              if (v23)
              {
                __uint32_t v21 = (__CFString *)v23;
                int v4 = 2;
                uint64_t v22 = 2;
                goto LABEL_85;
              }
              uint64_t v29 = [(NSDictionary *)self->_brailleToRomaji objectForKey:v8];
              if (!v29)
              {
                id v31 = [(NSDictionary *)self->_brailleToRomaji objectForKey:v7];
                if (!v31)
                {
                  uint64_t v22 = 0;
                  int v4 = 2;
                  __uint32_t v21 = &stru_93A0;
                  goto LABEL_85;
                }
                __uint32_t v21 = v31;
                if ((v39 | HIDWORD(v39)))
                {
                  uint64_t v35 = [(__CFString *)v31 uppercaseString];

                  LODWORD(v39) = 0;
                  uint64_t v22 = 0;
                  int v4 = 2;
                  __uint32_t v21 = (__CFString *)v35;
                  goto LABEL_85;
                }
                LODWORD(v39) = 0;
                goto LABEL_62;
              }
              __uint32_t v21 = (__CFString *)v29;
              int v4 = 2;
            }
            else
            {
              unsigned __int8 v34 = [v7 isEqual:@"⠠"];
              unsigned __int8 v33 = [v7 isEqual:@"⠶"];
              unint64_t v16 = [(NSDictionary *)self->_brailleToRomaji objectForKey:v7];

              unsigned int v17 = [(NSDictionary *)self->_brailleToRomaji objectForKey:v8];

              unsigned int v18 = [(NSDictionary *)self->_brailleToRomaji objectForKey:v9];

              if ((v34 & 1) != 0 || (v33 & 1) != 0 || v16 || v17 || v18) {
                goto LABEL_57;
              }
LABEL_55:
              CFIndex v19 = [(NSDictionary *)self->_brailleToKana objectForKey:v8];
              if (v19)
              {
              }
              else if ([v7 isEqual:@"⠤"])
              {
                unint64_t v24 = @"「";
                if (v36) {
                  unint64_t v24 = @"」";
                }
                __uint32_t v21 = v24;
                int v4 = 0;
                uint64_t v22 = 0;
                LOBYTE(v36) = v36 ^ 1;
                goto LABEL_85;
              }
              if ([v7 isEqual:@"⠶"])
              {
                unsigned int v25 = @"（";
                if ((v36 & 0x100000000) != 0) {
                  unsigned int v25 = @"）";
                }
                __uint32_t v21 = v25;
                int v4 = 0;
                BYTE4(v36) ^= 1u;
                uint64_t v22 = 0;
                goto LABEL_85;
              }
              uint64_t v26 = [(NSDictionary *)self->_brailleToKana objectForKey:v8];
              if (!v26)
              {
                uint64_t v30 = [(NSDictionary *)self->_brailleToKana objectForKey:v7];
                int v4 = 0;
                uint64_t v22 = 0;
                if (v30) {
                  __uint32_t v21 = (__CFString *)v30;
                }
                else {
                  __uint32_t v21 = &stru_93A0;
                }
                goto LABEL_85;
              }
              __uint32_t v21 = (__CFString *)v26;
              int v4 = 0;
            }
            uint64_t v22 = 1;
            goto LABEL_85;
          }
          int v4 = 2;
          LODWORD(v39) = 1;
        }
      }
LABEL_23:
    }
  }

  return v40;
}

- (id)processKanjiNumbers:(id)a3 locations:(id *)a4
{
  id v6 = a3;
  id v7 = [objc_alloc((Class)NSAttributedString) initWithString:v6];

  unsigned __int8 v8 = [(ABTTranslator *)self _processKanjiNumbers:v7 locations:a4];
  int v9 = [v8 string];

  return v9;
}

- (id)replaceWords:(id)a3 locations:(id *)a4
{
  int v4 = [(ABTTranslator *)self _replaceWords:a3 locations:a4];
  int v5 = [v4 string];

  return v5;
}

- (id)applyNumeralReadings:(id)a3 locations:(id *)a4
{
  id v6 = a3;
  id v7 = [objc_alloc((Class)NSAttributedString) initWithString:v6];

  unsigned __int8 v8 = [(ABTTranslator *)self _applyNumeralReadings:v7 locations:a4];
  int v9 = [v8 string];

  return v9;
}

- (id)textForPrintBraille:(id)a3
{
  return [(ABTTranslator *)self _textForPrintBraille:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownPlaceholder, 0);
  objc_storeStrong((id *)&self->_brailleToRomaji, 0);
  objc_storeStrong((id *)&self->_brailleToNumber, 0);
  objc_storeStrong((id *)&self->_brailleToKana, 0);
  objc_storeStrong((id *)&self->_romajiToBraille, 0);
  objc_storeStrong((id *)&self->_numberToBraille, 0);
  objc_storeStrong((id *)&self->_kanaToBraille, 0);
  objc_storeStrong((id *)&self->_numeralInfo, 0);
  objc_storeStrong((id *)&self->_rules, 0);
  objc_storeStrong((id *)&self->_normalizer, 0);

  objc_storeStrong((id *)&self->_kataToHira, 0);
}

@end