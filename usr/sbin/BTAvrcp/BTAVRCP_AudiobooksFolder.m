@interface BTAVRCP_AudiobooksFolder
- (id)baseQuery;
- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4;
- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4;
- (unint64_t)childrenCount;
- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4;
- (unsigned)playItemWithUid:(unint64_t)a3;
@end

@implementation BTAVRCP_AudiobooksFolder

- (id)baseQuery
{
  return +[MPMediaQuery audiobooksQuery];
}

- (unint64_t)childrenCount
{
  v2 = [(BTAVRCP_VFSFolder *)self query];
  v3 = [v2 collections];
  id v4 = [v3 count];

  return (unint64_t)v4;
}

- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4
{
  v6 = [(BTAVRCP_VFSFolder *)self query];
  v7 = [v6 collectionWithUid:a3 property:MPMediaItemPropertyAlbumPersistentID];

  if (v7)
  {
    v8 = [v7 representativeItem];
    v9 = [v8 valueForProperty:MPMediaItemPropertyAlbumPersistentID];

    v10 = [v7 representativeItem];
    v11 = [v10 valueForProperty:MPMediaItemPropertyAlbumTitle];

    v12 = -[BTAVRCP_VFSFolder initWithName:uid:]([BTAVRCP_AudiobookItemsFolder alloc], "initWithName:uid:", v11, [v9 unsignedLongLongValue]);
    *a4 = v12;
    v13 = +[MPMediaPropertyPredicate predicateWithValue:v9 forProperty:MPMediaItemPropertyAlbumPersistentID];
    [(BTAVRCP_VFSFolder *)v12 storePredicate:v13];

    unsigned __int8 v14 = 4;
  }
  else
  {
    unsigned __int8 v14 = 9;
  }

  return v14;
}

- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4
{
  v6 = [(BTAVRCP_VFSFolder *)self query];
  v7 = [v6 collectionAtIndex:a3];

  if (v7)
  {
    v8 = [v7 representativeItem];
    v9 = [v8 valueForProperty:MPMediaItemPropertyAlbumPersistentID];
    v10 = [v7 representativeItem];
    v11 = [v10 valueForProperty:MPMediaItemPropertyAlbumTitle];
    v12 = [(BTAVRCP_VFSFolder *)self replyFolderWithType:1 uid:v9 name:v11];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4
{
  v5 = [(BTAVRCP_VFSFolder *)self query];
  v6 = [v5 collectionWithUid:a3 property:MPMediaItemPropertyAlbumPersistentID];

  if (v6) {
    return &__NSDictionary0__struct;
  }
  else {
    return 0;
  }
}

- (unsigned)playItemWithUid:(unint64_t)a3
{
  id v4 = [(BTAVRCP_VFSFolder *)self query];
  v5 = [v4 collectionWithUid:a3 property:MPMediaItemPropertyAlbumPersistentID];

  if (v5) {
    return 12;
  }
  else {
    return 9;
  }
}

@end