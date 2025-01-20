@interface _UIScenePresenterGeometryDriverStorage
- (_UIScenePresenterGeometryDriverStorage)init;
- (_UIScenePresenterGeometryDriverStorage)initWithScenePresentationView:(id)a3;
- (void)scenePresentationViewIsLayingOutSubviews;
@end

@implementation _UIScenePresenterGeometryDriverStorage

- (_UIScenePresenterGeometryDriverStorage)initWithScenePresentationView:(id)a3
{
  uint64_t v5 = OBJC_IVAR____UIScenePresenterGeometryDriverStorage_driver;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIScenePresenterGeometryDriverStorage_driver) = 0;
  type metadata accessor for _UIScenePresenterGeometryDriver();
  swift_allocObject();
  v6 = a3;
  v7 = self;
  *(Class *)((char *)&self->super.isa + v5) = (Class)sub_185AE43AC(v6);

  swift_release();
  v10.receiver = v7;
  v10.super_class = (Class)_UIScenePresenterGeometryDriverStorage;
  v8 = [(_UIScenePresenterGeometryDriverStorage *)&v10 init];

  return v8;
}

- (void)scenePresentationViewIsLayingOutSubviews
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____UIScenePresenterGeometryDriverStorage_driver))
  {
    v2 = self;
    swift_retain();
    sub_185AE40B4();

    swift_release();
  }
}

- (void).cxx_destruct
{
}

- (_UIScenePresenterGeometryDriverStorage)init
{
  result = (_UIScenePresenterGeometryDriverStorage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end