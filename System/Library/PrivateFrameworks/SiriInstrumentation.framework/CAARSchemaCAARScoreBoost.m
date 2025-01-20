@interface CAARSchemaCAARScoreBoost
- (BOOL)hasActionCandidateId;
- (BOOL)hasBoost;
- (BOOL)hasReason;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CAARSchemaCAARScoreBoost)initWithDictionary:(id)a3;
- (CAARSchemaCAARScoreBoost)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)reason;
- (SISchemaUUID)actionCandidateId;
- (double)boost;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteActionCandidateId;
- (void)deleteBoost;
- (void)deleteReason;
- (void)setActionCandidateId:(id)a3;
- (void)setBoost:(double)a3;
- (void)setHasActionCandidateId:(BOOL)a3;
- (void)setHasBoost:(BOOL)a3;
- (void)setHasReason:(BOOL)a3;
- (void)setReason:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CAARSchemaCAARScoreBoost

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CAARSchemaCAARScoreBoost;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(CAARSchemaCAARScoreBoost *)self actionCandidateId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(CAARSchemaCAARScoreBoost *)self deleteActionCandidateId];
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
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_actionCandidateId, 0);
}

- (void)setHasReason:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasActionCandidateId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setReason:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (double)boost
{
  return self->_boost;
}

- (void)setActionCandidateId:(id)a3
{
}

- (SISchemaUUID)actionCandidateId
{
  return self->_actionCandidateId;
}

- (CAARSchemaCAARScoreBoost)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CAARSchemaCAARScoreBoost;
  v5 = [(CAARSchemaCAARScoreBoost *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"actionCandidateId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(CAARSchemaCAARScoreBoost *)v5 setActionCandidateId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"boost"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 doubleValue];
      -[CAARSchemaCAARScoreBoost setBoost:](v5, "setBoost:");
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"reason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[v9 copy];
      [(CAARSchemaCAARScoreBoost *)v5 setReason:v10];
    }
    v11 = v5;
  }
  return v5;
}

- (CAARSchemaCAARScoreBoost)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CAARSchemaCAARScoreBoost *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CAARSchemaCAARScoreBoost *)self dictionaryRepresentation];
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
    id v4 = [(CAARSchemaCAARScoreBoost *)self actionCandidateId];
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
    [(CAARSchemaCAARScoreBoost *)self boost];
    v8 = objc_msgSend(v7, "numberWithDouble:");
    [v3 setObject:v8 forKeyedSubscript:@"boost"];
  }
  if (self->_reason)
  {
    objc_super v9 = [(CAARSchemaCAARScoreBoost *)self reason];
    v10 = (void *)[v9 copy];
    [v3 setObject:v10 forKeyedSubscript:@"reason"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_actionCandidateId hash];
  if (*(unsigned char *)&self->_has)
  {
    double boost = self->_boost;
    double v6 = -boost;
    if (boost >= 0.0) {
      double v6 = self->_boost;
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
  return v4 ^ v3 ^ [(NSString *)self->_reason hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  v5 = [(CAARSchemaCAARScoreBoost *)self actionCandidateId];
  double v6 = [v4 actionCandidateId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_14;
  }
  uint64_t v7 = [(CAARSchemaCAARScoreBoost *)self actionCandidateId];
  if (v7)
  {
    double v8 = (void *)v7;
    objc_super v9 = [(CAARSchemaCAARScoreBoost *)self actionCandidateId];
    v10 = [v4 actionCandidateId];
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
    double boost = self->_boost;
    [v4 boost];
    if (boost != v13) {
      goto LABEL_15;
    }
  }
  v5 = [(CAARSchemaCAARScoreBoost *)self reason];
  double v6 = [v4 reason];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v14 = [(CAARSchemaCAARScoreBoost *)self reason];
    if (!v14)
    {

LABEL_18:
      BOOL v19 = 1;
      goto LABEL_16;
    }
    v15 = (void *)v14;
    v16 = [(CAARSchemaCAARScoreBoost *)self reason];
    v17 = [v4 reason];
    char v18 = [v16 isEqual:v17];

    if (v18) {
      goto LABEL_18;
    }
  }
  else
  {
LABEL_14:
  }
LABEL_15:
  BOOL v19 = 0;
LABEL_16:

  return v19;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  unint64_t v4 = [(CAARSchemaCAARScoreBoost *)self actionCandidateId];

  if (v4)
  {
    v5 = [(CAARSchemaCAARScoreBoost *)self actionCandidateId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  double v6 = [(CAARSchemaCAARScoreBoost *)self reason];

  uint64_t v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    uint64_t v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return CAARSchemaCAARScoreBoostReadFrom(self, (uint64_t)a3);
}

- (void)deleteReason
{
}

- (BOOL)hasReason
{
  return self->_reason != 0;
}

- (void)deleteBoost
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasBoost:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBoost
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setBoost:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double boost = a3;
}

- (void)deleteActionCandidateId
{
}

- (BOOL)hasActionCandidateId
{
  return self->_actionCandidateId != 0;
}

@end