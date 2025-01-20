@interface SBContinuityDisplayLayoutCoordinator
- (FBSDisplayLayoutPublisher)rootPublisher;
- (SBContinuityDisplayLayoutCoordinator)initWithRootPublisher:(id)a3;
- (id)activateForPublisher:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)start;
@end

@implementation SBContinuityDisplayLayoutCoordinator

- (SBContinuityDisplayLayoutCoordinator)initWithRootPublisher:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    v7 = v6;
    v12.receiver = self;
    v12.super_class = (Class)SBContinuityDisplayLayoutCoordinator;
    v8 = [(SBContinuityDisplayLayoutCoordinator *)&v12 init];
    v9 = v8;
    if (v8) {
      objc_storeStrong((id *)&v8->_rootPublisher, a3);
    }

    return v9;
  }
  else
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"rootPublisher"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBContinuityDisplayLayoutCoordinator initWithRootPublisher:](a2);
    }
    [v11 UTF8String];
    result = (SBContinuityDisplayLayoutCoordinator *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)dealloc
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)start
{
  BSDispatchQueueAssertMain();
  if (!self->_currentPublisher)
  {
    v3 = [(FBSDisplayLayoutPublisher *)self->_rootPublisher suppressLayoutForReason:@"startListener"];
    suppression = self->_suppression;
    self->_suppression = v3;
  }
}

- (void)invalidate
{
  BSDispatchQueueAssertMain();
  rootPublisher = self->_rootPublisher;
  self->_rootPublisher = 0;

  [(BSInvalidatable *)self->_suppression invalidate];
  suppression = self->_suppression;
  self->_suppression = 0;
}

- (id)activateForPublisher:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"publisher"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBContinuityDisplayLayoutCoordinator activateForPublisher:](a2);
    }
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D88C8104);
  }
  uint64_t v6 = v5;
  BSDispatchQueueAssertMain();
  if (self->_currentPublisher)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SBContinuityDisplayLayoutCoordinator.m", 55, @"<SBContinuityDisplayLayoutCoordinator:%p> cannot remove suppression for %@ because it is already tracking %@", self, v6, self->_currentPublisher object file lineNumber description];
  }
  uint64_t v7 = [MEMORY[0x1E4F4F880] referenceWithObject:v6];
  currentPublisher = self->_currentPublisher;
  self->_currentPublisher = v7;

  [(BSInvalidatable *)self->_suppression invalidate];
  suppression = self->_suppression;
  self->_suppression = 0;

  objc_initWeak(&location, self);
  id v10 = objc_alloc(MEMORY[0x1E4F4F838]);
  v11 = objc_msgSend(NSString, "stringWithFormat:", @"<SBContinuityDisplayLayoutCoordinator:%p>", self);
  objc_super v12 = [NSString stringWithFormat:@"<%@:%p>", objc_opt_class(), v6];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __61__SBContinuityDisplayLayoutCoordinator_activateForPublisher___block_invoke;
  v17[3] = &unk_1E6AF4FB8;
  objc_copyWeak(&v18, &location);
  v13 = (void *)[v10 initWithIdentifier:v11 forReason:v12 invalidationBlock:v17];
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
  return v13;
}

void __61__SBContinuityDisplayLayoutCoordinator_activateForPublisher___block_invoke(uint64_t a1)
{
  BSDispatchQueueAssertMain();
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained[3];
    WeakRetained[3] = 0;
    uint64_t v6 = WeakRetained;

    uint64_t v4 = [v6[1] suppressLayoutForReason:@"invalidated session"];
    id v5 = v6[2];
    v6[2] = (id)v4;

    WeakRetained = v6;
  }
}

- (FBSDisplayLayoutPublisher)rootPublisher
{
  return self->_rootPublisher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPublisher, 0);
  objc_storeStrong((id *)&self->_suppression, 0);
  objc_storeStrong((id *)&self->_rootPublisher, 0);
}

- (void)initWithRootPublisher:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)activateForPublisher:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);
}

@end