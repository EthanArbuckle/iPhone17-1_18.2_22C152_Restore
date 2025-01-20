@interface IFTSchemaIFTCandidate
- (BOOL)hasPromptStatus;
- (BOOL)hasSource;
- (BOOL)hasStatementId;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTCandidate)initWithDictionary:(id)a3;
- (IFTSchemaIFTCandidate)initWithJSON:(id)a3;
- (IFTSchemaIFTCandidatePromptStatus)promptStatus;
- (IFTSchemaIFTStatementId)statementId;
- (IFTSchemaIFTTypedValue)value;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)source;
- (unint64_t)hash;
- (void)deletePromptStatus;
- (void)deleteSource;
- (void)deleteStatementId;
- (void)deleteValue;
- (void)setHasPromptStatus:(BOOL)a3;
- (void)setHasSource:(BOOL)a3;
- (void)setHasStatementId:(BOOL)a3;
- (void)setHasValue:(BOOL)a3;
- (void)setPromptStatus:(id)a3;
- (void)setSource:(int)a3;
- (void)setStatementId:(id)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTCandidate

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)IFTSchemaIFTCandidate;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  v6 = [(IFTSchemaIFTCandidate *)self statementId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(IFTSchemaIFTCandidate *)self deleteStatementId];
  }
  v9 = [(IFTSchemaIFTCandidate *)self promptStatus];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(IFTSchemaIFTCandidate *)self deletePromptStatus];
  }
  v12 = [(IFTSchemaIFTCandidate *)self value];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(IFTSchemaIFTCandidate *)self deleteValue];
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
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_promptStatus, 0);
  objc_storeStrong((id *)&self->_statementId, 0);
}

- (void)setHasValue:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasPromptStatus:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasStatementId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setValue:(id)a3
{
}

- (IFTSchemaIFTTypedValue)value
{
  return self->_value;
}

- (void)setPromptStatus:(id)a3
{
}

- (IFTSchemaIFTCandidatePromptStatus)promptStatus
{
  return self->_promptStatus;
}

- (int)source
{
  return self->_source;
}

- (void)setStatementId:(id)a3
{
}

- (IFTSchemaIFTStatementId)statementId
{
  return self->_statementId;
}

- (IFTSchemaIFTCandidate)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IFTSchemaIFTCandidate;
  v5 = [(IFTSchemaIFTCandidate *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"statementId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[IFTSchemaIFTStatementId alloc] initWithDictionary:v6];
      [(IFTSchemaIFTCandidate *)v5 setStatementId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"source"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTCandidate setSource:](v5, "setSource:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"promptStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[IFTSchemaIFTCandidatePromptStatus alloc] initWithDictionary:v9];
      [(IFTSchemaIFTCandidate *)v5 setPromptStatus:v10];
    }
    int v11 = [v4 objectForKeyedSubscript:@"value"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [[IFTSchemaIFTTypedValue alloc] initWithDictionary:v11];
      [(IFTSchemaIFTCandidate *)v5 setValue:v12];
    }
    v13 = v5;
  }
  return v5;
}

- (IFTSchemaIFTCandidate)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTCandidate *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTCandidate *)self dictionaryRepresentation];
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
  if (self->_promptStatus)
  {
    id v4 = [(IFTSchemaIFTCandidate *)self promptStatus];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"promptStatus"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"promptStatus"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v7 = [(IFTSchemaIFTCandidate *)self source] - 1;
    if (v7 > 7) {
      int v8 = @"IFTCANDIDATESOURCE_UNKNOWN";
    }
    else {
      int v8 = off_1E5EBF548[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"source"];
  }
  if (self->_statementId)
  {
    v9 = [(IFTSchemaIFTCandidate *)self statementId];
    v10 = [v9 dictionaryRepresentation];
    if (v10)
    {
      [v3 setObject:v10 forKeyedSubscript:@"statementId"];
    }
    else
    {
      int v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"statementId"];
    }
  }
  if (self->_value)
  {
    v12 = [(IFTSchemaIFTCandidate *)self value];
    v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"value"];
    }
    else
    {
      int v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"value"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(IFTSchemaIFTStatementId *)self->_statementId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_source;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = v4 ^ v3;
  unint64_t v6 = [(IFTSchemaIFTCandidatePromptStatus *)self->_promptStatus hash];
  return v5 ^ v6 ^ [(IFTSchemaIFTTypedValue *)self->_value hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  unint64_t v5 = [(IFTSchemaIFTCandidate *)self statementId];
  unint64_t v6 = [v4 statementId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_19;
  }
  uint64_t v7 = [(IFTSchemaIFTCandidate *)self statementId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(IFTSchemaIFTCandidate *)self statementId];
    v10 = [v4 statementId];
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
    int source = self->_source;
    if (source != [v4 source]) {
      goto LABEL_20;
    }
  }
  unint64_t v5 = [(IFTSchemaIFTCandidate *)self promptStatus];
  unint64_t v6 = [v4 promptStatus];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_19;
  }
  uint64_t v13 = [(IFTSchemaIFTCandidate *)self promptStatus];
  if (v13)
  {
    int v14 = (void *)v13;
    objc_super v15 = [(IFTSchemaIFTCandidate *)self promptStatus];
    objc_super v16 = [v4 promptStatus];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  unint64_t v5 = [(IFTSchemaIFTCandidate *)self value];
  unint64_t v6 = [v4 value];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v18 = [(IFTSchemaIFTCandidate *)self value];
    if (!v18)
    {

LABEL_23:
      BOOL v23 = 1;
      goto LABEL_21;
    }
    v19 = (void *)v18;
    v20 = [(IFTSchemaIFTCandidate *)self value];
    v21 = [v4 value];
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
  id v11 = a3;
  uint64_t v4 = [(IFTSchemaIFTCandidate *)self statementId];

  if (v4)
  {
    unint64_t v5 = [(IFTSchemaIFTCandidate *)self statementId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  unint64_t v6 = [(IFTSchemaIFTCandidate *)self promptStatus];

  if (v6)
  {
    uint64_t v7 = [(IFTSchemaIFTCandidate *)self promptStatus];
    PBDataWriterWriteSubmessage();
  }
  int v8 = [(IFTSchemaIFTCandidate *)self value];

  v9 = v11;
  if (v8)
  {
    v10 = [(IFTSchemaIFTCandidate *)self value];
    PBDataWriterWriteSubmessage();

    v9 = v11;
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTCandidateReadFrom(self, (uint64_t)a3);
}

- (void)deleteValue
{
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (void)deletePromptStatus
{
}

- (BOOL)hasPromptStatus
{
  return self->_promptStatus != 0;
}

- (void)deleteSource
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSource:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSource
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSource:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int source = a3;
}

- (void)deleteStatementId
{
}

- (BOOL)hasStatementId
{
  return self->_statementId != 0;
}

@end