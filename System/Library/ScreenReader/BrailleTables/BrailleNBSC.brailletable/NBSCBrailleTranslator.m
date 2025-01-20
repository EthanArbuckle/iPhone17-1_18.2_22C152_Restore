@interface NBSCBrailleTranslator
+ (id)sharedInstance;
- (BOOL)activeTableSupportsContractedBraille;
- (BOOL)activeTableSupportsEightDotBraille;
- (BOOL)activeTableSupportsIPA;
- (BOOL)activeTableSupportsTechnicalBraille;
- (NBSCBrailleTranslator)init;
- (id).cxx_construct;
- (id)activeTable;
- (id)printBrailleForText:(id)a3 mode:(unint64_t)a4 locations:(id *)a5 textPositionsRange:(_NSRange)a6 textFormattingRanges:(id)a7;
- (id)textForPrintBraille:(id)a3 mode:(unint64_t)a4 locations:(id *)a5;
- (unint64_t)interfaceVersion;
@end

@implementation NBSCBrailleTranslator

+ (id)sharedInstance
{
  v2 = (void *)_sharedInstance;
  if (!_sharedInstance)
  {
    v3 = objc_alloc_init(NBSCBrailleTranslator);
    v4 = (void *)_sharedInstance;
    _sharedInstance = (uint64_t)v3;

    v2 = (void *)_sharedInstance;
  }

  return v2;
}

- (NBSCBrailleTranslator)init
{
  v19.receiver = self;
  v19.super_class = (Class)NBSCBrailleTranslator;
  v2 = [(NBSCBrailleTranslator *)&v19 init];
  _initialized = 0;
  if (v2)
  {
    _initialized = 1;
    v3 = +[NSBundle bundleForClass:objc_opt_class()];
    v4 = [v3 resourcePath];
    id v5 = [v4 stringByAppendingString:@"/"];
    v6 = (char *)[v5 UTF8String];

    if (Init(v6))
    {
      _initialized = 0;
      v7 = NBSCLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_25A28();
      }
    }
    v8 = +[NSBundle bundleForClass:objc_opt_class()];
    v9 = [v8 pathForResource:@"HanKataToZenHira" ofType:@"plist"];

    uint64_t v10 = +[NSDictionary dictionaryWithContentsOfFile:v9];
    hanKataToZenHira = v2->_hanKataToZenHira;
    v2->_hanKataToZenHira = (NSDictionary *)v10;

    if (!v2->_hanKataToZenHira)
    {
      _initialized = 0;
      v12 = NBSCLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_259B0((uint64_t)v9, v12);
      }
    }
    v13 = +[NSBundle bundleForClass:objc_opt_class()];
    id v14 = [v13 pathForResource:@"kan" ofType:@"dat"];
    v15 = (const char *)[v14 UTF8String];

    if (CToText::Init(&v2->_brlToText, v15))
    {
      _initialized = 0;
      v16 = NBSCLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_25948();
      }
    }
    if (CToText::SetConvertMode(&v2->_brlToText, 0))
    {
      _initialized = 0;
      v17 = NBSCLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_258E0();
      }
    }
  }
  return v2;
}

- (unint64_t)interfaceVersion
{
  return 7;
}

- (id)activeTable
{
  return @"jpn";
}

- (BOOL)activeTableSupportsContractedBraille
{
  return 0;
}

- (BOOL)activeTableSupportsEightDotBraille
{
  return 0;
}

- (BOOL)activeTableSupportsTechnicalBraille
{
  return 0;
}

- (BOOL)activeTableSupportsIPA
{
  return 0;
}

- (id)printBrailleForText:(id)a3 mode:(unint64_t)a4 locations:(id *)a5 textPositionsRange:(_NSRange)a6 textFormattingRanges:(id)a7
{
  id v27 = a3;
  id v25 = a7;
  if (_initialized)
  {
    id v8 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithCapacity:", 8 * (void)objc_msgSend(v27, "length"));
    for (unint64_t i = 0; i < (unint64_t)[v27 length]; ++i)
    {
      v33[0] = i;
      [v8 appendBytes:v33 length:8];
    }
    id v23 = [objc_alloc((Class)BRLTEmojiPrintPreprocessor) initWithPrimaryLanguageCode:@"ja-JP"];
    v24 = objc_opt_new();
    id v10 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v23, v24, 0, v8);
    v26 = v8;
    id v11 = v27;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v12 = v10;
    id v13 = [v12 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v30;
      v15 = v26;
      do
      {
        v16 = 0;
        v17 = v15;
        v18 = v11;
        do
        {
          if (*(void *)v30 != v14) {
            objc_enumerationMutation(v12);
          }
          objc_super v19 = *(void **)(*((void *)&v29 + 1) + 8 * (void)v16);
          id v28 = 0;
          id v11 = [v19 preprocessPrintString:v18 withLocationMap:&v28 isEightDot:1 textFormattingRanges:0];
          id v20 = v28;

          v15 = +[BRLTPreprocessorHelper mergeLocationMap:v17 withLocationMap:v20];

          v16 = (char *)v16 + 1;
          v17 = v15;
          v18 = v11;
        }
        while (v13 != v16);
        id v13 = [v12 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v13);
    }
    else
    {
      v15 = v26;
    }

    if ([v11 length]) {
      operator new[]();
    }
  }
  else
  {
    v21 = NBSCLog();
    v26 = v21;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_25A90(v21);
    }
  }

  return &stru_2C350;
}

- (id)textForPrintBraille:(id)a3 mode:(unint64_t)a4 locations:(id *)a5
{
  v26 = a5;
  id v6 = a3;
  id v28 = objc_opt_new();
  for (unint64_t i = 0; i < objc_msgSend(v6, "length", v26); ++i)
  {
    LOWORD(v34[0]) = 0;
    LOWORD(v34[0]) = (unsigned __int16)[v6 characterAtIndex:i];
    id v8 = +[NSString stringWithCharacters:v34 length:1];
    [v28 appendString:v8];
    if (i == (char *)[v6 length] - 1)
    {
      if ([&off_2C478 containsObject:v8]) {
        [v28 appendString:@"⠀"];
      }
    }
  }
  id v27 = v28;

  v31[0] = 0;
  v31[1] = v34;
  long long v32 = (unint64_t)&v33;
  CToText::SetConvertMode(&self->_brlToText, 0);
  uint64_t v30 = 0;
  id v29 = objc_alloc_init((Class)NSMutableString);
  id v9 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithCapacity:", 8 * (void)objc_msgSend(v29, "length"));
  for (unint64_t j = 0; j < (unint64_t)[v27 length]; unint64_t j = ++v30)
  {
    unsigned int v11 = [v27 characterAtIndex:v30];
    if (v11 == 13) {
      break;
    }
    if (v11 >> 8 == 40)
    {
      LOBYTE(v31[0]) = v11;
      if (!CToText::BrlToText(&self->_brlToText, (uint64_t)v31))
      {
        if (v34[0])
        {
          int v12 = 0;
          id v13 = v34;
          do
          {
            uint64_t v14 = &v34[v12];
            int v16 = v14[1];
            v15 = v14 + 1;
            if (!v16) {
              goto LABEL_18;
            }
            v17 = +[NSString stringWithCharacters:v13 length:1];
            v18 = +[NSString stringWithCharacters:v15 length:1];
            objc_super v19 = [v17 stringByAppendingString:v18];
            id v20 = [(NSDictionary *)self->_hanKataToZenHira objectForKey:v19];
            if (v20)
            {
              [v29 appendString:v20];
              [v9 appendBytes:&v30 length:8];
              v12 += 2;
            }

            if (!v20)
            {
LABEL_18:
              v21 = +[NSString stringWithCharacters:&v34[v12] length:1];
              v22 = [(NSDictionary *)self->_hanKataToZenHira objectForKey:v21];
              id v23 = v22;
              if (v22)
              {
                id v24 = v22;

                v21 = v24;
              }
              [v29 appendString:v21];
              [v9 appendBytes:&v30 length:8];

              ++v12;
            }
            id v13 = &v34[v12];
          }
          while (*v13);
        }
      }
    }
  }
  if (v26) {
    id *v26 = v9;
  }

  return v29;
}

- (void).cxx_destruct
{
  CToText::~CToText(&self->_brlToText);

  objc_storeStrong((id *)&self->_hanKataToZenHira, 0);
}

- (id).cxx_construct
{
  return self;
}

@end