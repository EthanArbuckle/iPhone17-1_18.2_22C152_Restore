@interface FullScreenUnsupportedItemView
- (_TtC7Journal29FullScreenUnsupportedItemView)initWithCoder:(id)a3;
- (_TtC7Journal29FullScreenUnsupportedItemView)initWithFrame:(CGRect)a3;
@end

@implementation FullScreenUnsupportedItemView

- (_TtC7Journal29FullScreenUnsupportedItemView)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC7Journal29FullScreenUnsupportedItemView_assetShadowView;
  id v5 = objc_allocWithZone((Class)UIView);
  v6 = self;
  v7 = (objc_class *)[v5 init];
  *(Class *)((char *)&self->super.super.super.isa + v4) = v7;
  uint64_t v8 = OBJC_IVAR____TtC7Journal29FullScreenUnsupportedItemView_assetView;
  *(Class *)((char *)&v6->super.super.super.isa + OBJC_IVAR____TtC7Journal29FullScreenUnsupportedItemView_assetView) = 0;

  v9 = *(Class *)((char *)&v6->super.super.super.isa + v8);
  type metadata accessor for FullScreenUnsupportedItemView();
  swift_deallocPartialClassInstance();
  return 0;
}

- (_TtC7Journal29FullScreenUnsupportedItemView)initWithFrame:(CGRect)a3
{
  result = (_TtC7Journal29FullScreenUnsupportedItemView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal29FullScreenUnsupportedItemView_assetShadowView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7Journal29FullScreenUnsupportedItemView_assetView);
}

@end