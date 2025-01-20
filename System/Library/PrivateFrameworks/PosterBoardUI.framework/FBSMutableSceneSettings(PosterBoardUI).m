@interface FBSMutableSceneSettings(PosterBoardUI)
- (uint64_t)prui_setPreferredSwitcherLayoutMode:()PosterBoardUI;
@end

@implementation FBSMutableSceneSettings(PosterBoardUI)

- (uint64_t)prui_setPreferredSwitcherLayoutMode:()PosterBoardUI
{
  uint64_t v2 = modeFromPRUISwitcherLayoutMode();
  return objc_msgSend(a1, "pruis_setPreferredSwitcherLayoutMode:", v2);
}

@end