@interface AWDCoreRoutineFMCDailyAssessment
- (BOOL)hasAssistances;
- (BOOL)hasAssistedParkingEvents;
- (BOOL)hasDuration;
- (BOOL)hasEngagedParkingEvents;
- (BOOL)hasEngagements;
- (BOOL)hasLocationType;
- (BOOL)hasParkingEvents;
- (BOOL)hasSuppressedParkingEvents;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)assistances;
- (int)assistedParkingEvents;
- (int)duration;
- (int)engagedParkingEvents;
- (int)engagements;
- (int)locationType;
- (int)parkingEvents;
- (int)suppressedParkingEvents;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssistances:(int)a3;
- (void)setAssistedParkingEvents:(int)a3;
- (void)setDuration:(int)a3;
- (void)setEngagedParkingEvents:(int)a3;
- (void)setEngagements:(int)a3;
- (void)setHasAssistances:(BOOL)a3;
- (void)setHasAssistedParkingEvents:(BOOL)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasEngagedParkingEvents:(BOOL)a3;
- (void)setHasEngagements:(BOOL)a3;
- (void)setHasLocationType:(BOOL)a3;
- (void)setHasParkingEvents:(BOOL)a3;
- (void)setHasSuppressedParkingEvents:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setLocationType:(int)a3;
- (void)setParkingEvents:(int)a3;
- (void)setSuppressedParkingEvents:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutineFMCDailyAssessment

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

- (void)setDuration:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDuration
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setParkingEvents:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_parkingEvents = a3;
}

- (void)setHasParkingEvents:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasParkingEvents
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setEngagedParkingEvents:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_engagedParkingEvents = a3;
}

- (void)setHasEngagedParkingEvents:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasEngagedParkingEvents
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setAssistedParkingEvents:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_assistedParkingEvents = a3;
}

- (void)setHasAssistedParkingEvents:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAssistedParkingEvents
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setEngagements:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_engagements = a3;
}

- (void)setHasEngagements:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasEngagements
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setAssistances:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_assistances = a3;
}

- (void)setHasAssistances:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAssistances
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setSuppressedParkingEvents:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_suppressedParkingEvents = a3;
}

- (void)setHasSuppressedParkingEvents:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSuppressedParkingEvents
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setLocationType:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_locationType = a3;
}

- (void)setHasLocationType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasLocationType
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineFMCDailyAssessment;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutineFMCDailyAssessment description](&v3, sel_description), -[AWDCoreRoutineFMCDailyAssessment dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithInt:self->_duration] forKey:@"duration"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  [v3 setObject:[NSNumber numberWithInt:self->_parkingEvents] forKey:@"parkingEvents"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  [v3 setObject:[NSNumber numberWithInt:self->_engagedParkingEvents] forKey:@"engagedParkingEvents"];
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  [v3 setObject:[NSNumber numberWithInt:self->_assistedParkingEvents] forKey:@"assistedParkingEvents"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  [v3 setObject:[NSNumber numberWithInt:self->_engagements] forKey:@"engagements"];
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x100) == 0) {
      goto LABEL_9;
    }
LABEL_19:
    [v3 setObject:[NSNumber numberWithInt:self->_suppressedParkingEvents] forKey:@"suppressedParkingEvents"];
    if ((*(_WORD *)&self->_has & 0x40) == 0) {
      return v3;
    }
    goto LABEL_10;
  }
LABEL_18:
  [v3 setObject:[NSNumber numberWithInt:self->_assistances] forKey:@"assistances"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0) {
    goto LABEL_19;
  }
LABEL_9:
  if ((has & 0x40) != 0) {
LABEL_10:
  }
    [v3 setObject:[NSNumber numberWithInt:self->_locationType] forKey:@"locationType"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineFMCDailyAssessmentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x100) == 0) {
      goto LABEL_9;
    }
LABEL_18:
    PBDataWriterWriteInt32Field();
    if ((*(_WORD *)&self->_has & 0x40) == 0) {
      return;
    }
    goto LABEL_19;
  }
LABEL_17:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0) {
    goto LABEL_18;
  }
LABEL_9:
  if ((has & 0x40) == 0) {
    return;
  }
LABEL_19:

  PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((_WORD *)a3 + 24) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 6) = self->_duration;
  *((_WORD *)a3 + 24) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)a3 + 10) = self->_parkingEvents;
  *((_WORD *)a3 + 24) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)a3 + 7) = self->_engagedParkingEvents;
  *((_WORD *)a3 + 24) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)a3 + 5) = self->_assistedParkingEvents;
  *((_WORD *)a3 + 24) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)a3 + 8) = self->_engagements;
  *((_WORD *)a3 + 24) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)a3 + 4) = self->_assistances;
  *((_WORD *)a3 + 24) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      return;
    }
LABEL_19:
    *((_DWORD *)a3 + 9) = self->_locationType;
    *((_WORD *)a3 + 24) |= 0x40u;
    return;
  }
LABEL_18:
  *((_DWORD *)a3 + 11) = self->_suppressedParkingEvents;
  *((_WORD *)a3 + 24) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    goto LABEL_19;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((_WORD *)result + 24) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 6) = self->_duration;
  *((_WORD *)result + 24) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 10) = self->_parkingEvents;
  *((_WORD *)result + 24) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 7) = self->_engagedParkingEvents;
  *((_WORD *)result + 24) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 5) = self->_assistedParkingEvents;
  *((_WORD *)result + 24) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 8) = self->_engagements;
  *((_WORD *)result + 24) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 4) = self->_assistances;
  *((_WORD *)result + 24) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      return result;
    }
    goto LABEL_10;
  }
LABEL_19:
  *((_DWORD *)result + 11) = self->_suppressedParkingEvents;
  *((_WORD *)result + 24) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x40) == 0) {
    return result;
  }
LABEL_10:
  *((_DWORD *)result + 9) = self->_locationType;
  *((_WORD *)result + 24) |= 0x40u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    __int16 has = (__int16)self->_has;
    __int16 v7 = *((_WORD *)a3 + 24);
    if (has)
    {
      if ((v7 & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_46;
      }
    }
    else if (v7)
    {
LABEL_46:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_duration != *((_DWORD *)a3 + 6)) {
        goto LABEL_46;
      }
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_46;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_parkingEvents != *((_DWORD *)a3 + 10)) {
        goto LABEL_46;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_46;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_engagedParkingEvents != *((_DWORD *)a3 + 7)) {
        goto LABEL_46;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_46;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_assistedParkingEvents != *((_DWORD *)a3 + 5)) {
        goto LABEL_46;
      }
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_46;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_engagements != *((_DWORD *)a3 + 8)) {
        goto LABEL_46;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_46;
    }
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_assistances != *((_DWORD *)a3 + 4)) {
        goto LABEL_46;
      }
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_46;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 24) & 0x100) == 0 || self->_suppressedParkingEvents != *((_DWORD *)a3 + 11)) {
        goto LABEL_46;
      }
    }
    else if ((*((_WORD *)a3 + 24) & 0x100) != 0)
    {
      goto LABEL_46;
    }
    LOBYTE(v5) = (v7 & 0x40) == 0;
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_locationType != *((_DWORD *)a3 + 9)) {
        goto LABEL_46;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((has & 8) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_duration;
      if ((has & 0x80) != 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_parkingEvents;
    if ((has & 0x10) != 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v5 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_engagedParkingEvents;
    if ((has & 4) != 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v6 = 0;
  if ((has & 4) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_assistedParkingEvents;
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
    uint64_t v8 = 2654435761 * self->_engagements;
    if ((has & 2) != 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v8 = 0;
  if ((has & 2) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_assistances;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_9;
    }
LABEL_18:
    uint64_t v10 = 0;
    if ((has & 0x40) != 0) {
      goto LABEL_10;
    }
LABEL_19:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
LABEL_17:
  uint64_t v9 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_18;
  }
LABEL_9:
  uint64_t v10 = 2654435761 * self->_suppressedParkingEvents;
  if ((has & 0x40) == 0) {
    goto LABEL_19;
  }
LABEL_10:
  uint64_t v11 = 2654435761 * self->_locationType;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3 = *((_WORD *)a3 + 24);
  if (v3)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v3 = *((_WORD *)a3 + 24);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((v3 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_duration = *((_DWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 8u;
  __int16 v3 = *((_WORD *)a3 + 24);
  if ((v3 & 0x80) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_parkingEvents = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v3 = *((_WORD *)a3 + 24);
  if ((v3 & 0x10) == 0)
  {
LABEL_5:
    if ((v3 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_engagedParkingEvents = *((_DWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v3 = *((_WORD *)a3 + 24);
  if ((v3 & 4) == 0)
  {
LABEL_6:
    if ((v3 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_assistedParkingEvents = *((_DWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 4u;
  __int16 v3 = *((_WORD *)a3 + 24);
  if ((v3 & 0x20) == 0)
  {
LABEL_7:
    if ((v3 & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_engagements = *((_DWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v3 = *((_WORD *)a3 + 24);
  if ((v3 & 2) == 0)
  {
LABEL_8:
    if ((v3 & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_assistances = *((_DWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 2u;
  __int16 v3 = *((_WORD *)a3 + 24);
  if ((v3 & 0x100) == 0)
  {
LABEL_9:
    if ((v3 & 0x40) == 0) {
      return;
    }
LABEL_19:
    self->_locationType = *((_DWORD *)a3 + 9);
    *(_WORD *)&self->_has |= 0x40u;
    return;
  }
LABEL_18:
  self->_suppressedParkingEvents = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x100u;
  if ((*((_WORD *)a3 + 24) & 0x40) != 0) {
    goto LABEL_19;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)duration
{
  return self->_duration;
}

- (int)parkingEvents
{
  return self->_parkingEvents;
}

- (int)engagedParkingEvents
{
  return self->_engagedParkingEvents;
}

- (int)assistedParkingEvents
{
  return self->_assistedParkingEvents;
}

- (int)engagements
{
  return self->_engagements;
}

- (int)assistances
{
  return self->_assistances;
}

- (int)suppressedParkingEvents
{
  return self->_suppressedParkingEvents;
}

- (int)locationType
{
  return self->_locationType;
}

@end