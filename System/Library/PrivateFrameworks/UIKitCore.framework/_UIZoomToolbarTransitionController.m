@interface _UIZoomToolbarTransitionController
- (_TtC5UIKit34_UIZoomToolbarTransitionController)init;
- (void)beginTransitionWithToolbar:(id)a3 items:(id)a4 animated:(BOOL)a5;
- (void)cancelTransition;
- (void)dealloc;
- (void)endTransition;
- (void)prepareTransitionWithToolbar:(id)a3;
@end

@implementation _UIZoomToolbarTransitionController

- (void)prepareTransitionWithToolbar:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18596B258(v4);
  id v7 = *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC5UIKit34_UIZoomToolbarTransitionController_toolbarSnapshot);
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC5UIKit34_UIZoomToolbarTransitionController_toolbarSnapshot) = v6;
}

- (void)beginTransitionWithToolbar:(id)a3 items:(id)a4 animated:(BOOL)a5
{
  sub_1853B985C(0, (unint64_t *)&qword_1E8FAF9C8);
  sub_186A1EB3C();
  id v7 = a3;
  v8 = self;
  sub_18596B564(v7);

  swift_bridgeObjectRelease();
}

- (void)cancelTransition
{
  v2 = self;
  sub_18596AF74();
}

- (void)endTransition
{
  v2 = self;
  sub_18596AF74();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v4 = self;
  sub_18596AF74();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  [(_UIZoomToolbarTransitionController *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5UIKit34_UIZoomToolbarTransitionController_toolbarSnapshot);
}

- (_TtC5UIKit34_UIZoomToolbarTransitionController)init
{
  result = (_TtC5UIKit34_UIZoomToolbarTransitionController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end