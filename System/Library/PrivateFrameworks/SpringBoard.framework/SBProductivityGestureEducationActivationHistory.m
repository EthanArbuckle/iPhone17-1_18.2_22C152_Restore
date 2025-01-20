@interface SBProductivityGestureEducationActivationHistory
- (NSDate)date;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)count;
- (void)setCount:(int64_t)a3;
- (void)setDate:(id)a3;
@end

@implementation SBProductivityGestureEducationActivationHistory

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(SBProductivityGestureEducationActivationHistory);
  [(SBProductivityGestureEducationActivationHistory *)v4 setCount:self->_count];
  [(SBProductivityGestureEducationActivationHistory *)v4 setDate:self->_date];
  return v4;
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end