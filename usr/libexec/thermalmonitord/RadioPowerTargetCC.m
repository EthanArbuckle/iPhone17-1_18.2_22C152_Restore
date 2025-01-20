@interface RadioPowerTargetCC
- (RadioPowerTargetCC)initWithRunLoopAndParams:(__CFRunLoop *)a3 withParams:(__CFDictionary *)a4;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (int)numberOfFields;
- (void)addRadioMitigations;
- (void)calculateAdditionalRadioMitigations;
- (void)setAdditionalRadioMitigations;
@end

@implementation RadioPowerTargetCC

- (RadioPowerTargetCC)initWithRunLoopAndParams:(__CFRunLoop *)a3 withParams:(__CFDictionary *)a4
{
  v8.receiver = self;
  v8.super_class = (Class)RadioPowerTargetCC;
  v5 = -[RadioCC initWithRunLoopAndParams:withParams:](&v8, "initWithRunLoopAndParams:withParams:", a3);
  v6 = v5;
  if (v5)
  {
    *(&v5->super.maxLoadingIndexPrevious + 1) = -1;
    if (a4
      && sub_100008280(a4, @"maxRadioPower", kCFNumberIntType, &v5->super.maxLoadingIndexPrevious + 1)&& (sub_100008280(a4, @"minRadioPower", kCFNumberIntType, &v6->radioPowerTarget) & 1) == 0)
    {
      v6->radioPowerTarget = 0;
    }
    [(RadioPowerTargetCC *)v6 calculateAdditionalRadioMitigations];
    [(RadioPowerTargetCC *)v6 addRadioMitigations];
  }
  return v6;
}

- (void)addRadioMitigations
{
}

- (void)calculateAdditionalRadioMitigations
{
  signed int previousValue = self->super.super.previousValue;
  if (previousValue <= 99)
  {
    uint64_t v4 = 1374389535 * *(&self->super.maxLoadingIndexPrevious + 1) * (previousValue & ~(previousValue >> 31));
    signed int radioPowerTarget = (v4 >> 37) + ((unint64_t)v4 >> 63);
    if (radioPowerTarget <= self->radioPowerTarget) {
      signed int radioPowerTarget = self->radioPowerTarget;
    }
  }
  else
  {
    signed int radioPowerTarget = 65000;
  }
  self->super.maxLoadingIndexPrevious = radioPowerTarget;
}

- (void)setAdditionalRadioMitigations
{
}

- (int)numberOfFields
{
  v3.receiver = self;
  v3.super_class = (Class)RadioPowerTargetCC;
  return [(RadioCC *)&v3 numberOfFields] + 1;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)RadioPowerTargetCC;
  if ([(RadioCC *)&v8 numberOfFields] <= a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)RadioPowerTargetCC;
    if ([(RadioCC *)&v6 numberOfFields] == v3) {
      return @"Radio - powerTarget";
    }
    else {
      return 0;
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)RadioPowerTargetCC;
    return [(RadioCC *)&v7 copyHeaderForIndex:v3];
  }
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)RadioPowerTargetCC;
  if ([(RadioCC *)&v8 numberOfFields] <= a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)RadioPowerTargetCC;
    if ([(RadioCC *)&v6 numberOfFields] == v3) {
      return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%d", self->super.maxLoadingIndexPrevious);
    }
    else {
      return 0;
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)RadioPowerTargetCC;
    return [(RadioCC *)&v7 copyFieldCurrentValueForIndex:v3];
  }
}

@end