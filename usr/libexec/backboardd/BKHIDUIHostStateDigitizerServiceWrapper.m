@interface BKHIDUIHostStateDigitizerServiceWrapper
- (BKHIDUIHostStateDigitizerServiceWrapper)initWithIOHIDService:(id)a3;
- (BKIOHIDService)digitizerService;
- (BKIOHIDService)service;
- (BOOL)supportsProximityLPAEventTransitions;
- (NSDictionary)previousHostStateDictionary;
- (void)applyUIMode:(id)a3;
- (void)proximityDidUnoccludeAfterScreenWake;
- (void)setDigitizerService:(id)a3;
- (void)setPreviousHostStateDictionary:(id)a3;
@end

@implementation BKHIDUIHostStateDigitizerServiceWrapper

- (void)applyUIMode:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 proximityDetectionMode];
  unsigned int v22 = [v4 pocketTouchesExpected];
  unsigned int v6 = [v4 digitizerEnabled];
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v8 = [v4 multitouchHostStateKeys];
  id v9 = [v8 countByEnumeratingWithState:&v23 objects:buf count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:*(void *)(*((void *)&v23 + 1) + 8 * (void)v12)];
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v23 objects:buf count:16];
    }
    while (v10);
  }

  if (((unint64_t)[v4 changeSource] | 2) == 3)
  {
    v13 = +[NSNumber numberWithUnsignedInt:786480];
    [v7 setObject:v13 forKeyedSubscript:@"ChangeSourceKeyboardUsagePair"];
  }
  if (v6) {
    [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:@"ScreenOn"];
  }
  v14 = (char *)[v4 displayState];
  if ((unint64_t)(v14 - 1) <= 2)
  {
    v15 = +[NSNumber numberWithInteger:v14];
    [v7 setObject:v15 forKeyedSubscript:@"DisplayState"];
  }
  if (v5 <= 6 && ((1 << v5) & 0x4C) != 0)
  {
    CFStringRef v16 = @"FaceTouchesExpected";
LABEL_17:
    [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:v16];
    goto LABEL_18;
  }
  if ((v6 & v22) == 1)
  {
    CFStringRef v16 = @"PocketTouchesExpected";
    goto LABEL_17;
  }
LABEL_18:

  id v17 = [(BKIOHIDService *)self->_digitizerService senderID];
  if (BSEqualObjects())
  {
    v18 = BKLogUISensor();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v28 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "  ignoring redundant mode change for digitizer service %llX", buf, 0xCu);
    }
  }
  else
  {
    v19 = (NSDictionary *)[v7 copy];
    previousHostStateDictionary = self->_previousHostStateDictionary;
    self->_previousHostStateDictionary = v19;

    v21 = BKLogUISensor();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v28 = v7;
      __int16 v29 = 2048;
      id v30 = v17;
      __int16 v31 = 2114;
      id v32 = v4;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "  send %{public}@ to digitizer service %llX for mode %{public}@", buf, 0x20u);
    }

    [(BKIOHIDService *)self->_digitizerService asyncSetProperty:v7 forKey:@"HostStateNotification"];
  }
}

- (BKIOHIDService)service
{
  return self->_digitizerService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousHostStateDictionary, 0);

  objc_storeStrong((id *)&self->_digitizerService, 0);
}

- (void)setPreviousHostStateDictionary:(id)a3
{
}

- (NSDictionary)previousHostStateDictionary
{
  return self->_previousHostStateDictionary;
}

- (void)setDigitizerService:(id)a3
{
}

- (BKIOHIDService)digitizerService
{
  return self->_digitizerService;
}

- (BOOL)supportsProximityLPAEventTransitions
{
  return 0;
}

- (void)proximityDidUnoccludeAfterScreenWake
{
}

- (BKHIDUIHostStateDigitizerServiceWrapper)initWithIOHIDService:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKHIDUIHostStateDigitizerServiceWrapper;
  unsigned int v6 = [(BKHIDUIHostStateDigitizerServiceWrapper *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_digitizerService, a3);
  }

  return v7;
}

@end