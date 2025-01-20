@interface ArcPowerCC
- (ArcPowerCC)initWithParams:(__CFDictionary *)a3 product:(id)a4;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (int)numberOfFields;
- (void)defaultAction;
- (void)refreshTGraphTelemetry;
- (void)updatePowerTarget;
@end

@implementation ArcPowerCC

- (ArcPowerCC)initWithParams:(__CFDictionary *)a3 product:(id)a4
{
  v25.receiver = self;
  v25.super_class = (Class)ArcPowerCC;
  v6 = [(ComponentControl *)&v25 initWithCC:11 :0];
  v7 = (ArcPowerCC *)v6;
  if (v6)
  {
    *(void *)(v6 + 140) = a4;
    *((_DWORD *)v6 + 18) = 100;
    *((_DWORD *)v6 + 42) = -1;
    *((void *)v6 + 6) = CFStringCreateWithFormat(0, 0, @"%d Arc ", 11);
    v7->super.previousValue = v7->super.currentLoadingIndex;
    int v8 = sub_100008280(a3, @"thresholdModule", kCFNumberIntType, (char *)&v7->_product + 4);
    p_latestModuleTemperature = &v7->_latestModuleTemperature;
    int v10 = sub_100008280(a3, @"maxArcPower", kCFNumberIntType, &v7->_latestModuleTemperature);
    int v11 = sub_100008280(a3, @"minArcPower", kCFNumberIntType, &v7->_maxArcPower);
    if (v8 && v10 && v11)
    {
      if (byte_1000AA7A0)
      {
        v12 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
        {
          int product_high = HIDWORD(v7->_product);
          int v14 = *p_latestModuleTemperature;
          int maxArcPower = v7->_maxArcPower;
          *(_DWORD *)buf = 67109632;
          int v27 = product_high;
          __int16 v28 = 1024;
          int v29 = v14;
          __int16 v30 = 1024;
          int v31 = maxArcPower;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "<Notice> ArcPowerCC ModuleThreshold: %d, MaxPower: %d, MinPower: %d", buf, 0x14u);
        }
      }
      v7->_minArcPower = *p_latestModuleTemperature;
    }
    else
    {
      v16 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_100056984(v16, v17, v18, v19, v20, v21, v22, v23);
      }
    }
    [(ComponentControl *)v7 updatePowerParameters:a3];
    if (sub_100037D8C(a3, @"expectsCPMSSupport", 0)) {
      [(ComponentControl *)v7 setCPMSMitigationState:1];
    }
  }
  return v7;
}

- (void)defaultAction
{
  self->_thresholdModuleTemperature = [*(id *)(&self->super.currentPower + 1) arcModuleTemperature];

  [(ArcPowerCC *)self updatePowerTarget];
}

- (void)updatePowerTarget
{
  p_minArcPower = &self->_minArcPower;
  unsigned int currentLoadingIndex = self->super.currentLoadingIndex;
  if (self->super.maxLoadingIndex == currentLoadingIndex)
  {
    int latestModuleTemperature = *p_minArcPower;
  }
  else
  {
    self->super.maxLoadingIndex = currentLoadingIndex;
    if (self->_thresholdModuleTemperature <= SHIDWORD(self->_product))
    {
      int latestModuleTemperature = self->_latestModuleTemperature;
    }
    else
    {
      int v5 = self->_latestModuleTemperature;
      int latestModuleTemperature = v5 * self->super.currentLoadingIndex / 0x64;
      if (latestModuleTemperature >= v5) {
        int latestModuleTemperature = self->_latestModuleTemperature;
      }
      if (latestModuleTemperature <= self->_maxArcPower) {
        int latestModuleTemperature = self->_maxArcPower;
      }
    }
  }
  if (latestModuleTemperature != *p_minArcPower)
  {
    int *p_minArcPower = latestModuleTemperature;
    id v6 = [objc_alloc((Class)NSNumber) initWithInt:*p_minArcPower];
    if (v6)
    {
      v7 = v6;
      id v8 = objc_alloc_init((Class)NSMutableDictionary);
      [v8 setObject:v7 forKey:@"HapticTargetPower"];
      id v9 = +[AVSystemController sharedAVSystemController];
      if ([v9 setAttribute:v8 forKey:AVSystemController_ThermalControlInfoAttribute error:0])
      {
        if (byte_1000AA7A0)
        {
          int v10 = qword_1000AABC0;
          if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
          {
            int v11 = *p_minArcPower;
            v14[0] = 67109120;
            v14[1] = v11;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<Notice> ArcPowerCC: Set the target power to %d", (uint8_t *)v14, 8u);
          }
        }
      }
      else
      {
        v13 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
          sub_100056A38(p_minArcPower, v13);
        }
      }

      if (v8) {
    }
      }
    else
    {
      v12 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_1000569BC(p_minArcPower, v12);
      }
    }
  }
}

- (void)refreshTGraphTelemetry
{
  id v3 = +[AVSystemController sharedAVSystemController];
  id v4 = [v3 attributeForKey:AVSystemController_ThermalControlInfoAttribute];
  if (!v4)
  {
    int v5 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100056AEC(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (![v4 count])
  {
    v13 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100056AB4(v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
  id v21 = [v4 objectForKey:@"HapticTargetPower"];
  if (v21) {
    int v22 = [v21 intValue];
  }
  else {
    int v22 = -1;
  }
  self->_arcPowerTarget = v22;
}

- (int)numberOfFields
{
  v3.receiver = self;
  v3.super_class = (Class)ArcPowerCC;
  return [(ComponentControl *)&v3 numberOfFields] + 2;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)ArcPowerCC;
  if ([(ComponentControl *)&v10 numberOfFields] <= a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)ArcPowerCC;
    unsigned int v6 = [(ComponentControl *)&v8 numberOfFields];
    if (v3 - v6 == 1) {
      uint64_t v7 = @"ArcCC current power";
    }
    else {
      uint64_t v7 = 0;
    }
    if (v3 == v6) {
      return @"ArcCC target power";
    }
    else {
      return v7;
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)ArcPowerCC;
    return [(ComponentControl *)&v9 copyHeaderForIndex:v3];
  }
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)ArcPowerCC;
  if ([(ComponentControl *)&v11 numberOfFields] > a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)ArcPowerCC;
    return [(ComponentControl *)&v10 copyFieldCurrentValueForIndex:v3];
  }
  v9.receiver = self;
  v9.super_class = (Class)ArcPowerCC;
  int v6 = v3 - [(ComponentControl *)&v9 numberOfFields];
  if (v6 == 1)
  {
    CFAllocatorRef v7 = kCFAllocatorDefault;
    uint64_t v8 = 168;
    return (__CFString *)CFStringCreateWithFormat(v7, 0, @"%d", *(unsigned int *)((char *)&self->super.super.super.isa + v8));
  }
  if (!v6)
  {
    CFAllocatorRef v7 = kCFAllocatorDefault;
    uint64_t v8 = 164;
    return (__CFString *)CFStringCreateWithFormat(v7, 0, @"%d", *(unsigned int *)((char *)&self->super.super.super.isa + v8));
  }
  return 0;
}

@end