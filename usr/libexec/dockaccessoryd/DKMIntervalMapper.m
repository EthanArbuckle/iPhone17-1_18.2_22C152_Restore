@interface DKMIntervalMapper
+ (id)unsignedClosedOpenFixedIntervalMapper:(id)a3;
+ (id)unsignedOpenClosedFixedIntervalMapper:(id)a3;
- (id)intervalForValue:(unint64_t)a3;
- (id)intervalIndexForValue:(unint64_t)a3;
@end

@implementation DKMIntervalMapper

+ (id)unsignedOpenClosedFixedIntervalMapper:(id)a3
{
  id v3 = a3;
  v4 = [[UnsignedFixedIntervalMapper alloc] initWithBins:v3 intervalCreationBlock:&stru_1002743F8 valueComparisonBlock:&stru_100274438];

  return v4;
}

+ (id)unsignedClosedOpenFixedIntervalMapper:(id)a3
{
  id v3 = a3;
  v4 = [[UnsignedFixedIntervalMapper alloc] initWithBins:v3 intervalCreationBlock:&stru_100274458 valueComparisonBlock:&stru_100274478];

  return v4;
}

- (id)intervalIndexForValue:(unint64_t)a3
{
  return 0;
}

- (id)intervalForValue:(unint64_t)a3
{
  return 0;
}

@end