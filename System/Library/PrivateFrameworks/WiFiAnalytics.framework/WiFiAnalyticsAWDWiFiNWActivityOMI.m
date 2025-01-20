@interface WiFiAnalyticsAWDWiFiNWActivityOMI
- (BOOL)hasChBWAck;
- (BOOL)hasChBWReq;
- (BOOL)hasCompletionDelay;
- (BOOL)hasDLResoundAck;
- (BOOL)hasDLResoundReq;
- (BOOL)hasERSUAck;
- (BOOL)hasERSUReq;
- (BOOL)hasRetries;
- (BOOL)hasRxNSSAck;
- (BOOL)hasRxNSSReq;
- (BOOL)hasScheduled;
- (BOOL)hasSuccess;
- (BOOL)hasTxNSTSAck;
- (BOOL)hasTxNSTSReq;
- (BOOL)hasULMUAck;
- (BOOL)hasULMUReq;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)chBWAck;
- (unsigned)chBWReq;
- (unsigned)completionDelay;
- (unsigned)dLResoundAck;
- (unsigned)dLResoundReq;
- (unsigned)eRSUAck;
- (unsigned)eRSUReq;
- (unsigned)retries;
- (unsigned)rxNSSAck;
- (unsigned)rxNSSReq;
- (unsigned)scheduled;
- (unsigned)success;
- (unsigned)txNSTSAck;
- (unsigned)txNSTSReq;
- (unsigned)uLMUAck;
- (unsigned)uLMUReq;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChBWAck:(unsigned int)a3;
- (void)setChBWReq:(unsigned int)a3;
- (void)setCompletionDelay:(unsigned int)a3;
- (void)setDLResoundAck:(unsigned int)a3;
- (void)setDLResoundReq:(unsigned int)a3;
- (void)setERSUAck:(unsigned int)a3;
- (void)setERSUReq:(unsigned int)a3;
- (void)setHasChBWAck:(BOOL)a3;
- (void)setHasChBWReq:(BOOL)a3;
- (void)setHasCompletionDelay:(BOOL)a3;
- (void)setHasDLResoundAck:(BOOL)a3;
- (void)setHasDLResoundReq:(BOOL)a3;
- (void)setHasERSUAck:(BOOL)a3;
- (void)setHasERSUReq:(BOOL)a3;
- (void)setHasRetries:(BOOL)a3;
- (void)setHasRxNSSAck:(BOOL)a3;
- (void)setHasRxNSSReq:(BOOL)a3;
- (void)setHasScheduled:(BOOL)a3;
- (void)setHasSuccess:(BOOL)a3;
- (void)setHasTxNSTSAck:(BOOL)a3;
- (void)setHasTxNSTSReq:(BOOL)a3;
- (void)setHasULMUAck:(BOOL)a3;
- (void)setHasULMUReq:(BOOL)a3;
- (void)setRetries:(unsigned int)a3;
- (void)setRxNSSAck:(unsigned int)a3;
- (void)setRxNSSReq:(unsigned int)a3;
- (void)setScheduled:(unsigned int)a3;
- (void)setSuccess:(unsigned int)a3;
- (void)setTxNSTSAck:(unsigned int)a3;
- (void)setTxNSTSReq:(unsigned int)a3;
- (void)setULMUAck:(unsigned int)a3;
- (void)setULMUReq:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation WiFiAnalyticsAWDWiFiNWActivityOMI

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x8000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_6:
    if ((has & 0x4000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_7:
    if ((has & 0x2000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_8:
    if ((has & 0x1000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_13:
    if ((has & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_14:
    if ((has & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_15:
    if ((has & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_16:
    if ((has & 8) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 8) != 0) {
LABEL_17:
  }
    PBDataWriterWriteUint32Field();
LABEL_18:
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    v7 = [NSNumber numberWithUnsignedInt:self->_scheduled];
    [v3 setObject:v7 forKey:@"scheduled"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  v8 = [NSNumber numberWithUnsignedInt:self->_success];
  [v3 setObject:v8 forKey:@"success"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  v9 = [NSNumber numberWithUnsignedInt:self->_retries];
  [v3 setObject:v9 forKey:@"retries"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x8000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  v10 = [NSNumber numberWithUnsignedInt:self->_completionDelay];
  [v3 setObject:v10 forKey:@"completionDelay"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_6:
    if ((has & 0x4000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  v11 = [NSNumber numberWithUnsignedInt:self->_uLMUReq];
  [v3 setObject:v11 forKey:@"ULMUReq"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_7:
    if ((has & 0x2000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  v12 = [NSNumber numberWithUnsignedInt:self->_uLMUAck];
  [v3 setObject:v12 forKey:@"ULMUAck"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_8:
    if ((has & 0x1000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  v13 = [NSNumber numberWithUnsignedInt:self->_txNSTSReq];
  [v3 setObject:v13 forKey:@"TxNSTSReq"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
LABEL_28:
  v14 = [NSNumber numberWithUnsignedInt:self->_txNSTSAck];
  [v3 setObject:v14 forKey:@"TxNSTSAck"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_30;
  }
LABEL_29:
  v15 = [NSNumber numberWithUnsignedInt:self->_rxNSSReq];
  [v3 setObject:v15 forKey:@"RxNSSReq"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_31;
  }
LABEL_30:
  v16 = [NSNumber numberWithUnsignedInt:self->_rxNSSAck];
  [v3 setObject:v16 forKey:@"RxNSSAck"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_32;
  }
LABEL_31:
  v17 = [NSNumber numberWithUnsignedInt:self->_chBWReq];
  [v3 setObject:v17 forKey:@"ChBWReq"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_13:
    if ((has & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_33;
  }
LABEL_32:
  v18 = [NSNumber numberWithUnsignedInt:self->_chBWAck];
  [v3 setObject:v18 forKey:@"ChBWAck"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_14:
    if ((has & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_34;
  }
LABEL_33:
  v19 = [NSNumber numberWithUnsignedInt:self->_eRSUReq];
  [v3 setObject:v19 forKey:@"ERSUReq"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_15:
    if ((has & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_35;
  }
LABEL_34:
  v20 = [NSNumber numberWithUnsignedInt:self->_eRSUAck];
  [v3 setObject:v20 forKey:@"ERSUAck"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_16:
    if ((has & 8) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_35:
  v21 = [NSNumber numberWithUnsignedInt:self->_dLResoundReq];
  [v3 setObject:v21 forKey:@"DLResoundReq"];

  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_17:
    id v5 = [NSNumber numberWithUnsignedInt:self->_dLResoundAck];
    [v3 setObject:v5 forKey:@"DLResoundAck"];
  }
LABEL_18:
  return v3;
}

- (void)setULMUReq:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x8000u;
  self->_uLMUReq = a3;
}

- (void)setULMUAck:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_uLMUAck = a3;
}

- (void)setTxNSTSReq:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_txNSTSReq = a3;
}

- (void)setTxNSTSAck:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_txNSTSAck = a3;
}

- (void)setSuccess:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_success = a3;
}

- (void)setScheduled:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_scheduled = a3;
}

- (void)setRxNSSReq:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_rxNSSReq = a3;
}

- (void)setRxNSSAck:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_rxNSSAck = a3;
}

- (void)setRetries:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_retries = a3;
}

- (void)setERSUReq:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_eRSUReq = a3;
}

- (void)setERSUAck:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_eRSUAck = a3;
}

- (void)setDLResoundReq:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_dLResoundReq = a3;
}

- (void)setDLResoundAck:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_dLResoundAck = a3;
}

- (void)setCompletionDelay:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_completionDelay = a3;
}

- (void)setChBWReq:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_chBWReq = a3;
}

- (void)setChBWAck:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_chBWAck = a3;
}

- (void)setHasScheduled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasScheduled
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasSuccess:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasSuccess
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setHasRetries:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRetries
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasCompletionDelay:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasCompletionDelay
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasULMUReq:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x8000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = v3 & 0x8000 | *(_WORD *)&self->_has & 0x7FFF;
}

- (BOOL)hasULMUReq
{
  return *(_WORD *)&self->_has >> 15;
}

- (void)setHasULMUAck:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasULMUAck
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setHasTxNSTSReq:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasTxNSTSReq
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setHasTxNSTSAck:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasTxNSTSAck
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setHasRxNSSReq:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasRxNSSReq
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasRxNSSAck:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRxNSSAck
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasChBWReq:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasChBWReq
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasChBWAck:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasChBWAck
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasERSUReq:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasERSUReq
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasERSUAck:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasERSUAck
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasDLResoundReq:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDLResoundReq
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasDLResoundAck:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDLResoundAck
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiNWActivityOMI;
  v4 = [(WiFiAnalyticsAWDWiFiNWActivityOMI *)&v8 description];
  id v5 = [(WiFiAnalyticsAWDWiFiNWActivityOMI *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiNWActivityOMIReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    v4[12] = self->_scheduled;
    *((_WORD *)v4 + 36) |= 0x400u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  v4[13] = self->_success;
  *((_WORD *)v4 + 36) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  v4[9] = self->_retries;
  *((_WORD *)v4 + 36) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x8000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  v4[4] = self->_completionDelay;
  *((_WORD *)v4 + 36) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_6:
    if ((has & 0x4000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  v4[17] = self->_uLMUReq;
  *((_WORD *)v4 + 36) |= 0x8000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_7:
    if ((has & 0x2000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  v4[16] = self->_uLMUAck;
  *((_WORD *)v4 + 36) |= 0x4000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_8:
    if ((has & 0x1000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  v4[15] = self->_txNSTSReq;
  *((_WORD *)v4 + 36) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
LABEL_28:
  v4[14] = self->_txNSTSAck;
  *((_WORD *)v4 + 36) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_30;
  }
LABEL_29:
  v4[11] = self->_rxNSSReq;
  *((_WORD *)v4 + 36) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_31;
  }
LABEL_30:
  v4[10] = self->_rxNSSAck;
  *((_WORD *)v4 + 36) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_32;
  }
LABEL_31:
  v4[3] = self->_chBWReq;
  *((_WORD *)v4 + 36) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_13:
    if ((has & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_33;
  }
LABEL_32:
  v4[2] = self->_chBWAck;
  *((_WORD *)v4 + 36) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_14:
    if ((has & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_34;
  }
LABEL_33:
  v4[8] = self->_eRSUReq;
  *((_WORD *)v4 + 36) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_15:
    if ((has & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_35;
  }
LABEL_34:
  v4[7] = self->_eRSUAck;
  *((_WORD *)v4 + 36) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_16:
    if ((has & 8) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_35:
  v4[6] = self->_dLResoundReq;
  *((_WORD *)v4 + 36) |= 0x10u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_17:
    v4[5] = self->_dLResoundAck;
    *((_WORD *)v4 + 36) |= 8u;
  }
LABEL_18:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    *((_DWORD *)result + 12) = self->_scheduled;
    *((_WORD *)result + 36) |= 0x400u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 13) = self->_success;
  *((_WORD *)result + 36) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 9) = self->_retries;
  *((_WORD *)result + 36) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x8000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 4) = self->_completionDelay;
  *((_WORD *)result + 36) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_6:
    if ((has & 0x4000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)result + 17) = self->_uLMUReq;
  *((_WORD *)result + 36) |= 0x8000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_7:
    if ((has & 0x2000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 16) = self->_uLMUAck;
  *((_WORD *)result + 36) |= 0x4000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_8:
    if ((has & 0x1000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)result + 15) = self->_txNSTSReq;
  *((_WORD *)result + 36) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)result + 14) = self->_txNSTSAck;
  *((_WORD *)result + 36) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)result + 11) = self->_rxNSSReq;
  *((_WORD *)result + 36) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)result + 10) = self->_rxNSSAck;
  *((_WORD *)result + 36) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)result + 3) = self->_chBWReq;
  *((_WORD *)result + 36) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_13:
    if ((has & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)result + 2) = self->_chBWAck;
  *((_WORD *)result + 36) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_14:
    if ((has & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)result + 8) = self->_eRSUReq;
  *((_WORD *)result + 36) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_15:
    if ((has & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)result + 7) = self->_eRSUAck;
  *((_WORD *)result + 36) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_16:
    if ((has & 8) == 0) {
      return result;
    }
    goto LABEL_17;
  }
LABEL_33:
  *((_DWORD *)result + 6) = self->_dLResoundReq;
  *((_WORD *)result + 36) |= 0x10u;
  if ((*(_WORD *)&self->_has & 8) == 0) {
    return result;
  }
LABEL_17:
  *((_DWORD *)result + 5) = self->_dLResoundAck;
  *((_WORD *)result + 36) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_82;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 36);
  if ((has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 36) & 0x400) == 0 || self->_scheduled != *((_DWORD *)v4 + 12)) {
      goto LABEL_82;
    }
  }
  else if ((*((_WORD *)v4 + 36) & 0x400) != 0)
  {
    goto LABEL_82;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 36) & 0x800) == 0 || self->_success != *((_DWORD *)v4 + 13)) {
      goto LABEL_82;
    }
  }
  else if ((*((_WORD *)v4 + 36) & 0x800) != 0)
  {
    goto LABEL_82;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_retries != *((_DWORD *)v4 + 9)) {
      goto LABEL_82;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_82;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_completionDelay != *((_DWORD *)v4 + 4)) {
      goto LABEL_82;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_82;
  }
  if ((*(_WORD *)&self->_has & 0x8000) != 0)
  {
    if ((*((_WORD *)v4 + 36) & 0x8000) == 0 || self->_uLMUReq != *((_DWORD *)v4 + 17)) {
      goto LABEL_82;
    }
  }
  else if ((*((_WORD *)v4 + 36) & 0x8000) != 0)
  {
LABEL_82:
    BOOL v7 = 0;
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 36) & 0x4000) == 0 || self->_uLMUAck != *((_DWORD *)v4 + 16)) {
      goto LABEL_82;
    }
  }
  else if ((*((_WORD *)v4 + 36) & 0x4000) != 0)
  {
    goto LABEL_82;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 36) & 0x2000) == 0 || self->_txNSTSReq != *((_DWORD *)v4 + 15)) {
      goto LABEL_82;
    }
  }
  else if ((*((_WORD *)v4 + 36) & 0x2000) != 0)
  {
    goto LABEL_82;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 36) & 0x1000) == 0 || self->_txNSTSAck != *((_DWORD *)v4 + 14)) {
      goto LABEL_82;
    }
  }
  else if ((*((_WORD *)v4 + 36) & 0x1000) != 0)
  {
    goto LABEL_82;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 36) & 0x200) == 0 || self->_rxNSSReq != *((_DWORD *)v4 + 11)) {
      goto LABEL_82;
    }
  }
  else if ((*((_WORD *)v4 + 36) & 0x200) != 0)
  {
    goto LABEL_82;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 36) & 0x100) == 0 || self->_rxNSSAck != *((_DWORD *)v4 + 10)) {
      goto LABEL_82;
    }
  }
  else if ((*((_WORD *)v4 + 36) & 0x100) != 0)
  {
    goto LABEL_82;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_chBWReq != *((_DWORD *)v4 + 3)) {
      goto LABEL_82;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_82;
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_chBWAck != *((_DWORD *)v4 + 2)) {
      goto LABEL_82;
    }
  }
  else if (v6)
  {
    goto LABEL_82;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_eRSUReq != *((_DWORD *)v4 + 8)) {
      goto LABEL_82;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_82;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_eRSUAck != *((_DWORD *)v4 + 7)) {
      goto LABEL_82;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_82;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_dLResoundReq != *((_DWORD *)v4 + 6)) {
      goto LABEL_82;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_82;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_dLResoundAck != *((_DWORD *)v4 + 5)) {
      goto LABEL_82;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (v6 & 8) == 0;
  }
LABEL_83:

  return v7;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    uint64_t v3 = 2654435761 * self->_scheduled;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_success;
      if ((has & 0x80) != 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_retries;
    if ((has & 4) != 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v5 = 0;
  if ((has & 4) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_completionDelay;
    if ((*(_WORD *)&self->_has & 0x8000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v6 = 0;
  if ((*(_WORD *)&self->_has & 0x8000) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_uLMUReq;
    if ((*(_WORD *)&self->_has & 0x4000) != 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v7 = 0;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_uLMUAck;
    if ((*(_WORD *)&self->_has & 0x2000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v8 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_txNSTSReq;
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v9 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_txNSTSAck;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v10 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_rxNSSReq;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v11 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_11:
    uint64_t v12 = 2654435761 * self->_rxNSSAck;
    if ((has & 2) != 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v12 = 0;
  if ((has & 2) != 0)
  {
LABEL_12:
    uint64_t v13 = 2654435761 * self->_chBWReq;
    if (has) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v13 = 0;
  if (has)
  {
LABEL_13:
    uint64_t v14 = 2654435761 * self->_chBWAck;
    if ((has & 0x40) != 0) {
      goto LABEL_14;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v14 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_14:
    uint64_t v15 = 2654435761 * self->_eRSUReq;
    if ((has & 0x20) != 0) {
      goto LABEL_15;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v15 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_15:
    uint64_t v16 = 2654435761 * self->_eRSUAck;
    if ((has & 0x10) != 0) {
      goto LABEL_16;
    }
LABEL_32:
    uint64_t v17 = 0;
    if ((has & 8) != 0) {
      goto LABEL_17;
    }
LABEL_33:
    uint64_t v18 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18;
  }
LABEL_31:
  uint64_t v16 = 0;
  if ((has & 0x10) == 0) {
    goto LABEL_32;
  }
LABEL_16:
  uint64_t v17 = 2654435761 * self->_dLResoundReq;
  if ((has & 8) == 0) {
    goto LABEL_33;
  }
LABEL_17:
  uint64_t v18 = 2654435761 * self->_dLResoundAck;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x400) != 0)
  {
    self->_scheduled = *((_DWORD *)v4 + 12);
    *(_WORD *)&self->_has |= 0x400u;
    __int16 v5 = *((_WORD *)v4 + 36);
    if ((v5 & 0x800) == 0)
    {
LABEL_3:
      if ((v5 & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((*((_WORD *)v4 + 36) & 0x800) == 0)
  {
    goto LABEL_3;
  }
  self->_success = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x80) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_retries = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 36);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_completionDelay = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x8000) == 0)
  {
LABEL_6:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_uLMUReq = *((_DWORD *)v4 + 17);
  *(_WORD *)&self->_has |= 0x8000u;
  __int16 v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x4000) == 0)
  {
LABEL_7:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_uLMUAck = *((_DWORD *)v4 + 16);
  *(_WORD *)&self->_has |= 0x4000u;
  __int16 v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x2000) == 0)
  {
LABEL_8:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_txNSTSReq = *((_DWORD *)v4 + 15);
  *(_WORD *)&self->_has |= 0x2000u;
  __int16 v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x1000) == 0)
  {
LABEL_9:
    if ((v5 & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_txNSTSAck = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 0x1000u;
  __int16 v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x200) == 0)
  {
LABEL_10:
    if ((v5 & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_rxNSSReq = *((_DWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x100) == 0)
  {
LABEL_11:
    if ((v5 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_rxNSSAck = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 36);
  if ((v5 & 2) == 0)
  {
LABEL_12:
    if ((v5 & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_chBWReq = *((_DWORD *)v4 + 3);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 36);
  if ((v5 & 1) == 0)
  {
LABEL_13:
    if ((v5 & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_chBWAck = *((_DWORD *)v4 + 2);
  *(_WORD *)&self->_has |= 1u;
  __int16 v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x40) == 0)
  {
LABEL_14:
    if ((v5 & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_eRSUReq = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x20) == 0)
  {
LABEL_15:
    if ((v5 & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_eRSUAck = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x10) == 0)
  {
LABEL_16:
    if ((v5 & 8) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_35:
  self->_dLResoundReq = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 0x10u;
  if ((*((_WORD *)v4 + 36) & 8) != 0)
  {
LABEL_17:
    self->_dLResoundAck = *((_DWORD *)v4 + 5);
    *(_WORD *)&self->_has |= 8u;
  }
LABEL_18:
}

- (unsigned)scheduled
{
  return self->_scheduled;
}

- (unsigned)success
{
  return self->_success;
}

- (unsigned)retries
{
  return self->_retries;
}

- (unsigned)completionDelay
{
  return self->_completionDelay;
}

- (unsigned)uLMUReq
{
  return self->_uLMUReq;
}

- (unsigned)uLMUAck
{
  return self->_uLMUAck;
}

- (unsigned)txNSTSReq
{
  return self->_txNSTSReq;
}

- (unsigned)txNSTSAck
{
  return self->_txNSTSAck;
}

- (unsigned)rxNSSReq
{
  return self->_rxNSSReq;
}

- (unsigned)rxNSSAck
{
  return self->_rxNSSAck;
}

- (unsigned)chBWReq
{
  return self->_chBWReq;
}

- (unsigned)chBWAck
{
  return self->_chBWAck;
}

- (unsigned)eRSUReq
{
  return self->_eRSUReq;
}

- (unsigned)eRSUAck
{
  return self->_eRSUAck;
}

- (unsigned)dLResoundReq
{
  return self->_dLResoundReq;
}

- (unsigned)dLResoundAck
{
  return self->_dLResoundAck;
}

@end