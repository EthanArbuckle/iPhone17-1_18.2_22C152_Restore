@interface BKHIDUIDiscreteProximityServiceWrapper
- (BKHIDUIDiscreteProximityServiceWrapper)initWithIOHIDService:(id)a3;
- (BKIOHIDService)proximityService;
- (BKIOHIDService)service;
- (BKSHIDUISensorMode)prevailingMode;
- (BOOL)supportsProximityLPAEventTransitions;
- (void)applyUIMode:(id)a3;
- (void)resetCalibration;
- (void)setPrevailingMode:(id)a3;
- (void)setProximityService:(id)a3;
- (void)updateCharacteristics:(id)a3;
@end

@implementation BKHIDUIDiscreteProximityServiceWrapper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prevailingMode, 0);

  objc_storeStrong((id *)&self->_proximityService, 0);
}

- (void)setPrevailingMode:(id)a3
{
}

- (BKSHIDUISensorMode)prevailingMode
{
  return self->_prevailingMode;
}

- (void)setProximityService:(id)a3
{
}

- (BKIOHIDService)proximityService
{
  return self->_proximityService;
}

- (BOOL)supportsProximityLPAEventTransitions
{
  return 0;
}

- (void)updateCharacteristics:(id)a3
{
}

- (void)applyUIMode:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = (const __CFString *)[(BKIOHIDService *)self->_proximityService senderID];
  if (!v4) {
    goto LABEL_6;
  }
  if ([v4 estimatedProximityMode])
  {
    uint64_t v6 = 3;
    goto LABEL_7;
  }
  unsigned int v7 = [v4 proximityDetectionMode] - 1;
  if (v7 <= 0xC) {
    uint64_t v6 = dword_1000BF8B4[v7];
  }
  else {
LABEL_6:
  }
    uint64_t v6 = 0;
LABEL_7:
  if ([v4 postEventWithCurrentDetectionMask])
  {
    v8 = BKLogUISensor();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = @"pocket";
      int v18 = 138543874;
      CFStringRef v19 = @"pocket";
      __int16 v20 = 1024;
      int v21 = 3;
      __int16 v22 = 2048;
      CFStringRef v23 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "  send mode %{public}@/%d to proximity service %llX", (uint8_t *)&v18, 0x1Cu);
    }
    [(BKIOHIDService *)self->_proximityService asyncSetProperty:&off_100103508 forKey:@"DetectionMode" andDelayForSeconds:0.06];
  }
  v10 = BKLogUISensor();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (v6 > 5) {
      v11 = @"<unknown>";
    }
    else {
      v11 = *(&off_1000F8C78 + v6);
    }
    v12 = v11;
    int v18 = 138543874;
    CFStringRef v19 = v12;
    __int16 v20 = 1024;
    int v21 = v6;
    __int16 v22 = 2048;
    CFStringRef v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "  send mode %{public}@/%d to proximity service %llX", (uint8_t *)&v18, 0x1Cu);
  }
  id v13 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
  v14 = +[NSNumber numberWithUnsignedInt:v6];
  [v13 setObject:v14 forKey:@"DetectionMode"];

  unsigned __int8 v15 = [v4 pocketTouchesExpected];
  if ([(BKSHIDUISensorMode *)self->_prevailingMode pocketTouchesExpected]
    && (v15 & 1) == 0
    && [v4 digitizerEnabled])
  {
    v16 = BKLogUISensor();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 134217984;
      CFStringRef v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "  send kAppleProxScreenUnlockedKey to service %llX", (uint8_t *)&v18, 0xCu);
    }

    [v13 setObject:&__kCFBooleanTrue forKey:@"ScreenUnlocked"];
  }
  [(BKIOHIDService *)self->_proximityService asyncSetProperties:v13];
  prevailingMode = self->_prevailingMode;
  self->_prevailingMode = (BKSHIDUISensorMode *)v4;
}

- (void)resetCalibration
{
}

- (BKIOHIDService)service
{
  return self->_proximityService;
}

- (BKHIDUIDiscreteProximityServiceWrapper)initWithIOHIDService:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKHIDUIDiscreteProximityServiceWrapper;
  uint64_t v6 = [(BKHIDUIDiscreteProximityServiceWrapper *)&v9 init];
  unsigned int v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_proximityService, a3);
  }

  return v7;
}

@end