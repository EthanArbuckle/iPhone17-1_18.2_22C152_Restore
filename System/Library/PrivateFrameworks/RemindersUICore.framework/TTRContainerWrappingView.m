@interface TTRContainerWrappingView
- (BOOL)isLayoutSizeDependentOnPerpendicularAxis;
- (CGSize)calculateArrangedSizeFittingSize:(CGSize)a3;
- (_TtC15RemindersUICore24TTRContainerWrappingView)initWithArrangedSubviews:(id)a3;
- (_TtC15RemindersUICore24TTRContainerWrappingView)initWithCoder:(id)a3;
- (_TtC15RemindersUICore24TTRContainerWrappingView)initWithFrame:(CGRect)a3;
- (void)layoutArrangedSubviewsInBounds:(CGRect)a3;
@end

@implementation TTRContainerWrappingView

- (CGSize)calculateArrangedSizeFittingSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  TTRContainerWrappingView.makeWrappingArrangement(bounds:)(0.0, 0.0, width, height);
  TTRWrappingArrangement.computeLayout()(&v8);
  swift_release();
  sub_1B97A2BB4((uint64_t)&v8);

  double v6 = v8.usedRect.size.width;
  double v7 = v8.usedRect.size.height;
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (void)layoutArrangedSubviewsInBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v7 = self;
  v9.origin.CGFloat x = x;
  v9.origin.CGFloat y = y;
  v9.size.CGFloat width = width;
  v9.size.CGFloat height = height;
  TTRContainerWrappingView.layoutArrangedSubviews(inBounds:)(v9);
}

- (BOOL)isLayoutSizeDependentOnPerpendicularAxis
{
  return 1;
}

- (_TtC15RemindersUICore24TTRContainerWrappingView)initWithFrame:(CGRect)a3
{
  return (_TtC15RemindersUICore24TTRContainerWrappingView *)TTRContainerWrappingView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15RemindersUICore24TTRContainerWrappingView)initWithArrangedSubviews:(id)a3
{
  if (a3)
  {
    sub_1B92FE358();
    uint64_t v3 = sub_1B996EE50();
  }
  else
  {
    uint64_t v3 = 0;
  }
  return (_TtC15RemindersUICore24TTRContainerWrappingView *)TTRContainerWrappingView.init(arrangedSubviews:)(v3);
}

- (_TtC15RemindersUICore24TTRContainerWrappingView)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore24TTRContainerWrappingView *)TTRContainerWrappingView.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore24TTRContainerWrappingView_viewsRequiringNewRows));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore24TTRContainerWrappingView_customSpacingByView);
}

@end