@interface SAUserConfidenceScore
+ (id)userConfidenceScore;
- (NSString)sharedUserId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)confidenceScore;
- (void)setConfidenceScore:(int64_t)a3;
- (void)setSharedUserId:(id)a3;
@end

@implementation SAUserConfidenceScore

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"UserConfidenceScore";
}

+ (id)userConfidenceScore
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (int64_t)confidenceScore
{
  return AceObjectIntegerForProperty(self, @"confidenceScore");
}

- (void)setConfidenceScore:(int64_t)a3
{
}

- (NSString)sharedUserId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"sharedUserId"];
}

- (void)setSharedUserId:(id)a3
{
}

@end