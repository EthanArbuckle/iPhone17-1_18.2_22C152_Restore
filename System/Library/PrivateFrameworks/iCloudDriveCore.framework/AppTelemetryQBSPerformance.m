@interface AppTelemetryQBSPerformance
- (BOOL)hasOperationType;
- (BOOL)hasRecordsFetched;
- (BOOL)hasRecordsFetchedTotalMetadataSize;
- (BOOL)hasTotalTime;
- (BOOL)hasXattrsFetchedTotalSize;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)operationType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)recordsFetched;
- (unint64_t)recordsFetchedTotalMetadataSize;
- (unint64_t)totalTime;
- (unint64_t)xattrsFetchedTotalSize;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasRecordsFetched:(BOOL)a3;
- (void)setHasRecordsFetchedTotalMetadataSize:(BOOL)a3;
- (void)setHasTotalTime:(BOOL)a3;
- (void)setHasXattrsFetchedTotalSize:(BOOL)a3;
- (void)setOperationType:(id)a3;
- (void)setRecordsFetched:(unint64_t)a3;
- (void)setRecordsFetchedTotalMetadataSize:(unint64_t)a3;
- (void)setTotalTime:(unint64_t)a3;
- (void)setXattrsFetchedTotalSize:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AppTelemetryQBSPerformance

- (BOOL)hasOperationType
{
  return self->_operationType != 0;
}

- (void)setTotalTime:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_totalTime = a3;
}

- (void)setHasTotalTime:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTotalTime
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setRecordsFetched:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_recordsFetched = a3;
}

- (void)setHasRecordsFetched:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRecordsFetched
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRecordsFetchedTotalMetadataSize:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_recordsFetchedTotalMetadataSize = a3;
}

- (void)setHasRecordsFetchedTotalMetadataSize:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRecordsFetchedTotalMetadataSize
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setXattrsFetchedTotalSize:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_xattrsFetchedTotalSize = a3;
}

- (void)setHasXattrsFetchedTotalSize:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasXattrsFetchedTotalSize
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AppTelemetryQBSPerformance;
  v4 = [(AppTelemetryQBSPerformance *)&v8 description];
  v5 = [(AppTelemetryQBSPerformance *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  operationType = self->_operationType;
  if (operationType) {
    [v3 setObject:operationType forKey:@"operationType"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v9 = [NSNumber numberWithUnsignedLongLong:self->_totalTime];
    [v4 setObject:v9 forKey:@"totalTime"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  v10 = [NSNumber numberWithUnsignedLongLong:self->_recordsFetched];
  [v4 setObject:v10 forKey:@"recordsFetched"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  v11 = [NSNumber numberWithUnsignedLongLong:self->_recordsFetchedTotalMetadataSize];
  [v4 setObject:v11 forKey:@"recordsFetchedTotalMetadataSize"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    v7 = [NSNumber numberWithUnsignedLongLong:self->_xattrsFetchedTotalSize];
    [v4 setObject:v7 forKey:@"xattrsFetchedTotalSize"];
  }
LABEL_8:
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AppTelemetryQBSPerformanceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_operationType)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint64Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  PBDataWriterWriteUint64Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
LABEL_8:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_operationType)
  {
    id v6 = v4;
    objc_msgSend(v4, "setOperationType:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)v4 + 3) = self->_totalTime;
    *((unsigned char *)v4 + 48) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  *((void *)v4 + 1) = self->_recordsFetched;
  *((unsigned char *)v4 + 48) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((void *)v4 + 2) = self->_recordsFetchedTotalMetadataSize;
  *((unsigned char *)v4 + 48) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    *((void *)v4 + 4) = self->_xattrsFetchedTotalSize;
    *((unsigned char *)v4 + 48) |= 8u;
  }
LABEL_8:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_operationType copyWithZone:a3];
  v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_totalTime;
    *(unsigned char *)(v5 + 48) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(void *)(v5 + 16) = self->_recordsFetchedTotalMetadataSize;
      *(unsigned char *)(v5 + 48) |= 2u;
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        return (id)v5;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 8) = self->_recordsFetched;
  *(unsigned char *)(v5 + 48) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *(void *)(v5 + 32) = self->_xattrsFetchedTotalSize;
    *(unsigned char *)(v5 + 48) |= 8u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  operationType = self->_operationType;
  if ((unint64_t)operationType | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](operationType, "isEqual:")) {
      goto LABEL_23;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 4) == 0 || self->_totalTime != *((void *)v4 + 3)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
LABEL_23:
    BOOL v6 = 0;
    goto LABEL_24;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_recordsFetched != *((void *)v4 + 1)) {
      goto LABEL_23;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_23;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_recordsFetchedTotalMetadataSize != *((void *)v4 + 2)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_23;
  }
  BOOL v6 = (*((unsigned char *)v4 + 48) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 8) == 0 || self->_xattrsFetchedTotalSize != *((void *)v4 + 4)) {
      goto LABEL_23;
    }
    BOOL v6 = 1;
  }
LABEL_24:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_operationType hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    unint64_t v4 = 2654435761u * self->_totalTime;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      unint64_t v5 = 2654435761u * self->_recordsFetched;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      unint64_t v6 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      unint64_t v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7;
    }
  }
  else
  {
    unint64_t v4 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  unint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  unint64_t v6 = 2654435761u * self->_recordsFetchedTotalMetadataSize;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  unint64_t v7 = 2654435761u * self->_xattrsFetchedTotalSize;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (unint64_t *)a3;
  if (v4[5])
  {
    unint64_t v6 = v4;
    -[AppTelemetryQBSPerformance setOperationType:](self, "setOperationType:");
    unint64_t v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 4) != 0)
  {
    self->_totalTime = v4[3];
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 48);
    if ((v5 & 1) == 0)
    {
LABEL_5:
      if ((v5 & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((v4[6] & 1) == 0)
  {
    goto LABEL_5;
  }
  self->_recordsFetched = v4[1];
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  self->_recordsFetchedTotalMetadataSize = v4[2];
  *(unsigned char *)&self->_has |= 2u;
  if ((v4[6] & 8) != 0)
  {
LABEL_7:
    self->_xattrsFetchedTotalSize = v4[4];
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_8:
}

- (NSString)operationType
{
  return self->_operationType;
}

- (void)setOperationType:(id)a3
{
}

- (unint64_t)totalTime
{
  return self->_totalTime;
}

- (unint64_t)recordsFetched
{
  return self->_recordsFetched;
}

- (unint64_t)recordsFetchedTotalMetadataSize
{
  return self->_recordsFetchedTotalMetadataSize;
}

- (unint64_t)xattrsFetchedTotalSize
{
  return self->_xattrsFetchedTotalSize;
}

- (void).cxx_destruct
{
}

@end