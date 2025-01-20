@interface SADialogInflectWordResponses
+ (id)inflectWordResponses;
- (BOOL)requiresResponse;
- (NSArray)inflectWordResponses;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setInflectWordResponses:(id)a3;
@end

@implementation SADialogInflectWordResponses

- (id)groupIdentifier
{
  return @"com.apple.ace.dialog";
}

- (id)encodedClassName
{
  return @"InflectWordResponses";
}

+ (id)inflectWordResponses
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)inflectWordResponses
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"inflectWordResponses", v3);
}

- (void)setInflectWordResponses:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end