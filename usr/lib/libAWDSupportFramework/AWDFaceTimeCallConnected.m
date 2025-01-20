@interface AWDFaceTimeCallConnected
- (BOOL)hasConnectDuration;
- (BOOL)hasConnectionType;
- (BOOL)hasCurrentNatType;
- (BOOL)hasGuid;
- (BOOL)hasIsVideo;
- (BOOL)hasLocalNetworkConnection;
- (BOOL)hasOnLockScreen;
- (BOOL)hasRelayConnectDuration;
- (BOOL)hasRemoteNatType;
- (BOOL)hasRemoteNetworkConnection;
- (BOOL)hasTimestamp;
- (BOOL)hasUsesRelay;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)guid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)connectDuration;
- (unsigned)connectionType;
- (unsigned)currentNatType;
- (unsigned)isVideo;
- (unsigned)localNetworkConnection;
- (unsigned)onLockScreen;
- (unsigned)relayConnectDuration;
- (unsigned)remoteNatType;
- (unsigned)remoteNetworkConnection;
- (unsigned)usesRelay;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setConnectDuration:(unsigned int)a3;
- (void)setConnectionType:(unsigned int)a3;
- (void)setCurrentNatType:(unsigned int)a3;
- (void)setGuid:(id)a3;
- (void)setHasConnectDuration:(BOOL)a3;
- (void)setHasConnectionType:(BOOL)a3;
- (void)setHasCurrentNatType:(BOOL)a3;
- (void)setHasIsVideo:(BOOL)a3;
- (void)setHasLocalNetworkConnection:(BOOL)a3;
- (void)setHasOnLockScreen:(BOOL)a3;
- (void)setHasRelayConnectDuration:(BOOL)a3;
- (void)setHasRemoteNatType:(BOOL)a3;
- (void)setHasRemoteNetworkConnection:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasUsesRelay:(BOOL)a3;
- (void)setIsVideo:(unsigned int)a3;
- (void)setLocalNetworkConnection:(unsigned int)a3;
- (void)setOnLockScreen:(unsigned int)a3;
- (void)setRelayConnectDuration:(unsigned int)a3;
- (void)setRemoteNatType:(unsigned int)a3;
- (void)setRemoteNetworkConnection:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUsesRelay:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDFaceTimeCallConnected

- (void)dealloc
{
  [(AWDFaceTimeCallConnected *)self setGuid:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDFaceTimeCallConnected;
  [(AWDFaceTimeCallConnected *)&v3 dealloc];
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

- (void)setConnectDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_connectDuration = a3;
}

- (void)setHasConnectDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasConnectDuration
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setRemoteNetworkConnection:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_remoteNetworkConnection = a3;
}

- (void)setHasRemoteNetworkConnection:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasRemoteNetworkConnection
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setLocalNetworkConnection:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_localNetworkConnection = a3;
}

- (void)setHasLocalNetworkConnection:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasLocalNetworkConnection
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setConnectionType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_connectionType = a3;
}

- (void)setHasConnectionType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasConnectionType
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setUsesRelay:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_usesRelay = a3;
}

- (void)setHasUsesRelay:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasUsesRelay
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setCurrentNatType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_currentNatType = a3;
}

- (void)setHasCurrentNatType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasCurrentNatType
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setRemoteNatType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_remoteNatType = a3;
}

- (void)setHasRemoteNatType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRemoteNatType
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setRelayConnectDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_relayConnectDuration = a3;
}

- (void)setHasRelayConnectDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRelayConnectDuration
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setIsVideo:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_isVideo = a3;
}

- (void)setHasIsVideo:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasIsVideo
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setOnLockScreen:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_onLockScreen = a3;
}

- (void)setHasOnLockScreen:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasOnLockScreen
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDFaceTimeCallConnected;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDFaceTimeCallConnected description](&v3, sel_description), -[AWDFaceTimeCallConnected dictionaryRepresentation](self, "dictionaryRepresentation")];
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
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x200) == 0) {
        goto LABEL_6;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_5;
  }
  [v4 setObject:[NSNumber numberWithUnsignedInt:self->_connectDuration] forKey:@"connectDuration"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  [v4 setObject:[NSNumber numberWithUnsignedInt:self->_remoteNetworkConnection] forKey:@"remoteNetworkConnection"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v4 setObject:[NSNumber numberWithUnsignedInt:self->_localNetworkConnection] forKey:@"localNetworkConnection"];
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  [v4 setObject:[NSNumber numberWithUnsignedInt:self->_connectionType] forKey:@"connectionType"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  [v4 setObject:[NSNumber numberWithUnsignedInt:self->_usesRelay] forKey:@"usesRelay"];
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v4 setObject:[NSNumber numberWithUnsignedInt:self->_currentNatType] forKey:@"currentNatType"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v4 setObject:[NSNumber numberWithUnsignedInt:self->_remoteNatType] forKey:@"remoteNatType"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_13;
    }
LABEL_25:
    [v4 setObject:[NSNumber numberWithUnsignedInt:self->_isVideo] forKey:@"isVideo"];
    if ((*(_WORD *)&self->_has & 0x40) == 0) {
      return v4;
    }
    goto LABEL_14;
  }
LABEL_24:
  [v4 setObject:[NSNumber numberWithUnsignedInt:self->_relayConnectDuration] forKey:@"relayConnectDuration"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_25;
  }
LABEL_13:
  if ((has & 0x40) != 0) {
LABEL_14:
  }
    [v4 setObject:[NSNumber numberWithUnsignedInt:self->_onLockScreen] forKey:@"onLockScreen"];
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDFaceTimeCallConnectedReadFrom((uint64_t)self, (uint64_t)a3);
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
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x200) == 0) {
        goto LABEL_6;
      }
      goto LABEL_17;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_13;
    }
LABEL_24:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_has & 0x40) == 0) {
      return;
    }
    goto LABEL_25;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_24;
  }
LABEL_13:
  if ((has & 0x40) == 0) {
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
    *((_WORD *)a3 + 34) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x200) == 0) {
        goto LABEL_6;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)a3 + 4) = self->_connectDuration;
  *((_WORD *)a3 + 34) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 15) = self->_remoteNetworkConnection;
  *((_WORD *)a3 + 34) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 11) = self->_localNetworkConnection;
  *((_WORD *)a3 + 34) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)a3 + 5) = self->_connectionType;
  *((_WORD *)a3 + 34) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)a3 + 16) = self->_usesRelay;
  *((_WORD *)a3 + 34) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)a3 + 6) = self->_currentNatType;
  *((_WORD *)a3 + 34) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)a3 + 14) = self->_remoteNatType;
  *((_WORD *)a3 + 34) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)a3 + 13) = self->_relayConnectDuration;
  *((_WORD *)a3 + 34) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 0x40) == 0) {
      return;
    }
    goto LABEL_14;
  }
LABEL_25:
  *((_DWORD *)a3 + 10) = self->_isVideo;
  *((_WORD *)a3 + 34) |= 0x10u;
  if ((*(_WORD *)&self->_has & 0x40) == 0) {
    return;
  }
LABEL_14:
  *((_DWORD *)a3 + 12) = self->_onLockScreen;
  *((_WORD *)a3 + 34) |= 0x40u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];

  *(void *)(v5 + 32) = [(NSString *)self->_guid copyWithZone:a3];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(_WORD *)(v5 + 68) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 16) = self->_connectDuration;
  *(_WORD *)(v5 + 68) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  *(_DWORD *)(v5 + 60) = self->_remoteNetworkConnection;
  *(_WORD *)(v5 + 68) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  *(_DWORD *)(v5 + 44) = self->_localNetworkConnection;
  *(_WORD *)(v5 + 68) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  *(_DWORD *)(v5 + 20) = self->_connectionType;
  *(_WORD *)(v5 + 68) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  *(_DWORD *)(v5 + 64) = self->_usesRelay;
  *(_WORD *)(v5 + 68) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  *(_DWORD *)(v5 + 24) = self->_currentNatType;
  *(_WORD *)(v5 + 68) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  *(_DWORD *)(v5 + 56) = self->_remoteNatType;
  *(_WORD *)(v5 + 68) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0) {
      goto LABEL_11;
    }
LABEL_23:
    *(_DWORD *)(v5 + 40) = self->_isVideo;
    *(_WORD *)(v5 + 68) |= 0x10u;
    if ((*(_WORD *)&self->_has & 0x40) == 0) {
      return (id)v5;
    }
    goto LABEL_12;
  }
LABEL_22:
  *(_DWORD *)(v5 + 52) = self->_relayConnectDuration;
  *(_WORD *)(v5 + 68) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_23;
  }
LABEL_11:
  if ((has & 0x40) != 0)
  {
LABEL_12:
    *(_DWORD *)(v5 + 48) = self->_onLockScreen;
    *(_WORD *)(v5 + 68) |= 0x40u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    guid = self->_guid;
    if (!((unint64_t)guid | *((void *)a3 + 4)) || (int v5 = -[NSString isEqual:](guid, "isEqual:")) != 0)
    {
      __int16 has = (__int16)self->_has;
      __int16 v8 = *((_WORD *)a3 + 34);
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
      if ((has & 2) != 0)
      {
        if ((v8 & 2) == 0 || self->_connectDuration != *((_DWORD *)a3 + 4)) {
          goto LABEL_58;
        }
      }
      else if ((v8 & 2) != 0)
      {
        goto LABEL_58;
      }
      if ((*(_WORD *)&self->_has & 0x200) != 0)
      {
        if ((*((_WORD *)a3 + 34) & 0x200) == 0 || self->_remoteNetworkConnection != *((_DWORD *)a3 + 15)) {
          goto LABEL_58;
        }
      }
      else if ((*((_WORD *)a3 + 34) & 0x200) != 0)
      {
        goto LABEL_58;
      }
      if ((has & 0x20) != 0)
      {
        if ((v8 & 0x20) == 0 || self->_localNetworkConnection != *((_DWORD *)a3 + 11)) {
          goto LABEL_58;
        }
      }
      else if ((v8 & 0x20) != 0)
      {
        goto LABEL_58;
      }
      if ((has & 4) != 0)
      {
        if ((v8 & 4) == 0 || self->_connectionType != *((_DWORD *)a3 + 5)) {
          goto LABEL_58;
        }
      }
      else if ((v8 & 4) != 0)
      {
        goto LABEL_58;
      }
      if ((*(_WORD *)&self->_has & 0x400) != 0)
      {
        if ((*((_WORD *)a3 + 34) & 0x400) == 0 || self->_usesRelay != *((_DWORD *)a3 + 16)) {
          goto LABEL_58;
        }
      }
      else if ((*((_WORD *)a3 + 34) & 0x400) != 0)
      {
        goto LABEL_58;
      }
      if ((has & 8) != 0)
      {
        if ((v8 & 8) == 0 || self->_currentNatType != *((_DWORD *)a3 + 6)) {
          goto LABEL_58;
        }
      }
      else if ((v8 & 8) != 0)
      {
        goto LABEL_58;
      }
      if ((*(_WORD *)&self->_has & 0x100) != 0)
      {
        if ((*((_WORD *)a3 + 34) & 0x100) == 0 || self->_remoteNatType != *((_DWORD *)a3 + 14)) {
          goto LABEL_58;
        }
      }
      else if ((*((_WORD *)a3 + 34) & 0x100) != 0)
      {
        goto LABEL_58;
      }
      if ((has & 0x80) != 0)
      {
        if ((v8 & 0x80) == 0 || self->_relayConnectDuration != *((_DWORD *)a3 + 13)) {
          goto LABEL_58;
        }
      }
      else if ((v8 & 0x80) != 0)
      {
        goto LABEL_58;
      }
      if ((has & 0x10) != 0)
      {
        if ((v8 & 0x10) == 0 || self->_isVideo != *((_DWORD *)a3 + 10)) {
          goto LABEL_58;
        }
      }
      else if ((v8 & 0x10) != 0)
      {
        goto LABEL_58;
      }
      LOBYTE(v5) = (v8 & 0x40) == 0;
      if ((has & 0x40) != 0)
      {
        if ((v8 & 0x40) == 0 || self->_onLockScreen != *((_DWORD *)a3 + 12)) {
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
    if ((has & 2) != 0)
    {
LABEL_3:
      uint64_t v6 = 2654435761 * self->_connectDuration;
      if ((*(_WORD *)&self->_has & 0x200) != 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else
  {
    unint64_t v5 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v6 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_4:
    uint64_t v7 = 2654435761 * self->_remoteNetworkConnection;
    if ((has & 0x20) != 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_5:
    uint64_t v8 = 2654435761 * self->_localNetworkConnection;
    if ((has & 4) != 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v8 = 0;
  if ((has & 4) != 0)
  {
LABEL_6:
    uint64_t v9 = 2654435761 * self->_connectionType;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v9 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_7:
    uint64_t v10 = 2654435761 * self->_usesRelay;
    if ((has & 8) != 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v10 = 0;
  if ((has & 8) != 0)
  {
LABEL_8:
    uint64_t v11 = 2654435761 * self->_currentNatType;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v11 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_9:
    uint64_t v12 = 2654435761 * self->_remoteNatType;
    if ((has & 0x80) != 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v12 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_10:
    uint64_t v13 = 2654435761 * self->_relayConnectDuration;
    if ((has & 0x10) != 0) {
      goto LABEL_11;
    }
LABEL_22:
    uint64_t v14 = 0;
    if ((has & 0x40) != 0) {
      goto LABEL_12;
    }
LABEL_23:
    uint64_t v15 = 0;
    return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
  }
LABEL_21:
  uint64_t v13 = 0;
  if ((has & 0x10) == 0) {
    goto LABEL_22;
  }
LABEL_11:
  uint64_t v14 = 2654435761 * self->_isVideo;
  if ((has & 0x40) == 0) {
    goto LABEL_23;
  }
LABEL_12:
  uint64_t v15 = 2654435761 * self->_onLockScreen;
  return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 4)) {
    -[AWDFaceTimeCallConnected setGuid:](self, "setGuid:");
  }
  __int16 v5 = *((_WORD *)a3 + 34);
  if (v5)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v5 = *((_WORD *)a3 + 34);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 0x200) == 0) {
        goto LABEL_6;
      }
      goto LABEL_18;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_connectDuration = *((_DWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)a3 + 34);
  if ((v5 & 0x200) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_remoteNetworkConnection = *((_DWORD *)a3 + 15);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)a3 + 34);
  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_localNetworkConnection = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)a3 + 34);
  if ((v5 & 4) == 0)
  {
LABEL_8:
    if ((v5 & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_connectionType = *((_DWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)a3 + 34);
  if ((v5 & 0x400) == 0)
  {
LABEL_9:
    if ((v5 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_usesRelay = *((_DWORD *)a3 + 16);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v5 = *((_WORD *)a3 + 34);
  if ((v5 & 8) == 0)
  {
LABEL_10:
    if ((v5 & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_currentNatType = *((_DWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)a3 + 34);
  if ((v5 & 0x100) == 0)
  {
LABEL_11:
    if ((v5 & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_remoteNatType = *((_DWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)a3 + 34);
  if ((v5 & 0x80) == 0)
  {
LABEL_12:
    if ((v5 & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_relayConnectDuration = *((_DWORD *)a3 + 13);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)a3 + 34);
  if ((v5 & 0x10) == 0)
  {
LABEL_13:
    if ((v5 & 0x40) == 0) {
      return;
    }
    goto LABEL_14;
  }
LABEL_25:
  self->_isVideo = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x10u;
  if ((*((_WORD *)a3 + 34) & 0x40) == 0) {
    return;
  }
LABEL_14:
  self->_onLockScreen = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x40u;
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

- (unsigned)connectDuration
{
  return self->_connectDuration;
}

- (unsigned)remoteNetworkConnection
{
  return self->_remoteNetworkConnection;
}

- (unsigned)localNetworkConnection
{
  return self->_localNetworkConnection;
}

- (unsigned)connectionType
{
  return self->_connectionType;
}

- (unsigned)usesRelay
{
  return self->_usesRelay;
}

- (unsigned)currentNatType
{
  return self->_currentNatType;
}

- (unsigned)remoteNatType
{
  return self->_remoteNatType;
}

- (unsigned)relayConnectDuration
{
  return self->_relayConnectDuration;
}

- (unsigned)isVideo
{
  return self->_isVideo;
}

- (unsigned)onLockScreen
{
  return self->_onLockScreen;
}

@end