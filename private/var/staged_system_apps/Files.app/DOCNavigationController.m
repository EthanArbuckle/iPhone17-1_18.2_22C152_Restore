@interface DOCNavigationController
- (_TtC5Files23DOCNavigationController)init;
- (_TtC5Files23DOCNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC5Files23DOCNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC5Files23DOCNavigationController)initWithRootViewController:(id)a3;
@end

@implementation DOCNavigationController

- (_TtC5Files23DOCNavigationController)init
{
  type metadata accessor for DOCNavigationBar();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCNavigationController();
  return [(DOCNavigationController *)&v5 initWithNavigationBarClass:ObjCClassFromMetadata toolbarClass:0];
}

- (_TtC5Files23DOCNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  result = (_TtC5Files23DOCNavigationController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC5Files23DOCNavigationController)initWithRootViewController:(id)a3
{
  return (_TtC5Files23DOCNavigationController *)sub_100567C94(a3);
}

- (_TtC5Files23DOCNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  result = (_TtC5Files23DOCNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end