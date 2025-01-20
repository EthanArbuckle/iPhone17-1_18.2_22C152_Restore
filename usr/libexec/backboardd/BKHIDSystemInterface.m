@interface BKHIDSystemInterface
+ (BKHIDSystemInterface)sharedInstance;
- (BKHIDClientConnectionManager)clientConnectionManager;
- (BKHIDEventDeliveryManager)deliveryManager;
- (BKHIDEventDeliveryManagerServer)deliveryManagerServer;
- (BKHIDEventSenderCache)senderCache;
- (BKHIDSystem)system;
- (BKHIDSystemInterface)init;
- (BOOL)_routeSqueezeEventToSystem;
- (OS_dispatch_mach)HIDSystemChannel;
- (__IOHIDEvent)systemEventOfType:(unsigned int)a3 matchingEvent:(__IOHIDEvent *)a4 options:(unsigned int)a5;
- (id)IOHIDServicesMatching:(id)a3;
- (id)destinationsForEvent:(__IOHIDEvent *)a3 fromSender:(id)a4;
- (id)destinationsForEvent:(__IOHIDEvent *)a3 fromSender:(id)a4 overrideSenderDescriptor:(id)a5;
- (id)dispatcherForEvent:(__IOHIDEvent *)a3;
- (id)systemPropertyForKey:(id)a3;
- (unint64_t)permittedRuleChangeMaskForAuditToken:(id)a3;
- (void)hidSystem:(id)a3 receivedUpdatedDeviceOrientation:(int64_t)a4;
- (void)injectGSEvent:(__GSEvent *)a3;
- (void)injectHIDEvent:(__IOHIDEvent *)a3;
- (void)postEvent:(__IOHIDEvent *)a3 fromSender:(id)a4;
- (void)postEvent:(__IOHIDEvent *)a3 toDestination:(id)a4;
- (void)registerIOHIDServicesCallback:(void *)a3 matchingDictionary:(id)a4 target:(void *)a5 refCon:(void *)a6;
- (void)registerWatchdog;
- (void)setHIDSystemChannel:(id)a3;
- (void)setSystemProperty:(id)a3 forKey:(id)a4;
- (void)startEventProcessing;
- (void)startEventRouting;
- (void)startHIDSystem;
- (void)startServer;
- (void)unregisterIOHIDServicesCallback:(void *)a3 matchingDictionary:(id)a4 target:(void *)a5 refCon:(void *)a6;
@end

@implementation BKHIDSystemInterface

- (id)dispatcherForEvent:(__IOHIDEvent *)a3
{
  int Type = IOHIDEventGetType();
  v5 = self;
  if (Type == 39)
  {
    unsigned int IntegerValue = IOHIDEventGetIntegerValue();
    if (IntegerValue < 2
      || IntegerValue == 5 && ![(BKHIDSystemInterface *)v5 _routeSqueezeEventToSystem])
    {
      uint64_t v7 = +[BKTouchDeliveryGenericGestureFocusObserver sharedInstance];

      v5 = (BKHIDSystemInterface *)v7;
    }
  }

  return v5;
}

- (id)destinationsForEvent:(__IOHIDEvent *)a3 fromSender:(id)a4 overrideSenderDescriptor:(id)a5
{
  id v8 = a5;
  if (!v8)
  {
    id v9 = a4;
    id v8 = [v9 senderDescriptorForEventType:IOHIDEventGetType()];
  }
  v10 = [(BKHIDSystem *)self->_system deliveryManager];
  v11 = [v10 destinationsForEvent:a3 sender:v8];

  return v11;
}

- (unint64_t)permittedRuleChangeMaskForAuditToken:(id)a3
{
  id v3 = a3;
  v4 = +[BKSystemShellSentinel sharedInstance];
  long long v7 = 0u;
  long long v8 = 0u;
  if (v3) {
    [v3 realToken:v7, v8];
  }
  if ([v4 auditTokenRepresentsSystemApp:&v7]) {
    unint64_t v5 = 63;
  }
  else {
    unint64_t v5 = 58;
  }

  return v5;
}

- (id)destinationsForEvent:(__IOHIDEvent *)a3 fromSender:(id)a4
{
  return [(BKHIDSystemInterface *)self destinationsForEvent:a3 fromSender:a4 overrideSenderDescriptor:0];
}

- (BKHIDEventSenderCache)senderCache
{
  return (BKHIDEventSenderCache *)[(BKHIDSystem *)self->_system senderCache];
}

+ (BKHIDSystemInterface)sharedInstance
{
  if (qword_1001231B8 != -1) {
    dispatch_once(&qword_1001231B8, &stru_1000F9100);
  }
  v2 = (void *)qword_1001231B0;

  return (BKHIDSystemInterface *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deliveryManagerServer, 0);
  objc_storeStrong((id *)&self->_system, 0);

  objc_storeStrong((id *)&self->_HIDSystemChannel, 0);
}

- (BKHIDEventDeliveryManagerServer)deliveryManagerServer
{
  return self->_deliveryManagerServer;
}

- (BKHIDSystem)system
{
  return self->_system;
}

- (void)setHIDSystemChannel:(id)a3
{
}

- (OS_dispatch_mach)HIDSystemChannel
{
  return (OS_dispatch_mach *)objc_getProperty(self, a2, 8, 1);
}

- (void)registerWatchdog
{
}

- (void)hidSystem:(id)a3 receivedUpdatedDeviceOrientation:(int64_t)a4
{
  sub_10001C32C();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  sub_100095694((uint64_t)v5, a4);
}

- (void)unregisterIOHIDServicesCallback:(void *)a3 matchingDictionary:(id)a4 target:(void *)a5 refCon:(void *)a6
{
}

- (void)registerIOHIDServicesCallback:(void *)a3 matchingDictionary:(id)a4 target:(void *)a5 refCon:(void *)a6
{
}

- (id)IOHIDServicesMatching:(id)a3
{
  return [(BKHIDSystem *)self->_system IOHIDServicesMatching:a3];
}

- (void)postEvent:(__IOHIDEvent *)a3 fromSender:(id)a4
{
  v4 = -[BKHIDSystemInterface destinationsForEvent:fromSender:](self, "destinationsForEvent:fromSender:");
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = (char *)[v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      long long v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        BKSendHIDEventToClientWithDestination();
        ++v8;
      }
      while (v6 != v8);
      v6 = (char *)[v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)postEvent:(__IOHIDEvent *)a3 toDestination:(id)a4
{
}

- (BOOL)_routeSqueezeEventToSystem
{
  v2 = +[BKIOHIDServicePersistentPropertyController digitizerServicePersistentPropertyController];
  CFStringRef v11 = @"SqueezeIsSystemShortcut";
  unsigned __int8 v3 = 1;
  v4 = +[NSArray arrayWithObjects:&v11 count:1];
  id v5 = +[NSSet setWithArray:v4];
  v6 = +[BKSHIDEventSenderDescriptor stylusOpaqueTouchDigitizer];
  uint64_t v7 = [v2 persistentPropertiesForKeys:v5 forSenderDescriptor:v6];

  long long v8 = [v7 valueForKey:@"SqueezeIsSystemShortcut"];
  if (([v8 BOOLValue] & 1) == 0)
  {
    long long v9 = +[BKSDefaults localDefaults];
    unsigned __int8 v3 = [v9 isSqueezeForSystemShortcutEnabled];
  }
  return v3;
}

- (__IOHIDEvent)systemEventOfType:(unsigned int)a3 matchingEvent:(__IOHIDEvent *)a4 options:(unsigned int)a5
{
  return (__IOHIDEvent *)[(BKHIDSystem *)self->_system systemEventOfType:*(void *)&a3 matchingEvent:a4 options:*(void *)&a5];
}

- (void)injectGSEvent:(__GSEvent *)a3
{
}

- (void)injectHIDEvent:(__IOHIDEvent *)a3
{
}

- (void)setSystemProperty:(id)a3 forKey:(id)a4
{
}

- (id)systemPropertyForKey:(id)a3
{
  return [(BKHIDSystem *)self->_system systemPropertyForKey:a3];
}

- (BKHIDClientConnectionManager)clientConnectionManager
{
  return (BKHIDClientConnectionManager *)[(BKHIDSystem *)self->_system clientConnectionManager];
}

- (BKHIDEventDeliveryManager)deliveryManager
{
  return (BKHIDEventDeliveryManager *)[(BKHIDSystem *)self->_system deliveryManager];
}

- (void)startServer
{
  sub_100040DF4("BKHIDSystem MiG server");
  unsigned __int8 v3 = (OS_dispatch_mach *)objc_claimAutoreleasedReturnValue();
  HIDSystemChannel = self->_HIDSystemChannel;
  self->_HIDSystemChannel = v3;

  id v5 = BKLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "starting HID server...", v6, 2u);
  }

  [(BKHIDSystem *)self->_system startServerWithChannel:self->_HIDSystemChannel];
}

- (void)startEventProcessing
{
  id v10 = +[BKHIDEventProcessorRegistry sharedInstance];
  id v3 = objc_alloc_init((Class)BKHIDEventProcessorCreationContext);
  [v3 setSystemInterface:self];
  [v3 setEventDispatcher:self];
  [v3 setServiceMatcherDataProvider:self];
  [v3 setEventProcessorRegistry:v10];
  v4 = BKHIDCreatePrimaryEventProcessor();
  id v5 = objc_alloc_init(BKMainDisplayObserver);
  id v6 = objc_alloc_init((Class)BKHIDEventDeliveryObserverService);
  id v7 = [objc_alloc((Class)BKHIDEventDeliveryManager) initWithObserverService:v6];
  long long v8 = (BKHIDEventDeliveryManagerServer *)[objc_alloc((Class)BKHIDEventDeliveryManagerServer) initWithDeliveryManager:v7 ruleChangeAuthority:self];
  deliveryManagerServer = self->_deliveryManagerServer;
  self->_deliveryManagerServer = v8;

  [(BKHIDSystem *)self->_system startEventProcessor:v4 mainDisplayObserver:v5 deliveryManager:v7 dispatcherProvider:self];
}

- (void)startEventRouting
{
}

- (void)startHIDSystem
{
}

- (BKHIDSystemInterface)init
{
  v6.receiver = self;
  v6.super_class = (Class)BKHIDSystemInterface;
  v2 = [(BKHIDSystemInterface *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[BKHIDSystem sharedInstance];
    system = v2->_system;
    v2->_system = (BKHIDSystem *)v3;

    [(BKHIDSystem *)v2->_system setDelegate:v2];
  }
  return v2;
}

@end