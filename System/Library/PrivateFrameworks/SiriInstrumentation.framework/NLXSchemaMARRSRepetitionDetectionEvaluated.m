@interface NLXSchemaMARRSRepetitionDetectionEvaluated
- (BOOL)hasFullRepetitionConfidence;
- (BOOL)hasNoRepetitionConfidence;
- (BOOL)hasPartialRepetitionConfidence;
- (BOOL)hasRepetitionType;
- (BOOL)hasRuleType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaMARRSRepetitionDetectionEvaluated)initWithDictionary:(id)a3;
- (NLXSchemaMARRSRepetitionDetectionEvaluated)initWithJSON:(id)a3;
- (NSData)jsonData;
- (float)fullRepetitionConfidence;
- (float)noRepetitionConfidence;
- (float)partialRepetitionConfidence;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)repetitionType;
- (int)ruleType;
- (unint64_t)hash;
- (void)deleteFullRepetitionConfidence;
- (void)deleteNoRepetitionConfidence;
- (void)deletePartialRepetitionConfidence;
- (void)deleteRepetitionType;
- (void)deleteRuleType;
- (void)setFullRepetitionConfidence:(float)a3;
- (void)setHasFullRepetitionConfidence:(BOOL)a3;
- (void)setHasNoRepetitionConfidence:(BOOL)a3;
- (void)setHasPartialRepetitionConfidence:(BOOL)a3;
- (void)setHasRepetitionType:(BOOL)a3;
- (void)setHasRuleType:(BOOL)a3;
- (void)setNoRepetitionConfidence:(float)a3;
- (void)setPartialRepetitionConfidence:(float)a3;
- (void)setRepetitionType:(int)a3;
- (void)setRuleType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaMARRSRepetitionDetectionEvaluated

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (float)partialRepetitionConfidence
{
  return self->_partialRepetitionConfidence;
}

- (float)fullRepetitionConfidence
{
  return self->_fullRepetitionConfidence;
}

- (float)noRepetitionConfidence
{
  return self->_noRepetitionConfidence;
}

- (int)ruleType
{
  return self->_ruleType;
}

- (int)repetitionType
{
  return self->_repetitionType;
}

- (NLXSchemaMARRSRepetitionDetectionEvaluated)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NLXSchemaMARRSRepetitionDetectionEvaluated;
  v5 = [(NLXSchemaMARRSRepetitionDetectionEvaluated *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"repetitionType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaMARRSRepetitionDetectionEvaluated setRepetitionType:](v5, "setRepetitionType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"ruleType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaMARRSRepetitionDetectionEvaluated setRuleType:](v5, "setRuleType:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"noRepetitionConfidence"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 floatValue];
      -[NLXSchemaMARRSRepetitionDetectionEvaluated setNoRepetitionConfidence:](v5, "setNoRepetitionConfidence:");
    }
    v9 = [v4 objectForKeyedSubscript:@"fullRepetitionConfidence"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 floatValue];
      -[NLXSchemaMARRSRepetitionDetectionEvaluated setFullRepetitionConfidence:](v5, "setFullRepetitionConfidence:");
    }
    v10 = [v4 objectForKeyedSubscript:@"partialRepetitionConfidence"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v10 floatValue];
      -[NLXSchemaMARRSRepetitionDetectionEvaluated setPartialRepetitionConfidence:](v5, "setPartialRepetitionConfidence:");
    }
    v11 = v5;
  }
  return v5;
}

- (NLXSchemaMARRSRepetitionDetectionEvaluated)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaMARRSRepetitionDetectionEvaluated *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaMARRSRepetitionDetectionEvaluated *)self dictionaryRepresentation];
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
  if ((has & 8) != 0)
  {
    v9 = NSNumber;
    [(NLXSchemaMARRSRepetitionDetectionEvaluated *)self fullRepetitionConfidence];
    v10 = objc_msgSend(v9, "numberWithFloat:");
    [v3 setObject:v10 forKeyedSubscript:@"fullRepetitionConfidence"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v11 = NSNumber;
  [(NLXSchemaMARRSRepetitionDetectionEvaluated *)self noRepetitionConfidence];
  v12 = objc_msgSend(v11, "numberWithFloat:");
  [v3 setObject:v12 forKeyedSubscript:@"noRepetitionConfidence"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  objc_super v13 = NSNumber;
  [(NLXSchemaMARRSRepetitionDetectionEvaluated *)self partialRepetitionConfidence];
  v14 = objc_msgSend(v13, "numberWithFloat:");
  [v3 setObject:v14 forKeyedSubscript:@"partialRepetitionConfidence"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_6;
  }
LABEL_18:
  unsigned int v15 = [(NLXSchemaMARRSRepetitionDetectionEvaluated *)self repetitionType] - 1;
  if (v15 > 2) {
    v16 = @"MARRSREPETITIONTYPE_UNKNOWN";
  }
  else {
    v16 = off_1E5EB32B0[v15];
  }
  [v3 setObject:v16 forKeyedSubscript:@"repetitionType"];
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  int v5 = [(NLXSchemaMARRSRepetitionDetectionEvaluated *)self ruleType];
  v6 = @"MARRSREPETITIONDETECTIONRULETYPE_OTHER";
  if (v5 == 1) {
    v6 = @"MARRSREPETITIONDETECTIONRULETYPE_SKIPPED";
  }
  if (v5 == 2) {
    uint64_t v7 = @"MARRSREPETITIONDETECTIONRULETYPE_TIME_GAP_EXCEEDED";
  }
  else {
    uint64_t v7 = v6;
  }
  [v3 setObject:v7 forKeyedSubscript:@"ruleType"];
LABEL_12:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v10 = 0;
    goto LABEL_13;
  }
  uint64_t v4 = 2654435761 * self->_repetitionType;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_ruleType;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  float noRepetitionConfidence = self->_noRepetitionConfidence;
  double v7 = noRepetitionConfidence;
  if (noRepetitionConfidence < 0.0) {
    double v7 = -noRepetitionConfidence;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0) {
      v10 += (unint64_t)v9;
    }
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_13:
  if ((has & 8) != 0)
  {
    float fullRepetitionConfidence = self->_fullRepetitionConfidence;
    double v13 = fullRepetitionConfidence;
    if (fullRepetitionConfidence < 0.0) {
      double v13 = -fullRepetitionConfidence;
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
  if ((has & 0x10) != 0)
  {
    float partialRepetitionConfidence = self->_partialRepetitionConfidence;
    double v18 = partialRepetitionConfidence;
    if (partialRepetitionConfidence < 0.0) {
      double v18 = -partialRepetitionConfidence;
    }
    long double v19 = floor(v18 + 0.5);
    double v20 = (v18 - v19) * 1.84467441e19;
    unint64_t v16 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
    if (v20 >= 0.0)
    {
      if (v20 > 0.0) {
        v16 += (unint64_t)v20;
      }
    }
    else
    {
      v16 -= (unint64_t)fabs(v20);
    }
  }
  else
  {
    unint64_t v16 = 0;
  }
  return v5 ^ v4 ^ v10 ^ v11 ^ v16;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  $CC871E1465C82D8B397C1939E477F1ED has = self->_has;
  unsigned int v6 = v4[28];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_21;
  }
  if (*(unsigned char *)&has)
  {
    int repetitionType = self->_repetitionType;
    if (repetitionType != [v4 repetitionType]) {
      goto LABEL_21;
    }
    $CC871E1465C82D8B397C1939E477F1ED has = self->_has;
    unsigned int v6 = v4[28];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      int ruleType = self->_ruleType;
      if (ruleType != [v4 ruleType]) {
        goto LABEL_21;
      }
      $CC871E1465C82D8B397C1939E477F1ED has = self->_has;
      unsigned int v6 = v4[28];
    }
    int v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (v10)
      {
        float noRepetitionConfidence = self->_noRepetitionConfidence;
        [v4 noRepetitionConfidence];
        if (noRepetitionConfidence != v12) {
          goto LABEL_21;
        }
        $CC871E1465C82D8B397C1939E477F1ED has = self->_has;
        unsigned int v6 = v4[28];
      }
      int v13 = (*(unsigned int *)&has >> 3) & 1;
      if (v13 == ((v6 >> 3) & 1))
      {
        if (v13)
        {
          float fullRepetitionConfidence = self->_fullRepetitionConfidence;
          [v4 fullRepetitionConfidence];
          if (fullRepetitionConfidence != v15) {
            goto LABEL_21;
          }
          $CC871E1465C82D8B397C1939E477F1ED has = self->_has;
          unsigned int v6 = v4[28];
        }
        int v16 = (*(unsigned int *)&has >> 4) & 1;
        if (v16 == ((v6 >> 4) & 1))
        {
          if (!v16
            || (float partialRepetitionConfidence = self->_partialRepetitionConfidence,
                [v4 partialRepetitionConfidence],
                partialRepetitionConfidence == v18))
          {
            BOOL v19 = 1;
            goto LABEL_22;
          }
        }
      }
    }
  }
LABEL_21:
  BOOL v19 = 0;
LABEL_22:

  return v19;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteFloatField();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteFloatField();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_6:
  }
    PBDataWriterWriteFloatField();
LABEL_7:
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaMARRSRepetitionDetectionEvaluatedReadFrom(self, (uint64_t)a3, v3);
}

- (void)deletePartialRepetitionConfidence
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasPartialRepetitionConfidence:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasPartialRepetitionConfidence
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setPartialRepetitionConfidence:(float)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_float partialRepetitionConfidence = a3;
}

- (void)deleteFullRepetitionConfidence
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasFullRepetitionConfidence:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasFullRepetitionConfidence
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setFullRepetitionConfidence:(float)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_float fullRepetitionConfidence = a3;
}

- (void)deleteNoRepetitionConfidence
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasNoRepetitionConfidence:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNoRepetitionConfidence
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setNoRepetitionConfidence:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_float noRepetitionConfidence = a3;
}

- (void)deleteRuleType
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasRuleType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRuleType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRuleType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int ruleType = a3;
}

- (void)deleteRepetitionType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasRepetitionType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRepetitionType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRepetitionType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int repetitionType = a3;
}

@end