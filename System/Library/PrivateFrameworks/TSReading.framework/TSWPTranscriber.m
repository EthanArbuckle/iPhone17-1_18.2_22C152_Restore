@interface TSWPTranscriber
+ (id)transcriberWithIdentifier:(id)a3 displayName:(id)a4 romanizationLocaleID:(id)a5 transformIdentifier:(id)a6;
- (NSLocale)romanizationLocale;
- (TSWPTranscriber)initWithIdentifier:(id)a3 displayName:(id)a4 romanizationLocaleID:(id)a5 transformIdentifier:(id)a6;
- (id)transcribeText:(id)a3;
- (id)transcribeText:(id)a3 withLocale:(id)a4;
- (void)dealloc;
@end

@implementation TSWPTranscriber

- (TSWPTranscriber)initWithIdentifier:(id)a3 displayName:(id)a4 romanizationLocaleID:(id)a5 transformIdentifier:(id)a6
{
  v12.receiver = self;
  v12.super_class = (Class)TSWPTranscriber;
  v10 = [(TSWPTranscriber *)&v12 init];
  if (v10)
  {
    v10->_identifier = (NSString *)[a3 copy];
    v10->_displayName = (NSString *)[a4 copy];
    v10->_transformIdentifier = (NSString *)[a6 copy];
    v10->_romanizationLocale = (NSLocale *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:a5];
  }
  return v10;
}

+ (id)transcriberWithIdentifier:(id)a3 displayName:(id)a4 romanizationLocaleID:(id)a5 transformIdentifier:(id)a6
{
  v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithIdentifier:a3 displayName:a4 romanizationLocaleID:a5 transformIdentifier:a6];

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPTranscriber;
  [(TSWPTranscriber *)&v3 dealloc];
}

- (id)transcribeText:(id)a3
{
  return [(TSWPTranscriber *)self transcribeText:a3 withLocale:self->_romanizationLocale];
}

- (id)transcribeText:(id)a3 withLocale:(id)a4
{
  v7 = (void *)[MEMORY[0x263F089D8] string];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v16.length = [a3 length];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __45__TSWPTranscriber_transcribeText_withLocale___block_invoke;
  v10[3] = &unk_2646B2950;
  char v11 = 1;
  v10[4] = v7;
  v10[5] = a3;
  v10[6] = self;
  v10[7] = &v12;
  v16.location = 0;
  TSWPEnumerateWordsInStringWithBlock((CFStringRef)a3, v16, (CFLocaleRef)a4, (uint64_t)v10);
  if ([a3 length])
  {
    uint64_t v8 = v13[3];
    if (v8 < [a3 length] - 1) {
      objc_msgSend(v7, "appendString:", objc_msgSend(a3, "substringFromIndex:", v13[3]));
    }
  }
  _Block_object_dispose(&v12, 8);
  return v7;
}

CFTypeRef __45__TSWPTranscriber_transcribeText_withLocale___block_invoke(uint64_t a1, CFStringTokenizerRef tokenizer)
{
  CFTypeRef result = CFStringTokenizerCopyCurrentTokenAttribute(tokenizer, 0x10000uLL);
  if (result)
  {
    v5 = (void *)result;
    if (*(unsigned char *)(a1 + 64))
    {
      CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(tokenizer);
      uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
      if (CurrentTokenRange.location > *(void *)(v7 + 24))
      {
        objc_msgSend(*(id *)(a1 + 32), "appendString:", objc_msgSend(*(id *)(a1 + 40), "substringWithRange:"));
        uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
      }
      *(void *)(v7 + 24) = CurrentTokenRange.location + CurrentTokenRange.length;
    }
    v8.length = objc_msgSend(v5, "length", objc_msgSend(*(id *)(a1 + 32), "length"));
    [*(id *)(a1 + 32) appendString:v5];

    return (CFTypeRef)CFStringTransform(*(CFMutableStringRef *)(a1 + 32), &v8, *(CFStringRef *)(*(void *)(a1 + 48) + 24), 0);
  }
  return result;
}

- (NSLocale)romanizationLocale
{
  return self->_romanizationLocale;
}

@end