@interface QDSchemaQDSpanMatchedEntity
- (BOOL)hasDataProtectionClass;
- (BOOL)hasSessionScopedUniqueId;
- (BOOL)hasValueType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)matches;
- (NSData)jsonData;
- (QDSchemaQDEntityType)valueType;
- (QDSchemaQDSpanMatchedEntity)initWithDictionary:(id)a3;
- (QDSchemaQDSpanMatchedEntity)initWithJSON:(id)a3;
- (SISchemaUUID)sessionScopedUniqueId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)matchesAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)dataProtectionClass;
- (unint64_t)hash;
- (unint64_t)matchesCount;
- (void)addMatches:(id)a3;
- (void)clearMatches;
- (void)deleteDataProtectionClass;
- (void)deleteSessionScopedUniqueId;
- (void)deleteValueType;
- (void)setDataProtectionClass:(int)a3;
- (void)setHasDataProtectionClass:(BOOL)a3;
- (void)setHasSessionScopedUniqueId:(BOOL)a3;
- (void)setHasValueType:(BOOL)a3;
- (void)setMatches:(id)a3;
- (void)setSessionScopedUniqueId:(id)a3;
- (void)setValueType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation QDSchemaQDSpanMatchedEntity

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)QDSchemaQDSpanMatchedEntity;
  v5 = [(SISchemaInstrumentationMessage *)&v15 applySensitiveConditionsPolicy:v4];
  v6 = [(QDSchemaQDSpanMatchedEntity *)self sessionScopedUniqueId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(QDSchemaQDSpanMatchedEntity *)self deleteSessionScopedUniqueId];
  }
  v9 = [(QDSchemaQDSpanMatchedEntity *)self valueType];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(QDSchemaQDSpanMatchedEntity *)self deleteValueType];
  }
  v12 = [(QDSchemaQDSpanMatchedEntity *)self matches];
  v13 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v12 underConditions:v4];
  [(QDSchemaQDSpanMatchedEntity *)self setMatches:v13];

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
  objc_storeStrong((id *)&self->_matches, 0);
  objc_storeStrong((id *)&self->_valueType, 0);
  objc_storeStrong((id *)&self->_sessionScopedUniqueId, 0);
}

- (void)setHasValueType:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasSessionScopedUniqueId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (void)setMatches:(id)a3
{
}

- (NSArray)matches
{
  return self->_matches;
}

- (void)setValueType:(id)a3
{
}

- (QDSchemaQDEntityType)valueType
{
  return self->_valueType;
}

- (void)setSessionScopedUniqueId:(id)a3
{
}

- (SISchemaUUID)sessionScopedUniqueId
{
  return self->_sessionScopedUniqueId;
}

- (QDSchemaQDSpanMatchedEntity)initWithDictionary:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)QDSchemaQDSpanMatchedEntity;
  v5 = [(QDSchemaQDSpanMatchedEntity *)&v27 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"sessionScopedUniqueId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(QDSchemaQDSpanMatchedEntity *)v5 setSessionScopedUniqueId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"valueType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[QDSchemaQDEntityType alloc] initWithDictionary:v8];
      [(QDSchemaQDSpanMatchedEntity *)v5 setValueType:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"matches"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = v8;
      v22 = v6;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v24 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v23 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v17 = [[QDSchemaQDEntityMatch alloc] initWithDictionary:v16];
              [(QDSchemaQDSpanMatchedEntity *)v5 addMatches:v17];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
        }
        while (v13);
      }

      int v8 = v21;
    }
    v18 = objc_msgSend(v4, "objectForKeyedSubscript:", @"dataProtectionClass", v21, v22, (void)v23);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[QDSchemaQDSpanMatchedEntity setDataProtectionClass:](v5, "setDataProtectionClass:", [v18 intValue]);
    }
    v19 = v5;
  }
  return v5;
}

- (QDSchemaQDSpanMatchedEntity)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(QDSchemaQDSpanMatchedEntity *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(QDSchemaQDSpanMatchedEntity *)self dictionaryRepresentation];
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
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v4 = [(QDSchemaQDSpanMatchedEntity *)self dataProtectionClass] - 1;
    if (v4 > 5) {
      v5 = @"QDDATAPROTECTIONCLASS_UNKNOWN";
    }
    else {
      v5 = off_1E5EBF850[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"dataProtectionClass"];
  }
  if ([(NSArray *)self->_matches count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v7 = self->_matches;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "dictionaryRepresentation", (void)v21);
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
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"matches"];
  }
  if (self->_sessionScopedUniqueId)
  {
    uint64_t v14 = [(QDSchemaQDSpanMatchedEntity *)self sessionScopedUniqueId];
    objc_super v15 = [v14 dictionaryRepresentation];
    if (v15)
    {
      [v3 setObject:v15 forKeyedSubscript:@"sessionScopedUniqueId"];
    }
    else
    {
      uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v16 forKeyedSubscript:@"sessionScopedUniqueId"];
    }
  }
  if (self->_valueType)
  {
    v17 = [(QDSchemaQDSpanMatchedEntity *)self valueType];
    v18 = [v17 dictionaryRepresentation];
    if (v18)
    {
      [v3 setObject:v18 forKeyedSubscript:@"valueType"];
    }
    else
    {
      v19 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v19 forKeyedSubscript:@"valueType"];
    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v21);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_sessionScopedUniqueId hash];
  unint64_t v4 = [(QDSchemaQDEntityType *)self->_valueType hash];
  uint64_t v5 = [(NSArray *)self->_matches hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_dataProtectionClass;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  uint64_t v5 = [(QDSchemaQDSpanMatchedEntity *)self sessionScopedUniqueId];
  uint64_t v6 = [v4 sessionScopedUniqueId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(QDSchemaQDSpanMatchedEntity *)self sessionScopedUniqueId];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(QDSchemaQDSpanMatchedEntity *)self sessionScopedUniqueId];
    uint64_t v10 = [v4 sessionScopedUniqueId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  uint64_t v5 = [(QDSchemaQDSpanMatchedEntity *)self valueType];
  uint64_t v6 = [v4 valueType];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(QDSchemaQDSpanMatchedEntity *)self valueType];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(QDSchemaQDSpanMatchedEntity *)self valueType];
    objc_super v15 = [v4 valueType];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  uint64_t v5 = [(QDSchemaQDSpanMatchedEntity *)self matches];
  uint64_t v6 = [v4 matches];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v17 = [(QDSchemaQDSpanMatchedEntity *)self matches];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(QDSchemaQDSpanMatchedEntity *)self matches];
    v20 = [v4 matches];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) == (v4[36] & 1))
  {
    if ((*(unsigned char *)&self->_has & 1) == 0
      || (int dataProtectionClass = self->_dataProtectionClass,
          dataProtectionClass == [v4 dataProtectionClass]))
    {
      BOOL v22 = 1;
      goto LABEL_18;
    }
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(QDSchemaQDSpanMatchedEntity *)self sessionScopedUniqueId];

  if (v5)
  {
    uint64_t v6 = [(QDSchemaQDSpanMatchedEntity *)self sessionScopedUniqueId];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(QDSchemaQDSpanMatchedEntity *)self valueType];

  if (v7)
  {
    uint64_t v8 = [(QDSchemaQDSpanMatchedEntity *)self valueType];
    PBDataWriterWriteSubmessage();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v9 = self->_matches;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        PBDataWriterWriteSubmessage();
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return QDSchemaQDSpanMatchedEntityReadFrom(self, (uint64_t)a3);
}

- (void)deleteDataProtectionClass
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasDataProtectionClass:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDataProtectionClass
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDataProtectionClass:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int dataProtectionClass = a3;
}

- (id)matchesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_matches objectAtIndexedSubscript:a3];
}

- (unint64_t)matchesCount
{
  return [(NSArray *)self->_matches count];
}

- (void)addMatches:(id)a3
{
  id v4 = a3;
  matches = self->_matches;
  id v8 = v4;
  if (!matches)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_matches;
    self->_matches = v6;

    id v4 = v8;
    matches = self->_matches;
  }
  [(NSArray *)matches addObject:v4];
}

- (void)clearMatches
{
}

- (void)deleteValueType
{
}

- (BOOL)hasValueType
{
  return self->_valueType != 0;
}

- (void)deleteSessionScopedUniqueId
{
}

- (BOOL)hasSessionScopedUniqueId
{
  return self->_sessionScopedUniqueId != 0;
}

@end