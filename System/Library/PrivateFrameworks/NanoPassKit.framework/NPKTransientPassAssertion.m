@interface NPKTransientPassAssertion
- (BOOL)disableCardSelection;
- (BOOL)requestServiceMode;
- (NPKTransientPassAssertion)initWithPassWithUniqueID:(id)a3;
- (NSString)uniqueID;
- (void)_resyncState;
- (void)setDisableCardSelection:(BOOL)a3;
- (void)setRequestServiceMode:(BOOL)a3;
- (void)setUniqueID:(id)a3;
@end

@implementation NPKTransientPassAssertion

- (NPKTransientPassAssertion)initWithPassWithUniqueID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NPKTransientPassAssertion;
  v6 = [(NPKTransientAssertion *)&v9 initWithQueue:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_uniqueID, a3);
    [(NPKTransientPassAssertion *)v7 _resyncState];
  }

  return v7;
}

- (void)setRequestServiceMode:(BOOL)a3
{
  if (self->_requestServiceMode != a3)
  {
    BOOL v3 = a3;
    self->_requestServiceMode = a3;
    id v4 = [(NPKTransientAssertion *)self _remoteObjectProxy];
    [v4 setServiceModeRequested:v3];
  }
}

- (void)setDisableCardSelection:(BOOL)a3
{
  if (self->_disableCardSelection != a3)
  {
    BOOL v3 = a3;
    self->_disableCardSelection = a3;
    id v4 = [(NPKTransientAssertion *)self _remoteObjectProxy];
    [v4 setDisableCardSelection:v3];
  }
}

- (void)_resyncState
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v10 = 138412290;
      *(void *)&v10[4] = objc_opt_class();
      id v6 = *(id *)&v10[4];
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: %@: Transient pass assertion: resyncing state", v10, 0xCu);
    }
  }
  v7 = [(NPKTransientAssertion *)self _remoteObjectProxy];
  [v7 setTransientPassUniqueID:self->_uniqueID];

  v8 = [(NPKTransientAssertion *)self _remoteObjectProxy];
  [v8 setServiceModeRequested:self->_requestServiceMode];

  objc_super v9 = [(NPKTransientAssertion *)self _remoteObjectProxy];
  [v9 setDisableCardSelection:self->_disableCardSelection];
}

- (BOOL)requestServiceMode
{
  return self->_requestServiceMode;
}

- (BOOL)disableCardSelection
{
  return self->_disableCardSelection;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end