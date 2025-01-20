@interface CycleView
- (_TtC23ShelfKitCollectionViews9CycleView)init;
- (_TtC23ShelfKitCollectionViews9CycleView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews9CycleView)initWithFrame:(CGRect)a3;
@end

@implementation CycleView

- (_TtC23ShelfKitCollectionViews9CycleView)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews9CycleView_hiddenViews) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews9CycleView_hostedViewSettings) = (Class)&_swiftEmptyDictionarySingleton;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews9CycleView_currentView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews9CycleView_currentViewConstraints) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews9CycleView_hostedViews) = (Class)_swiftEmptyArrayStorage;
  v6.receiver = self;
  v6.super_class = ObjectType;
  v4 = -[CycleView initWithFrame:](&v6, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  [(CycleView *)v4 setClipsToBounds:1];
  return v4;
}

- (_TtC23ShelfKitCollectionViews9CycleView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews9CycleView_hiddenViews) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews9CycleView_hostedViewSettings) = (Class)&_swiftEmptyDictionarySingleton;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews9CycleView_currentView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews9CycleView_currentViewConstraints) = 0;
  id v4 = a3;

  result = (_TtC23ShelfKitCollectionViews9CycleView *)sub_385890();
  __break(1u);
  return result;
}

- (_TtC23ShelfKitCollectionViews9CycleView)initWithFrame:(CGRect)a3
{
  result = (_TtC23ShelfKitCollectionViews9CycleView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews9CycleView_currentView));

  swift_bridgeObjectRelease();
}

@end