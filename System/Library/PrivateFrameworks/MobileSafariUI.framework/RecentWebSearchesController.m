@interface RecentWebSearchesController
+ (BOOL)_shouldTrackSearches;
+ (id)sharedController;
@end

@implementation RecentWebSearchesController

+ (id)sharedController
{
  if (+[RecentWebSearchesController sharedController]::onceToken != -1) {
    dispatch_once(&+[RecentWebSearchesController sharedController]::onceToken, &__block_literal_global_24);
  }
  v2 = (void *)+[RecentWebSearchesController sharedController]::sharedController;
  return v2;
}

void __47__RecentWebSearchesController_sharedController__block_invoke()
{
  v0 = objc_alloc_init(RecentWebSearchesController);
  v1 = (void *)+[RecentWebSearchesController sharedController]::sharedController;
  +[RecentWebSearchesController sharedController]::sharedController = (uint64_t)v0;
}

+ (BOOL)_shouldTrackSearches
{
  v2 = +[Application sharedApplication];
  char v3 = [v2 usesDefaultBrowsingModeInAllWindows];

  return v3;
}

@end