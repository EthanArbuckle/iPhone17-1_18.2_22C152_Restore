@interface AWDIDSWebTunnelRequestCompleted
- (BOOL)hasDeliveryType;
- (BOOL)hasRequestSize;
- (BOOL)hasReversePushAttempted;
- (BOOL)hasServiceIdentifier;
- (BOOL)hasTimeTaken;
- (BOOL)hasTimestamp;
- (BOOL)hasTunnelError;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)reversePushAttempted;
- (NSString)serviceIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)deliveryType;
- (int)tunnelError;
- (unint64_t)hash;
- (unint64_t)requestSize;
- (unint64_t)timeTaken;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setDeliveryType:(int)a3;
- (void)setHasDeliveryType:(BOOL)a3;
- (void)setHasRequestSize:(BOOL)a3;
- (void)setHasReversePushAttempted:(BOOL)a3;
- (void)setHasTimeTaken:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTunnelError:(BOOL)a3;
- (void)setRequestSize:(unint64_t)a3;
- (void)setReversePushAttempted:(BOOL)a3;
- (void)setServiceIdentifier:(id)a3;
- (void)setTimeTaken:(unint64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTunnelError:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDIDSWebTunnelRequestCompleted

- (void)dealloc
{
  [(AWDIDSWebTunnelRequestCompleted *)self setServiceIdentifier:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSWebTunnelRequestCompleted;
  [(AWDIDSWebTunnelRequestCompleted *)&v3 dealloc];
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

- (BOOL)hasServiceIdentifier
{
  return self->_serviceIdentifier != 0;
}

- (void)setTimeTaken:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_timeTaken = a3;
}

- (void)setHasTimeTaken:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimeTaken
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDeliveryType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_deliveryType = a3;
}

- (void)setHasDeliveryType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDeliveryType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setTunnelError:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_tunnelError = a3;
}

- (void)setHasTunnelError:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTunnelError
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setRequestSize:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_requestSize = a3;
}

- (void)setHasRequestSize:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRequestSize
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setReversePushAttempted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_reversePushAttempted = a3;
}

- (void)setHasReversePushAttempted:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasReversePushAttempted
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSWebTunnelRequestCompleted;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDIDSWebTunnelRequestCompleted description](&v3, sel_description), -[AWDIDSWebTunnelRequestCompleted dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  serviceIdentifier = self->_serviceIdentifier;
  if (serviceIdentifier) {
    [v3 setObject:serviceIdentifier forKey:@"serviceIdentifier"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timeTaken] forKey:@"timeTaken"];
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  [v3 setObject:[NSNumber numberWithInt:self->_deliveryType] forKey:@"deliveryType"];
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 1) == 0) {
      goto LABEL_9;
    }
LABEL_15:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_requestSize] forKey:@"requestSize"];
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      return v3;
    }
    goto LABEL_10;
  }
LABEL_14:
  [v3 setObject:[NSNumber numberWithInt:self->_tunnelError] forKey:@"tunnelError"];
  char has = (char)self->_has;
  if (has) {
    goto LABEL_15;
  }
LABEL_9:
  if ((has & 0x20) != 0) {
LABEL_10:
  }
    [v3 setObject:[NSNumber numberWithBool:self->_reversePushAttempted] forKey:@"reversePushAttempted"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSWebTunnelRequestCompletedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_serviceIdentifier) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 1) == 0) {
      goto LABEL_9;
    }
LABEL_14:
    PBDataWriterWriteUint64Field();
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      return;
    }
    goto LABEL_15;
  }
LABEL_13:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if (has) {
    goto LABEL_14;
  }
LABEL_9:
  if ((has & 0x20) == 0) {
    return;
  }
LABEL_15:

  PBDataWriterWriteBOOLField();
}

- (void)copyTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((void *)a3 + 3) = self->_timestamp;
    *((unsigned char *)a3 + 56) |= 4u;
  }
  if (self->_serviceIdentifier) {
    [a3 setServiceIdentifier:];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)a3 + 2) = self->_timeTaken;
    *((unsigned char *)a3 + 56) |= 2u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)a3 + 8) = self->_deliveryType;
  *((unsigned char *)a3 + 56) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)a3 + 12) = self->_tunnelError;
  *((unsigned char *)a3 + 56) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      return;
    }
    goto LABEL_10;
  }
LABEL_15:
  *((void *)a3 + 1) = self->_requestSize;
  *((unsigned char *)a3 + 56) |= 1u;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    return;
  }
LABEL_10:
  *((unsigned char *)a3 + 52) = self->_reversePushAttempted;
  *((unsigned char *)a3 + 56) |= 0x20u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_timestamp;
    *(unsigned char *)(v5 + 56) |= 4u;
  }

  *(void *)(v6 + 40) = [(NSString *)self->_serviceIdentifier copyWithZone:a3];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v6 + 16) = self->_timeTaken;
    *(unsigned char *)(v6 + 56) |= 2u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 32) = self->_deliveryType;
  *(unsigned char *)(v6 + 56) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
LABEL_13:
    *(void *)(v6 + 8) = self->_requestSize;
    *(unsigned char *)(v6 + 56) |= 1u;
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      return (id)v6;
    }
    goto LABEL_8;
  }
LABEL_12:
  *(_DWORD *)(v6 + 48) = self->_tunnelError;
  *(unsigned char *)(v6 + 56) |= 0x10u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_13;
  }
LABEL_7:
  if ((has & 0x20) != 0)
  {
LABEL_8:
    *(unsigned char *)(v6 + 52) = self->_reversePushAttempted;
    *(unsigned char *)(v6 + 56) |= 0x20u;
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
      if ((*((unsigned char *)a3 + 56) & 4) == 0 || self->_timestamp != *((void *)a3 + 3)) {
        goto LABEL_32;
      }
    }
    else if ((*((unsigned char *)a3 + 56) & 4) != 0)
    {
      goto LABEL_32;
    }
    serviceIdentifier = self->_serviceIdentifier;
    if ((unint64_t)serviceIdentifier | *((void *)a3 + 5))
    {
      int v5 = -[NSString isEqual:](serviceIdentifier, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    if ((has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 56) & 2) == 0 || self->_timeTaken != *((void *)a3 + 2)) {
        goto LABEL_32;
      }
    }
    else if ((*((unsigned char *)a3 + 56) & 2) != 0)
    {
      goto LABEL_32;
    }
    if ((has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 56) & 8) == 0 || self->_deliveryType != *((_DWORD *)a3 + 8)) {
        goto LABEL_32;
      }
    }
    else if ((*((unsigned char *)a3 + 56) & 8) != 0)
    {
      goto LABEL_32;
    }
    if ((has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 56) & 0x10) == 0 || self->_tunnelError != *((_DWORD *)a3 + 12)) {
        goto LABEL_32;
      }
    }
    else if ((*((unsigned char *)a3 + 56) & 0x10) != 0)
    {
      goto LABEL_32;
    }
    if (has)
    {
      if ((*((unsigned char *)a3 + 56) & 1) == 0 || self->_requestSize != *((void *)a3 + 1)) {
        goto LABEL_32;
      }
    }
    else if (*((unsigned char *)a3 + 56))
    {
      goto LABEL_32;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 56) & 0x20) == 0;
    if ((has & 0x20) != 0)
    {
      if ((*((unsigned char *)a3 + 56) & 0x20) == 0)
      {
LABEL_32:
        LOBYTE(v5) = 0;
        return v5;
      }
      if (self->_reversePushAttempted)
      {
        if (!*((unsigned char *)a3 + 52)) {
          goto LABEL_32;
        }
      }
      else if (*((unsigned char *)a3 + 52))
      {
        goto LABEL_32;
      }
      LOBYTE(v5) = 1;
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
  NSUInteger v4 = [(NSString *)self->_serviceIdentifier hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unint64_t v5 = 2654435761u * self->_timeTaken;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_6:
      uint64_t v6 = 2654435761 * self->_deliveryType;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_7;
      }
      goto LABEL_12;
    }
  }
  else
  {
    unint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_7:
    uint64_t v7 = 2654435761 * self->_tunnelError;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_8;
    }
LABEL_13:
    unint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_9;
    }
LABEL_14:
    uint64_t v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_12:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  unint64_t v8 = 2654435761u * self->_requestSize;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_14;
  }
LABEL_9:
  uint64_t v9 = 2654435761 * self->_reversePushAttempted;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  if ((*((unsigned char *)a3 + 56) & 4) != 0)
  {
    self->_timestamp = *((void *)a3 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)a3 + 5)) {
    -[AWDIDSWebTunnelRequestCompleted setServiceIdentifier:](self, "setServiceIdentifier:");
  }
  char v5 = *((unsigned char *)a3 + 56);
  if ((v5 & 2) != 0)
  {
    self->_timeTaken = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)a3 + 56);
    if ((v5 & 8) == 0)
    {
LABEL_7:
      if ((v5 & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)a3 + 56) & 8) == 0)
  {
    goto LABEL_7;
  }
  self->_deliveryType = *((_DWORD *)a3 + 8);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)a3 + 56);
  if ((v5 & 0x10) == 0)
  {
LABEL_8:
    if ((v5 & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_tunnelError = *((_DWORD *)a3 + 12);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)a3 + 56);
  if ((v5 & 1) == 0)
  {
LABEL_9:
    if ((v5 & 0x20) == 0) {
      return;
    }
    goto LABEL_10;
  }
LABEL_15:
  self->_requestSize = *((void *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)a3 + 56) & 0x20) == 0) {
    return;
  }
LABEL_10:
  self->_reversePushAttempted = *((unsigned char *)a3 + 52);
  *(unsigned char *)&self->_has |= 0x20u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
}

- (unint64_t)timeTaken
{
  return self->_timeTaken;
}

- (int)deliveryType
{
  return self->_deliveryType;
}

- (int)tunnelError
{
  return self->_tunnelError;
}

- (unint64_t)requestSize
{
  return self->_requestSize;
}

- (BOOL)reversePushAttempted
{
  return self->_reversePushAttempted;
}

@end