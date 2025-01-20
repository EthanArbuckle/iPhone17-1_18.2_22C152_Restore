@interface SISchemaUUFRCompletion
- (BOOL)hasCompletionStatus;
- (BOOL)hasSiriResponseContext;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)homeKitAccessoryResponses;
- (NSData)jsonData;
- (SISchemaSiriResponseContext)siriResponseContext;
- (SISchemaUUFRCompletion)initWithDictionary:(id)a3;
- (SISchemaUUFRCompletion)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)homeKitAccessoryResponseAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)completionStatus;
- (unint64_t)hash;
- (unint64_t)homeKitAccessoryResponseCount;
- (void)addHomeKitAccessoryResponse:(id)a3;
- (void)clearHomeKitAccessoryResponse;
- (void)deleteCompletionStatus;
- (void)deleteSiriResponseContext;
- (void)setCompletionStatus:(int)a3;
- (void)setHasCompletionStatus:(BOOL)a3;
- (void)setHasSiriResponseContext:(BOOL)a3;
- (void)setHomeKitAccessoryResponses:(id)a3;
- (void)setSiriResponseContext:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaUUFRCompletion

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SISchemaUUFRCompletion;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v11 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaUUFRCompletion *)self homeKitAccessoryResponses];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(SISchemaUUFRCompletion *)self setHomeKitAccessoryResponses:v7];

  v8 = [(SISchemaUUFRCompletion *)self siriResponseContext];
  v9 = [v8 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v9 suppressMessage];
  if (v4) {
    [(SISchemaUUFRCompletion *)self deleteSiriResponseContext];
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
  objc_storeStrong((id *)&self->_siriResponseContext, 0);
  objc_storeStrong((id *)&self->_homeKitAccessoryResponses, 0);
}

- (void)setHasSiriResponseContext:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setSiriResponseContext:(id)a3
{
}

- (SISchemaSiriResponseContext)siriResponseContext
{
  return self->_siriResponseContext;
}

- (void)setHomeKitAccessoryResponses:(id)a3
{
}

- (NSArray)homeKitAccessoryResponses
{
  return self->_homeKitAccessoryResponses;
}

- (int)completionStatus
{
  return self->_completionStatus;
}

- (SISchemaUUFRCompletion)initWithDictionary:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SISchemaUUFRCompletion;
  v5 = [(SISchemaUUFRCompletion *)&v24 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"completionStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUUFRCompletion setCompletionStatus:](v5, "setCompletionStatus:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"homeKitAccessoryResponse"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = v6;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v21;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v21 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * v12);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v14 = [[SISchemaHomeKitAccessoryResponse alloc] initWithDictionary:v13];
              [(SISchemaUUFRCompletion *)v5 addHomeKitAccessoryResponse:v14];
            }
            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v10);
      }

      v6 = v19;
    }
    v15 = [v4 objectForKeyedSubscript:@"siriResponseContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = [[SISchemaSiriResponseContext alloc] initWithDictionary:v15];
      [(SISchemaUUFRCompletion *)v5 setSiriResponseContext:v16];
    }
    v17 = v5;
  }
  return v5;
}

- (SISchemaUUFRCompletion)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaUUFRCompletion *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaUUFRCompletion *)self dictionaryRepresentation];
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
    unsigned int v4 = [(SISchemaUUFRCompletion *)self completionStatus] - 2;
    if (v4 > 4) {
      v5 = @"COMPLETIONSTATUS_UNKNOWN_COMPLETION_STATUS";
    }
    else {
      v5 = off_1E5EB8C28[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"completionStatus"];
  }
  if ([(NSArray *)self->_homeKitAccessoryResponses count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v7 = self->_homeKitAccessoryResponses;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (void)v18);
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
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"homeKitAccessoryResponse"];
  }
  if (self->_siriResponseContext)
  {
    v14 = [(SISchemaUUFRCompletion *)self siriResponseContext];
    v15 = [v14 dictionaryRepresentation];
    if (v15)
    {
      [v3 setObject:v15 forKeyedSubscript:@"siriResponseContext"];
    }
    else
    {
      v16 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v16 forKeyedSubscript:@"siriResponseContext"];
    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v18);
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_completionStatus;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSArray *)self->_homeKitAccessoryResponses hash] ^ v3;
  return v4 ^ [(SISchemaSiriResponseContext *)self->_siriResponseContext hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[32] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    int completionStatus = self->_completionStatus;
    if (completionStatus != [v4 completionStatus]) {
      goto LABEL_15;
    }
  }
  v6 = [(SISchemaUUFRCompletion *)self homeKitAccessoryResponses];
  uint64_t v7 = [v4 homeKitAccessoryResponses];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_14;
  }
  uint64_t v8 = [(SISchemaUUFRCompletion *)self homeKitAccessoryResponses];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = [(SISchemaUUFRCompletion *)self homeKitAccessoryResponses];
    uint64_t v11 = [v4 homeKitAccessoryResponses];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  v6 = [(SISchemaUUFRCompletion *)self siriResponseContext];
  uint64_t v7 = [v4 siriResponseContext];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v13 = [(SISchemaUUFRCompletion *)self siriResponseContext];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    v15 = [(SISchemaUUFRCompletion *)self siriResponseContext];
    v16 = [v4 siriResponseContext];
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
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_homeKitAccessoryResponses;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [(SISchemaUUFRCompletion *)self siriResponseContext];

  if (v10)
  {
    uint64_t v11 = [(SISchemaUUFRCompletion *)self siriResponseContext];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUUFRCompletionReadFrom(self, (uint64_t)a3);
}

- (void)deleteSiriResponseContext
{
}

- (BOOL)hasSiriResponseContext
{
  return self->_siriResponseContext != 0;
}

- (id)homeKitAccessoryResponseAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_homeKitAccessoryResponses objectAtIndexedSubscript:a3];
}

- (unint64_t)homeKitAccessoryResponseCount
{
  return [(NSArray *)self->_homeKitAccessoryResponses count];
}

- (void)addHomeKitAccessoryResponse:(id)a3
{
  id v4 = a3;
  homeKitAccessoryResponses = self->_homeKitAccessoryResponses;
  id v8 = v4;
  if (!homeKitAccessoryResponses)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_homeKitAccessoryResponses;
    self->_homeKitAccessoryResponses = v6;

    id v4 = v8;
    homeKitAccessoryResponses = self->_homeKitAccessoryResponses;
  }
  [(NSArray *)homeKitAccessoryResponses addObject:v4];
}

- (void)clearHomeKitAccessoryResponse
{
}

- (void)deleteCompletionStatus
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasCompletionStatus:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCompletionStatus
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCompletionStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int completionStatus = a3;
}

@end