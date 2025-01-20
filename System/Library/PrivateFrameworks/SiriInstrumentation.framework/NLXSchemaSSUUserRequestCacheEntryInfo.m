@interface NLXSchemaSSUUserRequestCacheEntryInfo
- (BOOL)hasCategoryType;
- (BOOL)hasClosestNegativeExampleScore;
- (BOOL)hasClosestPositiveExampleScore;
- (BOOL)hasMatchInfo;
- (BOOL)hasNumEncodingSimilarityScoreComparisons;
- (BOOL)hasTriggerReason;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaSSUUserRequestCacheEntryInfo)initWithDictionary:(id)a3;
- (NLXSchemaSSUUserRequestCacheEntryInfo)initWithJSON:(id)a3;
- (NLXSchemaSSUUserRequestMatchInfo)matchInfo;
- (NSData)jsonData;
- (double)closestNegativeExampleScore;
- (double)closestPositiveExampleScore;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)categoryType;
- (int)triggerReason;
- (unint64_t)hash;
- (unsigned)numEncodingSimilarityScoreComparisons;
- (void)deleteCategoryType;
- (void)deleteClosestNegativeExampleScore;
- (void)deleteClosestPositiveExampleScore;
- (void)deleteMatchInfo;
- (void)deleteNumEncodingSimilarityScoreComparisons;
- (void)deleteTriggerReason;
- (void)setCategoryType:(int)a3;
- (void)setClosestNegativeExampleScore:(double)a3;
- (void)setClosestPositiveExampleScore:(double)a3;
- (void)setHasCategoryType:(BOOL)a3;
- (void)setHasClosestNegativeExampleScore:(BOOL)a3;
- (void)setHasClosestPositiveExampleScore:(BOOL)a3;
- (void)setHasMatchInfo:(BOOL)a3;
- (void)setHasNumEncodingSimilarityScoreComparisons:(BOOL)a3;
- (void)setHasTriggerReason:(BOOL)a3;
- (void)setMatchInfo:(id)a3;
- (void)setNumEncodingSimilarityScoreComparisons:(unsigned int)a3;
- (void)setTriggerReason:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaSSUUserRequestCacheEntryInfo

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NLXSchemaSSUUserRequestCacheEntryInfo;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(NLXSchemaSSUUserRequestCacheEntryInfo *)self matchInfo];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(NLXSchemaSSUUserRequestCacheEntryInfo *)self deleteMatchInfo];
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

- (void)setHasMatchInfo:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setMatchInfo:(id)a3
{
}

- (NLXSchemaSSUUserRequestMatchInfo)matchInfo
{
  return self->_matchInfo;
}

- (double)closestPositiveExampleScore
{
  return self->_closestPositiveExampleScore;
}

- (double)closestNegativeExampleScore
{
  return self->_closestNegativeExampleScore;
}

- (unsigned)numEncodingSimilarityScoreComparisons
{
  return self->_numEncodingSimilarityScoreComparisons;
}

- (int)categoryType
{
  return self->_categoryType;
}

- (int)triggerReason
{
  return self->_triggerReason;
}

- (NLXSchemaSSUUserRequestCacheEntryInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NLXSchemaSSUUserRequestCacheEntryInfo;
  v5 = [(NLXSchemaSSUUserRequestCacheEntryInfo *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"triggerReason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaSSUUserRequestCacheEntryInfo setTriggerReason:](v5, "setTriggerReason:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"categoryType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaSSUUserRequestCacheEntryInfo setCategoryType:](v5, "setCategoryType:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"numEncodingSimilarityScoreComparisons"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaSSUUserRequestCacheEntryInfo setNumEncodingSimilarityScoreComparisons:](v5, "setNumEncodingSimilarityScoreComparisons:", [v8 unsignedIntValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"closestNegativeExampleScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 doubleValue];
      -[NLXSchemaSSUUserRequestCacheEntryInfo setClosestNegativeExampleScore:](v5, "setClosestNegativeExampleScore:");
    }
    v10 = [v4 objectForKeyedSubscript:@"closestPositiveExampleScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v10 doubleValue];
      -[NLXSchemaSSUUserRequestCacheEntryInfo setClosestPositiveExampleScore:](v5, "setClosestPositiveExampleScore:");
    }
    v11 = [v4 objectForKeyedSubscript:@"matchInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [[NLXSchemaSSUUserRequestMatchInfo alloc] initWithDictionary:v11];
      [(NLXSchemaSSUUserRequestCacheEntryInfo *)v5 setMatchInfo:v12];
    }
    v13 = v5;
  }
  return v5;
}

- (NLXSchemaSSUUserRequestCacheEntryInfo)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaSSUUserRequestCacheEntryInfo *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaSSUUserRequestCacheEntryInfo *)self dictionaryRepresentation];
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
    unsigned int v5 = [(NLXSchemaSSUUserRequestCacheEntryInfo *)self categoryType] - 1;
    if (v5 > 3) {
      v6 = @"SSUCATEGORYTYPE_UNKNOWN";
    }
    else {
      v6 = off_1E5EBBE60[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"categoryType"];
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    uint64_t v7 = NSNumber;
    [(NLXSchemaSSUUserRequestCacheEntryInfo *)self closestNegativeExampleScore];
    v8 = objc_msgSend(v7, "numberWithDouble:");
    [v3 setObject:v8 forKeyedSubscript:@"closestNegativeExampleScore"];

    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    objc_super v9 = NSNumber;
    [(NLXSchemaSSUUserRequestCacheEntryInfo *)self closestPositiveExampleScore];
    v10 = objc_msgSend(v9, "numberWithDouble:");
    [v3 setObject:v10 forKeyedSubscript:@"closestPositiveExampleScore"];
  }
  if (self->_matchInfo)
  {
    v11 = [(NLXSchemaSSUUserRequestCacheEntryInfo *)self matchInfo];
    v12 = [v11 dictionaryRepresentation];
    if (v12)
    {
      [v3 setObject:v12 forKeyedSubscript:@"matchInfo"];
    }
    else
    {
      v13 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v13 forKeyedSubscript:@"matchInfo"];
    }
  }
  char v14 = (char)self->_has;
  if ((v14 & 4) != 0)
  {
    objc_super v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NLXSchemaSSUUserRequestCacheEntryInfo numEncodingSimilarityScoreComparisons](self, "numEncodingSimilarityScoreComparisons"));
    [v3 setObject:v15 forKeyedSubscript:@"numEncodingSimilarityScoreComparisons"];

    char v14 = (char)self->_has;
  }
  if (v14)
  {
    unsigned int v16 = [(NLXSchemaSSUUserRequestCacheEntryInfo *)self triggerReason] - 1;
    if (v16 > 2) {
      v17 = @"SSUCACHETRIGGERREASON_UNKNOWN";
    }
    else {
      v17 = off_1E5EBBE80[v16];
    }
    [v3 setObject:v17 forKeyedSubscript:@"triggerReason"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v4 = 2654435761 * self->_triggerReason;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_categoryType;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_11:
      uint64_t v6 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_12:
      unint64_t v11 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_11;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_numEncodingSimilarityScoreComparisons;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_12;
  }
LABEL_5:
  double closestNegativeExampleScore = self->_closestNegativeExampleScore;
  double v8 = -closestNegativeExampleScore;
  if (closestNegativeExampleScore >= 0.0) {
    double v8 = self->_closestNegativeExampleScore;
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
LABEL_15:
  if ((has & 0x10) != 0)
  {
    double closestPositiveExampleScore = self->_closestPositiveExampleScore;
    double v14 = -closestPositiveExampleScore;
    if (closestPositiveExampleScore >= 0.0) {
      double v14 = self->_closestPositiveExampleScore;
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
  return v5 ^ v4 ^ v6 ^ v11 ^ v12 ^ [(NLXSchemaSSUUserRequestMatchInfo *)self->_matchInfo hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  $3723A4767FD23792DE64A834EA9AEBB1 has = self->_has;
  unsigned int v6 = v4[48];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_26;
  }
  if (*(unsigned char *)&has)
  {
    int triggerReason = self->_triggerReason;
    if (triggerReason != [v4 triggerReason]) {
      goto LABEL_26;
    }
    $3723A4767FD23792DE64A834EA9AEBB1 has = self->_has;
    unsigned int v6 = v4[48];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      int categoryType = self->_categoryType;
      if (categoryType != [v4 categoryType]) {
        goto LABEL_26;
      }
      $3723A4767FD23792DE64A834EA9AEBB1 has = self->_has;
      unsigned int v6 = v4[48];
    }
    int v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (v10)
      {
        unsigned int numEncodingSimilarityScoreComparisons = self->_numEncodingSimilarityScoreComparisons;
        if (numEncodingSimilarityScoreComparisons != [v4 numEncodingSimilarityScoreComparisons])goto LABEL_26; {
        $3723A4767FD23792DE64A834EA9AEBB1 has = self->_has;
        }
        unsigned int v6 = v4[48];
      }
      int v12 = (*(unsigned int *)&has >> 3) & 1;
      if (v12 == ((v6 >> 3) & 1))
      {
        if (v12)
        {
          double closestNegativeExampleScore = self->_closestNegativeExampleScore;
          [v4 closestNegativeExampleScore];
          if (closestNegativeExampleScore != v14) {
            goto LABEL_26;
          }
          $3723A4767FD23792DE64A834EA9AEBB1 has = self->_has;
          unsigned int v6 = v4[48];
        }
        int v15 = (*(unsigned int *)&has >> 4) & 1;
        if (v15 == ((v6 >> 4) & 1))
        {
          if (!v15
            || (double closestPositiveExampleScore = self->_closestPositiveExampleScore,
                [v4 closestPositiveExampleScore],
                closestPositiveExampleScore == v17))
          {
            v18 = [(NLXSchemaSSUUserRequestCacheEntryInfo *)self matchInfo];
            v19 = [v4 matchInfo];
            v20 = v19;
            if ((v18 == 0) != (v19 != 0))
            {
              uint64_t v21 = [(NLXSchemaSSUUserRequestCacheEntryInfo *)self matchInfo];
              if (!v21)
              {

LABEL_29:
                BOOL v26 = 1;
                goto LABEL_27;
              }
              v22 = (void *)v21;
              v23 = [(NLXSchemaSSUUserRequestCacheEntryInfo *)self matchInfo];
              v24 = [v4 matchInfo];
              char v25 = [v23 isEqual:v24];

              if (v25) {
                goto LABEL_29;
              }
            }
            else
            {
            }
          }
        }
      }
    }
  }
LABEL_26:
  BOOL v26 = 0;
LABEL_27:

  return v26;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
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
      goto LABEL_14;
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
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_15:
  PBDataWriterWriteDoubleField();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_6:
  }
    PBDataWriterWriteDoubleField();
LABEL_7:
  uint64_t v5 = [(NLXSchemaSSUUserRequestCacheEntryInfo *)self matchInfo];

  unsigned int v6 = v8;
  if (v5)
  {
    uint64_t v7 = [(NLXSchemaSSUUserRequestCacheEntryInfo *)self matchInfo];
    PBDataWriterWriteSubmessage();

    unsigned int v6 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaSSUUserRequestCacheEntryInfoReadFrom(self, (uint64_t)a3);
}

- (void)deleteMatchInfo
{
}

- (BOOL)hasMatchInfo
{
  return self->_matchInfo != 0;
}

- (void)deleteClosestPositiveExampleScore
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasClosestPositiveExampleScore:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasClosestPositiveExampleScore
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setClosestPositiveExampleScore:(double)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_double closestPositiveExampleScore = a3;
}

- (void)deleteClosestNegativeExampleScore
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasClosestNegativeExampleScore:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasClosestNegativeExampleScore
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setClosestNegativeExampleScore:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_double closestNegativeExampleScore = a3;
}

- (void)deleteNumEncodingSimilarityScoreComparisons
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasNumEncodingSimilarityScoreComparisons:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumEncodingSimilarityScoreComparisons
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setNumEncodingSimilarityScoreComparisons:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int numEncodingSimilarityScoreComparisons = a3;
}

- (void)deleteCategoryType
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasCategoryType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCategoryType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCategoryType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int categoryType = a3;
}

- (void)deleteTriggerReason
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasTriggerReason:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTriggerReason
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTriggerReason:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int triggerReason = a3;
}

@end