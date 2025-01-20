@interface TILanguageModelOfflineLearningHandle
+ (id)handleForInputMode:(id)a3;
+ (id)handleForLanguageLikelihood;
- (BOOL)isValid;
- (NSDate)lastAdaptationDate;
- (TIInputMode)inputMode;
- (TILanguageModelAdaptationContext)currentAdaptationContext;
- (TILanguageModelOfflineLearningHandle)initWithInputMode:(id)a3;
- (void)setCurrentAdaptationContext:(id)a3;
- (void)setLastAdaptationDate:(id)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation TILanguageModelOfflineLearningHandle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAdaptationContext, 0);
  objc_storeStrong((id *)&self->_lastAdaptationDate, 0);

  objc_storeStrong((id *)&self->_inputMode, 0);
}

- (void)setCurrentAdaptationContext:(id)a3
{
}

- (TILanguageModelAdaptationContext)currentAdaptationContext
{
  return self->_currentAdaptationContext;
}

- (void)setLastAdaptationDate:(id)a3
{
}

- (NSDate)lastAdaptationDate
{
  return self->_lastAdaptationDate;
}

- (TIInputMode)inputMode
{
  return self->_inputMode;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (TILanguageModelOfflineLearningHandle)initWithInputMode:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TILanguageModelOfflineLearningHandle;
  v5 = [(TILanguageModelOfflineLearningHandle *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    inputMode = v5->_inputMode;
    v5->_inputMode = (TIInputMode *)v6;
  }
  return v5;
}

+ (id)handleForLanguageLikelihood
{
  v2 = [[TILanguageModelOfflineLearningHandleLanguageLikelihood alloc] initWithInputMode:0];
  [(TILanguageModelOfflineLearningHandle *)v2 setValid:1];

  return v2;
}

+ (id)handleForInputMode:(id)a3
{
  id v3 = a3;
  id v4 = [v3 normalizedIdentifier];
  v5 = TICanonicalInputModeName();
  uint64_t v6 = (void *)TIInputManagerClassForInputMode();

  v7 = [v6 offlineLearningHandleForInputMode:v3];

  return v7;
}

@end