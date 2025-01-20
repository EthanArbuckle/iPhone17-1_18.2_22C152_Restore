@interface SASTAncillaryImageItem
+ (id)ancillaryImageItem;
- (SAUIDecoratedText)subtitle;
- (SAUIDecoratedText)title;
- (SAUINanoImageResource)imageResource;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setImageResource:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SASTAncillaryImageItem

- (id)groupIdentifier
{
  return @"com.apple.ace.templates";
}

- (id)encodedClassName
{
  return @"AncillaryImageItem";
}

+ (id)ancillaryImageItem
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAUINanoImageResource)imageResource
{
  return (SAUINanoImageResource *)AceObjectAceObjectForProperty(self, @"imageResource");
}

- (void)setImageResource:(id)a3
{
}

- (SAUIDecoratedText)subtitle
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, @"subtitle");
}

- (void)setSubtitle:(id)a3
{
}

- (SAUIDecoratedText)title
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, @"title");
}

- (void)setTitle:(id)a3
{
}

@end