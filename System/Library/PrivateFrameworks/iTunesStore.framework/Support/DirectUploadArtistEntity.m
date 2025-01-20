@interface DirectUploadArtistEntity
+ (id)databaseTable;
+ (id)newEntityValuesWithMediaSocialArtist:(id)a3;
@end

@implementation DirectUploadArtistEntity

+ (id)newEntityValuesWithMediaSocialArtist:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = [v3 identifier];
  if ([v5 length]) {
    [v4 setObject:v5 forKey:@"artist_id"];
  }
  v6 = [v3 name];

  if ([v6 length]) {
    [v4 setObject:v6 forKey:@"name"];
  }

  return v4;
}

+ (id)databaseTable
{
  return @"artist";
}

@end