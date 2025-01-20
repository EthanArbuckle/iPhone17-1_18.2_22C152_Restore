@interface BKMediaLibraryAsset
+ (id)newAssetFromRepresentativeMediaItem:(id)a3 withDataSourceIdentifier:(id)a4;
- (BKMediaLibraryAsset)initWithRepresentativeMediaItem:(id)a3 assetID:(id)a4 dataSourceIdentifier:(id)a5;
- (BOOL)cloudAsset;
- (BOOL)computedRating;
- (BOOL)hasBeenPlayed;
- (BOOL)isCloudAsset;
- (BOOL)isCompressed;
- (BOOL)isDevelopment;
- (BOOL)isEphemeral;
- (BOOL)isLocked;
- (BOOL)isProof;
- (BOOL)isSample;
- (BOOL)shouldDisableOptimizeSpeed;
- (BOOL)shouldDisableTouchEmulation;
- (MPMediaItem)representativeItem;
- (MPMediaItemCollection)collection;
- (NSDate)dataSourceInsertionDate;
- (NSDate)expectedDate;
- (NSDate)lastOpenDate;
- (NSDate)purchaseDate;
- (NSDate)releaseDate;
- (NSDate)updateDate;
- (NSDictionary)options;
- (NSNumber)cloudReadPercent;
- (NSNumber)hasRACSupport;
- (NSNumber)isExplicit;
- (NSNumber)isStoreAudiobook;
- (NSNumber)localReadPercent;
- (NSNumber)readPercent;
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
- (NSString)scrollDirection;
- (NSString)sortAuthor;
- (NSString)sortTitle;
- (NSString)storeID;
- (NSString)storeRedownloadParameters;
- (NSString)temporaryAssetID;
- (NSString)title;
- (NSString)versionNumberHumanReadable;
- (NSString)year;
- (NSURL)assetURL;
- (NSURL)url;
- (double)clampedBookmarkTime:(double)a3 duration:(double)a4;
- (id)localAndCloudCollection;
- (id)pageProgressionDirection;
- (int64_t)fileSize;
- (int64_t)generation;
- (int64_t)metadataMigrationVersion;
- (int64_t)pageCount;
- (int64_t)rating;
- (signed)contentType;
- (signed)desktopSupportLevel;
- (signed)state;
- (void)setAssetID:(id)a3;
- (void)setCloudAsset:(BOOL)a3;
- (void)setDataSourceIdentifier:(id)a3;
- (void)setDataSourceInsertionDate:(id)a3;
- (void)setHasRACSupport:(id)a3;
- (void)setRepresentativeItem:(id)a3;
@end

@implementation BKMediaLibraryAsset

+ (id)newAssetFromRepresentativeMediaItem:(id)a3 withDataSourceIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 bk_assetID];
  if ([v7 length]) {
    v8 = [[BKMediaLibraryAsset alloc] initWithRepresentativeMediaItem:v5 assetID:v7 dataSourceIdentifier:v6];
  }
  else {
    v8 = 0;
  }

  return v8;
}

- (BKMediaLibraryAsset)initWithRepresentativeMediaItem:(id)a3 assetID:(id)a4 dataSourceIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)BKMediaLibraryAsset;
  v12 = [(BKMediaLibraryAsset *)&v23 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_representativeItem, a3);
    objc_storeStrong((id *)&v13->_assetID, a4);
    objc_storeStrong((id *)&v13->_dataSourceIdentifier, a5);
    uint64_t v14 = [(MPMediaItem *)v13->_representativeItem releaseDate];
    dataSourceInsertionDate = v13->_dataSourceInsertionDate;
    v13->_dataSourceInsertionDate = (NSDate *)v14;

    unsigned __int8 v16 = [(MPMediaItem *)v13->_representativeItem bk_isJaliscoAsset];
    v13->_cloudAsset = v16;
    if ((v16 & 1) == 0)
    {
      v17 = [v9 bk_storePlaylistID];
      if (v17)
      {
        id v18 = objc_alloc_init((Class)BLMetadataStore);
        id v19 = [v17 longLongValue];
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_10015B6B8;
        v21[3] = &unk_100A48878;
        v22 = v13;
        [v18 racGUIDForStoreID:v19 result:v21];
      }
    }
  }

  return v13;
}

- (MPMediaItemCollection)collection
{
  v3 = +[MPMediaQuery bk_audiobooksQuery];
  objc_opt_class();
  v4 = [(BKMediaLibraryAsset *)self representativeItem];
  id v5 = [v4 valueForProperty:MPMediaItemPropertyAlbumPersistentID];
  id v6 = BUDynamicCast();

  if (v6)
  {
    v7 = +[MPMediaPropertyPredicate predicateWithValue:v6 forProperty:MPMediaItemPropertyAlbumPersistentID];
    [v3 addFilterPredicate:v7];

    if ([(BKMediaLibraryAsset *)self isCloudAsset])
    {
      [v3 setIgnoreSystemFilterPredicates:1];
      +[MPMediaPropertyPredicate predicateWithValue:&off_100A82D98 forProperty:MPMediaItemPropertyPurchaseHistoryID comparisonType:100];
    }
    else
    {
      +[MPMediaPropertyPredicate predicateWithValue:&off_100A82D98 forProperty:MPMediaItemPropertyPurchaseHistoryID];
    id v9 = };
    [v3 addFilterPredicate:v9];

    id v10 = [v3 collections];
    v8 = [v10 firstObject];
  }
  else
  {
    v8 = 0;
  }

  return (MPMediaItemCollection *)v8;
}

- (id)localAndCloudCollection
{
  v3 = +[MPMediaQuery bk_audiobooksQuery];
  objc_opt_class();
  v4 = [(BKMediaLibraryAsset *)self representativeItem];
  id v5 = [v4 valueForProperty:MPMediaItemPropertyAlbumPersistentID];
  id v6 = BUDynamicCast();

  if (v6)
  {
    [v3 setIgnoreSystemFilterPredicates:1];
    v7 = +[MPMediaPropertyPredicate predicateWithValue:v6 forProperty:MPMediaItemPropertyAlbumPersistentID];
    [v3 addFilterPredicate:v7];

    v8 = [v3 collections];
    id v9 = [v8 firstObject];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (double)clampedBookmarkTime:(double)a3 duration:(double)a4
{
  if (a3 <= a4)
  {
    if (a3 < 0.0) {
      return 0.0;
    }
    else {
      return a3;
    }
  }
  else
  {
    double v5 = a4;
    v7 = BKLibraryDataSourceMediaLibraryLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v9 = [(BKMediaLibraryAsset *)self title];
      id v10 = [(BKMediaLibraryAsset *)self author];
      int v11 = 134218754;
      double v12 = a3;
      __int16 v13 = 2112;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      unsigned __int8 v16 = v10;
      __int16 v17 = 2048;
      double v18 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "bookmark time %lf for asset \"%@\" by \"%@\" is greater than duration %lf", (uint8_t *)&v11, 0x2Au);
    }
  }
  return v5;
}

- (NSNumber)localReadPercent
{
  v3 = [(BKMediaLibraryAsset *)self collection];
  [v3 bk_localBookmarkTime];
  double v5 = v4;
  [v3 bk_localDuration];
  double v7 = v6;
  [(BKMediaLibraryAsset *)self clampedBookmarkTime:v5 duration:v6];
  if (v7 <= 0.0)
  {
    id v9 = 0;
  }
  else
  {
    id v9 = +[NSNumber numberWithDouble:v8 / v7];
  }

  return (NSNumber *)v9;
}

- (NSNumber)cloudReadPercent
{
  v3 = [(BKMediaLibraryAsset *)self collection];
  [v3 bk_cloudBookmarkTime];
  double v5 = v4;
  [v3 bk_cloudDuration];
  double v7 = v6;
  [(BKMediaLibraryAsset *)self clampedBookmarkTime:v5 duration:v6];
  if (v7 <= 0.0)
  {
    id v9 = 0;
  }
  else
  {
    id v9 = +[NSNumber numberWithDouble:v8 / v7];
  }

  return (NSNumber *)v9;
}

- (NSNumber)readPercent
{
  v2 = [(BKMediaLibraryAsset *)self localAndCloudCollection];
  v3 = [v2 bk_mostRecentListeningProgress];

  return (NSNumber *)v3;
}

- (BOOL)hasBeenPlayed
{
  v3 = [(BKMediaLibraryAsset *)self collection];
  if ([(BKMediaLibraryAsset *)self isCloudAsset]) {
    unsigned __int8 v4 = [v3 bk_cloudHasBeenPlayed];
  }
  else {
    unsigned __int8 v4 = [v3 bk_localHasBeenPlayed];
  }
  BOOL v5 = v4;

  return v5;
}

- (NSString)accountID
{
  v2 = [(BKMediaLibraryAsset *)self representativeItem];
  v3 = [v2 valueForProperty:MPMediaItemPropertyStoreAccountID];

  if ([v3 longLongValue])
  {
    unsigned __int8 v4 = [v3 stringValue];
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)storeID
{
  v2 = [(BKMediaLibraryAsset *)self representativeItem];
  v3 = [v2 bk_storeID];
  unsigned __int8 v4 = [v3 stringValue];

  return (NSString *)v4;
}

- (NSString)storeRedownloadParameters
{
  v2 = [(BKMediaLibraryAsset *)self representativeItem];
  v3 = [v2 bk_storeRedownloadParameters];

  return (NSString *)v3;
}

- (NSString)temporaryAssetID
{
  return 0;
}

- (NSString)author
{
  v2 = [(BKMediaLibraryAsset *)self representativeItem];
  v3 = [v2 effectiveAlbumArtist];

  return (NSString *)v3;
}

- (NSString)sortAuthor
{
  v3 = [(BKMediaLibraryAsset *)self representativeItem];
  unsigned __int8 v4 = [v3 valueForProperty:MPMediaItemPropertySortAlbumArtist];

  if (![v4 length])
  {
    BOOL v5 = [(BKMediaLibraryAsset *)self representativeItem];
    uint64_t v6 = [v5 valueForProperty:MPMediaItemPropertySortArtist];

    unsigned __int8 v4 = (void *)v6;
  }

  return (NSString *)v4;
}

- (NSString)title
{
  v3 = [(BKMediaLibraryAsset *)self representativeItem];
  unsigned __int8 v4 = [v3 valueForProperty:MPMediaItemPropertyAlbumTitle];

  BOOL v5 = [(BKMediaLibraryAsset *)self representativeItem];
  uint64_t v6 = [v5 valueForProperty:MPMediaItemPropertyPurchaseHistoryID];

  if (![v4 length] && objc_msgSend(v6, "longLongValue"))
  {
    double v7 = [(BKMediaLibraryAsset *)self representativeItem];
    uint64_t v8 = [v7 valueForProperty:MPMediaItemPropertyTitle];

    unsigned __int8 v4 = (void *)v8;
  }

  return (NSString *)v4;
}

- (NSString)sortTitle
{
  v3 = [(BKMediaLibraryAsset *)self representativeItem];
  unsigned __int8 v4 = [v3 valueForProperty:MPMediaItemPropertySortAlbumTitle];

  if (![v4 length])
  {
    BOOL v5 = [(BKMediaLibraryAsset *)self representativeItem];
    uint64_t v6 = [v5 valueForProperty:MPMediaItemPropertySortTitle];

    unsigned __int8 v4 = (void *)v6;
  }
  if (![v4 length])
  {
    uint64_t v7 = [(BKMediaLibraryAsset *)self title];

    unsigned __int8 v4 = (void *)v7;
  }

  return (NSString *)v4;
}

- (NSURL)url
{
  v3 = [(BKMediaLibraryAsset *)self title];
  unsigned __int8 v4 = +[MPMediaItem bk_audioBookAssetURLWithAlbumTitle:v3 isCloudItem:[(BKMediaLibraryAsset *)self isCloudAsset]];

  return (NSURL *)v4;
}

- (NSString)genre
{
  v2 = [(BKMediaLibraryAsset *)self representativeItem];
  v3 = [v2 valueForProperty:MPMediaItemPropertyGenre];

  return (NSString *)v3;
}

- (BOOL)isSample
{
  return 0;
}

- (BOOL)isProof
{
  return 0;
}

- (BOOL)isCompressed
{
  return 0;
}

- (BOOL)isLocked
{
  return 0;
}

- (int64_t)generation
{
  return 1;
}

- (int64_t)fileSize
{
  v2 = [(BKMediaLibraryAsset *)self representativeItem];
  v3 = [v2 valueForProperty:MPMediaItemPropertyFileSize];
  id v4 = [v3 longLongValue];

  return (int64_t)v4;
}

- (signed)contentType
{
  return 6;
}

- (BOOL)isCloudAsset
{
  return [(BKMediaLibraryAsset *)self cloudAsset];
}

- (signed)state
{
  if ([(BKMediaLibraryAsset *)self isCloudAsset]) {
    return 3;
  }
  else {
    return 1;
  }
}

- (BOOL)isEphemeral
{
  return 0;
}

- (BOOL)isDevelopment
{
  return 0;
}

- (NSNumber)isExplicit
{
  v2 = [(BKMediaLibraryAsset *)self representativeItem];
  v3 = [v2 valueForProperty:MPMediaItemPropertyIsExplicit];

  return (NSNumber *)v3;
}

- (NSDate)releaseDate
{
  v2 = [(BKMediaLibraryAsset *)self representativeItem];
  v3 = [v2 valueForProperty:MPMediaItemPropertyReleaseDate];

  objc_opt_class();
  id v4 = BUDynamicCast();

  return (NSDate *)v4;
}

- (NSDate)purchaseDate
{
  v2 = [(BKMediaLibraryAsset *)self representativeItem];
  v3 = [v2 valueForProperty:MPMediaItemPropertyStoreDatePurchased];

  objc_opt_class();
  id v4 = BUDynamicCast();

  return (NSDate *)v4;
}

- (NSDate)expectedDate
{
  v3 = [(BKMediaLibraryAsset *)self representativeItem];
  unsigned int v4 = [v3 isPreorder];

  if (v4)
  {
    BOOL v5 = [(BKMediaLibraryAsset *)self releaseDate];
  }
  else
  {
    BOOL v5 = 0;
  }

  return (NSDate *)v5;
}

- (NSDate)lastOpenDate
{
  return 0;
}

- (BOOL)shouldDisableOptimizeSpeed
{
  return 0;
}

- (BOOL)shouldDisableTouchEmulation
{
  return 0;
}

- (signed)desktopSupportLevel
{
  return 0;
}

- (NSString)scrollDirection
{
  return 0;
}

- (id)pageProgressionDirection
{
  return 0;
}

- (int64_t)pageCount
{
  return 0;
}

- (int64_t)rating
{
  v2 = [(BKMediaLibraryAsset *)self representativeItem];
  v3 = [v2 valueForProperty:MPMediaItemPropertyRating];
  id v4 = [v3 longLongValue];

  return (int64_t)v4;
}

- (NSDate)updateDate
{
  return 0;
}

- (NSNumber)versionNumber
{
  return 0;
}

- (NSString)versionNumberHumanReadable
{
  return 0;
}

- (NSString)bookDescription
{
  v3 = [(BKMediaLibraryAsset *)self representativeItem];
  id v4 = [v3 valueForProperty:MPMediaItemPropertyShortDescriptionInfo];

  if (![v4 length])
  {
    BOOL v5 = [(BKMediaLibraryAsset *)self representativeItem];
    uint64_t v6 = [v5 valueForProperty:MPMediaItemPropertyDescriptionInfo];

    id v4 = (void *)v6;
  }

  return (NSString *)v4;
}

- (NSString)comments
{
  v2 = [(BKMediaLibraryAsset *)self representativeItem];
  v3 = [v2 valueForProperty:MPMediaItemPropertyComments];

  return (NSString *)v3;
}

- (NSString)kind
{
  return 0;
}

- (NSString)year
{
  return 0;
}

- (NSString)grouping
{
  return 0;
}

- (BOOL)computedRating
{
  return 0;
}

- (int64_t)metadataMigrationVersion
{
  return 0;
}

- (NSURL)assetURL
{
  return 0;
}

- (NSNumber)isStoreAudiobook
{
  return (NSNumber *)&__kCFBooleanFalse;
}

- (NSDictionary)options
{
  v3 = [(BKMediaLibraryAsset *)self storeID];
  if (v3)
  {
    CFStringRef v7 = @"storeID";
    id v4 = [(BKMediaLibraryAsset *)self storeID];
    uint64_t v8 = v4;
    BOOL v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  }
  else
  {
    BOOL v5 = 0;
  }

  return (NSDictionary *)v5;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  if ([(BKMediaLibraryAsset *)self isCloudAsset]) {
    CFStringRef v5 = @"Y";
  }
  else {
    CFStringRef v5 = @"N";
  }
  uint64_t v6 = [(BKMediaLibraryAsset *)self storeID];
  CFStringRef v7 = [(BKMediaLibraryAsset *)self assetID];
  uint64_t v8 = [(BKMediaLibraryAsset *)self title];
  id v9 = [(BKMediaLibraryAsset *)self author];
  id v10 = [(BKMediaLibraryAsset *)self storeRedownloadParameters];
  int v11 = +[NSString stringWithFormat:@"<%@(%p) isCloud=%@ storeID=%@ assetID=%@ title=%@ author=%@ storeRedownloadParameters=%@>", v4, self, v5, v6, v7, v8, v9, v10];

  return (NSString *)v11;
}

- (MPMediaItem)representativeItem
{
  return (MPMediaItem *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRepresentativeItem:(id)a3
{
}

- (NSString)assetID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAssetID:(id)a3
{
}

- (NSNumber)hasRACSupport
{
  return self->_hasRACSupport;
}

- (void)setHasRACSupport:(id)a3
{
}

- (NSString)dataSourceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDataSourceIdentifier:(id)a3
{
}

- (NSDate)dataSourceInsertionDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDataSourceInsertionDate:(id)a3
{
}

- (BOOL)cloudAsset
{
  return self->_cloudAsset;
}

- (void)setCloudAsset:(BOOL)a3
{
  self->_cloudAsset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceInsertionDate, 0);
  objc_storeStrong((id *)&self->_dataSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_hasRACSupport, 0);
  objc_storeStrong((id *)&self->_assetID, 0);

  objc_storeStrong((id *)&self->_representativeItem, 0);
}

@end