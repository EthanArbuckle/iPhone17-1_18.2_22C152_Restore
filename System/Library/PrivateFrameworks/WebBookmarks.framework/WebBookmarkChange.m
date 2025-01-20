@interface WebBookmarkChange
+ (BOOL)supportsSecureCoding;
+ (id)bookmarkAddChangeWithBookmark:(id)a3;
+ (id)bookmarkModifyChangeWithBookmark:(id)a3;
+ (id)deleteChangeWithBookmark:(id)a3;
+ (id)moveChangeWithBookmark:(id)a3 toFolderWithID:(int)a4;
+ (id)reorderChangeWithBookmark:(id)a3 afterBookmark:(id)a4;
+ (id)replaceChangeWithBookmarks:(id)a3 inFolderWithID:(int)a4;
+ (id)replaceChangeWithBookmarks:(id)a3 inFolderWithSpecialID:(int)a4;
- (BOOL)attributesMarkedAsModify:(unint64_t)a3;
- (BOOL)shouldSync;
- (NSArray)bookmarks;
- (NSDictionary)dictionaryRepresentation;
- (NSString)description;
- (WebBookmark)bookmark;
- (WebBookmarkChange)initWithBookmark:(id)a3 bookmarkID:(int)a4 parentID:(int)a5 associatedBookmarkID:(int)a6 changeType:(int64_t)a7;
- (WebBookmarkChange)initWithBookmark:(id)a3 bookmarkID:(int)a4 parentID:(int)a5 changeType:(int64_t)a6;
- (WebBookmarkChange)initWithBookmarkID:(int)a3 parentID:(int)a4 associatedBookmarkID:(int)a5 changeType:(int64_t)a6;
- (WebBookmarkChange)initWithBookmarkID:(int)a3 parentID:(int)a4 changeType:(int64_t)a5;
- (WebBookmarkChange)initWithBookmarks:(id)a3 parentID:(int)a4 changeType:(int64_t)a5;
- (WebBookmarkChange)initWithBookmarks:(id)a3 parentID:(int)a4 specialFolderID:(int)a5 changeType:(int64_t)a6;
- (WebBookmarkChange)initWithBookmarks:(id)a3 specialFolderID:(int)a4 changeType:(int64_t)a5;
- (WebBookmarkChange)initWithCoder:(id)a3;
- (WebBookmarkChange)initWithDictionaryRepresentation:(id)a3;
- (id)_stringForType:(int64_t)a3;
- (int)associatedBookmarkID;
- (int)bookmarkID;
- (int)parentID;
- (int)specialFolderID;
- (int64_t)changeType;
- (unint64_t)modifiedAttributes;
- (void)_setModifiedAttributesIfSupported;
- (void)applyModificationsToBookmark:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAssociatedBookmarkID:(int)a3;
- (void)setBookmarkID:(int)a3;
- (void)setBookmarks:(id)a3;
- (void)setModifiedAttributes:(unint64_t)a3;
- (void)setParentID:(int)a3;
- (void)setSpecialFolderID:(int)a3;
- (void)updateChangeAfterUpdatingInMemoryID:(int)a3 withDatabaseID:(int)a4;
@end

@implementation WebBookmarkChange

+ (id)bookmarkAddChangeWithBookmark:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithBookmark:bookmarkID:parentID:changeType:", v4, objc_msgSend(v4, "identifier"), objc_msgSend(v4, "parentID"), 2);

  return v5;
}

+ (id)bookmarkModifyChangeWithBookmark:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithBookmark:bookmarkID:parentID:changeType:", v4, objc_msgSend(v4, "identifier"), objc_msgSend(v4, "parentID"), 3);

  return v5;
}

+ (id)deleteChangeWithBookmark:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithBookmark:bookmarkID:parentID:changeType:", v4, objc_msgSend(v4, "identifier"), objc_msgSend(v4, "parentID"), 0);

  return v5;
}

+ (id)moveChangeWithBookmark:(id)a3 toFolderWithID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)a1), "initWithBookmark:bookmarkID:parentID:associatedBookmarkID:changeType:", v6, objc_msgSend(v6, "identifier"), objc_msgSend(v6, "parentID"), v4, 4);

  return v7;
}

+ (id)reorderChangeWithBookmark:(id)a3 afterBookmark:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc((Class)a1);
  uint64_t v9 = [v6 identifier];
  uint64_t v10 = [v6 parentID];
  if (v7) {
    uint64_t v11 = [v7 identifier];
  }
  else {
    uint64_t v11 = 0x7FFFFFFFLL;
  }
  v12 = (void *)[v8 initWithBookmark:v6 bookmarkID:v9 parentID:v10 associatedBookmarkID:v11 changeType:5];

  return v12;
}

+ (id)replaceChangeWithBookmarks:(id)a3 inFolderWithID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)a1) initWithBookmarks:v6 parentID:v4 changeType:6];

  return v7;
}

+ (id)replaceChangeWithBookmarks:(id)a3 inFolderWithSpecialID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)a1) initWithBookmarks:v6 specialFolderID:v4 changeType:6];

  return v7;
}

- (WebBookmarkChange)initWithBookmarks:(id)a3 parentID:(int)a4 changeType:(int64_t)a5
{
  return [(WebBookmarkChange *)self initWithBookmarks:a3 parentID:*(void *)&a4 specialFolderID:0 changeType:a5];
}

- (WebBookmarkChange)initWithBookmarks:(id)a3 specialFolderID:(int)a4 changeType:(int64_t)a5
{
  return [(WebBookmarkChange *)self initWithBookmarks:a3 parentID:0 specialFolderID:*(void *)&a4 changeType:a5];
}

- (WebBookmarkChange)initWithBookmarks:(id)a3 parentID:(int)a4 specialFolderID:(int)a5 changeType:(int64_t)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v10 = a3;
  v25.receiver = self;
  v25.super_class = (Class)WebBookmarkChange;
  uint64_t v11 = [(WebBookmarkChange *)&v25 init];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    bookmarks = v11->_bookmarks;
    v11->_bookmarks = (NSArray *)v12;

    v11->_parentID = a4;
    v11->_specialFolderID = a5;
    v11->_changeType = a6;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v14 = v11->_bookmarks;
    uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v18++), "_setUsedForInMemoryChangeTracking:", 0, (void)v21);
        }
        while (v16 != v18);
        uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v16);
    }

    v19 = v11;
  }

  return v11;
}

- (WebBookmarkChange)initWithBookmarkID:(int)a3 parentID:(int)a4 changeType:(int64_t)a5
{
  return [(WebBookmarkChange *)self initWithBookmark:0 bookmarkID:*(void *)&a3 parentID:*(void *)&a4 associatedBookmarkID:0x7FFFFFFFLL changeType:a5];
}

- (WebBookmarkChange)initWithBookmarkID:(int)a3 parentID:(int)a4 associatedBookmarkID:(int)a5 changeType:(int64_t)a6
{
  return [(WebBookmarkChange *)self initWithBookmark:0 bookmarkID:*(void *)&a3 parentID:*(void *)&a4 associatedBookmarkID:*(void *)&a5 changeType:a6];
}

- (WebBookmarkChange)initWithBookmark:(id)a3 bookmarkID:(int)a4 parentID:(int)a5 changeType:(int64_t)a6
{
  return [(WebBookmarkChange *)self initWithBookmark:a3 bookmarkID:*(void *)&a4 parentID:*(void *)&a5 associatedBookmarkID:0x7FFFFFFFLL changeType:a6];
}

- (WebBookmarkChange)initWithBookmark:(id)a3 bookmarkID:(int)a4 parentID:(int)a5 associatedBookmarkID:(int)a6 changeType:(int64_t)a7
{
  id v12 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WebBookmarkChange;
  v13 = [(WebBookmarkChange *)&v19 init];
  v14 = v13;
  if (v13)
  {
    v13->_bookmarkID = a4;
    v13->_parentID = a5;
    v13->_associatedBookmarkID = a6;
    v13->_changeType = a7;
    uint64_t v15 = [v12 copy];
    bookmark = v14->_bookmark;
    v14->_bookmark = (WebBookmark *)v15;

    [(WebBookmark *)v14->_bookmark _setUsedForInMemoryChangeTracking:a7 == 3];
    [(WebBookmarkChange *)v14 _setModifiedAttributesIfSupported];
    uint64_t v17 = v14;
  }

  return v14;
}

- (WebBookmarkChange)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)WebBookmarkChange;
  v5 = [(WebBookmarkChange *)&v23 init];
  if (!v5) {
    goto LABEL_15;
  }
  char v22 = 0;
  id v6 = objc_msgSend(v4, "wb_numberForKey:isValid:", @"BookmarkID", &v22);
  v5->_bookmarkID = [v6 intValue];

  if (!v22) {
    goto LABEL_15;
  }
  id v7 = objc_msgSend(v4, "wb_numberForKey:isValid:", @"ParentID", &v22);
  v5->_parentID = [v7 intValue];

  if (!v22) {
    goto LABEL_15;
  }
  id v8 = objc_msgSend(v4, "wb_numberForKey:isValid:", @"AssociatedBookmarkID", &v22);
  v5->_associatedBookmarkID = [v8 intValue];

  if (!v22) {
    goto LABEL_15;
  }
  uint64_t v9 = objc_msgSend(v4, "wb_numberForKey:isValid:", @"SpecialFolderID", &v22);
  v5->_specialFolderID = [v9 intValue];

  if (!v22) {
    goto LABEL_15;
  }
  id v10 = objc_msgSend(v4, "wb_numberForKey:isValid:", @"Type", &v22);
  v5->_changeType = [v10 integerValue];

  if (v22)
  {
    uint64_t v11 = objc_msgSend(v4, "wb_dictionaryForKey:isValid:", @"AssociatedBookmark", &v22);
    id v12 = (void *)v11;
    if (!v22) {
      goto LABEL_17;
    }
    if (v11)
    {
      v13 = [[WebBookmark alloc] initWithDictionaryRepresentationForInMemoryChangeTracking:v11];
      bookmark = v5->_bookmark;
      v5->_bookmark = v13;

      if (!v5->_bookmark) {
        goto LABEL_17;
      }
    }
    uint64_t v15 = objc_msgSend(v4, "wb_numberForKey:isValid:", @"ModifiedAttributes", &v22);
    v5->_modifiedAttributes = [v15 integerValue];

    if (v22)
    {
      uint64_t v16 = objc_msgSend(v4, "wb_arrayForKey:isValid:", @"Bookmarks", &v22);
      uint64_t v17 = v16;
      if (v22)
      {
        if (v16)
        {
          uint64_t v18 = objc_msgSend(v16, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_6);
          bookmarks = v5->_bookmarks;
          v5->_bookmarks = (NSArray *)v18;
        }
        v20 = v5;
      }
      else
      {
        v20 = 0;
      }
    }
    else
    {
LABEL_17:
      v20 = 0;
    }
  }
  else
  {
LABEL_15:
    v20 = 0;
  }

  return v20;
}

WebBookmark *__54__WebBookmarkChange_initWithDictionaryRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[WebBookmark alloc] initWithDictionaryRepresentationForInMemoryChangeTracking:v2];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t bookmarkID = self->_bookmarkID;
  id v6 = a3;
  [v6 encodeInt32:bookmarkID forKey:@"BookmarkID"];
  [v6 encodeInt32:self->_parentID forKey:@"ParentID"];
  [v6 encodeInt32:self->_associatedBookmarkID forKey:@"AssociatedBookmarkID"];
  [v6 encodeInt32:self->_specialFolderID forKey:@"SpecialFolderID"];
  [v6 encodeInteger:self->_changeType forKey:@"Type"];
  v5 = [(WebBookmark *)self->_bookmark dictionaryRepresentationForInMemoryChangeTracking];
  [v6 encodeObject:v5 forKey:@"AssociatedBookmark"];

  [v6 encodeInt64:self->_modifiedAttributes forKey:@"ModifiedAttributes"];
  [v6 encodeObject:self->_bookmarks forKey:@"Bookmarks"];
}

- (WebBookmarkChange)initWithCoder:(id)a3
{
  v24[7] = *MEMORY[0x263EF8340];
  id v3 = a3;
  unsigned int v21 = [v3 decodeInt32ForKey:@"BookmarkID"];
  unsigned int v20 = [v3 decodeInt32ForKey:@"ParentID"];
  unsigned int v19 = [v3 decodeInt32ForKey:@"AssociatedBookmarkID"];
  uint64_t v4 = [v3 decodeInt32ForKey:@"SpecialFolderID"];
  uint64_t v5 = [v3 decodeIntegerForKey:@"Type"];
  id v6 = [WebBookmark alloc];
  id v7 = (void *)MEMORY[0x263EFFA08];
  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  v24[2] = objc_opt_class();
  v24[3] = objc_opt_class();
  v24[4] = objc_opt_class();
  v24[5] = objc_opt_class();
  v24[6] = objc_opt_class();
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:7];
  uint64_t v9 = [v7 setWithArray:v8];
  id v10 = [v3 decodeObjectOfClasses:v9 forKey:@"AssociatedBookmark"];
  uint64_t v11 = [(WebBookmark *)v6 initWithDictionaryRepresentationForInMemoryChangeTracking:v10];

  uint64_t v12 = [v3 decodeInt64ForKey:@"ModifiedAttributes"];
  v13 = (void *)MEMORY[0x263EFFA08];
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  uint64_t v15 = [v13 setWithArray:v14];
  uint64_t v16 = [v3 decodeObjectOfClasses:v15 forKey:@"Bookmarks"];

  uint64_t v17 = [[WebBookmarkChange alloc] initWithBookmark:v11 bookmarkID:v21 parentID:v20 associatedBookmarkID:v19 changeType:v5];
  [(WebBookmarkChange *)v17 setSpecialFolderID:v4];
  [(WebBookmarkChange *)v17 setModifiedAttributes:v12];
  [(WebBookmarkChange *)v17 setBookmarks:v16];

  return v17;
}

- (void)applyModificationsToBookmark:(id)a3
{
  id v8 = a3;
  if ([(WebBookmarkChange *)self attributesMarkedAsModify:8])
  {
    int v4 = [v8 isReadingListItem];
    uint64_t v5 = [(WebBookmark *)self->_bookmark dateLastViewed];
    if (v4) {
      [v8 setReadingListDateLastViewed:v5];
    }
    else {
      [v8 setTabDateLastViewed:v5];
    }
  }
  if ([(WebBookmarkChange *)self attributesMarkedAsModify:1])
  {
    id v6 = [(WebBookmark *)self->_bookmark title];
    [v8 setTitle:v6];
  }
  if ([(WebBookmarkChange *)self attributesMarkedAsModify:2])
  {
    id v7 = [(WebBookmark *)self->_bookmark address];
    [v8 setAddress:v7];
  }
  if ([(WebBookmarkChange *)self attributesMarkedAsModify:512]) {
    objc_msgSend(v8, "setLastSelectedChildID:", -[WebBookmark lastSelectedChildID](self->_bookmark, "lastSelectedChildID"));
  }
}

- (NSDictionary)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  int v4 = [NSNumber numberWithInt:self->_bookmarkID];
  [v3 setObject:v4 forKeyedSubscript:@"BookmarkID"];

  uint64_t v5 = [NSNumber numberWithInt:self->_parentID];
  [v3 setObject:v5 forKeyedSubscript:@"ParentID"];

  id v6 = [NSNumber numberWithInt:self->_associatedBookmarkID];
  [v3 setObject:v6 forKeyedSubscript:@"AssociatedBookmarkID"];

  id v7 = [NSNumber numberWithInt:self->_specialFolderID];
  [v3 setObject:v7 forKeyedSubscript:@"SpecialFolderID"];

  id v8 = [NSNumber numberWithInteger:self->_changeType];
  [v3 setObject:v8 forKeyedSubscript:@"Type"];

  uint64_t v9 = [NSNumber numberWithUnsignedLongLong:self->_modifiedAttributes];
  [v3 setObject:v9 forKeyedSubscript:@"ModifiedAttributes"];

  bookmarks = self->_bookmarks;
  if (bookmarks)
  {
    uint64_t v11 = [(NSArray *)bookmarks valueForKey:@"dictionaryRepresentationForInMemoryChangeTracking"];
    [v3 setObject:v11 forKeyedSubscript:@"Bookmarks"];
  }
  bookmark = self->_bookmark;
  if (bookmark)
  {
    v13 = [(WebBookmark *)bookmark dictionaryRepresentationForInMemoryChangeTracking];
    [v3 setObject:v13 forKeyedSubscript:@"AssociatedBookmark"];
  }
  return (NSDictionary *)v3;
}

- (void)_setModifiedAttributesIfSupported
{
  if ([(WebBookmark *)self->_bookmark attributesMarkedAsModified:8]) {
    self->_modifiedAttributes |= 8uLL;
  }
  if ([(WebBookmark *)self->_bookmark attributesMarkedAsModified:1]) {
    self->_modifiedAttributes |= 1uLL;
  }
  if ([(WebBookmark *)self->_bookmark attributesMarkedAsModified:2]) {
    self->_modifiedAttributes |= 2uLL;
  }
  if ([(WebBookmark *)self->_bookmark attributesMarkedAsModified:512]) {
    self->_modifiedAttributes |= 0x200uLL;
  }
}

- (BOOL)attributesMarkedAsModify:(unint64_t)a3
{
  return (a3 & ~self->_modifiedAttributes) == 0;
}

- (BOOL)shouldSync
{
  if ([(WebBookmark *)self->_bookmark identifier] == 0x7FFFFFFF) {
    return 0;
  }
  bookmark = self->_bookmark;
  return [(WebBookmark *)bookmark isSyncable];
}

- (void)updateChangeAfterUpdatingInMemoryID:(int)a3 withDatabaseID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (self->_parentID == a3)
  {
    self->_parentID = a4;
    bookmark = self->_bookmark;
    [(WebBookmark *)bookmark _setParentID:*(void *)&a4];
  }
  else if (self->_associatedBookmarkID == a3)
  {
    self->_associatedBookmarkID = a4;
  }
  else if ([(WebBookmark *)self->_bookmark lastSelectedChildID] == a3)
  {
    id v7 = self->_bookmark;
    [(WebBookmark *)v7 setLastSelectedChildID:v4];
  }
}

- (id)_stringForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 4) {
    return @"Delete";
  }
  else {
    return off_2643DA090[a3 - 2];
  }
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(WebBookmarkChange *)self _stringForType:self->_changeType];
  uint64_t bookmarkID = self->_bookmarkID;
  uint64_t v7 = [(WebBookmark *)self->_bookmark title];
  id v8 = (void *)v7;
  uint64_t specialFolderID = self->_specialFolderID;
  if (!specialFolderID) {
    uint64_t specialFolderID = self->_parentID;
  }
  LODWORD(v10) = self->_associatedBookmarkID;
  if (v10 == 0x7FFFFFFF) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = v10;
  }
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; type = %@; bookmark = %d %@; parent = %d; associated bookmark = %d;>",
    v4,
    self,
    v5,
    bookmarkID,
    v7,
    specialFolderID,
  uint64_t v11 = v10);

  return (NSString *)v11;
}

- (int)bookmarkID
{
  return self->_bookmarkID;
}

- (void)setBookmarkID:(int)a3
{
  self->_uint64_t bookmarkID = a3;
}

- (int)parentID
{
  return self->_parentID;
}

- (void)setParentID:(int)a3
{
  self->_parentID = a3;
}

- (int)associatedBookmarkID
{
  return self->_associatedBookmarkID;
}

- (void)setAssociatedBookmarkID:(int)a3
{
  self->_associatedBookmarkID = a3;
}

- (int)specialFolderID
{
  return self->_specialFolderID;
}

- (void)setSpecialFolderID:(int)a3
{
  self->_uint64_t specialFolderID = a3;
}

- (int64_t)changeType
{
  return self->_changeType;
}

- (WebBookmark)bookmark
{
  return self->_bookmark;
}

- (unint64_t)modifiedAttributes
{
  return self->_modifiedAttributes;
}

- (void)setModifiedAttributes:(unint64_t)a3
{
  self->_modifiedAttributes = a3;
}

- (NSArray)bookmarks
{
  return self->_bookmarks;
}

- (void)setBookmarks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmarks, 0);
  objc_storeStrong((id *)&self->_bookmark, 0);
}

@end