@interface SAReminderSiriKitSnippet
+ (id)siriKitSnippet;
- (NSArray)interactions;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setInteractions:(id)a3;
@end

@implementation SAReminderSiriKitSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.reminder";
}

- (id)encodedClassName
{
  return @"SiriKitSnippet";
}

+ (id)siriKitSnippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)interactions
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"interactions", v3);
}

- (void)setInteractions:(id)a3
{
}

@end