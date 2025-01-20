@interface CSDMomentsUsageReport
- (CSDMomentsUsageReport)init;
- (CSDMomentsUsageReport)initWithAvailability:(int)a3 photoRequestSuccessCount:(int64_t)a4 photoRequestFailureCount:(int64_t)a5 medianRequestDuration:(double)a6 meanRequestDuration:(double)a7;
- (NSString)description;
- (double)meanRequestDuration;
- (double)medianRequestDuration;
- (int)availability;
- (int64_t)photoRequestFailureCount;
- (int64_t)photoRequestSuccessCount;
@end

@implementation CSDMomentsUsageReport

- (int)availability
{
  return sub_100298B08();
}

- (int64_t)photoRequestSuccessCount
{
  return sub_100298B3C();
}

- (int64_t)photoRequestFailureCount
{
  return sub_100298B70();
}

- (double)medianRequestDuration
{
  return sub_100298BA4();
}

- (double)meanRequestDuration
{
  return sub_100298BD8();
}

- (CSDMomentsUsageReport)initWithAvailability:(int)a3 photoRequestSuccessCount:(int64_t)a4 photoRequestFailureCount:(int64_t)a5 medianRequestDuration:(double)a6 meanRequestDuration:(double)a7
{
  return (CSDMomentsUsageReport *)sub_100298BE8(a3, a4, a5, a6, a7);
}

- (NSString)description
{
  v2 = self;
  sub_100298D20();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (CSDMomentsUsageReport)init
{
}

@end