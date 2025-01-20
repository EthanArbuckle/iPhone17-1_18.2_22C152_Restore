@interface TIWordSearchOperationPerformMaintenance
- (TIMecabraWrapper)mecabraWrapper;
- (TIWordSearchOperationPerformMaintenance)initWithMecabraWrapper:(id)a3;
- (void)perform;
- (void)setMecabraWrapper:(id)a3;
@end

@implementation TIWordSearchOperationPerformMaintenance

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
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = [(TIWordSearchOperationPerformMaintenance *)self mecabraWrapper];

  if (v3)
  {
    v4 = (void *)os_transaction_create();
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    v5 = TIOSLogFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s Starting MecabraPerformMaintenance", "-[TIWordSearchOperationPerformMaintenance perform]");
      *(_DWORD *)buf = 138412290;
      v11 = v8;
      _os_log_debug_impl(&dword_1E3F0E000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    v6 = [(TIWordSearchOperationPerformMaintenance *)self mecabraWrapper];
    [v6 mecabraRef];
    MecabraPerformMaintenance();

    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    v7 = TIOSLogFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s Finished MecabraPerformMaintenance", "-[TIWordSearchOperationPerformMaintenance perform]");
      *(_DWORD *)buf = 138412290;
      v11 = v9;
      _os_log_debug_impl(&dword_1E3F0E000, v7, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
}

- (TIWordSearchOperationPerformMaintenance)initWithMecabraWrapper:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIWordSearchOperationPerformMaintenance;
  v6 = [(TIWordSearchOperationPerformMaintenance *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mecabraWrapper, a3);
  }

  return v7;
}

@end