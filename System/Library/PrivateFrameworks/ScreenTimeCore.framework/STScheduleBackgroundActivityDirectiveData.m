@interface STScheduleBackgroundActivityDirectiveData
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDirectiveData:(id)a3;
- (NSNumber)interval;
- (STScheduleBackgroundActivityDirectiveData)initWithType:(int64_t)a3 interval:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)type;
@end

@implementation STScheduleBackgroundActivityDirectiveData

- (STScheduleBackgroundActivityDirectiveData)initWithType:(int64_t)a3 interval:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)STScheduleBackgroundActivityDirectiveData;
  id v5 = a4;
  v6 = [(STScheduleBackgroundActivityDirectiveData *)&v10 init];
  v6->_type = a3;
  v7 = (NSNumber *)objc_msgSend(v5, "copy", v10.receiver, v10.super_class);

  interval = v6->_interval;
  v6->_interval = v7;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  int64_t type = self->_type;
  interval = self->_interval;
  return [v4 initWithType:type interval:interval];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STScheduleBackgroundActivityDirectiveData *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(STScheduleBackgroundActivityDirectiveData *)self isEqualToDirectiveData:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToDirectiveData:(id)a3
{
  id v4 = (STScheduleBackgroundActivityDirectiveData *)a3;
  BOOL v5 = v4;
  if (v4 == self)
  {
    BOOL v12 = 1;
  }
  else
  {
    id v6 = [(STScheduleBackgroundActivityDirectiveData *)v4 type];
    if (v6 == (id)[(STScheduleBackgroundActivityDirectiveData *)self type])
    {
      v7 = [(STScheduleBackgroundActivityDirectiveData *)v5 interval];
      [v7 doubleValue];
      double v9 = v8;
      objc_super v10 = [(STScheduleBackgroundActivityDirectiveData *)self interval];
      [v10 doubleValue];
      BOOL v12 = v9 == v11;
    }
    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (int64_t)type
{
  return self->_type;
}

- (NSNumber)interval
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
}

@end