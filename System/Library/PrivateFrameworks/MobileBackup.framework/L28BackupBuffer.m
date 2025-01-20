@interface L28BackupBuffer
- (id)_initWithBuffer:(id)a3 nextDayIndex:(unsigned int)a4 endDay:(int64_t)a5;
- (id)_latestBackup;
- (id)_slotAtIndex:(unsigned int)a3;
- (id)_slots;
- (int)nextDayIndex;
- (int64_t)endDay;
- (void)_addNewEntry:(id)a3 entryDay:(int64_t)a4;
- (void)_updateCurrentMetrics:(id)a3 forDay:(int64_t)a4;
- (void)_updateLatestEntry:(id)a3;
- (void)setEndDay:(int64_t)a3;
- (void)setNextDayIndex:(int)a3;
@end

@implementation L28BackupBuffer

- (id)_initWithBuffer:(id)a3 nextDayIndex:(unsigned int)a4 endDay:(int64_t)a5
{
  id v8 = a3;
  if ((unint64_t)[v8 count] >= 0x1D) {
    __assert_rtn("-[L28BackupBuffer _initWithBuffer:nextDayIndex:endDay:]", "L28BackupStats.m", 63, "slots.count <= kMBL28BufferCapacity");
  }
  v18.receiver = self;
  v18.super_class = (Class)L28BackupBuffer;
  v9 = [(L28BackupBuffer *)&v18 init];
  v10 = v9;
  if (v9)
  {
    if (v8)
    {
      uint64_t v11 = 0;
      slots = v9->_slots;
      do
      {
        uint64_t v13 = [v8 objectAtIndexedSubscript:v11];
        v14 = slots[v11];
        slots[v11] = (NSDictionary *)v13;

        ++v11;
      }
      while (v11 != 28);
    }
    else
    {
      for (uint64_t i = 8; i != 232; i += 8)
      {
        v16 = *(Class *)((char *)&v10->super.isa + i);
        *(Class *)((char *)&v10->super.isa + i) = (Class)&off_10043B0A8;
      }
    }
    v10->_nextDayIndex = a4;
    v10->_endDay = a5;
  }

  return v10;
}

- (id)_slotAtIndex:(unsigned int)a3
{
  if (a3 >= 0x1C) {
    __assert_rtn("-[L28BackupBuffer _slotAtIndex:]", "L28BackupStats.m", 83, "index < kMBL28BufferCapacity");
  }
  v3 = self->_slots[a3];
  return v3;
}

- (id)_slots
{
  v3 = +[NSMutableArray array];
  uint64_t v4 = 0;
  slots = self->_slots;
  do
  {
    if (slots[v4]) {
      v6 = slots[v4];
    }
    else {
      v6 = (NSDictionary *)&__NSDictionary0__struct;
    }
    [v3 setObject:v6 atIndexedSubscript:v4++];
  }
  while (v4 != 28);
  return v3;
}

- (id)_latestBackup
{
  id v2 = [(NSDictionary *)self->_slots[(self->_nextDayIndex + 27) % 28] mutableCopy];
  return v2;
}

- (void)_addNewEntry:(id)a3 entryDay:(int64_t)a4
{
  v6 = (objc_class *)a3;
  int64_t endDay = self->_endDay;
  if (endDay == a4) {
    __assert_rtn("-[L28BackupBuffer _addNewEntry:entryDay:]", "L28BackupStats.m", 102, "entryDay != _endDay");
  }
  id v8 = v6;
  if (endDay)
  {
    unint64_t v9 = ~endDay + a4;
    if (v9 >= 0x1C) {
      unint64_t v9 = 28;
    }
    if (endDay <= a4) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 28;
    }
    if (v10)
    {
      slots = self->_slots;
      int nextDayIndex = self->_nextDayIndex;
      do
      {
        uint64_t v13 = slots[nextDayIndex];
        slots[nextDayIndex] = 0;

        int nextDayIndex = (self->_nextDayIndex + 1) % 28;
        self->_int nextDayIndex = nextDayIndex;
        --v10;
      }
      while (v10);
    }
  }
  v14 = &self->super.isa + self->_nextDayIndex;
  Class v15 = v14[1];
  v14[1] = v8;

  self->_int nextDayIndex = (self->_nextDayIndex + 1) % 28;
  self->_int64_t endDay = a4;
}

- (void)_updateLatestEntry:(id)a3
{
}

- (void)_updateCurrentMetrics:(id)a3 forDay:(int64_t)a4
{
  if (self->_endDay == a4) {
    [(L28BackupBuffer *)self _updateLatestEntry:a3];
  }
  else {
    -[L28BackupBuffer _addNewEntry:entryDay:](self, "_addNewEntry:entryDay:", a3);
  }
}

- (int)nextDayIndex
{
  return self->_nextDayIndex;
}

- (void)setNextDayIndex:(int)a3
{
  self->_int nextDayIndex = a3;
}

- (int64_t)endDay
{
  return self->_endDay;
}

- (void)setEndDay:(int64_t)a3
{
  self->_int64_t endDay = a3;
}

- (void).cxx_destruct
{
  uint64_t v3 = 224;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

@end