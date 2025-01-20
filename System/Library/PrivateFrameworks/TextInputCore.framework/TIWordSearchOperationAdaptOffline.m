@interface TIWordSearchOperationAdaptOffline
- (NSString)paragraph;
- (TILanguageModelAdaptationContext)adaptationContext;
- (TIMecabraWrapper)mecabraWrapper;
- (TIWordSearchOperationAdaptOffline)initWithWordSearch:(id)a3 paragraph:(id)a4 adaptationContext:(id)a5 timeStamp:(double)a6;
- (double)timeStamp;
- (void)perform;
- (void)setAdaptationContext:(id)a3;
- (void)setMecabraWrapper:(id)a3;
- (void)setParagraph:(id)a3;
- (void)setTimeStamp:(double)a3;
@end

@implementation TIWordSearchOperationAdaptOffline

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paragraph, 0);
  objc_storeStrong((id *)&self->_adaptationContext, 0);

  objc_storeStrong((id *)&self->_mecabraWrapper, 0);
}

- (void)setTimeStamp:(double)a3
{
  self->_timeStamp = a3;
}

- (double)timeStamp
{
  return self->_timeStamp;
}

- (void)setParagraph:(id)a3
{
}

- (NSString)paragraph
{
  return self->_paragraph;
}

- (void)setAdaptationContext:(id)a3
{
}

- (TILanguageModelAdaptationContext)adaptationContext
{
  return self->_adaptationContext;
}

- (void)setMecabraWrapper:(id)a3
{
}

- (TIMecabraWrapper)mecabraWrapper
{
  return self->_mecabraWrapper;
}

- (void)perform
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = [(TIWordSearchOperationAdaptOffline *)self mecabraWrapper];
  uint64_t v4 = [v3 mecabraRef];

  if (v4)
  {
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      v5 = TIOSLogFacility();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        v7 = NSString;
        v8 = [(TIWordSearchOperationAdaptOffline *)self paragraph];
        v9 = [v7 stringWithFormat:@"%s [Offline adaptation] Adapting to paragraph: %@", "-[TIWordSearchOperationAdaptOffline perform]", v8];
        *(_DWORD *)buf = 138412290;
        v11 = v9;
        _os_log_debug_impl(&dword_1E3F0E000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    v6 = [(TIWordSearchOperationAdaptOffline *)self paragraph];
    [(TIWordSearchOperationAdaptOffline *)self timeStamp];
    MecabraAdaptToUntokenizedText();
  }
}

- (TIWordSearchOperationAdaptOffline)initWithWordSearch:(id)a3 paragraph:(id)a4 adaptationContext:(id)a5 timeStamp:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)TIWordSearchOperationAdaptOffline;
  v13 = [(TIWordSearchOperationAdaptOffline *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v10 mecabraWrapper];
    mecabraWrapper = v13->_mecabraWrapper;
    v13->_mecabraWrapper = (TIMecabraWrapper *)v14;

    uint64_t v16 = [v11 copy];
    paragraph = v13->_paragraph;
    v13->_paragraph = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    adaptationContext = v13->_adaptationContext;
    v13->_adaptationContext = (TILanguageModelAdaptationContext *)v18;

    v13->_timeStamp = a6;
  }

  return v13;
}

@end