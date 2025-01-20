@interface RCPVirtualHIDService
+ (id)serviceWithIdentifier:(id)a3 properties:(id)a4;
- (BOOL)isOpen;
- (BOOL)isRunning;
- (BOOL)readyForPointerEvents;
- (BOOL)setOutputEvent:(id)a3 forService:(id)a4;
- (BOOL)setProperty:(id)a3 forKey:(id)a4 forService:(id)a5;
- (BOOL)startWithError:(id *)a3;
- (HIDVirtualEventService)eventService;
- (NSDictionary)propertyDictionary;
- (NSMutableDictionary)dynamicMetaProperties;
- (NSString)description;
- (NSString)identifier;
- (RCPEventSenderProperties)properties;
- (RCPVirtualHIDService)initWithIdentifier:(id)a3 properties:(id)a4;
- (id)copyEventMatching:(id)a3 forService:(id)a4;
- (id)propertyForKey:(id)a3 forService:(id)a4;
- (void)notification:(int64_t)a3 withProperty:(id)a4 forService:(id)a5;
- (void)postHIDEvent:(__IOHIDEvent *)a3;
- (void)setDynamicMetaProperties:(id)a3;
- (void)setEventService:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsOpen:(BOOL)a3;
- (void)setProperties:(id)a3;
- (void)setPropertyDictionary:(id)a3;
- (void)setReadyForPointerEvents:(BOOL)a3;
- (void)stop;
@end

@implementation RCPVirtualHIDService

- (BOOL)setProperty:(id)a3 forKey:(id)a4 forService:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (_RCPIsAllowlistedProperty(v8)) {
    [(NSMutableDictionary *)self->_dynamicMetaProperties setObject:v7 forKey:v8];
  }
  if ([v8 isEqual:@"DeviceOpenedByEventSystem"])
  {
    self->_isOpen = [v7 BOOLValue];
    waitForEventSystemGroup = self->_waitForEventSystemGroup;
LABEL_5:
    dispatch_group_leave(waitForEventSystemGroup);
    goto LABEL_13;
  }
  if (![v8 isEqual:@"BKReadyToReceivePointerEvents"])
  {
    [v8 isEqual:@"BatchInterval"];
    goto LABEL_13;
  }
  int v10 = [v7 BOOLValue];
  v11 = RCPLogPlayback();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109378;
    v13[1] = v10;
    __int16 v14 = 2112;
    v15 = self;
    _os_log_impl(&dword_1A9051000, v11, OS_LOG_TYPE_DEFAULT, "--> pointer ready: (%{BOOL}u): %@", (uint8_t *)v13, 0x12u);
  }

  if (v10 && !self->_readyForPointerEvents)
  {
    self->_readyForPointerEvents = 1;
    waitForEventSystemGroup = self->_waitForPointerReadyGroup;
    goto LABEL_5;
  }
LABEL_13:

  return 1;
}

- (void)stop
{
  dispatch_time_t v3 = dispatch_time(0, 100000000);
  v4 = _RCPVirtualHIDServiceQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__RCPVirtualHIDService_stop__block_invoke;
  block[3] = &unk_1E5D76FB0;
  block[4] = self;
  dispatch_after(v3, v4, block);
}

- (void)postHIDEvent:(__IOHIDEvent *)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!self->_readyForPointerEvents && IOHIDEventGetType() == 17)
  {
    v5 = RCPLogPlayback();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      int v10 = self;
      _os_log_impl(&dword_1A9051000, v5, OS_LOG_TYPE_DEFAULT, "waiting for ready: (%{public}@)", (uint8_t *)&v9, 0xCu);
    }

    waitForPointerReadyGroup = self->_waitForPointerReadyGroup;
    dispatch_time_t v7 = dispatch_time(0, 5000000000);
    dispatch_group_wait(waitForPointerReadyGroup, v7);
    if (!self->_readyForPointerEvents)
    {
      id v8 = RCPLogPlayback();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[RCPVirtualHIDService postHIDEvent:]((uint64_t)self, v8);
      }
    }
  }
  [(HIDVirtualEventService *)self->_eventService dispatchEvent:a3];
}

- (BOOL)isRunning
{
  return self->_eventService != 0;
}

+ (id)serviceWithIdentifier:(id)a3 properties:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v7 properties:v6];

  return v8;
}

- (RCPVirtualHIDService)initWithIdentifier:(id)a3 properties:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)RCPVirtualHIDService;
  id v8 = [(RCPVirtualHIDService *)&v33 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    int v10 = (void *)*((void *)v8 + 6);
    *((void *)v8 + 6) = v9;

    uint64_t v11 = [v7 properties];
    v12 = (void *)*((void *)v8 + 7);
    *((void *)v8 + 7) = v11;

    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    __int16 v14 = (void *)*((void *)v8 + 8);
    *((void *)v8 + 8) = v13;

    dispatch_group_t v15 = dispatch_group_create();
    uint64_t v16 = (void *)*((void *)v8 + 2);
    *((void *)v8 + 2) = v15;

    dispatch_group_enter(*((dispatch_group_t *)v8 + 2));
    dispatch_group_t v17 = dispatch_group_create();
    v18 = (void *)*((void *)v8 + 3);
    *((void *)v8 + 3) = v17;

    v19 = [MEMORY[0x1E4F4F7D0] sharedInstance];
    int v20 = [v19 deviceClass];

    if (v20 || _AXSAssistiveTouchEnabled())
    {
      if ([v7 sendsMousePointerEvents])
      {
        objc_opt_class();
        if (objc_opt_respondsToSelector())
        {
          v21 = RCPLogPlayback();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v35 = v8;
            _os_log_impl(&dword_1A9051000, v21, OS_LOG_TYPE_DEFAULT, "service waiting for ready: (%{public}@)", buf, 0xCu);
          }

          *((unsigned char *)v8 + 33) = 0;
          dispatch_group_enter(*((dispatch_group_t *)v8 + 3));
          goto LABEL_14;
        }
      }
      v22 = RCPLogPlayback();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      *(_DWORD *)buf = 138543362;
      id v35 = v8;
      v23 = "service doesn't wait for pointer ready: (%{public}@)";
    }
    else
    {
      if (![v7 sendsMousePointerEvents]) {
        goto LABEL_13;
      }
      v22 = RCPLogPlayback();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
LABEL_12:

LABEL_13:
        *((unsigned char *)v8 + 33) = 1;
LABEL_14:
        v24 = objc_opt_new();
        v25 = (void *)*((void *)v8 + 5);
        *((void *)v8 + 5) = v24;
        id v26 = v24;

        v27 = _RCPVirtualHIDServiceQueue();
        [v26 setDelegate:v8];
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __54__RCPVirtualHIDService_initWithIdentifier_properties___block_invoke;
        v31[3] = &unk_1E5D76FB0;
        id v32 = v8;
        [v26 setCancelHandler:v31];
        [v26 setDispatchQueue:v27];
        [v26 activate];
        v28 = *((void *)v8 + 2);
        dispatch_time_t v29 = dispatch_time(0, 10000000000);
        dispatch_group_wait(v28, v29);

        goto LABEL_15;
      }
      *(_DWORD *)buf = 138543362;
      id v35 = v8;
      v23 = "service doesn't support pointer input: (%{public}@)";
    }
    _os_log_impl(&dword_1A9051000, v22, OS_LOG_TYPE_DEFAULT, v23, buf, 0xCu);
    goto LABEL_12;
  }
LABEL_15:

  return (RCPVirtualHIDService *)v8;
}

- (NSString)description
{
  v19.receiver = self;
  v19.super_class = (Class)RCPVirtualHIDService;
  dispatch_time_t v3 = [(RCPVirtualHIDService *)&v19 description];
  identifier = self->_identifier;
  v5 = self->_propertyDictionary;
  id v6 = [(NSDictionary *)v5 objectForKeyedSubscript:@"Product"];
  id v7 = [(NSDictionary *)v5 objectForKeyedSubscript:@"Product"];
  id v8 = [(NSDictionary *)v5 objectForKeyedSubscript:@"Transport"];
  uint64_t v9 = [(NSDictionary *)v5 objectForKeyedSubscript:@"PrimaryUsagePage"];
  int v10 = [(NSDictionary *)v5 objectForKeyedSubscript:@"PrimaryUsage"];

  uint64_t v11 = (unsigned __int16)[v9 unsignedIntValue];
  uint64_t v12 = (unsigned __int16)[v10 unsignedIntValue];
  if (v6)
  {
    id v13 = v6;
LABEL_24:
    dispatch_group_t v15 = v13;
    goto LABEL_25;
  }
  int v14 = v12 | (v11 << 16);
  if (v14 > 851971)
  {
    if (v14 > 851979)
    {
      if (v14 == 851980)
      {
        dispatch_group_t v15 = @"trackpad";
        goto LABEL_22;
      }
      if (v14 == 852000)
      {
        dispatch_group_t v15 = @"pencil digitizer";
        goto LABEL_22;
      }
    }
    else
    {
      if (v14 == 851972)
      {
        dispatch_group_t v15 = @"touchscreen digitizer";
        goto LABEL_22;
      }
      if (v14 == 851973)
      {
        dispatch_group_t v15 = @"touchpad digitizer";
        goto LABEL_22;
      }
    }
  }
  else if (v14 > 720896)
  {
    if (v14 == 720897)
    {
      dispatch_group_t v15 = @"built-in buttons";
      goto LABEL_22;
    }
    if (v14 == 851969)
    {
      dispatch_group_t v15 = @"digitizer";
      goto LABEL_22;
    }
  }
  else
  {
    if (v14 == 65538)
    {
      dispatch_group_t v15 = @"mouse";
      goto LABEL_22;
    }
    if (v14 == 65542)
    {
      dispatch_group_t v15 = @"keyboard";
LABEL_22:
      if (!v7) {
        goto LABEL_25;
      }
      id v13 = [NSString stringWithFormat:@"%@ - %@", v15, v7];
      goto LABEL_24;
    }
  }
  if (v7)
  {
    id v13 = v7;
    goto LABEL_24;
  }
  dispatch_group_t v15 = 0;
LABEL_25:
  uint64_t v16 = [NSString stringWithFormat:@"0x%.02X/0x%.02X: (%@) %@", v11, v12, v8, v15];

  dispatch_group_t v17 = [v3 stringByAppendingFormat:@" (%@) %@", identifier, v16];

  return (NSString *)v17;
}

- (id)propertyForKey:(id)a3 forService:(id)a4
{
  id v5 = a3;
  int v6 = _RCPIsAllowlistedProperty(v5);
  uint64_t v7 = 56;
  if (v6) {
    uint64_t v7 = 64;
  }
  id v8 = [*(id *)((char *)&self->super.isa + v7) objectForKeyedSubscript:v5];

  return v8;
}

- (id)copyEventMatching:(id)a3 forService:(id)a4
{
  return 0;
}

uint64_t __28__RCPVirtualHIDService_stop__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) cancel];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicMetaProperties, 0);
  objc_storeStrong((id *)&self->_propertyDictionary, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_eventService, 0);
  objc_storeStrong((id *)&self->_waitForPointerReadyGroup, 0);
  objc_storeStrong((id *)&self->_waitForEventSystemGroup, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

void __54__RCPVirtualHIDService_initWithIdentifier_properties___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = RCPLogPlayback();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1A9051000, v2, OS_LOG_TYPE_DEFAULT, "service canceled: (%{public}@)", (uint8_t *)&v4, 0xCu);
  }
}

- (void)notification:(int64_t)a3 withProperty:(id)a4 forService:(id)a5
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = RCPLogPlayback();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = @"terminated";
    if (a3 == 10) {
      uint64_t v7 = @"enumerated";
    }
    int v8 = 138543362;
    uint64_t v9 = v7;
    _os_log_impl(&dword_1A9051000, v6, OS_LOG_TYPE_INFO, "notification:%{public}@", (uint8_t *)&v8, 0xCu);
  }
}

- (RCPEventSenderProperties)properties
{
  return self->_properties;
}

- (BOOL)startWithError:(id *)a3
{
  return 1;
}

- (BOOL)setOutputEvent:(id)a3 forService:(id)a4
{
  return 0;
}

- (HIDVirtualEventService)eventService
{
  return self->_eventService;
}

- (void)setEventService:(id)a3
{
}

- (void)setProperties:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSDictionary)propertyDictionary
{
  return self->_propertyDictionary;
}

- (void)setPropertyDictionary:(id)a3
{
}

- (NSMutableDictionary)dynamicMetaProperties
{
  return self->_dynamicMetaProperties;
}

- (void)setDynamicMetaProperties:(id)a3
{
}

- (BOOL)isOpen
{
  return self->_isOpen;
}

- (void)setIsOpen:(BOOL)a3
{
  self->_isOpen = a3;
}

- (BOOL)readyForPointerEvents
{
  return self->_readyForPointerEvents;
}

- (void)setReadyForPointerEvents:(BOOL)a3
{
  self->_readyForPointerEvents = a3;
}

- (void)postHIDEvent:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A9051000, a2, OS_LOG_TYPE_ERROR, "*** did not get ready notification: (%{public}@)", (uint8_t *)&v2, 0xCu);
}

@end