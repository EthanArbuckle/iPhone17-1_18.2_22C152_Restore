@interface PRUISModalSceneSpecification
- (Class)settingsClass;
- (id)uiSceneSessionRole;
@end

@implementation PRUISModalSceneSpecification

- (Class)settingsClass
{
  return (Class)objc_opt_class();
}

- (id)uiSceneSessionRole
{
  return @"com.apple.PosterBoard.modal";
}

@end