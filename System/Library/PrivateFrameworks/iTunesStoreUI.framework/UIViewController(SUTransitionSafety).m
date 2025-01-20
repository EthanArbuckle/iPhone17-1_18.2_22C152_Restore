@interface UIViewController(SUTransitionSafety)
+ (SUTransitionSafetyDelegate)transitionSafetyDelegate;
+ (SUTransitionSafetyInvocationRecorder)transitionSafePerformer:()SUTransitionSafety;
+ (uint64_t)_iTunesStoreUI_dequeueTransitionSafeInvocations;
+ (uint64_t)endTransitionSafety;
+ (void)_iTunesStoreUI_enqueueTransitionSafeInvocation:()SUTransitionSafety;
+ (void)_iTunesStoreUI_timeoutTransitionSafety;
+ (void)beginTransitionSafety;
- (uint64_t)transitionSafePresentModalViewController:()SUTransitionSafety animated:;
@end

@implementation UIViewController(SUTransitionSafety)

+ (uint64_t)_iTunesStoreUI_dequeueTransitionSafeInvocations
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "endIgnoringInteractionEvents");
  if (__TransitionSafetyTimer)
  {
    dispatch_source_cancel((dispatch_source_t)__TransitionSafetyTimer);
    dispatch_release((dispatch_object_t)__TransitionSafetyTimer);
    __TransitionSafetyTimer = 0;
  }
  uint64_t result = [(id)__TransitionSafetyInvocations count];
  if (result >= 1 && __TransitionSafetyCount == 0)
  {
    uint64_t v2 = result;
    uint64_t v3 = 1;
    do
    {
      objc_msgSend((id)objc_msgSend((id)__TransitionSafetyInvocations, "objectAtIndex:", 0), "invoke");
      uint64_t result = [(id)__TransitionSafetyInvocations removeObjectAtIndex:0];
      if (v3 >= v2) {
        break;
      }
      ++v3;
    }
    while (!__TransitionSafetyCount);
  }
  return result;
}

+ (void)_iTunesStoreUI_enqueueTransitionSafeInvocation:()SUTransitionSafety
{
  if (__TransitionSafetyCount)
  {
    id v4 = (id)__TransitionSafetyInvocations;
    if (!__TransitionSafetyInvocations)
    {
      id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
      __TransitionSafetyInvocations = (uint64_t)v4;
    }
    [v4 addObject:a3];
    v5 = __TransitionSafetyTimer;
    if (__TransitionSafetyTimer)
    {
      dispatch_time_t v6 = dispatch_time(0, 1000000000);
      dispatch_source_set_timer(v5, v6, 0, 0);
    }
    else
    {
      v7 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
      __TransitionSafetyTimer = (uint64_t)v7;
      dispatch_time_t v8 = dispatch_time(0, 1000000000);
      dispatch_source_set_timer(v7, v8, 0, 0);
      dispatch_source_set_event_handler((dispatch_source_t)__TransitionSafetyTimer, &__block_literal_global_5);
      v9 = __TransitionSafetyTimer;
      dispatch_resume(v9);
    }
  }
  else
  {
    [a3 invoke];
  }
}

+ (void)_iTunesStoreUI_timeoutTransitionSafety
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (__TransitionSafetyTimer)
  {
    dispatch_source_cancel((dispatch_source_t)__TransitionSafetyTimer);
    dispatch_release((dispatch_object_t)__TransitionSafetyTimer);
    __TransitionSafetyTimer = 0;
  }
  if (__TransitionSafetyCount >= 1)
  {
    uint64_t v2 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v3 = [v2 shouldLog];
    if ([v2 shouldLogToDisk]) {
      int v4 = v3 | 2;
    }
    else {
      int v4 = v3;
    }
    if (!os_log_type_enabled((os_log_t)[v2 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v4 &= 2u;
    }
    if (v4)
    {
      int v10 = 138412546;
      uint64_t v11 = objc_opt_class();
      __int16 v12 = 2048;
      uint64_t v13 = __TransitionSafetyCount;
      LODWORD(v9) = 22;
      dispatch_time_t v8 = &v10;
      uint64_t v5 = _os_log_send_and_compose_impl();
      if (v5)
      {
        dispatch_time_t v6 = (void *)v5;
        uint64_t v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v5, 4, &v10, v9);
        free(v6);
        dispatch_time_t v8 = (int *)v7;
        SSFileLog();
      }
    }
    if (__TransitionSafetyCount >= 1)
    {
      do
        objc_msgSend(a1, "endTransitionSafety", v8);
      while (__TransitionSafetyCount > 0);
    }
  }
}

+ (void)beginTransitionSafety
{
}

+ (uint64_t)endTransitionSafety
{
  BOOL v1 = __TransitionSafetyCount == 1;
  if (__TransitionSafetyCount >= 1)
  {
    --__TransitionSafetyCount;
    if (v1)
    {
      uint64_t v2 = (void *)result;
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "beginIgnoringInteractionEvents");
      return [v2 performSelector:sel__iTunesStoreUI_dequeueTransitionSafeInvocations withObject:0 afterDelay:0.0];
    }
  }
  return result;
}

+ (SUTransitionSafetyInvocationRecorder)transitionSafePerformer:()SUTransitionSafety
{
  if (!a3) {
    return 0;
  }
  int v3 = [(ISInvocationRecorder *)[SUTransitionSafetyInvocationRecorder alloc] initWithTarget:a3];

  return v3;
}

+ (SUTransitionSafetyDelegate)transitionSafetyDelegate
{
  uint64_t result = (SUTransitionSafetyDelegate *)__TransitionSafetyDelegate;
  if (!__TransitionSafetyDelegate)
  {
    uint64_t result = objc_alloc_init(SUTransitionSafetyDelegate);
    __TransitionSafetyDelegate = (uint64_t)result;
  }
  return result;
}

- (uint64_t)transitionSafePresentModalViewController:()SUTransitionSafety animated:
{
  if ([a1 presentedViewController]) {
    [a1 dismissViewControllerAnimated:a4 completion:0];
  }
  uint64_t v7 = (void *)[(id)objc_opt_class() transitionSafePerformer:a1];

  return [v7 presentViewController:a3 animated:1 completion:0];
}

@end