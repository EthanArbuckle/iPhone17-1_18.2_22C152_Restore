@interface MTPBAlarmProperties
- (BOOL)allowsSnooze;
- (BOOL)hasAlarmID;
- (BOOL)hasAllowsSnooze;
- (BOOL)hasBedtimeDismissedAction;
- (BOOL)hasBedtimeDismissedDate;
- (BOOL)hasBedtimeFiredDate;
- (BOOL)hasBedtimeHour;
- (BOOL)hasBedtimeMinute;
- (BOOL)hasBedtimeReminderMinutes;
- (BOOL)hasBedtimeSnoozeFireDate;
- (BOOL)hasDaySetting;
- (BOOL)hasDismissedAction;
- (BOOL)hasDismissedDate;
- (BOOL)hasFiredDate;
- (BOOL)hasHour;
- (BOOL)hasIsEnabled;
- (BOOL)hasIsSleepAlarm;
- (BOOL)hasKeepOffUntilDate;
- (BOOL)hasLastModifiedDate;
- (BOOL)hasMinute;
- (BOOL)hasOnboardingVersion;
- (BOOL)hasRevision;
- (BOOL)hasSleepMode;
- (BOOL)hasSleepModeOptions;
- (BOOL)hasSleepSchedule;
- (BOOL)hasSleepTracking;
- (BOOL)hasSnoozeFireDate;
- (BOOL)hasSound;
- (BOOL)hasTimeInBedTracking;
- (BOOL)hasTitle;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSleepAlarm;
- (BOOL)readFrom:(id)a3;
- (BOOL)sleepMode;
- (BOOL)sleepSchedule;
- (BOOL)sleepTracking;
- (BOOL)timeInBedTracking;
- (MTPBSound)sound;
- (NSString)alarmID;
- (NSString)title;
- (double)bedtimeDismissedDate;
- (double)bedtimeFiredDate;
- (double)bedtimeSnoozeFireDate;
- (double)dismissedDate;
- (double)firedDate;
- (double)keepOffUntilDate;
- (double)lastModifiedDate;
- (double)snoozeFireDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)bedtimeDismissedAction;
- (unsigned)bedtimeHour;
- (unsigned)bedtimeMinute;
- (unsigned)bedtimeReminderMinutes;
- (unsigned)daySetting;
- (unsigned)dismissedAction;
- (unsigned)hour;
- (unsigned)minute;
- (unsigned)onboardingVersion;
- (unsigned)revision;
- (unsigned)sleepModeOptions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlarmID:(id)a3;
- (void)setAllowsSnooze:(BOOL)a3;
- (void)setBedtimeDismissedAction:(unsigned int)a3;
- (void)setBedtimeDismissedDate:(double)a3;
- (void)setBedtimeFiredDate:(double)a3;
- (void)setBedtimeHour:(unsigned int)a3;
- (void)setBedtimeMinute:(unsigned int)a3;
- (void)setBedtimeReminderMinutes:(unsigned int)a3;
- (void)setBedtimeSnoozeFireDate:(double)a3;
- (void)setDaySetting:(unsigned int)a3;
- (void)setDismissedAction:(unsigned int)a3;
- (void)setDismissedDate:(double)a3;
- (void)setFiredDate:(double)a3;
- (void)setHasAllowsSnooze:(BOOL)a3;
- (void)setHasBedtimeDismissedAction:(BOOL)a3;
- (void)setHasBedtimeDismissedDate:(BOOL)a3;
- (void)setHasBedtimeFiredDate:(BOOL)a3;
- (void)setHasBedtimeHour:(BOOL)a3;
- (void)setHasBedtimeMinute:(BOOL)a3;
- (void)setHasBedtimeReminderMinutes:(BOOL)a3;
- (void)setHasBedtimeSnoozeFireDate:(BOOL)a3;
- (void)setHasDaySetting:(BOOL)a3;
- (void)setHasDismissedAction:(BOOL)a3;
- (void)setHasDismissedDate:(BOOL)a3;
- (void)setHasFiredDate:(BOOL)a3;
- (void)setHasHour:(BOOL)a3;
- (void)setHasIsEnabled:(BOOL)a3;
- (void)setHasIsSleepAlarm:(BOOL)a3;
- (void)setHasKeepOffUntilDate:(BOOL)a3;
- (void)setHasLastModifiedDate:(BOOL)a3;
- (void)setHasMinute:(BOOL)a3;
- (void)setHasOnboardingVersion:(BOOL)a3;
- (void)setHasRevision:(BOOL)a3;
- (void)setHasSleepMode:(BOOL)a3;
- (void)setHasSleepModeOptions:(BOOL)a3;
- (void)setHasSleepSchedule:(BOOL)a3;
- (void)setHasSleepTracking:(BOOL)a3;
- (void)setHasSnoozeFireDate:(BOOL)a3;
- (void)setHasTimeInBedTracking:(BOOL)a3;
- (void)setHour:(unsigned int)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setIsSleepAlarm:(BOOL)a3;
- (void)setKeepOffUntilDate:(double)a3;
- (void)setLastModifiedDate:(double)a3;
- (void)setMinute:(unsigned int)a3;
- (void)setOnboardingVersion:(unsigned int)a3;
- (void)setRevision:(unsigned int)a3;
- (void)setSleepMode:(BOOL)a3;
- (void)setSleepModeOptions:(unsigned int)a3;
- (void)setSleepSchedule:(BOOL)a3;
- (void)setSleepTracking:(BOOL)a3;
- (void)setSnoozeFireDate:(double)a3;
- (void)setSound:(id)a3;
- (void)setTimeInBedTracking:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MTPBAlarmProperties

- (BOOL)hasAlarmID
{
  return self->_alarmID != 0;
}

- (void)setHour:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_hour = a3;
}

- (void)setHasHour:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasHour
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setMinute:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_minute = a3;
}

- (void)setHasMinute:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasMinute
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (void)setAllowsSnooze:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_allowsSnooze = a3;
}

- (void)setHasAllowsSnooze:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasAllowsSnooze
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setDaySetting:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_daySetting = a3;
}

- (void)setHasDaySetting:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasDaySetting
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (BOOL)hasSound
{
  return self->_sound != 0;
}

- (void)setIsSleepAlarm:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_isSleepAlarm = a3;
}

- (void)setHasIsSleepAlarm:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasIsSleepAlarm
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setBedtimeHour:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_bedtimeHour = a3;
}

- (void)setHasBedtimeHour:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasBedtimeHour
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setBedtimeMinute:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_bedtimeMinute = a3;
}

- (void)setHasBedtimeMinute:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasBedtimeMinute
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setBedtimeReminderMinutes:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_bedtimeReminderMinutes = a3;
}

- (void)setHasBedtimeReminderMinutes:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasBedtimeReminderMinutes
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setRevision:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_revision = a3;
}

- (void)setHasRevision:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasRevision
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setLastModifiedDate:(double)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_lastModifiedDate = a3;
}

- (void)setHasLastModifiedDate:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasLastModifiedDate
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setSnoozeFireDate:(double)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_snoozeFireDate = a3;
}

- (void)setHasSnoozeFireDate:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasSnoozeFireDate
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setBedtimeSnoozeFireDate:(double)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_bedtimeSnoozeFireDate = a3;
}

- (void)setHasBedtimeSnoozeFireDate:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasBedtimeSnoozeFireDate
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIsEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_isEnabled = a3;
}

- (void)setHasIsEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasIsEnabled
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setFiredDate:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_firedDate = a3;
}

- (void)setHasFiredDate:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasFiredDate
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setDismissedDate:(double)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_dismissedDate = a3;
}

- (void)setHasDismissedDate:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasDismissedDate
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setSleepMode:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_sleepMode = a3;
}

- (void)setHasSleepMode:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasSleepMode
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setSleepTracking:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_sleepTracking = a3;
}

- (void)setHasSleepTracking:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasSleepTracking
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setSleepSchedule:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_sleepSchedule = a3;
}

- (void)setHasSleepSchedule:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasSleepSchedule
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setOnboardingVersion:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_onboardingVersion = a3;
}

- (void)setHasOnboardingVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasOnboardingVersion
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setSleepModeOptions:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_sleepModeOptions = a3;
}

- (void)setHasSleepModeOptions:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasSleepModeOptions
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setTimeInBedTracking:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_timeInBedTracking = a3;
}

- (void)setHasTimeInBedTracking:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasTimeInBedTracking
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setDismissedAction:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_dismissedAction = a3;
}

- (void)setHasDismissedAction:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasDismissedAction
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setBedtimeFiredDate:(double)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_bedtimeFiredDate = a3;
}

- (void)setHasBedtimeFiredDate:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasBedtimeFiredDate
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setBedtimeDismissedDate:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_bedtimeDismissedDate = a3;
}

- (void)setHasBedtimeDismissedDate:(BOOL)a3
{
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasBedtimeDismissedDate
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setBedtimeDismissedAction:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_bedtimeDismissedAction = a3;
}

- (void)setHasBedtimeDismissedAction:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasBedtimeDismissedAction
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setKeepOffUntilDate:(double)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_keepOffUntilDate = a3;
}

- (void)setHasKeepOffUntilDate:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasKeepOffUntilDate
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MTPBAlarmProperties;
  v4 = [(MTPBAlarmProperties *)&v8 description];
  v5 = [(MTPBAlarmProperties *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  int v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  alarmID = self->_alarmID;
  if (alarmID) {
    [v3 setObject:alarmID forKey:@"alarmID"];
  }
  $BBB132571B1AAF0C189DBE8BAD1A045E has = self->_has;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    v7 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:self->_hour];
    [v4 setObject:v7 forKey:@"hour"];

    $BBB132571B1AAF0C189DBE8BAD1A045E has = self->_has;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    objc_super v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:self->_minute];
    [v4 setObject:v8 forKey:@"minute"];
  }
  title = self->_title;
  if (title) {
    [v4 setObject:title forKey:@"title"];
  }
  $BBB132571B1AAF0C189DBE8BAD1A045E v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x80000) != 0)
  {
    v11 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_allowsSnooze];
    [v4 setObject:v11 forKey:@"allowsSnooze"];

    $BBB132571B1AAF0C189DBE8BAD1A045E v10 = self->_has;
  }
  if ((*(_WORD *)&v10 & 0x1000) != 0)
  {
    v12 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:self->_daySetting];
    [v4 setObject:v12 forKey:@"daySetting"];
  }
  sound = self->_sound;
  if (sound)
  {
    v14 = [(MTPBSound *)sound dictionaryRepresentation];
    [v4 setObject:v14 forKey:@"sound"];
  }
  $BBB132571B1AAF0C189DBE8BAD1A045E v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x200000) != 0)
  {
    v18 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isSleepAlarm];
    [v4 setObject:v18 forKey:@"isSleepAlarm"];

    $BBB132571B1AAF0C189DBE8BAD1A045E v15 = self->_has;
    if ((*(_WORD *)&v15 & 0x200) == 0)
    {
LABEL_17:
      if ((*(_WORD *)&v15 & 0x400) == 0) {
        goto LABEL_18;
      }
      goto LABEL_43;
    }
  }
  else if ((*(_WORD *)&v15 & 0x200) == 0)
  {
    goto LABEL_17;
  }
  v19 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:self->_bedtimeHour];
  [v4 setObject:v19 forKey:@"bedtimeHour"];

  $BBB132571B1AAF0C189DBE8BAD1A045E v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x400) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v15 & 0x800) == 0) {
      goto LABEL_19;
    }
    goto LABEL_44;
  }
LABEL_43:
  v20 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:self->_bedtimeMinute];
  [v4 setObject:v20 forKey:@"bedtimeMinute"];

  $BBB132571B1AAF0C189DBE8BAD1A045E v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x800) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v15 & 0x20000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_45;
  }
LABEL_44:
  v21 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:self->_bedtimeReminderMinutes];
  [v4 setObject:v21 forKey:@"bedtimeReminderMinutes"];

  $BBB132571B1AAF0C189DBE8BAD1A045E v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x20000) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&v15 & 0x40) == 0) {
      goto LABEL_21;
    }
    goto LABEL_46;
  }
LABEL_45:
  v22 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:self->_revision];
  [v4 setObject:v22 forKey:@"revision"];

  $BBB132571B1AAF0C189DBE8BAD1A045E v15 = self->_has;
  if ((*(unsigned char *)&v15 & 0x40) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&v15 & 0x80) == 0) {
      goto LABEL_22;
    }
    goto LABEL_47;
  }
LABEL_46:
  v23 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_lastModifiedDate];
  [v4 setObject:v23 forKey:@"lastModifiedDate"];

  $BBB132571B1AAF0C189DBE8BAD1A045E v15 = self->_has;
  if ((*(unsigned char *)&v15 & 0x80) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&v15 & 4) == 0) {
      goto LABEL_23;
    }
    goto LABEL_48;
  }
LABEL_47:
  v24 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_snoozeFireDate];
  [v4 setObject:v24 forKey:@"snoozeFireDate"];

  $BBB132571B1AAF0C189DBE8BAD1A045E v15 = self->_has;
  if ((*(unsigned char *)&v15 & 4) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v15 & 0x100000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_49;
  }
LABEL_48:
  v25 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_bedtimeSnoozeFireDate];
  [v4 setObject:v25 forKey:@"bedtimeSnoozeFireDate"];

  $BBB132571B1AAF0C189DBE8BAD1A045E v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x100000) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&v15 & 0x10) == 0) {
      goto LABEL_25;
    }
    goto LABEL_50;
  }
LABEL_49:
  v26 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isEnabled];
  [v4 setObject:v26 forKey:@"isEnabled"];

  $BBB132571B1AAF0C189DBE8BAD1A045E v15 = self->_has;
  if ((*(unsigned char *)&v15 & 0x10) == 0)
  {
LABEL_25:
    if ((*(unsigned char *)&v15 & 8) == 0) {
      goto LABEL_26;
    }
    goto LABEL_51;
  }
LABEL_50:
  v27 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_firedDate];
  [v4 setObject:v27 forKey:@"firedDate"];

  $BBB132571B1AAF0C189DBE8BAD1A045E v15 = self->_has;
  if ((*(unsigned char *)&v15 & 8) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v15 & 0x400000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_52;
  }
LABEL_51:
  v28 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_dismissedDate];
  [v4 setObject:v28 forKey:@"dismissedDate"];

  $BBB132571B1AAF0C189DBE8BAD1A045E v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x400000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v15 & 0x1000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_53;
  }
LABEL_52:
  v29 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_sleepMode];
  [v4 setObject:v29 forKey:@"sleepMode"];

  $BBB132571B1AAF0C189DBE8BAD1A045E v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x1000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v15 & 0x800000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_54;
  }
LABEL_53:
  v30 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_sleepTracking];
  [v4 setObject:v30 forKey:@"sleepTracking"];

  $BBB132571B1AAF0C189DBE8BAD1A045E v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x800000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v15 & 0x10000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_55;
  }
LABEL_54:
  v31 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_sleepSchedule];
  [v4 setObject:v31 forKey:@"sleepSchedule"];

  $BBB132571B1AAF0C189DBE8BAD1A045E v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x10000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v15 & 0x40000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_56;
  }
LABEL_55:
  v32 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:self->_onboardingVersion];
  [v4 setObject:v32 forKey:@"onboardingVersion"];

  $BBB132571B1AAF0C189DBE8BAD1A045E v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x40000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v15 & 0x2000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_57;
  }
LABEL_56:
  v33 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:self->_sleepModeOptions];
  [v4 setObject:v33 forKey:@"sleepModeOptions"];

  $BBB132571B1AAF0C189DBE8BAD1A045E v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x2000000) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v15 & 0x2000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_58;
  }
LABEL_57:
  v34 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_timeInBedTracking];
  [v4 setObject:v34 forKey:@"timeInBedTracking"];

  $BBB132571B1AAF0C189DBE8BAD1A045E v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x2000) == 0)
  {
LABEL_33:
    if ((*(unsigned char *)&v15 & 2) == 0) {
      goto LABEL_34;
    }
    goto LABEL_59;
  }
LABEL_58:
  v35 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:self->_dismissedAction];
  [v4 setObject:v35 forKey:@"dismissedAction"];

  $BBB132571B1AAF0C189DBE8BAD1A045E v15 = self->_has;
  if ((*(unsigned char *)&v15 & 2) == 0)
  {
LABEL_34:
    if ((*(unsigned char *)&v15 & 1) == 0) {
      goto LABEL_35;
    }
    goto LABEL_60;
  }
LABEL_59:
  v36 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_bedtimeFiredDate];
  [v4 setObject:v36 forKey:@"bedtimeFiredDate"];

  $BBB132571B1AAF0C189DBE8BAD1A045E v15 = self->_has;
  if ((*(unsigned char *)&v15 & 1) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v15 & 0x100) == 0) {
      goto LABEL_36;
    }
    goto LABEL_61;
  }
LABEL_60:
  v37 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_bedtimeDismissedDate];
  [v4 setObject:v37 forKey:@"bedtimeDismissedDate"];

  $BBB132571B1AAF0C189DBE8BAD1A045E v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x100) == 0)
  {
LABEL_36:
    if ((*(unsigned char *)&v15 & 0x20) == 0) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
LABEL_61:
  v38 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:self->_bedtimeDismissedAction];
  [v4 setObject:v38 forKey:@"bedtimeDismissedAction"];

  if ((*(_DWORD *)&self->_has & 0x20) != 0)
  {
LABEL_37:
    v16 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_keepOffUntilDate];
    [v4 setObject:v16 forKey:@"keepOffUntilDate"];
  }
LABEL_38:
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MTPBAlarmPropertiesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (self->_alarmID)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  $BBB132571B1AAF0C189DBE8BAD1A045E has = self->_has;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v8;
    $BBB132571B1AAF0C189DBE8BAD1A045E has = self->_has;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v8;
  }
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  $BBB132571B1AAF0C189DBE8BAD1A045E v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v8;
    $BBB132571B1AAF0C189DBE8BAD1A045E v6 = self->_has;
  }
  if ((*(_WORD *)&v6 & 0x1000) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v8;
  }
  if (self->_sound)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v8;
  }
  $BBB132571B1AAF0C189DBE8BAD1A045E v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x200000) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v8;
    $BBB132571B1AAF0C189DBE8BAD1A045E v7 = self->_has;
    if ((*(_WORD *)&v7 & 0x200) == 0)
    {
LABEL_17:
      if ((*(_WORD *)&v7 & 0x400) == 0) {
        goto LABEL_18;
      }
      goto LABEL_43;
    }
  }
  else if ((*(_WORD *)&v7 & 0x200) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  $BBB132571B1AAF0C189DBE8BAD1A045E v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x400) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v7 & 0x800) == 0) {
      goto LABEL_19;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  $BBB132571B1AAF0C189DBE8BAD1A045E v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x800) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v7 & 0x20000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  $BBB132571B1AAF0C189DBE8BAD1A045E v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x20000) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&v7 & 0x40) == 0) {
      goto LABEL_21;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  $BBB132571B1AAF0C189DBE8BAD1A045E v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x40) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&v7 & 0x80) == 0) {
      goto LABEL_22;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteDoubleField();
  id v4 = v8;
  $BBB132571B1AAF0C189DBE8BAD1A045E v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x80) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&v7 & 4) == 0) {
      goto LABEL_23;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteDoubleField();
  id v4 = v8;
  $BBB132571B1AAF0C189DBE8BAD1A045E v7 = self->_has;
  if ((*(unsigned char *)&v7 & 4) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v7 & 0x100000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteDoubleField();
  id v4 = v8;
  $BBB132571B1AAF0C189DBE8BAD1A045E v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x100000) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&v7 & 0x10) == 0) {
      goto LABEL_25;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteBOOLField();
  id v4 = v8;
  $BBB132571B1AAF0C189DBE8BAD1A045E v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x10) == 0)
  {
LABEL_25:
    if ((*(unsigned char *)&v7 & 8) == 0) {
      goto LABEL_26;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteDoubleField();
  id v4 = v8;
  $BBB132571B1AAF0C189DBE8BAD1A045E v7 = self->_has;
  if ((*(unsigned char *)&v7 & 8) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v7 & 0x400000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteDoubleField();
  id v4 = v8;
  $BBB132571B1AAF0C189DBE8BAD1A045E v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x400000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v7 & 0x1000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteBOOLField();
  id v4 = v8;
  $BBB132571B1AAF0C189DBE8BAD1A045E v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x1000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v7 & 0x800000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteBOOLField();
  id v4 = v8;
  $BBB132571B1AAF0C189DBE8BAD1A045E v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x800000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v7 & 0x10000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteBOOLField();
  id v4 = v8;
  $BBB132571B1AAF0C189DBE8BAD1A045E v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x10000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v7 & 0x40000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  $BBB132571B1AAF0C189DBE8BAD1A045E v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v7 & 0x2000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  $BBB132571B1AAF0C189DBE8BAD1A045E v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x2000000) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v7 & 0x2000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteBOOLField();
  id v4 = v8;
  $BBB132571B1AAF0C189DBE8BAD1A045E v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x2000) == 0)
  {
LABEL_33:
    if ((*(unsigned char *)&v7 & 2) == 0) {
      goto LABEL_34;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  $BBB132571B1AAF0C189DBE8BAD1A045E v7 = self->_has;
  if ((*(unsigned char *)&v7 & 2) == 0)
  {
LABEL_34:
    if ((*(unsigned char *)&v7 & 1) == 0) {
      goto LABEL_35;
    }
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteDoubleField();
  id v4 = v8;
  $BBB132571B1AAF0C189DBE8BAD1A045E v7 = self->_has;
  if ((*(unsigned char *)&v7 & 1) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v7 & 0x100) == 0) {
      goto LABEL_36;
    }
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteDoubleField();
  id v4 = v8;
  $BBB132571B1AAF0C189DBE8BAD1A045E v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x100) == 0)
  {
LABEL_36:
    if ((*(unsigned char *)&v7 & 0x20) == 0) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
LABEL_61:
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  if ((*(_DWORD *)&self->_has & 0x20) != 0)
  {
LABEL_37:
    PBDataWriterWriteDoubleField();
    id v4 = v8;
  }
LABEL_38:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (self->_alarmID)
  {
    objc_msgSend(v4, "setAlarmID:");
    id v4 = v8;
  }
  $BBB132571B1AAF0C189DBE8BAD1A045E has = self->_has;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    *((_DWORD *)v4 + 26) = self->_hour;
    *((_DWORD *)v4 + 38) |= 0x4000u;
    $BBB132571B1AAF0C189DBE8BAD1A045E has = self->_has;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    *((_DWORD *)v4 + 27) = self->_minute;
    *((_DWORD *)v4 + 38) |= 0x8000u;
  }
  if (self->_title)
  {
    objc_msgSend(v8, "setTitle:");
    id v4 = v8;
  }
  $BBB132571B1AAF0C189DBE8BAD1A045E v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) != 0)
  {
    *((unsigned char *)v4 + 144) = self->_allowsSnooze;
    *((_DWORD *)v4 + 38) |= 0x80000u;
    $BBB132571B1AAF0C189DBE8BAD1A045E v6 = self->_has;
  }
  if ((*(_WORD *)&v6 & 0x1000) != 0)
  {
    *((_DWORD *)v4 + 24) = self->_daySetting;
    *((_DWORD *)v4 + 38) |= 0x1000u;
  }
  if (self->_sound)
  {
    objc_msgSend(v8, "setSound:");
    id v4 = v8;
  }
  $BBB132571B1AAF0C189DBE8BAD1A045E v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x200000) != 0)
  {
    *((unsigned char *)v4 + 146) = self->_isSleepAlarm;
    *((_DWORD *)v4 + 38) |= 0x200000u;
    $BBB132571B1AAF0C189DBE8BAD1A045E v7 = self->_has;
    if ((*(_WORD *)&v7 & 0x200) == 0)
    {
LABEL_17:
      if ((*(_WORD *)&v7 & 0x400) == 0) {
        goto LABEL_18;
      }
      goto LABEL_43;
    }
  }
  else if ((*(_WORD *)&v7 & 0x200) == 0)
  {
    goto LABEL_17;
  }
  *((_DWORD *)v4 + 21) = self->_bedtimeHour;
  *((_DWORD *)v4 + 38) |= 0x200u;
  $BBB132571B1AAF0C189DBE8BAD1A045E v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x400) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v7 & 0x800) == 0) {
      goto LABEL_19;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v4 + 22) = self->_bedtimeMinute;
  *((_DWORD *)v4 + 38) |= 0x400u;
  $BBB132571B1AAF0C189DBE8BAD1A045E v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x800) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v7 & 0x20000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v4 + 23) = self->_bedtimeReminderMinutes;
  *((_DWORD *)v4 + 38) |= 0x800u;
  $BBB132571B1AAF0C189DBE8BAD1A045E v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x20000) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&v7 & 0x40) == 0) {
      goto LABEL_21;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v4 + 29) = self->_revision;
  *((_DWORD *)v4 + 38) |= 0x20000u;
  $BBB132571B1AAF0C189DBE8BAD1A045E v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x40) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&v7 & 0x80) == 0) {
      goto LABEL_22;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((void *)v4 + 7) = *(void *)&self->_lastModifiedDate;
  *((_DWORD *)v4 + 38) |= 0x40u;
  $BBB132571B1AAF0C189DBE8BAD1A045E v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x80) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&v7 & 4) == 0) {
      goto LABEL_23;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((void *)v4 + 8) = *(void *)&self->_snoozeFireDate;
  *((_DWORD *)v4 + 38) |= 0x80u;
  $BBB132571B1AAF0C189DBE8BAD1A045E v7 = self->_has;
  if ((*(unsigned char *)&v7 & 4) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v7 & 0x100000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((void *)v4 + 3) = *(void *)&self->_bedtimeSnoozeFireDate;
  *((_DWORD *)v4 + 38) |= 4u;
  $BBB132571B1AAF0C189DBE8BAD1A045E v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x100000) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&v7 & 0x10) == 0) {
      goto LABEL_25;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((unsigned char *)v4 + 145) = self->_isEnabled;
  *((_DWORD *)v4 + 38) |= 0x100000u;
  $BBB132571B1AAF0C189DBE8BAD1A045E v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x10) == 0)
  {
LABEL_25:
    if ((*(unsigned char *)&v7 & 8) == 0) {
      goto LABEL_26;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((void *)v4 + 5) = *(void *)&self->_firedDate;
  *((_DWORD *)v4 + 38) |= 0x10u;
  $BBB132571B1AAF0C189DBE8BAD1A045E v7 = self->_has;
  if ((*(unsigned char *)&v7 & 8) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v7 & 0x400000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((void *)v4 + 4) = *(void *)&self->_dismissedDate;
  *((_DWORD *)v4 + 38) |= 8u;
  $BBB132571B1AAF0C189DBE8BAD1A045E v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x400000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v7 & 0x1000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((unsigned char *)v4 + 147) = self->_sleepMode;
  *((_DWORD *)v4 + 38) |= 0x400000u;
  $BBB132571B1AAF0C189DBE8BAD1A045E v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x1000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v7 & 0x800000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((unsigned char *)v4 + 149) = self->_sleepTracking;
  *((_DWORD *)v4 + 38) |= 0x1000000u;
  $BBB132571B1AAF0C189DBE8BAD1A045E v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x800000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v7 & 0x10000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_55;
  }
LABEL_54:
  *((unsigned char *)v4 + 148) = self->_sleepSchedule;
  *((_DWORD *)v4 + 38) |= 0x800000u;
  $BBB132571B1AAF0C189DBE8BAD1A045E v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x10000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v7 & 0x40000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)v4 + 28) = self->_onboardingVersion;
  *((_DWORD *)v4 + 38) |= 0x10000u;
  $BBB132571B1AAF0C189DBE8BAD1A045E v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v7 & 0x2000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_57;
  }
LABEL_56:
  *((_DWORD *)v4 + 30) = self->_sleepModeOptions;
  *((_DWORD *)v4 + 38) |= 0x40000u;
  $BBB132571B1AAF0C189DBE8BAD1A045E v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x2000000) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v7 & 0x2000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((unsigned char *)v4 + 150) = self->_timeInBedTracking;
  *((_DWORD *)v4 + 38) |= 0x2000000u;
  $BBB132571B1AAF0C189DBE8BAD1A045E v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x2000) == 0)
  {
LABEL_33:
    if ((*(unsigned char *)&v7 & 2) == 0) {
      goto LABEL_34;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((_DWORD *)v4 + 25) = self->_dismissedAction;
  *((_DWORD *)v4 + 38) |= 0x2000u;
  $BBB132571B1AAF0C189DBE8BAD1A045E v7 = self->_has;
  if ((*(unsigned char *)&v7 & 2) == 0)
  {
LABEL_34:
    if ((*(unsigned char *)&v7 & 1) == 0) {
      goto LABEL_35;
    }
    goto LABEL_60;
  }
LABEL_59:
  *((void *)v4 + 2) = *(void *)&self->_bedtimeFiredDate;
  *((_DWORD *)v4 + 38) |= 2u;
  $BBB132571B1AAF0C189DBE8BAD1A045E v7 = self->_has;
  if ((*(unsigned char *)&v7 & 1) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v7 & 0x100) == 0) {
      goto LABEL_36;
    }
    goto LABEL_61;
  }
LABEL_60:
  *((void *)v4 + 1) = *(void *)&self->_bedtimeDismissedDate;
  *((_DWORD *)v4 + 38) |= 1u;
  $BBB132571B1AAF0C189DBE8BAD1A045E v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x100) == 0)
  {
LABEL_36:
    if ((*(unsigned char *)&v7 & 0x20) == 0) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
LABEL_61:
  *((_DWORD *)v4 + 20) = self->_bedtimeDismissedAction;
  *((_DWORD *)v4 + 38) |= 0x100u;
  if ((*(_DWORD *)&self->_has & 0x20) != 0)
  {
LABEL_37:
    *((void *)v4 + 6) = *(void *)&self->_keepOffUntilDate;
    *((_DWORD *)v4 + 38) |= 0x20u;
  }
LABEL_38:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_alarmID copyWithZone:a3];
  $BBB132571B1AAF0C189DBE8BAD1A045E v7 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v6;

  $BBB132571B1AAF0C189DBE8BAD1A045E has = self->_has;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    *(_DWORD *)(v5 + 104) = self->_hour;
    *(_DWORD *)(v5 + 152) |= 0x4000u;
    $BBB132571B1AAF0C189DBE8BAD1A045E has = self->_has;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    *(_DWORD *)(v5 + 108) = self->_minute;
    *(_DWORD *)(v5 + 152) |= 0x8000u;
  }
  uint64_t v9 = [(NSString *)self->_title copyWithZone:a3];
  $BBB132571B1AAF0C189DBE8BAD1A045E v10 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v9;

  $BBB132571B1AAF0C189DBE8BAD1A045E v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x80000) != 0)
  {
    *(unsigned char *)(v5 + 144) = self->_allowsSnooze;
    *(_DWORD *)(v5 + 152) |= 0x80000u;
    $BBB132571B1AAF0C189DBE8BAD1A045E v11 = self->_has;
  }
  if ((*(_WORD *)&v11 & 0x1000) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_daySetting;
    *(_DWORD *)(v5 + 152) |= 0x1000u;
  }
  id v12 = [(MTPBSound *)self->_sound copyWithZone:a3];
  v13 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v12;

  $BBB132571B1AAF0C189DBE8BAD1A045E v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x200000) != 0)
  {
    *(unsigned char *)(v5 + 146) = self->_isSleepAlarm;
    *(_DWORD *)(v5 + 152) |= 0x200000u;
    $BBB132571B1AAF0C189DBE8BAD1A045E v14 = self->_has;
    if ((*(_WORD *)&v14 & 0x200) == 0)
    {
LABEL_11:
      if ((*(_WORD *)&v14 & 0x400) == 0) {
        goto LABEL_12;
      }
      goto LABEL_35;
    }
  }
  else if ((*(_WORD *)&v14 & 0x200) == 0)
  {
    goto LABEL_11;
  }
  *(_DWORD *)(v5 + 84) = self->_bedtimeHour;
  *(_DWORD *)(v5 + 152) |= 0x200u;
  $BBB132571B1AAF0C189DBE8BAD1A045E v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x400) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&v14 & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_36;
  }
LABEL_35:
  *(_DWORD *)(v5 + 88) = self->_bedtimeMinute;
  *(_DWORD *)(v5 + 152) |= 0x400u;
  $BBB132571B1AAF0C189DBE8BAD1A045E v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x800) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&v14 & 0x20000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_37;
  }
LABEL_36:
  *(_DWORD *)(v5 + 92) = self->_bedtimeReminderMinutes;
  *(_DWORD *)(v5 + 152) |= 0x800u;
  $BBB132571B1AAF0C189DBE8BAD1A045E v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x20000) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&v14 & 0x40) == 0) {
      goto LABEL_15;
    }
    goto LABEL_38;
  }
LABEL_37:
  *(_DWORD *)(v5 + 116) = self->_revision;
  *(_DWORD *)(v5 + 152) |= 0x20000u;
  $BBB132571B1AAF0C189DBE8BAD1A045E v14 = self->_has;
  if ((*(unsigned char *)&v14 & 0x40) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&v14 & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_39;
  }
LABEL_38:
  *(double *)(v5 + 56) = self->_lastModifiedDate;
  *(_DWORD *)(v5 + 152) |= 0x40u;
  $BBB132571B1AAF0C189DBE8BAD1A045E v14 = self->_has;
  if ((*(unsigned char *)&v14 & 0x80) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&v14 & 4) == 0) {
      goto LABEL_17;
    }
    goto LABEL_40;
  }
LABEL_39:
  *(double *)(v5 + 64) = self->_snoozeFireDate;
  *(_DWORD *)(v5 + 152) |= 0x80u;
  $BBB132571B1AAF0C189DBE8BAD1A045E v14 = self->_has;
  if ((*(unsigned char *)&v14 & 4) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&v14 & 0x100000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_41;
  }
LABEL_40:
  *(double *)(v5 + 24) = self->_bedtimeSnoozeFireDate;
  *(_DWORD *)(v5 + 152) |= 4u;
  $BBB132571B1AAF0C189DBE8BAD1A045E v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x100000) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&v14 & 0x10) == 0) {
      goto LABEL_19;
    }
    goto LABEL_42;
  }
LABEL_41:
  *(unsigned char *)(v5 + 145) = self->_isEnabled;
  *(_DWORD *)(v5 + 152) |= 0x100000u;
  $BBB132571B1AAF0C189DBE8BAD1A045E v14 = self->_has;
  if ((*(unsigned char *)&v14 & 0x10) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&v14 & 8) == 0) {
      goto LABEL_20;
    }
    goto LABEL_43;
  }
LABEL_42:
  *(double *)(v5 + 40) = self->_firedDate;
  *(_DWORD *)(v5 + 152) |= 0x10u;
  $BBB132571B1AAF0C189DBE8BAD1A045E v14 = self->_has;
  if ((*(unsigned char *)&v14 & 8) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&v14 & 0x400000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_44;
  }
LABEL_43:
  *(double *)(v5 + 32) = self->_dismissedDate;
  *(_DWORD *)(v5 + 152) |= 8u;
  $BBB132571B1AAF0C189DBE8BAD1A045E v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x400000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&v14 & 0x1000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_45;
  }
LABEL_44:
  *(unsigned char *)(v5 + 147) = self->_sleepMode;
  *(_DWORD *)(v5 + 152) |= 0x400000u;
  $BBB132571B1AAF0C189DBE8BAD1A045E v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x1000000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&v14 & 0x800000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_46;
  }
LABEL_45:
  *(unsigned char *)(v5 + 149) = self->_sleepTracking;
  *(_DWORD *)(v5 + 152) |= 0x1000000u;
  $BBB132571B1AAF0C189DBE8BAD1A045E v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x800000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v14 & 0x10000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_47;
  }
LABEL_46:
  *(unsigned char *)(v5 + 148) = self->_sleepSchedule;
  *(_DWORD *)(v5 + 152) |= 0x800000u;
  $BBB132571B1AAF0C189DBE8BAD1A045E v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x10000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v14 & 0x40000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_48;
  }
LABEL_47:
  *(_DWORD *)(v5 + 112) = self->_onboardingVersion;
  *(_DWORD *)(v5 + 152) |= 0x10000u;
  $BBB132571B1AAF0C189DBE8BAD1A045E v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x40000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v14 & 0x2000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_49;
  }
LABEL_48:
  *(_DWORD *)(v5 + 120) = self->_sleepModeOptions;
  *(_DWORD *)(v5 + 152) |= 0x40000u;
  $BBB132571B1AAF0C189DBE8BAD1A045E v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x2000000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v14 & 0x2000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_50;
  }
LABEL_49:
  *(unsigned char *)(v5 + 150) = self->_timeInBedTracking;
  *(_DWORD *)(v5 + 152) |= 0x2000000u;
  $BBB132571B1AAF0C189DBE8BAD1A045E v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x2000) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&v14 & 2) == 0) {
      goto LABEL_28;
    }
    goto LABEL_51;
  }
LABEL_50:
  *(_DWORD *)(v5 + 100) = self->_dismissedAction;
  *(_DWORD *)(v5 + 152) |= 0x2000u;
  $BBB132571B1AAF0C189DBE8BAD1A045E v14 = self->_has;
  if ((*(unsigned char *)&v14 & 2) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&v14 & 1) == 0) {
      goto LABEL_29;
    }
    goto LABEL_52;
  }
LABEL_51:
  *(double *)(v5 + 16) = self->_bedtimeFiredDate;
  *(_DWORD *)(v5 + 152) |= 2u;
  $BBB132571B1AAF0C189DBE8BAD1A045E v14 = self->_has;
  if ((*(unsigned char *)&v14 & 1) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v14 & 0x100) == 0) {
      goto LABEL_30;
    }
LABEL_53:
    *(_DWORD *)(v5 + 80) = self->_bedtimeDismissedAction;
    *(_DWORD *)(v5 + 152) |= 0x100u;
    if ((*(_DWORD *)&self->_has & 0x20) == 0) {
      return (id)v5;
    }
    goto LABEL_31;
  }
LABEL_52:
  *(double *)(v5 + 8) = self->_bedtimeDismissedDate;
  *(_DWORD *)(v5 + 152) |= 1u;
  $BBB132571B1AAF0C189DBE8BAD1A045E v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x100) != 0) {
    goto LABEL_53;
  }
LABEL_30:
  if ((*(unsigned char *)&v14 & 0x20) != 0)
  {
LABEL_31:
    *(double *)(v5 + 48) = self->_keepOffUntilDate;
    *(_DWORD *)(v5 + 152) |= 0x20u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_161;
  }
  alarmID = self->_alarmID;
  if ((unint64_t)alarmID | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](alarmID, "isEqual:")) {
      goto LABEL_161;
    }
  }
  $BBB132571B1AAF0C189DBE8BAD1A045E has = self->_has;
  int v7 = *((_DWORD *)v4 + 38);
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v7 & 0x4000) == 0 || self->_hour != *((_DWORD *)v4 + 26)) {
      goto LABEL_161;
    }
  }
  else if ((v7 & 0x4000) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0 || self->_minute != *((_DWORD *)v4 + 27)) {
      goto LABEL_161;
    }
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_161;
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](title, "isEqual:")) {
      goto LABEL_161;
    }
    $BBB132571B1AAF0C189DBE8BAD1A045E has = self->_has;
  }
  int v9 = *((_DWORD *)v4 + 38);
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v9 & 0x80000) == 0) {
      goto LABEL_161;
    }
    if (self->_allowsSnooze)
    {
      if (!*((unsigned char *)v4 + 144)) {
        goto LABEL_161;
      }
    }
    else if (*((unsigned char *)v4 + 144))
    {
      goto LABEL_161;
    }
  }
  else if ((v9 & 0x80000) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v9 & 0x1000) == 0 || self->_daySetting != *((_DWORD *)v4 + 24)) {
      goto LABEL_161;
    }
  }
  else if ((v9 & 0x1000) != 0)
  {
    goto LABEL_161;
  }
  sound = self->_sound;
  if ((unint64_t)sound | *((void *)v4 + 16))
  {
    if (!-[MTPBSound isEqual:](sound, "isEqual:")) {
      goto LABEL_161;
    }
    $BBB132571B1AAF0C189DBE8BAD1A045E has = self->_has;
  }
  int v11 = *((_DWORD *)v4 + 38);
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v11 & 0x200000) == 0) {
      goto LABEL_161;
    }
    if (self->_isSleepAlarm)
    {
      if (!*((unsigned char *)v4 + 146)) {
        goto LABEL_161;
      }
    }
    else if (*((unsigned char *)v4 + 146))
    {
      goto LABEL_161;
    }
  }
  else if ((v11 & 0x200000) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v11 & 0x200) == 0 || self->_bedtimeHour != *((_DWORD *)v4 + 21)) {
      goto LABEL_161;
    }
  }
  else if ((v11 & 0x200) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v11 & 0x400) == 0 || self->_bedtimeMinute != *((_DWORD *)v4 + 22)) {
      goto LABEL_161;
    }
  }
  else if ((v11 & 0x400) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v11 & 0x800) == 0 || self->_bedtimeReminderMinutes != *((_DWORD *)v4 + 23)) {
      goto LABEL_161;
    }
  }
  else if ((v11 & 0x800) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v11 & 0x20000) == 0 || self->_revision != *((_DWORD *)v4 + 29)) {
      goto LABEL_161;
    }
  }
  else if ((v11 & 0x20000) != 0)
  {
    goto LABEL_161;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v11 & 0x40) == 0 || self->_lastModifiedDate != *((double *)v4 + 7)) {
      goto LABEL_161;
    }
  }
  else if ((v11 & 0x40) != 0)
  {
    goto LABEL_161;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v11 & 0x80) == 0 || self->_snoozeFireDate != *((double *)v4 + 8)) {
      goto LABEL_161;
    }
  }
  else if ((v11 & 0x80) != 0)
  {
    goto LABEL_161;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_bedtimeSnoozeFireDate != *((double *)v4 + 3)) {
      goto LABEL_161;
    }
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v11 & 0x100000) == 0) {
      goto LABEL_161;
    }
    if (self->_isEnabled)
    {
      if (!*((unsigned char *)v4 + 145)) {
        goto LABEL_161;
      }
    }
    else if (*((unsigned char *)v4 + 145))
    {
      goto LABEL_161;
    }
  }
  else if ((v11 & 0x100000) != 0)
  {
    goto LABEL_161;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v11 & 0x10) == 0 || self->_firedDate != *((double *)v4 + 5)) {
      goto LABEL_161;
    }
  }
  else if ((v11 & 0x10) != 0)
  {
    goto LABEL_161;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v11 & 8) == 0 || self->_dismissedDate != *((double *)v4 + 4)) {
      goto LABEL_161;
    }
  }
  else if ((v11 & 8) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v11 & 0x400000) == 0) {
      goto LABEL_161;
    }
    if (self->_sleepMode)
    {
      if (!*((unsigned char *)v4 + 147)) {
        goto LABEL_161;
      }
    }
    else if (*((unsigned char *)v4 + 147))
    {
      goto LABEL_161;
    }
  }
  else if ((v11 & 0x400000) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v11 & 0x1000000) == 0) {
      goto LABEL_161;
    }
    if (self->_sleepTracking)
    {
      if (!*((unsigned char *)v4 + 149)) {
        goto LABEL_161;
      }
    }
    else if (*((unsigned char *)v4 + 149))
    {
      goto LABEL_161;
    }
  }
  else if ((v11 & 0x1000000) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v11 & 0x800000) == 0) {
      goto LABEL_161;
    }
    if (self->_sleepSchedule)
    {
      if (!*((unsigned char *)v4 + 148)) {
        goto LABEL_161;
      }
    }
    else if (*((unsigned char *)v4 + 148))
    {
      goto LABEL_161;
    }
  }
  else if ((v11 & 0x800000) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v11 & 0x10000) == 0 || self->_onboardingVersion != *((_DWORD *)v4 + 28)) {
      goto LABEL_161;
    }
  }
  else if ((v11 & 0x10000) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v11 & 0x40000) == 0 || self->_sleepModeOptions != *((_DWORD *)v4 + 30)) {
      goto LABEL_161;
    }
  }
  else if ((v11 & 0x40000) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v11 & 0x2000000) != 0)
    {
      if (self->_timeInBedTracking)
      {
        if (!*((unsigned char *)v4 + 150)) {
          goto LABEL_161;
        }
        goto LABEL_136;
      }
      if (!*((unsigned char *)v4 + 150)) {
        goto LABEL_136;
      }
    }
LABEL_161:
    BOOL v12 = 0;
    goto LABEL_162;
  }
  if ((v11 & 0x2000000) != 0) {
    goto LABEL_161;
  }
LABEL_136:
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v11 & 0x2000) == 0 || self->_dismissedAction != *((_DWORD *)v4 + 25)) {
      goto LABEL_161;
    }
  }
  else if ((v11 & 0x2000) != 0)
  {
    goto LABEL_161;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v11 & 2) == 0 || self->_bedtimeFiredDate != *((double *)v4 + 2)) {
      goto LABEL_161;
    }
  }
  else if ((v11 & 2) != 0)
  {
    goto LABEL_161;
  }
  if (*(unsigned char *)&has)
  {
    if ((v11 & 1) == 0 || self->_bedtimeDismissedDate != *((double *)v4 + 1)) {
      goto LABEL_161;
    }
  }
  else if (v11)
  {
    goto LABEL_161;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v11 & 0x100) == 0 || self->_bedtimeDismissedAction != *((_DWORD *)v4 + 20)) {
      goto LABEL_161;
    }
  }
  else if ((v11 & 0x100) != 0)
  {
    goto LABEL_161;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v11 & 0x20) == 0 || self->_keepOffUntilDate != *((double *)v4 + 6)) {
      goto LABEL_161;
    }
    BOOL v12 = 1;
  }
  else
  {
    BOOL v12 = (*((_DWORD *)v4 + 38) & 0x20) == 0;
  }
LABEL_162:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v69 = [(NSString *)self->_alarmID hash];
  $BBB132571B1AAF0C189DBE8BAD1A045E has = self->_has;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    uint64_t v68 = 2654435761 * self->_hour;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v68 = 0;
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
LABEL_3:
      uint64_t v67 = 2654435761 * self->_minute;
      goto LABEL_6;
    }
  }
  uint64_t v67 = 0;
LABEL_6:
  NSUInteger v66 = [(NSString *)self->_title hash];
  $BBB132571B1AAF0C189DBE8BAD1A045E v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x80000) != 0)
  {
    uint64_t v65 = 2654435761 * self->_allowsSnooze;
    if ((*(_WORD *)&v4 & 0x1000) != 0) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v65 = 0;
    if ((*(_WORD *)&v4 & 0x1000) != 0)
    {
LABEL_8:
      uint64_t v64 = 2654435761 * self->_daySetting;
      goto LABEL_11;
    }
  }
  uint64_t v64 = 0;
LABEL_11:
  unint64_t v63 = [(MTPBSound *)self->_sound hash];
  $BBB132571B1AAF0C189DBE8BAD1A045E v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x200000) != 0)
  {
    uint64_t v62 = 2654435761 * self->_isSleepAlarm;
    if ((*(_WORD *)&v5 & 0x200) != 0)
    {
LABEL_13:
      uint64_t v61 = 2654435761 * self->_bedtimeHour;
      if ((*(_WORD *)&v5 & 0x400) != 0) {
        goto LABEL_14;
      }
      goto LABEL_23;
    }
  }
  else
  {
    uint64_t v62 = 0;
    if ((*(_WORD *)&v5 & 0x200) != 0) {
      goto LABEL_13;
    }
  }
  uint64_t v61 = 0;
  if ((*(_WORD *)&v5 & 0x400) != 0)
  {
LABEL_14:
    uint64_t v60 = 2654435761 * self->_bedtimeMinute;
    if ((*(_WORD *)&v5 & 0x800) != 0) {
      goto LABEL_15;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v60 = 0;
  if ((*(_WORD *)&v5 & 0x800) != 0)
  {
LABEL_15:
    uint64_t v59 = 2654435761 * self->_bedtimeReminderMinutes;
    if ((*(_DWORD *)&v5 & 0x20000) != 0) {
      goto LABEL_16;
    }
LABEL_25:
    uint64_t v58 = 0;
    if ((*(unsigned char *)&v5 & 0x40) != 0) {
      goto LABEL_17;
    }
LABEL_26:
    unint64_t v10 = 0;
    goto LABEL_29;
  }
LABEL_24:
  uint64_t v59 = 0;
  if ((*(_DWORD *)&v5 & 0x20000) == 0) {
    goto LABEL_25;
  }
LABEL_16:
  uint64_t v58 = 2654435761 * self->_revision;
  if ((*(unsigned char *)&v5 & 0x40) == 0) {
    goto LABEL_26;
  }
LABEL_17:
  double lastModifiedDate = self->_lastModifiedDate;
  double v7 = -lastModifiedDate;
  if (lastModifiedDate >= 0.0) {
    double v7 = self->_lastModifiedDate;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0) {
      v10 += (unint64_t)v9;
    }
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_29:
  if ((*(unsigned char *)&v5 & 0x80) != 0)
  {
    double snoozeFireDate = self->_snoozeFireDate;
    double v13 = -snoozeFireDate;
    if (snoozeFireDate >= 0.0) {
      double v13 = self->_snoozeFireDate;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v11 += (unint64_t)v15;
      }
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  if ((*(unsigned char *)&v5 & 4) != 0)
  {
    double bedtimeSnoozeFireDate = self->_bedtimeSnoozeFireDate;
    double v18 = -bedtimeSnoozeFireDate;
    if (bedtimeSnoozeFireDate >= 0.0) {
      double v18 = self->_bedtimeSnoozeFireDate;
    }
    long double v19 = floor(v18 + 0.5);
    double v20 = (v18 - v19) * 1.84467441e19;
    unint64_t v16 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
    if (v20 >= 0.0)
    {
      if (v20 > 0.0) {
        v16 += (unint64_t)v20;
      }
    }
    else
    {
      v16 -= (unint64_t)fabs(v20);
    }
  }
  else
  {
    unint64_t v16 = 0;
  }
  if ((*(_DWORD *)&v5 & 0x100000) != 0)
  {
    uint64_t v57 = 2654435761 * self->_isEnabled;
    if ((*(unsigned char *)&v5 & 0x10) != 0) {
      goto LABEL_47;
    }
LABEL_52:
    unint64_t v25 = 0;
    goto LABEL_55;
  }
  uint64_t v57 = 0;
  if ((*(unsigned char *)&v5 & 0x10) == 0) {
    goto LABEL_52;
  }
LABEL_47:
  double firedDate = self->_firedDate;
  double v22 = -firedDate;
  if (firedDate >= 0.0) {
    double v22 = self->_firedDate;
  }
  long double v23 = floor(v22 + 0.5);
  double v24 = (v22 - v23) * 1.84467441e19;
  unint64_t v25 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
  if (v24 >= 0.0)
  {
    if (v24 > 0.0) {
      v25 += (unint64_t)v24;
    }
  }
  else
  {
    v25 -= (unint64_t)fabs(v24);
  }
LABEL_55:
  if ((*(unsigned char *)&v5 & 8) != 0)
  {
    double dismissedDate = self->_dismissedDate;
    double v28 = -dismissedDate;
    if (dismissedDate >= 0.0) {
      double v28 = self->_dismissedDate;
    }
    long double v29 = floor(v28 + 0.5);
    double v30 = (v28 - v29) * 1.84467441e19;
    unint64_t v26 = 2654435761u * (unint64_t)fmod(v29, 1.84467441e19);
    if (v30 >= 0.0)
    {
      if (v30 > 0.0) {
        v26 += (unint64_t)v30;
      }
    }
    else
    {
      v26 -= (unint64_t)fabs(v30);
    }
  }
  else
  {
    unint64_t v26 = 0;
  }
  if ((*(_DWORD *)&v5 & 0x400000) != 0)
  {
    uint64_t v55 = 2654435761 * self->_sleepMode;
    if ((*(_DWORD *)&v5 & 0x1000000) != 0)
    {
LABEL_65:
      uint64_t v54 = 2654435761 * self->_sleepTracking;
      if ((*(_DWORD *)&v5 & 0x800000) != 0) {
        goto LABEL_66;
      }
      goto LABEL_72;
    }
  }
  else
  {
    uint64_t v55 = 0;
    if ((*(_DWORD *)&v5 & 0x1000000) != 0) {
      goto LABEL_65;
    }
  }
  uint64_t v54 = 0;
  if ((*(_DWORD *)&v5 & 0x800000) != 0)
  {
LABEL_66:
    uint64_t v53 = 2654435761 * self->_sleepSchedule;
    if ((*(_DWORD *)&v5 & 0x10000) != 0) {
      goto LABEL_67;
    }
    goto LABEL_73;
  }
LABEL_72:
  uint64_t v53 = 0;
  if ((*(_DWORD *)&v5 & 0x10000) != 0)
  {
LABEL_67:
    uint64_t v52 = 2654435761 * self->_onboardingVersion;
    if ((*(_DWORD *)&v5 & 0x40000) != 0) {
      goto LABEL_68;
    }
LABEL_74:
    uint64_t v51 = 0;
    if ((*(_DWORD *)&v5 & 0x2000000) != 0) {
      goto LABEL_69;
    }
    goto LABEL_75;
  }
LABEL_73:
  uint64_t v52 = 0;
  if ((*(_DWORD *)&v5 & 0x40000) == 0) {
    goto LABEL_74;
  }
LABEL_68:
  uint64_t v51 = 2654435761 * self->_sleepModeOptions;
  if ((*(_DWORD *)&v5 & 0x2000000) != 0)
  {
LABEL_69:
    uint64_t v50 = 2654435761 * self->_timeInBedTracking;
    goto LABEL_76;
  }
LABEL_75:
  uint64_t v50 = 0;
LABEL_76:
  unint64_t v56 = v11;
  if ((*(_WORD *)&v5 & 0x2000) != 0)
  {
    uint64_t v49 = 2654435761 * self->_dismissedAction;
    if ((*(unsigned char *)&v5 & 2) != 0) {
      goto LABEL_78;
    }
LABEL_83:
    unint64_t v35 = 0;
    goto LABEL_86;
  }
  uint64_t v49 = 0;
  if ((*(unsigned char *)&v5 & 2) == 0) {
    goto LABEL_83;
  }
LABEL_78:
  double bedtimeFiredDate = self->_bedtimeFiredDate;
  double v32 = -bedtimeFiredDate;
  if (bedtimeFiredDate >= 0.0) {
    double v32 = self->_bedtimeFiredDate;
  }
  long double v33 = floor(v32 + 0.5);
  double v34 = (v32 - v33) * 1.84467441e19;
  unint64_t v35 = 2654435761u * (unint64_t)fmod(v33, 1.84467441e19);
  if (v34 >= 0.0)
  {
    if (v34 > 0.0) {
      v35 += (unint64_t)v34;
    }
  }
  else
  {
    v35 -= (unint64_t)fabs(v34);
  }
LABEL_86:
  if (*(unsigned char *)&v5)
  {
    double bedtimeDismissedDate = self->_bedtimeDismissedDate;
    double v38 = -bedtimeDismissedDate;
    if (bedtimeDismissedDate >= 0.0) {
      double v38 = self->_bedtimeDismissedDate;
    }
    long double v39 = floor(v38 + 0.5);
    double v40 = (v38 - v39) * 1.84467441e19;
    unint64_t v36 = 2654435761u * (unint64_t)fmod(v39, 1.84467441e19);
    if (v40 >= 0.0)
    {
      if (v40 > 0.0) {
        v36 += (unint64_t)v40;
      }
    }
    else
    {
      v36 -= (unint64_t)fabs(v40);
    }
  }
  else
  {
    unint64_t v36 = 0;
  }
  unint64_t v41 = v26;
  if ((*(_WORD *)&v5 & 0x100) != 0)
  {
    uint64_t v42 = 2654435761 * self->_bedtimeDismissedAction;
    if ((*(unsigned char *)&v5 & 0x20) != 0) {
      goto LABEL_96;
    }
LABEL_101:
    unint64_t v47 = 0;
    return v68 ^ v69 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v10 ^ v56 ^ v16 ^ v57 ^ v25 ^ v41 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v35 ^ v36 ^ v42 ^ v47;
  }
  uint64_t v42 = 0;
  if ((*(unsigned char *)&v5 & 0x20) == 0) {
    goto LABEL_101;
  }
LABEL_96:
  double keepOffUntilDate = self->_keepOffUntilDate;
  double v44 = -keepOffUntilDate;
  if (keepOffUntilDate >= 0.0) {
    double v44 = self->_keepOffUntilDate;
  }
  long double v45 = floor(v44 + 0.5);
  double v46 = (v44 - v45) * 1.84467441e19;
  unint64_t v47 = 2654435761u * (unint64_t)fmod(v45, 1.84467441e19);
  if (v46 >= 0.0)
  {
    if (v46 > 0.0) {
      v47 += (unint64_t)v46;
    }
  }
  else
  {
    v47 -= (unint64_t)fabs(v46);
  }
  return v68 ^ v69 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v10 ^ v56 ^ v16 ^ v57 ^ v25 ^ v41 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v35 ^ v36 ^ v42 ^ v47;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (*((void *)v4 + 9))
  {
    -[MTPBAlarmProperties setAlarmID:](self, "setAlarmID:");
    id v4 = v10;
  }
  int v5 = *((_DWORD *)v4 + 38);
  if ((v5 & 0x4000) != 0)
  {
    self->_hour = *((_DWORD *)v4 + 26);
    *(_DWORD *)&self->_has |= 0x4000u;
    int v5 = *((_DWORD *)v4 + 38);
  }
  if ((v5 & 0x8000) != 0)
  {
    self->_minute = *((_DWORD *)v4 + 27);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
  if (*((void *)v4 + 17))
  {
    -[MTPBAlarmProperties setTitle:](self, "setTitle:");
    id v4 = v10;
  }
  int v6 = *((_DWORD *)v4 + 38);
  if ((v6 & 0x80000) != 0)
  {
    self->_allowsSnooze = *((unsigned char *)v4 + 144);
    *(_DWORD *)&self->_has |= 0x80000u;
    int v6 = *((_DWORD *)v4 + 38);
  }
  if ((v6 & 0x1000) != 0)
  {
    self->_daySetting = *((_DWORD *)v4 + 24);
    *(_DWORD *)&self->_has |= 0x1000u;
  }
  sound = self->_sound;
  uint64_t v8 = *((void *)v4 + 16);
  if (sound)
  {
    if (!v8) {
      goto LABEL_19;
    }
    sound = (MTPBSound *)-[MTPBSound mergeFrom:](sound, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_19;
    }
    sound = (MTPBSound *)-[MTPBAlarmProperties setSound:](self, "setSound:");
  }
  id v4 = v10;
LABEL_19:
  int v9 = *((_DWORD *)v4 + 38);
  if ((v9 & 0x200000) != 0)
  {
    self->_isSleepAlarm = *((unsigned char *)v4 + 146);
    *(_DWORD *)&self->_has |= 0x200000u;
    int v9 = *((_DWORD *)v4 + 38);
    if ((v9 & 0x200) == 0)
    {
LABEL_21:
      if ((v9 & 0x400) == 0) {
        goto LABEL_22;
      }
      goto LABEL_47;
    }
  }
  else if ((v9 & 0x200) == 0)
  {
    goto LABEL_21;
  }
  self->_bedtimeHour = *((_DWORD *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x200u;
  int v9 = *((_DWORD *)v4 + 38);
  if ((v9 & 0x400) == 0)
  {
LABEL_22:
    if ((v9 & 0x800) == 0) {
      goto LABEL_23;
    }
    goto LABEL_48;
  }
LABEL_47:
  self->_bedtimeMinute = *((_DWORD *)v4 + 22);
  *(_DWORD *)&self->_has |= 0x400u;
  int v9 = *((_DWORD *)v4 + 38);
  if ((v9 & 0x800) == 0)
  {
LABEL_23:
    if ((v9 & 0x20000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_49;
  }
LABEL_48:
  self->_bedtimeReminderMinutes = *((_DWORD *)v4 + 23);
  *(_DWORD *)&self->_has |= 0x800u;
  int v9 = *((_DWORD *)v4 + 38);
  if ((v9 & 0x20000) == 0)
  {
LABEL_24:
    if ((v9 & 0x40) == 0) {
      goto LABEL_25;
    }
    goto LABEL_50;
  }
LABEL_49:
  self->_revision = *((_DWORD *)v4 + 29);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v9 = *((_DWORD *)v4 + 38);
  if ((v9 & 0x40) == 0)
  {
LABEL_25:
    if ((v9 & 0x80) == 0) {
      goto LABEL_26;
    }
    goto LABEL_51;
  }
LABEL_50:
  self->_double lastModifiedDate = *((double *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x40u;
  int v9 = *((_DWORD *)v4 + 38);
  if ((v9 & 0x80) == 0)
  {
LABEL_26:
    if ((v9 & 4) == 0) {
      goto LABEL_27;
    }
    goto LABEL_52;
  }
LABEL_51:
  self->_double snoozeFireDate = *((double *)v4 + 8);
  *(_DWORD *)&self->_has |= 0x80u;
  int v9 = *((_DWORD *)v4 + 38);
  if ((v9 & 4) == 0)
  {
LABEL_27:
    if ((v9 & 0x100000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_53;
  }
LABEL_52:
  self->_double bedtimeSnoozeFireDate = *((double *)v4 + 3);
  *(_DWORD *)&self->_has |= 4u;
  int v9 = *((_DWORD *)v4 + 38);
  if ((v9 & 0x100000) == 0)
  {
LABEL_28:
    if ((v9 & 0x10) == 0) {
      goto LABEL_29;
    }
    goto LABEL_54;
  }
LABEL_53:
  self->_isEnabled = *((unsigned char *)v4 + 145);
  *(_DWORD *)&self->_has |= 0x100000u;
  int v9 = *((_DWORD *)v4 + 38);
  if ((v9 & 0x10) == 0)
  {
LABEL_29:
    if ((v9 & 8) == 0) {
      goto LABEL_30;
    }
    goto LABEL_55;
  }
LABEL_54:
  self->_double firedDate = *((double *)v4 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  int v9 = *((_DWORD *)v4 + 38);
  if ((v9 & 8) == 0)
  {
LABEL_30:
    if ((v9 & 0x400000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_56;
  }
LABEL_55:
  self->_double dismissedDate = *((double *)v4 + 4);
  *(_DWORD *)&self->_has |= 8u;
  int v9 = *((_DWORD *)v4 + 38);
  if ((v9 & 0x400000) == 0)
  {
LABEL_31:
    if ((v9 & 0x1000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_57;
  }
LABEL_56:
  self->_sleepMode = *((unsigned char *)v4 + 147);
  *(_DWORD *)&self->_has |= 0x400000u;
  int v9 = *((_DWORD *)v4 + 38);
  if ((v9 & 0x1000000) == 0)
  {
LABEL_32:
    if ((v9 & 0x800000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_58;
  }
LABEL_57:
  self->_sleepTracking = *((unsigned char *)v4 + 149);
  *(_DWORD *)&self->_has |= 0x1000000u;
  int v9 = *((_DWORD *)v4 + 38);
  if ((v9 & 0x800000) == 0)
  {
LABEL_33:
    if ((v9 & 0x10000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_59;
  }
LABEL_58:
  self->_sleepSchedule = *((unsigned char *)v4 + 148);
  *(_DWORD *)&self->_has |= 0x800000u;
  int v9 = *((_DWORD *)v4 + 38);
  if ((v9 & 0x10000) == 0)
  {
LABEL_34:
    if ((v9 & 0x40000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_60;
  }
LABEL_59:
  self->_onboardingVersion = *((_DWORD *)v4 + 28);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v9 = *((_DWORD *)v4 + 38);
  if ((v9 & 0x40000) == 0)
  {
LABEL_35:
    if ((v9 & 0x2000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_61;
  }
LABEL_60:
  self->_sleepModeOptions = *((_DWORD *)v4 + 30);
  *(_DWORD *)&self->_has |= 0x40000u;
  int v9 = *((_DWORD *)v4 + 38);
  if ((v9 & 0x2000000) == 0)
  {
LABEL_36:
    if ((v9 & 0x2000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_62;
  }
LABEL_61:
  self->_timeInBedTracking = *((unsigned char *)v4 + 150);
  *(_DWORD *)&self->_has |= 0x2000000u;
  int v9 = *((_DWORD *)v4 + 38);
  if ((v9 & 0x2000) == 0)
  {
LABEL_37:
    if ((v9 & 2) == 0) {
      goto LABEL_38;
    }
    goto LABEL_63;
  }
LABEL_62:
  self->_dismissedAction = *((_DWORD *)v4 + 25);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v9 = *((_DWORD *)v4 + 38);
  if ((v9 & 2) == 0)
  {
LABEL_38:
    if ((v9 & 1) == 0) {
      goto LABEL_39;
    }
    goto LABEL_64;
  }
LABEL_63:
  self->_double bedtimeFiredDate = *((double *)v4 + 2);
  *(_DWORD *)&self->_has |= 2u;
  int v9 = *((_DWORD *)v4 + 38);
  if ((v9 & 1) == 0)
  {
LABEL_39:
    if ((v9 & 0x100) == 0) {
      goto LABEL_40;
    }
    goto LABEL_65;
  }
LABEL_64:
  self->_double bedtimeDismissedDate = *((double *)v4 + 1);
  *(_DWORD *)&self->_has |= 1u;
  int v9 = *((_DWORD *)v4 + 38);
  if ((v9 & 0x100) == 0)
  {
LABEL_40:
    if ((v9 & 0x20) == 0) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }
LABEL_65:
  self->_bedtimeDismissedAction = *((_DWORD *)v4 + 20);
  *(_DWORD *)&self->_has |= 0x100u;
  if ((*((_DWORD *)v4 + 38) & 0x20) != 0)
  {
LABEL_41:
    self->_double keepOffUntilDate = *((double *)v4 + 6);
    *(_DWORD *)&self->_has |= 0x20u;
  }
LABEL_42:
  MEMORY[0x1F41817F8](sound, v4);
}

- (NSString)alarmID
{
  return self->_alarmID;
}

- (void)setAlarmID:(id)a3
{
}

- (unsigned)hour
{
  return self->_hour;
}

- (unsigned)minute
{
  return self->_minute;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (BOOL)allowsSnooze
{
  return self->_allowsSnooze;
}

- (unsigned)daySetting
{
  return self->_daySetting;
}

- (MTPBSound)sound
{
  return self->_sound;
}

- (void)setSound:(id)a3
{
}

- (BOOL)isSleepAlarm
{
  return self->_isSleepAlarm;
}

- (unsigned)bedtimeHour
{
  return self->_bedtimeHour;
}

- (unsigned)bedtimeMinute
{
  return self->_bedtimeMinute;
}

- (unsigned)bedtimeReminderMinutes
{
  return self->_bedtimeReminderMinutes;
}

- (unsigned)revision
{
  return self->_revision;
}

- (double)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (double)snoozeFireDate
{
  return self->_snoozeFireDate;
}

- (double)bedtimeSnoozeFireDate
{
  return self->_bedtimeSnoozeFireDate;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (double)firedDate
{
  return self->_firedDate;
}

- (double)dismissedDate
{
  return self->_dismissedDate;
}

- (BOOL)sleepMode
{
  return self->_sleepMode;
}

- (BOOL)sleepTracking
{
  return self->_sleepTracking;
}

- (BOOL)sleepSchedule
{
  return self->_sleepSchedule;
}

- (unsigned)onboardingVersion
{
  return self->_onboardingVersion;
}

- (unsigned)sleepModeOptions
{
  return self->_sleepModeOptions;
}

- (BOOL)timeInBedTracking
{
  return self->_timeInBedTracking;
}

- (unsigned)dismissedAction
{
  return self->_dismissedAction;
}

- (double)bedtimeFiredDate
{
  return self->_bedtimeFiredDate;
}

- (double)bedtimeDismissedDate
{
  return self->_bedtimeDismissedDate;
}

- (unsigned)bedtimeDismissedAction
{
  return self->_bedtimeDismissedAction;
}

- (double)keepOffUntilDate
{
  return self->_keepOffUntilDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_sound, 0);
  objc_storeStrong((id *)&self->_alarmID, 0);
}

@end