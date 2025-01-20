@interface IFTSchemaIFTRequestPrescribedPlanOpenTool
- (BOOL)hasElementAtIndex;
- (BOOL)hasResultStatementId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTRequestPrescribedPlanOpenTool)initWithDictionary:(id)a3;
- (IFTSchemaIFTRequestPrescribedPlanOpenTool)initWithJSON:(id)a3;
- (IFTSchemaIFTStatementId)resultStatementId;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int64_t)elementAtIndex;
- (unint64_t)hash;
- (void)deleteElementAtIndex;
- (void)deleteResultStatementId;
- (void)setElementAtIndex:(int64_t)a3;
- (void)setHasElementAtIndex:(BOOL)a3;
- (void)setHasResultStatementId:(BOOL)a3;
- (void)setResultStatementId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTRequestPrescribedPlanOpenTool

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IFTSchemaIFTRequestPrescribedPlanOpenTool;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(IFTSchemaIFTRequestPrescribedPlanOpenTool *)self resultStatementId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(IFTSchemaIFTRequestPrescribedPlanOpenTool *)self deleteResultStatementId];
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
}

- (void)setHasResultStatementId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int64_t)elementAtIndex
{
  return self->_elementAtIndex;
}

- (void)setResultStatementId:(id)a3
{
}

- (IFTSchemaIFTStatementId)resultStatementId
{
  return self->_resultStatementId;
}

- (IFTSchemaIFTRequestPrescribedPlanOpenTool)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IFTSchemaIFTRequestPrescribedPlanOpenTool;
  v5 = [(IFTSchemaIFTRequestPrescribedPlanOpenTool *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"resultStatementId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[IFTSchemaIFTStatementId alloc] initWithDictionary:v6];
      [(IFTSchemaIFTRequestPrescribedPlanOpenTool *)v5 setResultStatementId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"elementAtIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTRequestPrescribedPlanOpenTool setElementAtIndex:](v5, "setElementAtIndex:", [v8 longLongValue]);
    }
    objc_super v9 = v5;
  }
  return v5;
}

- (IFTSchemaIFTRequestPrescribedPlanOpenTool)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTRequestPrescribedPlanOpenTool *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTRequestPrescribedPlanOpenTool *)self dictionaryRepresentation];
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
    id v4 = objc_msgSend(NSNumber, "numberWithLongLong:", -[IFTSchemaIFTRequestPrescribedPlanOpenTool elementAtIndex](self, "elementAtIndex"));
    [v3 setObject:v4 forKeyedSubscript:@"elementAtIndex"];
  }
  if (self->_resultStatementId)
  {
    v5 = [(IFTSchemaIFTRequestPrescribedPlanOpenTool *)self resultStatementId];
    v6 = [v5 dictionaryRepresentation];
    if (v6)
    {
      [v3 setObject:v6 forKeyedSubscript:@"resultStatementId"];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v7 forKeyedSubscript:@"resultStatementId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(IFTSchemaIFTStatementId *)self->_resultStatementId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_elementAtIndex;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(IFTSchemaIFTRequestPrescribedPlanOpenTool *)self resultStatementId];
  v6 = [v4 resultStatementId];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(IFTSchemaIFTRequestPrescribedPlanOpenTool *)self resultStatementId];
  if (v8)
  {
    objc_super v9 = (void *)v8;
    v10 = [(IFTSchemaIFTRequestPrescribedPlanOpenTool *)self resultStatementId];
    objc_super v11 = [v4 resultStatementId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[24] & 1)) {
    goto LABEL_12;
  }
  if (*(unsigned char *)&self->_has)
  {
    int64_t elementAtIndex = self->_elementAtIndex;
    if (elementAtIndex != [v4 elementAtIndex]) {
      goto LABEL_12;
    }
  }
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(IFTSchemaIFTRequestPrescribedPlanOpenTool *)self resultStatementId];

  if (v4)
  {
    v5 = [(IFTSchemaIFTRequestPrescribedPlanOpenTool *)self resultStatementId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTRequestPrescribedPlanOpenToolReadFrom(self, (uint64_t)a3);
}

- (void)deleteElementAtIndex
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasElementAtIndex:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasElementAtIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setElementAtIndex:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int64_t elementAtIndex = a3;
}

- (void)deleteResultStatementId
{
}

- (BOOL)hasResultStatementId
{
  return self->_resultStatementId != 0;
}

@end