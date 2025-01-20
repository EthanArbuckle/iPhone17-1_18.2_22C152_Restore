@interface BSUIReadingGoalsGaugeHostingControllerFactory
+ (id)createWith:(CGSize)a3;
- (BSUIReadingGoalsGaugeHostingControllerFactory)init;
@end

@implementation BSUIReadingGoalsGaugeHostingControllerFactory

+ (id)createWith:(CGSize)a3
{
  id v3 = objc_allocWithZone((Class)type metadata accessor for ReadingGoalsGaugeHostingController(0));
  id v4 = sub_1BF3BC();

  return v4;
}

- (BSUIReadingGoalsGaugeHostingControllerFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ReadingGoalsGaugeHostingControllerFactory();
  return [(BSUIReadingGoalsGaugeHostingControllerFactory *)&v3 init];
}

@end