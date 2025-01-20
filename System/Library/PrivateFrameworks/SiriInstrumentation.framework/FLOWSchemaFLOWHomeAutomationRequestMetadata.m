@interface FLOWSchemaFLOWHomeAutomationRequestMetadata
- (BOOL)hasConditionType;
- (BOOL)hasFulfilledEntityCount;
- (BOOL)hasIsHomeAutomationRequestAsynchronous;
- (BOOL)hasIsIntentSelectionCacheHit;
- (BOOL)hasIsRecurring;
- (BOOL)hasSmallestTargetedContainer;
- (BOOL)hasTargetAttribute;
- (BOOL)hasTargetedEntityCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHomeAutomationRequestAsynchronous;
- (BOOL)isIntentSelectionCacheHit;
- (BOOL)isRecurring;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWHomeAutomationRequestMetadata)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWHomeAutomationRequestMetadata)initWithJSON:(id)a3;
- (NSArray)targetedEntityTypes;
- (NSData)jsonData;
- (NSString)targetAttribute;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (id)targetedEntityTypesAtIndex:(unint64_t)a3;
- (int)conditionType;
- (int)smallestTargetedContainer;
- (unint64_t)hash;
- (unint64_t)targetedEntityTypesCount;
- (unsigned)fulfilledEntityCount;
- (unsigned)targetedEntityCount;
- (void)addTargetedEntityTypes:(id)a3;
- (void)clearTargetedEntityTypes;
- (void)deleteConditionType;
- (void)deleteFulfilledEntityCount;
- (void)deleteIsHomeAutomationRequestAsynchronous;
- (void)deleteIsIntentSelectionCacheHit;
- (void)deleteIsRecurring;
- (void)deleteSmallestTargetedContainer;
- (void)deleteTargetAttribute;
- (void)deleteTargetedEntityCount;
- (void)setConditionType:(int)a3;
- (void)setFulfilledEntityCount:(unsigned int)a3;
- (void)setHasConditionType:(BOOL)a3;
- (void)setHasFulfilledEntityCount:(BOOL)a3;
- (void)setHasIsHomeAutomationRequestAsynchronous:(BOOL)a3;
- (void)setHasIsIntentSelectionCacheHit:(BOOL)a3;
- (void)setHasIsRecurring:(BOOL)a3;
- (void)setHasSmallestTargetedContainer:(BOOL)a3;
- (void)setHasTargetAttribute:(BOOL)a3;
- (void)setHasTargetedEntityCount:(BOOL)a3;
- (void)setIsHomeAutomationRequestAsynchronous:(BOOL)a3;
- (void)setIsIntentSelectionCacheHit:(BOOL)a3;
- (void)setIsRecurring:(BOOL)a3;
- (void)setSmallestTargetedContainer:(int)a3;
- (void)setTargetAttribute:(id)a3;
- (void)setTargetedEntityCount:(unsigned int)a3;
- (void)setTargetedEntityTypes:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWHomeAutomationRequestMetadata

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetAttribute, 0);
  objc_storeStrong((id *)&self->_targetedEntityTypes, 0);
}

- (void)setHasTargetAttribute:(BOOL)a3
{
  *(&self->_isIntentSelectionCacheHit + 2) = a3;
}

- (BOOL)isIntentSelectionCacheHit
{
  return self->_isIntentSelectionCacheHit;
}

- (BOOL)isRecurring
{
  return self->_isRecurring;
}

- (int)conditionType
{
  return self->_conditionType;
}

- (void)setTargetAttribute:(id)a3
{
}

- (NSString)targetAttribute
{
  return self->_targetAttribute;
}

- (int)smallestTargetedContainer
{
  return self->_smallestTargetedContainer;
}

- (void)setTargetedEntityTypes:(id)a3
{
}

- (NSArray)targetedEntityTypes
{
  return self->_targetedEntityTypes;
}

- (unsigned)fulfilledEntityCount
{
  return self->_fulfilledEntityCount;
}

- (unsigned)targetedEntityCount
{
  return self->_targetedEntityCount;
}

- (BOOL)isHomeAutomationRequestAsynchronous
{
  return self->_isHomeAutomationRequestAsynchronous;
}

- (FLOWSchemaFLOWHomeAutomationRequestMetadata)initWithDictionary:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)FLOWSchemaFLOWHomeAutomationRequestMetadata;
  v5 = [(FLOWSchemaFLOWHomeAutomationRequestMetadata *)&v32 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isHomeAutomationRequestAsynchronous"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWHomeAutomationRequestMetadata setIsHomeAutomationRequestAsynchronous:](v5, "setIsHomeAutomationRequestAsynchronous:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"targetedEntityCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWHomeAutomationRequestMetadata setTargetedEntityCount:](v5, "setTargetedEntityCount:", [v7 unsignedIntValue]);
    }
    v27 = v7;
    v8 = [v4 objectForKeyedSubscript:@"fulfilledEntityCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWHomeAutomationRequestMetadata setFulfilledEntityCount:](v5, "setFulfilledEntityCount:", [v8 unsignedIntValue]);
    }
    v26 = v8;
    v9 = [v4 objectForKeyedSubscript:@"targetedEntityTypes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = v6;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v29;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v29 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v28 + 1) + 8 * v14);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v16 = (void *)[v15 copy];
              [(FLOWSchemaFLOWHomeAutomationRequestMetadata *)v5 addTargetedEntityTypes:v16];
            }
            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v12);
      }

      v6 = v25;
    }
    v17 = [v4 objectForKeyedSubscript:@"smallestTargetedContainer"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWHomeAutomationRequestMetadata setSmallestTargetedContainer:](v5, "setSmallestTargetedContainer:", [v17 intValue]);
    }
    v18 = [v4 objectForKeyedSubscript:@"targetAttribute"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = (void *)[v18 copy];
      [(FLOWSchemaFLOWHomeAutomationRequestMetadata *)v5 setTargetAttribute:v19];
    }
    v20 = [v4 objectForKeyedSubscript:@"conditionType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWHomeAutomationRequestMetadata setConditionType:](v5, "setConditionType:", [v20 intValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"isRecurring"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWHomeAutomationRequestMetadata setIsRecurring:](v5, "setIsRecurring:", [v21 BOOLValue]);
    }
    v22 = [v4 objectForKeyedSubscript:@"isIntentSelectionCacheHit"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWHomeAutomationRequestMetadata setIsIntentSelectionCacheHit:](v5, "setIsIntentSelectionCacheHit:", [v22 BOOLValue]);
    }
    v23 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWHomeAutomationRequestMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWHomeAutomationRequestMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWHomeAutomationRequestMetadata *)self dictionaryRepresentation];
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
  char v4 = *(&self->_isIntentSelectionCacheHit + 1);
  if ((v4 & 0x10) != 0)
  {
    unsigned int v5 = [(FLOWSchemaFLOWHomeAutomationRequestMetadata *)self conditionType] - 1;
    if (v5 > 4) {
      v6 = @"FLOWHOMEAUTOMATIONCONDITIONTYPE_UNKNOWN";
    }
    else {
      v6 = off_1E5EAECF8[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"conditionType"];
    char v4 = *(&self->_isIntentSelectionCacheHit + 1);
  }
  if ((v4 & 4) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[FLOWSchemaFLOWHomeAutomationRequestMetadata fulfilledEntityCount](self, "fulfilledEntityCount"));
    [v3 setObject:v7 forKeyedSubscript:@"fulfilledEntityCount"];

    char v4 = *(&self->_isIntentSelectionCacheHit + 1);
    if ((v4 & 1) == 0)
    {
LABEL_8:
      if ((v4 & 0x40) == 0) {
        goto LABEL_9;
      }
      goto LABEL_14;
    }
  }
  else if ((v4 & 1) == 0)
  {
    goto LABEL_8;
  }
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[FLOWSchemaFLOWHomeAutomationRequestMetadata isHomeAutomationRequestAsynchronous](self, "isHomeAutomationRequestAsynchronous"));
  [v3 setObject:v8 forKeyedSubscript:@"isHomeAutomationRequestAsynchronous"];

  char v4 = *(&self->_isIntentSelectionCacheHit + 1);
  if ((v4 & 0x40) == 0)
  {
LABEL_9:
    if ((v4 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }
LABEL_14:
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[FLOWSchemaFLOWHomeAutomationRequestMetadata isIntentSelectionCacheHit](self, "isIntentSelectionCacheHit"));
  [v3 setObject:v9 forKeyedSubscript:@"isIntentSelectionCacheHit"];

  char v4 = *(&self->_isIntentSelectionCacheHit + 1);
  if ((v4 & 0x20) == 0)
  {
LABEL_10:
    if ((v4 & 8) == 0) {
      goto LABEL_20;
    }
    goto LABEL_16;
  }
LABEL_15:
  id v10 = objc_msgSend(NSNumber, "numberWithBool:", -[FLOWSchemaFLOWHomeAutomationRequestMetadata isRecurring](self, "isRecurring"));
  [v3 setObject:v10 forKeyedSubscript:@"isRecurring"];

  if ((*(&self->_isIntentSelectionCacheHit + 1) & 8) == 0) {
    goto LABEL_20;
  }
LABEL_16:
  unsigned int v11 = [(FLOWSchemaFLOWHomeAutomationRequestMetadata *)self smallestTargetedContainer] - 1;
  if (v11 > 3) {
    uint64_t v12 = @"FLOWHOMECONTAINERTYPE_UNKNOWN";
  }
  else {
    uint64_t v12 = off_1E5EAED20[v11];
  }
  [v3 setObject:v12 forKeyedSubscript:@"smallestTargetedContainer"];
LABEL_20:
  if (self->_targetAttribute)
  {
    uint64_t v13 = [(FLOWSchemaFLOWHomeAutomationRequestMetadata *)self targetAttribute];
    uint64_t v14 = (void *)[v13 copy];
    [v3 setObject:v14 forKeyedSubscript:@"targetAttribute"];
  }
  if ((*(&self->_isIntentSelectionCacheHit + 1) & 2) != 0)
  {
    v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[FLOWSchemaFLOWHomeAutomationRequestMetadata targetedEntityCount](self, "targetedEntityCount"));
    [v3 setObject:v15 forKeyedSubscript:@"targetedEntityCount"];
  }
  if (self->_targetedEntityTypes)
  {
    v16 = [(FLOWSchemaFLOWHomeAutomationRequestMetadata *)self targetedEntityTypes];
    v17 = (void *)[v16 copy];
    [v3 setObject:v17 forKeyedSubscript:@"targetedEntityTypes"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (!*(&self->_isIntentSelectionCacheHit + 1))
  {
    uint64_t v3 = 0;
    if ((*(&self->_isIntentSelectionCacheHit + 1) & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((*(&self->_isIntentSelectionCacheHit + 1) & 4) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v3 = 2654435761 * self->_isHomeAutomationRequestAsynchronous;
  if ((*(&self->_isIntentSelectionCacheHit + 1) & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_targetedEntityCount;
  if ((*(&self->_isIntentSelectionCacheHit + 1) & 4) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_fulfilledEntityCount;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v5 = 0;
LABEL_8:
  uint64_t v6 = [(NSArray *)self->_targetedEntityTypes hash];
  if ((*(&self->_isIntentSelectionCacheHit + 1) & 8) != 0) {
    uint64_t v7 = 2654435761 * self->_smallestTargetedContainer;
  }
  else {
    uint64_t v7 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_targetAttribute hash];
  if ((*(&self->_isIntentSelectionCacheHit + 1) & 0x10) == 0)
  {
    uint64_t v9 = 0;
    if ((*(&self->_isIntentSelectionCacheHit + 1) & 0x20) != 0) {
      goto LABEL_13;
    }
LABEL_16:
    uint64_t v10 = 0;
    if ((*(&self->_isIntentSelectionCacheHit + 1) & 0x40) != 0) {
      goto LABEL_14;
    }
LABEL_17:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v7 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11;
  }
  uint64_t v9 = 2654435761 * self->_conditionType;
  if ((*(&self->_isIntentSelectionCacheHit + 1) & 0x20) == 0) {
    goto LABEL_16;
  }
LABEL_13:
  uint64_t v10 = 2654435761 * self->_isRecurring;
  if ((*(&self->_isIntentSelectionCacheHit + 1) & 0x40) == 0) {
    goto LABEL_17;
  }
LABEL_14:
  uint64_t v11 = 2654435761 * self->_isIntentSelectionCacheHit;
  return v4 ^ v3 ^ v5 ^ v7 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  unsigned int v5 = *((unsigned __int8 *)&self->_isIntentSelectionCacheHit + 1);
  unsigned int v6 = v4[54];
  if ((v5 & 1) != (v6 & 1)) {
    goto LABEL_26;
  }
  if (v5)
  {
    int isHomeAutomationRequestAsynchronous = self->_isHomeAutomationRequestAsynchronous;
    if (isHomeAutomationRequestAsynchronous != [v4 isHomeAutomationRequestAsynchronous]) {
      goto LABEL_26;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isIntentSelectionCacheHit + 1);
    unsigned int v6 = v4[54];
  }
  int v8 = (v5 >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      unsigned int targetedEntityCount = self->_targetedEntityCount;
      if (targetedEntityCount != [v4 targetedEntityCount]) {
        goto LABEL_26;
      }
      unsigned int v5 = *((unsigned __int8 *)&self->_isIntentSelectionCacheHit + 1);
      unsigned int v6 = v4[54];
    }
    int v10 = (v5 >> 2) & 1;
    if (v10 != ((v6 >> 2) & 1)) {
      goto LABEL_26;
    }
    if (v10)
    {
      unsigned int fulfilledEntityCount = self->_fulfilledEntityCount;
      if (fulfilledEntityCount != [v4 fulfilledEntityCount]) {
        goto LABEL_26;
      }
    }
    uint64_t v12 = [(FLOWSchemaFLOWHomeAutomationRequestMetadata *)self targetedEntityTypes];
    uint64_t v13 = [v4 targetedEntityTypes];
    if ((v12 == 0) == (v13 != 0)) {
      goto LABEL_25;
    }
    uint64_t v14 = [(FLOWSchemaFLOWHomeAutomationRequestMetadata *)self targetedEntityTypes];
    if (v14)
    {
      v15 = (void *)v14;
      v16 = [(FLOWSchemaFLOWHomeAutomationRequestMetadata *)self targetedEntityTypes];
      v17 = [v4 targetedEntityTypes];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_26;
      }
    }
    else
    {
    }
    int v19 = (*((unsigned __int8 *)&self->_isIntentSelectionCacheHit + 1) >> 3) & 1;
    if (v19 != ((v4[54] >> 3) & 1)) {
      goto LABEL_26;
    }
    if (v19)
    {
      int smallestTargetedContainer = self->_smallestTargetedContainer;
      if (smallestTargetedContainer != [v4 smallestTargetedContainer]) {
        goto LABEL_26;
      }
    }
    uint64_t v12 = [(FLOWSchemaFLOWHomeAutomationRequestMetadata *)self targetAttribute];
    uint64_t v13 = [v4 targetAttribute];
    if ((v12 == 0) == (v13 != 0))
    {
LABEL_25:

      goto LABEL_26;
    }
    uint64_t v21 = [(FLOWSchemaFLOWHomeAutomationRequestMetadata *)self targetAttribute];
    if (v21)
    {
      v22 = (void *)v21;
      v23 = [(FLOWSchemaFLOWHomeAutomationRequestMetadata *)self targetAttribute];
      v24 = [v4 targetAttribute];
      int v25 = [v23 isEqual:v24];

      if (!v25) {
        goto LABEL_26;
      }
    }
    else
    {
    }
    unsigned int v28 = *((unsigned __int8 *)&self->_isIntentSelectionCacheHit + 1);
    int v29 = (v28 >> 4) & 1;
    unsigned int v30 = v4[54];
    if (v29 == ((v30 >> 4) & 1))
    {
      if (v29)
      {
        int conditionType = self->_conditionType;
        if (conditionType != [v4 conditionType]) {
          goto LABEL_26;
        }
        unsigned int v28 = *((unsigned __int8 *)&self->_isIntentSelectionCacheHit + 1);
        unsigned int v30 = v4[54];
      }
      int v32 = (v28 >> 5) & 1;
      if (v32 == ((v30 >> 5) & 1))
      {
        if (v32)
        {
          int isRecurring = self->_isRecurring;
          if (isRecurring != [v4 isRecurring]) {
            goto LABEL_26;
          }
          unsigned int v28 = *((unsigned __int8 *)&self->_isIntentSelectionCacheHit + 1);
          unsigned int v30 = v4[54];
        }
        int v34 = (v28 >> 6) & 1;
        if (v34 == ((v30 >> 6) & 1))
        {
          if (!v34
            || (int isIntentSelectionCacheHit = self->_isIntentSelectionCacheHit,
                isIntentSelectionCacheHit == [v4 isIntentSelectionCacheHit]))
          {
            BOOL v26 = 1;
            goto LABEL_27;
          }
        }
      }
    }
  }
LABEL_26:
  BOOL v26 = 0;
LABEL_27:

  return v26;
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = *(&self->_isIntentSelectionCacheHit + 1);
  if (v5)
  {
    PBDataWriterWriteBOOLField();
    char v5 = *(&self->_isIntentSelectionCacheHit + 1);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(&self->_isIntentSelectionCacheHit + 1) & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  if ((*(&self->_isIntentSelectionCacheHit + 1) & 4) != 0) {
LABEL_4:
  }
    PBDataWriterWriteUint32Field();
LABEL_5:
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unsigned int v6 = self->_targetedEntityTypes;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  if ((*(&self->_isIntentSelectionCacheHit + 1) & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v11 = [(FLOWSchemaFLOWHomeAutomationRequestMetadata *)self targetAttribute];

  if (v11) {
    PBDataWriterWriteStringField();
  }
  char v12 = *(&self->_isIntentSelectionCacheHit + 1);
  if ((v12 & 0x10) == 0)
  {
    if ((*(&self->_isIntentSelectionCacheHit + 1) & 0x20) == 0) {
      goto LABEL_18;
    }
LABEL_25:
    PBDataWriterWriteBOOLField();
    if ((*(&self->_isIntentSelectionCacheHit + 1) & 0x40) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  PBDataWriterWriteInt32Field();
  char v12 = *(&self->_isIntentSelectionCacheHit + 1);
  if ((v12 & 0x20) != 0) {
    goto LABEL_25;
  }
LABEL_18:
  if ((v12 & 0x40) != 0) {
LABEL_19:
  }
    PBDataWriterWriteBOOLField();
LABEL_20:
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWHomeAutomationRequestMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsIntentSelectionCacheHit
{
  *(&self->_isIntentSelectionCacheHit + 1) &= ~0x40u;
}

- (void)setHasIsIntentSelectionCacheHit:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isIntentSelectionCacheHit + 1) = *(&self->_isIntentSelectionCacheHit + 1) & 0xBF | v3;
}

- (BOOL)hasIsIntentSelectionCacheHit
{
  return (*((unsigned __int8 *)&self->_isIntentSelectionCacheHit + 1) >> 6) & 1;
}

- (void)setIsIntentSelectionCacheHit:(BOOL)a3
{
  *(&self->_isIntentSelectionCacheHit + 1) |= 0x40u;
  self->_int isIntentSelectionCacheHit = a3;
}

- (void)deleteIsRecurring
{
  *(&self->_isIntentSelectionCacheHit + 1) &= ~0x20u;
}

- (void)setHasIsRecurring:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isIntentSelectionCacheHit + 1) = *(&self->_isIntentSelectionCacheHit + 1) & 0xDF | v3;
}

- (BOOL)hasIsRecurring
{
  return (*((unsigned __int8 *)&self->_isIntentSelectionCacheHit + 1) >> 5) & 1;
}

- (void)setIsRecurring:(BOOL)a3
{
  *(&self->_isIntentSelectionCacheHit + 1) |= 0x20u;
  self->_int isRecurring = a3;
}

- (void)deleteConditionType
{
  *(&self->_isIntentSelectionCacheHit + 1) &= ~0x10u;
}

- (void)setHasConditionType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isIntentSelectionCacheHit + 1) = *(&self->_isIntentSelectionCacheHit + 1) & 0xEF | v3;
}

- (BOOL)hasConditionType
{
  return (*((unsigned __int8 *)&self->_isIntentSelectionCacheHit + 1) >> 4) & 1;
}

- (void)setConditionType:(int)a3
{
  *(&self->_isIntentSelectionCacheHit + 1) |= 0x10u;
  self->_int conditionType = a3;
}

- (void)deleteTargetAttribute
{
}

- (BOOL)hasTargetAttribute
{
  return self->_targetAttribute != 0;
}

- (void)deleteSmallestTargetedContainer
{
  *(&self->_isIntentSelectionCacheHit + 1) &= ~8u;
}

- (void)setHasSmallestTargetedContainer:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isIntentSelectionCacheHit + 1) = *(&self->_isIntentSelectionCacheHit + 1) & 0xF7 | v3;
}

- (BOOL)hasSmallestTargetedContainer
{
  return (*((unsigned __int8 *)&self->_isIntentSelectionCacheHit + 1) >> 3) & 1;
}

- (void)setSmallestTargetedContainer:(int)a3
{
  *(&self->_isIntentSelectionCacheHit + 1) |= 8u;
  self->_int smallestTargetedContainer = a3;
}

- (id)targetedEntityTypesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_targetedEntityTypes objectAtIndexedSubscript:a3];
}

- (unint64_t)targetedEntityTypesCount
{
  return [(NSArray *)self->_targetedEntityTypes count];
}

- (void)addTargetedEntityTypes:(id)a3
{
  id v4 = a3;
  targetedEntityTypes = self->_targetedEntityTypes;
  id v8 = v4;
  if (!targetedEntityTypes)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_targetedEntityTypes;
    self->_targetedEntityTypes = v6;

    id v4 = v8;
    targetedEntityTypes = self->_targetedEntityTypes;
  }
  [(NSArray *)targetedEntityTypes addObject:v4];
}

- (void)clearTargetedEntityTypes
{
}

- (void)deleteFulfilledEntityCount
{
  *(&self->_isIntentSelectionCacheHit + 1) &= ~4u;
}

- (void)setHasFulfilledEntityCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isIntentSelectionCacheHit + 1) = *(&self->_isIntentSelectionCacheHit + 1) & 0xFB | v3;
}

- (BOOL)hasFulfilledEntityCount
{
  return (*((unsigned __int8 *)&self->_isIntentSelectionCacheHit + 1) >> 2) & 1;
}

- (void)setFulfilledEntityCount:(unsigned int)a3
{
  *(&self->_isIntentSelectionCacheHit + 1) |= 4u;
  self->_unsigned int fulfilledEntityCount = a3;
}

- (void)deleteTargetedEntityCount
{
  *(&self->_isIntentSelectionCacheHit + 1) &= ~2u;
}

- (void)setHasTargetedEntityCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isIntentSelectionCacheHit + 1) = *(&self->_isIntentSelectionCacheHit + 1) & 0xFD | v3;
}

- (BOOL)hasTargetedEntityCount
{
  return (*((unsigned __int8 *)&self->_isIntentSelectionCacheHit + 1) >> 1) & 1;
}

- (void)setTargetedEntityCount:(unsigned int)a3
{
  *(&self->_isIntentSelectionCacheHit + 1) |= 2u;
  self->_unsigned int targetedEntityCount = a3;
}

- (void)deleteIsHomeAutomationRequestAsynchronous
{
  *(&self->_isIntentSelectionCacheHit + 1) &= ~1u;
}

- (void)setHasIsHomeAutomationRequestAsynchronous:(BOOL)a3
{
  *(&self->_isIntentSelectionCacheHit + 1) = *(&self->_isIntentSelectionCacheHit + 1) & 0xFE | a3;
}

- (BOOL)hasIsHomeAutomationRequestAsynchronous
{
  return *(&self->_isIntentSelectionCacheHit + 1);
}

- (void)setIsHomeAutomationRequestAsynchronous:(BOOL)a3
{
  *(&self->_isIntentSelectionCacheHit + 1) |= 1u;
  self->_int isHomeAutomationRequestAsynchronous = a3;
}

@end