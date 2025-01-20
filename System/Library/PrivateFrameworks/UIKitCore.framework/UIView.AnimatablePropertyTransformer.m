@interface UIView.AnimatablePropertyTransformer
- (_TtCE5UIKitCSo6UIView29AnimatablePropertyTransformer)init;
@end

@implementation UIView.AnimatablePropertyTransformer

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1854AFD40(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCE5UIKitCSo6UIView29AnimatablePropertyTransformer_modelValueChangedCallback));
  sub_1854AFD40(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCE5UIKitCSo6UIView29AnimatablePropertyTransformer_presentationValueChangedCallback));
  sub_1854AFD40(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCE5UIKitCSo6UIView29AnimatablePropertyTransformer_stabilizedCallback));
  swift_release();
}

- (_TtCE5UIKitCSo6UIView29AnimatablePropertyTransformer)init
{
  result = (_TtCE5UIKitCSo6UIView29AnimatablePropertyTransformer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end