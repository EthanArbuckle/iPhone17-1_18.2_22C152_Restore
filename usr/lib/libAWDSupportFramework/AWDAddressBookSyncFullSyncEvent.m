@interface AWDAddressBookSyncFullSyncEvent
- (BOOL)hasApproximateRecordCount;
- (BOOL)hasRecordsPerSecond;
- (BOOL)hasResult;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)resultAsString:(int)a3;
- (int)StringAsResult:(id)a3;
- (int)result;
- (unint64_t)approximateRecordCount;
- (unint64_t)hash;
- (unint64_t)recordsPerSecond;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setApproximateRecordCount:(unint64_t)a3;
- (void)setHasApproximateRecordCount:(BOOL)a3;
- (void)setHasRecordsPerSecond:(BOOL)a3;
- (void)setHasResult:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setRecordsPerSecond:(unint64_t)a3;
- (void)setResult:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDAddressBookSyncFullSyncEvent

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (int)result
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_result;
  }
  else {
    return 0;
  }
}

- (void)setResult:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_result = a3;
}

- (void)setHasResult:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasResult
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)resultAsString:(int)a3
{
  if (!a3) {
    return @"Success";
  }
  if (a3 == 1) {
    return @"Failure";
  }
  return [NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
}

- (int)StringAsResult:(id)a3
{
  if ([a3 isEqualToString:@"Success"]) {
    return 0;
  }
  else {
    return [a3 isEqualToString:@"Failure"];
  }
}

- (void)setRecordsPerSecond:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_recordsPerSecond = a3;
}

- (void)setHasRecordsPerSecond:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRecordsPerSecond
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setApproximateRecordCount:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_approximateRecordCount = a3;
}

- (void)setHasApproximateRecordCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasApproximateRecordCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDAddressBookSyncFullSyncEvent;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDAddressBookSyncFullSyncEvent description](&v3, sel_description), -[AWDAddressBookSyncFullSyncEvent dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
LABEL_14:
      [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_recordsPerSecond] forKey:@"recordsPerSecond"];
      if ((*(unsigned char *)&self->_has & 1) == 0) {
        return v3;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  int v6 = self->_result;
  if (v6)
  {
    if (v6 == 1) {
      v7 = @"Failure";
    }
    else {
      v7 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_result];
    }
  }
  else
  {
    v7 = @"Success";
  }
  [v3 setObject:v7 forKey:@"result"];
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_14;
  }
LABEL_4:
  if (has) {
LABEL_5:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_approximateRecordCount] forKey:@"approximateRecordCount"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDAddressBookSyncFullSyncEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
LABEL_8:
      PBDataWriterWriteUint64Field();
      if ((*(unsigned char *)&self->_has & 1) == 0) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_8;
  }
LABEL_4:
  if ((has & 1) == 0) {
    return;
  }
LABEL_9:

  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)a3 + 3) = self->_timestamp;
    *((unsigned char *)a3 + 36) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 8) = self->_result;
  *((unsigned char *)a3 + 36) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      return;
    }
LABEL_9:
    *((void *)a3 + 1) = self->_approximateRecordCount;
    *((unsigned char *)a3 + 36) |= 1u;
    return;
  }
LABEL_8:
  *((void *)a3 + 2) = self->_recordsPerSecond;
  *((unsigned char *)a3 + 36) |= 2u;
  if (*(unsigned char *)&self->_has) {
    goto LABEL_9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)result + 3) = self->_timestamp;
    *((unsigned char *)result + 36) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 8) = self->_result;
  *((unsigned char *)result + 36) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((void *)result + 2) = self->_recordsPerSecond;
  *((unsigned char *)result + 36) |= 2u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_5:
  *((void *)result + 1) = self->_approximateRecordCount;
  *((unsigned char *)result + 36) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 4) == 0 || self->_timestamp != *((void *)a3 + 3)) {
        goto LABEL_21;
      }
    }
    else if ((*((unsigned char *)a3 + 36) & 4) != 0)
    {
LABEL_21:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 8) == 0 || self->_result != *((_DWORD *)a3 + 8)) {
        goto LABEL_21;
      }
    }
    else if ((*((unsigned char *)a3 + 36) & 8) != 0)
    {
      goto LABEL_21;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 2) == 0 || self->_recordsPerSecond != *((void *)a3 + 2)) {
        goto LABEL_21;
      }
    }
    else if ((*((unsigned char *)a3 + 36) & 2) != 0)
    {
      goto LABEL_21;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 36) & 1) == 0;
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 36) & 1) == 0 || self->_approximateRecordCount != *((void *)a3 + 1)) {
        goto LABEL_21;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    unint64_t v2 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_result;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      unint64_t v4 = 0;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_5;
      }
LABEL_9:
      unint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  unint64_t v4 = 2654435761u * self->_recordsPerSecond;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  unint64_t v5 = 2654435761u * self->_approximateRecordCount;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 36);
  if ((v3 & 4) != 0)
  {
    self->_timestamp = *((void *)a3 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v3 = *((unsigned char *)a3 + 36);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else if ((*((unsigned char *)a3 + 36) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_id result = *((_DWORD *)a3 + 8);
  *(unsigned char *)&self->_has |= 8u;
  char v3 = *((unsigned char *)a3 + 36);
  if ((v3 & 2) == 0)
  {
LABEL_4:
    if ((v3 & 1) == 0) {
      return;
    }
LABEL_9:
    self->_approximateRecordCount = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    return;
  }
LABEL_8:
  self->_recordsPerSecond = *((void *)a3 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)a3 + 36)) {
    goto LABEL_9;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)recordsPerSecond
{
  return self->_recordsPerSecond;
}

- (unint64_t)approximateRecordCount
{
  return self->_approximateRecordCount;
}

@end