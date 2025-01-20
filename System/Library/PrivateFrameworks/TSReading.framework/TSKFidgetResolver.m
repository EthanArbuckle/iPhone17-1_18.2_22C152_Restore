@interface TSKFidgetResolver
- (TSKFidgetResolver)init;
- (double)fidgetThreshold;
- (id)nonFidgetValue;
- (unint64_t)p_previousValidIndexFromIndex:(unint64_t)a3;
- (void)dealloc;
- (void)p_advanceHead;
- (void)pushValue:(id)a3;
- (void)pushValue:(id)a3 withTime:(double)a4;
- (void)setFidgetThreshold:(double)a3;
@end

@implementation TSKFidgetResolver

- (TSKFidgetResolver)init
{
  v5.receiver = self;
  v5.super_class = (Class)TSKFidgetResolver;
  v2 = [(TSKFidgetResolver *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_fidgetThreshold = 0.1;
    v2->_values = (id *)malloc_type_calloc(0xAuLL, 8uLL, 0x80040B8603338uLL);
    v3->_times = (double *)malloc_type_calloc(0xAuLL, 8uLL, 0x100004000313F17uLL);
    v3->_head = 9;
  }
  return v3;
}

- (void)dealloc
{
  for (uint64_t i = 0; i != 10; ++i)

  free(self->_values);
  free(self->_times);
  v4.receiver = self;
  v4.super_class = (Class)TSKFidgetResolver;
  [(TSKFidgetResolver *)&v4 dealloc];
}

- (id)nonFidgetValue
{
  double v3 = CFAbsoluteTimeGetCurrent() - self->_fidgetThreshold;
  for (unint64_t i = self->_head; ; unint64_t i = v8)
  {
    id result = self->_values[i];
    double v6 = self->_times[i];
    if (!result || v6 <= v3) {
      break;
    }
    unint64_t v8 = [(TSKFidgetResolver *)self p_previousValidIndexFromIndex:v6];
    if (v8 == self->_head) {
      return 0;
    }
  }
  return result;
}

- (void)pushValue:(id)a3
{
  double Current = CFAbsoluteTimeGetCurrent();

  [(TSKFidgetResolver *)self pushValue:a3 withTime:Current];
}

- (void)pushValue:(id)a3 withTime:(double)a4
{
  [(TSKFidgetResolver *)self p_advanceHead];
  id v7 = a3;

  self->_values[self->_head] = a3;
  self->_times[self->_head] = a4;
}

- (void)p_advanceHead
{
  unint64_t head = self->_head;
  if (head == 9) {
    unint64_t v3 = 0;
  }
  else {
    unint64_t v3 = head + 1;
  }
  self->_unint64_t head = v3;
}

- (unint64_t)p_previousValidIndexFromIndex:(unint64_t)a3
{
  if (a3) {
    return a3 - 1;
  }
  else {
    return 9;
  }
}

- (double)fidgetThreshold
{
  return self->_fidgetThreshold;
}

- (void)setFidgetThreshold:(double)a3
{
  self->_fidgetThreshold = a3;
}

@end