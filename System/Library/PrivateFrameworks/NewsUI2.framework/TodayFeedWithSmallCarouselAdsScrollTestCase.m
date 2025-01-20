@interface TodayFeedWithSmallCarouselAdsScrollTestCase
- (NSString)testName;
- (_TtC7NewsUI243TodayFeedWithSmallCarouselAdsScrollTestCase)init;
- (double)timeoutInSeconds;
- (int64_t)iterations;
- (int64_t)numberOfScreens;
- (int64_t)offset;
- (unint64_t)aggregate;
@end

@implementation TodayFeedWithSmallCarouselAdsScrollTestCase

- (_TtC7NewsUI243TodayFeedWithSmallCarouselAdsScrollTestCase)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC7NewsUI243TodayFeedWithSmallCarouselAdsScrollTestCase_testName);
  void *v4 = 0xD000000000000023;
  v4[1] = 0x80000001DFEBAC70;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC7NewsUI243TodayFeedWithSmallCarouselAdsScrollTestCase_timeoutInSeconds) = (Class)0x405E000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI243TodayFeedWithSmallCarouselAdsScrollTestCase_aggregate) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI243TodayFeedWithSmallCarouselAdsScrollTestCase_iterations) = (Class)2;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI243TodayFeedWithSmallCarouselAdsScrollTestCase_offset) = (Class)15;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC7NewsUI243TodayFeedWithSmallCarouselAdsScrollTestCase_numberOfScreens) = (Class)3;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(TodayFeedWithSmallCarouselAdsScrollTestCase *)&v6 init];
}

- (NSString)testName
{
  return (NSString *)sub_1DE977F8C();
}

- (double)timeoutInSeconds
{
  return 120.0;
}

- (unint64_t)aggregate
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC7NewsUI243TodayFeedWithSmallCarouselAdsScrollTestCase_aggregate);
}

- (int64_t)iterations
{
  return 2;
}

- (int64_t)offset
{
  return 15;
}

- (int64_t)numberOfScreens
{
  return 3;
}

- (void).cxx_destruct
{
}

@end