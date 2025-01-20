@interface MHSchemaMHUserEngagementFalseTriggerMitigationStarted
- (BOOL)hasAccumulatedAggregationStats;
- (BOOL)hasModelVersion;
- (BOOL)hasUiWaitTimeInSeconds;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHUserEngagementAccumulatedAggregationStats)accumulatedAggregationStats;
- (MHSchemaMHUserEngagementFalseTriggerMitigationStarted)initWithDictionary:(id)a3;
- (MHSchemaMHUserEngagementFalseTriggerMitigationStarted)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)modelVersion;
- (double)uiWaitTimeInSeconds;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteAccumulatedAggregationStats;
- (void)deleteModelVersion;
- (void)deleteUiWaitTimeInSeconds;
- (void)setAccumulatedAggregationStats:(id)a3;
- (void)setHasAccumulatedAggregationStats:(BOOL)a3;
- (void)setHasModelVersion:(BOOL)a3;
- (void)setHasUiWaitTimeInSeconds:(BOOL)a3;
- (void)setModelVersion:(id)a3;
- (void)setUiWaitTimeInSeconds:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHUserEngagementFalseTriggerMitigationStarted

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MHSchemaMHUserEngagementFalseTriggerMitigationStarted;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(MHSchemaMHUserEngagementFalseTriggerMitigationStarted *)self accumulatedAggregationStats];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(MHSchemaMHUserEngagementFalseTriggerMitigationStarted *)self deleteAccumulatedAggregationStats];
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
  objc_storeStrong((id *)&self->_accumulatedAggregationStats, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
}

- (void)setHasAccumulatedAggregationStats:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasModelVersion:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setAccumulatedAggregationStats:(id)a3
{
}

- (MHSchemaMHUserEngagementAccumulatedAggregationStats)accumulatedAggregationStats
{
  return self->_accumulatedAggregationStats;
}

- (double)uiWaitTimeInSeconds
{
  return self->_uiWaitTimeInSeconds;
}

- (void)setModelVersion:(id)a3
{
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (MHSchemaMHUserEngagementFalseTriggerMitigationStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MHSchemaMHUserEngagementFalseTriggerMitigationStarted;
  v5 = [(MHSchemaMHUserEngagementFalseTriggerMitigationStarted *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"modelVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(MHSchemaMHUserEngagementFalseTriggerMitigationStarted *)v5 setModelVersion:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"uiWaitTimeInSeconds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 doubleValue];
      -[MHSchemaMHUserEngagementFalseTriggerMitigationStarted setUiWaitTimeInSeconds:](v5, "setUiWaitTimeInSeconds:");
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"accumulatedAggregationStats"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[MHSchemaMHUserEngagementAccumulatedAggregationStats alloc] initWithDictionary:v9];
      [(MHSchemaMHUserEngagementFalseTriggerMitigationStarted *)v5 setAccumulatedAggregationStats:v10];
    }
    v11 = v5;
  }
  return v5;
}

- (MHSchemaMHUserEngagementFalseTriggerMitigationStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHUserEngagementFalseTriggerMitigationStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHUserEngagementFalseTriggerMitigationStarted *)self dictionaryRepresentation];
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
  if (self->_accumulatedAggregationStats)
  {
    id v4 = [(MHSchemaMHUserEngagementFalseTriggerMitigationStarted *)self accumulatedAggregationStats];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"accumulatedAggregationStats"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"accumulatedAggregationStats"];
    }
  }
  if (self->_modelVersion)
  {
    uint64_t v7 = [(MHSchemaMHUserEngagementFalseTriggerMitigationStarted *)self modelVersion];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"modelVersion"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v9 = NSNumber;
    [(MHSchemaMHUserEngagementFalseTriggerMitigationStarted *)self uiWaitTimeInSeconds];
    v10 = objc_msgSend(v9, "numberWithDouble:");
    [v3 setObject:v10 forKeyedSubscript:@"uiWaitTimeInSeconds"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_modelVersion hash];
  if (*(unsigned char *)&self->_has)
  {
    double uiWaitTimeInSeconds = self->_uiWaitTimeInSeconds;
    double v6 = -uiWaitTimeInSeconds;
    if (uiWaitTimeInSeconds >= 0.0) {
      double v6 = self->_uiWaitTimeInSeconds;
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
  return v4 ^ v3 ^ [(MHSchemaMHUserEngagementAccumulatedAggregationStats *)self->_accumulatedAggregationStats hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  v5 = [(MHSchemaMHUserEngagementFalseTriggerMitigationStarted *)self modelVersion];
  double v6 = [v4 modelVersion];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_14;
  }
  uint64_t v7 = [(MHSchemaMHUserEngagementFalseTriggerMitigationStarted *)self modelVersion];
  if (v7)
  {
    double v8 = (void *)v7;
    objc_super v9 = [(MHSchemaMHUserEngagementFalseTriggerMitigationStarted *)self modelVersion];
    v10 = [v4 modelVersion];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[32] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    double uiWaitTimeInSeconds = self->_uiWaitTimeInSeconds;
    [v4 uiWaitTimeInSeconds];
    if (uiWaitTimeInSeconds != v13) {
      goto LABEL_15;
    }
  }
  v5 = [(MHSchemaMHUserEngagementFalseTriggerMitigationStarted *)self accumulatedAggregationStats];
  double v6 = [v4 accumulatedAggregationStats];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v14 = [(MHSchemaMHUserEngagementFalseTriggerMitigationStarted *)self accumulatedAggregationStats];
    if (!v14)
    {

LABEL_18:
      BOOL v19 = 1;
      goto LABEL_16;
    }
    v15 = (void *)v14;
    v16 = [(MHSchemaMHUserEngagementFalseTriggerMitigationStarted *)self accumulatedAggregationStats];
    v17 = [v4 accumulatedAggregationStats];
    char v18 = [v16 isEqual:v17];

    if (v18) {
      goto LABEL_18;
    }
  }
  else
  {
LABEL_14:
  }
LABEL_15:
  BOOL v19 = 0;
LABEL_16:

  return v19;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  unint64_t v4 = [(MHSchemaMHUserEngagementFalseTriggerMitigationStarted *)self modelVersion];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  v5 = [(MHSchemaMHUserEngagementFalseTriggerMitigationStarted *)self accumulatedAggregationStats];

  double v6 = v8;
  if (v5)
  {
    uint64_t v7 = [(MHSchemaMHUserEngagementFalseTriggerMitigationStarted *)self accumulatedAggregationStats];
    PBDataWriterWriteSubmessage();

    double v6 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHUserEngagementFalseTriggerMitigationStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteAccumulatedAggregationStats
{
}

- (BOOL)hasAccumulatedAggregationStats
{
  return self->_accumulatedAggregationStats != 0;
}

- (void)deleteUiWaitTimeInSeconds
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasUiWaitTimeInSeconds:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUiWaitTimeInSeconds
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setUiWaitTimeInSeconds:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double uiWaitTimeInSeconds = a3;
}

- (void)deleteModelVersion
{
}

- (BOOL)hasModelVersion
{
  return self->_modelVersion != 0;
}

@end