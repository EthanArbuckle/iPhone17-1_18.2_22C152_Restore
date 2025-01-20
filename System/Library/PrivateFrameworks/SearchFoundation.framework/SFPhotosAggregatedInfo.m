@interface SFPhotosAggregatedInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)hasTotalNumberOfAssets;
- (BOOL)hasTotalNumberOfEmbeddingMatchedAssets;
- (BOOL)hasTotalNumberOfMetadataMatchedAssets;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFPhotosAggregatedInfo)initWithCoder:(id)a3;
- (SFPhotosAggregatedInfo)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)totalNumberOfAssets;
- (int)totalNumberOfEmbeddingMatchedAssets;
- (int)totalNumberOfMetadataMatchedAssets;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setTotalNumberOfAssets:(int)a3;
- (void)setTotalNumberOfEmbeddingMatchedAssets:(int)a3;
- (void)setTotalNumberOfMetadataMatchedAssets:(int)a3;
@end

@implementation SFPhotosAggregatedInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int)totalNumberOfMetadataMatchedAssets
{
  return self->_totalNumberOfMetadataMatchedAssets;
}

- (int)totalNumberOfEmbeddingMatchedAssets
{
  return self->_totalNumberOfEmbeddingMatchedAssets;
}

- (int)totalNumberOfAssets
{
  return self->_totalNumberOfAssets;
}

- (unint64_t)hash
{
  int v3 = [(SFPhotosAggregatedInfo *)self totalNumberOfAssets];
  int v4 = [(SFPhotosAggregatedInfo *)self totalNumberOfEmbeddingMatchedAssets] ^ v3;
  return v4 ^ [(SFPhotosAggregatedInfo *)self totalNumberOfMetadataMatchedAssets];
}

- (BOOL)isEqual:(id)a3
{
  int v4 = (SFPhotosAggregatedInfo *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else if ([(SFPhotosAggregatedInfo *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    int v6 = [(SFPhotosAggregatedInfo *)self totalNumberOfAssets];
    if (v6 == [(SFPhotosAggregatedInfo *)v5 totalNumberOfAssets]
      && (int v7 = [(SFPhotosAggregatedInfo *)self totalNumberOfEmbeddingMatchedAssets], v7 == [(SFPhotosAggregatedInfo *)v5 totalNumberOfEmbeddingMatchedAssets]))
    {
      int v8 = [(SFPhotosAggregatedInfo *)self totalNumberOfMetadataMatchedAssets];
      BOOL v9 = v8 == [(SFPhotosAggregatedInfo *)v5 totalNumberOfMetadataMatchedAssets];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setTotalNumberOfAssets:", -[SFPhotosAggregatedInfo totalNumberOfAssets](self, "totalNumberOfAssets"));
  objc_msgSend(v4, "setTotalNumberOfEmbeddingMatchedAssets:", -[SFPhotosAggregatedInfo totalNumberOfEmbeddingMatchedAssets](self, "totalNumberOfEmbeddingMatchedAssets"));
  objc_msgSend(v4, "setTotalNumberOfMetadataMatchedAssets:", -[SFPhotosAggregatedInfo totalNumberOfMetadataMatchedAssets](self, "totalNumberOfMetadataMatchedAssets"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBPhotosAggregatedInfo alloc] initWithFacade:self];
  int v3 = [(_SFPBPhotosAggregatedInfo *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBPhotosAggregatedInfo alloc] initWithFacade:self];
  int v3 = [(_SFPBPhotosAggregatedInfo *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  int v6 = [[_SFPBPhotosAggregatedInfo alloc] initWithFacade:self];
  v5 = [(_SFPBPhotosAggregatedInfo *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFPhotosAggregatedInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  int v6 = [[_SFPBPhotosAggregatedInfo alloc] initWithData:v5];
  int v7 = [(SFPhotosAggregatedInfo *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasTotalNumberOfMetadataMatchedAssets
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setTotalNumberOfMetadataMatchedAssets:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_totalNumberOfMetadataMatchedAssets = a3;
}

- (BOOL)hasTotalNumberOfEmbeddingMatchedAssets
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTotalNumberOfEmbeddingMatchedAssets:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_totalNumberOfEmbeddingMatchedAssets = a3;
}

- (BOOL)hasTotalNumberOfAssets
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTotalNumberOfAssets:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_totalNumberOfAssets = a3;
}

- (SFPhotosAggregatedInfo)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFPhotosAggregatedInfo;
  v5 = [(SFPhotosAggregatedInfo *)&v8 init];
  if (v5)
  {
    if ([v4 totalNumberOfAssets]) {
      -[SFPhotosAggregatedInfo setTotalNumberOfAssets:](v5, "setTotalNumberOfAssets:", [v4 totalNumberOfAssets]);
    }
    if ([v4 totalNumberOfEmbeddingMatchedAssets]) {
      -[SFPhotosAggregatedInfo setTotalNumberOfEmbeddingMatchedAssets:](v5, "setTotalNumberOfEmbeddingMatchedAssets:", [v4 totalNumberOfEmbeddingMatchedAssets]);
    }
    if ([v4 totalNumberOfMetadataMatchedAssets]) {
      -[SFPhotosAggregatedInfo setTotalNumberOfMetadataMatchedAssets:](v5, "setTotalNumberOfMetadataMatchedAssets:", [v4 totalNumberOfMetadataMatchedAssets]);
    }
    int v6 = v5;
  }

  return v5;
}

@end