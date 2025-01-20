@interface WiFiAnalyticsAWDWiFiNWActivityBtCoex
- (BOOL)hasA2dpdeny;
- (BOOL)hasA2dpgrant;
- (BOOL)hasAptxafterpm;
- (BOOL)hasAudiodeny;
- (BOOL)hasAudiogrant;
- (BOOL)hasBtabort;
- (BOOL)hasBtrequestReason;
- (BOOL)hasCts;
- (BOOL)hasDuration;
- (BOOL)hasGrant;
- (BOOL)hasPm;
- (BOOL)hasPsnullretrycount;
- (BOOL)hasRequest;
- (BOOL)hasSniffdeny;
- (BOOL)hasSniffgrant;
- (BOOL)hasUcodehighlatency;
- (BOOL)hasWlanrxpreempt;
- (BOOL)hasWlantxpreempt;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (WiFiAnalyticsAWDWiFiNWActivityBtCoexReqestReason)btrequestReason;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)a2dpdeny;
- (unsigned)a2dpgrant;
- (unsigned)aptxafterpm;
- (unsigned)audiodeny;
- (unsigned)audiogrant;
- (unsigned)btabort;
- (unsigned)cts;
- (unsigned)duration;
- (unsigned)grant;
- (unsigned)pm;
- (unsigned)psnullretrycount;
- (unsigned)request;
- (unsigned)sniffdeny;
- (unsigned)sniffgrant;
- (unsigned)ucodehighlatency;
- (unsigned)wlanrxpreempt;
- (unsigned)wlantxpreempt;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setA2dpdeny:(unsigned int)a3;
- (void)setA2dpgrant:(unsigned int)a3;
- (void)setAptxafterpm:(unsigned int)a3;
- (void)setAudiodeny:(unsigned int)a3;
- (void)setAudiogrant:(unsigned int)a3;
- (void)setBtabort:(unsigned int)a3;
- (void)setBtrequestReason:(id)a3;
- (void)setCts:(unsigned int)a3;
- (void)setDuration:(unsigned int)a3;
- (void)setGrant:(unsigned int)a3;
- (void)setHasA2dpdeny:(BOOL)a3;
- (void)setHasA2dpgrant:(BOOL)a3;
- (void)setHasAptxafterpm:(BOOL)a3;
- (void)setHasAudiodeny:(BOOL)a3;
- (void)setHasAudiogrant:(BOOL)a3;
- (void)setHasBtabort:(BOOL)a3;
- (void)setHasCts:(BOOL)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasGrant:(BOOL)a3;
- (void)setHasPm:(BOOL)a3;
- (void)setHasPsnullretrycount:(BOOL)a3;
- (void)setHasRequest:(BOOL)a3;
- (void)setHasSniffdeny:(BOOL)a3;
- (void)setHasSniffgrant:(BOOL)a3;
- (void)setHasUcodehighlatency:(BOOL)a3;
- (void)setHasWlanrxpreempt:(BOOL)a3;
- (void)setHasWlantxpreempt:(BOOL)a3;
- (void)setPm:(unsigned int)a3;
- (void)setPsnullretrycount:(unsigned int)a3;
- (void)setRequest:(unsigned int)a3;
- (void)setSniffdeny:(unsigned int)a3;
- (void)setSniffgrant:(unsigned int)a3;
- (void)setUcodehighlatency:(unsigned int)a3;
- (void)setWlanrxpreempt:(unsigned int)a3;
- (void)setWlantxpreempt:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation WiFiAnalyticsAWDWiFiNWActivityBtCoex

- (void).cxx_destruct
{
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  id v6 = v4;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_6;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_16;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_39:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_18:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_19:
  if (self->_btrequestReason)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    v9 = [NSNumber numberWithUnsignedInt:self->_request];
    [v3 setObject:v9 forKey:@"request"];

    $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  v10 = [NSNumber numberWithUnsignedInt:self->_grant];
  [v3 setObject:v10 forKey:@"grant"];

  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }
LABEL_26:
  v11 = [NSNumber numberWithUnsignedInt:self->_duration];
  [v3 setObject:v11 forKey:@"duration"];

  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_6;
    }
    goto LABEL_28;
  }
LABEL_27:
  v12 = [NSNumber numberWithUnsignedInt:self->_btabort];
  [v3 setObject:v12 forKey:@"btabort"];

  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_29;
  }
LABEL_28:
  v13 = [NSNumber numberWithUnsignedInt:self->_psnullretrycount];
  [v3 setObject:v13 forKey:@"psnullretrycount"];

  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_30;
  }
LABEL_29:
  v14 = [NSNumber numberWithUnsignedInt:self->_ucodehighlatency];
  [v3 setObject:v14 forKey:@"ucodehighlatency"];

  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_31;
  }
LABEL_30:
  v15 = [NSNumber numberWithUnsignedInt:self->_cts];
  [v3 setObject:v15 forKey:@"cts"];

  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_32;
  }
LABEL_31:
  v16 = [NSNumber numberWithUnsignedInt:self->_pm];
  [v3 setObject:v16 forKey:@"pm"];

  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_33;
  }
LABEL_32:
  v17 = [NSNumber numberWithUnsignedInt:self->_wlantxpreempt];
  [v3 setObject:v17 forKey:@"wlantxpreempt"];

  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_34;
  }
LABEL_33:
  v18 = [NSNumber numberWithUnsignedInt:self->_wlanrxpreempt];
  [v3 setObject:v18 forKey:@"wlanrxpreempt"];

  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_35;
  }
LABEL_34:
  v19 = [NSNumber numberWithUnsignedInt:self->_aptxafterpm];
  [v3 setObject:v19 forKey:@"aptxafterpm"];

  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_36;
  }
LABEL_35:
  v20 = [NSNumber numberWithUnsignedInt:self->_audiogrant];
  [v3 setObject:v20 forKey:@"audiogrant"];

  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_37;
  }
LABEL_36:
  v21 = [NSNumber numberWithUnsignedInt:self->_audiodeny];
  [v3 setObject:v21 forKey:@"audiodeny"];

  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_16;
    }
    goto LABEL_38;
  }
LABEL_37:
  v22 = [NSNumber numberWithUnsignedInt:self->_a2dpgrant];
  [v3 setObject:v22 forKey:@"a2dpgrant"];

  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_39;
  }
LABEL_38:
  v23 = [NSNumber numberWithUnsignedInt:self->_a2dpdeny];
  [v3 setObject:v23 forKey:@"a2dpdeny"];

  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_39:
  v24 = [NSNumber numberWithUnsignedInt:self->_sniffgrant];
  [v3 setObject:v24 forKey:@"sniffgrant"];

  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_18:
    v5 = [NSNumber numberWithUnsignedInt:self->_sniffdeny];
    [v3 setObject:v5 forKey:@"sniffdeny"];
  }
LABEL_19:
  btrequestReason = self->_btrequestReason;
  if (btrequestReason)
  {
    v7 = [(WiFiAnalyticsAWDWiFiNWActivityBtCoexReqestReason *)btrequestReason dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"btrequestReason"];
  }
  return v3;
}

- (void)setWlantxpreempt:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_wlantxpreempt = a3;
}

- (void)setWlanrxpreempt:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_wlanrxpreempt = a3;
}

- (void)setUcodehighlatency:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_ucodehighlatency = a3;
}

- (void)setSniffgrant:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_sniffgrant = a3;
}

- (void)setSniffdeny:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_sniffdeny = a3;
}

- (void)setRequest:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_request = a3;
}

- (void)setPsnullretrycount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_psnullretrycount = a3;
}

- (void)setPm:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_pm = a3;
}

- (void)setGrant:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_grant = a3;
}

- (void)setDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_duration = a3;
}

- (void)setCts:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_cts = a3;
}

- (void)setBtrequestReason:(id)a3
{
}

- (void)setBtabort:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_btabort = a3;
}

- (void)setAudiogrant:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_audiogrant = a3;
}

- (void)setAudiodeny:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_audiodeny = a3;
}

- (void)setAptxafterpm:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_aptxafterpm = a3;
}

- (void)setA2dpgrant:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_a2dpgrant = a3;
}

- (void)setA2dpdeny:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_a2dpdeny = a3;
}

- (void)setHasRequest:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_$50FC93E31E005817C4FDB043B4F0901D has = ($50FC93E31E005817C4FDB043B4F0901D)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasRequest
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setHasGrant:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_$50FC93E31E005817C4FDB043B4F0901D has = ($50FC93E31E005817C4FDB043B4F0901D)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasGrant
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setHasDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_$50FC93E31E005817C4FDB043B4F0901D has = ($50FC93E31E005817C4FDB043B4F0901D)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasDuration
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setHasBtabort:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_$50FC93E31E005817C4FDB043B4F0901D has = ($50FC93E31E005817C4FDB043B4F0901D)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasBtabort
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasPsnullretrycount:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_$50FC93E31E005817C4FDB043B4F0901D has = ($50FC93E31E005817C4FDB043B4F0901D)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasPsnullretrycount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setHasUcodehighlatency:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_$50FC93E31E005817C4FDB043B4F0901D has = ($50FC93E31E005817C4FDB043B4F0901D)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasUcodehighlatency
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setHasCts:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_$50FC93E31E005817C4FDB043B4F0901D has = ($50FC93E31E005817C4FDB043B4F0901D)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasCts
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setHasPm:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_$50FC93E31E005817C4FDB043B4F0901D has = ($50FC93E31E005817C4FDB043B4F0901D)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasPm
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setHasWlantxpreempt:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_$50FC93E31E005817C4FDB043B4F0901D has = ($50FC93E31E005817C4FDB043B4F0901D)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasWlantxpreempt
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setHasWlanrxpreempt:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_$50FC93E31E005817C4FDB043B4F0901D has = ($50FC93E31E005817C4FDB043B4F0901D)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasWlanrxpreempt
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setHasAptxafterpm:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_$50FC93E31E005817C4FDB043B4F0901D has = ($50FC93E31E005817C4FDB043B4F0901D)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasAptxafterpm
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasAudiogrant:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_$50FC93E31E005817C4FDB043B4F0901D has = ($50FC93E31E005817C4FDB043B4F0901D)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasAudiogrant
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasAudiodeny:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_$50FC93E31E005817C4FDB043B4F0901D has = ($50FC93E31E005817C4FDB043B4F0901D)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasAudiodeny
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasA2dpgrant:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_$50FC93E31E005817C4FDB043B4F0901D has = ($50FC93E31E005817C4FDB043B4F0901D)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasA2dpgrant
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasA2dpdeny:(BOOL)a3
{
  self->_$50FC93E31E005817C4FDB043B4F0901D has = ($50FC93E31E005817C4FDB043B4F0901D)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasA2dpdeny
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setHasSniffgrant:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_$50FC93E31E005817C4FDB043B4F0901D has = ($50FC93E31E005817C4FDB043B4F0901D)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasSniffgrant
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setHasSniffdeny:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_$50FC93E31E005817C4FDB043B4F0901D has = ($50FC93E31E005817C4FDB043B4F0901D)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasSniffdeny
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (BOOL)hasBtrequestReason
{
  return self->_btrequestReason != 0;
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiNWActivityBtCoex;
  id v4 = [(WiFiAnalyticsAWDWiFiNWActivityBtCoex *)&v8 description];
  v5 = [(WiFiAnalyticsAWDWiFiNWActivityBtCoex *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiNWActivityBtCoexReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    v4[15] = self->_request;
    v4[21] |= 0x800u;
    $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  v4[12] = self->_grant;
  v4[21] |= 0x100u;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }
LABEL_26:
  v4[11] = self->_duration;
  v4[21] |= 0x80u;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_6;
    }
    goto LABEL_28;
  }
LABEL_27:
  v4[7] = self->_btabort;
  v4[21] |= 0x20u;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_29;
  }
LABEL_28:
  v4[14] = self->_psnullretrycount;
  v4[21] |= 0x400u;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_30;
  }
LABEL_29:
  v4[18] = self->_ucodehighlatency;
  v4[21] |= 0x4000u;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_31;
  }
LABEL_30:
  v4[10] = self->_cts;
  v4[21] |= 0x40u;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_32;
  }
LABEL_31:
  v4[13] = self->_pm;
  v4[21] |= 0x200u;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_33;
  }
LABEL_32:
  v4[20] = self->_wlantxpreempt;
  v4[21] |= 0x10000u;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_34;
  }
LABEL_33:
  v4[19] = self->_wlanrxpreempt;
  v4[21] |= 0x8000u;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_35;
  }
LABEL_34:
  v4[4] = self->_aptxafterpm;
  v4[21] |= 4u;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_36;
  }
LABEL_35:
  v4[6] = self->_audiogrant;
  v4[21] |= 0x10u;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_37;
  }
LABEL_36:
  v4[5] = self->_audiodeny;
  v4[21] |= 8u;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_16;
    }
    goto LABEL_38;
  }
LABEL_37:
  v4[3] = self->_a2dpgrant;
  v4[21] |= 2u;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_39;
  }
LABEL_38:
  v4[2] = self->_a2dpdeny;
  v4[21] |= 1u;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_39:
  v4[17] = self->_sniffgrant;
  v4[21] |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_18:
    v4[16] = self->_sniffdeny;
    v4[21] |= 0x1000u;
  }
LABEL_19:
  if (self->_btrequestReason)
  {
    id v6 = v4;
    objc_msgSend(v4, "setBtrequestReason:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (_DWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = v5;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    v5[15] = self->_request;
    v5[21] |= 0x800u;
    $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  v5[12] = self->_grant;
  v5[21] |= 0x100u;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_22:
  v5[11] = self->_duration;
  v5[21] |= 0x80u;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_23:
  v5[7] = self->_btabort;
  v5[21] |= 0x20u;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_24:
  v5[14] = self->_psnullretrycount;
  v5[21] |= 0x400u;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  v5[18] = self->_ucodehighlatency;
  v5[21] |= 0x4000u;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  v5[10] = self->_cts;
  v5[21] |= 0x40u;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  v5[13] = self->_pm;
  v5[21] |= 0x200u;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  v5[20] = self->_wlantxpreempt;
  v5[21] |= 0x10000u;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  v5[19] = self->_wlanrxpreempt;
  v5[21] |= 0x8000u;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  v5[4] = self->_aptxafterpm;
  v5[21] |= 4u;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  v5[6] = self->_audiogrant;
  v5[21] |= 0x10u;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  v5[5] = self->_audiodeny;
  v5[21] |= 8u;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_16;
    }
    goto LABEL_34;
  }
LABEL_33:
  v5[3] = self->_a2dpgrant;
  v5[21] |= 2u;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_17;
    }
LABEL_35:
    v5[17] = self->_sniffgrant;
    v5[21] |= 0x2000u;
    if ((*(_DWORD *)&self->_has & 0x1000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_34:
  v5[2] = self->_a2dpdeny;
  v5[21] |= 1u;
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(_WORD *)&has & 0x2000) != 0) {
    goto LABEL_35;
  }
LABEL_17:
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_18:
    v5[16] = self->_sniffdeny;
    v5[21] |= 0x1000u;
  }
LABEL_19:
  id v8 = [(WiFiAnalyticsAWDWiFiNWActivityBtCoexReqestReason *)self->_btrequestReason copyWithZone:a3];
  v9 = (void *)v6[4];
  v6[4] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_89;
  }
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  int v6 = *((_DWORD *)v4 + 21);
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_request != *((_DWORD *)v4 + 15)) {
      goto LABEL_89;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
LABEL_89:
    char v8 = 0;
    goto LABEL_90;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_grant != *((_DWORD *)v4 + 12)) {
      goto LABEL_89;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_89;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_duration != *((_DWORD *)v4 + 11)) {
      goto LABEL_89;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_89;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_btabort != *((_DWORD *)v4 + 7)) {
      goto LABEL_89;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_89;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_psnullretrycount != *((_DWORD *)v4 + 14)) {
      goto LABEL_89;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_89;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_ucodehighlatency != *((_DWORD *)v4 + 18)) {
      goto LABEL_89;
    }
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_89;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_cts != *((_DWORD *)v4 + 10)) {
      goto LABEL_89;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_89;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_pm != *((_DWORD *)v4 + 13)) {
      goto LABEL_89;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_89;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_wlantxpreempt != *((_DWORD *)v4 + 20)) {
      goto LABEL_89;
    }
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_89;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_wlanrxpreempt != *((_DWORD *)v4 + 19)) {
      goto LABEL_89;
    }
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_89;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_aptxafterpm != *((_DWORD *)v4 + 4)) {
      goto LABEL_89;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_89;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_audiogrant != *((_DWORD *)v4 + 6)) {
      goto LABEL_89;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_89;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_audiodeny != *((_DWORD *)v4 + 5)) {
      goto LABEL_89;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_89;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_a2dpgrant != *((_DWORD *)v4 + 3)) {
      goto LABEL_89;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_89;
  }
  if (*(unsigned char *)&has)
  {
    if ((v6 & 1) == 0 || self->_a2dpdeny != *((_DWORD *)v4 + 2)) {
      goto LABEL_89;
    }
  }
  else if (v6)
  {
    goto LABEL_89;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_sniffgrant != *((_DWORD *)v4 + 17)) {
      goto LABEL_89;
    }
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_89;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_sniffdeny != *((_DWORD *)v4 + 16)) {
      goto LABEL_89;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_89;
  }
  btrequestReason = self->_btrequestReason;
  if ((unint64_t)btrequestReason | *((void *)v4 + 4)) {
    char v8 = -[WiFiAnalyticsAWDWiFiNWActivityBtCoexReqestReason isEqual:](btrequestReason, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_90:

  return v8;
}

- (unint64_t)hash
{
  $50FC93E31E005817C4FDB043B4F0901D has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    uint64_t v3 = 2654435761 * self->_request;
    if ((*(_WORD *)&has & 0x100) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_grant;
      if ((*(unsigned char *)&has & 0x80) != 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_duration;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_btabort;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v6 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_psnullretrycount;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v7 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_ucodehighlatency;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_cts;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v9 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_pm;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v10 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_wlantxpreempt;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v11 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_11:
    uint64_t v12 = 2654435761 * self->_wlanrxpreempt;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v12 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_12:
    uint64_t v13 = 2654435761 * self->_aptxafterpm;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v13 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_13:
    uint64_t v14 = 2654435761 * self->_audiogrant;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v14 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_14:
    uint64_t v15 = 2654435761 * self->_audiodeny;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_15;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v15 = 0;
  if ((*(unsigned char *)&has & 2) != 0)
  {
LABEL_15:
    uint64_t v16 = 2654435761 * self->_a2dpgrant;
    if (*(unsigned char *)&has) {
      goto LABEL_16;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v16 = 0;
  if (*(unsigned char *)&has)
  {
LABEL_16:
    uint64_t v17 = 2654435761 * self->_a2dpdeny;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_17;
    }
LABEL_34:
    uint64_t v18 = 0;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_18;
    }
LABEL_35:
    uint64_t v19 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ [(WiFiAnalyticsAWDWiFiNWActivityBtCoexReqestReason *)self->_btrequestReason hash];
  }
LABEL_33:
  uint64_t v17 = 0;
  if ((*(_WORD *)&has & 0x2000) == 0) {
    goto LABEL_34;
  }
LABEL_17:
  uint64_t v18 = 2654435761 * self->_sniffgrant;
  if ((*(_WORD *)&has & 0x1000) == 0) {
    goto LABEL_35;
  }
LABEL_18:
  uint64_t v19 = 2654435761 * self->_sniffdeny;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ [(WiFiAnalyticsAWDWiFiNWActivityBtCoexReqestReason *)self->_btrequestReason hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (unsigned int *)a3;
  uint64_t v5 = v4;
  unsigned int v6 = v4[21];
  if ((v6 & 0x800) != 0)
  {
    self->_request = v4[15];
    *(_DWORD *)&self->_has |= 0x800u;
    unsigned int v6 = v4[21];
    if ((v6 & 0x100) == 0)
    {
LABEL_3:
      if ((v6 & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((v6 & 0x100) == 0)
  {
    goto LABEL_3;
  }
  self->_grant = v4[12];
  *(_DWORD *)&self->_has |= 0x100u;
  unsigned int v6 = v4[21];
  if ((v6 & 0x80) == 0)
  {
LABEL_4:
    if ((v6 & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_duration = v4[11];
  *(_DWORD *)&self->_has |= 0x80u;
  unsigned int v6 = v4[21];
  if ((v6 & 0x20) == 0)
  {
LABEL_5:
    if ((v6 & 0x400) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_btabort = v4[7];
  *(_DWORD *)&self->_has |= 0x20u;
  unsigned int v6 = v4[21];
  if ((v6 & 0x400) == 0)
  {
LABEL_6:
    if ((v6 & 0x4000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_psnullretrycount = v4[14];
  *(_DWORD *)&self->_has |= 0x400u;
  unsigned int v6 = v4[21];
  if ((v6 & 0x4000) == 0)
  {
LABEL_7:
    if ((v6 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_ucodehighlatency = v4[18];
  *(_DWORD *)&self->_has |= 0x4000u;
  unsigned int v6 = v4[21];
  if ((v6 & 0x40) == 0)
  {
LABEL_8:
    if ((v6 & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_cts = v4[10];
  *(_DWORD *)&self->_has |= 0x40u;
  unsigned int v6 = v4[21];
  if ((v6 & 0x200) == 0)
  {
LABEL_9:
    if ((v6 & 0x10000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_pm = v4[13];
  *(_DWORD *)&self->_has |= 0x200u;
  unsigned int v6 = v4[21];
  if ((v6 & 0x10000) == 0)
  {
LABEL_10:
    if ((v6 & 0x8000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_wlantxpreempt = v4[20];
  *(_DWORD *)&self->_has |= 0x10000u;
  unsigned int v6 = v4[21];
  if ((v6 & 0x8000) == 0)
  {
LABEL_11:
    if ((v6 & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_wlanrxpreempt = v4[19];
  *(_DWORD *)&self->_has |= 0x8000u;
  unsigned int v6 = v4[21];
  if ((v6 & 4) == 0)
  {
LABEL_12:
    if ((v6 & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_aptxafterpm = v4[4];
  *(_DWORD *)&self->_has |= 4u;
  unsigned int v6 = v4[21];
  if ((v6 & 0x10) == 0)
  {
LABEL_13:
    if ((v6 & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_audiogrant = v4[6];
  *(_DWORD *)&self->_has |= 0x10u;
  unsigned int v6 = v4[21];
  if ((v6 & 8) == 0)
  {
LABEL_14:
    if ((v6 & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_audiodeny = v4[5];
  *(_DWORD *)&self->_has |= 8u;
  unsigned int v6 = v4[21];
  if ((v6 & 2) == 0)
  {
LABEL_15:
    if ((v6 & 1) == 0) {
      goto LABEL_16;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_a2dpgrant = v4[3];
  *(_DWORD *)&self->_has |= 2u;
  unsigned int v6 = v4[21];
  if ((v6 & 1) == 0)
  {
LABEL_16:
    if ((v6 & 0x2000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_a2dpdeny = v4[2];
  *(_DWORD *)&self->_has |= 1u;
  unsigned int v6 = v4[21];
  if ((v6 & 0x2000) == 0)
  {
LABEL_17:
    if ((v6 & 0x1000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_37:
  self->_sniffgrant = v4[17];
  *(_DWORD *)&self->_has |= 0x2000u;
  if ((v4[21] & 0x1000) != 0)
  {
LABEL_18:
    self->_sniffdeny = v4[16];
    *(_DWORD *)&self->_has |= 0x1000u;
  }
LABEL_19:
  btrequestReason = self->_btrequestReason;
  uint64_t v8 = *((void *)v5 + 4);
  if (btrequestReason)
  {
    if (v8) {
      -[WiFiAnalyticsAWDWiFiNWActivityBtCoexReqestReason mergeFrom:](btrequestReason, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityBtCoex setBtrequestReason:](self, "setBtrequestReason:");
  }
  MEMORY[0x270F9A758]();
}

- (unsigned)request
{
  return self->_request;
}

- (unsigned)grant
{
  return self->_grant;
}

- (unsigned)duration
{
  return self->_duration;
}

- (unsigned)btabort
{
  return self->_btabort;
}

- (unsigned)psnullretrycount
{
  return self->_psnullretrycount;
}

- (unsigned)ucodehighlatency
{
  return self->_ucodehighlatency;
}

- (unsigned)cts
{
  return self->_cts;
}

- (unsigned)pm
{
  return self->_pm;
}

- (unsigned)wlantxpreempt
{
  return self->_wlantxpreempt;
}

- (unsigned)wlanrxpreempt
{
  return self->_wlanrxpreempt;
}

- (unsigned)aptxafterpm
{
  return self->_aptxafterpm;
}

- (unsigned)audiogrant
{
  return self->_audiogrant;
}

- (unsigned)audiodeny
{
  return self->_audiodeny;
}

- (unsigned)a2dpgrant
{
  return self->_a2dpgrant;
}

- (unsigned)a2dpdeny
{
  return self->_a2dpdeny;
}

- (unsigned)sniffgrant
{
  return self->_sniffgrant;
}

- (unsigned)sniffdeny
{
  return self->_sniffdeny;
}

- (WiFiAnalyticsAWDWiFiNWActivityBtCoexReqestReason)btrequestReason
{
  return self->_btrequestReason;
}

@end