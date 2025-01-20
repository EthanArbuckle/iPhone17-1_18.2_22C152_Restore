@interface MTPAFEventHandlers
- (Class)baseDataProviderClass;
- (MTMediaActivityEventHandler)playStart;
- (MTMediaActivityEventHandler)playStop;
- (MTMediaActivityEventHandler)seekStart;
- (MTMediaActivityEventHandler)seekStop;
- (void)registerDefaultEventHandlers;
@end

@implementation MTPAFEventHandlers

- (void)registerDefaultEventHandlers
{
  v26[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_class();
  v24[0] = @"eventType";
  v24[1] = @"actionType";
  v25[0] = @"playActivity";
  v25[1] = @"start";
  v4 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
  v26[0] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
  [(MTEventHandlers *)self registerEventHandlerName:@"playStart" eventHandlerClass:v3 eventData:v5];

  uint64_t v6 = objc_opt_class();
  v21[0] = @"eventType";
  v21[1] = @"actionType";
  v22[0] = @"playActivity";
  v22[1] = @"stop";
  v7 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
  v23 = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
  [(MTEventHandlers *)self registerEventHandlerName:@"playStop" eventHandlerClass:v6 eventData:v8];

  uint64_t v9 = objc_opt_class();
  v18[0] = @"eventType";
  v18[1] = @"actionType";
  v19[0] = @"seekActivity";
  v19[1] = @"start";
  v10 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  v20 = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
  [(MTEventHandlers *)self registerEventHandlerName:@"seekStart" eventHandlerClass:v9 eventData:v11];

  uint64_t v12 = objc_opt_class();
  v15[0] = @"eventType";
  v15[1] = @"actionType";
  v16[0] = @"seekActivity";
  v16[1] = @"stop";
  v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  v17 = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
  [(MTEventHandlers *)self registerEventHandlerName:@"seekStop" eventHandlerClass:v12 eventData:v14];
}

- (Class)baseDataProviderClass
{
  return (Class)objc_opt_class();
}

- (MTMediaActivityEventHandler)playStart
{
  return (MTMediaActivityEventHandler *)[(MTEventHandlers *)self objectForKeyedSubscript:@"playStart"];
}

- (MTMediaActivityEventHandler)playStop
{
  return (MTMediaActivityEventHandler *)[(MTEventHandlers *)self objectForKeyedSubscript:@"playStop"];
}

- (MTMediaActivityEventHandler)seekStart
{
  return (MTMediaActivityEventHandler *)[(MTEventHandlers *)self objectForKeyedSubscript:@"seekStart"];
}

- (MTMediaActivityEventHandler)seekStop
{
  return (MTMediaActivityEventHandler *)[(MTEventHandlers *)self objectForKeyedSubscript:@"seekStop"];
}

@end