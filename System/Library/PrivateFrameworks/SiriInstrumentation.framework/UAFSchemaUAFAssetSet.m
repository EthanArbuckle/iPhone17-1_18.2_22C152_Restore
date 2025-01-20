@interface UAFSchemaUAFAssetSet
- (BOOL)hasAssetSetId;
- (BOOL)hasAssetSetName;
- (BOOL)hasAssetType;
- (BOOL)hasAudienceId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)assets;
- (NSArray)mobileAssetDownloadErrorCodeFrequencys;
- (NSData)jsonData;
- (NSString)assetSetId;
- (NSString)assetSetName;
- (NSString)assetType;
- (NSString)audienceId;
- (UAFSchemaUAFAssetSet)initWithDictionary:(id)a3;
- (UAFSchemaUAFAssetSet)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)assetsAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)mobileAssetDownloadErrorCodeFrequencyAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)assetsCount;
- (unint64_t)hash;
- (unint64_t)mobileAssetDownloadErrorCodeFrequencyCount;
- (void)addAssets:(id)a3;
- (void)addMobileAssetDownloadErrorCodeFrequency:(id)a3;
- (void)clearAssets;
- (void)clearMobileAssetDownloadErrorCodeFrequency;
- (void)deleteAssetSetId;
- (void)deleteAssetSetName;
- (void)deleteAssetType;
- (void)deleteAudienceId;
- (void)setAssetSetId:(id)a3;
- (void)setAssetSetName:(id)a3;
- (void)setAssetType:(id)a3;
- (void)setAssets:(id)a3;
- (void)setAudienceId:(id)a3;
- (void)setHasAssetSetId:(BOOL)a3;
- (void)setHasAssetSetName:(BOOL)a3;
- (void)setHasAssetType:(BOOL)a3;
- (void)setHasAudienceId:(BOOL)a3;
- (void)setMobileAssetDownloadErrorCodeFrequencys:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation UAFSchemaUAFAssetSet

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)UAFSchemaUAFAssetSet;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v11 applySensitiveConditionsPolicy:v4];
  v6 = [(UAFSchemaUAFAssetSet *)self assets];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(UAFSchemaUAFAssetSet *)self setAssets:v7];

  v8 = [(UAFSchemaUAFAssetSet *)self mobileAssetDownloadErrorCodeFrequencys];
  v9 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v8 underConditions:v4];

  [(UAFSchemaUAFAssetSet *)self setMobileAssetDownloadErrorCodeFrequencys:v9];
  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileAssetDownloadErrorCodeFrequencys, 0);
  objc_storeStrong((id *)&self->_audienceId, 0);
  objc_storeStrong((id *)&self->_assetSetId, 0);
  objc_storeStrong((id *)&self->_assetType, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_assetSetName, 0);
}

- (void)setHasAudienceId:(BOOL)a3
{
  self->_hasAudienceId = a3;
}

- (void)setHasAssetSetId:(BOOL)a3
{
  self->_hasAssetSetId = a3;
}

- (void)setHasAssetType:(BOOL)a3
{
  self->_hasAssetType = a3;
}

- (void)setHasAssetSetName:(BOOL)a3
{
  self->_hasAssetSetName = a3;
}

- (void)setMobileAssetDownloadErrorCodeFrequencys:(id)a3
{
}

- (NSArray)mobileAssetDownloadErrorCodeFrequencys
{
  return self->_mobileAssetDownloadErrorCodeFrequencys;
}

- (void)setAudienceId:(id)a3
{
}

- (NSString)audienceId
{
  return self->_audienceId;
}

- (void)setAssetSetId:(id)a3
{
}

- (NSString)assetSetId
{
  return self->_assetSetId;
}

- (void)setAssetType:(id)a3
{
}

- (NSString)assetType
{
  return self->_assetType;
}

- (void)setAssets:(id)a3
{
}

- (NSArray)assets
{
  return self->_assets;
}

- (void)setAssetSetName:(id)a3
{
}

- (NSString)assetSetName
{
  return self->_assetSetName;
}

- (UAFSchemaUAFAssetSet)initWithDictionary:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)UAFSchemaUAFAssetSet;
  v5 = [(UAFSchemaUAFAssetSet *)&v45 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"assetSetName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(UAFSchemaUAFAssetSet *)v5 setAssetSetName:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"assets"];
    objc_opt_class();
    v35 = v8;
    v36 = v6;
    if (objc_opt_isKindOfClass())
    {
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v41 objects:v47 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v42 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v41 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = [[UAFSchemaUAFAsset alloc] initWithDictionary:v14];
              [(UAFSchemaUAFAssetSet *)v5 addAssets:v15];
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v41 objects:v47 count:16];
        }
        while (v11);
      }

      v8 = v35;
    }
    v16 = [v4 objectForKeyedSubscript:@"assetType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(UAFSchemaUAFAssetSet *)v5 setAssetType:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"assetSetId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = (void *)[v18 copy];
      [(UAFSchemaUAFAssetSet *)v5 setAssetSetId:v19];
    }
    v20 = [v4 objectForKeyedSubscript:@"audienceId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = v20;
      v22 = (void *)[v20 copy];
      [(UAFSchemaUAFAssetSet *)v5 setAudienceId:v22];

      v20 = v21;
    }
    v23 = [v4 objectForKeyedSubscript:@"mobileAssetDownloadErrorCodeFrequency"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v33 = v20;
      v34 = v18;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v24 = v23;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v37 objects:v46 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v38;
        do
        {
          for (uint64_t j = 0; j != v26; ++j)
          {
            if (*(void *)v38 != v27) {
              objc_enumerationMutation(v24);
            }
            uint64_t v29 = *(void *)(*((void *)&v37 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v30 = [[UAFSchemaUAFMobileAssetDownloadErrorCodeFrequency alloc] initWithDictionary:v29];
              [(UAFSchemaUAFAssetSet *)v5 addMobileAssetDownloadErrorCodeFrequency:v30];
            }
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v37 objects:v46 count:16];
        }
        while (v26);
      }

      v8 = v35;
      v6 = v36;
      v18 = v34;
      v20 = v33;
    }
    v31 = v5;
  }
  return v5;
}

- (UAFSchemaUAFAssetSet)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(UAFSchemaUAFAssetSet *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(UAFSchemaUAFAssetSet *)self dictionaryRepresentation];
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
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_assetSetId)
  {
    id v4 = [(UAFSchemaUAFAssetSet *)self assetSetId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"assetSetId"];
  }
  if (self->_assetSetName)
  {
    v6 = [(UAFSchemaUAFAssetSet *)self assetSetName];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"assetSetName"];
  }
  if (self->_assetType)
  {
    v8 = [(UAFSchemaUAFAssetSet *)self assetType];
    id v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"assetType"];
  }
  if ([(NSArray *)self->_assets count])
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v11 = self->_assets;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v34 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v33 + 1) + 8 * i) dictionaryRepresentation];
          if (v16)
          {
            [v10 addObject:v16];
          }
          else
          {
            v17 = [MEMORY[0x1E4F1CA98] null];
            [v10 addObject:v17];
          }
        }
        uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKeyedSubscript:@"assets"];
  }
  if (self->_audienceId)
  {
    v18 = [(UAFSchemaUAFAssetSet *)self audienceId];
    v19 = (void *)[v18 copy];
    [v3 setObject:v19 forKeyedSubscript:@"audienceId"];
  }
  if ([(NSArray *)self->_mobileAssetDownloadErrorCodeFrequencys count])
  {
    v20 = [MEMORY[0x1E4F1CA48] array];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v21 = self->_mobileAssetDownloadErrorCodeFrequencys;
    uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v30 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * j), "dictionaryRepresentation", (void)v29);
          if (v26)
          {
            [v20 addObject:v26];
          }
          else
          {
            uint64_t v27 = [MEMORY[0x1E4F1CA98] null];
            [v20 addObject:v27];
          }
        }
        uint64_t v23 = [(NSArray *)v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v23);
    }

    [v3 setObject:v20 forKeyedSubscript:@"mobileAssetDownloadErrorCodeFrequency"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v29);
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_assetSetName hash];
  uint64_t v4 = [(NSArray *)self->_assets hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_assetType hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_assetSetId hash];
  NSUInteger v7 = [(NSString *)self->_audienceId hash];
  return v6 ^ v7 ^ [(NSArray *)self->_mobileAssetDownloadErrorCodeFrequencys hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  NSUInteger v5 = [(UAFSchemaUAFAssetSet *)self assetSetName];
  NSUInteger v6 = [v4 assetSetName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v7 = [(UAFSchemaUAFAssetSet *)self assetSetName];
  if (v7)
  {
    v8 = (void *)v7;
    id v9 = [(UAFSchemaUAFAssetSet *)self assetSetName];
    uint64_t v10 = [v4 assetSetName];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(UAFSchemaUAFAssetSet *)self assets];
  NSUInteger v6 = [v4 assets];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v12 = [(UAFSchemaUAFAssetSet *)self assets];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(UAFSchemaUAFAssetSet *)self assets];
    v15 = [v4 assets];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(UAFSchemaUAFAssetSet *)self assetType];
  NSUInteger v6 = [v4 assetType];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v17 = [(UAFSchemaUAFAssetSet *)self assetType];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(UAFSchemaUAFAssetSet *)self assetType];
    v20 = [v4 assetType];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(UAFSchemaUAFAssetSet *)self assetSetId];
  NSUInteger v6 = [v4 assetSetId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v22 = [(UAFSchemaUAFAssetSet *)self assetSetId];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    uint64_t v24 = [(UAFSchemaUAFAssetSet *)self assetSetId];
    uint64_t v25 = [v4 assetSetId];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(UAFSchemaUAFAssetSet *)self audienceId];
  NSUInteger v6 = [v4 audienceId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v27 = [(UAFSchemaUAFAssetSet *)self audienceId];
  if (v27)
  {
    v28 = (void *)v27;
    long long v29 = [(UAFSchemaUAFAssetSet *)self audienceId];
    long long v30 = [v4 audienceId];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(UAFSchemaUAFAssetSet *)self mobileAssetDownloadErrorCodeFrequencys];
  NSUInteger v6 = [v4 mobileAssetDownloadErrorCodeFrequencys];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v32 = [(UAFSchemaUAFAssetSet *)self mobileAssetDownloadErrorCodeFrequencys];
    if (!v32)
    {

LABEL_35:
      BOOL v37 = 1;
      goto LABEL_33;
    }
    long long v33 = (void *)v32;
    long long v34 = [(UAFSchemaUAFAssetSet *)self mobileAssetDownloadErrorCodeFrequencys];
    long long v35 = [v4 mobileAssetDownloadErrorCodeFrequencys];
    char v36 = [v34 isEqual:v35];

    if (v36) {
      goto LABEL_35;
    }
  }
  else
  {
LABEL_31:
  }
LABEL_32:
  BOOL v37 = 0;
LABEL_33:

  return v37;
}

- (void)writeTo:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSUInteger v5 = [(UAFSchemaUAFAssetSet *)self assetSetName];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  NSUInteger v6 = self->_assets;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }

  int v11 = [(UAFSchemaUAFAssetSet *)self assetType];

  if (v11) {
    PBDataWriterWriteStringField();
  }
  uint64_t v12 = [(UAFSchemaUAFAssetSet *)self assetSetId];

  if (v12) {
    PBDataWriterWriteStringField();
  }
  uint64_t v13 = [(UAFSchemaUAFAssetSet *)self audienceId];

  if (v13) {
    PBDataWriterWriteStringField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v14 = self->_mobileAssetDownloadErrorCodeFrequencys;
  uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        PBDataWriterWriteSubmessage();
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v16);
  }
}

- (BOOL)readFrom:(id)a3
{
  return UAFSchemaUAFAssetSetReadFrom(self, (uint64_t)a3);
}

- (id)mobileAssetDownloadErrorCodeFrequencyAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_mobileAssetDownloadErrorCodeFrequencys objectAtIndexedSubscript:a3];
}

- (unint64_t)mobileAssetDownloadErrorCodeFrequencyCount
{
  return [(NSArray *)self->_mobileAssetDownloadErrorCodeFrequencys count];
}

- (void)addMobileAssetDownloadErrorCodeFrequency:(id)a3
{
  id v4 = a3;
  mobileAssetDownloadErrorCodeFrequencys = self->_mobileAssetDownloadErrorCodeFrequencys;
  id v8 = v4;
  if (!mobileAssetDownloadErrorCodeFrequencys)
  {
    NSUInteger v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_mobileAssetDownloadErrorCodeFrequencys;
    self->_mobileAssetDownloadErrorCodeFrequencys = v6;

    id v4 = v8;
    mobileAssetDownloadErrorCodeFrequencys = self->_mobileAssetDownloadErrorCodeFrequencys;
  }
  [(NSArray *)mobileAssetDownloadErrorCodeFrequencys addObject:v4];
}

- (void)clearMobileAssetDownloadErrorCodeFrequency
{
}

- (void)deleteAudienceId
{
}

- (BOOL)hasAudienceId
{
  return self->_audienceId != 0;
}

- (void)deleteAssetSetId
{
}

- (BOOL)hasAssetSetId
{
  return self->_assetSetId != 0;
}

- (void)deleteAssetType
{
}

- (BOOL)hasAssetType
{
  return self->_assetType != 0;
}

- (id)assetsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_assets objectAtIndexedSubscript:a3];
}

- (unint64_t)assetsCount
{
  return [(NSArray *)self->_assets count];
}

- (void)addAssets:(id)a3
{
  id v4 = a3;
  assets = self->_assets;
  id v8 = v4;
  if (!assets)
  {
    NSUInteger v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_assets;
    self->_assets = v6;

    id v4 = v8;
    assets = self->_assets;
  }
  [(NSArray *)assets addObject:v4];
}

- (void)clearAssets
{
}

- (void)deleteAssetSetName
{
}

- (BOOL)hasAssetSetName
{
  return self->_assetSetName != 0;
}

@end