@interface AWDVPNSession
- (BOOL)appVpnUsed;
- (BOOL)connectFailed;
- (BOOL)hasAppVpnUsed;
- (BOOL)hasConnectFailed;
- (BOOL)hasDisconnectReason;
- (BOOL)hasDuration;
- (BOOL)hasInBytes;
- (BOOL)hasIpv4Installed;
- (BOOL)hasIpv6Installed;
- (BOOL)hasOutBytes;
- (BOOL)hasProtocol;
- (BOOL)hasProxyInstalled;
- (BOOL)hasReassertCount;
- (BOOL)hasSystemAuthenMethod;
- (BOOL)hasTimestamp;
- (BOOL)hasTriggerTrafficClass;
- (BOOL)hasTriggerType;
- (BOOL)hasUserAuthenMethod;
- (BOOL)isEqual:(id)a3;
- (BOOL)proxyInstalled;
- (BOOL)readFrom:(id)a3;
- (NSString)protocol;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)inBytes;
- (unint64_t)outBytes;
- (unint64_t)timestamp;
- (unsigned)disconnectReason;
- (unsigned)duration;
- (unsigned)ipv4Installed;
- (unsigned)ipv6Installed;
- (unsigned)reassertCount;
- (unsigned)systemAuthenMethod;
- (unsigned)triggerTrafficClass;
- (unsigned)triggerType;
- (unsigned)userAuthenMethod;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAppVpnUsed:(BOOL)a3;
- (void)setConnectFailed:(BOOL)a3;
- (void)setDisconnectReason:(unsigned int)a3;
- (void)setDuration:(unsigned int)a3;
- (void)setHasAppVpnUsed:(BOOL)a3;
- (void)setHasConnectFailed:(BOOL)a3;
- (void)setHasDisconnectReason:(BOOL)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasInBytes:(BOOL)a3;
- (void)setHasIpv4Installed:(BOOL)a3;
- (void)setHasIpv6Installed:(BOOL)a3;
- (void)setHasOutBytes:(BOOL)a3;
- (void)setHasProxyInstalled:(BOOL)a3;
- (void)setHasReassertCount:(BOOL)a3;
- (void)setHasSystemAuthenMethod:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTriggerTrafficClass:(BOOL)a3;
- (void)setHasTriggerType:(BOOL)a3;
- (void)setHasUserAuthenMethod:(BOOL)a3;
- (void)setInBytes:(unint64_t)a3;
- (void)setIpv4Installed:(unsigned int)a3;
- (void)setIpv6Installed:(unsigned int)a3;
- (void)setOutBytes:(unint64_t)a3;
- (void)setProtocol:(id)a3;
- (void)setProxyInstalled:(BOOL)a3;
- (void)setReassertCount:(unsigned int)a3;
- (void)setSystemAuthenMethod:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTriggerTrafficClass:(unsigned int)a3;
- (void)setTriggerType:(unsigned int)a3;
- (void)setUserAuthenMethod:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDVPNSession

- (void)dealloc
{
  [(AWDVPNSession *)self setProtocol:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDVPNSession;
  [(AWDVPNSession *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasProtocol
{
  return self->_protocol != 0;
}

- (void)setTriggerType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_triggerType = a3;
}

- (void)setHasTriggerType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasTriggerType
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setTriggerTrafficClass:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_triggerTrafficClass = a3;
}

- (void)setHasTriggerTrafficClass:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasTriggerTrafficClass
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setIpv4Installed:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_ipv4Installed = a3;
}

- (void)setHasIpv4Installed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasIpv4Installed
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setIpv6Installed:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_ipv6Installed = a3;
}

- (void)setHasIpv6Installed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasIpv6Installed
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setProxyInstalled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_proxyInstalled = a3;
}

- (void)setHasProxyInstalled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasProxyInstalled
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setAppVpnUsed:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_appVpnUsed = a3;
}

- (void)setHasAppVpnUsed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasAppVpnUsed
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setSystemAuthenMethod:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_systemAuthenMethod = a3;
}

- (void)setHasSystemAuthenMethod:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSystemAuthenMethod
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setUserAuthenMethod:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_userAuthenMethod = a3;
}

- (void)setHasUserAuthenMethod:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasUserAuthenMethod
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setDisconnectReason:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_disconnectReason = a3;
}

- (void)setHasDisconnectReason:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDisconnectReason
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setConnectFailed:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_connectFailed = a3;
}

- (void)setHasConnectFailed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasConnectFailed
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDuration
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setReassertCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_reassertCount = a3;
}

- (void)setHasReassertCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasReassertCount
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setInBytes:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_inBytes = a3;
}

- (void)setHasInBytes:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasInBytes
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setOutBytes:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_outBytes = a3;
}

- (void)setHasOutBytes:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasOutBytes
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDVPNSession;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDVPNSession description](&v3, sel_description), -[AWDVPNSession dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ((*(_WORD *)&self->_has & 4) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  protocol = self->_protocol;
  if (protocol) {
    [v3 setObject:protocol forKey:@"protocol"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_triggerType] forKey:@"trigger_type"];
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0) {
        goto LABEL_8;
      }
      goto LABEL_23;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_7;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_triggerTrafficClass] forKey:@"trigger_traffic_class"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_ipv4Installed] forKey:@"ipv4_installed"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x4000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_ipv6Installed] forKey:@"ipv6_installed"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_10:
    if ((has & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  [v3 setObject:[NSNumber numberWithBool:self->_proxyInstalled] forKey:@"proxy_installed"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  [v3 setObject:[NSNumber numberWithBool:self->_appVpnUsed] forKey:@"app_vpn_used"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_systemAuthenMethod] forKey:@"system_authen_method"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_13:
    if ((has & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_userAuthenMethod] forKey:@"user_authen_method"];
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_14:
    if ((has & 0x2000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_30;
  }
LABEL_29:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_disconnectReason] forKey:@"disconnect_reason"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_15:
    if ((has & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_31;
  }
LABEL_30:
  [v3 setObject:[NSNumber numberWithBool:self->_connectFailed] forKey:@"connect_failed"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_16:
    if ((has & 0x80) == 0) {
      goto LABEL_17;
    }
    goto LABEL_32;
  }
LABEL_31:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_duration] forKey:@"duration"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_17:
    if ((has & 1) == 0) {
      goto LABEL_18;
    }
LABEL_33:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_inBytes] forKey:@"in_bytes"];
    if ((*(_WORD *)&self->_has & 2) == 0) {
      return v3;
    }
    goto LABEL_19;
  }
LABEL_32:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_reassertCount] forKey:@"reassert_count"];
  __int16 has = (__int16)self->_has;
  if (has) {
    goto LABEL_33;
  }
LABEL_18:
  if ((has & 2) != 0) {
LABEL_19:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_outBytes] forKey:@"out_bytes"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDVPNSessionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_WORD *)&self->_has & 4) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_protocol) {
    PBDataWriterWriteStringField();
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0) {
        goto LABEL_8;
      }
      goto LABEL_22;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x4000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_10:
    if ((has & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_13:
    if ((has & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_14:
    if ((has & 0x2000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_15:
    if ((has & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_16:
    if ((has & 0x80) == 0) {
      goto LABEL_17;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_17:
    if ((has & 1) == 0) {
      goto LABEL_18;
    }
LABEL_32:
    PBDataWriterWriteUint64Field();
    if ((*(_WORD *)&self->_has & 2) == 0) {
      return;
    }
    goto LABEL_33;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if (has) {
    goto LABEL_32;
  }
LABEL_18:
  if ((has & 2) == 0) {
    return;
  }
LABEL_33:

  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    *((void *)a3 + 3) = self->_timestamp;
    *((_WORD *)a3 + 40) |= 4u;
  }
  if (self->_protocol) {
    [a3 setProtocol:];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    *((_DWORD *)a3 + 17) = self->_triggerType;
    *((_WORD *)a3 + 40) |= 0x400u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0) {
        goto LABEL_8;
      }
      goto LABEL_23;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)a3 + 16) = self->_triggerTrafficClass;
  *((_WORD *)a3 + 40) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)a3 + 10) = self->_ipv4Installed;
  *((_WORD *)a3 + 40) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x4000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)a3 + 11) = self->_ipv6Installed;
  *((_WORD *)a3 + 40) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_10:
    if ((has & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((unsigned char *)a3 + 78) = self->_proxyInstalled;
  *((_WORD *)a3 + 40) |= 0x4000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((unsigned char *)a3 + 76) = self->_appVpnUsed;
  *((_WORD *)a3 + 40) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)a3 + 15) = self->_systemAuthenMethod;
  *((_WORD *)a3 + 40) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_13:
    if ((has & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)a3 + 18) = self->_userAuthenMethod;
  *((_WORD *)a3 + 40) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_14:
    if ((has & 0x2000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)a3 + 8) = self->_disconnectReason;
  *((_WORD *)a3 + 40) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_15:
    if ((has & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((unsigned char *)a3 + 77) = self->_connectFailed;
  *((_WORD *)a3 + 40) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_16:
    if ((has & 0x80) == 0) {
      goto LABEL_17;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)a3 + 9) = self->_duration;
  *((_WORD *)a3 + 40) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_17:
    if ((has & 1) == 0) {
      goto LABEL_18;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)a3 + 14) = self->_reassertCount;
  *((_WORD *)a3 + 40) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_18:
    if ((has & 2) == 0) {
      return;
    }
    goto LABEL_19;
  }
LABEL_33:
  *((void *)a3 + 1) = self->_inBytes;
  *((_WORD *)a3 + 40) |= 1u;
  if ((*(_WORD *)&self->_has & 2) == 0) {
    return;
  }
LABEL_19:
  *((void *)a3 + 2) = self->_outBytes;
  *((_WORD *)a3 + 40) |= 2u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  uint64_t v6 = v5;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_timestamp;
    *(_WORD *)(v5 + 80) |= 4u;
  }

  *(void *)(v6 + 48) = [(NSString *)self->_protocol copyWithZone:a3];
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    *(_DWORD *)(v6 + 68) = self->_triggerType;
    *(_WORD *)(v6 + 80) |= 0x400u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_5:
      if ((has & 0x20) == 0) {
        goto LABEL_6;
      }
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 64) = self->_triggerTrafficClass;
  *(_WORD *)(v6 + 80) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  *(_DWORD *)(v6 + 40) = self->_ipv4Installed;
  *(_WORD *)(v6 + 80) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x4000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  *(_DWORD *)(v6 + 44) = self->_ipv6Installed;
  *(_WORD *)(v6 + 80) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_8:
    if ((has & 0x1000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  *(unsigned char *)(v6 + 78) = self->_proxyInstalled;
  *(_WORD *)(v6 + 80) |= 0x4000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  *(unsigned char *)(v6 + 76) = self->_appVpnUsed;
  *(_WORD *)(v6 + 80) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  *(_DWORD *)(v6 + 60) = self->_systemAuthenMethod;
  *(_WORD *)(v6 + 80) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_11:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  *(_DWORD *)(v6 + 72) = self->_userAuthenMethod;
  *(_WORD *)(v6 + 80) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  *(_DWORD *)(v6 + 32) = self->_disconnectReason;
  *(_WORD *)(v6 + 80) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_13:
    if ((has & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  *(unsigned char *)(v6 + 77) = self->_connectFailed;
  *(_WORD *)(v6 + 80) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_14:
    if ((has & 0x80) == 0) {
      goto LABEL_15;
    }
    goto LABEL_30;
  }
LABEL_29:
  *(_DWORD *)(v6 + 36) = self->_duration;
  *(_WORD *)(v6 + 80) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_15:
    if ((has & 1) == 0) {
      goto LABEL_16;
    }
LABEL_31:
    *(void *)(v6 + 8) = self->_inBytes;
    *(_WORD *)(v6 + 80) |= 1u;
    if ((*(_WORD *)&self->_has & 2) == 0) {
      return (id)v6;
    }
    goto LABEL_17;
  }
LABEL_30:
  *(_DWORD *)(v6 + 56) = self->_reassertCount;
  *(_WORD *)(v6 + 80) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if (has) {
    goto LABEL_31;
  }
LABEL_16:
  if ((has & 2) != 0)
  {
LABEL_17:
    *(void *)(v6 + 16) = self->_outBytes;
    *(_WORD *)(v6 + 80) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)a3 + 40);
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_timestamp != *((void *)a3 + 3)) {
      goto LABEL_88;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_88;
  }
  protocol = self->_protocol;
  if ((unint64_t)protocol | *((void *)a3 + 6))
  {
    int v5 = -[NSString isEqual:](protocol, "isEqual:");
    if (!v5) {
      return v5;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v9 = *((_WORD *)a3 + 40);
  if ((has & 0x400) != 0)
  {
    if ((*((_WORD *)a3 + 40) & 0x400) == 0 || self->_triggerType != *((_DWORD *)a3 + 17)) {
      goto LABEL_88;
    }
  }
  else if ((*((_WORD *)a3 + 40) & 0x400) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)a3 + 40) & 0x200) == 0 || self->_triggerTrafficClass != *((_DWORD *)a3 + 16)) {
      goto LABEL_88;
    }
  }
  else if ((*((_WORD *)a3 + 40) & 0x200) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_ipv4Installed != *((_DWORD *)a3 + 10)) {
      goto LABEL_88;
    }
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_ipv6Installed != *((_DWORD *)a3 + 11)) {
      goto LABEL_88;
    }
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 0x4000) != 0)
  {
    if ((*((_WORD *)a3 + 40) & 0x4000) == 0) {
      goto LABEL_88;
    }
    if (self->_proxyInstalled)
    {
      if (!*((unsigned char *)a3 + 78)) {
        goto LABEL_88;
      }
    }
    else if (*((unsigned char *)a3 + 78))
    {
      goto LABEL_88;
    }
  }
  else if ((*((_WORD *)a3 + 40) & 0x4000) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 0x1000) != 0)
  {
    if ((*((_WORD *)a3 + 40) & 0x1000) == 0) {
      goto LABEL_88;
    }
    if (self->_appVpnUsed)
    {
      if (!*((unsigned char *)a3 + 76)) {
        goto LABEL_88;
      }
    }
    else if (*((unsigned char *)a3 + 76))
    {
      goto LABEL_88;
    }
  }
  else if ((*((_WORD *)a3 + 40) & 0x1000) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)a3 + 40) & 0x100) == 0 || self->_systemAuthenMethod != *((_DWORD *)a3 + 15)) {
      goto LABEL_88;
    }
  }
  else if ((*((_WORD *)a3 + 40) & 0x100) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 0x800) != 0)
  {
    if ((*((_WORD *)a3 + 40) & 0x800) == 0 || self->_userAuthenMethod != *((_DWORD *)a3 + 18)) {
      goto LABEL_88;
    }
  }
  else if ((*((_WORD *)a3 + 40) & 0x800) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_disconnectReason != *((_DWORD *)a3 + 8)) {
      goto LABEL_88;
    }
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 0x2000) == 0)
  {
    if ((*((_WORD *)a3 + 40) & 0x2000) != 0) {
      goto LABEL_88;
    }
    goto LABEL_69;
  }
  if ((*((_WORD *)a3 + 40) & 0x2000) == 0) {
    goto LABEL_88;
  }
  if (self->_connectFailed)
  {
    if (!*((unsigned char *)a3 + 77)) {
      goto LABEL_88;
    }
    goto LABEL_69;
  }
  if (*((unsigned char *)a3 + 77))
  {
LABEL_88:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_69:
  if ((has & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_duration != *((_DWORD *)a3 + 9)) {
      goto LABEL_88;
    }
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0 || self->_reassertCount != *((_DWORD *)a3 + 14)) {
      goto LABEL_88;
    }
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_88;
  }
  if (has)
  {
    if ((v9 & 1) == 0 || self->_inBytes != *((void *)a3 + 1)) {
      goto LABEL_88;
    }
  }
  else if (v9)
  {
    goto LABEL_88;
  }
  LOBYTE(v5) = (v9 & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_outBytes != *((void *)a3 + 2)) {
      goto LABEL_88;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(_WORD *)&self->_has & 4) != 0) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_protocol hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    uint64_t v6 = 2654435761 * self->_triggerType;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
LABEL_6:
      uint64_t v7 = 2654435761 * self->_triggerTrafficClass;
      if ((has & 0x20) != 0) {
        goto LABEL_7;
      }
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_ipv4Installed;
    if ((has & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v8 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_ipv6Installed;
    if ((*(_WORD *)&self->_has & 0x4000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v9 = 0;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_proxyInstalled;
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v10 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_appVpnUsed;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v11 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_11:
    uint64_t v12 = 2654435761 * self->_systemAuthenMethod;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_12;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v12 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_12:
    uint64_t v13 = 2654435761 * self->_userAuthenMethod;
    if ((has & 8) != 0) {
      goto LABEL_13;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v13 = 0;
  if ((has & 8) != 0)
  {
LABEL_13:
    uint64_t v14 = 2654435761 * self->_disconnectReason;
    if ((*(_WORD *)&self->_has & 0x2000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v14 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_14:
    uint64_t v15 = 2654435761 * self->_connectFailed;
    if ((has & 0x10) != 0) {
      goto LABEL_15;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v15 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_15:
    uint64_t v16 = 2654435761 * self->_duration;
    if ((has & 0x80) != 0) {
      goto LABEL_16;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v16 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_16:
    uint64_t v17 = 2654435761 * self->_reassertCount;
    if (has) {
      goto LABEL_17;
    }
LABEL_31:
    unint64_t v18 = 0;
    if ((has & 2) != 0) {
      goto LABEL_18;
    }
LABEL_32:
    unint64_t v19 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
  }
LABEL_30:
  uint64_t v17 = 0;
  if ((has & 1) == 0) {
    goto LABEL_31;
  }
LABEL_17:
  unint64_t v18 = 2654435761u * self->_inBytes;
  if ((has & 2) == 0) {
    goto LABEL_32;
  }
LABEL_18:
  unint64_t v19 = 2654435761u * self->_outBytes;
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  if ((*((_WORD *)a3 + 40) & 4) != 0)
  {
    self->_timestamp = *((void *)a3 + 3);
    *(_WORD *)&self->_has |= 4u;
  }
  if (*((void *)a3 + 6)) {
    -[AWDVPNSession setProtocol:](self, "setProtocol:");
  }
  __int16 v5 = *((_WORD *)a3 + 40);
  if ((v5 & 0x400) != 0)
  {
    self->_triggerType = *((_DWORD *)a3 + 17);
    *(_WORD *)&self->_has |= 0x400u;
    __int16 v5 = *((_WORD *)a3 + 40);
    if ((v5 & 0x200) == 0)
    {
LABEL_7:
      if ((v5 & 0x20) == 0) {
        goto LABEL_8;
      }
      goto LABEL_23;
    }
  }
  else if ((*((_WORD *)a3 + 40) & 0x200) == 0)
  {
    goto LABEL_7;
  }
  self->_triggerTrafficClass = *((_DWORD *)a3 + 16);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)a3 + 40);
  if ((v5 & 0x20) == 0)
  {
LABEL_8:
    if ((v5 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_ipv4Installed = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)a3 + 40);
  if ((v5 & 0x40) == 0)
  {
LABEL_9:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_ipv6Installed = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)a3 + 40);
  if ((v5 & 0x4000) == 0)
  {
LABEL_10:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_proxyInstalled = *((unsigned char *)a3 + 78);
  *(_WORD *)&self->_has |= 0x4000u;
  __int16 v5 = *((_WORD *)a3 + 40);
  if ((v5 & 0x1000) == 0)
  {
LABEL_11:
    if ((v5 & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_appVpnUsed = *((unsigned char *)a3 + 76);
  *(_WORD *)&self->_has |= 0x1000u;
  __int16 v5 = *((_WORD *)a3 + 40);
  if ((v5 & 0x100) == 0)
  {
LABEL_12:
    if ((v5 & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_systemAuthenMethod = *((_DWORD *)a3 + 15);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)a3 + 40);
  if ((v5 & 0x800) == 0)
  {
LABEL_13:
    if ((v5 & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_userAuthenMethod = *((_DWORD *)a3 + 18);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v5 = *((_WORD *)a3 + 40);
  if ((v5 & 8) == 0)
  {
LABEL_14:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_disconnectReason = *((_DWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)a3 + 40);
  if ((v5 & 0x2000) == 0)
  {
LABEL_15:
    if ((v5 & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_connectFailed = *((unsigned char *)a3 + 77);
  *(_WORD *)&self->_has |= 0x2000u;
  __int16 v5 = *((_WORD *)a3 + 40);
  if ((v5 & 0x10) == 0)
  {
LABEL_16:
    if ((v5 & 0x80) == 0) {
      goto LABEL_17;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_duration = *((_DWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)a3 + 40);
  if ((v5 & 0x80) == 0)
  {
LABEL_17:
    if ((v5 & 1) == 0) {
      goto LABEL_18;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_reassertCount = *((_DWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)a3 + 40);
  if ((v5 & 1) == 0)
  {
LABEL_18:
    if ((v5 & 2) == 0) {
      return;
    }
    goto LABEL_19;
  }
LABEL_33:
  self->_inBytes = *((void *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  if ((*((_WORD *)a3 + 40) & 2) == 0) {
    return;
  }
LABEL_19:
  self->_outBytes = *((void *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(id)a3
{
}

- (unsigned)triggerType
{
  return self->_triggerType;
}

- (unsigned)triggerTrafficClass
{
  return self->_triggerTrafficClass;
}

- (unsigned)ipv4Installed
{
  return self->_ipv4Installed;
}

- (unsigned)ipv6Installed
{
  return self->_ipv6Installed;
}

- (BOOL)proxyInstalled
{
  return self->_proxyInstalled;
}

- (BOOL)appVpnUsed
{
  return self->_appVpnUsed;
}

- (unsigned)systemAuthenMethod
{
  return self->_systemAuthenMethod;
}

- (unsigned)userAuthenMethod
{
  return self->_userAuthenMethod;
}

- (unsigned)disconnectReason
{
  return self->_disconnectReason;
}

- (BOOL)connectFailed
{
  return self->_connectFailed;
}

- (unsigned)duration
{
  return self->_duration;
}

- (unsigned)reassertCount
{
  return self->_reassertCount;
}

- (unint64_t)inBytes
{
  return self->_inBytes;
}

- (unint64_t)outBytes
{
  return self->_outBytes;
}

@end