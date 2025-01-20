@interface _UIFenceTask
+ (BOOL)_processRequiresFenceAssertions;
- (_UIFenceTask)init;
- (void)dealloc;
- (void)invalidate;
@end

@implementation _UIFenceTask

- (void).cxx_destruct
{
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_lock_invalidated = 1;
    os_unfair_lock_unlock(p_lock);
    assertion = self->_assertion;
    [(BKSProcessAssertion *)assertion invalidate];
  }
}

- (_UIFenceTask)init
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)_UIFenceTask;
  v2 = [(_UIFenceTask *)&v13 init];
  v3 = v2;
  if (v2)
  {
    unint64_t v4 = atomic_fetch_add(&qword_1EB265158, 1uLL) + 1;
    v2->_identifier = v4;
    if (os_variant_has_internal_diagnostics())
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Fence", &qword_1EB265160);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        v11 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          unint64_t v15 = v4;
          _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "_UIFenceTask:%llu created", buf, 0xCu);
        }
      }
    }
    v3->_lock._os_unfair_lock_opaque = 0;
    v3->_lock_invalidated = 0;
    if (+[_UIFenceTask _processRequiresFenceAssertions])
    {
      id v5 = objc_alloc(MEMORY[0x1E4F4E280]);
      uint64_t v6 = getpid();
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __20___UIFenceTask_init__block_invoke;
      v12[3] = &__block_descriptor_40_e8_v12__0B8l;
      v12[4] = v4;
      uint64_t v7 = [v5 initWithPID:v6 flags:7 reason:4 name:@"systemAnimationFence" withHandler:v12];
      assertion = v3->_assertion;
      v3->_assertion = (BKSProcessAssertion *)v7;
    }
  }
  return v3;
}

+ (BOOL)_processRequiresFenceAssertions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)&algn_1EB265152[2]);
  if ((_MergedGlobals_1329 & 1) == 0)
  {
    v2 = [MEMORY[0x1E4F963E8] currentProcess];
    v3 = [v2 currentState];

    if (v3)
    {
      _MergedGlobals_1329 = 1;
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      unint64_t v4 = [v3 assertions];
      uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v14;
        while (2)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v14 != v7) {
              objc_enumerationMutation(v4);
            }
            v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) domain];
            if ([v9 hasPrefix:@"com.apple.underlying"]
              && [v9 rangeOfString:@"DarwinRoleUI"] != 0x7FFFFFFFFFFFFFFFLL)
            {
              if (os_variant_has_internal_diagnostics())
              {
                v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("Fence", &qword_1EB265168) + 8);
                if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)v12 = 0;
                  _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_DEFAULT, "Found underlying UI assertion! Fence assertions are disabled for this process.", v12, 2u);
                }
              }
              byte_1EB265151 = 1;

              goto LABEL_15;
            }
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
LABEL_15:
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&algn_1EB265152[2]);
  return (byte_1EB265151 & 1) == 0;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_invalidated)
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIFenceTask.m", 56, @"must invalidate _UIFenceTask:%llu before dealloc", self->_identifier);
  }
  if (os_variant_has_internal_diagnostics())
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Fence", &dealloc___s_category_14);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      uint64_t v7 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        unint64_t identifier = self->_identifier;
        *(_DWORD *)buf = 134217984;
        unint64_t v11 = identifier;
        _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "_UIFenceTask:%llu destroyed", buf, 0xCu);
      }
    }
  }
  os_unfair_lock_unlock(p_lock);
  v9.receiver = self;
  v9.super_class = (Class)_UIFenceTask;
  [(_UIFenceTask *)&v9 dealloc];
}

@end