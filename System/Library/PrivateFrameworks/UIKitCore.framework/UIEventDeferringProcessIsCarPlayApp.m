@interface UIEventDeferringProcessIsCarPlayApp
@end

@implementation UIEventDeferringProcessIsCarPlayApp

void ___UIEventDeferringProcessIsCarPlayApp_block_invoke(uint64_t a1)
{
  _UIMainBundleIdentifier();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_1193 = [v2 isEqualToString:*(void *)(a1 + 32)];
}

@end