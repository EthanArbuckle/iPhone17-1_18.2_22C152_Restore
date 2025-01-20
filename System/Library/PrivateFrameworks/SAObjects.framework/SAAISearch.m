@interface SAAISearch
+ (id)search;
- (BOOL)requiresResponse;
- (NSData)fingerprint;
- (double)duration;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDuration:(double)a3;
- (void)setFingerprint:(id)a3;
@end

@implementation SAAISearch

- (id)groupIdentifier
{
  return @"com.apple.ace.acousticid";
}

- (id)encodedClassName
{
  return @"Search";
}

+ (id)search
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (double)duration
{
  return AceObjectDoubleForProperty(self, @"duration");
}

- (void)setDuration:(double)a3
{
}

- (NSData)fingerprint
{
  return (NSData *)[(AceObject *)self propertyForKey:@"fingerprint"];
}

- (void)setFingerprint:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end