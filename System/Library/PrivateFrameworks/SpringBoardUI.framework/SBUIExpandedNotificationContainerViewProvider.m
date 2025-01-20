@interface SBUIExpandedNotificationContainerViewProvider
- (BOOL)isValid;
- (NSString)description;
- (NSString)reason;
- (SBUIExpandedNotificationContainerViewProvider)initWithRequester:(id)a3 containerView:(id)a4 reason:(id)a5 invalidationBlock:(id)a6;
- (UIView)containerView;
- (id)requester;
- (void)dealloc;
- (void)invalidate;
@end

@implementation SBUIExpandedNotificationContainerViewProvider

- (SBUIExpandedNotificationContainerViewProvider)initWithRequester:(id)a3 containerView:(id)a4 reason:(id)a5 invalidationBlock:(id)a6
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    v24 = [MEMORY[0x263F08690] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"SBUIExpandedNotificationContainerViewProvider.m", 25, @"Invalid parameter not satisfying: %@", @"requester" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v25 = [MEMORY[0x263F08690] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"SBUIExpandedNotificationContainerViewProvider.m", 26, @"Invalid parameter not satisfying: %@", @"containerView" object file lineNumber description];

LABEL_3:
  if (![v13 length])
  {
    v26 = [MEMORY[0x263F08690] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"SBUIExpandedNotificationContainerViewProvider.m", 27, @"Invalid parameter not satisfying: %@", @"[reason length] > 0" object file lineNumber description];
  }
  v27.receiver = self;
  v27.super_class = (Class)SBUIExpandedNotificationContainerViewProvider;
  v15 = [(SBUIExpandedNotificationContainerViewProvider *)&v27 init];
  v16 = v15;
  if (v15)
  {
    objc_storeWeak(&v15->_requester, v11);
    objc_storeWeak((id *)&v16->_containerView, v12);
    uint64_t v17 = [v13 copy];
    reason = v16->_reason;
    v16->_reason = (NSString *)v17;

    uint64_t v19 = [v14 copy];
    id invalidationBlock = v16->_invalidationBlock;
    v16->_id invalidationBlock = (id)v19;

    v21 = SBLogNotifications();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = [(SBUIExpandedNotificationContainerViewProvider *)v16 description];
      *(_DWORD *)buf = 138543362;
      v29 = v22;
      _os_log_impl(&dword_2218C9000, v21, OS_LOG_TYPE_DEFAULT, "Instantiated new expanded notification container view assertion: %{public}@", buf, 0xCu);
    }
  }

  return v16;
}

- (BOOL)isValid
{
  return !self->_invalidated;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if ([(SBUIExpandedNotificationContainerViewProvider *)self isValid])
  {
    v3 = SBLogNotifications();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = [(SBUIExpandedNotificationContainerViewProvider *)self description];
      *(_DWORD *)buf = 138543362;
      v7 = v4;
      _os_log_impl(&dword_2218C9000, v3, OS_LOG_TYPE_DEFAULT, "Implicitly invalidating expanded notification container view assertion due to deallocation: %{public}@", buf, 0xCu);
    }
    [(SBUIExpandedNotificationContainerViewProvider *)self invalidate];
  }
  v5.receiver = self;
  v5.super_class = (Class)SBUIExpandedNotificationContainerViewProvider;
  [(SBUIExpandedNotificationContainerViewProvider *)&v5 dealloc];
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained(&self->_requester);
  reason = self->_reason;
  [(SBUIExpandedNotificationContainerViewProvider *)self isValid];
  v7 = NSStringFromBOOL();
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; requester: %@; reason: %@; valid: %@>",
    v4,
    self,
    WeakRetained,
    reason,
  uint64_t v8 = v7);

  return (NSString *)v8;
}

- (void)invalidate
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (self->_invalidated)
  {
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"SBUIExpandedNotificationContainerViewProvider.m" lineNumber:62 description:@"Attempt to invalidate invalid instance"];
  }
  v3 = SBLogNotifications();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(SBUIExpandedNotificationContainerViewProvider *)self description];
    int v9 = 138543362;
    v10 = v4;
    _os_log_impl(&dword_2218C9000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating expanded notification container view assertion: %{public}@", (uint8_t *)&v9, 0xCu);
  }
  self->_invalidated = 1;
  objc_super v5 = (void (**)(void, void))MEMORY[0x223C8BC20](self->_invalidationBlock);
  id invalidationBlock = self->_invalidationBlock;
  self->_id invalidationBlock = 0;

  if (v5) {
    ((void (**)(void, SBUIExpandedNotificationContainerViewProvider *))v5)[2](v5, self);
  }
}

- (UIView)containerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);

  return (UIView *)WeakRetained;
}

- (id)requester
{
  id WeakRetained = objc_loadWeakRetained(&self->_requester);

  return WeakRetained;
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_destroyWeak(&self->_requester);
  objc_destroyWeak((id *)&self->_containerView);

  objc_storeStrong(&self->_invalidationBlock, 0);
}

@end