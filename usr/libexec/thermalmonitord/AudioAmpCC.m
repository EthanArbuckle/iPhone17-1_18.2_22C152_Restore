@interface AudioAmpCC
- (AudioAmpCC)initWithParams:(__CFDictionary *)a3;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (int)numberOfFields;
- (void)defaultAction;
@end

@implementation AudioAmpCC

- (AudioAmpCC)initWithParams:(__CFDictionary *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AudioAmpCC;
  v4 = [(ComponentControl *)&v7 initWithCC:10 :0];
  v5 = v4;
  if (v4)
  {
    *(_DWORD *)&v4->super.allowLIOverride = 100;
    *(&v4->super.currentPower + 1) = 1109393408;
    v4->_targetPower = 0.0;
    v4->super.super.nameofComponent = (__CFString *)CFStringCreateWithFormat(0, 0, @"%d AudioAmp ", 10);
    v5->super.previousValue = v5->super.currentLoadingIndex;
    if (a3) {
      sub_100008280(a3, @"maxAudioAmpPower", kCFNumberFloatType, &v5->_currentPower);
    }
  }
  return v5;
}

- (void)defaultAction
{
  unsigned int currentLoadingIndex = self->super.currentLoadingIndex;
  if (currentLoadingIndex != self->super.maxLoadingIndex)
  {
    *((float *)&self->super.currentPower + 1) = (float)(self->_currentPower * (float)currentLoadingIndex) / 100.0;
    self->super.maxLoadingIndex = currentLoadingIndex;
  }
}

- (int)numberOfFields
{
  v3.receiver = self;
  v3.super_class = (Class)AudioAmpCC;
  return [(ComponentControl *)&v3 numberOfFields] + 2;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)AudioAmpCC;
  if ([(ComponentControl *)&v10 numberOfFields] <= a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)AudioAmpCC;
    unsigned int v6 = [(ComponentControl *)&v8 numberOfFields];
    if (v3 - v6 == 1) {
      objc_super v7 = @"AudioAmpCC current power";
    }
    else {
      objc_super v7 = 0;
    }
    if (v3 == v6) {
      return @"AudioAmpCC target power";
    }
    else {
      return v7;
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)AudioAmpCC;
    return [(ComponentControl *)&v9 copyHeaderForIndex:v3];
  }
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)AudioAmpCC;
  if ([(ComponentControl *)&v11 numberOfFields] > a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)AudioAmpCC;
    return [(ComponentControl *)&v10 copyFieldCurrentValueForIndex:v3];
  }
  v9.receiver = self;
  v9.super_class = (Class)AudioAmpCC;
  int v6 = v3 - [(ComponentControl *)&v9 numberOfFields];
  if (v6 == 1)
  {
    CFAllocatorRef v7 = kCFAllocatorDefault;
    uint64_t v8 = 144;
    return (__CFString *)CFStringCreateWithFormat(v7, 0, @"%f", *(float *)((char *)&self->super.super.super.isa + v8));
  }
  if (!v6)
  {
    CFAllocatorRef v7 = kCFAllocatorDefault;
    uint64_t v8 = 140;
    return (__CFString *)CFStringCreateWithFormat(v7, 0, @"%f", *(float *)((char *)&self->super.super.super.isa + v8));
  }
  return 0;
}

@end