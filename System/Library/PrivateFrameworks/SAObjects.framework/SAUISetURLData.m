@interface SAUISetURLData
+ (id)setURLData;
- (BOOL)requiresResponse;
- (NSArray)urlData;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setUrlData:(id)a3;
@end

@implementation SAUISetURLData

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"SetURLData";
}

+ (id)setURLData
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)urlData
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"urlData", v3);
}

- (void)setUrlData:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end