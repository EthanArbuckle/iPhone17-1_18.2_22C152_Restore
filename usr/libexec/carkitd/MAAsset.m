@interface MAAsset
+ (id)cr_contentVersionSortedAssetsFromAssets:(id)a3;
+ (id)cr_highestContentVersionAssetInAssets:(id)a3;
+ (id)cr_installedAssetsInAssets:(id)a3;
+ (id)cr_themeAsset_filteredAssets:(id)a3 matchingAssetIdentifier:(id)a4 maximumSDKVersion:(id)a5 maximumCompatibilityVersion:(id)a6;
+ (id)cr_themeAsset_highestVersionAssetInAssets:(id)a3;
+ (id)cr_themeAsset_versionSortedAssetsFromAssets:(id)a3;
- (id)cr_assetVersion;
- (id)cr_contentVersion;
- (id)cr_numberForAttributesKey:(id)a3;
- (id)cr_stringForAttributesKey:(id)a3;
- (id)cr_themeAsset_accessoryContentVersion;
- (id)cr_themeAsset_assetIdentifier;
- (id)cr_themeAsset_iOSContentVersion;
- (id)cr_themeAsset_minimumCompatibilityVersion;
- (id)cr_themeAsset_minimumSDKVersion;
- (int64_t)cr_contentVersionCompare:(id)a3;
- (int64_t)cr_themeAsset_versionCompare:(id)a3;
@end

@implementation MAAsset

+ (id)cr_contentVersionSortedAssetsFromAssets:(id)a3
{
  return [a3 sortedArrayUsingComparator:&stru_1000BEDF8];
}

+ (id)cr_highestContentVersionAssetInAssets:(id)a3
{
  v3 = [a1 cr_contentVersionSortedAssetsFromAssets:a3];
  v4 = [v3 lastObject];

  return v4;
}

- (id)cr_contentVersion
{
  return [(MAAsset *)self cr_numberForAttributesKey:ASAttributeContentVersion];
}

- (int64_t)cr_contentVersionCompare:(id)a3
{
  id v4 = a3;
  v5 = [(MAAsset *)self cr_contentVersion];
  v6 = [v4 cr_contentVersion];

  if (v5 && v6)
  {
    int64_t v7 = (int64_t)[v5 compare:v6];
  }
  else if (v6)
  {
    int64_t v7 = -1;
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

+ (id)cr_installedAssetsInAssets:(id)a3
{
  id v3 = a3;
  id v4 = +[NSPredicate predicateWithBlock:&stru_1000BF5E0];
  v5 = [v3 filteredArrayUsingPredicate:v4];

  return v5;
}

- (id)cr_stringForAttributesKey:(id)a3
{
  id v4 = a3;
  v5 = [(MAAsset *)self attributes];
  v6 = [v5 objectForKey:v4];

  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (id)cr_numberForAttributesKey:(id)a3
{
  id v4 = a3;
  v5 = [(MAAsset *)self attributes];
  v6 = [v5 objectForKey:v4];

  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (id)cr_themeAsset_assetIdentifier
{
  return [(MAAsset *)self cr_stringForAttributesKey:@"ContentIdentifier"];
}

- (id)cr_themeAsset_iOSContentVersion
{
  v2 = [(MAAsset *)self cr_stringForAttributesKey:@"iOSContentVersion"];
  if (!v2) {
    v2 = @"0";
  }

  return v2;
}

- (id)cr_themeAsset_accessoryContentVersion
{
  id v3 = [(MAAsset *)self cr_numberForAttributesKey:@"AccessoryContentVersion"];
  if (!v3)
  {
    id v4 = [(MAAsset *)self cr_numberForAttributesKey:@"_ContentVersion"];
    id v3 = v4;
    if (v4) {
      id v5 = v4;
    }
  }

  return v3;
}

- (id)cr_themeAsset_minimumSDKVersion
{
  return [(MAAsset *)self cr_stringForAttributesKey:@"MinimumSDKVersion"];
}

- (id)cr_themeAsset_minimumCompatibilityVersion
{
  return [(MAAsset *)self cr_numberForAttributesKey:@"MinimumCompatibilityVersion"];
}

- (id)cr_assetVersion
{
  id v3 = [(MAAsset *)self cr_themeAsset_assetIdentifier];
  if (v3)
  {
    id v4 = [(MAAsset *)self cr_themeAsset_iOSContentVersion];
    if (!v4)
    {
      id v5 = CarThemeAssetsLogging();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_10007657C(v5, v6, v7, v8, v9, v10, v11, v12);
      }

      id v4 = @"0";
    }
    v13 = [(MAAsset *)self cr_themeAsset_accessoryContentVersion];
    if (!v13)
    {
      v14 = CarThemeAssetsLogging();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100076544(v14, v15, v16, v17, v18, v19, v20, v21);
      }

      v13 = &off_1000C67D8;
    }
    id v22 = [objc_alloc((Class)CARThemeAssetVersion) initWithIdentifier:v3 iOSContentVersion:v4 accessoryContentVersion:v13];
  }
  else
  {
    id v4 = CarThemeAssetsLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10007650C(v4, v23, v24, v25, v26, v27, v28, v29);
    }
    id v22 = 0;
  }

  return v22;
}

+ (id)cr_themeAsset_versionSortedAssetsFromAssets:(id)a3
{
  return [a3 sortedArrayUsingComparator:&stru_1000BF950];
}

+ (id)cr_themeAsset_highestVersionAssetInAssets:(id)a3
{
  id v3 = [a1 cr_themeAsset_versionSortedAssetsFromAssets:a3];
  id v4 = [v3 lastObject];

  return v4;
}

- (int64_t)cr_themeAsset_versionCompare:(id)a3
{
  id v4 = a3;
  id v5 = [(MAAsset *)self cr_assetVersion];
  uint64_t v6 = [v4 cr_assetVersion];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

+ (id)cr_themeAsset_filteredAssets:(id)a3 matchingAssetIdentifier:(id)a4 maximumSDKVersion:(id)a5 maximumCompatibilityVersion:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = &__NSArray0__struct;
  if (a3 && v9)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100066B64;
    v16[3] = &unk_1000BF978;
    id v17 = v9;
    id v18 = v10;
    id v19 = v11;
    id v13 = a3;
    v14 = +[NSPredicate predicateWithBlock:v16];
    uint64_t v12 = [v13 filteredArrayUsingPredicate:v14];
  }

  return v12;
}

@end