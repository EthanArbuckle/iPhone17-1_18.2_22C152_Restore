@interface WiFiAnalyticsAWDWiFiNWActivityPerACTxCompletions
- (BOOL)hasAc;
- (BOOL)hasDpsNotifications;
- (BOOL)hasDurSinceLastEnqueue;
- (BOOL)hasDurSinceLastEnqueueAtLastCheck;
- (BOOL)hasDurSinceLastFailedComp;
- (BOOL)hasDurSinceLastSuccessfulComp;
- (BOOL)hasExpiredComp;
- (BOOL)hasFailedComp;
- (BOOL)hasFailedCompletionsAtLastCheck;
- (BOOL)hasNoAckComp;
- (BOOL)hasOtherErrComp;
- (BOOL)hasQeuedPackets;
- (BOOL)hasSinceLastEnqueueHowManyFailed;
- (BOOL)hasSinceLastEnqueueHowManySuccess;
- (BOOL)hasSinceLastSuccessHowManyFailed;
- (BOOL)hasSuccess;
- (BOOL)hasSuccessfulCompletionsAtLastCheck;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)acAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsAc:(id)a3;
- (int)ac;
- (unint64_t)hash;
- (unsigned)dpsNotifications;
- (unsigned)durSinceLastEnqueue;
- (unsigned)durSinceLastEnqueueAtLastCheck;
- (unsigned)durSinceLastFailedComp;
- (unsigned)durSinceLastSuccessfulComp;
- (unsigned)expiredComp;
- (unsigned)failedComp;
- (unsigned)failedCompletionsAtLastCheck;
- (unsigned)noAckComp;
- (unsigned)otherErrComp;
- (unsigned)qeuedPackets;
- (unsigned)sinceLastEnqueueHowManyFailed;
- (unsigned)sinceLastEnqueueHowManySuccess;
- (unsigned)sinceLastSuccessHowManyFailed;
- (unsigned)success;
- (unsigned)successfulCompletionsAtLastCheck;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAc:(int)a3;
- (void)setDpsNotifications:(unsigned int)a3;
- (void)setDurSinceLastEnqueue:(unsigned int)a3;
- (void)setDurSinceLastEnqueueAtLastCheck:(unsigned int)a3;
- (void)setDurSinceLastFailedComp:(unsigned int)a3;
- (void)setDurSinceLastSuccessfulComp:(unsigned int)a3;
- (void)setExpiredComp:(unsigned int)a3;
- (void)setFailedComp:(unsigned int)a3;
- (void)setFailedCompletionsAtLastCheck:(unsigned int)a3;
- (void)setHasAc:(BOOL)a3;
- (void)setHasDpsNotifications:(BOOL)a3;
- (void)setHasDurSinceLastEnqueue:(BOOL)a3;
- (void)setHasDurSinceLastEnqueueAtLastCheck:(BOOL)a3;
- (void)setHasDurSinceLastFailedComp:(BOOL)a3;
- (void)setHasDurSinceLastSuccessfulComp:(BOOL)a3;
- (void)setHasExpiredComp:(BOOL)a3;
- (void)setHasFailedComp:(BOOL)a3;
- (void)setHasFailedCompletionsAtLastCheck:(BOOL)a3;
- (void)setHasNoAckComp:(BOOL)a3;
- (void)setHasOtherErrComp:(BOOL)a3;
- (void)setHasQeuedPackets:(BOOL)a3;
- (void)setHasSinceLastEnqueueHowManyFailed:(BOOL)a3;
- (void)setHasSinceLastEnqueueHowManySuccess:(BOOL)a3;
- (void)setHasSinceLastSuccessHowManyFailed:(BOOL)a3;
- (void)setHasSuccess:(BOOL)a3;
- (void)setHasSuccessfulCompletionsAtLastCheck:(BOOL)a3;
- (void)setNoAckComp:(unsigned int)a3;
- (void)setOtherErrComp:(unsigned int)a3;
- (void)setQeuedPackets:(unsigned int)a3;
- (void)setSinceLastEnqueueHowManyFailed:(unsigned int)a3;
- (void)setSinceLastEnqueueHowManySuccess:(unsigned int)a3;
- (void)setSinceLastSuccessHowManyFailed:(unsigned int)a3;
- (void)setSuccess:(unsigned int)a3;
- (void)setSuccessfulCompletionsAtLastCheck:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation WiFiAnalyticsAWDWiFiNWActivityPerACTxCompletions

- (void)setSuccessfulCompletionsAtLastCheck:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_successfulCompletionsAtLastCheck = a3;
}

- (void)setSuccess:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_success = a3;
}

- (void)setSinceLastSuccessHowManyFailed:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_sinceLastSuccessHowManyFailed = a3;
}

- (void)setSinceLastEnqueueHowManySuccess:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_sinceLastEnqueueHowManySuccess = a3;
}

- (void)setSinceLastEnqueueHowManyFailed:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_sinceLastEnqueueHowManyFailed = a3;
}

- (void)setQeuedPackets:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_qeuedPackets = a3;
}

- (void)setOtherErrComp:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_otherErrComp = a3;
}

- (void)setNoAckComp:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_noAckComp = a3;
}

- (void)setFailedCompletionsAtLastCheck:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_failedCompletionsAtLastCheck = a3;
}

- (void)setFailedComp:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_failedComp = a3;
}

- (void)setExpiredComp:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_expiredComp = a3;
}

- (void)setDurSinceLastSuccessfulComp:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_durSinceLastSuccessfulComp = a3;
}

- (void)setDurSinceLastFailedComp:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_durSinceLastFailedComp = a3;
}

- (void)setDurSinceLastEnqueueAtLastCheck:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_durSinceLastEnqueueAtLastCheck = a3;
}

- (void)setDurSinceLastEnqueue:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_durSinceLastEnqueue = a3;
}

- (void)setDpsNotifications:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_dpsNotifications = a3;
}

- (void)setAc:(int)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_ac = a3;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if (*(unsigned char *)&has)
  {
    PBDataWriterWriteInt32Field();
    $10A57E178583965F6CC2878FB3337F9B has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_17;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 2) != 0) {
LABEL_18:
  }
    PBDataWriterWriteUint32Field();
LABEL_19:
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if (*(unsigned char *)&has)
  {
    uint64_t ac = self->_ac;
    if (ac >= 0xC)
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_ac);
    }
    else
    {
      v6 = *(&off_264466BB0 + ac);
    }
    [v3 setObject:v6 forKey:@"ac"];

    $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    v9 = [NSNumber numberWithUnsignedInt:self->_success];
    [v3 setObject:v9 forKey:@"success"];

    $10A57E178583965F6CC2878FB3337F9B has = self->_has;
    if ((*(unsigned char *)&has & 0x20) == 0)
    {
LABEL_8:
      if ((*(unsigned char *)&has & 0x80) == 0) {
        goto LABEL_9;
      }
      goto LABEL_28;
    }
  }
  else if ((*(unsigned char *)&has & 0x20) == 0)
  {
    goto LABEL_8;
  }
  v10 = [NSNumber numberWithUnsignedInt:self->_durSinceLastSuccessfulComp];
  [v3 setObject:v10 forKey:@"durSinceLastSuccessfulComp"];

  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
LABEL_28:
  v11 = [NSNumber numberWithUnsignedInt:self->_failedComp];
  [v3 setObject:v11 forKey:@"failedComp"];

  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_30;
  }
LABEL_29:
  v12 = [NSNumber numberWithUnsignedInt:self->_durSinceLastFailedComp];
  [v3 setObject:v12 forKey:@"durSinceLastFailedComp"];

  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_31;
  }
LABEL_30:
  v13 = [NSNumber numberWithUnsignedInt:self->_expiredComp];
  [v3 setObject:v13 forKey:@"expiredComp"];

  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_32;
  }
LABEL_31:
  v14 = [NSNumber numberWithUnsignedInt:self->_noAckComp];
  [v3 setObject:v14 forKey:@"noAckComp"];

  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_33;
  }
LABEL_32:
  v15 = [NSNumber numberWithUnsignedInt:self->_otherErrComp];
  [v3 setObject:v15 forKey:@"otherErrComp"];

  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_34;
  }
LABEL_33:
  v16 = [NSNumber numberWithUnsignedInt:self->_durSinceLastEnqueue];
  [v3 setObject:v16 forKey:@"durSinceLastEnqueue"];

  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_35;
  }
LABEL_34:
  v17 = [NSNumber numberWithUnsignedInt:self->_qeuedPackets];
  [v3 setObject:v17 forKey:@"qeuedPackets"];

  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_36;
  }
LABEL_35:
  v18 = [NSNumber numberWithUnsignedInt:self->_sinceLastEnqueueHowManyFailed];
  [v3 setObject:v18 forKey:@"sinceLastEnqueueHowManyFailed"];

  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_37;
  }
LABEL_36:
  v19 = [NSNumber numberWithUnsignedInt:self->_sinceLastEnqueueHowManySuccess];
  [v3 setObject:v19 forKey:@"sinceLastEnqueueHowManySuccess"];

  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_19;
    }
    goto LABEL_38;
  }
LABEL_37:
  v20 = [NSNumber numberWithUnsignedInt:self->_sinceLastSuccessHowManyFailed];
  [v3 setObject:v20 forKey:@"sinceLastSuccessHowManyFailed"];

  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_39;
  }
LABEL_38:
  v21 = [NSNumber numberWithUnsignedInt:self->_durSinceLastEnqueueAtLastCheck];
  [v3 setObject:v21 forKey:@"durSinceLastEnqueueAtLastCheck"];

  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_21;
    }
    goto LABEL_40;
  }
LABEL_39:
  v22 = [NSNumber numberWithUnsignedInt:self->_successfulCompletionsAtLastCheck];
  [v3 setObject:v22 forKey:@"successfulCompletionsAtLastCheck"];

  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_40:
  v23 = [NSNumber numberWithUnsignedInt:self->_failedCompletionsAtLastCheck];
  [v3 setObject:v23 forKey:@"failedCompletionsAtLastCheck"];

  if ((*(_DWORD *)&self->_has & 2) != 0)
  {
LABEL_22:
    v7 = [NSNumber numberWithUnsignedInt:self->_dpsNotifications];
    [v3 setObject:v7 forKey:@"dpsNotifications"];
  }
LABEL_23:
  return v3;
}

- (int)ac
{
  if (*(unsigned char *)&self->_has) {
    return self->_ac;
  }
  else {
    return 0;
  }
}

- (void)setHasAc:(BOOL)a3
{
  self->_$10A57E178583965F6CC2878FB3337F9B has = ($10A57E178583965F6CC2878FB3337F9B)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasAc
{
  return *(_DWORD *)&self->_has & 1;
}

- (id)acAsString:(int)a3
{
  if (a3 >= 0xC)
  {
    v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    v3 = *(&off_264466BB0 + a3);
  }
  return v3;
}

- (int)StringAsAc:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Rx"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Tx"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TxBK"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TxBE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"TxVO"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"TxVI"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RxSU"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"TxSU"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"RxOFDMA"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"TxOFDMA"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"RxMUMIMO"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"TxMUMIMO"])
  {
    int v4 = 11;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setHasSuccess:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_$10A57E178583965F6CC2878FB3337F9B has = ($10A57E178583965F6CC2878FB3337F9B)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasSuccess
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setHasDurSinceLastSuccessfulComp:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_$10A57E178583965F6CC2878FB3337F9B has = ($10A57E178583965F6CC2878FB3337F9B)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasDurSinceLastSuccessfulComp
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasFailedComp:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_$10A57E178583965F6CC2878FB3337F9B has = ($10A57E178583965F6CC2878FB3337F9B)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasFailedComp
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setHasDurSinceLastFailedComp:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_$10A57E178583965F6CC2878FB3337F9B has = ($10A57E178583965F6CC2878FB3337F9B)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasDurSinceLastFailedComp
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasExpiredComp:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_$10A57E178583965F6CC2878FB3337F9B has = ($10A57E178583965F6CC2878FB3337F9B)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasExpiredComp
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setHasNoAckComp:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_$10A57E178583965F6CC2878FB3337F9B has = ($10A57E178583965F6CC2878FB3337F9B)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasNoAckComp
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setHasOtherErrComp:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_$10A57E178583965F6CC2878FB3337F9B has = ($10A57E178583965F6CC2878FB3337F9B)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasOtherErrComp
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setHasDurSinceLastEnqueue:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_$10A57E178583965F6CC2878FB3337F9B has = ($10A57E178583965F6CC2878FB3337F9B)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasDurSinceLastEnqueue
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasQeuedPackets:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_$10A57E178583965F6CC2878FB3337F9B has = ($10A57E178583965F6CC2878FB3337F9B)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasQeuedPackets
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setHasSinceLastEnqueueHowManyFailed:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_$10A57E178583965F6CC2878FB3337F9B has = ($10A57E178583965F6CC2878FB3337F9B)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasSinceLastEnqueueHowManyFailed
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setHasSinceLastEnqueueHowManySuccess:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_$10A57E178583965F6CC2878FB3337F9B has = ($10A57E178583965F6CC2878FB3337F9B)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasSinceLastEnqueueHowManySuccess
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setHasSinceLastSuccessHowManyFailed:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_$10A57E178583965F6CC2878FB3337F9B has = ($10A57E178583965F6CC2878FB3337F9B)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasSinceLastSuccessHowManyFailed
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setHasDurSinceLastEnqueueAtLastCheck:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_$10A57E178583965F6CC2878FB3337F9B has = ($10A57E178583965F6CC2878FB3337F9B)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasDurSinceLastEnqueueAtLastCheck
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasSuccessfulCompletionsAtLastCheck:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_$10A57E178583965F6CC2878FB3337F9B has = ($10A57E178583965F6CC2878FB3337F9B)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasSuccessfulCompletionsAtLastCheck
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setHasFailedCompletionsAtLastCheck:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_$10A57E178583965F6CC2878FB3337F9B has = ($10A57E178583965F6CC2878FB3337F9B)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasFailedCompletionsAtLastCheck
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setHasDpsNotifications:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_$10A57E178583965F6CC2878FB3337F9B has = ($10A57E178583965F6CC2878FB3337F9B)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasDpsNotifications
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiNWActivityPerACTxCompletions;
  int v4 = [(WiFiAnalyticsAWDWiFiNWActivityPerACTxCompletions *)&v8 description];
  id v5 = [(WiFiAnalyticsAWDWiFiNWActivityPerACTxCompletions *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiNWActivityPerACTxCompletionsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if (*(unsigned char *)&has)
  {
    v4[2] = self->_ac;
    v4[19] |= 1u;
    $10A57E178583965F6CC2878FB3337F9B has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  v4[17] = self->_success;
  v4[19] |= 0x8000u;
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  v4[7] = self->_durSinceLastSuccessfulComp;
  v4[19] |= 0x20u;
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  v4[9] = self->_failedComp;
  v4[19] |= 0x80u;
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  v4[6] = self->_durSinceLastFailedComp;
  v4[19] |= 0x10u;
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  v4[8] = self->_expiredComp;
  v4[19] |= 0x40u;
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  v4[11] = self->_noAckComp;
  v4[19] |= 0x200u;
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  v4[12] = self->_otherErrComp;
  v4[19] |= 0x400u;
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  v4[4] = self->_durSinceLastEnqueue;
  v4[19] |= 4u;
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  v4[13] = self->_qeuedPackets;
  v4[19] |= 0x800u;
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  v4[14] = self->_sinceLastEnqueueHowManyFailed;
  v4[19] |= 0x1000u;
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  v4[15] = self->_sinceLastEnqueueHowManySuccess;
  v4[19] |= 0x2000u;
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  v4[16] = self->_sinceLastSuccessHowManyFailed;
  v4[19] |= 0x4000u;
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_36;
  }
LABEL_35:
  v4[5] = self->_durSinceLastEnqueueAtLastCheck;
  v4[19] |= 8u;
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_17;
    }
    goto LABEL_37;
  }
LABEL_36:
  v4[18] = self->_successfulCompletionsAtLastCheck;
  v4[19] |= 0x10000u;
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_37:
  v4[10] = self->_failedCompletionsAtLastCheck;
  v4[19] |= 0x100u;
  if ((*(_DWORD *)&self->_has & 2) != 0)
  {
LABEL_18:
    v4[3] = self->_dpsNotifications;
    v4[19] |= 2u;
  }
LABEL_19:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if (*(unsigned char *)&has)
  {
    *((_DWORD *)result + 2) = self->_ac;
    *((_DWORD *)result + 19) |= 1u;
    $10A57E178583965F6CC2878FB3337F9B has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 17) = self->_success;
  *((_DWORD *)result + 19) |= 0x8000u;
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 7) = self->_durSinceLastSuccessfulComp;
  *((_DWORD *)result + 19) |= 0x20u;
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)result + 9) = self->_failedComp;
  *((_DWORD *)result + 19) |= 0x80u;
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 6) = self->_durSinceLastFailedComp;
  *((_DWORD *)result + 19) |= 0x10u;
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)result + 8) = self->_expiredComp;
  *((_DWORD *)result + 19) |= 0x40u;
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)result + 11) = self->_noAckComp;
  *((_DWORD *)result + 19) |= 0x200u;
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)result + 12) = self->_otherErrComp;
  *((_DWORD *)result + 19) |= 0x400u;
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)result + 4) = self->_durSinceLastEnqueue;
  *((_DWORD *)result + 19) |= 4u;
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)result + 13) = self->_qeuedPackets;
  *((_DWORD *)result + 19) |= 0x800u;
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)result + 14) = self->_sinceLastEnqueueHowManyFailed;
  *((_DWORD *)result + 19) |= 0x1000u;
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)result + 15) = self->_sinceLastEnqueueHowManySuccess;
  *((_DWORD *)result + 19) |= 0x2000u;
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)result + 16) = self->_sinceLastSuccessHowManyFailed;
  *((_DWORD *)result + 19) |= 0x4000u;
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)result + 5) = self->_durSinceLastEnqueueAtLastCheck;
  *((_DWORD *)result + 19) |= 8u;
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_17;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)result + 18) = self->_successfulCompletionsAtLastCheck;
  *((_DWORD *)result + 19) |= 0x10000u;
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 2) == 0) {
      return result;
    }
    goto LABEL_18;
  }
LABEL_35:
  *((_DWORD *)result + 10) = self->_failedCompletionsAtLastCheck;
  *((_DWORD *)result + 19) |= 0x100u;
  if ((*(_DWORD *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_18:
  *((_DWORD *)result + 3) = self->_dpsNotifications;
  *((_DWORD *)result + 19) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_87;
  }
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  int v6 = v4[19];
  if (*(unsigned char *)&has)
  {
    if ((v6 & 1) == 0 || self->_ac != v4[2]) {
      goto LABEL_87;
    }
  }
  else if (v6)
  {
LABEL_87:
    BOOL v7 = 0;
    goto LABEL_88;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_success != v4[17]) {
      goto LABEL_87;
    }
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_87;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_durSinceLastSuccessfulComp != v4[7]) {
      goto LABEL_87;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_87;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_failedComp != v4[9]) {
      goto LABEL_87;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_87;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_durSinceLastFailedComp != v4[6]) {
      goto LABEL_87;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_87;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_expiredComp != v4[8]) {
      goto LABEL_87;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_noAckComp != v4[11]) {
      goto LABEL_87;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_otherErrComp != v4[12]) {
      goto LABEL_87;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_87;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_durSinceLastEnqueue != v4[4]) {
      goto LABEL_87;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_qeuedPackets != v4[13]) {
      goto LABEL_87;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_sinceLastEnqueueHowManyFailed != v4[14]) {
      goto LABEL_87;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_sinceLastEnqueueHowManySuccess != v4[15]) {
      goto LABEL_87;
    }
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_sinceLastSuccessHowManyFailed != v4[16]) {
      goto LABEL_87;
    }
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_87;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_durSinceLastEnqueueAtLastCheck != v4[5]) {
      goto LABEL_87;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_successfulCompletionsAtLastCheck != v4[18]) {
      goto LABEL_87;
    }
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_failedCompletionsAtLastCheck != v4[10]) {
      goto LABEL_87;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_87;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_dpsNotifications != v4[3]) {
      goto LABEL_87;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (v4[19] & 2) == 0;
  }
LABEL_88:

  return v7;
}

- (unint64_t)hash
{
  $10A57E178583965F6CC2878FB3337F9B has = self->_has;
  if (*(unsigned char *)&has)
  {
    uint64_t v3 = 2654435761 * self->_ac;
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_success;
      if ((*(unsigned char *)&has & 0x20) != 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_durSinceLastSuccessfulComp;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_failedComp;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_durSinceLastFailedComp;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_expiredComp;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v8 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_noAckComp;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v9 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_otherErrComp;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v10 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_durSinceLastEnqueue;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v11 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_11:
    uint64_t v12 = 2654435761 * self->_qeuedPackets;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v12 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_12:
    uint64_t v13 = 2654435761 * self->_sinceLastEnqueueHowManyFailed;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v13 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_13:
    uint64_t v14 = 2654435761 * self->_sinceLastEnqueueHowManySuccess;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v14 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_14:
    uint64_t v15 = 2654435761 * self->_sinceLastSuccessHowManyFailed;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_15;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v15 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_15:
    uint64_t v16 = 2654435761 * self->_durSinceLastEnqueueAtLastCheck;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v16 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_16:
    uint64_t v17 = 2654435761 * self->_successfulCompletionsAtLastCheck;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_17;
    }
LABEL_34:
    uint64_t v18 = 0;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_18;
    }
LABEL_35:
    uint64_t v19 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
  }
LABEL_33:
  uint64_t v17 = 0;
  if ((*(_WORD *)&has & 0x100) == 0) {
    goto LABEL_34;
  }
LABEL_17:
  uint64_t v18 = 2654435761 * self->_failedCompletionsAtLastCheck;
  if ((*(unsigned char *)&has & 2) == 0) {
    goto LABEL_35;
  }
LABEL_18:
  uint64_t v19 = 2654435761 * self->_dpsNotifications;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  int v5 = v4[19];
  if (v5)
  {
    self->_uint64_t ac = v4[2];
    *(_DWORD *)&self->_has |= 1u;
    int v5 = v4[19];
    if ((v5 & 0x8000) == 0)
    {
LABEL_3:
      if ((v5 & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((v5 & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  self->_success = v4[17];
  *(_DWORD *)&self->_has |= 0x8000u;
  int v5 = v4[19];
  if ((v5 & 0x20) == 0)
  {
LABEL_4:
    if ((v5 & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_durSinceLastSuccessfulComp = v4[7];
  *(_DWORD *)&self->_has |= 0x20u;
  int v5 = v4[19];
  if ((v5 & 0x80) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_failedComp = v4[9];
  *(_DWORD *)&self->_has |= 0x80u;
  int v5 = v4[19];
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_durSinceLastFailedComp = v4[6];
  *(_DWORD *)&self->_has |= 0x10u;
  int v5 = v4[19];
  if ((v5 & 0x40) == 0)
  {
LABEL_7:
    if ((v5 & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_expiredComp = v4[8];
  *(_DWORD *)&self->_has |= 0x40u;
  int v5 = v4[19];
  if ((v5 & 0x200) == 0)
  {
LABEL_8:
    if ((v5 & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_noAckComp = v4[11];
  *(_DWORD *)&self->_has |= 0x200u;
  int v5 = v4[19];
  if ((v5 & 0x400) == 0)
  {
LABEL_9:
    if ((v5 & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_otherErrComp = v4[12];
  *(_DWORD *)&self->_has |= 0x400u;
  int v5 = v4[19];
  if ((v5 & 4) == 0)
  {
LABEL_10:
    if ((v5 & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_durSinceLastEnqueue = v4[4];
  *(_DWORD *)&self->_has |= 4u;
  int v5 = v4[19];
  if ((v5 & 0x800) == 0)
  {
LABEL_11:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_qeuedPackets = v4[13];
  *(_DWORD *)&self->_has |= 0x800u;
  int v5 = v4[19];
  if ((v5 & 0x1000) == 0)
  {
LABEL_12:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_sinceLastEnqueueHowManyFailed = v4[14];
  *(_DWORD *)&self->_has |= 0x1000u;
  int v5 = v4[19];
  if ((v5 & 0x2000) == 0)
  {
LABEL_13:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_sinceLastEnqueueHowManySuccess = v4[15];
  *(_DWORD *)&self->_has |= 0x2000u;
  int v5 = v4[19];
  if ((v5 & 0x4000) == 0)
  {
LABEL_14:
    if ((v5 & 8) == 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_sinceLastSuccessHowManyFailed = v4[16];
  *(_DWORD *)&self->_has |= 0x4000u;
  int v5 = v4[19];
  if ((v5 & 8) == 0)
  {
LABEL_15:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_durSinceLastEnqueueAtLastCheck = v4[5];
  *(_DWORD *)&self->_has |= 8u;
  int v5 = v4[19];
  if ((v5 & 0x10000) == 0)
  {
LABEL_16:
    if ((v5 & 0x100) == 0) {
      goto LABEL_17;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_successfulCompletionsAtLastCheck = v4[18];
  *(_DWORD *)&self->_has |= 0x10000u;
  int v5 = v4[19];
  if ((v5 & 0x100) == 0)
  {
LABEL_17:
    if ((v5 & 2) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_37:
  self->_failedCompletionsAtLastCheck = v4[10];
  *(_DWORD *)&self->_has |= 0x100u;
  if ((v4[19] & 2) != 0)
  {
LABEL_18:
    self->_dpsNotifications = v4[3];
    *(_DWORD *)&self->_has |= 2u;
  }
LABEL_19:
}

- (unsigned)success
{
  return self->_success;
}

- (unsigned)durSinceLastSuccessfulComp
{
  return self->_durSinceLastSuccessfulComp;
}

- (unsigned)failedComp
{
  return self->_failedComp;
}

- (unsigned)durSinceLastFailedComp
{
  return self->_durSinceLastFailedComp;
}

- (unsigned)expiredComp
{
  return self->_expiredComp;
}

- (unsigned)noAckComp
{
  return self->_noAckComp;
}

- (unsigned)otherErrComp
{
  return self->_otherErrComp;
}

- (unsigned)durSinceLastEnqueue
{
  return self->_durSinceLastEnqueue;
}

- (unsigned)qeuedPackets
{
  return self->_qeuedPackets;
}

- (unsigned)sinceLastEnqueueHowManyFailed
{
  return self->_sinceLastEnqueueHowManyFailed;
}

- (unsigned)sinceLastEnqueueHowManySuccess
{
  return self->_sinceLastEnqueueHowManySuccess;
}

- (unsigned)sinceLastSuccessHowManyFailed
{
  return self->_sinceLastSuccessHowManyFailed;
}

- (unsigned)durSinceLastEnqueueAtLastCheck
{
  return self->_durSinceLastEnqueueAtLastCheck;
}

- (unsigned)successfulCompletionsAtLastCheck
{
  return self->_successfulCompletionsAtLastCheck;
}

- (unsigned)failedCompletionsAtLastCheck
{
  return self->_failedCompletionsAtLastCheck;
}

- (unsigned)dpsNotifications
{
  return self->_dpsNotifications;
}

@end