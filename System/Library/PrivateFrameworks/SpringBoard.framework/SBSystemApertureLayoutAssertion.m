@interface SBSystemApertureLayoutAssertion
- (BOOL)isValid;
- (NSString)description;
- (NSString)reason;
- (SBSystemApertureLayoutAssertion)initWithMaximumPermittedLayoutMode:(int64_t)a3 reason:(id)a4 invalidationHandler:(id)a5;
- (int64_t)maximumPermittedLayoutMode;
- (void)addInvalidationBlock:(id)a3;
- (void)dealloc;
- (void)invalidateWithReason:(id)a3;
@end

@implementation SBSystemApertureLayoutAssertion

- (void)dealloc
{
  if ([(SBSystemApertureLayoutAssertion *)self isValid]) {
    [(SBSystemApertureLayoutAssertion *)self invalidateWithReason:@"deallocation"];
  }
  v3.receiver = self;
  v3.super_class = (Class)SBSystemApertureLayoutAssertion;
  [(SBSystemApertureLayoutAssertion *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = SAUIStringFromElementViewLayoutMode();
  reason = self->_reason;
  [(SBSystemApertureLayoutAssertion *)self isValid];
  v7 = NSStringFromBOOL();
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; max layout mode: %@; reason: %@; isValid: %@",
    v4,
    self,
    v5,
    reason,
  v8 = v7);

  return (NSString *)v8;
}

- (SBSystemApertureLayoutAssertion)initWithMaximumPermittedLayoutMode:(int64_t)a3 reason:(id)a4 invalidationHandler:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  if ((unint64_t)(a3 - 4) > 0xFFFFFFFFFFFFFFFALL)
  {
    if (v9) {
      goto LABEL_3;
    }
LABEL_10:
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"SBSystemApertureLayoutAssertion.m", 39, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];

    if (v10) {
      goto LABEL_4;
    }
    goto LABEL_11;
  }
  v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"SBSystemApertureLayoutAssertion.m", 38, @"Invalid parameter not satisfying: %@", @"(SAUIElementViewLayoutModeRemoved <= maxLayoutMode) && (maxLayoutMode <= SAUIElementViewLayoutModeCustom)" object file lineNumber description];

  if (!v9) {
    goto LABEL_10;
  }
LABEL_3:
  if (v10) {
    goto LABEL_4;
  }
LABEL_11:
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"SBSystemApertureLayoutAssertion.m", 40, @"Invalid parameter not satisfying: %@", @"invalidationHandler" object file lineNumber description];

LABEL_4:
  v22.receiver = self;
  v22.super_class = (Class)SBSystemApertureLayoutAssertion;
  v11 = [(SBSystemApertureLayoutAssertion *)&v22 init];
  v12 = v11;
  if (v11)
  {
    v11->_maximumPermittedLayoutMode = a3;
    uint64_t v13 = [v9 copy];
    reason = v12->_reason;
    v12->_reason = (NSString *)v13;

    uint64_t v15 = [v10 copy];
    id invalidationHandler = v12->_invalidationHandler;
    v12->_id invalidationHandler = (id)v15;

    v17 = SBLogSystemApertureController();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v12;
      _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "Created layout assertion: %{public}@", buf, 0xCu);
    }
  }
  return v12;
}

- (BOOL)isValid
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_invalidationHandler != 0;
  objc_sync_exit(v2);

  return v3;
}

- (void)addInvalidationBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v10 = v4;
    v5 = self;
    objc_sync_enter(v5);
    invalidationBlocks = v5->_invalidationBlocks;
    if (!invalidationBlocks)
    {
      v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v8 = v5->_invalidationBlocks;
      v5->_invalidationBlocks = v7;

      invalidationBlocks = v5->_invalidationBlocks;
    }
    id v9 = (void *)MEMORY[0x1D948C7A0](v10);
    [(NSMutableSet *)invalidationBlocks addObject:v9];

    objc_sync_exit(v5);
    id v4 = v10;
  }
}

- (void)invalidateWithReason:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![v5 length])
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SBSystemApertureLayoutAssertion.m", 70, @"Invalid parameter not satisfying: %@", @"[reason length] > 0" object file lineNumber description];
  }
  if (![(SBSystemApertureLayoutAssertion *)self isValid])
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SBSystemApertureLayoutAssertion.m", 71, @"Attempt to invalidate invalid layout assertion: %@", self object file lineNumber description];
  }
  v6 = self;
  objc_sync_enter(v6);
  v7 = (void (**)(void, void))MEMORY[0x1D948C7A0](v6->_invalidationHandler);
  id invalidationHandler = v6->_invalidationHandler;
  v6->_id invalidationHandler = 0;

  id v9 = SBLogSystemApertureController();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v24 = v6;
    __int16 v25 = 2114;
    id v26 = v5;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Invalidated layout assertion: %{public}@; reason: %{public}@",
      buf,
      0x16u);
  }

  ((void (**)(void, SBSystemApertureLayoutAssertion *))v7)[2](v7, v6);
  id v10 = v6;
  objc_sync_enter(v10);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = v10[2];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v19;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v11);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v18 + 1) + 8 * v14++) + 16))();
      }
      while (v12 != v14);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  id v15 = v10[2];
  v10[2] = 0;

  objc_sync_exit(v10);
  objc_sync_exit(v10);
}

- (int64_t)maximumPermittedLayoutMode
{
  return self->_maximumPermittedLayoutMode;
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_invalidationBlocks, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
}

@end