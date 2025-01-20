@interface ShareSheetIsBrowser
@end

@implementation ShareSheetIsBrowser

void ___ShareSheetIsBrowser_block_invoke()
{
  CFAllocatorRef Default = CFAllocatorGetDefault();
  v1 = SecTaskCreateFromSelf(Default);
  if (v1)
  {
    v2 = v1;
    id v3 = (id)SecTaskCopyValueForEntitlement(v1, @"com.apple.developer.web-browser", 0);
    CFRelease(v2);
    _ShareSheetIsBrowser_hostHasEntitlement = [v3 BOOLValue];
  }
}

@end