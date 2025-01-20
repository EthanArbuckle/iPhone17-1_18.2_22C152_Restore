@interface AWDIDSLocalDeliverySocketOpened
- (BOOL)hasGuid;
- (BOOL)hasIsToDefaultPairedDevice;
- (BOOL)hasOpenError;
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
- (unint64_t)hash;
- (unint64_t)isToDefaultPairedDevice;
- (unint64_t)openError;
- (unint64_t)priority;
- (unint64_t)socketError;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setGuid:(id)a3;
- (void)setHasIsToDefaultPairedDevice:(BOOL)a3;
- (void)setHasOpenError:(BOOL)a3;
- (void)setHasPriority:(BOOL)a3;
- (void)setHasSocketError:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setIsToDefaultPairedDevice:(unint64_t)a3;
- (void)setOpenError:(unint64_t)a3;
- (void)setPriority:(unint64_t)a3;
- (void)setService:(id)a3;
- (void)setSocketError:(unint64_t)a3;
- (void)setStreamName:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDIDSLocalDeliverySocketOpened

- (void)dealloc
{
  [(AWDIDSLocalDeliverySocketOpened *)self setService:0];
  [(AWDIDSLocalDeliverySocketOpened *)self setStreamName:0];
  [(AWDIDSLocalDeliverySocketOpened *)self setGuid:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSLocalDeliverySocketOpened;
  [(AWDIDSLocalDeliverySocketOpened *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasService
{
  return self->_service != 0;
}

- (void)setIsToDefaultPairedDevice:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isToDefaultPairedDevice = a3;
}

- (void)setHasIsToDefaultPairedDevice:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsToDefaultPairedDevice
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setOpenError:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_openError = a3;
}

- (void)setHasOpenError:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOpenError
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSocketError:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_socketError = a3;
}

- (void)setHasSocketError:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSocketError
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setPriority:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_priority = a3;
}

- (void)setHasPriority:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPriority
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
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
  v3.super_class = (Class)AWDIDSLocalDeliverySocketOpened;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDIDSLocalDeliverySocketOpened description](&v3, sel_description), -[AWDIDSLocalDeliverySocketOpened dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  service = self->_service;
  if (service) {
    [v3 setObject:service forKey:@"service"];
  }
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_isToDefaultPairedDevice] forKey:@"isToDefaultPairedDevice"];
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_openError] forKey:@"openError"];
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_17:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_socketError] forKey:@"socketError"];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_9:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_priority] forKey:@"priority"];
LABEL_10:
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
  return AWDIDSLocalDeliverySocketOpenedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_service) {
    PBDataWriterWriteStringField();
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
        goto LABEL_8;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_18:
  PBDataWriterWriteUint64Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_9:
  }
    PBDataWriterWriteUint64Field();
LABEL_10:
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
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *((void *)a3 + 5) = self->_timestamp;
    *((unsigned char *)a3 + 72) |= 0x10u;
  }
  if (self->_service) {
    [a3 setService:];
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_isToDefaultPairedDevice;
    *((unsigned char *)a3 + 72) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((void *)a3 + 2) = self->_openError;
  *((unsigned char *)a3 + 72) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_18:
  *((void *)a3 + 4) = self->_socketError;
  *((unsigned char *)a3 + 72) |= 8u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_9:
    *((void *)a3 + 3) = self->_priority;
    *((unsigned char *)a3 + 72) |= 4u;
  }
LABEL_10:
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
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(void *)(v5 + 40) = self->_timestamp;
    *(unsigned char *)(v5 + 72) |= 0x10u;
  }

  *(void *)(v6 + 56) = [(NSString *)self->_service copyWithZone:a3];
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v6 + 8) = self->_isToDefaultPairedDevice;
    *(unsigned char *)(v6 + 72) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 8) == 0) {
        goto LABEL_6;
      }
LABEL_11:
      *(void *)(v6 + 32) = self->_socketError;
      *(unsigned char *)(v6 + 72) |= 8u;
      if ((*(unsigned char *)&self->_has & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *(void *)(v6 + 16) = self->_openError;
  *(unsigned char *)(v6 + 72) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_11;
  }
LABEL_6:
  if ((has & 4) != 0)
  {
LABEL_7:
    *(void *)(v6 + 24) = self->_priority;
    *(unsigned char *)(v6 + 72) |= 4u;
  }
LABEL_8:

  *(void *)(v6 + 64) = [(NSString *)self->_streamName copyWithZone:a3];
  *(void *)(v6 + 48) = [(NSString *)self->_guid copyWithZone:a3];
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    char has = (char)self->_has;
    if ((has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 0x10) == 0 || self->_timestamp != *((void *)a3 + 5)) {
        goto LABEL_34;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 0x10) != 0)
    {
LABEL_34:
      LOBYTE(v5) = 0;
      return v5;
    }
    service = self->_service;
    if ((unint64_t)service | *((void *)a3 + 7))
    {
      int v5 = -[NSString isEqual:](service, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    if (has)
    {
      if ((*((unsigned char *)a3 + 72) & 1) == 0 || self->_isToDefaultPairedDevice != *((void *)a3 + 1)) {
        goto LABEL_34;
      }
    }
    else if (*((unsigned char *)a3 + 72))
    {
      goto LABEL_34;
    }
    if ((has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 2) == 0 || self->_openError != *((void *)a3 + 2)) {
        goto LABEL_34;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 2) != 0)
    {
      goto LABEL_34;
    }
    if ((has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 8) == 0 || self->_socketError != *((void *)a3 + 4)) {
        goto LABEL_34;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 8) != 0)
    {
      goto LABEL_34;
    }
    if ((has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 4) == 0 || self->_priority != *((void *)a3 + 3)) {
        goto LABEL_34;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 4) != 0)
    {
      goto LABEL_34;
    }
    streamName = self->_streamName;
    if (!((unint64_t)streamName | *((void *)a3 + 8))
      || (int v5 = -[NSString isEqual:](streamName, "isEqual:")) != 0)
    {
      guid = self->_guid;
      if ((unint64_t)guid | *((void *)a3 + 6))
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
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_service hash];
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v5 = 2654435761u * self->_isToDefaultPairedDevice;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_6:
      unint64_t v6 = 2654435761u * self->_openError;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_7;
      }
LABEL_11:
      unint64_t v7 = 0;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_8;
      }
LABEL_12:
      unint64_t v8 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    unint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
  }
  unint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_11;
  }
LABEL_7:
  unint64_t v7 = 2654435761u * self->_socketError;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_12;
  }
LABEL_8:
  unint64_t v8 = 2654435761u * self->_priority;
LABEL_13:
  NSUInteger v9 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(NSString *)self->_streamName hash];
  return v9 ^ [(NSString *)self->_guid hash];
}

- (void)mergeFrom:(id)a3
{
  if ((*((unsigned char *)a3 + 72) & 0x10) != 0)
  {
    self->_timestamp = *((void *)a3 + 5);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  if (*((void *)a3 + 7)) {
    -[AWDIDSLocalDeliverySocketOpened setService:](self, "setService:");
  }
  char v5 = *((unsigned char *)a3 + 72);
  if (v5)
  {
    self->_isToDefaultPairedDevice = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)a3 + 72);
    if ((v5 & 2) == 0)
    {
LABEL_7:
      if ((v5 & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)a3 + 72) & 2) == 0)
  {
    goto LABEL_7;
  }
  self->_openError = *((void *)a3 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)a3 + 72);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_18:
  self->_socketError = *((void *)a3 + 4);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)a3 + 72) & 4) != 0)
  {
LABEL_9:
    self->_priority = *((void *)a3 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_10:
  if (*((void *)a3 + 8)) {
    -[AWDIDSLocalDeliverySocketOpened setStreamName:](self, "setStreamName:");
  }
  if (*((void *)a3 + 6))
  {
    -[AWDIDSLocalDeliverySocketOpened setGuid:](self, "setGuid:");
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

- (unint64_t)openError
{
  return self->_openError;
}

- (unint64_t)socketError
{
  return self->_socketError;
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