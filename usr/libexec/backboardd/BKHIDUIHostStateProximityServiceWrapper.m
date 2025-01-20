@interface BKHIDUIHostStateProximityServiceWrapper
- (BKHIDUIHostStateProximityServiceWrapper)initWithIOHIDService:(id)a3;
- (BKIOHIDService)proximityService;
- (BKIOHIDService)service;
- (BKSHIDUISensorMode)prevailingMode;
- (BOOL)supportsProximityLPAEventTransitions;
- (NSDictionary)previousHostStateDictionary;
- (void)applyUIMode:(id)a3;
- (void)resetCalibration;
- (void)setPrevailingMode:(id)a3;
- (void)setPreviousHostStateDictionary:(id)a3;
- (void)setProximityService:(id)a3;
- (void)updateCharacteristics:(id)a3;
@end

@implementation BKHIDUIHostStateProximityServiceWrapper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prevailingMode, 0);
  objc_storeStrong((id *)&self->_previousHostStateDictionary, 0);

  objc_storeStrong((id *)&self->_proximityService, 0);
}

- (void)setPrevailingMode:(id)a3
{
}

- (BKSHIDUISensorMode)prevailingMode
{
  return self->_prevailingMode;
}

- (void)setPreviousHostStateDictionary:(id)a3
{
}

- (NSDictionary)previousHostStateDictionary
{
  return self->_previousHostStateDictionary;
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
  v2 = [(BKIOHIDService *)self->_proximityService propertyOfClass:objc_opt_class() forKey:@"ProximitySupportsLPAEventTransitions"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)updateCharacteristics:(id)a3
{
  id v6 = a3;
  [v6 setHasDiscreteProximitySensor:1];
  v4 = [(BKIOHIDService *)self->_proximityService propertyOfClass:objc_opt_class() forKey:@"SuggestedLPAScreenOffHysteresisMs"];
  v5 = v4;
  if (v4) {
    [v6 setSuggestedSystemApertureGracePeriodForScreenOff:[v4 integerValue]];
  }
}

- (void)applyUIMode:(id)a3
{
  id v4 = a3;
  v5 = sub_10008FC88(v4, 0);
  id v6 = [(BKIOHIDService *)self->_proximityService senderID];
  if (BSEqualObjects())
  {
    v7 = BKLogUISensor();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 134217984;
      id v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "  ignoring redundant mode change for proximity service %llX", (uint8_t *)&v18, 0xCu);
    }
  }
  else
  {
    v8 = (NSDictionary *)[v5 copy];
    previousHostStateDictionary = self->_previousHostStateDictionary;
    self->_previousHostStateDictionary = v8;

    if ([v4 postEventWithCurrentDetectionMask])
    {
      v10 = sub_10008FC88(v4, 1);
      v11 = BKLogUISensor();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138543874;
        id v19 = v10;
        __int16 v20 = 2048;
        id v21 = v6;
        __int16 v22 = 2114;
        id v23 = v4;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "  send %{public}@ to proximity service %llX for mode %{public}@", (uint8_t *)&v18, 0x20u);
      }

      [(BKIOHIDService *)self->_proximityService asyncSetProperty:v10 forKey:@"HostStateNotification" andDelayForSeconds:0.06];
    }
    v12 = BKLogUISensor();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138543874;
      id v19 = v5;
      __int16 v20 = 2048;
      id v21 = v6;
      __int16 v22 = 2114;
      id v23 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "  send %{public}@ to proximity service %llX for mode %{public}@", (uint8_t *)&v18, 0x20u);
    }

    [(BKIOHIDService *)self->_proximityService asyncSetProperty:v5 forKey:@"HostStateNotification"];
  }
  unsigned int v13 = [v4 digitizerEnabled];
  unsigned __int8 v14 = [v4 pocketTouchesExpected];
  unsigned int v15 = [(BKSHIDUISensorMode *)self->_prevailingMode pocketTouchesExpected];
  if (v13 && v15 && (v14 & 1) == 0)
  {
    v16 = BKLogUISensor();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 134217984;
      id v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "  send ScreenUnlocked to proximity service %llX", (uint8_t *)&v18, 0xCu);
    }

    [(BKIOHIDService *)self->_proximityService asyncSetProperty:&__kCFBooleanTrue forKey:@"ScreenUnlocked"];
  }
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

- (BKHIDUIHostStateProximityServiceWrapper)initWithIOHIDService:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKHIDUIHostStateProximityServiceWrapper;
  id v6 = [(BKHIDUIHostStateProximityServiceWrapper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_proximityService, a3);
  }

  return v7;
}

@end