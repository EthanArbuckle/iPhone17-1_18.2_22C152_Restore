@interface MetricEventsTracker
- (NSDate)adResponseTimestamp;
- (NSDate)placeholderPlacedTimestamp;
- (NSDate)prerollAdRequestTimestamp;
- (NSDate)prerollAdResponseTimestamp;
- (NSDate)replacedPlaceholderTimestamp;
- (void)didPlacePlaceholder;
- (void)didReceiveAdResponse;
- (void)didReceivePrerollVideoResponse;
- (void)didReplacePlaceholder;
- (void)didRequestPrerollVideo;
- (void)sendAnalyticsEventFor:(int64_t)a3 interval:(double)a4 networkType:(unint64_t)a5 placementType:(unint64_t)a6 failed:(BOOL)a7;
- (void)setAdResponseTimestamp:(id)a3;
- (void)setPlaceholderPlacedTimestamp:(id)a3;
- (void)setPrerollAdRequestTimestamp:(id)a3;
- (void)setPrerollAdResponseTimestamp:(id)a3;
- (void)setReplacedPlaceholderTimestamp:(id)a3;
@end

@implementation MetricEventsTracker

- (NSDate)placeholderPlacedTimestamp
{
  return (NSDate *)sub_1B5C17F94((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC15PromotedContent19MetricEventsTracker_placeholderPlacedTimestamp);
}

- (void)setPlaceholderPlacedTimestamp:(id)a3
{
}

- (NSDate)replacedPlaceholderTimestamp
{
  return (NSDate *)sub_1B5C17F94((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC15PromotedContent19MetricEventsTracker_replacedPlaceholderTimestamp);
}

- (void)setReplacedPlaceholderTimestamp:(id)a3
{
}

- (NSDate)adResponseTimestamp
{
  return (NSDate *)sub_1B5C17F94((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC15PromotedContent19MetricEventsTracker_adResponseTimestamp);
}

- (void)setAdResponseTimestamp:(id)a3
{
}

- (NSDate)prerollAdRequestTimestamp
{
  return (NSDate *)sub_1B5C17F94((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC15PromotedContent19MetricEventsTracker_prerollAdRequestTimestamp);
}

- (void)setPrerollAdRequestTimestamp:(id)a3
{
}

- (NSDate)prerollAdResponseTimestamp
{
  return (NSDate *)sub_1B5C17F94((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC15PromotedContent19MetricEventsTracker_prerollAdResponseTimestamp);
}

- (void)setPrerollAdResponseTimestamp:(id)a3
{
}

- (void)didPlacePlaceholder
{
}

- (void)didReplacePlaceholder
{
}

- (void)didReceiveAdResponse
{
}

- (void)didRequestPrerollVideo
{
}

- (void)didReceivePrerollVideoResponse
{
}

- (void)sendAnalyticsEventFor:(int64_t)a3 interval:(double)a4 networkType:(unint64_t)a5 placementType:(unint64_t)a6 failed:(BOOL)a7
{
  swift_retain();
  sub_1B5C1838C(a3, a5, a6, a7, a4);
  swift_release();
}

@end