@interface AWDIMessageQueryFinished
- (BOOL)hasConnectionType;
- (BOOL)hasGenericError;
- (BOOL)hasGuid;
- (BOOL)hasIsEmail;
- (BOOL)hasIsPhoneNumber;
- (BOOL)hasPOSIXError;
- (BOOL)hasQueryDuration;
- (BOOL)hasResultCode;
- (BOOL)hasSuccess;
- (BOOL)hasTimestamp;
- (BOOL)hasURLError;
- (BOOL)hasWasReversePushAttempted;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)guid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)genericError;
- (int)pOSIXError;
- (int)resultCode;
- (int)uRLError;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)connectionType;
- (unsigned)isEmail;
- (unsigned)isPhoneNumber;
- (unsigned)queryDuration;
- (unsigned)success;
- (unsigned)wasReversePushAttempted;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setConnectionType:(unsigned int)a3;
- (void)setGenericError:(int)a3;
- (void)setGuid:(id)a3;
- (void)setHasConnectionType:(BOOL)a3;
- (void)setHasGenericError:(BOOL)a3;
- (void)setHasIsEmail:(BOOL)a3;
- (void)setHasIsPhoneNumber:(BOOL)a3;
- (void)setHasPOSIXError:(BOOL)a3;
- (void)setHasQueryDuration:(BOOL)a3;
- (void)setHasResultCode:(BOOL)a3;
- (void)setHasSuccess:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasURLError:(BOOL)a3;
- (void)setHasWasReversePushAttempted:(BOOL)a3;
- (void)setIsEmail:(unsigned int)a3;
- (void)setIsPhoneNumber:(unsigned int)a3;
- (void)setPOSIXError:(int)a3;
- (void)setQueryDuration:(unsigned int)a3;
- (void)setResultCode:(int)a3;
- (void)setSuccess:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setURLError:(int)a3;
- (void)setWasReversePushAttempted:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDIMessageQueryFinished

- (void)dealloc
{
  [(AWDIMessageQueryFinished *)self setGuid:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDIMessageQueryFinished;
  [(AWDIMessageQueryFinished *)&v3 dealloc];
}

- (BOOL)hasGuid
{
  return self->_guid != 0;
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

- (void)setSuccess:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_success = a3;
}

- (void)setHasSuccess:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSuccess
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
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

- (void)setQueryDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_queryDuration = a3;
}

- (void)setHasQueryDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasQueryDuration
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setIsPhoneNumber:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_isPhoneNumber = a3;
}

- (void)setHasIsPhoneNumber:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasIsPhoneNumber
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setIsEmail:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_isEmail = a3;
}

- (void)setHasIsEmail:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasIsEmail
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setResultCode:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_resultCode = a3;
}

- (void)setHasResultCode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasResultCode
{
  return (*(_WORD *)&self->_has >> 7) & 1;
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
  *(_WORD *)&self->_has |= 0x200u;
  self->_uRLError = a3;
}

- (void)setHasURLError:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasURLError
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setPOSIXError:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_pOSIXError = a3;
}

- (void)setHasPOSIXError:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasPOSIXError
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setWasReversePushAttempted:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_wasReversePushAttempted = a3;
}

- (void)setHasWasReversePushAttempted:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasWasReversePushAttempted
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDIMessageQueryFinished;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDIMessageQueryFinished description](&v3, sel_description), -[AWDIMessageQueryFinished dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  guid = self->_guid;
  if (guid) {
    [v3 setObject:guid forKey:@"guid"];
  }
  __int16 has = (__int16)self->_has;
  if (has)
  {
    [v4 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_18;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_5;
  }
  [v4 setObject:[NSNumber numberWithUnsignedInt:self->_success] forKey:@"success"];
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  [v4 setObject:[NSNumber numberWithUnsignedInt:self->_connectionType] forKey:@"connectionType"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v4 setObject:[NSNumber numberWithUnsignedInt:self->_queryDuration] forKey:@"queryDuration"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  [v4 setObject:[NSNumber numberWithUnsignedInt:self->_isPhoneNumber] forKey:@"isPhoneNumber"];
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  [v4 setObject:[NSNumber numberWithUnsignedInt:self->_isEmail] forKey:@"isEmail"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v4 setObject:[NSNumber numberWithInt:self->_resultCode] forKey:@"resultCode"];
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v4 setObject:[NSNumber numberWithInt:self->_genericError] forKey:@"genericError"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 0x20) == 0) {
      goto LABEL_13;
    }
LABEL_25:
    [v4 setObject:[NSNumber numberWithInt:self->_pOSIXError] forKey:@"POSIXError"];
    if ((*(_WORD *)&self->_has & 0x400) == 0) {
      return v4;
    }
    goto LABEL_14;
  }
LABEL_24:
  [v4 setObject:[NSNumber numberWithInt:self->_uRLError] forKey:@"URLError"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_25;
  }
LABEL_13:
  if ((has & 0x400) != 0) {
LABEL_14:
  }
    [v4 setObject:[NSNumber numberWithUnsignedInt:self->_wasReversePushAttempted] forKey:@"wasReversePushAttempted"];
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIMessageQueryFinishedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_guid) {
    PBDataWriterWriteStringField();
  }
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 0x20) == 0) {
      goto LABEL_13;
    }
LABEL_24:
    PBDataWriterWriteInt32Field();
    if ((*(_WORD *)&self->_has & 0x400) == 0) {
      return;
    }
    goto LABEL_25;
  }
LABEL_23:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_24;
  }
LABEL_13:
  if ((has & 0x400) == 0) {
    return;
  }
LABEL_25:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  if (self->_guid) {
    [a3 setGuid:];
  }
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((_WORD *)a3 + 32) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_18;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)a3 + 13) = self->_success;
  *((_WORD *)a3 + 32) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 4) = self->_connectionType;
  *((_WORD *)a3 + 32) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 11) = self->_queryDuration;
  *((_WORD *)a3 + 32) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)a3 + 9) = self->_isPhoneNumber;
  *((_WORD *)a3 + 32) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)a3 + 8) = self->_isEmail;
  *((_WORD *)a3 + 32) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)a3 + 12) = self->_resultCode;
  *((_WORD *)a3 + 32) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)a3 + 5) = self->_genericError;
  *((_WORD *)a3 + 32) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)a3 + 14) = self->_uRLError;
  *((_WORD *)a3 + 32) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_13:
    if ((has & 0x400) == 0) {
      return;
    }
    goto LABEL_14;
  }
LABEL_25:
  *((_DWORD *)a3 + 10) = self->_pOSIXError;
  *((_WORD *)a3 + 32) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x400) == 0) {
    return;
  }
LABEL_14:
  *((_DWORD *)a3 + 15) = self->_wasReversePushAttempted;
  *((_WORD *)a3 + 32) |= 0x400u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];

  *(void *)(v5 + 24) = [(NSString *)self->_guid copyWithZone:a3];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(_WORD *)(v5 + 64) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 52) = self->_success;
  *(_WORD *)(v5 + 64) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  *(_DWORD *)(v5 + 16) = self->_connectionType;
  *(_WORD *)(v5 + 64) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  *(_DWORD *)(v5 + 44) = self->_queryDuration;
  *(_WORD *)(v5 + 64) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  *(_DWORD *)(v5 + 36) = self->_isPhoneNumber;
  *(_WORD *)(v5 + 64) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  *(_DWORD *)(v5 + 32) = self->_isEmail;
  *(_WORD *)(v5 + 64) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  *(_DWORD *)(v5 + 48) = self->_resultCode;
  *(_WORD *)(v5 + 64) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  *(_DWORD *)(v5 + 20) = self->_genericError;
  *(_WORD *)(v5 + 64) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_11;
    }
LABEL_23:
    *(_DWORD *)(v5 + 40) = self->_pOSIXError;
    *(_WORD *)(v5 + 64) |= 0x20u;
    if ((*(_WORD *)&self->_has & 0x400) == 0) {
      return (id)v5;
    }
    goto LABEL_12;
  }
LABEL_22:
  *(_DWORD *)(v5 + 56) = self->_uRLError;
  *(_WORD *)(v5 + 64) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_23;
  }
LABEL_11:
  if ((has & 0x400) != 0)
  {
LABEL_12:
    *(_DWORD *)(v5 + 60) = self->_wasReversePushAttempted;
    *(_WORD *)(v5 + 64) |= 0x400u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    guid = self->_guid;
    if (!((unint64_t)guid | *((void *)a3 + 3)) || (int v5 = -[NSString isEqual:](guid, "isEqual:")) != 0)
    {
      __int16 has = (__int16)self->_has;
      __int16 v8 = *((_WORD *)a3 + 32);
      if (has)
      {
        if ((v8 & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
          goto LABEL_58;
        }
      }
      else if (v8)
      {
LABEL_58:
        LOBYTE(v5) = 0;
        return v5;
      }
      if ((*(_WORD *)&self->_has & 0x100) != 0)
      {
        if ((*((_WORD *)a3 + 32) & 0x100) == 0 || self->_success != *((_DWORD *)a3 + 13)) {
          goto LABEL_58;
        }
      }
      else if ((*((_WORD *)a3 + 32) & 0x100) != 0)
      {
        goto LABEL_58;
      }
      if ((has & 2) != 0)
      {
        if ((v8 & 2) == 0 || self->_connectionType != *((_DWORD *)a3 + 4)) {
          goto LABEL_58;
        }
      }
      else if ((v8 & 2) != 0)
      {
        goto LABEL_58;
      }
      if ((has & 0x40) != 0)
      {
        if ((v8 & 0x40) == 0 || self->_queryDuration != *((_DWORD *)a3 + 11)) {
          goto LABEL_58;
        }
      }
      else if ((v8 & 0x40) != 0)
      {
        goto LABEL_58;
      }
      if ((has & 0x10) != 0)
      {
        if ((v8 & 0x10) == 0 || self->_isPhoneNumber != *((_DWORD *)a3 + 9)) {
          goto LABEL_58;
        }
      }
      else if ((v8 & 0x10) != 0)
      {
        goto LABEL_58;
      }
      if ((has & 8) != 0)
      {
        if ((v8 & 8) == 0 || self->_isEmail != *((_DWORD *)a3 + 8)) {
          goto LABEL_58;
        }
      }
      else if ((v8 & 8) != 0)
      {
        goto LABEL_58;
      }
      if ((has & 0x80) != 0)
      {
        if ((v8 & 0x80) == 0 || self->_resultCode != *((_DWORD *)a3 + 12)) {
          goto LABEL_58;
        }
      }
      else if ((v8 & 0x80) != 0)
      {
        goto LABEL_58;
      }
      if ((has & 4) != 0)
      {
        if ((v8 & 4) == 0 || self->_genericError != *((_DWORD *)a3 + 5)) {
          goto LABEL_58;
        }
      }
      else if ((v8 & 4) != 0)
      {
        goto LABEL_58;
      }
      if ((*(_WORD *)&self->_has & 0x200) != 0)
      {
        if ((*((_WORD *)a3 + 32) & 0x200) == 0 || self->_uRLError != *((_DWORD *)a3 + 14)) {
          goto LABEL_58;
        }
      }
      else if ((*((_WORD *)a3 + 32) & 0x200) != 0)
      {
        goto LABEL_58;
      }
      if ((has & 0x20) != 0)
      {
        if ((v8 & 0x20) == 0 || self->_pOSIXError != *((_DWORD *)a3 + 10)) {
          goto LABEL_58;
        }
      }
      else if ((v8 & 0x20) != 0)
      {
        goto LABEL_58;
      }
      LOBYTE(v5) = (v8 & 0x400) == 0;
      if ((*(_WORD *)&self->_has & 0x400) != 0)
      {
        if ((*((_WORD *)a3 + 32) & 0x400) == 0 || self->_wasReversePushAttempted != *((_DWORD *)a3 + 15)) {
          goto LABEL_58;
        }
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_guid hash];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v5 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
LABEL_3:
      uint64_t v6 = 2654435761 * self->_success;
      if ((has & 2) != 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else
  {
    unint64_t v5 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v6 = 0;
  if ((has & 2) != 0)
  {
LABEL_4:
    uint64_t v7 = 2654435761 * self->_connectionType;
    if ((has & 0x40) != 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v7 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_5:
    uint64_t v8 = 2654435761 * self->_queryDuration;
    if ((has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v8 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v9 = 2654435761 * self->_isPhoneNumber;
    if ((has & 8) != 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v9 = 0;
  if ((has & 8) != 0)
  {
LABEL_7:
    uint64_t v10 = 2654435761 * self->_isEmail;
    if ((has & 0x80) != 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v10 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_8:
    uint64_t v11 = 2654435761 * self->_resultCode;
    if ((has & 4) != 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v11 = 0;
  if ((has & 4) != 0)
  {
LABEL_9:
    uint64_t v12 = 2654435761 * self->_genericError;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v12 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_10:
    uint64_t v13 = 2654435761 * self->_uRLError;
    if ((has & 0x20) != 0) {
      goto LABEL_11;
    }
LABEL_22:
    uint64_t v14 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_12;
    }
LABEL_23:
    uint64_t v15 = 0;
    return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
  }
LABEL_21:
  uint64_t v13 = 0;
  if ((has & 0x20) == 0) {
    goto LABEL_22;
  }
LABEL_11:
  uint64_t v14 = 2654435761 * self->_pOSIXError;
  if ((*(_WORD *)&self->_has & 0x400) == 0) {
    goto LABEL_23;
  }
LABEL_12:
  uint64_t v15 = 2654435761 * self->_wasReversePushAttempted;
  return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 3)) {
    -[AWDIMessageQueryFinished setGuid:](self, "setGuid:");
  }
  __int16 v5 = *((_WORD *)a3 + 32);
  if (v5)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v5 = *((_WORD *)a3 + 32);
    if ((v5 & 0x100) == 0)
    {
LABEL_5:
      if ((v5 & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_18;
    }
  }
  else if ((*((_WORD *)a3 + 32) & 0x100) == 0)
  {
    goto LABEL_5;
  }
  self->_success = *((_DWORD *)a3 + 13);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)a3 + 32);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_connectionType = *((_DWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)a3 + 32);
  if ((v5 & 0x40) == 0)
  {
LABEL_7:
    if ((v5 & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_queryDuration = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)a3 + 32);
  if ((v5 & 0x10) == 0)
  {
LABEL_8:
    if ((v5 & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_isPhoneNumber = *((_DWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)a3 + 32);
  if ((v5 & 8) == 0)
  {
LABEL_9:
    if ((v5 & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_isEmail = *((_DWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)a3 + 32);
  if ((v5 & 0x80) == 0)
  {
LABEL_10:
    if ((v5 & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_resultCode = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)a3 + 32);
  if ((v5 & 4) == 0)
  {
LABEL_11:
    if ((v5 & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_genericError = *((_DWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)a3 + 32);
  if ((v5 & 0x200) == 0)
  {
LABEL_12:
    if ((v5 & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_uRLError = *((_DWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)a3 + 32);
  if ((v5 & 0x20) == 0)
  {
LABEL_13:
    if ((v5 & 0x400) == 0) {
      return;
    }
    goto LABEL_14;
  }
LABEL_25:
  self->_pOSIXError = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x20u;
  if ((*((_WORD *)a3 + 32) & 0x400) == 0) {
    return;
  }
LABEL_14:
  self->_wasReversePushAttempted = *((_DWORD *)a3 + 15);
  *(_WORD *)&self->_has |= 0x400u;
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)success
{
  return self->_success;
}

- (unsigned)connectionType
{
  return self->_connectionType;
}

- (unsigned)queryDuration
{
  return self->_queryDuration;
}

- (unsigned)isPhoneNumber
{
  return self->_isPhoneNumber;
}

- (unsigned)isEmail
{
  return self->_isEmail;
}

- (int)resultCode
{
  return self->_resultCode;
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

- (unsigned)wasReversePushAttempted
{
  return self->_wasReversePushAttempted;
}

@end