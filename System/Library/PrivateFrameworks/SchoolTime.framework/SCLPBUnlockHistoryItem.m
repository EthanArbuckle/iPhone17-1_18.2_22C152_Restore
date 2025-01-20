@interface SCLPBUnlockHistoryItem
- (BOOL)hasCalendarIdentifier;
- (BOOL)hasDuration;
- (BOOL)hasScheduleEndHour;
- (BOOL)hasScheduleEndMinute;
- (BOOL)hasScheduleStartHour;
- (BOOL)hasScheduleStartMinute;
- (BOOL)hasStartTimeIntervalSinceReferenceDate;
- (BOOL)hasTimeZoneName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)calendarIdentifier;
- (NSString)timeZoneName;
- (double)duration;
- (double)startTimeIntervalSinceReferenceDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)scheduleEndHour;
- (unsigned)scheduleEndMinute;
- (unsigned)scheduleStartHour;
- (unsigned)scheduleStartMinute;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCalendarIdentifier:(id)a3;
- (void)setDuration:(double)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasScheduleEndHour:(BOOL)a3;
- (void)setHasScheduleEndMinute:(BOOL)a3;
- (void)setHasScheduleStartHour:(BOOL)a3;
- (void)setHasScheduleStartMinute:(BOOL)a3;
- (void)setHasStartTimeIntervalSinceReferenceDate:(BOOL)a3;
- (void)setScheduleEndHour:(unsigned int)a3;
- (void)setScheduleEndMinute:(unsigned int)a3;
- (void)setScheduleStartHour:(unsigned int)a3;
- (void)setScheduleStartMinute:(unsigned int)a3;
- (void)setStartTimeIntervalSinceReferenceDate:(double)a3;
- (void)setTimeZoneName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SCLPBUnlockHistoryItem

- (void)setStartTimeIntervalSinceReferenceDate:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_startTimeIntervalSinceReferenceDate = a3;
}

- (void)setHasStartTimeIntervalSinceReferenceDate:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStartTimeIntervalSinceReferenceDate
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDuration:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasCalendarIdentifier
{
  return self->_calendarIdentifier != 0;
}

- (BOOL)hasTimeZoneName
{
  return self->_timeZoneName != 0;
}

- (void)setScheduleStartHour:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_scheduleStartHour = a3;
}

- (void)setHasScheduleStartHour:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasScheduleStartHour
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setScheduleStartMinute:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_scheduleStartMinute = a3;
}

- (void)setHasScheduleStartMinute:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasScheduleStartMinute
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setScheduleEndHour:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_scheduleEndHour = a3;
}

- (void)setHasScheduleEndHour:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasScheduleEndHour
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setScheduleEndMinute:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_scheduleEndMinute = a3;
}

- (void)setHasScheduleEndMinute:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasScheduleEndMinute
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SCLPBUnlockHistoryItem;
  v4 = [(SCLPBUnlockHistoryItem *)&v8 description];
  v5 = [(SCLPBUnlockHistoryItem *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = [NSNumber numberWithDouble:self->_startTimeIntervalSinceReferenceDate];
    [v3 setObject:v5 forKey:@"startTimeIntervalSinceReferenceDate"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = [NSNumber numberWithDouble:self->_duration];
    [v3 setObject:v6 forKey:@"duration"];
  }
  calendarIdentifier = self->_calendarIdentifier;
  if (calendarIdentifier) {
    [v3 setObject:calendarIdentifier forKey:@"calendarIdentifier"];
  }
  timeZoneName = self->_timeZoneName;
  if (timeZoneName) {
    [v3 setObject:timeZoneName forKey:@"timeZoneName"];
  }
  char v9 = (char)self->_has;
  if ((v9 & 0x10) != 0)
  {
    v12 = [NSNumber numberWithUnsignedInt:self->_scheduleStartHour];
    [v3 setObject:v12 forKey:@"scheduleStartHour"];

    char v9 = (char)self->_has;
    if ((v9 & 0x20) == 0)
    {
LABEL_11:
      if ((v9 & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_11;
  }
  v13 = [NSNumber numberWithUnsignedInt:self->_scheduleStartMinute];
  [v3 setObject:v13 forKey:@"scheduleStartMinute"];

  char v9 = (char)self->_has;
  if ((v9 & 4) == 0)
  {
LABEL_12:
    if ((v9 & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_19:
  v14 = [NSNumber numberWithUnsignedInt:self->_scheduleEndHour];
  [v3 setObject:v14 forKey:@"scheduleEndHour"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_13:
    v10 = [NSNumber numberWithUnsignedInt:self->_scheduleEndMinute];
    [v3 setObject:v10 forKey:@"scheduleEndMinute"];
  }
LABEL_14:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SCLPBUnlockHistoryItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_calendarIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_timeZoneName) {
    PBDataWriterWriteStringField();
  }
  char v5 = (char)self->_has;
  if ((v5 & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    char v5 = (char)self->_has;
    if ((v5 & 0x20) == 0)
    {
LABEL_11:
      if ((v5 & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteUint32Field();
  char v5 = (char)self->_has;
  if ((v5 & 4) == 0)
  {
LABEL_12:
    if ((v5 & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_13:
  }
    PBDataWriterWriteUint32Field();
LABEL_14:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = *(void *)&self->_startTimeIntervalSinceReferenceDate;
    *((unsigned char *)v4 + 56) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[1] = *(void *)&self->_duration;
    *((unsigned char *)v4 + 56) |= 1u;
  }
  v7 = v4;
  if (self->_calendarIdentifier)
  {
    objc_msgSend(v4, "setCalendarIdentifier:");
    v4 = v7;
  }
  if (self->_timeZoneName)
  {
    objc_msgSend(v7, "setTimeZoneName:");
    v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 0x10) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_scheduleStartHour;
    *((unsigned char *)v4 + 56) |= 0x10u;
    char v6 = (char)self->_has;
    if ((v6 & 0x20) == 0)
    {
LABEL_11:
      if ((v6 & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_11;
  }
  *((_DWORD *)v4 + 11) = self->_scheduleStartMinute;
  *((unsigned char *)v4 + 56) |= 0x20u;
  char v6 = (char)self->_has;
  if ((v6 & 4) == 0)
  {
LABEL_12:
    if ((v6 & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_19:
  *((_DWORD *)v4 + 8) = self->_scheduleEndHour;
  *((unsigned char *)v4 + 56) |= 4u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_13:
    *((_DWORD *)v4 + 9) = self->_scheduleEndMinute;
    *((unsigned char *)v4 + 56) |= 8u;
  }
LABEL_14:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_startTimeIntervalSinceReferenceDate;
    *(unsigned char *)(v5 + 56) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(double *)(v5 + 8) = self->_duration;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_calendarIdentifier copyWithZone:a3];
  char v9 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_timeZoneName copyWithZone:a3];
  v11 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v10;

  char v12 = (char)self->_has;
  if ((v12 & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_scheduleStartHour;
    *(unsigned char *)(v6 + 56) |= 0x10u;
    char v12 = (char)self->_has;
    if ((v12 & 0x20) == 0)
    {
LABEL_7:
      if ((v12 & 4) == 0) {
        goto LABEL_8;
      }
LABEL_13:
      *(_DWORD *)(v6 + 32) = self->_scheduleEndHour;
      *(unsigned char *)(v6 + 56) |= 4u;
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        return (id)v6;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v6 + 44) = self->_scheduleStartMinute;
  *(unsigned char *)(v6 + 56) |= 0x20u;
  char v12 = (char)self->_has;
  if ((v12 & 4) != 0) {
    goto LABEL_13;
  }
LABEL_8:
  if ((v12 & 8) != 0)
  {
LABEL_9:
    *(_DWORD *)(v6 + 36) = self->_scheduleEndMinute;
    *(unsigned char *)(v6 + 56) |= 8u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_35;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_startTimeIntervalSinceReferenceDate != *((double *)v4 + 2)) {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
LABEL_35:
    BOOL v7 = 0;
    goto LABEL_36;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_duration != *((double *)v4 + 1)) {
      goto LABEL_35;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
    goto LABEL_35;
  }
  calendarIdentifier = self->_calendarIdentifier;
  if ((unint64_t)calendarIdentifier | *((void *)v4 + 3)
    && !-[NSString isEqual:](calendarIdentifier, "isEqual:"))
  {
    goto LABEL_35;
  }
  timeZoneName = self->_timeZoneName;
  if ((unint64_t)timeZoneName | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](timeZoneName, "isEqual:")) {
      goto LABEL_35;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 0x10) == 0 || self->_scheduleStartHour != *((_DWORD *)v4 + 10)) {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 0x10) != 0)
  {
    goto LABEL_35;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 0x20) == 0 || self->_scheduleStartMinute != *((_DWORD *)v4 + 11)) {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 0x20) != 0)
  {
    goto LABEL_35;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_scheduleEndHour != *((_DWORD *)v4 + 8)) {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
    goto LABEL_35;
  }
  BOOL v7 = (*((unsigned char *)v4 + 56) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 8) == 0 || self->_scheduleEndMinute != *((_DWORD *)v4 + 9)) {
      goto LABEL_35;
    }
    BOOL v7 = 1;
  }
LABEL_36:

  return v7;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    double startTimeIntervalSinceReferenceDate = self->_startTimeIntervalSinceReferenceDate;
    double v6 = -startTimeIntervalSinceReferenceDate;
    if (startTimeIntervalSinceReferenceDate >= 0.0) {
      double v6 = self->_startTimeIntervalSinceReferenceDate;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if (has)
  {
    double duration = self->_duration;
    double v11 = -duration;
    if (duration >= 0.0) {
      double v11 = self->_duration;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  NSUInteger v14 = [(NSString *)self->_calendarIdentifier hash];
  NSUInteger v15 = [(NSString *)self->_timeZoneName hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v16 = 2654435761 * self->_scheduleStartHour;
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
LABEL_19:
      uint64_t v17 = 2654435761 * self->_scheduleStartMinute;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_20;
      }
LABEL_24:
      uint64_t v18 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_21;
      }
LABEL_25:
      uint64_t v19 = 0;
      return v9 ^ v4 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
    }
  }
  else
  {
    uint64_t v16 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_19;
    }
  }
  uint64_t v17 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_24;
  }
LABEL_20:
  uint64_t v18 = 2654435761 * self->_scheduleEndHour;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_25;
  }
LABEL_21:
  uint64_t v19 = 2654435761 * self->_scheduleEndMinute;
  return v9 ^ v4 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 56);
  if ((v5 & 2) != 0)
  {
    self->_double startTimeIntervalSinceReferenceDate = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 56);
  }
  if (v5)
  {
    self->_double duration = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  id v7 = v4;
  if (*((void *)v4 + 3))
  {
    -[SCLPBUnlockHistoryItem setCalendarIdentifier:](self, "setCalendarIdentifier:");
    id v4 = v7;
  }
  if (*((void *)v4 + 6))
  {
    -[SCLPBUnlockHistoryItem setTimeZoneName:](self, "setTimeZoneName:");
    id v4 = v7;
  }
  char v6 = *((unsigned char *)v4 + 56);
  if ((v6 & 0x10) != 0)
  {
    self->_scheduleStartHour = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 0x10u;
    char v6 = *((unsigned char *)v4 + 56);
    if ((v6 & 0x20) == 0)
    {
LABEL_11:
      if ((v6 & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 0x20) == 0)
  {
    goto LABEL_11;
  }
  self->_scheduleStartMinute = *((_DWORD *)v4 + 11);
  *(unsigned char *)&self->_has |= 0x20u;
  char v6 = *((unsigned char *)v4 + 56);
  if ((v6 & 4) == 0)
  {
LABEL_12:
    if ((v6 & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_19:
  self->_scheduleEndHour = *((_DWORD *)v4 + 8);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 56) & 8) != 0)
  {
LABEL_13:
    self->_scheduleEndMinute = *((_DWORD *)v4 + 9);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_14:
}

- (double)startTimeIntervalSinceReferenceDate
{
  return self->_startTimeIntervalSinceReferenceDate;
}

- (double)duration
{
  return self->_duration;
}

- (NSString)calendarIdentifier
{
  return self->_calendarIdentifier;
}

- (void)setCalendarIdentifier:(id)a3
{
}

- (NSString)timeZoneName
{
  return self->_timeZoneName;
}

- (void)setTimeZoneName:(id)a3
{
}

- (unsigned)scheduleStartHour
{
  return self->_scheduleStartHour;
}

- (unsigned)scheduleStartMinute
{
  return self->_scheduleStartMinute;
}

- (unsigned)scheduleEndHour
{
  return self->_scheduleEndHour;
}

- (unsigned)scheduleEndMinute
{
  return self->_scheduleEndMinute;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZoneName, 0);
  objc_storeStrong((id *)&self->_calendarIdentifier, 0);
}

@end