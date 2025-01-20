@interface BKJaliscoAsset
+ (id)newAssetFromServerItem:(id)a3 dataSourceIdentifier:(id)a4;
+ (id)newAssetWithStoreID:(id)a3 dataSourceIdentifier:(id)a4;
- (BOOL)computedRating;
- (BOOL)isCompressed;
- (BOOL)isDevelopment;
- (BOOL)isEphemeral;
- (BOOL)isLocked;
- (BOOL)isProof;
- (BOOL)isSample;
- (BOOL)isSupplementalContent;
- (BOOL)shouldDisableOptimizeSpeed;
- (BOOL)shouldDisableTouchEmulation;
- (NSDate)dataSourceInsertionDate;
- (NSDate)expectedDate;
- (NSDate)lastOpenDate;
- (NSDate)purchaseDate;
- (NSDate)releaseDate;
- (NSDate)updateDate;
- (NSNumber)duration;
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
- (int64_t)fileSize;
- (int64_t)generation;
- (int64_t)metadataMigrationVersion;
- (int64_t)pageCount;
- (int64_t)rating;
- (signed)contentType;
- (signed)desktopSupportLevel;
- (signed)state;
- (void)setAccountID:(id)a3;
- (void)setAssetID:(id)a3;
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
- (void)setDuration:(id)a3;
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
- (void)setTemporaryAssetID:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUpdateDate:(id)a3;
- (void)setUrl:(id)a3;
- (void)setVersionNumber:(id)a3;
- (void)setVersionNumberHumanReadable:(id)a3;
- (void)setYear:(id)a3;
@end

@implementation BKJaliscoAsset

+ (id)newAssetFromServerItem:(id)a3 dataSourceIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(BKJaliscoAsset);
  v8 = [v5 isAudiobook];
  unsigned int v9 = [v8 BOOLValue];

  [(BKJaliscoAsset *)v7 setAccountID:0];
  v10 = [v5 storeID];
  [(BKJaliscoAsset *)v7 setAssetID:v10];

  v11 = [v5 storeID];
  [(BKJaliscoAsset *)v7 setStoreID:v11];

  v12 = [v5 artist];
  [(BKJaliscoAsset *)v7 setAuthor:v12];

  v13 = [v5 title];
  [(BKJaliscoAsset *)v7 setTitle:v13];

  v14 = [v5 sortedTitle];
  [(BKJaliscoAsset *)v7 setSortTitle:v14];

  v15 = [v5 sortedAuthor];
  [(BKJaliscoAsset *)v7 setSortAuthor:v15];

  v16 = [v5 storeID];
  v17 = +[NSString stringWithFormat:@"%@://book/%@", @"ibooks-purchases", v16];
  v18 = +[NSURL URLWithString:v17];
  [(BKJaliscoAsset *)v7 setUrl:v18];

  v19 = [v5 genre];
  [(BKJaliscoAsset *)v7 setGenre:v19];

  [(BKJaliscoAsset *)v7 setDataSourceIdentifier:v6];
  [(BKJaliscoAsset *)v7 setSample:0];
  [(BKJaliscoAsset *)v7 setProof:0];
  [(BKJaliscoAsset *)v7 setCompressed:0];
  [(BKJaliscoAsset *)v7 setLocked:0];
  [(BKJaliscoAsset *)v7 setGeneration:0x7FFFFFFFFFFFFFFFLL];
  [(BKJaliscoAsset *)v7 setFileSize:0];
  if (v9) {
    uint64_t v20 = 6;
  }
  else {
    uint64_t v20 = 1;
  }
  [(BKJaliscoAsset *)v7 setContentType:v20];
  [(BKJaliscoAsset *)v7 setState:3];
  v21 = [v5 isExplicit];
  [(BKJaliscoAsset *)v7 setIsExplicit:v21];

  v22 = [v5 purchasedAt];
  [(BKJaliscoAsset *)v7 setDataSourceInsertionDate:v22];

  [(BKJaliscoAsset *)v7 setReleaseDate:0];
  v23 = [v5 purchasedAt];
  [(BKJaliscoAsset *)v7 setPurchaseDate:v23];

  v24 = [v5 expectedDate];
  [(BKJaliscoAsset *)v7 setExpectedDate:v24];

  [(BKJaliscoAsset *)v7 setShouldDisableOptimizeSpeed:0];
  [(BKJaliscoAsset *)v7 setShouldDisableTouchEmulation:0];
  [(BKJaliscoAsset *)v7 setDesktopSupportLevel:0];
  [(BKJaliscoAsset *)v7 setPageProgressionDirection:0];
  [(BKJaliscoAsset *)v7 setPageCount:0];
  [(BKJaliscoAsset *)v7 setRating:0];
  [(BKJaliscoAsset *)v7 setUpdateDate:0];
  [(BKJaliscoAsset *)v7 setVersionNumber:0];
  [(BKJaliscoAsset *)v7 setKind:0];
  [(BKJaliscoAsset *)v7 setYear:0];
  [(BKJaliscoAsset *)v7 setGrouping:0];
  [(BKJaliscoAsset *)v7 setComputedRating:0];
  [(BKJaliscoAsset *)v7 setMetadataMigrationVersion:0];
  if (v9)
  {
    objc_opt_class();
    v25 = [v5 additionalAudiobookInfo];
    v26 = [v25 objectForKeyedSubscript:@"daap.songtime"];
    v27 = BUDynamicCast();

    if (!v27)
    {
      v28 = BKLibraryDataSourceJaliscoLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_1007EDCB4(v7, v28);
      }
    }
    [v27 doubleValue];
    v30 = +[NSNumber numberWithDouble:v29 / 1000.0];
    [(BKJaliscoAsset *)v7 setDuration:v30];
  }
  return v7;
}

+ (id)newAssetWithStoreID:(id)a3 dataSourceIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(BKJaliscoAsset);
  [(BKJaliscoAsset *)v7 setAccountID:0];
  [(BKJaliscoAsset *)v7 setAssetID:v6];
  [(BKJaliscoAsset *)v7 setStoreID:v6];

  [(BKJaliscoAsset *)v7 setAuthor:0];
  [(BKJaliscoAsset *)v7 setTitle:0];
  [(BKJaliscoAsset *)v7 setSortTitle:0];
  [(BKJaliscoAsset *)v7 setUrl:0];
  [(BKJaliscoAsset *)v7 setGenre:0];
  [(BKJaliscoAsset *)v7 setDataSourceIdentifier:v5];

  [(BKJaliscoAsset *)v7 setSample:0];
  [(BKJaliscoAsset *)v7 setProof:0];
  [(BKJaliscoAsset *)v7 setCompressed:0];
  [(BKJaliscoAsset *)v7 setLocked:0];
  [(BKJaliscoAsset *)v7 setGeneration:0x7FFFFFFFFFFFFFFFLL];
  [(BKJaliscoAsset *)v7 setFileSize:0];
  [(BKJaliscoAsset *)v7 setContentType:0];
  [(BKJaliscoAsset *)v7 setState:0];
  [(BKJaliscoAsset *)v7 setIsExplicit:0];
  [(BKJaliscoAsset *)v7 setDataSourceInsertionDate:0];
  [(BKJaliscoAsset *)v7 setReleaseDate:0];
  [(BKJaliscoAsset *)v7 setPurchaseDate:0];
  [(BKJaliscoAsset *)v7 setExpectedDate:0];
  [(BKJaliscoAsset *)v7 setShouldDisableOptimizeSpeed:0];
  [(BKJaliscoAsset *)v7 setShouldDisableTouchEmulation:0];
  [(BKJaliscoAsset *)v7 setDesktopSupportLevel:0];
  [(BKJaliscoAsset *)v7 setPageProgressionDirection:0];
  [(BKJaliscoAsset *)v7 setPageCount:0];
  [(BKJaliscoAsset *)v7 setRating:0];
  [(BKJaliscoAsset *)v7 setUpdateDate:0];
  [(BKJaliscoAsset *)v7 setVersionNumber:0];
  [(BKJaliscoAsset *)v7 setKind:0];
  [(BKJaliscoAsset *)v7 setYear:0];
  [(BKJaliscoAsset *)v7 setGrouping:0];
  [(BKJaliscoAsset *)v7 setComputedRating:0];
  [(BKJaliscoAsset *)v7 setMetadataMigrationVersion:0];
  return v7;
}

- (BOOL)isEphemeral
{
  return 0;
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

- (NSNumber)duration
{
  return (NSNumber *)objc_getProperty(self, a2, 288, 1);
}

- (void)setDuration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duration, 0);
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