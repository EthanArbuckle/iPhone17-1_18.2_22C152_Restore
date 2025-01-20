@interface BKLibraryDataSourcePerformanceAsset
+ (id)profileKeysOfInterest;
- (BKLibraryDataSourcePerformanceAsset)initWithAssetID:(id)a3 identifier:(id)a4;
- (BKLibraryDataSourcePerformanceAsset)initWithAssetID:(id)a3 productProfile:(id)a4 identifier:(id)a5 date:(id)a6;
- (BOOL)computedRating;
- (BOOL)isCompressed;
- (BOOL)isDevelopment;
- (BOOL)isEphemeral;
- (BOOL)isLocked;
- (BOOL)isProof;
- (BOOL)isSample;
- (BOOL)shouldDisableOptimizeSpeed;
- (BOOL)shouldDisableTouchEmulation;
- (NSDate)dataSourceInsertionDate;
- (NSDate)date;
- (NSDate)expectedDate;
- (NSDate)lastOpenDate;
- (NSDate)purchaseDate;
- (NSDate)releaseDate;
- (NSDate)updateDate;
- (NSNumber)isExplicit;
- (NSNumber)seriesSortKey;
- (NSNumber)versionNumber;
- (NSString)accountID;
- (NSString)assetID;
- (NSString)author;
- (NSString)bookDescription;
- (NSString)comments;
- (NSString)dataSourceIdentifier;
- (NSString)genre;
- (NSString)grouping;
- (NSString)kind;
- (NSString)scrollDirection;
- (NSString)seriesID;
- (NSString)sortAuthor;
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
- (signed)state;
- (void)setAuthor:(id)a3;
- (void)setBookDescription:(id)a3;
- (void)setContentType:(signed __int16)a3;
- (void)setGenre:(id)a3;
- (void)setPageCount:(int64_t)a3;
- (void)setSeriesID:(id)a3;
- (void)setSeriesSortKey:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation BKLibraryDataSourcePerformanceAsset

+ (id)profileKeysOfInterest
{
  if (qword_EE698 != -1) {
    dispatch_once(&qword_EE698, &stru_D3088);
  }
  v2 = (void *)qword_EE690;

  return v2;
}

- (BKLibraryDataSourcePerformanceAsset)initWithAssetID:(id)a3 productProfile:(id)a4 identifier:(id)a5 date:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v34.receiver = self;
  v34.super_class = (Class)BKLibraryDataSourcePerformanceAsset;
  v15 = [(BKLibraryDataSourcePerformanceAsset *)&v34 init];
  if (v15)
  {
    objc_opt_class();
    v16 = [v12 objectForKeyedSubscript:@"ebookInfo"];
    v17 = BUDynamicCast();

    objc_storeStrong((id *)&v15->_assetID, a3);
    objc_storeStrong((id *)&v15->_dataSourceIdentifier, a5);
    objc_storeStrong((id *)&v15->_date, a6);
    v15->_contentType = 0;
    uint64_t v18 = [v12 objectForKeyedSubscript:@"name"];
    title = v15->_title;
    v15->_title = (NSString *)v18;

    uint64_t v20 = [v12 objectForKeyedSubscript:@"artistName"];
    author = v15->_author;
    v15->_author = (NSString *)v20;

    uint64_t v22 = [v12 objectForKeyedSubscript:@"description"];
    bookDescription = v15->_bookDescription;
    v15->_bookDescription = (NSString *)v22;

    objc_opt_class();
    v24 = [v17 objectForKeyedSubscript:@"pageCount"];
    v25 = BUDynamicCast();
    v15->_pageCount = (int64_t)[v25 unsignedLongValue];

    objc_opt_class();
    v26 = [v12 objectForKeyedSubscript:@"genres"];
    v27 = BUDynamicCast();

    objc_opt_class();
    v28 = [v27 firstObject];
    v29 = BUDynamicCast();

    objc_opt_class();
    v30 = [v29 objectForKeyedSubscript:@"name"];
    uint64_t v31 = BUDynamicCast();
    genre = v15->_genre;
    v15->_genre = (NSString *)v31;
  }
  return v15;
}

- (BKLibraryDataSourcePerformanceAsset)initWithAssetID:(id)a3 identifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)BKLibraryDataSourcePerformanceAsset;
  v9 = [(BKLibraryDataSourcePerformanceAsset *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetID, a3);
    objc_storeStrong((id *)&v10->_dataSourceIdentifier, a4);
    uint64_t v11 = +[NSDate date];
    date = v10->_date;
    v10->_date = (NSDate *)v11;

    v10->_contentType = 0;
    objc_storeStrong((id *)&v10->_title, a3);
    author = v10->_author;
    v10->_author = (NSString *)@"No Author";

    bookDescription = v10->_bookDescription;
    v10->_bookDescription = (NSString *)@"bookDescription";

    genre = v10->_genre;
    v10->_genre = (NSString *)@"Genre";
    v10->_pageCount = 100;
  }
  return v10;
}

- (int64_t)rating
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (NSString)sortAuthor
{
  return 0;
}

- (NSString)accountID
{
  return 0;
}

- (NSString)storeID
{
  return self->_assetID;
}

- (NSString)temporaryAssetID
{
  return 0;
}

- (NSURL)url
{
  return 0;
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

- (BOOL)isEphemeral
{
  return 0;
}

- (BOOL)isDevelopment
{
  return 0;
}

- (int64_t)generation
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)fileSize
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (signed)state
{
  return 1;
}

- (NSNumber)isExplicit
{
  return (NSNumber *)&__kCFBooleanFalse;
}

- (NSDate)dataSourceInsertionDate
{
  return self->_date;
}

- (NSDate)releaseDate
{
  return 0;
}

- (NSDate)purchaseDate
{
  return 0;
}

- (NSDate)expectedDate
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

- (NSString)comments
{
  return 0;
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
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (NSString)assetID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)dataSourceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
}

- (NSString)bookDescription
{
  return self->_bookDescription;
}

- (void)setBookDescription:(id)a3
{
}

- (NSString)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
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

- (NSDate)lastOpenDate
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)seriesID
{
  return self->_seriesID;
}

- (void)setSeriesID:(id)a3
{
}

- (NSNumber)seriesSortKey
{
  return self->_seriesSortKey;
}

- (void)setSeriesSortKey:(id)a3
{
}

- (signed)contentType
{
  return self->_contentType;
}

- (void)setContentType:(signed __int16)a3
{
  self->_contentType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seriesSortKey, 0);
  objc_storeStrong((id *)&self->_seriesID, 0);
  objc_storeStrong((id *)&self->_lastOpenDate, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_bookDescription, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_dataSourceIdentifier, 0);

  objc_storeStrong((id *)&self->_assetID, 0);
}

@end