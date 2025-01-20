@interface BKLibrarySupplementalAsset
+ (id)newAssetFromJaliscoBookletItem:(id)a3 parentAsset:(id)a4 dataSourceIdentifier:(id)a5;
- (BKAsset)parentAsset;
- (BKLibrarySupplementalAsset)initWithParentAsset:(id)a3 dataSourceIdentifier:(id)a4 storeID:(id)a5 title:(id)a6 downloadParams:(id)a7 size:(id)a8;
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
- (NSNumber)isExplicit;
- (NSNumber)size;
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
- (NSString)sortAuthor;
- (NSString)storeDownloadParameters;
- (NSString)storeID;
- (NSString)storePlaylistID;
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
- (void)setDataSourceIdentifier:(id)a3;
- (void)setParentAsset:(id)a3;
- (void)setSize:(id)a3;
- (void)setStoreDownloadParameters:(id)a3;
- (void)setStoreID:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation BKLibrarySupplementalAsset

- (NSString)assetID
{
  return 0;
}

- (NSString)storePlaylistID
{
  v2 = [(BKLibrarySupplementalAsset *)self parentAsset];
  v3 = [v2 storeID];

  return (NSString *)v3;
}

- (BOOL)isSupplementalContent
{
  return 1;
}

- (NSString)author
{
  v2 = [(BKLibrarySupplementalAsset *)self parentAsset];
  v3 = [v2 author];

  return (NSString *)v3;
}

- (NSString)sortAuthor
{
  v2 = [(BKLibrarySupplementalAsset *)self parentAsset];
  v3 = [v2 sortAuthor];

  return (NSString *)v3;
}

- (NSString)genre
{
  v2 = [(BKLibrarySupplementalAsset *)self parentAsset];
  v3 = [v2 genre];

  return (NSString *)v3;
}

- (NSString)comments
{
  v2 = [(BKLibrarySupplementalAsset *)self parentAsset];
  v3 = [v2 comments];

  return (NSString *)v3;
}

- (NSString)bookDescription
{
  v2 = [(BKLibrarySupplementalAsset *)self parentAsset];
  v3 = [v2 bookDescription];

  return (NSString *)v3;
}

- (NSString)year
{
  v2 = [(BKLibrarySupplementalAsset *)self parentAsset];
  v3 = [v2 year];

  return (NSString *)v3;
}

- (NSNumber)isExplicit
{
  v2 = [(BKLibrarySupplementalAsset *)self parentAsset];
  v3 = [v2 isExplicit];

  return (NSNumber *)v3;
}

- (NSDate)lastOpenDate
{
  return 0;
}

- (NSDate)purchaseDate
{
  v2 = [(BKLibrarySupplementalAsset *)self parentAsset];
  v3 = [v2 purchaseDate];

  return (NSDate *)v3;
}

- (int64_t)rating
{
  return 0;
}

- (NSString)accountID
{
  v2 = [(BKLibrarySupplementalAsset *)self parentAsset];
  v3 = [v2 accountID];

  return (NSString *)v3;
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

- (int64_t)generation
{
  return 1;
}

- (int64_t)fileSize
{
  v2 = [(BKLibrarySupplementalAsset *)self size];
  int64_t v3 = (int)[v2 intValue];

  return v3;
}

- (signed)contentType
{
  return 3;
}

- (signed)state
{
  return 3;
}

- (NSDate)dataSourceInsertionDate
{
  v2 = [(BKLibrarySupplementalAsset *)self parentAsset];
  int64_t v3 = [v2 dataSourceInsertionDate];

  return (NSDate *)v3;
}

- (NSDate)releaseDate
{
  return 0;
}

- (NSDate)expectedDate
{
  v2 = [(BKLibrarySupplementalAsset *)self parentAsset];
  int64_t v3 = [v2 expectedDate];

  return (NSDate *)v3;
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

- (int64_t)pageCount
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

- (NSString)kind
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

- (BOOL)isDevelopment
{
  return 0;
}

- (BKLibrarySupplementalAsset)initWithParentAsset:(id)a3 dataSourceIdentifier:(id)a4 storeID:(id)a5 title:(id)a6 downloadParams:(id)a7 size:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v32.receiver = self;
  v32.super_class = (Class)BKLibrarySupplementalAsset;
  v21 = [(BKLibrarySupplementalAsset *)&v32 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_parentAsset, a3);
    v23 = (NSString *)[v17 copy];
    storeID = v22->_storeID;
    v22->_storeID = v23;

    v25 = (NSString *)[v18 copy];
    title = v22->_title;
    v22->_title = v25;

    v27 = (NSString *)[v16 copy];
    dataSourceIdentifier = v22->_dataSourceIdentifier;
    v22->_dataSourceIdentifier = v27;

    v29 = (NSString *)[v19 copy];
    storeDownloadParameters = v22->_storeDownloadParameters;
    v22->_storeDownloadParameters = v29;

    objc_storeStrong((id *)&v22->_size, a8);
  }

  return v22;
}

+ (id)newAssetFromJaliscoBookletItem:(id)a3 parentAsset:(id)a4 dataSourceIdentifier:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [BKLibrarySupplementalAsset alloc];
  v11 = [v9 storeID];
  v12 = [v9 title];
  v13 = [v9 storeDownloadParameters];
  v14 = [v9 size];

  id v15 = [(BKLibrarySupplementalAsset *)v10 initWithParentAsset:v8 dataSourceIdentifier:v7 storeID:v11 title:v12 downloadParams:v13 size:v14];
  return v15;
}

- (BKAsset)parentAsset
{
  return (BKAsset *)objc_getProperty(self, a2, 8, 1);
}

- (void)setParentAsset:(id)a3
{
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTitle:(id)a3
{
}

- (NSString)storeID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStoreID:(id)a3
{
}

- (NSString)dataSourceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDataSourceIdentifier:(id)a3
{
}

- (NSString)storeDownloadParameters
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setStoreDownloadParameters:(id)a3
{
}

- (NSNumber)size
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSize:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_storeDownloadParameters, 0);
  objc_storeStrong((id *)&self->_dataSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_parentAsset, 0);
}

@end