@interface SAVCSContentCabinet
+ (id)contentCabinet;
- (BOOL)browseResults;
- (NSArray)shelves;
- (NSNumber)fullScreenEnabled;
- (SAUIConfirmationView)confirmationView;
- (SAUITemplateButton)foregroundAppButton;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setBrowseResults:(BOOL)a3;
- (void)setConfirmationView:(id)a3;
- (void)setForegroundAppButton:(id)a3;
- (void)setFullScreenEnabled:(id)a3;
- (void)setShelves:(id)a3;
@end

@implementation SAVCSContentCabinet

- (id)groupIdentifier
{
  return @"com.apple.ace.videocontent";
}

- (id)encodedClassName
{
  return @"ContentCabinet";
}

+ (id)contentCabinet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)browseResults
{
  return AceObjectBoolForProperty(self, @"browseResults");
}

- (void)setBrowseResults:(BOOL)a3
{
}

- (SAUIConfirmationView)confirmationView
{
  return (SAUIConfirmationView *)AceObjectAceObjectForProperty(self, @"confirmationView");
}

- (void)setConfirmationView:(id)a3
{
}

- (SAUITemplateButton)foregroundAppButton
{
  return (SAUITemplateButton *)AceObjectAceObjectForProperty(self, @"foregroundAppButton");
}

- (void)setForegroundAppButton:(id)a3
{
}

- (NSNumber)fullScreenEnabled
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"fullScreenEnabled"];
}

- (void)setFullScreenEnabled:(id)a3
{
}

- (NSArray)shelves
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"shelves", v3);
}

- (void)setShelves:(id)a3
{
}

@end