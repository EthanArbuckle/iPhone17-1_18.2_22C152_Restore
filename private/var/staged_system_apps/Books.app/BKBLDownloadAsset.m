@interface BKBLDownloadAsset
- (BKBLDownloadAsset)initWithBLDownloadStatus:(id)a3 dataSourceIdentifier:(id)a4 isParent:(BOOL)a5;
- (BKBLDownloadAsset)parent;
- (BOOL)_isSupplementalPDFromDownloadStatus:(id)a3;
- (BOOL)active;
- (BOOL)computedRating;
- (BOOL)isAudiobook;
- (BOOL)isCompressed;
- (BOOL)isDevelopment;
- (BOOL)isEphemeral;
- (BOOL)isLocked;
- (BOOL)isParent;
- (BOOL)isProof;
- (BOOL)isSample;
- (BOOL)needsUpdate;
- (BOOL)shouldDisableOptimizeSpeed;
- (BOOL)shouldDisableTouchEmulation;
- (BOOL)updateMetadata:(id)a3;
- (NSArray)activeChildren;
- (NSArray)children;
- (NSDate)dataSourceInsertionDate;
- (NSDate)expectedDate;
- (NSDate)lastOpenDate;
- (NSDate)purchaseDate;
- (NSDate)releaseDate;
- (NSDate)updateDate;
- (NSMutableArray)childAssets;
- (NSNumber)isExplicit;
- (NSNumber)versionNumber;
- (NSString)accountID;
- (NSString)assetID;
- (NSString)author;
- (NSString)bookDescription;
- (NSString)comments;
- (NSString)dataSourceIdentifier;
- (NSString)description;
- (NSString)downloadID;
- (NSString)genre;
- (NSString)grouping;
- (NSString)identifier;
- (NSString)kind;
- (NSString)scrollDirection;
- (NSString)sortAuthor;
- (NSString)sortTitle;
- (NSString)storeID;
- (NSString)temporaryAssetID;
- (NSString)title;
- (NSString)versionNumberHumanReadable;
- (NSString)year;
- (NSURL)permlink;
- (NSURL)thumbnailImageURL;
- (NSURL)url;
- (float)progress;
- (id)_assetIDFromDownloadStatus:(id)a3;
- (id)_temporaryAssetIDFromDownloadStatus:(id)a3;
- (int64_t)bytesDownloaded;
- (int64_t)bytesDownloaded:(int64_t)a3;
- (int64_t)bytesTotal;
- (int64_t)bytesTotal:(int64_t)a3;
- (int64_t)downloadState;
- (int64_t)fileSize;
- (int64_t)generation;
- (int64_t)metadataMigrationVersion;
- (int64_t)pageCount;
- (int64_t)rating;
- (int64_t)secondsRemaining;
- (int64_t)secondsRemaining:(int64_t)a3;
- (signed)contentType;
- (signed)desktopSupportLevel;
- (signed)state;
- (unint64_t)numberOfAddedChildren;
- (void)_updateContentTypeFromKind;
- (void)_updateIfNeeded;
- (void)addChild:(id)a3;
- (void)removeFromParent;
- (void)setActive:(BOOL)a3;
- (void)setAuthor:(id)a3;
- (void)setBytesDownloaded:(int64_t)a3;
- (void)setBytesTotal:(int64_t)a3;
- (void)setChildAssets:(id)a3;
- (void)setContentType:(signed __int16)a3;
- (void)setDownloadState:(int64_t)a3;
- (void)setDownloadStatus:(id)a3;
- (void)setNeedsUpdate:(BOOL)a3;
- (void)setNumberOfAddedChildren:(unint64_t)a3;
- (void)setParent:(id)a3;
- (void)setProgress:(float)a3;
- (void)setSecondsRemaining:(int64_t)a3;
- (void)setThumbnailImageURL:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation BKBLDownloadAsset

- (BKBLDownloadAsset)initWithBLDownloadStatus:(id)a3 dataSourceIdentifier:(id)a4 isParent:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v48.receiver = self;
  v48.super_class = (Class)BKBLDownloadAsset;
  v10 = [(BKBLDownloadAsset *)&v48 init];
  v11 = v10;
  if (v10)
  {
    v10->_active = 1;
    v10->_needsUpdate = 0;
    objc_storeStrong((id *)&v10->_dataSourceIdentifier, a4);
    uint64_t v12 = [v8 downloadID];
    downloadID = v11->_downloadID;
    v11->_downloadID = (NSString *)v12;

    uint64_t v14 = [v8 genre];
    genre = v11->_genre;
    v11->_genre = (NSString *)v14;

    v16 = [v8 thumbnailImageURL];
    uint64_t v17 = +[NSURL URLWithString:v16];
    thumbnailImageURL = v11->_thumbnailImageURL;
    v11->_thumbnailImageURL = (NSURL *)v17;

    v11->_generation = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v19 = [v8 assetKind];
    kind = v11->_kind;
    v11->_kind = (NSString *)v19;

    v11->_state = 2;
    v11->_sample = [v8 isSample];
    if (a5)
    {
      v11->_isAudiobook = 1;
      v11->_isParent = a5;
      [(BKBLDownloadAsset *)v11 _updateContentTypeFromKind];
      uint64_t v21 = [v8 collectionArtistName];
      author = v11->_author;
      v11->_author = (NSString *)v21;

      uint64_t v23 = [v8 collectionTitle];
      title = v11->_title;
      v11->_title = (NSString *)v23;

      v25 = [v8 storePlaylistID];
      v26 = [v25 stringValue];
      assetID = v11->_assetID;
      v11->_assetID = v26;

      objc_storeStrong((id *)&v11->_storeID, v26);
      uint64_t v28 = objc_opt_new();
      childAssets = v11->_childAssets;
      v11->_childAssets = (NSMutableArray *)v28;
    }
    else
    {
      v11->_isAudiobook = [v8 isAudiobook];
      v11->_isParent = a5;
      [(BKBLDownloadAsset *)v11 _updateContentTypeFromKind];
      uint64_t v30 = [v8 artistName];
      v31 = v11->_author;
      v11->_author = (NSString *)v30;

      uint64_t v32 = [v8 title];
      v33 = v11->_title;
      v11->_title = (NSString *)v32;

      v34 = [v8 storeID];
      id v35 = [v34 longLongValue];

      if (v35)
      {
        v36 = [v8 storeID];
        uint64_t v37 = [v36 stringValue];
        storeID = v11->_storeID;
        v11->_storeID = (NSString *)v37;

        uint64_t v39 = [(BKBLDownloadAsset *)v11 _assetIDFromDownloadStatus:v8];
        v40 = v11->_assetID;
        v11->_assetID = (NSString *)v39;

        uint64_t v41 = [(BKBLDownloadAsset *)v11 _temporaryAssetIDFromDownloadStatus:v8];
      }
      else
      {
        v43 = [v8 permLink];

        if (!v43) {
          goto LABEL_8;
        }
        v44 = [v8 permLink];
        uint64_t v45 = +[NSURL URLWithString:v44];
        permlink = v11->_permlink;
        v11->_permlink = (NSURL *)v45;

        v47 = v11->_permlink;
        if (!v47)
        {
          childAssets = (NSMutableArray *)v11->_temporaryAssetID;
          v11->_temporaryAssetID = 0;
          goto LABEL_7;
        }
        uint64_t v41 = [(NSURL *)v47 identifierFromPermlink];
      }
      childAssets = (NSMutableArray *)v11->_temporaryAssetID;
      v11->_temporaryAssetID = (NSString *)v41;
    }
LABEL_7:
  }
LABEL_8:

  return v11;
}

- (BOOL)_isSupplementalPDFromDownloadStatus:(id)a3
{
  id v3 = a3;
  v4 = [v3 storePlaylistID];
  v5 = [v4 stringValue];

  if (v5) {
    unsigned int v6 = [v3 isAudiobook] ^ 1;
  }
  else {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)_assetIDFromDownloadStatus:(id)a3
{
  id v4 = a3;
  if ([(BKBLDownloadAsset *)self _isSupplementalPDFromDownloadStatus:v4])
  {
    v5 = 0;
  }
  else
  {
    unsigned int v6 = [v4 storeID];
    v5 = [v6 stringValue];
  }

  return v5;
}

- (id)_temporaryAssetIDFromDownloadStatus:(id)a3
{
  id v4 = a3;
  if ([(BKBLDownloadAsset *)self _isSupplementalPDFromDownloadStatus:v4])
  {
    v5 = [v4 storeID];
    uint64_t v6 = [v5 stringValue];
    goto LABEL_6;
  }
  v7 = [v4 permLink];

  if (v7)
  {
    id v8 = [v4 permLink];
    v5 = +[NSURL URLWithString:v8];

    if (!v5)
    {
      id v9 = 0;
      goto LABEL_7;
    }
    uint64_t v6 = [(NSURL *)self->_permlink identifierFromPermlink];
LABEL_6:
    id v9 = (void *)v6;
LABEL_7:

    goto LABEL_8;
  }
  id v9 = 0;
LABEL_8:

  return v9;
}

- (BOOL)updateMetadata:(id)a3
{
  id v4 = a3;
  if (![(BKBLDownloadAsset *)self isParent])
  {
    uint64_t v6 = [v4 title];
    if ([v6 length])
    {
    }
    else
    {
      v16 = [v4 artistName];
      id v17 = [v16 length];

      if (!v17) {
        goto LABEL_13;
      }
    }
    v18 = [v4 artistName];
    author = self->_author;
    self->_author = v18;

    v20 = [v4 title];
    title = self->_title;
    self->_title = v20;

    v22 = [v4 storeID];
    id v23 = [v22 longLongValue];

    if (v23)
    {
      v24 = [v4 storeID];
      v25 = [v24 stringValue];
      storeID = self->_storeID;
      self->_storeID = v25;

      v27 = [(BKBLDownloadAsset *)self _assetIDFromDownloadStatus:v4];
      assetID = self->_assetID;
      self->_assetID = v27;

      v29 = [(BKBLDownloadAsset *)self _temporaryAssetIDFromDownloadStatus:v4];
    }
    else
    {
      v43 = [v4 permLink];

      if (!v43) {
        goto LABEL_13;
      }
      v44 = [v4 permLink];
      uint64_t v45 = +[NSURL URLWithString:v44];
      permlink = self->_permlink;
      self->_permlink = v45;

      v47 = self->_permlink;
      if (!v47)
      {
        temporaryAssetID = self->_temporaryAssetID;
        self->_temporaryAssetID = 0;
        goto LABEL_12;
      }
      v29 = [(NSURL *)v47 identifierFromPermlink];
    }
    temporaryAssetID = self->_temporaryAssetID;
    self->_temporaryAssetID = v29;
LABEL_12:

    goto LABEL_13;
  }
  v5 = [v4 collectionTitle];
  if ([v5 length])
  {

LABEL_7:
    id v9 = [v4 collectionArtistName];
    v10 = self->_author;
    self->_author = v9;

    v11 = [v4 collectionTitle];
    uint64_t v12 = self->_title;
    self->_title = v11;

    temporaryAssetID = [v4 storePlaylistID];
    uint64_t v14 = [temporaryAssetID stringValue];
    v15 = self->_assetID;
    self->_assetID = v14;

    objc_storeStrong((id *)&self->_storeID, v14);
    goto LABEL_12;
  }
  v7 = [v4 collectionArtistName];
  id v8 = [v7 length];

  if (v8) {
    goto LABEL_7;
  }
LABEL_13:
  if (![(NSString *)self->_storeID length])
  {
    uint64_t v30 = [(NSURL *)self->_permlink absoluteString];
    id v31 = [v30 length];

    if (!v31)
    {
      uint64_t v32 = BCBookDownloadLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        sub_1007EF49C(v32);
      }
    }
  }
  if (![(NSString *)self->_title length])
  {
    v33 = BCBookDownloadLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_1007EF458(v33);
    }
  }
  v34 = [v4 genre];
  genre = self->_genre;
  self->_genre = v34;

  v36 = [v4 thumbnailImageURL];
  uint64_t v37 = +[NSURL URLWithString:v36];
  thumbnailImageURL = self->_thumbnailImageURL;
  self->_thumbnailImageURL = v37;

  self->_generation = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v39 = [v4 assetKind];
  kind = self->_kind;
  self->_kind = v39;

  if ([(BKBLDownloadAsset *)self isParent]) {
    unsigned __int8 v41 = 1;
  }
  else {
    unsigned __int8 v41 = [v4 isAudiobook];
  }
  self->_isAudiobook = v41;
  [(BKBLDownloadAsset *)self _updateContentTypeFromKind];
  self->_state = 2;
  self->_sample = [v4 isSample];

  return 1;
}

- (NSString)description
{
  return (NSString *)+[BKAssetUtilities descriptionForAsset:self];
}

- (void)_updateContentTypeFromKind
{
  if ([(BKBLDownloadAsset *)self isParent]
    || ([(BKBLDownloadAsset *)self kind],
        id v3 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v4 = [v3 isEqualToString:BLDownloadKindAudiobook],
        v3,
        (v4 & 1) != 0))
  {
    uint64_t v5 = 6;
  }
  else
  {
    uint64_t v6 = [(BKBLDownloadAsset *)self kind];
    unsigned __int8 v7 = [v6 isEqualToString:BLDownloadKindEBook];

    if (v7)
    {
      uint64_t v5 = 1;
    }
    else
    {
      id v8 = [(BKBLDownloadAsset *)self kind];
      unsigned int v9 = [v8 isEqualToString:BLDownloadKindPDF];

      if (!v9) {
        return;
      }
      uint64_t v5 = 3;
    }
  }

  [(BKBLDownloadAsset *)self setContentType:v5];
}

- (NSString)identifier
{
  id v3 = [(BKBLDownloadAsset *)self storeID];
  unsigned __int8 v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(BKBLDownloadAsset *)self temporaryAssetID];
  }
  uint64_t v6 = v5;

  return (NSString *)v6;
}

- (void)setProgress:(float)a3
{
  self->_progress = a3;
  id v3 = [(BKBLDownloadAsset *)self parent];
  [v3 setNeedsUpdate:1];
}

- (float)progress
{
  return self->_progress;
}

- (void)setSecondsRemaining:(int64_t)a3
{
  if (self->_secondsRemaining != a3)
  {
    self->_secondsRemaining = a3;
    id v3 = [(BKBLDownloadAsset *)self parent];
    [v3 setNeedsUpdate:1];
  }
}

- (int64_t)secondsRemaining:(int64_t)a3
{
  return self->_secondsRemaining;
}

- (void)setBytesDownloaded:(int64_t)a3
{
  if (self->_bytesDownloaded != a3)
  {
    self->_bytesDownloaded = a3;
    id v3 = [(BKBLDownloadAsset *)self parent];
    [v3 setNeedsUpdate:1];
  }
}

- (int64_t)bytesDownloaded:(int64_t)a3
{
  return self->_bytesDownloaded;
}

- (void)setBytesTotal:(int64_t)a3
{
  if (self->_bytesTotal != a3)
  {
    self->_bytesTotal = a3;
    id v3 = [(BKBLDownloadAsset *)self parent];
    [v3 setNeedsUpdate:1];
  }
}

- (int64_t)bytesTotal:(int64_t)a3
{
  return self->_bytesTotal;
}

- (void)setDownloadStatus:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [v4 percentComplete];
    [v5 floatValue];
    self->_progress = v6;

    unsigned __int8 v7 = [v4 estimatedTimeRemaining];
    self->_secondsRemaining = (int64_t)[v7 integerValue];

    id v8 = [v4 transferBytesWritten];
    self->_bytesDownloaded = (int64_t)[v8 longLongValue];

    unsigned int v9 = [v4 transferBytesExpected];
    self->_bytesTotal = (int64_t)[v9 longLongValue];

    unint64_t v10 = (unint64_t)[v4 downloadPhase];
    if (v10 <= 8) {
      self->_downloadState = qword_10085CC20[v10];
    }
    id v11 = [(BKBLDownloadAsset *)self parent];
    [v11 setNeedsUpdate:1];
  }
}

- (int64_t)downloadState
{
  return self->_downloadState;
}

- (void)_updateIfNeeded
{
  if ([(BKBLDownloadAsset *)self needsUpdate])
  {
    self->_downloadState = 4;
    id v3 = [(BKBLDownloadAsset *)self children];
    if ([v3 count])
    {
      self->_secondsRemaining = 0;
      self->_bytesDownloaded = 0;
      self->_bytesTotal = 0;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      v20 = v3;
      id v4 = v3;
      id v5 = [v4 countByEnumeratingWithState:&v22 objects:v34 count:16];
      if (v5)
      {
        id v6 = v5;
        int v7 = 0;
        uint64_t v21 = 0;
        int v8 = 0;
        int v9 = 0;
        int v10 = 0;
        uint64_t v11 = *(void *)v23;
        float v12 = 0.0;
        do
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v23 != v11) {
              objc_enumerationMutation(v4);
            }
            uint64_t v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            self->_secondsRemaining += (int64_t)[v14 secondsRemaining:v20];
            self->_bytesDownloaded += (int64_t)[v14 bytesDownloaded];
            self->_bytesTotal += (int64_t)[v14 bytesTotal];
            [v14 progress];
            float v16 = v15;
            switch((unint64_t)[v14 downloadState])
            {
              case 3uLL:
                LODWORD(v21) = v21 + 1;
                break;
              case 4uLL:
                ++v10;
                break;
              case 5uLL:
                ++v9;
                break;
              case 6uLL:
                ++v7;
                break;
              case 7uLL:
                ++v8;
                break;
              case 8uLL:
                ++HIDWORD(v21);
                break;
              default:
                break;
            }
            float v12 = v12 + v16;
          }
          id v6 = [v4 countByEnumeratingWithState:&v22 objects:v34 count:16];
        }
        while (v6);
      }
      else
      {
        int v7 = 0;
        uint64_t v21 = 0;
        int v8 = 0;
        int v9 = 0;
        int v10 = 0;
        float v12 = 0.0;
      }

      id v17 = [(BKBLDownloadAsset *)self children];
      self->_progress = v12 / (float)(unint64_t)[v17 count];

      if (v8 <= 0)
      {
        id v3 = v20;
        if (v10 <= 0)
        {
          if ([v4 count] == (id)v9)
          {
            int64_t v18 = 5;
          }
          else if ([v4 count] == (id)v7)
          {
            int64_t v18 = 6;
          }
          else if (v21 <= 0)
          {
            if ([v4 count] == (id)(int)v21)
            {
              int64_t v18 = 3;
            }
            else
            {
              uint64_t v19 = BCBookDownloadLog();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109888;
                int v27 = v9;
                __int16 v28 = 1024;
                int v29 = v7;
                __int16 v30 = 1024;
                int v31 = HIDWORD(v21);
                __int16 v32 = 1024;
                int v33 = v21;
                _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "unexpected audiobook download state downloaded=%d paused=%d cancelled=%d waiting=%d", buf, 0x1Au);
              }

              int64_t v18 = 0;
            }
          }
          else
          {
            int64_t v18 = 8;
          }
        }
        else
        {
          int64_t v18 = 4;
        }
      }
      else
      {
        int64_t v18 = 7;
        id v3 = v20;
      }
      self->_downloadState = v18;
    }
    -[BKBLDownloadAsset setNeedsUpdate:](self, "setNeedsUpdate:", 0, v20);
  }
}

- (BOOL)isAudiobook
{
  return self->_isAudiobook;
}

- (void)addChild:(id)a3
{
  id v5 = a3;
  id v4 = [(BKBLDownloadAsset *)self childAssets];
  [v4 addObject:v5];

  [(BKBLDownloadAsset *)self setNumberOfAddedChildren:(char *)[(BKBLDownloadAsset *)self numberOfAddedChildren] + 1];
  [v5 setParent:self];
}

- (void)removeFromParent
{
  id v3 = [(BKBLDownloadAsset *)self parent];
  id v4 = [v3 childAssets];
  [v4 removeObject:self];

  [(BKBLDownloadAsset *)self setParent:0];
}

- (NSArray)children
{
  v2 = [(BKBLDownloadAsset *)self childAssets];
  id v3 = [v2 copy];

  return (NSArray *)v3;
}

- (NSArray)activeChildren
{
  id v3 = +[NSPredicate predicateWithFormat:@"active == YES"];
  id v4 = [(BKBLDownloadAsset *)self childAssets];
  id v5 = [v4 filteredArrayUsingPredicate:v3];

  return (NSArray *)v5;
}

- (NSString)assetID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)storeID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)temporaryAssetID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSURL)permlink
{
  return (NSURL *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)dataSourceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)genre
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (NSString)kind
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (BOOL)isSample
{
  return self->_sample;
}

- (int64_t)generation
{
  return self->_generation;
}

- (signed)state
{
  return self->_state;
}

- (NSString)accountID
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (NSString)sortAuthor
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (NSString)sortTitle
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 136, 1);
}

- (BOOL)isProof
{
  return self->proof;
}

- (BOOL)isCompressed
{
  return self->compressed;
}

- (BOOL)isLocked
{
  return self->locked;
}

- (BOOL)isEphemeral
{
  return self->ephemeral;
}

- (int64_t)fileSize
{
  return self->fileSize;
}

- (signed)contentType
{
  return self->contentType;
}

- (void)setContentType:(signed __int16)a3
{
  self->contentType = a3;
}

- (NSNumber)isExplicit
{
  return (NSNumber *)objc_getProperty(self, a2, 152, 1);
}

- (NSDate)dataSourceInsertionDate
{
  return (NSDate *)objc_getProperty(self, a2, 160, 1);
}

- (NSDate)releaseDate
{
  return (NSDate *)objc_getProperty(self, a2, 168, 1);
}

- (NSDate)purchaseDate
{
  return (NSDate *)objc_getProperty(self, a2, 176, 1);
}

- (NSDate)expectedDate
{
  return (NSDate *)objc_getProperty(self, a2, 184, 1);
}

- (NSDate)lastOpenDate
{
  return (NSDate *)objc_getProperty(self, a2, 192, 1);
}

- (BOOL)shouldDisableOptimizeSpeed
{
  return self->shouldDisableOptimizeSpeed;
}

- (BOOL)shouldDisableTouchEmulation
{
  return self->shouldDisableTouchEmulation;
}

- (signed)desktopSupportLevel
{
  return self->desktopSupportLevel;
}

- (NSString)scrollDirection
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (int64_t)pageCount
{
  return self->pageCount;
}

- (int64_t)rating
{
  return self->rating;
}

- (NSDate)updateDate
{
  return (NSDate *)objc_getProperty(self, a2, 224, 1);
}

- (NSNumber)versionNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 232, 1);
}

- (NSString)versionNumberHumanReadable
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (NSString)bookDescription
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (NSString)comments
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (NSString)year
{
  return (NSString *)objc_getProperty(self, a2, 264, 1);
}

- (NSString)grouping
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (BOOL)computedRating
{
  return self->computedRating;
}

- (int64_t)metadataMigrationVersion
{
  return self->metadataMigrationVersion;
}

- (BOOL)isDevelopment
{
  return self->development;
}

- (int64_t)secondsRemaining
{
  return self->_secondsRemaining;
}

- (int64_t)bytesDownloaded
{
  return self->_bytesDownloaded;
}

- (int64_t)bytesTotal
{
  return self->_bytesTotal;
}

- (void)setDownloadState:(int64_t)a3
{
  self->_downloadState = a3;
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)isParent
{
  return self->_isParent;
}

- (NSURL)thumbnailImageURL
{
  return (NSURL *)objc_getProperty(self, a2, 320, 1);
}

- (void)setThumbnailImageURL:(id)a3
{
}

- (NSString)downloadID
{
  return self->_downloadID;
}

- (BKBLDownloadAsset)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);

  return (BKBLDownloadAsset *)WeakRetained;
}

- (void)setParent:(id)a3
{
}

- (NSMutableArray)childAssets
{
  return self->_childAssets;
}

- (void)setChildAssets:(id)a3
{
}

- (unint64_t)numberOfAddedChildren
{
  return self->_numberOfAddedChildren;
}

- (void)setNumberOfAddedChildren:(unint64_t)a3
{
  self->_numberOfAddedChildren = a3;
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childAssets, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_downloadID, 0);
  objc_storeStrong((id *)&self->_thumbnailImageURL, 0);
  objc_storeStrong((id *)&self->grouping, 0);
  objc_storeStrong((id *)&self->year, 0);
  objc_storeStrong((id *)&self->comments, 0);
  objc_storeStrong((id *)&self->bookDescription, 0);
  objc_storeStrong((id *)&self->versionNumberHumanReadable, 0);
  objc_storeStrong((id *)&self->versionNumber, 0);
  objc_storeStrong((id *)&self->updateDate, 0);
  objc_storeStrong((id *)&self->scrollDirection, 0);
  objc_storeStrong((id *)&self->lastOpenDate, 0);
  objc_storeStrong((id *)&self->expectedDate, 0);
  objc_storeStrong((id *)&self->purchaseDate, 0);
  objc_storeStrong((id *)&self->releaseDate, 0);
  objc_storeStrong((id *)&self->dataSourceInsertionDate, 0);
  objc_storeStrong((id *)&self->isExplicit, 0);
  objc_storeStrong((id *)&self->url, 0);
  objc_storeStrong((id *)&self->sortTitle, 0);
  objc_storeStrong((id *)&self->sortAuthor, 0);
  objc_storeStrong((id *)&self->accountID, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_dataSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_permlink, 0);
  objc_storeStrong((id *)&self->_temporaryAssetID, 0);
  objc_storeStrong((id *)&self->_storeID, 0);

  objc_storeStrong((id *)&self->_assetID, 0);
}

@end