@interface AWDIDSAppDeliveryReceipt
- (BOOL)hasIsToDefaultPairedDevice;
- (BOOL)hasMessageSize;
- (BOOL)hasPriority;
- (BOOL)hasRTT;
- (BOOL)hasService;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)service;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)isToDefaultPairedDevice;
- (unint64_t)messageSize;
- (unint64_t)priority;
- (unint64_t)rTT;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasIsToDefaultPairedDevice:(BOOL)a3;
- (void)setHasMessageSize:(BOOL)a3;
- (void)setHasPriority:(BOOL)a3;
- (void)setHasRTT:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setIsToDefaultPairedDevice:(unint64_t)a3;
- (void)setMessageSize:(unint64_t)a3;
- (void)setPriority:(unint64_t)a3;
- (void)setRTT:(unint64_t)a3;
- (void)setService:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDIDSAppDeliveryReceipt

- (void)dealloc
{
  [(AWDIDSAppDeliveryReceipt *)self setService:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSAppDeliveryReceipt;
  [(AWDIDSAppDeliveryReceipt *)&v3 dealloc];
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

- (void)setMessageSize:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_messageSize = a3;
}

- (void)setHasMessageSize:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMessageSize
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRTT:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_rTT = a3;
}

- (void)setHasRTT:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasRTT
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

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSAppDeliveryReceipt;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDIDSAppDeliveryReceipt description](&v3, sel_description), -[AWDIDSAppDeliveryReceipt dictionaryRepresentation](self, "dictionaryRepresentation")];
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
LABEL_13:
      [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rTT] forKey:@"RTT"];
      if ((*(unsigned char *)&self->_has & 4) == 0) {
        return v3;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_messageSize] forKey:@"messageSize"];
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_13;
  }
LABEL_8:
  if ((has & 4) != 0) {
LABEL_9:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_priority] forKey:@"priority"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSAppDeliveryReceiptReadFrom((uint64_t)self, (uint64_t)a3);
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
LABEL_12:
      PBDataWriterWriteUint64Field();
      if ((*(unsigned char *)&self->_has & 4) == 0) {
        return;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_12;
  }
LABEL_8:
  if ((has & 4) == 0) {
    return;
  }
LABEL_13:

  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *((void *)a3 + 5) = self->_timestamp;
    *((unsigned char *)a3 + 56) |= 0x10u;
  }
  if (self->_service) {
    [a3 setService:];
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_isToDefaultPairedDevice;
    *((unsigned char *)a3 + 56) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((void *)a3 + 2) = self->_messageSize;
  *((unsigned char *)a3 + 56) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      return;
    }
    goto LABEL_9;
  }
LABEL_13:
  *((void *)a3 + 4) = self->_rTT;
  *((unsigned char *)a3 + 56) |= 8u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return;
  }
LABEL_9:
  *((void *)a3 + 3) = self->_priority;
  *((unsigned char *)a3 + 56) |= 4u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [objc_opt_class() allocWithZone:a3];
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(void *)(v5 + 40) = self->_timestamp;
    *(unsigned char *)(v5 + 56) |= 0x10u;
  }

  *(void *)(v6 + 48) = [(NSString *)self->_service copyWithZone:a3];
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v6 + 8) = self->_isToDefaultPairedDevice;
    *(unsigned char *)(v6 + 56) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 8) == 0) {
        goto LABEL_6;
      }
LABEL_11:
      *(void *)(v6 + 32) = self->_rTT;
      *(unsigned char *)(v6 + 56) |= 8u;
      if ((*(unsigned char *)&self->_has & 4) == 0) {
        return (id)v6;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *(void *)(v6 + 16) = self->_messageSize;
  *(unsigned char *)(v6 + 56) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_11;
  }
LABEL_6:
  if ((has & 4) != 0)
  {
LABEL_7:
    *(void *)(v6 + 24) = self->_priority;
    *(unsigned char *)(v6 + 56) |= 4u;
  }
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
      if ((*((unsigned char *)a3 + 56) & 0x10) == 0 || self->_timestamp != *((void *)a3 + 5)) {
        goto LABEL_29;
      }
    }
    else if ((*((unsigned char *)a3 + 56) & 0x10) != 0)
    {
LABEL_29:
      LOBYTE(v5) = 0;
      return v5;
    }
    service = self->_service;
    if ((unint64_t)service | *((void *)a3 + 6))
    {
      int v5 = -[NSString isEqual:](service, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    if (has)
    {
      if ((*((unsigned char *)a3 + 56) & 1) == 0 || self->_isToDefaultPairedDevice != *((void *)a3 + 1)) {
        goto LABEL_29;
      }
    }
    else if (*((unsigned char *)a3 + 56))
    {
      goto LABEL_29;
    }
    if ((has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 56) & 2) == 0 || self->_messageSize != *((void *)a3 + 2)) {
        goto LABEL_29;
      }
    }
    else if ((*((unsigned char *)a3 + 56) & 2) != 0)
    {
      goto LABEL_29;
    }
    if ((has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 56) & 8) == 0 || self->_rTT != *((void *)a3 + 4)) {
        goto LABEL_29;
      }
    }
    else if ((*((unsigned char *)a3 + 56) & 8) != 0)
    {
      goto LABEL_29;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 56) & 4) == 0;
    if ((has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 56) & 4) == 0 || self->_priority != *((void *)a3 + 3)) {
        goto LABEL_29;
      }
      LOBYTE(v5) = 1;
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
      unint64_t v6 = 2654435761u * self->_messageSize;
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
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
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
  unint64_t v7 = 2654435761u * self->_rTT;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_12;
  }
LABEL_8:
  unint64_t v8 = 2654435761u * self->_priority;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  if ((*((unsigned char *)a3 + 56) & 0x10) != 0)
  {
    self->_timestamp = *((void *)a3 + 5);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  if (*((void *)a3 + 6)) {
    -[AWDIDSAppDeliveryReceipt setService:](self, "setService:");
  }
  char v5 = *((unsigned char *)a3 + 56);
  if (v5)
  {
    self->_isToDefaultPairedDevice = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)a3 + 56);
    if ((v5 & 2) == 0)
    {
LABEL_7:
      if ((v5 & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)a3 + 56) & 2) == 0)
  {
    goto LABEL_7;
  }
  self->_messageSize = *((void *)a3 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)a3 + 56);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 4) == 0) {
      return;
    }
    goto LABEL_9;
  }
LABEL_13:
  self->_rTT = *((void *)a3 + 4);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)a3 + 56) & 4) == 0) {
    return;
  }
LABEL_9:
  self->_priority = *((void *)a3 + 3);
  *(unsigned char *)&self->_has |= 4u;
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

- (unint64_t)messageSize
{
  return self->_messageSize;
}

- (unint64_t)rTT
{
  return self->_rTT;
}

- (unint64_t)priority
{
  return self->_priority;
}

@end