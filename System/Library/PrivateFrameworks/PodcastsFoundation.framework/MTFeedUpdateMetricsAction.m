@interface MTFeedUpdateMetricsAction
+ (NSString)error;
+ (NSString)fetchFeedsExpectedToUpdate;
+ (NSString)finishedWithoutURL;
+ (NSString)notificationReceived;
+ (NSString)notificationScheduled;
+ (NSString)notificationScheduledViaCarousel;
+ (NSString)notificationSetRetryFlag;
+ (NSString)notificationTapped;
+ (NSString)pageParser;
+ (NSString)parser;
+ (NSString)podcastDataSource;
+ (NSString)processCarouselTask;
- (MTFeedUpdateMetricsAction)init;
@end

@implementation MTFeedUpdateMetricsAction

+ (NSString)error
{
  v2 = (void *)sub_1ACE76178();
  return (NSString *)v2;
}

+ (NSString)finishedWithoutURL
{
  v2 = (void *)sub_1ACE76178();
  return (NSString *)v2;
}

+ (NSString)notificationReceived
{
  v2 = (void *)sub_1ACE76178();
  return (NSString *)v2;
}

+ (NSString)notificationScheduled
{
  v2 = (void *)sub_1ACE76178();
  return (NSString *)v2;
}

+ (NSString)notificationTapped
{
  v2 = (void *)sub_1ACE76178();
  return (NSString *)v2;
}

+ (NSString)podcastDataSource
{
  v2 = (void *)sub_1ACE76178();
  return (NSString *)v2;
}

+ (NSString)notificationSetRetryFlag
{
  v2 = (void *)sub_1ACE76178();
  return (NSString *)v2;
}

+ (NSString)notificationScheduledViaCarousel
{
  v2 = (void *)sub_1ACE76178();
  return (NSString *)v2;
}

+ (NSString)pageParser
{
  v2 = (void *)sub_1ACE76178();
  return (NSString *)v2;
}

+ (NSString)parser
{
  v2 = (void *)sub_1ACE76178();
  return (NSString *)v2;
}

+ (NSString)fetchFeedsExpectedToUpdate
{
  v2 = (void *)sub_1ACE76178();
  return (NSString *)v2;
}

+ (NSString)processCarouselTask
{
  v2 = (void *)sub_1ACE76178();
  return (NSString *)v2;
}

- (MTFeedUpdateMetricsAction)init
{
  return (MTFeedUpdateMetricsAction *)sub_1ACE57B30(self, (uint64_t)a2, type metadata accessor for FeedUpdateMetricsAction);
}

@end