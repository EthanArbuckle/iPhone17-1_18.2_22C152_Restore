@interface MHSchemaMHLatticeFalseTriggerMitigationEnded
- (BOOL)hasScore;
- (BOOL)hasThreshold;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHLatticeFalseTriggerMitigationEnded)initWithDictionary:(id)a3;
- (MHSchemaMHLatticeFalseTriggerMitigationEnded)initWithJSON:(id)a3;
- (NSData)jsonData;
- (float)score;
- (float)threshold;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteScore;
- (void)deleteThreshold;
- (void)setHasScore:(BOOL)a3;
- (void)setHasThreshold:(BOOL)a3;
- (void)setScore:(float)a3;
- (void)setThreshold:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHLatticeFalseTriggerMitigationEnded

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (float)threshold
{
  return self->_threshold;
}

- (float)score
{
  return self->_score;
}

- (MHSchemaMHLatticeFalseTriggerMitigationEnded)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MHSchemaMHLatticeFalseTriggerMitigationEnded;
  v5 = [(MHSchemaMHLatticeFalseTriggerMitigationEnded *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"score"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 floatValue];
      -[MHSchemaMHLatticeFalseTriggerMitigationEnded setScore:](v5, "setScore:");
    }
    v7 = [v4 objectForKeyedSubscript:@"threshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 floatValue];
      -[MHSchemaMHLatticeFalseTriggerMitigationEnded setThreshold:](v5, "setThreshold:");
    }
    v8 = v5;
  }
  return v5;
}

- (MHSchemaMHLatticeFalseTriggerMitigationEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHLatticeFalseTriggerMitigationEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHLatticeFalseTriggerMitigationEnded *)self dictionaryRepresentation];
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
  if (has)
  {
    v5 = NSNumber;
    [(MHSchemaMHLatticeFalseTriggerMitigationEnded *)self score];
    v6 = objc_msgSend(v5, "numberWithFloat:");
    [v3 setObject:v6 forKeyedSubscript:@"score"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t v7 = NSNumber;
    [(MHSchemaMHLatticeFalseTriggerMitigationEnded *)self threshold];
    v8 = objc_msgSend(v7, "numberWithFloat:");
    [v3 setObject:v8 forKeyedSubscript:@"threshold"];
  }
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
    float threshold = self->_threshold;
    double v11 = threshold;
    if (threshold < 0.0) {
      double v11 = -threshold;
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
  return v9 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  $E472CC9CC38A071224863C7B55134FAA has = self->_has;
  unsigned int v6 = v4[16];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&has)
  {
    float score = self->_score;
    [v4 score];
    if (score != v8) {
      goto LABEL_9;
    }
    $E472CC9CC38A071224863C7B55134FAA has = self->_has;
    unsigned int v6 = v4[16];
  }
  int v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 == ((v6 >> 1) & 1))
  {
    if (!v9 || (float threshold = self->_threshold, [v4 threshold], threshold == v11))
    {
      BOOL v12 = 1;
      goto LABEL_10;
    }
  }
LABEL_9:
  BOOL v12 = 0;
LABEL_10:

  return v12;
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
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHLatticeFalseTriggerMitigationEndedReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteThreshold
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasThreshold:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasThreshold
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setThreshold:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float threshold = a3;
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