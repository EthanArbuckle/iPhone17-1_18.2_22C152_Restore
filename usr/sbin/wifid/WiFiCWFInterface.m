@interface WiFiCWFInterface
+ (id)sharedWiFiCWFInterfaceInstance;
- (CWFHomeManager)_homeManager;
- (NSMutableDictionary)_eventHandlers;
- (WiFiCWFInterface)init;
- (id)getServiceFor:(id)a3 withServiceKey:(id)a4;
- (id)performSensing;
- (id)startMonitoringSupportedEvents:(id)a3;
- (id)stopMonitoringSupportedEvents:(id)a3;
- (int)performSensingFor:(id)a3;
- (void)setPerformSensing:(id)a3;
- (void)set_eventHandlers:(id)a3;
- (void)set_homeManager:(id)a3;
@end

@implementation WiFiCWFInterface

+ (id)sharedWiFiCWFInterfaceInstance
{
  if (qword_10027D5E0 != -1) {
    dispatch_once(&qword_10027D5E0, &stru_10023F028);
  }
  return (id)qword_10027D5D8;
}

- (WiFiCWFInterface)init
{
  v5.receiver = self;
  v5.super_class = (Class)WiFiCWFInterface;
  v2 = [(WiFiCWFInterface *)&v5 init];
  if (v2)
  {
    if (MGGetBoolAnswer())
    {
      if (_os_feature_enabled_impl())
      {
        [(WiFiCWFInterface *)v2 set_eventHandlers:+[NSMutableDictionary dictionary]];
        [(WiFiCWFInterface *)v2 set_homeManager:+[CWFHomeManager cwfHomeManagerWithDelegate:v2]];
        if (qword_10027DD68) {
          [((id)qword_10027DD68) WFLog:message:3, "%s:CWFHomeManager instance %p", "-[WiFiCWFInterface init]", -[WiFiCWFInterface _homeManager](v2, "_homeManager")];
        }
        goto LABEL_6;
      }
      if (qword_10027DD68) {
        [((id)qword_10027DD68) WFLog:3, "%s: OS does not support sensing, don't create this interface\n", "-[WiFiCWFInterface init]"];
      }
    }
    else
    {
      if (qword_10027DD68) {
        [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: Non internal build, don't create this interface\n", "-[WiFiCWFInterface init]")];
      }
    }
    v2 = 0;
LABEL_6:
  }
  return v2;
}

- (id)startMonitoringSupportedEvents:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if ([(NSMutableDictionary *)[(WiFiCWFInterface *)self _eventHandlers] objectForKey:v9])
        {
          if (qword_10027DD68) {
            [((id)qword_10027DD68) WFLog:3, @"%s: event already exists in handler", @"-[WiFiCWFInterface startMonitoringSupportedEvents:]"];
          }
          return (id)-3900;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](-[WiFiCWFInterface _eventHandlers](self, "_eventHandlers"), "setObject:forKeyedSubscript:", [a3 objectForKeyedSubscript:v9], v9);
      }
      id v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  return +[NSError errorWithDomain:@"CWFHomeKitErrorDomain" code:0 userInfo:0];
}

- (id)stopMonitoringSupportedEvents:(id)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(a3);
        }
        [(NSMutableDictionary *)[(WiFiCWFInterface *)self _eventHandlers] removeObjectForKey:*(void *)(*((void *)&v10 + 1) + 8 * (void)v8)];
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return +[NSError errorWithDomain:@"CWFHomeKitErrorDomain" code:0 userInfo:0];
}

- (int)performSensingFor:(id)a3
{
  v3 = (uint64_t (*)(void))*((void *)[(WiFiCWFInterface *)self performSensing] + 2);

  return v3();
}

- (id)getServiceFor:(id)a3 withServiceKey:(id)a4
{
  if ([(NSMutableDictionary *)[(WiFiCWFInterface *)self _eventHandlers] objectForKey:a4])
  {
    uint64_t v7 = (uint64_t (**)(id, id))[(NSMutableDictionary *)[(WiFiCWFInterface *)self _eventHandlers] objectForKeyedSubscript:a4];
    v8 = (NSError *)v7[2](v7, a3);
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:3, "%s:Start data collect for sensing params %@ with erorr %@", "-[WiFiCWFInterface getServiceFor:withServiceKey:]", a3, v8 message];
    }
  }
  else
  {
    v8 = +[NSError errorWithDomain:CWFManagerErrorDomain code:-3907 userInfo:0];
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:3, "%s:%@ service doesn't exist", "-[WiFiCWFInterface getServiceFor:withServiceKey:]", a4, v11 message];
    }
  }
  return v8;
}

- (id)performSensing
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setPerformSensing:(id)a3
{
}

- (CWFHomeManager)_homeManager
{
  return self->__homeManager;
}

- (void)set_homeManager:(id)a3
{
}

- (NSMutableDictionary)_eventHandlers
{
  return self->__eventHandlers;
}

- (void)set_eventHandlers:(id)a3
{
}

@end