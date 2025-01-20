@interface SAUSImageMarkup
+ (id)imageMarkup;
- (SAUIImageResource)imageResource;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setImageResource:(id)a3;
@end

@implementation SAUSImageMarkup

- (id)groupIdentifier
{
  return @"com.apple.ace.universalsearch";
}

- (id)encodedClassName
{
  return @"ImageMarkup";
}

+ (id)imageMarkup
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAUIImageResource)imageResource
{
  return (SAUIImageResource *)AceObjectAceObjectForProperty(self, @"imageResource");
}

- (void)setImageResource:(id)a3
{
}

@end