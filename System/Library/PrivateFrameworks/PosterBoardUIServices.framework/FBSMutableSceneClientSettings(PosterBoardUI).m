@interface FBSMutableSceneClientSettings(PosterBoardUI)
- (void)pruis_setPrimaryPosterOffset:()PosterBoardUI;
- (void)pruis_setPrimaryPosterScale:()PosterBoardUI;
- (void)pruis_setSwitcherContextID:()PosterBoardUI;
- (void)pruis_setSwitcherLayoutMode:()PosterBoardUI;
@end

@implementation FBSMutableSceneClientSettings(PosterBoardUI)

- (void)pruis_setSwitcherLayoutMode:()PosterBoardUI
{
  id v5 = [a1 otherSettings];
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forSetting:25612];
}

- (void)pruis_setSwitcherContextID:()PosterBoardUI
{
  id v5 = [a1 otherSettings];
  v4 = [NSNumber numberWithUnsignedInt:a3];
  [v5 setObject:v4 forSetting:25613];
}

- (void)pruis_setPrimaryPosterScale:()PosterBoardUI
{
  id v4 = [a1 otherSettings];
  v3 = [NSNumber numberWithDouble:a2];
  [v4 setObject:v3 forSetting:25614];
}

- (void)pruis_setPrimaryPosterOffset:()PosterBoardUI
{
  id v5 = [a1 otherSettings];
  *(double *)v7 = a2;
  *(double *)&v7[1] = a3;
  v6 = [MEMORY[0x263F08D40] valueWithBytes:v7 objCType:"{CGPoint=dd}"];
  [v5 setObject:v6 forSetting:25615];
}

@end