@interface VSSpeechCharacterSet
+ (id)languageMapping;
- (NSCharacterSet)characterSet;
- (VSSpeechCharacterSet)initWithLanguage:(id)a3;
- (id)unspeakableRangeOfText:(id)a3;
- (void)setCharacterSet:(id)a3;
@end

@implementation VSSpeechCharacterSet

- (void).cxx_destruct
{
}

- (void)setCharacterSet:(id)a3
{
}

- (NSCharacterSet)characterSet
{
  return self->_characterSet;
}

- (id)unspeakableRangeOfText:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263EFF980] array];
  if ([v4 length])
  {
    unint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      v9 = [(VSSpeechCharacterSet *)self characterSet];
      int v10 = objc_msgSend(v9, "characterIsMember:", objc_msgSend(v4, "characterAtIndex:", v6));

      if (!v10 || v8 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
          char v12 = 1;
        }
        else {
          char v12 = v10;
        }
        if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v13 = v6;
        }
        else {
          uint64_t v13 = v8;
        }
        if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v14 = 1;
        }
        else {
          uint64_t v14 = v7;
        }
        if (v10)
        {
          uint64_t v13 = v8;
          uint64_t v14 = v7;
        }
        if (v12)
        {
          uint64_t v8 = v13;
          uint64_t v7 = v14;
        }
        else
        {
          ++v7;
        }
      }
      else
      {
        v11 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v8, v7);
        [v5 addObject:v11];

        uint64_t v7 = 0;
        uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
      }
      ++v6;
    }
    while (v6 < [v4 length]);
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v15 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v8, v7);
      [v5 addObject:v15];
    }
  }

  return v5;
}

- (VSSpeechCharacterSet)initWithLanguage:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VSSpeechCharacterSet;
  v5 = [(VSSpeechCharacterSet *)&v14 init];
  if (!v5)
  {
LABEL_5:
    uint64_t v7 = v5;
    goto LABEL_7;
  }
  unint64_t v6 = +[VSSpeechCharacterSet languageMapping];
  uint64_t v7 = [v6 objectForKeyedSubscript:v4];

  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v9 = [v8 pathForResource:v7 ofType:@"cbm" inDirectory:@"CharacterBinaryMaps"];

    if (!v9)
    {

      uint64_t v7 = 0;
      goto LABEL_7;
    }
    int v10 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v9];
    uint64_t v11 = [MEMORY[0x263F08708] characterSetWithBitmapRepresentation:v10];
    characterSet = v5->_characterSet;
    v5->_characterSet = (NSCharacterSet *)v11;

    goto LABEL_5;
  }
LABEL_7:

  return v7;
}

+ (id)languageMapping
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 pathForResource:@"VSSpeechLangCharset" ofType:@"plist" inDirectory:@"CharacterBinaryMaps"];

  id v4 = [NSDictionary dictionaryWithContentsOfFile:v3];

  return v4;
}

@end