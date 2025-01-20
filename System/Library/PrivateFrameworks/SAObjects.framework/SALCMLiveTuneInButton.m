@interface SALCMLiveTuneInButton
+ (id)liveTuneInButton;
- (NSString)liveTuneInButtonType;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setLiveTuneInButtonType:(id)a3;
@end

@implementation SALCMLiveTuneInButton

- (id)groupIdentifier
{
  return @"com.apple.ace.livecontent";
}

- (id)encodedClassName
{
  return @"LiveTuneInButton";
}

+ (id)liveTuneInButton
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)liveTuneInButtonType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"liveTuneInButtonType"];
}

- (void)setLiveTuneInButtonType:(id)a3
{
}

@end