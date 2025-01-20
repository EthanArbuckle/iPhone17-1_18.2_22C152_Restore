@interface MTEventHandlerRegistration
- (Class)eventHandlerClass;
- (MTEventHandler)eventHandler;
- (MTEventHandlerRegistration)initWithMetricsKit:(id)a3 name:(id)a4 class:(Class)a5 eventData:(id)a6;
- (NSArray)eventData;
- (NSString)registeredName;
- (void)setEventData:(id)a3;
- (void)setEventHandler:(id)a3;
- (void)setEventHandlerClass:(Class)a3;
- (void)setRegisteredName:(id)a3;
@end

@implementation MTEventHandlerRegistration

- (MTEventHandlerRegistration)initWithMetricsKit:(id)a3 name:(id)a4 class:(Class)a5 eventData:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)MTEventHandlerRegistration;
  v12 = [(MTObject *)&v15 initWithMetricsKit:a3];
  v13 = v12;
  if (v12)
  {
    [(MTEventHandlerRegistration *)v12 setRegisteredName:v10];
    [(MTEventHandlerRegistration *)v13 setEventHandlerClass:a5];
    [(MTEventHandlerRegistration *)v13 setEventData:v11];
  }

  return v13;
}

- (MTEventHandler)eventHandler
{
  v17[1] = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_eventHandler)
  {
    id v3 = objc_alloc([(MTEventHandlerRegistration *)v2 eventHandlerClass]);
    v4 = [(MTObject *)v2 metricsKit];
    v5 = (MTEventHandler *)[v3 initWithMetricsKit:v4];

    v6 = [(MTEventHandlerRegistration *)v2 registeredName];
    [(MTEventHandler *)v5 setRegisteredName:v6];

    v7 = [MEMORY[0x263EFF980] array];
    v16 = @"eventType";
    v8 = [(MTEventHandlerRegistration *)v2 registeredName];
    v17[0] = v8;
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
    [v7 addObject:v9];

    id v10 = [(MTEventHandlerRegistration *)v2 eventData];
    LOBYTE(v9) = [v10 count] == 0;

    if ((v9 & 1) == 0)
    {
      id v11 = [(MTEventHandlerRegistration *)v2 eventData];
      [v7 addObjectsFromArray:v11];
    }
    v12 = (void *)[v7 copy];
    [(MTEventHandler *)v5 setRegisteredEventData:v12];

    eventHandler = v2->_eventHandler;
    v2->_eventHandler = v5;
  }
  objc_sync_exit(v2);

  v14 = v2->_eventHandler;

  return v14;
}

- (NSString)registeredName
{
  return self->_registeredName;
}

- (void)setRegisteredName:(id)a3
{
}

- (Class)eventHandlerClass
{
  return self->_eventHandlerClass;
}

- (void)setEventHandlerClass:(Class)a3
{
}

- (NSArray)eventData
{
  return self->_eventData;
}

- (void)setEventData:(id)a3
{
}

- (void)setEventHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_eventData, 0);
  objc_storeStrong((id *)&self->_eventHandlerClass, 0);

  objc_storeStrong((id *)&self->_registeredName, 0);
}

@end