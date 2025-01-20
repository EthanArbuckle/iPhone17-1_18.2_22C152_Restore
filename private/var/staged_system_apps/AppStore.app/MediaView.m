@interface MediaView
- (UIColor)backgroundColor;
- (_TtC8AppStore9MediaView)initWithCoder:(id)a3;
- (_TtC8AppStore9MediaView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
@end

@implementation MediaView

- (UIColor)backgroundColor
{
  id v2 = [*(id *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore9MediaView_contentContainer)+ OBJC_IVAR____TtC8AppStoreP33_ECECB79BEF5D802E6E21EF3AE112F28D20UberContentContainer_contents) backgroundColor];

  return (UIColor *)v2;
}

- (void)setBackgroundColor:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1004A1178(a3);
}

- (_TtC8AppStore9MediaView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1004A2A24();
}

- (void)layoutSubviews
{
  id v2 = self;
  sub_1004A1930();
}

- (_TtC8AppStore9MediaView)initWithFrame:(CGRect)a3
{
  result = (_TtC8AppStore9MediaView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore9MediaView_reflectionView);
}

@end