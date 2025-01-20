@interface ODMSiriSchemaODMSiriTaskCountsReported
- (BOOL)hasCancelledSiriTaskCount;
- (BOOL)hasCompletedSiriTaskCount;
- (BOOL)hasCompletedUITaskCount;
- (BOOL)hasDimensions;
- (BOOL)hasFailedSiriTaskCount;
- (BOOL)hasTaskType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ODMSiriSchemaODMSiriAggregationDimensions)dimensions;
- (ODMSiriSchemaODMSiriTaskCountsReported)initWithDictionary:(id)a3;
- (ODMSiriSchemaODMSiriTaskCountsReported)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)taskType;
- (unint64_t)hash;
- (unsigned)cancelledSiriTaskCount;
- (unsigned)completedSiriTaskCount;
- (unsigned)completedUITaskCount;
- (unsigned)failedSiriTaskCount;
- (void)deleteCancelledSiriTaskCount;
- (void)deleteCompletedSiriTaskCount;
- (void)deleteCompletedUITaskCount;
- (void)deleteDimensions;
- (void)deleteFailedSiriTaskCount;
- (void)deleteTaskType;
- (void)setCancelledSiriTaskCount:(unsigned int)a3;
- (void)setCompletedSiriTaskCount:(unsigned int)a3;
- (void)setCompletedUITaskCount:(unsigned int)a3;
- (void)setDimensions:(id)a3;
- (void)setFailedSiriTaskCount:(unsigned int)a3;
- (void)setHasCancelledSiriTaskCount:(BOOL)a3;
- (void)setHasCompletedSiriTaskCount:(BOOL)a3;
- (void)setHasCompletedUITaskCount:(BOOL)a3;
- (void)setHasDimensions:(BOOL)a3;
- (void)setHasFailedSiriTaskCount:(BOOL)a3;
- (void)setHasTaskType:(BOOL)a3;
- (void)setTaskType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODMSiriSchemaODMSiriTaskCountsReported

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ODMSiriSchemaODMSiriTaskCountsReported;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(ODMSiriSchemaODMSiriTaskCountsReported *)self dimensions];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(ODMSiriSchemaODMSiriTaskCountsReported *)self deleteDimensions];
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

- (void)setHasDimensions:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
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

- (int)taskType
{
  return self->_taskType;
}

- (void)setDimensions:(id)a3
{
}

- (ODMSiriSchemaODMSiriAggregationDimensions)dimensions
{
  return self->_dimensions;
}

- (ODMSiriSchemaODMSiriTaskCountsReported)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ODMSiriSchemaODMSiriTaskCountsReported;
  v5 = [(ODMSiriSchemaODMSiriTaskCountsReported *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"dimensions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[ODMSiriSchemaODMSiriAggregationDimensions alloc] initWithDictionary:v6];
      [(ODMSiriSchemaODMSiriTaskCountsReported *)v5 setDimensions:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"taskType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODMSiriSchemaODMSiriTaskCountsReported setTaskType:](v5, "setTaskType:", [v8 intValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"completedSiriTaskCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODMSiriSchemaODMSiriTaskCountsReported setCompletedSiriTaskCount:](v5, "setCompletedSiriTaskCount:", [v9 unsignedIntValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"failedSiriTaskCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODMSiriSchemaODMSiriTaskCountsReported setFailedSiriTaskCount:](v5, "setFailedSiriTaskCount:", [v10 unsignedIntValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"cancelledSiriTaskCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODMSiriSchemaODMSiriTaskCountsReported setCancelledSiriTaskCount:](v5, "setCancelledSiriTaskCount:", [v11 unsignedIntValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"completedUITaskCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODMSiriSchemaODMSiriTaskCountsReported setCompletedUITaskCount:](v5, "setCompletedUITaskCount:", [v12 unsignedIntValue]);
    }
    v13 = v5;
  }
  return v5;
}

- (ODMSiriSchemaODMSiriTaskCountsReported)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODMSiriSchemaODMSiriTaskCountsReported *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODMSiriSchemaODMSiriTaskCountsReported *)self dictionaryRepresentation];
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
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ODMSiriSchemaODMSiriTaskCountsReported cancelledSiriTaskCount](self, "cancelledSiriTaskCount"));
    [v3 setObject:v8 forKeyedSubscript:@"cancelledSiriTaskCount"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_super v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ODMSiriSchemaODMSiriTaskCountsReported completedSiriTaskCount](self, "completedSiriTaskCount"));
  [v3 setObject:v9 forKeyedSubscript:@"completedSiriTaskCount"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ODMSiriSchemaODMSiriTaskCountsReported completedUITaskCount](self, "completedUITaskCount"));
    [v3 setObject:v5 forKeyedSubscript:@"completedUITaskCount"];
  }
LABEL_5:
  if (self->_dimensions)
  {
    v6 = [(ODMSiriSchemaODMSiriTaskCountsReported *)self dimensions];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"dimensions"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"dimensions"];
    }
  }
  char v11 = (char)self->_has;
  if ((v11 & 4) != 0)
  {
    v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ODMSiriSchemaODMSiriTaskCountsReported failedSiriTaskCount](self, "failedSiriTaskCount"));
    [v3 setObject:v12 forKeyedSubscript:@"failedSiriTaskCount"];

    char v11 = (char)self->_has;
  }
  if (v11)
  {
    unsigned int v13 = [(ODMSiriSchemaODMSiriTaskCountsReported *)self taskType] - 1;
    if (v13 > 3) {
      v14 = @"ODMSIRITASKTYPE_UNKNOWN";
    }
    else {
      v14 = off_1E5EBB308[v13];
    }
    [v3 setObject:v14 forKeyedSubscript:@"taskType"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ODMSiriSchemaODMSiriAggregationDimensions *)self->_dimensions hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_taskType;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_completedSiriTaskCount;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
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
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_failedSiriTaskCount;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_9:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v7 = 2654435761 * self->_cancelledSiriTaskCount;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v8 = 2654435761 * self->_completedUITaskCount;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  uint64_t v5 = [(ODMSiriSchemaODMSiriTaskCountsReported *)self dimensions];
  uint64_t v6 = [v4 dimensions];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_28;
  }
  uint64_t v8 = [(ODMSiriSchemaODMSiriTaskCountsReported *)self dimensions];
  if (v8)
  {
    objc_super v9 = (void *)v8;
    v10 = [(ODMSiriSchemaODMSiriTaskCountsReported *)self dimensions];
    char v11 = [v4 dimensions];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  $B3B962E6FB435CC010E16CF148D05632 has = self->_has;
  unsigned int v14 = v4[36];
  if ((*(unsigned char *)&has & 1) != (v14 & 1))
  {
LABEL_28:
    BOOL v24 = 0;
    goto LABEL_29;
  }
  if (*(unsigned char *)&has)
  {
    int taskType = self->_taskType;
    if (taskType != [v4 taskType]) {
      goto LABEL_28;
    }
    $B3B962E6FB435CC010E16CF148D05632 has = self->_has;
    unsigned int v14 = v4[36];
  }
  int v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1)) {
    goto LABEL_28;
  }
  if (v16)
  {
    unsigned int completedSiriTaskCount = self->_completedSiriTaskCount;
    if (completedSiriTaskCount != [v4 completedSiriTaskCount]) {
      goto LABEL_28;
    }
    $B3B962E6FB435CC010E16CF148D05632 has = self->_has;
    unsigned int v14 = v4[36];
  }
  int v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1)) {
    goto LABEL_28;
  }
  if (v18)
  {
    unsigned int failedSiriTaskCount = self->_failedSiriTaskCount;
    if (failedSiriTaskCount != [v4 failedSiriTaskCount]) {
      goto LABEL_28;
    }
    $B3B962E6FB435CC010E16CF148D05632 has = self->_has;
    unsigned int v14 = v4[36];
  }
  int v20 = (*(unsigned int *)&has >> 3) & 1;
  if (v20 != ((v14 >> 3) & 1)) {
    goto LABEL_28;
  }
  if (v20)
  {
    unsigned int cancelledSiriTaskCount = self->_cancelledSiriTaskCount;
    if (cancelledSiriTaskCount == [v4 cancelledSiriTaskCount])
    {
      $B3B962E6FB435CC010E16CF148D05632 has = self->_has;
      unsigned int v14 = v4[36];
      goto LABEL_24;
    }
    goto LABEL_28;
  }
LABEL_24:
  int v22 = (*(unsigned int *)&has >> 4) & 1;
  if (v22 != ((v14 >> 4) & 1)) {
    goto LABEL_28;
  }
  if (v22)
  {
    unsigned int completedUITaskCount = self->_completedUITaskCount;
    if (completedUITaskCount != [v4 completedUITaskCount]) {
      goto LABEL_28;
    }
  }
  BOOL v24 = 1;
LABEL_29:

  return v24;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(ODMSiriSchemaODMSiriTaskCountsReported *)self dimensions];

  if (v4)
  {
    uint64_t v5 = [(ODMSiriSchemaODMSiriTaskCountsReported *)self dimensions];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  uint64_t v7 = v8;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v7 = v8;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  uint64_t v7 = v8;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  uint64_t v7 = v8;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_9:
    PBDataWriterWriteUint32Field();
    uint64_t v7 = v8;
  }
LABEL_10:
}

- (BOOL)readFrom:(id)a3
{
  return ODMSiriSchemaODMSiriTaskCountsReportedReadFrom(self, (uint64_t)a3);
}

- (void)deleteCompletedUITaskCount
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasCompletedUITaskCount:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasCompletedUITaskCount
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setCompletedUITaskCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_unsigned int completedUITaskCount = a3;
}

- (void)deleteCancelledSiriTaskCount
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasCancelledSiriTaskCount:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasCancelledSiriTaskCount
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setCancelledSiriTaskCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unsigned int cancelledSiriTaskCount = a3;
}

- (void)deleteFailedSiriTaskCount
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasFailedSiriTaskCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFailedSiriTaskCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setFailedSiriTaskCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int failedSiriTaskCount = a3;
}

- (void)deleteCompletedSiriTaskCount
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasCompletedSiriTaskCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCompletedSiriTaskCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCompletedSiriTaskCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int completedSiriTaskCount = a3;
}

- (void)deleteTaskType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasTaskType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTaskType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTaskType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int taskType = a3;
}

- (void)deleteDimensions
{
}

- (BOOL)hasDimensions
{
  return self->_dimensions != 0;
}

@end