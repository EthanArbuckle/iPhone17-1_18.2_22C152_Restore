@interface BKHIDUITouchDetectionModeDigitizerServiceWrapper
- (BKHIDUITouchDetectionModeDigitizerServiceWrapper)initWithIOHIDService:(id)a3;
- (BKIOHIDService)digitizerService;
- (BKIOHIDService)service;
- (BOOL)supportsProximityLPAEventTransitions;
- (NSArray)digitizerServices;
- (void)applyUIMode:(id)a3;
- (void)proximityDidUnoccludeAfterScreenWake;
- (void)setDigitizerService:(id)a3;
@end

@implementation BKHIDUITouchDetectionModeDigitizerServiceWrapper

- (BKHIDUITouchDetectionModeDigitizerServiceWrapper)initWithIOHIDService:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKHIDUITouchDetectionModeDigitizerServiceWrapper;
  v6 = [(BKHIDUITouchDetectionModeDigitizerServiceWrapper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_digitizerService, a3);
  }

  return v7;
}

- (void)applyUIMode:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 digitizerEnabled];
  unsigned int v6 = [v4 proximityDetectionMode];
  if (v6 > 6 || ((1 << v6) & 0x4C) == 0)
  {
    if (v5)
    {
      LODWORD(v8) = [v4 pocketTouchesExpected];
    }
    else if ([v4 tapToWakeEnabled])
    {
      LODWORD(v8) = 254;
    }
    else
    {
      LODWORD(v8) = 255;
    }
  }
  else
  {
    LODWORD(v8) = 2;
  }

  unint64_t v9 = (unint64_t)[v4 changeSource] & 0xFFFFFFFFFFFFFFFDLL;
  if (v9 == 1) {
    uint64_t v8 = v8 | 0x100;
  }
  else {
    uint64_t v8 = v8;
  }
  id v10 = [(BKIOHIDService *)self->_digitizerService senderID];
  v11 = BKLogUISensor();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if ((v8 + 2) >= 5u)
    {
      v12 = +[NSString stringWithFormat:@"<unknown:0x%X>", v8];
    }
    else
    {
      v12 = *(&off_1000F8D50 + (v8 + 2));
    }
    if (v9 == 1)
    {
      uint64_t v13 = [v12 stringByAppendingString:@" | fromHardwareButton"];

      v12 = (void *)v13;
    }
    *(_DWORD *)buf = 138543874;
    v17 = v12;
    __int16 v18 = 1024;
    int v19 = v8;
    __int16 v20 = 2048;
    id v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "  send mode (%{public}@/0x%X) to digitizer service %llX", buf, 0x1Cu);
  }
  digitizerService = self->_digitizerService;
  v15 = +[NSNumber numberWithUnsignedInt:v8];
  [(BKIOHIDService *)digitizerService asyncSetProperty:v15 forKey:@"TouchDetectionMode"];
}

- (BKIOHIDService)service
{
  return self->_digitizerService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digitizerService, 0);

  objc_storeStrong((id *)&self->_digitizerServices, 0);
}

- (void)setDigitizerService:(id)a3
{
}

- (BKIOHIDService)digitizerService
{
  return self->_digitizerService;
}

- (NSArray)digitizerServices
{
  return self->_digitizerServices;
}

- (BOOL)supportsProximityLPAEventTransitions
{
  return 0;
}

- (void)proximityDidUnoccludeAfterScreenWake
{
}

@end