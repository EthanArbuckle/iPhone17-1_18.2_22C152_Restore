@interface FBSMutableSceneSettings(PosterBoardUI)
- (void)pruis_setLeadingTopButtonFrame:()PosterBoardUI;
- (void)pruis_setLockPosterComplicationRowHidden:()PosterBoardUI;
- (void)pruis_setLockPosterFloatingLayerInlined:()PosterBoardUI;
- (void)pruis_setLockPosterLiveContentLayerContextID:()PosterBoardUI;
- (void)pruis_setLockPosterLiveContentLayerRenderID:()PosterBoardUI;
- (void)pruis_setLockPosterLiveFloatingLayerContextID:()PosterBoardUI;
- (void)pruis_setLockPosterLiveFloatingLayerRenderID:()PosterBoardUI;
- (void)pruis_setLockPosterOverlayLayerContextID:()PosterBoardUI;
- (void)pruis_setLockPosterOverlayLayerRenderID:()PosterBoardUI;
- (void)pruis_setLockVibrancyConfiguration:()PosterBoardUI;
- (void)pruis_setPreferredSwitcherLayoutMode:()PosterBoardUI;
- (void)pruis_setTrailingTopButtonFrame:()PosterBoardUI;
@end

@implementation FBSMutableSceneSettings(PosterBoardUI)

- (void)pruis_setPreferredSwitcherLayoutMode:()PosterBoardUI
{
  id v5 = [a1 otherSettings];
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forSetting:25562];
}

- (void)pruis_setLockPosterOverlayLayerRenderID:()PosterBoardUI
{
  id v5 = [a1 otherSettings];
  v4 = [NSNumber numberWithUnsignedLongLong:a3];
  [v5 setObject:v4 forSetting:25563];
}

- (void)pruis_setLockPosterOverlayLayerContextID:()PosterBoardUI
{
  id v5 = [a1 otherSettings];
  v4 = [NSNumber numberWithUnsignedInt:a3];
  [v5 setObject:v4 forSetting:25564];
}

- (void)pruis_setLockPosterLiveContentLayerRenderID:()PosterBoardUI
{
  id v5 = [a1 otherSettings];
  if (a3)
  {
    v4 = [NSNumber numberWithUnsignedLongLong:a3];
    [v5 setObject:v4 forSetting:25565];
  }
  else
  {
    [v5 setObject:0 forSetting:25565];
  }
}

- (void)pruis_setLockPosterLiveContentLayerContextID:()PosterBoardUI
{
  id v5 = [a1 otherSettings];
  if (a3)
  {
    v4 = [NSNumber numberWithUnsignedInt:a3];
    [v5 setObject:v4 forSetting:25566];
  }
  else
  {
    [v5 setObject:0 forSetting:25566];
  }
}

- (void)pruis_setLockPosterFloatingLayerInlined:()PosterBoardUI
{
  id v1 = [a1 otherSettings];
  [v1 setFlag:BSSettingFlagForBool() forSetting:25569];
}

- (void)pruis_setLockPosterLiveFloatingLayerRenderID:()PosterBoardUI
{
  id v5 = [a1 otherSettings];
  if (a3)
  {
    v4 = [NSNumber numberWithUnsignedLongLong:a3];
    [v5 setObject:v4 forSetting:25567];
  }
  else
  {
    [v5 setObject:0 forSetting:25567];
  }
}

- (void)pruis_setLockPosterLiveFloatingLayerContextID:()PosterBoardUI
{
  id v5 = [a1 otherSettings];
  if (a3)
  {
    v4 = [NSNumber numberWithUnsignedInt:a3];
    [v5 setObject:v4 forSetting:25568];
  }
  else
  {
    [v5 setObject:0 forSetting:25568];
  }
}

- (void)pruis_setLockPosterComplicationRowHidden:()PosterBoardUI
{
  id v1 = [a1 otherSettings];
  [v1 setFlag:BSSettingFlagForBool() forSetting:25570];
}

- (void)pruis_setLeadingTopButtonFrame:()PosterBoardUI
{
  v9 = [a1 otherSettings];
  *(double *)v11 = a2;
  *(double *)&v11[1] = a3;
  *(double *)&v11[2] = a4;
  *(double *)&v11[3] = a5;
  v10 = [MEMORY[0x263F08D40] valueWithBytes:v11 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  [v9 setObject:v10 forSetting:25571];
}

- (void)pruis_setTrailingTopButtonFrame:()PosterBoardUI
{
  v9 = [a1 otherSettings];
  *(double *)v11 = a2;
  *(double *)&v11[1] = a3;
  *(double *)&v11[2] = a4;
  *(double *)&v11[3] = a5;
  v10 = [MEMORY[0x263F08D40] valueWithBytes:v11 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  [v9 setObject:v10 forSetting:25572];
}

- (void)pruis_setLockVibrancyConfiguration:()PosterBoardUI
{
  id v4 = a3;
  id v5 = [a1 otherSettings];
  [v5 setObject:v4 forSetting:25573];
}

@end