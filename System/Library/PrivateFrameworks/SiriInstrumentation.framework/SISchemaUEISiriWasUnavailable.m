@interface SISchemaUEISiriWasUnavailable
- (BOOL)hasProduct;
- (BOOL)hasReason;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)assetTypes;
- (NSData)jsonData;
- (SISchemaUEISiriWasUnavailable)initWithDictionary:(id)a3;
- (SISchemaUEISiriWasUnavailable)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)assetTypeAtIndex:(unint64_t)a3;
- (int)product;
- (int)reason;
- (unint64_t)assetTypeCount;
- (unint64_t)hash;
- (void)addAssetType:(int)a3;
- (void)clearAssetType;
- (void)deleteProduct;
- (void)deleteReason;
- (void)setAssetTypes:(id)a3;
- (void)setHasProduct:(BOOL)a3;
- (void)setHasReason:(BOOL)a3;
- (void)setProduct:(int)a3;
- (void)setReason:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaUEISiriWasUnavailable

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setAssetTypes:(id)a3
{
}

- (NSArray)assetTypes
{
  return self->_assetTypes;
}

- (int)reason
{
  return self->_reason;
}

- (int)product
{
  return self->_product;
}

- (SISchemaUEISiriWasUnavailable)initWithDictionary:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SISchemaUEISiriWasUnavailable;
  v5 = [(SISchemaUEISiriWasUnavailable *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"product"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUEISiriWasUnavailable setProduct:](v5, "setProduct:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"reason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUEISiriWasUnavailable setReason:](v5, "setReason:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"assetType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = v6;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v19;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v18 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[SISchemaUEISiriWasUnavailable addAssetType:](v5, "addAssetType:", [v14 intValue]);
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
        }
        while (v11);
      }

      v6 = v17;
    }
    v15 = v5;
  }
  return v5;
}

- (SISchemaUEISiriWasUnavailable)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaUEISiriWasUnavailable *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaUEISiriWasUnavailable *)self dictionaryRepresentation];
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
  if ([(NSArray *)self->_assetTypes count])
  {
    id v4 = [(SISchemaUEISiriWasUnavailable *)self assetTypes];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"assetType"];
  }
  char has = (char)self->_has;
  if (has)
  {
    int v7 = [(SISchemaUEISiriWasUnavailable *)self product];
    v8 = @"PRODUCT_UNKNOWN";
    if (v7 == 1) {
      v8 = @"PRODUCT_ASSISTANT";
    }
    if (v7 == 2) {
      id v9 = @"PRODUCT_DICTATION";
    }
    else {
      id v9 = v8;
    }
    [v3 setObject:v9 forKeyedSubscript:@"product"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    int v10 = [(SISchemaUEISiriWasUnavailable *)self reason];
    uint64_t v11 = @"SIRIUNAVAILABLEREASON_UNKNOWN";
    if (v10 == 1) {
      uint64_t v11 = @"SIRIUNAVAILABLEREASON_THERMAL_MITIGATION";
    }
    if (v10 == 2) {
      uint64_t v12 = @"SIRIUNAVAILABLEREASON_MISSING_ASSET";
    }
    else {
      uint64_t v12 = v11;
    }
    [v3 setObject:v12 forKeyedSubscript:@"reason"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_product;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ [(NSArray *)self->_assetTypes hash];
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_reason;
  return v3 ^ v2 ^ [(NSArray *)self->_assetTypes hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $42749C524EFCEAC9FE113FD9BCEA5C35 has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    int product = self->_product;
    if (product != [v4 product]) {
      goto LABEL_14;
    }
    $42749C524EFCEAC9FE113FD9BCEA5C35 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8 || (int reason = self->_reason, reason == [v4 reason]))
    {
      int v10 = [(SISchemaUEISiriWasUnavailable *)self assetTypes];
      uint64_t v11 = [v4 assetTypes];
      uint64_t v12 = v11;
      if ((v10 == 0) != (v11 != 0))
      {
        uint64_t v13 = [(SISchemaUEISiriWasUnavailable *)self assetTypes];
        if (!v13)
        {

LABEL_17:
          BOOL v18 = 1;
          goto LABEL_15;
        }
        v14 = (void *)v13;
        v15 = [(SISchemaUEISiriWasUnavailable *)self assetTypes];
        v16 = [v4 assetTypes];
        char v17 = [v15 isEqual:v16];

        if (v17) {
          goto LABEL_17;
        }
      }
      else
      {
      }
    }
  }
LABEL_14:
  BOOL v18 = 0;
LABEL_15:

  return v18;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unsigned int v6 = self->_assetTypes;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "intValue", (void)v11);
        PBDataWriterWriteInt32Field();
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUEISiriWasUnavailableReadFrom(self, (uint64_t)a3);
}

- (int)assetTypeAtIndex:(unint64_t)a3
{
  uint64_t v3 = [(NSArray *)self->_assetTypes objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (unint64_t)assetTypeCount
{
  return [(NSArray *)self->_assetTypes count];
}

- (void)addAssetType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  assetTypes = self->_assetTypes;
  if (!assetTypes)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_assetTypes;
    self->_assetTypes = v6;

    assetTypes = self->_assetTypes;
  }
  id v8 = [NSNumber numberWithInt:v3];
  [(NSArray *)assetTypes addObject:v8];
}

- (void)clearAssetType
{
}

- (void)deleteReason
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasReason:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasReason
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setReason:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int reason = a3;
}

- (void)deleteProduct
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasProduct:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasProduct
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setProduct:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int product = a3;
}

@end