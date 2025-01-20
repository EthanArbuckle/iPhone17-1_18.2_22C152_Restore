@interface SAPhoneCallSnippet
+ (id)callSnippet;
- (NSArray)calls;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCalls:(id)a3;
@end

@implementation SAPhoneCallSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.phone";
}

- (id)encodedClassName
{
  return @"CallSnippet";
}

+ (id)callSnippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)calls
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"calls", v3);
}

- (void)setCalls:(id)a3
{
}

@end