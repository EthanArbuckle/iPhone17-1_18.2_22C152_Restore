@interface FBSDisplayMonitor(PosterUIFoundation)
+ (id)pui_sharedDisplayMonitor;
@end

@implementation FBSDisplayMonitor(PosterUIFoundation)

+ (id)pui_sharedDisplayMonitor
{
  if (pui_sharedDisplayMonitor_onceToken != -1) {
    dispatch_once(&pui_sharedDisplayMonitor_onceToken, &__block_literal_global_23);
  }
  v0 = (void *)pui_sharedDisplayMonitor_displayMonitor;
  return v0;
}

@end