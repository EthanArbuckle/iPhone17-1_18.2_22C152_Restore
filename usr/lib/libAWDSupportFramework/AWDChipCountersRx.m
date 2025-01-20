@interface AWDChipCountersRx
- (BOOL)hasRxbadcm;
- (BOOL)hasRxbadda;
- (BOOL)hasRxbadds;
- (BOOL)hasRxbadproto;
- (BOOL)hasRxbadsrcmac;
- (BOOL)hasRxbyte;
- (BOOL)hasRxctl;
- (BOOL)hasRxerror;
- (BOOL)hasRxfilter;
- (BOOL)hasRxfragerr;
- (BOOL)hasRxframe;
- (BOOL)hasRxgiant;
- (BOOL)hasRxnobuf;
- (BOOL)hasRxnondata;
- (BOOL)hasRxnoscb;
- (BOOL)hasRxrtry;
- (BOOL)hasRxrunt;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)rxbadcm;
- (unint64_t)rxbadda;
- (unint64_t)rxbadds;
- (unint64_t)rxbadproto;
- (unint64_t)rxbadsrcmac;
- (unint64_t)rxbyte;
- (unint64_t)rxctl;
- (unint64_t)rxerror;
- (unint64_t)rxfilter;
- (unint64_t)rxfragerr;
- (unint64_t)rxframe;
- (unint64_t)rxgiant;
- (unint64_t)rxnobuf;
- (unint64_t)rxnondata;
- (unint64_t)rxnoscb;
- (unint64_t)rxrtry;
- (unint64_t)rxrunt;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasRxbadcm:(BOOL)a3;
- (void)setHasRxbadda:(BOOL)a3;
- (void)setHasRxbadds:(BOOL)a3;
- (void)setHasRxbadproto:(BOOL)a3;
- (void)setHasRxbadsrcmac:(BOOL)a3;
- (void)setHasRxbyte:(BOOL)a3;
- (void)setHasRxctl:(BOOL)a3;
- (void)setHasRxerror:(BOOL)a3;
- (void)setHasRxfilter:(BOOL)a3;
- (void)setHasRxfragerr:(BOOL)a3;
- (void)setHasRxframe:(BOOL)a3;
- (void)setHasRxgiant:(BOOL)a3;
- (void)setHasRxnobuf:(BOOL)a3;
- (void)setHasRxnondata:(BOOL)a3;
- (void)setHasRxnoscb:(BOOL)a3;
- (void)setHasRxrtry:(BOOL)a3;
- (void)setHasRxrunt:(BOOL)a3;
- (void)setRxbadcm:(unint64_t)a3;
- (void)setRxbadda:(unint64_t)a3;
- (void)setRxbadds:(unint64_t)a3;
- (void)setRxbadproto:(unint64_t)a3;
- (void)setRxbadsrcmac:(unint64_t)a3;
- (void)setRxbyte:(unint64_t)a3;
- (void)setRxctl:(unint64_t)a3;
- (void)setRxerror:(unint64_t)a3;
- (void)setRxfilter:(unint64_t)a3;
- (void)setRxfragerr:(unint64_t)a3;
- (void)setRxframe:(unint64_t)a3;
- (void)setRxgiant:(unint64_t)a3;
- (void)setRxnobuf:(unint64_t)a3;
- (void)setRxnondata:(unint64_t)a3;
- (void)setRxnoscb:(unint64_t)a3;
- (void)setRxrtry:(unint64_t)a3;
- (void)setRxrunt:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDChipCountersRx

- (void)setRxframe:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_rxframe = a3;
}

- (void)setHasRxframe:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5146D2D40FA8CC3C8062BA4445AD9EBA)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasRxframe
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setRxbyte:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_rxbyte = a3;
}

- (void)setHasRxbyte:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5146D2D40FA8CC3C8062BA4445AD9EBA)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasRxbyte
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setRxerror:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_rxerror = a3;
}

- (void)setHasRxerror:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5146D2D40FA8CC3C8062BA4445AD9EBA)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasRxerror
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setRxctl:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_rxctl = a3;
}

- (void)setHasRxctl:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5146D2D40FA8CC3C8062BA4445AD9EBA)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasRxctl
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setRxnobuf:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_rxnobuf = a3;
}

- (void)setHasRxnobuf:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5146D2D40FA8CC3C8062BA4445AD9EBA)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasRxnobuf
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setRxrtry:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_rxrtry = a3;
}

- (void)setHasRxrtry:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5146D2D40FA8CC3C8062BA4445AD9EBA)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasRxrtry
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setRxnondata:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_rxnondata = a3;
}

- (void)setHasRxnondata:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5146D2D40FA8CC3C8062BA4445AD9EBA)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasRxnondata
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setRxbadds:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_rxbadds = a3;
}

- (void)setHasRxbadds:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5146D2D40FA8CC3C8062BA4445AD9EBA)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasRxbadds
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setRxbadcm:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_rxbadcm = a3;
}

- (void)setHasRxbadcm:(BOOL)a3
{
  self->_has = ($5146D2D40FA8CC3C8062BA4445AD9EBA)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasRxbadcm
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setRxfragerr:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_rxfragerr = a3;
}

- (void)setHasRxfragerr:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5146D2D40FA8CC3C8062BA4445AD9EBA)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasRxfragerr
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setRxrunt:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_rxrunt = a3;
}

- (void)setHasRxrunt:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5146D2D40FA8CC3C8062BA4445AD9EBA)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasRxrunt
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setRxgiant:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_rxgiant = a3;
}

- (void)setHasRxgiant:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5146D2D40FA8CC3C8062BA4445AD9EBA)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasRxgiant
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setRxnoscb:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_rxnoscb = a3;
}

- (void)setHasRxnoscb:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5146D2D40FA8CC3C8062BA4445AD9EBA)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasRxnoscb
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setRxbadproto:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_rxbadproto = a3;
}

- (void)setHasRxbadproto:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5146D2D40FA8CC3C8062BA4445AD9EBA)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasRxbadproto
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setRxbadsrcmac:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_rxbadsrcmac = a3;
}

- (void)setHasRxbadsrcmac:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5146D2D40FA8CC3C8062BA4445AD9EBA)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasRxbadsrcmac
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setRxbadda:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_rxbadda = a3;
}

- (void)setHasRxbadda:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5146D2D40FA8CC3C8062BA4445AD9EBA)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasRxbadda
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRxfilter:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_rxfilter = a3;
}

- (void)setHasRxfilter:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5146D2D40FA8CC3C8062BA4445AD9EBA)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasRxfilter
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDChipCountersRx;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDChipCountersRx description](&v3, sel_description), -[AWDChipCountersRx dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxframe] forKey:@"rxframe"];
    $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
    if ((*(unsigned char *)&has & 0x20) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)&has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxbyte] forKey:@"rxbyte"];
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxerror] forKey:@"rxerror"];
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxctl] forKey:@"rxctl"];
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_24:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxnobuf] forKey:@"rxnobuf"];
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxrtry] forKey:@"rxrtry"];
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxnondata] forKey:@"rxnondata"];
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxbadds] forKey:@"rxbadds"];
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxbadcm] forKey:@"rxbadcm"];
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxfragerr] forKey:@"rxfragerr"];
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxrunt] forKey:@"rxrunt"];
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxgiant] forKey:@"rxgiant"];
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxnoscb] forKey:@"rxnoscb"];
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_34;
  }
LABEL_33:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxbadproto] forKey:@"rxbadproto"];
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_17;
    }
LABEL_35:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxbadda] forKey:@"rxbadda"];
    if ((*(_DWORD *)&self->_has & 0x100) == 0) {
      return v3;
    }
    goto LABEL_18;
  }
LABEL_34:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxbadsrcmac] forKey:@"rxbadsrcmac"];
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(unsigned char *)&has & 2) != 0) {
    goto LABEL_35;
  }
LABEL_17:
  if ((*(_WORD *)&has & 0x100) != 0) {
LABEL_18:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxfilter] forKey:@"rxfilter"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDChipCountersRxReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    PBDataWriterWriteUint64Field();
    $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
    if ((*(unsigned char *)&has & 0x20) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint64Field();
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint64Field();
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint64Field();
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint64Field();
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint64Field();
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint64Field();
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint64Field();
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint64Field();
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint64Field();
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint64Field();
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_15;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint64Field();
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint64Field();
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_17;
    }
LABEL_34:
    PBDataWriterWriteUint64Field();
    if ((*(_DWORD *)&self->_has & 0x100) == 0) {
      return;
    }
    goto LABEL_35;
  }
LABEL_33:
  PBDataWriterWriteUint64Field();
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(unsigned char *)&has & 2) != 0) {
    goto LABEL_34;
  }
LABEL_17:
  if ((*(_WORD *)&has & 0x100) == 0) {
    return;
  }
LABEL_35:

  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    *((void *)a3 + 11) = self->_rxframe;
    *((_DWORD *)a3 + 36) |= 0x400u;
    $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
    if ((*(unsigned char *)&has & 0x20) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 6) = self->_rxbyte;
  *((_DWORD *)a3 + 36) |= 0x20u;
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((void *)a3 + 8) = self->_rxerror;
  *((_DWORD *)a3 + 36) |= 0x80u;
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((void *)a3 + 7) = self->_rxctl;
  *((_DWORD *)a3 + 36) |= 0x40u;
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((void *)a3 + 13) = self->_rxnobuf;
  *((_DWORD *)a3 + 36) |= 0x1000u;
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((void *)a3 + 16) = self->_rxrtry;
  *((_DWORD *)a3 + 36) |= 0x8000u;
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((void *)a3 + 14) = self->_rxnondata;
  *((_DWORD *)a3 + 36) |= 0x2000u;
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((void *)a3 + 3) = self->_rxbadds;
  *((_DWORD *)a3 + 36) |= 4u;
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((void *)a3 + 1) = self->_rxbadcm;
  *((_DWORD *)a3 + 36) |= 1u;
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((void *)a3 + 10) = self->_rxfragerr;
  *((_DWORD *)a3 + 36) |= 0x200u;
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((void *)a3 + 17) = self->_rxrunt;
  *((_DWORD *)a3 + 36) |= 0x10000u;
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((void *)a3 + 12) = self->_rxgiant;
  *((_DWORD *)a3 + 36) |= 0x800u;
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_15;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((void *)a3 + 15) = self->_rxnoscb;
  *((_DWORD *)a3 + 36) |= 0x4000u;
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((void *)a3 + 4) = self->_rxbadproto;
  *((_DWORD *)a3 + 36) |= 8u;
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_17;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((void *)a3 + 5) = self->_rxbadsrcmac;
  *((_DWORD *)a3 + 36) |= 0x10u;
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x100) == 0) {
      return;
    }
LABEL_35:
    *((void *)a3 + 9) = self->_rxfilter;
    *((_DWORD *)a3 + 36) |= 0x100u;
    return;
  }
LABEL_34:
  *((void *)a3 + 2) = self->_rxbadda;
  *((_DWORD *)a3 + 36) |= 2u;
  if ((*(_DWORD *)&self->_has & 0x100) != 0) {
    goto LABEL_35;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    *((void *)result + 11) = self->_rxframe;
    *((_DWORD *)result + 36) |= 0x400u;
    $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
    if ((*(unsigned char *)&has & 0x20) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)&has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 6) = self->_rxbyte;
  *((_DWORD *)result + 36) |= 0x20u;
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((void *)result + 8) = self->_rxerror;
  *((_DWORD *)result + 36) |= 0x80u;
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((void *)result + 7) = self->_rxctl;
  *((_DWORD *)result + 36) |= 0x40u;
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((void *)result + 13) = self->_rxnobuf;
  *((_DWORD *)result + 36) |= 0x1000u;
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((void *)result + 16) = self->_rxrtry;
  *((_DWORD *)result + 36) |= 0x8000u;
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((void *)result + 14) = self->_rxnondata;
  *((_DWORD *)result + 36) |= 0x2000u;
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((void *)result + 3) = self->_rxbadds;
  *((_DWORD *)result + 36) |= 4u;
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((void *)result + 1) = self->_rxbadcm;
  *((_DWORD *)result + 36) |= 1u;
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((void *)result + 10) = self->_rxfragerr;
  *((_DWORD *)result + 36) |= 0x200u;
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((void *)result + 17) = self->_rxrunt;
  *((_DWORD *)result + 36) |= 0x10000u;
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((void *)result + 12) = self->_rxgiant;
  *((_DWORD *)result + 36) |= 0x800u;
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((void *)result + 15) = self->_rxnoscb;
  *((_DWORD *)result + 36) |= 0x4000u;
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((void *)result + 4) = self->_rxbadproto;
  *((_DWORD *)result + 36) |= 8u;
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_17;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((void *)result + 5) = self->_rxbadsrcmac;
  *((_DWORD *)result + 36) |= 0x10u;
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x100) == 0) {
      return result;
    }
    goto LABEL_18;
  }
LABEL_35:
  *((void *)result + 2) = self->_rxbadda;
  *((_DWORD *)result + 36) |= 2u;
  if ((*(_DWORD *)&self->_has & 0x100) == 0) {
    return result;
  }
LABEL_18:
  *((void *)result + 9) = self->_rxfilter;
  *((_DWORD *)result + 36) |= 0x100u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
    int v7 = *((_DWORD *)a3 + 36);
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((v7 & 0x400) == 0 || self->_rxframe != *((void *)a3 + 11)) {
        goto LABEL_86;
      }
    }
    else if ((v7 & 0x400) != 0)
    {
LABEL_86:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_rxbyte != *((void *)a3 + 6)) {
        goto LABEL_86;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_86;
    }
    if ((*(unsigned char *)&has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_rxerror != *((void *)a3 + 8)) {
        goto LABEL_86;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_86;
    }
    if ((*(unsigned char *)&has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_rxctl != *((void *)a3 + 7)) {
        goto LABEL_86;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_86;
    }
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((v7 & 0x1000) == 0 || self->_rxnobuf != *((void *)a3 + 13)) {
        goto LABEL_86;
      }
    }
    else if ((v7 & 0x1000) != 0)
    {
      goto LABEL_86;
    }
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v7 & 0x8000) == 0 || self->_rxrtry != *((void *)a3 + 16)) {
        goto LABEL_86;
      }
    }
    else if ((v7 & 0x8000) != 0)
    {
      goto LABEL_86;
    }
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
      if ((v7 & 0x2000) == 0 || self->_rxnondata != *((void *)a3 + 14)) {
        goto LABEL_86;
      }
    }
    else if ((v7 & 0x2000) != 0)
    {
      goto LABEL_86;
    }
    if ((*(unsigned char *)&has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_rxbadds != *((void *)a3 + 3)) {
        goto LABEL_86;
      }
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_86;
    }
    if (*(unsigned char *)&has)
    {
      if ((v7 & 1) == 0 || self->_rxbadcm != *((void *)a3 + 1)) {
        goto LABEL_86;
      }
    }
    else if (v7)
    {
      goto LABEL_86;
    }
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((v7 & 0x200) == 0 || self->_rxfragerr != *((void *)a3 + 10)) {
        goto LABEL_86;
      }
    }
    else if ((v7 & 0x200) != 0)
    {
      goto LABEL_86;
    }
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v7 & 0x10000) == 0 || self->_rxrunt != *((void *)a3 + 17)) {
        goto LABEL_86;
      }
    }
    else if ((v7 & 0x10000) != 0)
    {
      goto LABEL_86;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v7 & 0x800) == 0 || self->_rxgiant != *((void *)a3 + 12)) {
        goto LABEL_86;
      }
    }
    else if ((v7 & 0x800) != 0)
    {
      goto LABEL_86;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v7 & 0x4000) == 0 || self->_rxnoscb != *((void *)a3 + 15)) {
        goto LABEL_86;
      }
    }
    else if ((v7 & 0x4000) != 0)
    {
      goto LABEL_86;
    }
    if ((*(unsigned char *)&has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_rxbadproto != *((void *)a3 + 4)) {
        goto LABEL_86;
      }
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_86;
    }
    if ((*(unsigned char *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_rxbadsrcmac != *((void *)a3 + 5)) {
        goto LABEL_86;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_86;
    }
    if ((*(unsigned char *)&has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_rxbadda != *((void *)a3 + 2)) {
        goto LABEL_86;
      }
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_86;
    }
    LOBYTE(v5) = (*((_DWORD *)a3 + 36) & 0x100) == 0;
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v7 & 0x100) == 0 || self->_rxfilter != *((void *)a3 + 9)) {
        goto LABEL_86;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  $5146D2D40FA8CC3C8062BA4445AD9EBA has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    unint64_t v3 = 2654435761u * self->_rxframe;
    if ((*(unsigned char *)&has & 0x20) != 0)
    {
LABEL_3:
      unint64_t v4 = 2654435761u * self->_rxbyte;
      if ((*(unsigned char *)&has & 0x80) != 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v4 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_4:
    unint64_t v5 = 2654435761u * self->_rxerror;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  unint64_t v5 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_5:
    unint64_t v6 = 2654435761u * self->_rxctl;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  unint64_t v6 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_6:
    unint64_t v7 = 2654435761u * self->_rxnobuf;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  unint64_t v7 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_7:
    unint64_t v8 = 2654435761u * self->_rxrtry;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  unint64_t v8 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_8:
    unint64_t v9 = 2654435761u * self->_rxnondata;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  unint64_t v9 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_9:
    unint64_t v10 = 2654435761u * self->_rxbadds;
    if (*(unsigned char *)&has) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  unint64_t v10 = 0;
  if (*(unsigned char *)&has)
  {
LABEL_10:
    unint64_t v11 = 2654435761u * self->_rxbadcm;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  unint64_t v11 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_11:
    unint64_t v12 = 2654435761u * self->_rxfragerr;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  unint64_t v12 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_12:
    unint64_t v13 = 2654435761u * self->_rxrunt;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  unint64_t v13 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_13:
    unint64_t v14 = 2654435761u * self->_rxgiant;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  unint64_t v14 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_14:
    unint64_t v15 = 2654435761u * self->_rxnoscb;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_15;
    }
    goto LABEL_32;
  }
LABEL_31:
  unint64_t v15 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_15:
    unint64_t v16 = 2654435761u * self->_rxbadproto;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_16;
    }
    goto LABEL_33;
  }
LABEL_32:
  unint64_t v16 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_16:
    unint64_t v17 = 2654435761u * self->_rxbadsrcmac;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_17;
    }
LABEL_34:
    unint64_t v18 = 0;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_18;
    }
LABEL_35:
    unint64_t v19 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
  }
LABEL_33:
  unint64_t v17 = 0;
  if ((*(unsigned char *)&has & 2) == 0) {
    goto LABEL_34;
  }
LABEL_17:
  unint64_t v18 = 2654435761u * self->_rxbadda;
  if ((*(_WORD *)&has & 0x100) == 0) {
    goto LABEL_35;
  }
LABEL_18:
  unint64_t v19 = 2654435761u * self->_rxfilter;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  int v3 = *((_DWORD *)a3 + 36);
  if ((v3 & 0x400) != 0)
  {
    self->_rxframe = *((void *)a3 + 11);
    *(_DWORD *)&self->_has |= 0x400u;
    int v3 = *((_DWORD *)a3 + 36);
    if ((v3 & 0x20) == 0)
    {
LABEL_3:
      if ((v3 & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((v3 & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_rxbyte = *((void *)a3 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  int v3 = *((_DWORD *)a3 + 36);
  if ((v3 & 0x80) == 0)
  {
LABEL_4:
    if ((v3 & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_rxerror = *((void *)a3 + 8);
  *(_DWORD *)&self->_has |= 0x80u;
  int v3 = *((_DWORD *)a3 + 36);
  if ((v3 & 0x40) == 0)
  {
LABEL_5:
    if ((v3 & 0x1000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_rxctl = *((void *)a3 + 7);
  *(_DWORD *)&self->_has |= 0x40u;
  int v3 = *((_DWORD *)a3 + 36);
  if ((v3 & 0x1000) == 0)
  {
LABEL_6:
    if ((v3 & 0x8000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_rxnobuf = *((void *)a3 + 13);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v3 = *((_DWORD *)a3 + 36);
  if ((v3 & 0x8000) == 0)
  {
LABEL_7:
    if ((v3 & 0x2000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_rxrtry = *((void *)a3 + 16);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v3 = *((_DWORD *)a3 + 36);
  if ((v3 & 0x2000) == 0)
  {
LABEL_8:
    if ((v3 & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_rxnondata = *((void *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v3 = *((_DWORD *)a3 + 36);
  if ((v3 & 4) == 0)
  {
LABEL_9:
    if ((v3 & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_rxbadds = *((void *)a3 + 3);
  *(_DWORD *)&self->_has |= 4u;
  int v3 = *((_DWORD *)a3 + 36);
  if ((v3 & 1) == 0)
  {
LABEL_10:
    if ((v3 & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_rxbadcm = *((void *)a3 + 1);
  *(_DWORD *)&self->_has |= 1u;
  int v3 = *((_DWORD *)a3 + 36);
  if ((v3 & 0x200) == 0)
  {
LABEL_11:
    if ((v3 & 0x10000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_rxfragerr = *((void *)a3 + 10);
  *(_DWORD *)&self->_has |= 0x200u;
  int v3 = *((_DWORD *)a3 + 36);
  if ((v3 & 0x10000) == 0)
  {
LABEL_12:
    if ((v3 & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_rxrunt = *((void *)a3 + 17);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v3 = *((_DWORD *)a3 + 36);
  if ((v3 & 0x800) == 0)
  {
LABEL_13:
    if ((v3 & 0x4000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_rxgiant = *((void *)a3 + 12);
  *(_DWORD *)&self->_has |= 0x800u;
  int v3 = *((_DWORD *)a3 + 36);
  if ((v3 & 0x4000) == 0)
  {
LABEL_14:
    if ((v3 & 8) == 0) {
      goto LABEL_15;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_rxnoscb = *((void *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v3 = *((_DWORD *)a3 + 36);
  if ((v3 & 8) == 0)
  {
LABEL_15:
    if ((v3 & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_rxbadproto = *((void *)a3 + 4);
  *(_DWORD *)&self->_has |= 8u;
  int v3 = *((_DWORD *)a3 + 36);
  if ((v3 & 0x10) == 0)
  {
LABEL_16:
    if ((v3 & 2) == 0) {
      goto LABEL_17;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_rxbadsrcmac = *((void *)a3 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  int v3 = *((_DWORD *)a3 + 36);
  if ((v3 & 2) == 0)
  {
LABEL_17:
    if ((v3 & 0x100) == 0) {
      return;
    }
LABEL_35:
    self->_rxfilter = *((void *)a3 + 9);
    *(_DWORD *)&self->_has |= 0x100u;
    return;
  }
LABEL_34:
  self->_rxbadda = *((void *)a3 + 2);
  *(_DWORD *)&self->_has |= 2u;
  if ((*((_DWORD *)a3 + 36) & 0x100) != 0) {
    goto LABEL_35;
  }
}

- (unint64_t)rxframe
{
  return self->_rxframe;
}

- (unint64_t)rxbyte
{
  return self->_rxbyte;
}

- (unint64_t)rxerror
{
  return self->_rxerror;
}

- (unint64_t)rxctl
{
  return self->_rxctl;
}

- (unint64_t)rxnobuf
{
  return self->_rxnobuf;
}

- (unint64_t)rxrtry
{
  return self->_rxrtry;
}

- (unint64_t)rxnondata
{
  return self->_rxnondata;
}

- (unint64_t)rxbadds
{
  return self->_rxbadds;
}

- (unint64_t)rxbadcm
{
  return self->_rxbadcm;
}

- (unint64_t)rxfragerr
{
  return self->_rxfragerr;
}

- (unint64_t)rxrunt
{
  return self->_rxrunt;
}

- (unint64_t)rxgiant
{
  return self->_rxgiant;
}

- (unint64_t)rxnoscb
{
  return self->_rxnoscb;
}

- (unint64_t)rxbadproto
{
  return self->_rxbadproto;
}

- (unint64_t)rxbadsrcmac
{
  return self->_rxbadsrcmac;
}

- (unint64_t)rxbadda
{
  return self->_rxbadda;
}

- (unint64_t)rxfilter
{
  return self->_rxfilter;
}

@end