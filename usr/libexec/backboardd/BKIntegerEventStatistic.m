@interface BKIntegerEventStatistic
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)value;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)increment;
- (void)reset;
- (void)setValue:(int64_t)a3;
@end

@implementation BKIntegerEventStatistic

- (void)appendDescriptionToFormatter:(id)a3
{
  int64_t value = self->_value;
  if (value)
  {
    id v5 = a3;
    v6 = [(BKEventStatistic *)self label];
    id v7 = [v5 appendInteger:value withName:v6];

    v8.receiver = self;
    v8.super_class = (Class)BKIntegerEventStatistic;
    [(BKEventStatistic *)&v8 appendDescriptionToFormatter:v5];
  }
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)BKIntegerEventStatistic;
  [(BKEventStatistic *)&v3 reset];
  self->_int64_t value = 0;
}

- (void)increment
{
}

- (int64_t)value
{
  return self->_value;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKIntegerEventStatistic;
  id result = [(BKEventStatistic *)&v5 copyWithZone:a3];
  *((void *)result + 4) = self->_value;
  return result;
}

- (void)setValue:(int64_t)a3
{
  if (self->_value != a3)
  {
    self->_int64_t value = a3;
    [(BKEventStatistic *)self setNeedsLogging:1];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;

  id v9 = [v8 value];
  BOOL v10 = v9 == self->_value;

  return v10;
}

- (unint64_t)hash
{
  v2 = +[NSNumber numberWithInteger:self->_value];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

@end