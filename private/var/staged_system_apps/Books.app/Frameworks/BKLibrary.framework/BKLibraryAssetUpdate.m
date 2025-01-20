@interface BKLibraryAssetUpdate
- (BKAsset)asset;
- (BKLibraryAssetUpdate)init;
- (BKLibraryAssetUpdate)initWithAsset:(id)a3 dataSource:(id)a4 dataSourceBitmask:(unint64_t)a5;
- (BOOL)hasChanges;
- (BOOL)sample;
- (NSDate)expectedDate;
- (NSDate)releaseDate;
- (NSDecimalNumber)sequenceNumber;
- (NSMutableArray)purchaseDates_hack;
- (NSNumber)assetIsHidden;
- (NSNumber)coverAspectRatio;
- (NSNumber)duration;
- (NSNumber)hasRACSupport;
- (NSNumber)isExplicit;
- (NSNumber)isStoreAudiobook;
- (NSNumber)seriesIsCloudOnly;
- (NSNumber)seriesIsHidden;
- (NSNumber)seriesIsOrdered;
- (NSNumber)seriesSortKey;
- (NSString)author;
- (NSString)genre;
- (NSString)mappedAssetID;
- (NSString)sequenceDisplayName;
- (NSString)seriesID;
- (NSString)title;
- (NSURL)url;
- (id)description;
- (signed)mappedAssetContentType;
- (unint64_t)dataSourcesBitmask;
- (unint64_t)propertiesToPropagate;
- (void)postIntegrateCleanup;
- (void)propagateAdditionalDataWithAsset:(id)a3;
- (void)setAsset:(id)a3;
- (void)setDataSourcesBitmask:(unint64_t)a3;
- (void)setPropertiesToPropagate:(unint64_t)a3;
- (void)setPurchaseDates_hack:(id)a3;
@end

@implementation BKLibraryAssetUpdate

- (BKLibraryAssetUpdate)init
{
  v6.receiver = self;
  v6.super_class = (Class)BKLibraryAssetUpdate;
  v2 = [(BKLibraryAssetUpdate *)&v6 init];
  v3 = v2;
  if (v2)
  {
    seriesID = v2->_seriesID;
    v2->_seriesID = 0;
  }
  return v3;
}

- (BKLibraryAssetUpdate)initWithAsset:(id)a3 dataSource:(id)a4 dataSourceBitmask:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = [(BKLibraryAssetUpdate *)self init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_asset, a3);
    if (objc_opt_respondsToSelector())
    {
      v13 = [v9 seriesID];

      if (v13)
      {
        uint64_t v14 = [v9 seriesID];
        seriesID = v12->_seriesID;
        v12->_seriesID = (NSString *)v14;
      }
    }
    if (objc_opt_respondsToSelector())
    {
      v16 = [v9 duration];

      if (v16)
      {
        uint64_t v17 = [v9 duration];
        duration = v12->_duration;
        v12->_duration = (NSNumber *)v17;
      }
    }
    v12->_dataSourcesBitmask = a5;
    if (objc_opt_respondsToSelector()) {
      uint64_t v19 = (uint64_t)[v10 propagateDataProperties];
    }
    else {
      uint64_t v19 = 268370174;
    }
    [(BKLibraryAssetUpdate *)v12 setPropertiesToPropagate:v19];
    [(BKLibraryAssetUpdate *)v12 propagateAdditionalDataWithAsset:v9];
  }

  return v12;
}

- (void)propagateAdditionalDataWithAsset:(id)a3
{
  id v45 = a3;
  v4 = [v45 purchaseDate];
  if (v4)
  {
    v5 = [(BKLibraryAssetUpdate *)self purchaseDates_hack];

    if (!v5)
    {
      objc_super v6 = objc_opt_new();
      [(BKLibraryAssetUpdate *)self setPurchaseDates_hack:v6];
    }
    v7 = [(BKLibraryAssetUpdate *)self purchaseDates_hack];
    [v7 addObject:v4];

    self->_hasChanges = 1;
  }
  if (([(BKLibraryAssetUpdate *)self propertiesToPropagate] & 0x10000000) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = [v45 coverAspectRatio];
    if (v8)
    {
      id v9 = v8;
      objc_storeStrong((id *)&self->_coverAspectRatio, v8);
      self->_hasChanges = 1;
    }
  }
  if (([(BKLibraryAssetUpdate *)self propertiesToPropagate] & 0x2000) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v10 = [v45 assetIsHidden];
    if (v10)
    {
      v11 = v10;
      objc_storeStrong((id *)&self->_assetIsHidden, v10);
      self->_hasChanges = 1;
    }
  }
  if (([(BKLibraryAssetUpdate *)self propertiesToPropagate] & 2) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v12 = [v45 seriesID];
    if (v12)
    {
      v13 = v12;
      objc_storeStrong((id *)&self->_seriesID, v12);
      self->_hasChanges = 1;
    }
  }
  if (([(BKLibraryAssetUpdate *)self propertiesToPropagate] & 4) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v14 = [v45 seriesSortKey];
    if (v14)
    {
      v15 = v14;
      objc_storeStrong((id *)&self->_seriesSortKey, v14);
      self->_hasChanges = 1;
    }
  }
  if (([(BKLibraryAssetUpdate *)self propertiesToPropagate] & 8) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v16 = [v45 sequenceDisplayName];
    if (v16)
    {
      uint64_t v17 = v16;
      objc_storeStrong((id *)&self->_sequenceDisplayName, v16);
      self->_hasChanges = 1;
    }
  }
  if (([(BKLibraryAssetUpdate *)self propertiesToPropagate] & 0x4000000) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v18 = [v45 sequenceNumber];
    if (v18)
    {
      uint64_t v19 = v18;
      objc_storeStrong((id *)&self->_sequenceNumber, v18);
      self->_hasChanges = 1;
    }
  }
  if (([(BKLibraryAssetUpdate *)self propertiesToPropagate] & 0x10) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v20 = [v45 seriesIsHidden];
    if (v20)
    {
      v21 = v20;
      objc_storeStrong((id *)&self->_seriesIsHidden, v20);
      self->_hasChanges = 1;
    }
  }
  if (([(BKLibraryAssetUpdate *)self propertiesToPropagate] & 0x4000) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v22 = [v45 isStoreAudiobook];
    if (v22)
    {
      v23 = v22;
      objc_storeStrong((id *)&self->_isStoreAudiobook, v22);
      self->_hasChanges = 1;
    }
  }
  if (([(BKLibraryAssetUpdate *)self propertiesToPropagate] & 0x8000) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v24 = [v45 hasRACSupport];
    if (v24)
    {
      v25 = v24;
      objc_storeStrong((id *)&self->_hasRACSupport, v24);
      self->_hasChanges = 1;
    }
  }
  if (([(BKLibraryAssetUpdate *)self propertiesToPropagate] & 0x20) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v26 = [v45 seriesIsCloudOnly];
    if (v26)
    {
      v27 = v26;
      objc_storeStrong((id *)&self->_seriesIsCloudOnly, v26);
      self->_hasChanges = 1;
    }
  }
  if (([(BKLibraryAssetUpdate *)self propertiesToPropagate] & 0x40) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v28 = [v45 expectedDate];
    if (v28)
    {
      v29 = v28;
      objc_storeStrong((id *)&self->_expectedDate, v28);
      self->_hasChanges = 1;
    }
  }
  if (([(BKLibraryAssetUpdate *)self propertiesToPropagate] & 0x2000000) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v30 = [v45 releaseDate];
    if (v30)
    {
      v31 = v30;
      objc_storeStrong((id *)&self->_releaseDate, v30);
      self->_hasChanges = 1;
    }
  }
  if (([(BKLibraryAssetUpdate *)self propertiesToPropagate] & 0x80) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && [v45 isSample])
  {
    *(_WORD *)&self->_hasChanges = 257;
  }
  if (([(BKLibraryAssetUpdate *)self propertiesToPropagate] & 0x100) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v32 = [v45 title];
    if (v32)
    {
      v33 = v32;
      objc_storeStrong((id *)&self->_title, v32);
      self->_hasChanges = 1;
    }
  }
  if (([(BKLibraryAssetUpdate *)self propertiesToPropagate] & 0x1000) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v34 = [v45 url];
    if (v34)
    {
      v35 = v34;
      objc_storeStrong((id *)&self->_url, v34);
      self->_hasChanges = 1;
    }
  }
  if (([(BKLibraryAssetUpdate *)self propertiesToPropagate] & 0x200) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v36 = [v45 author];
    if (v36)
    {
      v37 = v36;
      objc_storeStrong((id *)&self->_author, v36);
      self->_hasChanges = 1;
    }
  }
  if (([(BKLibraryAssetUpdate *)self propertiesToPropagate] & 0x400) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v38 = [v45 genre];
    if (v38)
    {
      v39 = v38;
      objc_storeStrong((id *)&self->_genre, v38);
      self->_hasChanges = 1;
    }
  }
  if (([(BKLibraryAssetUpdate *)self propertiesToPropagate] & 0x800) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v40 = [v45 isExplicit];
    if (v40)
    {
      v41 = v40;
      objc_storeStrong((id *)&self->_isExplicit, v40);
      self->_hasChanges = 1;
    }
  }
  if (([(BKLibraryAssetUpdate *)self propertiesToPropagate] & 0x800000) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v42 = [v45 mappedAssetID];
    if (v42)
    {
      v43 = v42;
      objc_storeStrong((id *)&self->_mappedAssetID, v42);
      self->_hasChanges = 1;
    }
  }
  if (([(BKLibraryAssetUpdate *)self propertiesToPropagate] & 0x1000000) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    unsigned int v44 = [v45 mappedAssetContentType];
    if (v44)
    {
      self->_mappedAssetContentType = v44;
      self->_hasChanges = 1;
    }
  }
}

- (void)postIntegrateCleanup
{
  asset = self->_asset;
  self->_asset = 0;

  assetIsHidden = self->_assetIsHidden;
  self->_assetIsHidden = 0;

  coverAspectRatio = self->_coverAspectRatio;
  self->_coverAspectRatio = 0;

  seriesID = self->_seriesID;
  self->_seriesID = 0;

  sequenceDisplayName = self->_sequenceDisplayName;
  self->_sequenceDisplayName = 0;

  sequenceNumber = self->_sequenceNumber;
  self->_sequenceNumber = 0;

  seriesSortKey = self->_seriesSortKey;
  self->_seriesSortKey = 0;

  seriesIsHidden = self->_seriesIsHidden;
  self->_seriesIsHidden = 0;

  seriesIsCloudOnly = self->_seriesIsCloudOnly;
  self->_seriesIsCloudOnly = 0;

  isStoreAudiobook = self->_isStoreAudiobook;
  self->_isStoreAudiobook = 0;

  purchaseDates_hack = self->_purchaseDates_hack;
  self->_purchaseDates_hack = 0;

  expectedDate = self->_expectedDate;
  self->_expectedDate = 0;

  releaseDate = self->_releaseDate;
  self->_releaseDate = 0;

  title = self->_title;
  self->_title = 0;

  url = self->_url;
  self->_url = 0;

  author = self->_author;
  self->_author = 0;

  genre = self->_genre;
  self->_genre = 0;

  isExplicit = self->_isExplicit;
  self->_isExplicit = 0;

  self->_hasChanges = 0;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[NSMutableString stringWithFormat:@"%@: <%p>", v4, self];

  [v5 appendFormat:@"\n\tproperties - 0x%lx" [self propertiesToPropagate]];
  [v5 appendFormat:@"\n\tbitmask=%#lx", [self dataSourcesBitmask]];
  objc_super v6 = [(BKLibraryAssetUpdate *)self asset];
  [v5 appendFormat:@"\n\tasset=%p" v6];

  v7 = [(BKLibraryAssetUpdate *)self asset];

  if (v7)
  {
    v8 = [(BKLibraryAssetUpdate *)self asset];
    id v9 = [v8 assetID];
    [v5 appendFormat:@"\n\tasset.assetID=%@", v9];

    id v10 = [(BKLibraryAssetUpdate *)self asset];
    v11 = [v10 temporaryAssetID];
    [v5 appendFormat:@"\n\tasset.temporaryAssetID=%@ ", v11];

    v12 = [(BKLibraryAssetUpdate *)self asset];
    v13 = [v12 title];
    [v5 appendFormat:@"\n\tasset.title=%@", v13];
  }
  uint64_t v14 = [(BKLibraryAssetUpdate *)self seriesID];
  v15 = (void *)v14;
  if (v14) {
    [v5 appendFormat:@"\n\t%@ - %@", @"seriesID", v14];
  }

  uint64_t v16 = [(BKLibraryAssetUpdate *)self seriesSortKey];
  uint64_t v17 = (void *)v16;
  if (v16) {
    [v5 appendFormat:@"\n\t%@ - %@", @"seriesSortKey", v16];
  }

  uint64_t v18 = [(BKLibraryAssetUpdate *)self sequenceDisplayName];
  uint64_t v19 = (void *)v18;
  if (v18) {
    [v5 appendFormat:@"\n\t%@ - %@", @"sequenceDisplayName", v18];
  }

  uint64_t v20 = [(BKLibraryAssetUpdate *)self sequenceNumber];
  v21 = (void *)v20;
  if (v20) {
    [v5 appendFormat:@"\n\t%@ - %@", @"sequenceNumber", v20];
  }

  uint64_t v22 = [(BKLibraryAssetUpdate *)self seriesIsHidden];
  v23 = (void *)v22;
  if (v22) {
    [v5 appendFormat:@"\n\t%@ - %@", @"seriesIsHidden", v22];
  }

  uint64_t v24 = [(BKLibraryAssetUpdate *)self seriesIsCloudOnly];
  v25 = (void *)v24;
  if (v24) {
    [v5 appendFormat:@"\n\t%@ - %@", @"seriesIsCloudOnly", v24];
  }

  uint64_t v26 = [(BKLibraryAssetUpdate *)self isStoreAudiobook];
  v27 = (void *)v26;
  if (v26) {
    [v5 appendFormat:@"\n\t%@ - %@", @"isStoreAudiobook", v26];
  }

  uint64_t v28 = [(BKLibraryAssetUpdate *)self expectedDate];
  v29 = (void *)v28;
  if (v28) {
    [v5 appendFormat:@"\n\t%@ - %@", @"expectedDate", v28];
  }

  uint64_t v30 = [(BKLibraryAssetUpdate *)self releaseDate];
  v31 = (void *)v30;
  if (v30) {
    [v5 appendFormat:@"\n\t%@ - %@", @"releaseDate", v30];
  }

  uint64_t v32 = [(BKLibraryAssetUpdate *)self title];
  v33 = (void *)v32;
  if (v32) {
    [v5 appendFormat:@"\n\t%@ - %@", @"title", v32];
  }

  uint64_t v34 = [(BKLibraryAssetUpdate *)self author];
  v35 = (void *)v34;
  if (v34) {
    [v5 appendFormat:@"\n\t%@ - %@", @"author", v34];
  }

  uint64_t v36 = [(BKLibraryAssetUpdate *)self genre];
  v37 = (void *)v36;
  if (v36) {
    [v5 appendFormat:@"\n\t%@ - %@", @"genre", v36];
  }

  uint64_t v38 = [(BKLibraryAssetUpdate *)self isExplicit];
  v39 = (void *)v38;
  if (v38) {
    [v5 appendFormat:@"\n\t%@ - %@", @"isExplicit", v38];
  }

  uint64_t v40 = [(BKLibraryAssetUpdate *)self url];
  v41 = (void *)v40;
  if (v40) {
    [v5 appendFormat:@"\n\t%@ - %@", @"url", v40];
  }

  uint64_t v42 = [(BKLibraryAssetUpdate *)self coverAspectRatio];
  v43 = (void *)v42;
  if (v42) {
    [v5 appendFormat:@"\n\t%@ - %@", @"coverAspectRatio", v42];
  }

  return v5;
}

- (BKAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- (unint64_t)dataSourcesBitmask
{
  return self->_dataSourcesBitmask;
}

- (void)setDataSourcesBitmask:(unint64_t)a3
{
  self->_dataSourcesBitmask = a3;
}

- (unint64_t)propertiesToPropagate
{
  return self->_propertiesToPropagate;
}

- (void)setPropertiesToPropagate:(unint64_t)a3
{
  self->_propertiesToPropagate = a3;
}

- (BOOL)hasChanges
{
  return self->_hasChanges;
}

- (NSNumber)assetIsHidden
{
  return self->_assetIsHidden;
}

- (NSString)seriesID
{
  return self->_seriesID;
}

- (NSNumber)seriesSortKey
{
  return self->_seriesSortKey;
}

- (NSString)sequenceDisplayName
{
  return self->_sequenceDisplayName;
}

- (NSDecimalNumber)sequenceNumber
{
  return self->_sequenceNumber;
}

- (NSNumber)seriesIsHidden
{
  return self->_seriesIsHidden;
}

- (NSNumber)seriesIsCloudOnly
{
  return self->_seriesIsCloudOnly;
}

- (NSNumber)seriesIsOrdered
{
  return self->_seriesIsOrdered;
}

- (NSDate)expectedDate
{
  return self->_expectedDate;
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (NSString)title
{
  return self->_title;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)author
{
  return self->_author;
}

- (NSString)genre
{
  return self->_genre;
}

- (NSNumber)isExplicit
{
  return self->_isExplicit;
}

- (NSNumber)duration
{
  return self->_duration;
}

- (BOOL)sample
{
  return self->_sample;
}

- (NSNumber)isStoreAudiobook
{
  return self->_isStoreAudiobook;
}

- (NSNumber)hasRACSupport
{
  return self->_hasRACSupport;
}

- (NSString)mappedAssetID
{
  return self->_mappedAssetID;
}

- (signed)mappedAssetContentType
{
  return self->_mappedAssetContentType;
}

- (NSNumber)coverAspectRatio
{
  return self->_coverAspectRatio;
}

- (NSMutableArray)purchaseDates_hack
{
  return self->_purchaseDates_hack;
}

- (void)setPurchaseDates_hack:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchaseDates_hack, 0);
  objc_storeStrong((id *)&self->_coverAspectRatio, 0);
  objc_storeStrong((id *)&self->_mappedAssetID, 0);
  objc_storeStrong((id *)&self->_hasRACSupport, 0);
  objc_storeStrong((id *)&self->_isStoreAudiobook, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_isExplicit, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_expectedDate, 0);
  objc_storeStrong((id *)&self->_seriesIsOrdered, 0);
  objc_storeStrong((id *)&self->_seriesIsCloudOnly, 0);
  objc_storeStrong((id *)&self->_seriesIsHidden, 0);
  objc_storeStrong((id *)&self->_sequenceNumber, 0);
  objc_storeStrong((id *)&self->_sequenceDisplayName, 0);
  objc_storeStrong((id *)&self->_seriesSortKey, 0);
  objc_storeStrong((id *)&self->_seriesID, 0);
  objc_storeStrong((id *)&self->_assetIsHidden, 0);

  objc_storeStrong((id *)&self->_asset, 0);
}

@end