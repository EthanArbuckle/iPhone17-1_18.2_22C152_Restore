@interface SAIntentGroupSiriKitPluginSignal
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSString)bundleIdentifier;
- (SAIntentGroupSiriKitPluginSignal)initWithBundleIdentifier:(id)a3;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setBundleIdentifier:(id)a3;
@end

@implementation SAIntentGroupSiriKitPluginSignal

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"SiriKitPluginSignal";
}

- (SAIntentGroupSiriKitPluginSignal)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(AceObject *)self init];
  v6 = v5;
  if (v5) {
    [(SAIntentGroupSiriKitPluginSignal *)v5 setBundleIdentifier:v4];
  }

  return v6;
}

- (NSString)bundleIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"bundleIdentifier"];
}

- (void)setBundleIdentifier:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end