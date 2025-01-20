@interface AWDCFNetworkTaskMetrics
+ (Class)transactionMetricsType;
- (BOOL)hasActivityUUID;
- (BOOL)hasDidCompleteWithError;
- (BOOL)hasError;
- (BOOL)hasIsBackground;
- (BOOL)hasNumberOfRedirects;
- (BOOL)hasNumberOfRetries;
- (BOOL)hasSchedulingTier;
- (BOOL)hasTaskResume;
- (BOOL)hasTaskType;
- (BOOL)hasTimestamp;
- (BOOL)hasUnderlyingError;
- (BOOL)hasUnderlyingErrorDomain;
- (BOOL)hasUnused;
- (BOOL)isBackground;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)unused;
- (NSMutableArray)transactionMetrics;
- (NSString)activityUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)schedulingTierAsString:(int)a3;
- (id)taskTypeAsString:(int)a3;
- (id)transactionMetricsAtIndex:(unint64_t)a3;
- (int)StringAsSchedulingTier:(id)a3;
- (int)StringAsTaskType:(id)a3;
- (int)schedulingTier;
- (int)taskType;
- (int64_t)error;
- (int64_t)underlyingError;
- (int64_t)underlyingErrorDomain;
- (unint64_t)didCompleteWithError;
- (unint64_t)hash;
- (unint64_t)numberOfRedirects;
- (unint64_t)numberOfRetries;
- (unint64_t)taskResume;
- (unint64_t)timestamp;
- (unint64_t)transactionMetricsCount;
- (void)addTransactionMetrics:(id)a3;
- (void)clearTransactionMetrics;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setActivityUUID:(id)a3;
- (void)setDidCompleteWithError:(unint64_t)a3;
- (void)setError:(int64_t)a3;
- (void)setHasDidCompleteWithError:(BOOL)a3;
- (void)setHasError:(BOOL)a3;
- (void)setHasIsBackground:(BOOL)a3;
- (void)setHasNumberOfRedirects:(BOOL)a3;
- (void)setHasNumberOfRetries:(BOOL)a3;
- (void)setHasSchedulingTier:(BOOL)a3;
- (void)setHasTaskResume:(BOOL)a3;
- (void)setHasTaskType:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasUnderlyingError:(BOOL)a3;
- (void)setHasUnderlyingErrorDomain:(BOOL)a3;
- (void)setHasUnused:(BOOL)a3;
- (void)setIsBackground:(BOOL)a3;
- (void)setNumberOfRedirects:(unint64_t)a3;
- (void)setNumberOfRetries:(unint64_t)a3;
- (void)setSchedulingTier:(int)a3;
- (void)setTaskResume:(unint64_t)a3;
- (void)setTaskType:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTransactionMetrics:(id)a3;
- (void)setUnderlyingError:(int64_t)a3;
- (void)setUnderlyingErrorDomain:(int64_t)a3;
- (void)setUnused:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCFNetworkTaskMetrics

- (void)dealloc
{
  [(AWDCFNetworkTaskMetrics *)self setActivityUUID:0];
  [(AWDCFNetworkTaskMetrics *)self setTransactionMetrics:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDCFNetworkTaskMetrics;
  [(AWDCFNetworkTaskMetrics *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (BOOL)hasActivityUUID
{
  return self->_activityUUID != 0;
}

- (void)setTaskResume:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_taskResume = a3;
}

- (void)setHasTaskResume:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasTaskResume
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setDidCompleteWithError:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_didCompleteWithError = a3;
}

- (void)setHasDidCompleteWithError:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasDidCompleteWithError
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setNumberOfRetries:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_numberOfRetries = a3;
}

- (void)setHasNumberOfRetries:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasNumberOfRetries
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setNumberOfRedirects:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_numberOfRedirects = a3;
}

- (void)setHasNumberOfRedirects:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasNumberOfRedirects
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setError:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_error = a3;
}

- (void)setHasError:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasError
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setUnderlyingError:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_underlyingError = a3;
}

- (void)setHasUnderlyingError:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasUnderlyingError
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setUnderlyingErrorDomain:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_underlyingErrorDomain = a3;
}

- (void)setHasUnderlyingErrorDomain:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasUnderlyingErrorDomain
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (int)taskType
{
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
    return self->_taskType;
  }
  else {
    return 1;
  }
}

- (void)setTaskType:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_taskType = a3;
}

- (void)setHasTaskType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasTaskType
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (id)taskTypeAsString:(int)a3
{
  if ((a3 - 1) >= 5) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B9518[a3 - 1];
  }
}

- (int)StringAsTaskType:(id)a3
{
  if ([a3 isEqualToString:@"UNKNOWN_TASK_TYPE"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"DATA_TASK"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"UPLOAD_TASK"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"DOWNLOAD_TASK"]) {
    return 4;
  }
  if ([a3 isEqualToString:@"STREAM_TASK"]) {
    return 5;
  }
  return 1;
}

- (void)setIsBackground:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_isBackground = a3;
}

- (void)setHasIsBackground:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasIsBackground
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)clearTransactionMetrics
{
}

- (void)addTransactionMetrics:(id)a3
{
  transactionMetrics = self->_transactionMetrics;
  if (!transactionMetrics)
  {
    transactionMetrics = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_transactionMetrics = transactionMetrics;
  }

  [(NSMutableArray *)transactionMetrics addObject:a3];
}

- (unint64_t)transactionMetricsCount
{
  return [(NSMutableArray *)self->_transactionMetrics count];
}

- (id)transactionMetricsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_transactionMetrics objectAtIndex:a3];
}

+ (Class)transactionMetricsType
{
  return (Class)objc_opt_class();
}

- (int)schedulingTier
{
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    return self->_schedulingTier;
  }
  else {
    return 1;
  }
}

- (void)setSchedulingTier:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_schedulingTier = a3;
}

- (void)setHasSchedulingTier:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSchedulingTier
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)schedulingTierAsString:(int)a3
{
  if ((a3 - 1) >= 5) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B9540[a3 - 1];
  }
}

- (int)StringAsSchedulingTier:(id)a3
{
  if ([a3 isEqualToString:@"DEFAULT"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"DISCRETIONARY"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"INFERS_DISCRETIONARY"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"USER_INITIATED"]) {
    return 4;
  }
  if ([a3 isEqualToString:@"BACKGROUND_PLUS"]) {
    return 5;
  }
  return 1;
}

- (void)setUnused:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_unused = a3;
}

- (void)setHasUnused:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasUnused
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCFNetworkTaskMetrics;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCFNetworkTaskMetrics description](&v3, sel_description), -[AWDCFNetworkTaskMetrics dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  activityUUID = self->_activityUUID;
  if (activityUUID) {
    [v3 setObject:activityUUID forKey:@"activityUUID"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_taskResume] forKey:@"taskResume"];
    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_29;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_7;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_didCompleteWithError] forKey:@"didCompleteWithError"];
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_30;
  }
LABEL_29:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_numberOfRetries] forKey:@"numberOfRetries"];
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_31;
  }
LABEL_30:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_numberOfRedirects] forKey:@"numberOfRedirects"];
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_32;
  }
LABEL_31:
  [v3 setObject:[NSNumber numberWithLongLong:self->_error] forKey:@"error"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_33;
  }
LABEL_32:
  [v3 setObject:[NSNumber numberWithLongLong:self->_underlyingError] forKey:@"underlyingError"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_34;
  }
LABEL_33:
  [v3 setObject:[NSNumber numberWithLongLong:self->_underlyingErrorDomain] forKey:@"underlyingErrorDomain"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_13:
    if ((has & 0x400) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_34:
  unsigned int v15 = self->_taskType - 1;
  if (v15 >= 5) {
    v16 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_taskType];
  }
  else {
    v16 = off_2641B9518[v15];
  }
  [v3 setObject:v16 forKey:@"taskType"];
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
LABEL_14:
  }
    [v3 setObject:[NSNumber numberWithBool:self->_isBackground] forKey:@"isBackground"];
LABEL_15:
  if ([(NSMutableArray *)self->_transactionMetrics count])
  {
    v6 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_transactionMetrics, "count")];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    transactionMetrics = self->_transactionMetrics;
    uint64_t v8 = [(NSMutableArray *)transactionMetrics countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(transactionMetrics);
          }
          [v6 addObject:[*(id *)(*((void *)&v18 + 1) + 8 * i) dictionaryRepresentation]];
        }
        uint64_t v9 = [(NSMutableArray *)transactionMetrics countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }
    [v3 setObject:v6 forKey:@"transactionMetrics"];
  }
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x100) != 0)
  {
    unsigned int v13 = self->_schedulingTier - 1;
    if (v13 >= 5) {
      v14 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_schedulingTier];
    }
    else {
      v14 = off_2641B9540[v13];
    }
    [v3 setObject:v14 forKey:@"schedulingTier"];
    __int16 v12 = (__int16)self->_has;
  }
  if ((v12 & 0x800) != 0) {
    [v3 setObject:[NSNumber numberWithBool:self->_unused] forKey:@"unused"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCFNetworkTaskMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_activityUUID) {
    PBDataWriterWriteStringField();
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_29;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteInt64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteInt64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteInt64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_13:
    if ((has & 0x400) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_34:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
LABEL_14:
  }
    PBDataWriterWriteBOOLField();
LABEL_15:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  transactionMetrics = self->_transactionMetrics;
  uint64_t v6 = [(NSMutableArray *)transactionMetrics countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(transactionMetrics);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)transactionMetrics countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x100) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v10 = (__int16)self->_has;
  }
  if ((v10 & 0x800) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *((void *)a3 + 6) = self->_timestamp;
    *((_WORD *)a3 + 50) |= 0x20u;
  }
  if (self->_activityUUID) {
    [a3 setActivityUUID:];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *((void *)a3 + 5) = self->_taskResume;
    *((_WORD *)a3 + 50) |= 0x10u;
    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_26;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_7;
  }
  *((void *)a3 + 1) = self->_didCompleteWithError;
  *((_WORD *)a3 + 50) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((void *)a3 + 4) = self->_numberOfRetries;
  *((_WORD *)a3 + 50) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((void *)a3 + 3) = self->_numberOfRedirects;
  *((_WORD *)a3 + 50) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((void *)a3 + 2) = self->_error;
  *((_WORD *)a3 + 50) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((void *)a3 + 7) = self->_underlyingError;
  *((_WORD *)a3 + 50) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0) {
      goto LABEL_13;
    }
LABEL_31:
    *((_DWORD *)a3 + 21) = self->_taskType;
    *((_WORD *)a3 + 50) |= 0x200u;
    if ((*(_WORD *)&self->_has & 0x400) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_30:
  *((void *)a3 + 8) = self->_underlyingErrorDomain;
  *((_WORD *)a3 + 50) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0) {
    goto LABEL_31;
  }
LABEL_13:
  if ((has & 0x400) != 0)
  {
LABEL_14:
    *((unsigned char *)a3 + 96) = self->_isBackground;
    *((_WORD *)a3 + 50) |= 0x400u;
  }
LABEL_15:
  if ([(AWDCFNetworkTaskMetrics *)self transactionMetricsCount])
  {
    [a3 clearTransactionMetrics];
    unint64_t v6 = [(AWDCFNetworkTaskMetrics *)self transactionMetricsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addTransactionMetrics:-[AWDCFNetworkTaskMetrics transactionMetricsAtIndex:](self, "transactionMetricsAtIndex:", i)];
    }
  }
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x100) != 0)
  {
    *((_DWORD *)a3 + 20) = self->_schedulingTier;
    *((_WORD *)a3 + 50) |= 0x100u;
    __int16 v9 = (__int16)self->_has;
  }
  if ((v9 & 0x800) != 0)
  {
    *((unsigned char *)a3 + 97) = self->_unused;
    *((_WORD *)a3 + 50) |= 0x800u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *(void *)(v5 + 48) = self->_timestamp;
    *(_WORD *)(v5 + 100) |= 0x20u;
  }

  *(void *)(v6 + 72) = [(NSString *)self->_activityUUID copyWithZone:a3];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *(void *)(v6 + 40) = self->_taskResume;
    *(_WORD *)(v6 + 100) |= 0x10u;
    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_27;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_5;
  }
  *(void *)(v6 + 8) = self->_didCompleteWithError;
  *(_WORD *)(v6 + 100) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_28;
  }
LABEL_27:
  *(void *)(v6 + 32) = self->_numberOfRetries;
  *(_WORD *)(v6 + 100) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_29;
  }
LABEL_28:
  *(void *)(v6 + 24) = self->_numberOfRedirects;
  *(_WORD *)(v6 + 100) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_30;
  }
LABEL_29:
  *(void *)(v6 + 16) = self->_error;
  *(_WORD *)(v6 + 100) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_31;
  }
LABEL_30:
  *(void *)(v6 + 56) = self->_underlyingError;
  *(_WORD *)(v6 + 100) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_32;
  }
LABEL_31:
  *(void *)(v6 + 64) = self->_underlyingErrorDomain;
  *(_WORD *)(v6 + 100) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_32:
  *(_DWORD *)(v6 + 84) = self->_taskType;
  *(_WORD *)(v6 + 100) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_12:
    *(unsigned char *)(v6 + 96) = self->_isBackground;
    *(_WORD *)(v6 + 100) |= 0x400u;
  }
LABEL_13:
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  transactionMetrics = self->_transactionMetrics;
  uint64_t v9 = [(NSMutableArray *)transactionMetrics countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(transactionMetrics);
        }
        long long v13 = (void *)[*(id *)(*((void *)&v16 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addTransactionMetrics:v13];
      }
      uint64_t v10 = [(NSMutableArray *)transactionMetrics countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x100) != 0)
  {
    *(_DWORD *)(v6 + 80) = self->_schedulingTier;
    *(_WORD *)(v6 + 100) |= 0x100u;
    __int16 v14 = (__int16)self->_has;
  }
  if ((v14 & 0x800) != 0)
  {
    *(unsigned char *)(v6 + 97) = self->_unused;
    *(_WORD *)(v6 + 100) |= 0x800u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)a3 + 50);
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_timestamp != *((void *)a3 + 6)) {
      goto LABEL_68;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_68;
  }
  activityUUID = self->_activityUUID;
  if ((unint64_t)activityUUID | *((void *)a3 + 9))
  {
    int v5 = -[NSString isEqual:](activityUUID, "isEqual:");
    if (!v5) {
      return v5;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v9 = *((_WORD *)a3 + 50);
  if ((has & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_taskResume != *((void *)a3 + 5)) {
      goto LABEL_68;
    }
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_68;
  }
  if (has)
  {
    if ((v9 & 1) == 0 || self->_didCompleteWithError != *((void *)a3 + 1)) {
      goto LABEL_68;
    }
  }
  else if (v9)
  {
    goto LABEL_68;
  }
  if ((has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_numberOfRetries != *((void *)a3 + 4)) {
      goto LABEL_68;
    }
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_68;
  }
  if ((has & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_numberOfRedirects != *((void *)a3 + 3)) {
      goto LABEL_68;
    }
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_68;
  }
  if ((has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_error != *((void *)a3 + 2)) {
      goto LABEL_68;
    }
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_68;
  }
  if ((has & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_underlyingError != *((void *)a3 + 7)) {
      goto LABEL_68;
    }
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_68;
  }
  if ((has & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0 || self->_underlyingErrorDomain != *((void *)a3 + 8)) {
      goto LABEL_68;
    }
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_68;
  }
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)a3 + 50) & 0x200) == 0 || self->_taskType != *((_DWORD *)a3 + 21)) {
      goto LABEL_68;
    }
  }
  else if ((*((_WORD *)a3 + 50) & 0x200) != 0)
  {
    goto LABEL_68;
  }
  if ((has & 0x400) == 0)
  {
    if ((*((_WORD *)a3 + 50) & 0x400) != 0) {
      goto LABEL_68;
    }
    goto LABEL_58;
  }
  if ((*((_WORD *)a3 + 50) & 0x400) == 0) {
    goto LABEL_68;
  }
  if (self->_isBackground)
  {
    if (!*((unsigned char *)a3 + 96)) {
      goto LABEL_68;
    }
    goto LABEL_58;
  }
  if (*((unsigned char *)a3 + 96))
  {
LABEL_68:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_58:
  transactionMetrics = self->_transactionMetrics;
  if ((unint64_t)transactionMetrics | *((void *)a3 + 11))
  {
    int v5 = -[NSMutableArray isEqual:](transactionMetrics, "isEqual:");
    if (!v5) {
      return v5;
    }
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)a3 + 50) & 0x100) == 0 || self->_schedulingTier != *((_DWORD *)a3 + 20)) {
      goto LABEL_68;
    }
  }
  else if ((*((_WORD *)a3 + 50) & 0x100) != 0)
  {
    goto LABEL_68;
  }
  LOBYTE(v5) = (*((_WORD *)a3 + 50) & 0x800) == 0;
  if ((has & 0x800) != 0)
  {
    if ((*((_WORD *)a3 + 50) & 0x800) == 0) {
      goto LABEL_68;
    }
    if (self->_unused)
    {
      if (!*((unsigned char *)a3 + 97)) {
        goto LABEL_68;
      }
    }
    else if (*((unsigned char *)a3 + 97))
    {
      goto LABEL_68;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    unint64_t v19 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v19 = 0;
  }
  NSUInteger v18 = [(NSString *)self->_activityUUID hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    unint64_t v17 = 2654435761u * self->_taskResume;
    if (has)
    {
LABEL_6:
      unint64_t v15 = 2654435761u * self->_didCompleteWithError;
      if ((has & 8) != 0) {
        goto LABEL_7;
      }
      goto LABEL_16;
    }
  }
  else
  {
    unint64_t v17 = 0;
    if (has) {
      goto LABEL_6;
    }
  }
  unint64_t v15 = 0;
  if ((has & 8) != 0)
  {
LABEL_7:
    unint64_t v4 = 2654435761u * self->_numberOfRetries;
    if ((has & 4) != 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  unint64_t v4 = 0;
  if ((has & 4) != 0)
  {
LABEL_8:
    unint64_t v5 = 2654435761u * self->_numberOfRedirects;
    if ((has & 2) != 0) {
      goto LABEL_9;
    }
    goto LABEL_18;
  }
LABEL_17:
  unint64_t v5 = 0;
  if ((has & 2) != 0)
  {
LABEL_9:
    uint64_t v6 = 2654435761 * self->_error;
    if ((has & 0x40) != 0) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v6 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_10:
    uint64_t v7 = 2654435761 * self->_underlyingError;
    if ((has & 0x80) != 0) {
      goto LABEL_11;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v7 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_11:
    uint64_t v8 = 2654435761 * self->_underlyingErrorDomain;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_12;
    }
LABEL_21:
    uint64_t v9 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_13;
    }
    goto LABEL_22;
  }
LABEL_20:
  uint64_t v8 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_21;
  }
LABEL_12:
  uint64_t v9 = 2654435761 * self->_taskType;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_13:
    uint64_t v10 = 2654435761 * self->_isBackground;
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v10 = 0;
LABEL_23:
  uint64_t v11 = [(NSMutableArray *)self->_transactionMetrics hash];
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    uint64_t v12 = 2654435761 * self->_schedulingTier;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_25;
    }
LABEL_27:
    uint64_t v13 = 0;
    return v18 ^ v19 ^ v17 ^ v16 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  }
  uint64_t v12 = 0;
  if ((*(_WORD *)&self->_has & 0x800) == 0) {
    goto LABEL_27;
  }
LABEL_25:
  uint64_t v13 = 2654435761 * self->_unused;
  return v18 ^ v19 ^ v17 ^ v16 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ((*((_WORD *)a3 + 50) & 0x20) != 0)
  {
    self->_timestamp = *((void *)a3 + 6);
    *(_WORD *)&self->_has |= 0x20u;
  }
  if (*((void *)a3 + 9)) {
    -[AWDCFNetworkTaskMetrics setActivityUUID:](self, "setActivityUUID:");
  }
  __int16 v5 = *((_WORD *)a3 + 50);
  if ((v5 & 0x10) != 0)
  {
    self->_taskResume = *((void *)a3 + 5);
    *(_WORD *)&self->_has |= 0x10u;
    __int16 v5 = *((_WORD *)a3 + 50);
    if ((v5 & 1) == 0)
    {
LABEL_7:
      if ((v5 & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_29;
    }
  }
  else if ((v5 & 1) == 0)
  {
    goto LABEL_7;
  }
  self->_didCompleteWithError = *((void *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v5 = *((_WORD *)a3 + 50);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_numberOfRetries = *((void *)a3 + 4);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)a3 + 50);
  if ((v5 & 4) == 0)
  {
LABEL_9:
    if ((v5 & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_numberOfRedirects = *((void *)a3 + 3);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)a3 + 50);
  if ((v5 & 2) == 0)
  {
LABEL_10:
    if ((v5 & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_error = *((void *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)a3 + 50);
  if ((v5 & 0x40) == 0)
  {
LABEL_11:
    if ((v5 & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_underlyingError = *((void *)a3 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)a3 + 50);
  if ((v5 & 0x80) == 0)
  {
LABEL_12:
    if ((v5 & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_underlyingErrorDomain = *((void *)a3 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)a3 + 50);
  if ((v5 & 0x200) == 0)
  {
LABEL_13:
    if ((v5 & 0x400) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_34:
  self->_taskType = *((_DWORD *)a3 + 21);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)a3 + 50) & 0x400) != 0)
  {
LABEL_14:
    self->_isBackground = *((unsigned char *)a3 + 96);
    *(_WORD *)&self->_has |= 0x400u;
  }
LABEL_15:
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = (void *)*((void *)a3 + 11);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        [(AWDCFNetworkTaskMetrics *)self addTransactionMetrics:*(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
  __int16 v11 = *((_WORD *)a3 + 50);
  if ((v11 & 0x100) != 0)
  {
    self->_schedulingTier = *((_DWORD *)a3 + 20);
    *(_WORD *)&self->_has |= 0x100u;
    __int16 v11 = *((_WORD *)a3 + 50);
  }
  if ((v11 & 0x800) != 0)
  {
    self->_unused = *((unsigned char *)a3 + 97);
    *(_WORD *)&self->_has |= 0x800u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)activityUUID
{
  return self->_activityUUID;
}

- (void)setActivityUUID:(id)a3
{
}

- (unint64_t)taskResume
{
  return self->_taskResume;
}

- (unint64_t)didCompleteWithError
{
  return self->_didCompleteWithError;
}

- (unint64_t)numberOfRetries
{
  return self->_numberOfRetries;
}

- (unint64_t)numberOfRedirects
{
  return self->_numberOfRedirects;
}

- (int64_t)error
{
  return self->_error;
}

- (int64_t)underlyingError
{
  return self->_underlyingError;
}

- (int64_t)underlyingErrorDomain
{
  return self->_underlyingErrorDomain;
}

- (BOOL)isBackground
{
  return self->_isBackground;
}

- (NSMutableArray)transactionMetrics
{
  return self->_transactionMetrics;
}

- (void)setTransactionMetrics:(id)a3
{
}

- (BOOL)unused
{
  return self->_unused;
}

@end