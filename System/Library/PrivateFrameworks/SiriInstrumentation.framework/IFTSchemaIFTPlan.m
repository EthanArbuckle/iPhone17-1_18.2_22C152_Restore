@interface IFTSchemaIFTPlan
- (BOOL)exists;
- (BOOL)hasExists;
- (BOOL)hasOverrideId;
- (BOOL)hasPlanSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTPlan)initWithDictionary:(id)a3;
- (IFTSchemaIFTPlan)initWithJSON:(id)a3;
- (NSArray)statements;
- (NSData)jsonData;
- (NSString)overrideId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)statementsAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)planSource;
- (unint64_t)hash;
- (unint64_t)statementsCount;
- (void)addStatements:(id)a3;
- (void)clearStatements;
- (void)deleteExists;
- (void)deleteOverrideId;
- (void)deletePlanSource;
- (void)setExists:(BOOL)a3;
- (void)setHasExists:(BOOL)a3;
- (void)setHasOverrideId:(BOOL)a3;
- (void)setHasPlanSource:(BOOL)a3;
- (void)setOverrideId:(id)a3;
- (void)setPlanSource:(int)a3;
- (void)setStatements:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTPlan

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IFTSchemaIFTPlan;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(IFTSchemaIFTPlan *)self statements];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];

  [(IFTSchemaIFTPlan *)self setStatements:v7];
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
  objc_storeStrong((id *)&self->_overrideId, 0);
  objc_storeStrong((id *)&self->_statements, 0);
}

- (void)setHasOverrideId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)planSource
{
  return self->_planSource;
}

- (void)setOverrideId:(id)a3
{
}

- (NSString)overrideId
{
  return self->_overrideId;
}

- (void)setStatements:(id)a3
{
}

- (NSArray)statements
{
  return self->_statements;
}

- (BOOL)exists
{
  return self->_exists;
}

- (IFTSchemaIFTPlan)initWithDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)IFTSchemaIFTPlan;
  v5 = [(IFTSchemaIFTPlan *)&v25 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"exists"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTPlan setExists:](v5, "setExists:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"statements"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = v6;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v22;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v22 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * v12);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v14 = [[IFTSchemaIFTProgramStatement alloc] initWithDictionary:v13];
              [(IFTSchemaIFTPlan *)v5 addStatements:v14];
            }
            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
        }
        while (v10);
      }

      v6 = v20;
    }
    v15 = [v4 objectForKeyedSubscript:@"overrideId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = (void *)[v15 copy];
      [(IFTSchemaIFTPlan *)v5 setOverrideId:v16];
    }
    v17 = [v4 objectForKeyedSubscript:@"planSource"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTPlan setPlanSource:](v5, "setPlanSource:", [v17 intValue]);
    }
    v18 = v5;
  }
  return v5;
}

- (IFTSchemaIFTPlan)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTPlan *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTPlan *)self dictionaryRepresentation];
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
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTPlan exists](self, "exists"));
    [v3 setObject:v4 forKeyedSubscript:@"exists"];
  }
  if (self->_overrideId)
  {
    v5 = [(IFTSchemaIFTPlan *)self overrideId];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"overrideId"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unsigned int v7 = [(IFTSchemaIFTPlan *)self planSource] - 1;
    if (v7 > 4) {
      id v8 = @"IFTPLANSOURCE_UNKNOWN";
    }
    else {
      id v8 = off_1E5EBEAC0[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"planSource"];
  }
  if ([(NSArray *)self->_statements count])
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v10 = self->_statements;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (void)v18);
          if (v15)
          {
            [v9 addObject:v15];
          }
          else
          {
            v16 = [MEMORY[0x1E4F1CA98] null];
            [v9 addObject:v16];
          }
        }
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }

    [v3 setObject:v9 forKeyedSubscript:@"statements"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v18);
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_exists;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSArray *)self->_statements hash];
  NSUInteger v5 = [(NSString *)self->_overrideId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_planSource;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[36] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    int exists = self->_exists;
    if (exists != [v4 exists]) {
      goto LABEL_15;
    }
  }
  uint64_t v6 = [(IFTSchemaIFTPlan *)self statements];
  unsigned int v7 = [v4 statements];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_14;
  }
  uint64_t v8 = [(IFTSchemaIFTPlan *)self statements];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = [(IFTSchemaIFTPlan *)self statements];
    uint64_t v11 = [v4 statements];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  uint64_t v6 = [(IFTSchemaIFTPlan *)self overrideId];
  unsigned int v7 = [v4 overrideId];
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_14:

    goto LABEL_15;
  }
  uint64_t v13 = [(IFTSchemaIFTPlan *)self overrideId];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [(IFTSchemaIFTPlan *)self overrideId];
    v16 = [v4 overrideId];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  int v20 = (*(unsigned char *)&self->_has >> 1) & 1;
  if (v20 == ((v4[36] >> 1) & 1))
  {
    if (!v20 || (int planSource = self->_planSource, planSource == [v4 planSource]))
    {
      BOOL v18 = 1;
      goto LABEL_16;
    }
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
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  NSUInteger v5 = self->_statements;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [(IFTSchemaIFTPlan *)self overrideId];

  if (v10) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTPlanReadFrom(self, (uint64_t)a3);
}

- (void)deletePlanSource
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasPlanSource:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPlanSource
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPlanSource:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int planSource = a3;
}

- (void)deleteOverrideId
{
}

- (BOOL)hasOverrideId
{
  return self->_overrideId != 0;
}

- (id)statementsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_statements objectAtIndexedSubscript:a3];
}

- (unint64_t)statementsCount
{
  return [(NSArray *)self->_statements count];
}

- (void)addStatements:(id)a3
{
  id v4 = a3;
  statements = self->_statements;
  id v8 = v4;
  if (!statements)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_statements;
    self->_statements = v6;

    id v4 = v8;
    statements = self->_statements;
  }
  [(NSArray *)statements addObject:v4];
}

- (void)clearStatements
{
}

- (void)deleteExists
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasExists:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExists
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setExists:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int exists = a3;
}

@end