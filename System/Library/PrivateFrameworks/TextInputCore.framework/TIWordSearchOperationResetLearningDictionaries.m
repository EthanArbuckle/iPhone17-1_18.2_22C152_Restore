@interface TIWordSearchOperationResetLearningDictionaries
- (TIMecabraWrapper)mecabraWrapper;
- (TIWordSearchOperationResetLearningDictionaries)initWithMecabraWrapper:(id)a3;
- (void)perform;
- (void)setMecabraWrapper:(id)a3;
@end

@implementation TIWordSearchOperationResetLearningDictionaries

- (void).cxx_destruct
{
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
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [(TIWordSearchOperationResetLearningDictionaries *)self mecabraWrapper];

  if (v3)
  {
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (TICanLogMessageAtLevel_logLevel)
    {
      v4 = TIOSLogFacility();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        v8 = NSString;
        v9 = NSNumber;
        v10 = [(TIWordSearchOperationResetLearningDictionaries *)self mecabraWrapper];
        v11 = objc_msgSend(v9, "numberWithUnsignedInt:", objc_msgSend(v10, "inputMethodType"));
        v12 = [v8 stringWithFormat:@"%s Reset learning dictionaries for input method type %@", "-[TIWordSearchOperationResetLearningDictionaries perform]", v11];
        *(_DWORD *)buf = 138412290;
        v14 = v12;
        _os_log_debug_impl(&dword_1E3F0E000, v4, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    v5 = [(TIWordSearchOperationResetLearningDictionaries *)self mecabraWrapper];
    [v5 inputMethodType];
    v6 = (void *)MEMORY[0x1E4F1CB10];
    v7 = UIKeyboardUserDirectory();
    [v6 fileURLWithPath:v7];
    MecabraResetLearningDictionaries();
  }
}

- (TIWordSearchOperationResetLearningDictionaries)initWithMecabraWrapper:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIWordSearchOperationResetLearningDictionaries;
  v6 = [(TIWordSearchOperationResetLearningDictionaries *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mecabraWrapper, a3);
  }

  return v7;
}

@end