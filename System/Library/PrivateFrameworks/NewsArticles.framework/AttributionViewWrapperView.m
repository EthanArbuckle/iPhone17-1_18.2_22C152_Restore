@interface AttributionViewWrapperView
- (BOOL)attributionViewShouldDisableHackForNewsLayout;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC12NewsArticlesP33_AB2C07DEED72E6BCD424DDADA40C3A3026AttributionViewWrapperView)initWithCoder:(id)a3;
- (_TtC12NewsArticlesP33_AB2C07DEED72E6BCD424DDADA40C3A3026AttributionViewWrapperView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation AttributionViewWrapperView

- (_TtC12NewsArticlesP33_AB2C07DEED72E6BCD424DDADA40C3A3026AttributionViewWrapperView)initWithCoder:(id)a3
{
  result = (_TtC12NewsArticlesP33_AB2C07DEED72E6BCD424DDADA40C3A3026AttributionViewWrapperView *)sub_1BF7E4948();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  v6 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NewsArticlesP33_AB2C07DEED72E6BCD424DDADA40C3A3026AttributionViewWrapperView_attributionView);
  swift_getObjectType();
  v7 = self;
  sub_1BF7E2FF8();
  objc_msgSend(v6, sel_bounds);
  double v9 = v8;

  if (v9 > height) {
    double v10 = v9;
  }
  else {
    double v10 = height;
  }
  double v11 = width;
  result.double height = v10;
  result.CGFloat width = v11;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1BF5F64AC();
}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v5 = sub_1BF7E3338();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  double v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v9 = (objc_class *)type metadata accessor for AttributionViewWrapperView();
  v13.receiver = self;
  v13.super_class = v9;
  id v10 = a3;
  double v11 = self;
  [(AttributionViewWrapperView *)&v13 traitCollectionDidChange:v10];
  id v12 = [(AttributionViewWrapperView *)v11 traitCollection];
  sub_1BF5F6734(v12, (uint64_t)v8);

  swift_getObjectType();
  sub_1BF7E3008();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (BOOL)attributionViewShouldDisableHackForNewsLayout
{
  return 1;
}

- (_TtC12NewsArticlesP33_AB2C07DEED72E6BCD424DDADA40C3A3026AttributionViewWrapperView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC12NewsArticlesP33_AB2C07DEED72E6BCD424DDADA40C3A3026AttributionViewWrapperView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticlesP33_AB2C07DEED72E6BCD424DDADA40C3A3026AttributionViewWrapperView_attributionView));
  v3 = (char *)self
     + OBJC_IVAR____TtC12NewsArticlesP33_AB2C07DEED72E6BCD424DDADA40C3A3026AttributionViewWrapperView_navigationItemStyle;
  uint64_t v4 = sub_1BF7DF6B8();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end