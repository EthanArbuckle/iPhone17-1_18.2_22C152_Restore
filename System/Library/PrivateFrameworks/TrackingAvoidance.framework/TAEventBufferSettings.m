@interface TAEventBufferSettings
- (TAEventBufferSettings)initWithBufferCapacity:(unint64_t)a3 bufferTimeIntervalOfRetention:(double)a4;
- (TAEventBufferSettings)initWithBufferCapacityOrDefault:(id)a3 bufferTimeIntervalOfRetentionOrDefault:(id)a4;
- (double)bufferTimeIntervalOfRetention;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)bufferCapacity;
@end

@implementation TAEventBufferSettings

- (double)bufferTimeIntervalOfRetention
{
  return self->_bufferTimeIntervalOfRetention;
}

- (TAEventBufferSettings)initWithBufferCapacity:(unint64_t)a3 bufferTimeIntervalOfRetention:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TAEventBufferSettings;
  result = [(TAEventBufferSettings *)&v7 init];
  if (result)
  {
    result->_bufferCapacity = a3;
    result->_bufferTimeIntervalOfRetention = a4;
  }
  return result;
}

- (TAEventBufferSettings)initWithBufferCapacityOrDefault:(id)a3 bufferTimeIntervalOfRetentionOrDefault:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    uint64_t v9 = 10000;
    if (v7) {
      goto LABEL_3;
    }
LABEL_5:
    double v10 = 1800.0;
    goto LABEL_6;
  }
  uint64_t v9 = [v6 unsignedIntegerValue];
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  [v8 doubleValue];
LABEL_6:
  v11 = [(TAEventBufferSettings *)self initWithBufferCapacity:v9 bufferTimeIntervalOfRetention:v10];

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[TAEventBufferSettings allocWithZone:a3];
  unint64_t bufferCapacity = self->_bufferCapacity;
  double bufferTimeIntervalOfRetention = self->_bufferTimeIntervalOfRetention;
  return [(TAEventBufferSettings *)v4 initWithBufferCapacity:bufferCapacity bufferTimeIntervalOfRetention:bufferTimeIntervalOfRetention];
}

- (unint64_t)bufferCapacity
{
  return self->_bufferCapacity;
}

@end