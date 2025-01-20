@interface _CHWorkoutDetailIntervalTableItem
- (CHWorkoutInterval)interval;
- (int64_t)intervalIndex;
- (void)setInterval:(id)a3;
- (void)setIntervalIndex:(int64_t)a3;
@end

@implementation _CHWorkoutDetailIntervalTableItem

- (int64_t)intervalIndex
{
  return self->_intervalIndex;
}

- (void)setIntervalIndex:(int64_t)a3
{
  self->_intervalIndex = a3;
}

- (CHWorkoutInterval)interval
{
  return self->_interval;
}

- (void)setInterval:(id)a3
{
}

- (void).cxx_destruct
{
}

@end