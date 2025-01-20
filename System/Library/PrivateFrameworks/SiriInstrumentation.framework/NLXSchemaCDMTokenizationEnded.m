@interface NLXSchemaCDMTokenizationEnded
- (BOOL)hasContextId;
- (BOOL)hasInputType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaCDMTokenizationEnded)initWithDictionary:(id)a3;
- (NLXSchemaCDMTokenizationEnded)initWithJSON:(id)a3;
- (NSArray)tokenChains;
- (NSData)jsonData;
- (SISchemaUUID)contextId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (id)tokenChainsAtIndex:(unint64_t)a3;
- (int)inputType;
- (unint64_t)hash;
- (unint64_t)tokenChainsCount;
- (void)addTokenChains:(id)a3;
- (void)clearTokenChains;
- (void)deleteContextId;
- (void)deleteInputType;
- (void)setContextId:(id)a3;
- (void)setHasContextId:(BOOL)a3;
- (void)setHasInputType:(BOOL)a3;
- (void)setInputType:(int)a3;
- (void)setTokenChains:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaCDMTokenizationEnded

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NLXSchemaCDMTokenizationEnded;
  v5 = [(SISchemaInstrumentationMessage *)&v12 applySensitiveConditionsPolicy:v4];
  v6 = [(NLXSchemaCDMTokenizationEnded *)self contextId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(NLXSchemaCDMTokenizationEnded *)self deleteContextId];
  }
  v9 = [(NLXSchemaCDMTokenizationEnded *)self tokenChains];
  v10 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v9 underConditions:v4];
  [(NLXSchemaCDMTokenizationEnded *)self setTokenChains:v10];

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
  objc_storeStrong((id *)&self->_tokenChains, 0);
  objc_storeStrong((id *)&self->_contextId, 0);
}

- (void)setHasContextId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)inputType
{
  return self->_inputType;
}

- (void)setTokenChains:(id)a3
{
}

- (NSArray)tokenChains
{
  return self->_tokenChains;
}

- (void)setContextId:(id)a3
{
}

- (SISchemaUUID)contextId
{
  return self->_contextId;
}

- (NLXSchemaCDMTokenizationEnded)initWithDictionary:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NLXSchemaCDMTokenizationEnded;
  v5 = [(NLXSchemaCDMTokenizationEnded *)&v24 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"contextId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(NLXSchemaCDMTokenizationEnded *)v5 setContextId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"tokenChains"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = v6;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v21;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v21 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = [[NLXSchemaCDMTokenChain alloc] initWithDictionary:v14];
              [(NLXSchemaCDMTokenizationEnded *)v5 addTokenChains:v15];
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v11);
      }

      v6 = v19;
    }
    v16 = [v4 objectForKeyedSubscript:@"inputType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMTokenizationEnded setInputType:](v5, "setInputType:", [v16 intValue]);
    }
    v17 = v5;
  }
  return v5;
}

- (NLXSchemaCDMTokenizationEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaCDMTokenizationEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaCDMTokenizationEnded *)self dictionaryRepresentation];
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
  if (self->_contextId)
  {
    id v4 = [(NLXSchemaCDMTokenizationEnded *)self contextId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"contextId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"contextId"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v7 = [(NLXSchemaCDMTokenizationEnded *)self inputType] - 1;
    if (v7 > 2) {
      int v8 = @"CDMTOKENIZATIONINPUTTYPE_UNKNOWN";
    }
    else {
      int v8 = off_1E5EB3298[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"inputType"];
  }
  if ([(NSArray *)self->_tokenChains count])
  {
    id v9 = [MEMORY[0x1E4F1CA48] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v10 = self->_tokenChains;
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

    [v3 setObject:v9 forKeyedSubscript:@"tokenChains"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v18);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_contextId hash];
  uint64_t v4 = [(NSArray *)self->_tokenChains hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_inputType;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(NLXSchemaCDMTokenizationEnded *)self contextId];
  v6 = [v4 contextId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(NLXSchemaCDMTokenizationEnded *)self contextId];
  if (v7)
  {
    int v8 = (void *)v7;
    id v9 = [(NLXSchemaCDMTokenizationEnded *)self contextId];
    uint64_t v10 = [v4 contextId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(NLXSchemaCDMTokenizationEnded *)self tokenChains];
  v6 = [v4 tokenChains];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(NLXSchemaCDMTokenizationEnded *)self tokenChains];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(NLXSchemaCDMTokenizationEnded *)self tokenChains];
    v15 = [v4 tokenChains];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) == (v4[28] & 1))
  {
    if ((*(unsigned char *)&self->_has & 1) == 0
      || (int inputType = self->_inputType, inputType == [v4 inputType]))
    {
      BOOL v17 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NLXSchemaCDMTokenizationEnded *)self contextId];

  if (v5)
  {
    v6 = [(NLXSchemaCDMTokenizationEnded *)self contextId];
    PBDataWriterWriteSubmessage();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = self->_tokenChains;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMTokenizationEndedReadFrom(self, (uint64_t)a3);
}

- (void)deleteInputType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasInputType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasInputType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setInputType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int inputType = a3;
}

- (id)tokenChainsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_tokenChains objectAtIndexedSubscript:a3];
}

- (unint64_t)tokenChainsCount
{
  return [(NSArray *)self->_tokenChains count];
}

- (void)addTokenChains:(id)a3
{
  id v4 = a3;
  tokenChains = self->_tokenChains;
  id v8 = v4;
  if (!tokenChains)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_tokenChains;
    self->_tokenChains = v6;

    id v4 = v8;
    tokenChains = self->_tokenChains;
  }
  [(NSArray *)tokenChains addObject:v4];
}

- (void)clearTokenChains
{
}

- (void)deleteContextId
{
}

- (BOOL)hasContextId
{
  return self->_contextId != 0;
}

@end