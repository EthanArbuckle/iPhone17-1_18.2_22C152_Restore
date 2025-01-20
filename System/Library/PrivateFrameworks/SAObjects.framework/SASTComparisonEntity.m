@interface SASTComparisonEntity
+ (id)comparisonEntity;
- (SAUIDecoratedText)decoratedTitle;
- (SAUIDecoratedText)decoratedValue;
- (SAUINanoImageResource)imageResource;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDecoratedTitle:(id)a3;
- (void)setDecoratedValue:(id)a3;
- (void)setImageResource:(id)a3;
@end

@implementation SASTComparisonEntity

- (id)groupIdentifier
{
  return @"com.apple.ace.templates";
}

- (id)encodedClassName
{
  return @"ComparisonEntity";
}

+ (id)comparisonEntity
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAUIDecoratedText)decoratedTitle
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, @"decoratedTitle");
}

- (void)setDecoratedTitle:(id)a3
{
}

- (SAUIDecoratedText)decoratedValue
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, @"decoratedValue");
}

- (void)setDecoratedValue:(id)a3
{
}

- (SAUINanoImageResource)imageResource
{
  return (SAUINanoImageResource *)AceObjectAceObjectForProperty(self, @"imageResource");
}

- (void)setImageResource:(id)a3
{
}

@end