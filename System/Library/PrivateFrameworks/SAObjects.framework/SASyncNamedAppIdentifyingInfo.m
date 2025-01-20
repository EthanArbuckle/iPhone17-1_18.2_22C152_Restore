@interface SASyncNamedAppIdentifyingInfo
+ (id)namedAppIdentifyingInfo;
- (NSString)localizedBundleDisplayName;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setLocalizedBundleDisplayName:(id)a3;
@end

@implementation SASyncNamedAppIdentifyingInfo

- (id)groupIdentifier
{
  return @"com.apple.ace.sync";
}

- (id)encodedClassName
{
  return @"NamedAppIdentifyingInfo";
}

+ (id)namedAppIdentifyingInfo
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)localizedBundleDisplayName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"localizedBundleDisplayName"];
}

- (void)setLocalizedBundleDisplayName:(id)a3
{
}

@end