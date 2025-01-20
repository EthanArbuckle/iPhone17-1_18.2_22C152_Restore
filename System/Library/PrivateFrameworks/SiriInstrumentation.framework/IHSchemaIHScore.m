@interface IHSchemaIHScore
- (BOOL)hasLowerBoundary;
- (BOOL)hasScore;
- (BOOL)hasUpperBoundary;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IHSchemaIHScore)initWithDictionary:(id)a3;
- (IHSchemaIHScore)initWithJSON:(id)a3;
- (NSData)jsonData;
- (float)lowerBoundary;
- (float)score;
- (float)upperBoundary;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteLowerBoundary;
- (void)deleteScore;
- (void)deleteUpperBoundary;
- (void)setHasLowerBoundary:(BOOL)a3;
- (void)setHasScore:(BOOL)a3;
- (void)setHasUpperBoundary:(BOOL)a3;
- (void)setLowerBoundary:(float)a3;
- (void)setScore:(float)a3;
- (void)setUpperBoundary:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation IHSchemaIHScore

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (float)lowerBoundary
{
  return self->_lowerBoundary;
}

- (float)upperBoundary
{
  return self->_upperBoundary;
}

- (float)score
{
  return self->_score;
}

- (IHSchemaIHScore)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IHSchemaIHScore;
  v5 = [(IHSchemaIHScore *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"score"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 floatValue];
      -[IHSchemaIHScore setScore:](v5, "setScore:");
    }
    v7 = [v4 objectForKeyedSubscript:@"upperBoundary"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 floatValue];
      -[IHSchemaIHScore setUpperBoundary:](v5, "setUpperBoundary:");
    }
    v8 = [v4 objectForKeyedSubscript:@"lowerBoundary"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 floatValue];
      -[IHSchemaIHScore setLowerBoundary:](v5, "setLowerBoundary:");
    }
    v9 = v5;
  }
  return v5;
}

- (IHSchemaIHScore)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IHSchemaIHScore *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IHSchemaIHScore *)self dictionaryRepresentation];
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
  if ((has & 4) != 0)
  {
    v8 = NSNumber;
    [(IHSchemaIHScore *)self lowerBoundary];
    v9 = objc_msgSend(v8, "numberWithFloat:");
    [v3 setObject:v9 forKeyedSubscript:@"lowerBoundary"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v10 = NSNumber;
  [(IHSchemaIHScore *)self score];
  objc_super v11 = objc_msgSend(v10, "numberWithFloat:");
  [v3 setObject:v11 forKeyedSubscript:@"score"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v5 = NSNumber;
    [(IHSchemaIHScore *)self upperBoundary];
    v6 = objc_msgSend(v5, "numberWithFloat:");
    [v3 setObject:v6 forKeyedSubscript:@"upperBoundary"];
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
    float score = self->_score;
    double v6 = score;
    if (score < 0.0) {
      double v6 = -score;
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
    float upperBoundary = self->_upperBoundary;
    double v11 = upperBoundary;
    if (upperBoundary < 0.0) {
      double v11 = -upperBoundary;
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
  if ((has & 4) != 0)
  {
    float lowerBoundary = self->_lowerBoundary;
    double v16 = lowerBoundary;
    if (lowerBoundary < 0.0) {
      double v16 = -lowerBoundary;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  return v9 ^ v4 ^ v14;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  $0267D0C0F3DDF09DCFE80E504D732A88 has = self->_has;
  unsigned int v6 = v4[20];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_13;
  }
  if (*(unsigned char *)&has)
  {
    float score = self->_score;
    [v4 score];
    if (score != v8) {
      goto LABEL_13;
    }
    $0267D0C0F3DDF09DCFE80E504D732A88 has = self->_has;
    unsigned int v6 = v4[20];
  }
  int v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 == ((v6 >> 1) & 1))
  {
    if (v9)
    {
      float upperBoundary = self->_upperBoundary;
      [v4 upperBoundary];
      if (upperBoundary != v11) {
        goto LABEL_13;
      }
      $0267D0C0F3DDF09DCFE80E504D732A88 has = self->_has;
      unsigned int v6 = v4[20];
    }
    int v12 = (*(unsigned int *)&has >> 2) & 1;
    if (v12 == ((v6 >> 2) & 1))
    {
      if (!v12 || (float lowerBoundary = self->_lowerBoundary, [v4 lowerBoundary], lowerBoundary == v14))
      {
        BOOL v15 = 1;
        goto LABEL_14;
      }
    }
  }
LABEL_13:
  BOOL v15 = 0;
LABEL_14:

  return v15;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteFloatField();
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
  PBDataWriterWriteFloatField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteFloatField();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return IHSchemaIHScoreReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteLowerBoundary
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasLowerBoundary:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLowerBoundary
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setLowerBoundary:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_float lowerBoundary = a3;
}

- (void)deleteUpperBoundary
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasUpperBoundary:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUpperBoundary
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setUpperBoundary:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float upperBoundary = a3;
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

- (void)setScore:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_float score = a3;
}

@end