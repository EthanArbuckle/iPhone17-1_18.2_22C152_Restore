@interface AWDIDSRegistrationControlChosen
- (BOOL)hasIsInterestingRegion;
- (BOOL)hasRegistrationControlStatus;
- (BOOL)hasRegistrationType;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInterestingRegion;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)registrationControlStatus;
- (int)registrationType;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsInterestingRegion:(BOOL)a3;
- (void)setHasRegistrationControlStatus:(BOOL)a3;
- (void)setHasRegistrationType:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setIsInterestingRegion:(BOOL)a3;
- (void)setRegistrationControlStatus:(int)a3;
- (void)setRegistrationType:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDIDSRegistrationControlChosen

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
  *(unsigned char *)&self->_has |= 4u;
  self->_registrationType = a3;
}

- (void)setHasRegistrationType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRegistrationType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setRegistrationControlStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_registrationControlStatus = a3;
}

- (void)setHasRegistrationControlStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRegistrationControlStatus
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsInterestingRegion:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_isInterestingRegion = a3;
}

- (void)setHasIsInterestingRegion:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsInterestingRegion
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSRegistrationControlChosen;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDIDSRegistrationControlChosen description](&v3, sel_description), -[AWDIDSRegistrationControlChosen dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      [v3 setObject:[NSNumber numberWithInt:self->_registrationControlStatus] forKey:@"registrationControlStatus"];
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        return v3;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithInt:self->_registrationType] forKey:@"registrationType"];
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 8) != 0) {
LABEL_5:
  }
    [v3 setObject:[NSNumber numberWithBool:self->_isInterestingRegion] forKey:@"isInterestingRegion"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSRegistrationControlChosenReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
LABEL_8:
      PBDataWriterWriteInt32Field();
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_8;
  }
LABEL_4:
  if ((has & 8) == 0) {
    return;
  }
LABEL_9:

  PBDataWriterWriteBOOLField();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 28) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 5) = self->_registrationType;
  *((unsigned char *)a3 + 28) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      return;
    }
LABEL_9:
    *((unsigned char *)a3 + 24) = self->_isInterestingRegion;
    *((unsigned char *)a3 + 28) |= 8u;
    return;
  }
LABEL_8:
  *((_DWORD *)a3 + 4) = self->_registrationControlStatus;
  *((unsigned char *)a3 + 28) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    goto LABEL_9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((unsigned char *)result + 28) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_registrationType;
  *((unsigned char *)result + 28) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 4) = self->_registrationControlStatus;
  *((unsigned char *)result + 28) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    return result;
  }
LABEL_5:
  *((unsigned char *)result + 24) = self->_isInterestingRegion;
  *((unsigned char *)result + 28) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 28) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_19;
      }
    }
    else if (*((unsigned char *)a3 + 28))
    {
      goto LABEL_19;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 28) & 4) == 0 || self->_registrationType != *((_DWORD *)a3 + 5)) {
        goto LABEL_19;
      }
    }
    else if ((*((unsigned char *)a3 + 28) & 4) != 0)
    {
      goto LABEL_19;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 28) & 2) == 0 || self->_registrationControlStatus != *((_DWORD *)a3 + 4)) {
        goto LABEL_19;
      }
    }
    else if ((*((unsigned char *)a3 + 28) & 2) != 0)
    {
      goto LABEL_19;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 28) & 8) == 0;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 28) & 8) == 0)
      {
LABEL_19:
        LOBYTE(v5) = 0;
        return v5;
      }
      if (self->_isInterestingRegion)
      {
        if (!*((unsigned char *)a3 + 24)) {
          goto LABEL_19;
        }
      }
      else if (*((unsigned char *)a3 + 24))
      {
        goto LABEL_19;
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
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_registrationType;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_registrationControlStatus;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_isInterestingRegion;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 28);
  if (v3)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v3 = *((unsigned char *)a3 + 28);
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else if ((*((unsigned char *)a3 + 28) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_registrationType = *((_DWORD *)a3 + 5);
  *(unsigned char *)&self->_has |= 4u;
  char v3 = *((unsigned char *)a3 + 28);
  if ((v3 & 2) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0) {
      return;
    }
LABEL_9:
    self->_isInterestingRegion = *((unsigned char *)a3 + 24);
    *(unsigned char *)&self->_has |= 8u;
    return;
  }
LABEL_8:
  self->_registrationControlStatus = *((_DWORD *)a3 + 4);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)a3 + 28) & 8) != 0) {
    goto LABEL_9;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)registrationType
{
  return self->_registrationType;
}

- (int)registrationControlStatus
{
  return self->_registrationControlStatus;
}

- (BOOL)isInterestingRegion
{
  return self->_isInterestingRegion;
}

@end