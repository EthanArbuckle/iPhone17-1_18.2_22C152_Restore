@interface NPKPassSelectionFieldDetectorAssertion
- (NPKPassSelectionFieldDetectorAssertion)initWithQueue:(id)a3;
- (NPKPassSelectionFieldDetectorAssertionDelegate)delegate;
- (void)_resyncState;
- (void)didEnterFieldForPassesWithUniqueIDs:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation NPKPassSelectionFieldDetectorAssertion

- (NPKPassSelectionFieldDetectorAssertion)initWithQueue:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NPKPassSelectionFieldDetectorAssertion;
  v3 = [(NPKTransientAssertion *)&v6 initWithQueue:a3];
  v4 = v3;
  if (v3) {
    [(NPKPassSelectionFieldDetectorAssertion *)v3 _resyncState];
  }
  return v4;
}

- (void)didEnterFieldForPassesWithUniqueIDs:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Pass Selection Field Detector assertion: received enter field with Passes UniqueIDs:%@", (uint8_t *)&v9, 0xCu);
    }
  }
  v8 = [(NPKPassSelectionFieldDetectorAssertion *)self delegate];
  [v8 passSelectionFieldDetectorAssertion:self didEnterFieldForPassesWithUniqueIDs:v4];
}

- (void)_resyncState
{
  v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Pass Selection Field Detector assertion: resyncing state", v7, 2u);
    }
  }
  BOOL v6 = [(NPKTransientAssertion *)self _remoteObjectProxy];
  [v6 requestPassSelectionFieldDetectorDelegationAssertion];
}

- (NPKPassSelectionFieldDetectorAssertionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NPKPassSelectionFieldDetectorAssertionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end