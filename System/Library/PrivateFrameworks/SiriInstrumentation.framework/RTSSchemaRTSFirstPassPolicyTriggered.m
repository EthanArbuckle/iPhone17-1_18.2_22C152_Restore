@interface RTSSchemaRTSFirstPassPolicyTriggered
- (BOOL)hasFirstPassTriggerScore;
- (BOOL)hasIsReplayModeEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReplayModeEnabled;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (RTSSchemaRTSFirstPassPolicyTriggered)initWithDictionary:(id)a3;
- (RTSSchemaRTSFirstPassPolicyTriggered)initWithJSON:(id)a3;
- (double)firstPassTriggerScore;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteFirstPassTriggerScore;
- (void)deleteIsReplayModeEnabled;
- (void)setFirstPassTriggerScore:(double)a3;
- (void)setHasFirstPassTriggerScore:(BOOL)a3;
- (void)setHasIsReplayModeEnabled:(BOOL)a3;
- (void)setIsReplayModeEnabled:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation RTSSchemaRTSFirstPassPolicyTriggered

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (double)firstPassTriggerScore
{
  return self->_firstPassTriggerScore;
}

- (BOOL)isReplayModeEnabled
{
  return self->_isReplayModeEnabled;
}

- (RTSSchemaRTSFirstPassPolicyTriggered)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RTSSchemaRTSFirstPassPolicyTriggered;
  v5 = [(RTSSchemaRTSFirstPassPolicyTriggered *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isReplayModeEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[RTSSchemaRTSFirstPassPolicyTriggered setIsReplayModeEnabled:](v5, "setIsReplayModeEnabled:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"firstPassTriggerScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 doubleValue];
      -[RTSSchemaRTSFirstPassPolicyTriggered setFirstPassTriggerScore:](v5, "setFirstPassTriggerScore:");
    }
    v8 = v5;
  }
  return v5;
}

- (RTSSchemaRTSFirstPassPolicyTriggered)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(RTSSchemaRTSFirstPassPolicyTriggered *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(RTSSchemaRTSFirstPassPolicyTriggered *)self dictionaryRepresentation];
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
    [(RTSSchemaRTSFirstPassPolicyTriggered *)self firstPassTriggerScore];
    v6 = objc_msgSend(v5, "numberWithDouble:");
    [v3 setObject:v6 forKeyedSubscript:@"firstPassTriggerScore"];

    char has = (char)self->_has;
  }
  if (has)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[RTSSchemaRTSFirstPassPolicyTriggered isReplayModeEnabled](self, "isReplayModeEnabled"));
    [v3 setObject:v7 forKeyedSubscript:@"isReplayModeEnabled"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_isReplayModeEnabled;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v7 = 0;
    return v7 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double firstPassTriggerScore = self->_firstPassTriggerScore;
  double v4 = -firstPassTriggerScore;
  if (firstPassTriggerScore >= 0.0) {
    double v4 = self->_firstPassTriggerScore;
  }
  long double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  unint64_t v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
  if (v6 >= 0.0)
  {
    if (v6 > 0.0) {
      v7 += (unint64_t)v6;
    }
  }
  else
  {
    v7 -= (unint64_t)fabs(v6);
  }
  return v7 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  $2ABB84B6DFEFA7B740DACEA1F79F4C5E has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&has)
  {
    int isReplayModeEnabled = self->_isReplayModeEnabled;
    if (isReplayModeEnabled != [v4 isReplayModeEnabled]) {
      goto LABEL_9;
    }
    $2ABB84B6DFEFA7B740DACEA1F79F4C5E has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8
      || (double firstPassTriggerScore = self->_firstPassTriggerScore,
          [v4 firstPassTriggerScore],
          firstPassTriggerScore == v10))
    {
      BOOL v11 = 1;
      goto LABEL_10;
    }
  }
LABEL_9:
  BOOL v11 = 0;
LABEL_10:

  return v11;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return RTSSchemaRTSFirstPassPolicyTriggeredReadFrom(self, (uint64_t)a3);
}

- (void)deleteFirstPassTriggerScore
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasFirstPassTriggerScore:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFirstPassTriggerScore
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setFirstPassTriggerScore:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_double firstPassTriggerScore = a3;
}

- (void)deleteIsReplayModeEnabled
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsReplayModeEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsReplayModeEnabled
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsReplayModeEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isReplayModeEnabled = a3;
}

@end