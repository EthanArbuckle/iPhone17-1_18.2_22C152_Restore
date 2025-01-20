@interface ODBATCHSiriSchemaODBATCHTurnRestatementScore
- (BOOL)hasCurrentTurnId;
- (BOOL)hasNextTurnId;
- (BOOL)hasSemanticSimilarityScore;
- (BOOL)hasUtteranceRestatementScore;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ODBATCHSiriSchemaODBATCHTurnRestatementScore)initWithDictionary:(id)a3;
- (ODBATCHSiriSchemaODBATCHTurnRestatementScore)initWithJSON:(id)a3;
- (SISchemaUUID)currentTurnId;
- (SISchemaUUID)nextTurnId;
- (double)semanticSimilarityScore;
- (double)utteranceRestatementScore;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteCurrentTurnId;
- (void)deleteNextTurnId;
- (void)deleteSemanticSimilarityScore;
- (void)deleteUtteranceRestatementScore;
- (void)setCurrentTurnId:(id)a3;
- (void)setHasCurrentTurnId:(BOOL)a3;
- (void)setHasNextTurnId:(BOOL)a3;
- (void)setHasSemanticSimilarityScore:(BOOL)a3;
- (void)setHasUtteranceRestatementScore:(BOOL)a3;
- (void)setNextTurnId:(id)a3;
- (void)setSemanticSimilarityScore:(double)a3;
- (void)setUtteranceRestatementScore:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODBATCHSiriSchemaODBATCHTurnRestatementScore

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ODBATCHSiriSchemaODBATCHTurnRestatementScore;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(ODBATCHSiriSchemaODBATCHTurnRestatementScore *)self currentTurnId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ODBATCHSiriSchemaODBATCHTurnRestatementScore *)self deleteCurrentTurnId];
  }
  v9 = [(ODBATCHSiriSchemaODBATCHTurnRestatementScore *)self nextTurnId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(ODBATCHSiriSchemaODBATCHTurnRestatementScore *)self deleteNextTurnId];
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

- (double)semanticSimilarityScore
{
  return self->_semanticSimilarityScore;
}

- (double)utteranceRestatementScore
{
  return self->_utteranceRestatementScore;
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

- (ODBATCHSiriSchemaODBATCHTurnRestatementScore)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ODBATCHSiriSchemaODBATCHTurnRestatementScore;
  v5 = [(ODBATCHSiriSchemaODBATCHTurnRestatementScore *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"currentTurnId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(ODBATCHSiriSchemaODBATCHTurnRestatementScore *)v5 setCurrentTurnId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"nextTurnId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(ODBATCHSiriSchemaODBATCHTurnRestatementScore *)v5 setNextTurnId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"utteranceRestatementScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v10 doubleValue];
      -[ODBATCHSiriSchemaODBATCHTurnRestatementScore setUtteranceRestatementScore:](v5, "setUtteranceRestatementScore:");
    }
    int v11 = [v4 objectForKeyedSubscript:@"semanticSimilarityScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v11 doubleValue];
      -[ODBATCHSiriSchemaODBATCHTurnRestatementScore setSemanticSimilarityScore:](v5, "setSemanticSimilarityScore:");
    }
    v12 = v5;
  }
  return v5;
}

- (ODBATCHSiriSchemaODBATCHTurnRestatementScore)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODBATCHSiriSchemaODBATCHTurnRestatementScore *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODBATCHSiriSchemaODBATCHTurnRestatementScore *)self dictionaryRepresentation];
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
    id v4 = [(ODBATCHSiriSchemaODBATCHTurnRestatementScore *)self currentTurnId];
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
  if (self->_nextTurnId)
  {
    uint64_t v7 = [(ODBATCHSiriSchemaODBATCHTurnRestatementScore *)self nextTurnId];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"nextTurnId"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"nextTurnId"];
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    int v11 = NSNumber;
    [(ODBATCHSiriSchemaODBATCHTurnRestatementScore *)self semanticSimilarityScore];
    v12 = objc_msgSend(v11, "numberWithDouble:");
    [v3 setObject:v12 forKeyedSubscript:@"semanticSimilarityScore"];

    char has = (char)self->_has;
  }
  if (has)
  {
    objc_super v13 = NSNumber;
    [(ODBATCHSiriSchemaODBATCHTurnRestatementScore *)self utteranceRestatementScore];
    objc_super v14 = objc_msgSend(v13, "numberWithDouble:");
    [v3 setObject:v14 forKeyedSubscript:@"utteranceRestatementScore"];
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
    double utteranceRestatementScore = self->_utteranceRestatementScore;
    double v8 = -utteranceRestatementScore;
    if (utteranceRestatementScore >= 0.0) {
      double v8 = self->_utteranceRestatementScore;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  if ((has & 2) != 0)
  {
    double semanticSimilarityScore = self->_semanticSimilarityScore;
    double v13 = -semanticSimilarityScore;
    if (semanticSimilarityScore >= 0.0) {
      double v13 = self->_semanticSimilarityScore;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v11 += (unint64_t)v15;
      }
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(ODBATCHSiriSchemaODBATCHTurnRestatementScore *)self currentTurnId];
  unint64_t v6 = [v4 currentTurnId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(ODBATCHSiriSchemaODBATCHTurnRestatementScore *)self currentTurnId];
  if (v7)
  {
    double v8 = (void *)v7;
    long double v9 = [(ODBATCHSiriSchemaODBATCHTurnRestatementScore *)self currentTurnId];
    double v10 = [v4 currentTurnId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(ODBATCHSiriSchemaODBATCHTurnRestatementScore *)self nextTurnId];
  unint64_t v6 = [v4 nextTurnId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(ODBATCHSiriSchemaODBATCHTurnRestatementScore *)self nextTurnId];
  if (v12)
  {
    double v13 = (void *)v12;
    long double v14 = [(ODBATCHSiriSchemaODBATCHTurnRestatementScore *)self nextTurnId];
    double v15 = [v4 nextTurnId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  $6E5DD1958CD4B9BE9E3C45BBE66BD10A has = self->_has;
  unsigned int v20 = v4[40];
  if ((*(unsigned char *)&has & 1) == (v20 & 1))
  {
    if (*(unsigned char *)&has)
    {
      double utteranceRestatementScore = self->_utteranceRestatementScore;
      [v4 utteranceRestatementScore];
      if (utteranceRestatementScore != v22) {
        goto LABEL_12;
      }
      $6E5DD1958CD4B9BE9E3C45BBE66BD10A has = self->_has;
      unsigned int v20 = v4[40];
    }
    int v23 = (*(unsigned int *)&has >> 1) & 1;
    if (v23 == ((v20 >> 1) & 1))
    {
      if (!v23
        || (double semanticSimilarityScore = self->_semanticSimilarityScore,
            [v4 semanticSimilarityScore],
            semanticSimilarityScore == v25))
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
  id v10 = a3;
  unint64_t v4 = [(ODBATCHSiriSchemaODBATCHTurnRestatementScore *)self currentTurnId];

  if (v4)
  {
    v5 = [(ODBATCHSiriSchemaODBATCHTurnRestatementScore *)self currentTurnId];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(ODBATCHSiriSchemaODBATCHTurnRestatementScore *)self nextTurnId];

  if (v6)
  {
    uint64_t v7 = [(ODBATCHSiriSchemaODBATCHTurnRestatementScore *)self nextTurnId];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
  }
  long double v9 = v10;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    long double v9 = v10;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODBATCHSiriSchemaODBATCHTurnRestatementScoreReadFrom(self, (uint64_t)a3);
}

- (void)deleteSemanticSimilarityScore
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasSemanticSimilarityScore:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSemanticSimilarityScore
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSemanticSimilarityScore:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_double semanticSimilarityScore = a3;
}

- (void)deleteUtteranceRestatementScore
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasUtteranceRestatementScore:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUtteranceRestatementScore
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setUtteranceRestatementScore:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double utteranceRestatementScore = a3;
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