@interface UIBarButtonItem(TelephonyUI)
+ (id)telephonyUI_fixedSpaceBarButtonItem;
+ (id)telephonyUI_flexibleSpaceBarButtonItem;
@end

@implementation UIBarButtonItem(TelephonyUI)

+ (id)telephonyUI_fixedSpaceBarButtonItem
{
  v0 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:6 target:0 action:0];
  return v0;
}

+ (id)telephonyUI_flexibleSpaceBarButtonItem
{
  v0 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
  return v0;
}

@end