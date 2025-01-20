@interface TIWordSearchOperationSetLanguageModelAdaptationContext
- (TILanguageModelAdaptationContext)adaptationContext;
- (TIMecabraWrapper)mecabraWrapper;
- (TIWordSearchOperationSetLanguageModelAdaptationContext)initWithWordSearch:(id)a3 adaptationContext:(id)a4;
- (void)perform;
- (void)setAdaptationContext:(id)a3;
- (void)setMecabraWrapper:(id)a3;
@end

@implementation TIWordSearchOperationSetLanguageModelAdaptationContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adaptationContext, 0);

  objc_storeStrong((id *)&self->_mecabraWrapper, 0);
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
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [(TIWordSearchOperationSetLanguageModelAdaptationContext *)self mecabraWrapper];
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
        v8 = NSString;
        v9 = [(TIWordSearchOperationSetLanguageModelAdaptationContext *)self adaptationContext];
        v10 = [v8 stringWithFormat:@"%s Set dynamic language model with context %@", "-[TIWordSearchOperationSetLanguageModelAdaptationContext perform]", v9];
        *(_DWORD *)buf = 138412290;
        v12 = v10;
        _os_log_debug_impl(&dword_1E3F0E000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    v6 = [(TIWordSearchOperationSetLanguageModelAdaptationContext *)self adaptationContext];
    v7 = [v6 identifier];
    MecabraSetDynamicLanguageModelAppContext();
  }
}

- (TIWordSearchOperationSetLanguageModelAdaptationContext)initWithWordSearch:(id)a3 adaptationContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TIWordSearchOperationSetLanguageModelAdaptationContext;
  v8 = [(TIWordSearchOperationSetLanguageModelAdaptationContext *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 mecabraWrapper];
    mecabraWrapper = v8->_mecabraWrapper;
    v8->_mecabraWrapper = (TIMecabraWrapper *)v9;

    uint64_t v11 = [v7 copy];
    adaptationContext = v8->_adaptationContext;
    v8->_adaptationContext = (TILanguageModelAdaptationContext *)v11;
  }
  return v8;
}

@end