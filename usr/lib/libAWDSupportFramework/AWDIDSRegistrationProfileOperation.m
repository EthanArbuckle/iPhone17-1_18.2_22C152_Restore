@interface AWDIDSRegistrationProfileOperation
- (BOOL)hasConnectionType;
- (BOOL)hasGenericError;
- (BOOL)hasGuid;
- (BOOL)hasPOSIXError;
- (BOOL)hasRegistrationError;
- (BOOL)hasResultCode;
- (BOOL)hasSuccess;
- (BOOL)hasTimestamp;
- (BOOL)hasURLError;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)guid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)genericError;
- (int)pOSIXError;
- (int)uRLError;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)connectionType;
- (unsigned)registrationError;
- (unsigned)resultCode;
- (unsigned)success;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setConnectionType:(unsigned int)a3;
- (void)setGenericError:(int)a3;
- (void)setGuid:(id)a3;
- (void)setHasConnectionType:(BOOL)a3;
- (void)setHasGenericError:(BOOL)a3;
- (void)setHasPOSIXError:(BOOL)a3;
- (void)setHasRegistrationError:(BOOL)a3;
- (void)setHasResultCode:(BOOL)a3;
- (void)setHasSuccess:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasURLError:(BOOL)a3;
- (void)setPOSIXError:(int)a3;
- (void)setRegistrationError:(unsigned int)a3;
- (void)setResultCode:(unsigned int)a3;
- (void)setSuccess:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setURLError:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDIDSRegistrationProfileOperation

- (void)dealloc
{
  [(AWDIDSRegistrationProfileOperation *)self setGuid:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSRegistrationProfileOperation;
  [(AWDIDSRegistrationProfileOperation *)&v3 dealloc];
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

- (void)setSuccess:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_success = a3;
}

- (void)setHasSuccess:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSuccess
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setConnectionType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_connectionType = a3;
}

- (void)setHasConnectionType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasConnectionType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setResultCode:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_resultCode = a3;
}

- (void)setHasResultCode:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasResultCode
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setRegistrationError:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_registrationError = a3;
}

- (void)setHasRegistrationError:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasRegistrationError
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setGenericError:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_genericError = a3;
}

- (void)setHasGenericError:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasGenericError
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setURLError:(int)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_uRLError = a3;
}

- (void)setHasURLError:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasURLError
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setPOSIXError:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_pOSIXError = a3;
}

- (void)setHasPOSIXError:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPOSIXError
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSRegistrationProfileOperation;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDIDSRegistrationProfileOperation description](&v3, sel_description), -[AWDIDSRegistrationProfileOperation dictionaryRepresentation](self, "dictionaryRepresentation")];
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
  if ((has & 0x40) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_success] forKey:@"success"];
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0) {
        goto LABEL_8;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_connectionType] forKey:@"connectionType"];
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_16:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_resultCode] forKey:@"resultCode"];
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_18;
  }
LABEL_17:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_registrationError] forKey:@"registrationError"];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_11;
    }
LABEL_19:
    [v3 setObject:[NSNumber numberWithInt:self->_uRLError] forKey:@"URLError"];
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      return v3;
    }
    goto LABEL_12;
  }
LABEL_18:
  [v3 setObject:[NSNumber numberWithInt:self->_genericError] forKey:@"genericError"];
  char has = (char)self->_has;
  if (has < 0) {
    goto LABEL_19;
  }
LABEL_11:
  if ((has & 8) != 0) {
LABEL_12:
  }
    [v3 setObject:[NSNumber numberWithInt:self->_pOSIXError] forKey:@"POSIXError"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSRegistrationProfileOperationReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_11;
    }
LABEL_18:
    PBDataWriterWriteInt32Field();
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      return;
    }
    goto LABEL_19;
  }
LABEL_17:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if (has < 0) {
    goto LABEL_18;
  }
LABEL_11:
  if ((has & 8) == 0) {
    return;
  }
LABEL_19:

  PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 52) |= 1u;
  }
  if (self->_guid) {
    [a3 setGuid:];
  }
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    *((_DWORD *)a3 + 11) = self->_success;
    *((unsigned char *)a3 + 52) |= 0x40u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0) {
        goto LABEL_8;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)a3 + 4) = self->_connectionType;
  *((unsigned char *)a3 + 52) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)a3 + 10) = self->_resultCode;
  *((unsigned char *)a3 + 52) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)a3 + 9) = self->_registrationError;
  *((unsigned char *)a3 + 52) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 5) = self->_genericError;
  *((unsigned char *)a3 + 52) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 8) == 0) {
      return;
    }
    goto LABEL_12;
  }
LABEL_19:
  *((_DWORD *)a3 + 12) = self->_uRLError;
  *((unsigned char *)a3 + 52) |= 0x80u;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    return;
  }
LABEL_12:
  *((_DWORD *)a3 + 8) = self->_pOSIXError;
  *((unsigned char *)a3 + 52) |= 8u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 52) |= 1u;
  }

  *(void *)(v6 + 24) = [(NSString *)self->_guid copyWithZone:a3];
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 44) = self->_success;
    *(unsigned char *)(v6 + 52) |= 0x40u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x20) == 0) {
        goto LABEL_6;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 16) = self->_connectionType;
  *(unsigned char *)(v6 + 52) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *(_DWORD *)(v6 + 40) = self->_resultCode;
  *(unsigned char *)(v6 + 52) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  *(_DWORD *)(v6 + 36) = self->_registrationError;
  *(unsigned char *)(v6 + 52) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
LABEL_17:
    *(_DWORD *)(v6 + 48) = self->_uRLError;
    *(unsigned char *)(v6 + 52) |= 0x80u;
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      return (id)v6;
    }
    goto LABEL_10;
  }
LABEL_16:
  *(_DWORD *)(v6 + 20) = self->_genericError;
  *(unsigned char *)(v6 + 52) |= 4u;
  char has = (char)self->_has;
  if (has < 0) {
    goto LABEL_17;
  }
LABEL_9:
  if ((has & 8) != 0)
  {
LABEL_10:
    *(_DWORD *)(v6 + 32) = self->_pOSIXError;
    *(unsigned char *)(v6 + 52) |= 8u;
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
      if ((*((unsigned char *)a3 + 52) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_43;
      }
    }
    else if (*((unsigned char *)a3 + 52))
    {
      goto LABEL_43;
    }
    guid = self->_guid;
    if ((unint64_t)guid | *((void *)a3 + 3))
    {
      int v5 = -[NSString isEqual:](guid, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    if ((has & 0x40) != 0)
    {
      if ((*((unsigned char *)a3 + 52) & 0x40) == 0 || self->_success != *((_DWORD *)a3 + 11)) {
        goto LABEL_43;
      }
    }
    else if ((*((unsigned char *)a3 + 52) & 0x40) != 0)
    {
      goto LABEL_43;
    }
    if ((has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 52) & 2) == 0 || self->_connectionType != *((_DWORD *)a3 + 4)) {
        goto LABEL_43;
      }
    }
    else if ((*((unsigned char *)a3 + 52) & 2) != 0)
    {
      goto LABEL_43;
    }
    if ((has & 0x20) != 0)
    {
      if ((*((unsigned char *)a3 + 52) & 0x20) == 0 || self->_resultCode != *((_DWORD *)a3 + 10)) {
        goto LABEL_43;
      }
    }
    else if ((*((unsigned char *)a3 + 52) & 0x20) != 0)
    {
      goto LABEL_43;
    }
    if ((has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 52) & 0x10) == 0 || self->_registrationError != *((_DWORD *)a3 + 9)) {
        goto LABEL_43;
      }
    }
    else if ((*((unsigned char *)a3 + 52) & 0x10) != 0)
    {
      goto LABEL_43;
    }
    if ((has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 52) & 4) == 0 || self->_genericError != *((_DWORD *)a3 + 5)) {
        goto LABEL_43;
      }
    }
    else if ((*((unsigned char *)a3 + 52) & 4) != 0)
    {
      goto LABEL_43;
    }
    if (has < 0)
    {
      if ((*((unsigned char *)a3 + 52) & 0x80) == 0 || self->_uRLError != *((_DWORD *)a3 + 12)) {
        goto LABEL_43;
      }
    }
    else if ((*((unsigned char *)a3 + 52) & 0x80) != 0)
    {
LABEL_43:
      LOBYTE(v5) = 0;
      return v5;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 52) & 8) == 0;
    if ((has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 52) & 8) == 0 || self->_pOSIXError != *((_DWORD *)a3 + 8)) {
        goto LABEL_43;
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
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    uint64_t v5 = 2654435761 * self->_success;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_6:
      uint64_t v6 = 2654435761 * self->_connectionType;
      if ((*(unsigned char *)&self->_has & 0x20) != 0) {
        goto LABEL_7;
      }
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v7 = 2654435761 * self->_resultCode;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_8:
    uint64_t v8 = 2654435761 * self->_registrationError;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_9;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_9:
    uint64_t v9 = 2654435761 * self->_genericError;
    if ((*(unsigned char *)&self->_has & 0x80) != 0) {
      goto LABEL_10;
    }
LABEL_17:
    uint64_t v10 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_11;
    }
LABEL_18:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
LABEL_16:
  uint64_t v9 = 0;
  if ((*(unsigned char *)&self->_has & 0x80) == 0) {
    goto LABEL_17;
  }
LABEL_10:
  uint64_t v10 = 2654435761 * self->_uRLError;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_18;
  }
LABEL_11:
  uint64_t v11 = 2654435761 * self->_pOSIXError;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 52))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 3)) {
    -[AWDIDSRegistrationProfileOperation setGuid:](self, "setGuid:");
  }
  char v5 = *((unsigned char *)a3 + 52);
  if ((v5 & 0x40) != 0)
  {
    self->_success = *((_DWORD *)a3 + 11);
    *(unsigned char *)&self->_has |= 0x40u;
    char v5 = *((unsigned char *)a3 + 52);
    if ((v5 & 2) == 0)
    {
LABEL_7:
      if ((v5 & 0x20) == 0) {
        goto LABEL_8;
      }
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)a3 + 52) & 2) == 0)
  {
    goto LABEL_7;
  }
  self->_connectionType = *((_DWORD *)a3 + 4);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)a3 + 52);
  if ((v5 & 0x20) == 0)
  {
LABEL_8:
    if ((v5 & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_resultCode = *((_DWORD *)a3 + 10);
  *(unsigned char *)&self->_has |= 0x20u;
  char v5 = *((unsigned char *)a3 + 52);
  if ((v5 & 0x10) == 0)
  {
LABEL_9:
    if ((v5 & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_registrationError = *((_DWORD *)a3 + 9);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)a3 + 52);
  if ((v5 & 4) == 0)
  {
LABEL_10:
    if ((v5 & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_genericError = *((_DWORD *)a3 + 5);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)a3 + 52);
  if ((v5 & 0x80) == 0)
  {
LABEL_11:
    if ((v5 & 8) == 0) {
      return;
    }
    goto LABEL_12;
  }
LABEL_19:
  self->_uRLError = *((_DWORD *)a3 + 12);
  *(unsigned char *)&self->_has |= 0x80u;
  if ((*((unsigned char *)a3 + 52) & 8) == 0) {
    return;
  }
LABEL_12:
  self->_pOSIXError = *((_DWORD *)a3 + 8);
  *(unsigned char *)&self->_has |= 8u;
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

- (unsigned)success
{
  return self->_success;
}

- (unsigned)connectionType
{
  return self->_connectionType;
}

- (unsigned)resultCode
{
  return self->_resultCode;
}

- (unsigned)registrationError
{
  return self->_registrationError;
}

- (int)genericError
{
  return self->_genericError;
}

- (int)uRLError
{
  return self->_uRLError;
}

- (int)pOSIXError
{
  return self->_pOSIXError;
}

@end