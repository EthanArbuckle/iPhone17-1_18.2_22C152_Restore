@interface _SOAlarmMutation
- (BOOL)getIsEnabled;
- (BOOL)getIsFiring;
- (BOOL)isDirty;
- (_SOAlarmMutation)initWithBase:(id)a3;
- (id)getAlarmID;
- (id)getAlarmURL;
- (id)getTitle;
- (unint64_t)getHour;
- (unint64_t)getMinute;
- (unint64_t)getRepeatSchedule;
- (void)setAlarmID:(id)a3;
- (void)setAlarmURL:(id)a3;
- (void)setHour:(unint64_t)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setIsFiring:(BOOL)a3;
- (void)setMinute:(unint64_t)a3;
- (void)setRepeatSchedule:(unint64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation _SOAlarmMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_alarmURL, 0);
  objc_storeStrong((id *)&self->_alarmID, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setIsFiring:(BOOL)a3
{
  self->_isFiring = a3;
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (BOOL)getIsFiring
{
  if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0) {
    return self->_isFiring;
  }
  else {
    return [(SOAlarm *)self->_base isFiring];
  }
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (BOOL)getIsEnabled
{
  if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0) {
    return self->_isEnabled;
  }
  else {
    return [(SOAlarm *)self->_base isEnabled];
  }
}

- (void)setRepeatSchedule:(unint64_t)a3
{
  self->_repeatSchedule = a3;
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (unint64_t)getRepeatSchedule
{
  if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0) {
    return self->_repeatSchedule;
  }
  else {
    return [(SOAlarm *)self->_base repeatSchedule];
  }
}

- (void)setMinute:(unint64_t)a3
{
  self->_minute = a3;
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (unint64_t)getMinute
{
  if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0) {
    return self->_minute;
  }
  else {
    return [(SOAlarm *)self->_base minute];
  }
}

- (void)setHour:(unint64_t)a3
{
  self->_hour = a3;
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (unint64_t)getHour
{
  if ((*(_WORD *)&self->_mutationFlags & 0x10) != 0) {
    return self->_hour;
  }
  else {
    return [(SOAlarm *)self->_base hour];
  }
}

- (void)setTitle:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (id)getTitle
{
  if ((*(_WORD *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_title;
  }
  else
  {
    v2 = [(SOAlarm *)self->_base title];
  }
  return v2;
}

- (void)setAlarmURL:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (id)getAlarmURL
{
  if ((*(_WORD *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_alarmURL;
  }
  else
  {
    v2 = [(SOAlarm *)self->_base alarmURL];
  }
  return v2;
}

- (void)setAlarmID:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (id)getAlarmID
{
  if ((*(_WORD *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_alarmID;
  }
  else
  {
    v2 = [(SOAlarm *)self->_base alarmID];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(_WORD *)&self->_mutationFlags & 1;
}

- (_SOAlarmMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SOAlarmMutation;
  v6 = [(_SOAlarmMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end