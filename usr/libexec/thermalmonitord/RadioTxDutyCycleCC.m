@interface RadioTxDutyCycleCC
- (RadioTxDutyCycleCC)initWithRunLoopAndParams:(__CFRunLoop *)a3 withParams:(__CFDictionary *)a4;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (int)numberOfFields;
- (void)addRadioMitigations;
- (void)calculateAdditionalRadioMitigations;
- (void)setAdditionalRadioMitigations;
@end

@implementation RadioTxDutyCycleCC

- (RadioTxDutyCycleCC)initWithRunLoopAndParams:(__CFRunLoop *)a3 withParams:(__CFDictionary *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)RadioTxDutyCycleCC;
  v5 = -[RadioCC initWithRunLoopAndParams:withParams:](&v9, "initWithRunLoopAndParams:withParams:", a3);
  v6 = v5;
  if (v5)
  {
    *(&v5->super.maxLoadingIndexPrevious + 1) = 250;
    if (a4)
    {
      unsigned int v8 = 0;
      if (sub_100008280(a4, @"minRadioTxDutyCycle", kCFNumberIntType, &v8)) {
        *(&v6->super.maxLoadingIndexPrevious + 1) = v8;
      }
    }
    [(RadioTxDutyCycleCC *)v6 calculateAdditionalRadioMitigations];
    [(RadioTxDutyCycleCC *)v6 addRadioMitigations];
  }
  return v6;
}

- (void)addRadioMitigations
{
}

- (void)calculateAdditionalRadioMitigations
{
  unsigned int v2 = self->super.super.previousValue & ~((int)self->super.super.previousValue >> 31);
  if (v2 >= 0x64) {
    unsigned int v2 = 100;
  }
  signed int v3 = 10 * v2;
  if (v3 <= (signed int)*(&self->super.maxLoadingIndexPrevious + 1)) {
    signed int v3 = *(&self->super.maxLoadingIndexPrevious + 1);
  }
  self->super.maxLoadingIndexPrevious = v3;
}

- (void)setAdditionalRadioMitigations
{
}

- (int)numberOfFields
{
  v3.receiver = self;
  v3.super_class = (Class)RadioTxDutyCycleCC;
  return [(RadioCC *)&v3 numberOfFields] + 1;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)RadioTxDutyCycleCC;
  if ([(RadioCC *)&v8 numberOfFields] <= a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)RadioTxDutyCycleCC;
    if ([(RadioCC *)&v6 numberOfFields] == v3) {
      return @"Radio - txDutyCycleLimit/10";
    }
    else {
      return 0;
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)RadioTxDutyCycleCC;
    return [(RadioCC *)&v7 copyHeaderForIndex:v3];
  }
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)RadioTxDutyCycleCC;
  if ([(RadioCC *)&v8 numberOfFields] <= a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)RadioTxDutyCycleCC;
    if ([(RadioCC *)&v6 numberOfFields] == v3) {
      return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%d", ((signed int)self->super.maxLoadingIndexPrevious / 10));
    }
    else {
      return 0;
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)RadioTxDutyCycleCC;
    return [(RadioCC *)&v7 copyFieldCurrentValueForIndex:v3];
  }
}

@end