@interface UIFocusActiveSceneObserver
@end

@implementation UIFocusActiveSceneObserver

void __54___UIFocusActiveSceneObserver_Classic__initWithScene___block_invoke()
{
  _UIMainBundleIdentifier();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_11_5 = [v0 isEqualToString:@"com.apple.CarPlayApp"];
}

void __71___UIFocusActiveSceneObserver_Classic_observerDeliveryPolicyDidChange___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) notifyObserversIfNecessary];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("FocusActiveSceneObserver", &_UIInternalPreference_FocusActiveSceneObserverLoggingInterval_block_invoke___s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    v3 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = *(void **)(a1 + 40);
      v5 = v3;
      v6 = [v4 description];
      v7 = [*(id *)(a1 + 32) description];
      int v8 = 138412546;
      v9 = v6;
      __int16 v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "Focus Active Scene Observer detected event delivery change: %@\n%@", (uint8_t *)&v8, 0x16u);
    }
  }
}

void __72___UIFocusActiveSceneObserver_Classic__screenUUIDDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        int v8 = objc_msgSend(v7, "screen", (void)v16);
        v9 = *(void **)(a1 + 40);

        if (v8 == v9)
        {
          [*(id *)(a1 + 48) _removeDeliverObserverForWindow:v7];
          [*(id *)(a1 + 48) _addDeliveryObserverForWindow:v7];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v4);
  }

  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("FocusActiveSceneObserver", &_UIInternalPreference_FocusActiveSceneObserverLoggingInterval_block_invoke_2___s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    v11 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void **)(a1 + 56);
      v13 = v11;
      v14 = [v12 description];
      v15 = [*(id *)(a1 + 48) description];
      *(_DWORD *)buf = 138412546;
      v21 = v14;
      __int16 v22 = 2112;
      v23 = v15;
      _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "Focus Active Scene Observer detected screen UUID change: %@\n%@", buf, 0x16u);
    }
  }
}

void __71___UIFocusActiveSceneObserver_Classic__keyWindowDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) notifyObserversIfNecessary];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("FocusActiveSceneObserver", &_UIInternalPreference_FocusActiveSceneObserverLoggingInterval_block_invoke_3___s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    uint64_t v3 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void **)(a1 + 40);
      uint64_t v5 = v3;
      v6 = [v4 description];
      v7 = [*(id *)(a1 + 32) description];
      int v8 = 138412546;
      v9 = v6;
      __int16 v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "Focus Active Scene Observer detected key window change: %@\n%@", (uint8_t *)&v8, 0x16u);
    }
  }
}

@end