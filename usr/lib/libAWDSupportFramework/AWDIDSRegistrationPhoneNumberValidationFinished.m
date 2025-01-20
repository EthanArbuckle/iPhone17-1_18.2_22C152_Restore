@interface AWDIDSRegistrationPhoneNumberValidationFinished
- (BOOL)hasGuid;
- (BOOL)hasNumberOfSMSSent;
- (BOOL)hasRegistrationError;
- (BOOL)hasTimestamp;
- (BOOL)hasValidationDuration;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)guid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)registrationError;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)numberOfSMSSent;
- (unsigned)validationDuration;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setGuid:(id)a3;
- (void)setHasNumberOfSMSSent:(BOOL)a3;
- (void)setHasRegistrationError:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasValidationDuration:(BOOL)a3;
- (void)setNumberOfSMSSent:(unsigned int)a3;
- (void)setRegistrationError:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setValidationDuration:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDIDSRegistrationPhoneNumberValidationFinished

- (void)dealloc
{
  [(AWDIDSRegistrationPhoneNumberValidationFinished *)self setGuid:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSRegistrationPhoneNumberValidationFinished;
  [(AWDIDSRegistrationPhoneNumberValidationFinished *)&v3 dealloc];
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

- (BOOL)hasGuid
{
  return self->_guid != 0;
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

- (void)setValidationDuration:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_validationDuration = a3;
}

- (void)setHasValidationDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasValidationDuration
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setNumberOfSMSSent:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_numberOfSMSSent = a3;
}

- (void)setHasNumberOfSMSSent:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumberOfSMSSent
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSRegistrationPhoneNumberValidationFinished;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDIDSRegistrationPhoneNumberValidationFinished description](&v3, sel_description), -[AWDIDSRegistrationPhoneNumberValidationFinished dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  guid = self->_guid;
  if (guid) {
    [v3 setObject:guid forKey:@"guid"];
  }
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_7;
    }
LABEL_11:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_validationDuration] forKey:@"validationDuration"];
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return v3;
    }
    goto LABEL_8;
  }
  [v3 setObject:[NSNumber numberWithInt:self->_registrationError] forKey:@"registrationError"];
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_11;
  }
LABEL_7:
  if ((has & 2) != 0) {
LABEL_8:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_numberOfSMSSent] forKey:@"numberOfSMSSent"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSRegistrationPhoneNumberValidationFinishedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_guid) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_7;
    }
LABEL_10:
    PBDataWriterWriteUint32Field();
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return;
    }
    goto LABEL_11;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_10;
  }
LABEL_7:
  if ((has & 2) == 0) {
    return;
  }
LABEL_11:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 36) |= 1u;
  }
  if (self->_guid) {
    [a3 setGuid:];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 7) = self->_registrationError;
    *((unsigned char *)a3 + 36) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 2) == 0) {
        return;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)a3 + 8) = self->_validationDuration;
  *((unsigned char *)a3 + 36) |= 8u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return;
  }
LABEL_8:
  *((_DWORD *)a3 + 6) = self->_numberOfSMSSent;
  *((unsigned char *)a3 + 36) |= 2u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 36) |= 1u;
  }

  *(void *)(v6 + 16) = [(NSString *)self->_guid copyWithZone:a3];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_5;
    }
LABEL_9:
    *(_DWORD *)(v6 + 32) = self->_validationDuration;
    *(unsigned char *)(v6 + 36) |= 8u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return (id)v6;
    }
    goto LABEL_6;
  }
  *(_DWORD *)(v6 + 28) = self->_registrationError;
  *(unsigned char *)(v6 + 36) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_9;
  }
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    *(_DWORD *)(v6 + 24) = self->_numberOfSMSSent;
    *(unsigned char *)(v6 + 36) |= 2u;
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
      if ((*((unsigned char *)a3 + 36) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_24;
      }
    }
    else if (*((unsigned char *)a3 + 36))
    {
LABEL_24:
      LOBYTE(v5) = 0;
      return v5;
    }
    guid = self->_guid;
    if ((unint64_t)guid | *((void *)a3 + 2))
    {
      int v5 = -[NSString isEqual:](guid, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    if ((has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 4) == 0 || self->_registrationError != *((_DWORD *)a3 + 7)) {
        goto LABEL_24;
      }
    }
    else if ((*((unsigned char *)a3 + 36) & 4) != 0)
    {
      goto LABEL_24;
    }
    if ((has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 8) == 0 || self->_validationDuration != *((_DWORD *)a3 + 8)) {
        goto LABEL_24;
      }
    }
    else if ((*((unsigned char *)a3 + 36) & 8) != 0)
    {
      goto LABEL_24;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 36) & 2) == 0;
    if ((has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 2) == 0 || self->_numberOfSMSSent != *((_DWORD *)a3 + 6)) {
        goto LABEL_24;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_guid hash];
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  uint64_t v5 = 2654435761 * self->_registrationError;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_validationDuration;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_numberOfSMSSent;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 36))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 2)) {
    -[AWDIDSRegistrationPhoneNumberValidationFinished setGuid:](self, "setGuid:");
  }
  char v5 = *((unsigned char *)a3 + 36);
  if ((v5 & 4) != 0)
  {
    self->_registrationError = *((_DWORD *)a3 + 7);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)a3 + 36);
    if ((v5 & 8) == 0)
    {
LABEL_7:
      if ((v5 & 2) == 0) {
        return;
      }
      goto LABEL_8;
    }
  }
  else if ((*((unsigned char *)a3 + 36) & 8) == 0)
  {
    goto LABEL_7;
  }
  self->_validationDuration = *((_DWORD *)a3 + 8);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)a3 + 36) & 2) == 0) {
    return;
  }
LABEL_8:
  self->_numberOfSMSSent = *((_DWORD *)a3 + 6);
  *(unsigned char *)&self->_has |= 2u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
}

- (int)registrationError
{
  return self->_registrationError;
}

- (unsigned)validationDuration
{
  return self->_validationDuration;
}

- (unsigned)numberOfSMSSent
{
  return self->_numberOfSMSSent;
}

@end