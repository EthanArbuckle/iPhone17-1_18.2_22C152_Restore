@interface _SOAlarmsSnapshotMutation
- (BOOL)isDirty;
- (_SOAlarmsSnapshotMutation)initWithBase:(id)a3;
- (id)getAlarmsByID;
- (id)getDate;
- (id)getDismissedAlarmIDs;
- (id)getFiringAlarmIDs;
- (void)setAlarmsByID:(id)a3;
- (void)setDate:(id)a3;
- (void)setDismissedAlarmIDs:(id)a3;
- (void)setFiringAlarmIDs:(id)a3;
@end

@implementation _SOAlarmsSnapshotMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissedAlarmIDs, 0);
  objc_storeStrong((id *)&self->_firingAlarmIDs, 0);
  objc_storeStrong((id *)&self->_alarmsByID, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setDismissedAlarmIDs:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x11u;
}

- (id)getDismissedAlarmIDs
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_dismissedAlarmIDs;
  }
  else
  {
    v2 = [(SOAlarmsSnapshot *)self->_base dismissedAlarmIDs];
  }
  return v2;
}

- (void)setFiringAlarmIDs:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (id)getFiringAlarmIDs
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_firingAlarmIDs;
  }
  else
  {
    v2 = [(SOAlarmsSnapshot *)self->_base firingAlarmIDs];
  }
  return v2;
}

- (void)setAlarmsByID:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (id)getAlarmsByID
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_alarmsByID;
  }
  else
  {
    v2 = [(SOAlarmsSnapshot *)self->_base alarmsByID];
  }
  return v2;
}

- (void)setDate:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (id)getDate
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_date;
  }
  else
  {
    v2 = [(SOAlarmsSnapshot *)self->_base date];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_SOAlarmsSnapshotMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SOAlarmsSnapshotMutation;
  v6 = [(_SOAlarmsSnapshotMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end