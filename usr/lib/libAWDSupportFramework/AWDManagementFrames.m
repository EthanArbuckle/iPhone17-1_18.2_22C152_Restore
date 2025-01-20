@interface AWDManagementFrames
- (BOOL)hasATIM;
- (BOOL)hasAction;
- (BOOL)hasAssocRequest;
- (BOOL)hasAssocResponse;
- (BOOL)hasAuth;
- (BOOL)hasBeacon;
- (BOOL)hasDeauth;
- (BOOL)hasDisassoc;
- (BOOL)hasProbeRequest;
- (BOOL)hasProbeResponse;
- (BOOL)hasReassocRequest;
- (BOOL)hasReassocResponse;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)aTIM;
- (unint64_t)action;
- (unint64_t)assocRequest;
- (unint64_t)assocResponse;
- (unint64_t)auth;
- (unint64_t)beacon;
- (unint64_t)deauth;
- (unint64_t)disassoc;
- (unint64_t)hash;
- (unint64_t)probeRequest;
- (unint64_t)probeResponse;
- (unint64_t)reassocRequest;
- (unint64_t)reassocResponse;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setATIM:(unint64_t)a3;
- (void)setAction:(unint64_t)a3;
- (void)setAssocRequest:(unint64_t)a3;
- (void)setAssocResponse:(unint64_t)a3;
- (void)setAuth:(unint64_t)a3;
- (void)setBeacon:(unint64_t)a3;
- (void)setDeauth:(unint64_t)a3;
- (void)setDisassoc:(unint64_t)a3;
- (void)setHasATIM:(BOOL)a3;
- (void)setHasAction:(BOOL)a3;
- (void)setHasAssocRequest:(BOOL)a3;
- (void)setHasAssocResponse:(BOOL)a3;
- (void)setHasAuth:(BOOL)a3;
- (void)setHasBeacon:(BOOL)a3;
- (void)setHasDeauth:(BOOL)a3;
- (void)setHasDisassoc:(BOOL)a3;
- (void)setHasProbeRequest:(BOOL)a3;
- (void)setHasProbeResponse:(BOOL)a3;
- (void)setHasReassocRequest:(BOOL)a3;
- (void)setHasReassocResponse:(BOOL)a3;
- (void)setProbeRequest:(unint64_t)a3;
- (void)setProbeResponse:(unint64_t)a3;
- (void)setReassocRequest:(unint64_t)a3;
- (void)setReassocResponse:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDManagementFrames

- (void)setAssocRequest:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_assocRequest = a3;
}

- (void)setHasAssocRequest:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAssocRequest
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setAssocResponse:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_assocResponse = a3;
}

- (void)setHasAssocResponse:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasAssocResponse
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setReassocRequest:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_reassocRequest = a3;
}

- (void)setHasReassocRequest:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasReassocRequest
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setReassocResponse:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_reassocResponse = a3;
}

- (void)setHasReassocResponse:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasReassocResponse
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setProbeRequest:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_probeRequest = a3;
}

- (void)setHasProbeRequest:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasProbeRequest
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setProbeResponse:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_probeResponse = a3;
}

- (void)setHasProbeResponse:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasProbeResponse
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setBeacon:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_beacon = a3;
}

- (void)setHasBeacon:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasBeacon
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setATIM:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_aTIM = a3;
}

- (void)setHasATIM:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasATIM
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setDisassoc:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_disassoc = a3;
}

- (void)setHasDisassoc:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasDisassoc
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setAuth:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_auth = a3;
}

- (void)setHasAuth:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasAuth
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setDeauth:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_deauth = a3;
}

- (void)setHasDeauth:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasDeauth
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setAction:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_action = a3;
}

- (void)setHasAction:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAction
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDManagementFrames;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDManagementFrames description](&v3, sel_description), -[AWDManagementFrames dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_assocRequest] forKey:@"assocRequest"];
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x400) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_assocResponse] forKey:@"assocResponse"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_4:
    if ((has & 0x800) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_reassocRequest] forKey:@"reassocRequest"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_reassocResponse] forKey:@"reassocResponse"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_probeRequest] forKey:@"probeRequest"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_probeResponse] forKey:@"probeResponse"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_beacon] forKey:@"beacon"];
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_aTIM] forKey:@"ATIM"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_disassoc] forKey:@"disassoc"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0) {
      goto LABEL_12;
    }
LABEL_25:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_deauth] forKey:@"deauth"];
    if ((*(_WORD *)&self->_has & 2) == 0) {
      return v3;
    }
    goto LABEL_13;
  }
LABEL_24:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_auth] forKey:@"auth"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0) {
    goto LABEL_25;
  }
LABEL_12:
  if ((has & 2) != 0) {
LABEL_13:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_action] forKey:@"action"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDManagementFramesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x400) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_4:
    if ((has & 0x800) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0) {
      goto LABEL_12;
    }
LABEL_24:
    PBDataWriterWriteUint64Field();
    if ((*(_WORD *)&self->_has & 2) == 0) {
      return;
    }
    goto LABEL_25;
  }
LABEL_23:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0) {
    goto LABEL_24;
  }
LABEL_12:
  if ((has & 2) == 0) {
    return;
  }
LABEL_25:

  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)a3 + 3) = self->_assocRequest;
    *((_WORD *)a3 + 52) |= 4u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x400) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 4) = self->_assocResponse;
  *((_WORD *)a3 + 52) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_4:
    if ((has & 0x800) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((void *)a3 + 11) = self->_reassocRequest;
  *((_WORD *)a3 + 52) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((void *)a3 + 12) = self->_reassocResponse;
  *((_WORD *)a3 + 52) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((void *)a3 + 9) = self->_probeRequest;
  *((_WORD *)a3 + 52) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((void *)a3 + 10) = self->_probeResponse;
  *((_WORD *)a3 + 52) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((void *)a3 + 6) = self->_beacon;
  *((_WORD *)a3 + 52) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((void *)a3 + 1) = self->_aTIM;
  *((_WORD *)a3 + 52) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((void *)a3 + 8) = self->_disassoc;
  *((_WORD *)a3 + 52) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((void *)a3 + 5) = self->_auth;
  *((_WORD *)a3 + 52) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_12:
    if ((has & 2) == 0) {
      return;
    }
LABEL_25:
    *((void *)a3 + 2) = self->_action;
    *((_WORD *)a3 + 52) |= 2u;
    return;
  }
LABEL_24:
  *((void *)a3 + 7) = self->_deauth;
  *((_WORD *)a3 + 52) |= 0x40u;
  if ((*(_WORD *)&self->_has & 2) != 0) {
    goto LABEL_25;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)result + 3) = self->_assocRequest;
    *((_WORD *)result + 52) |= 4u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x400) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 4) = self->_assocResponse;
  *((_WORD *)result + 52) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_4:
    if ((has & 0x800) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((void *)result + 11) = self->_reassocRequest;
  *((_WORD *)result + 52) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((void *)result + 12) = self->_reassocResponse;
  *((_WORD *)result + 52) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((void *)result + 9) = self->_probeRequest;
  *((_WORD *)result + 52) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((void *)result + 10) = self->_probeResponse;
  *((_WORD *)result + 52) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((void *)result + 6) = self->_beacon;
  *((_WORD *)result + 52) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((void *)result + 1) = self->_aTIM;
  *((_WORD *)result + 52) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((void *)result + 8) = self->_disassoc;
  *((_WORD *)result + 52) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((void *)result + 5) = self->_auth;
  *((_WORD *)result + 52) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_12:
    if ((has & 2) == 0) {
      return result;
    }
    goto LABEL_13;
  }
LABEL_25:
  *((void *)result + 7) = self->_deauth;
  *((_WORD *)result + 52) |= 0x40u;
  if ((*(_WORD *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_13:
  *((void *)result + 2) = self->_action;
  *((_WORD *)result + 52) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    __int16 has = (__int16)self->_has;
    __int16 v7 = *((_WORD *)a3 + 52);
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_assocRequest != *((void *)a3 + 3)) {
        goto LABEL_61;
      }
    }
    else if ((v7 & 4) != 0)
    {
LABEL_61:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_assocResponse != *((void *)a3 + 4)) {
        goto LABEL_61;
      }
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_61;
    }
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 52) & 0x400) == 0 || self->_reassocRequest != *((void *)a3 + 11)) {
        goto LABEL_61;
      }
    }
    else if ((*((_WORD *)a3 + 52) & 0x400) != 0)
    {
      goto LABEL_61;
    }
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
      if ((*((_WORD *)a3 + 52) & 0x800) == 0 || self->_reassocResponse != *((void *)a3 + 12)) {
        goto LABEL_61;
      }
    }
    else if ((*((_WORD *)a3 + 52) & 0x800) != 0)
    {
      goto LABEL_61;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 52) & 0x100) == 0 || self->_probeRequest != *((void *)a3 + 9)) {
        goto LABEL_61;
      }
    }
    else if ((*((_WORD *)a3 + 52) & 0x100) != 0)
    {
      goto LABEL_61;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 52) & 0x200) == 0 || self->_probeResponse != *((void *)a3 + 10)) {
        goto LABEL_61;
      }
    }
    else if ((*((_WORD *)a3 + 52) & 0x200) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_beacon != *((void *)a3 + 6)) {
        goto LABEL_61;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_61;
    }
    if (has)
    {
      if ((v7 & 1) == 0 || self->_aTIM != *((void *)a3 + 1)) {
        goto LABEL_61;
      }
    }
    else if (v7)
    {
      goto LABEL_61;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_disassoc != *((void *)a3 + 8)) {
        goto LABEL_61;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_auth != *((void *)a3 + 5)) {
        goto LABEL_61;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_deauth != *((void *)a3 + 7)) {
        goto LABEL_61;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_61;
    }
    LOBYTE(v5) = (v7 & 2) == 0;
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_action != *((void *)a3 + 2)) {
        goto LABEL_61;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    unint64_t v3 = 2654435761u * self->_assocRequest;
    if ((has & 8) != 0)
    {
LABEL_3:
      unint64_t v4 = 2654435761u * self->_assocResponse;
      if ((*(_WORD *)&self->_has & 0x400) != 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((has & 8) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v4 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_4:
    unint64_t v5 = 2654435761u * self->_reassocRequest;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  unint64_t v5 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_5:
    unint64_t v6 = 2654435761u * self->_reassocResponse;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  unint64_t v6 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_6:
    unint64_t v7 = 2654435761u * self->_probeRequest;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  unint64_t v7 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_7:
    unint64_t v8 = 2654435761u * self->_probeResponse;
    if ((has & 0x20) != 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  unint64_t v8 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_8:
    unint64_t v9 = 2654435761u * self->_beacon;
    if (has) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  unint64_t v9 = 0;
  if (has)
  {
LABEL_9:
    unint64_t v10 = 2654435761u * self->_aTIM;
    if ((has & 0x80) != 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  unint64_t v10 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_10:
    unint64_t v11 = 2654435761u * self->_disassoc;
    if ((has & 0x10) != 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  unint64_t v11 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_11:
    unint64_t v12 = 2654435761u * self->_auth;
    if ((has & 0x40) != 0) {
      goto LABEL_12;
    }
LABEL_24:
    unint64_t v13 = 0;
    if ((has & 2) != 0) {
      goto LABEL_13;
    }
LABEL_25:
    unint64_t v14 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
  }
LABEL_23:
  unint64_t v12 = 0;
  if ((has & 0x40) == 0) {
    goto LABEL_24;
  }
LABEL_12:
  unint64_t v13 = 2654435761u * self->_deauth;
  if ((has & 2) == 0) {
    goto LABEL_25;
  }
LABEL_13:
  unint64_t v14 = 2654435761u * self->_action;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 4) != 0)
  {
    self->_assocRequest = *((void *)a3 + 3);
    *(_WORD *)&self->_has |= 4u;
    __int16 v3 = *((_WORD *)a3 + 52);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 0x400) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((v3 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_assocResponse = *((void *)a3 + 4);
  *(_WORD *)&self->_has |= 8u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x400) == 0)
  {
LABEL_4:
    if ((v3 & 0x800) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_reassocRequest = *((void *)a3 + 11);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x800) == 0)
  {
LABEL_5:
    if ((v3 & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_reassocResponse = *((void *)a3 + 12);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x100) == 0)
  {
LABEL_6:
    if ((v3 & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_probeRequest = *((void *)a3 + 9);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x200) == 0)
  {
LABEL_7:
    if ((v3 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_probeResponse = *((void *)a3 + 10);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x20) == 0)
  {
LABEL_8:
    if ((v3 & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_beacon = *((void *)a3 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 1) == 0)
  {
LABEL_9:
    if ((v3 & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_aTIM = *((void *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x80) == 0)
  {
LABEL_10:
    if ((v3 & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_disassoc = *((void *)a3 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x10) == 0)
  {
LABEL_11:
    if ((v3 & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_auth = *((void *)a3 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x40) == 0)
  {
LABEL_12:
    if ((v3 & 2) == 0) {
      return;
    }
LABEL_25:
    self->_action = *((void *)a3 + 2);
    *(_WORD *)&self->_has |= 2u;
    return;
  }
LABEL_24:
  self->_deauth = *((void *)a3 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)a3 + 52) & 2) != 0) {
    goto LABEL_25;
  }
}

- (unint64_t)assocRequest
{
  return self->_assocRequest;
}

- (unint64_t)assocResponse
{
  return self->_assocResponse;
}

- (unint64_t)reassocRequest
{
  return self->_reassocRequest;
}

- (unint64_t)reassocResponse
{
  return self->_reassocResponse;
}

- (unint64_t)probeRequest
{
  return self->_probeRequest;
}

- (unint64_t)probeResponse
{
  return self->_probeResponse;
}

- (unint64_t)beacon
{
  return self->_beacon;
}

- (unint64_t)aTIM
{
  return self->_aTIM;
}

- (unint64_t)disassoc
{
  return self->_disassoc;
}

- (unint64_t)auth
{
  return self->_auth;
}

- (unint64_t)deauth
{
  return self->_deauth;
}

- (unint64_t)action
{
  return self->_action;
}

@end