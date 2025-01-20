@interface MessageIndicatorView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC11TelephonyUI20MessageIndicatorView)initWithCoder:(id)a3;
- (_TtC11TelephonyUI20MessageIndicatorView)initWithFrame:(CGRect)a3;
- (void)handleTapGesture;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation MessageIndicatorView

- (_TtC11TelephonyUI20MessageIndicatorView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C2F66DB4();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1C2F650C8();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_titleLabel);
  v6 = self;
  objc_msgSend(v5, sel_sizeThatFits_, width, height);
  double v8 = v7;
  double v9 = *(double *)((char *)&v6->super.super.super.isa + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_textPadding);

  double v10 = v8 + v9 + v9;
  double v11 = width;
  result.double height = v10;
  result.double width = v11;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1C2F655B8(a3);
}

- (void)handleTapGesture
{
  v2 = self;
  sub_1C2F65F50();
}

- (_TtC11TelephonyUI20MessageIndicatorView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC11TelephonyUI20MessageIndicatorView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_durationLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_recordImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView____lazy_storage___backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_viewModel));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_tapHandler);
  sub_1C2F645AC(v3);
}

@end