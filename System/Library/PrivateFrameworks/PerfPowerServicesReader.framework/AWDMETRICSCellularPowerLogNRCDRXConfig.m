@interface AWDMETRICSCellularPowerLogNRCDRXConfig
- (BOOL)cdrxEnable;
- (BOOL)hasCdrxEnable;
- (BOOL)hasDrxSlotOffset;
- (BOOL)hasFr;
- (BOOL)hasHarqRttTimerDl;
- (BOOL)hasHarqRttTimerUl;
- (BOOL)hasInactivityTimerMs;
- (BOOL)hasLongCycle;
- (BOOL)hasLongCycleOffset;
- (BOOL)hasOnDurationTimerFraction;
- (BOOL)hasOnDurationTimerMs;
- (BOOL)hasRetransmissionTimerDl;
- (BOOL)hasRetransmissionTimerUl;
- (BOOL)hasShortCycle;
- (BOOL)hasShortCycleEnable;
- (BOOL)hasShortCycleTimer;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shortCycleEnable;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)frAsString:(int)a3;
- (int)StringAsFr:(id)a3;
- (int)fr;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)drxSlotOffset;
- (unsigned)harqRttTimerDl;
- (unsigned)harqRttTimerUl;
- (unsigned)inactivityTimerMs;
- (unsigned)longCycle;
- (unsigned)longCycleOffset;
- (unsigned)onDurationTimerFraction;
- (unsigned)onDurationTimerMs;
- (unsigned)retransmissionTimerDl;
- (unsigned)retransmissionTimerUl;
- (unsigned)shortCycle;
- (unsigned)shortCycleTimer;
- (unsigned)subsId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCdrxEnable:(BOOL)a3;
- (void)setDrxSlotOffset:(unsigned int)a3;
- (void)setFr:(int)a3;
- (void)setHarqRttTimerDl:(unsigned int)a3;
- (void)setHarqRttTimerUl:(unsigned int)a3;
- (void)setHasCdrxEnable:(BOOL)a3;
- (void)setHasDrxSlotOffset:(BOOL)a3;
- (void)setHasFr:(BOOL)a3;
- (void)setHasHarqRttTimerDl:(BOOL)a3;
- (void)setHasHarqRttTimerUl:(BOOL)a3;
- (void)setHasInactivityTimerMs:(BOOL)a3;
- (void)setHasLongCycle:(BOOL)a3;
- (void)setHasLongCycleOffset:(BOOL)a3;
- (void)setHasOnDurationTimerFraction:(BOOL)a3;
- (void)setHasOnDurationTimerMs:(BOOL)a3;
- (void)setHasRetransmissionTimerDl:(BOOL)a3;
- (void)setHasRetransmissionTimerUl:(BOOL)a3;
- (void)setHasShortCycle:(BOOL)a3;
- (void)setHasShortCycleEnable:(BOOL)a3;
- (void)setHasShortCycleTimer:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setInactivityTimerMs:(unsigned int)a3;
- (void)setLongCycle:(unsigned int)a3;
- (void)setLongCycleOffset:(unsigned int)a3;
- (void)setOnDurationTimerFraction:(unsigned int)a3;
- (void)setOnDurationTimerMs:(unsigned int)a3;
- (void)setRetransmissionTimerDl:(unsigned int)a3;
- (void)setRetransmissionTimerUl:(unsigned int)a3;
- (void)setShortCycle:(unsigned int)a3;
- (void)setShortCycleEnable:(BOOL)a3;
- (void)setShortCycleTimer:(unsigned int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDMETRICSCellularPowerLogNRCDRXConfig

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($8916D25C126ECC634E090C0140988639)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setCdrxEnable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_cdrxEnable = a3;
}

- (void)setHasCdrxEnable:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8916D25C126ECC634E090C0140988639)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasCdrxEnable
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setHarqRttTimerDl:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_harqRttTimerDl = a3;
}

- (void)setHasHarqRttTimerDl:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8916D25C126ECC634E090C0140988639)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasHarqRttTimerDl
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHarqRttTimerUl:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_harqRttTimerUl = a3;
}

- (void)setHasHarqRttTimerUl:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8916D25C126ECC634E090C0140988639)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasHarqRttTimerUl
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setDrxSlotOffset:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_drxSlotOffset = a3;
}

- (void)setHasDrxSlotOffset:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8916D25C126ECC634E090C0140988639)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasDrxSlotOffset
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setShortCycleEnable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_shortCycleEnable = a3;
}

- (void)setHasShortCycleEnable:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8916D25C126ECC634E090C0140988639)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasShortCycleEnable
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setRetransmissionTimerDl:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_retransmissionTimerDl = a3;
}

- (void)setHasRetransmissionTimerDl:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8916D25C126ECC634E090C0140988639)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasRetransmissionTimerDl
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setRetransmissionTimerUl:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_retransmissionTimerUl = a3;
}

- (void)setHasRetransmissionTimerUl:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8916D25C126ECC634E090C0140988639)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasRetransmissionTimerUl
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setOnDurationTimerFraction:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_onDurationTimerFraction = a3;
}

- (void)setHasOnDurationTimerFraction:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8916D25C126ECC634E090C0140988639)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasOnDurationTimerFraction
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setOnDurationTimerMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_onDurationTimerMs = a3;
}

- (void)setHasOnDurationTimerMs:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8916D25C126ECC634E090C0140988639)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasOnDurationTimerMs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setInactivityTimerMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_inactivityTimerMs = a3;
}

- (void)setHasInactivityTimerMs:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8916D25C126ECC634E090C0140988639)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasInactivityTimerMs
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setLongCycle:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_longCycle = a3;
}

- (void)setHasLongCycle:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8916D25C126ECC634E090C0140988639)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasLongCycle
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setLongCycleOffset:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_longCycleOffset = a3;
}

- (void)setHasLongCycleOffset:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8916D25C126ECC634E090C0140988639)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasLongCycleOffset
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setShortCycle:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_shortCycle = a3;
}

- (void)setHasShortCycle:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8916D25C126ECC634E090C0140988639)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasShortCycle
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setShortCycleTimer:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_shortCycleTimer = a3;
}

- (void)setHasShortCycleTimer:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8916D25C126ECC634E090C0140988639)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasShortCycleTimer
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8916D25C126ECC634E090C0140988639)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasSubsId
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (int)fr
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_fr;
  }
  else {
    return 0;
  }
}

- (void)setFr:(int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_fr = a3;
}

- (void)setHasFr:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8916D25C126ECC634E090C0140988639)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasFr
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)frAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_265442DA8[a3];
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
  v8.super_class = (Class)AWDMETRICSCellularPowerLogNRCDRXConfig;
  int v4 = [(AWDMETRICSCellularPowerLogNRCDRXConfig *)&v8 description];
  v5 = [(AWDMETRICSCellularPowerLogNRCDRXConfig *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if (*(unsigned char *)&has)
  {
    v5 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v5 forKey:@"timestamp"];

    $8916D25C126ECC634E090C0140988639 has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  v6 = [NSNumber numberWithBool:self->_cdrxEnable];
  [v3 setObject:v6 forKey:@"cdrx_enable"];

  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  v7 = [NSNumber numberWithUnsignedInt:self->_harqRttTimerDl];
  [v3 setObject:v7 forKey:@"harq_rtt_timer_dl"];

  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  objc_super v8 = [NSNumber numberWithUnsignedInt:self->_harqRttTimerUl];
  [v3 setObject:v8 forKey:@"harq_rtt_timer_ul"];

  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  v9 = [NSNumber numberWithUnsignedInt:self->_drxSlotOffset];
  [v3 setObject:v9 forKey:@"drx_slot_offset"];

  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  v10 = [NSNumber numberWithBool:self->_shortCycleEnable];
  [v3 setObject:v10 forKey:@"short_cycle_enable"];

  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  v11 = [NSNumber numberWithUnsignedInt:self->_retransmissionTimerDl];
  [v3 setObject:v11 forKey:@"retransmission_timer_dl"];

  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  v12 = [NSNumber numberWithUnsignedInt:self->_retransmissionTimerUl];
  [v3 setObject:v12 forKey:@"retransmission_timer_ul"];

  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  v13 = [NSNumber numberWithUnsignedInt:self->_onDurationTimerFraction];
  [v3 setObject:v13 forKey:@"on_duration_timer_fraction"];

  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  v14 = [NSNumber numberWithUnsignedInt:self->_onDurationTimerMs];
  [v3 setObject:v14 forKey:@"on_duration_timer_ms"];

  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  v15 = [NSNumber numberWithUnsignedInt:self->_inactivityTimerMs];
  [v3 setObject:v15 forKey:@"inactivity_timer_ms"];

  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  v16 = [NSNumber numberWithUnsignedInt:self->_longCycle];
  [v3 setObject:v16 forKey:@"long_cycle"];

  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_32;
  }
LABEL_31:
  v17 = [NSNumber numberWithUnsignedInt:self->_longCycleOffset];
  [v3 setObject:v17 forKey:@"long_cycle_offset"];

  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_33;
  }
LABEL_32:
  v18 = [NSNumber numberWithUnsignedInt:self->_shortCycle];
  [v3 setObject:v18 forKey:@"short_cycle"];

  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_17;
    }
LABEL_34:
    v20 = [NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v20 forKey:@"subs_id"];

    if ((*(_DWORD *)&self->_has & 4) == 0) {
      goto LABEL_39;
    }
LABEL_35:
    uint64_t fr = self->_fr;
    if (fr >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_fr);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = off_265442DA8[fr];
    }
    [v3 setObject:v22 forKey:@"fr"];

    goto LABEL_39;
  }
LABEL_33:
  v19 = [NSNumber numberWithUnsignedInt:self->_shortCycleTimer];
  [v3 setObject:v19 forKey:@"short_cycle_timer"];

  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) != 0) {
    goto LABEL_34;
  }
LABEL_17:
  if ((*(unsigned char *)&has & 4) != 0) {
    goto LABEL_35;
  }
LABEL_39:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMETRICSCellularPowerLogNRCDRXConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if (*(unsigned char *)&has)
  {
    PBDataWriterWriteUint64Field();
    $8916D25C126ECC634E090C0140988639 has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteBOOLField();
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 4) != 0) {
LABEL_18:
  }
    PBDataWriterWriteInt32Field();
LABEL_19:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if (*(unsigned char *)&has)
  {
    v4[1] = self->_timestamp;
    *((_DWORD *)v4 + 19) |= 1u;
    $8916D25C126ECC634E090C0140988639 has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)v4 + 72) = self->_cdrxEnable;
  *((_DWORD *)v4 + 19) |= 0x8000u;
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v4 + 6) = self->_harqRttTimerDl;
  *((_DWORD *)v4 + 19) |= 8u;
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v4 + 7) = self->_harqRttTimerUl;
  *((_DWORD *)v4 + 19) |= 0x10u;
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v4 + 4) = self->_drxSlotOffset;
  *((_DWORD *)v4 + 19) |= 2u;
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((unsigned char *)v4 + 73) = self->_shortCycleEnable;
  *((_DWORD *)v4 + 19) |= 0x10000u;
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v4 + 13) = self->_retransmissionTimerDl;
  *((_DWORD *)v4 + 19) |= 0x400u;
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)v4 + 14) = self->_retransmissionTimerUl;
  *((_DWORD *)v4 + 19) |= 0x800u;
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)v4 + 11) = self->_onDurationTimerFraction;
  *((_DWORD *)v4 + 19) |= 0x100u;
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)v4 + 12) = self->_onDurationTimerMs;
  *((_DWORD *)v4 + 19) |= 0x200u;
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v4 + 8) = self->_inactivityTimerMs;
  *((_DWORD *)v4 + 19) |= 0x20u;
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v4 + 9) = self->_longCycle;
  *((_DWORD *)v4 + 19) |= 0x40u;
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v4 + 10) = self->_longCycleOffset;
  *((_DWORD *)v4 + 19) |= 0x80u;
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v4 + 15) = self->_shortCycle;
  *((_DWORD *)v4 + 19) |= 0x1000u;
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v4 + 16) = self->_shortCycleTimer;
  *((_DWORD *)v4 + 19) |= 0x2000u;
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_37:
  *((_DWORD *)v4 + 17) = self->_subsId;
  *((_DWORD *)v4 + 19) |= 0x4000u;
  if ((*(_DWORD *)&self->_has & 4) != 0)
  {
LABEL_18:
    *((_DWORD *)v4 + 5) = self->_fr;
    *((_DWORD *)v4 + 19) |= 4u;
  }
LABEL_19:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if (*(unsigned char *)&has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((_DWORD *)result + 19) |= 1u;
    $8916D25C126ECC634E090C0140988639 has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)result + 72) = self->_cdrxEnable;
  *((_DWORD *)result + 19) |= 0x8000u;
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 6) = self->_harqRttTimerDl;
  *((_DWORD *)result + 19) |= 8u;
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)result + 7) = self->_harqRttTimerUl;
  *((_DWORD *)result + 19) |= 0x10u;
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 4) = self->_drxSlotOffset;
  *((_DWORD *)result + 19) |= 2u;
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((unsigned char *)result + 73) = self->_shortCycleEnable;
  *((_DWORD *)result + 19) |= 0x10000u;
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)result + 13) = self->_retransmissionTimerDl;
  *((_DWORD *)result + 19) |= 0x400u;
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)result + 14) = self->_retransmissionTimerUl;
  *((_DWORD *)result + 19) |= 0x800u;
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)result + 11) = self->_onDurationTimerFraction;
  *((_DWORD *)result + 19) |= 0x100u;
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)result + 12) = self->_onDurationTimerMs;
  *((_DWORD *)result + 19) |= 0x200u;
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)result + 8) = self->_inactivityTimerMs;
  *((_DWORD *)result + 19) |= 0x20u;
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)result + 9) = self->_longCycle;
  *((_DWORD *)result + 19) |= 0x40u;
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)result + 10) = self->_longCycleOffset;
  *((_DWORD *)result + 19) |= 0x80u;
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)result + 15) = self->_shortCycle;
  *((_DWORD *)result + 19) |= 0x1000u;
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)result + 16) = self->_shortCycleTimer;
  *((_DWORD *)result + 19) |= 0x2000u;
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 4) == 0) {
      return result;
    }
    goto LABEL_18;
  }
LABEL_35:
  *((_DWORD *)result + 17) = self->_subsId;
  *((_DWORD *)result + 19) |= 0x4000u;
  if ((*(_DWORD *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_18:
  *((_DWORD *)result + 5) = self->_fr;
  *((_DWORD *)result + 19) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_93;
  }
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  int v6 = *((_DWORD *)v4 + 19);
  if (*(unsigned char *)&has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_93;
    }
  }
  else if (v6)
  {
    goto LABEL_93;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0) {
      goto LABEL_93;
    }
    if (self->_cdrxEnable)
    {
      if (!*((unsigned char *)v4 + 72)) {
        goto LABEL_93;
      }
    }
    else if (*((unsigned char *)v4 + 72))
    {
      goto LABEL_93;
    }
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_93;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_harqRttTimerDl != *((_DWORD *)v4 + 6)) {
      goto LABEL_93;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_93;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_harqRttTimerUl != *((_DWORD *)v4 + 7)) {
      goto LABEL_93;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_93;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_drxSlotOffset != *((_DWORD *)v4 + 4)) {
      goto LABEL_93;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) != 0)
    {
      if (self->_shortCycleEnable)
      {
        if (!*((unsigned char *)v4 + 73)) {
          goto LABEL_93;
        }
        goto LABEL_38;
      }
      if (!*((unsigned char *)v4 + 73)) {
        goto LABEL_38;
      }
    }
LABEL_93:
    BOOL v7 = 0;
    goto LABEL_94;
  }
  if ((v6 & 0x10000) != 0) {
    goto LABEL_93;
  }
LABEL_38:
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_retransmissionTimerDl != *((_DWORD *)v4 + 13)) {
      goto LABEL_93;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_retransmissionTimerUl != *((_DWORD *)v4 + 14)) {
      goto LABEL_93;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_onDurationTimerFraction != *((_DWORD *)v4 + 11)) {
      goto LABEL_93;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_onDurationTimerMs != *((_DWORD *)v4 + 12)) {
      goto LABEL_93;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_93;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_inactivityTimerMs != *((_DWORD *)v4 + 8)) {
      goto LABEL_93;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_93;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_longCycle != *((_DWORD *)v4 + 9)) {
      goto LABEL_93;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_93;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_longCycleOffset != *((_DWORD *)v4 + 10)) {
      goto LABEL_93;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_shortCycle != *((_DWORD *)v4 + 15)) {
      goto LABEL_93;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_shortCycleTimer != *((_DWORD *)v4 + 16)) {
      goto LABEL_93;
    }
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_subsId != *((_DWORD *)v4 + 17)) {
      goto LABEL_93;
    }
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_93;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_fr != *((_DWORD *)v4 + 5)) {
      goto LABEL_93;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (*((_DWORD *)v4 + 19) & 4) == 0;
  }
LABEL_94:

  return v7;
}

- (unint64_t)hash
{
  $8916D25C126ECC634E090C0140988639 has = self->_has;
  if (*(unsigned char *)&has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_cdrxEnable;
      if ((*(unsigned char *)&has & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_harqRttTimerDl;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_harqRttTimerUl;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&has & 2) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_drxSlotOffset;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v7 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_shortCycleEnable;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v8 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_retransmissionTimerDl;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v9 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_retransmissionTimerUl;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v10 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_onDurationTimerFraction;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v11 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_11:
    uint64_t v12 = 2654435761 * self->_onDurationTimerMs;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v12 = 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_12:
    uint64_t v13 = 2654435761 * self->_inactivityTimerMs;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v13 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_13:
    uint64_t v14 = 2654435761 * self->_longCycle;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v14 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_14:
    uint64_t v15 = 2654435761 * self->_longCycleOffset;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v15 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_15:
    uint64_t v16 = 2654435761 * self->_shortCycle;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v16 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_16:
    uint64_t v17 = 2654435761 * self->_shortCycleTimer;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_17;
    }
LABEL_34:
    uint64_t v18 = 0;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_18;
    }
LABEL_35:
    uint64_t v19 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
  }
LABEL_33:
  uint64_t v17 = 0;
  if ((*(_WORD *)&has & 0x4000) == 0) {
    goto LABEL_34;
  }
LABEL_17:
  uint64_t v18 = 2654435761 * self->_subsId;
  if ((*(unsigned char *)&has & 4) == 0) {
    goto LABEL_35;
  }
LABEL_18:
  uint64_t v19 = 2654435761 * self->_fr;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  int v5 = *((_DWORD *)v4 + 19);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
    int v5 = *((_DWORD *)v4 + 19);
    if ((v5 & 0x8000) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((v5 & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  self->_cdrxEnable = *((unsigned char *)v4 + 72);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v5 = *((_DWORD *)v4 + 19);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_harqRttTimerDl = *((_DWORD *)v4 + 6);
  *(_DWORD *)&self->_has |= 8u;
  int v5 = *((_DWORD *)v4 + 19);
  if ((v5 & 0x10) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_harqRttTimerUl = *((_DWORD *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x10u;
  int v5 = *((_DWORD *)v4 + 19);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_drxSlotOffset = *((_DWORD *)v4 + 4);
  *(_DWORD *)&self->_has |= 2u;
  int v5 = *((_DWORD *)v4 + 19);
  if ((v5 & 0x10000) == 0)
  {
LABEL_7:
    if ((v5 & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_shortCycleEnable = *((unsigned char *)v4 + 73);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v5 = *((_DWORD *)v4 + 19);
  if ((v5 & 0x400) == 0)
  {
LABEL_8:
    if ((v5 & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_retransmissionTimerDl = *((_DWORD *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x400u;
  int v5 = *((_DWORD *)v4 + 19);
  if ((v5 & 0x800) == 0)
  {
LABEL_9:
    if ((v5 & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_retransmissionTimerUl = *((_DWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x800u;
  int v5 = *((_DWORD *)v4 + 19);
  if ((v5 & 0x100) == 0)
  {
LABEL_10:
    if ((v5 & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_onDurationTimerFraction = *((_DWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x100u;
  int v5 = *((_DWORD *)v4 + 19);
  if ((v5 & 0x200) == 0)
  {
LABEL_11:
    if ((v5 & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_onDurationTimerMs = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x200u;
  int v5 = *((_DWORD *)v4 + 19);
  if ((v5 & 0x20) == 0)
  {
LABEL_12:
    if ((v5 & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_inactivityTimerMs = *((_DWORD *)v4 + 8);
  *(_DWORD *)&self->_has |= 0x20u;
  int v5 = *((_DWORD *)v4 + 19);
  if ((v5 & 0x40) == 0)
  {
LABEL_13:
    if ((v5 & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_longCycle = *((_DWORD *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x40u;
  int v5 = *((_DWORD *)v4 + 19);
  if ((v5 & 0x80) == 0)
  {
LABEL_14:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_longCycleOffset = *((_DWORD *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x80u;
  int v5 = *((_DWORD *)v4 + 19);
  if ((v5 & 0x1000) == 0)
  {
LABEL_15:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_shortCycle = *((_DWORD *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v5 = *((_DWORD *)v4 + 19);
  if ((v5 & 0x2000) == 0)
  {
LABEL_16:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_shortCycleTimer = *((_DWORD *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v5 = *((_DWORD *)v4 + 19);
  if ((v5 & 0x4000) == 0)
  {
LABEL_17:
    if ((v5 & 4) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_37:
  self->_subsId = *((_DWORD *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x4000u;
  if ((*((_DWORD *)v4 + 19) & 4) != 0)
  {
LABEL_18:
    self->_uint64_t fr = *((_DWORD *)v4 + 5);
    *(_DWORD *)&self->_has |= 4u;
  }
LABEL_19:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)cdrxEnable
{
  return self->_cdrxEnable;
}

- (unsigned)harqRttTimerDl
{
  return self->_harqRttTimerDl;
}

- (unsigned)harqRttTimerUl
{
  return self->_harqRttTimerUl;
}

- (unsigned)drxSlotOffset
{
  return self->_drxSlotOffset;
}

- (BOOL)shortCycleEnable
{
  return self->_shortCycleEnable;
}

- (unsigned)retransmissionTimerDl
{
  return self->_retransmissionTimerDl;
}

- (unsigned)retransmissionTimerUl
{
  return self->_retransmissionTimerUl;
}

- (unsigned)onDurationTimerFraction
{
  return self->_onDurationTimerFraction;
}

- (unsigned)onDurationTimerMs
{
  return self->_onDurationTimerMs;
}

- (unsigned)inactivityTimerMs
{
  return self->_inactivityTimerMs;
}

- (unsigned)longCycle
{
  return self->_longCycle;
}

- (unsigned)longCycleOffset
{
  return self->_longCycleOffset;
}

- (unsigned)shortCycle
{
  return self->_shortCycle;
}

- (unsigned)shortCycleTimer
{
  return self->_shortCycleTimer;
}

- (unsigned)subsId
{
  return self->_subsId;
}

@end