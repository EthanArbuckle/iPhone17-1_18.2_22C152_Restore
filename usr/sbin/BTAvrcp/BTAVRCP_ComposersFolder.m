@interface BTAVRCP_ComposersFolder
- (BOOL)composerHasSingleAlbum:(id)a3;
- (BOOL)isRecentlyAdded;
- (BOOL)showRecentlyAddedFolder;
- (BTAVRCP_ComposersFolder)initWithName:(id)a3 uid:(unint64_t)a4;
- (BTAVRCP_ComposersFolder)initWithName:(id)a3 uid:(unint64_t)a4 isRecentlyAdded:(BOOL)a5;
- (id)baseQuery;
- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4;
- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4;
- (unint64_t)childrenCount;
- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4;
- (unsigned)playItemWithUid:(unint64_t)a3;
@end

@implementation BTAVRCP_ComposersFolder

- (BTAVRCP_ComposersFolder)initWithName:(id)a3 uid:(unint64_t)a4
{
  return [(BTAVRCP_ComposersFolder *)self initWithName:a3 uid:a4 isRecentlyAdded:0];
}

- (BTAVRCP_ComposersFolder)initWithName:(id)a3 uid:(unint64_t)a4 isRecentlyAdded:(BOOL)a5
{
  v7.receiver = self;
  v7.super_class = (Class)BTAVRCP_ComposersFolder;
  result = [(BTAVRCP_VFSFolder *)&v7 initWithName:a3 uid:a4];
  if (result) {
    result->_isRecentlyAdded = a5;
  }
  return result;
}

- (BOOL)showRecentlyAddedFolder
{
  if ([(BTAVRCP_ComposersFolder *)self isRecentlyAdded]) {
    return 0;
  }
  v4 = [(BTAVRCP_VFSFolder *)self query];
  v5 = [v4 collections];
  BOOL v3 = (unint64_t)[v5 count] > 1;

  return v3;
}

- (BOOL)composerHasSingleAlbum:(id)a3
{
  BOOL v3 = [a3 valueForProperty:MPMediaItemCollectionPropertyAlbumCount];
  BOOL v4 = (unint64_t)[v3 unsignedIntegerValue] < 2;

  return v4;
}

- (id)baseQuery
{
  BOOL v3 = +[MPMediaQuery composersQuery];
  if ([(BTAVRCP_ComposersFolder *)self isRecentlyAdded]) {
    [v3 setGroupingType:15];
  }

  return v3;
}

- (unint64_t)childrenCount
{
  BOOL v3 = [(BTAVRCP_VFSFolder *)self query];
  BOOL v4 = [v3 collections];
  id v5 = [v4 count];

  return (unint64_t)v5 + [(BTAVRCP_ComposersFolder *)self showRecentlyAddedFolder];
}

- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4
{
  if ([(BTAVRCP_VFSFolder *)self uid] == a3
    && [(BTAVRCP_ComposersFolder *)self showRecentlyAddedFolder])
  {
    objc_super v7 = [BTAVRCP_ComposersFolder alloc];
    v8 = [(BTAVRCP_VFSFolder *)self recentlyAddedFolderName];
    *a4 = [(BTAVRCP_ComposersFolder *)v7 initWithName:v8 uid:a3 isRecentlyAdded:1];
LABEL_10:
    unsigned __int8 v18 = 4;
    goto LABEL_11;
  }
  v9 = [(BTAVRCP_VFSFolder *)self query];
  v8 = [v9 collectionWithUid:a3 property:MPMediaItemPropertyComposerPersistentID];

  if (v8)
  {
    v10 = [v8 representativeItem];
    v11 = [v10 valueForProperty:MPMediaItemPropertyComposerPersistentID];

    v12 = [v8 representativeItem];
    v13 = [v12 valueForProperty:MPMediaItemPropertyComposer];

    if ([(BTAVRCP_ComposersFolder *)self composerHasSingleAlbum:v8])
    {
      v14 = -[BTAVRCP_VFSFolder initWithName:uid:]([BTAVRCP_AlbumItemsFolder alloc], "initWithName:uid:", v13, [v11 unsignedLongLongValue]);
      *a4 = v14;
      v15 = [v8 representativeItem];
      v16 = [v15 predicateForProperty:MPMediaItemPropertyAlbumPersistentID];
      [(BTAVRCP_VFSFolder *)v14 storePredicate:v16];

      v17 = (BTAVRCP_AlbumsFolder *)*a4;
    }
    else
    {
      v17 = -[BTAVRCP_AlbumsFolder initWithName:uid:]([BTAVRCP_AlbumsFolder alloc], "initWithName:uid:", v13, [v11 unsignedLongLongValue]);
      *a4 = v17;
    }
    v19 = +[MPMediaPropertyPredicate predicateWithValue:v11 forProperty:MPMediaItemPropertyComposerPersistentID];
    [(BTAVRCP_VFSFolder *)v17 storePredicate:v19];

    goto LABEL_10;
  }
  unsigned __int8 v18 = 9;
LABEL_11:

  return v18;
}

- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4
{
  unint64_t v4 = a3;
  if ([(BTAVRCP_ComposersFolder *)self showRecentlyAddedFolder])
  {
    if (!v4)
    {
      objc_super v7 = +[NSNumber numberWithUnsignedLongLong:[(BTAVRCP_VFSFolder *)self uid]];
      v9 = [(BTAVRCP_VFSFolder *)self recentlyAddedFolderName];
      v14 = [(BTAVRCP_VFSFolder *)self replyFolderWithType:3 uid:v7 name:v9];
      goto LABEL_11;
    }
    --v4;
  }
  v6 = [(BTAVRCP_VFSFolder *)self query];
  objc_super v7 = [v6 collectionAtIndex:v4];

  if (!v7)
  {
    v14 = 0;
    goto LABEL_12;
  }
  unsigned int v8 = [(BTAVRCP_ComposersFolder *)self composerHasSingleAlbum:v7];
  v9 = [v7 representativeItem];
  v10 = [v9 valueForProperty:MPMediaItemPropertyComposerPersistentID];
  v11 = [v7 representativeItem];
  v12 = [v11 valueForProperty:MPMediaItemPropertyComposer];
  if (v8) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = 2;
  }
  v14 = [(BTAVRCP_VFSFolder *)self replyFolderWithType:v13 uid:v10 name:v12];

LABEL_11:
LABEL_12:

  return v14;
}

- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4
{
  id v5 = [(BTAVRCP_VFSFolder *)self query];
  v6 = [v5 collectionWithUid:a3 property:MPMediaItemPropertyComposerPersistentID];

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
  id v5 = [v4 collectionWithUid:a3 property:MPMediaItemPropertyComposerPersistentID];

  if (v5) {
    return 12;
  }
  else {
    return 9;
  }
}

- (BOOL)isRecentlyAdded
{
  return self->_isRecentlyAdded;
}

@end