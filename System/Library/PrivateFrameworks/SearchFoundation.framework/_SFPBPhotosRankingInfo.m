@interface _SFPBPhotosRankingInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBPhotosRankingInfo)initWithDictionary:(id)a3;
- (_SFPBPhotosRankingInfo)initWithFacade:(id)a3;
- (_SFPBPhotosRankingInfo)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (int)assetEstimationOffAmount;
- (int)totalNumberOfAssetsInLibrary;
- (int)totalNumberOfAssetsIndexed;
- (int)totalNumberOfEmbeddingMatchedAssets;
- (int)totalNumberOfMetadataMatchedAssets;
- (unint64_t)hash;
- (void)setAssetEstimationOffAmount:(int)a3;
- (void)setTotalNumberOfAssetsInLibrary:(int)a3;
- (void)setTotalNumberOfAssetsIndexed:(int)a3;
- (void)setTotalNumberOfEmbeddingMatchedAssets:(int)a3;
- (void)setTotalNumberOfMetadataMatchedAssets:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBPhotosRankingInfo

- (_SFPBPhotosRankingInfo)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBPhotosRankingInfo *)self init];
  if (v5)
  {
    if ([v4 hasTotalNumberOfAssetsIndexed]) {
      -[_SFPBPhotosRankingInfo setTotalNumberOfAssetsIndexed:](v5, "setTotalNumberOfAssetsIndexed:", [v4 totalNumberOfAssetsIndexed]);
    }
    if ([v4 hasTotalNumberOfAssetsInLibrary]) {
      -[_SFPBPhotosRankingInfo setTotalNumberOfAssetsInLibrary:](v5, "setTotalNumberOfAssetsInLibrary:", [v4 totalNumberOfAssetsInLibrary]);
    }
    if ([v4 hasTotalNumberOfEmbeddingMatchedAssets]) {
      -[_SFPBPhotosRankingInfo setTotalNumberOfEmbeddingMatchedAssets:](v5, "setTotalNumberOfEmbeddingMatchedAssets:", [v4 totalNumberOfEmbeddingMatchedAssets]);
    }
    if ([v4 hasTotalNumberOfMetadataMatchedAssets]) {
      -[_SFPBPhotosRankingInfo setTotalNumberOfMetadataMatchedAssets:](v5, "setTotalNumberOfMetadataMatchedAssets:", [v4 totalNumberOfMetadataMatchedAssets]);
    }
    if ([v4 hasAssetEstimationOffAmount]) {
      -[_SFPBPhotosRankingInfo setAssetEstimationOffAmount:](v5, "setAssetEstimationOffAmount:", [v4 assetEstimationOffAmount]);
    }
    v6 = v5;
  }

  return v5;
}

- (int)assetEstimationOffAmount
{
  return self->_assetEstimationOffAmount;
}

- (int)totalNumberOfMetadataMatchedAssets
{
  return self->_totalNumberOfMetadataMatchedAssets;
}

- (int)totalNumberOfEmbeddingMatchedAssets
{
  return self->_totalNumberOfEmbeddingMatchedAssets;
}

- (int)totalNumberOfAssetsInLibrary
{
  return self->_totalNumberOfAssetsInLibrary;
}

- (int)totalNumberOfAssetsIndexed
{
  return self->_totalNumberOfAssetsIndexed;
}

- (_SFPBPhotosRankingInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_SFPBPhotosRankingInfo;
  v5 = [(_SFPBPhotosRankingInfo *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"totalNumberOfAssetsIndexed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBPhotosRankingInfo setTotalNumberOfAssetsIndexed:](v5, "setTotalNumberOfAssetsIndexed:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"totalNumberOfAssetsInLibrary"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBPhotosRankingInfo setTotalNumberOfAssetsInLibrary:](v5, "setTotalNumberOfAssetsInLibrary:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"totalNumberOfEmbeddingMatchedAssets"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBPhotosRankingInfo setTotalNumberOfEmbeddingMatchedAssets:](v5, "setTotalNumberOfEmbeddingMatchedAssets:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"totalNumberOfMetadataMatchedAssets"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBPhotosRankingInfo setTotalNumberOfMetadataMatchedAssets:](v5, "setTotalNumberOfMetadataMatchedAssets:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"assetEstimationOffAmount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBPhotosRankingInfo setAssetEstimationOffAmount:](v5, "setAssetEstimationOffAmount:", [v10 intValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (_SFPBPhotosRankingInfo)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBPhotosRankingInfo *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBPhotosRankingInfo *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_assetEstimationOffAmount)
  {
    uint64_t v4 = [(_SFPBPhotosRankingInfo *)self assetEstimationOffAmount];
    if (v4 >= 0xF)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E5A2EBC8[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"assetEstimationOffAmount"];
  }
  if (self->_totalNumberOfAssetsInLibrary)
  {
    uint64_t v6 = [(_SFPBPhotosRankingInfo *)self totalNumberOfAssetsInLibrary];
    if (v6 >= 0xB)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
      uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v7 = off_1E5A2EB70[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"totalNumberOfAssetsInLibrary"];
  }
  if (self->_totalNumberOfAssetsIndexed)
  {
    uint64_t v8 = [(_SFPBPhotosRankingInfo *)self totalNumberOfAssetsIndexed];
    if (v8 >= 0xB)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E5A2EB70[v8];
    }
    [v3 setObject:v9 forKeyedSubscript:@"totalNumberOfAssetsIndexed"];
  }
  if (self->_totalNumberOfEmbeddingMatchedAssets)
  {
    uint64_t v10 = [(_SFPBPhotosRankingInfo *)self totalNumberOfEmbeddingMatchedAssets];
    if (v10 >= 0xF)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E5A2EBC8[v10];
    }
    [v3 setObject:v11 forKeyedSubscript:@"totalNumberOfEmbeddingMatchedAssets"];
  }
  if (self->_totalNumberOfMetadataMatchedAssets)
  {
    uint64_t v12 = [(_SFPBPhotosRankingInfo *)self totalNumberOfMetadataMatchedAssets];
    if (v12 >= 0xF)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v12);
      objc_super v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v13 = off_1E5A2EBC8[v12];
    }
    [v3 setObject:v13 forKeyedSubscript:@"totalNumberOfMetadataMatchedAssets"];
  }
  return v3;
}

- (unint64_t)hash
{
  return (2654435761 * self->_totalNumberOfAssetsInLibrary) ^ (2654435761 * self->_totalNumberOfAssetsIndexed) ^ (2654435761 * self->_totalNumberOfEmbeddingMatchedAssets) ^ (2654435761 * self->_totalNumberOfMetadataMatchedAssets) ^ (2654435761 * self->_assetEstimationOffAmount);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (int totalNumberOfAssetsIndexed = self->_totalNumberOfAssetsIndexed,
        totalNumberOfAssetsIndexed == [v4 totalNumberOfAssetsIndexed])
    && (int totalNumberOfAssetsInLibrary = self->_totalNumberOfAssetsInLibrary,
        totalNumberOfAssetsInLibrary == [v4 totalNumberOfAssetsInLibrary])
    && (int totalNumberOfEmbeddingMatchedAssets = self->_totalNumberOfEmbeddingMatchedAssets,
        totalNumberOfEmbeddingMatchedAssets == [v4 totalNumberOfEmbeddingMatchedAssets])
    && (int totalNumberOfMetadataMatchedAssets = self->_totalNumberOfMetadataMatchedAssets,
        totalNumberOfMetadataMatchedAssets == [v4 totalNumberOfMetadataMatchedAssets]))
  {
    int assetEstimationOffAmount = self->_assetEstimationOffAmount;
    BOOL v10 = assetEstimationOffAmount == [v4 assetEstimationOffAmount];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  if ([(_SFPBPhotosRankingInfo *)self totalNumberOfAssetsIndexed]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBPhotosRankingInfo *)self totalNumberOfAssetsInLibrary]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBPhotosRankingInfo *)self totalNumberOfEmbeddingMatchedAssets]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBPhotosRankingInfo *)self totalNumberOfMetadataMatchedAssets]) {
    PBDataWriterWriteInt32Field();
  }
  int v4 = [(_SFPBPhotosRankingInfo *)self assetEstimationOffAmount];
  v5 = v6;
  if (v4)
  {
    PBDataWriterWriteInt32Field();
    v5 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBPhotosRankingInfoReadFrom(self, (uint64_t)a3);
}

- (void)setAssetEstimationOffAmount:(int)a3
{
  self->_int assetEstimationOffAmount = a3;
}

- (void)setTotalNumberOfMetadataMatchedAssets:(int)a3
{
  self->_int totalNumberOfMetadataMatchedAssets = a3;
}

- (void)setTotalNumberOfEmbeddingMatchedAssets:(int)a3
{
  self->_int totalNumberOfEmbeddingMatchedAssets = a3;
}

- (void)setTotalNumberOfAssetsInLibrary:(int)a3
{
  self->_int totalNumberOfAssetsInLibrary = a3;
}

- (void)setTotalNumberOfAssetsIndexed:(int)a3
{
  self->_int totalNumberOfAssetsIndexed = a3;
}

@end