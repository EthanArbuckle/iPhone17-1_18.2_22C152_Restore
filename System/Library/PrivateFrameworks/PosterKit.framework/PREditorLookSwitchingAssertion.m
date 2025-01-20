@interface PREditorLookSwitchingAssertion
- (BOOL)isInvalidated;
- (NSString)reason;
- (PREditor)editor;
- (PREditorLookSwitchingAssertion)initWithEditor:(id)a3 reason:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)setInvalidated:(BOOL)a3;
@end

@implementation PREditorLookSwitchingAssertion

- (PREditorLookSwitchingAssertion)initWithEditor:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PREditorLookSwitchingAssertion;
  v8 = [(PREditorLookSwitchingAssertion *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_editor, v6);
    uint64_t v10 = [v7 copy];
    reason = v9->_reason;
    v9->_reason = (NSString *)v10;
  }
  return v9;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_3();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_18C1C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, 0x3Au);
}

- (void)invalidate
{
  if (![(PREditorLookSwitchingAssertion *)self isInvalidated])
  {
    id v3 = [(PREditorLookSwitchingAssertion *)self editor];
    [v3 removeLookSwitchingAssertion:self];
    [(PREditorLookSwitchingAssertion *)self setInvalidated:1];
  }
}

- (PREditor)editor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editor);
  return (PREditor *)WeakRetained;
}

- (NSString)reason
{
  return self->_reason;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_destroyWeak((id *)&self->_editor);
}

@end