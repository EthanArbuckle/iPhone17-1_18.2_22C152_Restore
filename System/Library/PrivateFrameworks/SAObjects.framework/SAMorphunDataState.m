@interface SAMorphunDataState
+ (id)deliveryDeadline;
+ (id)morphunDataState;
+ (id)persistencePolicy;
- (NSDictionary)assetVersionPerLocale;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAssetVersionPerLocale:(id)a3;
@end

@implementation SAMorphunDataState

+ (id)deliveryDeadline
{
  return @"CUSTOM";
}

+ (id)persistencePolicy
{
  return @"LIFE_OF_USER_DATA";
}

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"MorphunDataState";
}

+ (id)morphunDataState
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSDictionary)assetVersionPerLocale
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"assetVersionPerLocale"];
}

- (void)setAssetVersionPerLocale:(id)a3
{
}

@end