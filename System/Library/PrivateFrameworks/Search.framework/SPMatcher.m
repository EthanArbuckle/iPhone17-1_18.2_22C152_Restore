@interface SPMatcher
+ (id)transcriptionForString:(id)a3 withLanguage:(id)a4;
- (BOOL)matches:(id)a3;
- (BOOL)matches:(id)a3 outMatchBits:(unint64_t *)a4;
- (BOOL)matchesUTF8String:(const char *)a3;
- (BOOL)matchesUTF8String:(const char *)a3 outMatchBits:(unint64_t *)a4;
- (SPMatcher)initWithSearchString:(id)a3 andLocale:(id)a4 andOptions:(unint64_t)a5;
- (unint64_t)wordCount;
- (void)dealloc;
@end

@implementation SPMatcher

- (SPMatcher)initWithSearchString:(id)a3 andLocale:(id)a4 andOptions:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SPMatcher;
  v9 = [(SPMatcher *)&v11 init];
  if (v9) {
    v9->_matcher = (void *)icu_word_matcher_create();
  }

  return v9;
}

- (void)dealloc
{
  icu_ctx_release();
  v3.receiver = self;
  v3.super_class = (Class)SPMatcher;
  [(SPMatcher *)&v3 dealloc];
}

- (unint64_t)wordCount
{
  return MEMORY[0x270F4A7F0](self->_matcher, a2);
}

- (BOOL)matches:(id)a3 outMatchBits:(unint64_t *)a4
{
  return MEMORY[0x270F4A808](self->_matcher, a3, a4);
}

- (BOOL)matchesUTF8String:(const char *)a3 outMatchBits:(unint64_t *)a4
{
  return MEMORY[0x270F4A800](self->_matcher, a3, a4);
}

- (BOOL)matches:(id)a3
{
  return MEMORY[0x270F4A808](self->_matcher, a3, 0);
}

- (BOOL)matchesUTF8String:(const char *)a3
{
  return MEMORY[0x270F4A800](self->_matcher, a3, 0);
}

+ (id)transcriptionForString:(id)a3 withLanguage:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  bzero(v11, 0x400uLL);
  id v6 = a3;
  id v7 = a4;
  [v6 UTF8String];
  id v8 = v7;
  [v8 UTF8String];

  if (resolve_transcriptions_for_locale())
  {
    v9 = [NSString stringWithUTF8String:v11];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end