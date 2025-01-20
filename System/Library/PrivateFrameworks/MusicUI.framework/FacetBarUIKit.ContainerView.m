@interface FacetBarUIKit.ContainerView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtCV7MusicUI13FacetBarUIKit13ContainerView)initWithCoder:(id)a3;
- (_TtCV7MusicUI13FacetBarUIKit13ContainerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation FacetBarUIKit.ContainerView

- (_TtCV7MusicUI13FacetBarUIKit13ContainerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_229D1AC78();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_229D1AD40();
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  sub_229D1A64C();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = self;
  sub_229D1A664();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_TtCV7MusicUI13FacetBarUIKit13ContainerView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCV7MusicUI13FacetBarUIKit13ContainerView_scopeBar));
  sub_2294868C0((uint64_t)self + OBJC_IVAR____TtCV7MusicUI13FacetBarUIKit13ContainerView_contentOffsetObservation, &qword_26ADA8468);
  sub_22948636C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtCV7MusicUI13FacetBarUIKit13ContainerView_onScopeBarBoundsChange));

  swift_release();
}

@end