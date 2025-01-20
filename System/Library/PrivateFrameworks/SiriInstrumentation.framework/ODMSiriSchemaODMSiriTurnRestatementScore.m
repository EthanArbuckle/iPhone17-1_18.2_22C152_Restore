@interface ODMSiriSchemaODMSiriTurnRestatementScore
- (BOOL)hasCurrentTurnId;
- (BOOL)hasIsUserRequest;
- (BOOL)hasNextTurnId;
- (BOOL)hasPhoneticRestatementScore;
- (BOOL)hasUtteranceRestatementScore;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUserRequest;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ODMSiriSchemaODMSiriTurnRestatementScore)initWithDictionary:(id)a3;
- (ODMSiriSchemaODMSiriTurnRestatementScore)initWithJSON:(id)a3;
- (SISchemaUUID)currentTurnId;
- (SISchemaUUID)nextTurnId;
- (double)phoneticRestatementScore;
- (double)utteranceRestatementScore;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteCurrentTurnId;
- (void)deleteIsUserRequest;
- (void)deleteNextTurnId;
- (void)deletePhoneticRestatementScore;
- (void)deleteUtteranceRestatementScore;
- (void)setCurrentTurnId:(id)a3;
- (void)setHasCurrentTurnId:(BOOL)a3;
- (void)setHasIsUserRequest:(BOOL)a3;
- (void)setHasNextTurnId:(BOOL)a3;
- (void)setHasPhoneticRestatementScore:(BOOL)a3;
- (void)setHasUtteranceRestatementScore:(BOOL)a3;
- (void)setIsUserRequest:(BOOL)a3;
- (void)setNextTurnId:(id)a3;
- (void)setPhoneticRestatementScore:(double)a3;
- (void)setUtteranceRestatementScore:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODMSiriSchemaODMSiriTurnRestatementScore

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ODMSiriSchemaODMSiriTurnRestatementScore;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(ODMSiriSchemaODMSiriTurnRestatementScore *)self currentTurnId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ODMSiriSchemaODMSiriTurnRestatementScore *)self deleteCurrentTurnId];
  }
  v9 = [(ODMSiriSchemaODMSiriTurnRestatementScore *)self nextTurnId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(ODMSiriSchemaODMSiriTurnRestatementScore *)self deleteNextTurnId];
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
  objc_storeStrong((id *)&self->_nextTurnId, 0);
  objc_storeStrong((id *)&self->_currentTurnId, 0);
}

- (void)setHasNextTurnId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasCurrentTurnId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (double)phoneticRestatementScore
{
  return self->_phoneticRestatementScore;
}

- (double)utteranceRestatementScore
{
  return self->_utteranceRestatementScore;
}

- (BOOL)isUserRequest
{
  return self->_isUserRequest;
}

- (void)setNextTurnId:(id)a3
{
}

- (SISchemaUUID)nextTurnId
{
  return self->_nextTurnId;
}

- (void)setCurrentTurnId:(id)a3
{
}

- (SISchemaUUID)currentTurnId
{
  return self->_currentTurnId;
}

- (ODMSiriSchemaODMSiriTurnRestatementScore)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ODMSiriSchemaODMSiriTurnRestatementScore;
  v5 = [(ODMSiriSchemaODMSiriTurnRestatementScore *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"currentTurnId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(ODMSiriSchemaODMSiriTurnRestatementScore *)v5 setCurrentTurnId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"nextTurnId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(ODMSiriSchemaODMSiriTurnRestatementScore *)v5 setNextTurnId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"isUserRequest"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODMSiriSchemaODMSiriTurnRestatementScore setIsUserRequest:](v5, "setIsUserRequest:", [v10 BOOLValue]);
    }
    int v11 = [v4 objectForKeyedSubscript:@"utteranceRestatementScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v11 doubleValue];
      -[ODMSiriSchemaODMSiriTurnRestatementScore setUtteranceRestatementScore:](v5, "setUtteranceRestatementScore:");
    }
    v12 = [v4 objectForKeyedSubscript:@"phoneticRestatementScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v12 doubleValue];
      -[ODMSiriSchemaODMSiriTurnRestatementScore setPhoneticRestatementScore:](v5, "setPhoneticRestatementScore:");
    }
    objc_super v13 = v5;
  }
  return v5;
}

- (ODMSiriSchemaODMSiriTurnRestatementScore)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODMSiriSchemaODMSiriTurnRestatementScore *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODMSiriSchemaODMSiriTurnRestatementScore *)self dictionaryRepresentation];
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
  if (self->_currentTurnId)
  {
    id v4 = [(ODMSiriSchemaODMSiriTurnRestatementScore *)self currentTurnId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"currentTurnId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"currentTurnId"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[ODMSiriSchemaODMSiriTurnRestatementScore isUserRequest](self, "isUserRequest"));
    [v3 setObject:v7 forKeyedSubscript:@"isUserRequest"];
  }
  if (self->_nextTurnId)
  {
    int v8 = [(ODMSiriSchemaODMSiriTurnRestatementScore *)self nextTurnId];
    v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"nextTurnId"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"nextTurnId"];
    }
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v12 = NSNumber;
    [(ODMSiriSchemaODMSiriTurnRestatementScore *)self phoneticRestatementScore];
    objc_super v13 = objc_msgSend(v12, "numberWithDouble:");
    [v3 setObject:v13 forKeyedSubscript:@"phoneticRestatementScore"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v14 = NSNumber;
    [(ODMSiriSchemaODMSiriTurnRestatementScore *)self utteranceRestatementScore];
    objc_super v15 = objc_msgSend(v14, "numberWithDouble:");
    [v3 setObject:v15 forKeyedSubscript:@"utteranceRestatementScore"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_currentTurnId hash];
  unint64_t v4 = [(SISchemaUUID *)self->_nextTurnId hash];
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v6 = 2654435761 * self->_isUserRequest;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v11 = 0;
    goto LABEL_11;
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double utteranceRestatementScore = self->_utteranceRestatementScore;
  double v8 = -utteranceRestatementScore;
  if (utteranceRestatementScore >= 0.0) {
    double v8 = self->_utteranceRestatementScore;
  }
  long double v9 = floor(v8 + 0.5);
  double v10 = (v8 - v9) * 1.84467441e19;
  unint64_t v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0) {
      v11 += (unint64_t)v10;
    }
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
LABEL_11:
  if ((has & 4) != 0)
  {
    double phoneticRestatementScore = self->_phoneticRestatementScore;
    double v14 = -phoneticRestatementScore;
    if (phoneticRestatementScore >= 0.0) {
      double v14 = self->_phoneticRestatementScore;
    }
    long double v15 = floor(v14 + 0.5);
    double v16 = (v14 - v15) * 1.84467441e19;
    unint64_t v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0) {
        v12 += (unint64_t)v16;
      }
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    unint64_t v12 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v11 ^ v12;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(ODMSiriSchemaODMSiriTurnRestatementScore *)self currentTurnId];
  uint64_t v6 = [v4 currentTurnId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(ODMSiriSchemaODMSiriTurnRestatementScore *)self currentTurnId];
  if (v7)
  {
    double v8 = (void *)v7;
    long double v9 = [(ODMSiriSchemaODMSiriTurnRestatementScore *)self currentTurnId];
    double v10 = [v4 currentTurnId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(ODMSiriSchemaODMSiriTurnRestatementScore *)self nextTurnId];
  uint64_t v6 = [v4 nextTurnId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(ODMSiriSchemaODMSiriTurnRestatementScore *)self nextTurnId];
  if (v12)
  {
    objc_super v13 = (void *)v12;
    double v14 = [(ODMSiriSchemaODMSiriTurnRestatementScore *)self nextTurnId];
    long double v15 = [v4 nextTurnId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  $E8B7EBF99993A588C4E081FB19679AA2 has = self->_has;
  unsigned int v20 = v4[48];
  if ((*(unsigned char *)&has & 1) == (v20 & 1))
  {
    if (*(unsigned char *)&has)
    {
      int isUserRequest = self->_isUserRequest;
      if (isUserRequest != [v4 isUserRequest]) {
        goto LABEL_12;
      }
      $E8B7EBF99993A588C4E081FB19679AA2 has = self->_has;
      unsigned int v20 = v4[48];
    }
    int v22 = (*(unsigned int *)&has >> 1) & 1;
    if (v22 == ((v20 >> 1) & 1))
    {
      if (v22)
      {
        double utteranceRestatementScore = self->_utteranceRestatementScore;
        [v4 utteranceRestatementScore];
        if (utteranceRestatementScore != v24) {
          goto LABEL_12;
        }
        $E8B7EBF99993A588C4E081FB19679AA2 has = self->_has;
        unsigned int v20 = v4[48];
      }
      int v25 = (*(unsigned int *)&has >> 2) & 1;
      if (v25 == ((v20 >> 2) & 1))
      {
        if (!v25
          || (double phoneticRestatementScore = self->_phoneticRestatementScore,
              [v4 phoneticRestatementScore],
              phoneticRestatementScore == v27))
        {
          BOOL v17 = 1;
          goto LABEL_13;
        }
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
  id v10 = a3;
  unint64_t v4 = [(ODMSiriSchemaODMSiriTurnRestatementScore *)self currentTurnId];

  if (v4)
  {
    v5 = [(ODMSiriSchemaODMSiriTurnRestatementScore *)self currentTurnId];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v6 = [(ODMSiriSchemaODMSiriTurnRestatementScore *)self nextTurnId];

  if (v6)
  {
    uint64_t v7 = [(ODMSiriSchemaODMSiriTurnRestatementScore *)self nextTurnId];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  long double v9 = v10;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    long double v9 = v10;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    long double v9 = v10;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODMSiriSchemaODMSiriTurnRestatementScoreReadFrom(self, (uint64_t)a3);
}

- (void)deletePhoneticRestatementScore
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasPhoneticRestatementScore:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPhoneticRestatementScore
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setPhoneticRestatementScore:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_double phoneticRestatementScore = a3;
}

- (void)deleteUtteranceRestatementScore
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasUtteranceRestatementScore:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUtteranceRestatementScore
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setUtteranceRestatementScore:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_double utteranceRestatementScore = a3;
}

- (void)deleteIsUserRequest
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsUserRequest:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsUserRequest
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsUserRequest:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isUserRequest = a3;
}

- (void)deleteNextTurnId
{
}

- (BOOL)hasNextTurnId
{
  return self->_nextTurnId != 0;
}

- (void)deleteCurrentTurnId
{
}

- (BOOL)hasCurrentTurnId
{
  return self->_currentTurnId != 0;
}

@end