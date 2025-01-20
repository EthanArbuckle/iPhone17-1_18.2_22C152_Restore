@interface UIApplicationInitializeForBackgroundTasks
@end

@implementation UIApplicationInitializeForBackgroundTasks

void ___UIApplicationInitializeForBackgroundTasks_block_invoke()
{
  id v0 = [(id)UIApp _systemAnimationFenceExemptQueue];
  [v0 performAsync:&__block_literal_global_63_1];
}

void ___UIApplicationInitializeForBackgroundTasks_block_invoke_2()
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("BackgroundTask", &qword_1EB260A60);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    v16 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v27) = 136315138;
      *(void *)((char *)&v27 + 4) = "void _UIApplicationInitializeForBackgroundTasks(void)_block_invoke_2";
      _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "%s: Received assertionExpirationImminent notification", (uint8_t *)&v27, 0xCu);
    }
  }
  id v1 = (id)UIApp;
  *(void *)&long long v27 = 0;
  *((void *)&v27 + 1) = &v27;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__100;
  v30 = __Block_byref_object_dispose__100;
  id v31 = 0;
  v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("BackgroundTask", &qword_1EB260A90) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEFAULT, "Firing background task expiration handlers", buf, 2u);
  }
  v3 = +[_UIBackgroundTaskInfo backgroundTaskAssertionQueue];
  *(void *)buf = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = ___fireBackgroundExpirationHandlers_block_invoke;
  v22 = &unk_1E52E4728;
  id v4 = v1;
  id v23 = v4;
  v24 = &v27;
  dispatch_sync(v3, buf);

  v5 = *(NSMapTable **)(*((void *)&v27 + 1) + 40);
  if (v5 && NSCountMapTable(v5))
  {
    memset(&enumerator, 0, sizeof(enumerator));
    NSEnumerateMapTable(&enumerator, *(NSMapTable **)(*((void *)&v27 + 1) + 40));
    for (value = 0; NSNextMapEnumeratorPair(&enumerator, 0, &value); [value fireExpirationHandler])
    {
      v6 = *(id *)(__UILogGetCategoryCachedImpl("BackgroundTask", &qword_1EB260AA0) + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = [value description];
        *(_DWORD *)v25 = 138477827;
        v26 = v7;
        _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEFAULT, "Calling expiration handler for task: %{private}@", v25, 0xCu);
      }
    }
    NSEndMapTableEnumeration(&enumerator);
    id v9 = self;
  }
  else
  {
    v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("BackgroundTask", &qword_1EB260AA8) + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(enumerator._pi) = 0;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "No background tasks to fire expiration handlers for.", (uint8_t *)&enumerator, 2u);
    }
  }
  os_unfair_lock_lock(&stru_1EB2609F4);
  uint64_t v10 = [(id)qword_1EB260A40 copy];
  v11 = *(void **)(*((void *)&v27 + 1) + 40);
  *(void *)(*((void *)&v27 + 1) + 40) = v10;

  os_unfair_lock_unlock(&stru_1EB2609F4);
  v12 = *(NSMapTable **)(*((void *)&v27 + 1) + 40);
  if (v12)
  {
    memset(&enumerator, 0, sizeof(enumerator));
    NSEnumerateMapTable(&enumerator, v12);
    value = 0;
    while (NSNextMapEnumeratorPair(&enumerator, 0, &value))
    {
      v13 = *(id *)(__UILogGetCategoryCachedImpl("BackgroundTask", &qword_1EB260AB0) + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = [value description];
        *(_DWORD *)v25 = 138477827;
        v26 = v14;
        _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "Background task still not ended after expiration handlers were called: %{private}@. This app will likely be terminated by the system. Call UIApplication.endBackgroundTask(_:) to avoid this.", v25, 0xCu);
      }
    }
    NSEndMapTableEnumeration(&enumerator);
    id v15 = self;
  }

  _Block_object_dispose(&v27, 8);
}

@end