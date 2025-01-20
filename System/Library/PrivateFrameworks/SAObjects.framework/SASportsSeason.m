@interface SASportsSeason
+ (id)season;
- (NSNumber)currentSeasonYear;
- (NSNumber)seasonYear;
- (NSString)relativeSeasonYear;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCurrentSeasonYear:(id)a3;
- (void)setRelativeSeasonYear:(id)a3;
- (void)setSeasonYear:(id)a3;
@end

@implementation SASportsSeason

- (id)groupIdentifier
{
  return @"com.apple.ace.sports";
}

- (id)encodedClassName
{
  return @"Season";
}

+ (id)season
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)currentSeasonYear
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"currentSeasonYear"];
}

- (void)setCurrentSeasonYear:(id)a3
{
}

- (NSString)relativeSeasonYear
{
  return (NSString *)[(AceObject *)self propertyForKey:@"relativeSeasonYear"];
}

- (void)setRelativeSeasonYear:(id)a3
{
}

- (NSNumber)seasonYear
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"seasonYear"];
}

- (void)setSeasonYear:(id)a3
{
}

@end