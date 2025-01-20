@interface SAStructuredDictationResult
+ (id)structuredDictationResult;
- (BOOL)requiresResponse;
- (NSArray)items;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setItems:(id)a3;
@end

@implementation SAStructuredDictationResult

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"StructuredDictationResult";
}

+ (id)structuredDictationResult
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)items
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"items", v3);
}

- (void)setItems:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end