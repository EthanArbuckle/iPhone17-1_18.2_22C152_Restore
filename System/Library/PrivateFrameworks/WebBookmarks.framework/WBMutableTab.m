@interface WBMutableTab
- (NSString)localTitle;
- (NSString)syncableTitle;
- (NSURL)localURL;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_setPropertiesFromTabGroup:(id)a3;
- (void)adoptAttributesFromTab:(id)a3;
- (void)didInsertIntoTabGroup:(id)a3;
- (void)didRemoveFromTabGroup;
- (void)markAsRead;
- (void)markClean;
- (void)mergeWithTab:(id)a3;
- (void)setAdded:(BOOL)a3;
- (void)setInUnnamedTabGroup:(BOOL)a3;
- (void)setLocalAttributes:(id)a3;
- (void)setLocalTitle:(id)a3;
- (void)setLocalURL:(id)a3;
- (void)setModified:(BOOL)a3;
- (void)setMoved:(BOOL)a3;
- (void)setOrderIndex:(int)a3;
- (void)setPinned:(BOOL)a3 title:(id)a4 url:(id)a5;
- (void)setPrivateBrowsing:(BOOL)a3;
- (void)setShared:(BOOL)a3;
- (void)setSyncPosition:(id)a3;
- (void)setSyncable:(BOOL)a3;
- (void)setSyncableTitle:(id)a3;
- (void)setSyncableURL:(id)a3;
- (void)setTabGroupUUID:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation WBMutableTab

- (void)setPinned:(BOOL)a3 title:(id)a4 url:(id)a5
{
  BOOL v6 = a3;
  id v18 = a4;
  id v8 = a5;
  v9 = [(WBSCopyOnWriteValue *)self->super._bookmarkStorage value];
  if ([v9 isPinned] != v6) {
    goto LABEL_6;
  }
  v10 = [(WBSCopyOnWriteValue *)self->super._bookmarkStorage value];
  v11 = [v10 pinnedTitle];
  if ((WBSIsEqual() & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  v12 = [v8 absoluteString];
  v13 = [(WBSCopyOnWriteValue *)self->super._bookmarkStorage value];
  v14 = [v13 pinnedAddress];
  char v17 = WBSIsEqual();

  if ((v17 & 1) == 0)
  {
LABEL_7:
    [(WBSCopyOnWriteValue *)self->super._bookmarkStorage willModify];
    v15 = [(WBSCopyOnWriteValue *)self->super._bookmarkStorage value];
    v16 = [v8 absoluteString];
    [v15 setPinned:v6 title:v18 address:v16];

    self->super._modified = 1;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WBMutableTab;
  v4 = [(WBTab *)&v8 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->super._tabGroupUUID copy];
  BOOL v6 = (void *)v4[2];
  v4[2] = v5;

  *((unsigned char *)v4 + 24) = self->super._added;
  *((unsigned char *)v4 + 26) = self->super._moved;
  *((unsigned char *)v4 + 25) = self->super._modified;
  *((unsigned char *)v4 + 27) = self->super._inUnnamedTabGroup;
  *((unsigned char *)v4 + 28) = self->super._privateBrowsing;
  *((unsigned char *)v4 + 29) = self->super._shared;
  return v4;
}

- (void)markClean
{
  self->super._added = 0;
  self->super._moved = 0;
  self->super._modified = 0;
}

- (void)didInsertIntoTabGroup:(id)a3
{
  id v4 = a3;
  [(WBMutableTab *)self setAdded:1];
  -[WBMutableTab setSyncable:](self, "setSyncable:", [v4 isSyncable]);
  [(WBMutableTab *)self _setPropertiesFromTabGroup:v4];
}

- (void)_setPropertiesFromTabGroup:(id)a3
{
  id v7 = a3;
  id v4 = [v7 uuid];
  tabGroupUUID = self->super._tabGroupUUID;
  self->super._tabGroupUUID = v4;

  self->super._privateBrowsing = [v7 isPrivateBrowsing];
  if ([v7 isLocal]) {
    char v6 = 1;
  }
  else {
    char v6 = [v7 isUnnamed];
  }
  self->super._inUnnamedTabGroup = v6;
  self->super._shared = [v7 isShared];
}

- (void)setAdded:(BOOL)a3
{
  self->super._added = a3;
}

- (void)setTabGroupUUID:(id)a3
{
  id v6 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    id v4 = (NSString *)[v6 copy];
    tabGroupUUID = self->super._tabGroupUUID;
    self->super._tabGroupUUID = v4;
  }
}

- (void)setSyncable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(WBSCopyOnWriteValue *)self->super._bookmarkStorage value];
  char v6 = [v5 isInserted];

  if ((v6 & 1) == 0)
  {
    [(WBSCopyOnWriteValue *)self->super._bookmarkStorage willModify];
    id v7 = [(WBSCopyOnWriteValue *)self->super._bookmarkStorage value];
    [v7 _setSyncable:v3];
  }
}

- (void)setShared:(BOOL)a3
{
  self->super._shared = a3;
}

- (void)setPrivateBrowsing:(BOOL)a3
{
  self->super._privateBrowsing = a3;
}

- (void)setMoved:(BOOL)a3
{
  self->super._moved = a3;
}

- (void)setModified:(BOOL)a3
{
  self->super._modified = a3;
}

- (void)setInUnnamedTabGroup:(BOOL)a3
{
  self->super._inUnnamedTabGroup = a3;
}

- (void)setUrl:(id)a3
{
  id v4 = a3;
  [(WBMutableTab *)self setLocalURL:v4];
  [(WBMutableTab *)self setSyncableURL:v4];
}

- (NSURL)localURL
{
  v2 = [(WBSCopyOnWriteValue *)self->super._bookmarkStorage value];
  BOOL v3 = [v2 extraAttributes];
  id v4 = [v3 objectForKeyedSubscript:@"LocalURL"];

  if ([v4 length])
  {
    uint64_t v5 = [NSURL URLWithString:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (NSURL *)v5;
}

- (void)setLocalURL:(id)a3
{
}

- (void)setSyncableURL:(id)a3
{
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  [(WBMutableTab *)self setLocalTitle:v4];
  [(WBMutableTab *)self setSyncableTitle:v4];
}

- (NSString)localTitle
{
  v2 = [(WBSCopyOnWriteValue *)self->super._bookmarkStorage value];
  BOOL v3 = [v2 extraAttributes];
  id v4 = [v3 objectForKeyedSubscript:@"LocalTitle"];

  return (NSString *)v4;
}

- (void)setLocalTitle:(id)a3
{
  id v7 = a3;
  id v4 = [(WBMutableTab *)self localTitle];
  char v5 = [v7 isEqualToString:v4];

  if ((v5 & 1) == 0)
  {
    self->super._modified = 1;
    [(WBSCopyOnWriteValue *)self->super._bookmarkStorage willModify];
    char v6 = [(WBSCopyOnWriteValue *)self->super._bookmarkStorage value];
    [v6 setExtraAttributesValue:v7 forKey:@"LocalTitle"];
  }
}

- (NSString)syncableTitle
{
  v2 = [(WBSCopyOnWriteValue *)self->super._bookmarkStorage value];
  BOOL v3 = [v2 title];

  return (NSString *)v3;
}

- (void)setSyncableTitle:(id)a3
{
  id v7 = a3;
  id v4 = [(WBMutableTab *)self syncableTitle];
  char v5 = [v7 isEqualToString:v4];

  if ((v5 & 1) == 0)
  {
    self->super._modified = 1;
    [(WBSCopyOnWriteValue *)self->super._bookmarkStorage willModify];
    char v6 = [(WBSCopyOnWriteValue *)self->super._bookmarkStorage value];
    [v6 setTitle:v7];
  }
}

- (void)setLocalAttributes:(id)a3
{
  id v18 = a3;
  char v5 = [v18 dictionaryRepresentation];
  char v6 = [(WBSCopyOnWriteValue *)self->super._bookmarkStorage value];
  id v7 = [v6 localAttributes];
  uint64_t v8 = WBSIsEqual();

  if ((v8 & 1) == 0)
  {
    self->super._modified = 1;
    [(WBSCopyOnWriteValue *)self->super._bookmarkStorage willModify];
    v9 = [v18 dictionaryRepresentation];
    v10 = [(WBSCopyOnWriteValue *)self->super._bookmarkStorage value];
    [v10 setLocalAttributes:v9];

    v11 = [v18 lastVisitTime];

    if (v11)
    {
      v12 = [(WBSCopyOnWriteValue *)self->super._bookmarkStorage value];
      v13 = [v12 dateLastViewed];
      uint64_t v14 = [v18 lastVisitTime];
      v15 = (void *)v14;
      if (v13)
      {
        uint64_t v8 = [(WBSCopyOnWriteValue *)self->super._bookmarkStorage value];
        BOOL v3 = [(id)v8 dateLastViewed];
        v16 = [v15 laterDate:v3];
      }
      else
      {
        v16 = (void *)v14;
      }
      char v17 = [(WBSCopyOnWriteValue *)self->super._bookmarkStorage value];
      [v17 setTabDateLastViewed:v16];

      if (v13)
      {
      }
    }
  }
}

- (void)setSyncPosition:(id)a3
{
  bookmarkStorage = self->super._bookmarkStorage;
  id v5 = a3;
  [(WBSCopyOnWriteValue *)bookmarkStorage willModify];
  id v6 = [(WBSCopyOnWriteValue *)self->super._bookmarkStorage value];
  [v6 setSyncPosition:v5];
}

- (void)setOrderIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(WBSCopyOnWriteValue *)self->super._bookmarkStorage willModify];
  id v5 = [(WBSCopyOnWriteValue *)self->super._bookmarkStorage value];
  [v5 _setOrderIndex:v3];
}

- (void)adoptAttributesFromTab:(id)a3
{
  id v4 = a3;
  id v5 = [v4 localAttributes];
  [(WBMutableTab *)self setLocalAttributes:v5];

  id v6 = [v4 title];
  [(WBMutableTab *)self setTitle:v6];

  id v7 = [v4 url];
  [(WBMutableTab *)self setUrl:v7];

  uint64_t v8 = [v4 isPinned];
  id v10 = [v4 pinnedTitle];
  v9 = [v4 pinnedURL];

  [(WBMutableTab *)self setPinned:v8 title:v10 url:v9];
}

- (void)didRemoveFromTabGroup
{
  [(WBMutableTab *)self setTabGroupUUID:0];
  [(WBMutableTab *)self setPrivateBrowsing:0];
  [(WBMutableTab *)self setInUnnamedTabGroup:0];
  [(WBMutableTab *)self setShared:0];
}

- (void)markAsRead
{
  [(WBSCopyOnWriteValue *)self->super._bookmarkStorage willModify];
  id v3 = [(WBSCopyOnWriteValue *)self->super._bookmarkStorage value];
  [v3 markAsRead];
}

- (void)mergeWithTab:(id)a3
{
  id v4 = (WBMutableTab *)a3;
  id v5 = [(WBTab *)v4 bookmark];
  id v6 = [v5 labelField];
  id v7 = [v6 generation];

  if (v7)
  {
    uint64_t v8 = [(WBSCopyOnWriteValue *)self->super._bookmarkStorage value];
    v9 = [v8 labelField];
    id v10 = [v9 generation];
    uint64_t v11 = [v10 compare:v7];

    v12 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
    if (v11 == -1)
    {
      if (v13)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21C043000, v12, OS_LOG_TYPE_INFO, "Adopting other tab's local title and URL", buf, 2u);
      }
      char v17 = [(WBMutableTab *)v4 localTitle];
      [(WBMutableTab *)self setLocalTitle:v17];

      v15 = [(WBMutableTab *)v4 localURL];
      v16 = self;
    }
    else
    {
      if (v13)
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_21C043000, v12, OS_LOG_TYPE_INFO, "Using tab's local title and URL", v20, 2u);
      }
      uint64_t v14 = [(WBMutableTab *)self localTitle];
      [(WBMutableTab *)v4 setLocalTitle:v14];

      v15 = [(WBMutableTab *)self localURL];
      v16 = v4;
    }
    [(WBMutableTab *)v16 setLocalURL:v15];
  }
  [(WBSCopyOnWriteValue *)self->super._bookmarkStorage willModify];
  id v18 = [(WBSCopyOnWriteValue *)self->super._bookmarkStorage value];
  v19 = [(WBTab *)v4 bookmark];
  [v18 mergeWithBookmark:v19];
}

@end