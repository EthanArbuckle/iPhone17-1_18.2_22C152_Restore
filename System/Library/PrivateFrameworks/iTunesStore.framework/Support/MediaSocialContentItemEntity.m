@interface MediaSocialContentItemEntity
+ (id)databaseTable;
+ (id)newEntityValuesWithMediaSocialPostItem:(id)a3;
@end

@implementation MediaSocialContentItemEntity

+ (id)databaseTable
{
  return @"content_item";
}

+ (id)newEntityValuesWithMediaSocialPostItem:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = [v3 identifier];
  if (v5) {
    [v4 setObject:v5 forKey:@"item_id"];
  }
  v6 = [v3 type];

  if (v6) {
    [v4 setObject:v6 forKey:@"type"];
  }

  return v4;
}

@end