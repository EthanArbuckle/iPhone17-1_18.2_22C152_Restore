@interface CLPInstSchemaCLPNLv4TaskEvaluationEnded
- (BOOL)hasAccuracyOnAnyUserParse;
- (BOOL)hasAccuracyOnTheFirstUserParseCount;
- (BOOL)hasEvaluationCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CLPInstSchemaCLPNLv4TaskEvaluationEnded)initWithDictionary:(id)a3;
- (CLPInstSchemaCLPNLv4TaskEvaluationEnded)initWithJSON:(id)a3;
- (NSData)jsonData;
- (double)accuracyOnAnyUserParse;
- (double)accuracyOnTheFirstUserParseCount;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)evaluationCount;
- (void)deleteAccuracyOnAnyUserParse;
- (void)deleteAccuracyOnTheFirstUserParseCount;
- (void)deleteEvaluationCount;
- (void)setAccuracyOnAnyUserParse:(double)a3;
- (void)setAccuracyOnTheFirstUserParseCount:(double)a3;
- (void)setEvaluationCount:(unsigned int)a3;
- (void)setHasAccuracyOnAnyUserParse:(BOOL)a3;
- (void)setHasAccuracyOnTheFirstUserParseCount:(BOOL)a3;
- (void)setHasEvaluationCount:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPInstSchemaCLPNLv4TaskEvaluationEnded

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)evaluationCount
{
  return self->_evaluationCount;
}

- (double)accuracyOnAnyUserParse
{
  return self->_accuracyOnAnyUserParse;
}

- (double)accuracyOnTheFirstUserParseCount
{
  return self->_accuracyOnTheFirstUserParseCount;
}

- (CLPInstSchemaCLPNLv4TaskEvaluationEnded)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLPInstSchemaCLPNLv4TaskEvaluationEnded;
  v5 = [(CLPInstSchemaCLPNLv4TaskEvaluationEnded *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"accuracyOnTheFirstUserParseCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 doubleValue];
      -[CLPInstSchemaCLPNLv4TaskEvaluationEnded setAccuracyOnTheFirstUserParseCount:](v5, "setAccuracyOnTheFirstUserParseCount:");
    }
    v7 = [v4 objectForKeyedSubscript:@"accuracyOnAnyUserParse"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 doubleValue];
      -[CLPInstSchemaCLPNLv4TaskEvaluationEnded setAccuracyOnAnyUserParse:](v5, "setAccuracyOnAnyUserParse:");
    }
    v8 = [v4 objectForKeyedSubscript:@"evaluationCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CLPInstSchemaCLPNLv4TaskEvaluationEnded setEvaluationCount:](v5, "setEvaluationCount:", [v8 unsignedIntValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (CLPInstSchemaCLPNLv4TaskEvaluationEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CLPInstSchemaCLPNLv4TaskEvaluationEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CLPInstSchemaCLPNLv4TaskEvaluationEnded *)self dictionaryRepresentation];
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
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v7 = NSNumber;
    [(CLPInstSchemaCLPNLv4TaskEvaluationEnded *)self accuracyOnAnyUserParse];
    v8 = objc_msgSend(v7, "numberWithDouble:");
    [v3 setObject:v8 forKeyedSubscript:@"accuracyOnAnyUserParse"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v9 = NSNumber;
  [(CLPInstSchemaCLPNLv4TaskEvaluationEnded *)self accuracyOnTheFirstUserParseCount];
  v10 = objc_msgSend(v9, "numberWithDouble:");
  [v3 setObject:v10 forKeyedSubscript:@"accuracyOnTheFirstUserParseCount"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CLPInstSchemaCLPNLv4TaskEvaluationEnded evaluationCount](self, "evaluationCount"));
    [v3 setObject:v5 forKeyedSubscript:@"evaluationCount"];
  }
LABEL_5:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    double accuracyOnTheFirstUserParseCount = self->_accuracyOnTheFirstUserParseCount;
    double v6 = -accuracyOnTheFirstUserParseCount;
    if (accuracyOnTheFirstUserParseCount >= 0.0) {
      double v6 = self->_accuracyOnTheFirstUserParseCount;
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
  if ((has & 2) != 0)
  {
    double accuracyOnAnyUserParse = self->_accuracyOnAnyUserParse;
    double v11 = -accuracyOnAnyUserParse;
    if (accuracyOnAnyUserParse >= 0.0) {
      double v11 = self->_accuracyOnAnyUserParse;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((has & 4) != 0) {
    uint64_t v14 = 2654435761 * self->_evaluationCount;
  }
  else {
    uint64_t v14 = 0;
  }
  return v9 ^ v4 ^ v14;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $9B896259364FDDFB8CBEC698B742B77E has = self->_has;
  unsigned int v6 = v4[28];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    double accuracyOnTheFirstUserParseCount = self->_accuracyOnTheFirstUserParseCount;
    [v4 accuracyOnTheFirstUserParseCount];
    if (accuracyOnTheFirstUserParseCount != v8) {
      goto LABEL_14;
    }
    $9B896259364FDDFB8CBEC698B742B77E has = self->_has;
    unsigned int v6 = v4[28];
  }
  int v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 != ((v6 >> 1) & 1)) {
    goto LABEL_14;
  }
  if (v9)
  {
    double accuracyOnAnyUserParse = self->_accuracyOnAnyUserParse;
    [v4 accuracyOnAnyUserParse];
    if (accuracyOnAnyUserParse == v11)
    {
      $9B896259364FDDFB8CBEC698B742B77E has = self->_has;
      unsigned int v6 = v4[28];
      goto LABEL_10;
    }
LABEL_14:
    BOOL v14 = 0;
    goto LABEL_15;
  }
LABEL_10:
  int v12 = (*(unsigned int *)&has >> 2) & 1;
  if (v12 != ((v6 >> 2) & 1)) {
    goto LABEL_14;
  }
  if (v12)
  {
    unsigned int evaluationCount = self->_evaluationCount;
    if (evaluationCount != [v4 evaluationCount]) {
      goto LABEL_14;
    }
  }
  BOOL v14 = 1;
LABEL_15:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return CLPInstSchemaCLPNLv4TaskEvaluationEndedReadFrom(self, (uint64_t)a3);
}

- (void)deleteEvaluationCount
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasEvaluationCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEvaluationCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setEvaluationCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int evaluationCount = a3;
}

- (void)deleteAccuracyOnAnyUserParse
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasAccuracyOnAnyUserParse:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAccuracyOnAnyUserParse
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAccuracyOnAnyUserParse:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_double accuracyOnAnyUserParse = a3;
}

- (void)deleteAccuracyOnTheFirstUserParseCount
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasAccuracyOnTheFirstUserParseCount:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAccuracyOnTheFirstUserParseCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAccuracyOnTheFirstUserParseCount:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double accuracyOnTheFirstUserParseCount = a3;
}

@end