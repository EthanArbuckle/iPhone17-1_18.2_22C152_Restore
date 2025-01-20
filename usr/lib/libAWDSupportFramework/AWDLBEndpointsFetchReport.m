@interface AWDLBEndpointsFetchReport
- (BOOL)hasConnectionCellularFallbackCount;
- (BOOL)hasEndpointsFetchTaskBadReplyCount;
- (BOOL)hasEndpointsFetchTaskCount;
- (BOOL)hasEndpointsFetchTaskFailureCount;
- (BOOL)hasEndpointsFetchTaskSuccessCount;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)connectionCellularFallbackCount;
- (int)endpointsFetchTaskBadReplyCount;
- (int)endpointsFetchTaskCount;
- (int)endpointsFetchTaskFailureCount;
- (int)endpointsFetchTaskSuccessCount;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConnectionCellularFallbackCount:(int)a3;
- (void)setEndpointsFetchTaskBadReplyCount:(int)a3;
- (void)setEndpointsFetchTaskCount:(int)a3;
- (void)setEndpointsFetchTaskFailureCount:(int)a3;
- (void)setEndpointsFetchTaskSuccessCount:(int)a3;
- (void)setHasConnectionCellularFallbackCount:(BOOL)a3;
- (void)setHasEndpointsFetchTaskBadReplyCount:(BOOL)a3;
- (void)setHasEndpointsFetchTaskCount:(BOOL)a3;
- (void)setHasEndpointsFetchTaskFailureCount:(BOOL)a3;
- (void)setHasEndpointsFetchTaskSuccessCount:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDLBEndpointsFetchReport

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setEndpointsFetchTaskCount:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_endpointsFetchTaskCount = a3;
}

- (void)setHasEndpointsFetchTaskCount:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasEndpointsFetchTaskCount
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setEndpointsFetchTaskSuccessCount:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_endpointsFetchTaskSuccessCount = a3;
}

- (void)setHasEndpointsFetchTaskSuccessCount:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasEndpointsFetchTaskSuccessCount
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setEndpointsFetchTaskFailureCount:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_endpointsFetchTaskFailureCount = a3;
}

- (void)setHasEndpointsFetchTaskFailureCount:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasEndpointsFetchTaskFailureCount
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setEndpointsFetchTaskBadReplyCount:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_endpointsFetchTaskBadReplyCount = a3;
}

- (void)setHasEndpointsFetchTaskBadReplyCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEndpointsFetchTaskBadReplyCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setConnectionCellularFallbackCount:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_connectionCellularFallbackCount = a3;
}

- (void)setHasConnectionCellularFallbackCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasConnectionCellularFallbackCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDLBEndpointsFetchReport;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDLBEndpointsFetchReport description](&v3, sel_description), -[AWDLBEndpointsFetchReport dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithInt:self->_endpointsFetchTaskCount] forKey:@"endpoints_fetch_task_count"];
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  [v3 setObject:[NSNumber numberWithInt:self->_endpointsFetchTaskSuccessCount] forKey:@"endpoints_fetch_task_success_count"];
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
LABEL_13:
    [v3 setObject:[NSNumber numberWithInt:self->_endpointsFetchTaskBadReplyCount] forKey:@"endpoints_fetch_task_bad_reply_count"];
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return v3;
    }
    goto LABEL_7;
  }
LABEL_12:
  [v3 setObject:[NSNumber numberWithInt:self->_endpointsFetchTaskFailureCount] forKey:@"endpoints_fetch_task_failure_count"];
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_13;
  }
LABEL_6:
  if ((has & 2) != 0) {
LABEL_7:
  }
    [v3 setObject:[NSNumber numberWithInt:self->_connectionCellularFallbackCount] forKey:@"connection_cellular_fallback_count"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDLBEndpointsFetchReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
LABEL_12:
    PBDataWriterWriteInt32Field();
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return;
    }
    goto LABEL_13;
  }
LABEL_11:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_12;
  }
LABEL_6:
  if ((has & 2) == 0) {
    return;
  }
LABEL_13:

  PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 36) |= 1u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 6) = self->_endpointsFetchTaskCount;
  *((unsigned char *)a3 + 36) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((_DWORD *)a3 + 8) = self->_endpointsFetchTaskSuccessCount;
  *((unsigned char *)a3 + 36) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)a3 + 7) = self->_endpointsFetchTaskFailureCount;
  *((unsigned char *)a3 + 36) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      return;
    }
LABEL_13:
    *((_DWORD *)a3 + 4) = self->_connectionCellularFallbackCount;
    *((unsigned char *)a3 + 36) |= 2u;
    return;
  }
LABEL_12:
  *((_DWORD *)a3 + 5) = self->_endpointsFetchTaskBadReplyCount;
  *((unsigned char *)a3 + 36) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    goto LABEL_13;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((unsigned char *)result + 36) |= 1u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 6) = self->_endpointsFetchTaskCount;
  *((unsigned char *)result + 36) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)result + 8) = self->_endpointsFetchTaskSuccessCount;
  *((unsigned char *)result + 36) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 7) = self->_endpointsFetchTaskFailureCount;
  *((unsigned char *)result + 36) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      return result;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((_DWORD *)result + 5) = self->_endpointsFetchTaskBadReplyCount;
  *((unsigned char *)result + 36) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_7:
  *((_DWORD *)result + 4) = self->_connectionCellularFallbackCount;
  *((unsigned char *)result + 36) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 36) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_31;
      }
    }
    else if (*((unsigned char *)a3 + 36))
    {
LABEL_31:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 8) == 0 || self->_endpointsFetchTaskCount != *((_DWORD *)a3 + 6)) {
        goto LABEL_31;
      }
    }
    else if ((*((unsigned char *)a3 + 36) & 8) != 0)
    {
      goto LABEL_31;
    }
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 0x20) == 0 || self->_endpointsFetchTaskSuccessCount != *((_DWORD *)a3 + 8)) {
        goto LABEL_31;
      }
    }
    else if ((*((unsigned char *)a3 + 36) & 0x20) != 0)
    {
      goto LABEL_31;
    }
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 0x10) == 0 || self->_endpointsFetchTaskFailureCount != *((_DWORD *)a3 + 7)) {
        goto LABEL_31;
      }
    }
    else if ((*((unsigned char *)a3 + 36) & 0x10) != 0)
    {
      goto LABEL_31;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 4) == 0 || self->_endpointsFetchTaskBadReplyCount != *((_DWORD *)a3 + 5)) {
        goto LABEL_31;
      }
    }
    else if ((*((unsigned char *)a3 + 36) & 4) != 0)
    {
      goto LABEL_31;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 36) & 2) == 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 2) == 0 || self->_connectionCellularFallbackCount != *((_DWORD *)a3 + 4)) {
        goto LABEL_31;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v2 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_endpointsFetchTaskCount;
      if ((*(unsigned char *)&self->_has & 0x20) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
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
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_endpointsFetchTaskSuccessCount;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_endpointsFetchTaskFailureCount;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_7;
    }
LABEL_13:
    uint64_t v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_endpointsFetchTaskBadReplyCount;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_connectionCellularFallbackCount;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 36);
  if (v3)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v3 = *((unsigned char *)a3 + 36);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*((unsigned char *)a3 + 36) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_endpointsFetchTaskCount = *((_DWORD *)a3 + 6);
  *(unsigned char *)&self->_has |= 8u;
  char v3 = *((unsigned char *)a3 + 36);
  if ((v3 & 0x20) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  self->_endpointsFetchTaskSuccessCount = *((_DWORD *)a3 + 8);
  *(unsigned char *)&self->_has |= 0x20u;
  char v3 = *((unsigned char *)a3 + 36);
  if ((v3 & 0x10) == 0)
  {
LABEL_5:
    if ((v3 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_12;
  }
LABEL_11:
  self->_endpointsFetchTaskFailureCount = *((_DWORD *)a3 + 7);
  *(unsigned char *)&self->_has |= 0x10u;
  char v3 = *((unsigned char *)a3 + 36);
  if ((v3 & 4) == 0)
  {
LABEL_6:
    if ((v3 & 2) == 0) {
      return;
    }
LABEL_13:
    self->_connectionCellularFallbackCount = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 2u;
    return;
  }
LABEL_12:
  self->_endpointsFetchTaskBadReplyCount = *((_DWORD *)a3 + 5);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)a3 + 36) & 2) != 0) {
    goto LABEL_13;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)endpointsFetchTaskCount
{
  return self->_endpointsFetchTaskCount;
}

- (int)endpointsFetchTaskSuccessCount
{
  return self->_endpointsFetchTaskSuccessCount;
}

- (int)endpointsFetchTaskFailureCount
{
  return self->_endpointsFetchTaskFailureCount;
}

- (int)endpointsFetchTaskBadReplyCount
{
  return self->_endpointsFetchTaskBadReplyCount;
}

- (int)connectionCellularFallbackCount
{
  return self->_connectionCellularFallbackCount;
}

@end