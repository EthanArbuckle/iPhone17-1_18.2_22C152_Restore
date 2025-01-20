@interface SAUIListItem
+ (id)listItem;
- (NSArray)commands;
- (NSString)imageType;
- (NSString)label;
- (NSString)labelValue;
- (NSString)primaryDescriptiveText;
- (NSString)secondaryDescriptiveText;
- (NSString)selectionResponse;
- (NSString)selectionText;
- (NSString)speakableSelectionResponse;
- (NSString)title;
- (SAAceSerializable)object;
- (SASTTemplateContentRating)contentRating;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCommands:(id)a3;
- (void)setContentRating:(id)a3;
- (void)setImageType:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLabelValue:(id)a3;
- (void)setObject:(id)a3;
- (void)setPrimaryDescriptiveText:(id)a3;
- (void)setSecondaryDescriptiveText:(id)a3;
- (void)setSelectionResponse:(id)a3;
- (void)setSelectionText:(id)a3;
- (void)setSpeakableSelectionResponse:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SAUIListItem

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"ListItem";
}

+ (id)listItem
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)commands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"commands", &unk_1EFD73568);
}

- (void)setCommands:(id)a3
{
}

- (SASTTemplateContentRating)contentRating
{
  return (SASTTemplateContentRating *)AceObjectAceObjectForProperty(self, @"contentRating");
}

- (void)setContentRating:(id)a3
{
}

- (NSString)imageType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"imageType"];
}

- (void)setImageType:(id)a3
{
}

- (NSString)label
{
  return (NSString *)[(AceObject *)self propertyForKey:@"label"];
}

- (void)setLabel:(id)a3
{
}

- (NSString)labelValue
{
  return (NSString *)[(AceObject *)self propertyForKey:@"labelValue"];
}

- (void)setLabelValue:(id)a3
{
}

- (SAAceSerializable)object
{
  return (SAAceSerializable *)AceObjectAceObjectForProperty(self, @"object");
}

- (void)setObject:(id)a3
{
}

- (NSString)primaryDescriptiveText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"primaryDescriptiveText"];
}

- (void)setPrimaryDescriptiveText:(id)a3
{
}

- (NSString)secondaryDescriptiveText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"secondaryDescriptiveText"];
}

- (void)setSecondaryDescriptiveText:(id)a3
{
}

- (NSString)selectionResponse
{
  return (NSString *)[(AceObject *)self propertyForKey:@"selectionResponse"];
}

- (void)setSelectionResponse:(id)a3
{
}

- (NSString)selectionText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"selectionText"];
}

- (void)setSelectionText:(id)a3
{
}

- (NSString)speakableSelectionResponse
{
  return (NSString *)[(AceObject *)self propertyForKey:@"speakableSelectionResponse"];
}

- (void)setSpeakableSelectionResponse:(id)a3
{
}

- (NSString)title
{
  return (NSString *)[(AceObject *)self propertyForKey:@"title"];
}

- (void)setTitle:(id)a3
{
}

@end