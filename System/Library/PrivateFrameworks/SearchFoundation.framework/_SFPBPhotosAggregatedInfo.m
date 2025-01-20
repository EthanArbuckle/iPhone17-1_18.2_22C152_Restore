@interface _SFPBPhotosAggregatedInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBPhotosAggregatedInfo)initWithDictionary:(id)a3;
- (_SFPBPhotosAggregatedInfo)initWithFacade:(id)a3;
- (_SFPBPhotosAggregatedInfo)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (int)totalNumberOfAssets;
- (int)totalNumberOfEmbeddingMatchedAssets;
- (int)totalNumberOfMetadataMatchedAssets;
- (unint64_t)hash;
- (void)setTotalNumberOfAssets:(int)a3;
- (void)setTotalNumberOfEmbeddingMatchedAssets:(int)a3;
- (void)setTotalNumberOfMetadataMatchedAssets:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBPhotosAggregatedInfo

- (_SFPBPhotosAggregatedInfo)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBPhotosAggregatedInfo *)self init];
  if (v5)
  {
    if ([v4 hasTotalNumberOfAssets]) {
      -[_SFPBPhotosAggregatedInfo setTotalNumberOfAssets:](v5, "setTotalNumberOfAssets:", [v4 totalNumberOfAssets]);
    }
    if ([v4 hasTotalNumberOfEmbeddingMatchedAssets]) {
      -[_SFPBPhotosAggregatedInfo setTotalNumberOfEmbeddingMatchedAssets:](v5, "setTotalNumberOfEmbeddingMatchedAssets:", [v4 totalNumberOfEmbeddingMatchedAssets]);
    }
    if ([v4 hasTotalNumberOfMetadataMatchedAssets]) {
      -[_SFPBPhotosAggregatedInfo setTotalNumberOfMetadataMatchedAssets:](v5, "setTotalNumberOfMetadataMatchedAssets:", [v4 totalNumberOfMetadataMatchedAssets]);
    }
    v6 = v5;
  }

  return v5;
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

- (_SFPBPhotosAggregatedInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SFPBPhotosAggregatedInfo;
  v5 = [(_SFPBPhotosAggregatedInfo *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"totalNumberOfAssets"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBPhotosAggregatedInfo setTotalNumberOfAssets:](v5, "setTotalNumberOfAssets:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"totalNumberOfEmbeddingMatchedAssets"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBPhotosAggregatedInfo setTotalNumberOfEmbeddingMatchedAssets:](v5, "setTotalNumberOfEmbeddingMatchedAssets:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"totalNumberOfMetadataMatchedAssets"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBPhotosAggregatedInfo setTotalNumberOfMetadataMatchedAssets:](v5, "setTotalNumberOfMetadataMatchedAssets:", [v8 intValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (_SFPBPhotosAggregatedInfo)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBPhotosAggregatedInfo *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBPhotosAggregatedInfo *)self dictionaryRepresentation];
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
  if (self->_totalNumberOfAssets)
  {
    uint64_t v4 = [(_SFPBPhotosAggregatedInfo *)self totalNumberOfAssets];
    if (v4 >= 0xF)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E5A2EBC8[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"totalNumberOfAssets"];
  }
  if (self->_totalNumberOfEmbeddingMatchedAssets)
  {
    uint64_t v6 = [(_SFPBPhotosAggregatedInfo *)self totalNumberOfEmbeddingMatchedAssets];
    if (v6 >= 0xF)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
      uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v7 = off_1E5A2EBC8[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"totalNumberOfEmbeddingMatchedAssets"];
  }
  if (self->_totalNumberOfMetadataMatchedAssets)
  {
    uint64_t v8 = [(_SFPBPhotosAggregatedInfo *)self totalNumberOfMetadataMatchedAssets];
    if (v8 >= 0xF)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E5A2EBC8[v8];
    }
    [v3 setObject:v9 forKeyedSubscript:@"totalNumberOfMetadataMatchedAssets"];
  }
  return v3;
}

- (unint64_t)hash
{
  return (2654435761 * self->_totalNumberOfEmbeddingMatchedAssets) ^ (2654435761 * self->_totalNumberOfAssets) ^ (2654435761 * self->_totalNumberOfMetadataMatchedAssets);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (int totalNumberOfAssets = self->_totalNumberOfAssets,
        totalNumberOfAssets == [v4 totalNumberOfAssets])
    && (int totalNumberOfEmbeddingMatchedAssets = self->_totalNumberOfEmbeddingMatchedAssets,
        totalNumberOfEmbeddingMatchedAssets == [v4 totalNumberOfEmbeddingMatchedAssets]))
  {
    int totalNumberOfMetadataMatchedAssets = self->_totalNumberOfMetadataMatchedAssets;
    BOOL v8 = totalNumberOfMetadataMatchedAssets == [v4 totalNumberOfMetadataMatchedAssets];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  if ([(_SFPBPhotosAggregatedInfo *)self totalNumberOfAssets]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBPhotosAggregatedInfo *)self totalNumberOfEmbeddingMatchedAssets]) {
    PBDataWriterWriteInt32Field();
  }
  int v4 = [(_SFPBPhotosAggregatedInfo *)self totalNumberOfMetadataMatchedAssets];
  v5 = v6;
  if (v4)
  {
    PBDataWriterWriteInt32Field();
    v5 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBPhotosAggregatedInfoReadFrom(self, (uint64_t)a3);
}

- (void)setTotalNumberOfMetadataMatchedAssets:(int)a3
{
  self->_int totalNumberOfMetadataMatchedAssets = a3;
}

- (void)setTotalNumberOfEmbeddingMatchedAssets:(int)a3
{
  self->_int totalNumberOfEmbeddingMatchedAssets = a3;
}

- (void)setTotalNumberOfAssets:(int)a3
{
  self->_int totalNumberOfAssets = a3;
}

@end