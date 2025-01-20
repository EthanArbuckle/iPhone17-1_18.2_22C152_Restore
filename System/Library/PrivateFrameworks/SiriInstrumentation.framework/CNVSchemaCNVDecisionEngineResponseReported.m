@interface CNVSchemaCNVDecisionEngineResponseReported
- (BOOL)hasFlowHandlerId;
- (BOOL)hasIsExistingFlowSelected;
- (BOOL)hasIsInterpretableAsUniversalCommand;
- (BOOL)hasParseHypothesisId;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExistingFlowSelected;
- (BOOL)isInterpretableAsUniversalCommand;
- (BOOL)readFrom:(id)a3;
- (CNVSchemaCNVDecisionEngineResponseReported)initWithDictionary:(id)a3;
- (CNVSchemaCNVDecisionEngineResponseReported)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)flowHandlerId;
- (SISchemaUUID)parseHypothesisId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteFlowHandlerId;
- (void)deleteIsExistingFlowSelected;
- (void)deleteIsInterpretableAsUniversalCommand;
- (void)deleteParseHypothesisId;
- (void)setFlowHandlerId:(id)a3;
- (void)setHasFlowHandlerId:(BOOL)a3;
- (void)setHasIsExistingFlowSelected:(BOOL)a3;
- (void)setHasIsInterpretableAsUniversalCommand:(BOOL)a3;
- (void)setHasParseHypothesisId:(BOOL)a3;
- (void)setIsExistingFlowSelected:(BOOL)a3;
- (void)setIsInterpretableAsUniversalCommand:(BOOL)a3;
- (void)setParseHypothesisId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CNVSchemaCNVDecisionEngineResponseReported

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CNVSchemaCNVDecisionEngineResponseReported;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(CNVSchemaCNVDecisionEngineResponseReported *)self parseHypothesisId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(CNVSchemaCNVDecisionEngineResponseReported *)self deleteParseHypothesisId];
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
  objc_storeStrong((id *)&self->_parseHypothesisId, 0);
  objc_storeStrong((id *)&self->_flowHandlerId, 0);
}

- (void)setHasParseHypothesisId:(BOOL)a3
{
  *(unsigned char *)&self->_has = a3;
}

- (void)setHasFlowHandlerId:(BOOL)a3
{
  *(&self->_isInterpretableAsUniversalCommand + 2) = a3;
}

- (BOOL)isInterpretableAsUniversalCommand
{
  return self->_isInterpretableAsUniversalCommand;
}

- (BOOL)isExistingFlowSelected
{
  return self->_isExistingFlowSelected;
}

- (void)setParseHypothesisId:(id)a3
{
}

- (SISchemaUUID)parseHypothesisId
{
  return self->_parseHypothesisId;
}

- (void)setFlowHandlerId:(id)a3
{
}

- (NSString)flowHandlerId
{
  return self->_flowHandlerId;
}

- (CNVSchemaCNVDecisionEngineResponseReported)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNVSchemaCNVDecisionEngineResponseReported;
  v5 = [(CNVSchemaCNVDecisionEngineResponseReported *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"flowHandlerId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(CNVSchemaCNVDecisionEngineResponseReported *)v5 setFlowHandlerId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"parseHypothesisId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(CNVSchemaCNVDecisionEngineResponseReported *)v5 setParseHypothesisId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"isExistingFlowSelected"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CNVSchemaCNVDecisionEngineResponseReported setIsExistingFlowSelected:](v5, "setIsExistingFlowSelected:", [v10 BOOLValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"isInterpretableAsUniversalCommand"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CNVSchemaCNVDecisionEngineResponseReported setIsInterpretableAsUniversalCommand:](v5, "setIsInterpretableAsUniversalCommand:", [v11 BOOLValue]);
    }
    v12 = v5;
  }
  return v5;
}

- (CNVSchemaCNVDecisionEngineResponseReported)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CNVSchemaCNVDecisionEngineResponseReported *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CNVSchemaCNVDecisionEngineResponseReported *)self dictionaryRepresentation];
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
  if (self->_flowHandlerId)
  {
    id v4 = [(CNVSchemaCNVDecisionEngineResponseReported *)self flowHandlerId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"flowHandlerId"];
  }
  char v6 = *(&self->_isInterpretableAsUniversalCommand + 1);
  if (v6)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[CNVSchemaCNVDecisionEngineResponseReported isExistingFlowSelected](self, "isExistingFlowSelected"));
    [v3 setObject:v7 forKeyedSubscript:@"isExistingFlowSelected"];

    char v6 = *(&self->_isInterpretableAsUniversalCommand + 1);
  }
  if ((v6 & 2) != 0)
  {
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[CNVSchemaCNVDecisionEngineResponseReported isInterpretableAsUniversalCommand](self, "isInterpretableAsUniversalCommand"));
    [v3 setObject:v8 forKeyedSubscript:@"isInterpretableAsUniversalCommand"];
  }
  if (self->_parseHypothesisId)
  {
    objc_super v9 = [(CNVSchemaCNVDecisionEngineResponseReported *)self parseHypothesisId];
    v10 = [v9 dictionaryRepresentation];
    if (v10)
    {
      [v3 setObject:v10 forKeyedSubscript:@"parseHypothesisId"];
    }
    else
    {
      v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"parseHypothesisId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_flowHandlerId hash];
  unint64_t v4 = [(SISchemaUUID *)self->_parseHypothesisId hash];
  if (*(&self->_isInterpretableAsUniversalCommand + 1))
  {
    uint64_t v5 = 2654435761 * self->_isExistingFlowSelected;
    if ((*(&self->_isInterpretableAsUniversalCommand + 1) & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(&self->_isInterpretableAsUniversalCommand + 1) & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_isInterpretableAsUniversalCommand;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(CNVSchemaCNVDecisionEngineResponseReported *)self flowHandlerId];
  uint64_t v6 = [v4 flowHandlerId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(CNVSchemaCNVDecisionEngineResponseReported *)self flowHandlerId];
  if (v7)
  {
    v8 = (void *)v7;
    objc_super v9 = [(CNVSchemaCNVDecisionEngineResponseReported *)self flowHandlerId];
    v10 = [v4 flowHandlerId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(CNVSchemaCNVDecisionEngineResponseReported *)self parseHypothesisId];
  uint64_t v6 = [v4 parseHypothesisId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(CNVSchemaCNVDecisionEngineResponseReported *)self parseHypothesisId];
  if (v12)
  {
    v13 = (void *)v12;
    objc_super v14 = [(CNVSchemaCNVDecisionEngineResponseReported *)self parseHypothesisId];
    v15 = [v4 parseHypothesisId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  unsigned int v19 = *((unsigned __int8 *)&self->_isInterpretableAsUniversalCommand + 1);
  unsigned int v20 = v4[26];
  if ((v19 & 1) == (v20 & 1))
  {
    if (v19)
    {
      int isExistingFlowSelected = self->_isExistingFlowSelected;
      if (isExistingFlowSelected != [v4 isExistingFlowSelected]) {
        goto LABEL_12;
      }
      unsigned int v19 = *((unsigned __int8 *)&self->_isInterpretableAsUniversalCommand + 1);
      unsigned int v20 = v4[26];
    }
    int v22 = (v19 >> 1) & 1;
    if (v22 == ((v20 >> 1) & 1))
    {
      if (!v22
        || (int isInterpretableAsUniversalCommand = self->_isInterpretableAsUniversalCommand,
            isInterpretableAsUniversalCommand == [v4 isInterpretableAsUniversalCommand]))
      {
        BOOL v17 = 1;
        goto LABEL_13;
      }
    }
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  unint64_t v4 = [(CNVSchemaCNVDecisionEngineResponseReported *)self flowHandlerId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  uint64_t v5 = [(CNVSchemaCNVDecisionEngineResponseReported *)self parseHypothesisId];

  if (v5)
  {
    uint64_t v6 = [(CNVSchemaCNVDecisionEngineResponseReported *)self parseHypothesisId];
    PBDataWriterWriteSubmessage();
  }
  char v7 = *(&self->_isInterpretableAsUniversalCommand + 1);
  if (v7)
  {
    PBDataWriterWriteBOOLField();
    char v7 = *(&self->_isInterpretableAsUniversalCommand + 1);
  }
  v8 = v9;
  if ((v7 & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v8 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return CNVSchemaCNVDecisionEngineResponseReportedReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsInterpretableAsUniversalCommand
{
  *(&self->_isInterpretableAsUniversalCommand + 1) &= ~2u;
}

- (void)setHasIsInterpretableAsUniversalCommand:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isInterpretableAsUniversalCommand + 1) = *(&self->_isInterpretableAsUniversalCommand + 1) & 0xFD | v3;
}

- (BOOL)hasIsInterpretableAsUniversalCommand
{
  return (*((unsigned __int8 *)&self->_isInterpretableAsUniversalCommand + 1) >> 1) & 1;
}

- (void)setIsInterpretableAsUniversalCommand:(BOOL)a3
{
  *(&self->_isInterpretableAsUniversalCommand + 1) |= 2u;
  self->_int isInterpretableAsUniversalCommand = a3;
}

- (void)deleteIsExistingFlowSelected
{
  *(&self->_isInterpretableAsUniversalCommand + 1) &= ~1u;
}

- (void)setHasIsExistingFlowSelected:(BOOL)a3
{
  *(&self->_isInterpretableAsUniversalCommand + 1) = *(&self->_isInterpretableAsUniversalCommand + 1) & 0xFE | a3;
}

- (BOOL)hasIsExistingFlowSelected
{
  return *(&self->_isInterpretableAsUniversalCommand + 1);
}

- (void)setIsExistingFlowSelected:(BOOL)a3
{
  *(&self->_isInterpretableAsUniversalCommand + 1) |= 1u;
  self->_int isExistingFlowSelected = a3;
}

- (void)deleteParseHypothesisId
{
}

- (BOOL)hasParseHypothesisId
{
  return self->_parseHypothesisId != 0;
}

- (void)deleteFlowHandlerId
{
}

- (BOOL)hasFlowHandlerId
{
  return self->_flowHandlerId != 0;
}

@end