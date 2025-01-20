@interface CRLSelectionViewController
- (NSArray)decoratorOverlayRenderables;
- (NSArray)decoratorOverlayViews;
- (_TtC8Freeform26CRLSelectionViewController)init;
@end

@implementation CRLSelectionViewController

- (NSArray)decoratorOverlayRenderables
{
  sub_10050BF48(0, (unint64_t *)&qword_101682130);
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;

  return (NSArray *)v2.super.isa;
}

- (NSArray)decoratorOverlayViews
{
  NSArray v2 = self;
  sub_1007FF268();

  sub_10050BF48(0, (unint64_t *)&qword_1016725F0);
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (_TtC8Freeform26CRLSelectionViewController)init
{
  result = (_TtC8Freeform26CRLSelectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  NSArray v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform26CRLSelectionViewController_rotatedOverlayView);
}

@end