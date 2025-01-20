@interface ODMSiriSchemaODMSiriTaskCounts
- (BOOL)hasCancelledSiriTaskCount;
- (BOOL)hasCompletedSiriTaskCount;
- (BOOL)hasCompletedUITaskCount;
- (BOOL)hasFailedSiriTaskCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ODMSiriSchemaODMSiriTaskCounts)initWithDictionary:(id)a3;
- (ODMSiriSchemaODMSiriTaskCounts)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)cancelledSiriTaskCount;
- (unsigned)completedSiriTaskCount;
- (unsigned)completedUITaskCount;
- (unsigned)failedSiriTaskCount;
- (void)deleteCancelledSiriTaskCount;
- (void)deleteCompletedSiriTaskCount;
- (void)deleteCompletedUITaskCount;
- (void)deleteFailedSiriTaskCount;
- (void)setCancelledSiriTaskCount:(unsigned int)a3;
- (void)setCompletedSiriTaskCount:(unsigned int)a3;
- (void)setCompletedUITaskCount:(unsigned int)a3;
- (void)setFailedSiriTaskCount:(unsigned int)a3;
- (void)setHasCancelledSiriTaskCount:(BOOL)a3;
- (void)setHasCompletedSiriTaskCount:(BOOL)a3;
- (void)setHasCompletedUITaskCount:(BOOL)a3;
- (void)setHasFailedSiriTaskCount:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODMSiriSchemaODMSiriTaskCounts

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)completedUITaskCount
{
  return self->_completedUITaskCount;
}

- (unsigned)cancelledSiriTaskCount
{
  return self->_cancelledSiriTaskCount;
}

- (unsigned)failedSiriTaskCount
{
  return self->_failedSiriTaskCount;
}

- (unsigned)completedSiriTaskCount
{
  return self->_completedSiriTaskCount;
}

- (ODMSiriSchemaODMSiriTaskCounts)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ODMSiriSchemaODMSiriTaskCounts;
  v5 = [(ODMSiriSchemaODMSiriTaskCounts *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"completedSiriTaskCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODMSiriSchemaODMSiriTaskCounts setCompletedSiriTaskCount:](v5, "setCompletedSiriTaskCount:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"failedSiriTaskCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODMSiriSchemaODMSiriTaskCounts setFailedSiriTaskCount:](v5, "setFailedSiriTaskCount:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"cancelledSiriTaskCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODMSiriSchemaODMSiriTaskCounts setCancelledSiriTaskCount:](v5, "setCancelledSiriTaskCount:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"completedUITaskCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODMSiriSchemaODMSiriTaskCounts setCompletedUITaskCount:](v5, "setCompletedUITaskCount:", [v9 unsignedIntValue]);
    }
    v10 = v5;
  }
  return v5;
}

- (ODMSiriSchemaODMSiriTaskCounts)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODMSiriSchemaODMSiriTaskCounts *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODMSiriSchemaODMSiriTaskCounts *)self dictionaryRepresentation];
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
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ODMSiriSchemaODMSiriTaskCounts cancelledSiriTaskCount](self, "cancelledSiriTaskCount"));
    [v3 setObject:v7 forKeyedSubscript:@"cancelledSiriTaskCount"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ODMSiriSchemaODMSiriTaskCounts completedSiriTaskCount](self, "completedSiriTaskCount"));
  [v3 setObject:v8 forKeyedSubscript:@"completedSiriTaskCount"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ODMSiriSchemaODMSiriTaskCounts completedUITaskCount](self, "completedUITaskCount"));
  [v3 setObject:v9 forKeyedSubscript:@"completedUITaskCount"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_5:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ODMSiriSchemaODMSiriTaskCounts failedSiriTaskCount](self, "failedSiriTaskCount"));
    [v3 setObject:v5 forKeyedSubscript:@"failedSiriTaskCount"];
  }
LABEL_6:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_completedSiriTaskCount;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_failedSiriTaskCount;
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
  uint64_t v4 = 2654435761 * self->_cancelledSiriTaskCount;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_completedUITaskCount;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  $5B605B65F046BB0EF3D84EBB9E06051F has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_18;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int completedSiriTaskCount = self->_completedSiriTaskCount;
    if (completedSiriTaskCount != [v4 completedSiriTaskCount]) {
      goto LABEL_18;
    }
    $5B605B65F046BB0EF3D84EBB9E06051F has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_18;
  }
  if (v8)
  {
    unsigned int failedSiriTaskCount = self->_failedSiriTaskCount;
    if (failedSiriTaskCount != [v4 failedSiriTaskCount]) {
      goto LABEL_18;
    }
    $5B605B65F046BB0EF3D84EBB9E06051F has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_18;
  }
  if (v10)
  {
    unsigned int cancelledSiriTaskCount = self->_cancelledSiriTaskCount;
    if (cancelledSiriTaskCount == [v4 cancelledSiriTaskCount])
    {
      $5B605B65F046BB0EF3D84EBB9E06051F has = self->_has;
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
    unsigned int completedUITaskCount = self->_completedUITaskCount;
    if (completedUITaskCount != [v4 completedUITaskCount]) {
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
  return ODMSiriSchemaODMSiriTaskCountsReadFrom(self, (uint64_t)a3);
}

- (void)deleteCompletedUITaskCount
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasCompletedUITaskCount:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasCompletedUITaskCount
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setCompletedUITaskCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unsigned int completedUITaskCount = a3;
}

- (void)deleteCancelledSiriTaskCount
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasCancelledSiriTaskCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCancelledSiriTaskCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCancelledSiriTaskCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int cancelledSiriTaskCount = a3;
}

- (void)deleteFailedSiriTaskCount
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasFailedSiriTaskCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFailedSiriTaskCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setFailedSiriTaskCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int failedSiriTaskCount = a3;
}

- (void)deleteCompletedSiriTaskCount
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasCompletedSiriTaskCount:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCompletedSiriTaskCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCompletedSiriTaskCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int completedSiriTaskCount = a3;
}

@end