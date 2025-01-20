@interface SBCaptureButtonInternalRestrictionGlue
- (SBCaptureButtonInternalRestrictionGlue)initWithCoordinator:(id)a3;
- (void)acquireRestriction:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)relinquishRestriction;
@end

@implementation SBCaptureButtonInternalRestrictionGlue

- (SBCaptureButtonInternalRestrictionGlue)initWithCoordinator:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SBCaptureButtonInternalRestrictionGlue;
  v6 = [(SBCaptureButtonInternalRestrictionGlue *)&v19 init];
  if (v6)
  {
    id v7 = v5;
    if (v7)
    {
      v8 = v7;
      objc_opt_class();
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {

        objc_storeStrong((id *)&v6->_coordinator, a3);
        goto LABEL_5;
      }
      v14 = NSString;
      v15 = (objc_class *)[v8 classForCoder];
      if (!v15) {
        v15 = (objc_class *)objc_opt_class();
      }
      v16 = NSStringFromClass(v15);
      objc_opt_class();
      v17 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v17);
      v13 = [v14 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"coordinator", v16, v18];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBCaptureButtonInternalRestrictionGlue initWithCoordinator:]();
      }
    }
    else
    {
      v10 = NSString;
      objc_opt_class();
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      v13 = [v10 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"coordinator", v12];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBCaptureButtonInternalRestrictionGlue initWithCoordinator:]();
      }
    }
    [v13 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D86F1DE8);
  }
LABEL_5:

  return v6;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)invalidate
{
  coordinator = self->_coordinator;
  if (coordinator)
  {
    self->_coordinator = 0;

    [(BSInvalidatable *)self->_captureButtonInhibitionAssertion invalidate];
    captureButtonInhibitionAssertion = self->_captureButtonInhibitionAssertion;
    self->_captureButtonInhibitionAssertion = 0;
  }
}

- (void)acquireRestriction:(id)a3
{
  id v4 = a3;
  coordinator = self->_coordinator;
  if (coordinator)
  {
    if (!self->_captureButtonInhibitionAssertion)
    {
      id v9 = v4;
      uint64_t v6 = [(SBCaptureButtonRestrictionCoordinator *)coordinator inhibitCaptureButtonActionAssertionWithReason:v4];
      captureButtonInhibitionAssertion = self->_captureButtonInhibitionAssertion;
      self->_captureButtonInhibitionAssertion = v6;

      id v4 = v9;
    }
  }
  else
  {
    uint64_t v8 = [NSString stringWithFormat:@"tried to acquire invalidated restriction(%@)", v4];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBCaptureButtonInternalRestrictionGlue acquireRestriction:]();
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)relinquishRestriction
{
  captureButtonInhibitionAssertion = self->_captureButtonInhibitionAssertion;
  if (captureButtonInhibitionAssertion)
  {
    [(BSInvalidatable *)captureButtonInhibitionAssertion invalidate];
    id v4 = self->_captureButtonInhibitionAssertion;
    self->_captureButtonInhibitionAssertion = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureButtonInhibitionAssertion, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
}

- (void)initWithCoordinator:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)acquireRestriction:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end