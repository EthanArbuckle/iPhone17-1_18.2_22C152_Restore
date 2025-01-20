@interface FBScene(SpringBoardScenes)
- (uint64_t)sb_isSpringBoardRootScene;
@end

@implementation FBScene(SpringBoardScenes)

- (uint64_t)sb_isSpringBoardRootScene
{
  v2 = [a1 definition];
  v3 = [v2 specification];

  v4 = [a1 clientProcess];
  if ([v4 isCurrentProcess])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char isKindOfClass = 1;
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

@end