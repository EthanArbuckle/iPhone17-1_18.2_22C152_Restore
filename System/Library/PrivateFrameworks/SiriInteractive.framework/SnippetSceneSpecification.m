@interface SnippetSceneSpecification
- (Class)clientSettingsClass;
- (Class)settingsClass;
- (Class)uiSceneMinimumClass;
- (NSString)uiSceneSessionRole;
- (_TtC15SiriInteractive25SnippetSceneSpecification)init;
@end

@implementation SnippetSceneSpecification

- (Class)settingsClass
{
  sub_25C9B6FDC();
  return (Class)swift_getObjCClassFromMetadata();
}

- (Class)clientSettingsClass
{
  sub_25C9B700C();
  return (Class)swift_getObjCClassFromMetadata();
}

- (NSString)uiSceneSessionRole
{
  v2 = self;
  id v3 = sub_25C9A68D8();

  return (NSString *)v3;
}

- (Class)uiSceneMinimumClass
{
  Class result = (Class)sub_25C9B708C();
  if (result)
  {
    return (Class)swift_getObjCClassFromMetadata();
  }
  return result;
}

- (_TtC15SiriInteractive25SnippetSceneSpecification)init
{
  return (_TtC15SiriInteractive25SnippetSceneSpecification *)SnippetSceneSpecification.init()();
}

@end