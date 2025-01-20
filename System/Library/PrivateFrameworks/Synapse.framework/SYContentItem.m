@interface SYContentItem
+ (NSArray)readableTypeIdentifiersForItemProvider;
+ (NSArray)writableTypeIdentifiersForItemProvider;
+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)representsSameContentAsItem:(id)a3;
- (NSData)linkPreviewMetadata;
- (NSString)activityPersistentIdentifier;
- (NSString)activityTargetContentIdentifier;
- (NSString)activityType;
- (NSString)description;
- (NSString)displayTitle;
- (NSString)sourceIdentifier;
- (NSString)sourceLastKnownName;
- (NSString)webpageDisplayDomain;
- (NSURL)activityCanonicalURL;
- (NSURL)itemURL;
- (NSUUID)itemIdentifier;
- (NSUserActivity)userActivity;
- (SYContentItem)initWithData:(id)a3 error:(id *)a4;
- (SYContentItem)initWithDisplayTitle:(id)a3 sourceIdentifier:(id)a4 sourceName:(id)a5 itemURL:(id)a6;
- (SYContentItem)initWithDisplayTitle:(id)a3 sourceIdentifier:(id)a4 sourceName:(id)a5 itemURL:(id)a6 identifier:(id)a7;
- (SYContentItem)initWithItemIdentifier:(id)a3 displayTitle:(id)a4 sourceIdentifier:(id)a5 sourceName:(id)a6 itemURL:(id)a7 activityType:(id)a8 activityCanonicalURL:(id)a9 activityTargetContentIdentifier:(id)a10 activityPersistentIdentifier:(id)a11 userActivity:(id)a12;
- (SYContentItem)initWithUserActivity:(id)a3 sourceAppID:(id)a4;
- (SYContentItem)initWithUserActivity:(id)a3 sourceAppID:(id)a4 sourceAppName:(id)a5;
- (SYContentItem)initWithUserActivity:(id)a3 sourceAppID:(id)a4 sourceAppName:(id)a5 identifier:(id)a6;
- (id)dataRepresentationWithError:(id *)a3;
- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4;
- (id)searchableItemLinkingRelatedIdentifier:(id)a3 domainIdentifier:(id)a4;
- (int64_t)previewLoadLevel;
- (unint64_t)hash;
- (void)loadFullPreviewIfNeeded;
- (void)loadFullPreviewIfNeededWithCompletion:(id)a3;
- (void)setLinkPreviewMetadata:(id)a3;
- (void)setLinkPreviewMetadata:(id)a3 loadLevel:(int64_t)a4;
- (void)setPreviewLoadLevel:(int64_t)a3;
@end

@implementation SYContentItem

- (SYContentItem)initWithItemIdentifier:(id)a3 displayTitle:(id)a4 sourceIdentifier:(id)a5 sourceName:(id)a6 itemURL:(id)a7 activityType:(id)a8 activityCanonicalURL:(id)a9 activityTargetContentIdentifier:(id)a10 activityPersistentIdentifier:(id)a11 userActivity:(id)a12
{
  id v17 = a3;
  id v52 = a4;
  id v18 = a5;
  id v51 = a6;
  unint64_t v19 = (unint64_t)a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  unint64_t v24 = (unint64_t)a12;
  v50 = v17;
  if (!v17)
  {
    v45 = [MEMORY[0x1E4F28B00] currentHandler];
    [v45 handleFailureInMethod:a2, self, @"SYContentItem.m", 39, @"Invalid parameter not satisfying: %@", @"itemID" object file lineNumber description];
  }
  if (!(v19 | v24))
  {
    v46 = [MEMORY[0x1E4F28B00] currentHandler];
    [v46 handleFailureInMethod:a2, self, @"SYContentItem.m", 40, @"Invalid parameter not satisfying: %@", @"userActivity || itemURL" object file lineNumber description];
  }
  v25 = v21;
  if (!v18)
  {
    v47 = [MEMORY[0x1E4F28B00] currentHandler];
    [v47 handleFailureInMethod:a2, self, @"SYContentItem.m", 41, @"Invalid parameter not satisfying: %@", @"sourceIdentifier" object file lineNumber description];
  }
  v54.receiver = self;
  v54.super_class = (Class)SYContentItem;
  v26 = [(SYContentItem *)&v54 init];
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_itemIdentifier, a3);
    uint64_t v28 = [v52 copy];
    displayTitle = v27->_displayTitle;
    v27->_displayTitle = (NSString *)v28;

    uint64_t v30 = [v18 copy];
    sourceIdentifier = v27->_sourceIdentifier;
    v27->_sourceIdentifier = (NSString *)v30;

    uint64_t v32 = [v51 copy];
    sourceLastKnownName = v27->_sourceLastKnownName;
    v27->_sourceLastKnownName = (NSString *)v32;

    uint64_t v34 = [(id)v19 copy];
    itemURL = v27->_itemURL;
    v27->_itemURL = (NSURL *)v34;

    uint64_t v36 = [v25 copy];
    activityCanonicalURL = v27->_activityCanonicalURL;
    v27->_activityCanonicalURL = (NSURL *)v36;

    uint64_t v38 = [v20 copy];
    activityType = v27->_activityType;
    v27->_activityType = (NSString *)v38;

    uint64_t v40 = [v22 copy];
    activityTargetContentIdentifier = v27->_activityTargetContentIdentifier;
    v27->_activityTargetContentIdentifier = (NSString *)v40;

    uint64_t v42 = [v23 copy];
    activityPersistentIdentifier = v27->_activityPersistentIdentifier;
    v27->_activityPersistentIdentifier = (NSString *)v42;

    objc_storeStrong((id *)&v27->_userActivity, a12);
  }

  return v27;
}

- (SYContentItem)initWithUserActivity:(id)a3 sourceAppID:(id)a4 sourceAppName:(id)a5 identifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v29 = a5;
  id v13 = a6;
  v14 = self;
  id v15 = v13;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"SYContentItem.m", 63, @"Invalid parameter not satisfying: %@", @"userActivity" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"SYContentItem.m", 64, @"Invalid parameter not satisfying: %@", @"appBundleID" object file lineNumber description];

LABEL_3:
  uint64_t v28 = v15;
  if (v15)
  {
    id v16 = v15;
  }
  else
  {
    id v16 = [MEMORY[0x1E4F29128] UUID];
  }
  id v17 = v16;
  id v18 = [v11 activityType];
  unint64_t v19 = [v11 targetContentIdentifier];
  id v20 = [v11 persistentIdentifier];
  id v21 = [v11 webpageURL];
  id v22 = [v11 canonicalURL];
  id v23 = [v11 title];
  unint64_t v24 = [(SYContentItem *)v14 initWithItemIdentifier:v17 displayTitle:v23 sourceIdentifier:v12 sourceName:v29 itemURL:v21 activityType:v18 activityCanonicalURL:v22 activityTargetContentIdentifier:v19 activityPersistentIdentifier:v20 userActivity:v11];

  return v24;
}

- (SYContentItem)initWithDisplayTitle:(id)a3 sourceIdentifier:(id)a4 sourceName:(id)a5 itemURL:(id)a6 identifier:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (v14)
  {
    if (v16) {
      goto LABEL_3;
    }
LABEL_6:
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"SYContentItem.m", 81, @"Invalid parameter not satisfying: %@", @"itemURL" object file lineNumber description];

    if (v17) {
      goto LABEL_4;
    }
LABEL_7:
    id v18 = [MEMORY[0x1E4F29128] UUID];
    goto LABEL_8;
  }
  unint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"SYContentItem.m", 80, @"Invalid parameter not satisfying: %@", @"sourceIdentifier" object file lineNumber description];

  if (!v16) {
    goto LABEL_6;
  }
LABEL_3:
  if (!v17) {
    goto LABEL_7;
  }
LABEL_4:
  id v18 = v17;
LABEL_8:
  id v21 = v18;
  id v22 = [(SYContentItem *)self initWithItemIdentifier:v18 displayTitle:v13 sourceIdentifier:v14 sourceName:v15 itemURL:v16 activityType:0 activityCanonicalURL:0 activityTargetContentIdentifier:0 activityPersistentIdentifier:0 userActivity:0];

  return v22;
}

- (SYContentItem)initWithUserActivity:(id)a3 sourceAppID:(id)a4
{
  return [(SYContentItem *)self initWithUserActivity:a3 sourceAppID:a4 sourceAppName:0 identifier:0];
}

- (SYContentItem)initWithUserActivity:(id)a3 sourceAppID:(id)a4 sourceAppName:(id)a5
{
  return [(SYContentItem *)self initWithUserActivity:a3 sourceAppID:a4 sourceAppName:a5 identifier:0];
}

- (SYContentItem)initWithDisplayTitle:(id)a3 sourceIdentifier:(id)a4 sourceName:(id)a5 itemURL:(id)a6
{
  return [(SYContentItem *)self initWithDisplayTitle:a3 sourceIdentifier:a4 sourceName:a5 itemURL:a6 identifier:0];
}

- (NSString)description
{
  v3 = [(SYContentItem *)self displayTitle];
  if (v3)
  {
    v4 = NSString;
    v5 = [(SYContentItem *)self displayTitle];
    id v21 = [v4 stringWithFormat:@"'%@'", v5];
  }
  else
  {
    id v21 = @"(null)";
  }

  v6 = [(SYContentItem *)self itemIdentifier];
  v7 = [v6 UUIDString];
  id v20 = objc_msgSend(v7, "substringWithRange:", 0, 8);

  v24.receiver = self;
  v24.super_class = (Class)SYContentItem;
  unint64_t v19 = [(SYContentItem *)&v24 description];
  id v23 = [(SYContentItem *)self sourceLastKnownName];
  id v22 = [(SYContentItem *)self sourceIdentifier];
  v8 = [(SYContentItem *)self itemURL];
  v9 = [(SYContentItem *)self activityCanonicalURL];
  v10 = [(SYContentItem *)self activityType];
  id v11 = [(SYContentItem *)self activityTargetContentIdentifier];
  id v12 = [(SYContentItem *)self activityPersistentIdentifier];
  id v13 = [(SYContentItem *)self userActivity];
  if (v13) {
    id v14 = @"Yes";
  }
  else {
    id v14 = @"No";
  }
  id v15 = [(SYContentItem *)self linkPreviewMetadata];
  if (v15) {
    id v16 = @"Yes";
  }
  else {
    id v16 = @"No";
  }
  id v18 = [v19 stringByAppendingFormat:@" itemID: %@…, title: %@, source: %@ (%@), itemURL: %@, canonicalURL: %@, activityType: %@, targetContentID: %@, persistentID: %@, hasUserActivity: %@, hasLinkPreview: %@", v20, v21, v23, v22, v8, v9, v10, v11, v12, v14, v16];

  return (NSString *)v18;
}

- (NSString)webpageDisplayDomain
{
  v3 = [(SYContentItem *)self itemURL];
  if (v3)
  {
    v4 = [(SYContentItem *)self userActivity];
    v5 = [v4 activityType];

    if (v5)
    {
      char v6 = [v5 isEqualToString:*MEMORY[0x1E4F28AC0]];

      if (v6)
      {
LABEL_4:
        v7 = objc_msgSend(v3, "_lp_highLevelDomain");
        goto LABEL_7;
      }
    }
    else if (objc_msgSend(v3, "_lp_isHTTPFamilyURL"))
    {
      goto LABEL_4;
    }
  }
  v7 = 0;
LABEL_7:

  return (NSString *)v7;
}

- (void)setLinkPreviewMetadata:(id)a3
{
}

- (NSData)linkPreviewMetadata
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_linkPreviewMetadata;
  objc_sync_exit(v2);

  return v3;
}

- (void)setLinkPreviewMetadata:(id)a3 loadLevel:(int64_t)a4
{
  char v6 = (NSData *)a3;
  obj = self;
  objc_sync_enter(obj);
  linkPreviewMetadata = obj->_linkPreviewMetadata;
  obj->_linkPreviewMetadata = v6;

  obj->_previewLoadLevel = a4;
  objc_sync_exit(obj);
}

- (void)loadFullPreviewIfNeeded
{
}

- (void)loadFullPreviewIfNeededWithCompletion:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(void))a3;
  if ((unint64_t)[(SYContentItem *)self previewLoadLevel] > 1)
  {
    if (v4) {
      v4[2](v4);
    }
  }
  else
  {
    v8[0] = self;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55__SYContentItem_loadFullPreviewIfNeededWithCompletion___block_invoke;
    v6[3] = &unk_1E6464530;
    v7 = v4;
    +[SYContentItemPreviewManager loadPreviewDataForItems:v5 fullDetail:1 didFinishLoadingPreviewHandler:v6];
  }
}

uint64_t __55__SYContentItem_loadFullPreviewIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)representsSameContentAsItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SYContentItem *)self userActivity];
  if (v5)
  {
    char v6 = (void *)v5;
    v7 = [v4 userActivity];

    if (v7)
    {
      v8 = [(SYContentItem *)self userActivity];
      v9 = [v4 userActivity];
      char v10 = SYEquivalentUserActivities(v8, v9);
LABEL_7:
      LOBYTE(v11) = v10;

      goto LABEL_8;
    }
  }
  id v11 = [(SYContentItem *)self itemURL];
  if (v11)
  {
    id v12 = [v4 itemURL];

    if (!v12)
    {
      LOBYTE(v11) = 0;
      goto LABEL_8;
    }
    v8 = [(SYContentItem *)self itemURL];
    v9 = [v4 itemURL];
    char v10 = SYEquivalentURLs(v8, v9);
    goto LABEL_7;
  }
LABEL_8:

  return (char)v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SYContentItem *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(SYContentItem *)v4 itemIdentifier];
      char v6 = [(SYContentItem *)self itemIdentifier];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(SYContentItem *)self itemIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (SYContentItem)initWithData:(id)a3 error:(id *)a4
{
  v60[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    v44 = [MEMORY[0x1E4F28B00] currentHandler];
    [v44 handleFailureInMethod:a2, self, @"SYContentItem.m", 244, @"Invalid parameter not satisfying: %@", @"serializedData" object file lineNumber description];
  }
  uint64_t v58 = 0;
  id v56 = 0;
  uint64_t v57 = 0;
  v8 = +[SYSerializationSupport itemDataFromArchiveData:v7 majorVersion:&v58 minorVersion:&v57 error:&v56];
  id v9 = v56;
  if (v8)
  {
    char v10 = [[SYPBContentItem alloc] initWithData:v8];
    if (v10)
    {
      id v11 = v10;
      v48 = a4;
      uint64_t v12 = [(SYPBContentItem *)v10 displayTitle];
      v53 = [(SYPBContentItem *)v11 sourceIdentifier];
      id v51 = [(SYPBContentItem *)v11 sourceLastKnownName];
      id v13 = [(SYPBContentItem *)v11 itemIdentifierData];
      uint64_t v14 = [v13 length];

      if (v14)
      {
        id v15 = (void *)MEMORY[0x1E4F28DC0];
        uint64_t v16 = objc_opt_class();
        id v17 = [(SYPBContentItem *)v11 itemIdentifierData];
        id v55 = 0;
        objc_super v54 = [v15 unarchivedObjectOfClass:v16 fromData:v17 error:&v55];
        id v52 = v55;
      }
      else
      {
        objc_super v54 = 0;
        id v52 = 0;
      }
      id v21 = [(SYPBContentItem *)v11 itemURL];
      uint64_t v22 = [v21 length];

      if (v22)
      {
        id v23 = (void *)MEMORY[0x1E4F1CB10];
        objc_super v24 = [(SYPBContentItem *)v11 itemURL];
        uint64_t v25 = [v23 URLWithString:v24];
      }
      else
      {
        uint64_t v25 = 0;
      }
      uint64_t v26 = [(SYPBContentItem *)v11 userActivityData];
      v27 = (void *)v26;
      if (v26)
      {
        uint64_t v28 = [objc_alloc(MEMORY[0x1E4F22488]) _initWithUserActivityData:v26];
        id v29 = [(id)v28 activityType];
        v50 = [(id)v28 canonicalURL];
        v49 = [(id)v28 targetContentIdentifier];
        uint64_t v26 = [(id)v28 persistentIdentifier];
      }
      else
      {
        uint64_t v28 = 0;
        id v29 = 0;
        v49 = 0;
        v50 = 0;
      }
      v46 = (void *)v26;
      v47 = (void *)v12;
      if (v54 && v53 && v25 | v28)
      {
        self = [(SYContentItem *)self initWithItemIdentifier:v54 displayTitle:v12 sourceIdentifier:v53 sourceName:v51 itemURL:v25 activityType:v29 activityCanonicalURL:v50 activityTargetContentIdentifier:v49 activityPersistentIdentifier:v26 userActivity:v28];
        uint64_t v30 = [(SYPBContentItem *)v11 linkPreviewMetadata];
        linkPreviewMetadata = self->_linkPreviewMetadata;
        self->_linkPreviewMetadata = v30;

        self->_previewLoadLevel = [(SYPBContentItem *)v11 previewLoadLevel];
        char v32 = 1;
      }
      else
      {
        v45 = self;
        v33 = v8;
        uint64_t v34 = v27;
        v35 = v29;
        uint64_t v36 = v25;
        id v37 = v7;
        uint64_t v38 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:@"Data for serialized item is incomplete or corrupted." forKey:*MEMORY[0x1E4F28568]];
        v39 = v38;
        if (v52) {
          [v38 setObject:v52 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
        }
        uint64_t v40 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.synapse" code:-121 userInfo:v39];

        char v32 = 0;
        id v9 = (id)v40;
        id v7 = v37;
        uint64_t v25 = v36;
        id v29 = v35;
        v27 = v34;
        v8 = v33;
        self = v45;
      }

      if (v32)
      {
        v41 = 0;
        a4 = v48;
        if (!v48) {
          goto LABEL_30;
        }
        goto LABEL_29;
      }
      a4 = v48;
    }
    else
    {
      id v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v59 = *MEMORY[0x1E4F28568];
      v60[0] = @"Failed to deserialize data for content item.";
      unint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:&v59 count:1];
      uint64_t v20 = [v18 errorWithDomain:@"com.apple.synapse" code:-120 userInfo:v19];

      id v9 = (id)v20;
    }
  }

  uint64_t v42 = os_log_create("com.apple.synapse", "ContentItemManager");
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
    -[SYContentItem initWithData:error:]((uint64_t)v9, v42);
  }

  self = 0;
  v41 = v9;
  if (a4) {
LABEL_29:
  }
    *a4 = v41;
LABEL_30:

  return self;
}

- (id)dataRepresentationWithError:(id *)a3
{
  id v5 = [(SYContentItem *)self userActivity];

  if (!v5)
  {
    id v7 = 0;
    goto LABEL_7;
  }
  char v6 = [(SYContentItem *)self userActivity];
  id v21 = 0;
  id v7 = [v6 _createUserActivityDataWithSaving:0 options:0 error:&v21];
  id v5 = v21;

  if (v7)
  {
LABEL_7:
    id v11 = (void *)MEMORY[0x1E4F28DB0];
    uint64_t v12 = [(SYContentItem *)self itemIdentifier];
    char v10 = [v11 archivedDataWithRootObject:v12 requiringSecureCoding:1 error:0];

    v8 = objc_alloc_init(SYPBContentItem);
    [(SYPBContentItem *)v8 setItemIdentifierData:v10];
    id v13 = [(SYContentItem *)self displayTitle];
    [(SYPBContentItem *)v8 setDisplayTitle:v13];

    uint64_t v14 = [(SYContentItem *)self sourceIdentifier];
    [(SYPBContentItem *)v8 setSourceIdentifier:v14];

    id v15 = [(SYContentItem *)self sourceLastKnownName];
    [(SYPBContentItem *)v8 setSourceLastKnownName:v15];

    uint64_t v16 = [(SYContentItem *)self itemURL];
    id v17 = [v16 absoluteString];
    [(SYPBContentItem *)v8 setItemURL:v17];

    [(SYPBContentItem *)v8 setUserActivityData:v7];
    id v18 = [(SYContentItem *)self linkPreviewMetadata];
    [(SYPBContentItem *)v8 setLinkPreviewMetadata:v18];

    [(SYPBContentItem *)v8 setPreviewLoadLevel:[(SYContentItem *)self previewLoadLevel]];
    unint64_t v19 = [(SYPBContentItem *)v8 data];
    id v9 = +[SYSerializationSupport archiveDataFromItemData:v19];

    goto LABEL_8;
  }
  v8 = os_log_create("com.apple.synapse", "ContentItemManager");
  if (os_log_type_enabled(&v8->super.super, OS_LOG_TYPE_ERROR)) {
    [(SYContentItem *)self dataRepresentationWithError:&v8->super.super];
  }
  id v7 = 0;
  id v9 = 0;
  char v10 = v8;
LABEL_8:

  if (a3) {
    *a3 = v5;
  }

  return v9;
}

- (id)searchableItemLinkingRelatedIdentifier:(id)a3 domainIdentifier:(id)a4
{
  return +[SYItemIndexingManager searchableItemLinkingContentItem:self toContainerIdentifier:a3 uniqueIdentifier:0 relatedIdentifier:a3 domainIdentifier:a4];
}

- (NSUUID)itemIdentifier
{
  return self->_itemIdentifier;
}

- (NSString)displayTitle
{
  return self->_displayTitle;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (NSString)sourceLastKnownName
{
  return self->_sourceLastKnownName;
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (NSURL)itemURL
{
  return self->_itemURL;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (NSURL)activityCanonicalURL
{
  return self->_activityCanonicalURL;
}

- (NSString)activityTargetContentIdentifier
{
  return self->_activityTargetContentIdentifier;
}

- (NSString)activityPersistentIdentifier
{
  return self->_activityPersistentIdentifier;
}

- (int64_t)previewLoadLevel
{
  return self->_previewLoadLevel;
}

- (void)setPreviewLoadLevel:(int64_t)a3
{
  self->_previewLoadLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityPersistentIdentifier, 0);
  objc_storeStrong((id *)&self->_activityTargetContentIdentifier, 0);
  objc_storeStrong((id *)&self->_activityCanonicalURL, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_itemURL, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_sourceLastKnownName, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_displayTitle, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_linkPreviewMetadata, 0);
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.synapse.item";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return (NSArray *)v2;
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v7 = a3;
  if ([a4 isEqualToString:@"com.apple.synapse.item"]) {
    v8 = [[SYContentItem alloc] initWithData:v7 error:a5];
  }
  else {
    v8 = 0;
  }

  return v8;
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.synapse.item";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return (NSArray *)v2;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  char v6 = (void (**)(id, void *, id))a4;
  if ([a3 isEqualToString:@"com.apple.synapse.item"])
  {
    id v10 = 0;
    id v7 = [(SYContentItem *)self dataRepresentationWithError:&v10];
    id v8 = v10;
  }
  else
  {
    id v8 = 0;
    id v7 = 0;
  }
  v6[2](v6, v7, v8);

  return 0;
}

- (void)initWithData:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C2C5F000, a2, OS_LOG_TYPE_ERROR, "Error initializing content item: %@", (uint8_t *)&v2, 0xCu);
}

- (void)dataRepresentationWithError:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 userActivity];
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1C2C5F000, a3, OS_LOG_TYPE_ERROR, "Failed to serialize data for user activity %@. Error: %@", (uint8_t *)&v6, 0x16u);
}

@end