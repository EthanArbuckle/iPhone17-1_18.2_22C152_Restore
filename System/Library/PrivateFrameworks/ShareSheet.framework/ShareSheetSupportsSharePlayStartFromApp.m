@interface ShareSheetSupportsSharePlayStartFromApp
@end

@implementation ShareSheetSupportsSharePlayStartFromApp

void ___ShareSheetSupportsSharePlayStartFromApp_block_invoke()
{
  CFAllocatorRef Default = CFAllocatorGetDefault();
  v1 = SecTaskCreateFromSelf(Default);
  if (v1)
  {
    v2 = v1;
    id v3 = (id)SecTaskCopyValueForEntitlement(v1, @"com.apple.developer.group-session", 0);
    CFRelease(v2);
    _ShareSheetSupportsSharePlayStartFromApp_hostEntitledForSharePlay = [v3 BOOLValue];
  }
}

@end