@interface CSDMessagingCallModelState
- (BOOL)addCallAllowed;
- (BOOL)endAndAnswerAllowed;
- (BOOL)hardPauseAvailable;
- (BOOL)hasAddCallAllowed;
- (BOOL)hasAmbiguityState;
- (BOOL)hasEndAndAnswerAllowed;
- (BOOL)hasHardPauseAvailable;
- (BOOL)hasHoldAllowed;
- (BOOL)hasHoldAndAnswerAllowed;
- (BOOL)hasMergeable;
- (BOOL)hasSendToVoicemailAllowed;
- (BOOL)hasSwappable;
- (BOOL)hasTakingCallsPrivateAllowed;
- (BOOL)holdAllowed;
- (BOOL)holdAndAnswerAllowed;
- (BOOL)isEqual:(id)a3;
- (BOOL)mergeable;
- (BOOL)readFrom:(id)a3;
- (BOOL)sendToVoicemailAllowed;
- (BOOL)swappable;
- (BOOL)takingCallsPrivateAllowed;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)ambiguityState;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAddCallAllowed:(BOOL)a3;
- (void)setAmbiguityState:(unsigned int)a3;
- (void)setEndAndAnswerAllowed:(BOOL)a3;
- (void)setHardPauseAvailable:(BOOL)a3;
- (void)setHasAddCallAllowed:(BOOL)a3;
- (void)setHasAmbiguityState:(BOOL)a3;
- (void)setHasEndAndAnswerAllowed:(BOOL)a3;
- (void)setHasHardPauseAvailable:(BOOL)a3;
- (void)setHasHoldAllowed:(BOOL)a3;
- (void)setHasHoldAndAnswerAllowed:(BOOL)a3;
- (void)setHasMergeable:(BOOL)a3;
- (void)setHasSendToVoicemailAllowed:(BOOL)a3;
- (void)setHasSwappable:(BOOL)a3;
- (void)setHasTakingCallsPrivateAllowed:(BOOL)a3;
- (void)setHoldAllowed:(BOOL)a3;
- (void)setHoldAndAnswerAllowed:(BOOL)a3;
- (void)setMergeable:(BOOL)a3;
- (void)setSendToVoicemailAllowed:(BOOL)a3;
- (void)setSwappable:(BOOL)a3;
- (void)setTakingCallsPrivateAllowed:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingCallModelState

- (void)setAmbiguityState:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_ambiguityState = a3;
}

- (void)setHasAmbiguityState:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAmbiguityState
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setSwappable:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_swappable = a3;
}

- (void)setHasSwappable:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSwappable
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setMergeable:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_mergeable = a3;
}

- (void)setHasMergeable:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasMergeable
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHoldAllowed:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_holdAllowed = a3;
}

- (void)setHasHoldAllowed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasHoldAllowed
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setAddCallAllowed:(BOOL)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_addCallAllowed = a3;
}

- (void)setHasAddCallAllowed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAddCallAllowed
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setTakingCallsPrivateAllowed:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_takingCallsPrivateAllowed = a3;
}

- (void)setHasTakingCallsPrivateAllowed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasTakingCallsPrivateAllowed
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHardPauseAvailable:(BOOL)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_hardPauseAvailable = a3;
}

- (void)setHasHardPauseAvailable:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasHardPauseAvailable
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setEndAndAnswerAllowed:(BOOL)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_endAndAnswerAllowed = a3;
}

- (void)setHasEndAndAnswerAllowed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasEndAndAnswerAllowed
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHoldAndAnswerAllowed:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_holdAndAnswerAllowed = a3;
}

- (void)setHasHoldAndAnswerAllowed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasHoldAndAnswerAllowed
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setSendToVoicemailAllowed:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_sendToVoicemailAllowed = a3;
}

- (void)setHasSendToVoicemailAllowed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasSendToVoicemailAllowed
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CSDMessagingCallModelState;
  __int16 v3 = [(CSDMessagingCallModelState *)&v7 description];
  v4 = [(CSDMessagingCallModelState *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = +[NSMutableDictionary dictionary];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_ambiguityState];
    [v3 setObject:v7 forKey:@"ambiguityState"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  v8 = +[NSNumber numberWithBool:self->_swappable];
  [v3 setObject:v8 forKey:@"swappable"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  v9 = +[NSNumber numberWithBool:self->_mergeable];
  [v3 setObject:v9 forKey:@"mergeable"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  v10 = +[NSNumber numberWithBool:self->_holdAllowed];
  [v3 setObject:v10 forKey:@"holdAllowed"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  v11 = +[NSNumber numberWithBool:self->_addCallAllowed];
  [v3 setObject:v11 forKey:@"addCallAllowed"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  v12 = +[NSNumber numberWithBool:self->_takingCallsPrivateAllowed];
  [v3 setObject:v12 forKey:@"takingCallsPrivateAllowed"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  v13 = +[NSNumber numberWithBool:self->_hardPauseAvailable];
  [v3 setObject:v13 forKey:@"hardPauseAvailable"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  v14 = +[NSNumber numberWithBool:self->_endAndAnswerAllowed];
  [v3 setObject:v14 forKey:@"endAndAnswerAllowed"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_23:
  v15 = +[NSNumber numberWithBool:self->_holdAndAnswerAllowed];
  [v3 setObject:v15 forKey:@"holdAndAnswerAllowed"];

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_11:
    v5 = +[NSNumber numberWithBool:self->_sendToVoicemailAllowed];
    [v3 setObject:v5 forKey:@"sendToVoicemailAllowed"];
  }
LABEL_12:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1001BA648((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_23:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
LABEL_11:
  }
    PBDataWriterWriteBOOLField();
LABEL_12:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v4[2] = self->_ambiguityState;
    *((_WORD *)v4 + 12) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)v4 + 19) = self->_swappable;
  *((_WORD *)v4 + 12) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((unsigned char *)v4 + 17) = self->_mergeable;
  *((_WORD *)v4 + 12) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((unsigned char *)v4 + 15) = self->_holdAllowed;
  *((_WORD *)v4 + 12) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((unsigned char *)v4 + 12) = self->_addCallAllowed;
  *((_WORD *)v4 + 12) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((unsigned char *)v4 + 20) = self->_takingCallsPrivateAllowed;
  *((_WORD *)v4 + 12) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((unsigned char *)v4 + 14) = self->_hardPauseAvailable;
  *((_WORD *)v4 + 12) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((unsigned char *)v4 + 13) = self->_endAndAnswerAllowed;
  *((_WORD *)v4 + 12) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_23:
  *((unsigned char *)v4 + 16) = self->_holdAndAnswerAllowed;
  *((_WORD *)v4 + 12) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_11:
    *((unsigned char *)v4 + 18) = self->_sendToVoicemailAllowed;
    *((_WORD *)v4 + 12) |= 0x80u;
  }
LABEL_12:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *((_DWORD *)result + 2) = self->_ambiguityState;
    *((_WORD *)result + 12) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)result + 19) = self->_swappable;
  *((_WORD *)result + 12) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((unsigned char *)result + 17) = self->_mergeable;
  *((_WORD *)result + 12) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((unsigned char *)result + 15) = self->_holdAllowed;
  *((_WORD *)result + 12) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((unsigned char *)result + 12) = self->_addCallAllowed;
  *((_WORD *)result + 12) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((unsigned char *)result + 20) = self->_takingCallsPrivateAllowed;
  *((_WORD *)result + 12) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((unsigned char *)result + 14) = self->_hardPauseAvailable;
  *((_WORD *)result + 12) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((unsigned char *)result + 13) = self->_endAndAnswerAllowed;
  *((_WORD *)result + 12) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      return result;
    }
    goto LABEL_11;
  }
LABEL_21:
  *((unsigned char *)result + 16) = self->_holdAndAnswerAllowed;
  *((_WORD *)result + 12) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x80) == 0) {
    return result;
  }
LABEL_11:
  *((unsigned char *)result + 18) = self->_sendToVoicemailAllowed;
  *((_WORD *)result + 12) |= 0x80u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_74;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 12);
  if (has)
  {
    if ((v6 & 1) == 0 || self->_ambiguityState != *((_DWORD *)v4 + 2)) {
      goto LABEL_74;
    }
  }
  else if (v6)
  {
    goto LABEL_74;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 12) & 0x100) == 0) {
      goto LABEL_74;
    }
    if (self->_swappable)
    {
      if (!*((unsigned char *)v4 + 19)) {
        goto LABEL_74;
      }
    }
    else if (*((unsigned char *)v4 + 19))
    {
      goto LABEL_74;
    }
  }
  else if ((*((_WORD *)v4 + 12) & 0x100) != 0)
  {
    goto LABEL_74;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0) {
      goto LABEL_74;
    }
    if (self->_mergeable)
    {
      if (!*((unsigned char *)v4 + 17)) {
        goto LABEL_74;
      }
    }
    else if (*((unsigned char *)v4 + 17))
    {
      goto LABEL_74;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_74;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0) {
      goto LABEL_74;
    }
    if (self->_holdAllowed)
    {
      if (!*((unsigned char *)v4 + 15)) {
        goto LABEL_74;
      }
    }
    else if (*((unsigned char *)v4 + 15))
    {
      goto LABEL_74;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_74;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0) {
      goto LABEL_74;
    }
    if (self->_addCallAllowed)
    {
      if (!*((unsigned char *)v4 + 12)) {
        goto LABEL_74;
      }
    }
    else if (*((unsigned char *)v4 + 12))
    {
      goto LABEL_74;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_74;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 12) & 0x200) == 0) {
      goto LABEL_74;
    }
    if (self->_takingCallsPrivateAllowed)
    {
      if (!*((unsigned char *)v4 + 20)) {
        goto LABEL_74;
      }
    }
    else if (*((unsigned char *)v4 + 20))
    {
      goto LABEL_74;
    }
  }
  else if ((*((_WORD *)v4 + 12) & 0x200) != 0)
  {
    goto LABEL_74;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0) {
      goto LABEL_74;
    }
    if (self->_hardPauseAvailable)
    {
      if (!*((unsigned char *)v4 + 14)) {
        goto LABEL_74;
      }
    }
    else if (*((unsigned char *)v4 + 14))
    {
      goto LABEL_74;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_74;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0) {
      goto LABEL_74;
    }
    if (self->_endAndAnswerAllowed)
    {
      if (!*((unsigned char *)v4 + 13)) {
        goto LABEL_74;
      }
    }
    else if (*((unsigned char *)v4 + 13))
    {
      goto LABEL_74;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_74;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0) {
      goto LABEL_74;
    }
    if (self->_holdAndAnswerAllowed)
    {
      if (!*((unsigned char *)v4 + 16)) {
        goto LABEL_74;
      }
    }
    else if (*((unsigned char *)v4 + 16))
    {
      goto LABEL_74;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_74;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) != 0)
    {
      if (self->_sendToVoicemailAllowed)
      {
        if (!*((unsigned char *)v4 + 18)) {
          goto LABEL_74;
        }
      }
      else if (*((unsigned char *)v4 + 18))
      {
        goto LABEL_74;
      }
      BOOL v7 = 1;
      goto LABEL_75;
    }
LABEL_74:
    BOOL v7 = 0;
    goto LABEL_75;
  }
  BOOL v7 = (v6 & 0x80) == 0;
LABEL_75:

  return v7;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    uint64_t v3 = 2654435761 * self->_ambiguityState;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_swappable;
      if ((has & 0x40) != 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_mergeable;
    if ((has & 0x10) != 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v5 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_holdAllowed;
    if ((has & 2) != 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v6 = 0;
  if ((has & 2) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_addCallAllowed;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v7 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_takingCallsPrivateAllowed;
    if ((has & 8) != 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v8 = 0;
  if ((has & 8) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_hardPauseAvailable;
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
    uint64_t v10 = 2654435761 * self->_endAndAnswerAllowed;
    if ((has & 0x20) != 0) {
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
  if ((has & 0x20) == 0) {
    goto LABEL_20;
  }
LABEL_10:
  uint64_t v11 = 2654435761 * self->_holdAndAnswerAllowed;
  if ((has & 0x80) == 0) {
    goto LABEL_21;
  }
LABEL_11:
  uint64_t v12 = 2654435761 * self->_sendToVoicemailAllowed;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 12);
  if (v5)
  {
    self->_ambiguityState = *((_DWORD *)v4 + 2);
    *(_WORD *)&self->_has |= 1u;
    __int16 v5 = *((_WORD *)v4 + 12);
    if ((v5 & 0x100) == 0)
    {
LABEL_3:
      if ((v5 & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*((_WORD *)v4 + 12) & 0x100) == 0)
  {
    goto LABEL_3;
  }
  self->_swappable = *((unsigned char *)v4 + 19);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 12);
  if ((v5 & 0x40) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_mergeable = *((unsigned char *)v4 + 17);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 12);
  if ((v5 & 0x10) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_holdAllowed = *((unsigned char *)v4 + 15);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 12);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_addCallAllowed = *((unsigned char *)v4 + 12);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 12);
  if ((v5 & 0x200) == 0)
  {
LABEL_7:
    if ((v5 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_takingCallsPrivateAllowed = *((unsigned char *)v4 + 20);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 12);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_hardPauseAvailable = *((unsigned char *)v4 + 14);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 12);
  if ((v5 & 4) == 0)
  {
LABEL_9:
    if ((v5 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_endAndAnswerAllowed = *((unsigned char *)v4 + 13);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 12);
  if ((v5 & 0x20) == 0)
  {
LABEL_10:
    if ((v5 & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_23:
  self->_holdAndAnswerAllowed = *((unsigned char *)v4 + 16);
  *(_WORD *)&self->_has |= 0x20u;
  if ((*((_WORD *)v4 + 12) & 0x80) != 0)
  {
LABEL_11:
    self->_sendToVoicemailAllowed = *((unsigned char *)v4 + 18);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_12:
}

- (unsigned)ambiguityState
{
  return self->_ambiguityState;
}

- (BOOL)swappable
{
  return self->_swappable;
}

- (BOOL)mergeable
{
  return self->_mergeable;
}

- (BOOL)holdAllowed
{
  return self->_holdAllowed;
}

- (BOOL)addCallAllowed
{
  return self->_addCallAllowed;
}

- (BOOL)takingCallsPrivateAllowed
{
  return self->_takingCallsPrivateAllowed;
}

- (BOOL)hardPauseAvailable
{
  return self->_hardPauseAvailable;
}

- (BOOL)endAndAnswerAllowed
{
  return self->_endAndAnswerAllowed;
}

- (BOOL)holdAndAnswerAllowed
{
  return self->_holdAndAnswerAllowed;
}

- (BOOL)sendToVoicemailAllowed
{
  return self->_sendToVoicemailAllowed;
}

@end