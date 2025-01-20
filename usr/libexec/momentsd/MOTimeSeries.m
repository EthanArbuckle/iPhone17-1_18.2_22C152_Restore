@interface MOTimeSeries
- (NSDate)date;
- (double)value;
- (unint64_t)count;
- (void)setCount:(unint64_t)a3;
- (void)setDate:(id)a3;
- (void)setValue:(double)a3;
@end

@implementation MOTimeSeries

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_value = a3;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (void).cxx_destruct
{
}

@end