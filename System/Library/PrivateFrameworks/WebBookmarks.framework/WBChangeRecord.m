@interface WBChangeRecord
- (WBChangeRecord)initWithBookmarkCollection:(id)a3 bookmark:(id)a4 changeType:(int)a5 localRecordGeneration:(int64_t)a6;
- (WebBookmark)bookmark;
- (WebBookmarkCollection)collection;
- (id)_changeTypeDescription;
- (id)_changedAttributeDescription;
- (id)description;
- (int)changeType;
- (int64_t)localRecordGeneration;
@end

@implementation WBChangeRecord

- (WBChangeRecord)initWithBookmarkCollection:(id)a3 bookmark:(id)a4 changeType:(int)a5 localRecordGeneration:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WBChangeRecord;
  v13 = [(WBChangeRecord *)&v17 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_collection, a3);
    objc_storeStrong((id *)&v14->_bookmark, a4);
    v14->_changeType = a5;
    v14->_localRecordGeneration = a6;
    v15 = v14;
  }

  return v14;
}

- (id)_changeTypeDescription
{
  int changeType = self->_changeType;
  if (changeType == 2) {
    return @"Delete";
  }
  if (changeType == 1)
  {
    v3 = @"Modify (isMove: YES)";
    if (![(WebBookmark *)self->_bookmark attributesMarkedAsModified:64]
      && ![(WebBookmark *)self->_bookmark attributesMarkedAsModified:4])
    {
      return @"Modify (isMove: NO)";
    }
  }
  else if (changeType)
  {
    return 0;
  }
  else
  {
    return @"Add";
  }
  return v3;
}

- (id)_changedAttributeDescription
{
  v3 = [MEMORY[0x263EFF980] array];
  if ([(WebBookmark *)self->_bookmark attributesMarkedAsModified:1]) {
    [v3 addObject:@"Title"];
  }
  if ([(WebBookmark *)self->_bookmark attributesMarkedAsModified:32]) {
    [v3 addObject:@"IsSelectedFavoritesFolder"];
  }
  if ([(WebBookmark *)self->_bookmark attributesMarkedAsModified:16]) {
    [v3 addObject:@"DateAdded"];
  }
  if ([(WebBookmark *)self->_bookmark attributesMarkedAsModified:8]) {
    [v3 addObject:@"DateLastViewed"];
  }
  if ([(WebBookmark *)self->_bookmark attributesMarkedAsModified:128]) {
    [v3 addObject:@"ImageURL"];
  }
  if ([(WebBookmark *)self->_bookmark attributesMarkedAsModified:256]) {
    [v3 addObject:@"PreviewText"];
  }
  if ([(WebBookmark *)self->_bookmark attributesMarkedAsModified:2]) {
    [v3 addObject:@"URL"];
  }
  if ([(WebBookmark *)self->_bookmark attributesMarkedAsModified:512]) {
    [v3 addObject:@"LastSelectedTab"];
  }
  if ([(WebBookmark *)self->_bookmark attributesMarkedAsModified:4096]) {
    [v3 addObject:@"SymbolImageName"];
  }
  if ([(WebBookmark *)self->_bookmark attributesMarkedAsModified:0x40000]) {
    [v3 addObject:@"CustomFavoritesFolderServerID"];
  }
  if ([(WebBookmark *)self->_bookmark attributesMarkedAsModified:0x2000]) {
    [v3 addObject:@"BackgroundImage"];
  }
  if ([(WebBookmark *)self->_bookmark attributesMarkedAsModified:0x10000]) {
    [v3 addObject:@"IsPinned"];
  }
  if ([(WebBookmark *)self->_bookmark attributesMarkedAsModified:0x200000]) {
    [v3 addObject:@"ShowIconOnly"];
  }
  if ([v3 count])
  {
    v4 = [v3 componentsJoinedByString:@", "];
  }
  else
  {
    v4 = &stru_26CC2ED50;
  }

  return v4;
}

- (id)description
{
  BOOL v3 = [(WebBookmark *)self->_bookmark isFolder];
  v4 = @"Leaf";
  if (v3) {
    v4 = @"Folder";
  }
  v5 = v4;
  v6 = [(WBChangeRecord *)self _changedAttributeDescription];
  if ([v6 length])
  {
    uint64_t v7 = [NSString stringWithFormat:@", Changed Attributes: %@", v6];

    v6 = (void *)v7;
  }
  v8 = NSString;
  v9 = [(WBChangeRecord *)self _changeTypeDescription];
  uint64_t v10 = [(WebBookmark *)self->_bookmark identifier];
  id v11 = [(WebBookmark *)self->_bookmark serverID];
  id v12 = objc_msgSend(v11, "wb_stringByRedactingBookmarkDAVServerID");
  v13 = [v8 stringWithFormat:@"<BAChangeRecord: %p, Type: %@, Bookmark Type: %@, Bookmark ID: %d, Bookmark Sync Server ID: %@%@>", self, v9, v5, v10, v12, v6];

  return v13;
}

- (WebBookmarkCollection)collection
{
  return self->_collection;
}

- (WebBookmark)bookmark
{
  return self->_bookmark;
}

- (int)changeType
{
  return self->_changeType;
}

- (int64_t)localRecordGeneration
{
  return self->_localRecordGeneration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmark, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

@end