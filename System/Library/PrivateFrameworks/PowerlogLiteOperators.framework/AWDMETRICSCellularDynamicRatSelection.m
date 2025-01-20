@interface AWDMETRICSCellularDynamicRatSelection
- (BOOL)hasBwObservedAfterSwitch;
- (BOOL)hasBwObservedBeforeSwitch;
- (BOOL)hasDestRat;
- (BOOL)hasDlTputObservedAfterSwitch;
- (BOOL)hasDlTputObservedBeforeSwitch;
- (BOOL)hasSourceRat;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)hasUlTputObservedAfterSwitch;
- (BOOL)hasUlTputObservedBeforeSwitch;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)destRatAsString:(int)a3;
- (id)dictionaryRepresentation;
- (id)sourceRatAsString:(int)a3;
- (int)StringAsDestRat:(id)a3;
- (int)StringAsSourceRat:(id)a3;
- (int)destRat;
- (int)sourceRat;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)bwObservedAfterSwitch;
- (unsigned)bwObservedBeforeSwitch;
- (unsigned)dlTputObservedAfterSwitch;
- (unsigned)dlTputObservedBeforeSwitch;
- (unsigned)subsId;
- (unsigned)ulTputObservedAfterSwitch;
- (unsigned)ulTputObservedBeforeSwitch;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBwObservedAfterSwitch:(unsigned int)a3;
- (void)setBwObservedBeforeSwitch:(unsigned int)a3;
- (void)setDestRat:(int)a3;
- (void)setDlTputObservedAfterSwitch:(unsigned int)a3;
- (void)setDlTputObservedBeforeSwitch:(unsigned int)a3;
- (void)setHasBwObservedAfterSwitch:(BOOL)a3;
- (void)setHasBwObservedBeforeSwitch:(BOOL)a3;
- (void)setHasDestRat:(BOOL)a3;
- (void)setHasDlTputObservedAfterSwitch:(BOOL)a3;
- (void)setHasDlTputObservedBeforeSwitch:(BOOL)a3;
- (void)setHasSourceRat:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasUlTputObservedAfterSwitch:(BOOL)a3;
- (void)setHasUlTputObservedBeforeSwitch:(BOOL)a3;
- (void)setSourceRat:(int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUlTputObservedAfterSwitch:(unsigned int)a3;
- (void)setUlTputObservedBeforeSwitch:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDMETRICSCellularDynamicRatSelection

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

- (int)sourceRat
{
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    return self->_sourceRat;
  }
  else {
    return 0;
  }
}

- (void)setSourceRat:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_sourceRat = a3;
}

- (void)setHasSourceRat:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasSourceRat
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)sourceRatAsString:(int)a3
{
  if (a3 >= 0xE)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E692ACD0[a3];
  }
  return v3;
}

- (int)StringAsSourceRat:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"WCDMA"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LTE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ENDC_SUB6"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ENDC_MMW"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"NR_SA"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"GSM"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"CDMA"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"EVDO"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"ONEXSRLTE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"ONEXHYBRID"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"NRDC_SUB6"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"NRDC_MMW"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"MAX"])
  {
    int v4 = 13;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)destRat
{
  if ((*(_WORD *)&self->_has & 8) != 0) {
    return self->_destRat;
  }
  else {
    return 0;
  }
}

- (void)setDestRat:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_destRat = a3;
}

- (void)setHasDestRat:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDestRat
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)destRatAsString:(int)a3
{
  if (a3 >= 0xE)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E692ACD0[a3];
  }
  return v3;
}

- (int)StringAsDestRat:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"WCDMA"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LTE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ENDC_SUB6"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ENDC_MMW"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"NR_SA"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"GSM"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"CDMA"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"EVDO"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"ONEXSRLTE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"ONEXHYBRID"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"NRDC_SUB6"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"NRDC_MMW"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"MAX"])
  {
    int v4 = 13;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setDlTputObservedBeforeSwitch:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_dlTputObservedBeforeSwitch = a3;
}

- (void)setHasDlTputObservedBeforeSwitch:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasDlTputObservedBeforeSwitch
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setDlTputObservedAfterSwitch:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_dlTputObservedAfterSwitch = a3;
}

- (void)setHasDlTputObservedAfterSwitch:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDlTputObservedAfterSwitch
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setBwObservedBeforeSwitch:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_bwObservedBeforeSwitch = a3;
}

- (void)setHasBwObservedBeforeSwitch:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasBwObservedBeforeSwitch
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setBwObservedAfterSwitch:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_bwObservedAfterSwitch = a3;
}

- (void)setHasBwObservedAfterSwitch:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasBwObservedAfterSwitch
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setUlTputObservedBeforeSwitch:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_ulTputObservedBeforeSwitch = a3;
}

- (void)setHasUlTputObservedBeforeSwitch:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasUlTputObservedBeforeSwitch
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setUlTputObservedAfterSwitch:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_ulTputObservedAfterSwitch = a3;
}

- (void)setHasUlTputObservedAfterSwitch:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasUlTputObservedAfterSwitch
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasSubsId
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDMETRICSCellularDynamicRatSelection;
  int v4 = [(AWDMETRICSCellularDynamicRatSelection *)&v8 description];
  v5 = [(AWDMETRICSCellularDynamicRatSelection *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v7 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v7 forKey:@"timestamp"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  uint64_t sourceRat = self->_sourceRat;
  if (sourceRat >= 0xE)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_sourceRat);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E692ACD0[sourceRat];
  }
  [v3 setObject:v9 forKey:@"source_rat"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_20:
  uint64_t destRat = self->_destRat;
  if (destRat >= 0xE)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_destRat);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = off_1E692ACD0[destRat];
  }
  [v3 setObject:v11 forKey:@"dest_rat"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  v12 = [NSNumber numberWithUnsignedInt:self->_dlTputObservedBeforeSwitch];
  [v3 setObject:v12 forKey:@"dl_tput_observed_before_switch"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  v13 = [NSNumber numberWithUnsignedInt:self->_dlTputObservedAfterSwitch];
  [v3 setObject:v13 forKey:@"dl_tput_observed_after_switch"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  v14 = [NSNumber numberWithUnsignedInt:self->_bwObservedBeforeSwitch];
  [v3 setObject:v14 forKey:@"bw_observed_before_switch"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  v15 = [NSNumber numberWithUnsignedInt:self->_bwObservedAfterSwitch];
  [v3 setObject:v15 forKey:@"bw_observed_after_switch"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
LABEL_28:
  v16 = [NSNumber numberWithUnsignedInt:self->_ulTputObservedBeforeSwitch];
  [v3 setObject:v16 forKey:@"ul_tput_observed_before_switch"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_29:
  v17 = [NSNumber numberWithUnsignedInt:self->_ulTputObservedAfterSwitch];
  [v3 setObject:v17 forKey:@"ul_tput_observed_after_switch"];

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_11:
    v5 = [NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v5 forKey:@"subs_id"];
  }
LABEL_12:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMETRICSCellularDynamicRatSelectionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
LABEL_11:
  }
    PBDataWriterWriteUint32Field();
LABEL_12:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 26) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 9) = self->_sourceRat;
  *((_WORD *)v4 + 26) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)v4 + 6) = self->_destRat;
  *((_WORD *)v4 + 26) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)v4 + 8) = self->_dlTputObservedBeforeSwitch;
  *((_WORD *)v4 + 26) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)v4 + 7) = self->_dlTputObservedAfterSwitch;
  *((_WORD *)v4 + 26) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)v4 + 5) = self->_bwObservedBeforeSwitch;
  *((_WORD *)v4 + 26) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v4 + 4) = self->_bwObservedAfterSwitch;
  *((_WORD *)v4 + 26) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v4 + 12) = self->_ulTputObservedBeforeSwitch;
  *((_WORD *)v4 + 26) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_23:
  *((_DWORD *)v4 + 11) = self->_ulTputObservedAfterSwitch;
  *((_WORD *)v4 + 26) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_11:
    *((_DWORD *)v4 + 10) = self->_subsId;
    *((_WORD *)v4 + 26) |= 0x80u;
  }
LABEL_12:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((_WORD *)result + 26) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 9) = self->_sourceRat;
  *((_WORD *)result + 26) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 6) = self->_destRat;
  *((_WORD *)result + 26) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 8) = self->_dlTputObservedBeforeSwitch;
  *((_WORD *)result + 26) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 7) = self->_dlTputObservedAfterSwitch;
  *((_WORD *)result + 26) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 5) = self->_bwObservedBeforeSwitch;
  *((_WORD *)result + 26) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 4) = self->_bwObservedAfterSwitch;
  *((_WORD *)result + 26) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 12) = self->_ulTputObservedBeforeSwitch;
  *((_WORD *)result + 26) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      return result;
    }
    goto LABEL_11;
  }
LABEL_21:
  *((_DWORD *)result + 11) = self->_ulTputObservedAfterSwitch;
  *((_WORD *)result + 26) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x80) == 0) {
    return result;
  }
LABEL_11:
  *((_DWORD *)result + 10) = self->_subsId;
  *((_WORD *)result + 26) |= 0x80u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_52;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 26);
  if (has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_52;
    }
  }
  else if (v6)
  {
LABEL_52:
    BOOL v7 = 0;
    goto LABEL_53;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_sourceRat != *((_DWORD *)v4 + 9)) {
      goto LABEL_52;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_destRat != *((_DWORD *)v4 + 6)) {
      goto LABEL_52;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_dlTputObservedBeforeSwitch != *((_DWORD *)v4 + 8)) {
      goto LABEL_52;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_dlTputObservedAfterSwitch != *((_DWORD *)v4 + 7)) {
      goto LABEL_52;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_bwObservedBeforeSwitch != *((_DWORD *)v4 + 5)) {
      goto LABEL_52;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_bwObservedAfterSwitch != *((_DWORD *)v4 + 4)) {
      goto LABEL_52;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_52;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x200) == 0 || self->_ulTputObservedBeforeSwitch != *((_DWORD *)v4 + 12)) {
      goto LABEL_52;
    }
  }
  else if ((*((_WORD *)v4 + 26) & 0x200) != 0)
  {
    goto LABEL_52;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x100) == 0 || self->_ulTputObservedAfterSwitch != *((_DWORD *)v4 + 11)) {
      goto LABEL_52;
    }
  }
  else if ((*((_WORD *)v4 + 26) & 0x100) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_subsId != *((_DWORD *)v4 + 10)) {
      goto LABEL_52;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (v6 & 0x80) == 0;
  }
LABEL_53:

  return v7;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((has & 0x40) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_sourceRat;
      if ((has & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((has & 0x40) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((has & 8) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_destRat;
    if ((has & 0x20) != 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v5 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_dlTputObservedBeforeSwitch;
    if ((has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v6 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_dlTputObservedAfterSwitch;
    if ((has & 4) != 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v7 = 0;
  if ((has & 4) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_bwObservedBeforeSwitch;
    if ((has & 2) != 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v8 = 0;
  if ((has & 2) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_bwObservedAfterSwitch;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v9 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_ulTputObservedBeforeSwitch;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_10;
    }
LABEL_20:
    uint64_t v11 = 0;
    if ((has & 0x80) != 0) {
      goto LABEL_11;
    }
LABEL_21:
    uint64_t v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
LABEL_19:
  uint64_t v10 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_20;
  }
LABEL_10:
  uint64_t v11 = 2654435761 * self->_ulTputObservedAfterSwitch;
  if ((has & 0x80) == 0) {
    goto LABEL_21;
  }
LABEL_11:
  uint64_t v12 = 2654435761 * self->_subsId;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 26);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v5 = *((_WORD *)v4 + 26);
    if ((v5 & 0x40) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t sourceRat = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_uint64_t destRat = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x20) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_dlTputObservedBeforeSwitch = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_dlTputObservedAfterSwitch = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 4) == 0)
  {
LABEL_7:
    if ((v5 & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_bwObservedBeforeSwitch = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 2) == 0)
  {
LABEL_8:
    if ((v5 & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_bwObservedAfterSwitch = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x200) == 0)
  {
LABEL_9:
    if ((v5 & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_ulTputObservedBeforeSwitch = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x100) == 0)
  {
LABEL_10:
    if ((v5 & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_23:
  self->_ulTputObservedAfterSwitch = *((_DWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 0x100u;
  if ((*((_WORD *)v4 + 26) & 0x80) != 0)
  {
LABEL_11:
    self->_subsId = *((_DWORD *)v4 + 10);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_12:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)dlTputObservedBeforeSwitch
{
  return self->_dlTputObservedBeforeSwitch;
}

- (unsigned)dlTputObservedAfterSwitch
{
  return self->_dlTputObservedAfterSwitch;
}

- (unsigned)bwObservedBeforeSwitch
{
  return self->_bwObservedBeforeSwitch;
}

- (unsigned)bwObservedAfterSwitch
{
  return self->_bwObservedAfterSwitch;
}

- (unsigned)ulTputObservedBeforeSwitch
{
  return self->_ulTputObservedBeforeSwitch;
}

- (unsigned)ulTputObservedAfterSwitch
{
  return self->_ulTputObservedAfterSwitch;
}

- (unsigned)subsId
{
  return self->_subsId;
}

@end