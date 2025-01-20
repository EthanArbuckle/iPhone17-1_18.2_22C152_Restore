@interface SASTAttributionItem
+ (id)attributionItem;
- (NSString)attributionPosition;
- (NSString)text;
- (SASTTemplateAction)action;
- (SAUINanoImageResource)imageResource;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAction:(id)a3;
- (void)setAttributionPosition:(id)a3;
- (void)setImageResource:(id)a3;
- (void)setText:(id)a3;
@end

@implementation SASTAttributionItem

- (id)groupIdentifier
{
  return @"com.apple.ace.templates";
}

- (id)encodedClassName
{
  return @"AttributionItem";
}

+ (id)attributionItem
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SASTTemplateAction)action
{
  return (SASTTemplateAction *)AceObjectAceObjectForProperty(self, @"action");
}

- (void)setAction:(id)a3
{
}

- (NSString)attributionPosition
{
  return (NSString *)[(AceObject *)self propertyForKey:@"attributionPosition"];
}

- (void)setAttributionPosition:(id)a3
{
}

- (SAUINanoImageResource)imageResource
{
  return (SAUINanoImageResource *)AceObjectAceObjectForProperty(self, @"imageResource");
}

- (void)setImageResource:(id)a3
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