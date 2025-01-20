@interface SASTApplicationBannerItem
+ (id)applicationBannerItem;
- (NSString)bundleId;
- (SASTTemplateAction)action;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAction:(id)a3;
- (void)setBundleId:(id)a3;
@end

@implementation SASTApplicationBannerItem

- (id)groupIdentifier
{
  return @"com.apple.ace.templates";
}

- (id)encodedClassName
{
  return @"ApplicationBannerItem";
}

+ (id)applicationBannerItem
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SASTTemplateAction)action
{
  return (SASTTemplateAction *)AceObjectAceObjectForProperty(self, @"action");
}

- (void)setAction:(id)a3
{
}

- (NSString)bundleId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"bundleId"];
}

- (void)setBundleId:(id)a3
{
}

@end