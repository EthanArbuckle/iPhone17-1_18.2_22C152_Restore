@interface USOSchemaUSONodeDataTier1
- (BOOL)hasIndex;
- (BOOL)hasIntegerPayload;
- (BOOL)hasStringPayload;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)normalizedStringPayloads;
- (NSData)jsonData;
- (NSString)stringPayload;
- (USOSchemaUSONodeDataTier1)initWithDictionary:(id)a3;
- (USOSchemaUSONodeDataTier1)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)normalizedStringPayloadsAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)integerPayload;
- (unint64_t)hash;
- (unint64_t)normalizedStringPayloadsCount;
- (unsigned)index;
- (void)addNormalizedStringPayloads:(id)a3;
- (void)clearNormalizedStringPayloads;
- (void)deleteIndex;
- (void)deleteIntegerPayload;
- (void)deleteStringPayload;
- (void)setHasIndex:(BOOL)a3;
- (void)setHasIntegerPayload:(BOOL)a3;
- (void)setHasStringPayload:(BOOL)a3;
- (void)setIndex:(unsigned int)a3;
- (void)setIntegerPayload:(int)a3;
- (void)setNormalizedStringPayloads:(id)a3;
- (void)setStringPayload:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation USOSchemaUSONodeDataTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)USOSchemaUSONodeDataTier1;
  v5 = [(SISchemaInstrumentationMessage *)&v7 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(USOSchemaUSONodeDataTier1 *)self deleteStringPayload];
    [(USOSchemaUSONodeDataTier1 *)self deleteIntegerPayload];
    [(USOSchemaUSONodeDataTier1 *)self deleteNormalizedStringPayloads];
  }
  if ([v4 isConditionSet:4])
  {
    [(USOSchemaUSONodeDataTier1 *)self deleteStringPayload];
    [(USOSchemaUSONodeDataTier1 *)self deleteIntegerPayload];
    [(USOSchemaUSONodeDataTier1 *)self deleteNormalizedStringPayloads];
  }
  if ([v4 isConditionSet:5])
  {
    [(USOSchemaUSONodeDataTier1 *)self deleteStringPayload];
    [(USOSchemaUSONodeDataTier1 *)self deleteIntegerPayload];
    [(USOSchemaUSONodeDataTier1 *)self deleteNormalizedStringPayloads];
  }
  if ([v4 isConditionSet:6])
  {
    [(USOSchemaUSONodeDataTier1 *)self deleteStringPayload];
    [(USOSchemaUSONodeDataTier1 *)self deleteIntegerPayload];
    [(USOSchemaUSONodeDataTier1 *)self deleteNormalizedStringPayloads];
  }
  if ([v4 isConditionSet:7])
  {
    [(USOSchemaUSONodeDataTier1 *)self deleteStringPayload];
    [(USOSchemaUSONodeDataTier1 *)self deleteIntegerPayload];
    [(USOSchemaUSONodeDataTier1 *)self deleteNormalizedStringPayloads];
  }

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
  objc_storeStrong((id *)&self->_normalizedStringPayloads, 0);
  objc_storeStrong((id *)&self->_stringPayload, 0);
}

- (void)setHasStringPayload:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setNormalizedStringPayloads:(id)a3
{
}

- (NSArray)normalizedStringPayloads
{
  return self->_normalizedStringPayloads;
}

- (int)integerPayload
{
  return self->_integerPayload;
}

- (void)setStringPayload:(id)a3
{
}

- (NSString)stringPayload
{
  return self->_stringPayload;
}

- (unsigned)index
{
  return self->_index;
}

- (USOSchemaUSONodeDataTier1)initWithDictionary:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)USOSchemaUSONodeDataTier1;
  v5 = [(USOSchemaUSONodeDataTier1 *)&v26 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"index"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[USOSchemaUSONodeDataTier1 setIndex:](v5, "setIndex:", [v6 unsignedIntValue]);
    }
    objc_super v7 = [v4 objectForKeyedSubscript:@"stringPayload"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (void *)[v7 copy];
      [(USOSchemaUSONodeDataTier1 *)v5 setStringPayload:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"integerPayload"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[USOSchemaUSONodeDataTier1 setIntegerPayload:](v5, "setIntegerPayload:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"normalizedStringPayloads"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = v7;
      v21 = v6;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v23;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v23 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v22 + 1) + 8 * v15);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v17 = (void *)[v16 copy];
              [(USOSchemaUSONodeDataTier1 *)v5 addNormalizedStringPayloads:v17];
            }
            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v13);
      }

      objc_super v7 = v20;
      v6 = v21;
    }
    v18 = v5;
  }
  return v5;
}

- (USOSchemaUSONodeDataTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(USOSchemaUSONodeDataTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(USOSchemaUSONodeDataTier1 *)self dictionaryRepresentation];
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
  char has = (char)self->_has;
  if (has)
  {
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[USOSchemaUSONodeDataTier1 index](self, "index"));
    [v3 setObject:v5 forKeyedSubscript:@"index"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = objc_msgSend(NSNumber, "numberWithInt:", -[USOSchemaUSONodeDataTier1 integerPayload](self, "integerPayload"));
    [v3 setObject:v6 forKeyedSubscript:@"integerPayload"];
  }
  if (self->_normalizedStringPayloads)
  {
    uint64_t v7 = [(USOSchemaUSONodeDataTier1 *)self normalizedStringPayloads];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"normalizedStringPayloads"];
  }
  if (self->_stringPayload)
  {
    v9 = [(USOSchemaUSONodeDataTier1 *)self stringPayload];
    v10 = (void *)[v9 copy];
    [v3 setObject:v10 forKeyedSubscript:@"stringPayload"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_index;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_stringPayload hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_integerPayload;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(NSArray *)self->_normalizedStringPayloads hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[40] & 1)) {
    goto LABEL_18;
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int index = self->_index;
    if (index != [v4 index]) {
      goto LABEL_18;
    }
  }
  v6 = [(USOSchemaUSONodeDataTier1 *)self stringPayload];
  uint64_t v7 = [v4 stringPayload];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v8 = [(USOSchemaUSONodeDataTier1 *)self stringPayload];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(USOSchemaUSONodeDataTier1 *)self stringPayload];
    id v11 = [v4 stringPayload];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  int v13 = (*(unsigned char *)&self->_has >> 1) & 1;
  if (v13 != ((v4[40] >> 1) & 1)) {
    goto LABEL_18;
  }
  if (v13)
  {
    int integerPayload = self->_integerPayload;
    if (integerPayload != [v4 integerPayload]) {
      goto LABEL_18;
    }
  }
  v6 = [(USOSchemaUSONodeDataTier1 *)self normalizedStringPayloads];
  uint64_t v7 = [v4 normalizedStringPayloads];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v15 = [(USOSchemaUSONodeDataTier1 *)self normalizedStringPayloads];
    if (!v15)
    {

LABEL_21:
      BOOL v20 = 1;
      goto LABEL_19;
    }
    v16 = (void *)v15;
    v17 = [(USOSchemaUSONodeDataTier1 *)self normalizedStringPayloads];
    v18 = [v4 normalizedStringPayloads];
    char v19 = [v17 isEqual:v18];

    if (v19) {
      goto LABEL_21;
    }
  }
  else
  {
LABEL_17:
  }
LABEL_18:
  BOOL v20 = 0;
LABEL_19:

  return v20;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  uint64_t v5 = [(USOSchemaUSONodeDataTier1 *)self stringPayload];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_normalizedStringPayloads;
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
        PBDataWriterWriteStringField();
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
  return USOSchemaUSONodeDataTier1ReadFrom(self, (uint64_t)a3);
}

- (id)normalizedStringPayloadsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_normalizedStringPayloads objectAtIndexedSubscript:a3];
}

- (unint64_t)normalizedStringPayloadsCount
{
  return [(NSArray *)self->_normalizedStringPayloads count];
}

- (void)addNormalizedStringPayloads:(id)a3
{
  id v4 = a3;
  normalizedStringPayloads = self->_normalizedStringPayloads;
  id v8 = v4;
  if (!normalizedStringPayloads)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_normalizedStringPayloads;
    self->_normalizedStringPayloads = v6;

    id v4 = v8;
    normalizedStringPayloads = self->_normalizedStringPayloads;
  }
  [(NSArray *)normalizedStringPayloads addObject:v4];
}

- (void)clearNormalizedStringPayloads
{
}

- (void)deleteIntegerPayload
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasIntegerPayload:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIntegerPayload
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIntegerPayload:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int integerPayload = a3;
}

- (void)deleteStringPayload
{
}

- (BOOL)hasStringPayload
{
  return self->_stringPayload != 0;
}

- (void)deleteIndex
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIndex:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int index = a3;
}

@end