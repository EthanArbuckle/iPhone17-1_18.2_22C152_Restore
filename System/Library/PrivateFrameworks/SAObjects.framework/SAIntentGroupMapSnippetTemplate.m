@interface SAIntentGroupMapSnippetTemplate
+ (id)mapSnippetTemplate;
- (BOOL)interactive;
- (NSString)mapSize;
- (SAIntentGroupDetailLabelTemplateComponent)detailLabelComponent;
- (SAIntentGroupSetMapLocation)updateLocationCommand;
- (SALocation)location;
- (SAUIColor)color;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setColor:(id)a3;
- (void)setDetailLabelComponent:(id)a3;
- (void)setInteractive:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setMapSize:(id)a3;
- (void)setUpdateLocationCommand:(id)a3;
@end

@implementation SAIntentGroupMapSnippetTemplate

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"MapSnippetTemplate";
}

+ (id)mapSnippetTemplate
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAUIColor)color
{
  return (SAUIColor *)AceObjectAceObjectForProperty(self, @"color");
}

- (void)setColor:(id)a3
{
}

- (SAIntentGroupDetailLabelTemplateComponent)detailLabelComponent
{
  return (SAIntentGroupDetailLabelTemplateComponent *)AceObjectAceObjectForProperty(self, @"detailLabelComponent");
}

- (void)setDetailLabelComponent:(id)a3
{
}

- (BOOL)interactive
{
  return AceObjectBoolForProperty(self, @"interactive");
}

- (void)setInteractive:(BOOL)a3
{
}

- (SALocation)location
{
  return (SALocation *)AceObjectAceObjectForProperty(self, @"location");
}

- (void)setLocation:(id)a3
{
}

- (NSString)mapSize
{
  return (NSString *)[(AceObject *)self propertyForKey:@"mapSize"];
}

- (void)setMapSize:(id)a3
{
}

- (SAIntentGroupSetMapLocation)updateLocationCommand
{
  return (SAIntentGroupSetMapLocation *)AceObjectAceObjectForProperty(self, @"updateLocationCommand");
}

- (void)setUpdateLocationCommand:(id)a3
{
}

@end