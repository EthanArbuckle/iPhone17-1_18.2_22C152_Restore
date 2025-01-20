@interface SATTSEstimateTTSRequestDuration
+ (id)estimateTTSRequestDuration;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSArray)texts;
- (NSString)gender;
- (NSString)locale;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setGender:(id)a3;
- (void)setLocale:(id)a3;
- (void)setTexts:(id)a3;
@end

@implementation SATTSEstimateTTSRequestDuration

- (id)groupIdentifier
{
  return @"com.apple.ace.tts";
}

- (id)encodedClassName
{
  return @"EstimateTTSRequestDuration";
}

+ (id)estimateTTSRequestDuration
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)gender
{
  return (NSString *)[(AceObject *)self propertyForKey:@"gender"];
}

- (void)setGender:(id)a3
{
}

- (NSString)locale
{
  return (NSString *)[(AceObject *)self propertyForKey:@"locale"];
}

- (void)setLocale:(id)a3
{
}

- (NSArray)texts
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"texts"];
}

- (void)setTexts:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end