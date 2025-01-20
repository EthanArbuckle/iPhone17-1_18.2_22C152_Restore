@interface LiblouisEmojiPrintPreprocessor
- (LiblouisEmojiPrintPreprocessor)init;
- (id)preprocessPrintString:(id)a3 withLocationMap:(id *)a4 typeformData:(id)a5;
- (void)_setupLocale;
- (void)dealloc;
@end

@implementation LiblouisEmojiPrintPreprocessor

- (id)preprocessPrintString:(id)a3 withLocationMap:(id *)a4 typeformData:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (v7)
  {
    id v21 = v8;
    v9 = (char *)[v7 length];
    v10 = +[NSMutableString string];
    if (a4)
    {
      v11 = +[NSMutableData dataWithLength:0];
    }
    else
    {
      v11 = 0;
    }
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x2020000000;
    uint64_t v26 = 0;
    [v7 length];
    id v13 = v7;
    id v14 = v10;
    id v15 = v11;
    id v22 = v21;
    CEMEnumerateEmojiTokensInStringWithLocaleAndBlock();
    v16 = (char *)v24[3];
    if (v9 > v16)
    {
      id v17 = v14;
      id v18 = v15;
      v19 = objc_msgSend(v13, "substringWithRange:", v16, v9 - v16);
      [v17 appendString:v19];

      while (v9 != v16)
      {
        v27 = v16;
        [v18 appendBytes:&v27 length:8];
        ++v16;
      }
    }
    if (a4) {
      *a4 = v15;
    }
    id v12 = v14;

    _Block_object_dispose(&v23, 8);
    id v8 = v21;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (LiblouisEmojiPrintPreprocessor)init
{
  v6.receiver = self;
  v6.super_class = (Class)LiblouisEmojiPrintPreprocessor;
  v2 = [(LiblouisEmojiPrintPreprocessor *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(LiblouisEmojiPrintPreprocessor *)v2 _setupLocale];
    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v3 selector:"_setupLocale" name:kCFLocaleCurrentLocaleDidChangeNotification object:0];
  }
  return v3;
}

- (void)_setupLocale
{
  CFLocaleRef v3 = CFLocaleCopyCurrent();
  locale = self->_locale;
  if (locale)
  {
    CFRelease(locale);
    self->_locale = 0;
  }
  CFLocaleGetValue(v3, kCFLocaleLanguageCode);
  self->_locale = (__EmojiLocaleDataWrapper *)CEMCreateEmojiLocaleData();
  if (v3)
  {
    CFRelease(v3);
  }
}

- (void)dealloc
{
  locale = self->_locale;
  if (locale) {
    CFRelease(locale);
  }
  v4.receiver = self;
  v4.super_class = (Class)LiblouisEmojiPrintPreprocessor;
  [(LiblouisEmojiPrintPreprocessor *)&v4 dealloc];
}

@end