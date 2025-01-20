@interface FBSSceneClientSettings(PosterBoardUI)
- (uint64_t)prui_switcherLayoutMode;
@end

@implementation FBSSceneClientSettings(PosterBoardUI)

- (uint64_t)prui_switcherLayoutMode
{
  uint64_t v1 = objc_msgSend(a1, "pruis_switcherLayoutMode");
  return MEMORY[0x1F4145C00](v1);
}

@end