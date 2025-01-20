@interface SACFPEXResponse
+ (id)response;
- (BOOL)requiresResponse;
- (NSArray)pexItems;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setPexItems:(id)a3;
@end

@implementation SACFPEXResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.clientflow.local.pex";
}

- (id)encodedClassName
{
  return @"Response";
}

+ (id)response
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)pexItems
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"pexItems", v3);
}

- (void)setPexItems:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end