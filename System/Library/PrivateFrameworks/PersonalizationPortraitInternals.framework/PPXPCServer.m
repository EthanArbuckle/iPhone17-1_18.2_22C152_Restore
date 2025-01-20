@interface PPXPCServer
+ (void)_registerConfigListener;
+ (void)_registerConnectionsListener;
+ (void)_registerContactListener;
+ (void)_registerEventListener;
+ (void)_registerInternalListener;
+ (void)_registerLocationReadOnlyListener;
+ (void)_registerLocationReadWriteListener;
+ (void)_registerNamedEntityReadOnlyListener;
+ (void)_registerNamedEntityReadWriteListener;
+ (void)_registerQuickTypeListener;
+ (void)_registerSocialHighlightListener;
+ (void)_registerStringDonationListener;
+ (void)_registerTemporalClusterListener;
+ (void)_registerTopicReadOnlyListener;
+ (void)_registerTopicReadWriteListener;
+ (void)registerXPCListeners;
@end

@implementation PPXPCServer

+ (void)registerXPCListeners
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __35__PPXPCServer_registerXPCListeners__block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_B8__0l;
  aBlock[4] = a1;
  v2 = _Block_copy(aBlock);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__PPXPCServer_registerXPCListeners__block_invoke_71;
  v5[3] = &unk_1E65D8B20;
  id v6 = v2;
  uint64_t v3 = registerXPCListeners__pasOnceToken18;
  id v4 = v2;
  if (v3 != -1) {
    dispatch_once(&registerXPCListeners__pasOnceToken18, v5);
  }
}

uint64_t __35__PPXPCServer_registerXPCListeners__block_invoke(uint64_t a1)
{
  v2 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_INFO, "Registering for Portrait XPC services", v4, 2u);
  }

  [*(id *)(a1 + 32) _registerNamedEntityReadOnlyListener];
  [*(id *)(a1 + 32) _registerNamedEntityReadWriteListener];
  [*(id *)(a1 + 32) _registerTopicReadOnlyListener];
  [*(id *)(a1 + 32) _registerTopicReadWriteListener];
  [*(id *)(a1 + 32) _registerLocationReadOnlyListener];
  [*(id *)(a1 + 32) _registerLocationReadWriteListener];
  [*(id *)(a1 + 32) _registerQuickTypeListener];
  [*(id *)(a1 + 32) _registerContactListener];
  [*(id *)(a1 + 32) _registerEventListener];
  [*(id *)(a1 + 32) _registerConnectionsListener];
  [*(id *)(a1 + 32) _registerConfigListener];
  [*(id *)(a1 + 32) _registerInternalListener];
  [*(id *)(a1 + 32) _registerStringDonationListener];
  [*(id *)(a1 + 32) _registerSocialHighlightListener];
  [*(id *)(a1 + 32) _registerTemporalClusterListener];
  return 1;
}

void __35__PPXPCServer_registerXPCListeners__block_invoke_71(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1CB79D060]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)_registerTemporalClusterListener
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = (void *)_registerTemporalClusterListener_delegate;
  _registerTemporalClusterListener_delegate = v2;

  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.proactive.PersonalizationPortrait.TemporalCluster"];
  v5 = (void *)_registerTemporalClusterListener_listener;
  _registerTemporalClusterListener_listener = v4;

  [(id)_registerTemporalClusterListener_listener setDelegate:_registerTemporalClusterListener_delegate];
  [(id)_registerTemporalClusterListener_listener resume];
  id v6 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEBUG, "Registered for TemporalCluster XPC service", v7, 2u);
  }
}

+ (void)_registerSocialHighlightListener
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = (void *)_registerSocialHighlightListener_delegate;
  _registerSocialHighlightListener_delegate = v2;

  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.proactive.PersonalizationPortrait.SocialHighlight"];
  v5 = (void *)_registerSocialHighlightListener_listener;
  _registerSocialHighlightListener_listener = v4;

  [(id)_registerSocialHighlightListener_listener setDelegate:_registerSocialHighlightListener_delegate];
  [(id)_registerSocialHighlightListener_listener resume];
  id v6 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEBUG, "Registered for Social Highlight XPC service", v7, 2u);
  }
}

+ (void)_registerStringDonationListener
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = (void *)_registerStringDonationListener_delegate;
  _registerStringDonationListener_delegate = v2;

  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.suggestd.PersonalizationPortrait.StringDonation"];
  v5 = (void *)_registerStringDonationListener_listener;
  _registerStringDonationListener_listener = v4;

  [(id)_registerStringDonationListener_listener setDelegate:_registerStringDonationListener_delegate];
  [(id)_registerStringDonationListener_listener resume];
  id v6 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEBUG, "Registered for String Donation", v7, 2u);
  }
}

+ (void)_registerInternalListener
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = (void *)_registerInternalListener_delegate;
  _registerInternalListener_delegate = v2;

  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.proactive.PersonalizationPortrait.Internal"];
  v5 = (void *)_registerInternalListener_listener;
  _registerInternalListener_listener = v4;

  [(id)_registerInternalListener_listener setDelegate:_registerInternalListener_delegate];
  [(id)_registerInternalListener_listener resume];
  id v6 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEBUG, "Registered for Internal XPC service", v7, 2u);
  }
}

+ (void)_registerConfigListener
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = (void *)_registerConfigListener_delegate;
  _registerConfigListener_delegate = v2;

  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.proactive.PersonalizationPortrait.Config"];
  v5 = (void *)_registerConfigListener_listener;
  _registerConfigListener_listener = v4;

  [(id)_registerConfigListener_listener setDelegate:_registerConfigListener_delegate];
  [(id)_registerConfigListener_listener resume];
  id v6 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEBUG, "Registered for Config XPC service", v7, 2u);
  }
}

+ (void)_registerConnectionsListener
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = (void *)_registerConnectionsListener_delegate;
  _registerConnectionsListener_delegate = v2;

  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.proactive.PersonalizationPortrait.Connections"];
  v5 = (void *)_registerConnectionsListener_listener;
  _registerConnectionsListener_listener = v4;

  [(id)_registerConnectionsListener_listener setDelegate:_registerConnectionsListener_delegate];
  [(id)_registerConnectionsListener_listener resume];
  id v6 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEBUG, "Registered for Connections XPC service", v7, 2u);
  }
}

+ (void)_registerEventListener
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = (void *)_registerEventListener_delegate;
  _registerEventListener_delegate = v2;

  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.proactive.PersonalizationPortrait.Event"];
  v5 = (void *)_registerEventListener_listener;
  _registerEventListener_listener = v4;

  [(id)_registerEventListener_listener setDelegate:_registerEventListener_delegate];
  [(id)_registerEventListener_listener resume];
  id v6 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEBUG, "Registered for Event XPC service", v7, 2u);
  }
}

+ (void)_registerContactListener
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = (void *)_registerContactListener_delegate;
  _registerContactListener_delegate = v2;

  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.proactive.PersonalizationPortrait.Contact"];
  v5 = (void *)_registerContactListener_listener;
  _registerContactListener_listener = v4;

  [(id)_registerContactListener_listener setDelegate:_registerContactListener_delegate];
  [(id)_registerContactListener_listener resume];
  id v6 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEBUG, "Registered for Contact XPC service", v7, 2u);
  }
}

+ (void)_registerQuickTypeListener
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = (void *)_registerQuickTypeListener_delegate;
  _registerQuickTypeListener_delegate = v2;

  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.proactive.PersonalizationPortrait.QuickType"];
  v5 = (void *)_registerQuickTypeListener_listener;
  _registerQuickTypeListener_listener = v4;

  [(id)_registerQuickTypeListener_listener setDelegate:_registerQuickTypeListener_delegate];
  [(id)_registerQuickTypeListener_listener resume];
  id v6 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEBUG, "Registered for QuickType XPC service", v7, 2u);
  }
}

+ (void)_registerLocationReadWriteListener
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = (void *)_registerLocationReadWriteListener_delegate;
  _registerLocationReadWriteListener_delegate = v2;

  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.proactive.PersonalizationPortrait.Location.readWrite"];
  v5 = (void *)_registerLocationReadWriteListener_listener;
  _registerLocationReadWriteListener_listener = v4;

  [(id)_registerLocationReadWriteListener_listener setDelegate:_registerLocationReadWriteListener_delegate];
  [(id)_registerLocationReadWriteListener_listener resume];
  id v6 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEBUG, "Registered for Location Read/Write XPC service", v7, 2u);
  }
}

+ (void)_registerLocationReadOnlyListener
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = (void *)_registerLocationReadOnlyListener_delegate;
  _registerLocationReadOnlyListener_delegate = v2;

  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.proactive.PersonalizationPortrait.Location.readOnly"];
  v5 = (void *)_registerLocationReadOnlyListener_listener;
  _registerLocationReadOnlyListener_listener = v4;

  [(id)_registerLocationReadOnlyListener_listener setDelegate:_registerLocationReadOnlyListener_delegate];
  [(id)_registerLocationReadOnlyListener_listener resume];
  id v6 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEBUG, "Registered for Location Read Only XPC service", v7, 2u);
  }
}

+ (void)_registerTopicReadWriteListener
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = (void *)_registerTopicReadWriteListener_delegate;
  _registerTopicReadWriteListener_delegate = v2;

  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.proactive.PersonalizationPortrait.Topic.readWrite"];
  v5 = (void *)_registerTopicReadWriteListener_listener;
  _registerTopicReadWriteListener_listener = v4;

  [(id)_registerTopicReadWriteListener_listener setDelegate:_registerTopicReadWriteListener_delegate];
  [(id)_registerTopicReadWriteListener_listener resume];
  id v6 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEBUG, "Registered for Topic Read/Write XPC service", v7, 2u);
  }
}

+ (void)_registerTopicReadOnlyListener
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = (void *)_registerTopicReadOnlyListener_delegate;
  _registerTopicReadOnlyListener_delegate = v2;

  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.proactive.PersonalizationPortrait.Topic.readOnly"];
  v5 = (void *)_registerTopicReadOnlyListener_listener;
  _registerTopicReadOnlyListener_listener = v4;

  [(id)_registerTopicReadOnlyListener_listener setDelegate:_registerTopicReadOnlyListener_delegate];
  [(id)_registerTopicReadOnlyListener_listener resume];
  id v6 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEBUG, "Registered for Topic Read Only XPC service", v7, 2u);
  }
}

+ (void)_registerNamedEntityReadWriteListener
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = (void *)_registerNamedEntityReadWriteListener_delegate;
  _registerNamedEntityReadWriteListener_delegate = v2;

  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.proactive.PersonalizationPortrait.NamedEntity.readWrite"];
  v5 = (void *)_registerNamedEntityReadWriteListener_listener;
  _registerNamedEntityReadWriteListener_listener = v4;

  [(id)_registerNamedEntityReadWriteListener_listener setDelegate:_registerNamedEntityReadWriteListener_delegate];
  [(id)_registerNamedEntityReadWriteListener_listener resume];
  id v6 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEBUG, "Registered for Named Entity Read/Write XPC service", v7, 2u);
  }
}

+ (void)_registerNamedEntityReadOnlyListener
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = (void *)_registerNamedEntityReadOnlyListener_delegate;
  _registerNamedEntityReadOnlyListener_delegate = v2;

  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.proactive.PersonalizationPortrait.NamedEntity.readOnly"];
  v5 = (void *)_registerNamedEntityReadOnlyListener_listener;
  _registerNamedEntityReadOnlyListener_listener = v4;

  [(id)_registerNamedEntityReadOnlyListener_listener setDelegate:_registerNamedEntityReadOnlyListener_delegate];
  [(id)_registerNamedEntityReadOnlyListener_listener resume];
  id v6 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEBUG, "Registered for Named Entity Read Only XPC service", v7, 2u);
  }
}

@end