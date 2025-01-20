@interface _UIPopoverHostManagerProviderMac
+ (BOOL)_defaultsUseNSPopover;
+ (id)managerForPresentationController:(id)a3;
+ (id)sharedPopoverManager;
@end

@implementation _UIPopoverHostManagerProviderMac

+ (id)managerForPresentationController:(id)a3
{
  return 0;
}

+ (id)sharedPopoverManager
{
  if (_MergedGlobals_1230 != -1) {
    dispatch_once(&_MergedGlobals_1230, &__block_literal_global_504);
  }
  v2 = (void *)qword_1EB262FE8;
  return v2;
}

+ (BOOL)_defaultsUseNSPopover
{
  return 0;
}

@end