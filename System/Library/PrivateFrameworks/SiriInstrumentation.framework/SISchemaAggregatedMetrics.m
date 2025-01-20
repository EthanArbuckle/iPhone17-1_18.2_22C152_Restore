@interface SISchemaAggregatedMetrics
- (BOOL)hasSelfTriggerSuppression;
- (BOOL)hasVoiceTrigger;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaAggregatedMetrics)initWithDictionary:(id)a3;
- (SISchemaAggregatedMetrics)initWithJSON:(id)a3;
- (SISchemaSelfTriggerSuppressionMetrics)selfTriggerSuppression;
- (SISchemaVoiceTriggerMetrics)voiceTrigger;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteSelfTriggerSuppression;
- (void)deleteVoiceTrigger;
- (void)setHasSelfTriggerSuppression:(BOOL)a3;
- (void)setHasVoiceTrigger:(BOOL)a3;
- (void)setSelfTriggerSuppression:(id)a3;
- (void)setVoiceTrigger:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaAggregatedMetrics

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SISchemaAggregatedMetrics;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaAggregatedMetrics *)self voiceTrigger];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(SISchemaAggregatedMetrics *)self deleteVoiceTrigger];
  }
  v9 = [(SISchemaAggregatedMetrics *)self selfTriggerSuppression];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(SISchemaAggregatedMetrics *)self deleteSelfTriggerSuppression];
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
  objc_storeStrong((id *)&self->_selfTriggerSuppression, 0);
  objc_storeStrong((id *)&self->_voiceTrigger, 0);
}

- (void)setHasSelfTriggerSuppression:(BOOL)a3
{
  self->_hasSelfTriggerSuppression = a3;
}

- (void)setHasVoiceTrigger:(BOOL)a3
{
  self->_hasVoiceTrigger = a3;
}

- (void)setSelfTriggerSuppression:(id)a3
{
}

- (SISchemaSelfTriggerSuppressionMetrics)selfTriggerSuppression
{
  return self->_selfTriggerSuppression;
}

- (void)setVoiceTrigger:(id)a3
{
}

- (SISchemaVoiceTriggerMetrics)voiceTrigger
{
  return self->_voiceTrigger;
}

- (SISchemaAggregatedMetrics)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SISchemaAggregatedMetrics;
  v5 = [(SISchemaAggregatedMetrics *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"voiceTrigger"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaVoiceTriggerMetrics alloc] initWithDictionary:v6];
      [(SISchemaAggregatedMetrics *)v5 setVoiceTrigger:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"selfTriggerSuppression"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaSelfTriggerSuppressionMetrics alloc] initWithDictionary:v8];
      [(SISchemaAggregatedMetrics *)v5 setSelfTriggerSuppression:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (SISchemaAggregatedMetrics)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaAggregatedMetrics *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaAggregatedMetrics *)self dictionaryRepresentation];
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
  if (self->_selfTriggerSuppression)
  {
    id v4 = [(SISchemaAggregatedMetrics *)self selfTriggerSuppression];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"selfTriggerSuppression"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"selfTriggerSuppression"];
    }
  }
  if (self->_voiceTrigger)
  {
    uint64_t v7 = [(SISchemaAggregatedMetrics *)self voiceTrigger];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"voiceTrigger"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"voiceTrigger"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaVoiceTriggerMetrics *)self->_voiceTrigger hash];
  return [(SISchemaSelfTriggerSuppressionMetrics *)self->_selfTriggerSuppression hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(SISchemaAggregatedMetrics *)self voiceTrigger];
  v6 = [v4 voiceTrigger];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(SISchemaAggregatedMetrics *)self voiceTrigger];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(SISchemaAggregatedMetrics *)self voiceTrigger];
    v10 = [v4 voiceTrigger];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(SISchemaAggregatedMetrics *)self selfTriggerSuppression];
  v6 = [v4 selfTriggerSuppression];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(SISchemaAggregatedMetrics *)self selfTriggerSuppression];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    objc_super v13 = (void *)v12;
    v14 = [(SISchemaAggregatedMetrics *)self selfTriggerSuppression];
    v15 = [v4 selfTriggerSuppression];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(SISchemaAggregatedMetrics *)self voiceTrigger];

  if (v4)
  {
    v5 = [(SISchemaAggregatedMetrics *)self voiceTrigger];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(SISchemaAggregatedMetrics *)self selfTriggerSuppression];

  if (v6)
  {
    uint64_t v7 = [(SISchemaAggregatedMetrics *)self selfTriggerSuppression];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaAggregatedMetricsReadFrom(self, (uint64_t)a3);
}

- (void)deleteSelfTriggerSuppression
{
}

- (BOOL)hasSelfTriggerSuppression
{
  return self->_selfTriggerSuppression != 0;
}

- (void)deleteVoiceTrigger
{
}

- (BOOL)hasVoiceTrigger
{
  return self->_voiceTrigger != 0;
}

@end