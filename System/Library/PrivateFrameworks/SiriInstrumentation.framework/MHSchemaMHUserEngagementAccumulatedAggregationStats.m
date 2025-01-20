@interface MHSchemaMHUserEngagementAccumulatedAggregationStats
- (BOOL)hasAggregationStartTimestamp;
- (BOOL)hasCohortType;
- (BOOL)hasIntendedRequestRatio;
- (BOOL)hasNumberOfDaysAggregation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHUserEngagementAccumulatedAggregationStats)initWithDictionary:(id)a3;
- (MHSchemaMHUserEngagementAccumulatedAggregationStats)initWithJSON:(id)a3;
- (NSArray)aggregationStats;
- (NSData)jsonData;
- (NSString)cohortType;
- (double)aggregationStartTimestamp;
- (double)intendedRequestRatio;
- (id)aggregationStatsAtIndex:(unint64_t)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)numberOfDaysAggregation;
- (unint64_t)aggregationStatsCount;
- (unint64_t)hash;
- (void)addAggregationStats:(id)a3;
- (void)clearAggregationStats;
- (void)deleteAggregationStartTimestamp;
- (void)deleteCohortType;
- (void)deleteIntendedRequestRatio;
- (void)deleteNumberOfDaysAggregation;
- (void)setAggregationStartTimestamp:(double)a3;
- (void)setAggregationStats:(id)a3;
- (void)setCohortType:(id)a3;
- (void)setHasAggregationStartTimestamp:(BOOL)a3;
- (void)setHasCohortType:(BOOL)a3;
- (void)setHasIntendedRequestRatio:(BOOL)a3;
- (void)setHasNumberOfDaysAggregation:(BOOL)a3;
- (void)setIntendedRequestRatio:(double)a3;
- (void)setNumberOfDaysAggregation:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHUserEngagementAccumulatedAggregationStats

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MHSchemaMHUserEngagementAccumulatedAggregationStats;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(MHSchemaMHUserEngagementAccumulatedAggregationStats *)self aggregationStats];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];

  [(MHSchemaMHUserEngagementAccumulatedAggregationStats *)self setAggregationStats:v7];
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
  objc_storeStrong((id *)&self->_cohortType, 0);
  objc_storeStrong((id *)&self->_aggregationStats, 0);
}

- (void)setHasCohortType:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (double)intendedRequestRatio
{
  return self->_intendedRequestRatio;
}

- (void)setCohortType:(id)a3
{
}

- (NSString)cohortType
{
  return self->_cohortType;
}

- (void)setAggregationStats:(id)a3
{
}

- (NSArray)aggregationStats
{
  return self->_aggregationStats;
}

- (int)numberOfDaysAggregation
{
  return self->_numberOfDaysAggregation;
}

- (double)aggregationStartTimestamp
{
  return self->_aggregationStartTimestamp;
}

- (MHSchemaMHUserEngagementAccumulatedAggregationStats)initWithDictionary:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)MHSchemaMHUserEngagementAccumulatedAggregationStats;
  v5 = [(MHSchemaMHUserEngagementAccumulatedAggregationStats *)&v27 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"aggregationStartTimestamp"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 doubleValue];
      -[MHSchemaMHUserEngagementAccumulatedAggregationStats setAggregationStartTimestamp:](v5, "setAggregationStartTimestamp:");
    }
    v7 = [v4 objectForKeyedSubscript:@"numberOfDaysAggregation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHUserEngagementAccumulatedAggregationStats setNumberOfDaysAggregation:](v5, "setNumberOfDaysAggregation:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"aggregationStats"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = v7;
      v22 = v6;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v24 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = [[MHSchemaMHUserEngagementAggregatedStats alloc] initWithDictionary:v14];
              [(MHSchemaMHUserEngagementAccumulatedAggregationStats *)v5 addAggregationStats:v15];
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
        }
        while (v11);
      }

      v7 = v21;
    }
    v16 = objc_msgSend(v4, "objectForKeyedSubscript:", @"cohortType", v21, v22, (void)v23);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(MHSchemaMHUserEngagementAccumulatedAggregationStats *)v5 setCohortType:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"intendedRequestRatio"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v18 doubleValue];
      -[MHSchemaMHUserEngagementAccumulatedAggregationStats setIntendedRequestRatio:](v5, "setIntendedRequestRatio:");
    }
    v19 = v5;
  }
  return v5;
}

- (MHSchemaMHUserEngagementAccumulatedAggregationStats)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHUserEngagementAccumulatedAggregationStats *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHUserEngagementAccumulatedAggregationStats *)self dictionaryRepresentation];
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
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = NSNumber;
    [(MHSchemaMHUserEngagementAccumulatedAggregationStats *)self aggregationStartTimestamp];
    v5 = objc_msgSend(v4, "numberWithDouble:");
    [v3 setObject:v5 forKeyedSubscript:@"aggregationStartTimestamp"];
  }
  if ([(NSArray *)self->_aggregationStats count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v7 = self->_aggregationStats;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v21 + 1) + 8 * i) dictionaryRepresentation];
          if (v12)
          {
            [v6 addObject:v12];
          }
          else
          {
            v13 = [MEMORY[0x1E4F1CA98] null];
            [v6 addObject:v13];
          }
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"aggregationStats"];
  }
  if (self->_cohortType)
  {
    uint64_t v14 = [(MHSchemaMHUserEngagementAccumulatedAggregationStats *)self cohortType];
    v15 = (void *)[v14 copy];
    [v3 setObject:v15 forKeyedSubscript:@"cohortType"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v17 = NSNumber;
    [(MHSchemaMHUserEngagementAccumulatedAggregationStats *)self intendedRequestRatio];
    v18 = objc_msgSend(v17, "numberWithDouble:");
    [v3 setObject:v18 forKeyedSubscript:@"intendedRequestRatio"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v19 = objc_msgSend(NSNumber, "numberWithInt:", -[MHSchemaMHUserEngagementAccumulatedAggregationStats numberOfDaysAggregation](self, "numberOfDaysAggregation"));
    [v3 setObject:v19 forKeyedSubscript:@"numberOfDaysAggregation"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    double aggregationStartTimestamp = self->_aggregationStartTimestamp;
    double v6 = -aggregationStartTimestamp;
    if (aggregationStartTimestamp >= 0.0) {
      double v6 = self->_aggregationStartTimestamp;
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
    uint64_t v9 = 2654435761 * self->_numberOfDaysAggregation;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = [(NSArray *)self->_aggregationStats hash];
  NSUInteger v11 = [(NSString *)self->_cohortType hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    double intendedRequestRatio = self->_intendedRequestRatio;
    double v14 = -intendedRequestRatio;
    if (intendedRequestRatio >= 0.0) {
      double v14 = self->_intendedRequestRatio;
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
  return v9 ^ v4 ^ v10 ^ v11 ^ v12;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  $408C77E1ED155D510B53145B19C2D3BE has = self->_has;
  unsigned int v6 = v4[48];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&has)
  {
    double aggregationStartTimestamp = self->_aggregationStartTimestamp;
    [v4 aggregationStartTimestamp];
    if (aggregationStartTimestamp != v8) {
      goto LABEL_19;
    }
    $408C77E1ED155D510B53145B19C2D3BE has = self->_has;
    unsigned int v6 = v4[48];
  }
  int v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 != ((v6 >> 1) & 1)) {
    goto LABEL_19;
  }
  if (v9)
  {
    int numberOfDaysAggregation = self->_numberOfDaysAggregation;
    if (numberOfDaysAggregation != [v4 numberOfDaysAggregation]) {
      goto LABEL_19;
    }
  }
  NSUInteger v11 = [(MHSchemaMHUserEngagementAccumulatedAggregationStats *)self aggregationStats];
  unint64_t v12 = [v4 aggregationStats];
  if ((v11 == 0) == (v12 != 0)) {
    goto LABEL_18;
  }
  uint64_t v13 = [(MHSchemaMHUserEngagementAccumulatedAggregationStats *)self aggregationStats];
  if (v13)
  {
    double v14 = (void *)v13;
    long double v15 = [(MHSchemaMHUserEngagementAccumulatedAggregationStats *)self aggregationStats];
    double v16 = [v4 aggregationStats];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  NSUInteger v11 = [(MHSchemaMHUserEngagementAccumulatedAggregationStats *)self cohortType];
  unint64_t v12 = [v4 cohortType];
  if ((v11 == 0) == (v12 != 0))
  {
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v18 = [(MHSchemaMHUserEngagementAccumulatedAggregationStats *)self cohortType];
  if (v18)
  {
    v19 = (void *)v18;
    v20 = [(MHSchemaMHUserEngagementAccumulatedAggregationStats *)self cohortType];
    long long v21 = [v4 cohortType];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  int v25 = (*(unsigned char *)&self->_has >> 2) & 1;
  if (v25 == ((v4[48] >> 2) & 1))
  {
    if (!v25
      || (double intendedRequestRatio = self->_intendedRequestRatio,
          [v4 intendedRequestRatio],
          intendedRequestRatio == v27))
    {
      BOOL v23 = 1;
      goto LABEL_20;
    }
  }
LABEL_19:
  BOOL v23 = 0;
LABEL_20:

  return v23;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unsigned int v6 = self->_aggregationStats;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  NSUInteger v11 = [(MHSchemaMHUserEngagementAccumulatedAggregationStats *)self cohortType];

  if (v11) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteDoubleField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHUserEngagementAccumulatedAggregationStatsReadFrom(self, (uint64_t)a3);
}

- (void)deleteIntendedRequestRatio
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasIntendedRequestRatio:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIntendedRequestRatio
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIntendedRequestRatio:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_double intendedRequestRatio = a3;
}

- (void)deleteCohortType
{
}

- (BOOL)hasCohortType
{
  return self->_cohortType != 0;
}

- (id)aggregationStatsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_aggregationStats objectAtIndexedSubscript:a3];
}

- (unint64_t)aggregationStatsCount
{
  return [(NSArray *)self->_aggregationStats count];
}

- (void)addAggregationStats:(id)a3
{
  id v4 = a3;
  aggregationStats = self->_aggregationStats;
  id v8 = v4;
  if (!aggregationStats)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_aggregationStats;
    self->_aggregationStats = v6;

    id v4 = v8;
    aggregationStats = self->_aggregationStats;
  }
  [(NSArray *)aggregationStats addObject:v4];
}

- (void)clearAggregationStats
{
}

- (void)deleteNumberOfDaysAggregation
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasNumberOfDaysAggregation:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumberOfDaysAggregation
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setNumberOfDaysAggregation:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int numberOfDaysAggregation = a3;
}

- (void)deleteAggregationStartTimestamp
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasAggregationStartTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAggregationStartTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAggregationStartTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double aggregationStartTimestamp = a3;
}

@end