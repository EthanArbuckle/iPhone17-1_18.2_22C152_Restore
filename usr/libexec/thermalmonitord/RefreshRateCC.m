@interface RefreshRateCC
- (RefreshRateCC)initWithParams:(__CFDictionary *)a3;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (int)numberOfFields;
- (void)defaultAction;
- (void)initRefreshRateTable:(__CFArray *)a3;
@end

@implementation RefreshRateCC

- (RefreshRateCC)initWithParams:(__CFDictionary *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)RefreshRateCC;
  v4 = [(ComponentControl *)&v7 initWithCC:7 :0];
  v5 = v4;
  if (v4)
  {
    *((unsigned char *)&v4->super.currentPower + 4) = 0;
    *((unsigned char *)&v4->super.currentPower + 5) = 0;
    v4->refreshRateLevelDown[1] = 100;
    v4->refreshRateLevelDown[0] = 100;
    *(_DWORD *)&v4->super.allowLIOverride = 100;
    v4->super.super.nameofComponent = (__CFString *)CFStringCreateWithFormat(0, 0, @"%d RefreshRate ", 7);
    v5->super.previousValue = v5->super.currentLoadingIndex;
    v5->super.releaseMaxLI = 2;
    sub_100008280(a3, @"MaxReleaseRate", kCFNumberIntType, &v5->super.releaseMaxLI);
  }
  return v5;
}

- (void)defaultAction
{
  unsigned int previousValue = self->super.previousValue;
  uint64_t v4 = *((unsigned __int8 *)&self->super.currentPower + 5);
  if (previousValue > *((unsigned __int8 *)&self->super.currentPower + v4 + 6))
  {
    if (!*((unsigned char *)&self->super.currentPower + 5)) {
      goto LABEL_8;
    }
    char v5 = -1;
    goto LABEL_7;
  }
  if (previousValue < self->refreshRateLevels[v4] && *((unsigned __int8 *)&self->super.currentPower + 4) - 1 > (int)v4)
  {
    char v5 = 1;
LABEL_7:
    *((unsigned char *)&self->super.currentPower + 5) = v4 + v5;
  }
LABEL_8:
  self->refreshRateLevelDown[1] = self->refreshRateLevelDown[0];
  int v6 = self->refreshRateLevelUp[*((unsigned __int8 *)&self->super.currentPower + 5)];
  self->refreshRateLevelDown[0] = v6;
  if (v6 != self->refreshRateLevelDown[1])
  {
    int v7 = IOMobileFramebufferSetParameter();
    if (v7)
    {
      int v8 = v7;
      v9 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_100055A2C(v8, v9);
      }
    }
    else if (byte_1000AA7A0)
    {
      v10 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = self->refreshRateLevelDown[0];
        *(_DWORD *)buf = 67109120;
        int v13 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<Notice> set refresh rate: %d", buf, 8u);
      }
    }
  }
}

- (void)initRefreshRateTable:(__CFArray *)a3
{
  if (a3 && (CFTypeID v5 = CFGetTypeID(a3), v5 == CFArrayGetTypeID()))
  {
    uint64_t v17 = 0;
    int valuePtr = 0;
    char Count = CFArrayGetCount(a3);
    *((unsigned char *)&self->super.currentPower + 4) = Count;
    if (Count)
    {
      unint64_t v7 = 0;
      do
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a3, v7);
        if (ValueAtIndex && (CFDictionaryRef v9 = ValueAtIndex, v10 = CFGetTypeID(ValueAtIndex), v10 == CFDictionaryGetTypeID()))
        {
          CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v9, @"up");
          if (Value)
          {
            CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
            *((unsigned char *)&self->super.currentPower + v7 + 6) = valuePtr;
          }
          CFNumberRef v12 = (const __CFNumber *)CFDictionaryGetValue(v9, @"down");
          if (v12)
          {
            CFNumberGetValue(v12, kCFNumberSInt32Type, &v17);
            self->refreshRateLevels[v7] = v17;
          }
          CFNumberRef v13 = (const __CFNumber *)CFDictionaryGetValue(v9, @"level");
          if (v13)
          {
            CFNumberGetValue(v13, kCFNumberSInt32Type, (char *)&v17 + 4);
            self->refreshRateLevelUp[v7] = BYTE4(v17);
          }
        }
        else
        {
          v14 = qword_1000AABC0;
          if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            int v19 = v7;
            _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "<Error> Missing Refresh Rate Dictionary %d", buf, 8u);
          }
        }
        ++v7;
      }
      while (v7 < *((unsigned __int8 *)&self->super.currentPower + 4));
    }
  }
  else
  {
    for (uint64_t i = 0; i != 4; ++i)
    {
      self->refreshRateLevelUp[i] = 100;
      self->refreshRateLevels[i] = 100;
      *((unsigned char *)&self->super.currentPower + i + 6) = 100;
    }
    *((unsigned char *)&self->super.currentPower + 4) = 4;
  }
}

- (int)numberOfFields
{
  v3.receiver = self;
  v3.super_class = (Class)RefreshRateCC;
  return [(ComponentControl *)&v3 numberOfFields];
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)RefreshRateCC;
  if ([(ComponentControl *)&v8 numberOfFields] <= a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)RefreshRateCC;
    if ([(ComponentControl *)&v6 numberOfFields] == v3) {
      return @"RefreshRate - fps";
    }
    else {
      return 0;
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)RefreshRateCC;
    return [(ComponentControl *)&v7 copyHeaderForIndex:v3];
  }
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)RefreshRateCC;
  if ([(ComponentControl *)&v8 numberOfFields] <= a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)RefreshRateCC;
    if ([(ComponentControl *)&v6 numberOfFields] == v3) {
      return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%d", self->refreshRateLevelDown[2]);
    }
    else {
      return 0;
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)RefreshRateCC;
    return [(ComponentControl *)&v7 copyFieldCurrentValueForIndex:v3];
  }
}

@end