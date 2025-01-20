@interface TodayCardActionOverlayView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8AppStore26TodayCardActionOverlayView)initWithCoder:(id)a3;
- (_TtC8AppStore26TodayCardActionOverlayView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TodayCardActionOverlayView

- (_TtC8AppStore26TodayCardActionOverlayView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore26TodayCardActionOverlayView *)sub_1002131A8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore26TodayCardActionOverlayView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore26TodayCardActionOverlayView_accessoryView) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore26TodayCardActionOverlayView_isExpanded) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore26TodayCardActionOverlayView_sizeCategory) = 7;
  id v4 = a3;

  result = (_TtC8AppStore26TodayCardActionOverlayView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  id v4 = self;
  double v5 = sub_100213660(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100213954();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_100213CF0(a3);
}

- (void).cxx_destruct
{
  sub_1000925BC((uint64_t)self + OBJC_IVAR____TtC8AppStore26TodayCardActionOverlayView_accessory);
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8AppStore26TodayCardActionOverlayView_accessoryView);
}

@end