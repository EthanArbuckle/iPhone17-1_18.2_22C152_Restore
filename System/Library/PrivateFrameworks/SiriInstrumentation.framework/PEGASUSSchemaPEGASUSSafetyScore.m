@interface PEGASUSSchemaPEGASUSSafetyScore
- (BOOL)hasScore;
- (BOOL)hasScoreClass;
- (BOOL)hasScoreLabel;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)scoreLabel;
- (PEGASUSSchemaPEGASUSSafetyScore)initWithDictionary:(id)a3;
- (PEGASUSSchemaPEGASUSSafetyScore)initWithJSON:(id)a3;
- (float)score;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)scoreClass;
- (unint64_t)hash;
- (void)deleteScore;
- (void)deleteScoreClass;
- (void)deleteScoreLabel;
- (void)setHasScore:(BOOL)a3;
- (void)setHasScoreClass:(BOOL)a3;
- (void)setHasScoreLabel:(BOOL)a3;
- (void)setScore:(float)a3;
- (void)setScoreClass:(int)a3;
- (void)setScoreLabel:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PEGASUSSchemaPEGASUSSafetyScore

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasScoreLabel:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setScoreLabel:(id)a3
{
}

- (NSString)scoreLabel
{
  return self->_scoreLabel;
}

- (float)score
{
  return self->_score;
}

- (int)scoreClass
{
  return self->_scoreClass;
}

- (PEGASUSSchemaPEGASUSSafetyScore)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PEGASUSSchemaPEGASUSSafetyScore;
  v5 = [(PEGASUSSchemaPEGASUSSafetyScore *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"scoreClass"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSSafetyScore setScoreClass:](v5, "setScoreClass:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"score"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 floatValue];
      -[PEGASUSSchemaPEGASUSSafetyScore setScore:](v5, "setScore:");
    }
    v8 = [v4 objectForKeyedSubscript:@"scoreLabel"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(PEGASUSSchemaPEGASUSSafetyScore *)v5 setScoreLabel:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (PEGASUSSchemaPEGASUSSafetyScore)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PEGASUSSchemaPEGASUSSafetyScore *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PEGASUSSchemaPEGASUSSafetyScore *)self dictionaryRepresentation];
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
    v5 = NSNumber;
    [(PEGASUSSchemaPEGASUSSafetyScore *)self score];
    v6 = objc_msgSend(v5, "numberWithFloat:");
    [v3 setObject:v6 forKeyedSubscript:@"score"];

    char has = (char)self->_has;
  }
  if (has)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", -[PEGASUSSchemaPEGASUSSafetyScore scoreClass](self, "scoreClass"));
    [v3 setObject:v7 forKeyedSubscript:@"scoreClass"];
  }
  if (self->_scoreLabel)
  {
    v8 = [(PEGASUSSchemaPEGASUSSafetyScore *)self scoreLabel];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"scoreLabel"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_scoreClass;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v8 = 0;
    return v8 ^ v3 ^ [(NSString *)self->_scoreLabel hash];
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  float score = self->_score;
  double v5 = score;
  if (score < 0.0) {
    double v5 = -score;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
  return v8 ^ v3 ^ [(NSString *)self->_scoreLabel hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $CF7B55DBA1E6CB72E00BB0B59E644DBD has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    int scoreClass = self->_scoreClass;
    if (scoreClass != [v4 scoreClass]) {
      goto LABEL_14;
    }
    $CF7B55DBA1E6CB72E00BB0B59E644DBD has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8 || (float score = self->_score, [v4 score], score == v10))
    {
      v11 = [(PEGASUSSchemaPEGASUSSafetyScore *)self scoreLabel];
      objc_super v12 = [v4 scoreLabel];
      v13 = v12;
      if ((v11 == 0) != (v12 != 0))
      {
        uint64_t v14 = [(PEGASUSSchemaPEGASUSSafetyScore *)self scoreLabel];
        if (!v14)
        {

LABEL_17:
          BOOL v19 = 1;
          goto LABEL_15;
        }
        v15 = (void *)v14;
        v16 = [(PEGASUSSchemaPEGASUSSafetyScore *)self scoreLabel];
        v17 = [v4 scoreLabel];
        char v18 = [v16 isEqual:v17];

        if (v18) {
          goto LABEL_17;
        }
      }
      else
      {
      }
    }
  }
LABEL_14:
  BOOL v19 = 0;
LABEL_15:

  return v19;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteFloatField();
  }
  double v5 = [(PEGASUSSchemaPEGASUSSafetyScore *)self scoreLabel];

  unsigned int v6 = v7;
  if (v5)
  {
    PBDataWriterWriteStringField();
    unsigned int v6 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSSafetyScoreReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteScoreLabel
{
}

- (BOOL)hasScoreLabel
{
  return self->_scoreLabel != 0;
}

- (void)deleteScore
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasScore:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasScore
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setScore:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float score = a3;
}

- (void)deleteScoreClass
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasScoreClass:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasScoreClass
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setScoreClass:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int scoreClass = a3;
}

@end