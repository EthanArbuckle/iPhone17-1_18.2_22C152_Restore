@interface AWDWRMULCACoexStats
- (BOOL)hasTimestamp;
- (BOOL)hasULCACriCarDLBW;
- (BOOL)hasULCACriCarDLFreq;
- (BOOL)hasULCACriCarULBW;
- (BOOL)hasULCACriCarULFreq;
- (BOOL)hasULCAHasCoexBand;
- (BOOL)hasULCAPriCarDLBW;
- (BOOL)hasULCAPriCarDLFreq;
- (BOOL)hasULCAPriCarULBW;
- (BOOL)hasULCAPriCarULFreq;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)uLCAHasCoexBand;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)uLCACriCarDLBW;
- (unsigned)uLCACriCarDLFreq;
- (unsigned)uLCACriCarULBW;
- (unsigned)uLCACriCarULFreq;
- (unsigned)uLCAPriCarDLBW;
- (unsigned)uLCAPriCarDLFreq;
- (unsigned)uLCAPriCarULBW;
- (unsigned)uLCAPriCarULFreq;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasULCACriCarDLBW:(BOOL)a3;
- (void)setHasULCACriCarDLFreq:(BOOL)a3;
- (void)setHasULCACriCarULBW:(BOOL)a3;
- (void)setHasULCACriCarULFreq:(BOOL)a3;
- (void)setHasULCAHasCoexBand:(BOOL)a3;
- (void)setHasULCAPriCarDLBW:(BOOL)a3;
- (void)setHasULCAPriCarDLFreq:(BOOL)a3;
- (void)setHasULCAPriCarULBW:(BOOL)a3;
- (void)setHasULCAPriCarULFreq:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setULCACriCarDLBW:(unsigned int)a3;
- (void)setULCACriCarDLFreq:(unsigned int)a3;
- (void)setULCACriCarULBW:(unsigned int)a3;
- (void)setULCACriCarULFreq:(unsigned int)a3;
- (void)setULCAHasCoexBand:(BOOL)a3;
- (void)setULCAPriCarDLBW:(unsigned int)a3;
- (void)setULCAPriCarDLFreq:(unsigned int)a3;
- (void)setULCAPriCarULBW:(unsigned int)a3;
- (void)setULCAPriCarULFreq:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWRMULCACoexStats

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

- (void)setULCAHasCoexBand:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_uLCAHasCoexBand = a3;
}

- (void)setHasULCAHasCoexBand:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasULCAHasCoexBand
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setULCAPriCarULFreq:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_uLCAPriCarULFreq = a3;
}

- (void)setHasULCAPriCarULFreq:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasULCAPriCarULFreq
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setULCAPriCarDLFreq:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_uLCAPriCarDLFreq = a3;
}

- (void)setHasULCAPriCarDLFreq:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasULCAPriCarDLFreq
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setULCAPriCarULBW:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_uLCAPriCarULBW = a3;
}

- (void)setHasULCAPriCarULBW:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasULCAPriCarULBW
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setULCAPriCarDLBW:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_uLCAPriCarDLBW = a3;
}

- (void)setHasULCAPriCarDLBW:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasULCAPriCarDLBW
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setULCACriCarULFreq:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_uLCACriCarULFreq = a3;
}

- (void)setHasULCACriCarULFreq:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasULCACriCarULFreq
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setULCACriCarDLFreq:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_uLCACriCarDLFreq = a3;
}

- (void)setHasULCACriCarDLFreq:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasULCACriCarDLFreq
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setULCACriCarULBW:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_uLCACriCarULBW = a3;
}

- (void)setHasULCACriCarULBW:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasULCACriCarULBW
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setULCACriCarDLBW:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_uLCACriCarDLBW = a3;
}

- (void)setHasULCACriCarDLBW:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasULCACriCarDLBW
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWRMULCACoexStats;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWRMULCACoexStats description](&v3, sel_description), -[AWDWRMULCACoexStats dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithBool:self->_uLCAHasCoexBand] forKey:@"ULCAHasCoexBand"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_uLCAPriCarULFreq] forKey:@"ULCAPriCarULFreq"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_uLCAPriCarDLFreq] forKey:@"ULCAPriCarDLFreq"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_uLCAPriCarULBW] forKey:@"ULCAPriCarULBW"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_uLCAPriCarDLBW] forKey:@"ULCAPriCarDLBW"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_uLCACriCarULFreq] forKey:@"ULCACriCarULFreq"];
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
LABEL_21:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_uLCACriCarULBW] forKey:@"ULCACriCarULBW"];
    if ((*(_WORD *)&self->_has & 2) == 0) {
      return v3;
    }
    goto LABEL_11;
  }
LABEL_20:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_uLCACriCarDLFreq] forKey:@"ULCACriCarDLFreq"];
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_21;
  }
LABEL_10:
  if ((has & 2) != 0) {
LABEL_11:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_uLCACriCarDLBW] forKey:@"ULCACriCarDLBW"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWRMULCACoexStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
LABEL_20:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_has & 2) == 0) {
      return;
    }
    goto LABEL_21;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_20;
  }
LABEL_10:
  if ((has & 2) == 0) {
    return;
  }
LABEL_21:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((_WORD *)a3 + 26) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)a3 + 48) = self->_uLCAHasCoexBand;
  *((_WORD *)a3 + 26) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)a3 + 11) = self->_uLCAPriCarULFreq;
  *((_WORD *)a3 + 26) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)a3 + 9) = self->_uLCAPriCarDLFreq;
  *((_WORD *)a3 + 26) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)a3 + 10) = self->_uLCAPriCarULBW;
  *((_WORD *)a3 + 26) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)a3 + 8) = self->_uLCAPriCarDLBW;
  *((_WORD *)a3 + 26) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 7) = self->_uLCACriCarULFreq;
  *((_WORD *)a3 + 26) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 5) = self->_uLCACriCarDLFreq;
  *((_WORD *)a3 + 26) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 2) == 0) {
      return;
    }
LABEL_21:
    *((_DWORD *)a3 + 4) = self->_uLCACriCarDLBW;
    *((_WORD *)a3 + 26) |= 2u;
    return;
  }
LABEL_20:
  *((_DWORD *)a3 + 6) = self->_uLCACriCarULBW;
  *((_WORD *)a3 + 26) |= 8u;
  if ((*(_WORD *)&self->_has & 2) != 0) {
    goto LABEL_21;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((_WORD *)result + 26) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)result + 48) = self->_uLCAHasCoexBand;
  *((_WORD *)result + 26) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 11) = self->_uLCAPriCarULFreq;
  *((_WORD *)result + 26) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 9) = self->_uLCAPriCarDLFreq;
  *((_WORD *)result + 26) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 10) = self->_uLCAPriCarULBW;
  *((_WORD *)result + 26) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 8) = self->_uLCAPriCarDLBW;
  *((_WORD *)result + 26) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 7) = self->_uLCACriCarULFreq;
  *((_WORD *)result + 26) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 5) = self->_uLCACriCarDLFreq;
  *((_WORD *)result + 26) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 2) == 0) {
      return result;
    }
    goto LABEL_11;
  }
LABEL_21:
  *((_DWORD *)result + 6) = self->_uLCACriCarULBW;
  *((_WORD *)result + 26) |= 8u;
  if ((*(_WORD *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_11:
  *((_DWORD *)result + 4) = self->_uLCACriCarDLBW;
  *((_WORD *)result + 26) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)a3 + 26);
  if (has)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
      goto LABEL_54;
    }
  }
  else if (v7)
  {
    goto LABEL_54;
  }
  if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    if ((*((_WORD *)a3 + 26) & 0x200) != 0) {
      goto LABEL_54;
    }
    goto LABEL_15;
  }
  if ((*((_WORD *)a3 + 26) & 0x200) == 0) {
    goto LABEL_54;
  }
  if (self->_uLCAHasCoexBand)
  {
    if (!*((unsigned char *)a3 + 48)) {
      goto LABEL_54;
    }
    goto LABEL_15;
  }
  if (*((unsigned char *)a3 + 48))
  {
LABEL_54:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_15:
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)a3 + 26) & 0x100) == 0 || self->_uLCAPriCarULFreq != *((_DWORD *)a3 + 11)) {
      goto LABEL_54;
    }
  }
  else if ((*((_WORD *)a3 + 26) & 0x100) != 0)
  {
    goto LABEL_54;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_uLCAPriCarDLFreq != *((_DWORD *)a3 + 9)) {
      goto LABEL_54;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_54;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_uLCAPriCarULBW != *((_DWORD *)a3 + 10)) {
      goto LABEL_54;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_54;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_uLCAPriCarDLBW != *((_DWORD *)a3 + 8)) {
      goto LABEL_54;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_54;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_uLCACriCarULFreq != *((_DWORD *)a3 + 7)) {
      goto LABEL_54;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_54;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_uLCACriCarDLFreq != *((_DWORD *)a3 + 5)) {
      goto LABEL_54;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_54;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_uLCACriCarULBW != *((_DWORD *)a3 + 6)) {
      goto LABEL_54;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_54;
  }
  LOBYTE(v5) = (v7 & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_uLCACriCarDLBW != *((_DWORD *)a3 + 4)) {
      goto LABEL_54;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_uLCAHasCoexBand;
      if ((*(_WORD *)&self->_has & 0x100) != 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_uLCAPriCarULFreq;
    if ((has & 0x40) != 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v5 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_uLCAPriCarDLFreq;
    if ((has & 0x80) != 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v6 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_uLCAPriCarULBW;
    if ((has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_uLCAPriCarDLBW;
    if ((has & 0x10) != 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v8 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_uLCACriCarULFreq;
    if ((has & 4) != 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v9 = 0;
  if ((has & 4) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_uLCACriCarDLFreq;
    if ((has & 8) != 0) {
      goto LABEL_10;
    }
LABEL_20:
    uint64_t v11 = 0;
    if ((has & 2) != 0) {
      goto LABEL_11;
    }
LABEL_21:
    uint64_t v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
LABEL_19:
  uint64_t v10 = 0;
  if ((has & 8) == 0) {
    goto LABEL_20;
  }
LABEL_10:
  uint64_t v11 = 2654435761 * self->_uLCACriCarULBW;
  if ((has & 2) == 0) {
    goto LABEL_21;
  }
LABEL_11:
  uint64_t v12 = 2654435761 * self->_uLCACriCarDLBW;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3 = *((_WORD *)a3 + 26);
  if (v3)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v3 = *((_WORD *)a3 + 26);
    if ((v3 & 0x200) == 0)
    {
LABEL_3:
      if ((v3 & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*((_WORD *)a3 + 26) & 0x200) == 0)
  {
    goto LABEL_3;
  }
  self->_uLCAHasCoexBand = *((unsigned char *)a3 + 48);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x100) == 0)
  {
LABEL_4:
    if ((v3 & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_uLCAPriCarULFreq = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x40) == 0)
  {
LABEL_5:
    if ((v3 & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_uLCAPriCarDLFreq = *((_DWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x80) == 0)
  {
LABEL_6:
    if ((v3 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_uLCAPriCarULBW = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x20) == 0)
  {
LABEL_7:
    if ((v3 & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_uLCAPriCarDLBW = *((_DWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x10) == 0)
  {
LABEL_8:
    if ((v3 & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_uLCACriCarULFreq = *((_DWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v3 = *((_WORD *)a3 + 26);
  if ((v3 & 4) == 0)
  {
LABEL_9:
    if ((v3 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_uLCACriCarDLFreq = *((_DWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 4u;
  __int16 v3 = *((_WORD *)a3 + 26);
  if ((v3 & 8) == 0)
  {
LABEL_10:
    if ((v3 & 2) == 0) {
      return;
    }
LABEL_21:
    self->_uLCACriCarDLBW = *((_DWORD *)a3 + 4);
    *(_WORD *)&self->_has |= 2u;
    return;
  }
LABEL_20:
  self->_uLCACriCarULBW = *((_DWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)a3 + 26) & 2) != 0) {
    goto LABEL_21;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)uLCAHasCoexBand
{
  return self->_uLCAHasCoexBand;
}

- (unsigned)uLCAPriCarULFreq
{
  return self->_uLCAPriCarULFreq;
}

- (unsigned)uLCAPriCarDLFreq
{
  return self->_uLCAPriCarDLFreq;
}

- (unsigned)uLCAPriCarULBW
{
  return self->_uLCAPriCarULBW;
}

- (unsigned)uLCAPriCarDLBW
{
  return self->_uLCAPriCarDLBW;
}

- (unsigned)uLCACriCarULFreq
{
  return self->_uLCACriCarULFreq;
}

- (unsigned)uLCACriCarDLFreq
{
  return self->_uLCACriCarDLFreq;
}

- (unsigned)uLCACriCarULBW
{
  return self->_uLCACriCarULBW;
}

- (unsigned)uLCACriCarDLBW
{
  return self->_uLCACriCarDLBW;
}

@end