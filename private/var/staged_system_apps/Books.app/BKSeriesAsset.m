@interface BKSeriesAsset
- (BKSeriesAsset)initWithSeriesInfo:(id)a3 dataSourceIdentifier:(id)a4;
- (BOOL)computedRating;
- (BOOL)isCompressed;
- (BOOL)isDevelopment;
- (BOOL)isEphemeral;
- (BOOL)isLocked;
- (BOOL)isProof;
- (BOOL)isSample;
- (BOOL)shouldDisableOptimizeSpeed;
- (BOOL)shouldDisableTouchEmulation;
- (NSArray)authorNames;
- (NSArray)genres;
- (NSArray)narratorNames;
- (NSDate)dataSourceInsertionDate;
- (NSDate)expectedDate;
- (NSDate)lastOpenDate;
- (NSDate)purchaseDate;
- (NSDate)releaseDate;
- (NSDate)updateDate;
- (NSDecimalNumber)sequenceNumber;
- (NSNumber)authorCount;
- (NSNumber)coverAspectRatio;
- (NSNumber)hasTooManyAuthors;
- (NSNumber)hasTooManyNarrators;
- (NSNumber)isExplicit;
- (NSNumber)isStoreAudiobook;
- (NSNumber)narratorCount;
- (NSNumber)seriesIsCloudOnly;
- (NSNumber)seriesIsHidden;
- (NSNumber)seriesIsOrdered;
- (NSNumber)seriesSortKey;
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
- (NSString)mappedAssetID;
- (NSString)pageProgressionDirection;
- (NSString)scrollDirection;
- (NSString)sequenceDisplayName;
- (NSString)seriesID;
- (NSString)sortAuthor;
- (NSString)sortTitle;
- (NSString)storeID;
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
- (signed)mappedAssetContentType;
- (signed)state;
- (void)setAccountID:(id)a3;
- (void)setAssetID:(id)a3;
- (void)setAuthor:(id)a3;
- (void)setAuthorCount:(id)a3;
- (void)setAuthorNames:(id)a3;
- (void)setBookDescription:(id)a3;
- (void)setComments:(id)a3;
- (void)setCompressed:(BOOL)a3;
- (void)setComputedRating:(BOOL)a3;
- (void)setContentType:(signed __int16)a3;
- (void)setCoverAspectRatio:(id)a3;
- (void)setDataSourceIdentifier:(id)a3;
- (void)setDataSourceInsertionDate:(id)a3;
- (void)setDesktopSupportLevel:(signed __int16)a3;
- (void)setDevelopment:(BOOL)a3;
- (void)setExpectedDate:(id)a3;
- (void)setFileSize:(int64_t)a3;
- (void)setGeneration:(int64_t)a3;
- (void)setGenre:(id)a3;
- (void)setGenres:(id)a3;
- (void)setGrouping:(id)a3;
- (void)setHasTooManyAuthors:(id)a3;
- (void)setHasTooManyNarrators:(id)a3;
- (void)setIsExplicit:(id)a3;
- (void)setIsStoreAudiobook:(id)a3;
- (void)setKind:(id)a3;
- (void)setLastOpenDate:(id)a3;
- (void)setLocked:(BOOL)a3;
- (void)setMappedAssetContentType:(signed __int16)a3;
- (void)setMappedAssetID:(id)a3;
- (void)setNarratorCount:(id)a3;
- (void)setNarratorNames:(id)a3;
- (void)setPageCount:(int64_t)a3;
- (void)setPageProgressionDirection:(id)a3;
- (void)setProof:(BOOL)a3;
- (void)setPurchaseDate:(id)a3;
- (void)setRating:(int64_t)a3;
- (void)setReleaseDate:(id)a3;
- (void)setSample:(BOOL)a3;
- (void)setScrollDirection:(id)a3;
- (void)setSequenceDisplayName:(id)a3;
- (void)setSequenceNumber:(id)a3;
- (void)setSeriesID:(id)a3;
- (void)setSeriesIsCloudOnly:(id)a3;
- (void)setSeriesIsHidden:(id)a3;
- (void)setSeriesIsOrdered:(id)a3;
- (void)setSeriesSortKey:(id)a3;
- (void)setShouldDisableOptimizeSpeed:(BOOL)a3;
- (void)setShouldDisableTouchEmulation:(BOOL)a3;
- (void)setSortAuthor:(id)a3;
- (void)setSortTitle:(id)a3;
- (void)setState:(signed __int16)a3;
- (void)setStoreID:(id)a3;
- (void)setTemporaryAssetID:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUpdateDate:(id)a3;
- (void)setUrl:(id)a3;
- (void)setVersionNumber:(id)a3;
- (void)setVersionNumberHumanReadable:(id)a3;
- (void)setYear:(id)a3;
@end

@implementation BKSeriesAsset

- (BKSeriesAsset)initWithSeriesInfo:(id)a3 dataSourceIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v68.receiver = self;
  v68.super_class = (Class)BKSeriesAsset;
  v8 = [(BKSeriesAsset *)&v68 init];
  if (v8)
  {
    if (v6
      && ([v6 adamId],
          v9 = objc_claimAutoreleasedReturnValue(),
          id v10 = [v9 length],
          v9,
          v10))
    {
      uint64_t v11 = [v6 author];
      author = v8->_author;
      v8->_author = (NSString *)v11;

      uint64_t v13 = [v6 authorCount];
      authorCount = v8->_authorCount;
      v8->_authorCount = (NSNumber *)v13;

      uint64_t v15 = [v6 authorNames];
      authorNames = v8->_authorNames;
      v8->_authorNames = (NSArray *)v15;

      uint64_t v17 = [v6 sortAuthor];
      sortAuthor = v8->_sortAuthor;
      v8->_sortAuthor = (NSString *)v17;

      uint64_t v19 = [v6 hasTooManyAuthors];
      hasTooManyAuthors = v8->_hasTooManyAuthors;
      v8->_hasTooManyAuthors = (NSNumber *)v19;

      uint64_t v21 = [v6 narratorCount];
      narratorCount = v8->_narratorCount;
      v8->_narratorCount = (NSNumber *)v21;

      uint64_t v23 = [v6 narratorNames];
      narratorNames = v8->_narratorNames;
      v8->_narratorNames = (NSArray *)v23;

      uint64_t v25 = [v6 hasTooManyNarrators];
      hasTooManyNarrators = v8->_hasTooManyNarrators;
      v8->_hasTooManyNarrators = (NSNumber *)v25;

      uint64_t v27 = [v6 title];
      title = v8->_title;
      v8->_title = (NSString *)v27;

      uint64_t v29 = [v6 title];
      sortTitle = v8->_sortTitle;
      v8->_sortTitle = (NSString *)v29;

      uint64_t v31 = [v6 adamId];
      storeID = v8->_storeID;
      v8->_storeID = (NSString *)v31;

      uint64_t v33 = [v6 adamId];
      assetID = v8->_assetID;
      v8->_assetID = (NSString *)v33;

      uint64_t v35 = [v6 seriesId];
      seriesID = v8->_seriesID;
      v8->_seriesID = (NSString *)v35;

      uint64_t v37 = [v6 genre];
      genre = v8->_genre;
      v8->_genre = (NSString *)v37;

      uint64_t v39 = [v6 genres];
      genres = v8->_genres;
      v8->_genres = (NSArray *)v39;

      v41 = v8->_seriesID;
      if (v41 && [(NSString *)v41 length])
      {
        v8->_state = 5;
        uint64_t v42 = [v6 seriesIsOrdered];
        seriesIsOrdered = v8->_seriesIsOrdered;
        v8->_seriesIsOrdered = (NSNumber *)v42;
      }
      else
      {
        v8->_state = 6;
      }
      if (([v6 isContainer] & 1) != 0 || objc_msgSend(v6, "isExplicit"))
      {
        uint64_t v45 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 isExplicit]);
        isExplicit = v8->_isExplicit;
        v8->_isExplicit = (NSNumber *)v45;
      }
      if (([v6 isContainer] & 1) == 0)
      {
        uint64_t v47 = [v6 releaseDate];
        releaseDate = v8->_releaseDate;
        v8->_releaseDate = (NSDate *)v47;
      }
      uint64_t v49 = [v6 sequenceDisplayName];
      sequenceDisplayName = v8->_sequenceDisplayName;
      v8->_sequenceDisplayName = (NSString *)v49;

      uint64_t v51 = [v6 sequenceNumber];
      sequenceNumber = v8->_sequenceNumber;
      v8->_sequenceNumber = (NSDecimalNumber *)v51;

      uint64_t v53 = [v6 coverAspectRatio];
      coverAspectRatio = v8->_coverAspectRatio;
      v8->_coverAspectRatio = (NSNumber *)v53;

      if ([v6 isContainer])
      {
        __int16 v55 = 5;
      }
      else if ([v6 isAudiobook])
      {
        __int16 v55 = 6;
      }
      else
      {
        __int16 v55 = 1;
      }
      v8->_contentType = v55;
      uint64_t v56 = [v6 seriesSortKey];
      seriesSortKey = v8->_seriesSortKey;
      v8->_seriesSortKey = (NSNumber *)v56;

      if ([v6 isContainer]) {
        v58 = &__kCFBooleanFalse;
      }
      else {
        v58 = &__kCFBooleanTrue;
      }
      objc_storeStrong((id *)&v8->_seriesIsHidden, v58);
      objc_storeStrong((id *)&v8->_dataSourceIdentifier, a4);
      uint64_t v59 = +[NSDate date];
      lastOpenDate = v8->_lastOpenDate;
      v8->_lastOpenDate = (NSDate *)v59;

      uint64_t v61 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 isAudiobook]);
      isStoreAudiobook = v8->_isStoreAudiobook;
      v8->_isStoreAudiobook = (NSNumber *)v61;

      uint64_t v63 = [v6 url];
      url = v8->_url;
      v8->_url = (NSURL *)v63;

      uint64_t v65 = [v6 mappedItemId];
      mappedAssetID = v8->_mappedAssetID;
      v8->_mappedAssetID = (NSString *)v65;

      v44 = [v6 mappedItemTypeRaw];
      v8->_mappedAssetContentType = +[BKSeriesAssetHelper mappedAssetContentTypeFromRawItemType:v44];
    }
    else
    {
      v44 = v8;
      v8 = 0;
    }
  }
  return v8;
}

- (int64_t)metadataMigrationVersion
{
  return 0;
}

- (BOOL)isEphemeral
{
  return 0;
}

- (NSString)description
{
  unsigned int v3 = [(BKSeriesAsset *)self contentType];
  CFStringRef v4 = &stru_100A70340;
  if (v3 == 5) {
    CFStringRef v4 = @" (container)";
  }
  CFStringRef v16 = v4;
  uint64_t v15 = [(BKSeriesAsset *)self assetID];
  v18 = [(BKSeriesAsset *)self seriesID];
  uint64_t v17 = [(BKSeriesAsset *)self storeID];
  v5 = [(BKSeriesAsset *)self title];
  id v6 = [(BKSeriesAsset *)self author];
  id v7 = [(BKSeriesAsset *)self sortAuthor];
  v8 = [(BKSeriesAsset *)self sequenceDisplayName];
  v9 = [(BKSeriesAsset *)self seriesIsHidden];
  id v10 = +[NSNumber numberWithShort:[(BKSeriesAsset *)self contentType]];
  uint64_t v11 = [(BKSeriesAsset *)self isStoreAudiobook];
  v12 = +[NSNumber numberWithShort:[(BKSeriesAsset *)self state]];
  uint64_t v13 = +[NSString stringWithFormat:@"<BKSeriesAsset%@ %p>\r  assetID: %@\r  seriesID: %@\r  storeID: %@\r  title: %@\r  author: %@\r  sortAuthor: %@\r sequenceDisplayName: %@\r  seriesIsHidden: %@\r  contentType: %@\r  isStoreAudiobook: %@\r  state: %@", v16, self, v15, v18, v17, v5, v6, v7, v8, v9, v10, v11, v12];

  return (NSString *)v13;
}

- (NSNumber)seriesIsHidden
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSeriesIsHidden:(id)a3
{
}

- (NSNumber)seriesIsCloudOnly
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSeriesIsCloudOnly:(id)a3
{
}

- (NSNumber)isStoreAudiobook
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIsStoreAudiobook:(id)a3
{
}

- (NSString)accountID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAccountID:(id)a3
{
}

- (NSString)assetID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAssetID:(id)a3
{
}

- (NSString)storeID
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setStoreID:(id)a3
{
}

- (NSString)temporaryAssetID
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTemporaryAssetID:(id)a3
{
}

- (NSString)author
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAuthor:(id)a3
{
}

- (NSNumber)authorCount
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAuthorCount:(id)a3
{
}

- (NSArray)authorNames
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAuthorNames:(id)a3
{
}

- (NSNumber)hasTooManyAuthors
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setHasTooManyAuthors:(id)a3
{
}

- (NSNumber)narratorCount
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setNarratorCount:(id)a3
{
}

- (NSArray)narratorNames
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setNarratorNames:(id)a3
{
}

- (NSNumber)hasTooManyNarrators
{
  return (NSNumber *)objc_getProperty(self, a2, 128, 1);
}

- (void)setHasTooManyNarrators:(id)a3
{
}

- (NSString)sortAuthor
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setSortAuthor:(id)a3
{
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setTitle:(id)a3
{
}

- (NSString)sortTitle
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setSortTitle:(id)a3
{
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 160, 1);
}

- (void)setUrl:(id)a3
{
}

- (NSString)genre
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setGenre:(id)a3
{
}

- (NSArray)genres
{
  return (NSArray *)objc_getProperty(self, a2, 176, 1);
}

- (void)setGenres:(id)a3
{
}

- (NSString)dataSourceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
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
  return (NSNumber *)objc_getProperty(self, a2, 208, 1);
}

- (void)setIsExplicit:(id)a3
{
}

- (NSDate)dataSourceInsertionDate
{
  return (NSDate *)objc_getProperty(self, a2, 216, 1);
}

- (void)setDataSourceInsertionDate:(id)a3
{
}

- (NSDate)releaseDate
{
  return (NSDate *)objc_getProperty(self, a2, 224, 1);
}

- (void)setReleaseDate:(id)a3
{
}

- (NSDate)purchaseDate
{
  return (NSDate *)objc_getProperty(self, a2, 232, 1);
}

- (void)setPurchaseDate:(id)a3
{
}

- (NSDate)expectedDate
{
  return (NSDate *)objc_getProperty(self, a2, 240, 1);
}

- (void)setExpectedDate:(id)a3
{
}

- (NSDate)lastOpenDate
{
  return (NSDate *)objc_getProperty(self, a2, 248, 1);
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
  return (NSDate *)objc_getProperty(self, a2, 272, 1);
}

- (void)setUpdateDate:(id)a3
{
}

- (NSNumber)versionNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 280, 1);
}

- (void)setVersionNumber:(id)a3
{
}

- (NSString)versionNumberHumanReadable
{
  return (NSString *)objc_getProperty(self, a2, 288, 1);
}

- (void)setVersionNumberHumanReadable:(id)a3
{
}

- (NSString)bookDescription
{
  return (NSString *)objc_getProperty(self, a2, 296, 1);
}

- (void)setBookDescription:(id)a3
{
}

- (NSString)comments
{
  return (NSString *)objc_getProperty(self, a2, 304, 1);
}

- (void)setComments:(id)a3
{
}

- (NSString)kind
{
  return (NSString *)objc_getProperty(self, a2, 312, 1);
}

- (void)setKind:(id)a3
{
}

- (NSString)year
{
  return (NSString *)objc_getProperty(self, a2, 320, 1);
}

- (void)setYear:(id)a3
{
}

- (NSString)grouping
{
  return (NSString *)objc_getProperty(self, a2, 328, 1);
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

- (NSString)scrollDirection
{
  return (NSString *)objc_getProperty(self, a2, 336, 1);
}

- (void)setScrollDirection:(id)a3
{
}

- (NSString)sequenceDisplayName
{
  return (NSString *)objc_getProperty(self, a2, 344, 1);
}

- (void)setSequenceDisplayName:(id)a3
{
}

- (NSDecimalNumber)sequenceNumber
{
  return (NSDecimalNumber *)objc_getProperty(self, a2, 352, 1);
}

- (void)setSequenceNumber:(id)a3
{
}

- (NSNumber)coverAspectRatio
{
  return (NSNumber *)objc_getProperty(self, a2, 360, 1);
}

- (void)setCoverAspectRatio:(id)a3
{
}

- (NSString)seriesID
{
  return (NSString *)objc_getProperty(self, a2, 368, 1);
}

- (void)setSeriesID:(id)a3
{
}

- (NSNumber)seriesIsOrdered
{
  return (NSNumber *)objc_getProperty(self, a2, 376, 1);
}

- (void)setSeriesIsOrdered:(id)a3
{
}

- (NSNumber)seriesSortKey
{
  return (NSNumber *)objc_getProperty(self, a2, 384, 1);
}

- (void)setSeriesSortKey:(id)a3
{
}

- (NSString)pageProgressionDirection
{
  return (NSString *)objc_getProperty(self, a2, 392, 1);
}

- (void)setPageProgressionDirection:(id)a3
{
}

- (BOOL)isDevelopment
{
  return self->_development;
}

- (void)setDevelopment:(BOOL)a3
{
  self->_development = a3;
}

- (NSString)mappedAssetID
{
  return self->_mappedAssetID;
}

- (void)setMappedAssetID:(id)a3
{
}

- (signed)mappedAssetContentType
{
  return self->_mappedAssetContentType;
}

- (void)setMappedAssetContentType:(signed __int16)a3
{
  self->_mappedAssetContentType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mappedAssetID, 0);
  objc_storeStrong((id *)&self->_pageProgressionDirection, 0);
  objc_storeStrong((id *)&self->_seriesSortKey, 0);
  objc_storeStrong((id *)&self->_seriesIsOrdered, 0);
  objc_storeStrong((id *)&self->_seriesID, 0);
  objc_storeStrong((id *)&self->_coverAspectRatio, 0);
  objc_storeStrong((id *)&self->_sequenceNumber, 0);
  objc_storeStrong((id *)&self->_sequenceDisplayName, 0);
  objc_storeStrong((id *)&self->_scrollDirection, 0);
  objc_storeStrong((id *)&self->_grouping, 0);
  objc_storeStrong((id *)&self->_year, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_comments, 0);
  objc_storeStrong((id *)&self->_bookDescription, 0);
  objc_storeStrong((id *)&self->_versionNumberHumanReadable, 0);
  objc_storeStrong((id *)&self->_versionNumber, 0);
  objc_storeStrong((id *)&self->_updateDate, 0);
  objc_storeStrong((id *)&self->_lastOpenDate, 0);
  objc_storeStrong((id *)&self->_expectedDate, 0);
  objc_storeStrong((id *)&self->_purchaseDate, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_dataSourceInsertionDate, 0);
  objc_storeStrong((id *)&self->_isExplicit, 0);
  objc_storeStrong((id *)&self->_dataSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_genres, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_sortTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_sortAuthor, 0);
  objc_storeStrong((id *)&self->_hasTooManyNarrators, 0);
  objc_storeStrong((id *)&self->_narratorNames, 0);
  objc_storeStrong((id *)&self->_narratorCount, 0);
  objc_storeStrong((id *)&self->_hasTooManyAuthors, 0);
  objc_storeStrong((id *)&self->_authorNames, 0);
  objc_storeStrong((id *)&self->_authorCount, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_temporaryAssetID, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_isStoreAudiobook, 0);
  objc_storeStrong((id *)&self->_seriesIsCloudOnly, 0);

  objc_storeStrong((id *)&self->_seriesIsHidden, 0);
}

@end