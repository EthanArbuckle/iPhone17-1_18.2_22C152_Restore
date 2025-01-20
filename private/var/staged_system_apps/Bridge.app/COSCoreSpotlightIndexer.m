@interface COSCoreSpotlightIndexer
+ (char)spotlightIndexQueueIdentifier;
+ (id)searchIndexIdentifier;
- (id)_bundleForSpecifier:(id)a3 parentBundle:(id)a4;
- (id)blacklistedControllers;
- (id)searchableItemAttributeSetClassIdenfitier;
- (id)searchableItemClassIdentifier;
@end

@implementation COSCoreSpotlightIndexer

- (id)searchableItemClassIdentifier
{
  return @"com.apple.Bridge";
}

+ (char)spotlightIndexQueueIdentifier
{
  return "com.apple.Bridge.spotlightIndexQueue";
}

+ (id)searchIndexIdentifier
{
  return @"com.apple.Bridge.SearchableIndex";
}

- (id)blacklistedControllers
{
  return &off_10025BC50;
}

- (id)searchableItemAttributeSetClassIdenfitier
{
  return @"com.apple.Bridge.url";
}

- (id)_bundleForSpecifier:(id)a3 parentBundle:(id)a4
{
  id v5 = a4;
  v6 = [a3 propertyForKey:PSBundlePathKey];
  if (![v6 length])
  {
    id v12 = v5;
    goto LABEL_6;
  }
  v7 = [@"/System/Library/NanoPreferenceBundles/General/" stringByAppendingPathComponent:v6];
  v8 = [v7 stringByAppendingPathExtension:@"bundle"];
  v9 = +[NSBundle bundleWithPath:v8];

  if (!v9)
  {
    v10 = [@"/System/Library/NanoPreferenceBundles/Applications/" stringByAppendingPathComponent:v6];
    v11 = [v10 stringByAppendingPathExtension:@"bundle"];

    v9 = +[NSBundle bundleWithPath:v11];

    if (!v9)
    {
      sub_100008380();
      id v12 = +[NSBundle bundleWithIdentifier:@"com.apple.PBBridgeSupport"];
LABEL_6:
      v9 = v12;
    }
  }

  return v9;
}

@end