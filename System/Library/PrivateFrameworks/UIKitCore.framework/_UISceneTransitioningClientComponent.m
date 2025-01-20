@interface _UISceneTransitioningClientComponent
- (BOOL)allowedAsMorphTransitionSource;
@end

@implementation _UISceneTransitioningClientComponent

- (BOOL)allowedAsMorphTransitionSource
{
  v2 = [(FBSSceneComponent *)self clientScene];
  v3 = [v2 settings];

  if ([v3 conformsToProtocol:&unk_1ED700820]) {
    char v4 = [v3 allowedAsMorphTransitionSource];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

@end