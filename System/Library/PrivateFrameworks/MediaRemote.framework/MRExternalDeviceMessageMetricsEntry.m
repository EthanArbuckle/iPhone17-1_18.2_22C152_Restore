@interface MRExternalDeviceMessageMetricsEntry
- (MRExternalDeviceMessageMetricsEntry)init;
- (NSMutableArray)values;
- (id)description;
- (unint64_t)avg;
- (unint64_t)max;
- (unint64_t)min;
- (unint64_t)total;
- (void)setAvg:(unint64_t)a3;
- (void)setMax:(unint64_t)a3;
- (void)setMin:(unint64_t)a3;
- (void)setTotal:(unint64_t)a3;
- (void)setValues:(id)a3;
- (void)updateWithValue:(unint64_t)a3;
@end

@implementation MRExternalDeviceMessageMetricsEntry

- (MRExternalDeviceMessageMetricsEntry)init
{
  v6.receiver = self;
  v6.super_class = (Class)MRExternalDeviceMessageMetricsEntry;
  v2 = [(MRExternalDeviceMessageMetricsEntry *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    values = v2->_values;
    v2->_values = v3;

    v2->_min = -1;
  }
  return v2;
}

- (void)updateWithValue:(unint64_t)a3
{
  values = self->_values;
  objc_super v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  [(NSMutableArray *)values addObject:v6];

  if (self->_max < a3) {
    self->_max = a3;
  }
  if (self->_min > a3) {
    self->_min = a3;
  }
  v7 = self->_values;
  unint64_t v8 = self->_total + a3;
  self->_total = v8;
  self->_avg = v8 / [(NSMutableArray *)v7 count];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Max: %lu\n Min: %lu\n Avg: %lu\n Total: %lu\n Values: %@\n", self->_max, self->_min, self->_avg, self->_total, self->_values];
}

- (unint64_t)avg
{
  return self->_avg;
}

- (void)setAvg:(unint64_t)a3
{
  self->_avg = a3;
}

- (unint64_t)min
{
  return self->_min;
}

- (void)setMin:(unint64_t)a3
{
  self->_min = a3;
}

- (unint64_t)max
{
  return self->_max;
}

- (void)setMax:(unint64_t)a3
{
  self->_max = a3;
}

- (unint64_t)total
{
  return self->_total;
}

- (void)setTotal:(unint64_t)a3
{
  self->_total = a3;
}

- (NSMutableArray)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
}

- (void).cxx_destruct
{
}

@end