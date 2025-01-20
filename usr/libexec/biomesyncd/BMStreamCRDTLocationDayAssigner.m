@interface BMStreamCRDTLocationDayAssigner
+ (id)truncateDateToDay:(double)a3;
- (BMStreamCRDTLocationDayAssigner)init;
- (id)locationWithStreamName:(id)a3 siteIdentifier:(id)a4 timestamp:(double)a5;
@end

@implementation BMStreamCRDTLocationDayAssigner

- (BMStreamCRDTLocationDayAssigner)init
{
  v3.receiver = self;
  v3.super_class = (Class)BMStreamCRDTLocationDayAssigner;
  return [(BMStreamCRDTLocationDayAssigner *)&v3 init];
}

+ (id)truncateDateToDay:(double)a3
{
  return +[NSDate dateWithTimeIntervalSinceReferenceDate:floor(a3 / 86400.0) * 86400.0];
}

- (id)locationWithStreamName:(id)a3 siteIdentifier:(id)a4 timestamp:(double)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [(id)objc_opt_class() truncateDateToDay:a5];
  v10 = [[BMStreamCRDTLocation alloc] initWithStreamName:v8 siteIdentifier:v7 day:v9];

  return v10;
}

@end