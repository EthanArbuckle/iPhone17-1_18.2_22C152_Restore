@interface AWDPairedSyncSyncReport
- (BOOL)hasActivityName;
- (BOOL)hasDefaultByteCount;
- (BOOL)hasGizmoBuild;
- (BOOL)hasGizmoHardware;
- (BOOL)hasIsAutomated;
- (BOOL)hasRecordCount;
- (BOOL)hasSawADropout;
- (BOOL)hasSyncByteCount;
- (BOOL)hasSyncDuration;
- (BOOL)hasSyncErrorCode;
- (BOOL)hasSyncType;
- (BOOL)hasTimeoutCount;
- (BOOL)hasTimestamp;
- (BOOL)hasUrgentByteCount;
- (BOOL)isAutomated;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)sawADropout;
- (NSString)activityName;
- (NSString)gizmoBuild;
- (NSString)gizmoHardware;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)syncDuration;
- (unint64_t)timestamp;
- (unsigned)defaultByteCount;
- (unsigned)recordCount;
- (unsigned)syncByteCount;
- (unsigned)syncErrorCode;
- (unsigned)syncType;
- (unsigned)timeoutCount;
- (unsigned)urgentByteCount;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setActivityName:(id)a3;
- (void)setDefaultByteCount:(unsigned int)a3;
- (void)setGizmoBuild:(id)a3;
- (void)setGizmoHardware:(id)a3;
- (void)setHasDefaultByteCount:(BOOL)a3;
- (void)setHasIsAutomated:(BOOL)a3;
- (void)setHasRecordCount:(BOOL)a3;
- (void)setHasSawADropout:(BOOL)a3;
- (void)setHasSyncByteCount:(BOOL)a3;
- (void)setHasSyncDuration:(BOOL)a3;
- (void)setHasSyncErrorCode:(BOOL)a3;
- (void)setHasSyncType:(BOOL)a3;
- (void)setHasTimeoutCount:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasUrgentByteCount:(BOOL)a3;
- (void)setIsAutomated:(BOOL)a3;
- (void)setRecordCount:(unsigned int)a3;
- (void)setSawADropout:(BOOL)a3;
- (void)setSyncByteCount:(unsigned int)a3;
- (void)setSyncDuration:(unint64_t)a3;
- (void)setSyncErrorCode:(unsigned int)a3;
- (void)setSyncType:(unsigned int)a3;
- (void)setTimeoutCount:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUrgentByteCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDPairedSyncSyncReport

- (void)dealloc
{
  [(AWDPairedSyncSyncReport *)self setGizmoBuild:0];
  [(AWDPairedSyncSyncReport *)self setGizmoHardware:0];
  [(AWDPairedSyncSyncReport *)self setActivityName:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDPairedSyncSyncReport;
  [(AWDPairedSyncSyncReport *)&v3 dealloc];
}

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

- (void)setIsAutomated:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_isAutomated = a3;
}

- (void)setHasIsAutomated:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasIsAutomated
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (BOOL)hasGizmoBuild
{
  return self->_gizmoBuild != 0;
}

- (BOOL)hasGizmoHardware
{
  return self->_gizmoHardware != 0;
}

- (void)setSyncDuration:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_syncDuration = a3;
}

- (void)setHasSyncDuration:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasSyncDuration
{
  return *(_WORD *)&self->_has & 1;
}

- (BOOL)hasActivityName
{
  return self->_activityName != 0;
}

- (void)setSyncErrorCode:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_syncErrorCode = a3;
}

- (void)setHasSyncErrorCode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasSyncErrorCode
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setTimeoutCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_timeoutCount = a3;
}

- (void)setHasTimeoutCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasTimeoutCount
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setSyncType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_syncType = a3;
}

- (void)setHasSyncType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasSyncType
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setRecordCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_recordCount = a3;
}

- (void)setHasRecordCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasRecordCount
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setSyncByteCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_syncByteCount = a3;
}

- (void)setHasSyncByteCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasSyncByteCount
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setDefaultByteCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_defaultByteCount = a3;
}

- (void)setHasDefaultByteCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasDefaultByteCount
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setUrgentByteCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_urgentByteCount = a3;
}

- (void)setHasUrgentByteCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasUrgentByteCount
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setSawADropout:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_sawADropout = a3;
}

- (void)setHasSawADropout:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSawADropout
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDPairedSyncSyncReport;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDPairedSyncSyncReport description](&v3, sel_description), -[AWDPairedSyncSyncReport dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x200) != 0) {
    [v3 setObject:[NSNumber numberWithBool:self->_isAutomated] forKey:@"isAutomated"];
  }
  gizmoBuild = self->_gizmoBuild;
  if (gizmoBuild) {
    [v3 setObject:gizmoBuild forKey:@"gizmoBuild"];
  }
  gizmoHardware = self->_gizmoHardware;
  if (gizmoHardware) {
    [v3 setObject:gizmoHardware forKey:@"gizmoHardware"];
  }
  if (*(_WORD *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_syncDuration] forKey:@"syncDuration"];
  }
  activityName = self->_activityName;
  if (activityName) {
    [v3 setObject:activityName forKey:@"activityName"];
  }
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x20) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_syncErrorCode] forKey:@"syncErrorCode"];
    __int16 v8 = (__int16)self->_has;
    if ((v8 & 0x80) == 0)
    {
LABEL_15:
      if ((v8 & 0x40) == 0) {
        goto LABEL_16;
      }
      goto LABEL_25;
    }
  }
  else if ((v8 & 0x80) == 0)
  {
    goto LABEL_15;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_timeoutCount] forKey:@"timeoutCount"];
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x40) == 0)
  {
LABEL_16:
    if ((v8 & 8) == 0) {
      goto LABEL_17;
    }
    goto LABEL_26;
  }
LABEL_25:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_syncType] forKey:@"syncType"];
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 8) == 0)
  {
LABEL_17:
    if ((v8 & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_27;
  }
LABEL_26:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_recordCount] forKey:@"recordCount"];
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x10) == 0)
  {
LABEL_18:
    if ((v8 & 4) == 0) {
      goto LABEL_19;
    }
    goto LABEL_28;
  }
LABEL_27:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_syncByteCount] forKey:@"syncByteCount"];
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 4) == 0)
  {
LABEL_19:
    if ((v8 & 0x100) == 0) {
      goto LABEL_20;
    }
LABEL_29:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_urgentByteCount] forKey:@"urgentByteCount"];
    if ((*(_WORD *)&self->_has & 0x400) == 0) {
      return v3;
    }
    goto LABEL_21;
  }
LABEL_28:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_defaultByteCount] forKey:@"defaultByteCount"];
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x100) != 0) {
    goto LABEL_29;
  }
LABEL_20:
  if ((v8 & 0x400) != 0) {
LABEL_21:
  }
    [v3 setObject:[NSNumber numberWithBool:self->_sawADropout] forKey:@"sawADropout"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDPairedSyncSyncReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x200) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_gizmoBuild) {
    PBDataWriterWriteStringField();
  }
  if (self->_gizmoHardware) {
    PBDataWriterWriteStringField();
  }
  if (*(_WORD *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_activityName) {
    PBDataWriterWriteStringField();
  }
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 v5 = (__int16)self->_has;
    if ((v5 & 0x80) == 0)
    {
LABEL_15:
      if ((v5 & 0x40) == 0) {
        goto LABEL_16;
      }
      goto LABEL_24;
    }
  }
  else if ((v5 & 0x80) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteUint32Field();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x40) == 0)
  {
LABEL_16:
    if ((v5 & 8) == 0) {
      goto LABEL_17;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 8) == 0)
  {
LABEL_17:
    if ((v5 & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x10) == 0)
  {
LABEL_18:
    if ((v5 & 4) == 0) {
      goto LABEL_19;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 4) == 0)
  {
LABEL_19:
    if ((v5 & 0x100) == 0) {
      goto LABEL_20;
    }
LABEL_28:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_has & 0x400) == 0) {
      return;
    }
    goto LABEL_29;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x100) != 0) {
    goto LABEL_28;
  }
LABEL_20:
  if ((v5 & 0x400) == 0) {
    return;
  }
LABEL_29:

  PBDataWriterWriteBOOLField();
}

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)a3 + 2) = self->_timestamp;
    *((_WORD *)a3 + 42) |= 2u;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x200) != 0)
  {
    *((unsigned char *)a3 + 80) = self->_isAutomated;
    *((_WORD *)a3 + 42) |= 0x200u;
  }
  if (self->_gizmoBuild) {
    [a3 setGizmoBuild:];
  }
  if (self->_gizmoHardware) {
    [a3 setGizmoHardware:];
  }
  if (*(_WORD *)&self->_has)
  {
    *((void *)a3 + 1) = self->_syncDuration;
    *((_WORD *)a3 + 42) |= 1u;
  }
  if (self->_activityName) {
    [a3 setActivityName:];
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x20) != 0)
  {
    *((_DWORD *)a3 + 16) = self->_syncErrorCode;
    *((_WORD *)a3 + 42) |= 0x20u;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x80) == 0)
    {
LABEL_15:
      if ((v6 & 0x40) == 0) {
        goto LABEL_16;
      }
      goto LABEL_25;
    }
  }
  else if ((v6 & 0x80) == 0)
  {
    goto LABEL_15;
  }
  *((_DWORD *)a3 + 18) = self->_timeoutCount;
  *((_WORD *)a3 + 42) |= 0x80u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x40) == 0)
  {
LABEL_16:
    if ((v6 & 8) == 0) {
      goto LABEL_17;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)a3 + 17) = self->_syncType;
  *((_WORD *)a3 + 42) |= 0x40u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 8) == 0)
  {
LABEL_17:
    if ((v6 & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)a3 + 14) = self->_recordCount;
  *((_WORD *)a3 + 42) |= 8u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x10) == 0)
  {
LABEL_18:
    if ((v6 & 4) == 0) {
      goto LABEL_19;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)a3 + 15) = self->_syncByteCount;
  *((_WORD *)a3 + 42) |= 0x10u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 4) == 0)
  {
LABEL_19:
    if ((v6 & 0x100) == 0) {
      goto LABEL_20;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)a3 + 8) = self->_defaultByteCount;
  *((_WORD *)a3 + 42) |= 4u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x100) == 0)
  {
LABEL_20:
    if ((v6 & 0x400) == 0) {
      return;
    }
    goto LABEL_21;
  }
LABEL_29:
  *((_DWORD *)a3 + 19) = self->_urgentByteCount;
  *((_WORD *)a3 + 42) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x400) == 0) {
    return;
  }
LABEL_21:
  *((unsigned char *)a3 + 81) = self->_sawADropout;
  *((_WORD *)a3 + 42) |= 0x400u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_timestamp;
    *(_WORD *)(v5 + 84) |= 2u;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x200) != 0)
  {
    *(unsigned char *)(v5 + 80) = self->_isAutomated;
    *(_WORD *)(v5 + 84) |= 0x200u;
  }

  *(void *)(v6 + 40) = [(NSString *)self->_gizmoBuild copyWithZone:a3];
  *(void *)(v6 + 48) = [(NSString *)self->_gizmoHardware copyWithZone:a3];
  if (*(_WORD *)&self->_has)
  {
    *(void *)(v6 + 8) = self->_syncDuration;
    *(_WORD *)(v6 + 84) |= 1u;
  }

  *(void *)(v6 + 24) = [(NSString *)self->_activityName copyWithZone:a3];
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 64) = self->_syncErrorCode;
    *(_WORD *)(v6 + 84) |= 0x20u;
    __int16 v8 = (__int16)self->_has;
    if ((v8 & 0x80) == 0)
    {
LABEL_9:
      if ((v8 & 0x40) == 0) {
        goto LABEL_10;
      }
      goto LABEL_19;
    }
  }
  else if ((v8 & 0x80) == 0)
  {
    goto LABEL_9;
  }
  *(_DWORD *)(v6 + 72) = self->_timeoutCount;
  *(_WORD *)(v6 + 84) |= 0x80u;
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x40) == 0)
  {
LABEL_10:
    if ((v8 & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_20;
  }
LABEL_19:
  *(_DWORD *)(v6 + 68) = self->_syncType;
  *(_WORD *)(v6 + 84) |= 0x40u;
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 8) == 0)
  {
LABEL_11:
    if ((v8 & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_21;
  }
LABEL_20:
  *(_DWORD *)(v6 + 56) = self->_recordCount;
  *(_WORD *)(v6 + 84) |= 8u;
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x10) == 0)
  {
LABEL_12:
    if ((v8 & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_22;
  }
LABEL_21:
  *(_DWORD *)(v6 + 60) = self->_syncByteCount;
  *(_WORD *)(v6 + 84) |= 0x10u;
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 4) == 0)
  {
LABEL_13:
    if ((v8 & 0x100) == 0) {
      goto LABEL_14;
    }
LABEL_23:
    *(_DWORD *)(v6 + 76) = self->_urgentByteCount;
    *(_WORD *)(v6 + 84) |= 0x100u;
    if ((*(_WORD *)&self->_has & 0x400) == 0) {
      return (id)v6;
    }
    goto LABEL_15;
  }
LABEL_22:
  *(_DWORD *)(v6 + 32) = self->_defaultByteCount;
  *(_WORD *)(v6 + 84) |= 4u;
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x100) != 0) {
    goto LABEL_23;
  }
LABEL_14:
  if ((v8 & 0x400) != 0)
  {
LABEL_15:
    *(unsigned char *)(v6 + 81) = self->_sawADropout;
    *(_WORD *)(v6 + 84) |= 0x400u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    __int16 v6 = *((_WORD *)a3 + 42);
    if ((*(_WORD *)&self->_has & 2) != 0)
    {
      if ((v6 & 2) == 0 || self->_timestamp != *((void *)a3 + 2)) {
        goto LABEL_11;
      }
    }
    else if ((v6 & 2) != 0)
    {
      goto LABEL_11;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 42) & 0x200) == 0) {
        goto LABEL_11;
      }
      if (self->_isAutomated)
      {
        if (!*((unsigned char *)a3 + 80)) {
          goto LABEL_11;
        }
      }
      else if (*((unsigned char *)a3 + 80))
      {
        goto LABEL_11;
      }
    }
    else if ((*((_WORD *)a3 + 42) & 0x200) != 0)
    {
      goto LABEL_11;
    }
    gizmoBuild = self->_gizmoBuild;
    if (!((unint64_t)gizmoBuild | *((void *)a3 + 5))
      || (int v5 = -[NSString isEqual:](gizmoBuild, "isEqual:")) != 0)
    {
      gizmoHardware = self->_gizmoHardware;
      if (!((unint64_t)gizmoHardware | *((void *)a3 + 6))
        || (int v5 = -[NSString isEqual:](gizmoHardware, "isEqual:")) != 0)
      {
        __int16 has = (__int16)self->_has;
        __int16 v10 = *((_WORD *)a3 + 42);
        if (has)
        {
          if ((v10 & 1) == 0 || self->_syncDuration != *((void *)a3 + 1)) {
            goto LABEL_11;
          }
        }
        else if (v10)
        {
          goto LABEL_11;
        }
        activityName = self->_activityName;
        if ((unint64_t)activityName | *((void *)a3 + 3))
        {
          int v5 = -[NSString isEqual:](activityName, "isEqual:");
          if (!v5) {
            return v5;
          }
          __int16 has = (__int16)self->_has;
        }
        __int16 v12 = *((_WORD *)a3 + 42);
        if ((has & 0x20) != 0)
        {
          if ((v12 & 0x20) == 0 || self->_syncErrorCode != *((_DWORD *)a3 + 16)) {
            goto LABEL_11;
          }
        }
        else if ((v12 & 0x20) != 0)
        {
          goto LABEL_11;
        }
        if ((has & 0x80) != 0)
        {
          if ((v12 & 0x80) == 0 || self->_timeoutCount != *((_DWORD *)a3 + 18)) {
            goto LABEL_11;
          }
        }
        else if ((v12 & 0x80) != 0)
        {
          goto LABEL_11;
        }
        if ((has & 0x40) != 0)
        {
          if ((v12 & 0x40) == 0 || self->_syncType != *((_DWORD *)a3 + 17)) {
            goto LABEL_11;
          }
        }
        else if ((v12 & 0x40) != 0)
        {
          goto LABEL_11;
        }
        if ((has & 8) != 0)
        {
          if ((v12 & 8) == 0 || self->_recordCount != *((_DWORD *)a3 + 14)) {
            goto LABEL_11;
          }
        }
        else if ((v12 & 8) != 0)
        {
          goto LABEL_11;
        }
        if ((has & 0x10) != 0)
        {
          if ((v12 & 0x10) == 0 || self->_syncByteCount != *((_DWORD *)a3 + 15)) {
            goto LABEL_11;
          }
        }
        else if ((v12 & 0x10) != 0)
        {
          goto LABEL_11;
        }
        if ((has & 4) != 0)
        {
          if ((v12 & 4) == 0 || self->_defaultByteCount != *((_DWORD *)a3 + 8)) {
            goto LABEL_11;
          }
        }
        else if ((v12 & 4) != 0)
        {
          goto LABEL_11;
        }
        if ((has & 0x100) != 0)
        {
          if ((*((_WORD *)a3 + 42) & 0x100) == 0 || self->_urgentByteCount != *((_DWORD *)a3 + 19)) {
            goto LABEL_11;
          }
        }
        else if ((*((_WORD *)a3 + 42) & 0x100) != 0)
        {
          goto LABEL_11;
        }
        LOBYTE(v5) = (v12 & 0x400) == 0;
        if ((has & 0x400) == 0) {
          return v5;
        }
        if ((*((_WORD *)a3 + 42) & 0x400) == 0) {
          goto LABEL_11;
        }
        if (self->_sawADropout)
        {
          if (!*((unsigned char *)a3 + 81)) {
            goto LABEL_11;
          }
          goto LABEL_70;
        }
        if (!*((unsigned char *)a3 + 81))
        {
LABEL_70:
          LOBYTE(v5) = 1;
          return v5;
        }
LABEL_11:
        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_isAutomated;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_gizmoBuild hash];
  NSUInteger v6 = [(NSString *)self->_gizmoHardware hash];
  if (*(_WORD *)&self->_has) {
    unint64_t v7 = 2654435761u * self->_syncDuration;
  }
  else {
    unint64_t v7 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_activityName hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    uint64_t v10 = 2654435761 * self->_syncErrorCode;
    if ((has & 0x80) != 0)
    {
LABEL_11:
      uint64_t v11 = 2654435761 * self->_timeoutCount;
      if ((has & 0x40) != 0) {
        goto LABEL_12;
      }
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v10 = 0;
    if ((has & 0x80) != 0) {
      goto LABEL_11;
    }
  }
  uint64_t v11 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_12:
    uint64_t v12 = 2654435761 * self->_syncType;
    if ((has & 8) != 0) {
      goto LABEL_13;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v12 = 0;
  if ((has & 8) != 0)
  {
LABEL_13:
    uint64_t v13 = 2654435761 * self->_recordCount;
    if ((has & 0x10) != 0) {
      goto LABEL_14;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v13 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_14:
    uint64_t v14 = 2654435761 * self->_syncByteCount;
    if ((has & 4) != 0) {
      goto LABEL_15;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v14 = 0;
  if ((has & 4) != 0)
  {
LABEL_15:
    uint64_t v15 = 2654435761 * self->_defaultByteCount;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_16;
    }
LABEL_24:
    uint64_t v16 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_17;
    }
LABEL_25:
    uint64_t v17 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
  }
LABEL_23:
  uint64_t v15 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_24;
  }
LABEL_16:
  uint64_t v16 = 2654435761 * self->_urgentByteCount;
  if ((*(_WORD *)&self->_has & 0x400) == 0) {
    goto LABEL_25;
  }
LABEL_17:
  uint64_t v17 = 2654435761 * self->_sawADropout;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  __int16 v5 = *((_WORD *)a3 + 42);
  if ((v5 & 2) != 0)
  {
    self->_timestamp = *((void *)a3 + 2);
    *(_WORD *)&self->_has |= 2u;
    __int16 v5 = *((_WORD *)a3 + 42);
  }
  if ((v5 & 0x200) != 0)
  {
    self->_isAutomated = *((unsigned char *)a3 + 80);
    *(_WORD *)&self->_has |= 0x200u;
  }
  if (*((void *)a3 + 5)) {
    -[AWDPairedSyncSyncReport setGizmoBuild:](self, "setGizmoBuild:");
  }
  if (*((void *)a3 + 6)) {
    -[AWDPairedSyncSyncReport setGizmoHardware:](self, "setGizmoHardware:");
  }
  if (*((_WORD *)a3 + 42))
  {
    self->_syncDuration = *((void *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 3)) {
    -[AWDPairedSyncSyncReport setActivityName:](self, "setActivityName:");
  }
  __int16 v6 = *((_WORD *)a3 + 42);
  if ((v6 & 0x20) != 0)
  {
    self->_syncErrorCode = *((_DWORD *)a3 + 16);
    *(_WORD *)&self->_has |= 0x20u;
    __int16 v6 = *((_WORD *)a3 + 42);
    if ((v6 & 0x80) == 0)
    {
LABEL_15:
      if ((v6 & 0x40) == 0) {
        goto LABEL_16;
      }
      goto LABEL_25;
    }
  }
  else if ((v6 & 0x80) == 0)
  {
    goto LABEL_15;
  }
  self->_timeoutCount = *((_DWORD *)a3 + 18);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v6 = *((_WORD *)a3 + 42);
  if ((v6 & 0x40) == 0)
  {
LABEL_16:
    if ((v6 & 8) == 0) {
      goto LABEL_17;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_syncType = *((_DWORD *)a3 + 17);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v6 = *((_WORD *)a3 + 42);
  if ((v6 & 8) == 0)
  {
LABEL_17:
    if ((v6 & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_recordCount = *((_DWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 8u;
  __int16 v6 = *((_WORD *)a3 + 42);
  if ((v6 & 0x10) == 0)
  {
LABEL_18:
    if ((v6 & 4) == 0) {
      goto LABEL_19;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_syncByteCount = *((_DWORD *)a3 + 15);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v6 = *((_WORD *)a3 + 42);
  if ((v6 & 4) == 0)
  {
LABEL_19:
    if ((v6 & 0x100) == 0) {
      goto LABEL_20;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_defaultByteCount = *((_DWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 4u;
  __int16 v6 = *((_WORD *)a3 + 42);
  if ((v6 & 0x100) == 0)
  {
LABEL_20:
    if ((v6 & 0x400) == 0) {
      return;
    }
    goto LABEL_21;
  }
LABEL_29:
  self->_urgentByteCount = *((_DWORD *)a3 + 19);
  *(_WORD *)&self->_has |= 0x100u;
  if ((*((_WORD *)a3 + 42) & 0x400) == 0) {
    return;
  }
LABEL_21:
  self->_sawADropout = *((unsigned char *)a3 + 81);
  *(_WORD *)&self->_has |= 0x400u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)isAutomated
{
  return self->_isAutomated;
}

- (NSString)gizmoBuild
{
  return self->_gizmoBuild;
}

- (void)setGizmoBuild:(id)a3
{
}

- (NSString)gizmoHardware
{
  return self->_gizmoHardware;
}

- (void)setGizmoHardware:(id)a3
{
}

- (unint64_t)syncDuration
{
  return self->_syncDuration;
}

- (NSString)activityName
{
  return self->_activityName;
}

- (void)setActivityName:(id)a3
{
}

- (unsigned)syncErrorCode
{
  return self->_syncErrorCode;
}

- (unsigned)timeoutCount
{
  return self->_timeoutCount;
}

- (unsigned)syncType
{
  return self->_syncType;
}

- (unsigned)recordCount
{
  return self->_recordCount;
}

- (unsigned)syncByteCount
{
  return self->_syncByteCount;
}

- (unsigned)defaultByteCount
{
  return self->_defaultByteCount;
}

- (unsigned)urgentByteCount
{
  return self->_urgentByteCount;
}

- (BOOL)sawADropout
{
  return self->_sawADropout;
}

@end