@interface UIWebClipEligibilityObserver
+ (id)sharedObserver;
- (id)_init;
- (void)_updateEligibilityIfNeeded;
- (void)dealloc;
- (void)startObservingEligibility;
@end

@implementation UIWebClipEligibilityObserver

+ (id)sharedObserver
{
  if (qword_1EB2653A8 != -1) {
    dispatch_once(&qword_1EB2653A8, &__block_literal_global_828);
  }
  v2 = (void *)_MergedGlobals_1333;
  return v2;
}

void __46__UIWebClipEligibilityObserver_sharedObserver__block_invoke()
{
  id v0 = [[UIWebClipEligibilityObserver alloc] _init];
  v1 = (void *)_MergedGlobals_1333;
  _MergedGlobals_1333 = (uint64_t)v0;
}

- (id)_init
{
  v7.receiver = self;
  v7.super_class = (Class)UIWebClipEligibilityObserver;
  v2 = [(UIWebClipEligibilityObserver *)&v7 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.UIKit.webClipEligibilityObserver", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)startObservingEligibility
{
  if (!self->_notifyToken)
  {
    dispatch_queue_t v3 = [MEMORY[0x1E4F28B50] mainBundle];
    v4 = [v3 bundleIdentifier];
    int v5 = [v4 isEqualToString:@"com.apple.springboard"];

    if (v5)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __57__UIWebClipEligibilityObserver_startObservingEligibility__block_invoke;
      block[3] = &unk_1E52D9F70;
      block[4] = self;
      if (startObservingEligibility_onceTokenCompletion != -1) {
        dispatch_once(&startObservingEligibility_onceTokenCompletion, block);
      }
    }
  }
}

uint64_t __57__UIWebClipEligibilityObserver_startObservingEligibility__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  dispatch_queue_t v3 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__UIWebClipEligibilityObserver_startObservingEligibility__block_invoke_2;
  block[3] = &unk_1E52D9F70;
  block[4] = v2;
  dispatch_async(v3, block);
  int v4 = _os_feature_enabled_impl();
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 16);
  if (v4)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __57__UIWebClipEligibilityObserver_startObservingEligibility__block_invoke_3;
    v11[3] = &unk_1E52E5DD8;
    v11[4] = v5;
    objc_super v7 = "com.apple.os-eligibility-domain.change.yttrium";
    v8 = v11;
  }
  else
  {
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __57__UIWebClipEligibilityObserver_startObservingEligibility__block_invoke_4;
    handler[3] = &unk_1E52E5DD8;
    handler[4] = v5;
    objc_super v7 = "com.apple.os-eligibility-domain.change.beryllium";
    v8 = handler;
  }
  return notify_register_dispatch(v7, (int *)(v5 + 8), v6, v8);
}

uint64_t __57__UIWebClipEligibilityObserver_startObservingEligibility__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateEligibilityIfNeeded];
}

uint64_t __57__UIWebClipEligibilityObserver_startObservingEligibility__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateEligibilityIfNeeded];
}

uint64_t __57__UIWebClipEligibilityObserver_startObservingEligibility__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateEligibilityIfNeeded];
}

- (void)_updateEligibilityIfNeeded
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(id)objc_opt_class() webClips];
  uint64_t v3 = [(id)objc_opt_class() _determineEligibility];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v9, "_subjectToEligibilityUpdates", (void)v10)) {
          [v9 _updateWebClipWithEligibility:v3];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)dealloc
{
  int notifyToken = self->_notifyToken;
  if (notifyToken) {
    notify_cancel(notifyToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)UIWebClipEligibilityObserver;
  [(UIWebClipEligibilityObserver *)&v4 dealloc];
}

- (void).cxx_destruct
{
}

@end