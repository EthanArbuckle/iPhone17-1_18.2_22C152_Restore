@interface MPMediaQuery
+ (id)bk_audiobooksNonPreordersQuery;
+ (id)bk_audiobooksQuery;
+ (id)bk_queryWithStoreID:(id)a3 albumTitle:(id)a4 isCloudItem:(BOOL)a5;
@end

@implementation MPMediaQuery

+ (id)bk_audiobooksQuery
{
  return +[BLMediaQuery audiobooksQuery];
}

+ (id)bk_audiobooksNonPreordersQuery
{
  return +[BLMediaQuery audiobooksNonPreordersQuery];
}

+ (id)bk_queryWithStoreID:(id)a3 albumTitle:(id)a4 isCloudItem:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  if ([v8 length])
  {
    uint64_t v9 = BUStoreIdFromObject();
    v10 = +[BLMediaQuery audiobooksQuery];
    v11 = +[MPMediaPropertyPredicate predicateWithValue:v8 forProperty:MPMediaItemPropertyAlbumTitle];
    [v10 addFilterPredicate:v11];

    if (v9)
    {
      v12 = (id *)&MPMediaItemPropertyStorePlaylistID;
      if (v5) {
        v12 = (id *)&MPMediaItemPropertyStoreID;
      }
      id v13 = *v12;
      v14 = +[NSNumber numberWithUnsignedLongLong:v9];
      v15 = +[MPMediaPropertyPredicate predicateWithValue:v14 forProperty:v13];
      [v10 addFilterPredicate:v15];
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end