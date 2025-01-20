@interface SAUIDisambiguationList
+ (id)disambiguationList;
- (BOOL)autoDisambiguationDisabled;
- (NSArray)fallbackCommands;
- (NSArray)items;
- (NSString)disambiguationKey;
- (NSString)groupTitle;
- (NSString)selectionResponse;
- (NSString)speakableDelimiter;
- (NSString)speakableFinalDelimiter;
- (NSString)speakableSelectionResponse;
- (NSString)speakableSuffix;
- (NSString)title;
- (SAUIDomainObjectPicker)domainObjectPicker;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAutoDisambiguationDisabled:(BOOL)a3;
- (void)setDisambiguationKey:(id)a3;
- (void)setDomainObjectPicker:(id)a3;
- (void)setFallbackCommands:(id)a3;
- (void)setGroupTitle:(id)a3;
- (void)setItems:(id)a3;
- (void)setSelectionResponse:(id)a3;
- (void)setSpeakableDelimiter:(id)a3;
- (void)setSpeakableFinalDelimiter:(id)a3;
- (void)setSpeakableSelectionResponse:(id)a3;
- (void)setSpeakableSuffix:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SAUIDisambiguationList

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"DisambiguationList";
}

+ (id)disambiguationList
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)autoDisambiguationDisabled
{
  return AceObjectBoolForProperty(self, @"autoDisambiguationDisabled");
}

- (void)setAutoDisambiguationDisabled:(BOOL)a3
{
}

- (NSString)disambiguationKey
{
  return (NSString *)[(AceObject *)self propertyForKey:@"disambiguationKey"];
}

- (void)setDisambiguationKey:(id)a3
{
}

- (SAUIDomainObjectPicker)domainObjectPicker
{
  return (SAUIDomainObjectPicker *)AceObjectAceObjectForProperty(self, @"domainObjectPicker");
}

- (void)setDomainObjectPicker:(id)a3
{
}

- (NSArray)fallbackCommands
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"fallbackCommands", v3);
}

- (void)setFallbackCommands:(id)a3
{
}

- (NSString)groupTitle
{
  return (NSString *)[(AceObject *)self propertyForKey:@"groupTitle"];
}

- (void)setGroupTitle:(id)a3
{
}

- (NSArray)items
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"items", v3);
}

- (void)setItems:(id)a3
{
}

- (NSString)selectionResponse
{
  return (NSString *)[(AceObject *)self propertyForKey:@"selectionResponse"];
}

- (void)setSelectionResponse:(id)a3
{
}

- (NSString)speakableDelimiter
{
  return (NSString *)[(AceObject *)self propertyForKey:@"speakableDelimiter"];
}

- (void)setSpeakableDelimiter:(id)a3
{
}

- (NSString)speakableFinalDelimiter
{
  return (NSString *)[(AceObject *)self propertyForKey:@"speakableFinalDelimiter"];
}

- (void)setSpeakableFinalDelimiter:(id)a3
{
}

- (NSString)speakableSelectionResponse
{
  return (NSString *)[(AceObject *)self propertyForKey:@"speakableSelectionResponse"];
}

- (void)setSpeakableSelectionResponse:(id)a3
{
}

- (NSString)speakableSuffix
{
  return (NSString *)[(AceObject *)self propertyForKey:@"speakableSuffix"];
}

- (void)setSpeakableSuffix:(id)a3
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