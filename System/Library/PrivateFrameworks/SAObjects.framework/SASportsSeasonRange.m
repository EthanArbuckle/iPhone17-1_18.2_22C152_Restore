@interface SASportsSeasonRange
+ (id)seasonRange;
- (NSDate)end;
- (NSDate)start;
- (NSString)seasonType;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setEnd:(id)a3;
- (void)setSeasonType:(id)a3;
- (void)setStart:(id)a3;
@end

@implementation SASportsSeasonRange

- (id)groupIdentifier
{
  return @"com.apple.ace.sports";
}

- (id)encodedClassName
{
  return @"SeasonRange";
}

+ (id)seasonRange
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSDate)end
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"end"];
}

- (void)setEnd:(id)a3
{
}

- (NSString)seasonType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"seasonType"];
}

- (void)setSeasonType:(id)a3
{
}

- (NSDate)start
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"start"];
}

- (void)setStart:(id)a3
{
}

@end