@interface NLPLearnerShadowEvaluator
+ (id)evaluatorWithLocale:(id)a3 andTask:(int64_t)a4;
+ (void)initialize;
- (NLPLearnerShadowEvaluator)initWithLocale:(id)a3 andTask:(int64_t)a4;
- (NSLocale)locale;
- (id)evaluateModel:(id)a3 onRecords:(id)a4 options:(id)a5 completion:(id)a6 error:(id *)a7;
- (id)prepareDataFromRecords:(id)a3;
- (int64_t)evaluationTask;
- (unint64_t)maxSamples;
- (unint64_t)topK;
- (void)setEvaluationTask:(int64_t)a3;
- (void)setLocale:(id)a3;
- (void)setMaxSamples:(unint64_t)a3;
@end

@implementation NLPLearnerShadowEvaluator

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    sLog_5 = (uint64_t)os_log_create("com.apple.NLPLearner", "NLPLearnerShadowEvaluator");
    MEMORY[0x270F9A758]();
  }
}

+ (id)evaluatorWithLocale:(id)a3 andTask:(int64_t)a4
{
  id v5 = a3;
  if ((unint64_t)(a4 - 5) > 2) {
    v6 = off_264BEE6D8;
  }
  else {
    v6 = off_264BEEC48[a4 - 5];
  }
  v7 = (void *)[objc_alloc(*v6) initWithLocale:v5 andTask:a4];

  return v7;
}

- (NLPLearnerShadowEvaluator)initWithLocale:(id)a3 andTask:(int64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NLPLearnerShadowEvaluator;
  v7 = [(NLPLearnerShadowEvaluator *)&v12 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    locale = v7->_locale;
    v7->_locale = (NSLocale *)v8;

    v7->_evaluationTask = a4;
    uint64_t v10 = 3;
    if ((unint64_t)(a4 - 4) >= 3) {
      uint64_t v10 = 1;
    }
    v7->_topK = v10;
  }

  return v7;
}

- (id)prepareDataFromRecords:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(NLPLearnerShadowEvaluator *)self evaluationTask];
  id v6 = [(NLPLearnerShadowEvaluator *)self locale];
  v7 = +[NLPLearnerTextData dataForTask:v5 andLocale:v6];

  objc_msgSend(v7, "loadFromCoreDuet:limitSamplesTo:", v4, -[NLPLearnerShadowEvaluator maxSamples](self, "maxSamples"));
  return v7;
}

- (id)evaluateModel:(id)a3 onRecords:(id)a4 options:(id)a5 completion:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = (void *)MEMORY[0x263EFF940];
  uint64_t v16 = *MEMORY[0x263EFF498];
  v17 = NSString;
  v18 = NSStringFromSelector(a2);
  v19 = [v17 stringWithFormat:@"You must override %@ in a subclass", v18];
  id v20 = [v15 exceptionWithName:v16 reason:v19 userInfo:0];

  objc_exception_throw(v20);
}

- (unint64_t)topK
{
  return self->_topK;
}

- (unint64_t)maxSamples
{
  return self->_maxSamples;
}

- (void)setMaxSamples:(unint64_t)a3
{
  self->_maxSamples = a3;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (int64_t)evaluationTask
{
  return self->_evaluationTask;
}

- (void)setEvaluationTask:(int64_t)a3
{
  self->_evaluationTask = a3;
}

- (void).cxx_destruct
{
}

@end