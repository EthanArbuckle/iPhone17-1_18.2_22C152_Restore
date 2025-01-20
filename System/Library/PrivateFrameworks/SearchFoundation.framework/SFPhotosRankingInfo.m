@interface SFPhotosRankingInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAssetEstimationOffAmount;
- (BOOL)hasTotalNumberOfAssetsInLibrary;
- (BOOL)hasTotalNumberOfAssetsIndexed;
- (BOOL)hasTotalNumberOfEmbeddingMatchedAssets;
- (BOOL)hasTotalNumberOfMetadataMatchedAssets;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFPhotosRankingInfo)initWithCoder:(id)a3;
- (SFPhotosRankingInfo)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)assetEstimationOffAmount;
- (int)totalNumberOfAssetsInLibrary;
- (int)totalNumberOfAssetsIndexed;
- (int)totalNumberOfEmbeddingMatchedAssets;
- (int)totalNumberOfMetadataMatchedAssets;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetEstimationOffAmount:(int)a3;
- (void)setTotalNumberOfAssetsInLibrary:(int)a3;
- (void)setTotalNumberOfAssetsIndexed:(int)a3;
- (void)setTotalNumberOfEmbeddingMatchedAssets:(int)a3;
- (void)setTotalNumberOfMetadataMatchedAssets:(int)a3;
@end

@implementation SFPhotosRankingInfo

- (SFPhotosRankingInfo)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFPhotosRankingInfo;
  v5 = [(SFPhotosRankingInfo *)&v8 init];
  if (v5)
  {
    if ([v4 totalNumberOfAssetsIndexed]) {
      -[SFPhotosRankingInfo setTotalNumberOfAssetsIndexed:](v5, "setTotalNumberOfAssetsIndexed:", [v4 totalNumberOfAssetsIndexed]);
    }
    if ([v4 totalNumberOfAssetsInLibrary]) {
      -[SFPhotosRankingInfo setTotalNumberOfAssetsInLibrary:](v5, "setTotalNumberOfAssetsInLibrary:", [v4 totalNumberOfAssetsInLibrary]);
    }
    if ([v4 totalNumberOfEmbeddingMatchedAssets]) {
      -[SFPhotosRankingInfo setTotalNumberOfEmbeddingMatchedAssets:](v5, "setTotalNumberOfEmbeddingMatchedAssets:", [v4 totalNumberOfEmbeddingMatchedAssets]);
    }
    if ([v4 totalNumberOfMetadataMatchedAssets]) {
      -[SFPhotosRankingInfo setTotalNumberOfMetadataMatchedAssets:](v5, "setTotalNumberOfMetadataMatchedAssets:", [v4 totalNumberOfMetadataMatchedAssets]);
    }
    if ([v4 assetEstimationOffAmount]) {
      -[SFPhotosRankingInfo setAssetEstimationOffAmount:](v5, "setAssetEstimationOffAmount:", [v4 assetEstimationOffAmount]);
    }
    v6 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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

- (unint64_t)hash
{
  int v3 = [(SFPhotosRankingInfo *)self totalNumberOfAssetsIndexed];
  int v4 = [(SFPhotosRankingInfo *)self totalNumberOfAssetsInLibrary] ^ v3;
  int v5 = [(SFPhotosRankingInfo *)self totalNumberOfEmbeddingMatchedAssets];
  int v6 = v4 ^ v5 ^ [(SFPhotosRankingInfo *)self totalNumberOfMetadataMatchedAssets];
  return v6 ^ [(SFPhotosRankingInfo *)self assetEstimationOffAmount];
}

- (BOOL)isEqual:(id)a3
{
  int v4 = (SFPhotosRankingInfo *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else if ([(SFPhotosRankingInfo *)v4 isMemberOfClass:objc_opt_class()])
  {
    int v5 = v4;
    int v6 = [(SFPhotosRankingInfo *)self totalNumberOfAssetsIndexed];
    if (v6 == [(SFPhotosRankingInfo *)v5 totalNumberOfAssetsIndexed]
      && (int v7 = [(SFPhotosRankingInfo *)self totalNumberOfAssetsInLibrary],
          v7 == [(SFPhotosRankingInfo *)v5 totalNumberOfAssetsInLibrary])
      && (int v8 = [(SFPhotosRankingInfo *)self totalNumberOfEmbeddingMatchedAssets],
          v8 == [(SFPhotosRankingInfo *)v5 totalNumberOfEmbeddingMatchedAssets])
      && (int v9 = [(SFPhotosRankingInfo *)self totalNumberOfMetadataMatchedAssets],
          v9 == [(SFPhotosRankingInfo *)v5 totalNumberOfMetadataMatchedAssets]))
    {
      int v10 = [(SFPhotosRankingInfo *)self assetEstimationOffAmount];
      BOOL v11 = v10 == [(SFPhotosRankingInfo *)v5 assetEstimationOffAmount];
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setTotalNumberOfAssetsIndexed:", -[SFPhotosRankingInfo totalNumberOfAssetsIndexed](self, "totalNumberOfAssetsIndexed"));
  objc_msgSend(v4, "setTotalNumberOfAssetsInLibrary:", -[SFPhotosRankingInfo totalNumberOfAssetsInLibrary](self, "totalNumberOfAssetsInLibrary"));
  objc_msgSend(v4, "setTotalNumberOfEmbeddingMatchedAssets:", -[SFPhotosRankingInfo totalNumberOfEmbeddingMatchedAssets](self, "totalNumberOfEmbeddingMatchedAssets"));
  objc_msgSend(v4, "setTotalNumberOfMetadataMatchedAssets:", -[SFPhotosRankingInfo totalNumberOfMetadataMatchedAssets](self, "totalNumberOfMetadataMatchedAssets"));
  objc_msgSend(v4, "setAssetEstimationOffAmount:", -[SFPhotosRankingInfo assetEstimationOffAmount](self, "assetEstimationOffAmount"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBPhotosRankingInfo alloc] initWithFacade:self];
  int v3 = [(_SFPBPhotosRankingInfo *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBPhotosRankingInfo alloc] initWithFacade:self];
  int v3 = [(_SFPBPhotosRankingInfo *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  int v6 = [[_SFPBPhotosRankingInfo alloc] initWithFacade:self];
  int v5 = [(_SFPBPhotosRankingInfo *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFPhotosRankingInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  int v6 = [[_SFPBPhotosRankingInfo alloc] initWithData:v5];
  int v7 = [(SFPhotosRankingInfo *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasAssetEstimationOffAmount
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setAssetEstimationOffAmount:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_assetEstimationOffAmount = a3;
}

- (BOOL)hasTotalNumberOfMetadataMatchedAssets
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setTotalNumberOfMetadataMatchedAssets:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_totalNumberOfMetadataMatchedAssets = a3;
}

- (BOOL)hasTotalNumberOfEmbeddingMatchedAssets
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setTotalNumberOfEmbeddingMatchedAssets:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_totalNumberOfEmbeddingMatchedAssets = a3;
}

- (BOOL)hasTotalNumberOfAssetsInLibrary
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTotalNumberOfAssetsInLibrary:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_totalNumberOfAssetsInLibrary = a3;
}

- (BOOL)hasTotalNumberOfAssetsIndexed
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTotalNumberOfAssetsIndexed:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_totalNumberOfAssetsIndexed = a3;
}

@end