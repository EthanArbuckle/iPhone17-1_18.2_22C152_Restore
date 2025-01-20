@interface ODDSiriSchemaODDDeviceAndUsageAppTaskCounts
- (BOOL)hasCancelledSiriAppTaskCount;
- (BOOL)hasCompletedSiriAppTaskCount;
- (BOOL)hasCompletedUIAppTaskCount;
- (BOOL)hasFailedSiriAppTaskCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ODDSiriSchemaODDDeviceAndUsageAppTaskCounts)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDDeviceAndUsageAppTaskCounts)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)cancelledSiriAppTaskCount;
- (unsigned)completedSiriAppTaskCount;
- (unsigned)completedUIAppTaskCount;
- (unsigned)failedSiriAppTaskCount;
- (void)deleteCancelledSiriAppTaskCount;
- (void)deleteCompletedSiriAppTaskCount;
- (void)deleteCompletedUIAppTaskCount;
- (void)deleteFailedSiriAppTaskCount;
- (void)setCancelledSiriAppTaskCount:(unsigned int)a3;
- (void)setCompletedSiriAppTaskCount:(unsigned int)a3;
- (void)setCompletedUIAppTaskCount:(unsigned int)a3;
- (void)setFailedSiriAppTaskCount:(unsigned int)a3;
- (void)setHasCancelledSiriAppTaskCount:(BOOL)a3;
- (void)setHasCompletedSiriAppTaskCount:(BOOL)a3;
- (void)setHasCompletedUIAppTaskCount:(BOOL)a3;
- (void)setHasFailedSiriAppTaskCount:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDDeviceAndUsageAppTaskCounts

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)completedUIAppTaskCount
{
  return self->_completedUIAppTaskCount;
}

- (unsigned)cancelledSiriAppTaskCount
{
  return self->_cancelledSiriAppTaskCount;
}

- (unsigned)failedSiriAppTaskCount
{
  return self->_failedSiriAppTaskCount;
}

- (unsigned)completedSiriAppTaskCount
{
  return self->_completedSiriAppTaskCount;
}

- (ODDSiriSchemaODDDeviceAndUsageAppTaskCounts)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ODDSiriSchemaODDDeviceAndUsageAppTaskCounts;
  v5 = [(ODDSiriSchemaODDDeviceAndUsageAppTaskCounts *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"completedSiriAppTaskCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDDeviceAndUsageAppTaskCounts setCompletedSiriAppTaskCount:](v5, "setCompletedSiriAppTaskCount:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"failedSiriAppTaskCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDDeviceAndUsageAppTaskCounts setFailedSiriAppTaskCount:](v5, "setFailedSiriAppTaskCount:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"cancelledSiriAppTaskCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDDeviceAndUsageAppTaskCounts setCancelledSiriAppTaskCount:](v5, "setCancelledSiriAppTaskCount:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"completedUIAppTaskCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDDeviceAndUsageAppTaskCounts setCompletedUIAppTaskCount:](v5, "setCompletedUIAppTaskCount:", [v9 unsignedIntValue]);
    }
    v10 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDDeviceAndUsageAppTaskCounts)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDDeviceAndUsageAppTaskCounts *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDDeviceAndUsageAppTaskCounts *)self dictionaryRepresentation];
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
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ODDSiriSchemaODDDeviceAndUsageAppTaskCounts cancelledSiriAppTaskCount](self, "cancelledSiriAppTaskCount"));
    [v3 setObject:v7 forKeyedSubscript:@"cancelledSiriAppTaskCount"];

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
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ODDSiriSchemaODDDeviceAndUsageAppTaskCounts completedSiriAppTaskCount](self, "completedSiriAppTaskCount"));
  [v3 setObject:v8 forKeyedSubscript:@"completedSiriAppTaskCount"];

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
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ODDSiriSchemaODDDeviceAndUsageAppTaskCounts completedUIAppTaskCount](self, "completedUIAppTaskCount"));
  [v3 setObject:v9 forKeyedSubscript:@"completedUIAppTaskCount"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_5:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ODDSiriSchemaODDDeviceAndUsageAppTaskCounts failedSiriAppTaskCount](self, "failedSiriAppTaskCount"));
    [v3 setObject:v5 forKeyedSubscript:@"failedSiriAppTaskCount"];
  }
LABEL_6:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_completedSiriAppTaskCount;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_failedSiriAppTaskCount;
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
  uint64_t v4 = 2654435761 * self->_cancelledSiriAppTaskCount;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_completedUIAppTaskCount;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  $3ABE756B781DFBD73F4F1E789687CE7A has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_18;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int completedSiriAppTaskCount = self->_completedSiriAppTaskCount;
    if (completedSiriAppTaskCount != [v4 completedSiriAppTaskCount]) {
      goto LABEL_18;
    }
    $3ABE756B781DFBD73F4F1E789687CE7A has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_18;
  }
  if (v8)
  {
    unsigned int failedSiriAppTaskCount = self->_failedSiriAppTaskCount;
    if (failedSiriAppTaskCount != [v4 failedSiriAppTaskCount]) {
      goto LABEL_18;
    }
    $3ABE756B781DFBD73F4F1E789687CE7A has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_18;
  }
  if (v10)
  {
    unsigned int cancelledSiriAppTaskCount = self->_cancelledSiriAppTaskCount;
    if (cancelledSiriAppTaskCount == [v4 cancelledSiriAppTaskCount])
    {
      $3ABE756B781DFBD73F4F1E789687CE7A has = self->_has;
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
    unsigned int completedUIAppTaskCount = self->_completedUIAppTaskCount;
    if (completedUIAppTaskCount != [v4 completedUIAppTaskCount]) {
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
  return ODDSiriSchemaODDDeviceAndUsageAppTaskCountsReadFrom(self, (uint64_t)a3);
}

- (void)deleteCompletedUIAppTaskCount
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasCompletedUIAppTaskCount:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasCompletedUIAppTaskCount
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setCompletedUIAppTaskCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unsigned int completedUIAppTaskCount = a3;
}

- (void)deleteCancelledSiriAppTaskCount
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasCancelledSiriAppTaskCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCancelledSiriAppTaskCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCancelledSiriAppTaskCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int cancelledSiriAppTaskCount = a3;
}

- (void)deleteFailedSiriAppTaskCount
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasFailedSiriAppTaskCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFailedSiriAppTaskCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setFailedSiriAppTaskCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int failedSiriAppTaskCount = a3;
}

- (void)deleteCompletedSiriAppTaskCount
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasCompletedSiriAppTaskCount:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCompletedSiriAppTaskCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCompletedSiriAppTaskCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int completedSiriAppTaskCount = a3;
}

@end