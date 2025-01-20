@interface FBSceneWorkspace(PosterUIFoundation)
+ (id)pui_posterWorkspace;
@end

@implementation FBSceneWorkspace(PosterUIFoundation)

+ (id)pui_posterWorkspace
{
  if (pui_posterWorkspace_onceToken != -1) {
    dispatch_once(&pui_posterWorkspace_onceToken, &__block_literal_global_2);
  }
  v0 = (void *)pui_posterWorkspace___PosterWorkspace;
  return v0;
}

@end