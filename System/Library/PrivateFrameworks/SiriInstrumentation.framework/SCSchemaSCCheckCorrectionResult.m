@interface SCSchemaSCCheckCorrectionResult
- (BOOL)hasCorrectedAttribute;
- (BOOL)hasCorrectionType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)incomingEntities;
- (NSArray)referredEntities;
- (NSData)jsonData;
- (NSString)correctedAttribute;
- (SCSchemaSCCheckCorrectionResult)initWithDictionary:(id)a3;
- (SCSchemaSCCheckCorrectionResult)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)incomingEntitiesAtIndex:(unint64_t)a3;
- (id)referredEntitiesAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)correctionType;
- (unint64_t)hash;
- (unint64_t)incomingEntitiesCount;
- (unint64_t)referredEntitiesCount;
- (void)addIncomingEntities:(id)a3;
- (void)addReferredEntities:(id)a3;
- (void)clearIncomingEntities;
- (void)clearReferredEntities;
- (void)deleteCorrectedAttribute;
- (void)deleteCorrectionType;
- (void)setCorrectedAttribute:(id)a3;
- (void)setCorrectionType:(int)a3;
- (void)setHasCorrectedAttribute:(BOOL)a3;
- (void)setHasCorrectionType:(BOOL)a3;
- (void)setIncomingEntities:(id)a3;
- (void)setReferredEntities:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SCSchemaSCCheckCorrectionResult

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incomingEntities, 0);
  objc_storeStrong((id *)&self->_referredEntities, 0);
  objc_storeStrong((id *)&self->_correctedAttribute, 0);
}

- (void)setHasCorrectedAttribute:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setIncomingEntities:(id)a3
{
}

- (NSArray)incomingEntities
{
  return self->_incomingEntities;
}

- (void)setReferredEntities:(id)a3
{
}

- (NSArray)referredEntities
{
  return self->_referredEntities;
}

- (int)correctionType
{
  return self->_correctionType;
}

- (void)setCorrectedAttribute:(id)a3
{
}

- (NSString)correctedAttribute
{
  return self->_correctedAttribute;
}

- (SCSchemaSCCheckCorrectionResult)initWithDictionary:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)SCSchemaSCCheckCorrectionResult;
  v5 = [(SCSchemaSCCheckCorrectionResult *)&v38 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"correctedAttribute"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(SCSchemaSCCheckCorrectionResult *)v5 setCorrectedAttribute:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"correctionType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SCSchemaSCCheckCorrectionResult setCorrectionType:](v5, "setCorrectionType:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"referredEntities"];
    objc_opt_class();
    v29 = v8;
    if (objc_opt_isKindOfClass())
    {
      v10 = v6;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v11 = v9;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v40 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v35;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v35 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v34 + 1) + 8 * v15);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v17 = (void *)[v16 copy];
              [(SCSchemaSCCheckCorrectionResult *)v5 addReferredEntities:v17];
            }
            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v34 objects:v40 count:16];
        }
        while (v13);
      }

      v6 = v10;
      v8 = v29;
    }
    v18 = [v4 objectForKeyedSubscript:@"incomingEntities"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v28 = v6;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v19 = v18;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v39 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v31;
        do
        {
          uint64_t v23 = 0;
          do
          {
            if (*(void *)v31 != v22) {
              objc_enumerationMutation(v19);
            }
            v24 = *(void **)(*((void *)&v30 + 1) + 8 * v23);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v25 = (void *)[v24 copy];
              [(SCSchemaSCCheckCorrectionResult *)v5 addIncomingEntities:v25];
            }
            ++v23;
          }
          while (v21 != v23);
          uint64_t v21 = [v19 countByEnumeratingWithState:&v30 objects:v39 count:16];
        }
        while (v21);
      }

      v6 = v28;
      v8 = v29;
    }
    v26 = v5;
  }
  return v5;
}

- (SCSchemaSCCheckCorrectionResult)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SCSchemaSCCheckCorrectionResult *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SCSchemaSCCheckCorrectionResult *)self dictionaryRepresentation];
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
  if (self->_correctedAttribute)
  {
    id v4 = [(SCSchemaSCCheckCorrectionResult *)self correctedAttribute];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"correctedAttribute"];
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v6 = [(SCSchemaSCCheckCorrectionResult *)self correctionType] - 1;
    if (v6 > 5) {
      uint64_t v7 = @"SCCORRECTIONTYPE_UNKNOWN";
    }
    else {
      uint64_t v7 = off_1E5EB94D0[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"correctionType"];
  }
  if (self->_incomingEntities)
  {
    v8 = [(SCSchemaSCCheckCorrectionResult *)self incomingEntities];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"incomingEntities"];
  }
  if (self->_referredEntities)
  {
    v10 = [(SCSchemaSCCheckCorrectionResult *)self referredEntities];
    id v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"referredEntities"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_correctedAttribute hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_correctionType;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = v4 ^ v3;
  uint64_t v6 = [(NSArray *)self->_referredEntities hash];
  return v5 ^ v6 ^ [(NSArray *)self->_incomingEntities hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  NSUInteger v5 = [(SCSchemaSCCheckCorrectionResult *)self correctedAttribute];
  uint64_t v6 = [v4 correctedAttribute];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_19;
  }
  uint64_t v7 = [(SCSchemaSCCheckCorrectionResult *)self correctedAttribute];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(SCSchemaSCCheckCorrectionResult *)self correctedAttribute];
    v10 = [v4 correctedAttribute];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[40] & 1)) {
    goto LABEL_20;
  }
  if (*(unsigned char *)&self->_has)
  {
    int correctionType = self->_correctionType;
    if (correctionType != [v4 correctionType]) {
      goto LABEL_20;
    }
  }
  NSUInteger v5 = [(SCSchemaSCCheckCorrectionResult *)self referredEntities];
  uint64_t v6 = [v4 referredEntities];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_19;
  }
  uint64_t v13 = [(SCSchemaSCCheckCorrectionResult *)self referredEntities];
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    uint64_t v15 = [(SCSchemaSCCheckCorrectionResult *)self referredEntities];
    v16 = [v4 referredEntities];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(SCSchemaSCCheckCorrectionResult *)self incomingEntities];
  uint64_t v6 = [v4 incomingEntities];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v18 = [(SCSchemaSCCheckCorrectionResult *)self incomingEntities];
    if (!v18)
    {

LABEL_23:
      BOOL v23 = 1;
      goto LABEL_21;
    }
    id v19 = (void *)v18;
    uint64_t v20 = [(SCSchemaSCCheckCorrectionResult *)self incomingEntities];
    uint64_t v21 = [v4 incomingEntities];
    char v22 = [v20 isEqual:v21];

    if (v22) {
      goto LABEL_23;
    }
  }
  else
  {
LABEL_19:
  }
LABEL_20:
  BOOL v23 = 0;
LABEL_21:

  return v23;
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSUInteger v5 = [(SCSchemaSCCheckCorrectionResult *)self correctedAttribute];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v6 = self->_referredEntities;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  int v11 = self->_incomingEntities;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteStringField();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (BOOL)readFrom:(id)a3
{
  return SCSchemaSCCheckCorrectionResultReadFrom(self, (uint64_t)a3);
}

- (id)incomingEntitiesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_incomingEntities objectAtIndexedSubscript:a3];
}

- (unint64_t)incomingEntitiesCount
{
  return [(NSArray *)self->_incomingEntities count];
}

- (void)addIncomingEntities:(id)a3
{
  id v4 = a3;
  incomingEntities = self->_incomingEntities;
  id v8 = v4;
  if (!incomingEntities)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_incomingEntities;
    self->_incomingEntities = v6;

    id v4 = v8;
    incomingEntities = self->_incomingEntities;
  }
  [(NSArray *)incomingEntities addObject:v4];
}

- (void)clearIncomingEntities
{
}

- (id)referredEntitiesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_referredEntities objectAtIndexedSubscript:a3];
}

- (unint64_t)referredEntitiesCount
{
  return [(NSArray *)self->_referredEntities count];
}

- (void)addReferredEntities:(id)a3
{
  id v4 = a3;
  referredEntities = self->_referredEntities;
  id v8 = v4;
  if (!referredEntities)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_referredEntities;
    self->_referredEntities = v6;

    id v4 = v8;
    referredEntities = self->_referredEntities;
  }
  [(NSArray *)referredEntities addObject:v4];
}

- (void)clearReferredEntities
{
}

- (void)deleteCorrectionType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasCorrectionType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCorrectionType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCorrectionType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int correctionType = a3;
}

- (void)deleteCorrectedAttribute
{
}

- (BOOL)hasCorrectedAttribute
{
  return self->_correctedAttribute != 0;
}

@end