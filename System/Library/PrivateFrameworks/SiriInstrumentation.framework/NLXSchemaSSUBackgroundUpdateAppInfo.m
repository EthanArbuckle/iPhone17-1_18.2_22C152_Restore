@interface NLXSchemaSSUBackgroundUpdateAppInfo
- (BOOL)hasAppBundleIdSaltedHash;
- (BOOL)hasNumCacheFilesRemoved;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaSSUBackgroundUpdateAppInfo)initWithDictionary:(id)a3;
- (NLXSchemaSSUBackgroundUpdateAppInfo)initWithJSON:(id)a3;
- (NSArray)categoryInfos;
- (NSData)jsonData;
- (NSString)appBundleIdSaltedHash;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)categoryInfosAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)categoryInfosCount;
- (unint64_t)hash;
- (unsigned)numCacheFilesRemoved;
- (void)addCategoryInfos:(id)a3;
- (void)clearCategoryInfos;
- (void)deleteAppBundleIdSaltedHash;
- (void)deleteNumCacheFilesRemoved;
- (void)setAppBundleIdSaltedHash:(id)a3;
- (void)setCategoryInfos:(id)a3;
- (void)setHasAppBundleIdSaltedHash:(BOOL)a3;
- (void)setHasNumCacheFilesRemoved:(BOOL)a3;
- (void)setNumCacheFilesRemoved:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaSSUBackgroundUpdateAppInfo

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NLXSchemaSSUBackgroundUpdateAppInfo;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(NLXSchemaSSUBackgroundUpdateAppInfo *)self categoryInfos];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];

  [(NLXSchemaSSUBackgroundUpdateAppInfo *)self setCategoryInfos:v7];
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
  objc_storeStrong((id *)&self->_categoryInfos, 0);
  objc_storeStrong((id *)&self->_appBundleIdSaltedHash, 0);
}

- (void)setHasAppBundleIdSaltedHash:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setCategoryInfos:(id)a3
{
}

- (NSArray)categoryInfos
{
  return self->_categoryInfos;
}

- (unsigned)numCacheFilesRemoved
{
  return self->_numCacheFilesRemoved;
}

- (void)setAppBundleIdSaltedHash:(id)a3
{
}

- (NSString)appBundleIdSaltedHash
{
  return self->_appBundleIdSaltedHash;
}

- (NLXSchemaSSUBackgroundUpdateAppInfo)initWithDictionary:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NLXSchemaSSUBackgroundUpdateAppInfo;
  v5 = [(NLXSchemaSSUBackgroundUpdateAppInfo *)&v24 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"appBundleIdSaltedHash"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(NLXSchemaSSUBackgroundUpdateAppInfo *)v5 setAppBundleIdSaltedHash:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"numCacheFilesRemoved"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaSSUBackgroundUpdateAppInfo setNumCacheFilesRemoved:](v5, "setNumCacheFilesRemoved:", [v8 unsignedIntValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"categoryInfos"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = v8;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v21 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v16 = [[NLXSchemaSSUBackgroundUpdateAppCategoryInfo alloc] initWithDictionary:v15];
              [(NLXSchemaSSUBackgroundUpdateAppInfo *)v5 addCategoryInfos:v16];
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v12);
      }

      v8 = v19;
    }
    v17 = v5;
  }
  return v5;
}

- (NLXSchemaSSUBackgroundUpdateAppInfo)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaSSUBackgroundUpdateAppInfo *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaSSUBackgroundUpdateAppInfo *)self dictionaryRepresentation];
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
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_appBundleIdSaltedHash)
  {
    id v4 = [(NLXSchemaSSUBackgroundUpdateAppInfo *)self appBundleIdSaltedHash];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"appBundleIdSaltedHash"];
  }
  if ([(NSArray *)self->_categoryInfos count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v7 = self->_categoryInfos;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          if (v12)
          {
            [v6 addObject:v12];
          }
          else
          {
            uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
            [v6 addObject:v13];
          }
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"categoryInfos"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NLXSchemaSSUBackgroundUpdateAppInfo numCacheFilesRemoved](self, "numCacheFilesRemoved"));
    [v3 setObject:v14 forKeyedSubscript:@"numCacheFilesRemoved"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v16);
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_appBundleIdSaltedHash hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_numCacheFilesRemoved;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(NSArray *)self->_categoryInfos hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  v5 = [(NLXSchemaSSUBackgroundUpdateAppInfo *)self appBundleIdSaltedHash];
  v6 = [v4 appBundleIdSaltedHash];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_14;
  }
  uint64_t v7 = [(NLXSchemaSSUBackgroundUpdateAppInfo *)self appBundleIdSaltedHash];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(NLXSchemaSSUBackgroundUpdateAppInfo *)self appBundleIdSaltedHash];
    uint64_t v10 = [v4 appBundleIdSaltedHash];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[32] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int numCacheFilesRemoved = self->_numCacheFilesRemoved;
    if (numCacheFilesRemoved != [v4 numCacheFilesRemoved]) {
      goto LABEL_15;
    }
  }
  v5 = [(NLXSchemaSSUBackgroundUpdateAppInfo *)self categoryInfos];
  v6 = [v4 categoryInfos];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v13 = [(NLXSchemaSSUBackgroundUpdateAppInfo *)self categoryInfos];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    uint64_t v15 = [(NLXSchemaSSUBackgroundUpdateAppInfo *)self categoryInfos];
    long long v16 = [v4 categoryInfos];
    char v17 = [v15 isEqual:v16];

    if (v17) {
      goto LABEL_18;
    }
  }
  else
  {
LABEL_14:
  }
LABEL_15:
  BOOL v18 = 0;
LABEL_16:

  return v18;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(NLXSchemaSSUBackgroundUpdateAppInfo *)self appBundleIdSaltedHash];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_categoryInfos;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaSSUBackgroundUpdateAppInfoReadFrom(self, (uint64_t)a3);
}

- (id)categoryInfosAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_categoryInfos objectAtIndexedSubscript:a3];
}

- (unint64_t)categoryInfosCount
{
  return [(NSArray *)self->_categoryInfos count];
}

- (void)addCategoryInfos:(id)a3
{
  id v4 = a3;
  categoryInfos = self->_categoryInfos;
  id v8 = v4;
  if (!categoryInfos)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_categoryInfos;
    self->_categoryInfos = v6;

    id v4 = v8;
    categoryInfos = self->_categoryInfos;
  }
  [(NSArray *)categoryInfos addObject:v4];
}

- (void)clearCategoryInfos
{
}

- (void)deleteNumCacheFilesRemoved
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasNumCacheFilesRemoved:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumCacheFilesRemoved
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setNumCacheFilesRemoved:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int numCacheFilesRemoved = a3;
}

- (void)deleteAppBundleIdSaltedHash
{
}

- (BOOL)hasAppBundleIdSaltedHash
{
  return self->_appBundleIdSaltedHash != 0;
}

@end