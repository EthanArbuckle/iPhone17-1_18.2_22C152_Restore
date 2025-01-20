@interface CDASchemaCDAScoreBoosters
- (BOOL)hasDeviceBoost;
- (BOOL)hasIsTrump;
- (BOOL)hasRecentAlarmBoost;
- (BOOL)hasRecentMotionBoost;
- (BOOL)hasRecentPlaybackBoost;
- (BOOL)hasRecentRaiseToWakeBoost;
- (BOOL)hasRecentSiriRequestBoost;
- (BOOL)hasRecentUnlockBoost;
- (BOOL)hasTrumpReason;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTrump;
- (BOOL)readFrom:(id)a3;
- (CDASchemaCDAScoreBoosters)initWithDictionary:(id)a3;
- (CDASchemaCDAScoreBoosters)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)trumpReason;
- (unint64_t)hash;
- (unsigned)deviceBoost;
- (unsigned)recentAlarmBoost;
- (unsigned)recentMotionBoost;
- (unsigned)recentPlaybackBoost;
- (unsigned)recentRaiseToWakeBoost;
- (unsigned)recentSiriRequestBoost;
- (unsigned)recentUnlockBoost;
- (void)deleteDeviceBoost;
- (void)deleteIsTrump;
- (void)deleteRecentAlarmBoost;
- (void)deleteRecentMotionBoost;
- (void)deleteRecentPlaybackBoost;
- (void)deleteRecentRaiseToWakeBoost;
- (void)deleteRecentSiriRequestBoost;
- (void)deleteRecentUnlockBoost;
- (void)deleteTrumpReason;
- (void)setDeviceBoost:(unsigned int)a3;
- (void)setHasDeviceBoost:(BOOL)a3;
- (void)setHasIsTrump:(BOOL)a3;
- (void)setHasRecentAlarmBoost:(BOOL)a3;
- (void)setHasRecentMotionBoost:(BOOL)a3;
- (void)setHasRecentPlaybackBoost:(BOOL)a3;
- (void)setHasRecentRaiseToWakeBoost:(BOOL)a3;
- (void)setHasRecentSiriRequestBoost:(BOOL)a3;
- (void)setHasRecentUnlockBoost:(BOOL)a3;
- (void)setHasTrumpReason:(BOOL)a3;
- (void)setIsTrump:(BOOL)a3;
- (void)setRecentAlarmBoost:(unsigned int)a3;
- (void)setRecentMotionBoost:(unsigned int)a3;
- (void)setRecentPlaybackBoost:(unsigned int)a3;
- (void)setRecentRaiseToWakeBoost:(unsigned int)a3;
- (void)setRecentSiriRequestBoost:(unsigned int)a3;
- (void)setRecentUnlockBoost:(unsigned int)a3;
- (void)setTrumpReason:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CDASchemaCDAScoreBoosters

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)recentAlarmBoost
{
  return self->_recentAlarmBoost;
}

- (int)trumpReason
{
  return self->_trumpReason;
}

- (BOOL)isTrump
{
  return self->_isTrump;
}

- (unsigned)recentPlaybackBoost
{
  return self->_recentPlaybackBoost;
}

- (unsigned)recentMotionBoost
{
  return self->_recentMotionBoost;
}

- (unsigned)recentSiriRequestBoost
{
  return self->_recentSiriRequestBoost;
}

- (unsigned)recentRaiseToWakeBoost
{
  return self->_recentRaiseToWakeBoost;
}

- (unsigned)recentUnlockBoost
{
  return self->_recentUnlockBoost;
}

- (unsigned)deviceBoost
{
  return self->_deviceBoost;
}

- (CDASchemaCDAScoreBoosters)initWithDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CDASchemaCDAScoreBoosters;
  v5 = [(CDASchemaCDAScoreBoosters *)&v20 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"deviceBoost"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDAScoreBoosters setDeviceBoost:](v5, "setDeviceBoost:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"recentUnlockBoost"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDAScoreBoosters setRecentUnlockBoost:](v5, "setRecentUnlockBoost:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"recentRaiseToWakeBoost"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDAScoreBoosters setRecentRaiseToWakeBoost:](v5, "setRecentRaiseToWakeBoost:", [v8 unsignedIntValue]);
    }
    v9 = objc_msgSend(v4, "objectForKeyedSubscript:", @"recentSiriRequestBoost", v8);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDAScoreBoosters setRecentSiriRequestBoost:](v5, "setRecentSiriRequestBoost:", [v9 unsignedIntValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"recentMotionBoost"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDAScoreBoosters setRecentMotionBoost:](v5, "setRecentMotionBoost:", [v10 unsignedIntValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"recentPlaybackBoost"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDAScoreBoosters setRecentPlaybackBoost:](v5, "setRecentPlaybackBoost:", [v11 unsignedIntValue]);
    }
    v19 = v7;
    v12 = [v4 objectForKeyedSubscript:@"isTrump"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDAScoreBoosters setIsTrump:](v5, "setIsTrump:", [v12 BOOLValue]);
    }
    v13 = v6;
    v14 = [v4 objectForKeyedSubscript:@"trumpReason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDAScoreBoosters setTrumpReason:](v5, "setTrumpReason:", [v14 intValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"recentAlarmBoost"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDAScoreBoosters setRecentAlarmBoost:](v5, "setRecentAlarmBoost:", [v15 unsignedIntValue]);
    }
    v16 = v5;
  }
  return v5;
}

- (CDASchemaCDAScoreBoosters)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CDASchemaCDAScoreBoosters *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CDASchemaCDAScoreBoosters *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CDASchemaCDAScoreBoosters deviceBoost](self, "deviceBoost"));
    [v3 setObject:v5 forKeyedSubscript:@"deviceBoost"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[CDASchemaCDAScoreBoosters isTrump](self, "isTrump"));
  [v3 setObject:v6 forKeyedSubscript:@"isTrump"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CDASchemaCDAScoreBoosters recentAlarmBoost](self, "recentAlarmBoost"));
  [v3 setObject:v7 forKeyedSubscript:@"recentAlarmBoost"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CDASchemaCDAScoreBoosters recentMotionBoost](self, "recentMotionBoost"));
  [v3 setObject:v8 forKeyedSubscript:@"recentMotionBoost"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CDASchemaCDAScoreBoosters recentPlaybackBoost](self, "recentPlaybackBoost"));
  [v3 setObject:v9 forKeyedSubscript:@"recentPlaybackBoost"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CDASchemaCDAScoreBoosters recentRaiseToWakeBoost](self, "recentRaiseToWakeBoost"));
  [v3 setObject:v10 forKeyedSubscript:@"recentRaiseToWakeBoost"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
LABEL_18:
    v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CDASchemaCDAScoreBoosters recentUnlockBoost](self, "recentUnlockBoost"));
    [v3 setObject:v12 forKeyedSubscript:@"recentUnlockBoost"];

    if ((*(_WORD *)&self->_has & 0x80) == 0) {
      goto LABEL_23;
    }
LABEL_19:
    unsigned int v13 = [(CDASchemaCDAScoreBoosters *)self trumpReason] - 1;
    if (v13 > 7) {
      v14 = @"CDATRUMPREASON_UNKNOWN";
    }
    else {
      v14 = off_1E5EAD0B0[v13];
    }
    [v3 setObject:v14 forKeyedSubscript:@"trumpReason"];
    goto LABEL_23;
  }
LABEL_17:
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CDASchemaCDAScoreBoosters recentSiriRequestBoost](self, "recentSiriRequestBoost"));
  [v3 setObject:v11 forKeyedSubscript:@"recentSiriRequestBoost"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_18;
  }
LABEL_9:
  if ((has & 0x80) != 0) {
    goto LABEL_19;
  }
LABEL_23:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    uint64_t v3 = 2654435761 * self->_deviceBoost;
    if ((has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_recentUnlockBoost;
      if ((has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_recentRaiseToWakeBoost;
    if ((has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v5 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_recentSiriRequestBoost;
    if ((has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v6 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_recentMotionBoost;
    if ((has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_recentPlaybackBoost;
    if ((has & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v8 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_isTrump;
    if ((has & 0x80) != 0) {
      goto LABEL_9;
    }
LABEL_18:
    uint64_t v10 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_10;
    }
LABEL_19:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
LABEL_17:
  uint64_t v9 = 0;
  if ((has & 0x80) == 0) {
    goto LABEL_18;
  }
LABEL_9:
  uint64_t v10 = 2654435761 * self->_trumpReason;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_19;
  }
LABEL_10:
  uint64_t v11 = 2654435761 * self->_recentAlarmBoost;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_38;
  }
  $7FDC7EBAFB6615D238A9123E7C98239A has = self->_has;
  unsigned int v6 = v4[22];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_38;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int deviceBoost = self->_deviceBoost;
    if (deviceBoost != [v4 deviceBoost]) {
      goto LABEL_38;
    }
    $7FDC7EBAFB6615D238A9123E7C98239A has = self->_has;
    unsigned int v6 = v4[22];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_38;
  }
  if (v8)
  {
    unsigned int recentUnlockBoost = self->_recentUnlockBoost;
    if (recentUnlockBoost != [v4 recentUnlockBoost]) {
      goto LABEL_38;
    }
    $7FDC7EBAFB6615D238A9123E7C98239A has = self->_has;
    unsigned int v6 = v4[22];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_38;
  }
  if (v10)
  {
    unsigned int recentRaiseToWakeBoost = self->_recentRaiseToWakeBoost;
    if (recentRaiseToWakeBoost != [v4 recentRaiseToWakeBoost]) {
      goto LABEL_38;
    }
    $7FDC7EBAFB6615D238A9123E7C98239A has = self->_has;
    unsigned int v6 = v4[22];
  }
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_38;
  }
  if (v12)
  {
    unsigned int recentSiriRequestBoost = self->_recentSiriRequestBoost;
    if (recentSiriRequestBoost != [v4 recentSiriRequestBoost]) {
      goto LABEL_38;
    }
    $7FDC7EBAFB6615D238A9123E7C98239A has = self->_has;
    unsigned int v6 = v4[22];
  }
  int v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_38;
  }
  if (v14)
  {
    unsigned int recentMotionBoost = self->_recentMotionBoost;
    if (recentMotionBoost != [v4 recentMotionBoost]) {
      goto LABEL_38;
    }
    $7FDC7EBAFB6615D238A9123E7C98239A has = self->_has;
    unsigned int v6 = v4[22];
  }
  int v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1)) {
    goto LABEL_38;
  }
  if (v16)
  {
    unsigned int recentPlaybackBoost = self->_recentPlaybackBoost;
    if (recentPlaybackBoost != [v4 recentPlaybackBoost]) {
      goto LABEL_38;
    }
    $7FDC7EBAFB6615D238A9123E7C98239A has = self->_has;
    unsigned int v6 = v4[22];
  }
  int v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1)) {
    goto LABEL_38;
  }
  if (v18)
  {
    int isTrump = self->_isTrump;
    if (isTrump != [v4 isTrump]) {
      goto LABEL_38;
    }
    $7FDC7EBAFB6615D238A9123E7C98239A has = self->_has;
    unsigned int v6 = v4[22];
  }
  int v20 = (*(unsigned int *)&has >> 7) & 1;
  if (v20 != ((v6 >> 7) & 1)) {
    goto LABEL_38;
  }
  if (v20)
  {
    int trumpReason = self->_trumpReason;
    if (trumpReason == [v4 trumpReason])
    {
      $7FDC7EBAFB6615D238A9123E7C98239A has = self->_has;
      unsigned int v6 = v4[22];
      goto LABEL_34;
    }
LABEL_38:
    BOOL v24 = 0;
    goto LABEL_39;
  }
LABEL_34:
  int v22 = (*(unsigned int *)&has >> 8) & 1;
  if (v22 != ((v6 >> 8) & 1)) {
    goto LABEL_38;
  }
  if (v22)
  {
    unsigned int recentAlarmBoost = self->_recentAlarmBoost;
    if (recentAlarmBoost != [v4 recentAlarmBoost]) {
      goto LABEL_38;
    }
  }
  BOOL v24 = 1;
LABEL_39:

  return v24;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
LABEL_10:
  }
    PBDataWriterWriteUint32Field();
LABEL_11:
}

- (BOOL)readFrom:(id)a3
{
  return CDASchemaCDAScoreBoostersReadFrom(self, (uint64_t)a3);
}

- (void)deleteRecentAlarmBoost
{
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setHasRecentAlarmBoost:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRecentAlarmBoost
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setRecentAlarmBoost:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_unsigned int recentAlarmBoost = a3;
}

- (void)deleteTrumpReason
{
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setHasTrumpReason:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasTrumpReason
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setTrumpReason:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_int trumpReason = a3;
}

- (void)deleteIsTrump
{
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setHasIsTrump:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasIsTrump
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setIsTrump:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_int isTrump = a3;
}

- (void)deleteRecentPlaybackBoost
{
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setHasRecentPlaybackBoost:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasRecentPlaybackBoost
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setRecentPlaybackBoost:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_unsigned int recentPlaybackBoost = a3;
}

- (void)deleteRecentMotionBoost
{
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setHasRecentMotionBoost:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasRecentMotionBoost
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setRecentMotionBoost:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_unsigned int recentMotionBoost = a3;
}

- (void)deleteRecentSiriRequestBoost
{
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setHasRecentSiriRequestBoost:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasRecentSiriRequestBoost
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setRecentSiriRequestBoost:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_unsigned int recentSiriRequestBoost = a3;
}

- (void)deleteRecentRaiseToWakeBoost
{
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setHasRecentRaiseToWakeBoost:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasRecentRaiseToWakeBoost
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setRecentRaiseToWakeBoost:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_unsigned int recentRaiseToWakeBoost = a3;
}

- (void)deleteRecentUnlockBoost
{
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setHasRecentUnlockBoost:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasRecentUnlockBoost
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setRecentUnlockBoost:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_unsigned int recentUnlockBoost = a3;
}

- (void)deleteDeviceBoost
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasDeviceBoost:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasDeviceBoost
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setDeviceBoost:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_unsigned int deviceBoost = a3;
}

@end