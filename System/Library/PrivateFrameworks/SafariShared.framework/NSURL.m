@interface NSURL
@end

@implementation NSURL

void __68__NSURL_SafariSharedExtras___safari_isWithinQuirkedNavigationScope___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  id v7 = a3;
  if ([*(id *)(a1 + 32) hasPrefix:v8])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 40) hasPrefix:v7];
    *a4 = 1;
  }
}

@end