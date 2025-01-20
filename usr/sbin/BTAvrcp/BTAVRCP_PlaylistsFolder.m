@interface BTAVRCP_PlaylistsFolder
- (BOOL)isRecentlyAdded;
- (BOOL)playlistIsFolder:(id)a3;
- (BOOL)showRecentlyAddedFolder;
- (BTAVRCP_PlaylistsFolder)initWithName:(id)a3 uid:(unint64_t)a4;
- (BTAVRCP_PlaylistsFolder)initWithName:(id)a3 uid:(unint64_t)a4 parentPlaylistID:(id)a5 isRecentlyAdded:(BOOL)a6;
- (NSNumber)parentPlaylistID;
- (id)baseQuery;
- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4;
- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4;
- (unint64_t)childrenCount;
- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4;
- (unsigned)playItemWithUid:(unint64_t)a3;
@end

@implementation BTAVRCP_PlaylistsFolder

- (BTAVRCP_PlaylistsFolder)initWithName:(id)a3 uid:(unint64_t)a4
{
  return [(BTAVRCP_PlaylistsFolder *)self initWithName:a3 uid:a4 parentPlaylistID:&off_100019B08 isRecentlyAdded:0];
}

- (BTAVRCP_PlaylistsFolder)initWithName:(id)a3 uid:(unint64_t)a4 parentPlaylistID:(id)a5 isRecentlyAdded:(BOOL)a6
{
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BTAVRCP_PlaylistsFolder;
  v12 = [(BTAVRCP_VFSFolder *)&v15 initWithName:a3 uid:a4];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_parentPlaylistID, a5);
    v13->_isRecentlyAdded = a6;
  }

  return v13;
}

- (BOOL)showRecentlyAddedFolder
{
  if ([(BTAVRCP_PlaylistsFolder *)self isRecentlyAdded]) {
    return 0;
  }
  v4 = [(BTAVRCP_PlaylistsFolder *)self parentPlaylistID];
  if ([v4 isEqualToNumber:&off_100019B08])
  {
    v5 = [(BTAVRCP_VFSFolder *)self query];
    v6 = [v5 collections];
    BOOL v3 = (unint64_t)[v6 count] > 1;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)playlistIsFolder:(id)a3
{
  BOOL v3 = [a3 valueForProperty:MPMediaPlaylistPropertyIsFolder];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (id)baseQuery
{
  if ([(BTAVRCP_PlaylistsFolder *)self isRecentlyAdded])
  {
    BOOL v3 = +[MPMediaQuery playlistsRecentlyAddedQuery];
  }
  else
  {
    BOOL v3 = +[MPMediaQuery playlistsQuery];
    unsigned __int8 v4 = [(BTAVRCP_PlaylistsFolder *)self parentPlaylistID];
    v5 = +[MPMediaPropertyPredicate predicateWithValue:v4 forProperty:MPMediaPlaylistPropertyParentPersistentID];
    [v3 addFilterPredicate:v5];
  }

  return v3;
}

- (unint64_t)childrenCount
{
  BOOL v3 = [(BTAVRCP_VFSFolder *)self query];
  unsigned __int8 v4 = [v3 collections];
  id v5 = [v4 count];

  return (unint64_t)v5 + [(BTAVRCP_PlaylistsFolder *)self showRecentlyAddedFolder];
}

- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4
{
  if ([(BTAVRCP_VFSFolder *)self uid] == a3
    && [(BTAVRCP_PlaylistsFolder *)self showRecentlyAddedFolder])
  {
    v7 = [BTAVRCP_PlaylistsFolder alloc];
    v8 = [(BTAVRCP_VFSFolder *)self recentlyAddedFolderName];
    v9 = [(BTAVRCP_PlaylistsFolder *)self parentPlaylistID];
    *a4 = [(BTAVRCP_PlaylistsFolder *)v7 initWithName:v8 uid:a3 parentPlaylistID:v9 isRecentlyAdded:1];
LABEL_10:

    unsigned __int8 v12 = 4;
    goto LABEL_11;
  }
  v10 = [(BTAVRCP_VFSFolder *)self query];
  v8 = [v10 collectionWithUid:a3 property:MPMediaPlaylistPropertyPersistentID];

  if (v8)
  {
    v9 = [v8 valueForProperty:MPMediaPlaylistPropertyPersistentID];
    id v11 = [v8 valueForProperty:MPMediaPlaylistPropertyName];
    if ([(BTAVRCP_PlaylistsFolder *)self playlistIsFolder:v8])
    {
      *a4 = -[BTAVRCP_PlaylistsFolder initWithName:uid:parentPlaylistID:isRecentlyAdded:]([BTAVRCP_PlaylistsFolder alloc], "initWithName:uid:parentPlaylistID:isRecentlyAdded:", v11, [v9 unsignedLongLongValue], v9, 0);
    }
    else
    {
      v13 = -[BTAVRCP_VFSFolder initWithName:uid:]([BTAVRCP_PlaylistItemsFolder alloc], "initWithName:uid:", v11, [v9 unsignedLongLongValue]);
      *a4 = v13;
      v14 = +[MPMediaPropertyPredicate predicateWithValue:v9 forProperty:MPMediaPlaylistPropertyPersistentID];
      [(BTAVRCP_VFSFolder *)v13 storePredicate:v14];
    }
    goto LABEL_10;
  }
  unsigned __int8 v12 = 9;
LABEL_11:

  return v12;
}

- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4
{
  unint64_t v4 = a3;
  if ([(BTAVRCP_PlaylistsFolder *)self showRecentlyAddedFolder])
  {
    if (!v4)
    {
      v7 = +[NSNumber numberWithUnsignedLongLong:[(BTAVRCP_VFSFolder *)self uid]];
      v9 = [(BTAVRCP_VFSFolder *)self recentlyAddedFolderName];
      unsigned __int8 v12 = [(BTAVRCP_VFSFolder *)self replyFolderWithType:5 uid:v7 name:v9];
      goto LABEL_11;
    }
    --v4;
  }
  v6 = [(BTAVRCP_VFSFolder *)self query];
  v7 = [v6 collectionAtIndex:v4];

  if (!v7)
  {
    unsigned __int8 v12 = 0;
    goto LABEL_12;
  }
  unsigned int v8 = [(BTAVRCP_PlaylistsFolder *)self playlistIsFolder:v7];
  v9 = [v7 valueForProperty:MPMediaPlaylistPropertyPersistentID];
  v10 = [v7 valueForProperty:MPMediaPlaylistPropertyName];
  if (v8) {
    uint64_t v11 = 5;
  }
  else {
    uint64_t v11 = 1;
  }
  unsigned __int8 v12 = [(BTAVRCP_VFSFolder *)self replyFolderWithType:v11 uid:v9 name:v10];

LABEL_11:
LABEL_12:

  return v12;
}

- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4
{
  id v5 = [(BTAVRCP_VFSFolder *)self query];
  v6 = [v5 collectionWithUid:a3 property:MPMediaPlaylistPropertyPersistentID];

  if (v6) {
    return &__NSDictionary0__struct;
  }
  else {
    return 0;
  }
}

- (unsigned)playItemWithUid:(unint64_t)a3
{
  unint64_t v4 = [(BTAVRCP_VFSFolder *)self query];
  id v5 = [v4 collectionWithUid:a3 property:MPMediaPlaylistPropertyPersistentID];

  if (v5) {
    return 12;
  }
  else {
    return 9;
  }
}

- (NSNumber)parentPlaylistID
{
  return self->_parentPlaylistID;
}

- (BOOL)isRecentlyAdded
{
  return self->_isRecentlyAdded;
}

- (void).cxx_destruct
{
}

@end