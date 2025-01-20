@interface SADialog
- (BOOL)canUseServerTTS;
- (BOOL)printedOnly;
- (BOOL)spokenOnly;
- (NSString)dialogCategory;
- (NSString)dialogIdentifier;
- (SADialogConfiguration)configuration;
- (SADialogText)caption;
- (SADialogText)content;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCanUseServerTTS:(BOOL)a3;
- (void)setCaption:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setContent:(id)a3;
- (void)setDialogCategory:(id)a3;
- (void)setDialogIdentifier:(id)a3;
- (void)setPrintedOnly:(BOOL)a3;
- (void)setSpokenOnly:(BOOL)a3;
@end

@implementation SADialog

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"Dialog";
}

- (BOOL)canUseServerTTS
{
  return AceObjectBoolForProperty(self, @"canUseServerTTS");
}

- (void)setCanUseServerTTS:(BOOL)a3
{
}

- (SADialogText)caption
{
  return (SADialogText *)AceObjectAceObjectForProperty(self, @"caption");
}

- (void)setCaption:(id)a3
{
}

- (SADialogConfiguration)configuration
{
  return (SADialogConfiguration *)AceObjectAceObjectForProperty(self, @"configuration");
}

- (void)setConfiguration:(id)a3
{
}

- (SADialogText)content
{
  return (SADialogText *)AceObjectAceObjectForProperty(self, @"content");
}

- (void)setContent:(id)a3
{
}

- (NSString)dialogCategory
{
  return (NSString *)[(AceObject *)self propertyForKey:@"dialogCategory"];
}

- (void)setDialogCategory:(id)a3
{
}

- (NSString)dialogIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"dialogIdentifier"];
}

- (void)setDialogIdentifier:(id)a3
{
}

- (BOOL)printedOnly
{
  return AceObjectBoolForProperty(self, @"printedOnly");
}

- (void)setPrintedOnly:(BOOL)a3
{
}

- (BOOL)spokenOnly
{
  return AceObjectBoolForProperty(self, @"spokenOnly");
}

- (void)setSpokenOnly:(BOOL)a3
{
}

@end