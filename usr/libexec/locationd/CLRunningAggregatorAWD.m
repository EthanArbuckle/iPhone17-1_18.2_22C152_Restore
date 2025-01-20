@interface CLRunningAggregatorAWD
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetCompanionOnlyNoGPSRun;
- (CLRunningAggregatorAWD)init;
- (id).cxx_construct;
- (id)onStepNotification:(int)a3 data:(uint64_t)a4;
- (void)ageOutStepArray;
- (void)beginService;
- (void)checkForRunningThreshold;
- (void)clearStepArray;
- (void)endService;
- (void)updateSession:(int64_t)a3;
@end

@implementation CLRunningAggregatorAWD

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)[a3 count]) {
    [objc_msgSend(a3, "objectAtIndexedSubscript:", v5) becameFatallyBlocked:a3 index:v5];
  }
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_102481C20 != -1) {
    dispatch_once(&qword_102481C20, &stru_1022FC158);
  }
  return (id)qword_102481C18;
}

- (CLRunningAggregatorAWD)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLRunningAggregatorAWD;
  return [(CLRunningAggregatorAWD *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLRunningAggregatorAWDServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLRunningAggregatorAWDClientProtocol];
}

+ (BOOL)isSupported
{
  sub_100103240();

  return sub_10016CCBC();
}

- (void)beginService
{
  [self universe].silo
  self->fHasRun = 0;
  self->fInSession = 0;
  value = self->fStepCountClient.__ptr_.__value_;
  self->fStepCountClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8))(value);
  }
  sub_100103240();
  if (sub_100106424())
  {
    if (objc_msgSend(objc_msgSend(-[CLRunningAggregatorAWD universe](self, "universe"), "vendor"), "isServiceEnabled:", @"CLStepCountNotifier"))
    {
      [(CLRunningAggregatorAWD *)self universe];
      sub_101589B60();
    }
  }
}

- (void)endService
{
  [self universe].silo
  value = self->fStepCountClient.__ptr_.__value_;
  if (value)
  {
    self->fStepCountClient.__ptr_.__value_ = 0;
    v4 = *(void (**)(void))(*(void *)value + 8);
    v4();
  }
}

- (BOOL)syncgetCompanionOnlyNoGPSRun
{
  BOOL fHasRun = self->fHasRun;
  self->BOOL fHasRun = 0;
  return fHasRun;
}

- (id)onStepNotification:(int)a3 data:(uint64_t)a4
{
  id result = [objc_msgSend((id)a1, "universe") silo];
  if (!a3 && !*(unsigned char *)(a1 + 8))
  {
    if (*(unsigned char *)(a1 + 9) || *(unsigned char *)(a4 + 112)) {
      [(id)a1 clearStepArray];
    }
    else {
      sub_100E4CA54((void *)(a1 + 16), (void *)(a4 + 8), (void *)(a4 + 80));
    }
    [(id)a1 ageOutStepArray];
    return _[(id)a1 checkForRunningThreshold];
  }
  return result;
}

- (void)updateSession:(int64_t)a3
{
  self->fInSession = a3 != 0;
}

- (void)ageOutStepArray
{
  double Current = CFAbsoluteTimeGetCurrent();
  p_fStepWindow = &self->fStepWindow;
  unint64_t value = p_fStepWindow->__size_.__value_;
  if (value)
  {
    double v6 = Current;
    do
    {
      unint64_t start = p_fStepWindow->__start_;
      if (v6
         - (*(double **)((char *)p_fStepWindow->__map_.__begin_ + ((start >> 5) & 0x7FFFFFFFFFFFFF8)))[2 * start] <= 750.0)
        break;
      p_fStepWindow->__start_ = start + 1;
      p_fStepWindow->__size_.__value_ = value - 1;
      sub_100096314((uint64_t)p_fStepWindow, 1);
      unint64_t value = p_fStepWindow->__size_.__value_;
    }
    while (value);
  }
}

- (void)clearStepArray
{
  p_fStepWindow = &self->fStepWindow;
  begin = self->fStepWindow.__map_.__begin_;
  end = self->fStepWindow.__map_.__end_;
  self->fStepWindow.__size_.__value_ = 0;
  unint64_t v5 = (char *)end - (char *)begin;
  if (v5 >= 0x11)
  {
    do
    {
      operator delete(*begin);
      double v6 = p_fStepWindow->__map_.__end_;
      begin = p_fStepWindow->__map_.__begin_ + 1;
      p_fStepWindow->__map_.__begin_ = begin;
      unint64_t v5 = (char *)v6 - (char *)begin;
    }
    while (v5 > 0x10);
  }
  if (v5 >> 3 == 1)
  {
    uint64_t v7 = 128;
  }
  else
  {
    if (v5 >> 3 != 2) {
      return;
    }
    uint64_t v7 = 256;
  }
  p_fStepWindow->__start_ = v7;
}

- (void)checkForRunningThreshold
{
  p_fStepWindow = &self->fStepWindow;
  unint64_t start = self->fStepWindow.__start_;
  begin = self->fStepWindow.__map_.__begin_;
  end = self->fStepWindow.__map_.__end_;
  uint64_t v7 = &begin[start >> 8];
  if (end == begin) {
    v8 = 0;
  }
  else {
    v8 = (double *)((char *)*v7 + 16 * start);
  }
  double v9 = 0.0;
  while (1)
  {
    unint64_t v10 = start + p_fStepWindow->__size_.__value_;
    v11 = &begin[v10 >> 8];
    uint64_t v12 = end == begin ? 0 : (uint64_t)*v11 + 16 * v10;
    if (v8 == (double *)v12) {
      break;
    }
    if (v8[1] >= 2.33333333)
    {
      v13 = *v11;
      uint64_t v14 = (uint64_t)*v11 + 16 * v10;
      if (end == begin) {
        uint64_t v15 = 0;
      }
      else {
        uint64_t v15 = v14;
      }
      uint64_t v16 = v15 - (void)v13;
      uint64_t v17 = (v15 - (uint64_t)v13) >> 4;
      if (v16 < 17) {
        uint64_t v18 = (uint64_t)v11[-((unint64_t)(256 - v17) >> 8)] + 16 * (v17 - 1);
      }
      else {
        uint64_t v18 = *(uint64_t *)((char *)v11 + (((unint64_t)(v17 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
      }
            + 16 * (v17 - 1);
      if (v8 == (double *)v18)
      {
        double Current = CFAbsoluteTimeGetCurrent();
      }
      else
      {
        uint64_t v19 = (char *)v8 - (unsigned char *)*v7;
        uint64_t v20 = v19 >> 4;
        if (v19 < -15) {
          v21 = (double *)((char *)v7[-((unint64_t)(254 - v20) >> 8)] + 16 * ~(-2 - v20));
        }
        else {
          v21 = (double *)(*(char **)((char *)v7 + (((unint64_t)(v20 + 1) >> 5) & 0x7FFFFFFFFFFFFF8))
        }
                         + 16 * (v20 + 1));
        double Current = *v21;
      }
      double v9 = v9 + Current - *v8;
    }
    v8 += 2;
    if ((char *)v8 - (unsigned char *)*v7 == 4096)
    {
      v23 = (double *)v7[1];
      ++v7;
      v8 = v23;
    }
    unint64_t start = p_fStepWindow->__start_;
    begin = p_fStepWindow->__map_.__begin_;
    end = p_fStepWindow->__map_.__end_;
  }
  if (v9 >= 600.0) {
    self->BOOL fHasRun = 1;
  }
}

- (void).cxx_destruct
{
  unint64_t value = self->fStepCountClient.__ptr_.__value_;
  self->fStepCountClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8))(value, a2);
  }

  sub_1000D80C4(&self->fStepWindow.__map_.__first_);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((void *)self + 8) = 0;
  return self;
}

@end