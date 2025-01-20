@interface AWDIDSStreamingReport
- (BOOL)hasBytesReceived;
- (BOOL)hasBytesSent;
- (BOOL)hasGuid;
- (BOOL)hasPacketsReceived;
- (BOOL)hasPacketsSent;
- (BOOL)hasPriority;
- (BOOL)hasSamplingInterval;
- (BOOL)hasService;
- (BOOL)hasStreamName;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)guid;
- (NSString)service;
- (NSString)streamName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)bytesReceived;
- (unint64_t)bytesSent;
- (unint64_t)hash;
- (unint64_t)packetsReceived;
- (unint64_t)packetsSent;
- (unint64_t)priority;
- (unint64_t)samplingInterval;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBytesReceived:(unint64_t)a3;
- (void)setBytesSent:(unint64_t)a3;
- (void)setGuid:(id)a3;
- (void)setHasBytesReceived:(BOOL)a3;
- (void)setHasBytesSent:(BOOL)a3;
- (void)setHasPacketsReceived:(BOOL)a3;
- (void)setHasPacketsSent:(BOOL)a3;
- (void)setHasPriority:(BOOL)a3;
- (void)setHasSamplingInterval:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setPacketsReceived:(unint64_t)a3;
- (void)setPacketsSent:(unint64_t)a3;
- (void)setPriority:(unint64_t)a3;
- (void)setSamplingInterval:(unint64_t)a3;
- (void)setService:(id)a3;
- (void)setStreamName:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDIDSStreamingReport

- (void)dealloc
{
  [(AWDIDSStreamingReport *)self setService:0];
  [(AWDIDSStreamingReport *)self setStreamName:0];
  [(AWDIDSStreamingReport *)self setGuid:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSStreamingReport;
  [(AWDIDSStreamingReport *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (BOOL)hasService
{
  return self->_service != 0;
}

- (BOOL)hasStreamName
{
  return self->_streamName != 0;
}

- (void)setSamplingInterval:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_samplingInterval = a3;
}

- (void)setHasSamplingInterval:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSamplingInterval
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setBytesSent:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_bytesSent = a3;
}

- (void)setHasBytesSent:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBytesSent
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPacketsSent:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_packetsSent = a3;
}

- (void)setHasPacketsSent:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPacketsSent
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setBytesReceived:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_bytesReceived = a3;
}

- (void)setHasBytesReceived:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBytesReceived
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPacketsReceived:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_packetsReceived = a3;
}

- (void)setHasPacketsReceived:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPacketsReceived
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setPriority:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_priority = a3;
}

- (void)setHasPriority:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasPriority
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasGuid
{
  return self->_guid != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSStreamingReport;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDIDSStreamingReport description](&v3, sel_description), -[AWDIDSStreamingReport dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  service = self->_service;
  if (service) {
    [v3 setObject:service forKey:@"service"];
  }
  streamName = self->_streamName;
  if (streamName) {
    [v3 setObject:streamName forKey:@"streamName"];
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_samplingInterval] forKey:@"samplingInterval"];
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_bytesSent] forKey:@"bytesSent"];
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_packetsSent] forKey:@"packetsSent"];
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_11:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_21;
  }
LABEL_20:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_bytesReceived] forKey:@"bytesReceived"];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_21:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_packetsReceived] forKey:@"packetsReceived"];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_13:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_priority] forKey:@"priority"];
LABEL_14:
  guid = self->_guid;
  if (guid) {
    [v3 setObject:guid forKey:@"guid"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSStreamingReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_service) {
    PBDataWriterWriteStringField();
  }
  if (self->_streamName) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_11:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_22:
  PBDataWriterWriteUint64Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_13:
  }
    PBDataWriterWriteUint64Field();
LABEL_14:
  if (self->_guid)
  {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    *((void *)a3 + 7) = self->_timestamp;
    *((unsigned char *)a3 + 88) |= 0x40u;
  }
  if (self->_service) {
    [a3 setService:];
  }
  if (self->_streamName) {
    [a3 setStreamName:];
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((void *)a3 + 6) = self->_samplingInterval;
    *((unsigned char *)a3 + 88) |= 0x20u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  *((void *)a3 + 2) = self->_bytesSent;
  *((unsigned char *)a3 + 88) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((void *)a3 + 4) = self->_packetsSent;
  *((unsigned char *)a3 + 88) |= 8u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_11:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((void *)a3 + 1) = self->_bytesReceived;
  *((unsigned char *)a3 + 88) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_22:
  *((void *)a3 + 3) = self->_packetsReceived;
  *((unsigned char *)a3 + 88) |= 4u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_13:
    *((void *)a3 + 5) = self->_priority;
    *((unsigned char *)a3 + 88) |= 0x10u;
  }
LABEL_14:
  if (self->_guid)
  {
    [a3 setGuid:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    *(void *)(v5 + 56) = self->_timestamp;
    *(unsigned char *)(v5 + 88) |= 0x40u;
  }

  *(void *)(v6 + 72) = [(NSString *)self->_service copyWithZone:a3];
  *(void *)(v6 + 80) = [(NSString *)self->_streamName copyWithZone:a3];
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(void *)(v6 + 48) = self->_samplingInterval;
    *(unsigned char *)(v6 + 88) |= 0x20u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *(void *)(v6 + 16) = self->_bytesSent;
  *(unsigned char *)(v6 + 88) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
LABEL_13:
  *(void *)(v6 + 32) = self->_packetsSent;
  *(unsigned char *)(v6 + 88) |= 8u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
LABEL_15:
    *(void *)(v6 + 24) = self->_packetsReceived;
    *(unsigned char *)(v6 + 88) |= 4u;
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_14:
  *(void *)(v6 + 8) = self->_bytesReceived;
  *(unsigned char *)(v6 + 88) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_15;
  }
LABEL_8:
  if ((has & 0x10) != 0)
  {
LABEL_9:
    *(void *)(v6 + 40) = self->_priority;
    *(unsigned char *)(v6 + 88) |= 0x10u;
  }
LABEL_10:

  *(void *)(v6 + 64) = [(NSString *)self->_guid copyWithZone:a3];
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 0x40) != 0)
    {
      if ((*((unsigned char *)a3 + 88) & 0x40) == 0 || self->_timestamp != *((void *)a3 + 7)) {
        goto LABEL_43;
      }
    }
    else if ((*((unsigned char *)a3 + 88) & 0x40) != 0)
    {
LABEL_43:
      LOBYTE(v5) = 0;
      return v5;
    }
    service = self->_service;
    if (!((unint64_t)service | *((void *)a3 + 9)) || (int v5 = -[NSString isEqual:](service, "isEqual:")) != 0)
    {
      streamName = self->_streamName;
      if (!((unint64_t)streamName | *((void *)a3 + 10))
        || (int v5 = -[NSString isEqual:](streamName, "isEqual:")) != 0)
      {
        if ((*(unsigned char *)&self->_has & 0x20) != 0)
        {
          if ((*((unsigned char *)a3 + 88) & 0x20) == 0 || self->_samplingInterval != *((void *)a3 + 6)) {
            goto LABEL_43;
          }
        }
        else if ((*((unsigned char *)a3 + 88) & 0x20) != 0)
        {
          goto LABEL_43;
        }
        if ((*(unsigned char *)&self->_has & 2) != 0)
        {
          if ((*((unsigned char *)a3 + 88) & 2) == 0 || self->_bytesSent != *((void *)a3 + 2)) {
            goto LABEL_43;
          }
        }
        else if ((*((unsigned char *)a3 + 88) & 2) != 0)
        {
          goto LABEL_43;
        }
        if ((*(unsigned char *)&self->_has & 8) != 0)
        {
          if ((*((unsigned char *)a3 + 88) & 8) == 0 || self->_packetsSent != *((void *)a3 + 4)) {
            goto LABEL_43;
          }
        }
        else if ((*((unsigned char *)a3 + 88) & 8) != 0)
        {
          goto LABEL_43;
        }
        if (*(unsigned char *)&self->_has)
        {
          if ((*((unsigned char *)a3 + 88) & 1) == 0 || self->_bytesReceived != *((void *)a3 + 1)) {
            goto LABEL_43;
          }
        }
        else if (*((unsigned char *)a3 + 88))
        {
          goto LABEL_43;
        }
        if ((*(unsigned char *)&self->_has & 4) != 0)
        {
          if ((*((unsigned char *)a3 + 88) & 4) == 0 || self->_packetsReceived != *((void *)a3 + 3)) {
            goto LABEL_43;
          }
        }
        else if ((*((unsigned char *)a3 + 88) & 4) != 0)
        {
          goto LABEL_43;
        }
        if ((*(unsigned char *)&self->_has & 0x10) != 0)
        {
          if ((*((unsigned char *)a3 + 88) & 0x10) == 0 || self->_priority != *((void *)a3 + 5)) {
            goto LABEL_43;
          }
        }
        else if ((*((unsigned char *)a3 + 88) & 0x10) != 0)
        {
          goto LABEL_43;
        }
        guid = self->_guid;
        if ((unint64_t)guid | *((void *)a3 + 8))
        {
          LOBYTE(v5) = -[NSString isEqual:](guid, "isEqual:");
        }
        else
        {
          LOBYTE(v5) = 1;
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_service hash];
  NSUInteger v5 = [(NSString *)self->_streamName hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    unint64_t v6 = 2654435761u * self->_samplingInterval;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_6:
      unint64_t v7 = 2654435761u * self->_bytesSent;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_7;
      }
      goto LABEL_13;
    }
  }
  else
  {
    unint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
  }
  unint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    unint64_t v8 = 2654435761u * self->_packetsSent;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_8;
    }
    goto LABEL_14;
  }
LABEL_13:
  unint64_t v8 = 0;
  if (*(unsigned char *)&self->_has)
  {
LABEL_8:
    unint64_t v9 = 2654435761u * self->_bytesReceived;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_9;
    }
LABEL_15:
    unint64_t v10 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_10;
    }
LABEL_16:
    unint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(NSString *)self->_guid hash];
  }
LABEL_14:
  unint64_t v9 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_15;
  }
LABEL_9:
  unint64_t v10 = 2654435761u * self->_packetsReceived;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_16;
  }
LABEL_10:
  unint64_t v11 = 2654435761u * self->_priority;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(NSString *)self->_guid hash];
}

- (void)mergeFrom:(id)a3
{
  if ((*((unsigned char *)a3 + 88) & 0x40) != 0)
  {
    self->_timestamp = *((void *)a3 + 7);
    *(unsigned char *)&self->_has |= 0x40u;
  }
  if (*((void *)a3 + 9)) {
    -[AWDIDSStreamingReport setService:](self, "setService:");
  }
  if (*((void *)a3 + 10)) {
    -[AWDIDSStreamingReport setStreamName:](self, "setStreamName:");
  }
  char v5 = *((unsigned char *)a3 + 88);
  if ((v5 & 0x20) != 0)
  {
    self->_samplingInterval = *((void *)a3 + 6);
    *(unsigned char *)&self->_has |= 0x20u;
    char v5 = *((unsigned char *)a3 + 88);
    if ((v5 & 2) == 0)
    {
LABEL_9:
      if ((v5 & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)a3 + 88) & 2) == 0)
  {
    goto LABEL_9;
  }
  self->_bytesSent = *((void *)a3 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)a3 + 88);
  if ((v5 & 8) == 0)
  {
LABEL_10:
    if ((v5 & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_packetsSent = *((void *)a3 + 4);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)a3 + 88);
  if ((v5 & 1) == 0)
  {
LABEL_11:
    if ((v5 & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_bytesReceived = *((void *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)a3 + 88);
  if ((v5 & 4) == 0)
  {
LABEL_12:
    if ((v5 & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_22:
  self->_packetsReceived = *((void *)a3 + 3);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)a3 + 88) & 0x10) != 0)
  {
LABEL_13:
    self->_priority = *((void *)a3 + 5);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_14:
  if (*((void *)a3 + 8))
  {
    -[AWDIDSStreamingReport setGuid:](self, "setGuid:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (NSString)streamName
{
  return self->_streamName;
}

- (void)setStreamName:(id)a3
{
}

- (unint64_t)samplingInterval
{
  return self->_samplingInterval;
}

- (unint64_t)bytesSent
{
  return self->_bytesSent;
}

- (unint64_t)packetsSent
{
  return self->_packetsSent;
}

- (unint64_t)bytesReceived
{
  return self->_bytesReceived;
}

- (unint64_t)packetsReceived
{
  return self->_packetsReceived;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
}

@end