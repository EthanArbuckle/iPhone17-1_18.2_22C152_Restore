@interface PPLPeopleEntitySceneSpecification
- (Class)settingsClass;
@end

@implementation PPLPeopleEntitySceneSpecification

- (Class)settingsClass
{
  return (Class)objc_opt_class();
}

@end