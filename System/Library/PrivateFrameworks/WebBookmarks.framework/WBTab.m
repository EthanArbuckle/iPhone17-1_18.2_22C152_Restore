@interface WBTab
+ (BOOL)supportsSecureCoding;
+ (id)pinnedTabWithTitle:(id)a3 url:(id)a4 deviceIdentifier:(id)a5;
+ (id)startPageTabWithDeviceIdentifier:(id)a3;
- (BOOL)_isMutable;
- (BOOL)canCloseAutomaticallyForInterval:(double)a3;
- (BOOL)canSetPinned;
- (BOOL)hasSameUUIDAndURLAsTab:(id)a3;
- (BOOL)isBlank;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIdentical:(id)a3;
- (BOOL)isInUnnamedTabGroup;
- (BOOL)isInserted;
- (BOOL)isMarkedAsRead;
- (BOOL)isPinned;
- (BOOL)isPrivateBrowsing;
- (BOOL)isShared;
- (BOOL)isShowingReader;
- (BOOL)isSyncable;
- (BOOL)matchedLastSearch;
- (BOOL)wasAdded;
- (BOOL)wasModified;
- (BOOL)wasMoved;
- (NSArray)URLStringComponents;
- (NSArray)titleWords;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)readerScrollPositionDictionary;
- (NSString)URLString;
- (NSString)URLStringForLastSearch;
- (NSString)debugSyncDescription;
- (NSString)description;
- (NSString)deviceIdentifier;
- (NSString)lastSearchTerm;
- (NSString)pinnedTitle;
- (NSString)privacyPreservingDescription;
- (NSString)tabGroupUUID;
- (NSString)title;
- (NSString)titleForLastSearch;
- (NSString)uuid;
- (NSURL)pinnedURL;
- (NSURL)syncableURL;
- (NSURL)url;
- (WBLocalTabAttributes)localAttributes;
- (WBSCRDTPosition)syncPosition;
- (WBTab)initWithBookmark:(id)a3;
- (WBTab)initWithBookmark:(id)a3 isPrivateBrowsing:(BOOL)a4;
- (WBTab)initWithBookmarkStorage:(id)a3;
- (WBTab)initWithCoder:(id)a3;
- (WBTab)initWithDictionaryRepresentation:(id)a3;
- (WBTab)initWithTitle:(id)a3 url:(id)a4 deviceIdentifier:(id)a5;
- (WBTab)initWithUUID:(id)a3 deviceIdentifier:(id)a4;
- (WBTab)initWithUUID:(id)a3 deviceIdentifier:(id)a4 lastVisitTime:(id)a5;
- (WBTab)initWithUUID:(id)a3 title:(id)a4 url:(id)a5 deviceIdentifier:(id)a6;
- (WBTab)initWithUUID:(id)a3 title:(id)a4 url:(id)a5 deviceIdentifier:(id)a6 isPrivateBrowsing:(BOOL)a7;
- (WBTab)initWithUUID:(id)a3 title:(id)a4 url:(id)a5 deviceIdentifier:(id)a6 lastVisitTime:(id)a7;
- (WBTab)initWithUUID:(id)a3 title:(id)a4 url:(id)a5 pinned:(BOOL)a6 pinnedTitle:(id)a7 pinnedURL:(id)a8 localAttributes:(id)a9 deviceIdentifier:(id)a10;
- (WebBookmark)bookmark;
- (double)lastViewedTime;
- (id)_addressFromURL:(id)a3;
- (id)_determineURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)duplicate;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)mutableDuplicate;
- (int)identifier;
- (int)orderIndex;
- (int)parentIdentifier;
- (unint64_t)hash;
- (void)_setLocalURLString:(id)a3;
- (void)_updateBookmarkWithURL:(id)a3 shouldSync:(BOOL)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setBookmark:(id)a3;
- (void)setLastSearchTerm:(id)a3;
- (void)setMatchedLastSearch:(BOOL)a3;
- (void)setTitleForLastSearch:(id)a3;
- (void)setTitleWords:(id)a3;
- (void)setURLStringComponents:(id)a3;
- (void)setURLStringForLastSearch:(id)a3;
@end

@implementation WBTab

- (BOOL)canSetPinned
{
  return 1;
}

- (NSString)tabGroupUUID
{
  return self->_tabGroupUUID;
}

- (BOOL)isPrivateBrowsing
{
  return self->_privateBrowsing;
}

- (NSString)title
{
  v3 = [(WBSCopyOnWriteValue *)self->_bookmarkStorage value];
  v4 = [v3 extraAttributes];
  v5 = [v4 objectForKeyedSubscript:@"LocalTitle"];

  if ([v5 length])
  {
    id v6 = v5;
  }
  else
  {
    v7 = [(WBSCopyOnWriteValue *)self->_bookmarkStorage value];
    id v6 = [v7 title];
  }
  return (NSString *)v6;
}

- (NSString)uuid
{
  v2 = [(WBSCopyOnWriteValue *)self->_bookmarkStorage value];
  v3 = [v2 UUID];

  return (NSString *)v3;
}

- (WebBookmark)bookmark
{
  [(WBSCopyOnWriteValue *)self->_bookmarkStorage willModify];
  bookmarkStorage = self->_bookmarkStorage;
  return (WebBookmark *)[(WBSCopyOnWriteValue *)bookmarkStorage value];
}

- (int)identifier
{
  v2 = [(WBSCopyOnWriteValue *)self->_bookmarkStorage value];
  int v3 = [v2 identifier];

  return v3;
}

- (WBTab)initWithUUID:(id)a3 title:(id)a4 url:(id)a5 deviceIdentifier:(id)a6 isPrivateBrowsing:(BOOL)a7
{
  result = [(WBTab *)self initWithUUID:a3 title:a4 url:a5 deviceIdentifier:a6];
  result->_privateBrowsing = a7;
  return result;
}

- (WBTab)initWithUUID:(id)a3 title:(id)a4 url:(id)a5 deviceIdentifier:(id)a6
{
  return [(WBTab *)self initWithUUID:a3 title:a4 url:a5 deviceIdentifier:a6 lastVisitTime:0];
}

- (WBTab)initWithUUID:(id)a3 title:(id)a4 url:(id)a5 deviceIdentifier:(id)a6 lastVisitTime:(id)a7
{
  id v12 = a3;
  v13 = (__CFString *)a4;
  id v14 = a5;
  id v15 = a7;
  if (v13) {
    v16 = v13;
  }
  else {
    v16 = &stru_26CC2ED50;
  }
  v17 = v16;
  id v18 = a6;
  v19 = [[WebBookmark alloc] initWithTitle:v17 address:&stru_26CC2ED50 parentID:0 deviceIdentifier:v18 collectionType:1];

  if (v12) {
    [(WebBookmark *)v19 _setUUID:v12];
  }
  if (v15)
  {
    [(WebBookmark *)v19 setLocalAttributesValue:v15 forKey:*MEMORY[0x263F66858]];
    [(WebBookmark *)v19 setTabDateLastViewed:v15];
  }
  v20 = [(WBTab *)self initWithBookmark:v19];
  v21 = v20;
  if (v20)
  {
    [(WBTab *)v20 _updateBookmarkWithURL:v14 shouldSync:0];
    [(WBTab *)v21 _updateBookmarkWithURL:v14 shouldSync:1];
    v21->_modified = 0;
    [(WebBookmark *)v19 setModifiedAttributes:0];
    v22 = v21;
  }

  return v21;
}

- (void)_updateBookmarkWithURL:(id)a3 shouldSync:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v16 = v6;
  if (v4)
  {
    v7 = [(WBTab *)self _addressFromURL:v6];
    v8 = [(WBSCopyOnWriteValue *)self->_bookmarkStorage value];
    v9 = [v8 address];
    char v10 = [v7 isEqualToString:v9];

    if ((v10 & 1) == 0)
    {
      id cachedURL = self->_cachedURL;
      self->_id cachedURL = 0;

      self->_modified = 1;
      [(WBSCopyOnWriteValue *)self->_bookmarkStorage willModify];
      id v12 = [(WBTab *)self _addressFromURL:v16];
      v13 = [(WBSCopyOnWriteValue *)self->_bookmarkStorage value];
      [v13 setAddress:v12];
    }
  }
  else
  {
    uint64_t v14 = [v6 absoluteString];
    v7 = (void *)v14;
    if (v14) {
      id v15 = (__CFString *)v14;
    }
    else {
      id v15 = &stru_26CC2ED50;
    }
    [(WBTab *)self _setLocalURLString:v15];
  }
}

- (void)_setLocalURLString:(id)a3
{
  id v10 = a3;
  BOOL v4 = [(WBSCopyOnWriteValue *)self->_bookmarkStorage value];
  v5 = [v4 extraAttributes];
  id v6 = [v5 objectForKeyedSubscript:@"LocalURL"];
  char v7 = [v10 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    id cachedURL = self->_cachedURL;
    self->_id cachedURL = 0;

    self->_modified = 1;
    [(WBSCopyOnWriteValue *)self->_bookmarkStorage willModify];
    v9 = [(WBSCopyOnWriteValue *)self->_bookmarkStorage value];
    [v9 setExtraAttributesValue:v10 forKey:@"LocalURL"];
  }
}

- (id)_addressFromURL:(id)a3
{
  id v3 = a3;
  if (objc_msgSend(v3, "safari_isHTTPFamilyURL"))
  {
    BOOL v4 = [v3 absoluteString];
  }
  else
  {
    BOOL v4 = &stru_26CC2ED50;
  }

  return v4;
}

- (BOOL)isPinned
{
  v2 = [(WBSCopyOnWriteValue *)self->_bookmarkStorage value];
  char v3 = [v2 isPinned];

  return v3;
}

- (BOOL)isBlank
{
  v2 = [(WBTab *)self url];
  BOOL v3 = v2 == 0;

  return v3;
}

- (NSURL)url
{
  p_id cachedURL = &self->_cachedURL;
  id v4 = self->_cachedURL;
  if (!v4)
  {
    v5 = [(WBTab *)self _determineURL];
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [MEMORY[0x263EFF9D0] null];
    }
    id v4 = v7;

    objc_storeStrong(p_cachedURL, v4);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v8 = 0;
  }
  else {
    v8 = v4;
  }
  v9 = v8;

  return v9;
}

- (id)_determineURL
{
  BOOL v3 = [(WBSCopyOnWriteValue *)self->_bookmarkStorage value];
  id v4 = [v3 extraAttributes];
  v5 = [v4 objectForKeyedSubscript:@"LocalURL"];

  if ([v5 length])
  {
    id v6 = [NSURL URLWithString:v5];
  }
  else
  {
    id v7 = [(WBSCopyOnWriteValue *)self->_bookmarkStorage value];
    v8 = [v7 address];

    v9 = [NSURL URLWithString:v8];
    if ([v8 length] && objc_msgSend(v9, "safari_isHTTPFamilyURL")) {
      id v6 = v9;
    }
    else {
      id v6 = 0;
    }
  }
  return v6;
}

- (BOOL)wasAdded
{
  return self->_added;
}

- (BOOL)isSyncable
{
  v2 = [(WBSCopyOnWriteValue *)self->_bookmarkStorage value];
  char v3 = [v2 isSyncable];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (self->_isMutable)
  {
    id v4 = +[WBTab allocWithZone:](WBTab, "allocWithZone:");
    v5 = (void *)[(WBSCopyOnWriteValue *)self->_bookmarkStorage copyWithZone:a3];
    uint64_t v6 = [(WBTab *)v4 initWithBookmarkStorage:v5];

    uint64_t v7 = [(NSString *)self->_tabGroupUUID copy];
    v8 = *(void **)(v6 + 16);
    *(void *)(v6 + 16) = v7;

    *(unsigned char *)(v6 + 24) = self->_added;
    *(unsigned char *)(v6 + 26) = self->_moved;
    *(unsigned char *)(v6 + 25) = self->_modified;
    *(unsigned char *)(v6 + 27) = self->_inUnnamedTabGroup;
    *(unsigned char *)(v6 + 28) = self->_privateBrowsing;
    *(unsigned char *)(v6 + 29) = self->_shared;
    return (id)v6;
  }
  else
  {
    return self;
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v5 = [WBMutableTab alloc];
  uint64_t v6 = (void *)[(WBSCopyOnWriteValue *)self->_bookmarkStorage copyWithZone:a3];
  uint64_t v7 = [(WBTab *)v5 initWithBookmarkStorage:v6];

  [(WBMutableTab *)v7 setTabGroupUUID:self->_tabGroupUUID];
  [(WBMutableTab *)v7 setAdded:self->_added];
  [(WBMutableTab *)v7 setMoved:self->_moved];
  [(WBMutableTab *)v7 setModified:self->_modified];
  [(WBMutableTab *)v7 setInUnnamedTabGroup:self->_inUnnamedTabGroup];
  [(WBMutableTab *)v7 setPrivateBrowsing:self->_privateBrowsing];
  [(WBMutableTab *)v7 setShared:self->_shared];
  return v7;
}

- (WBTab)initWithBookmark:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F66280];
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithValue:v5];

  uint64_t v7 = [(WBTab *)self initWithBookmarkStorage:v6];
  return v7;
}

- (WBTab)initWithBookmarkStorage:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WBTab;
  uint64_t v6 = [(WBTab *)&v13 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bookmarkStorage, a3);
    objc_opt_class();
    v7->_isMutable = objc_opt_isKindOfClass() & 1;
    v8 = [(WBTab *)v7 uuid];
    if (!v8
      || (v9 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v8], v9, !v9))
    {
      id v10 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[WBTab initWithBookmarkStorage:](v10, v7);
      }
    }
    v11 = v7;
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSearchTerm, 0);
  objc_storeStrong((id *)&self->_URLStringComponents, 0);
  objc_storeStrong((id *)&self->_URLStringForLastSearch, 0);
  objc_storeStrong((id *)&self->_titleWords, 0);
  objc_storeStrong((id *)&self->_titleForLastSearch, 0);
  objc_storeStrong(&self->_cachedURL, 0);
  objc_storeStrong((id *)&self->_tabGroupUUID, 0);
  objc_storeStrong((id *)&self->_bookmarkStorage, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WBTab *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(WBTab *)self uuid];
      uint64_t v7 = [(WBTab *)v5 uuid];

      char v8 = WBSIsEqual();
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

+ (id)startPageTabWithDeviceIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  uint64_t v6 = _WBSLocalizedString();
  uint64_t v7 = (void *)[v5 initWithTitle:v6 url:0 deviceIdentifier:v4];

  return v7;
}

+ (id)pinnedTabWithTitle:(id)a3 url:(id)a4 deviceIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithUUID:0 title:v10 url:v9 pinned:1 pinnedTitle:v10 pinnedURL:v9 localAttributes:0 deviceIdentifier:v8];

  return v11;
}

- (WBTab)initWithUUID:(id)a3 deviceIdentifier:(id)a4
{
  return [(WBTab *)self initWithUUID:a3 title:0 url:0 deviceIdentifier:a4];
}

- (WBTab)initWithUUID:(id)a3 deviceIdentifier:(id)a4 lastVisitTime:(id)a5
{
  return [(WBTab *)self initWithUUID:a3 title:0 url:0 deviceIdentifier:a4 lastVisitTime:a5];
}

- (WBTab)initWithTitle:(id)a3 url:(id)a4 deviceIdentifier:(id)a5
{
  return [(WBTab *)self initWithUUID:0 title:a3 url:a4 deviceIdentifier:a5];
}

- (WBTab)initWithUUID:(id)a3 title:(id)a4 url:(id)a5 pinned:(BOOL)a6 pinnedTitle:(id)a7 pinnedURL:(id)a8 localAttributes:(id)a9 deviceIdentifier:(id)a10
{
  BOOL v11 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  v19 = [(WBTab *)self initWithUUID:a3 title:a4 url:a5 deviceIdentifier:a10];
  v20 = v19;
  if (v19)
  {
    v21 = [(WBSCopyOnWriteValue *)v19->_bookmarkStorage value];
    v22 = [v17 absoluteString];
    [v21 setPinned:v11 title:v16 address:v22];

    v23 = [v18 dictionaryRepresentation];
    [v21 setLocalAttributes:v23];

    [v21 setNeedsSyncUpdate:0];
    [v21 setModifiedAttributes:0];
    v24 = v20;
  }
  return v20;
}

- (WBTab)initWithBookmark:(id)a3 isPrivateBrowsing:(BOOL)a4
{
  id v5 = [(WBTab *)self initWithBookmark:a3];
  uint64_t v6 = v5;
  if (v5)
  {
    v5->_privateBrowsing = a4;
    uint64_t v7 = v5;
  }

  return v6;
}

- (unint64_t)hash
{
  v2 = [(WBTab *)self uuid];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBTab)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bookmark"];
  uint64_t v6 = [(WBTab *)self initWithBookmark:v5];
  if (v6)
  {
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tabGroupUUID"];
    tabGroupUUID = v6->_tabGroupUUID;
    v6->_tabGroupUUID = (NSString *)v7;

    v6->_privateBrowsing = [v4 decodeBoolForKey:@"privateBrowsing"];
    v6->_inUnnamedTabGroup = [v4 decodeBoolForKey:@"local"];
    v6->_shared = [v4 decodeBoolForKey:@"shared"];
    id v9 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  bookmarkStorage = self->_bookmarkStorage;
  id v6 = a3;
  id v5 = [(WBSCopyOnWriteValue *)bookmarkStorage value];
  [v6 encodeObject:v5 forKey:@"bookmark"];

  [v6 encodeObject:self->_tabGroupUUID forKey:@"tabGroupUUID"];
  [v6 encodeBool:self->_privateBrowsing forKey:@"privateBrowsing"];
  [v6 encodeBool:self->_inUnnamedTabGroup forKey:@"local"];
  [v6 encodeBool:self->_shared forKey:@"shared"];
}

- (WBTab)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = [WebBookmark alloc];
  id v6 = objc_msgSend(v4, "safari_dictionaryForKey:", @"bookmark");
  uint64_t v7 = [(WebBookmark *)v5 initWithDictionaryRepresentationForInMemoryChangeTracking:v6];

  if ([(WebBookmark *)v7 isFolder]
    || (self = [(WBTab *)self initWithBookmark:v7]) == 0)
  {
    id v10 = 0;
  }
  else
  {
    objc_msgSend(v4, "safari_stringForKey:", @"tabGroupUUID");
    id v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    tabGroupUUID = self->_tabGroupUUID;
    self->_tabGroupUUID = v8;

    self->_privateBrowsing = objc_msgSend(v4, "safari_BOOLForKey:", @"privateBrowsing");
    self->_inUnnamedTabGroup = objc_msgSend(v4, "safari_BOOLForKey:", @"local");
    self->_shared = objc_msgSend(v4, "safari_BOOLForKey:", @"shared");
    self = self;
    id v10 = self;
  }

  return v10;
}

- (NSDictionary)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [(WBSCopyOnWriteValue *)self->_bookmarkStorage value];
  id v5 = [v4 dictionaryRepresentationForInMemoryChangeTracking];
  [v3 setObject:v5 forKeyedSubscript:@"bookmark"];

  [v3 setObject:self->_tabGroupUUID forKeyedSubscript:@"tabGroupUUID"];
  id v6 = [NSNumber numberWithBool:self->_privateBrowsing];
  [v3 setObject:v6 forKeyedSubscript:@"privateBrowsing"];

  uint64_t v7 = [NSNumber numberWithBool:self->_inUnnamedTabGroup];
  [v3 setObject:v7 forKeyedSubscript:@"local"];

  id v8 = [NSNumber numberWithBool:self->_shared];
  [v3 setObject:v8 forKeyedSubscript:@"shared"];

  return (NSDictionary *)v3;
}

- (BOOL)hasSameUUIDAndURLAsTab:(id)a3
{
  id v4 = a3;
  id v5 = [v4 uuidString];
  id v6 = [(WBTab *)self uuidString];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    id v8 = [v4 url];
    id v9 = [(WBTab *)self url];
    char v10 = [v8 isEqual:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)isShowingReader
{
  return 0;
}

- (NSDictionary)readerScrollPositionDictionary
{
  return 0;
}

- (double)lastViewedTime
{
  v2 = [(WBSCopyOnWriteValue *)self->_bookmarkStorage value];
  unint64_t v3 = [v2 dateLastViewed];
  [v3 timeIntervalSinceReferenceDate];
  double v5 = v4;

  return v5;
}

- (void)setBookmark:(id)a3
{
  double v4 = (objc_class *)MEMORY[0x263F66280];
  id v5 = a3;
  id v6 = (WBSCopyOnWriteValue *)[[v4 alloc] initWithValue:v5];

  bookmarkStorage = self->_bookmarkStorage;
  self->_bookmarkStorage = v6;
}

- (NSString)URLString
{
  v2 = [(WBTab *)self url];
  unint64_t v3 = [v2 absoluteString];

  return (NSString *)v3;
}

- (NSString)deviceIdentifier
{
  v2 = [(WBSCopyOnWriteValue *)self->_bookmarkStorage value];
  unint64_t v3 = [v2 deviceIdentifier];

  return (NSString *)v3;
}

- (int)parentIdentifier
{
  v2 = [(WBSCopyOnWriteValue *)self->_bookmarkStorage value];
  int v3 = [v2 parentID];

  return v3;
}

- (WBLocalTabAttributes)localAttributes
{
  int v3 = [WBLocalTabAttributes alloc];
  double v4 = [(WBSCopyOnWriteValue *)self->_bookmarkStorage value];
  id v5 = [v4 localAttributes];
  id v6 = [(WBLocalTabAttributes *)v3 initWithDictionaryRepresentation:v5];

  return v6;
}

- (NSURL)syncableURL
{
  v2 = NSURL;
  int v3 = [(WBSCopyOnWriteValue *)self->_bookmarkStorage value];
  double v4 = [v3 address];
  id v5 = [v2 URLWithString:v4];

  return (NSURL *)v5;
}

- (BOOL)isMarkedAsRead
{
  v2 = [(WBSCopyOnWriteValue *)self->_bookmarkStorage value];
  char v3 = [v2 isMarkedAsRead];

  return v3;
}

- (WBSCRDTPosition)syncPosition
{
  v2 = [(WBSCopyOnWriteValue *)self->_bookmarkStorage value];
  char v3 = [v2 syncPosition];

  return (WBSCRDTPosition *)v3;
}

- (int)orderIndex
{
  v2 = [(WBSCopyOnWriteValue *)self->_bookmarkStorage value];
  int v3 = [v2 orderIndex];

  return v3;
}

- (BOOL)isInserted
{
  v2 = [(WBSCopyOnWriteValue *)self->_bookmarkStorage value];
  char v3 = [v2 isInserted];

  return v3;
}

- (NSString)pinnedTitle
{
  v2 = [(WBSCopyOnWriteValue *)self->_bookmarkStorage value];
  char v3 = [v2 pinnedTitle];

  return (NSString *)v3;
}

- (NSURL)pinnedURL
{
  v2 = [(WBSCopyOnWriteValue *)self->_bookmarkStorage value];
  char v3 = [v2 pinnedAddress];

  if (v3)
  {
    double v4 = [NSURL URLWithString:v3];
  }
  else
  {
    double v4 = 0;
  }

  return (NSURL *)v4;
}

- (BOOL)isIdentical:(id)a3
{
  double v4 = (id *)a3;
  if (!WBSIsEqual()) {
    goto LABEL_6;
  }
  int v5 = [(WBTab *)self isPinned];
  if (v5 != [v4 isPinned]) {
    goto LABEL_6;
  }
  id v6 = [(WBTab *)self title];
  int v7 = [v4 title];
  int v8 = WBSIsEqual();

  if (!v8) {
    goto LABEL_6;
  }
  id v9 = [(WBSCopyOnWriteValue *)self->_bookmarkStorage value];
  char v10 = [v9 extraAttributes];
  BOOL v11 = [v10 objectForKeyedSubscript:@"LocalURL"];
  id v12 = [v4[1] value];
  objc_super v13 = [v12 extraAttributes];
  uint64_t v14 = [v13 objectForKeyedSubscript:@"LocalURL"];
  int v15 = WBSIsEqual();

  if (v15)
  {
    id v16 = [(WBSCopyOnWriteValue *)self->_bookmarkStorage value];
    id v17 = [v16 address];
    id v18 = [v4[1] value];
    v19 = [v18 address];
    char v20 = WBSIsEqual();
  }
  else
  {
LABEL_6:
    char v20 = 0;
  }

  return v20;
}

- (id)duplicate
{
  char v3 = [WBMutableTab alloc];
  double v4 = [(WBTab *)self deviceIdentifier];
  int v5 = [(WBTab *)v3 initWithUUID:0 deviceIdentifier:v4];

  [(WBMutableTab *)v5 adoptAttributesFromTab:self];
  id v6 = (void *)[(WBMutableTab *)v5 copy];

  return v6;
}

- (id)mutableDuplicate
{
  char v3 = [WBMutableTab alloc];
  double v4 = [(WBTab *)self deviceIdentifier];
  int v5 = [(WBTab *)v3 initWithUUID:0 deviceIdentifier:v4];

  [(WBMutableTab *)v5 adoptAttributesFromTab:self];
  return v5;
}

- (NSString)description
{
  char v3 = NSString;
  double v4 = (objc_class *)objc_opt_class();
  int v5 = NSStringFromClass(v4);
  id v6 = [(WBTab *)self tabGroupUUID];
  int v7 = [(WBTab *)self title];
  int v8 = [(WBTab *)self url];
  id v9 = [(WBTab *)self uuid];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; tabGroupUUID = %@; title = %@; url = %@; uuid = %@>",
    v5,
    self,
    v6,
    v7,
    v8,
  char v10 = v9);

  return (NSString *)v10;
}

- (NSString)privacyPreservingDescription
{
  char v3 = NSString;
  double v4 = (objc_class *)objc_opt_class();
  int v5 = NSStringFromClass(v4);
  id v6 = [(WBTab *)self uuid];
  int v7 = [v3 stringWithFormat:@"<%@: %p uuid = %@>", v5, self, v6];;

  return (NSString *)v7;
}

- (NSString)debugSyncDescription
{
  char v3 = (void *)MEMORY[0x263F089D8];
  double v4 = [(WBTab *)self title];
  int v5 = [(WBTab *)self uuid];
  id v6 = [v3 stringWithFormat:@"%@, UUID: %@", v4, v5];

  int v7 = [(WBSCopyOnWriteValue *)self->_bookmarkStorage value];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __29__WBTab_debugSyncDescription__block_invoke;
  v11[3] = &unk_2643DA6F8;
  id v12 = v6;
  id v8 = v6;
  [v7 getReadOnlyCachedBookmarkSyncDataUsingBlock:v11];

  id v9 = (void *)[v8 copy];
  return (NSString *)v9;
}

void __29__WBTab_debugSyncDescription__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v5 = [a2 record];
  char v3 = [v5 recordID];
  double v4 = [v3 ckShortDescription];
  [v2 appendFormat:@", recordID: %@", v4];
}

- (BOOL)canCloseAutomaticallyForInterval:(double)a3
{
  if ([(WBTab *)self isSyncable])
  {
    id v5 = WBS_LOG_CHANNEL_PREFIXTabs();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      __int16 v23 = 0;
      id v6 = "Not automatically closable because the tab is syncable.";
      int v7 = (uint8_t *)&v23;
LABEL_19:
      _os_log_impl(&dword_21C043000, v5, OS_LOG_TYPE_INFO, v6, v7, 2u);
      return 0;
    }
    return 0;
  }
  if ([(WBTab *)self isPinned])
  {
    id v5 = WBS_LOG_CHANNEL_PREFIXTabs();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      __int16 v22 = 0;
      id v6 = "Not automatically closable because tab is pinned.";
      int v7 = (uint8_t *)&v22;
      goto LABEL_19;
    }
    return 0;
  }
  id v8 = [(WBTab *)self localAttributes];
  id v9 = [v8 lastVisitTime];

  if (!v9)
  {
    id v5 = WBS_LOG_CHANNEL_PREFIXTabs();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      __int16 v21 = 0;
      id v6 = "Not automatically closable because lastViewedTime is unknown.";
      int v7 = (uint8_t *)&v21;
      goto LABEL_19;
    }
    return 0;
  }
  if ([(WBTab *)self isBlank])
  {
    char v10 = WBS_LOG_CHANNEL_PREFIXTabs();
    BOOL v11 = 1;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C043000, v10, OS_LOG_TYPE_INFO, "Tab is automatically closable because it is blank.", buf, 2u);
    }
  }
  else
  {
    id v12 = [(WBTab *)self localAttributes];
    objc_super v13 = [v12 lastVisitTime];
    [v13 timeIntervalSinceNow];
    double v15 = -v14;

    id v16 = WBS_LOG_CHANNEL_PREFIXTabs();
    id v5 = v16;
    if (v15 <= a3)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        __int16 v18 = 0;
        id v6 = "Not automatically closable because its lastVisitTime does not cross threshold.";
        int v7 = (uint8_t *)&v18;
        goto LABEL_19;
      }
      return 0;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_21C043000, v5, OS_LOG_TYPE_DEFAULT, "Tab is automatically closable because lastVisitTime is beyond threshold from user preference.", v19, 2u);
    }
    return 1;
  }
  return v11;
}

- (NSString)titleForLastSearch
{
  return self->_titleForLastSearch;
}

- (void)setTitleForLastSearch:(id)a3
{
}

- (NSArray)titleWords
{
  return self->_titleWords;
}

- (void)setTitleWords:(id)a3
{
}

- (NSString)URLStringForLastSearch
{
  return self->_URLStringForLastSearch;
}

- (void)setURLStringForLastSearch:(id)a3
{
}

- (NSArray)URLStringComponents
{
  return self->_URLStringComponents;
}

- (void)setURLStringComponents:(id)a3
{
}

- (NSString)lastSearchTerm
{
  return self->_lastSearchTerm;
}

- (void)setLastSearchTerm:(id)a3
{
}

- (BOOL)matchedLastSearch
{
  return self->_matchedLastSearch;
}

- (void)setMatchedLastSearch:(BOOL)a3
{
  self->_matchedLastSearch = a3;
}

- (BOOL)isInUnnamedTabGroup
{
  return self->_inUnnamedTabGroup;
}

- (BOOL)isShared
{
  return self->_shared;
}

- (BOOL)wasModified
{
  return self->_modified;
}

- (BOOL)wasMoved
{
  return self->_moved;
}

- (BOOL)_isMutable
{
  return self->_isMutable;
}

- (void)initWithBookmarkStorage:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  char v3 = a1;
  double v4 = [a2 privacyPreservingDescription];
  int v5 = 138543362;
  id v6 = v4;
  _os_log_fault_impl(&dword_21C043000, v3, OS_LOG_TYPE_FAULT, "WBTabGroup must have a valid UUID %{public}@", (uint8_t *)&v5, 0xCu);
}

@end