@interface SAUIPluginShowNextSnippet
- (SAUIPluginSnippet)pluginSnippet;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setPluginSnippet:(id)a3;
@end

@implementation SAUIPluginShowNextSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"PluginShowNextSnippet";
}

- (SAUIPluginSnippet)pluginSnippet
{
  return (SAUIPluginSnippet *)AceObjectAceObjectForProperty(self, @"pluginSnippet");
}

- (void)setPluginSnippet:(id)a3
{
}

@end