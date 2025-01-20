@interface FBSSceneSettings(PosterBoardUI)
- (uint64_t)prui_preferredSwitcherLayoutMode;
@end

@implementation FBSSceneSettings(PosterBoardUI)

- (uint64_t)prui_preferredSwitcherLayoutMode
{
  uint64_t v1 = objc_msgSend(a1, "pruis_preferredSwitcherLayoutMode");
  return MEMORY[0x1F4145C00](v1);
}

@end