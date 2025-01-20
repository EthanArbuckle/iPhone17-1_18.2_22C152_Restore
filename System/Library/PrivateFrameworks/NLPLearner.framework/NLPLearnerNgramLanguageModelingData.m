@interface NLPLearnerNgramLanguageModelingData
+ (unint64_t)defaultMaxSequenceLength;
+ (void)initialize;
- (NLPLearnerNgramLanguageModelingData)initWithLocale:(id)a3;
- (void)addPreprocessedExample:(void *)a3;
@end

@implementation NLPLearnerNgramLanguageModelingData

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    sLogNgramLM = (uint64_t)os_log_create("com.apple.NLP", "NLPLearnerNgramLanguageModelingData");
    MEMORY[0x270F9A758]();
  }
}

+ (unint64_t)defaultMaxSequenceLength
{
  return 256;
}

- (NLPLearnerNgramLanguageModelingData)initWithLocale:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NLPLearnerNgramLanguageModelingData;
  v5 = [(NLPLearnerLanguageModelingData *)&v7 initWithLocale:v4];
  if (v5) {
    -[NLPLearnerTextData setMaxSequenceLength:](v5, "setMaxSequenceLength:", [(id)objc_opt_class() defaultMaxSequenceLength]);
  }

  return v5;
}

- (void)addPreprocessedExample:(void *)a3
{
  size_t v5 = *((void *)a3 + 1) - *(void *)a3;
  v6 = malloc_type_malloc(v5, 0x4F6992F2uLL);
  if (v6)
  {
    objc_super v7 = v6;
    memcpy(v6, *(const void **)a3, v5);
    id v9 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v7 length:v5 freeWhenDone:1];
    v8 = [(NLPLearnerTextData *)self sentences];
    [v8 addObject:v9];
  }
}

@end