@interface DODMLASRSchemaDODMLASRResultInfo
- (BOOL)hasIsAligned;
- (BOOL)hasStageName;
- (BOOL)isAligned;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DODMLASRSchemaDODMLASRResultInfo)initWithDictionary:(id)a3;
- (DODMLASRSchemaDODMLASRResultInfo)initWithJSON:(id)a3;
- (NSArray)choices;
- (NSData)jsonData;
- (NSString)stageName;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)choicesAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)choicesCount;
- (unint64_t)hash;
- (void)addChoices:(id)a3;
- (void)clearChoices;
- (void)deleteIsAligned;
- (void)deleteStageName;
- (void)setChoices:(id)a3;
- (void)setHasIsAligned:(BOOL)a3;
- (void)setHasStageName:(BOOL)a3;
- (void)setIsAligned:(BOOL)a3;
- (void)setStageName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation DODMLASRSchemaDODMLASRResultInfo

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)DODMLASRSchemaDODMLASRResultInfo;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(DODMLASRSchemaDODMLASRResultInfo *)self choices];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];

  [(DODMLASRSchemaDODMLASRResultInfo *)self setChoices:v7];
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
  objc_storeStrong((id *)&self->_choices, 0);
  objc_storeStrong((id *)&self->_stageName, 0);
}

- (void)setHasStageName:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setChoices:(id)a3
{
}

- (NSArray)choices
{
  return self->_choices;
}

- (BOOL)isAligned
{
  return self->_isAligned;
}

- (void)setStageName:(id)a3
{
}

- (NSString)stageName
{
  return self->_stageName;
}

- (DODMLASRSchemaDODMLASRResultInfo)initWithDictionary:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)DODMLASRSchemaDODMLASRResultInfo;
  v5 = [(DODMLASRSchemaDODMLASRResultInfo *)&v24 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"stageName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(DODMLASRSchemaDODMLASRResultInfo *)v5 setStageName:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"isAligned"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRResultInfo setIsAligned:](v5, "setIsAligned:", [v8 BOOLValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"choices"];
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
              v16 = [[DODMLASRSchemaDODMLASRChoiceInfo alloc] initWithDictionary:v15];
              [(DODMLASRSchemaDODMLASRResultInfo *)v5 addChoices:v16];
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

- (DODMLASRSchemaDODMLASRResultInfo)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(DODMLASRSchemaDODMLASRResultInfo *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(DODMLASRSchemaDODMLASRResultInfo *)self dictionaryRepresentation];
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
  if ([(NSArray *)self->_choices count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v5 = self->_choices;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"choices"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", -[DODMLASRSchemaDODMLASRResultInfo isAligned](self, "isAligned"));
    [v3 setObject:v12 forKeyedSubscript:@"isAligned"];
  }
  if (self->_stageName)
  {
    uint64_t v13 = [(DODMLASRSchemaDODMLASRResultInfo *)self stageName];
    v14 = (void *)[v13 copy];
    [v3 setObject:v14 forKeyedSubscript:@"stageName"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v16);
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_stageName hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_isAligned;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(NSArray *)self->_choices hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  v5 = [(DODMLASRSchemaDODMLASRResultInfo *)self stageName];
  uint64_t v6 = [v4 stageName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_14;
  }
  uint64_t v7 = [(DODMLASRSchemaDODMLASRResultInfo *)self stageName];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    objc_super v9 = [(DODMLASRSchemaDODMLASRResultInfo *)self stageName];
    id v10 = [v4 stageName];
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
    int isAligned = self->_isAligned;
    if (isAligned != [v4 isAligned]) {
      goto LABEL_15;
    }
  }
  v5 = [(DODMLASRSchemaDODMLASRResultInfo *)self choices];
  uint64_t v6 = [v4 choices];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v13 = [(DODMLASRSchemaDODMLASRResultInfo *)self choices];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    uint64_t v15 = [(DODMLASRSchemaDODMLASRResultInfo *)self choices];
    long long v16 = [v4 choices];
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
  v5 = [(DODMLASRSchemaDODMLASRResultInfo *)self stageName];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = self->_choices;
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
  return DODMLASRSchemaDODMLASRResultInfoReadFrom(self, (uint64_t)a3);
}

- (id)choicesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_choices objectAtIndexedSubscript:a3];
}

- (unint64_t)choicesCount
{
  return [(NSArray *)self->_choices count];
}

- (void)addChoices:(id)a3
{
  id v4 = a3;
  choices = self->_choices;
  id v8 = v4;
  if (!choices)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_choices;
    self->_choices = v6;

    id v4 = v8;
    choices = self->_choices;
  }
  [(NSArray *)choices addObject:v4];
}

- (void)clearChoices
{
}

- (void)deleteIsAligned
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsAligned:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsAligned
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsAligned:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isAligned = a3;
}

- (void)deleteStageName
{
}

- (BOOL)hasStageName
{
  return self->_stageName != 0;
}

@end