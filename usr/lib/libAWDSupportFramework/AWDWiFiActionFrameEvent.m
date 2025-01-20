@interface AWDWiFiActionFrameEvent
- (BOOL)hasActionCode;
- (BOOL)hasBtmAbridged;
- (BOOL)hasBtmBssTerminationIncluded;
- (BOOL)hasBtmDisassociationImminent;
- (BOOL)hasBtmDisassociationTimeout;
- (BOOL)hasBtmEssTerminationIncluded;
- (BOOL)hasBtmHasPreferredCandidateList;
- (BOOL)hasBtmTerminationDuration;
- (BOOL)hasBtmValidityInterval;
- (BOOL)hasCategoryCode;
- (BOOL)hasDialogToken;
- (BOOL)hasEnvironmentType;
- (BOOL)hasFrameType;
- (BOOL)hasOui;
- (BOOL)hasStatus;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)oui;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)actionCode;
- (unsigned)btmAbridged;
- (unsigned)btmBssTerminationIncluded;
- (unsigned)btmDisassociationImminent;
- (unsigned)btmDisassociationTimeout;
- (unsigned)btmEssTerminationIncluded;
- (unsigned)btmHasPreferredCandidateList;
- (unsigned)btmTerminationDuration;
- (unsigned)btmValidityInterval;
- (unsigned)categoryCode;
- (unsigned)dialogToken;
- (unsigned)environmentType;
- (unsigned)frameType;
- (unsigned)status;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setActionCode:(unsigned int)a3;
- (void)setBtmAbridged:(unsigned int)a3;
- (void)setBtmBssTerminationIncluded:(unsigned int)a3;
- (void)setBtmDisassociationImminent:(unsigned int)a3;
- (void)setBtmDisassociationTimeout:(unsigned int)a3;
- (void)setBtmEssTerminationIncluded:(unsigned int)a3;
- (void)setBtmHasPreferredCandidateList:(unsigned int)a3;
- (void)setBtmTerminationDuration:(unsigned int)a3;
- (void)setBtmValidityInterval:(unsigned int)a3;
- (void)setCategoryCode:(unsigned int)a3;
- (void)setDialogToken:(unsigned int)a3;
- (void)setEnvironmentType:(unsigned int)a3;
- (void)setFrameType:(unsigned int)a3;
- (void)setHasActionCode:(BOOL)a3;
- (void)setHasBtmAbridged:(BOOL)a3;
- (void)setHasBtmBssTerminationIncluded:(BOOL)a3;
- (void)setHasBtmDisassociationImminent:(BOOL)a3;
- (void)setHasBtmDisassociationTimeout:(BOOL)a3;
- (void)setHasBtmEssTerminationIncluded:(BOOL)a3;
- (void)setHasBtmHasPreferredCandidateList:(BOOL)a3;
- (void)setHasBtmTerminationDuration:(BOOL)a3;
- (void)setHasBtmValidityInterval:(BOOL)a3;
- (void)setHasCategoryCode:(BOOL)a3;
- (void)setHasDialogToken:(BOOL)a3;
- (void)setHasEnvironmentType:(BOOL)a3;
- (void)setHasFrameType:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setOui:(id)a3;
- (void)setStatus:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiActionFrameEvent

- (void)dealloc
{
  [(AWDWiFiActionFrameEvent *)self setOui:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiActionFrameEvent;
  [(AWDWiFiActionFrameEvent *)&v3 dealloc];
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

- (BOOL)hasOui
{
  return self->_oui != 0;
}

- (void)setEnvironmentType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_environmentType = a3;
}

- (void)setHasEnvironmentType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasEnvironmentType
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setCategoryCode:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_categoryCode = a3;
}

- (void)setHasCategoryCode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasCategoryCode
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setActionCode:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_actionCode = a3;
}

- (void)setHasActionCode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasActionCode
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setDialogToken:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_dialogToken = a3;
}

- (void)setHasDialogToken:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasDialogToken
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setStatus:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasStatus
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setFrameType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_frameType = a3;
}

- (void)setHasFrameType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasFrameType
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setBtmDisassociationTimeout:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_btmDisassociationTimeout = a3;
}

- (void)setHasBtmDisassociationTimeout:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasBtmDisassociationTimeout
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setBtmValidityInterval:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_btmValidityInterval = a3;
}

- (void)setHasBtmValidityInterval:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasBtmValidityInterval
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setBtmTerminationDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_btmTerminationDuration = a3;
}

- (void)setHasBtmTerminationDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasBtmTerminationDuration
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setBtmHasPreferredCandidateList:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_btmHasPreferredCandidateList = a3;
}

- (void)setHasBtmHasPreferredCandidateList:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasBtmHasPreferredCandidateList
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setBtmAbridged:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_btmAbridged = a3;
}

- (void)setHasBtmAbridged:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasBtmAbridged
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setBtmDisassociationImminent:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_btmDisassociationImminent = a3;
}

- (void)setHasBtmDisassociationImminent:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasBtmDisassociationImminent
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setBtmBssTerminationIncluded:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_btmBssTerminationIncluded = a3;
}

- (void)setHasBtmBssTerminationIncluded:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasBtmBssTerminationIncluded
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setBtmEssTerminationIncluded:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_btmEssTerminationIncluded = a3;
}

- (void)setHasBtmEssTerminationIncluded:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasBtmEssTerminationIncluded
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiActionFrameEvent;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiActionFrameEvent description](&v3, sel_description), -[AWDWiFiActionFrameEvent dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(_WORD *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  oui = self->_oui;
  if (oui) {
    [v3 setObject:oui forKey:@"oui"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_environmentType] forKey:@"environmentType"];
    __int16 has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_7:
      if ((has & 2) == 0) {
        goto LABEL_8;
      }
      goto LABEL_23;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_7;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_categoryCode] forKey:@"categoryCode"];
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_actionCode] forKey:@"actionCode"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 0x4000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_dialogToken] forKey:@"dialogToken"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_10:
    if ((has & 0x2000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_status] forKey:@"status"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_frameType] forKey:@"frameType"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_btmDisassociationTimeout] forKey:@"btmDisassociationTimeout"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_13:
    if ((has & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_btmValidityInterval] forKey:@"btmValidityInterval"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_14:
    if ((has & 0x80) == 0) {
      goto LABEL_15;
    }
    goto LABEL_30;
  }
LABEL_29:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_btmTerminationDuration] forKey:@"btmTerminationDuration"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_15:
    if ((has & 4) == 0) {
      goto LABEL_16;
    }
    goto LABEL_31;
  }
LABEL_30:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_btmHasPreferredCandidateList] forKey:@"btmHasPreferredCandidateList"];
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_16:
    if ((has & 0x10) == 0) {
      goto LABEL_17;
    }
    goto LABEL_32;
  }
LABEL_31:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_btmAbridged] forKey:@"btmAbridged"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_17:
    if ((has & 8) == 0) {
      goto LABEL_18;
    }
LABEL_33:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_btmBssTerminationIncluded] forKey:@"btmBssTerminationIncluded"];
    if ((*(_WORD *)&self->_has & 0x40) == 0) {
      return v3;
    }
    goto LABEL_19;
  }
LABEL_32:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_btmDisassociationImminent] forKey:@"btmDisassociationImminent"];
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_33;
  }
LABEL_18:
  if ((has & 0x40) != 0) {
LABEL_19:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_btmEssTerminationIncluded] forKey:@"btmEssTerminationIncluded"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiActionFrameEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(_WORD *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_oui) {
    PBDataWriterWriteDataField();
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_7:
      if ((has & 2) == 0) {
        goto LABEL_8;
      }
      goto LABEL_22;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
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
    if ((has & 0x2000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_13:
    if ((has & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_14:
    if ((has & 0x80) == 0) {
      goto LABEL_15;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_15:
    if ((has & 4) == 0) {
      goto LABEL_16;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_16:
    if ((has & 0x10) == 0) {
      goto LABEL_17;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_17:
    if ((has & 8) == 0) {
      goto LABEL_18;
    }
LABEL_32:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_has & 0x40) == 0) {
      return;
    }
    goto LABEL_33;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_32;
  }
LABEL_18:
  if ((has & 0x40) == 0) {
    return;
  }
LABEL_33:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  if (*(_WORD *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((_WORD *)a3 + 42) |= 1u;
  }
  if (self->_oui) {
    [a3 setOui:];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    *((_DWORD *)a3 + 15) = self->_environmentType;
    *((_WORD *)a3 + 42) |= 0x1000u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_7:
      if ((has & 2) == 0) {
        goto LABEL_8;
      }
      goto LABEL_23;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)a3 + 13) = self->_categoryCode;
  *((_WORD *)a3 + 42) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)a3 + 4) = self->_actionCode;
  *((_WORD *)a3 + 42) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 0x4000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)a3 + 14) = self->_dialogToken;
  *((_WORD *)a3 + 42) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_10:
    if ((has & 0x2000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)a3 + 20) = self->_status;
  *((_WORD *)a3 + 42) |= 0x4000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)a3 + 16) = self->_frameType;
  *((_WORD *)a3 + 42) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)a3 + 8) = self->_btmDisassociationTimeout;
  *((_WORD *)a3 + 42) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_13:
    if ((has & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)a3 + 12) = self->_btmValidityInterval;
  *((_WORD *)a3 + 42) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_14:
    if ((has & 0x80) == 0) {
      goto LABEL_15;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)a3 + 11) = self->_btmTerminationDuration;
  *((_WORD *)a3 + 42) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_15:
    if ((has & 4) == 0) {
      goto LABEL_16;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)a3 + 10) = self->_btmHasPreferredCandidateList;
  *((_WORD *)a3 + 42) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_16:
    if ((has & 0x10) == 0) {
      goto LABEL_17;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)a3 + 5) = self->_btmAbridged;
  *((_WORD *)a3 + 42) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_17:
    if ((has & 8) == 0) {
      goto LABEL_18;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)a3 + 7) = self->_btmDisassociationImminent;
  *((_WORD *)a3 + 42) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_18:
    if ((has & 0x40) == 0) {
      return;
    }
    goto LABEL_19;
  }
LABEL_33:
  *((_DWORD *)a3 + 6) = self->_btmBssTerminationIncluded;
  *((_WORD *)a3 + 42) |= 8u;
  if ((*(_WORD *)&self->_has & 0x40) == 0) {
    return;
  }
LABEL_19:
  *((_DWORD *)a3 + 9) = self->_btmEssTerminationIncluded;
  *((_WORD *)a3 + 42) |= 0x40u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if (*(_WORD *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(_WORD *)(v5 + 84) |= 1u;
  }

  *(void *)(v6 + 72) = [(NSData *)self->_oui copyWithZone:a3];
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    *(_DWORD *)(v6 + 60) = self->_environmentType;
    *(_WORD *)(v6 + 84) |= 0x1000u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 52) = self->_categoryCode;
  *(_WORD *)(v6 + 84) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x800) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  *(_DWORD *)(v6 + 16) = self->_actionCode;
  *(_WORD *)(v6 + 84) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_7:
    if ((has & 0x4000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  *(_DWORD *)(v6 + 56) = self->_dialogToken;
  *(_WORD *)(v6 + 84) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_8:
    if ((has & 0x2000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  *(_DWORD *)(v6 + 80) = self->_status;
  *(_WORD *)(v6 + 84) |= 0x4000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  *(_DWORD *)(v6 + 64) = self->_frameType;
  *(_WORD *)(v6 + 84) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  *(_DWORD *)(v6 + 32) = self->_btmDisassociationTimeout;
  *(_WORD *)(v6 + 84) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  *(_DWORD *)(v6 + 48) = self->_btmValidityInterval;
  *(_WORD *)(v6 + 84) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  *(_DWORD *)(v6 + 44) = self->_btmTerminationDuration;
  *(_WORD *)(v6 + 84) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_13:
    if ((has & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  *(_DWORD *)(v6 + 40) = self->_btmHasPreferredCandidateList;
  *(_WORD *)(v6 + 84) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_14:
    if ((has & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_30;
  }
LABEL_29:
  *(_DWORD *)(v6 + 20) = self->_btmAbridged;
  *(_WORD *)(v6 + 84) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_15:
    if ((has & 8) == 0) {
      goto LABEL_16;
    }
LABEL_31:
    *(_DWORD *)(v6 + 24) = self->_btmBssTerminationIncluded;
    *(_WORD *)(v6 + 84) |= 8u;
    if ((*(_WORD *)&self->_has & 0x40) == 0) {
      return (id)v6;
    }
    goto LABEL_17;
  }
LABEL_30:
  *(_DWORD *)(v6 + 28) = self->_btmDisassociationImminent;
  *(_WORD *)(v6 + 84) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_31;
  }
LABEL_16:
  if ((has & 0x40) != 0)
  {
LABEL_17:
    *(_DWORD *)(v6 + 36) = self->_btmEssTerminationIncluded;
    *(_WORD *)(v6 + 84) |= 0x40u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    __int16 has = (__int16)self->_has;
    __int16 v7 = *((_WORD *)a3 + 42);
    if (has)
    {
      if ((v7 & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_79;
      }
    }
    else if (v7)
    {
LABEL_79:
      LOBYTE(v5) = 0;
      return v5;
    }
    oui = self->_oui;
    if ((unint64_t)oui | *((void *)a3 + 9))
    {
      int v5 = -[NSData isEqual:](oui, "isEqual:");
      if (!v5) {
        return v5;
      }
      __int16 has = (__int16)self->_has;
    }
    __int16 v9 = *((_WORD *)a3 + 42);
    if ((has & 0x1000) != 0)
    {
      if ((*((_WORD *)a3 + 42) & 0x1000) == 0 || self->_environmentType != *((_DWORD *)a3 + 15)) {
        goto LABEL_79;
      }
    }
    else if ((*((_WORD *)a3 + 42) & 0x1000) != 0)
    {
      goto LABEL_79;
    }
    if ((has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 42) & 0x400) == 0 || self->_categoryCode != *((_DWORD *)a3 + 13)) {
        goto LABEL_79;
      }
    }
    else if ((*((_WORD *)a3 + 42) & 0x400) != 0)
    {
      goto LABEL_79;
    }
    if ((has & 2) != 0)
    {
      if ((v9 & 2) == 0 || self->_actionCode != *((_DWORD *)a3 + 4)) {
        goto LABEL_79;
      }
    }
    else if ((v9 & 2) != 0)
    {
      goto LABEL_79;
    }
    if ((has & 0x800) != 0)
    {
      if ((*((_WORD *)a3 + 42) & 0x800) == 0 || self->_dialogToken != *((_DWORD *)a3 + 14)) {
        goto LABEL_79;
      }
    }
    else if ((*((_WORD *)a3 + 42) & 0x800) != 0)
    {
      goto LABEL_79;
    }
    if ((has & 0x4000) != 0)
    {
      if ((*((_WORD *)a3 + 42) & 0x4000) == 0 || self->_status != *((_DWORD *)a3 + 20)) {
        goto LABEL_79;
      }
    }
    else if ((*((_WORD *)a3 + 42) & 0x4000) != 0)
    {
      goto LABEL_79;
    }
    if ((has & 0x2000) != 0)
    {
      if ((*((_WORD *)a3 + 42) & 0x2000) == 0 || self->_frameType != *((_DWORD *)a3 + 16)) {
        goto LABEL_79;
      }
    }
    else if ((*((_WORD *)a3 + 42) & 0x2000) != 0)
    {
      goto LABEL_79;
    }
    if ((has & 0x20) != 0)
    {
      if ((v9 & 0x20) == 0 || self->_btmDisassociationTimeout != *((_DWORD *)a3 + 8)) {
        goto LABEL_79;
      }
    }
    else if ((v9 & 0x20) != 0)
    {
      goto LABEL_79;
    }
    if ((has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 42) & 0x200) == 0 || self->_btmValidityInterval != *((_DWORD *)a3 + 12)) {
        goto LABEL_79;
      }
    }
    else if ((*((_WORD *)a3 + 42) & 0x200) != 0)
    {
      goto LABEL_79;
    }
    if ((has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 42) & 0x100) == 0 || self->_btmTerminationDuration != *((_DWORD *)a3 + 11)) {
        goto LABEL_79;
      }
    }
    else if ((*((_WORD *)a3 + 42) & 0x100) != 0)
    {
      goto LABEL_79;
    }
    if ((has & 0x80) != 0)
    {
      if ((v9 & 0x80) == 0 || self->_btmHasPreferredCandidateList != *((_DWORD *)a3 + 10)) {
        goto LABEL_79;
      }
    }
    else if ((v9 & 0x80) != 0)
    {
      goto LABEL_79;
    }
    if ((has & 4) != 0)
    {
      if ((v9 & 4) == 0 || self->_btmAbridged != *((_DWORD *)a3 + 5)) {
        goto LABEL_79;
      }
    }
    else if ((v9 & 4) != 0)
    {
      goto LABEL_79;
    }
    if ((has & 0x10) != 0)
    {
      if ((v9 & 0x10) == 0 || self->_btmDisassociationImminent != *((_DWORD *)a3 + 7)) {
        goto LABEL_79;
      }
    }
    else if ((v9 & 0x10) != 0)
    {
      goto LABEL_79;
    }
    if ((has & 8) != 0)
    {
      if ((v9 & 8) == 0 || self->_btmBssTerminationIncluded != *((_DWORD *)a3 + 6)) {
        goto LABEL_79;
      }
    }
    else if ((v9 & 8) != 0)
    {
      goto LABEL_79;
    }
    LOBYTE(v5) = (v9 & 0x40) == 0;
    if ((has & 0x40) != 0)
    {
      if ((v9 & 0x40) == 0 || self->_btmEssTerminationIncluded != *((_DWORD *)a3 + 9)) {
        goto LABEL_79;
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
  uint64_t v4 = [(NSData *)self->_oui hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    uint64_t v6 = 2654435761 * self->_environmentType;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
LABEL_6:
      uint64_t v7 = 2654435761 * self->_categoryCode;
      if ((has & 2) != 0) {
        goto LABEL_7;
      }
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v7 = 0;
  if ((has & 2) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_actionCode;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v8 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_dialogToken;
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
    uint64_t v10 = 2654435761 * self->_status;
    if ((*(_WORD *)&self->_has & 0x2000) != 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v10 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_frameType;
    if ((has & 0x20) != 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v11 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_11:
    uint64_t v12 = 2654435761 * self->_btmDisassociationTimeout;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_12;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v12 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_12:
    uint64_t v13 = 2654435761 * self->_btmValidityInterval;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_13;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v13 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_13:
    uint64_t v14 = 2654435761 * self->_btmTerminationDuration;
    if ((has & 0x80) != 0) {
      goto LABEL_14;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v14 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_14:
    uint64_t v15 = 2654435761 * self->_btmHasPreferredCandidateList;
    if ((has & 4) != 0) {
      goto LABEL_15;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v15 = 0;
  if ((has & 4) != 0)
  {
LABEL_15:
    uint64_t v16 = 2654435761 * self->_btmAbridged;
    if ((has & 0x10) != 0) {
      goto LABEL_16;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v16 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_16:
    uint64_t v17 = 2654435761 * self->_btmDisassociationImminent;
    if ((has & 8) != 0) {
      goto LABEL_17;
    }
LABEL_31:
    uint64_t v18 = 0;
    if ((has & 0x40) != 0) {
      goto LABEL_18;
    }
LABEL_32:
    uint64_t v19 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
  }
LABEL_30:
  uint64_t v17 = 0;
  if ((has & 8) == 0) {
    goto LABEL_31;
  }
LABEL_17:
  uint64_t v18 = 2654435761 * self->_btmBssTerminationIncluded;
  if ((has & 0x40) == 0) {
    goto LABEL_32;
  }
LABEL_18:
  uint64_t v19 = 2654435761 * self->_btmEssTerminationIncluded;
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  if (*((_WORD *)a3 + 42))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 9)) {
    -[AWDWiFiActionFrameEvent setOui:](self, "setOui:");
  }
  __int16 v5 = *((_WORD *)a3 + 42);
  if ((v5 & 0x1000) != 0)
  {
    self->_environmentType = *((_DWORD *)a3 + 15);
    *(_WORD *)&self->_has |= 0x1000u;
    __int16 v5 = *((_WORD *)a3 + 42);
    if ((v5 & 0x400) == 0)
    {
LABEL_7:
      if ((v5 & 2) == 0) {
        goto LABEL_8;
      }
      goto LABEL_23;
    }
  }
  else if ((*((_WORD *)a3 + 42) & 0x400) == 0)
  {
    goto LABEL_7;
  }
  self->_categoryCode = *((_DWORD *)a3 + 13);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v5 = *((_WORD *)a3 + 42);
  if ((v5 & 2) == 0)
  {
LABEL_8:
    if ((v5 & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_actionCode = *((_DWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)a3 + 42);
  if ((v5 & 0x800) == 0)
  {
LABEL_9:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_dialogToken = *((_DWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v5 = *((_WORD *)a3 + 42);
  if ((v5 & 0x4000) == 0)
  {
LABEL_10:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_status = *((_DWORD *)a3 + 20);
  *(_WORD *)&self->_has |= 0x4000u;
  __int16 v5 = *((_WORD *)a3 + 42);
  if ((v5 & 0x2000) == 0)
  {
LABEL_11:
    if ((v5 & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_frameType = *((_DWORD *)a3 + 16);
  *(_WORD *)&self->_has |= 0x2000u;
  __int16 v5 = *((_WORD *)a3 + 42);
  if ((v5 & 0x20) == 0)
  {
LABEL_12:
    if ((v5 & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_btmDisassociationTimeout = *((_DWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)a3 + 42);
  if ((v5 & 0x200) == 0)
  {
LABEL_13:
    if ((v5 & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_btmValidityInterval = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)a3 + 42);
  if ((v5 & 0x100) == 0)
  {
LABEL_14:
    if ((v5 & 0x80) == 0) {
      goto LABEL_15;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_btmTerminationDuration = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)a3 + 42);
  if ((v5 & 0x80) == 0)
  {
LABEL_15:
    if ((v5 & 4) == 0) {
      goto LABEL_16;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_btmHasPreferredCandidateList = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)a3 + 42);
  if ((v5 & 4) == 0)
  {
LABEL_16:
    if ((v5 & 0x10) == 0) {
      goto LABEL_17;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_btmAbridged = *((_DWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)a3 + 42);
  if ((v5 & 0x10) == 0)
  {
LABEL_17:
    if ((v5 & 8) == 0) {
      goto LABEL_18;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_btmDisassociationImminent = *((_DWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)a3 + 42);
  if ((v5 & 8) == 0)
  {
LABEL_18:
    if ((v5 & 0x40) == 0) {
      return;
    }
    goto LABEL_19;
  }
LABEL_33:
  self->_btmBssTerminationIncluded = *((_DWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)a3 + 42) & 0x40) == 0) {
    return;
  }
LABEL_19:
  self->_btmEssTerminationIncluded = *((_DWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x40u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSData)oui
{
  return self->_oui;
}

- (void)setOui:(id)a3
{
}

- (unsigned)environmentType
{
  return self->_environmentType;
}

- (unsigned)categoryCode
{
  return self->_categoryCode;
}

- (unsigned)actionCode
{
  return self->_actionCode;
}

- (unsigned)dialogToken
{
  return self->_dialogToken;
}

- (unsigned)status
{
  return self->_status;
}

- (unsigned)frameType
{
  return self->_frameType;
}

- (unsigned)btmDisassociationTimeout
{
  return self->_btmDisassociationTimeout;
}

- (unsigned)btmValidityInterval
{
  return self->_btmValidityInterval;
}

- (unsigned)btmTerminationDuration
{
  return self->_btmTerminationDuration;
}

- (unsigned)btmHasPreferredCandidateList
{
  return self->_btmHasPreferredCandidateList;
}

- (unsigned)btmAbridged
{
  return self->_btmAbridged;
}

- (unsigned)btmDisassociationImminent
{
  return self->_btmDisassociationImminent;
}

- (unsigned)btmBssTerminationIncluded
{
  return self->_btmBssTerminationIncluded;
}

- (unsigned)btmEssTerminationIncluded
{
  return self->_btmEssTerminationIncluded;
}

@end