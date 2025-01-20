@interface PNRODSchemaPNRODScheduleDebugSummary
- (BOOL)hasDataSourceIndex;
- (BOOL)hasDelayFromLastBiomeBookmarkInSecond;
- (BOOL)hasEventTimestampInMsSince1970;
- (BOOL)hasFailureReasonIndex;
- (BOOL)hasNumRequestsRead;
- (BOOL)hasNumRequestsWrite;
- (BOOL)hasProcessingTimeInSecond;
- (BOOL)hasProcessingWaitTimeInSecond;
- (BOOL)hasScheduleId;
- (BOOL)hasWorkerIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PNRODSchemaPNRODScheduleDebugSummary)initWithDictionary:(id)a3;
- (PNRODSchemaPNRODScheduleDebugSummary)initWithJSON:(id)a3;
- (SISchemaUUID)scheduleId;
- (double)delayFromLastBiomeBookmarkInSecond;
- (double)processingTimeInSecond;
- (double)processingWaitTimeInSecond;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int64_t)dataSourceIndex;
- (int64_t)failureReasonIndex;
- (int64_t)workerIndex;
- (unint64_t)eventTimestampInMsSince1970;
- (unint64_t)hash;
- (unsigned)numRequestsRead;
- (unsigned)numRequestsWrite;
- (void)deleteDataSourceIndex;
- (void)deleteDelayFromLastBiomeBookmarkInSecond;
- (void)deleteEventTimestampInMsSince1970;
- (void)deleteFailureReasonIndex;
- (void)deleteNumRequestsRead;
- (void)deleteNumRequestsWrite;
- (void)deleteProcessingTimeInSecond;
- (void)deleteProcessingWaitTimeInSecond;
- (void)deleteScheduleId;
- (void)deleteWorkerIndex;
- (void)setDataSourceIndex:(int64_t)a3;
- (void)setDelayFromLastBiomeBookmarkInSecond:(double)a3;
- (void)setEventTimestampInMsSince1970:(unint64_t)a3;
- (void)setFailureReasonIndex:(int64_t)a3;
- (void)setHasDataSourceIndex:(BOOL)a3;
- (void)setHasDelayFromLastBiomeBookmarkInSecond:(BOOL)a3;
- (void)setHasEventTimestampInMsSince1970:(BOOL)a3;
- (void)setHasFailureReasonIndex:(BOOL)a3;
- (void)setHasNumRequestsRead:(BOOL)a3;
- (void)setHasNumRequestsWrite:(BOOL)a3;
- (void)setHasProcessingTimeInSecond:(BOOL)a3;
- (void)setHasProcessingWaitTimeInSecond:(BOOL)a3;
- (void)setHasScheduleId:(BOOL)a3;
- (void)setHasWorkerIndex:(BOOL)a3;
- (void)setNumRequestsRead:(unsigned int)a3;
- (void)setNumRequestsWrite:(unsigned int)a3;
- (void)setProcessingTimeInSecond:(double)a3;
- (void)setProcessingWaitTimeInSecond:(double)a3;
- (void)setScheduleId:(id)a3;
- (void)setWorkerIndex:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation PNRODSchemaPNRODScheduleDebugSummary

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PNRODSchemaPNRODScheduleDebugSummary;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(PNRODSchemaPNRODScheduleDebugSummary *)self scheduleId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(PNRODSchemaPNRODScheduleDebugSummary *)self deleteScheduleId];
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

- (void)setHasScheduleId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (int64_t)workerIndex
{
  return self->_workerIndex;
}

- (int64_t)dataSourceIndex
{
  return self->_dataSourceIndex;
}

- (int64_t)failureReasonIndex
{
  return self->_failureReasonIndex;
}

- (double)delayFromLastBiomeBookmarkInSecond
{
  return self->_delayFromLastBiomeBookmarkInSecond;
}

- (unint64_t)eventTimestampInMsSince1970
{
  return self->_eventTimestampInMsSince1970;
}

- (double)processingTimeInSecond
{
  return self->_processingTimeInSecond;
}

- (double)processingWaitTimeInSecond
{
  return self->_processingWaitTimeInSecond;
}

- (unsigned)numRequestsWrite
{
  return self->_numRequestsWrite;
}

- (unsigned)numRequestsRead
{
  return self->_numRequestsRead;
}

- (void)setScheduleId:(id)a3
{
}

- (SISchemaUUID)scheduleId
{
  return self->_scheduleId;
}

- (PNRODSchemaPNRODScheduleDebugSummary)initWithDictionary:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PNRODSchemaPNRODScheduleDebugSummary;
  v5 = [(PNRODSchemaPNRODScheduleDebugSummary *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"scheduleId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(PNRODSchemaPNRODScheduleDebugSummary *)v5 setScheduleId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"numRequestsRead"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRODSchemaPNRODScheduleDebugSummary setNumRequestsRead:](v5, "setNumRequestsRead:", [v8 unsignedIntValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"numRequestsWrite"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRODSchemaPNRODScheduleDebugSummary setNumRequestsWrite:](v5, "setNumRequestsWrite:", [v9 unsignedIntValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"processingWaitTimeInSecond"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v10 doubleValue];
      -[PNRODSchemaPNRODScheduleDebugSummary setProcessingWaitTimeInSecond:](v5, "setProcessingWaitTimeInSecond:");
    }
    v20 = v10;
    v11 = [v4 objectForKeyedSubscript:@"processingTimeInSecond"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v11 doubleValue];
      -[PNRODSchemaPNRODScheduleDebugSummary setProcessingTimeInSecond:](v5, "setProcessingTimeInSecond:");
    }
    v12 = [v4 objectForKeyedSubscript:@"eventTimestampInMsSince1970"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRODSchemaPNRODScheduleDebugSummary setEventTimestampInMsSince1970:](v5, "setEventTimestampInMsSince1970:", [v12 unsignedLongLongValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"delayFromLastBiomeBookmarkInSecond"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v13 doubleValue];
      -[PNRODSchemaPNRODScheduleDebugSummary setDelayFromLastBiomeBookmarkInSecond:](v5, "setDelayFromLastBiomeBookmarkInSecond:");
    }
    v21 = v9;
    v22 = v8;
    v14 = [v4 objectForKeyedSubscript:@"failureReasonIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRODSchemaPNRODScheduleDebugSummary setFailureReasonIndex:](v5, "setFailureReasonIndex:", [v14 longLongValue]);
    }
    v15 = (void *)v6;
    v16 = [v4 objectForKeyedSubscript:@"dataSourceIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRODSchemaPNRODScheduleDebugSummary setDataSourceIndex:](v5, "setDataSourceIndex:", [v16 longLongValue]);
    }
    v17 = [v4 objectForKeyedSubscript:@"workerIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRODSchemaPNRODScheduleDebugSummary setWorkerIndex:](v5, "setWorkerIndex:", [v17 longLongValue]);
    }
    v18 = v5;
  }
  return v5;
}

- (PNRODSchemaPNRODScheduleDebugSummary)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PNRODSchemaPNRODScheduleDebugSummary *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PNRODSchemaPNRODScheduleDebugSummary *)self dictionaryRepresentation];
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
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    objc_super v9 = objc_msgSend(NSNumber, "numberWithLongLong:", -[PNRODSchemaPNRODScheduleDebugSummary dataSourceIndex](self, "dataSourceIndex"));
    [v3 setObject:v9 forKeyedSubscript:@"dataSourceIndex"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  v10 = NSNumber;
  [(PNRODSchemaPNRODScheduleDebugSummary *)self delayFromLastBiomeBookmarkInSecond];
  v11 = objc_msgSend(v10, "numberWithDouble:");
  [v3 setObject:v11 forKeyedSubscript:@"delayFromLastBiomeBookmarkInSecond"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[PNRODSchemaPNRODScheduleDebugSummary eventTimestampInMsSince1970](self, "eventTimestampInMsSince1970"));
  [v3 setObject:v12 forKeyedSubscript:@"eventTimestampInMsSince1970"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  v13 = objc_msgSend(NSNumber, "numberWithLongLong:", -[PNRODSchemaPNRODScheduleDebugSummary failureReasonIndex](self, "failureReasonIndex"));
  [v3 setObject:v13 forKeyedSubscript:@"failureReasonIndex"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PNRODSchemaPNRODScheduleDebugSummary numRequestsRead](self, "numRequestsRead"));
  [v3 setObject:v14 forKeyedSubscript:@"numRequestsRead"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PNRODSchemaPNRODScheduleDebugSummary numRequestsWrite](self, "numRequestsWrite"));
  [v3 setObject:v15 forKeyedSubscript:@"numRequestsWrite"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  v16 = NSNumber;
  [(PNRODSchemaPNRODScheduleDebugSummary *)self processingTimeInSecond];
  v17 = objc_msgSend(v16, "numberWithDouble:");
  [v3 setObject:v17 forKeyedSubscript:@"processingTimeInSecond"];

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_9:
    v5 = NSNumber;
    [(PNRODSchemaPNRODScheduleDebugSummary *)self processingWaitTimeInSecond];
    uint64_t v6 = objc_msgSend(v5, "numberWithDouble:");
    [v3 setObject:v6 forKeyedSubscript:@"processingWaitTimeInSecond"];
  }
LABEL_10:
  if (self->_scheduleId)
  {
    uint64_t v7 = [(PNRODSchemaPNRODScheduleDebugSummary *)self scheduleId];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"scheduleId"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"scheduleId"];
    }
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    v19 = objc_msgSend(NSNumber, "numberWithLongLong:", -[PNRODSchemaPNRODScheduleDebugSummary workerIndex](self, "workerIndex"));
    [v3 setObject:v19 forKeyedSubscript:@"workerIndex"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_scheduleId hash];
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
    uint64_t v5 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v6 = 0;
    if ((has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v11 = 0;
    goto LABEL_13;
  }
  uint64_t v5 = 2654435761 * self->_numRequestsRead;
  if ((has & 2) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_numRequestsWrite;
  if ((has & 4) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  double processingWaitTimeInSecond = self->_processingWaitTimeInSecond;
  double v8 = -processingWaitTimeInSecond;
  if (processingWaitTimeInSecond >= 0.0) {
    double v8 = self->_processingWaitTimeInSecond;
  }
  long double v9 = floor(v8 + 0.5);
  double v10 = (v8 - v9) * 1.84467441e19;
  unint64_t v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0) {
      v11 += (unint64_t)v10;
    }
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
LABEL_13:
  if ((has & 8) != 0)
  {
    double processingTimeInSecond = self->_processingTimeInSecond;
    double v14 = -processingTimeInSecond;
    if (processingTimeInSecond >= 0.0) {
      double v14 = self->_processingTimeInSecond;
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
  if ((has & 0x10) != 0)
  {
    unint64_t v17 = 2654435761u * self->_eventTimestampInMsSince1970;
    if ((has & 0x20) != 0) {
      goto LABEL_23;
    }
LABEL_28:
    unint64_t v22 = 0;
    goto LABEL_31;
  }
  unint64_t v17 = 0;
  if ((has & 0x20) == 0) {
    goto LABEL_28;
  }
LABEL_23:
  double delayFromLastBiomeBookmarkInSecond = self->_delayFromLastBiomeBookmarkInSecond;
  double v19 = -delayFromLastBiomeBookmarkInSecond;
  if (delayFromLastBiomeBookmarkInSecond >= 0.0) {
    double v19 = self->_delayFromLastBiomeBookmarkInSecond;
  }
  long double v20 = floor(v19 + 0.5);
  double v21 = (v19 - v20) * 1.84467441e19;
  unint64_t v22 = 2654435761u * (unint64_t)fmod(v20, 1.84467441e19);
  if (v21 >= 0.0)
  {
    if (v21 > 0.0) {
      v22 += (unint64_t)v21;
    }
  }
  else
  {
    v22 -= (unint64_t)fabs(v21);
  }
LABEL_31:
  if ((has & 0x40) == 0)
  {
    uint64_t v23 = 0;
    if ((has & 0x80) != 0) {
      goto LABEL_33;
    }
LABEL_36:
    uint64_t v24 = 0;
    if ((has & 0x100) != 0) {
      goto LABEL_34;
    }
LABEL_37:
    uint64_t v25 = 0;
    return v5 ^ v3 ^ v6 ^ v11 ^ v12 ^ v17 ^ v22 ^ v23 ^ v24 ^ v25;
  }
  uint64_t v23 = 2654435761 * self->_failureReasonIndex;
  if ((has & 0x80) == 0) {
    goto LABEL_36;
  }
LABEL_33:
  uint64_t v24 = 2654435761 * self->_dataSourceIndex;
  if ((has & 0x100) == 0) {
    goto LABEL_37;
  }
LABEL_34:
  uint64_t v25 = 2654435761 * self->_workerIndex;
  return v5 ^ v3 ^ v6 ^ v11 ^ v12 ^ v17 ^ v22 ^ v23 ^ v24 ^ v25;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_44;
  }
  uint64_t v5 = [(PNRODSchemaPNRODScheduleDebugSummary *)self scheduleId];
  uint64_t v6 = [v4 scheduleId];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_44;
  }
  uint64_t v8 = [(PNRODSchemaPNRODScheduleDebugSummary *)self scheduleId];
  if (v8)
  {
    long double v9 = (void *)v8;
    double v10 = [(PNRODSchemaPNRODScheduleDebugSummary *)self scheduleId];
    unint64_t v11 = [v4 scheduleId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_44;
    }
  }
  else
  {
  }
  $C70DB8B6050B4D66C5B627C76CB662EB has = self->_has;
  unsigned int v14 = v4[40];
  if ((*(unsigned char *)&has & 1) != (v14 & 1))
  {
LABEL_44:
    BOOL v35 = 0;
    goto LABEL_45;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int numRequestsRead = self->_numRequestsRead;
    if (numRequestsRead != [v4 numRequestsRead]) {
      goto LABEL_44;
    }
    $C70DB8B6050B4D66C5B627C76CB662EB has = self->_has;
    unsigned int v14 = v4[40];
  }
  int v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1)) {
    goto LABEL_44;
  }
  if (v16)
  {
    unsigned int numRequestsWrite = self->_numRequestsWrite;
    if (numRequestsWrite != [v4 numRequestsWrite]) {
      goto LABEL_44;
    }
    $C70DB8B6050B4D66C5B627C76CB662EB has = self->_has;
    unsigned int v14 = v4[40];
  }
  int v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1)) {
    goto LABEL_44;
  }
  if (v18)
  {
    double processingWaitTimeInSecond = self->_processingWaitTimeInSecond;
    [v4 processingWaitTimeInSecond];
    if (processingWaitTimeInSecond != v20) {
      goto LABEL_44;
    }
    $C70DB8B6050B4D66C5B627C76CB662EB has = self->_has;
    unsigned int v14 = v4[40];
  }
  int v21 = (*(unsigned int *)&has >> 3) & 1;
  if (v21 != ((v14 >> 3) & 1)) {
    goto LABEL_44;
  }
  if (v21)
  {
    double processingTimeInSecond = self->_processingTimeInSecond;
    [v4 processingTimeInSecond];
    if (processingTimeInSecond != v23) {
      goto LABEL_44;
    }
    $C70DB8B6050B4D66C5B627C76CB662EB has = self->_has;
    unsigned int v14 = v4[40];
  }
  int v24 = (*(unsigned int *)&has >> 4) & 1;
  if (v24 != ((v14 >> 4) & 1)) {
    goto LABEL_44;
  }
  if (v24)
  {
    unint64_t eventTimestampInMsSince1970 = self->_eventTimestampInMsSince1970;
    if (eventTimestampInMsSince1970 != [v4 eventTimestampInMsSince1970]) {
      goto LABEL_44;
    }
    $C70DB8B6050B4D66C5B627C76CB662EB has = self->_has;
    unsigned int v14 = v4[40];
  }
  int v26 = (*(unsigned int *)&has >> 5) & 1;
  if (v26 != ((v14 >> 5) & 1)) {
    goto LABEL_44;
  }
  if (v26)
  {
    double delayFromLastBiomeBookmarkInSecond = self->_delayFromLastBiomeBookmarkInSecond;
    [v4 delayFromLastBiomeBookmarkInSecond];
    if (delayFromLastBiomeBookmarkInSecond != v28) {
      goto LABEL_44;
    }
    $C70DB8B6050B4D66C5B627C76CB662EB has = self->_has;
    unsigned int v14 = v4[40];
  }
  int v29 = (*(unsigned int *)&has >> 6) & 1;
  if (v29 != ((v14 >> 6) & 1)) {
    goto LABEL_44;
  }
  if (v29)
  {
    int64_t failureReasonIndex = self->_failureReasonIndex;
    if (failureReasonIndex != [v4 failureReasonIndex]) {
      goto LABEL_44;
    }
    $C70DB8B6050B4D66C5B627C76CB662EB has = self->_has;
    unsigned int v14 = v4[40];
  }
  int v31 = (*(unsigned int *)&has >> 7) & 1;
  if (v31 != ((v14 >> 7) & 1)) {
    goto LABEL_44;
  }
  if (v31)
  {
    int64_t dataSourceIndex = self->_dataSourceIndex;
    if (dataSourceIndex == [v4 dataSourceIndex])
    {
      $C70DB8B6050B4D66C5B627C76CB662EB has = self->_has;
      unsigned int v14 = v4[40];
      goto LABEL_40;
    }
    goto LABEL_44;
  }
LABEL_40:
  int v33 = (*(unsigned int *)&has >> 8) & 1;
  if (v33 != ((v14 >> 8) & 1)) {
    goto LABEL_44;
  }
  if (v33)
  {
    int64_t workerIndex = self->_workerIndex;
    if (workerIndex != [v4 workerIndex]) {
      goto LABEL_44;
    }
  }
  BOOL v35 = 1;
LABEL_45:

  return v35;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(PNRODSchemaPNRODScheduleDebugSummary *)self scheduleId];

  if (v4)
  {
    uint64_t v5 = [(PNRODSchemaPNRODScheduleDebugSummary *)self scheduleId];
    PBDataWriterWriteSubmessage();
  }
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
  }
  uint64_t v7 = v8;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v7 = v8;
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_19;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteDoubleField();
  uint64_t v7 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint64Field();
  uint64_t v7 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteInt64Field();
  uint64_t v7 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_23:
  PBDataWriterWriteInt64Field();
  uint64_t v7 = v8;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_13:
    PBDataWriterWriteInt64Field();
    uint64_t v7 = v8;
  }
LABEL_14:
}

- (BOOL)readFrom:(id)a3
{
  return PNRODSchemaPNRODScheduleDebugSummaryReadFrom(self, (uint64_t)a3);
}

- (void)deleteWorkerIndex
{
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setHasWorkerIndex:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasWorkerIndex
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setWorkerIndex:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_int64_t workerIndex = a3;
}

- (void)deleteDataSourceIndex
{
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setHasDataSourceIndex:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasDataSourceIndex
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setDataSourceIndex:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_int64_t dataSourceIndex = a3;
}

- (void)deleteFailureReasonIndex
{
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setHasFailureReasonIndex:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasFailureReasonIndex
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setFailureReasonIndex:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_int64_t failureReasonIndex = a3;
}

- (void)deleteDelayFromLastBiomeBookmarkInSecond
{
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setHasDelayFromLastBiomeBookmarkInSecond:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasDelayFromLastBiomeBookmarkInSecond
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setDelayFromLastBiomeBookmarkInSecond:(double)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_double delayFromLastBiomeBookmarkInSecond = a3;
}

- (void)deleteEventTimestampInMsSince1970
{
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setHasEventTimestampInMsSince1970:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasEventTimestampInMsSince1970
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setEventTimestampInMsSince1970:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_unint64_t eventTimestampInMsSince1970 = a3;
}

- (void)deleteProcessingTimeInSecond
{
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setHasProcessingTimeInSecond:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasProcessingTimeInSecond
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setProcessingTimeInSecond:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_double processingTimeInSecond = a3;
}

- (void)deleteProcessingWaitTimeInSecond
{
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setHasProcessingWaitTimeInSecond:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasProcessingWaitTimeInSecond
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setProcessingWaitTimeInSecond:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_double processingWaitTimeInSecond = a3;
}

- (void)deleteNumRequestsWrite
{
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setHasNumRequestsWrite:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasNumRequestsWrite
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setNumRequestsWrite:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_unsigned int numRequestsWrite = a3;
}

- (void)deleteNumRequestsRead
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasNumRequestsRead:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasNumRequestsRead
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setNumRequestsRead:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_unsigned int numRequestsRead = a3;
}

- (void)deleteScheduleId
{
}

- (BOOL)hasScheduleId
{
  return self->_scheduleId != 0;
}

@end