@interface QDSchemaQDRetrievedContextStatement
- (BOOL)hasContextType;
- (BOOL)hasSessionScopedUniqueId;
- (BOOL)hasValueType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (QDSchemaQDEntityType)valueType;
- (QDSchemaQDRetrievedContextStatement)initWithDictionary:(id)a3;
- (QDSchemaQDRetrievedContextStatement)initWithJSON:(id)a3;
- (SISchemaUUID)sessionScopedUniqueId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)contextType;
- (unint64_t)hash;
- (void)deleteContextType;
- (void)deleteSessionScopedUniqueId;
- (void)deleteValueType;
- (void)setContextType:(int)a3;
- (void)setHasContextType:(BOOL)a3;
- (void)setHasSessionScopedUniqueId:(BOOL)a3;
- (void)setHasValueType:(BOOL)a3;
- (void)setSessionScopedUniqueId:(id)a3;
- (void)setValueType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation QDSchemaQDRetrievedContextStatement

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)QDSchemaQDRetrievedContextStatement;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(QDSchemaQDRetrievedContextStatement *)self sessionScopedUniqueId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(QDSchemaQDRetrievedContextStatement *)self deleteSessionScopedUniqueId];
  }
  v9 = [(QDSchemaQDRetrievedContextStatement *)self valueType];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(QDSchemaQDRetrievedContextStatement *)self deleteValueType];
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

- (void)setValueType:(id)a3
{
}

- (QDSchemaQDEntityType)valueType
{
  return self->_valueType;
}

- (int)contextType
{
  return self->_contextType;
}

- (void)setSessionScopedUniqueId:(id)a3
{
}

- (SISchemaUUID)sessionScopedUniqueId
{
  return self->_sessionScopedUniqueId;
}

- (QDSchemaQDRetrievedContextStatement)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)QDSchemaQDRetrievedContextStatement;
  v5 = [(QDSchemaQDRetrievedContextStatement *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"sessionScopedUniqueId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(QDSchemaQDRetrievedContextStatement *)v5 setSessionScopedUniqueId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"contextType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[QDSchemaQDRetrievedContextStatement setContextType:](v5, "setContextType:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"valueType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[QDSchemaQDEntityType alloc] initWithDictionary:v9];
      [(QDSchemaQDRetrievedContextStatement *)v5 setValueType:v10];
    }
    int v11 = v5;
  }
  return v5;
}

- (QDSchemaQDRetrievedContextStatement)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(QDSchemaQDRetrievedContextStatement *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(QDSchemaQDRetrievedContextStatement *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v4 = [(QDSchemaQDRetrievedContextStatement *)self contextType] - 1;
    if (v4 > 0x19) {
      v5 = @"QDENTITYCONTEXTTYPE_UNKNOWN";
    }
    else {
      v5 = off_1E5EBF730[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"contextType"];
  }
  if (self->_sessionScopedUniqueId)
  {
    v6 = [(QDSchemaQDRetrievedContextStatement *)self sessionScopedUniqueId];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"sessionScopedUniqueId"];
    }
    else
    {
      int v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"sessionScopedUniqueId"];
    }
  }
  if (self->_valueType)
  {
    v9 = [(QDSchemaQDRetrievedContextStatement *)self valueType];
    v10 = [v9 dictionaryRepresentation];
    if (v10)
    {
      [v3 setObject:v10 forKeyedSubscript:@"valueType"];
    }
    else
    {
      int v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"valueType"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_sessionScopedUniqueId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_contextType;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(QDSchemaQDEntityType *)self->_valueType hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  v5 = [(QDSchemaQDRetrievedContextStatement *)self sessionScopedUniqueId];
  v6 = [v4 sessionScopedUniqueId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_14;
  }
  uint64_t v7 = [(QDSchemaQDRetrievedContextStatement *)self sessionScopedUniqueId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(QDSchemaQDRetrievedContextStatement *)self sessionScopedUniqueId];
    v10 = [v4 sessionScopedUniqueId];
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
    int contextType = self->_contextType;
    if (contextType != [v4 contextType]) {
      goto LABEL_15;
    }
  }
  v5 = [(QDSchemaQDRetrievedContextStatement *)self valueType];
  v6 = [v4 valueType];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v13 = [(QDSchemaQDRetrievedContextStatement *)self valueType];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    v15 = [(QDSchemaQDRetrievedContextStatement *)self valueType];
    v16 = [v4 valueType];
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
  id v9 = a3;
  uint64_t v4 = [(QDSchemaQDRetrievedContextStatement *)self sessionScopedUniqueId];

  if (v4)
  {
    v5 = [(QDSchemaQDRetrievedContextStatement *)self sessionScopedUniqueId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  v6 = [(QDSchemaQDRetrievedContextStatement *)self valueType];

  uint64_t v7 = v9;
  if (v6)
  {
    int v8 = [(QDSchemaQDRetrievedContextStatement *)self valueType];
    PBDataWriterWriteSubmessage();

    uint64_t v7 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return QDSchemaQDRetrievedContextStatementReadFrom(self, (uint64_t)a3);
}

- (void)deleteValueType
{
}

- (BOOL)hasValueType
{
  return self->_valueType != 0;
}

- (void)deleteContextType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasContextType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasContextType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setContextType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int contextType = a3;
}

- (void)deleteSessionScopedUniqueId
{
}

- (BOOL)hasSessionScopedUniqueId
{
  return self->_sessionScopedUniqueId != 0;
}

@end