@interface AWDIDSLocalDeliveryAppLevelAck
- (BOOL)hasIsToDefaultPairedDevice;
- (BOOL)hasLinkType;
- (BOOL)hasPriority;
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
- (unint64_t)linkType;
- (unint64_t)priority;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasIsToDefaultPairedDevice:(BOOL)a3;
- (void)setHasLinkType:(BOOL)a3;
- (void)setHasPriority:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setIsToDefaultPairedDevice:(unint64_t)a3;
- (void)setLinkType:(unint64_t)a3;
- (void)setPriority:(unint64_t)a3;
- (void)setService:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDIDSLocalDeliveryAppLevelAck

- (void)dealloc
{
  [(AWDIDSLocalDeliveryAppLevelAck *)self setService:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSLocalDeliveryAppLevelAck;
  [(AWDIDSLocalDeliveryAppLevelAck *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
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

- (void)setLinkType:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_linkType = a3;
}

- (void)setHasLinkType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLinkType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
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
  v3.super_class = (Class)AWDIDSLocalDeliveryAppLevelAck;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDIDSLocalDeliveryAppLevelAck description](&v3, sel_description), -[AWDIDSLocalDeliveryAppLevelAck dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  service = self->_service;
  if (service) {
    [v3 setObject:service forKey:@"service"];
  }
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_7;
    }
LABEL_11:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_linkType] forKey:@"linkType"];
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return v3;
    }
    goto LABEL_8;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_isToDefaultPairedDevice] forKey:@"isToDefaultPairedDevice"];
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_11;
  }
LABEL_7:
  if ((has & 4) != 0) {
LABEL_8:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_priority] forKey:@"priority"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSLocalDeliveryAppLevelAckReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_service) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_7;
    }
LABEL_10:
    PBDataWriterWriteUint64Field();
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return;
    }
    goto LABEL_11;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_10;
  }
LABEL_7:
  if ((has & 4) == 0) {
    return;
  }
LABEL_11:

  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((void *)a3 + 4) = self->_timestamp;
    *((unsigned char *)a3 + 48) |= 8u;
  }
  if (self->_service) {
    [a3 setService:];
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_isToDefaultPairedDevice;
    *((unsigned char *)a3 + 48) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        return;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((void *)a3 + 2) = self->_linkType;
  *((unsigned char *)a3 + 48) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return;
  }
LABEL_8:
  *((void *)a3 + 3) = self->_priority;
  *((unsigned char *)a3 + 48) |= 4u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(void *)(v5 + 32) = self->_timestamp;
    *(unsigned char *)(v5 + 48) |= 8u;
  }

  *(void *)(v6 + 40) = [(NSString *)self->_service copyWithZone:a3];
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_5;
    }
LABEL_9:
    *(void *)(v6 + 16) = self->_linkType;
    *(unsigned char *)(v6 + 48) |= 2u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return (id)v6;
    }
    goto LABEL_6;
  }
  *(void *)(v6 + 8) = self->_isToDefaultPairedDevice;
  *(unsigned char *)(v6 + 48) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_9;
  }
LABEL_5:
  if ((has & 4) != 0)
  {
LABEL_6:
    *(void *)(v6 + 24) = self->_priority;
    *(unsigned char *)(v6 + 48) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    char has = (char)self->_has;
    if ((has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 8) == 0 || self->_timestamp != *((void *)a3 + 4)) {
        goto LABEL_24;
      }
    }
    else if ((*((unsigned char *)a3 + 48) & 8) != 0)
    {
LABEL_24:
      LOBYTE(v5) = 0;
      return v5;
    }
    service = self->_service;
    if ((unint64_t)service | *((void *)a3 + 5))
    {
      int v5 = -[NSString isEqual:](service, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    if (has)
    {
      if ((*((unsigned char *)a3 + 48) & 1) == 0 || self->_isToDefaultPairedDevice != *((void *)a3 + 1)) {
        goto LABEL_24;
      }
    }
    else if (*((unsigned char *)a3 + 48))
    {
      goto LABEL_24;
    }
    if ((has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 2) == 0 || self->_linkType != *((void *)a3 + 2)) {
        goto LABEL_24;
      }
    }
    else if ((*((unsigned char *)a3 + 48) & 2) != 0)
    {
      goto LABEL_24;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 48) & 4) == 0;
    if ((has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 4) == 0 || self->_priority != *((void *)a3 + 3)) {
        goto LABEL_24;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_service hash];
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    unint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    unint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_7;
    }
LABEL_10:
    unint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  unint64_t v5 = 2654435761u * self->_isToDefaultPairedDevice;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  unint64_t v6 = 2654435761u * self->_linkType;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  unint64_t v7 = 2654435761u * self->_priority;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  if ((*((unsigned char *)a3 + 48) & 8) != 0)
  {
    self->_timestamp = *((void *)a3 + 4);
    *(unsigned char *)&self->_has |= 8u;
  }
  if (*((void *)a3 + 5)) {
    -[AWDIDSLocalDeliveryAppLevelAck setService:](self, "setService:");
  }
  char v5 = *((unsigned char *)a3 + 48);
  if (v5)
  {
    self->_isToDefaultPairedDevice = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)a3 + 48);
    if ((v5 & 2) == 0)
    {
LABEL_7:
      if ((v5 & 4) == 0) {
        return;
      }
      goto LABEL_8;
    }
  }
  else if ((*((unsigned char *)a3 + 48) & 2) == 0)
  {
    goto LABEL_7;
  }
  self->_linkType = *((void *)a3 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)a3 + 48) & 4) == 0) {
    return;
  }
LABEL_8:
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

- (unint64_t)linkType
{
  return self->_linkType;
}

- (unint64_t)priority
{
  return self->_priority;
}

@end