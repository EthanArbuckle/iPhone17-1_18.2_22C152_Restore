@interface SidebarDataManager
- (_TtC5Books18SidebarDataManager)init;
- (void)dealloc;
@end

@implementation SidebarDataManager

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  v5 = self;
  id v6 = [v4 sharedProvider];
  [v6 removeObserver:v5 accountTypes:1];

  sub_1007F6D10();
  v7 = (void *)sub_1007F6CE0();
  v8 = v5;
  sub_1007F6CD0();

  v9.receiver = v8;
  v9.super_class = ObjectType;
  [(SidebarDataManager *)&v9 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  swift_unknownObjectRelease();
}

- (_TtC5Books18SidebarDataManager)init
{
  result = (_TtC5Books18SidebarDataManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end