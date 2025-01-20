@interface SASportsMatchupLineScore
+ (id)matchupLineScore;
- (NSString)period;
- (NSString)score;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setPeriod:(id)a3;
- (void)setScore:(id)a3;
@end

@implementation SASportsMatchupLineScore

- (id)groupIdentifier
{
  return @"com.apple.ace.sports";
}

- (id)encodedClassName
{
  return @"MatchupLineScore";
}

+ (id)matchupLineScore
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)period
{
  return (NSString *)[(AceObject *)self propertyForKey:@"period"];
}

- (void)setPeriod:(id)a3
{
}

- (NSString)score
{
  return (NSString *)[(AceObject *)self propertyForKey:@"score"];
}

- (void)setScore:(id)a3
{
}

@end