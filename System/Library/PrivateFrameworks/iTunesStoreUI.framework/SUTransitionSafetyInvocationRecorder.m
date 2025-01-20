@interface SUTransitionSafetyInvocationRecorder
- (void)invokeInvocation:(id)a3;
@end

@implementation SUTransitionSafetyInvocationRecorder

- (void)invokeInvocation:(id)a3
{
  [a3 retainArguments];
  v4 = (void *)MEMORY[0x263F1CB68];

  objc_msgSend(v4, "_iTunesStoreUI_enqueueTransitionSafeInvocation:", a3);
}

@end