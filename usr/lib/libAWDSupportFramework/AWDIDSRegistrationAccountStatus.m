@interface AWDIDSRegistrationAccountStatus
- (BOOL)hasAccountType;
- (BOOL)hasDoesExist;
- (BOOL)hasIsEnabled;
- (BOOL)hasIsUserDisabled;
- (BOOL)hasIsiCloudSignedIn;
- (BOOL)hasIsiTunesSignedIn;
- (BOOL)hasRegistrationError;
- (BOOL)hasRegistrationErrorReason;
- (BOOL)hasRegistrationStatus;
- (BOOL)hasServiceIdentifier;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)serviceIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)accountType;
- (int)registrationError;
- (int)registrationErrorReason;
- (int)registrationStatus;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)doesExist;
- (unsigned)isEnabled;
- (unsigned)isUserDisabled;
- (unsigned)isiCloudSignedIn;
- (unsigned)isiTunesSignedIn;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAccountType:(int)a3;
- (void)setDoesExist:(unsigned int)a3;
- (void)setHasAccountType:(BOOL)a3;
- (void)setHasDoesExist:(BOOL)a3;
- (void)setHasIsEnabled:(BOOL)a3;
- (void)setHasIsUserDisabled:(BOOL)a3;
- (void)setHasIsiCloudSignedIn:(BOOL)a3;
- (void)setHasIsiTunesSignedIn:(BOOL)a3;
- (void)setHasRegistrationError:(BOOL)a3;
- (void)setHasRegistrationErrorReason:(BOOL)a3;
- (void)setHasRegistrationStatus:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setIsEnabled:(unsigned int)a3;
- (void)setIsUserDisabled:(unsigned int)a3;
- (void)setIsiCloudSignedIn:(unsigned int)a3;
- (void)setIsiTunesSignedIn:(unsigned int)a3;
- (void)setRegistrationError:(int)a3;
- (void)setRegistrationErrorReason:(int)a3;
- (void)setRegistrationStatus:(int)a3;
- (void)setServiceIdentifier:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDIDSRegistrationAccountStatus

- (void)dealloc
{
  [(AWDIDSRegistrationAccountStatus *)self setServiceIdentifier:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSRegistrationAccountStatus;
  [(AWDIDSRegistrationAccountStatus *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setAccountType:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_accountType = a3;
}

- (void)setHasAccountType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAccountType
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (BOOL)hasServiceIdentifier
{
  return self->_serviceIdentifier != 0;
}

- (void)setDoesExist:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_doesExist = a3;
}

- (void)setHasDoesExist:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasDoesExist
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setIsEnabled:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_isEnabled = a3;
}

- (void)setHasIsEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasIsEnabled
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setIsUserDisabled:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_isUserDisabled = a3;
}

- (void)setHasIsUserDisabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasIsUserDisabled
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setIsiCloudSignedIn:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_isiCloudSignedIn = a3;
}

- (void)setHasIsiCloudSignedIn:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasIsiCloudSignedIn
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setRegistrationStatus:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_registrationStatus = a3;
}

- (void)setHasRegistrationStatus:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasRegistrationStatus
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setRegistrationError:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_registrationError = a3;
}

- (void)setHasRegistrationError:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRegistrationError
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setRegistrationErrorReason:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_registrationErrorReason = a3;
}

- (void)setHasRegistrationErrorReason:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRegistrationErrorReason
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setIsiTunesSignedIn:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_isiTunesSignedIn = a3;
}

- (void)setHasIsiTunesSignedIn:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasIsiTunesSignedIn
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSRegistrationAccountStatus;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDIDSRegistrationAccountStatus description](&v3, sel_description), -[AWDIDSRegistrationAccountStatus dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    __int16 has = (__int16)self->_has;
  }
  if ((has & 2) != 0) {
    [v3 setObject:[NSNumber numberWithInt:self->_accountType] forKey:@"accountType"];
  }
  serviceIdentifier = self->_serviceIdentifier;
  if (serviceIdentifier) {
    [v3 setObject:serviceIdentifier forKey:@"serviceIdentifier"];
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 4) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_doesExist] forKey:@"doesExist"];
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_9:
      if ((v6 & 0x10) == 0) {
        goto LABEL_10;
      }
      goto LABEL_19;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_9;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_isEnabled] forKey:@"isEnabled"];
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x10) == 0)
  {
LABEL_10:
    if ((v6 & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_isUserDisabled] forKey:@"isUserDisabled"];
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x20) == 0)
  {
LABEL_11:
    if ((v6 & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_21;
  }
LABEL_20:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_isiCloudSignedIn] forKey:@"isiCloudSignedIn"];
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x200) == 0)
  {
LABEL_12:
    if ((v6 & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_22;
  }
LABEL_21:
  [v3 setObject:[NSNumber numberWithInt:self->_registrationStatus] forKey:@"registrationStatus"];
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x80) == 0)
  {
LABEL_13:
    if ((v6 & 0x100) == 0) {
      goto LABEL_14;
    }
LABEL_23:
    [v3 setObject:[NSNumber numberWithInt:self->_registrationErrorReason] forKey:@"registrationErrorReason"];
    if ((*(_WORD *)&self->_has & 0x40) == 0) {
      return v3;
    }
    goto LABEL_15;
  }
LABEL_22:
  [v3 setObject:[NSNumber numberWithInt:self->_registrationError] forKey:@"registrationError"];
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x100) != 0) {
    goto LABEL_23;
  }
LABEL_14:
  if ((v6 & 0x40) != 0) {
LABEL_15:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_isiTunesSignedIn] forKey:@"isiTunesSignedIn"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSRegistrationAccountStatusReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_serviceIdentifier) {
    PBDataWriterWriteStringField();
  }
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 v5 = (__int16)self->_has;
    if ((v5 & 8) == 0)
    {
LABEL_9:
      if ((v5 & 0x10) == 0) {
        goto LABEL_10;
      }
      goto LABEL_18;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint32Field();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x10) == 0)
  {
LABEL_10:
    if ((v5 & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x20) == 0)
  {
LABEL_11:
    if ((v5 & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x200) == 0)
  {
LABEL_12:
    if ((v5 & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteInt32Field();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x80) == 0)
  {
LABEL_13:
    if ((v5 & 0x100) == 0) {
      goto LABEL_14;
    }
LABEL_22:
    PBDataWriterWriteInt32Field();
    if ((*(_WORD *)&self->_has & 0x40) == 0) {
      return;
    }
    goto LABEL_23;
  }
LABEL_21:
  PBDataWriterWriteInt32Field();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x100) != 0) {
    goto LABEL_22;
  }
LABEL_14:
  if ((v5 & 0x40) == 0) {
    return;
  }
LABEL_23:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((_WORD *)a3 + 32) |= 1u;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_accountType;
    *((_WORD *)a3 + 32) |= 2u;
  }
  if (self->_serviceIdentifier) {
    [a3 setServiceIdentifier:];
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 4) != 0)
  {
    *((_DWORD *)a3 + 5) = self->_doesExist;
    *((_WORD *)a3 + 32) |= 4u;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_9:
      if ((v6 & 0x10) == 0) {
        goto LABEL_10;
      }
      goto LABEL_19;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)a3 + 6) = self->_isEnabled;
  *((_WORD *)a3 + 32) |= 8u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x10) == 0)
  {
LABEL_10:
    if ((v6 & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 7) = self->_isUserDisabled;
  *((_WORD *)a3 + 32) |= 0x10u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x20) == 0)
  {
LABEL_11:
    if ((v6 & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)a3 + 8) = self->_isiCloudSignedIn;
  *((_WORD *)a3 + 32) |= 0x20u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x200) == 0)
  {
LABEL_12:
    if ((v6 & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)a3 + 12) = self->_registrationStatus;
  *((_WORD *)a3 + 32) |= 0x200u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x80) == 0)
  {
LABEL_13:
    if ((v6 & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)a3 + 10) = self->_registrationError;
  *((_WORD *)a3 + 32) |= 0x80u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x100) == 0)
  {
LABEL_14:
    if ((v6 & 0x40) == 0) {
      return;
    }
    goto LABEL_15;
  }
LABEL_23:
  *((_DWORD *)a3 + 11) = self->_registrationErrorReason;
  *((_WORD *)a3 + 32) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x40) == 0) {
    return;
  }
LABEL_15:
  *((_DWORD *)a3 + 9) = self->_isiTunesSignedIn;
  *((_WORD *)a3 + 32) |= 0x40u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  uint64_t v6 = v5;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(_WORD *)(v5 + 64) |= 1u;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_accountType;
    *(_WORD *)(v5 + 64) |= 2u;
  }

  *(void *)(v6 + 56) = [(NSString *)self->_serviceIdentifier copyWithZone:a3];
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 4) != 0)
  {
    *(_DWORD *)(v6 + 20) = self->_doesExist;
    *(_WORD *)(v6 + 64) |= 4u;
    __int16 v8 = (__int16)self->_has;
    if ((v8 & 8) == 0)
    {
LABEL_7:
      if ((v8 & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_17;
    }
  }
  else if ((v8 & 8) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v6 + 24) = self->_isEnabled;
  *(_WORD *)(v6 + 64) |= 8u;
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x10) == 0)
  {
LABEL_8:
    if ((v8 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_18;
  }
LABEL_17:
  *(_DWORD *)(v6 + 28) = self->_isUserDisabled;
  *(_WORD *)(v6 + 64) |= 0x10u;
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x20) == 0)
  {
LABEL_9:
    if ((v8 & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_18:
  *(_DWORD *)(v6 + 32) = self->_isiCloudSignedIn;
  *(_WORD *)(v6 + 64) |= 0x20u;
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x200) == 0)
  {
LABEL_10:
    if ((v8 & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_20;
  }
LABEL_19:
  *(_DWORD *)(v6 + 48) = self->_registrationStatus;
  *(_WORD *)(v6 + 64) |= 0x200u;
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x80) == 0)
  {
LABEL_11:
    if ((v8 & 0x100) == 0) {
      goto LABEL_12;
    }
LABEL_21:
    *(_DWORD *)(v6 + 44) = self->_registrationErrorReason;
    *(_WORD *)(v6 + 64) |= 0x100u;
    if ((*(_WORD *)&self->_has & 0x40) == 0) {
      return (id)v6;
    }
    goto LABEL_13;
  }
LABEL_20:
  *(_DWORD *)(v6 + 40) = self->_registrationError;
  *(_WORD *)(v6 + 64) |= 0x80u;
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x100) != 0) {
    goto LABEL_21;
  }
LABEL_12:
  if ((v8 & 0x40) != 0)
  {
LABEL_13:
    *(_DWORD *)(v6 + 36) = self->_isiTunesSignedIn;
    *(_WORD *)(v6 + 64) |= 0x40u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    __int16 has = (__int16)self->_has;
    __int16 v7 = *((_WORD *)a3 + 32);
    if (has)
    {
      if ((v7 & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_54;
      }
    }
    else if (v7)
    {
LABEL_54:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_accountType != *((_DWORD *)a3 + 4)) {
        goto LABEL_54;
      }
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_54;
    }
    serviceIdentifier = self->_serviceIdentifier;
    if ((unint64_t)serviceIdentifier | *((void *)a3 + 7))
    {
      int v5 = -[NSString isEqual:](serviceIdentifier, "isEqual:");
      if (!v5) {
        return v5;
      }
      __int16 has = (__int16)self->_has;
    }
    __int16 v9 = *((_WORD *)a3 + 32);
    if ((has & 4) != 0)
    {
      if ((v9 & 4) == 0 || self->_doesExist != *((_DWORD *)a3 + 5)) {
        goto LABEL_54;
      }
    }
    else if ((v9 & 4) != 0)
    {
      goto LABEL_54;
    }
    if ((has & 8) != 0)
    {
      if ((v9 & 8) == 0 || self->_isEnabled != *((_DWORD *)a3 + 6)) {
        goto LABEL_54;
      }
    }
    else if ((v9 & 8) != 0)
    {
      goto LABEL_54;
    }
    if ((has & 0x10) != 0)
    {
      if ((v9 & 0x10) == 0 || self->_isUserDisabled != *((_DWORD *)a3 + 7)) {
        goto LABEL_54;
      }
    }
    else if ((v9 & 0x10) != 0)
    {
      goto LABEL_54;
    }
    if ((has & 0x20) != 0)
    {
      if ((v9 & 0x20) == 0 || self->_isiCloudSignedIn != *((_DWORD *)a3 + 8)) {
        goto LABEL_54;
      }
    }
    else if ((v9 & 0x20) != 0)
    {
      goto LABEL_54;
    }
    if ((has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 32) & 0x200) == 0 || self->_registrationStatus != *((_DWORD *)a3 + 12)) {
        goto LABEL_54;
      }
    }
    else if ((*((_WORD *)a3 + 32) & 0x200) != 0)
    {
      goto LABEL_54;
    }
    if ((has & 0x80) != 0)
    {
      if ((v9 & 0x80) == 0 || self->_registrationError != *((_DWORD *)a3 + 10)) {
        goto LABEL_54;
      }
    }
    else if ((v9 & 0x80) != 0)
    {
      goto LABEL_54;
    }
    if ((has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 32) & 0x100) == 0 || self->_registrationErrorReason != *((_DWORD *)a3 + 11)) {
        goto LABEL_54;
      }
    }
    else if ((*((_WORD *)a3 + 32) & 0x100) != 0)
    {
      goto LABEL_54;
    }
    LOBYTE(v5) = (v9 & 0x40) == 0;
    if ((has & 0x40) != 0)
    {
      if ((v9 & 0x40) == 0 || self->_isiTunesSignedIn != *((_DWORD *)a3 + 9)) {
        goto LABEL_54;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v4 = 2654435761u * self->_timestamp;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v4 = 0;
    if ((has & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_accountType;
      goto LABEL_6;
    }
  }
  uint64_t v5 = 0;
LABEL_6:
  NSUInteger v6 = [(NSString *)self->_serviceIdentifier hash];
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 4) != 0)
  {
    uint64_t v8 = 2654435761 * self->_doesExist;
    if ((v7 & 8) != 0)
    {
LABEL_8:
      uint64_t v9 = 2654435761 * self->_isEnabled;
      if ((v7 & 0x10) != 0) {
        goto LABEL_9;
      }
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if ((v7 & 8) != 0) {
      goto LABEL_8;
    }
  }
  uint64_t v9 = 0;
  if ((v7 & 0x10) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_isUserDisabled;
    if ((v7 & 0x20) != 0) {
      goto LABEL_10;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v10 = 0;
  if ((v7 & 0x20) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_isiCloudSignedIn;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_11;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v11 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_11:
    uint64_t v12 = 2654435761 * self->_registrationStatus;
    if ((v7 & 0x80) != 0) {
      goto LABEL_12;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v12 = 0;
  if ((v7 & 0x80) != 0)
  {
LABEL_12:
    uint64_t v13 = 2654435761 * self->_registrationError;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_13;
    }
LABEL_21:
    uint64_t v14 = 0;
    if ((v7 & 0x40) != 0) {
      goto LABEL_14;
    }
LABEL_22:
    uint64_t v15 = 0;
    return v5 ^ v4 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v6;
  }
LABEL_20:
  uint64_t v13 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_21;
  }
LABEL_13:
  uint64_t v14 = 2654435761 * self->_registrationErrorReason;
  if ((v7 & 0x40) == 0) {
    goto LABEL_22;
  }
LABEL_14:
  uint64_t v15 = 2654435761 * self->_isiTunesSignedIn;
  return v5 ^ v4 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  __int16 v5 = *((_WORD *)a3 + 32);
  if (v5)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v5 = *((_WORD *)a3 + 32);
  }
  if ((v5 & 2) != 0)
  {
    self->_accountType = *((_DWORD *)a3 + 4);
    *(_WORD *)&self->_has |= 2u;
  }
  if (*((void *)a3 + 7)) {
    -[AWDIDSRegistrationAccountStatus setServiceIdentifier:](self, "setServiceIdentifier:");
  }
  __int16 v6 = *((_WORD *)a3 + 32);
  if ((v6 & 4) != 0)
  {
    self->_doesExist = *((_DWORD *)a3 + 5);
    *(_WORD *)&self->_has |= 4u;
    __int16 v6 = *((_WORD *)a3 + 32);
    if ((v6 & 8) == 0)
    {
LABEL_9:
      if ((v6 & 0x10) == 0) {
        goto LABEL_10;
      }
      goto LABEL_19;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_9;
  }
  self->_isEnabled = *((_DWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 8u;
  __int16 v6 = *((_WORD *)a3 + 32);
  if ((v6 & 0x10) == 0)
  {
LABEL_10:
    if ((v6 & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_isUserDisabled = *((_DWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v6 = *((_WORD *)a3 + 32);
  if ((v6 & 0x20) == 0)
  {
LABEL_11:
    if ((v6 & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_isiCloudSignedIn = *((_DWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v6 = *((_WORD *)a3 + 32);
  if ((v6 & 0x200) == 0)
  {
LABEL_12:
    if ((v6 & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_registrationStatus = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v6 = *((_WORD *)a3 + 32);
  if ((v6 & 0x80) == 0)
  {
LABEL_13:
    if ((v6 & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_registrationError = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v6 = *((_WORD *)a3 + 32);
  if ((v6 & 0x100) == 0)
  {
LABEL_14:
    if ((v6 & 0x40) == 0) {
      return;
    }
    goto LABEL_15;
  }
LABEL_23:
  self->_registrationErrorReason = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x100u;
  if ((*((_WORD *)a3 + 32) & 0x40) == 0) {
    return;
  }
LABEL_15:
  self->_isiTunesSignedIn = *((_DWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x40u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)accountType
{
  return self->_accountType;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
}

- (unsigned)doesExist
{
  return self->_doesExist;
}

- (unsigned)isEnabled
{
  return self->_isEnabled;
}

- (unsigned)isUserDisabled
{
  return self->_isUserDisabled;
}

- (unsigned)isiCloudSignedIn
{
  return self->_isiCloudSignedIn;
}

- (int)registrationStatus
{
  return self->_registrationStatus;
}

- (int)registrationError
{
  return self->_registrationError;
}

- (int)registrationErrorReason
{
  return self->_registrationErrorReason;
}

- (unsigned)isiTunesSignedIn
{
  return self->_isiTunesSignedIn;
}

@end