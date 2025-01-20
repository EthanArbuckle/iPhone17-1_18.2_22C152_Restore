@interface SAStructuredDictationItem
+ (id)structuredDictationItem;
- (NSArray)resultOptions;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setResultOptions:(id)a3;
@end

@implementation SAStructuredDictationItem

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"StructuredDictationItem";
}

+ (id)structuredDictationItem
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)resultOptions
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"resultOptions", &unk_1EFD72F00);
}

- (void)setResultOptions:(id)a3
{
}

@end