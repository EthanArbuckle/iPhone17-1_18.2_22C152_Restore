@interface _UIFocusTreeLock
- (BOOL)isEnvironmentLocked:(id)a3;
- (BOOL)unlockEnvironmentTree:(id)a3;
- (NSMapTable)lockedEnvironments;
- (NSTimer)validationTimer;
- (_UIFocusTreeLock)init;
- (id)description;
- (void)_validateLockedEnvironments;
- (void)lockEnvironmentTree:(id)a3;
@end

@implementation _UIFocusTreeLock

- (_UIFocusTreeLock)init
{
  v15.receiver = self;
  v15.super_class = (Class)_UIFocusTreeLock;
  v2 = [(_UIFocusTreeLock *)&v15 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:258 valueOptions:0 capacity:10];
    lockedEnvironments = v2->_lockedEnvironments;
    v2->_lockedEnvironments = (NSMapTable *)v3;

    if (os_variant_has_internal_diagnostics())
    {
      objc_initWeak(&location, v2);
      v6 = (void *)MEMORY[0x1E4F1CB00];
      uint64_t v9 = MEMORY[0x1E4F143A8];
      uint64_t v10 = 3221225472;
      v11 = __24___UIFocusTreeLock_init__block_invoke;
      v12 = &unk_1E52DAB28;
      objc_copyWeak(&v13, &location);
      uint64_t v7 = [v6 scheduledTimerWithTimeInterval:1 repeats:&v9 block:5.0];
      validationTimer = v2->_validationTimer;
      v2->_validationTimer = (NSTimer *)v7;

      -[NSTimer setTolerance:](v2->_validationTimer, "setTolerance:", 1.0, v9, v10, v11, v12);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
  return v2;
}

- (void)lockEnvironmentTree:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_UIFocusTreeLock.m", 141, @"Invalid parameter not satisfying: %@", @"environment" object file lineNumber description];
  }
  v6 = [(NSMapTable *)self->_lockedEnvironments objectForKey:v5];
  if (v6)
  {
    uint64_t v7 = v6;
    [(_UIFocusTreeLockItem *)v6 lock];
  }
  else
  {
    objc_initWeak(&location, self);
    v8 = [_UIFocusTreeLockItem alloc];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __40___UIFocusTreeLock_lockEnvironmentTree___block_invoke;
    v10[3] = &unk_1E52E64C8;
    objc_copyWeak(&v11, &location);
    uint64_t v7 = [(_UIFocusTreeLockItem *)v8 initWithEnvironment:v5 finalUnlockHandler:v10];
    [(NSMapTable *)self->_lockedEnvironments setObject:v7 forKey:v5];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (BOOL)unlockEnvironmentTree:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_UIFocusTreeLock.m", 160, @"Invalid parameter not satisfying: %@", @"environment" object file lineNumber description];
  }
  v6 = [(NSMapTable *)self->_lockedEnvironments objectForKey:v5];
  uint64_t v7 = v6;
  if (!v6)
  {
    if (os_variant_has_internal_diagnostics())
    {
      id v11 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        goto LABEL_13;
      }
      id v17 = v5;
      if (v5)
      {
        v18 = NSString;
        v19 = (objc_class *)objc_opt_class();
        v20 = NSStringFromClass(v19);
        v16 = [v18 stringWithFormat:@"<%@: %p>", v20, v17];
      }
      else
      {
        v16 = @"(nil)";
      }

      *(_DWORD *)buf = 138412290;
      v22 = v16;
      _os_log_fault_impl(&dword_1853B0000, v11, OS_LOG_TYPE_FAULT, "Unbalanced call to unlockEnvironmentTree: for an environment that is not locked: %@", buf, 0xCu);
    }
    else
    {
      id v11 = objc_retain(*(id *)(__UILogGetCategoryCachedImpl("Assert", &unlockEnvironmentTree____s_category)
                                          + 8));
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
LABEL_13:

        char v8 = 1;
        goto LABEL_5;
      }
      id v12 = v5;
      if (v5)
      {
        id v13 = NSString;
        v14 = (objc_class *)objc_opt_class();
        objc_super v15 = NSStringFromClass(v14);
        v16 = [v13 stringWithFormat:@"<%@: %p>", v15, v12];
      }
      else
      {
        v16 = @"(nil)";
      }

      *(_DWORD *)buf = 138412290;
      v22 = v16;
      _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "Unbalanced call to unlockEnvironmentTree: for an environment that is not locked: %@", buf, 0xCu);
    }

    goto LABEL_13;
  }
  char v8 = [v6 unlock];
LABEL_5:

  return v8;
}

- (BOOL)isEnvironmentLocked:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = [(NSMapTable *)self->_lockedEnvironments objectEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * v9);
        id v11 = [v10 environment];
        if (!v11)
        {
          if (os_variant_has_internal_diagnostics())
          {
            loga = __UIFaultDebugAssertLog();
            if (os_log_type_enabled(loga, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v23 = v10;
              _os_log_fault_impl(&dword_1853B0000, loga, OS_LOG_TYPE_FAULT, "Found a nil focus environment in the list of locked environments. This is a UIKit bug. Additional info:\n%@", buf, 0xCu);
            }
          }
          else
          {
            log = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &isEnvironmentLocked____s_category) + 8);
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v23 = v10;
              _os_log_impl(&dword_1853B0000, log, OS_LOG_TYPE_ERROR, "Found a nil focus environment in the list of locked environments. This is a UIKit bug. Additional info:\n%@", buf, 0xCu);
            }
          }
        }
        BOOL HaveCommonHierarchy = _UIFocusEnvironmentsHaveCommonHierarchy(v4, v11);

        if (HaveCommonHierarchy)
        {
          BOOL v14 = 1;
          goto LABEL_19;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v13 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
      uint64_t v7 = v13;
    }
    while (v13);
  }
  BOOL v14 = 0;
LABEL_19:

  return v14;
}

- (void)_validateLockedEnvironments
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_diagnostics())
  {
    CFAbsoluteTimeGetCurrent();
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v3 = [(NSMapTable *)self->_lockedEnvironments objectEnumerator];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * v7++) validate];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (id)description
{
  uint64_t v3 = +[UIDescriptionBuilder descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_lockedEnvironments withName:@"lockedEnvironments"];
  uint64_t v5 = [v3 string];

  return v5;
}

- (NSMapTable)lockedEnvironments
{
  return self->_lockedEnvironments;
}

- (NSTimer)validationTimer
{
  return self->_validationTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validationTimer, 0);
  objc_storeStrong((id *)&self->_lockedEnvironments, 0);
}

@end