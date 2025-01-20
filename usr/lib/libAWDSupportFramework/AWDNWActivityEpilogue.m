@interface AWDNWActivityEpilogue
- (AWDNWActivity)activity;
- (AWDNWDeviceReport)deviceReport;
- (AWDNWL2Report)l2Report;
- (BOOL)hasActivity;
- (BOOL)hasCompletionReason;
- (BOOL)hasDeviceReport;
- (BOOL)hasDurationMsecs;
- (BOOL)hasFragmentsQuenched;
- (BOOL)hasL2Report;
- (BOOL)hasTimestamp;
- (BOOL)hasUnderlyingErrorCode;
- (BOOL)hasUnderlyingErrorDomain;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)completionReasonAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsCompletionReason:(id)a3;
- (int)completionReason;
- (int)underlyingErrorCode;
- (int)underlyingErrorDomain;
- (unint64_t)durationMsecs;
- (unint64_t)fragmentsQuenched;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setActivity:(id)a3;
- (void)setCompletionReason:(int)a3;
- (void)setDeviceReport:(id)a3;
- (void)setDurationMsecs:(unint64_t)a3;
- (void)setFragmentsQuenched:(unint64_t)a3;
- (void)setHasCompletionReason:(BOOL)a3;
- (void)setHasDurationMsecs:(BOOL)a3;
- (void)setHasFragmentsQuenched:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasUnderlyingErrorCode:(BOOL)a3;
- (void)setHasUnderlyingErrorDomain:(BOOL)a3;
- (void)setL2Report:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUnderlyingErrorCode:(int)a3;
- (void)setUnderlyingErrorDomain:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDNWActivityEpilogue

- (void)dealloc
{
  [(AWDNWActivityEpilogue *)self setActivity:0];
  [(AWDNWActivityEpilogue *)self setL2Report:0];
  [(AWDNWActivityEpilogue *)self setDeviceReport:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDNWActivityEpilogue;
  [(AWDNWActivityEpilogue *)&v3 dealloc];
}

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

- (BOOL)hasActivity
{
  return self->_activity != 0;
}

- (void)setDurationMsecs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_durationMsecs = a3;
}

- (void)setHasDurationMsecs:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDurationMsecs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setFragmentsQuenched:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_fragmentsQuenched = a3;
}

- (void)setHasFragmentsQuenched:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFragmentsQuenched
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)completionReason
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_completionReason;
  }
  else {
    return 0;
  }
}

- (void)setCompletionReason:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_completionReason = a3;
}

- (void)setHasCompletionReason:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasCompletionReason
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)completionReasonAsString:(int)a3
{
  if (a3 >= 5) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B9800[a3];
  }
}

- (int)StringAsCompletionReason:(id)a3
{
  if ([a3 isEqualToString:@"NW_ACTIVITY_COMPLETION_REASON_INVALID"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"NW_ACTIVITY_COMPLETION_REASON_NONE"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"NW_ACTIVITY_COMPLETION_REASON_SUCCESS"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"NW_ACTIVITY_COMPLETION_REASON_FAILURE"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"NW_ACTIVITY_COMPLETION_REASON_CANCELLED"]) {
    return 4;
  }
  return 0;
}

- (BOOL)hasL2Report
{
  return self->_l2Report != 0;
}

- (BOOL)hasDeviceReport
{
  return self->_deviceReport != 0;
}

- (void)setUnderlyingErrorDomain:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_underlyingErrorDomain = a3;
}

- (void)setHasUnderlyingErrorDomain:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasUnderlyingErrorDomain
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setUnderlyingErrorCode:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_underlyingErrorCode = a3;
}

- (void)setHasUnderlyingErrorCode:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasUnderlyingErrorCode
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDNWActivityEpilogue;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDNWActivityEpilogue description](&v3, sel_description), -[AWDNWActivityEpilogue dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  activity = self->_activity;
  if (activity) {
    [v3 setObject:-[AWDNWActivity dictionaryRepresentation](activity, "dictionaryRepresentation") forKey:@"activity"];
  }
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_durationMsecs] forKey:@"durationMsecs"];
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_15;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_fragmentsQuenched] forKey:@"fragmentsQuenched"];
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_15;
  }
LABEL_11:
  uint64_t completionReason = self->_completionReason;
  if (completionReason >= 5) {
    v7 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_completionReason];
  }
  else {
    v7 = off_2641B9800[completionReason];
  }
  [v3 setObject:v7 forKey:@"completionReason"];
LABEL_15:
  l2Report = self->_l2Report;
  if (l2Report) {
    [v3 setObject:l2Report dictionaryRepresentation] forKey:@"l2Report"];
  }
  deviceReport = self->_deviceReport;
  if (deviceReport) {
    [v3 setObject:[-[AWDNWDeviceReport dictionaryRepresentation](deviceReport, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"deviceReport"];
  }
  char v10 = (char)self->_has;
  if ((v10 & 0x20) != 0)
  {
    [v3 setObject:[NSNumber numberWithInt:self->_underlyingErrorDomain] forKey:@"underlyingErrorDomain"];
    char v10 = (char)self->_has;
  }
  if ((v10 & 0x10) != 0) {
    [v3 setObject:[NSNumber numberWithInt:self->_underlyingErrorCode] forKey:@"underlyingErrorCode"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDNWActivityEpilogueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_activity) {
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint64Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_8:
  }
    PBDataWriterWriteInt32Field();
LABEL_9:
  if (self->_l2Report) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_deviceReport) {
    PBDataWriterWriteSubmessage();
  }
  char v5 = (char)self->_has;
  if ((v5 & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    char v5 = (char)self->_has;
  }
  if ((v5 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((void *)a3 + 3) = self->_timestamp;
    *((unsigned char *)a3 + 72) |= 4u;
  }
  if (self->_activity) {
    [a3 setActivity:];
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_durationMsecs;
    *((unsigned char *)a3 + 72) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((void *)a3 + 2) = self->_fragmentsQuenched;
  *((unsigned char *)a3 + 72) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_8:
    *((_DWORD *)a3 + 10) = self->_completionReason;
    *((unsigned char *)a3 + 72) |= 8u;
  }
LABEL_9:
  if (self->_l2Report) {
    [a3 setL2Report:];
  }
  if (self->_deviceReport) {
    [a3 setDeviceReport:];
  }
  char v6 = (char)self->_has;
  if ((v6 & 0x20) != 0)
  {
    *((_DWORD *)a3 + 17) = self->_underlyingErrorDomain;
    *((unsigned char *)a3 + 72) |= 0x20u;
    char v6 = (char)self->_has;
  }
  if ((v6 & 0x10) != 0)
  {
    *((_DWORD *)a3 + 16) = self->_underlyingErrorCode;
    *((unsigned char *)a3 + 72) |= 0x10u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[(id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_timestamp;
    *(unsigned char *)(v5 + 72) |= 4u;
  }

  *(void *)(v6 + 32) = [(AWDNWActivity *)self->_activity copyWithZone:a3];
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v6 + 8) = self->_durationMsecs;
    *(unsigned char *)(v6 + 72) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 8) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *(void *)(v6 + 16) = self->_fragmentsQuenched;
  *(unsigned char *)(v6 + 72) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_6:
    *(_DWORD *)(v6 + 40) = self->_completionReason;
    *(unsigned char *)(v6 + 72) |= 8u;
  }
LABEL_7:

  *(void *)(v6 + 56) = [(AWDNWL2Report *)self->_l2Report copyWithZone:a3];
  *(void *)(v6 + 48) = [(AWDNWDeviceReport *)self->_deviceReport copyWithZone:a3];
  char v8 = (char)self->_has;
  if ((v8 & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 68) = self->_underlyingErrorDomain;
    *(unsigned char *)(v6 + 72) |= 0x20u;
    char v8 = (char)self->_has;
  }
  if ((v8 & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 64) = self->_underlyingErrorCode;
    *(unsigned char *)(v6 + 72) |= 0x10u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    char has = (char)self->_has;
    if ((has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 4) == 0 || self->_timestamp != *((void *)a3 + 3)) {
        goto LABEL_38;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 4) != 0)
    {
LABEL_38:
      LOBYTE(v5) = 0;
      return v5;
    }
    activity = self->_activity;
    if ((unint64_t)activity | *((void *)a3 + 4))
    {
      int v5 = -[AWDNWActivity isEqual:](activity, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    if (has)
    {
      if ((*((unsigned char *)a3 + 72) & 1) == 0 || self->_durationMsecs != *((void *)a3 + 1)) {
        goto LABEL_38;
      }
    }
    else if (*((unsigned char *)a3 + 72))
    {
      goto LABEL_38;
    }
    if ((has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 2) == 0 || self->_fragmentsQuenched != *((void *)a3 + 2)) {
        goto LABEL_38;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 2) != 0)
    {
      goto LABEL_38;
    }
    if ((has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 8) == 0 || self->_completionReason != *((_DWORD *)a3 + 10)) {
        goto LABEL_38;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 8) != 0)
    {
      goto LABEL_38;
    }
    l2Report = self->_l2Report;
    if (!((unint64_t)l2Report | *((void *)a3 + 7))
      || (int v5 = -[AWDNWL2Report isEqual:](l2Report, "isEqual:")) != 0)
    {
      deviceReport = self->_deviceReport;
      if (!((unint64_t)deviceReport | *((void *)a3 + 6))
        || (int v5 = -[AWDNWDeviceReport isEqual:](deviceReport, "isEqual:")) != 0)
      {
        if ((*(unsigned char *)&self->_has & 0x20) != 0)
        {
          if ((*((unsigned char *)a3 + 72) & 0x20) == 0 || self->_underlyingErrorDomain != *((_DWORD *)a3 + 17)) {
            goto LABEL_38;
          }
        }
        else if ((*((unsigned char *)a3 + 72) & 0x20) != 0)
        {
          goto LABEL_38;
        }
        LOBYTE(v5) = (*((unsigned char *)a3 + 72) & 0x10) == 0;
        if ((*(unsigned char *)&self->_has & 0x10) != 0)
        {
          if ((*((unsigned char *)a3 + 72) & 0x10) == 0 || self->_underlyingErrorCode != *((_DWORD *)a3 + 16)) {
            goto LABEL_38;
          }
          LOBYTE(v5) = 1;
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  unint64_t v4 = [(AWDNWActivity *)self->_activity hash];
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    unint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    unint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }
  unint64_t v5 = 2654435761u * self->_durationMsecs;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  unint64_t v6 = 2654435761u * self->_fragmentsQuenched;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    uint64_t v7 = 2654435761 * self->_completionReason;
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v7 = 0;
LABEL_11:
  unint64_t v8 = [(AWDNWL2Report *)self->_l2Report hash];
  unint64_t v9 = [(AWDNWDeviceReport *)self->_deviceReport hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    uint64_t v10 = 2654435761 * self->_underlyingErrorDomain;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_13;
    }
LABEL_15:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
  uint64_t v10 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_15;
  }
LABEL_13:
  uint64_t v11 = 2654435761 * self->_underlyingErrorCode;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  if ((*((unsigned char *)a3 + 72) & 4) != 0)
  {
    self->_timestamp = *((void *)a3 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
  activity = self->_activity;
  uint64_t v6 = *((void *)a3 + 4);
  if (activity)
  {
    if (v6) {
      -[AWDNWActivity mergeFrom:](activity, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[AWDNWActivityEpilogue setActivity:](self, "setActivity:");
  }
  char v7 = *((unsigned char *)a3 + 72);
  if (v7)
  {
    self->_durationMsecs = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v7 = *((unsigned char *)a3 + 72);
    if ((v7 & 2) == 0)
    {
LABEL_10:
      if ((v7 & 8) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)a3 + 72) & 2) == 0)
  {
    goto LABEL_10;
  }
  self->_fragmentsQuenched = *((void *)a3 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)a3 + 72) & 8) != 0)
  {
LABEL_11:
    self->_uint64_t completionReason = *((_DWORD *)a3 + 10);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_12:
  l2Report = self->_l2Report;
  uint64_t v9 = *((void *)a3 + 7);
  if (l2Report)
  {
    if (v9) {
      -[AWDNWL2Report mergeFrom:](l2Report, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[AWDNWActivityEpilogue setL2Report:](self, "setL2Report:");
  }
  deviceReport = self->_deviceReport;
  uint64_t v11 = *((void *)a3 + 6);
  if (deviceReport)
  {
    if (v11) {
      -[AWDNWDeviceReport mergeFrom:](deviceReport, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[AWDNWActivityEpilogue setDeviceReport:](self, "setDeviceReport:");
  }
  char v12 = *((unsigned char *)a3 + 72);
  if ((v12 & 0x20) != 0)
  {
    self->_underlyingErrorDomain = *((_DWORD *)a3 + 17);
    *(unsigned char *)&self->_has |= 0x20u;
    char v12 = *((unsigned char *)a3 + 72);
  }
  if ((v12 & 0x10) != 0)
  {
    self->_underlyingErrorCode = *((_DWORD *)a3 + 16);
    *(unsigned char *)&self->_has |= 0x10u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (AWDNWActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (unint64_t)durationMsecs
{
  return self->_durationMsecs;
}

- (unint64_t)fragmentsQuenched
{
  return self->_fragmentsQuenched;
}

- (AWDNWL2Report)l2Report
{
  return self->_l2Report;
}

- (void)setL2Report:(id)a3
{
}

- (AWDNWDeviceReport)deviceReport
{
  return self->_deviceReport;
}

- (void)setDeviceReport:(id)a3
{
}

- (int)underlyingErrorDomain
{
  return self->_underlyingErrorDomain;
}

- (int)underlyingErrorCode
{
  return self->_underlyingErrorCode;
}

@end