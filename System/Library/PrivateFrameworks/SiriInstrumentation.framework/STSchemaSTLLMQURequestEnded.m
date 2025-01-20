@interface STSchemaSTLLMQURequestEnded
- (BOOL)hasLlmquPerfMetrics;
- (BOOL)hasModelNumber;
- (BOOL)hasQueryArguments;
- (BOOL)hasRequestLength;
- (BOOL)hasResponseLength;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)modelNumber;
- (STSchemaLLMQUPerfMetrics)llmquPerfMetrics;
- (STSchemaLLMQUQueryArguments)queryArguments;
- (STSchemaSTLLMQURequestEnded)initWithDictionary:(id)a3;
- (STSchemaSTLLMQURequestEnded)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)requestLength;
- (unsigned)responseLength;
- (void)deleteLlmquPerfMetrics;
- (void)deleteModelNumber;
- (void)deleteQueryArguments;
- (void)deleteRequestLength;
- (void)deleteResponseLength;
- (void)setHasLlmquPerfMetrics:(BOOL)a3;
- (void)setHasModelNumber:(BOOL)a3;
- (void)setHasQueryArguments:(BOOL)a3;
- (void)setHasRequestLength:(BOOL)a3;
- (void)setHasResponseLength:(BOOL)a3;
- (void)setLlmquPerfMetrics:(id)a3;
- (void)setModelNumber:(id)a3;
- (void)setQueryArguments:(id)a3;
- (void)setRequestLength:(unsigned int)a3;
- (void)setResponseLength:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation STSchemaSTLLMQURequestEnded

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STSchemaSTLLMQURequestEnded;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(STSchemaSTLLMQURequestEnded *)self queryArguments];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(STSchemaSTLLMQURequestEnded *)self deleteQueryArguments];
  }
  v9 = [(STSchemaSTLLMQURequestEnded *)self llmquPerfMetrics];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(STSchemaSTLLMQURequestEnded *)self deleteLlmquPerfMetrics];
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
  objc_storeStrong((id *)&self->_llmquPerfMetrics, 0);
  objc_storeStrong((id *)&self->_queryArguments, 0);
  objc_storeStrong((id *)&self->_modelNumber, 0);
}

- (void)setHasLlmquPerfMetrics:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasQueryArguments:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasModelNumber:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setLlmquPerfMetrics:(id)a3
{
}

- (STSchemaLLMQUPerfMetrics)llmquPerfMetrics
{
  return self->_llmquPerfMetrics;
}

- (void)setQueryArguments:(id)a3
{
}

- (STSchemaLLMQUQueryArguments)queryArguments
{
  return self->_queryArguments;
}

- (unsigned)responseLength
{
  return self->_responseLength;
}

- (unsigned)requestLength
{
  return self->_requestLength;
}

- (void)setModelNumber:(id)a3
{
}

- (NSString)modelNumber
{
  return self->_modelNumber;
}

- (STSchemaSTLLMQURequestEnded)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)STSchemaSTLLMQURequestEnded;
  v5 = [(STSchemaSTLLMQURequestEnded *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"modelNumber"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(STSchemaSTLLMQURequestEnded *)v5 setModelNumber:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"requestLength"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[STSchemaSTLLMQURequestEnded setRequestLength:](v5, "setRequestLength:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"responseLength"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[STSchemaSTLLMQURequestEnded setResponseLength:](v5, "setResponseLength:", [v9 unsignedIntValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"queryArguments"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[STSchemaLLMQUQueryArguments alloc] initWithDictionary:v10];
      [(STSchemaSTLLMQURequestEnded *)v5 setQueryArguments:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"llmquPerfMetrics"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v13 = [[STSchemaLLMQUPerfMetrics alloc] initWithDictionary:v12];
      [(STSchemaSTLLMQURequestEnded *)v5 setLlmquPerfMetrics:v13];
    }
    v14 = v5;
  }
  return v5;
}

- (STSchemaSTLLMQURequestEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(STSchemaSTLLMQURequestEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(STSchemaSTLLMQURequestEnded *)self dictionaryRepresentation];
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
  if (self->_llmquPerfMetrics)
  {
    id v4 = [(STSchemaSTLLMQURequestEnded *)self llmquPerfMetrics];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"llmquPerfMetrics"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"llmquPerfMetrics"];
    }
  }
  if (self->_modelNumber)
  {
    uint64_t v7 = [(STSchemaSTLLMQURequestEnded *)self modelNumber];
    int v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"modelNumber"];
  }
  if (self->_queryArguments)
  {
    v9 = [(STSchemaSTLLMQURequestEnded *)self queryArguments];
    v10 = [v9 dictionaryRepresentation];
    if (v10)
    {
      [v3 setObject:v10 forKeyedSubscript:@"queryArguments"];
    }
    else
    {
      int v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"queryArguments"];
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    objc_super v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[STSchemaSTLLMQURequestEnded requestLength](self, "requestLength"));
    [v3 setObject:v13 forKeyedSubscript:@"requestLength"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[STSchemaSTLLMQURequestEnded responseLength](self, "responseLength"));
    [v3 setObject:v14 forKeyedSubscript:@"responseLength"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_modelNumber hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_requestLength;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    goto LABEL_6;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_responseLength;
LABEL_6:
  unint64_t v6 = v4 ^ v3 ^ v5 ^ [(STSchemaLLMQUQueryArguments *)self->_queryArguments hash];
  return v6 ^ [(STSchemaLLMQUPerfMetrics *)self->_llmquPerfMetrics hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  uint64_t v5 = [(STSchemaSTLLMQURequestEnded *)self modelNumber];
  unint64_t v6 = [v4 modelNumber];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_23;
  }
  uint64_t v7 = [(STSchemaSTLLMQURequestEnded *)self modelNumber];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(STSchemaSTLLMQURequestEnded *)self modelNumber];
    v10 = [v4 modelNumber];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_24;
    }
  }
  else
  {
  }
  $AB31668DCB6723E8EBE46CC2A0392A94 has = self->_has;
  unsigned int v13 = v4[40];
  if ((*(unsigned char *)&has & 1) != (v13 & 1)) {
    goto LABEL_24;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int requestLength = self->_requestLength;
    if (requestLength != [v4 requestLength]) {
      goto LABEL_24;
    }
    $AB31668DCB6723E8EBE46CC2A0392A94 has = self->_has;
    unsigned int v13 = v4[40];
  }
  int v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1)) {
    goto LABEL_24;
  }
  if (v15)
  {
    unsigned int responseLength = self->_responseLength;
    if (responseLength != [v4 responseLength]) {
      goto LABEL_24;
    }
  }
  uint64_t v5 = [(STSchemaSTLLMQURequestEnded *)self queryArguments];
  unint64_t v6 = [v4 queryArguments];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_23;
  }
  uint64_t v17 = [(STSchemaSTLLMQURequestEnded *)self queryArguments];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(STSchemaSTLLMQURequestEnded *)self queryArguments];
    v20 = [v4 queryArguments];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_24;
    }
  }
  else
  {
  }
  uint64_t v5 = [(STSchemaSTLLMQURequestEnded *)self llmquPerfMetrics];
  unint64_t v6 = [v4 llmquPerfMetrics];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_23:

    goto LABEL_24;
  }
  uint64_t v22 = [(STSchemaSTLLMQURequestEnded *)self llmquPerfMetrics];
  if (!v22)
  {

LABEL_27:
    BOOL v27 = 1;
    goto LABEL_25;
  }
  v23 = (void *)v22;
  v24 = [(STSchemaSTLLMQURequestEnded *)self llmquPerfMetrics];
  v25 = [v4 llmquPerfMetrics];
  char v26 = [v24 isEqual:v25];

  if (v26) {
    goto LABEL_27;
  }
LABEL_24:
  BOOL v27 = 0;
LABEL_25:

  return v27;
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  uint64_t v4 = [(STSchemaSTLLMQURequestEnded *)self modelNumber];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  unint64_t v6 = [(STSchemaSTLLMQURequestEnded *)self queryArguments];

  if (v6)
  {
    uint64_t v7 = [(STSchemaSTLLMQURequestEnded *)self queryArguments];
    PBDataWriterWriteSubmessage();
  }
  int v8 = [(STSchemaSTLLMQURequestEnded *)self llmquPerfMetrics];

  v9 = v11;
  if (v8)
  {
    v10 = [(STSchemaSTLLMQURequestEnded *)self llmquPerfMetrics];
    PBDataWriterWriteSubmessage();

    v9 = v11;
  }
}

- (BOOL)readFrom:(id)a3
{
  return STSchemaSTLLMQURequestEndedReadFrom(self, (uint64_t)a3);
}

- (void)deleteLlmquPerfMetrics
{
}

- (BOOL)hasLlmquPerfMetrics
{
  return self->_llmquPerfMetrics != 0;
}

- (void)deleteQueryArguments
{
}

- (BOOL)hasQueryArguments
{
  return self->_queryArguments != 0;
}

- (void)deleteResponseLength
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasResponseLength:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasResponseLength
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setResponseLength:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int responseLength = a3;
}

- (void)deleteRequestLength
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasRequestLength:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRequestLength
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRequestLength:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int requestLength = a3;
}

- (void)deleteModelNumber
{
}

- (BOOL)hasModelNumber
{
  return self->_modelNumber != 0;
}

@end