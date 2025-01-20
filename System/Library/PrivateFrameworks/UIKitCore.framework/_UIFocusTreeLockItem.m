@interface _UIFocusTreeLockItem
- (BOOL)unlock;
- (NSArray)lockCallStackSymbols;
- (NSArray)unlockCallStackSymbols;
- (NSString)environmentDescription;
- (UIFocusEnvironment)environment;
- (_UIFocusTreeLockItem)initWithEnvironment:(id)a3 finalUnlockHandler:(id)a4;
- (double)lockTime;
- (id)description;
- (unint64_t)lockCount;
- (void)_cleanup:(BOOL)a3;
- (void)dealloc;
- (void)lock;
- (void)validate;
@end

@implementation _UIFocusTreeLockItem

- (_UIFocusTreeLockItem)initWithEnvironment:(id)a3 finalUnlockHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)_UIFocusTreeLockItem;
  v8 = [(_UIFocusTreeLockItem *)&v27 init];
  if (v8)
  {
    v9 = _Block_copy(v7);
    id finalUnlockHandler = v8->_finalUnlockHandler;
    v8->_id finalUnlockHandler = v9;

    objc_storeWeak((id *)&v8->_environment, v6);
    v8->_unsafeEnvironment = (UIFocusEnvironment *)v6;
    id v11 = v6;
    if (v11)
    {
      v12 = NSString;
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      v15 = [v12 stringWithFormat:@"<%@: %p>", v14, v11];
    }
    else
    {
      v15 = @"(nil)";
    }

    environmentDescription = v8->_environmentDescription;
    v8->_environmentDescription = &v15->isa;

    v8->_lockCount = 0;
    v8->_lockTime = CFAbsoluteTimeGetCurrent();
    if (os_variant_has_internal_diagnostics() && _UIGetFocusTreeLockVerboseLogging())
    {
      uint64_t v21 = objc_opt_new();
      lockCallStackSymbols = v8->_lockCallStackSymbols;
      v8->_lockCallStackSymbols = (NSMutableArray *)v21;

      uint64_t v23 = objc_opt_new();
      unlockCallStackSymbols = v8->_unlockCallStackSymbols;
      v8->_unlockCallStackSymbols = (NSMutableArray *)v23;
    }
    v17 = [_UIWeakHelper alloc];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __63___UIFocusTreeLockItem_initWithEnvironment_finalUnlockHandler___block_invoke;
    v25[3] = &unk_1E52D9F70;
    v18 = v8;
    v26 = v18;
    v19 = [(_UIWeakHelper *)v17 initWithDeallocationBlock:v25];
    objc_setAssociatedObject(v11, v18, v19, (void *)1);
    [(_UIFocusTreeLockItem *)v18 lock];
  }
  return v8;
}

- (void)dealloc
{
  [(_UIFocusTreeLockItem *)self _cleanup:1];
  v3.receiver = self;
  v3.super_class = (Class)_UIFocusTreeLockItem;
  [(_UIFocusTreeLockItem *)&v3 dealloc];
}

- (void)lock
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  ++self->_lockCount;
  lockCallStackSymbols = self->_lockCallStackSymbols;
  if (lockCallStackSymbols)
  {
    v4 = [MEMORY[0x1E4F29060] callStackSymbols];
    [(NSMutableArray *)lockCallStackSymbols addObject:v4];
  }
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIFocus", &lock___s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    id v6 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      environmentDescription = self->_environmentDescription;
      unint64_t lockCount = self->_lockCount;
      int v9 = 138412546;
      v10 = environmentDescription;
      __int16 v11 = 2048;
      unint64_t v12 = lockCount;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "Locking environment %@ — %lu locks total for this environment.", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (BOOL)unlock
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unint64_t lockCount = self->_lockCount;
  if (!lockCount)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"_UIFocusTreeLock.m", 286, @"Overreleasing a lock. This is a UIKit bug. Additional info:\n%@", self object file lineNumber description];

    unint64_t lockCount = self->_lockCount;
  }
  unint64_t v4 = lockCount - 1;
  self->_unint64_t lockCount = v4;
  unlockCallStackSymbols = self->_unlockCallStackSymbols;
  if (unlockCallStackSymbols)
  {
    id v6 = [MEMORY[0x1E4F29060] callStackSymbols];
    [(NSMutableArray *)unlockCallStackSymbols addObject:v6];

    unint64_t v4 = self->_lockCount;
  }
  if (v4)
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIFocus", &qword_1EB25FE90);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      v8 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        environmentDescription = self->_environmentDescription;
        unint64_t v10 = self->_lockCount;
        *(_DWORD *)buf = 138412546;
        v20 = environmentDescription;
        __int16 v21 = 2048;
        CFAbsoluteTime v22 = *(double *)&v10;
        _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Unlocking environment %@ — %lu locks remaining for this environment.", buf, 0x16u);
      }
    }
  }
  else
  {
    unint64_t v11 = __UILogGetCategoryCachedImpl("UIFocus", &_MergedGlobals_996);
    if (*(unsigned char *)v11)
    {
      v15 = *(NSObject **)(v11 + 8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = self->_environmentDescription;
        v17 = v15;
        CFAbsoluteTime v18 = CFAbsoluteTimeGetCurrent() - self->_lockTime;
        *(_DWORD *)buf = 138412546;
        v20 = v16;
        __int16 v21 = 2048;
        CFAbsoluteTime v22 = v18;
        _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_ERROR, "Unlocking environment %@ after %.2fs — 0 locks remaining for this environment.", buf, 0x16u);
      }
    }
    [(_UIFocusTreeLockItem *)self _cleanup:0];
  }
  return self->_lockCount == 0;
}

- (void)_cleanup:(BOOL)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!self->_didCleanup || a3)
  {
    if (!self->_didCleanup && a3)
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIFocus", &qword_1EB25FEA0);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        uint64_t v13 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          environmentDescription = self->_environmentDescription;
          v15 = (void *)MEMORY[0x1E4F29060];
          v16 = v13;
          v17 = [v15 callStackSymbols];
          int v18 = 138412802;
          v19 = environmentDescription;
          __int16 v20 = 2112;
          __int16 v21 = v17;
          __int16 v22 = 2112;
          uint64_t v23 = self;
          _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "Cleaning up environment lock for %@ from dealloc. Cleanup from dealloc might indicate an unbalanced lock call. Stack trace:\n%@\nAdditional info:\n%@", (uint8_t *)&v18, 0x20u);
        }
      }
    }
    self->_didCleanup = 1;
    (*((void (**)(void))self->_finalUnlockHandler + 2))();
    WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
    v8 = WeakRetained;
    if (!WeakRetained) {
      goto LABEL_14;
    }
    int v9 = objc_getAssociatedObject(WeakRetained, self);
    [v9 invalidate];
    objc_setAssociatedObject(v8, self, 0, (void *)1);
LABEL_13:

LABEL_14:
    return;
  }
  unint64_t v4 = __UILogGetCategoryCachedImpl("UIFocus", &qword_1EB25FE98);
  if (*(unsigned char *)v4)
  {
    v5 = *(NSObject **)(v4 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = self->_environmentDescription;
      id v7 = (void *)MEMORY[0x1E4F29060];
      v8 = v5;
      int v9 = [v7 callStackSymbols];
      int v18 = 138412802;
      v19 = v6;
      __int16 v20 = 2112;
      __int16 v21 = v9;
      __int16 v22 = 2112;
      uint64_t v23 = self;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Ignoring call to cleanup environment lock for %@. Cleanup has already happened. Stack trace:\n%@\nAdditional info:\n%@", (uint8_t *)&v18, 0x20u);
      goto LABEL_13;
    }
  }
}

- (void)validate
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  if (WeakRetained)
  {
    double v4 = CFAbsoluteTimeGetCurrent() - self->_lockTime;
    if (!self->_didSoftAssert && v4 >= 20.0)
    {
      if ((_UIKitProcessIsBeingDebugged() & 1) == 0)
      {
        if (os_variant_has_internal_diagnostics())
        {
          v16 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          {
            environmentDescription = self->_environmentDescription;
            int v18 = 138412802;
            v19 = (_UIFocusTreeLockItem *)environmentDescription;
            __int16 v20 = 2048;
            double v21 = v4;
            __int16 v22 = 2112;
            uint64_t v23 = self;
            _os_log_fault_impl(&dword_1853B0000, v16, OS_LOG_TYPE_FAULT, "Lock for environment %@ was aquired %.2f seconds ago and might be stuck. This can have a serious impact on focus updates. Additional info:\n%@", (uint8_t *)&v18, 0x20u);
          }
        }
        else
        {
          unint64_t v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25FEB0) + 8);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            unint64_t v12 = self->_environmentDescription;
            int v18 = 138412802;
            v19 = (_UIFocusTreeLockItem *)v12;
            __int16 v20 = 2048;
            double v21 = v4;
            __int16 v22 = 2112;
            uint64_t v23 = self;
            _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "Lock for environment %@ was aquired %.2f seconds ago and might be stuck. This can have a serious impact on focus updates. Additional info:\n%@", (uint8_t *)&v18, 0x20u);
          }
        }
      }
      self->_didSoftAssert = 1;
    }
    if (v4 > 5.0)
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIFocus", &qword_1EB25FEB8);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        uint64_t v13 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v14 = self->_environmentDescription;
          int v18 = 138412546;
          v19 = (_UIFocusTreeLockItem *)v14;
          __int16 v20 = 2048;
          double v21 = v4;
          v8 = "Lock for environment %@ was aquired %.2f seconds ago and might be stuck or take very long to be unlocked.";
          int v9 = v13;
          uint32_t v10 = 22;
          goto LABEL_19;
        }
      }
    }
  }
  else if (os_variant_has_internal_diagnostics())
  {
    v15 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      int v18 = 138412290;
      v19 = self;
      _os_log_fault_impl(&dword_1853B0000, v15, OS_LOG_TYPE_FAULT, "Found a nil focus environment in the list of locked environments. This is a UIKit bug. Additional info:\n%@", (uint8_t *)&v18, 0xCu);
    }
  }
  else
  {
    id v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25FEA8) + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138412290;
      v19 = self;
      v8 = "Found a nil focus environment in the list of locked environments. This is a UIKit bug. Additional info:\n%@";
      int v9 = v7;
      uint32_t v10 = 12;
LABEL_19:
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v18, v10);
    }
  }
}

- (id)description
{
  objc_super v3 = +[UIDescriptionBuilder descriptionBuilderWithObject:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v5 = NSStringFromSelector(sel_environment);
  id v6 = (id)[v3 appendName:v5 object:WeakRetained usingLightweightDescription:1];

  if (!WeakRetained)
  {
    id v7 = NSStringFromSelector(sel_environmentDescription);
    id v8 = (id)[v3 appendName:v7 object:self->_environmentDescription];
  }
  int v9 = NSStringFromSelector(sel_lockCount);
  id v10 = (id)[v3 appendName:v9 unsignedInteger:self->_lockCount];

  id v11 = (id)[v3 appendName:@"duration" doubleValue:CFAbsoluteTimeGetCurrent() - self->_lockTime];
  if (self->_lockCallStackSymbols) {
    id v12 = (id)objc_msgSend(v3, "appendName:object:", @"LOCK call stacks");
  }
  if (self->_unlockCallStackSymbols) {
    id v13 = (id)objc_msgSend(v3, "appendName:object:", @"UNLOCK call stacks");
  }
  v14 = [v3 string];

  return v14;
}

- (UIFocusEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  return (UIFocusEnvironment *)WeakRetained;
}

- (NSString)environmentDescription
{
  return self->_environmentDescription;
}

- (unint64_t)lockCount
{
  return self->_lockCount;
}

- (double)lockTime
{
  return self->_lockTime;
}

- (NSArray)lockCallStackSymbols
{
  return &self->_lockCallStackSymbols->super;
}

- (NSArray)unlockCallStackSymbols
{
  return &self->_unlockCallStackSymbols->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentDescription, 0);
  objc_destroyWeak((id *)&self->_environment);
  objc_storeStrong(&self->_finalUnlockHandler, 0);
  objc_storeStrong((id *)&self->_unlockCallStackSymbols, 0);
  objc_storeStrong((id *)&self->_lockCallStackSymbols, 0);
}

@end