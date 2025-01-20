@interface FLOWSchemaFLOWKGQAExecution
- (BOOL)hasIsDisputedResponse;
- (BOOL)hasIsWebExtractedFact;
- (BOOL)hasKgQAUsecase;
- (BOOL)hasNlgKey;
- (BOOL)isDisputedResponse;
- (BOOL)isEqual:(id)a3;
- (BOOL)isWebExtractedFact;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWKGQAExecution)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWKGQAExecution)initWithJSON:(id)a3;
- (NSArray)attributes;
- (NSData)jsonData;
- (NSString)nlgKey;
- (id)attributesAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)kgQAUsecase;
- (unint64_t)attributesCount;
- (unint64_t)hash;
- (void)addAttributes:(id)a3;
- (void)clearAttributes;
- (void)deleteIsDisputedResponse;
- (void)deleteIsWebExtractedFact;
- (void)deleteKgQAUsecase;
- (void)deleteNlgKey;
- (void)setAttributes:(id)a3;
- (void)setHasIsDisputedResponse:(BOOL)a3;
- (void)setHasIsWebExtractedFact:(BOOL)a3;
- (void)setHasKgQAUsecase:(BOOL)a3;
- (void)setHasNlgKey:(BOOL)a3;
- (void)setIsDisputedResponse:(BOOL)a3;
- (void)setIsWebExtractedFact:(BOOL)a3;
- (void)setKgQAUsecase:(int)a3;
- (void)setNlgKey:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWKGQAExecution

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nlgKey, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

- (void)setHasNlgKey:(BOOL)a3
{
  *(&self->_isWebExtractedFact + 2) = a3;
}

- (BOOL)isWebExtractedFact
{
  return self->_isWebExtractedFact;
}

- (void)setNlgKey:(id)a3
{
}

- (NSString)nlgKey
{
  return self->_nlgKey;
}

- (BOOL)isDisputedResponse
{
  return self->_isDisputedResponse;
}

- (void)setAttributes:(id)a3
{
}

- (NSArray)attributes
{
  return self->_attributes;
}

- (int)kgQAUsecase
{
  return self->_kgQAUsecase;
}

- (FLOWSchemaFLOWKGQAExecution)initWithDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)FLOWSchemaFLOWKGQAExecution;
  v5 = [(FLOWSchemaFLOWKGQAExecution *)&v25 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"kgQAUsecase"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWKGQAExecution setKgQAUsecase:](v5, "setKgQAUsecase:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"attributes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
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
            v13 = *(void **)(*((void *)&v21 + 1) + 8 * v12);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v14 = objc_msgSend(v13, "copy", (void)v21);
              [(FLOWSchemaFLOWKGQAExecution *)v5 addAttributes:v14];
            }
            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
        }
        while (v10);
      }
    }
    v15 = objc_msgSend(v4, "objectForKeyedSubscript:", @"isDisputedResponse", (void)v21);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWKGQAExecution setIsDisputedResponse:](v5, "setIsDisputedResponse:", [v15 BOOLValue]);
    }
    v16 = [v4 objectForKeyedSubscript:@"nlgKey"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(FLOWSchemaFLOWKGQAExecution *)v5 setNlgKey:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"isWebExtractedFact"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWKGQAExecution setIsWebExtractedFact:](v5, "setIsWebExtractedFact:", [v18 BOOLValue]);
    }
    v19 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWKGQAExecution)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWKGQAExecution *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWKGQAExecution *)self dictionaryRepresentation];
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
  if (self->_attributes)
  {
    id v4 = [(FLOWSchemaFLOWKGQAExecution *)self attributes];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"attributes"];
  }
  char v6 = *(&self->_isWebExtractedFact + 1);
  if ((v6 & 2) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[FLOWSchemaFLOWKGQAExecution isDisputedResponse](self, "isDisputedResponse"));
    [v3 setObject:v7 forKeyedSubscript:@"isDisputedResponse"];

    char v6 = *(&self->_isWebExtractedFact + 1);
    if ((v6 & 4) == 0)
    {
LABEL_5:
      if ((v6 & 1) == 0) {
        goto LABEL_13;
      }
      goto LABEL_9;
    }
  }
  else if ((*(&self->_isWebExtractedFact + 1) & 4) == 0)
  {
    goto LABEL_5;
  }
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", -[FLOWSchemaFLOWKGQAExecution isWebExtractedFact](self, "isWebExtractedFact"));
  [v3 setObject:v8 forKeyedSubscript:@"isWebExtractedFact"];

  if (!*(&self->_isWebExtractedFact + 1)) {
    goto LABEL_13;
  }
LABEL_9:
  unsigned int v9 = [(FLOWSchemaFLOWKGQAExecution *)self kgQAUsecase] - 1;
  if (v9 > 6) {
    uint64_t v10 = @"FLOWKGQAUSECASE_UNKNOWN";
  }
  else {
    uint64_t v10 = off_1E5EAEEB8[v9];
  }
  [v3 setObject:v10 forKeyedSubscript:@"kgQAUsecase"];
LABEL_13:
  if (self->_nlgKey)
  {
    uint64_t v11 = [(FLOWSchemaFLOWKGQAExecution *)self nlgKey];
    uint64_t v12 = (void *)[v11 copy];
    [v3 setObject:v12 forKeyedSubscript:@"nlgKey"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_isWebExtractedFact + 1)) {
    uint64_t v3 = 2654435761 * self->_kgQAUsecase;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSArray *)self->_attributes hash];
  if ((*(&self->_isWebExtractedFact + 1) & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_isDisputedResponse;
  }
  else {
    uint64_t v5 = 0;
  }
  NSUInteger v6 = [(NSString *)self->_nlgKey hash];
  if ((*(&self->_isWebExtractedFact + 1) & 4) != 0) {
    uint64_t v7 = 2654435761 * self->_isWebExtractedFact;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  if (*(&self->_isWebExtractedFact + 1) != (v4[41] & 1)) {
    goto LABEL_18;
  }
  if (*(&self->_isWebExtractedFact + 1))
  {
    int kgQAUsecase = self->_kgQAUsecase;
    if (kgQAUsecase != [v4 kgQAUsecase]) {
      goto LABEL_18;
    }
  }
  NSUInteger v6 = [(FLOWSchemaFLOWKGQAExecution *)self attributes];
  uint64_t v7 = [v4 attributes];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v8 = [(FLOWSchemaFLOWKGQAExecution *)self attributes];
  if (v8)
  {
    unsigned int v9 = (void *)v8;
    uint64_t v10 = [(FLOWSchemaFLOWKGQAExecution *)self attributes];
    uint64_t v11 = [v4 attributes];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  int v13 = (*((unsigned __int8 *)&self->_isWebExtractedFact + 1) >> 1) & 1;
  if (v13 != ((v4[41] >> 1) & 1)) {
    goto LABEL_18;
  }
  if (v13)
  {
    int isDisputedResponse = self->_isDisputedResponse;
    if (isDisputedResponse != [v4 isDisputedResponse]) {
      goto LABEL_18;
    }
  }
  NSUInteger v6 = [(FLOWSchemaFLOWKGQAExecution *)self nlgKey];
  uint64_t v7 = [v4 nlgKey];
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_17:

    goto LABEL_18;
  }
  uint64_t v15 = [(FLOWSchemaFLOWKGQAExecution *)self nlgKey];
  if (v15)
  {
    v16 = (void *)v15;
    v17 = [(FLOWSchemaFLOWKGQAExecution *)self nlgKey];
    v18 = [v4 nlgKey];
    int v19 = [v17 isEqual:v18];

    if (!v19) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  int v22 = (*((unsigned __int8 *)&self->_isWebExtractedFact + 1) >> 2) & 1;
  if (v22 == ((v4[41] >> 2) & 1))
  {
    if (!v22
      || (int isWebExtractedFact = self->_isWebExtractedFact,
          isWebExtractedFact == [v4 isWebExtractedFact]))
    {
      BOOL v20 = 1;
      goto LABEL_19;
    }
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
  if (*(&self->_isWebExtractedFact + 1)) {
    PBDataWriterWriteInt32Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = self->_attributes;
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
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  if ((*(&self->_isWebExtractedFact + 1) & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v10 = [(FLOWSchemaFLOWKGQAExecution *)self nlgKey];

  if (v10) {
    PBDataWriterWriteStringField();
  }
  if ((*(&self->_isWebExtractedFact + 1) & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWKGQAExecutionReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsWebExtractedFact
{
  *(&self->_isWebExtractedFact + 1) &= ~4u;
}

- (void)setHasIsWebExtractedFact:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isWebExtractedFact + 1) = *(&self->_isWebExtractedFact + 1) & 0xFB | v3;
}

- (BOOL)hasIsWebExtractedFact
{
  return (*((unsigned __int8 *)&self->_isWebExtractedFact + 1) >> 2) & 1;
}

- (void)setIsWebExtractedFact:(BOOL)a3
{
  *(&self->_isWebExtractedFact + 1) |= 4u;
  self->_int isWebExtractedFact = a3;
}

- (void)deleteNlgKey
{
}

- (BOOL)hasNlgKey
{
  return self->_nlgKey != 0;
}

- (void)deleteIsDisputedResponse
{
  *(&self->_isWebExtractedFact + 1) &= ~2u;
}

- (void)setHasIsDisputedResponse:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isWebExtractedFact + 1) = *(&self->_isWebExtractedFact + 1) & 0xFD | v3;
}

- (BOOL)hasIsDisputedResponse
{
  return (*((unsigned __int8 *)&self->_isWebExtractedFact + 1) >> 1) & 1;
}

- (void)setIsDisputedResponse:(BOOL)a3
{
  *(&self->_isWebExtractedFact + 1) |= 2u;
  self->_int isDisputedResponse = a3;
}

- (id)attributesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_attributes objectAtIndexedSubscript:a3];
}

- (unint64_t)attributesCount
{
  return [(NSArray *)self->_attributes count];
}

- (void)addAttributes:(id)a3
{
  id v4 = a3;
  attributes = self->_attributes;
  id v8 = v4;
  if (!attributes)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_attributes;
    self->_attributes = v6;

    id v4 = v8;
    attributes = self->_attributes;
  }
  [(NSArray *)attributes addObject:v4];
}

- (void)clearAttributes
{
}

- (void)deleteKgQAUsecase
{
  *(&self->_isWebExtractedFact + 1) &= ~1u;
}

- (void)setHasKgQAUsecase:(BOOL)a3
{
  *(&self->_isWebExtractedFact + 1) = *(&self->_isWebExtractedFact + 1) & 0xFE | a3;
}

- (BOOL)hasKgQAUsecase
{
  return *(&self->_isWebExtractedFact + 1);
}

- (void)setKgQAUsecase:(int)a3
{
  *(&self->_isWebExtractedFact + 1) |= 1u;
  self->_int kgQAUsecase = a3;
}

@end