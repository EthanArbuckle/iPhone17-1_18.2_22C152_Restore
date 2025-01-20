@interface CMSchemaCMSearchEnded
- (BOOL)hasHighestMatchScore;
- (BOOL)hasLowestMatchScore;
- (BOOL)hasResultCount;
- (BOOL)hasSearchStrategy;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CMSchemaCMSearchEnded)initWithDictionary:(id)a3;
- (CMSchemaCMSearchEnded)initWithJSON:(id)a3;
- (NSData)jsonData;
- (double)highestMatchScore;
- (double)lowestMatchScore;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)resultCount;
- (int)searchStrategy;
- (unint64_t)hash;
- (void)deleteHighestMatchScore;
- (void)deleteLowestMatchScore;
- (void)deleteResultCount;
- (void)deleteSearchStrategy;
- (void)setHasHighestMatchScore:(BOOL)a3;
- (void)setHasLowestMatchScore:(BOOL)a3;
- (void)setHasResultCount:(BOOL)a3;
- (void)setHasSearchStrategy:(BOOL)a3;
- (void)setHighestMatchScore:(double)a3;
- (void)setLowestMatchScore:(double)a3;
- (void)setResultCount:(int)a3;
- (void)setSearchStrategy:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CMSchemaCMSearchEnded

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (double)lowestMatchScore
{
  return self->_lowestMatchScore;
}

- (double)highestMatchScore
{
  return self->_highestMatchScore;
}

- (int)resultCount
{
  return self->_resultCount;
}

- (int)searchStrategy
{
  return self->_searchStrategy;
}

- (CMSchemaCMSearchEnded)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CMSchemaCMSearchEnded;
  v5 = [(CMSchemaCMSearchEnded *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"searchStrategy"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CMSchemaCMSearchEnded setSearchStrategy:](v5, "setSearchStrategy:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"resultCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CMSchemaCMSearchEnded setResultCount:](v5, "setResultCount:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"highestMatchScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 doubleValue];
      -[CMSchemaCMSearchEnded setHighestMatchScore:](v5, "setHighestMatchScore:");
    }
    v9 = [v4 objectForKeyedSubscript:@"lowestMatchScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 doubleValue];
      -[CMSchemaCMSearchEnded setLowestMatchScore:](v5, "setLowestMatchScore:");
    }
    v10 = v5;
  }
  return v5;
}

- (CMSchemaCMSearchEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CMSchemaCMSearchEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CMSchemaCMSearchEnded *)self dictionaryRepresentation];
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
    v9 = NSNumber;
    [(CMSchemaCMSearchEnded *)self highestMatchScore];
    v10 = objc_msgSend(v9, "numberWithDouble:");
    [v3 setObject:v10 forKeyedSubscript:@"highestMatchScore"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
LABEL_16:
      v13 = objc_msgSend(NSNumber, "numberWithInt:", -[CMSchemaCMSearchEnded resultCount](self, "resultCount"));
      [v3 setObject:v13 forKeyedSubscript:@"resultCount"];

      if ((*(unsigned char *)&self->_has & 1) == 0) {
        goto LABEL_11;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v11 = NSNumber;
  [(CMSchemaCMSearchEnded *)self lowestMatchScore];
  objc_super v12 = objc_msgSend(v11, "numberWithDouble:");
  [v3 setObject:v12 forKeyedSubscript:@"lowestMatchScore"];

  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_16;
  }
LABEL_4:
  if ((has & 1) == 0) {
    goto LABEL_11;
  }
LABEL_5:
  int v5 = [(CMSchemaCMSearchEnded *)self searchStrategy];
  v6 = @"CMSEARCHSTRATEGY_UNKNOWN";
  if (v5 == 1) {
    v6 = @"CMSEARCHSTRATEGY_EXACT_MATCH";
  }
  if (v5 == 2) {
    uint64_t v7 = @"CMSEARCHSTRATEGY_APPROXIMATE_MATCH";
  }
  else {
    uint64_t v7 = v6;
  }
  [v3 setObject:v7 forKeyedSubscript:@"searchStrategy"];
LABEL_11:
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
  uint64_t v4 = 2654435761 * self->_searchStrategy;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_resultCount;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  double highestMatchScore = self->_highestMatchScore;
  double v7 = -highestMatchScore;
  if (highestMatchScore >= 0.0) {
    double v7 = self->_highestMatchScore;
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
    double lowestMatchScore = self->_lowestMatchScore;
    double v13 = -lowestMatchScore;
    if (lowestMatchScore >= 0.0) {
      double v13 = self->_lowestMatchScore;
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
  return v5 ^ v4 ^ v10 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  $9543DA9229227681A40D6BC9FA0493CF has = self->_has;
  unsigned int v6 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_17;
  }
  if (*(unsigned char *)&has)
  {
    int searchStrategy = self->_searchStrategy;
    if (searchStrategy != [v4 searchStrategy]) {
      goto LABEL_17;
    }
    $9543DA9229227681A40D6BC9FA0493CF has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      int resultCount = self->_resultCount;
      if (resultCount != [v4 resultCount]) {
        goto LABEL_17;
      }
      $9543DA9229227681A40D6BC9FA0493CF has = self->_has;
      unsigned int v6 = v4[32];
    }
    int v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (v10)
      {
        double highestMatchScore = self->_highestMatchScore;
        [v4 highestMatchScore];
        if (highestMatchScore != v12) {
          goto LABEL_17;
        }
        $9543DA9229227681A40D6BC9FA0493CF has = self->_has;
        unsigned int v6 = v4[32];
      }
      int v13 = (*(unsigned int *)&has >> 3) & 1;
      if (v13 == ((v6 >> 3) & 1))
      {
        if (!v13
          || (double lowestMatchScore = self->_lowestMatchScore, [v4 lowestMatchScore], lowestMatchScore == v15))
        {
          BOOL v16 = 1;
          goto LABEL_18;
        }
      }
    }
  }
LABEL_17:
  BOOL v16 = 0;
LABEL_18:

  return v16;
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
      goto LABEL_11;
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
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteDoubleField();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteDoubleField();
LABEL_6:
}

- (BOOL)readFrom:(id)a3
{
  return CMSchemaCMSearchEndedReadFrom(self, (uint64_t)a3);
}

- (void)deleteLowestMatchScore
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasLowestMatchScore:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasLowestMatchScore
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setLowestMatchScore:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_double lowestMatchScore = a3;
}

- (void)deleteHighestMatchScore
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasHighestMatchScore:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasHighestMatchScore
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHighestMatchScore:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_double highestMatchScore = a3;
}

- (void)deleteResultCount
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasResultCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasResultCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setResultCount:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int resultCount = a3;
}

- (void)deleteSearchStrategy
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSearchStrategy:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSearchStrategy
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSearchStrategy:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int searchStrategy = a3;
}

@end