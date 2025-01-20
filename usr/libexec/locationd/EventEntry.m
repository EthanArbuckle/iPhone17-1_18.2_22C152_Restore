@interface EventEntry
- (EventEntry)initWithTime:(double)a3 andEvent:(int)a4;
- (double)time;
- (id)description;
- (int)eventnum;
- (void)dealloc;
- (void)setEventnum:(int)a3;
- (void)setTime:(double)a3;
@end

@implementation EventEntry

- (EventEntry)initWithTime:(double)a3 andEvent:(int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)EventEntry;
  result = [(EventEntry *)&v7 init];
  if (result)
  {
    result->_time = a3;
    result->_eventnum = a4;
  }
  return result;
}

- (id)description
{
  return +[NSString stringWithFormat:@"%d:%d", (int)self->_time, self->_eventnum];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)EventEntry;
  [(EventEntry *)&v2 dealloc];
}

- (double)time
{
  return self->_time;
}

- (void)setTime:(double)a3
{
  self->_time = a3;
}

- (int)eventnum
{
  return self->_eventnum;
}

- (void)setEventnum:(int)a3
{
  self->_eventnum = a3;
}

@end