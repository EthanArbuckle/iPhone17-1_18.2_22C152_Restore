@interface NKNotesSceneSpecification
- (Class)uiSceneMinimumClass;
- (NSString)uiSceneSessionRole;
- (_TtC15NotesUIServicesP33_82644AFB0C2F2CCE6D5FA1AE07FA364225NKNotesSceneSpecification)init;
@end

@implementation NKNotesSceneSpecification

- (NSString)uiSceneSessionRole
{
  v2 = self;
  v3 = (void *)sub_257DAFF38();

  return (NSString *)v3;
}

- (Class)uiSceneMinimumClass
{
  type metadata accessor for NKNotesWindowScene();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC15NotesUIServicesP33_82644AFB0C2F2CCE6D5FA1AE07FA364225NKNotesSceneSpecification)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NKNotesSceneSpecification();
  return [(NKNotesSceneSpecification *)&v3 init];
}

@end