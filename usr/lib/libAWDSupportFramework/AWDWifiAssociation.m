@interface AWDWifiAssociation
- (BOOL)hasBand;
- (BOOL)hasBssidOui;
- (BOOL)hasChannel;
- (BOOL)hasCountryCode;
- (BOOL)hasDeauthReason;
- (BOOL)hasDeauthSourceOui;
- (BOOL)hasError;
- (BOOL)hasNoise;
- (BOOL)hasPhymode;
- (BOOL)hasPrivateMacType;
- (BOOL)hasSecurity;
- (BOOL)hasSignal;
- (BOOL)hasTimestamp;
- (BOOL)hasTxrate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)bssidOui;
- (NSData)deauthSourceOui;
- (NSString)countryCode;
- (NSString)privateMacType;
- (NSString)security;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)band;
- (int)channel;
- (int)deauthReason;
- (int)noise;
- (int)signal;
- (int)txrate;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)error;
- (unsigned)phymode;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBand:(int)a3;
- (void)setBssidOui:(id)a3;
- (void)setChannel:(int)a3;
- (void)setCountryCode:(id)a3;
- (void)setDeauthReason:(int)a3;
- (void)setDeauthSourceOui:(id)a3;
- (void)setError:(unsigned int)a3;
- (void)setHasBand:(BOOL)a3;
- (void)setHasChannel:(BOOL)a3;
- (void)setHasDeauthReason:(BOOL)a3;
- (void)setHasError:(BOOL)a3;
- (void)setHasNoise:(BOOL)a3;
- (void)setHasPhymode:(BOOL)a3;
- (void)setHasSignal:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTxrate:(BOOL)a3;
- (void)setNoise:(int)a3;
- (void)setPhymode:(unsigned int)a3;
- (void)setPrivateMacType:(id)a3;
- (void)setSecurity:(id)a3;
- (void)setSignal:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTxrate:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWifiAssociation

- (void)dealloc
{
  [(AWDWifiAssociation *)self setBssidOui:0];
  [(AWDWifiAssociation *)self setSecurity:0];
  [(AWDWifiAssociation *)self setDeauthSourceOui:0];
  [(AWDWifiAssociation *)self setCountryCode:0];
  [(AWDWifiAssociation *)self setPrivateMacType:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWifiAssociation;
  [(AWDWifiAssociation *)&v3 dealloc];
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

- (void)setError:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_error = a3;
}

- (void)setHasError:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasError
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setChannel:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_channel = a3;
}

- (void)setHasChannel:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasChannel
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setSignal:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_signal = a3;
}

- (void)setHasSignal:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasSignal
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (BOOL)hasBssidOui
{
  return self->_bssidOui != 0;
}

- (BOOL)hasSecurity
{
  return self->_security != 0;
}

- (void)setDeauthReason:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_deauthReason = a3;
}

- (void)setHasDeauthReason:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDeauthReason
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (BOOL)hasDeauthSourceOui
{
  return self->_deauthSourceOui != 0;
}

- (void)setNoise:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_noise = a3;
}

- (void)setHasNoise:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasNoise
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setTxrate:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_txrate = a3;
}

- (void)setHasTxrate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasTxrate
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasCountryCode
{
  return self->_countryCode != 0;
}

- (void)setPhymode:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_phymode = a3;
}

- (void)setHasPhymode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasPhymode
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setBand:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_band = a3;
}

- (void)setHasBand:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasBand
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (BOOL)hasPrivateMacType
{
  return self->_privateMacType != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWifiAssociation;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWifiAssociation description](&v3, sel_description), -[AWDWifiAssociation dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_29;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_error] forKey:@"error"];
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_29:
  [v3 setObject:[NSNumber numberWithInt:self->_channel] forKey:@"channel"];
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
LABEL_5:
  }
    [v3 setObject:[NSNumber numberWithInt:self->_signal] forKey:@"signal"];
LABEL_6:
  bssidOui = self->_bssidOui;
  if (bssidOui) {
    [v3 setObject:bssidOui forKey:@"bssid_oui"];
  }
  security = self->_security;
  if (security) {
    [v3 setObject:security forKey:@"security"];
  }
  if ((*(_WORD *)&self->_has & 8) != 0) {
    [v3 setObject:[NSNumber numberWithInt:self->_deauthReason] forKey:@"deauth_reason"];
  }
  deauthSourceOui = self->_deauthSourceOui;
  if (deauthSourceOui) {
    [v3 setObject:deauthSourceOui forKey:@"deauth_source_oui"];
  }
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x20) != 0)
  {
    [v3 setObject:[NSNumber numberWithInt:self->_noise] forKey:@"noise"];
    __int16 v8 = (__int16)self->_has;
  }
  if ((v8 & 0x100) != 0) {
    [v3 setObject:[NSNumber numberWithInt:self->_txrate] forKey:@"txrate"];
  }
  countryCode = self->_countryCode;
  if (countryCode) {
    [v3 setObject:countryCode forKey:@"country_code"];
  }
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x40) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_phymode] forKey:@"phymode"];
    __int16 v10 = (__int16)self->_has;
  }
  if ((v10 & 2) != 0) {
    [v3 setObject:[NSNumber numberWithInt:self->_band] forKey:@"band"];
  }
  privateMacType = self->_privateMacType;
  if (privateMacType) {
    [v3 setObject:privateMacType forKey:@"privateMacType"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWifiAssociationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_30;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_30:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
LABEL_5:
  }
    PBDataWriterWriteInt32Field();
LABEL_6:
  if (self->_bssidOui) {
    PBDataWriterWriteDataField();
  }
  if (self->_security) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_has & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_deauthSourceOui) {
    PBDataWriterWriteDataField();
  }
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v5 = (__int16)self->_has;
  }
  if ((v5 & 0x100) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_countryCode) {
    PBDataWriterWriteStringField();
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 v6 = (__int16)self->_has;
  }
  if ((v6 & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_privateMacType)
  {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((_WORD *)a3 + 52) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_30;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 16) = self->_error;
  *((_WORD *)a3 + 52) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_30:
  *((_DWORD *)a3 + 8) = self->_channel;
  *((_WORD *)a3 + 52) |= 4u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_5:
    *((_DWORD *)a3 + 24) = self->_signal;
    *((_WORD *)a3 + 52) |= 0x80u;
  }
LABEL_6:
  if (self->_bssidOui) {
    [a3 setBssidOui:];
  }
  if (self->_security) {
    [a3 setSecurity:];
  }
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    *((_DWORD *)a3 + 12) = self->_deauthReason;
    *((_WORD *)a3 + 52) |= 8u;
  }
  if (self->_deauthSourceOui) {
    [a3 setDeauthSourceOui:];
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x20) != 0)
  {
    *((_DWORD *)a3 + 17) = self->_noise;
    *((_WORD *)a3 + 52) |= 0x20u;
    __int16 v6 = (__int16)self->_has;
  }
  if ((v6 & 0x100) != 0)
  {
    *((_DWORD *)a3 + 25) = self->_txrate;
    *((_WORD *)a3 + 52) |= 0x100u;
  }
  if (self->_countryCode) {
    [a3 setCountryCode:];
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x40) != 0)
  {
    *((_DWORD *)a3 + 18) = self->_phymode;
    *((_WORD *)a3 + 52) |= 0x40u;
    __int16 v7 = (__int16)self->_has;
  }
  if ((v7 & 2) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_band;
    *((_WORD *)a3 + 52) |= 2u;
  }
  if (self->_privateMacType)
  {
    [a3 setPrivateMacType:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(_WORD *)(v5 + 104) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 64) = self->_error;
  *(_WORD *)(v5 + 104) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_19:
  *(_DWORD *)(v5 + 32) = self->_channel;
  *(_WORD *)(v5 + 104) |= 4u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 96) = self->_signal;
    *(_WORD *)(v5 + 104) |= 0x80u;
  }
LABEL_6:

  *(void *)(v6 + 24) = [(NSData *)self->_bssidOui copyWithZone:a3];
  *(void *)(v6 + 88) = [(NSString *)self->_security copyWithZone:a3];
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v6 + 48) = self->_deauthReason;
    *(_WORD *)(v6 + 104) |= 8u;
  }

  *(void *)(v6 + 56) = [(NSData *)self->_deauthSourceOui copyWithZone:a3];
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 68) = self->_noise;
    *(_WORD *)(v6 + 104) |= 0x20u;
    __int16 v8 = (__int16)self->_has;
  }
  if ((v8 & 0x100) != 0)
  {
    *(_DWORD *)(v6 + 100) = self->_txrate;
    *(_WORD *)(v6 + 104) |= 0x100u;
  }

  *(void *)(v6 + 40) = [(NSString *)self->_countryCode copyWithZone:a3];
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 72) = self->_phymode;
    *(_WORD *)(v6 + 104) |= 0x40u;
    __int16 v9 = (__int16)self->_has;
  }
  if ((v9 & 2) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_band;
    *(_WORD *)(v6 + 104) |= 2u;
  }

  *(void *)(v6 + 80) = [(NSString *)self->_privateMacType copyWithZone:a3];
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    __int16 has = (__int16)self->_has;
    __int16 v7 = *((_WORD *)a3 + 52);
    if (has)
    {
      if ((v7 & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_59;
      }
    }
    else if (v7)
    {
LABEL_59:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_error != *((_DWORD *)a3 + 16)) {
        goto LABEL_59;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_59;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_channel != *((_DWORD *)a3 + 8)) {
        goto LABEL_59;
      }
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_59;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_signal != *((_DWORD *)a3 + 24)) {
        goto LABEL_59;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_59;
    }
    bssidOui = self->_bssidOui;
    if (!((unint64_t)bssidOui | *((void *)a3 + 3)) || (int v5 = -[NSData isEqual:](bssidOui, "isEqual:")) != 0)
    {
      security = self->_security;
      if (!((unint64_t)security | *((void *)a3 + 11))
        || (int v5 = -[NSString isEqual:](security, "isEqual:")) != 0)
      {
        __int16 v10 = (__int16)self->_has;
        __int16 v11 = *((_WORD *)a3 + 52);
        if ((v10 & 8) != 0)
        {
          if ((v11 & 8) == 0 || self->_deauthReason != *((_DWORD *)a3 + 12)) {
            goto LABEL_59;
          }
        }
        else if ((v11 & 8) != 0)
        {
          goto LABEL_59;
        }
        deauthSourceOui = self->_deauthSourceOui;
        if ((unint64_t)deauthSourceOui | *((void *)a3 + 7))
        {
          int v5 = -[NSData isEqual:](deauthSourceOui, "isEqual:");
          if (!v5) {
            return v5;
          }
          __int16 v10 = (__int16)self->_has;
        }
        __int16 v13 = *((_WORD *)a3 + 52);
        if ((v10 & 0x20) != 0)
        {
          if ((v13 & 0x20) == 0 || self->_noise != *((_DWORD *)a3 + 17)) {
            goto LABEL_59;
          }
        }
        else if ((v13 & 0x20) != 0)
        {
          goto LABEL_59;
        }
        if ((v10 & 0x100) != 0)
        {
          if ((*((_WORD *)a3 + 52) & 0x100) == 0 || self->_txrate != *((_DWORD *)a3 + 25)) {
            goto LABEL_59;
          }
        }
        else if ((*((_WORD *)a3 + 52) & 0x100) != 0)
        {
          goto LABEL_59;
        }
        countryCode = self->_countryCode;
        if ((unint64_t)countryCode | *((void *)a3 + 5))
        {
          int v5 = -[NSString isEqual:](countryCode, "isEqual:");
          if (!v5) {
            return v5;
          }
          __int16 v10 = (__int16)self->_has;
        }
        __int16 v15 = *((_WORD *)a3 + 52);
        if ((v10 & 0x40) != 0)
        {
          if ((v15 & 0x40) == 0 || self->_phymode != *((_DWORD *)a3 + 18)) {
            goto LABEL_59;
          }
        }
        else if ((v15 & 0x40) != 0)
        {
          goto LABEL_59;
        }
        if ((v10 & 2) != 0)
        {
          if ((v15 & 2) == 0 || self->_band != *((_DWORD *)a3 + 4)) {
            goto LABEL_59;
          }
        }
        else if ((v15 & 2) != 0)
        {
          goto LABEL_59;
        }
        privateMacType = self->_privateMacType;
        if ((unint64_t)privateMacType | *((void *)a3 + 10))
        {
          LOBYTE(v5) = -[NSString isEqual:](privateMacType, "isEqual:");
        }
        else
        {
          LOBYTE(v5) = 1;
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v18 = 2654435761u * self->_timestamp;
    if ((has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v17 = 2654435761 * self->_error;
      if ((has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v16 = 0;
      if ((has & 0x80) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v18 = 0;
    if ((has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v17 = 0;
  if ((has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v16 = 2654435761 * self->_channel;
  if ((has & 0x80) != 0)
  {
LABEL_5:
    uint64_t v4 = 2654435761 * self->_signal;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v4 = 0;
LABEL_10:
  uint64_t v5 = [(NSData *)self->_bssidOui hash];
  NSUInteger v6 = [(NSString *)self->_security hash];
  if ((*(_WORD *)&self->_has & 8) != 0) {
    uint64_t v7 = 2654435761 * self->_deauthReason;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = [(NSData *)self->_deauthSourceOui hash];
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    uint64_t v9 = 2654435761 * self->_noise;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
LABEL_15:
      uint64_t v10 = 2654435761 * self->_txrate;
      goto LABEL_18;
    }
  }
  uint64_t v10 = 0;
LABEL_18:
  NSUInteger v11 = [(NSString *)self->_countryCode hash];
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x40) != 0)
  {
    uint64_t v13 = 2654435761 * self->_phymode;
    if ((v12 & 2) != 0) {
      goto LABEL_20;
    }
LABEL_22:
    uint64_t v14 = 0;
    return v17 ^ v18 ^ v16 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ [(NSString *)self->_privateMacType hash];
  }
  uint64_t v13 = 0;
  if ((v12 & 2) == 0) {
    goto LABEL_22;
  }
LABEL_20:
  uint64_t v14 = 2654435761 * self->_band;
  return v17 ^ v18 ^ v16 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ [(NSString *)self->_privateMacType hash];
}

- (void)mergeFrom:(id)a3
{
  __int16 v5 = *((_WORD *)a3 + 52);
  if (v5)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v5 = *((_WORD *)a3 + 52);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_30;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_error = *((_DWORD *)a3 + 16);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)a3 + 52);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_30:
  self->_channel = *((_DWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 4u;
  if ((*((_WORD *)a3 + 52) & 0x80) != 0)
  {
LABEL_5:
    self->_signal = *((_DWORD *)a3 + 24);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_6:
  if (*((void *)a3 + 3)) {
    -[AWDWifiAssociation setBssidOui:](self, "setBssidOui:");
  }
  if (*((void *)a3 + 11)) {
    -[AWDWifiAssociation setSecurity:](self, "setSecurity:");
  }
  if ((*((_WORD *)a3 + 52) & 8) != 0)
  {
    self->_deauthReason = *((_DWORD *)a3 + 12);
    *(_WORD *)&self->_has |= 8u;
  }
  if (*((void *)a3 + 7)) {
    -[AWDWifiAssociation setDeauthSourceOui:](self, "setDeauthSourceOui:");
  }
  __int16 v6 = *((_WORD *)a3 + 52);
  if ((v6 & 0x20) != 0)
  {
    self->_noise = *((_DWORD *)a3 + 17);
    *(_WORD *)&self->_has |= 0x20u;
    __int16 v6 = *((_WORD *)a3 + 52);
  }
  if ((v6 & 0x100) != 0)
  {
    self->_txrate = *((_DWORD *)a3 + 25);
    *(_WORD *)&self->_has |= 0x100u;
  }
  if (*((void *)a3 + 5)) {
    -[AWDWifiAssociation setCountryCode:](self, "setCountryCode:");
  }
  __int16 v7 = *((_WORD *)a3 + 52);
  if ((v7 & 0x40) != 0)
  {
    self->_phymode = *((_DWORD *)a3 + 18);
    *(_WORD *)&self->_has |= 0x40u;
    __int16 v7 = *((_WORD *)a3 + 52);
  }
  if ((v7 & 2) != 0)
  {
    self->_band = *((_DWORD *)a3 + 4);
    *(_WORD *)&self->_has |= 2u;
  }
  if (*((void *)a3 + 10))
  {
    -[AWDWifiAssociation setPrivateMacType:](self, "setPrivateMacType:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)error
{
  return self->_error;
}

- (int)channel
{
  return self->_channel;
}

- (int)signal
{
  return self->_signal;
}

- (NSData)bssidOui
{
  return self->_bssidOui;
}

- (void)setBssidOui:(id)a3
{
}

- (NSString)security
{
  return self->_security;
}

- (void)setSecurity:(id)a3
{
}

- (int)deauthReason
{
  return self->_deauthReason;
}

- (NSData)deauthSourceOui
{
  return self->_deauthSourceOui;
}

- (void)setDeauthSourceOui:(id)a3
{
}

- (int)noise
{
  return self->_noise;
}

- (int)txrate
{
  return self->_txrate;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (unsigned)phymode
{
  return self->_phymode;
}

- (int)band
{
  return self->_band;
}

- (NSString)privateMacType
{
  return self->_privateMacType;
}

- (void)setPrivateMacType:(id)a3
{
}

@end