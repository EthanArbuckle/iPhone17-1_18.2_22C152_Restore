@interface AWDWifiMostUsedNetworks
- (BOOL)hasApOUI;
- (BOOL)hasApOui;
- (BOOL)hasBundleID;
- (BOOL)hasNetworkScore;
- (BOOL)hasNetworkScoreBitMap;
- (BOOL)hasSecurityType;
- (BOOL)hasSwitchToCount;
- (BOOL)hasSwitchedAwayFromCount;
- (BOOL)hasTimeUsed;
- (BOOL)hasTimeUsedMinutes;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)apOui;
- (NSString)bundleID;
- (double)timeUsed;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)networkScore;
- (unint64_t)hash;
- (unsigned)apOUI;
- (unsigned)networkScoreBitMap;
- (unsigned)securityType;
- (unsigned)switchToCount;
- (unsigned)switchedAwayFromCount;
- (unsigned)timeUsedMinutes;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setApOUI:(unsigned int)a3;
- (void)setApOui:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setHasApOUI:(BOOL)a3;
- (void)setHasNetworkScore:(BOOL)a3;
- (void)setHasNetworkScoreBitMap:(BOOL)a3;
- (void)setHasSecurityType:(BOOL)a3;
- (void)setHasSwitchToCount:(BOOL)a3;
- (void)setHasSwitchedAwayFromCount:(BOOL)a3;
- (void)setHasTimeUsed:(BOOL)a3;
- (void)setHasTimeUsedMinutes:(BOOL)a3;
- (void)setNetworkScore:(int)a3;
- (void)setNetworkScoreBitMap:(unsigned int)a3;
- (void)setSecurityType:(unsigned int)a3;
- (void)setSwitchToCount:(unsigned int)a3;
- (void)setSwitchedAwayFromCount:(unsigned int)a3;
- (void)setTimeUsed:(double)a3;
- (void)setTimeUsedMinutes:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWifiMostUsedNetworks

- (void)dealloc
{
  [(AWDWifiMostUsedNetworks *)self setApOui:0];
  [(AWDWifiMostUsedNetworks *)self setBundleID:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWifiMostUsedNetworks;
  [(AWDWifiMostUsedNetworks *)&v3 dealloc];
}

- (void)setApOUI:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_apOUI = a3;
}

- (void)setHasApOUI:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasApOUI
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSecurityType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_securityType = a3;
}

- (void)setHasSecurityType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSecurityType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setTimeUsed:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timeUsed = a3;
}

- (void)setHasTimeUsed:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimeUsed
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasApOui
{
  return self->_apOui != 0;
}

- (void)setTimeUsedMinutes:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_timeUsedMinutes = a3;
}

- (void)setHasTimeUsedMinutes:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasTimeUsedMinutes
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setNetworkScoreBitMap:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_networkScoreBitMap = a3;
}

- (void)setHasNetworkScoreBitMap:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNetworkScoreBitMap
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setSwitchedAwayFromCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_switchedAwayFromCount = a3;
}

- (void)setHasSwitchedAwayFromCount:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSwitchedAwayFromCount
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setSwitchToCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_switchToCount = a3;
}

- (void)setHasSwitchToCount:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSwitchToCount
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setNetworkScore:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_networkScore = a3;
}

- (void)setHasNetworkScore:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNetworkScore
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWifiMostUsedNetworks;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWifiMostUsedNetworks description](&v3, sel_description), -[AWDWifiMostUsedNetworks dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_apOUI] forKey:@"apOUI"];
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_securityType] forKey:@"securityType"];
  if (*(unsigned char *)&self->_has) {
LABEL_4:
  }
    [v3 setObject:[NSNumber numberWithDouble:self->_timeUsed] forKey:@"timeUsed"];
LABEL_5:
  apOui = self->_apOui;
  if (apOui) {
    [v3 setObject:apOui forKey:@"ap_oui"];
  }
  $A3B061B97E82196ABF4B92F2EAE2AE9E v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000000) == 0)
  {
    if ((*(unsigned char *)&v6 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_timeUsedMinutes] forKey:@"timeUsedMinutes"];
  *(unsigned char *)&$A3B061B97E82196ABF4B92F2EAE2AE9E v6 = self->_has;
  if ((*(unsigned char *)&v6 & 8) != 0)
  {
LABEL_9:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_networkScoreBitMap] forKey:@"networkScoreBitMap"];
    *(unsigned char *)&$A3B061B97E82196ABF4B92F2EAE2AE9E v6 = self->_has;
  }
LABEL_10:
  if ((*(unsigned char *)&v6 & 0x40) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_switchedAwayFromCount] forKey:@"switchedAwayFromCount"];
    *(unsigned char *)&$A3B061B97E82196ABF4B92F2EAE2AE9E v6 = self->_has;
    if ((*(unsigned char *)&v6 & 0x20) == 0)
    {
LABEL_12:
      if ((*(unsigned char *)&v6 & 4) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&v6 & 0x20) == 0)
  {
    goto LABEL_12;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_switchToCount] forKey:@"switchToCount"];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_13:
  }
    [v3 setObject:[NSNumber numberWithInt:self->_networkScore] forKey:@"networkScore"];
LABEL_14:
  bundleID = self->_bundleID;
  if (bundleID) {
    [v3 setObject:bundleID forKey:@"bundleID"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWifiMostUsedNetworksReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  if (*(unsigned char *)&self->_has) {
LABEL_4:
  }
    PBDataWriterWriteDoubleField();
LABEL_5:
  if (self->_apOui) {
    PBDataWriterWriteDataField();
  }
  $A3B061B97E82196ABF4B92F2EAE2AE9E v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x80000000) == 0)
  {
    if ((*(unsigned char *)&v5 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  PBDataWriterWriteUint32Field();
  *(unsigned char *)&$A3B061B97E82196ABF4B92F2EAE2AE9E v5 = self->_has;
  if ((*(unsigned char *)&v5 & 8) != 0)
  {
LABEL_9:
    PBDataWriterWriteUint32Field();
    *(unsigned char *)&$A3B061B97E82196ABF4B92F2EAE2AE9E v5 = self->_has;
  }
LABEL_10:
  if ((*(unsigned char *)&v5 & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field();
    *(unsigned char *)&$A3B061B97E82196ABF4B92F2EAE2AE9E v5 = self->_has;
    if ((*(unsigned char *)&v5 & 0x20) == 0)
    {
LABEL_12:
      if ((*(unsigned char *)&v5 & 4) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&v5 & 0x20) == 0)
  {
    goto LABEL_12;
  }
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_13:
  }
    PBDataWriterWriteInt32Field();
LABEL_14:
  if (self->_bundleID)
  {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_apOUI;
    *((unsigned char *)a3 + 64) |= 2u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 12) = self->_securityType;
  *((unsigned char *)a3 + 64) |= 0x10u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    *((void *)a3 + 1) = *(void *)&self->_timeUsed;
    *((unsigned char *)a3 + 64) |= 1u;
  }
LABEL_5:
  if (self->_apOui) {
    [a3 setApOui:];
  }
  $A3B061B97E82196ABF4B92F2EAE2AE9E v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000000) == 0)
  {
    if ((*(unsigned char *)&v6 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  *((_DWORD *)a3 + 15) = self->_timeUsedMinutes;
  *((unsigned char *)a3 + 64) |= 0x80u;
  *(unsigned char *)&$A3B061B97E82196ABF4B92F2EAE2AE9E v6 = self->_has;
  if ((*(unsigned char *)&v6 & 8) != 0)
  {
LABEL_9:
    *((_DWORD *)a3 + 11) = self->_networkScoreBitMap;
    *((unsigned char *)a3 + 64) |= 8u;
    *(unsigned char *)&$A3B061B97E82196ABF4B92F2EAE2AE9E v6 = self->_has;
  }
LABEL_10:
  if ((*(unsigned char *)&v6 & 0x40) != 0)
  {
    *((_DWORD *)a3 + 14) = self->_switchedAwayFromCount;
    *((unsigned char *)a3 + 64) |= 0x40u;
    *(unsigned char *)&$A3B061B97E82196ABF4B92F2EAE2AE9E v6 = self->_has;
    if ((*(unsigned char *)&v6 & 0x20) == 0)
    {
LABEL_12:
      if ((*(unsigned char *)&v6 & 4) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&v6 & 0x20) == 0)
  {
    goto LABEL_12;
  }
  *((_DWORD *)a3 + 13) = self->_switchToCount;
  *((unsigned char *)a3 + 64) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_13:
    *((_DWORD *)a3 + 10) = self->_networkScore;
    *((unsigned char *)a3 + 64) |= 4u;
  }
LABEL_14:
  if (self->_bundleID)
  {
    [a3 setBundleID:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [objc_opt_class() allocWithZone:a3];
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_apOUI;
    *(unsigned char *)(v5 + 64) |= 2u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 48) = self->_securityType;
  *(unsigned char *)(v5 + 64) |= 0x10u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    *(double *)(v5 + 8) = self->_timeUsed;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
LABEL_5:

  *(void *)(v6 + 24) = [(NSData *)self->_apOui copyWithZone:a3];
  $A3B061B97E82196ABF4B92F2EAE2AE9E v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x80000000) == 0)
  {
    if ((*(unsigned char *)&v8 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  *(_DWORD *)(v6 + 60) = self->_timeUsedMinutes;
  *(unsigned char *)(v6 + 64) |= 0x80u;
  *(unsigned char *)&$A3B061B97E82196ABF4B92F2EAE2AE9E v8 = self->_has;
  if ((*(unsigned char *)&v8 & 8) != 0)
  {
LABEL_7:
    *(_DWORD *)(v6 + 44) = self->_networkScoreBitMap;
    *(unsigned char *)(v6 + 64) |= 8u;
    *(unsigned char *)&$A3B061B97E82196ABF4B92F2EAE2AE9E v8 = self->_has;
  }
LABEL_8:
  if ((*(unsigned char *)&v8 & 0x40) == 0)
  {
    if ((*(unsigned char *)&v8 & 0x20) == 0) {
      goto LABEL_10;
    }
LABEL_17:
    *(_DWORD *)(v6 + 52) = self->_switchToCount;
    *(unsigned char *)(v6 + 64) |= 0x20u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  *(_DWORD *)(v6 + 56) = self->_switchedAwayFromCount;
  *(unsigned char *)(v6 + 64) |= 0x40u;
  *(unsigned char *)&$A3B061B97E82196ABF4B92F2EAE2AE9E v8 = self->_has;
  if ((*(unsigned char *)&v8 & 0x20) != 0) {
    goto LABEL_17;
  }
LABEL_10:
  if ((*(unsigned char *)&v8 & 4) != 0)
  {
LABEL_11:
    *(_DWORD *)(v6 + 40) = self->_networkScore;
    *(unsigned char *)(v6 + 64) |= 4u;
  }
LABEL_12:

  *(void *)(v6 + 32) = [(NSString *)self->_bundleID copyWithZone:a3];
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    char has = (char)self->_has;
    if ((has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 64) & 2) == 0 || self->_apOUI != *((_DWORD *)a3 + 4)) {
        goto LABEL_47;
      }
    }
    else if ((*((unsigned char *)a3 + 64) & 2) != 0)
    {
      goto LABEL_47;
    }
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 64) & 0x10) == 0 || self->_securityType != *((_DWORD *)a3 + 12)) {
        goto LABEL_47;
      }
    }
    else if ((*((unsigned char *)a3 + 64) & 0x10) != 0)
    {
      goto LABEL_47;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 64) & 1) == 0 || self->_timeUsed != *((double *)a3 + 1)) {
        goto LABEL_47;
      }
    }
    else if (*((unsigned char *)a3 + 64))
    {
      goto LABEL_47;
    }
    apOui = self->_apOui;
    if ((unint64_t)apOui | *((void *)a3 + 3))
    {
      int v5 = -[NSData isEqual:](apOui, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    if (has < 0)
    {
      if ((*((unsigned char *)a3 + 64) & 0x80) == 0 || self->_timeUsedMinutes != *((_DWORD *)a3 + 15)) {
        goto LABEL_47;
      }
    }
    else if ((*((unsigned char *)a3 + 64) & 0x80) != 0)
    {
LABEL_47:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 64) & 8) == 0 || self->_networkScoreBitMap != *((_DWORD *)a3 + 11)) {
        goto LABEL_47;
      }
    }
    else if ((*((unsigned char *)a3 + 64) & 8) != 0)
    {
      goto LABEL_47;
    }
    if ((has & 0x40) != 0)
    {
      if ((*((unsigned char *)a3 + 64) & 0x40) == 0 || self->_switchedAwayFromCount != *((_DWORD *)a3 + 14)) {
        goto LABEL_47;
      }
    }
    else if ((*((unsigned char *)a3 + 64) & 0x40) != 0)
    {
      goto LABEL_47;
    }
    if ((has & 0x20) != 0)
    {
      if ((*((unsigned char *)a3 + 64) & 0x20) == 0 || self->_switchToCount != *((_DWORD *)a3 + 13)) {
        goto LABEL_47;
      }
    }
    else if ((*((unsigned char *)a3 + 64) & 0x20) != 0)
    {
      goto LABEL_47;
    }
    if ((has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 64) & 4) == 0 || self->_networkScore != *((_DWORD *)a3 + 10)) {
        goto LABEL_47;
      }
    }
    else if ((*((unsigned char *)a3 + 64) & 4) != 0)
    {
      goto LABEL_47;
    }
    bundleID = self->_bundleID;
    if ((unint64_t)bundleID | *((void *)a3 + 4))
    {
      LOBYTE(v5) = -[NSString isEqual:](bundleID, "isEqual:");
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v4 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v9 = 0;
    goto LABEL_13;
  }
  uint64_t v3 = 2654435761 * self->_apOUI;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_securityType;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  double timeUsed = self->_timeUsed;
  double v6 = -timeUsed;
  if (timeUsed >= 0.0) {
    double v6 = self->_timeUsed;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_13:
  uint64_t v10 = [(NSData *)self->_apOui hash];
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    uint64_t v11 = 2654435761 * self->_timeUsedMinutes;
    if ((*(unsigned char *)&self->_has & 8) == 0)
    {
LABEL_15:
      uint64_t v12 = 0;
      if ((*(unsigned char *)&self->_has & 0x40) != 0) {
        goto LABEL_16;
      }
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v11 = 0;
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_15;
    }
  }
  uint64_t v12 = 2654435761 * self->_networkScoreBitMap;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_16:
    uint64_t v13 = 2654435761 * self->_switchedAwayFromCount;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_17;
    }
LABEL_22:
    uint64_t v14 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_18;
    }
LABEL_23:
    uint64_t v15 = 0;
    return v4 ^ v3 ^ v9 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v10 ^ [(NSString *)self->_bundleID hash];
  }
LABEL_21:
  uint64_t v13 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_22;
  }
LABEL_17:
  uint64_t v14 = 2654435761 * self->_switchToCount;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_23;
  }
LABEL_18:
  uint64_t v15 = 2654435761 * self->_networkScore;
  return v4 ^ v3 ^ v9 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v10 ^ [(NSString *)self->_bundleID hash];
}

- (void)mergeFrom:(id)a3
{
  char v5 = *((unsigned char *)a3 + 64);
  if ((v5 & 2) != 0)
  {
    self->_apOUI = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)a3 + 64);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)a3 + 64) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_securityType = *((_DWORD *)a3 + 12);
  *(unsigned char *)&self->_has |= 0x10u;
  if (*((unsigned char *)a3 + 64))
  {
LABEL_4:
    self->_double timeUsed = *((double *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_5:
  if (*((void *)a3 + 3)) {
    -[AWDWifiMostUsedNetworks setApOui:](self, "setApOui:");
  }
  int v6 = *((char *)a3 + 64);
  if ((v6 & 0x80000000) == 0)
  {
    if ((v6 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  self->_timeUsedMinutes = *((_DWORD *)a3 + 15);
  *(unsigned char *)&self->_has |= 0x80u;
  LOBYTE(v6) = *((unsigned char *)a3 + 64);
  if ((v6 & 8) != 0)
  {
LABEL_9:
    self->_networkScoreBitMap = *((_DWORD *)a3 + 11);
    *(unsigned char *)&self->_has |= 8u;
    LOBYTE(v6) = *((unsigned char *)a3 + 64);
  }
LABEL_10:
  if ((v6 & 0x40) != 0)
  {
    self->_switchedAwayFromCount = *((_DWORD *)a3 + 14);
    *(unsigned char *)&self->_has |= 0x40u;
    LOBYTE(v6) = *((unsigned char *)a3 + 64);
    if ((v6 & 0x20) == 0)
    {
LABEL_12:
      if ((v6 & 4) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_12;
  }
  self->_switchToCount = *((_DWORD *)a3 + 13);
  *(unsigned char *)&self->_has |= 0x20u;
  if ((*((unsigned char *)a3 + 64) & 4) != 0)
  {
LABEL_13:
    self->_networkScore = *((_DWORD *)a3 + 10);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_14:
  if (*((void *)a3 + 4))
  {
    -[AWDWifiMostUsedNetworks setBundleID:](self, "setBundleID:");
  }
}

- (unsigned)apOUI
{
  return self->_apOUI;
}

- (unsigned)securityType
{
  return self->_securityType;
}

- (double)timeUsed
{
  return self->_timeUsed;
}

- (NSData)apOui
{
  return self->_apOui;
}

- (void)setApOui:(id)a3
{
}

- (unsigned)timeUsedMinutes
{
  return self->_timeUsedMinutes;
}

- (unsigned)networkScoreBitMap
{
  return self->_networkScoreBitMap;
}

- (unsigned)switchedAwayFromCount
{
  return self->_switchedAwayFromCount;
}

- (unsigned)switchToCount
{
  return self->_switchToCount;
}

- (int)networkScore
{
  return self->_networkScore;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

@end