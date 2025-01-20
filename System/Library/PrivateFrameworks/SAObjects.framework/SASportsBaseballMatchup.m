@interface SASportsBaseballMatchup
+ (id)baseballMatchup;
- (NSNumber)awayErrors;
- (NSNumber)awayHits;
- (NSNumber)balls;
- (NSNumber)homeErrors;
- (NSNumber)homeHits;
- (NSNumber)onFirst;
- (NSNumber)onSecond;
- (NSNumber)onThird;
- (NSNumber)outs;
- (NSNumber)strikes;
- (NSString)inningStatus;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAwayErrors:(id)a3;
- (void)setAwayHits:(id)a3;
- (void)setBalls:(id)a3;
- (void)setHomeErrors:(id)a3;
- (void)setHomeHits:(id)a3;
- (void)setInningStatus:(id)a3;
- (void)setOnFirst:(id)a3;
- (void)setOnSecond:(id)a3;
- (void)setOnThird:(id)a3;
- (void)setOuts:(id)a3;
- (void)setStrikes:(id)a3;
@end

@implementation SASportsBaseballMatchup

- (id)groupIdentifier
{
  return @"com.apple.ace.sports";
}

- (id)encodedClassName
{
  return @"BaseballMatchup";
}

+ (id)baseballMatchup
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)awayErrors
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"awayErrors"];
}

- (void)setAwayErrors:(id)a3
{
}

- (NSNumber)awayHits
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"awayHits"];
}

- (void)setAwayHits:(id)a3
{
}

- (NSNumber)balls
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"balls"];
}

- (void)setBalls:(id)a3
{
}

- (NSNumber)homeErrors
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"homeErrors"];
}

- (void)setHomeErrors:(id)a3
{
}

- (NSNumber)homeHits
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"homeHits"];
}

- (void)setHomeHits:(id)a3
{
}

- (NSString)inningStatus
{
  return (NSString *)[(AceObject *)self propertyForKey:@"inningStatus"];
}

- (void)setInningStatus:(id)a3
{
}

- (NSNumber)onFirst
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"onFirst"];
}

- (void)setOnFirst:(id)a3
{
}

- (NSNumber)onSecond
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"onSecond"];
}

- (void)setOnSecond:(id)a3
{
}

- (NSNumber)onThird
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"onThird"];
}

- (void)setOnThird:(id)a3
{
}

- (NSNumber)outs
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"outs"];
}

- (void)setOuts:(id)a3
{
}

- (NSNumber)strikes
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"strikes"];
}

- (void)setStrikes:(id)a3
{
}

@end