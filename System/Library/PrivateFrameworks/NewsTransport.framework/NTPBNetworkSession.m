@interface NTPBNetworkSession
- (BOOL)hasCellularRadioAccessTechnology;
- (BOOL)hasSessionID;
- (BOOL)hasWifiReachable;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)wifiReachable;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)cellularRadioAccessTechnology;
- (unint64_t)hash;
- (unint64_t)sessionID;
- (void)mergeFrom:(id)a3;
- (void)setCellularRadioAccessTechnology:(int)a3;
- (void)setHasCellularRadioAccessTechnology:(BOOL)a3;
- (void)setHasSessionID:(BOOL)a3;
- (void)setHasWifiReachable:(BOOL)a3;
- (void)setSessionID:(unint64_t)a3;
- (void)setWifiReachable:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBNetworkSession

- (unint64_t)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_sessionID = a3;
}

- (void)setWifiReachable:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_wifiReachable = a3;
}

- (void)setCellularRadioAccessTechnology:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_cellularRadioAccessTechnology = a3;
}

- (void)setHasSessionID:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSessionID
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasWifiReachable:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasWifiReachable
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasCellularRadioAccessTechnology:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCellularRadioAccessTechnology
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBNetworkSession;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBNetworkSession description](&v3, sel_description), -[NTPBNetworkSession dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_wifiReachable), @"wifi_reachable");
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return v3;
    }
    goto LABEL_4;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_sessionID), @"session_ID");
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 2) != 0) {
LABEL_4:
  }
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", self->_cellularRadioAccessTechnology), @"cellular_radio_access_technology");
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBNetworkSessionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    PBDataWriterWriteBOOLField();
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return;
    }
    goto LABEL_7;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((has & 2) == 0) {
    return;
  }
LABEL_7:

  PBDataWriterWriteInt32Field();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_sessionID;
    *((unsigned char *)result + 24) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)result + 20) = self->_wifiReachable;
  *((unsigned char *)result + 24) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_4:
  *((_DWORD *)result + 4) = self->_cellularRadioAccessTechnology;
  *((unsigned char *)result + 24) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)a3 + 24) & 1) == 0 || self->_sessionID != *((void *)a3 + 1)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)a3 + 24))
  {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    if ((*((unsigned char *)a3 + 24) & 4) != 0) {
      goto LABEL_19;
    }
    goto LABEL_15;
  }
  if ((*((unsigned char *)a3 + 24) & 4) == 0) {
    goto LABEL_19;
  }
  if (self->_wifiReachable)
  {
    if (!*((unsigned char *)a3 + 20)) {
      goto LABEL_19;
    }
    goto LABEL_15;
  }
  if (*((unsigned char *)a3 + 20))
  {
LABEL_19:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_15:
  LOBYTE(v5) = (*((unsigned char *)a3 + 24) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 24) & 2) == 0 || self->_cellularRadioAccessTechnology != *((_DWORD *)a3 + 4)) {
      goto LABEL_19;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  unint64_t v2 = 2654435761u * self->_sessionID;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_wifiReachable;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_cellularRadioAccessTechnology;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 24);
  if (v3)
  {
    self->_sessionID = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v3 = *((unsigned char *)a3 + 24);
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 2) == 0) {
        return;
      }
LABEL_7:
      self->_cellularRadioAccessTechnology = *((_DWORD *)a3 + 4);
      *(unsigned char *)&self->_has |= 2u;
      return;
    }
  }
  else if ((*((unsigned char *)a3 + 24) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_wifiReachable = *((unsigned char *)a3 + 20);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)a3 + 24) & 2) != 0) {
    goto LABEL_7;
  }
}

- (BOOL)wifiReachable
{
  return self->_wifiReachable;
}

- (int)cellularRadioAccessTechnology
{
  return self->_cellularRadioAccessTechnology;
}

@end