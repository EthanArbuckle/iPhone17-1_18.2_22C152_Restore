@interface AWDBiometricKitPassCodeChallengeAttempt
- (BOOL)hasAmbientLux;
- (BOOL)hasAttentionScore;
- (BOOL)hasDeviceOrientation;
- (BOOL)hasFaceDistance;
- (BOOL)hasHasOcclusion;
- (BOOL)hasMatchIdentityCount;
- (BOOL)hasMatchType;
- (BOOL)hasOcclusion;
- (BOOL)hasOverallTime;
- (BOOL)hasPasscodeChallengeResult;
- (BOOL)hasPasscodeChallengeTemplateUpdated;
- (BOOL)hasPpmAllocatedBudget;
- (BOOL)hasPpmRequestedBudget;
- (BOOL)hasSensorTemperature;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)passcodeChallengeResult;
- (BOOL)passcodeChallengeTemplateUpdated;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)ambientLux;
- (int)sensorTemperature;
- (unint64_t)hash;
- (unint64_t)overallTime;
- (unint64_t)timestamp;
- (unsigned)attentionScore;
- (unsigned)deviceOrientation;
- (unsigned)faceDistance;
- (unsigned)matchIdentityCount;
- (unsigned)matchType;
- (unsigned)ppmAllocatedBudget;
- (unsigned)ppmRequestedBudget;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAmbientLux:(int)a3;
- (void)setAttentionScore:(unsigned int)a3;
- (void)setDeviceOrientation:(unsigned int)a3;
- (void)setFaceDistance:(unsigned int)a3;
- (void)setHasAmbientLux:(BOOL)a3;
- (void)setHasAttentionScore:(BOOL)a3;
- (void)setHasDeviceOrientation:(BOOL)a3;
- (void)setHasFaceDistance:(BOOL)a3;
- (void)setHasHasOcclusion:(BOOL)a3;
- (void)setHasMatchIdentityCount:(BOOL)a3;
- (void)setHasMatchType:(BOOL)a3;
- (void)setHasOcclusion:(BOOL)a3;
- (void)setHasOverallTime:(BOOL)a3;
- (void)setHasPasscodeChallengeResult:(BOOL)a3;
- (void)setHasPasscodeChallengeTemplateUpdated:(BOOL)a3;
- (void)setHasPpmAllocatedBudget:(BOOL)a3;
- (void)setHasPpmRequestedBudget:(BOOL)a3;
- (void)setHasSensorTemperature:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setMatchIdentityCount:(unsigned int)a3;
- (void)setMatchType:(unsigned int)a3;
- (void)setOverallTime:(unint64_t)a3;
- (void)setPasscodeChallengeResult:(BOOL)a3;
- (void)setPasscodeChallengeTemplateUpdated:(BOOL)a3;
- (void)setPpmAllocatedBudget:(unsigned int)a3;
- (void)setPpmRequestedBudget:(unsigned int)a3;
- (void)setSensorTemperature:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDBiometricKitPassCodeChallengeAttempt

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setOverallTime:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_overallTime = a3;
}

- (void)setHasOverallTime:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasOverallTime
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setPasscodeChallengeResult:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_passcodeChallengeResult = a3;
}

- (void)setHasPasscodeChallengeResult:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasPasscodeChallengeResult
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setPasscodeChallengeTemplateUpdated:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_passcodeChallengeTemplateUpdated = a3;
}

- (void)setHasPasscodeChallengeTemplateUpdated:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasPasscodeChallengeTemplateUpdated
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setAmbientLux:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_ambientLux = a3;
}

- (void)setHasAmbientLux:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAmbientLux
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setSensorTemperature:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_sensorTemperature = a3;
}

- (void)setHasSensorTemperature:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSensorTemperature
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setFaceDistance:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_faceDistance = a3;
}

- (void)setHasFaceDistance:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasFaceDistance
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setAttentionScore:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_attentionScore = a3;
}

- (void)setHasAttentionScore:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasAttentionScore
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasOcclusion:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_hasOcclusion = a3;
}

- (void)setHasHasOcclusion:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasHasOcclusion
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setPpmRequestedBudget:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_ppmRequestedBudget = a3;
}

- (void)setHasPpmRequestedBudget:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasPpmRequestedBudget
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setPpmAllocatedBudget:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_ppmAllocatedBudget = a3;
}

- (void)setHasPpmAllocatedBudget:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasPpmAllocatedBudget
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setDeviceOrientation:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_deviceOrientation = a3;
}

- (void)setHasDeviceOrientation:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDeviceOrientation
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setMatchIdentityCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_matchIdentityCount = a3;
}

- (void)setHasMatchIdentityCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasMatchIdentityCount
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setMatchType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_matchType = a3;
}

- (void)setHasMatchType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasMatchType
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDBiometricKitPassCodeChallengeAttempt;
  v4 = [(AWDBiometricKitPassCodeChallengeAttempt *)&v8 description];
  v5 = [(AWDBiometricKitPassCodeChallengeAttempt *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    v7 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v7 forKey:@"timestamp"];

    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x1000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithUnsignedLongLong:self->_overallTime];
  [v3 setObject:v8 forKey:@"overallTime"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_4:
    if ((has & 0x2000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  v9 = [NSNumber numberWithBool:self->_passcodeChallengeResult];
  [v3 setObject:v9 forKey:@"passcodeChallengeResult"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  v10 = [NSNumber numberWithBool:self->_passcodeChallengeTemplateUpdated];
  [v3 setObject:v10 forKey:@"passcodeChallengeTemplateUpdated"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  v11 = [NSNumber numberWithInt:self->_ambientLux];
  [v3 setObject:v11 forKey:@"ambientLux"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  v12 = [NSNumber numberWithInt:self->_sensorTemperature];
  [v3 setObject:v12 forKey:@"sensorTemperature"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  v13 = [NSNumber numberWithUnsignedInt:self->_faceDistance];
  [v3 setObject:v13 forKey:@"faceDistance"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x800) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  v14 = [NSNumber numberWithUnsignedInt:self->_attentionScore];
  [v3 setObject:v14 forKey:@"attentionScore"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  v15 = [NSNumber numberWithBool:self->_hasOcclusion];
  [v3 setObject:v15 forKey:@"hasOcclusion"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  v16 = [NSNumber numberWithUnsignedInt:self->_ppmRequestedBudget];
  [v3 setObject:v16 forKey:@"ppmRequestedBudget"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  v17 = [NSNumber numberWithUnsignedInt:self->_ppmAllocatedBudget];
  [v3 setObject:v17 forKey:@"ppmAllocatedBudget"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  v18 = [NSNumber numberWithUnsignedInt:self->_deviceOrientation];
  [v3 setObject:v18 forKey:@"deviceOrientation"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_14:
    if ((has & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_31:
  v19 = [NSNumber numberWithUnsignedInt:self->_matchIdentityCount];
  [v3 setObject:v19 forKey:@"matchIdentityCount"];

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_15:
    v5 = [NSNumber numberWithUnsignedInt:self->_matchType];
    [v3 setObject:v5 forKey:@"matchType"];
  }
LABEL_16:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDBiometricKitPassCodeChallengeAttemptReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x1000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_4:
    if ((has & 0x2000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x800) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_14:
    if ((has & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
LABEL_15:
  }
    PBDataWriterWriteUint32Field();
LABEL_16:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_timestamp;
    *((_WORD *)v4 + 32) |= 2u;
    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x1000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[1] = self->_overallTime;
  *((_WORD *)v4 + 32) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_4:
    if ((has & 0x2000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((unsigned char *)v4 + 61) = self->_passcodeChallengeResult;
  *((_WORD *)v4 + 32) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((unsigned char *)v4 + 62) = self->_passcodeChallengeTemplateUpdated;
  *((_WORD *)v4 + 32) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v4 + 6) = self->_ambientLux;
  *((_WORD *)v4 + 32) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v4 + 14) = self->_sensorTemperature;
  *((_WORD *)v4 + 32) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v4 + 9) = self->_faceDistance;
  *((_WORD *)v4 + 32) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x800) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v4 + 7) = self->_attentionScore;
  *((_WORD *)v4 + 32) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((unsigned char *)v4 + 60) = self->_hasOcclusion;
  *((_WORD *)v4 + 32) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v4 + 13) = self->_ppmRequestedBudget;
  *((_WORD *)v4 + 32) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)v4 + 12) = self->_ppmAllocatedBudget;
  *((_WORD *)v4 + 32) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)v4 + 8) = self->_deviceOrientation;
  *((_WORD *)v4 + 32) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_14:
    if ((has & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_31:
  *((_DWORD *)v4 + 10) = self->_matchIdentityCount;
  *((_WORD *)v4 + 32) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_15:
    *((_DWORD *)v4 + 11) = self->_matchType;
    *((_WORD *)v4 + 32) |= 0x80u;
  }
LABEL_16:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)result + 2) = self->_timestamp;
    *((_WORD *)result + 32) |= 2u;
    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x1000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 1) = self->_overallTime;
  *((_WORD *)result + 32) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_4:
    if ((has & 0x2000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((unsigned char *)result + 61) = self->_passcodeChallengeResult;
  *((_WORD *)result + 32) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((unsigned char *)result + 62) = self->_passcodeChallengeTemplateUpdated;
  *((_WORD *)result + 32) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 6) = self->_ambientLux;
  *((_WORD *)result + 32) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 14) = self->_sensorTemperature;
  *((_WORD *)result + 32) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)result + 9) = self->_faceDistance;
  *((_WORD *)result + 32) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x800) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 7) = self->_attentionScore;
  *((_WORD *)result + 32) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((unsigned char *)result + 60) = self->_hasOcclusion;
  *((_WORD *)result + 32) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)result + 13) = self->_ppmRequestedBudget;
  *((_WORD *)result + 32) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)result + 12) = self->_ppmAllocatedBudget;
  *((_WORD *)result + 32) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)result + 8) = self->_deviceOrientation;
  *((_WORD *)result + 32) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_14:
    if ((has & 0x80) == 0) {
      return result;
    }
    goto LABEL_15;
  }
LABEL_29:
  *((_DWORD *)result + 10) = self->_matchIdentityCount;
  *((_WORD *)result + 32) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x80) == 0) {
    return result;
  }
LABEL_15:
  *((_DWORD *)result + 11) = self->_matchType;
  *((_WORD *)result + 32) |= 0x80u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_81;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 32);
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_timestamp != *((void *)v4 + 2)) {
      goto LABEL_81;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_81;
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_overallTime != *((void *)v4 + 1)) {
      goto LABEL_81;
    }
  }
  else if (v6)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x1000) == 0) {
      goto LABEL_81;
    }
    if (self->_passcodeChallengeResult)
    {
      if (!*((unsigned char *)v4 + 61)) {
        goto LABEL_81;
      }
    }
    else if (*((unsigned char *)v4 + 61))
    {
      goto LABEL_81;
    }
  }
  else if ((*((_WORD *)v4 + 32) & 0x1000) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x2000) == 0) {
      goto LABEL_81;
    }
    if (self->_passcodeChallengeTemplateUpdated)
    {
      if (!*((unsigned char *)v4 + 62)) {
        goto LABEL_81;
      }
    }
    else if (*((unsigned char *)v4 + 62))
    {
      goto LABEL_81;
    }
  }
  else if ((*((_WORD *)v4 + 32) & 0x2000) != 0)
  {
    goto LABEL_81;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_ambientLux != *((_DWORD *)v4 + 6)) {
      goto LABEL_81;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x400) == 0 || self->_sensorTemperature != *((_DWORD *)v4 + 14)) {
      goto LABEL_81;
    }
  }
  else if ((*((_WORD *)v4 + 32) & 0x400) != 0)
  {
    goto LABEL_81;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_faceDistance != *((_DWORD *)v4 + 9)) {
      goto LABEL_81;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_81;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_attentionScore != *((_DWORD *)v4 + 7)) {
      goto LABEL_81;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x800) != 0)
    {
      if (self->_hasOcclusion)
      {
        if (!*((unsigned char *)v4 + 60)) {
          goto LABEL_81;
        }
        goto LABEL_56;
      }
      if (!*((unsigned char *)v4 + 60)) {
        goto LABEL_56;
      }
    }
LABEL_81:
    BOOL v7 = 0;
    goto LABEL_82;
  }
  if ((*((_WORD *)v4 + 32) & 0x800) != 0) {
    goto LABEL_81;
  }
LABEL_56:
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x200) == 0 || self->_ppmRequestedBudget != *((_DWORD *)v4 + 13)) {
      goto LABEL_81;
    }
  }
  else if ((*((_WORD *)v4 + 32) & 0x200) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x100) == 0 || self->_ppmAllocatedBudget != *((_DWORD *)v4 + 12)) {
      goto LABEL_81;
    }
  }
  else if ((*((_WORD *)v4 + 32) & 0x100) != 0)
  {
    goto LABEL_81;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_deviceOrientation != *((_DWORD *)v4 + 8)) {
      goto LABEL_81;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_81;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_matchIdentityCount != *((_DWORD *)v4 + 10)) {
      goto LABEL_81;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_81;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_matchType != *((_DWORD *)v4 + 11)) {
      goto LABEL_81;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (v6 & 0x80) == 0;
  }
LABEL_82:

  return v7;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if (has)
    {
LABEL_3:
      unint64_t v4 = 2654435761u * self->_overallTime;
      if ((*(_WORD *)&self->_has & 0x1000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if (has) {
      goto LABEL_3;
    }
  }
  unint64_t v4 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_passcodeChallengeResult;
    if ((*(_WORD *)&self->_has & 0x2000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v5 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_passcodeChallengeTemplateUpdated;
    if ((has & 4) != 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v6 = 0;
  if ((has & 4) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_ambientLux;
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
    uint64_t v8 = 2654435761 * self->_sensorTemperature;
    if ((has & 0x20) != 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v8 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_faceDistance;
    if ((has & 8) != 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v9 = 0;
  if ((has & 8) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_attentionScore;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v10 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_hasOcclusion;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v11 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_11:
    uint64_t v12 = 2654435761 * self->_ppmRequestedBudget;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_12;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v12 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_12:
    uint64_t v13 = 2654435761 * self->_ppmAllocatedBudget;
    if ((has & 0x10) != 0) {
      goto LABEL_13;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v13 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_13:
    uint64_t v14 = 2654435761 * self->_deviceOrientation;
    if ((has & 0x40) != 0) {
      goto LABEL_14;
    }
LABEL_28:
    uint64_t v15 = 0;
    if ((has & 0x80) != 0) {
      goto LABEL_15;
    }
LABEL_29:
    uint64_t v16 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
  }
LABEL_27:
  uint64_t v14 = 0;
  if ((has & 0x40) == 0) {
    goto LABEL_28;
  }
LABEL_14:
  uint64_t v15 = 2654435761 * self->_matchIdentityCount;
  if ((has & 0x80) == 0) {
    goto LABEL_29;
  }
LABEL_15:
  uint64_t v16 = 2654435761 * self->_matchType;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 2) != 0)
  {
    self->_timestamp = *((void *)v4 + 2);
    *(_WORD *)&self->_has |= 2u;
    __int16 v5 = *((_WORD *)v4 + 32);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 0x1000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((v5 & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_overallTime = *((void *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x1000) == 0)
  {
LABEL_4:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_passcodeChallengeResult = *((unsigned char *)v4 + 61);
  *(_WORD *)&self->_has |= 0x1000u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x2000) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_passcodeChallengeTemplateUpdated = *((unsigned char *)v4 + 62);
  *(_WORD *)&self->_has |= 0x2000u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_ambientLux = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x400) == 0)
  {
LABEL_7:
    if ((v5 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_sensorTemperature = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x20) == 0)
  {
LABEL_8:
    if ((v5 & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_faceDistance = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 8) == 0)
  {
LABEL_9:
    if ((v5 & 0x800) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_attentionScore = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x800) == 0)
  {
LABEL_10:
    if ((v5 & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_hasOcclusion = *((unsigned char *)v4 + 60);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x200) == 0)
  {
LABEL_11:
    if ((v5 & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_ppmRequestedBudget = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x100) == 0)
  {
LABEL_12:
    if ((v5 & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_ppmAllocatedBudget = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x10) == 0)
  {
LABEL_13:
    if ((v5 & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_deviceOrientation = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x40) == 0)
  {
LABEL_14:
    if ((v5 & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_31:
  self->_matchIdentityCount = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)v4 + 32) & 0x80) != 0)
  {
LABEL_15:
    self->_matchType = *((_DWORD *)v4 + 11);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_16:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)overallTime
{
  return self->_overallTime;
}

- (BOOL)passcodeChallengeResult
{
  return self->_passcodeChallengeResult;
}

- (BOOL)passcodeChallengeTemplateUpdated
{
  return self->_passcodeChallengeTemplateUpdated;
}

- (int)ambientLux
{
  return self->_ambientLux;
}

- (int)sensorTemperature
{
  return self->_sensorTemperature;
}

- (unsigned)faceDistance
{
  return self->_faceDistance;
}

- (unsigned)attentionScore
{
  return self->_attentionScore;
}

- (BOOL)hasOcclusion
{
  return self->_hasOcclusion;
}

- (unsigned)ppmRequestedBudget
{
  return self->_ppmRequestedBudget;
}

- (unsigned)ppmAllocatedBudget
{
  return self->_ppmAllocatedBudget;
}

- (unsigned)deviceOrientation
{
  return self->_deviceOrientation;
}

- (unsigned)matchIdentityCount
{
  return self->_matchIdentityCount;
}

- (unsigned)matchType
{
  return self->_matchType;
}

@end