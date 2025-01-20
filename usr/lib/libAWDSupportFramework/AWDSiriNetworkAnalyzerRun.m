@interface AWDSiriNetworkAnalyzerRun
- (BOOL)analyzingSuccessfulRetry;
- (BOOL)hasAnalyzingSuccessfulRetry;
- (BOOL)hasGatewayPingDuration;
- (BOOL)hasGatewayPingsDropped;
- (BOOL)hasGatewayPingsSent;
- (BOOL)hasGatewayStatus;
- (BOOL)hasInterface;
- (BOOL)hasIsUserRequest;
- (BOOL)hasKnownURLLoadDuration;
- (BOOL)hasSendBufferBytesRemaining;
- (BOOL)hasSiriSaltURLLoadDuration;
- (BOOL)hasSiriURLLoadDuration;
- (BOOL)hasTimestamp;
- (BOOL)hasWwanPreferred;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUserRequest;
- (BOOL)readFrom:(id)a3;
- (BOOL)wwanPreferred;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)gatewayStatus;
- (int)interface;
- (int)sendBufferBytesRemaining;
- (unint64_t)gatewayPingDuration;
- (unint64_t)hash;
- (unint64_t)knownURLLoadDuration;
- (unint64_t)siriSaltURLLoadDuration;
- (unint64_t)siriURLLoadDuration;
- (unint64_t)timestamp;
- (unsigned)gatewayPingsDropped;
- (unsigned)gatewayPingsSent;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAnalyzingSuccessfulRetry:(BOOL)a3;
- (void)setGatewayPingDuration:(unint64_t)a3;
- (void)setGatewayPingsDropped:(unsigned int)a3;
- (void)setGatewayPingsSent:(unsigned int)a3;
- (void)setGatewayStatus:(int)a3;
- (void)setHasAnalyzingSuccessfulRetry:(BOOL)a3;
- (void)setHasGatewayPingDuration:(BOOL)a3;
- (void)setHasGatewayPingsDropped:(BOOL)a3;
- (void)setHasGatewayPingsSent:(BOOL)a3;
- (void)setHasGatewayStatus:(BOOL)a3;
- (void)setHasInterface:(BOOL)a3;
- (void)setHasIsUserRequest:(BOOL)a3;
- (void)setHasKnownURLLoadDuration:(BOOL)a3;
- (void)setHasSendBufferBytesRemaining:(BOOL)a3;
- (void)setHasSiriSaltURLLoadDuration:(BOOL)a3;
- (void)setHasSiriURLLoadDuration:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasWwanPreferred:(BOOL)a3;
- (void)setInterface:(int)a3;
- (void)setIsUserRequest:(BOOL)a3;
- (void)setKnownURLLoadDuration:(unint64_t)a3;
- (void)setSendBufferBytesRemaining:(int)a3;
- (void)setSiriSaltURLLoadDuration:(unint64_t)a3;
- (void)setSiriURLLoadDuration:(unint64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setWwanPreferred:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDSiriNetworkAnalyzerRun

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setInterface:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_interface = a3;
}

- (void)setHasInterface:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasInterface
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setIsUserRequest:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_isUserRequest = a3;
}

- (void)setHasIsUserRequest:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasIsUserRequest
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setAnalyzingSuccessfulRetry:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_analyzingSuccessfulRetry = a3;
}

- (void)setHasAnalyzingSuccessfulRetry:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasAnalyzingSuccessfulRetry
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setWwanPreferred:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_wwanPreferred = a3;
}

- (void)setHasWwanPreferred:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasWwanPreferred
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setSendBufferBytesRemaining:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_sendBufferBytesRemaining = a3;
}

- (void)setHasSendBufferBytesRemaining:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasSendBufferBytesRemaining
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setKnownURLLoadDuration:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_knownURLLoadDuration = a3;
}

- (void)setHasKnownURLLoadDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasKnownURLLoadDuration
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setSiriURLLoadDuration:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_siriURLLoadDuration = a3;
}

- (void)setHasSiriURLLoadDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasSiriURLLoadDuration
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setSiriSaltURLLoadDuration:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_siriSaltURLLoadDuration = a3;
}

- (void)setHasSiriSaltURLLoadDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasSiriSaltURLLoadDuration
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setGatewayStatus:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_gatewayStatus = a3;
}

- (void)setHasGatewayStatus:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasGatewayStatus
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setGatewayPingDuration:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_gatewayPingDuration = a3;
}

- (void)setHasGatewayPingDuration:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasGatewayPingDuration
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setGatewayPingsSent:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_gatewayPingsSent = a3;
}

- (void)setHasGatewayPingsSent:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasGatewayPingsSent
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setGatewayPingsDropped:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_gatewayPingsDropped = a3;
}

- (void)setHasGatewayPingsDropped:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasGatewayPingsDropped
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDSiriNetworkAnalyzerRun;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDSiriNetworkAnalyzerRun description](&v3, sel_description), -[AWDSiriNetworkAnalyzerRun dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithInt:self->_interface] forKey:@"interface"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  [v3 setObject:[NSNumber numberWithBool:self->_isUserRequest] forKey:@"isUserRequest"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x1000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v3 setObject:[NSNumber numberWithBool:self->_analyzingSuccessfulRetry] forKey:@"analyzingSuccessfulRetry"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  [v3 setObject:[NSNumber numberWithBool:self->_wwanPreferred] forKey:@"wwanPreferred"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  [v3 setObject:[NSNumber numberWithInt:self->_sendBufferBytesRemaining] forKey:@"sendBufferBytesRemaining"];
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_knownURLLoadDuration] forKey:@"knownURLLoadDuration"];
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_siriURLLoadDuration] forKey:@"siriURLLoadDuration"];
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_siriSaltURLLoadDuration] forKey:@"siriSaltURLLoadDuration"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_26;
  }
LABEL_25:
  [v3 setObject:[NSNumber numberWithInt:self->_gatewayStatus] forKey:@"gatewayStatus"];
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0) {
      goto LABEL_13;
    }
LABEL_27:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_gatewayPingsSent] forKey:@"gatewayPingsSent"];
    if ((*(_WORD *)&self->_has & 0x20) == 0) {
      return v3;
    }
    goto LABEL_14;
  }
LABEL_26:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_gatewayPingDuration] forKey:@"gatewayPingDuration"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0) {
    goto LABEL_27;
  }
LABEL_13:
  if ((has & 0x20) != 0) {
LABEL_14:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_gatewayPingsDropped] forKey:@"gatewayPingsDropped"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSiriNetworkAnalyzerRunReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x1000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0) {
      goto LABEL_13;
    }
LABEL_26:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_has & 0x20) == 0) {
      return;
    }
    goto LABEL_27;
  }
LABEL_25:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0) {
    goto LABEL_26;
  }
LABEL_13:
  if ((has & 0x20) == 0) {
    return;
  }
LABEL_27:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *((void *)a3 + 5) = self->_timestamp;
    *((_WORD *)a3 + 36) |= 0x10u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 15) = self->_interface;
  *((_WORD *)a3 + 36) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((unsigned char *)a3 + 69) = self->_isUserRequest;
  *((_WORD *)a3 + 36) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x1000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((unsigned char *)a3 + 68) = self->_analyzingSuccessfulRetry;
  *((_WORD *)a3 + 36) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((unsigned char *)a3 + 70) = self->_wwanPreferred;
  *((_WORD *)a3 + 36) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)a3 + 16) = self->_sendBufferBytesRemaining;
  *((_WORD *)a3 + 36) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((void *)a3 + 2) = self->_knownURLLoadDuration;
  *((_WORD *)a3 + 36) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((void *)a3 + 4) = self->_siriURLLoadDuration;
  *((_WORD *)a3 + 36) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((void *)a3 + 3) = self->_siriSaltURLLoadDuration;
  *((_WORD *)a3 + 36) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)a3 + 14) = self->_gatewayStatus;
  *((_WORD *)a3 + 36) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((void *)a3 + 1) = self->_gatewayPingDuration;
  *((_WORD *)a3 + 36) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 0x20) == 0) {
      return;
    }
LABEL_27:
    *((_DWORD *)a3 + 12) = self->_gatewayPingsDropped;
    *((_WORD *)a3 + 36) |= 0x20u;
    return;
  }
LABEL_26:
  *((_DWORD *)a3 + 13) = self->_gatewayPingsSent;
  *((_WORD *)a3 + 36) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    goto LABEL_27;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *((void *)result + 5) = self->_timestamp;
    *((_WORD *)result + 36) |= 0x10u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 15) = self->_interface;
  *((_WORD *)result + 36) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((unsigned char *)result + 69) = self->_isUserRequest;
  *((_WORD *)result + 36) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x1000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((unsigned char *)result + 68) = self->_analyzingSuccessfulRetry;
  *((_WORD *)result + 36) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((unsigned char *)result + 70) = self->_wwanPreferred;
  *((_WORD *)result + 36) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 16) = self->_sendBufferBytesRemaining;
  *((_WORD *)result + 36) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((void *)result + 2) = self->_knownURLLoadDuration;
  *((_WORD *)result + 36) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((void *)result + 4) = self->_siriURLLoadDuration;
  *((_WORD *)result + 36) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((void *)result + 3) = self->_siriSaltURLLoadDuration;
  *((_WORD *)result + 36) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)result + 14) = self->_gatewayStatus;
  *((_WORD *)result + 36) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((void *)result + 1) = self->_gatewayPingDuration;
  *((_WORD *)result + 36) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 0x20) == 0) {
      return result;
    }
    goto LABEL_14;
  }
LABEL_27:
  *((_DWORD *)result + 13) = self->_gatewayPingsSent;
  *((_WORD *)result + 36) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x20) == 0) {
    return result;
  }
LABEL_14:
  *((_DWORD *)result + 12) = self->_gatewayPingsDropped;
  *((_WORD *)result + 36) |= 0x20u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)a3 + 36);
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_timestamp != *((void *)a3 + 5)) {
      goto LABEL_75;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_75;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)a3 + 36) & 0x100) == 0 || self->_interface != *((_DWORD *)a3 + 15)) {
      goto LABEL_75;
    }
  }
  else if ((*((_WORD *)a3 + 36) & 0x100) != 0)
  {
    goto LABEL_75;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)a3 + 36) & 0x800) == 0) {
      goto LABEL_75;
    }
    if (self->_isUserRequest)
    {
      if (!*((unsigned char *)a3 + 69)) {
        goto LABEL_75;
      }
    }
    else if (*((unsigned char *)a3 + 69))
    {
      goto LABEL_75;
    }
  }
  else if ((*((_WORD *)a3 + 36) & 0x800) != 0)
  {
    goto LABEL_75;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)a3 + 36) & 0x400) == 0) {
      goto LABEL_75;
    }
    if (self->_analyzingSuccessfulRetry)
    {
      if (!*((unsigned char *)a3 + 68)) {
        goto LABEL_75;
      }
    }
    else if (*((unsigned char *)a3 + 68))
    {
      goto LABEL_75;
    }
  }
  else if ((*((_WORD *)a3 + 36) & 0x400) != 0)
  {
    goto LABEL_75;
  }
  if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    if ((*((_WORD *)a3 + 36) & 0x1000) != 0) {
      goto LABEL_75;
    }
    goto LABEL_36;
  }
  if ((*((_WORD *)a3 + 36) & 0x1000) == 0) {
    goto LABEL_75;
  }
  if (self->_wwanPreferred)
  {
    if (!*((unsigned char *)a3 + 70)) {
      goto LABEL_75;
    }
    goto LABEL_36;
  }
  if (*((unsigned char *)a3 + 70))
  {
LABEL_75:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_36:
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)a3 + 36) & 0x200) == 0 || self->_sendBufferBytesRemaining != *((_DWORD *)a3 + 16)) {
      goto LABEL_75;
    }
  }
  else if ((*((_WORD *)a3 + 36) & 0x200) != 0)
  {
    goto LABEL_75;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_knownURLLoadDuration != *((void *)a3 + 2)) {
      goto LABEL_75;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_75;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_siriURLLoadDuration != *((void *)a3 + 4)) {
      goto LABEL_75;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_75;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_siriSaltURLLoadDuration != *((void *)a3 + 3)) {
      goto LABEL_75;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_75;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_gatewayStatus != *((_DWORD *)a3 + 14)) {
      goto LABEL_75;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_75;
  }
  if (has)
  {
    if ((v7 & 1) == 0 || self->_gatewayPingDuration != *((void *)a3 + 1)) {
      goto LABEL_75;
    }
  }
  else if (v7)
  {
    goto LABEL_75;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_gatewayPingsSent != *((_DWORD *)a3 + 13)) {
      goto LABEL_75;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_75;
  }
  LOBYTE(v5) = (v7 & 0x20) == 0;
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_gatewayPingsDropped != *((_DWORD *)a3 + 12)) {
      goto LABEL_75;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_interface;
      if ((*(_WORD *)&self->_has & 0x800) != 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_isUserRequest;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v5 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_analyzingSuccessfulRetry;
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v6 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_wwanPreferred;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v7 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_sendBufferBytesRemaining;
    if ((has & 2) != 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v8 = 0;
  if ((has & 2) != 0)
  {
LABEL_8:
    unint64_t v9 = 2654435761u * self->_knownURLLoadDuration;
    if ((has & 8) != 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  unint64_t v9 = 0;
  if ((has & 8) != 0)
  {
LABEL_9:
    unint64_t v10 = 2654435761u * self->_siriURLLoadDuration;
    if ((has & 4) != 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  unint64_t v10 = 0;
  if ((has & 4) != 0)
  {
LABEL_10:
    unint64_t v11 = 2654435761u * self->_siriSaltURLLoadDuration;
    if ((has & 0x80) != 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  unint64_t v11 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_11:
    uint64_t v12 = 2654435761 * self->_gatewayStatus;
    if (has) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v12 = 0;
  if (has)
  {
LABEL_12:
    unint64_t v13 = 2654435761u * self->_gatewayPingDuration;
    if ((has & 0x40) != 0) {
      goto LABEL_13;
    }
LABEL_26:
    uint64_t v14 = 0;
    if ((has & 0x20) != 0) {
      goto LABEL_14;
    }
LABEL_27:
    uint64_t v15 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
  }
LABEL_25:
  unint64_t v13 = 0;
  if ((has & 0x40) == 0) {
    goto LABEL_26;
  }
LABEL_13:
  uint64_t v14 = 2654435761 * self->_gatewayPingsSent;
  if ((has & 0x20) == 0) {
    goto LABEL_27;
  }
LABEL_14:
  uint64_t v15 = 2654435761 * self->_gatewayPingsDropped;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3 = *((_WORD *)a3 + 36);
  if ((v3 & 0x10) != 0)
  {
    self->_timestamp = *((void *)a3 + 5);
    *(_WORD *)&self->_has |= 0x10u;
    __int16 v3 = *((_WORD *)a3 + 36);
    if ((v3 & 0x100) == 0)
    {
LABEL_3:
      if ((v3 & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*((_WORD *)a3 + 36) & 0x100) == 0)
  {
    goto LABEL_3;
  }
  self->_interface = *((_DWORD *)a3 + 15);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v3 = *((_WORD *)a3 + 36);
  if ((v3 & 0x800) == 0)
  {
LABEL_4:
    if ((v3 & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_isUserRequest = *((unsigned char *)a3 + 69);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v3 = *((_WORD *)a3 + 36);
  if ((v3 & 0x400) == 0)
  {
LABEL_5:
    if ((v3 & 0x1000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_analyzingSuccessfulRetry = *((unsigned char *)a3 + 68);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v3 = *((_WORD *)a3 + 36);
  if ((v3 & 0x1000) == 0)
  {
LABEL_6:
    if ((v3 & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_wwanPreferred = *((unsigned char *)a3 + 70);
  *(_WORD *)&self->_has |= 0x1000u;
  __int16 v3 = *((_WORD *)a3 + 36);
  if ((v3 & 0x200) == 0)
  {
LABEL_7:
    if ((v3 & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_sendBufferBytesRemaining = *((_DWORD *)a3 + 16);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v3 = *((_WORD *)a3 + 36);
  if ((v3 & 2) == 0)
  {
LABEL_8:
    if ((v3 & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_knownURLLoadDuration = *((void *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v3 = *((_WORD *)a3 + 36);
  if ((v3 & 8) == 0)
  {
LABEL_9:
    if ((v3 & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_siriURLLoadDuration = *((void *)a3 + 4);
  *(_WORD *)&self->_has |= 8u;
  __int16 v3 = *((_WORD *)a3 + 36);
  if ((v3 & 4) == 0)
  {
LABEL_10:
    if ((v3 & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_siriSaltURLLoadDuration = *((void *)a3 + 3);
  *(_WORD *)&self->_has |= 4u;
  __int16 v3 = *((_WORD *)a3 + 36);
  if ((v3 & 0x80) == 0)
  {
LABEL_11:
    if ((v3 & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_gatewayStatus = *((_DWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v3 = *((_WORD *)a3 + 36);
  if ((v3 & 1) == 0)
  {
LABEL_12:
    if ((v3 & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_gatewayPingDuration = *((void *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v3 = *((_WORD *)a3 + 36);
  if ((v3 & 0x40) == 0)
  {
LABEL_13:
    if ((v3 & 0x20) == 0) {
      return;
    }
LABEL_27:
    self->_gatewayPingsDropped = *((_DWORD *)a3 + 12);
    *(_WORD *)&self->_has |= 0x20u;
    return;
  }
LABEL_26:
  self->_gatewayPingsSent = *((_DWORD *)a3 + 13);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)a3 + 36) & 0x20) != 0) {
    goto LABEL_27;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)interface
{
  return self->_interface;
}

- (BOOL)isUserRequest
{
  return self->_isUserRequest;
}

- (BOOL)analyzingSuccessfulRetry
{
  return self->_analyzingSuccessfulRetry;
}

- (BOOL)wwanPreferred
{
  return self->_wwanPreferred;
}

- (int)sendBufferBytesRemaining
{
  return self->_sendBufferBytesRemaining;
}

- (unint64_t)knownURLLoadDuration
{
  return self->_knownURLLoadDuration;
}

- (unint64_t)siriURLLoadDuration
{
  return self->_siriURLLoadDuration;
}

- (unint64_t)siriSaltURLLoadDuration
{
  return self->_siriSaltURLLoadDuration;
}

- (int)gatewayStatus
{
  return self->_gatewayStatus;
}

- (unint64_t)gatewayPingDuration
{
  return self->_gatewayPingDuration;
}

- (unsigned)gatewayPingsSent
{
  return self->_gatewayPingsSent;
}

- (unsigned)gatewayPingsDropped
{
  return self->_gatewayPingsDropped;
}

@end