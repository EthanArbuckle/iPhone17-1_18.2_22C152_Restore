@interface CRLFidgetResolver
- (CRLFidgetResolver)init;
- (double)fidgetThreshold;
- (id)nonFidgetValue;
- (unint64_t)p_previousValidIndexFromIndex:(unint64_t)a3;
- (void)p_advanceHead;
- (void)pushValue:(id)a3;
- (void)pushValue:(id)a3 withTime:(double)a4;
- (void)setFidgetThreshold:(double)a3;
@end

@implementation CRLFidgetResolver

- (CRLFidgetResolver)init
{
  v3.receiver = self;
  v3.super_class = (Class)CRLFidgetResolver;
  result = [(CRLFidgetResolver *)&v3 init];
  if (result)
  {
    result->_fidgetThreshold = 0.1;
    result->_head = 9;
  }
  return result;
}

- (id)nonFidgetValue
{
  double v3 = CFAbsoluteTimeGetCurrent() - self->_fidgetThreshold;
  unint64_t head = self->_head;
  id v5 = self->_values[head];
  v6 = v5;
  double v7 = self->_times[self->_head];
  if (v5) {
    BOOL v8 = v7 <= v3;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    id v9 = v5;
  }
  else
  {
    while (1)
    {
      unint64_t v10 = -[CRLFidgetResolver p_previousValidIndexFromIndex:](self, "p_previousValidIndexFromIndex:", head, v7);
      if (v10 == self->_head) {
        break;
      }
      unint64_t head = v10;
      id v9 = self->_values[v10];

      double v7 = self->_times[head];
      if (v9) {
        BOOL v11 = v7 <= v3;
      }
      else {
        BOOL v11 = 1;
      }
      v6 = v9;
      if (v11) {
        goto LABEL_15;
      }
    }

    id v9 = 0;
  }
LABEL_15:

  return v9;
}

- (void)pushValue:(id)a3
{
  id v4 = a3;
  [(CRLFidgetResolver *)self pushValue:v4 withTime:CFAbsoluteTimeGetCurrent()];
}

- (void)pushValue:(id)a3 withTime:(double)a4
{
  v6 = (objc_class *)a3;
  [(CRLFidgetResolver *)self p_advanceHead];
  double v7 = &self->super.isa + self->_head;
  Class v8 = v7[2];
  v7[2] = v6;

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

- (void).cxx_destruct
{
  for (uint64_t i = 88; i != 8; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
}

@end