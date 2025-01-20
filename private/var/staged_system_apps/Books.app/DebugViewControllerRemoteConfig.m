@interface DebugViewControllerRemoteConfig
- (BKDebugViewSection)section;
- (DebugViewControllerRemoteConfig)init;
- (DebugViewControllerRemoteConfig)initWithOwner:(id)a3;
@end

@implementation DebugViewControllerRemoteConfig

- (DebugViewControllerRemoteConfig)initWithOwner:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(DebugViewControllerRemoteConfig *)&v6 init];
}

- (DebugViewControllerRemoteConfig)init
{
  result = (DebugViewControllerRemoteConfig *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (BKDebugViewSection)section
{
  v2 = self;
  id v3 = sub_1003AA170();

  return (BKDebugViewSection *)v3;
}

@end