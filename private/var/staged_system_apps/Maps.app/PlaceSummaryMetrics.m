@interface PlaceSummaryMetrics
- (BOOL)showsDivider;
- (_TtC4Maps19PlaceSummaryMetrics)init;
- (_TtC4Maps19PlaceSummaryMetrics)initWithLeadingMargin:(double)a3 trailingMargin:(double)a4 topMargin:(double)a5 bottomMargin:(double)a6 topLeadingCornerRadius:(double)a7 topTrailingCornerRadius:(double)a8 bottomLeadingCornerRadius:(double)a9 bottomTrailingCornerRadius:(double)a10 showsDivider:(BOOL)a11;
- (double)bottomLeadingCornerRadius;
- (double)bottomMargin;
- (double)bottomTrailingCornerRadius;
- (double)leadingMargin;
- (double)topLeadingCornerRadius;
- (double)topMargin;
- (double)topTrailingCornerRadius;
- (double)trailingMargin;
@end

@implementation PlaceSummaryMetrics

- (double)leadingMargin
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps19PlaceSummaryMetrics_leadingMargin);
}

- (double)trailingMargin
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps19PlaceSummaryMetrics_trailingMargin);
}

- (double)topMargin
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps19PlaceSummaryMetrics_topMargin);
}

- (double)bottomMargin
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps19PlaceSummaryMetrics_bottomMargin);
}

- (double)topLeadingCornerRadius
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps19PlaceSummaryMetrics_topLeadingCornerRadius);
}

- (double)topTrailingCornerRadius
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps19PlaceSummaryMetrics_topTrailingCornerRadius);
}

- (double)bottomLeadingCornerRadius
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps19PlaceSummaryMetrics_bottomLeadingCornerRadius);
}

- (double)bottomTrailingCornerRadius
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps19PlaceSummaryMetrics_bottomTrailingCornerRadius);
}

- (BOOL)showsDivider
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps19PlaceSummaryMetrics_showsDivider);
}

- (_TtC4Maps19PlaceSummaryMetrics)initWithLeadingMargin:(double)a3 trailingMargin:(double)a4 topMargin:(double)a5 bottomMargin:(double)a6 topLeadingCornerRadius:(double)a7 topTrailingCornerRadius:(double)a8 bottomLeadingCornerRadius:(double)a9 bottomTrailingCornerRadius:(double)a10 showsDivider:(BOOL)a11
{
  return (_TtC4Maps19PlaceSummaryMetrics *)sub_1001A1840(a11, a3, a4, a5, a6, a7, a8, a9, a10);
}

- (_TtC4Maps19PlaceSummaryMetrics)init
{
  result = (_TtC4Maps19PlaceSummaryMetrics *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end