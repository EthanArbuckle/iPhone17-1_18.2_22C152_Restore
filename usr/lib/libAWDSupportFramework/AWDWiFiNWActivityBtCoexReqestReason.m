@interface AWDWiFiNWActivityBtCoexReqestReason
- (BOOL)hasA2dp;
- (BOOL)hasAcl;
- (BOOL)hasBle;
- (BOOL)hasBlescan;
- (BOOL)hasEsco;
- (BOOL)hasInquiry;
- (BOOL)hasInquiryscan;
- (BOOL)hasMss;
- (BOOL)hasOther;
- (BOOL)hasPage;
- (BOOL)hasPagescan;
- (BOOL)hasPark;
- (BOOL)hasSco;
- (BOOL)hasSniff;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)a2dp;
- (unsigned)acl;
- (unsigned)ble;
- (unsigned)blescan;
- (unsigned)esco;
- (unsigned)inquiry;
- (unsigned)inquiryscan;
- (unsigned)mss;
- (unsigned)other;
- (unsigned)page;
- (unsigned)pagescan;
- (unsigned)park;
- (unsigned)sco;
- (unsigned)sniff;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setA2dp:(unsigned int)a3;
- (void)setAcl:(unsigned int)a3;
- (void)setBle:(unsigned int)a3;
- (void)setBlescan:(unsigned int)a3;
- (void)setEsco:(unsigned int)a3;
- (void)setHasA2dp:(BOOL)a3;
- (void)setHasAcl:(BOOL)a3;
- (void)setHasBle:(BOOL)a3;
- (void)setHasBlescan:(BOOL)a3;
- (void)setHasEsco:(BOOL)a3;
- (void)setHasInquiry:(BOOL)a3;
- (void)setHasInquiryscan:(BOOL)a3;
- (void)setHasMss:(BOOL)a3;
- (void)setHasOther:(BOOL)a3;
- (void)setHasPage:(BOOL)a3;
- (void)setHasPagescan:(BOOL)a3;
- (void)setHasPark:(BOOL)a3;
- (void)setHasSco:(BOOL)a3;
- (void)setHasSniff:(BOOL)a3;
- (void)setInquiry:(unsigned int)a3;
- (void)setInquiryscan:(unsigned int)a3;
- (void)setMss:(unsigned int)a3;
- (void)setOther:(unsigned int)a3;
- (void)setPage:(unsigned int)a3;
- (void)setPagescan:(unsigned int)a3;
- (void)setPark:(unsigned int)a3;
- (void)setSco:(unsigned int)a3;
- (void)setSniff:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiNWActivityBtCoexReqestReason

- (void)setAcl:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_acl = a3;
}

- (void)setHasAcl:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAcl
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setSco:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_sco = a3;
}

- (void)setHasSco:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasSco
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setEsco:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_esco = a3;
}

- (void)setHasEsco:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasEsco
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setA2dp:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_a2dp = a3;
}

- (void)setHasA2dp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasA2dp
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setSniff:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_sniff = a3;
}

- (void)setHasSniff:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasSniff
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setPagescan:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_pagescan = a3;
}

- (void)setHasPagescan:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasPagescan
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setInquiryscan:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_inquiryscan = a3;
}

- (void)setHasInquiryscan:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasInquiryscan
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setPage:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_page = a3;
}

- (void)setHasPage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasPage
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setInquiry:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_inquiry = a3;
}

- (void)setHasInquiry:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasInquiry
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setMss:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_mss = a3;
}

- (void)setHasMss:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasMss
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setPark:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_park = a3;
}

- (void)setHasPark:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasPark
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setBle:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_ble = a3;
}

- (void)setHasBle:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasBle
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setBlescan:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_blescan = a3;
}

- (void)setHasBlescan:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasBlescan
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setOther:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_other = a3;
}

- (void)setHasOther:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasOther
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivityBtCoexReqestReason;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiNWActivityBtCoexReqestReason description](&v3, sel_description), -[AWDWiFiNWActivityBtCoexReqestReason dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_acl] forKey:@"acl"];
    __int16 has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_sco] forKey:@"sco"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_esco] forKey:@"esco"];
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_a2dp] forKey:@"a2dp"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_6:
    if ((has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_sniff] forKey:@"sniff"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_pagescan] forKey:@"pagescan"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_inquiryscan] forKey:@"inquiryscan"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_page] forKey:@"page"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_inquiry] forKey:@"inquiry"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_mss] forKey:@"mss"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_12:
    if ((has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_park] forKey:@"park"];
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_13:
    if ((has & 8) == 0) {
      goto LABEL_14;
    }
LABEL_29:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_blescan] forKey:@"blescan"];
    if ((*(_WORD *)&self->_has & 0x100) == 0) {
      return v3;
    }
    goto LABEL_15;
  }
LABEL_28:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_ble] forKey:@"ble"];
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_29;
  }
LABEL_14:
  if ((has & 0x100) != 0) {
LABEL_15:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_other] forKey:@"other"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiNWActivityBtCoexReqestReasonReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_6:
    if ((has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_12:
    if ((has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_13:
    if ((has & 8) == 0) {
      goto LABEL_14;
    }
LABEL_28:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_has & 0x100) == 0) {
      return;
    }
    goto LABEL_29;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_28;
  }
LABEL_14:
  if ((has & 0x100) == 0) {
    return;
  }
LABEL_29:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 3) = self->_acl;
    *((_WORD *)a3 + 32) |= 2u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 14) = self->_sco;
  *((_WORD *)a3 + 32) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 6) = self->_esco;
  *((_WORD *)a3 + 32) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 2) = self->_a2dp;
  *((_WORD *)a3 + 32) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_6:
    if ((has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)a3 + 15) = self->_sniff;
  *((_WORD *)a3 + 32) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)a3 + 12) = self->_pagescan;
  *((_WORD *)a3 + 32) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)a3 + 8) = self->_inquiryscan;
  *((_WORD *)a3 + 32) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)a3 + 11) = self->_page;
  *((_WORD *)a3 + 32) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)a3 + 7) = self->_inquiry;
  *((_WORD *)a3 + 32) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)a3 + 9) = self->_mss;
  *((_WORD *)a3 + 32) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_12:
    if ((has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)a3 + 13) = self->_park;
  *((_WORD *)a3 + 32) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_13:
    if ((has & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)a3 + 4) = self->_ble;
  *((_WORD *)a3 + 32) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_14:
    if ((has & 0x100) == 0) {
      return;
    }
LABEL_29:
    *((_DWORD *)a3 + 10) = self->_other;
    *((_WORD *)a3 + 32) |= 0x100u;
    return;
  }
LABEL_28:
  *((_DWORD *)a3 + 5) = self->_blescan;
  *((_WORD *)a3 + 32) |= 8u;
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    goto LABEL_29;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_acl;
    *((_WORD *)result + 32) |= 2u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 14) = self->_sco;
  *((_WORD *)result + 32) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 6) = self->_esco;
  *((_WORD *)result + 32) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 2) = self->_a2dp;
  *((_WORD *)result + 32) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_6:
    if ((has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 15) = self->_sniff;
  *((_WORD *)result + 32) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 12) = self->_pagescan;
  *((_WORD *)result + 32) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)result + 8) = self->_inquiryscan;
  *((_WORD *)result + 32) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 11) = self->_page;
  *((_WORD *)result + 32) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)result + 7) = self->_inquiry;
  *((_WORD *)result + 32) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)result + 9) = self->_mss;
  *((_WORD *)result + 32) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_12:
    if ((has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)result + 13) = self->_park;
  *((_WORD *)result + 32) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_13:
    if ((has & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)result + 4) = self->_ble;
  *((_WORD *)result + 32) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_14:
    if ((has & 0x100) == 0) {
      return result;
    }
    goto LABEL_15;
  }
LABEL_29:
  *((_DWORD *)result + 5) = self->_blescan;
  *((_WORD *)result + 32) |= 8u;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    return result;
  }
LABEL_15:
  *((_DWORD *)result + 10) = self->_other;
  *((_WORD *)result + 32) |= 0x100u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    __int16 has = (__int16)self->_has;
    __int16 v7 = *((_WORD *)a3 + 32);
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_acl != *((_DWORD *)a3 + 3)) {
        goto LABEL_71;
      }
    }
    else if ((v7 & 2) != 0)
    {
LABEL_71:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
    {
      if ((*((_WORD *)a3 + 32) & 0x1000) == 0 || self->_sco != *((_DWORD *)a3 + 14)) {
        goto LABEL_71;
      }
    }
    else if ((*((_WORD *)a3 + 32) & 0x1000) != 0)
    {
      goto LABEL_71;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_esco != *((_DWORD *)a3 + 6)) {
        goto LABEL_71;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_71;
    }
    if (has)
    {
      if ((v7 & 1) == 0 || self->_a2dp != *((_DWORD *)a3 + 2)) {
        goto LABEL_71;
      }
    }
    else if (v7)
    {
      goto LABEL_71;
    }
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
    {
      if ((*((_WORD *)a3 + 32) & 0x2000) == 0 || self->_sniff != *((_DWORD *)a3 + 15)) {
        goto LABEL_71;
      }
    }
    else if ((*((_WORD *)a3 + 32) & 0x2000) != 0)
    {
      goto LABEL_71;
    }
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 32) & 0x400) == 0 || self->_pagescan != *((_DWORD *)a3 + 12)) {
        goto LABEL_71;
      }
    }
    else if ((*((_WORD *)a3 + 32) & 0x400) != 0)
    {
      goto LABEL_71;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_inquiryscan != *((_DWORD *)a3 + 8)) {
        goto LABEL_71;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_71;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 32) & 0x200) == 0 || self->_page != *((_DWORD *)a3 + 11)) {
        goto LABEL_71;
      }
    }
    else if ((*((_WORD *)a3 + 32) & 0x200) != 0)
    {
      goto LABEL_71;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_inquiry != *((_DWORD *)a3 + 7)) {
        goto LABEL_71;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_71;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_mss != *((_DWORD *)a3 + 9)) {
        goto LABEL_71;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_71;
    }
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
      if ((*((_WORD *)a3 + 32) & 0x800) == 0 || self->_park != *((_DWORD *)a3 + 13)) {
        goto LABEL_71;
      }
    }
    else if ((*((_WORD *)a3 + 32) & 0x800) != 0)
    {
      goto LABEL_71;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_ble != *((_DWORD *)a3 + 4)) {
        goto LABEL_71;
      }
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_71;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_blescan != *((_DWORD *)a3 + 5)) {
        goto LABEL_71;
      }
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_71;
    }
    LOBYTE(v5) = (v7 & 0x100) == 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 32) & 0x100) == 0 || self->_other != *((_DWORD *)a3 + 10)) {
        goto LABEL_71;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_acl;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_sco;
      if ((has & 0x10) != 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_esco;
    if (has) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v5 = 0;
  if (has)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_a2dp;
    if ((*(_WORD *)&self->_has & 0x2000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v6 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_sniff;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v7 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_pagescan;
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
    uint64_t v9 = 2654435761 * self->_inquiryscan;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v9 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_page;
    if ((has & 0x20) != 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v10 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_inquiry;
    if ((has & 0x80) != 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v11 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_11:
    uint64_t v12 = 2654435761 * self->_mss;
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
    uint64_t v13 = 2654435761 * self->_park;
    if ((has & 4) != 0) {
      goto LABEL_13;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v13 = 0;
  if ((has & 4) != 0)
  {
LABEL_13:
    uint64_t v14 = 2654435761 * self->_ble;
    if ((has & 8) != 0) {
      goto LABEL_14;
    }
LABEL_28:
    uint64_t v15 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_15;
    }
LABEL_29:
    uint64_t v16 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
  }
LABEL_27:
  uint64_t v14 = 0;
  if ((has & 8) == 0) {
    goto LABEL_28;
  }
LABEL_14:
  uint64_t v15 = 2654435761 * self->_blescan;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_29;
  }
LABEL_15:
  uint64_t v16 = 2654435761 * self->_other;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3 = *((_WORD *)a3 + 32);
  if ((v3 & 2) != 0)
  {
    self->_acl = *((_DWORD *)a3 + 3);
    *(_WORD *)&self->_has |= 2u;
    __int16 v3 = *((_WORD *)a3 + 32);
    if ((v3 & 0x1000) == 0)
    {
LABEL_3:
      if ((v3 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*((_WORD *)a3 + 32) & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  self->_sco = *((_DWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 0x1000u;
  __int16 v3 = *((_WORD *)a3 + 32);
  if ((v3 & 0x10) == 0)
  {
LABEL_4:
    if ((v3 & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_esco = *((_DWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v3 = *((_WORD *)a3 + 32);
  if ((v3 & 1) == 0)
  {
LABEL_5:
    if ((v3 & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_a2dp = *((_DWORD *)a3 + 2);
  *(_WORD *)&self->_has |= 1u;
  __int16 v3 = *((_WORD *)a3 + 32);
  if ((v3 & 0x2000) == 0)
  {
LABEL_6:
    if ((v3 & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_sniff = *((_DWORD *)a3 + 15);
  *(_WORD *)&self->_has |= 0x2000u;
  __int16 v3 = *((_WORD *)a3 + 32);
  if ((v3 & 0x400) == 0)
  {
LABEL_7:
    if ((v3 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_pagescan = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v3 = *((_WORD *)a3 + 32);
  if ((v3 & 0x40) == 0)
  {
LABEL_8:
    if ((v3 & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_inquiryscan = *((_DWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v3 = *((_WORD *)a3 + 32);
  if ((v3 & 0x200) == 0)
  {
LABEL_9:
    if ((v3 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_page = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v3 = *((_WORD *)a3 + 32);
  if ((v3 & 0x20) == 0)
  {
LABEL_10:
    if ((v3 & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_inquiry = *((_DWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v3 = *((_WORD *)a3 + 32);
  if ((v3 & 0x80) == 0)
  {
LABEL_11:
    if ((v3 & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_mss = *((_DWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v3 = *((_WORD *)a3 + 32);
  if ((v3 & 0x800) == 0)
  {
LABEL_12:
    if ((v3 & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_park = *((_DWORD *)a3 + 13);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v3 = *((_WORD *)a3 + 32);
  if ((v3 & 4) == 0)
  {
LABEL_13:
    if ((v3 & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_ble = *((_DWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 4u;
  __int16 v3 = *((_WORD *)a3 + 32);
  if ((v3 & 8) == 0)
  {
LABEL_14:
    if ((v3 & 0x100) == 0) {
      return;
    }
LABEL_29:
    self->_other = *((_DWORD *)a3 + 10);
    *(_WORD *)&self->_has |= 0x100u;
    return;
  }
LABEL_28:
  self->_blescan = *((_DWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)a3 + 32) & 0x100) != 0) {
    goto LABEL_29;
  }
}

- (unsigned)acl
{
  return self->_acl;
}

- (unsigned)sco
{
  return self->_sco;
}

- (unsigned)esco
{
  return self->_esco;
}

- (unsigned)a2dp
{
  return self->_a2dp;
}

- (unsigned)sniff
{
  return self->_sniff;
}

- (unsigned)pagescan
{
  return self->_pagescan;
}

- (unsigned)inquiryscan
{
  return self->_inquiryscan;
}

- (unsigned)page
{
  return self->_page;
}

- (unsigned)inquiry
{
  return self->_inquiry;
}

- (unsigned)mss
{
  return self->_mss;
}

- (unsigned)park
{
  return self->_park;
}

- (unsigned)ble
{
  return self->_ble;
}

- (unsigned)blescan
{
  return self->_blescan;
}

- (unsigned)other
{
  return self->_other;
}

@end