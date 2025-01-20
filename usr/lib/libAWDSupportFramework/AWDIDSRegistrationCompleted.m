@interface AWDIDSRegistrationCompleted
- (BOOL)hasCircleStatus;
- (BOOL)hasRegistrationError;
- (BOOL)hasRegistrationType;
- (BOOL)hasServiceIdentifier;
- (BOOL)hasTimestamp;
- (BOOL)hasWasSuccessful;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)serviceIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)circleStatus;
- (int)registrationError;
- (int)registrationType;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)wasSuccessful;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCircleStatus:(int)a3;
- (void)setHasCircleStatus:(BOOL)a3;
- (void)setHasRegistrationError:(BOOL)a3;
- (void)setHasRegistrationType:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasWasSuccessful:(BOOL)a3;
- (void)setRegistrationError:(int)a3;
- (void)setRegistrationType:(int)a3;
- (void)setServiceIdentifier:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setWasSuccessful:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDIDSRegistrationCompleted

- (void)dealloc
{
  [(AWDIDSRegistrationCompleted *)self setServiceIdentifier:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSRegistrationCompleted;
  [(AWDIDSRegistrationCompleted *)&v3 dealloc];
}

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

- (void)setRegistrationType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_registrationType = a3;
}

- (void)setHasRegistrationType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasRegistrationType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasServiceIdentifier
{
  return self->_serviceIdentifier != 0;
}

- (void)setWasSuccessful:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_wasSuccessful = a3;
}

- (void)setHasWasSuccessful:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasWasSuccessful
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setRegistrationError:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_registrationError = a3;
}

- (void)setHasRegistrationError:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRegistrationError
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCircleStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_circleStatus = a3;
}

- (void)setHasCircleStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCircleStatus
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSRegistrationCompleted;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDIDSRegistrationCompleted description](&v3, sel_description), -[AWDIDSRegistrationCompleted dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
  }
  if ((has & 8) != 0) {
    [v3 setObject:[NSNumber numberWithInt:self->_registrationType] forKey:@"registrationType"];
  }
  serviceIdentifier = self->_serviceIdentifier;
  if (serviceIdentifier) {
    [v3 setObject:serviceIdentifier forKey:@"serviceIdentifier"];
  }
  char v6 = (char)self->_has;
  if ((v6 & 0x10) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_9;
    }
LABEL_13:
    [v3 setObject:[NSNumber numberWithInt:self->_registrationError] forKey:@"registrationError"];
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return v3;
    }
    goto LABEL_10;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wasSuccessful] forKey:@"wasSuccessful"];
  char v6 = (char)self->_has;
  if ((v6 & 4) != 0) {
    goto LABEL_13;
  }
LABEL_9:
  if ((v6 & 2) != 0) {
LABEL_10:
  }
    [v3 setObject:[NSNumber numberWithInt:self->_circleStatus] forKey:@"circleStatus"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSRegistrationCompletedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if ((has & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_serviceIdentifier) {
    PBDataWriterWriteStringField();
  }
  char v5 = (char)self->_has;
  if ((v5 & 0x10) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_9;
    }
LABEL_12:
    PBDataWriterWriteInt32Field();
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return;
    }
    goto LABEL_13;
  }
  PBDataWriterWriteUint32Field();
  char v5 = (char)self->_has;
  if ((v5 & 4) != 0) {
    goto LABEL_12;
  }
LABEL_9:
  if ((v5 & 2) == 0) {
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
    *((unsigned char *)a3 + 44) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_registrationType;
    *((unsigned char *)a3 + 44) |= 8u;
  }
  if (self->_serviceIdentifier) {
    [a3 setServiceIdentifier:];
  }
  char v6 = (char)self->_has;
  if ((v6 & 0x10) != 0)
  {
    *((_DWORD *)a3 + 10) = self->_wasSuccessful;
    *((unsigned char *)a3 + 44) |= 0x10u;
    char v6 = (char)self->_has;
    if ((v6 & 4) == 0)
    {
LABEL_9:
      if ((v6 & 2) == 0) {
        return;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)a3 + 5) = self->_registrationError;
  *((unsigned char *)a3 + 44) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return;
  }
LABEL_10:
  *((_DWORD *)a3 + 4) = self->_circleStatus;
  *((unsigned char *)a3 + 44) |= 2u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 44) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_registrationType;
    *(unsigned char *)(v5 + 44) |= 8u;
  }

  *(void *)(v6 + 32) = [(NSString *)self->_serviceIdentifier copyWithZone:a3];
  char v8 = (char)self->_has;
  if ((v8 & 0x10) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_7;
    }
LABEL_11:
    *(_DWORD *)(v6 + 20) = self->_registrationError;
    *(unsigned char *)(v6 + 44) |= 4u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return (id)v6;
    }
    goto LABEL_8;
  }
  *(_DWORD *)(v6 + 40) = self->_wasSuccessful;
  *(unsigned char *)(v6 + 44) |= 0x10u;
  char v8 = (char)self->_has;
  if ((v8 & 4) != 0) {
    goto LABEL_11;
  }
LABEL_7:
  if ((v8 & 2) != 0)
  {
LABEL_8:
    *(_DWORD *)(v6 + 16) = self->_circleStatus;
    *(unsigned char *)(v6 + 44) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    char has = (char)self->_has;
    if (has)
    {
      if ((*((unsigned char *)a3 + 44) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_29;
      }
    }
    else if (*((unsigned char *)a3 + 44))
    {
LABEL_29:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 8) == 0 || self->_registrationType != *((_DWORD *)a3 + 6)) {
        goto LABEL_29;
      }
    }
    else if ((*((unsigned char *)a3 + 44) & 8) != 0)
    {
      goto LABEL_29;
    }
    serviceIdentifier = self->_serviceIdentifier;
    if ((unint64_t)serviceIdentifier | *((void *)a3 + 4))
    {
      int v5 = -[NSString isEqual:](serviceIdentifier, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    if ((has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 0x10) == 0 || self->_wasSuccessful != *((_DWORD *)a3 + 10)) {
        goto LABEL_29;
      }
    }
    else if ((*((unsigned char *)a3 + 44) & 0x10) != 0)
    {
      goto LABEL_29;
    }
    if ((has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 4) == 0 || self->_registrationError != *((_DWORD *)a3 + 5)) {
        goto LABEL_29;
      }
    }
    else if ((*((unsigned char *)a3 + 44) & 4) != 0)
    {
      goto LABEL_29;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 44) & 2) == 0;
    if ((has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 2) == 0 || self->_circleStatus != *((_DWORD *)a3 + 4)) {
        goto LABEL_29;
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
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_registrationType;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_serviceIdentifier hash];
  if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_8;
    }
LABEL_11:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_9;
    }
LABEL_12:
    uint64_t v8 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v5;
  }
  uint64_t v6 = 2654435761 * self->_wasSuccessful;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_11;
  }
LABEL_8:
  uint64_t v7 = 2654435761 * self->_registrationError;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_12;
  }
LABEL_9:
  uint64_t v8 = 2654435761 * self->_circleStatus;
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  char v5 = *((unsigned char *)a3 + 44);
  if (v5)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)a3 + 44);
  }
  if ((v5 & 8) != 0)
  {
    self->_registrationType = *((_DWORD *)a3 + 6);
    *(unsigned char *)&self->_has |= 8u;
  }
  if (*((void *)a3 + 4)) {
    -[AWDIDSRegistrationCompleted setServiceIdentifier:](self, "setServiceIdentifier:");
  }
  char v6 = *((unsigned char *)a3 + 44);
  if ((v6 & 0x10) != 0)
  {
    self->_wasSuccessful = *((_DWORD *)a3 + 10);
    *(unsigned char *)&self->_has |= 0x10u;
    char v6 = *((unsigned char *)a3 + 44);
    if ((v6 & 4) == 0)
    {
LABEL_9:
      if ((v6 & 2) == 0) {
        return;
      }
      goto LABEL_10;
    }
  }
  else if ((*((unsigned char *)a3 + 44) & 4) == 0)
  {
    goto LABEL_9;
  }
  self->_registrationError = *((_DWORD *)a3 + 5);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)a3 + 44) & 2) == 0) {
    return;
  }
LABEL_10:
  self->_circleStatus = *((_DWORD *)a3 + 4);
  *(unsigned char *)&self->_has |= 2u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)registrationType
{
  return self->_registrationType;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
}

- (unsigned)wasSuccessful
{
  return self->_wasSuccessful;
}

- (int)registrationError
{
  return self->_registrationError;
}

- (int)circleStatus
{
  return self->_circleStatus;
}

@end