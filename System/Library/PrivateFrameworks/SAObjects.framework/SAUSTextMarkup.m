@interface SAUSTextMarkup
+ (id)textMarkup;
- (BOOL)emphasized;
- (NSString)text;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setEmphasized:(BOOL)a3;
- (void)setText:(id)a3;
@end

@implementation SAUSTextMarkup

- (id)groupIdentifier
{
  return @"com.apple.ace.universalsearch";
}

- (id)encodedClassName
{
  return @"TextMarkup";
}

+ (id)textMarkup
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)emphasized
{
  return AceObjectBoolForProperty(self, @"emphasized");
}

- (void)setEmphasized:(BOOL)a3
{
}

- (NSString)text
{
  return (NSString *)[(AceObject *)self propertyForKey:@"text"];
}

- (void)setText:(id)a3
{
}

@end