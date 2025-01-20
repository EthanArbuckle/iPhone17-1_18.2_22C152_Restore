@interface BKUbiquityAsset
+ (BOOL)supportsSecureCoding;
+ (id)newAssetFromMetadata:(id)a3 url:(id)a4 downloaded:(BOOL)a5 downloading:(BOOL)a6 filesize:(int64_t)a7 dataSourceIdentifier:(id)a8 insertionDate:(id)a9 updateDate:(id)a10;
+ (signed)p_assetContentTypeFromFileName:(id)a3;
+ (void)populateAsset:(id)a3 withMetadata:(id)a4;
- (BKUbiquityAsset)initWithCoder:(id)a3;
- (BOOL)computedRating;
- (BOOL)isCompressed;
- (BOOL)isDevelopment;
- (BOOL)isDifferentFilename:(id)a3;
- (BOOL)isDifferentPath:(id)a3;
- (BOOL)isEphemeral;
- (BOOL)isLocked;
- (BOOL)isProof;
- (BOOL)isSameAsAsset:(id)a3;
- (BOOL)isSample;
- (BOOL)isSupplementalContent;
- (BOOL)isUpdatedFromAsset:(id)a3;
- (BOOL)shouldDisableOptimizeSpeed;
- (BOOL)shouldDisableTouchEmulation;
- (NSDate)dataSourceInsertionDate;
- (NSDate)expectedDate;
- (NSDate)lastOpenDate;
- (NSDate)purchaseDate;
- (NSDate)releaseDate;
- (NSDate)updateDate;
- (NSNumber)assetIsHidden;
- (NSNumber)isExplicit;
- (NSNumber)versionNumber;
- (NSString)accountID;
- (NSString)assetID;
- (NSString)author;
- (NSString)bookDescription;
- (NSString)comments;
- (NSString)dataSourceIdentifier;
- (NSString)description;
- (NSString)genre;
- (NSString)grouping;
- (NSString)kind;
- (NSString)pageProgressionDirection;
- (NSString)scrollDirection;
- (NSString)sortAuthor;
- (NSString)sortTitle;
- (NSString)storeID;
- (NSString)storePlaylistID;
- (NSString)temporaryAssetID;
- (NSString)title;
- (NSString)versionNumberHumanReadable;
- (NSString)year;
- (NSURL)url;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)fileSize;
- (int64_t)generation;
- (int64_t)metadataMigrationVersion;
- (int64_t)pageCount;
- (int64_t)rating;
- (signed)contentType;
- (signed)desktopSupportLevel;
- (signed)state;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountID:(id)a3;
- (void)setAssetID:(id)a3;
- (void)setAssetIsHidden:(id)a3;
- (void)setAuthor:(id)a3;
- (void)setBookDescription:(id)a3;
- (void)setComments:(id)a3;
- (void)setCompressed:(BOOL)a3;
- (void)setComputedRating:(BOOL)a3;
- (void)setContentType:(signed __int16)a3;
- (void)setDataSourceIdentifier:(id)a3;
- (void)setDataSourceInsertionDate:(id)a3;
- (void)setDesktopSupportLevel:(signed __int16)a3;
- (void)setDevelopment:(BOOL)a3;
- (void)setExpectedDate:(id)a3;
- (void)setFileSize:(int64_t)a3;
- (void)setGeneration:(int64_t)a3;
- (void)setGenre:(id)a3;
- (void)setGrouping:(id)a3;
- (void)setIsExplicit:(id)a3;
- (void)setKind:(id)a3;
- (void)setLastOpenDate:(id)a3;
- (void)setLocked:(BOOL)a3;
- (void)setMetadataMigrationVersion:(int64_t)a3;
- (void)setPageCount:(int64_t)a3;
- (void)setPageProgressionDirection:(id)a3;
- (void)setProof:(BOOL)a3;
- (void)setPurchaseDate:(id)a3;
- (void)setRating:(int64_t)a3;
- (void)setReleaseDate:(id)a3;
- (void)setSample:(BOOL)a3;
- (void)setScrollDirection:(id)a3;
- (void)setShouldDisableOptimizeSpeed:(BOOL)a3;
- (void)setShouldDisableTouchEmulation:(BOOL)a3;
- (void)setSortAuthor:(id)a3;
- (void)setSortTitle:(id)a3;
- (void)setState:(signed __int16)a3;
- (void)setStoreID:(id)a3;
- (void)setStorePlaylistID:(id)a3;
- (void)setSupplementalContent:(BOOL)a3;
- (void)setSupplementalContent:(BOOL)a3 playlistID:(id)a4 storeID:(id)a5;
- (void)setTemporaryAssetID:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUpdateDate:(id)a3;
- (void)setUrl:(id)a3;
- (void)setVersionNumber:(id)a3;
- (void)setVersionNumberHumanReadable:(id)a3;
- (void)setYear:(id)a3;
@end

@implementation BKUbiquityAsset

+ (void)populateAsset:(id)a3 withMetadata:(id)a4
{
  id v42 = a3;
  id v5 = a4;
  if (v42 && [v5 count])
  {
    objc_opt_class();
    v6 = [v5 objectForKeyedSubscript:BCMetadataXattrTitle];
    v7 = BUDynamicCast();
    [v42 setTitle:v7];

    objc_opt_class();
    v8 = [v5 objectForKeyedSubscript:BCMetadataXattrSortTitle];
    v9 = BUDynamicCast();
    [v42 setSortTitle:v9];

    objc_opt_class();
    v10 = [v5 objectForKeyedSubscript:BCMetadataXattrAuthor];
    v11 = BUDynamicCast();
    [v42 setAuthor:v11];

    objc_opt_class();
    v12 = [v5 objectForKeyedSubscript:BCMetadataXattrSortAuthor];
    v13 = BUDynamicCast();
    [v42 setSortAuthor:v13];

    objc_opt_class();
    v14 = [v5 objectForKeyedSubscript:BCMetadataXattrGenre];
    v15 = BUDynamicCast();
    [v42 setGenre:v15];

    objc_opt_class();
    v16 = [v5 objectForKeyedSubscript:BCMetadataXattrComments];
    v17 = BUDynamicCast();
    [v42 setComments:v17];

    objc_opt_class();
    v18 = [v5 objectForKeyedSubscript:BCMetadataXattrBookDescription];
    v19 = BUDynamicCast();
    [v42 setBookDescription:v19];

    objc_opt_class();
    v20 = [v5 objectForKeyedSubscript:BCMetadataXattrYear];
    v21 = BUDynamicCast();
    [v42 setYear:v21];

    objc_opt_class();
    v22 = [v5 objectForKeyedSubscript:BCMetadataXattrExplicit];
    v23 = BUDynamicCast();

    if ([v23 length])
    {
      v24 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v23 BOOLValue]);
      [v42 setIsExplicit:v24];
    }
    objc_opt_class();
    v25 = [v5 objectForKeyedSubscript:BCMetadataXattrLastOpened];
    v26 = BUDynamicCast();

    if ([v26 length])
    {
      v27 = +[BCUbiquityMetadataHelper metadataDateFromString:v26];
      [v42 setLastOpenDate:v27];
    }
    objc_opt_class();
    v28 = [v5 objectForKeyedSubscript:BCMetadataXattrFirstOpened];
    v29 = BUDynamicCast();

    if ([v29 length])
    {
      v30 = +[BCUbiquityMetadataHelper metadataDateFromString:v29];
      [v42 setPurchaseDate:v30];
    }
    objc_opt_class();
    v31 = [v5 objectForKeyedSubscript:BCMetadataXattrRating];
    v32 = BUDynamicCast();

    if (v32) {
      [v42 setRating:[v32 integerValue]];
    }
    objc_opt_class();
    v33 = [v5 objectForKeyedSubscript:BCMetadataXattrGeneration];
    v34 = BUDynamicCast();

    if ([v34 length]) {
      [v42 setGeneration:[v34 longLongValue]];
    }
    objc_opt_class();
    v35 = [v5 objectForKeyedSubscript:BCMetadataXattrIsSupplementalContent];
    v36 = BUDynamicCast();

    if ([v36 length]) {
      [v42 setSupplementalContent:[v36 BOOLValue]];
    }
    objc_opt_class();
    v37 = [v5 objectForKeyedSubscript:BCMetadataXattrStoreID];
    v38 = BUDynamicCast();
    [v42 setStoreID:v38];

    objc_opt_class();
    v39 = [v5 objectForKeyedSubscript:BCMetadataXattrStorePlaylistID];
    v40 = BUDynamicCast();
    [v42 setStorePlaylistID:v40];

    v41 = [v42 storeID];
    [v42 setTemporaryAssetID:v41];
  }
}

+ (id)newAssetFromMetadata:(id)a3 url:(id)a4 downloaded:(BOOL)a5 downloading:(BOOL)a6 filesize:(int64_t)a7 dataSourceIdentifier:(id)a8 insertionDate:(id)a9 updateDate:(id)a10
{
  BOOL v13 = a5;
  id v16 = a3;
  id v17 = a4;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  if (!v19)
  {
    BCReportAssertionFailureWithMessage();
    if (v16) {
      goto LABEL_3;
    }
LABEL_15:
    v22 = 0;
    goto LABEL_16;
  }
  if (!v16) {
    goto LABEL_15;
  }
LABEL_3:
  v21 = [v16 objectForKeyedSubscript:BCMetadataXattrAssetID];
  if ([v21 length])
  {
    BOOL v26 = v13;
    v22 = objc_opt_new();
    [v22 setAssetID:v21];
    [v22 setGeneration:0x7FFFFFFFFFFFFFFFLL];
    [a1 populateAsset:v22 withMetadata:v16];
    [v22 setUrl:v17];
    [v22 setFileSize:a7];
    v23 = [v17 path];
    [v22 setContentType:[BKUbiquityAsset p_assetContentTypeFromFileName:v23]];

    if (a6)
    {
      [v22 setState:2];
    }
    else
    {
      if (v26) {
        uint64_t v24 = 1;
      }
      else {
        uint64_t v24 = 3;
      }
      [v22 setState:v24];
      if (v26) {
        [v22 setAssetIsHidden:&__kCFBooleanFalse];
      }
    }
    [v22 setDataSourceInsertionDate:v19];
    [v22 setPurchaseDate:v19];
    [v22 setUpdateDate:v20];
    [v22 setDataSourceIdentifier:v18];
  }
  else
  {
    v22 = 0;
  }

LABEL_16:
  return v22;
}

- (BOOL)isEphemeral
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BKUbiquityAsset)initWithCoder:(id)a3
{
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)BKUbiquityAsset;
  id v5 = [(BKUbiquityAsset *)&v45 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetID"];
    v7 = (NSString *)[v6 copy];
    assetID = v5->_assetID;
    v5->_assetID = v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"temporaryAssetID"];
    v10 = (NSString *)[v9 copy];
    temporaryAssetID = v5->_temporaryAssetID;
    v5->_temporaryAssetID = v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"author"];
    BOOL v13 = (NSString *)[v12 copy];
    author = v5->_author;
    v5->_author = v13;

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    id v16 = (NSString *)[v15 copy];
    title = v5->_title;
    v5->_title = v16;

    id v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URL"];
    id v19 = (NSURL *)[v18 copy];
    url = v5->_url;
    v5->_url = v19;

    v5->_fileSize = (int64_t)[v4 decodeInt64ForKey:@"fileSize"];
    v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"genre"];
    v22 = (NSString *)[v21 copy];
    genre = v5->_genre;
    v5->_genre = v22;

    v5->_contentType = (unsigned __int16)[v4 decodeIntForKey:@"contentType"];
    v5->_state = (unsigned __int16)[v4 decodeIntForKey:@"state"];
    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"insertionDate"];
    v25 = (NSDate *)[v24 copy];
    dataSourceInsertionDate = v5->_dataSourceInsertionDate;
    v5->_dataSourceInsertionDate = v25;

    v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"updateDate"];
    v28 = (NSDate *)[v27 copy];
    updateDate = v5->_updateDate;
    v5->_updateDate = v28;

    uint64_t v30 = [(BKUbiquityAsset *)v5 dataSourceInsertionDate];
    purchaseDate = v5->_purchaseDate;
    v5->_purchaseDate = (NSDate *)v30;

    v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dataSourceIdentifier"];
    v33 = (NSString *)[v32 copy];
    dataSourceIdentifier = v5->_dataSourceIdentifier;
    v5->_dataSourceIdentifier = v33;

    objc_opt_class();
    v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"generation"];
    v36 = BUDynamicCast();

    if (v36) {
      uint64_t v37 = (uint64_t)[v36 longLongValue];
    }
    else {
      uint64_t v37 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v5->_generation = v37;
    v5->_supplementalContent = [v4 decodeBoolForKey:@"supplementalContent"];
    v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storeID"];
    v39 = (NSString *)[v38 copy];
    storeID = v5->_storeID;
    v5->_storeID = v39;

    v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storePlaylistID"];
    id v42 = (NSString *)[v41 copy];
    storePlaylistID = v5->_storePlaylistID;
    v5->_storePlaylistID = v42;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v16 = a3;
  id v4 = [(BKUbiquityAsset *)self assetID];
  [v16 encodeObject:v4 forKey:@"assetID"];

  id v5 = [(BKUbiquityAsset *)self temporaryAssetID];
  [v16 encodeObject:v5 forKey:@"temporaryAssetID"];

  v6 = [(BKUbiquityAsset *)self author];
  [v16 encodeObject:v6 forKey:@"author"];

  v7 = [(BKUbiquityAsset *)self title];
  [v16 encodeObject:v7 forKey:@"title"];

  v8 = [(BKUbiquityAsset *)self url];
  [v16 encodeObject:v8 forKey:@"URL"];

  [v16 encodeInt64:[self fileSize] forKey:@"fileSize"];
  v9 = [(BKUbiquityAsset *)self genre];
  [v16 encodeObject:v9 forKey:@"genre"];

  [v16 encodeInt:-[BKUbiquityAsset contentType](self, "contentType") forKey:@"contentType"];
  [v16 encodeInt:[self state] forKey:@"state"];
  v10 = [(BKUbiquityAsset *)self dataSourceInsertionDate];
  [v16 encodeObject:v10 forKey:@"insertionDate"];

  v11 = [(BKUbiquityAsset *)self updateDate];
  [v16 encodeObject:v11 forKey:@"updateDate"];

  v12 = [(BKUbiquityAsset *)self dataSourceIdentifier];
  [v16 encodeObject:v12 forKey:@"dataSourceIdentifier"];

  if ([(BKUbiquityAsset *)self generation] != 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v13 = +[NSNumber numberWithLongLong:[(BKUbiquityAsset *)self generation]];
    [v16 encodeObject:v13 forKey:@"generation"];
  }
  [v16 encodeBool:[self isSupplementalContent] forKey:@"supplementalContent"];
  v14 = [(BKUbiquityAsset *)self storeID];
  [v16 encodeObject:v14 forKey:@"storeID"];

  v15 = [(BKUbiquityAsset *)self storePlaylistID];
  [v16 encodeObject:v15 forKey:@"storePlaylistID"];
}

- (BOOL)isSameAsAsset:(id)a3
{
  id v5 = a3;
  v6 = [v5 assetID];
  unsigned __int8 v7 = [v6 isEqualToString:self->_assetID];

  if ((v7 & 1) == 0)
  {
    v8 = BKLibraryDataSourceUbiquityLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1007EBF00(v8);
    }
  }
  v9 = [v5 assetID];
  if ([v9 isEqualToString:self->_assetID])
  {
    v10 = [v5 temporaryAssetID];
    temporaryAssetID = self->_temporaryAssetID;
    if (v10 != temporaryAssetID)
    {
      v3 = [v5 temporaryAssetID];
      if (![v3 isEqualToString:self->_temporaryAssetID])
      {
        unsigned __int8 v12 = 0;
        goto LABEL_48;
      }
    }
    BOOL v13 = [v5 author];
    author = self->_author;
    if (v13 != author)
    {
      v15 = [v5 author];
      if (![v15 isEqualToString:self->_author])
      {
        unsigned __int8 v12 = 0;
LABEL_46:

LABEL_47:
        if (v10 == temporaryAssetID)
        {
LABEL_49:

          goto LABEL_50;
        }
LABEL_48:

        goto LABEL_49;
      }
      v34 = v15;
    }
    id v16 = [v5 title];
    title = self->_title;
    if (v16 != title)
    {
      id v17 = [v5 title];
      if (![v17 isEqualToString:self->_title])
      {
        unsigned __int8 v12 = 0;
LABEL_44:

LABEL_45:
        v15 = v34;
        if (v13 == author) {
          goto LABEL_47;
        }
        goto LABEL_46;
      }
      v32 = v17;
    }
    id v18 = [v5 genre];
    genre = self->_genre;
    if (v18 != genre)
    {
      v31 = [v5 genre];
      if (![v31 isEqualToString:self->_genre])
      {
        unsigned __int8 v12 = 0;
LABEL_42:

LABEL_43:
        id v17 = v32;
        if (v16 == title) {
          goto LABEL_45;
        }
        goto LABEL_44;
      }
    }
    if ((unsigned __int16)self->_contentType != (unsigned __int16)[v5 contentType]
      || (unsigned __int16)self->_state != (unsigned __int16)[v5 state])
    {
      unsigned __int8 v12 = 0;
      goto LABEL_41;
    }
    uint64_t v19 = [v5 dataSourceInsertionDate];
    dataSourceInsertionDate = self->_dataSourceInsertionDate;
    uint64_t v30 = (NSDate *)v19;
    if ((NSDate *)v19 != dataSourceInsertionDate)
    {
      v28 = [v5 dataSourceInsertionDate];
      if (![v28 isEqual:self->_dataSourceInsertionDate])
      {
        unsigned __int8 v12 = 0;
        goto LABEL_39;
      }
    }
    if (self->_supplementalContent != [v5 isSupplementalContent])
    {
      unsigned __int8 v12 = 0;
      goto LABEL_38;
    }
    uint64_t v20 = [v5 storeID];
    storeID = self->_storeID;
    v27 = (NSString *)v20;
    if ((NSString *)v20 == storeID
      || ([v5 storeID],
          v25 = objc_claimAutoreleasedReturnValue(),
          [v25 isEqualToString:self->_storeID]))
    {
      v21 = [v5 storePlaylistID];
      if (v21 == self->_storePlaylistID)
      {

        unsigned __int8 v12 = 1;
      }
      else
      {
        uint64_t v24 = v21;
        v23 = [v5 storePlaylistID];
        unsigned __int8 v12 = [v23 isEqualToString:self->_storePlaylistID];
      }
      if (v27 == storeID)
      {

LABEL_38:
        if (v30 == dataSourceInsertionDate)
        {

LABEL_41:
          if (v18 == genre) {
            goto LABEL_43;
          }
          goto LABEL_42;
        }
LABEL_39:

        goto LABEL_41;
      }
    }
    else
    {
      unsigned __int8 v12 = 0;
    }

    goto LABEL_38;
  }
  unsigned __int8 v12 = 0;
LABEL_50:

  return v12;
}

- (BOOL)isUpdatedFromAsset:(id)a3
{
  id v4 = a3;
  if ([v4 fileSize] == self->_fileSize)
  {
    id v5 = [v4 updateDate];
    if (v5 == self->_updateDate)
    {
      BOOL v7 = [v4 generation] != self->_generation;
    }
    else
    {
      v6 = [v4 updateDate];
      if ([v6 isEqualToDate:self->_updateDate]) {
        BOOL v7 = [v4 generation] != self->_generation;
      }
      else {
        BOOL v7 = 1;
      }
    }
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (BOOL)isDifferentPath:(id)a3
{
  id v4 = a3;
  id v5 = [v4 url];
  if (v5 == self->_url)
  {
    unsigned __int8 v8 = 0;
LABEL_6:

    goto LABEL_7;
  }
  v6 = [v4 url];
  unsigned __int8 v7 = [v6 isEqual:self->_url];

  if ((v7 & 1) == 0)
  {
    id v5 = [(BKUbiquityAsset *)self url];
    v9 = [(NSURL *)v5 lastPathComponent];
    v10 = [v4 url];
    v11 = [v10 lastPathComponent];
    unsigned __int8 v8 = [v9 isEqualToString:v11];

    goto LABEL_6;
  }
  unsigned __int8 v8 = 0;
LABEL_7:

  return v8;
}

- (BOOL)isDifferentFilename:(id)a3
{
  id v4 = a3;
  id v5 = [(BKUbiquityAsset *)self url];
  v6 = [v5 lastPathComponent];
  unsigned __int8 v7 = [v4 url];

  unsigned __int8 v8 = [v7 lastPathComponent];
  char v9 = [v6 isEqualToString:v8] ^ 1;

  return v9;
}

- (void)setSupplementalContent:(BOOL)a3 playlistID:(id)a4 storeID:(id)a5
{
  BOOL v6 = a3;
  id v9 = a4;
  id v8 = a5;
  [(BKUbiquityAsset *)self setSupplementalContent:v6];
  if (v9) {
    [(BKUbiquityAsset *)self setStorePlaylistID:v9];
  }
  if (v8)
  {
    [(BKUbiquityAsset *)self setStoreID:v8];
    [(BKUbiquityAsset *)self setTemporaryAssetID:v8];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_new();
  if (v4)
  {
    id v5 = [(BKUbiquityAsset *)self assetID];
    id v6 = [v5 copy];
    [v4 setAssetID:v6];

    unsigned __int8 v7 = [(BKUbiquityAsset *)self temporaryAssetID];
    id v8 = [v7 copy];
    [v4 setTemporaryAssetID:v8];

    id v9 = [(BKUbiquityAsset *)self author];
    id v10 = [v9 copy];
    [v4 setAuthor:v10];

    v11 = [(BKUbiquityAsset *)self title];
    id v12 = [v11 copy];
    [v4 setTitle:v12];

    BOOL v13 = [(BKUbiquityAsset *)self url];
    id v14 = [v13 copy];
    [v4 setUrl:v14];

    [v4 setFileSize:[self fileSize]];
    v15 = [(BKUbiquityAsset *)self genre];
    id v16 = [v15 copy];
    [v4 setGenre:v16];

    [v4 setContentType:[self contentType]];
    [v4 setState:[self state]];
    id v17 = [(BKUbiquityAsset *)self dataSourceInsertionDate];
    id v18 = [v17 copy];
    [v4 setDataSourceInsertionDate:v18];

    uint64_t v19 = [(BKUbiquityAsset *)self purchaseDate];
    id v20 = [v19 copy];
    [v4 setPurchaseDate:v20];

    v21 = [(BKUbiquityAsset *)self updateDate];
    id v22 = [v21 copy];
    [v4 setUpdateDate:v22];

    v23 = [(BKUbiquityAsset *)self dataSourceIdentifier];
    id v24 = [v23 copy];
    [v4 setDataSourceIdentifier:v24];

    [v4 setGeneration:[self generation]];
    [v4 setSupplementalContent:[self isSupplementalContent]];
    v25 = [(BKUbiquityAsset *)self storeID];
    id v26 = [v25 copy];
    [v4 setStoreID:v26];

    v27 = [(BKUbiquityAsset *)self storePlaylistID];
    id v28 = [v27 copy];
    [v4 setStorePlaylistID:v28];
  }
  return v4;
}

+ (signed)p_assetContentTypeFromFileName:(id)a3
{
  id v3 = a3;
  id v4 = [v3 pathExtension];
  if ([v4 isEqualToString:@"icloud"])
  {
    uint64_t v5 = [v3 stringByDeletingPathExtension];

    id v3 = (id)v5;
  }
  signed __int16 v6 = (unsigned __int16)+[BKAssetUtilities contentTypeForPath:v3];

  return v6;
}

- (NSString)description
{
  return (NSString *)+[BKAssetUtilities descriptionForAsset:self];
}

- (NSString)accountID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAccountID:(id)a3
{
}

- (NSString)assetID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAssetID:(id)a3
{
}

- (NSString)storeID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setStoreID:(id)a3
{
}

- (NSString)storePlaylistID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setStorePlaylistID:(id)a3
{
}

- (NSString)temporaryAssetID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTemporaryAssetID:(id)a3
{
}

- (NSString)author
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAuthor:(id)a3
{
}

- (NSString)sortAuthor
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSortAuthor:(id)a3
{
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTitle:(id)a3
{
}

- (NSString)sortTitle
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSortTitle:(id)a3
{
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 96, 1);
}

- (void)setUrl:(id)a3
{
}

- (NSString)genre
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setGenre:(id)a3
{
}

- (NSString)dataSourceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setDataSourceIdentifier:(id)a3
{
}

- (BOOL)isSample
{
  return self->_sample;
}

- (void)setSample:(BOOL)a3
{
  self->_sample = a3;
}

- (BOOL)isProof
{
  return self->_proof;
}

- (void)setProof:(BOOL)a3
{
  self->_proof = a3;
}

- (BOOL)isCompressed
{
  return self->_compressed;
}

- (void)setCompressed:(BOOL)a3
{
  self->_compressed = a3;
}

- (BOOL)isLocked
{
  return self->_locked;
}

- (void)setLocked:(BOOL)a3
{
  self->_locked = a3;
}

- (BOOL)isSupplementalContent
{
  return self->_supplementalContent;
}

- (void)setSupplementalContent:(BOOL)a3
{
  self->_supplementalContent = a3;
}

- (int64_t)generation
{
  return self->_generation;
}

- (void)setGeneration:(int64_t)a3
{
  self->_generation = a3;
}

- (int64_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(int64_t)a3
{
  self->_fileSize = a3;
}

- (signed)contentType
{
  return self->_contentType;
}

- (void)setContentType:(signed __int16)a3
{
  self->_contentType = a3;
}

- (signed)state
{
  return self->_state;
}

- (void)setState:(signed __int16)a3
{
  self->_state = a3;
}

- (NSNumber)isExplicit
{
  return (NSNumber *)objc_getProperty(self, a2, 136, 1);
}

- (void)setIsExplicit:(id)a3
{
}

- (NSDate)dataSourceInsertionDate
{
  return (NSDate *)objc_getProperty(self, a2, 144, 1);
}

- (void)setDataSourceInsertionDate:(id)a3
{
}

- (NSDate)releaseDate
{
  return (NSDate *)objc_getProperty(self, a2, 152, 1);
}

- (void)setReleaseDate:(id)a3
{
}

- (NSDate)purchaseDate
{
  return (NSDate *)objc_getProperty(self, a2, 160, 1);
}

- (void)setPurchaseDate:(id)a3
{
}

- (NSDate)expectedDate
{
  return (NSDate *)objc_getProperty(self, a2, 168, 1);
}

- (void)setExpectedDate:(id)a3
{
}

- (NSDate)lastOpenDate
{
  return (NSDate *)objc_getProperty(self, a2, 176, 1);
}

- (void)setLastOpenDate:(id)a3
{
}

- (BOOL)shouldDisableOptimizeSpeed
{
  return self->_shouldDisableOptimizeSpeed;
}

- (void)setShouldDisableOptimizeSpeed:(BOOL)a3
{
  self->_shouldDisableOptimizeSpeed = a3;
}

- (BOOL)shouldDisableTouchEmulation
{
  return self->_shouldDisableTouchEmulation;
}

- (void)setShouldDisableTouchEmulation:(BOOL)a3
{
  self->_shouldDisableTouchEmulation = a3;
}

- (signed)desktopSupportLevel
{
  return self->_desktopSupportLevel;
}

- (void)setDesktopSupportLevel:(signed __int16)a3
{
  self->_desktopSupportLevel = a3;
}

- (NSString)scrollDirection
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setScrollDirection:(id)a3
{
}

- (NSString)pageProgressionDirection
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setPageProgressionDirection:(id)a3
{
}

- (int64_t)pageCount
{
  return self->_pageCount;
}

- (void)setPageCount:(int64_t)a3
{
  self->_pageCount = a3;
}

- (int64_t)rating
{
  return self->_rating;
}

- (void)setRating:(int64_t)a3
{
  self->_rating = a3;
}

- (NSDate)updateDate
{
  return (NSDate *)objc_getProperty(self, a2, 216, 1);
}

- (void)setUpdateDate:(id)a3
{
}

- (NSNumber)versionNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 224, 1);
}

- (void)setVersionNumber:(id)a3
{
}

- (NSString)versionNumberHumanReadable
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setVersionNumberHumanReadable:(id)a3
{
}

- (NSString)bookDescription
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setBookDescription:(id)a3
{
}

- (NSString)comments
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (void)setComments:(id)a3
{
}

- (NSString)kind
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (void)setKind:(id)a3
{
}

- (NSString)year
{
  return (NSString *)objc_getProperty(self, a2, 264, 1);
}

- (void)setYear:(id)a3
{
}

- (NSString)grouping
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (void)setGrouping:(id)a3
{
}

- (BOOL)computedRating
{
  return self->_computedRating;
}

- (void)setComputedRating:(BOOL)a3
{
  self->_computedRating = a3;
}

- (int64_t)metadataMigrationVersion
{
  return self->_metadataMigrationVersion;
}

- (void)setMetadataMigrationVersion:(int64_t)a3
{
  self->_metadataMigrationVersion = a3;
}

- (BOOL)isDevelopment
{
  return self->_development;
}

- (void)setDevelopment:(BOOL)a3
{
  self->_development = a3;
}

- (NSNumber)assetIsHidden
{
  return (NSNumber *)objc_getProperty(self, a2, 288, 1);
}

- (void)setAssetIsHidden:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetIsHidden, 0);
  objc_storeStrong((id *)&self->_grouping, 0);
  objc_storeStrong((id *)&self->_year, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_comments, 0);
  objc_storeStrong((id *)&self->_bookDescription, 0);
  objc_storeStrong((id *)&self->_versionNumberHumanReadable, 0);
  objc_storeStrong((id *)&self->_versionNumber, 0);
  objc_storeStrong((id *)&self->_updateDate, 0);
  objc_storeStrong((id *)&self->_pageProgressionDirection, 0);
  objc_storeStrong((id *)&self->_scrollDirection, 0);
  objc_storeStrong((id *)&self->_lastOpenDate, 0);
  objc_storeStrong((id *)&self->_expectedDate, 0);
  objc_storeStrong((id *)&self->_purchaseDate, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_dataSourceInsertionDate, 0);
  objc_storeStrong((id *)&self->_isExplicit, 0);
  objc_storeStrong((id *)&self->_dataSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_sortTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_sortAuthor, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_temporaryAssetID, 0);
  objc_storeStrong((id *)&self->_storePlaylistID, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_assetID, 0);

  objc_storeStrong((id *)&self->_accountID, 0);
}

@end