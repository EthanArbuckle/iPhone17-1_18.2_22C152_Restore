@interface _SOTimersSnapshotMutation
- (BOOL)isDirty;
- (_SOTimersSnapshotMutation)initWithBase:(id)a3;
- (id)getDate;
- (id)getTimersByID;
- (void)setDate:(id)a3;
- (void)setTimersByID:(id)a3;
@end

@implementation _SOTimersSnapshotMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timersByID, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setTimersByID:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (id)getTimersByID
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_timersByID;
  }
  else
  {
    v2 = [(SOTimersSnapshot *)self->_base timersByID];
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
    v2 = [(SOTimersSnapshot *)self->_base date];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_SOTimersSnapshotMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SOTimersSnapshotMutation;
  v6 = [(_SOTimersSnapshotMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end