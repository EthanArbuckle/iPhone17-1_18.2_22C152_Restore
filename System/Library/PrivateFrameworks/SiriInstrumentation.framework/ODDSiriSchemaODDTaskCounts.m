@interface ODDSiriSchemaODDTaskCounts
- (BOOL)hasFlowTasksCompleted;
- (BOOL)hasFlowTasksStarted;
- (BOOL)hasSiriTasksCompleted;
- (BOOL)hasSiriTasksStarted;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ODDSiriSchemaODDTaskCounts)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDTaskCounts)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)flowTasksCompleted;
- (unsigned)flowTasksStarted;
- (unsigned)siriTasksCompleted;
- (unsigned)siriTasksStarted;
- (void)deleteFlowTasksCompleted;
- (void)deleteFlowTasksStarted;
- (void)deleteSiriTasksCompleted;
- (void)deleteSiriTasksStarted;
- (void)setFlowTasksCompleted:(unsigned int)a3;
- (void)setFlowTasksStarted:(unsigned int)a3;
- (void)setHasFlowTasksCompleted:(BOOL)a3;
- (void)setHasFlowTasksStarted:(BOOL)a3;
- (void)setHasSiriTasksCompleted:(BOOL)a3;
- (void)setHasSiriTasksStarted:(BOOL)a3;
- (void)setSiriTasksCompleted:(unsigned int)a3;
- (void)setSiriTasksStarted:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDTaskCounts

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)flowTasksCompleted
{
  return self->_flowTasksCompleted;
}

- (unsigned)flowTasksStarted
{
  return self->_flowTasksStarted;
}

- (unsigned)siriTasksCompleted
{
  return self->_siriTasksCompleted;
}

- (unsigned)siriTasksStarted
{
  return self->_siriTasksStarted;
}

- (ODDSiriSchemaODDTaskCounts)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ODDSiriSchemaODDTaskCounts;
  v5 = [(ODDSiriSchemaODDTaskCounts *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"siriTasksStarted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDTaskCounts setSiriTasksStarted:](v5, "setSiriTasksStarted:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"siriTasksCompleted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDTaskCounts setSiriTasksCompleted:](v5, "setSiriTasksCompleted:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"flowTasksStarted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDTaskCounts setFlowTasksStarted:](v5, "setFlowTasksStarted:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"flowTasksCompleted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDTaskCounts setFlowTasksCompleted:](v5, "setFlowTasksCompleted:", [v9 unsignedIntValue]);
    }
    v10 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDTaskCounts)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDTaskCounts *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDTaskCounts *)self dictionaryRepresentation];
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
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ODDSiriSchemaODDTaskCounts flowTasksCompleted](self, "flowTasksCompleted"));
    [v3 setObject:v7 forKeyedSubscript:@"flowTasksCompleted"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ODDSiriSchemaODDTaskCounts flowTasksStarted](self, "flowTasksStarted"));
  [v3 setObject:v8 forKeyedSubscript:@"flowTasksStarted"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ODDSiriSchemaODDTaskCounts siriTasksCompleted](self, "siriTasksCompleted"));
  [v3 setObject:v9 forKeyedSubscript:@"siriTasksCompleted"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_5:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ODDSiriSchemaODDTaskCounts siriTasksStarted](self, "siriTasksStarted"));
    [v3 setObject:v5 forKeyedSubscript:@"siriTasksStarted"];
  }
LABEL_6:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_siriTasksStarted;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_siriTasksCompleted;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_flowTasksStarted;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_flowTasksCompleted;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  $88F4253F97AC9EBD5DA60F4455FC9840 has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_18;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int siriTasksStarted = self->_siriTasksStarted;
    if (siriTasksStarted != [v4 siriTasksStarted]) {
      goto LABEL_18;
    }
    $88F4253F97AC9EBD5DA60F4455FC9840 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_18;
  }
  if (v8)
  {
    unsigned int siriTasksCompleted = self->_siriTasksCompleted;
    if (siriTasksCompleted != [v4 siriTasksCompleted]) {
      goto LABEL_18;
    }
    $88F4253F97AC9EBD5DA60F4455FC9840 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_18;
  }
  if (v10)
  {
    unsigned int flowTasksStarted = self->_flowTasksStarted;
    if (flowTasksStarted == [v4 flowTasksStarted])
    {
      $88F4253F97AC9EBD5DA60F4455FC9840 has = self->_has;
      unsigned int v6 = v4[24];
      goto LABEL_14;
    }
LABEL_18:
    BOOL v14 = 0;
    goto LABEL_19;
  }
LABEL_14:
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_18;
  }
  if (v12)
  {
    unsigned int flowTasksCompleted = self->_flowTasksCompleted;
    if (flowTasksCompleted != [v4 flowTasksCompleted]) {
      goto LABEL_18;
    }
  }
  BOOL v14 = 1;
LABEL_19:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
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
  PBDataWriterWriteUint32Field();
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
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteUint32Field();
LABEL_6:
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDTaskCountsReadFrom(self, (uint64_t)a3);
}

- (void)deleteFlowTasksCompleted
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasFlowTasksCompleted:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasFlowTasksCompleted
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setFlowTasksCompleted:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unsigned int flowTasksCompleted = a3;
}

- (void)deleteFlowTasksStarted
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasFlowTasksStarted:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFlowTasksStarted
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setFlowTasksStarted:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int flowTasksStarted = a3;
}

- (void)deleteSiriTasksCompleted
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasSiriTasksCompleted:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSiriTasksCompleted
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSiriTasksCompleted:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int siriTasksCompleted = a3;
}

- (void)deleteSiriTasksStarted
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSiriTasksStarted:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSiriTasksStarted
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSiriTasksStarted:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int siriTasksStarted = a3;
}

@end