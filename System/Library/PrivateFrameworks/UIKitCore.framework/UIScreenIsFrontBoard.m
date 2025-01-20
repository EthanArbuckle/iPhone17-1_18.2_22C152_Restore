@interface UIScreenIsFrontBoard
@end

@implementation UIScreenIsFrontBoard

void ___UIScreenIsFrontBoard_block_invoke()
{
  CFAllocatorRef Default = CFAllocatorGetDefault();
  v1 = SecTaskCreateFromSelf(Default);
  if (v1)
  {
    v2 = v1;
    id v4 = (id)SecTaskCopyValueForEntitlement(v1, @"com.apple.private.xpc.launchd.app-server", 0);
    byte_1EB25C542 = [v4 BOOLValue];
    if ((byte_1EB25C542 & 1) == 0)
    {
      v3 = (void *)SecTaskCopyValueForEntitlement(v2, @"com.apple.assertiond.system-shell", 0);

      byte_1EB25C542 = [v3 BOOLValue];
      id v4 = v3;
    }
    CFRelease(v2);
  }
}

@end