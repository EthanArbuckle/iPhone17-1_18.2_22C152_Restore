@interface PGSchemaPGModelInferenceStarted
- (BOOL)hasLinkId;
- (BOOL)hasModelInterface;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PGSchemaPGModelInferenceStarted)initWithDictionary:(id)a3;
- (PGSchemaPGModelInferenceStarted)initWithJSON:(id)a3;
- (SISchemaUUID)linkId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)modelInterface;
- (unint64_t)hash;
- (void)deleteLinkId;
- (void)deleteModelInterface;
- (void)setHasLinkId:(BOOL)a3;
- (void)setHasModelInterface:(BOOL)a3;
- (void)setLinkId:(id)a3;
- (void)setModelInterface:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PGSchemaPGModelInferenceStarted

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PGSchemaPGModelInferenceStarted;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(PGSchemaPGModelInferenceStarted *)self linkId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(PGSchemaPGModelInferenceStarted *)self deleteLinkId];
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

- (void)setHasLinkId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)modelInterface
{
  return self->_modelInterface;
}

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (PGSchemaPGModelInferenceStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGSchemaPGModelInferenceStarted;
  v5 = [(PGSchemaPGModelInferenceStarted *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"linkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(PGSchemaPGModelInferenceStarted *)v5 setLinkId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"modelInterface"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PGSchemaPGModelInferenceStarted setModelInterface:](v5, "setModelInterface:", [v8 intValue]);
    }
    objc_super v9 = v5;
  }
  return v5;
}

- (PGSchemaPGModelInferenceStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PGSchemaPGModelInferenceStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PGSchemaPGModelInferenceStarted *)self dictionaryRepresentation];
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
  if (self->_linkId)
  {
    id v4 = [(PGSchemaPGModelInferenceStarted *)self linkId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"linkId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"linkId"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v7 = [(PGSchemaPGModelInferenceStarted *)self modelInterface] - 1;
    if (v7 > 2) {
      v8 = @"PGMODELINTERFACE_UNKNOWN";
    }
    else {
      v8 = off_1E5EC17A8[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"modelInterface"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_linkId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_modelInterface;
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
  v5 = [(PGSchemaPGModelInferenceStarted *)self linkId];
  v6 = [v4 linkId];
  unsigned int v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(PGSchemaPGModelInferenceStarted *)self linkId];
  if (v8)
  {
    objc_super v9 = (void *)v8;
    v10 = [(PGSchemaPGModelInferenceStarted *)self linkId];
    objc_super v11 = [v4 linkId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[20] & 1)) {
    goto LABEL_12;
  }
  if (*(unsigned char *)&self->_has)
  {
    int modelInterface = self->_modelInterface;
    if (modelInterface != [v4 modelInterface]) {
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
  uint64_t v4 = [(PGSchemaPGModelInferenceStarted *)self linkId];

  if (v4)
  {
    v5 = [(PGSchemaPGModelInferenceStarted *)self linkId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PGSchemaPGModelInferenceStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteModelInterface
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasModelInterface:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasModelInterface
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setModelInterface:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int modelInterface = a3;
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

@end