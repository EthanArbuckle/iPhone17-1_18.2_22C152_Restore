@interface POMMESSchemaPOMMESServiceClassifierScoreReported
- (BOOL)hasClassifierLabel;
- (BOOL)hasScore;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (POMMESSchemaPOMMESServiceClassifierScoreReported)initWithDictionary:(id)a3;
- (POMMESSchemaPOMMESServiceClassifierScoreReported)initWithJSON:(id)a3;
- (double)score;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)classifierLabel;
- (unint64_t)hash;
- (void)deleteClassifierLabel;
- (void)deleteScore;
- (void)setClassifierLabel:(int)a3;
- (void)setHasClassifierLabel:(BOOL)a3;
- (void)setHasScore:(BOOL)a3;
- (void)setScore:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation POMMESSchemaPOMMESServiceClassifierScoreReported

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)classifierLabel
{
  return self->_classifierLabel;
}

- (double)score
{
  return self->_score;
}

- (POMMESSchemaPOMMESServiceClassifierScoreReported)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)POMMESSchemaPOMMESServiceClassifierScoreReported;
  v5 = [(POMMESSchemaPOMMESServiceClassifierScoreReported *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"score"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 doubleValue];
      -[POMMESSchemaPOMMESServiceClassifierScoreReported setScore:](v5, "setScore:");
    }
    v7 = [v4 objectForKeyedSubscript:@"classifierLabel"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESServiceClassifierScoreReported setClassifierLabel:](v5, "setClassifierLabel:", [v7 intValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (POMMESSchemaPOMMESServiceClassifierScoreReported)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(POMMESSchemaPOMMESServiceClassifierScoreReported *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(POMMESSchemaPOMMESServiceClassifierScoreReported *)self dictionaryRepresentation];
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
    unsigned int v5 = [(POMMESSchemaPOMMESServiceClassifierScoreReported *)self classifierLabel] - 1;
    if (v5 > 3) {
      v6 = @"POMMESERVICECLASSIFIERLABEL_UNKNOWN";
    }
    else {
      v6 = off_1E5EB4388[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"classifierLabel"];
    char has = (char)self->_has;
  }
  if (has)
  {
    uint64_t v7 = NSNumber;
    [(POMMESSchemaPOMMESServiceClassifierScoreReported *)self score];
    v8 = objc_msgSend(v7, "numberWithDouble:");
    [v3 setObject:v8 forKeyedSubscript:@"score"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    double score = self->_score;
    double v6 = -score;
    if (score >= 0.0) {
      double v6 = self->_score;
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
  if ((has & 2) != 0) {
    uint64_t v9 = 2654435761 * self->_classifierLabel;
  }
  else {
    uint64_t v9 = 0;
  }
  return v9 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  $485ACE2E29A4BCE87B9F86C3063B0D7A has = self->_has;
  unsigned int v6 = v4[20];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&has)
  {
    double score = self->_score;
    [v4 score];
    if (score != v8)
    {
LABEL_10:
      BOOL v11 = 0;
      goto LABEL_11;
    }
    $485ACE2E29A4BCE87B9F86C3063B0D7A has = self->_has;
    unsigned int v6 = v4[20];
  }
  int v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v9)
  {
    int classifierLabel = self->_classifierLabel;
    if (classifierLabel != [v4 classifierLabel]) {
      goto LABEL_10;
    }
  }
  BOOL v11 = 1;
LABEL_11:

  return v11;
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
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESServiceClassifierScoreReportedReadFrom(self, (uint64_t)a3);
}

- (void)deleteClassifierLabel
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasClassifierLabel:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasClassifierLabel
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setClassifierLabel:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int classifierLabel = a3;
}

- (void)deleteScore
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasScore:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasScore
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setScore:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double score = a3;
}

@end