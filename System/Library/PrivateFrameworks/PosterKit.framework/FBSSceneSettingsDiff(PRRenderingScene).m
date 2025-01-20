@interface FBSSceneSettingsDiff(PRRenderingScene)
- (uint64_t)pr_unlockProgressDidChange;
@end

@implementation FBSSceneSettingsDiff(PRRenderingScene)

- (uint64_t)pr_unlockProgressDidChange
{
  return objc_msgSend(a1, "pui_inspect:", 20664);
}

@end