@interface SATTSGetUnspeakableRangeOfTextCompleted
+ (id)getUnspeakableRangeOfTextCompleted;
- (BOOL)requiresResponse;
- (NSArray)results;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setResults:(id)a3;
@end

@implementation SATTSGetUnspeakableRangeOfTextCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.tts";
}

- (id)encodedClassName
{
  return @"GetUnspeakableRangeOfTextCompleted";
}

+ (id)getUnspeakableRangeOfTextCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)results
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"results"];
}

- (void)setResults:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end