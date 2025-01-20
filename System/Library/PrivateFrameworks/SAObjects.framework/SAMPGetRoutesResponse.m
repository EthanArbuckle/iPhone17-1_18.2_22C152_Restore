@interface SAMPGetRoutesResponse
+ (id)getRoutesResponse;
- (BOOL)requiresResponse;
- (NSArray)speakers;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setSpeakers:(id)a3;
@end

@implementation SAMPGetRoutesResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"GetRoutesResponse";
}

+ (id)getRoutesResponse
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)speakers
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"speakers", v3);
}

- (void)setSpeakers:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end