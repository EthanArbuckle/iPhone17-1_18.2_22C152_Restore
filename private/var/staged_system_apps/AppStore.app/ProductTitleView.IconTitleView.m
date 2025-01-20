@interface ProductTitleView.IconTitleView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtCC8AppStore16ProductTitleViewP33_601B9F87A521249726497EC9B648F39D13IconTitleView)initWithCoder:(id)a3;
- (_TtCC8AppStore16ProductTitleViewP33_601B9F87A521249726497EC9B648F39D13IconTitleView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ProductTitleView.IconTitleView

- (_TtCC8AppStore16ProductTitleViewP33_601B9F87A521249726497EC9B648F39D13IconTitleView)initWithFrame:(CGRect)a3
{
  return (_TtCC8AppStore16ProductTitleViewP33_601B9F87A521249726497EC9B648F39D13IconTitleView *)sub_1002D9B94(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC8AppStore16ProductTitleViewP33_601B9F87A521249726497EC9B648F39D13IconTitleView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002DA79C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  sub_1002D825C();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1002D9F1C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC8AppStore16ProductTitleViewP33_601B9F87A521249726497EC9B648F39D13IconTitleView_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC8AppStore16ProductTitleViewP33_601B9F87A521249726497EC9B648F39D13IconTitleView_appTitleView));
  sub_100082BCC((uint64_t)self+ OBJC_IVAR____TtCC8AppStore16ProductTitleViewP33_601B9F87A521249726497EC9B648F39D13IconTitleView_iconAspectRatio, (uint64_t *)&unk_1009856C0);
}

@end