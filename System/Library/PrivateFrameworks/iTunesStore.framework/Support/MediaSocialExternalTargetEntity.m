@interface MediaSocialExternalTargetEntity
+ (id)databaseTable;
+ (id)newEntityValuesWithMediaSocialExternalDestination:(id)a3;
@end

@implementation MediaSocialExternalTargetEntity

+ (id)newEntityValuesWithMediaSocialExternalDestination:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = [v3 accessToken];
  if (v5) {
    [v4 setObject:v5 forKey:@"access_token"];
  }
  v6 = [v3 pageAccessToken];

  if (v6) {
    [v4 setObject:v6 forKey:@"page_access_token"];
  }
  v7 = [v3 pageIdentifier];

  if (v7) {
    [v4 setObject:v7 forKey:@"page_id"];
  }
  id v8 = objc_alloc((Class)NSNumber);
  v9 = [v3 serviceIdentifier];
  id v10 = [v8 initWithInteger:sub_1000A0B94(v9)];

  [v4 setObject:v10 forKey:@"service_type"];
  return v4;
}

+ (id)databaseTable
{
  return @"external_target";
}

@end