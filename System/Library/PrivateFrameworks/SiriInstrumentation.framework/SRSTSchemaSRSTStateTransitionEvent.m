@interface SRSTSchemaSRSTStateTransitionEvent
- (BOOL)hasCurrentState;
- (BOOL)hasPreviousState;
- (BOOL)hasReason;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SRSTSchemaSRSTStateTransitionEvent)initWithDictionary:(id)a3;
- (SRSTSchemaSRSTStateTransitionEvent)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)currentState;
- (int)previousState;
- (int)reason;
- (unint64_t)hash;
- (void)deleteCurrentState;
- (void)deletePreviousState;
- (void)deleteReason;
- (void)setCurrentState:(int)a3;
- (void)setHasCurrentState:(BOOL)a3;
- (void)setHasPreviousState:(BOOL)a3;
- (void)setHasReason:(BOOL)a3;
- (void)setPreviousState:(int)a3;
- (void)setReason:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SRSTSchemaSRSTStateTransitionEvent

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)reason
{
  return self->_reason;
}

- (int)previousState
{
  return self->_previousState;
}

- (int)currentState
{
  return self->_currentState;
}

- (SRSTSchemaSRSTStateTransitionEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SRSTSchemaSRSTStateTransitionEvent;
  v5 = [(SRSTSchemaSRSTStateTransitionEvent *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"currentState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SRSTSchemaSRSTStateTransitionEvent setCurrentState:](v5, "setCurrentState:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"previousState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SRSTSchemaSRSTStateTransitionEvent setPreviousState:](v5, "setPreviousState:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"reason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SRSTSchemaSRSTStateTransitionEvent setReason:](v5, "setReason:", [v8 intValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (SRSTSchemaSRSTStateTransitionEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SRSTSchemaSRSTStateTransitionEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SRSTSchemaSRSTStateTransitionEvent *)self dictionaryRepresentation];
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
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_9:
    unsigned int v7 = [(SRSTSchemaSRSTStateTransitionEvent *)self previousState] - 1;
    if (v7 > 8) {
      v8 = @"SRSTSTATE_UNKNOWN";
    }
    else {
      v8 = off_1E5EB93D0[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"previousState"];
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_17;
    }
    goto LABEL_13;
  }
  unsigned int v5 = [(SRSTSchemaSRSTStateTransitionEvent *)self currentState] - 1;
  if (v5 > 8) {
    v6 = @"SRSTSTATE_UNKNOWN";
  }
  else {
    v6 = off_1E5EB93D0[v5];
  }
  [v3 setObject:v6 forKeyedSubscript:@"currentState"];
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_9;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_13:
    unsigned int v9 = [(SRSTSchemaSRSTStateTransitionEvent *)self reason] - 1;
    if (v9 > 0x16) {
      v10 = @"SRSTSTATETRANSITIONREASON_UNKNOWN";
    }
    else {
      v10 = off_1E5EB9418[v9];
    }
    [v3 setObject:v10 forKeyedSubscript:@"reason"];
  }
LABEL_17:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_currentState;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_previousState;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_reason;
  return v3 ^ v2 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $6133FB21E486D1192714B286D6498F8D has = self->_has;
  unsigned int v6 = v4[20];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    int currentState = self->_currentState;
    if (currentState != [v4 currentState]) {
      goto LABEL_14;
    }
    $6133FB21E486D1192714B286D6498F8D has = self->_has;
    unsigned int v6 = v4[20];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_14;
  }
  if (v8)
  {
    int previousState = self->_previousState;
    if (previousState == [v4 previousState])
    {
      $6133FB21E486D1192714B286D6498F8D has = self->_has;
      unsigned int v6 = v4[20];
      goto LABEL_10;
    }
LABEL_14:
    BOOL v12 = 0;
    goto LABEL_15;
  }
LABEL_10:
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_14;
  }
  if (v10)
  {
    int reason = self->_reason;
    if (reason != [v4 reason]) {
      goto LABEL_14;
    }
  }
  BOOL v12 = 1;
LABEL_15:

  return v12;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
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
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return SRSTSchemaSRSTStateTransitionEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteReason
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasReason:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasReason
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setReason:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int reason = a3;
}

- (void)deletePreviousState
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasPreviousState:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPreviousState
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPreviousState:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int previousState = a3;
}

- (void)deleteCurrentState
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasCurrentState:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCurrentState
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCurrentState:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int currentState = a3;
}

@end