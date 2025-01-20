@interface AWDMETRICSCellularNrSdmEndcRelease
- (BOOL)hasFr;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)hasTriggerCause;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)frAsString:(int)a3;
- (id)triggerCauseAsString:(int)a3;
- (int)StringAsFr:(id)a3;
- (int)StringAsTriggerCause:(id)a3;
- (int)fr;
- (int)triggerCause;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)subsId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFr:(int)a3;
- (void)setHasFr:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTriggerCause:(BOOL)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTriggerCause:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDMETRICSCellularNrSdmEndcRelease

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)triggerCause
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_triggerCause;
  }
  else {
    return 0;
  }
}

- (void)setTriggerCause:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_triggerCause = a3;
}

- (void)setHasTriggerCause:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTriggerCause
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)triggerCauseAsString:(int)a3
{
  if (a3 >= 0x20)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E6929FB0[a3];
  }
  return v3;
}

- (int)StringAsTriggerCause:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_AP_SLEEP"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_CELLULAR_DATA"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_WIFI_GOOD"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_VOIP_CALL"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_COREMEDIA_STALL"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_SCREEN_STATUS"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_SYMPTOMS_RECOMM"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_UI_SWITCH"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_RLGS"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_PHS"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_AVS"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_LPM"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_VOLTE"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_FR1_SCG_SNR"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_DCNR"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_FR1_SCG_RLGS"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_MT_DATA"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_FTV_DUP"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_DROP_NR_VOIP"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_DROP_NR_ULD"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_DROP_NR_ENH_BUFF"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_BWP_SWITCH_TMR"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_SA_UPGRADE_RLGS"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_SA_UPGRADE_HI_BW"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_WIFI_ASSOCIATED"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_BWP_SWITCH_TMR_SL"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_SA_UPGRADE_HI_BW_SL"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_SA_UPGRADE_RLGS_SL"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_SADC_VONR_CON"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_SADC_THERMAL"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_MAX"])
  {
    int v4 = 31;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setSubsId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSubsId
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (int)fr
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_fr;
  }
  else {
    return 0;
  }
}

- (void)setFr:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_fr = a3;
}

- (void)setHasFr:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFr
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)frAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E692A0B0[a3];
  }
  return v3;
}

- (int)StringAsFr:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SUB6"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MMWAVE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"INVALID"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDMETRICSCellularNrSdmEndcRelease;
  int v4 = [(AWDMETRICSCellularNrSdmEndcRelease *)&v8 description];
  v5 = [(AWDMETRICSCellularNrSdmEndcRelease *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v5 forKey:@"timestamp"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
LABEL_11:
      objc_super v8 = [NSNumber numberWithUnsignedInt:self->_subsId];
      [v3 setObject:v8 forKey:@"subs_id"];

      if ((*(unsigned char *)&self->_has & 2) == 0) {
        goto LABEL_16;
      }
LABEL_12:
      uint64_t fr = self->_fr;
      if (fr >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_fr);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = off_1E692A0B0[fr];
      }
      [v3 setObject:v10 forKey:@"fr"];

      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  uint64_t triggerCause = self->_triggerCause;
  if (triggerCause >= 0x20)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_triggerCause);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_1E6929FB0[triggerCause];
  }
  [v3 setObject:v7 forKey:@"trigger_cause"];

  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_11;
  }
LABEL_4:
  if ((has & 2) != 0) {
    goto LABEL_12;
  }
LABEL_16:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMETRICSCellularNrSdmEndcReleaseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_5:
  }
    PBDataWriterWriteInt32Field();
LABEL_6:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 28) |= 1u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 6) = self->_triggerCause;
  *((unsigned char *)v4 + 28) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  *((_DWORD *)v4 + 5) = self->_subsId;
  *((unsigned char *)v4 + 28) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_5:
    *((_DWORD *)v4 + 4) = self->_fr;
    *((unsigned char *)v4 + 28) |= 2u;
  }
LABEL_6:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((unsigned char *)result + 28) |= 1u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 6) = self->_triggerCause;
  *((unsigned char *)result + 28) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 5) = self->_subsId;
  *((unsigned char *)result + 28) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_5:
  *((_DWORD *)result + 4) = self->_fr;
  *((unsigned char *)result + 28) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_21:
    BOOL v5 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 8) == 0 || self->_triggerCause != *((_DWORD *)v4 + 6)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 8) != 0)
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0 || self->_subsId != *((_DWORD *)v4 + 5)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
    goto LABEL_21;
  }
  BOOL v5 = (*((unsigned char *)v4 + 28) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_fr != *((_DWORD *)v4 + 4)) {
      goto LABEL_21;
    }
    BOOL v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v2 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_triggerCause;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_subsId;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_fr;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 28);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 28);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t triggerCause = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 28);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_subsId = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
LABEL_5:
    self->_uint64_t fr = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_6:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)subsId
{
  return self->_subsId;
}

@end