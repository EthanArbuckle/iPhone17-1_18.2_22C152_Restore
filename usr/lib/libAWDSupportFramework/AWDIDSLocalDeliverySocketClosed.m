@interface AWDIDSLocalDeliverySocketClosed
- (BOOL)hasBytesReceived;
- (BOOL)hasBytesSent;
- (BOOL)hasCloseError;
- (BOOL)hasGuid;
- (BOOL)hasIsToDefaultPairedDevice;
- (BOOL)hasPacketsReceived;
- (BOOL)hasPacketsSent;
- (BOOL)hasPriority;
- (BOOL)hasService;
- (BOOL)hasSocketError;
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
- (unint64_t)closeError;
- (unint64_t)hash;
- (unint64_t)isToDefaultPairedDevice;
- (unint64_t)packetsReceived;
- (unint64_t)packetsSent;
- (unint64_t)priority;
- (unint64_t)socketError;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBytesReceived:(unint64_t)a3;
- (void)setBytesSent:(unint64_t)a3;
- (void)setCloseError:(unint64_t)a3;
- (void)setGuid:(id)a3;
- (void)setHasBytesReceived:(BOOL)a3;
- (void)setHasBytesSent:(BOOL)a3;
- (void)setHasCloseError:(BOOL)a3;
- (void)setHasIsToDefaultPairedDevice:(BOOL)a3;
- (void)setHasPacketsReceived:(BOOL)a3;
- (void)setHasPacketsSent:(BOOL)a3;
- (void)setHasPriority:(BOOL)a3;
- (void)setHasSocketError:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setIsToDefaultPairedDevice:(unint64_t)a3;
- (void)setPacketsReceived:(unint64_t)a3;
- (void)setPacketsSent:(unint64_t)a3;
- (void)setPriority:(unint64_t)a3;
- (void)setService:(id)a3;
- (void)setSocketError:(unint64_t)a3;
- (void)setStreamName:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDIDSLocalDeliverySocketClosed

- (void)dealloc
{
  [(AWDIDSLocalDeliverySocketClosed *)self setService:0];
  [(AWDIDSLocalDeliverySocketClosed *)self setStreamName:0];
  [(AWDIDSLocalDeliverySocketClosed *)self setGuid:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSLocalDeliverySocketClosed;
  [(AWDIDSLocalDeliverySocketClosed *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasTimestamp
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasService
{
  return self->_service != 0;
}

- (void)setIsToDefaultPairedDevice:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_isToDefaultPairedDevice = a3;
}

- (void)setHasIsToDefaultPairedDevice:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasIsToDefaultPairedDevice
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setCloseError:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_closeError = a3;
}

- (void)setHasCloseError:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasCloseError
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setSocketError:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_socketError = a3;
}

- (void)setHasSocketError:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasSocketError
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setBytesSent:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_bytesSent = a3;
}

- (void)setHasBytesSent:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasBytesSent
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setPacketsSent:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_packetsSent = a3;
}

- (void)setHasPacketsSent:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasPacketsSent
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setBytesReceived:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_bytesReceived = a3;
}

- (void)setHasBytesReceived:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasBytesReceived
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setPacketsReceived:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_packetsReceived = a3;
}

- (void)setHasPacketsReceived:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasPacketsReceived
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setPriority:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_priority = a3;
}

- (void)setHasPriority:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasPriority
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (BOOL)hasStreamName
{
  return self->_streamName != 0;
}

- (BOOL)hasGuid
{
  return self->_guid != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSLocalDeliverySocketClosed;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDIDSLocalDeliverySocketClosed description](&v3, sel_description), -[AWDIDSLocalDeliverySocketClosed dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  service = self->_service;
  if (service) {
    [v3 setObject:service forKey:@"service"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_isToDefaultPairedDevice] forKey:@"isToDefaultPairedDevice"];
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 0x80) == 0) {
        goto LABEL_8;
      }
      goto LABEL_21;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_closeError] forKey:@"closeError"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_socketError] forKey:@"socketError"];
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_bytesSent] forKey:@"bytesSent"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_packetsSent] forKey:@"packetsSent"];
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_bytesReceived] forKey:@"bytesReceived"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_25:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_packetsReceived] forKey:@"packetsReceived"];
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
LABEL_13:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_priority] forKey:@"priority"];
LABEL_14:
  streamName = self->_streamName;
  if (streamName) {
    [v3 setObject:streamName forKey:@"streamName"];
  }
  guid = self->_guid;
  if (guid) {
    [v3 setObject:guid forKey:@"guid"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSLocalDeliverySocketClosedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_service) {
    PBDataWriterWriteStringField();
  }
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 0x80) == 0) {
        goto LABEL_8;
      }
      goto LABEL_22;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_26:
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
LABEL_13:
  }
    PBDataWriterWriteUint64Field();
LABEL_14:
  if (self->_streamName) {
    PBDataWriterWriteStringField();
  }
  if (self->_guid)
  {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *((void *)a3 + 9) = self->_timestamp;
    *((_WORD *)a3 + 52) |= 0x100u;
  }
  if (self->_service) {
    [a3 setService:];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *((void *)a3 + 4) = self->_isToDefaultPairedDevice;
    *((_WORD *)a3 + 52) |= 8u;
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 0x80) == 0) {
        goto LABEL_8;
      }
      goto LABEL_22;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }
  *((void *)a3 + 3) = self->_closeError;
  *((_WORD *)a3 + 52) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((void *)a3 + 8) = self->_socketError;
  *((_WORD *)a3 + 52) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((void *)a3 + 2) = self->_bytesSent;
  *((_WORD *)a3 + 52) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((void *)a3 + 6) = self->_packetsSent;
  *((_WORD *)a3 + 52) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((void *)a3 + 1) = self->_bytesReceived;
  *((_WORD *)a3 + 52) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_26:
  *((void *)a3 + 5) = self->_packetsReceived;
  *((_WORD *)a3 + 52) |= 0x10u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_13:
    *((void *)a3 + 7) = self->_priority;
    *((_WORD *)a3 + 52) |= 0x40u;
  }
LABEL_14:
  if (self->_streamName) {
    [a3 setStreamName:];
  }
  if (self->_guid)
  {
    [a3 setGuid:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *(void *)(v5 + 72) = self->_timestamp;
    *(_WORD *)(v5 + 104) |= 0x100u;
  }

  *(void *)(v6 + 88) = [(NSString *)self->_service copyWithZone:a3];
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *(void *)(v6 + 32) = self->_isToDefaultPairedDevice;
    *(_WORD *)(v6 + 104) |= 8u;
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 0x80) == 0) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_5;
  }
  *(void *)(v6 + 24) = self->_closeError;
  *(_WORD *)(v6 + 104) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  *(void *)(v6 + 64) = self->_socketError;
  *(_WORD *)(v6 + 104) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  *(void *)(v6 + 16) = self->_bytesSent;
  *(_WORD *)(v6 + 104) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_18;
  }
LABEL_17:
  *(void *)(v6 + 48) = self->_packetsSent;
  *(_WORD *)(v6 + 104) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
LABEL_19:
    *(void *)(v6 + 40) = self->_packetsReceived;
    *(_WORD *)(v6 + 104) |= 0x10u;
    if ((*(_WORD *)&self->_has & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_18:
  *(void *)(v6 + 8) = self->_bytesReceived;
  *(_WORD *)(v6 + 104) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_19;
  }
LABEL_10:
  if ((has & 0x40) != 0)
  {
LABEL_11:
    *(void *)(v6 + 56) = self->_priority;
    *(_WORD *)(v6 + 104) |= 0x40u;
  }
LABEL_12:

  *(void *)(v6 + 96) = [(NSString *)self->_streamName copyWithZone:a3];
  *(void *)(v6 + 80) = [(NSString *)self->_guid copyWithZone:a3];
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 52) & 0x100) == 0 || self->_timestamp != *((void *)a3 + 9)) {
        goto LABEL_54;
      }
    }
    else if ((*((_WORD *)a3 + 52) & 0x100) != 0)
    {
LABEL_54:
      LOBYTE(v5) = 0;
      return v5;
    }
    service = self->_service;
    if ((unint64_t)service | *((void *)a3 + 11))
    {
      int v5 = -[NSString isEqual:](service, "isEqual:");
      if (!v5) {
        return v5;
      }
      __int16 has = (__int16)self->_has;
    }
    __int16 v8 = *((_WORD *)a3 + 52);
    if ((has & 8) != 0)
    {
      if ((v8 & 8) == 0 || self->_isToDefaultPairedDevice != *((void *)a3 + 4)) {
        goto LABEL_54;
      }
    }
    else if ((v8 & 8) != 0)
    {
      goto LABEL_54;
    }
    if ((has & 4) != 0)
    {
      if ((v8 & 4) == 0 || self->_closeError != *((void *)a3 + 3)) {
        goto LABEL_54;
      }
    }
    else if ((v8 & 4) != 0)
    {
      goto LABEL_54;
    }
    if ((has & 0x80) != 0)
    {
      if ((v8 & 0x80) == 0 || self->_socketError != *((void *)a3 + 8)) {
        goto LABEL_54;
      }
    }
    else if ((v8 & 0x80) != 0)
    {
      goto LABEL_54;
    }
    if ((has & 2) != 0)
    {
      if ((v8 & 2) == 0 || self->_bytesSent != *((void *)a3 + 2)) {
        goto LABEL_54;
      }
    }
    else if ((v8 & 2) != 0)
    {
      goto LABEL_54;
    }
    if ((has & 0x20) != 0)
    {
      if ((v8 & 0x20) == 0 || self->_packetsSent != *((void *)a3 + 6)) {
        goto LABEL_54;
      }
    }
    else if ((v8 & 0x20) != 0)
    {
      goto LABEL_54;
    }
    if (has)
    {
      if ((v8 & 1) == 0 || self->_bytesReceived != *((void *)a3 + 1)) {
        goto LABEL_54;
      }
    }
    else if (v8)
    {
      goto LABEL_54;
    }
    if ((has & 0x10) != 0)
    {
      if ((v8 & 0x10) == 0 || self->_packetsReceived != *((void *)a3 + 5)) {
        goto LABEL_54;
      }
    }
    else if ((v8 & 0x10) != 0)
    {
      goto LABEL_54;
    }
    if ((has & 0x40) != 0)
    {
      if ((v8 & 0x40) == 0 || self->_priority != *((void *)a3 + 7)) {
        goto LABEL_54;
      }
    }
    else if ((v8 & 0x40) != 0)
    {
      goto LABEL_54;
    }
    streamName = self->_streamName;
    if (!((unint64_t)streamName | *((void *)a3 + 12))
      || (int v5 = -[NSString isEqual:](streamName, "isEqual:")) != 0)
    {
      guid = self->_guid;
      if ((unint64_t)guid | *((void *)a3 + 10))
      {
        LOBYTE(v5) = -[NSString isEqual:](guid, "isEqual:");
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_service hash];
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    unint64_t v6 = 2654435761u * self->_isToDefaultPairedDevice;
    if ((has & 4) != 0)
    {
LABEL_6:
      unint64_t v7 = 2654435761u * self->_closeError;
      if ((has & 0x80) != 0) {
        goto LABEL_7;
      }
      goto LABEL_15;
    }
  }
  else
  {
    unint64_t v6 = 0;
    if ((has & 4) != 0) {
      goto LABEL_6;
    }
  }
  unint64_t v7 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_7:
    unint64_t v8 = 2654435761u * self->_socketError;
    if ((has & 2) != 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  unint64_t v8 = 0;
  if ((has & 2) != 0)
  {
LABEL_8:
    unint64_t v9 = 2654435761u * self->_bytesSent;
    if ((has & 0x20) != 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_16:
  unint64_t v9 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_9:
    unint64_t v10 = 2654435761u * self->_packetsSent;
    if (has) {
      goto LABEL_10;
    }
    goto LABEL_18;
  }
LABEL_17:
  unint64_t v10 = 0;
  if (has)
  {
LABEL_10:
    unint64_t v11 = 2654435761u * self->_bytesReceived;
    if ((has & 0x10) != 0) {
      goto LABEL_11;
    }
LABEL_19:
    unint64_t v12 = 0;
    if ((has & 0x40) != 0) {
      goto LABEL_12;
    }
LABEL_20:
    unint64_t v13 = 0;
    goto LABEL_21;
  }
LABEL_18:
  unint64_t v11 = 0;
  if ((has & 0x10) == 0) {
    goto LABEL_19;
  }
LABEL_11:
  unint64_t v12 = 2654435761u * self->_packetsReceived;
  if ((has & 0x40) == 0) {
    goto LABEL_20;
  }
LABEL_12:
  unint64_t v13 = 2654435761u * self->_priority;
LABEL_21:
  NSUInteger v14 = v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ [(NSString *)self->_streamName hash];
  return v14 ^ [(NSString *)self->_guid hash];
}

- (void)mergeFrom:(id)a3
{
  if ((*((_WORD *)a3 + 52) & 0x100) != 0)
  {
    self->_timestamp = *((void *)a3 + 9);
    *(_WORD *)&self->_has |= 0x100u;
  }
  if (*((void *)a3 + 11)) {
    -[AWDIDSLocalDeliverySocketClosed setService:](self, "setService:");
  }
  __int16 v5 = *((_WORD *)a3 + 52);
  if ((v5 & 8) != 0)
  {
    self->_isToDefaultPairedDevice = *((void *)a3 + 4);
    *(_WORD *)&self->_has |= 8u;
    __int16 v5 = *((_WORD *)a3 + 52);
    if ((v5 & 4) == 0)
    {
LABEL_7:
      if ((v5 & 0x80) == 0) {
        goto LABEL_8;
      }
      goto LABEL_22;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_7;
  }
  self->_closeError = *((void *)a3 + 3);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)a3 + 52);
  if ((v5 & 0x80) == 0)
  {
LABEL_8:
    if ((v5 & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_socketError = *((void *)a3 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)a3 + 52);
  if ((v5 & 2) == 0)
  {
LABEL_9:
    if ((v5 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_bytesSent = *((void *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)a3 + 52);
  if ((v5 & 0x20) == 0)
  {
LABEL_10:
    if ((v5 & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_packetsSent = *((void *)a3 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)a3 + 52);
  if ((v5 & 1) == 0)
  {
LABEL_11:
    if ((v5 & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_bytesReceived = *((void *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v5 = *((_WORD *)a3 + 52);
  if ((v5 & 0x10) == 0)
  {
LABEL_12:
    if ((v5 & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_26:
  self->_packetsReceived = *((void *)a3 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  if ((*((_WORD *)a3 + 52) & 0x40) != 0)
  {
LABEL_13:
    self->_priority = *((void *)a3 + 7);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_14:
  if (*((void *)a3 + 12)) {
    -[AWDIDSLocalDeliverySocketClosed setStreamName:](self, "setStreamName:");
  }
  if (*((void *)a3 + 10))
  {
    -[AWDIDSLocalDeliverySocketClosed setGuid:](self, "setGuid:");
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

- (unint64_t)isToDefaultPairedDevice
{
  return self->_isToDefaultPairedDevice;
}

- (unint64_t)closeError
{
  return self->_closeError;
}

- (unint64_t)socketError
{
  return self->_socketError;
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

- (NSString)streamName
{
  return self->_streamName;
}

- (void)setStreamName:(id)a3
{
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
}

@end