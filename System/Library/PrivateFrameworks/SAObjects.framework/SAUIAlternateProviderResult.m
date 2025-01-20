@interface SAUIAlternateProviderResult
+ (id)alternateProviderResult;
- (NSArray)commands;
- (NSNumber)numberOfResults;
- (NSString)providerName;
- (SAUIImageResource)providerImage;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCommands:(id)a3;
- (void)setNumberOfResults:(id)a3;
- (void)setProviderImage:(id)a3;
- (void)setProviderName:(id)a3;
@end

@implementation SAUIAlternateProviderResult

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"AlternateProviderResult";
}

+ (id)alternateProviderResult
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

- (NSNumber)numberOfResults
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"numberOfResults"];
}

- (void)setNumberOfResults:(id)a3
{
}

- (SAUIImageResource)providerImage
{
  return (SAUIImageResource *)AceObjectAceObjectForProperty(self, @"providerImage");
}

- (void)setProviderImage:(id)a3
{
}

- (NSString)providerName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"providerName"];
}

- (void)setProviderName:(id)a3
{
}

@end