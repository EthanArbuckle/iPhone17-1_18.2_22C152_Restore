@interface FBSMutableSceneSettings(PaperBoard)
- (void)pb_setActiveVariant:()PaperBoard;
- (void)pb_setAnimationSuspended:()PaperBoard;
- (void)pb_setSignificantEventsCounter:()PaperBoard;
@end

@implementation FBSMutableSceneSettings(PaperBoard)

- (void)pb_setActiveVariant:()PaperBoard
{
  id v5 = [a1 otherSettings];
  v4 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v4 forSetting:303000];
}

- (void)pb_setAnimationSuspended:()PaperBoard
{
  id v1 = [a1 otherSettings];
  [v1 setFlag:BSSettingFlagForBool() forSetting:303001];
}

- (void)pb_setSignificantEventsCounter:()PaperBoard
{
  id v5 = [a1 otherSettings];
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forSetting:20489];
}

@end