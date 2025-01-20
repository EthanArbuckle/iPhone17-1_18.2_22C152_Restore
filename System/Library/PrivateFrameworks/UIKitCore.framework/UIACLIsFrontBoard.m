@interface UIACLIsFrontBoard
@end

@implementation UIACLIsFrontBoard

void ___UIACLIsFrontBoard_block_invoke()
{
  CFAllocatorRef Default = CFAllocatorGetDefault();
  v1 = SecTaskCreateFromSelf(Default);
  if (v1)
  {
    v2 = v1;
    id v4 = (id)SecTaskCopyValueForEntitlement(v1, @"com.apple.private.xpc.launchd.app-server", 0);
    _MergedGlobals_1099 = [v4 BOOLValue];
    if ((_MergedGlobals_1099 & 1) == 0)
    {
      v3 = (void *)SecTaskCopyValueForEntitlement(v2, @"com.apple.assertiond.system-shell", 0);

      _MergedGlobals_1099 = [v3 BOOLValue];
      id v4 = v3;
    }
    CFRelease(v2);
  }
}

@end