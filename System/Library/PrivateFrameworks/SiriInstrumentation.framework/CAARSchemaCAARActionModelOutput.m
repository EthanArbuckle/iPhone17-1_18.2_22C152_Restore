@interface CAARSchemaCAARActionModelOutput
- (BOOL)hasActionCandidateId;
- (BOOL)hasModelScore;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CAARSchemaCAARActionModelOutput)initWithDictionary:(id)a3;
- (CAARSchemaCAARActionModelOutput)initWithJSON:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)actionCandidateId;
- (float)modelScore;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteActionCandidateId;
- (void)deleteModelScore;
- (void)setActionCandidateId:(id)a3;
- (void)setHasActionCandidateId:(BOOL)a3;
- (void)setHasModelScore:(BOOL)a3;
- (void)setModelScore:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation CAARSchemaCAARActionModelOutput

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CAARSchemaCAARActionModelOutput;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(CAARSchemaCAARActionModelOutput *)self actionCandidateId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(CAARSchemaCAARActionModelOutput *)self deleteActionCandidateId];
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

- (void)setHasActionCandidateId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (float)modelScore
{
  return self->_modelScore;
}

- (void)setActionCandidateId:(id)a3
{
}

- (SISchemaUUID)actionCandidateId
{
  return self->_actionCandidateId;
}

- (CAARSchemaCAARActionModelOutput)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CAARSchemaCAARActionModelOutput;
  v5 = [(CAARSchemaCAARActionModelOutput *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"actionCandidateId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(CAARSchemaCAARActionModelOutput *)v5 setActionCandidateId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"modelScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 floatValue];
      -[CAARSchemaCAARActionModelOutput setModelScore:](v5, "setModelScore:");
    }
    objc_super v9 = v5;
  }
  return v5;
}

- (CAARSchemaCAARActionModelOutput)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CAARSchemaCAARActionModelOutput *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CAARSchemaCAARActionModelOutput *)self dictionaryRepresentation];
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
  if (self->_actionCandidateId)
  {
    id v4 = [(CAARSchemaCAARActionModelOutput *)self actionCandidateId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"actionCandidateId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"actionCandidateId"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v7 = NSNumber;
    [(CAARSchemaCAARActionModelOutput *)self modelScore];
    v8 = objc_msgSend(v7, "numberWithFloat:");
    [v3 setObject:v8 forKeyedSubscript:@"modelScore"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_actionCandidateId hash];
  if (*(unsigned char *)&self->_has)
  {
    float modelScore = self->_modelScore;
    double v6 = modelScore;
    if (modelScore < 0.0) {
      double v6 = -modelScore;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  v5 = [(CAARSchemaCAARActionModelOutput *)self actionCandidateId];
  double v6 = [v4 actionCandidateId];
  long double v7 = v6;
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v8 = [(CAARSchemaCAARActionModelOutput *)self actionCandidateId];
    if (v8)
    {
      objc_super v9 = (void *)v8;
      v10 = [(CAARSchemaCAARActionModelOutput *)self actionCandidateId];
      objc_super v11 = [v4 actionCandidateId];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_11;
      }
    }
    else
    {
    }
    if ((*(unsigned char *)&self->_has & 1) == (v4[20] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (float modelScore = self->_modelScore, [v4 modelScore], modelScore == v14))
      {
        BOOL v15 = 1;
        goto LABEL_12;
      }
    }
  }
  else
  {
  }
LABEL_11:
  BOOL v15 = 0;
LABEL_12:

  return v15;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  unint64_t v4 = [(CAARSchemaCAARActionModelOutput *)self actionCandidateId];

  if (v4)
  {
    v5 = [(CAARSchemaCAARActionModelOutput *)self actionCandidateId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteFloatField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return CAARSchemaCAARActionModelOutputReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteModelScore
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasModelScore:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasModelScore
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setModelScore:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_float modelScore = a3;
}

- (void)deleteActionCandidateId
{
}

- (BOOL)hasActionCandidateId
{
  return self->_actionCandidateId != 0;
}

@end