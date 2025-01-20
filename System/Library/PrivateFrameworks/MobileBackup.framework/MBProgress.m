@interface MBProgress
- (BOOL)isFinished;
- (MBProgress)init;
- (MBProgressDelegate)delegate;
- (double)current;
- (double)offset;
- (double)percentage;
- (double)scale;
- (double)total;
- (void)addDuration:(double)a3;
- (void)setCurrent:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setOffset:(double)a3;
- (void)setScale:(double)a3;
- (void)setTotal:(double)a3;
- (void)updateWithDuration:(double)a3 size:(unint64_t)a4;
@end

@implementation MBProgress

- (MBProgress)init
{
  v3.receiver = self;
  v3.super_class = (Class)MBProgress;
  result = [(MBProgress *)&v3 init];
  if (result) {
    result->_scale = 1.0;
  }
  return result;
}

- (double)percentage
{
  return self->_offset + self->_scale * (100.0 - self->_offset) * (self->_current / self->_total);
}

- (BOOL)isFinished
{
  double current = self->_current;
  double total = self->_total;
  return current <= total + 0.001 && total + -0.001 <= current;
}

- (void)addDuration:(double)a3
{
  if (a3 < 0.0)
  {
    v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"MBProgress.m" lineNumber:31 description:@"Negative duration"];
  }
  self->_double total = self->_total + a3;
}

- (void)updateWithDuration:(double)a3 size:(unint64_t)a4
{
  double total = self->_total;
  double v7 = self->_current + a3;
  self->_double current = v7;
  if (v7 > total + 0.001)
  {
    v10 = +[NSAssertionHandler currentHandler];
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MBProgress.m", 37, @"Progress overflow (%0.4f > %0.4f)", *(void *)&self->_current, *(void *)&self->_total);
  }
  delegate = self->_delegate;
  [(MBProgress *)self percentage];
  -[MBProgressDelegate progressUpdatedWithPercentage:size:](delegate, "progressUpdatedWithPercentage:size:", a4);
}

- (MBProgressDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (double)offset
{
  return self->_offset;
}

- (void)setOffset:(double)a3
{
  self->_offset = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (double)current
{
  return self->_current;
}

- (void)setCurrent:(double)a3
{
  self->_double current = a3;
}

- (double)total
{
  return self->_total;
}

- (void)setTotal:(double)a3
{
  self->_double total = a3;
}

- (void).cxx_destruct
{
}

@end