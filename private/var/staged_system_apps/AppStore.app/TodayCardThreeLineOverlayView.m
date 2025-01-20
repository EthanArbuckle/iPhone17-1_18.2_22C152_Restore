@interface TodayCardThreeLineOverlayView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8AppStore29TodayCardThreeLineOverlayView)initWithCoder:(id)a3;
- (_TtC8AppStore29TodayCardThreeLineOverlayView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TodayCardThreeLineOverlayView

- (_TtC8AppStore29TodayCardThreeLineOverlayView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore29TodayCardThreeLineOverlayView *)sub_1005C1464(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore29TodayCardThreeLineOverlayView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1005C27E4();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1005C1B94();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = sub_1005C1F5C(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_1005C2178(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29TodayCardThreeLineOverlayView_headingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29TodayCardThreeLineOverlayView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29TodayCardThreeLineOverlayView_descriptionLabel));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8AppStore29TodayCardThreeLineOverlayView_clickActionHandler);

  sub_10006012C(v3);
}

@end