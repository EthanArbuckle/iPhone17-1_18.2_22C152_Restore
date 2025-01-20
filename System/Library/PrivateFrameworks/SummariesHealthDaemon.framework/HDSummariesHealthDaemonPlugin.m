@interface HDSummariesHealthDaemonPlugin
- (NSString)pluginIdentifier;
- (id)extensionForHealthDaemon:(id)a3;
- (id)extensionForProfile:(id)a3;
@end

@implementation HDSummariesHealthDaemonPlugin

- (NSString)pluginIdentifier
{
  return (NSString *)@"Summaries";
}

- (id)extensionForProfile:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = [[HDSummariesHealthDaemonPluginProfileExtension alloc] initWithProfile:v3];
  }
  else {
    v4 = 0;
  }

  return v4;
}

- (id)extensionForHealthDaemon:(id)a3
{
  return 0;
}

@end