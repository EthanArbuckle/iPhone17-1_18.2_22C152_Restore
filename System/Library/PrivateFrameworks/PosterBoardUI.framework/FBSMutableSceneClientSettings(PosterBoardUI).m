@interface FBSMutableSceneClientSettings(PosterBoardUI)
- (uint64_t)prui_setSwitcherLayoutMode:()PosterBoardUI;
@end

@implementation FBSMutableSceneClientSettings(PosterBoardUI)

- (uint64_t)prui_setSwitcherLayoutMode:()PosterBoardUI
{
  uint64_t v2 = modeFromPRUISwitcherLayoutMode();
  return objc_msgSend(a1, "pruis_setSwitcherLayoutMode:", v2);
}

@end