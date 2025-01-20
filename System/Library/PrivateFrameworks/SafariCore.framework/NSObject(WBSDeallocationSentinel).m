@interface NSObject(WBSDeallocationSentinel)
- (uint64_t)safari_setDeallocationSentinelForObserver:()WBSDeallocationSentinel;
- (void)safari_removeDeallocationSentinelForObserver:()WBSDeallocationSentinel;
- (void)safari_setDeallocationSentinelForObserver:()WBSDeallocationSentinel withContext:;
@end

@implementation NSObject(WBSDeallocationSentinel)

- (uint64_t)safari_setDeallocationSentinelForObserver:()WBSDeallocationSentinel
{
  return objc_msgSend(a1, "safari_setDeallocationSentinelForObserver:withContext:", a3, 0);
}

- (void)safari_setDeallocationSentinelForObserver:()WBSDeallocationSentinel withContext:
{
  id v6 = a4;
  id v7 = a3;
  value = [[_WBSDeallocationSentinel alloc] initWithObserver:v7 context:v6];

  objc_setAssociatedObject(a1, v7, value, (void *)1);
}

- (void)safari_removeDeallocationSentinelForObserver:()WBSDeallocationSentinel
{
  id v4 = a3;
  objc_getAssociatedObject(a1, v4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setObserver:0];
  objc_setAssociatedObject(a1, v4, 0, (void *)1);
}

@end