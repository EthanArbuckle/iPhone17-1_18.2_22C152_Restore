@interface AWDIDSRegistrationProfileHandleOperation
- (BOOL)hasConnectionType;
- (BOOL)hasGenericError;
- (BOOL)hasGuid;
- (BOOL)hasPOSIXError;
- (BOOL)hasRegistrationError;
- (BOOL)hasResultCode;
- (BOOL)hasSuccess;
- (BOOL)hasTimestamp;
- (BOOL)hasURLError;
- (BOOL)hasVettingStatus;
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
- (unsigned)vettingStatus;
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
- (void)setHasVettingStatus:(BOOL)a3;
- (void)setPOSIXError:(int)a3;
- (void)setRegistrationError:(unsigned int)a3;
- (void)setResultCode:(unsigned int)a3;
- (void)setSuccess:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setURLError:(int)a3;
- (void)setVettingStatus:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDIDSRegistrationProfileHandleOperation

- (void)dealloc
{
  [(AWDIDSRegistrationProfileHandleOperation *)self setGuid:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSRegistrationProfileHandleOperation;
  [(AWDIDSRegistrationProfileHandleOperation *)&v3 dealloc];
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

- (BOOL)hasGuid
{
  return self->_guid != 0;
}

- (void)setSuccess:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_success = a3;
}

- (void)setHasSuccess:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasSuccess
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setConnectionType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_connectionType = a3;
}

- (void)setHasConnectionType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasConnectionType
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setResultCode:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_resultCode = a3;
}

- (void)setHasResultCode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasResultCode
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setRegistrationError:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_registrationError = a3;
}

- (void)setHasRegistrationError:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasRegistrationError
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setGenericError:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_genericError = a3;
}

- (void)setHasGenericError:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasGenericError
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setURLError:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_uRLError = a3;
}

- (void)setHasURLError:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasURLError
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setPOSIXError:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_pOSIXError = a3;
}

- (void)setHasPOSIXError:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasPOSIXError
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setVettingStatus:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_vettingStatus = a3;
}

- (void)setHasVettingStatus:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasVettingStatus
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSRegistrationProfileHandleOperation;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDIDSRegistrationProfileHandleOperation description](&v3, sel_description), -[AWDIDSRegistrationProfileHandleOperation dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(_WORD *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  guid = self->_guid;
  if (guid) {
    [v3 setObject:guid forKey:@"guid"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_success] forKey:@"success"];
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0) {
        goto LABEL_8;
      }
      goto LABEL_17;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_7;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_connectionType] forKey:@"connectionType"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_18;
  }
LABEL_17:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_resultCode] forKey:@"resultCode"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_18:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_registrationError] forKey:@"registrationError"];
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v3 setObject:[NSNumber numberWithInt:self->_genericError] forKey:@"genericError"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
LABEL_21:
    [v3 setObject:[NSNumber numberWithInt:self->_pOSIXError] forKey:@"POSIXError"];
    if ((*(_WORD *)&self->_has & 0x100) == 0) {
      return v3;
    }
    goto LABEL_13;
  }
LABEL_20:
  [v3 setObject:[NSNumber numberWithInt:self->_uRLError] forKey:@"URLError"];
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_21;
  }
LABEL_12:
  if ((has & 0x100) != 0) {
LABEL_13:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_vettingStatus] forKey:@"vettingStatus"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSRegistrationProfileHandleOperationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(_WORD *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_guid) {
    PBDataWriterWriteStringField();
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0) {
        goto LABEL_8;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
LABEL_20:
    PBDataWriterWriteInt32Field();
    if ((*(_WORD *)&self->_has & 0x100) == 0) {
      return;
    }
    goto LABEL_21;
  }
LABEL_19:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_20;
  }
LABEL_12:
  if ((has & 0x100) == 0) {
    return;
  }
LABEL_21:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  if (*(_WORD *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((_WORD *)a3 + 28) |= 1u;
  }
  if (self->_guid) {
    [a3 setGuid:];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *((_DWORD *)a3 + 11) = self->_success;
    *((_WORD *)a3 + 28) |= 0x40u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0) {
        goto LABEL_8;
      }
      goto LABEL_17;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)a3 + 4) = self->_connectionType;
  *((_WORD *)a3 + 28) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)a3 + 10) = self->_resultCode;
  *((_WORD *)a3 + 28) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 9) = self->_registrationError;
  *((_WORD *)a3 + 28) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 5) = self->_genericError;
  *((_WORD *)a3 + 28) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)a3 + 12) = self->_uRLError;
  *((_WORD *)a3 + 28) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 0x100) == 0) {
      return;
    }
    goto LABEL_13;
  }
LABEL_21:
  *((_DWORD *)a3 + 8) = self->_pOSIXError;
  *((_WORD *)a3 + 28) |= 8u;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    return;
  }
LABEL_13:
  *((_DWORD *)a3 + 13) = self->_vettingStatus;
  *((_WORD *)a3 + 28) |= 0x100u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if (*(_WORD *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(_WORD *)(v5 + 56) |= 1u;
  }

  *(void *)(v6 + 24) = [(NSString *)self->_guid copyWithZone:a3];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 44) = self->_success;
    *(_WORD *)(v6 + 56) |= 0x40u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x20) == 0) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 16) = self->_connectionType;
  *(_WORD *)(v6 + 56) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  *(_DWORD *)(v6 + 40) = self->_resultCode;
  *(_WORD *)(v6 + 56) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  *(_DWORD *)(v6 + 36) = self->_registrationError;
  *(_WORD *)(v6 + 56) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_18;
  }
LABEL_17:
  *(_DWORD *)(v6 + 20) = self->_genericError;
  *(_WORD *)(v6 + 56) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
LABEL_19:
    *(_DWORD *)(v6 + 32) = self->_pOSIXError;
    *(_WORD *)(v6 + 56) |= 8u;
    if ((*(_WORD *)&self->_has & 0x100) == 0) {
      return (id)v6;
    }
    goto LABEL_11;
  }
LABEL_18:
  *(_DWORD *)(v6 + 48) = self->_uRLError;
  *(_WORD *)(v6 + 56) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_19;
  }
LABEL_10:
  if ((has & 0x100) != 0)
  {
LABEL_11:
    *(_DWORD *)(v6 + 52) = self->_vettingStatus;
    *(_WORD *)(v6 + 56) |= 0x100u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    __int16 has = (__int16)self->_has;
    __int16 v7 = *((_WORD *)a3 + 28);
    if (has)
    {
      if ((v7 & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_49;
      }
    }
    else if (v7)
    {
LABEL_49:
      LOBYTE(v5) = 0;
      return v5;
    }
    guid = self->_guid;
    if ((unint64_t)guid | *((void *)a3 + 3))
    {
      int v5 = -[NSString isEqual:](guid, "isEqual:");
      if (!v5) {
        return v5;
      }
      __int16 has = (__int16)self->_has;
    }
    __int16 v9 = *((_WORD *)a3 + 28);
    if ((has & 0x40) != 0)
    {
      if ((v9 & 0x40) == 0 || self->_success != *((_DWORD *)a3 + 11)) {
        goto LABEL_49;
      }
    }
    else if ((v9 & 0x40) != 0)
    {
      goto LABEL_49;
    }
    if ((has & 2) != 0)
    {
      if ((v9 & 2) == 0 || self->_connectionType != *((_DWORD *)a3 + 4)) {
        goto LABEL_49;
      }
    }
    else if ((v9 & 2) != 0)
    {
      goto LABEL_49;
    }
    if ((has & 0x20) != 0)
    {
      if ((v9 & 0x20) == 0 || self->_resultCode != *((_DWORD *)a3 + 10)) {
        goto LABEL_49;
      }
    }
    else if ((v9 & 0x20) != 0)
    {
      goto LABEL_49;
    }
    if ((has & 0x10) != 0)
    {
      if ((v9 & 0x10) == 0 || self->_registrationError != *((_DWORD *)a3 + 9)) {
        goto LABEL_49;
      }
    }
    else if ((v9 & 0x10) != 0)
    {
      goto LABEL_49;
    }
    if ((has & 4) != 0)
    {
      if ((v9 & 4) == 0 || self->_genericError != *((_DWORD *)a3 + 5)) {
        goto LABEL_49;
      }
    }
    else if ((v9 & 4) != 0)
    {
      goto LABEL_49;
    }
    if ((has & 0x80) != 0)
    {
      if ((v9 & 0x80) == 0 || self->_uRLError != *((_DWORD *)a3 + 12)) {
        goto LABEL_49;
      }
    }
    else if ((v9 & 0x80) != 0)
    {
      goto LABEL_49;
    }
    if ((has & 8) != 0)
    {
      if ((v9 & 8) == 0 || self->_pOSIXError != *((_DWORD *)a3 + 8)) {
        goto LABEL_49;
      }
    }
    else if ((v9 & 8) != 0)
    {
      goto LABEL_49;
    }
    LOBYTE(v5) = (v9 & 0x100) == 0;
    if ((has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 28) & 0x100) == 0 || self->_vettingStatus != *((_DWORD *)a3 + 13)) {
        goto LABEL_49;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(_WORD *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_guid hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    uint64_t v6 = 2654435761 * self->_success;
    if ((has & 2) != 0)
    {
LABEL_6:
      uint64_t v7 = 2654435761 * self->_connectionType;
      if ((has & 0x20) != 0) {
        goto LABEL_7;
      }
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((has & 2) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_resultCode;
    if ((has & 0x10) != 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v8 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_registrationError;
    if ((has & 4) != 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v9 = 0;
  if ((has & 4) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_genericError;
    if ((has & 0x80) != 0) {
      goto LABEL_10;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v10 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_uRLError;
    if ((has & 8) != 0) {
      goto LABEL_11;
    }
LABEL_19:
    uint64_t v12 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_12;
    }
LABEL_20:
    uint64_t v13 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  }
LABEL_18:
  uint64_t v11 = 0;
  if ((has & 8) == 0) {
    goto LABEL_19;
  }
LABEL_11:
  uint64_t v12 = 2654435761 * self->_pOSIXError;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_20;
  }
LABEL_12:
  uint64_t v13 = 2654435761 * self->_vettingStatus;
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  if (*((_WORD *)a3 + 28))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 3)) {
    -[AWDIDSRegistrationProfileHandleOperation setGuid:](self, "setGuid:");
  }
  __int16 v5 = *((_WORD *)a3 + 28);
  if ((v5 & 0x40) != 0)
  {
    self->_success = *((_DWORD *)a3 + 11);
    *(_WORD *)&self->_has |= 0x40u;
    __int16 v5 = *((_WORD *)a3 + 28);
    if ((v5 & 2) == 0)
    {
LABEL_7:
      if ((v5 & 0x20) == 0) {
        goto LABEL_8;
      }
      goto LABEL_17;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_7;
  }
  self->_connectionType = *((_DWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)a3 + 28);
  if ((v5 & 0x20) == 0)
  {
LABEL_8:
    if ((v5 & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_resultCode = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)a3 + 28);
  if ((v5 & 0x10) == 0)
  {
LABEL_9:
    if ((v5 & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_registrationError = *((_DWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)a3 + 28);
  if ((v5 & 4) == 0)
  {
LABEL_10:
    if ((v5 & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_genericError = *((_DWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)a3 + 28);
  if ((v5 & 0x80) == 0)
  {
LABEL_11:
    if ((v5 & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_uRLError = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)a3 + 28);
  if ((v5 & 8) == 0)
  {
LABEL_12:
    if ((v5 & 0x100) == 0) {
      return;
    }
    goto LABEL_13;
  }
LABEL_21:
  self->_pOSIXError = *((_DWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)a3 + 28) & 0x100) == 0) {
    return;
  }
LABEL_13:
  self->_vettingStatus = *((_DWORD *)a3 + 13);
  *(_WORD *)&self->_has |= 0x100u;
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

- (unsigned)vettingStatus
{
  return self->_vettingStatus;
}

@end