@interface _UISceneEventRegistry
- (id)eventForType:(uint64_t)a1;
- (void)setEvent:(uint64_t)a3 forType:;
@end

@implementation _UISceneEventRegistry

- (id)eventForType:(uint64_t)a1
{
  if (a1)
  {
    v2 = *(void **)(a1 + 8);
    v3 = [NSNumber numberWithInteger:a2];
    v4 = [v2 objectForKey:v3];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setEvent:(uint64_t)a3 forType:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!a2)
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:sel_setEvent_forType_, a1, @"UIEventEnvironment.m", 1256, @"Invalid parameter not satisfying: %@", @"event" object file lineNumber description];
    }
    if (!*(void *)(a1 + 8))
    {
      uint64_t v6 = objc_opt_new();
      v7 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v6;
    }
    v8 = -[_UISceneEventRegistry eventForType:](a1, a3);
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    if (a2) {
      BOOL v10 = v8 == 0;
    }
    else {
      BOOL v10 = 0;
    }
    char v11 = v10;
    if (has_internal_diagnostics)
    {
      if ((v11 & 1) == 0)
      {
        v15 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v18 = a3;
          _os_log_fault_impl(&dword_1853B0000, v15, OS_LOG_TYPE_FAULT, "Adding an event of type %lu when we already have one", buf, 0xCu);
        }

        goto LABEL_15;
      }
    }
    else if ((v11 & 1) == 0)
    {
      v16 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setEvent_forType____s_category) + 8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v18 = a3;
        _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "Adding an event of type %lu when we already have one", buf, 0xCu);
      }
      goto LABEL_15;
    }
    v12 = *(void **)(a1 + 8);
    v13 = [NSNumber numberWithInteger:a3];
    [v12 setObject:a2 forKey:v13];

LABEL_15:
  }
}

- (void).cxx_destruct
{
}

@end