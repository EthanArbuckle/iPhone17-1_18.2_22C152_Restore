@interface AWDDataFrames
- (BOOL)hasCFack;
- (BOOL)hasCFackCFpoll;
- (BOOL)hasCFpoll;
- (BOOL)hasDataCFack;
- (BOOL)hasDataCFackCFpoll;
- (BOOL)hasDataCFpoll;
- (BOOL)hasDataFrames;
- (BOOL)hasNull;
- (BOOL)hasQoSdata;
- (BOOL)hasQoSdataCFack;
- (BOOL)hasQoSdataCFackCFpoll;
- (BOOL)hasQoSnodataCFack;
- (BOOL)hasQoSnodataCFpoll;
- (BOOL)hasQoSnull;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)cFack;
- (unint64_t)cFackCFpoll;
- (unint64_t)cFpoll;
- (unint64_t)dataCFack;
- (unint64_t)dataCFackCFpoll;
- (unint64_t)dataCFpoll;
- (unint64_t)dataFrames;
- (unint64_t)hash;
- (unint64_t)null;
- (unint64_t)qoSdata;
- (unint64_t)qoSdataCFack;
- (unint64_t)qoSdataCFackCFpoll;
- (unint64_t)qoSnodataCFack;
- (unint64_t)qoSnodataCFpoll;
- (unint64_t)qoSnull;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCFack:(unint64_t)a3;
- (void)setCFackCFpoll:(unint64_t)a3;
- (void)setCFpoll:(unint64_t)a3;
- (void)setDataCFack:(unint64_t)a3;
- (void)setDataCFackCFpoll:(unint64_t)a3;
- (void)setDataCFpoll:(unint64_t)a3;
- (void)setDataFrames:(unint64_t)a3;
- (void)setHasCFack:(BOOL)a3;
- (void)setHasCFackCFpoll:(BOOL)a3;
- (void)setHasCFpoll:(BOOL)a3;
- (void)setHasDataCFack:(BOOL)a3;
- (void)setHasDataCFackCFpoll:(BOOL)a3;
- (void)setHasDataCFpoll:(BOOL)a3;
- (void)setHasDataFrames:(BOOL)a3;
- (void)setHasNull:(BOOL)a3;
- (void)setHasQoSdata:(BOOL)a3;
- (void)setHasQoSdataCFack:(BOOL)a3;
- (void)setHasQoSdataCFackCFpoll:(BOOL)a3;
- (void)setHasQoSnodataCFack:(BOOL)a3;
- (void)setHasQoSnodataCFpoll:(BOOL)a3;
- (void)setHasQoSnull:(BOOL)a3;
- (void)setNull:(unint64_t)a3;
- (void)setQoSdata:(unint64_t)a3;
- (void)setQoSdataCFack:(unint64_t)a3;
- (void)setQoSdataCFackCFpoll:(unint64_t)a3;
- (void)setQoSnodataCFack:(unint64_t)a3;
- (void)setQoSnodataCFpoll:(unint64_t)a3;
- (void)setQoSnull:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDDataFrames

- (void)setDataFrames:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_dataFrames = a3;
}

- (void)setHasDataFrames:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasDataFrames
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setDataCFack:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_dataCFack = a3;
}

- (void)setHasDataCFack:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDataCFack
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setDataCFpoll:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_dataCFpoll = a3;
}

- (void)setHasDataCFpoll:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasDataCFpoll
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setDataCFackCFpoll:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_dataCFackCFpoll = a3;
}

- (void)setHasDataCFackCFpoll:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDataCFackCFpoll
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setNull:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_null = a3;
}

- (void)setHasNull:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasNull
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setCFack:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_cFack = a3;
}

- (void)setHasCFack:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasCFack
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setCFpoll:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_cFpoll = a3;
}

- (void)setHasCFpoll:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasCFpoll
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setCFackCFpoll:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_cFackCFpoll = a3;
}

- (void)setHasCFackCFpoll:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasCFackCFpoll
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setQoSdata:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_qoSdata = a3;
}

- (void)setHasQoSdata:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasQoSdata
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setQoSdataCFack:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_qoSdataCFack = a3;
}

- (void)setHasQoSdataCFack:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasQoSdataCFack
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setQoSdataCFackCFpoll:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_qoSdataCFackCFpoll = a3;
}

- (void)setHasQoSdataCFackCFpoll:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasQoSdataCFackCFpoll
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setQoSnull:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_qoSnull = a3;
}

- (void)setHasQoSnull:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasQoSnull
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setQoSnodataCFpoll:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_qoSnodataCFpoll = a3;
}

- (void)setHasQoSnodataCFpoll:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasQoSnodataCFpoll
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setQoSnodataCFack:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_qoSnodataCFack = a3;
}

- (void)setHasQoSnodataCFack:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasQoSnodataCFack
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDDataFrames;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDDataFrames description](&v3, sel_description), -[AWDDataFrames dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_dataFrames] forKey:@"dataFrames"];
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_dataCFack] forKey:@"dataCFack"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_dataCFpoll] forKey:@"dataCFpoll"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_dataCFackCFpoll] forKey:@"dataCFackCFpoll"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_null] forKey:@"null"];
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_cFack] forKey:@"CFack"];
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_cFpoll] forKey:@"CFpoll"];
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_cFackCFpoll] forKey:@"CFackCFpoll"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_qoSdata] forKey:@"QoSdata"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_qoSdataCFack] forKey:@"QoSdataCFack"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_12:
    if ((has & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_qoSdataCFackCFpoll] forKey:@"QoSdataCFackCFpoll"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_13:
    if ((has & 0x1000) == 0) {
      goto LABEL_14;
    }
LABEL_29:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_qoSnodataCFpoll] forKey:@"QoSnodataCFpoll"];
    if ((*(_WORD *)&self->_has & 0x800) == 0) {
      return v3;
    }
    goto LABEL_15;
  }
LABEL_28:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_qoSnull] forKey:@"QoSnull"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) != 0) {
    goto LABEL_29;
  }
LABEL_14:
  if ((has & 0x800) != 0) {
LABEL_15:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_qoSnodataCFack] forKey:@"QoSnodataCFack"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDDataFramesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_12:
    if ((has & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_13:
    if ((has & 0x1000) == 0) {
      goto LABEL_14;
    }
LABEL_28:
    PBDataWriterWriteUint64Field();
    if ((*(_WORD *)&self->_has & 0x800) == 0) {
      return;
    }
    goto LABEL_29;
  }
LABEL_27:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) != 0) {
    goto LABEL_28;
  }
LABEL_14:
  if ((has & 0x800) == 0) {
    return;
  }
LABEL_29:

  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *((void *)a3 + 7) = self->_dataFrames;
    *((_WORD *)a3 + 60) |= 0x40u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 4) = self->_dataCFack;
  *((_WORD *)a3 + 60) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((void *)a3 + 6) = self->_dataCFpoll;
  *((_WORD *)a3 + 60) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((void *)a3 + 5) = self->_dataCFackCFpoll;
  *((_WORD *)a3 + 60) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((void *)a3 + 8) = self->_null;
  *((_WORD *)a3 + 60) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((void *)a3 + 1) = self->_cFack;
  *((_WORD *)a3 + 60) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((void *)a3 + 3) = self->_cFpoll;
  *((_WORD *)a3 + 60) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((void *)a3 + 2) = self->_cFackCFpoll;
  *((_WORD *)a3 + 60) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((void *)a3 + 9) = self->_qoSdata;
  *((_WORD *)a3 + 60) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((void *)a3 + 10) = self->_qoSdataCFack;
  *((_WORD *)a3 + 60) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_12:
    if ((has & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((void *)a3 + 11) = self->_qoSdataCFackCFpoll;
  *((_WORD *)a3 + 60) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_13:
    if ((has & 0x1000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((void *)a3 + 14) = self->_qoSnull;
  *((_WORD *)a3 + 60) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_14:
    if ((has & 0x800) == 0) {
      return;
    }
LABEL_29:
    *((void *)a3 + 12) = self->_qoSnodataCFack;
    *((_WORD *)a3 + 60) |= 0x800u;
    return;
  }
LABEL_28:
  *((void *)a3 + 13) = self->_qoSnodataCFpoll;
  *((_WORD *)a3 + 60) |= 0x1000u;
  if ((*(_WORD *)&self->_has & 0x800) != 0) {
    goto LABEL_29;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *((void *)result + 7) = self->_dataFrames;
    *((_WORD *)result + 60) |= 0x40u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 4) = self->_dataCFack;
  *((_WORD *)result + 60) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((void *)result + 6) = self->_dataCFpoll;
  *((_WORD *)result + 60) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((void *)result + 5) = self->_dataCFackCFpoll;
  *((_WORD *)result + 60) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((void *)result + 8) = self->_null;
  *((_WORD *)result + 60) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((void *)result + 1) = self->_cFack;
  *((_WORD *)result + 60) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((void *)result + 3) = self->_cFpoll;
  *((_WORD *)result + 60) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((void *)result + 2) = self->_cFackCFpoll;
  *((_WORD *)result + 60) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((void *)result + 9) = self->_qoSdata;
  *((_WORD *)result + 60) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((void *)result + 10) = self->_qoSdataCFack;
  *((_WORD *)result + 60) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_12:
    if ((has & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((void *)result + 11) = self->_qoSdataCFackCFpoll;
  *((_WORD *)result + 60) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_13:
    if ((has & 0x1000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((void *)result + 14) = self->_qoSnull;
  *((_WORD *)result + 60) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_14:
    if ((has & 0x800) == 0) {
      return result;
    }
    goto LABEL_15;
  }
LABEL_29:
  *((void *)result + 13) = self->_qoSnodataCFpoll;
  *((_WORD *)result + 60) |= 0x1000u;
  if ((*(_WORD *)&self->_has & 0x800) == 0) {
    return result;
  }
LABEL_15:
  *((void *)result + 12) = self->_qoSnodataCFack;
  *((_WORD *)result + 60) |= 0x800u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    __int16 has = (__int16)self->_has;
    __int16 v7 = *((_WORD *)a3 + 60);
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_dataFrames != *((void *)a3 + 7)) {
        goto LABEL_71;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
LABEL_71:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_dataCFack != *((void *)a3 + 4)) {
        goto LABEL_71;
      }
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_71;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_dataCFpoll != *((void *)a3 + 6)) {
        goto LABEL_71;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_71;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_dataCFackCFpoll != *((void *)a3 + 5)) {
        goto LABEL_71;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_71;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_null != *((void *)a3 + 8)) {
        goto LABEL_71;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_71;
    }
    if (has)
    {
      if ((v7 & 1) == 0 || self->_cFack != *((void *)a3 + 1)) {
        goto LABEL_71;
      }
    }
    else if (v7)
    {
      goto LABEL_71;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_cFpoll != *((void *)a3 + 3)) {
        goto LABEL_71;
      }
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_71;
    }
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_cFackCFpoll != *((void *)a3 + 2)) {
        goto LABEL_71;
      }
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_71;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 60) & 0x100) == 0 || self->_qoSdata != *((void *)a3 + 9)) {
        goto LABEL_71;
      }
    }
    else if ((*((_WORD *)a3 + 60) & 0x100) != 0)
    {
      goto LABEL_71;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 60) & 0x200) == 0 || self->_qoSdataCFack != *((void *)a3 + 10)) {
        goto LABEL_71;
      }
    }
    else if ((*((_WORD *)a3 + 60) & 0x200) != 0)
    {
      goto LABEL_71;
    }
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 60) & 0x400) == 0 || self->_qoSdataCFackCFpoll != *((void *)a3 + 11)) {
        goto LABEL_71;
      }
    }
    else if ((*((_WORD *)a3 + 60) & 0x400) != 0)
    {
      goto LABEL_71;
    }
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
    {
      if ((*((_WORD *)a3 + 60) & 0x2000) == 0 || self->_qoSnull != *((void *)a3 + 14)) {
        goto LABEL_71;
      }
    }
    else if ((*((_WORD *)a3 + 60) & 0x2000) != 0)
    {
      goto LABEL_71;
    }
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
    {
      if ((*((_WORD *)a3 + 60) & 0x1000) == 0 || self->_qoSnodataCFpoll != *((void *)a3 + 13)) {
        goto LABEL_71;
      }
    }
    else if ((*((_WORD *)a3 + 60) & 0x1000) != 0)
    {
      goto LABEL_71;
    }
    LOBYTE(v5) = (v7 & 0x800) == 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
      if ((*((_WORD *)a3 + 60) & 0x800) == 0 || self->_qoSnodataCFack != *((void *)a3 + 12)) {
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
  if ((has & 0x40) != 0)
  {
    unint64_t v3 = 2654435761u * self->_dataFrames;
    if ((has & 8) != 0)
    {
LABEL_3:
      unint64_t v4 = 2654435761u * self->_dataCFack;
      if ((has & 0x20) != 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
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
  if ((has & 0x20) != 0)
  {
LABEL_4:
    unint64_t v5 = 2654435761u * self->_dataCFpoll;
    if ((has & 0x10) != 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  unint64_t v5 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_5:
    unint64_t v6 = 2654435761u * self->_dataCFackCFpoll;
    if ((has & 0x80) != 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  unint64_t v6 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_6:
    unint64_t v7 = 2654435761u * self->_null;
    if (has) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  unint64_t v7 = 0;
  if (has)
  {
LABEL_7:
    unint64_t v8 = 2654435761u * self->_cFack;
    if ((has & 4) != 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  unint64_t v8 = 0;
  if ((has & 4) != 0)
  {
LABEL_8:
    unint64_t v9 = 2654435761u * self->_cFpoll;
    if ((has & 2) != 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  unint64_t v9 = 0;
  if ((has & 2) != 0)
  {
LABEL_9:
    unint64_t v10 = 2654435761u * self->_cFackCFpoll;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  unint64_t v10 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_10:
    unint64_t v11 = 2654435761u * self->_qoSdata;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  unint64_t v11 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_11:
    unint64_t v12 = 2654435761u * self->_qoSdataCFack;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_12;
    }
    goto LABEL_26;
  }
LABEL_25:
  unint64_t v12 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_12:
    unint64_t v13 = 2654435761u * self->_qoSdataCFackCFpoll;
    if ((*(_WORD *)&self->_has & 0x2000) != 0) {
      goto LABEL_13;
    }
    goto LABEL_27;
  }
LABEL_26:
  unint64_t v13 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_13:
    unint64_t v14 = 2654435761u * self->_qoSnull;
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_14;
    }
LABEL_28:
    unint64_t v15 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_15;
    }
LABEL_29:
    unint64_t v16 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
  }
LABEL_27:
  unint64_t v14 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) == 0) {
    goto LABEL_28;
  }
LABEL_14:
  unint64_t v15 = 2654435761u * self->_qoSnodataCFpoll;
  if ((*(_WORD *)&self->_has & 0x800) == 0) {
    goto LABEL_29;
  }
LABEL_15:
  unint64_t v16 = 2654435761u * self->_qoSnodataCFack;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3 = *((_WORD *)a3 + 60);
  if ((v3 & 0x40) != 0)
  {
    self->_dataFrames = *((void *)a3 + 7);
    *(_WORD *)&self->_has |= 0x40u;
    __int16 v3 = *((_WORD *)a3 + 60);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((v3 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_dataCFack = *((void *)a3 + 4);
  *(_WORD *)&self->_has |= 8u;
  __int16 v3 = *((_WORD *)a3 + 60);
  if ((v3 & 0x20) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_dataCFpoll = *((void *)a3 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v3 = *((_WORD *)a3 + 60);
  if ((v3 & 0x10) == 0)
  {
LABEL_5:
    if ((v3 & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_dataCFackCFpoll = *((void *)a3 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v3 = *((_WORD *)a3 + 60);
  if ((v3 & 0x80) == 0)
  {
LABEL_6:
    if ((v3 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_null = *((void *)a3 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v3 = *((_WORD *)a3 + 60);
  if ((v3 & 1) == 0)
  {
LABEL_7:
    if ((v3 & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_cFack = *((void *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v3 = *((_WORD *)a3 + 60);
  if ((v3 & 4) == 0)
  {
LABEL_8:
    if ((v3 & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_cFpoll = *((void *)a3 + 3);
  *(_WORD *)&self->_has |= 4u;
  __int16 v3 = *((_WORD *)a3 + 60);
  if ((v3 & 2) == 0)
  {
LABEL_9:
    if ((v3 & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_cFackCFpoll = *((void *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v3 = *((_WORD *)a3 + 60);
  if ((v3 & 0x100) == 0)
  {
LABEL_10:
    if ((v3 & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_qoSdata = *((void *)a3 + 9);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v3 = *((_WORD *)a3 + 60);
  if ((v3 & 0x200) == 0)
  {
LABEL_11:
    if ((v3 & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_qoSdataCFack = *((void *)a3 + 10);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v3 = *((_WORD *)a3 + 60);
  if ((v3 & 0x400) == 0)
  {
LABEL_12:
    if ((v3 & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_qoSdataCFackCFpoll = *((void *)a3 + 11);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v3 = *((_WORD *)a3 + 60);
  if ((v3 & 0x2000) == 0)
  {
LABEL_13:
    if ((v3 & 0x1000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_qoSnull = *((void *)a3 + 14);
  *(_WORD *)&self->_has |= 0x2000u;
  __int16 v3 = *((_WORD *)a3 + 60);
  if ((v3 & 0x1000) == 0)
  {
LABEL_14:
    if ((v3 & 0x800) == 0) {
      return;
    }
LABEL_29:
    self->_qoSnodataCFack = *((void *)a3 + 12);
    *(_WORD *)&self->_has |= 0x800u;
    return;
  }
LABEL_28:
  self->_qoSnodataCFpoll = *((void *)a3 + 13);
  *(_WORD *)&self->_has |= 0x1000u;
  if ((*((_WORD *)a3 + 60) & 0x800) != 0) {
    goto LABEL_29;
  }
}

- (unint64_t)dataFrames
{
  return self->_dataFrames;
}

- (unint64_t)dataCFack
{
  return self->_dataCFack;
}

- (unint64_t)dataCFpoll
{
  return self->_dataCFpoll;
}

- (unint64_t)dataCFackCFpoll
{
  return self->_dataCFackCFpoll;
}

- (unint64_t)null
{
  return self->_null;
}

- (unint64_t)cFack
{
  return self->_cFack;
}

- (unint64_t)cFpoll
{
  return self->_cFpoll;
}

- (unint64_t)cFackCFpoll
{
  return self->_cFackCFpoll;
}

- (unint64_t)qoSdata
{
  return self->_qoSdata;
}

- (unint64_t)qoSdataCFack
{
  return self->_qoSdataCFack;
}

- (unint64_t)qoSdataCFackCFpoll
{
  return self->_qoSdataCFackCFpoll;
}

- (unint64_t)qoSnull
{
  return self->_qoSnull;
}

- (unint64_t)qoSnodataCFpoll
{
  return self->_qoSnodataCFpoll;
}

- (unint64_t)qoSnodataCFack
{
  return self->_qoSnodataCFack;
}

@end