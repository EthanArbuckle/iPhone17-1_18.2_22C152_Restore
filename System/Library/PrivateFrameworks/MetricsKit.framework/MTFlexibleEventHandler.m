@interface MTFlexibleEventHandler
- (BOOL)mtIncludeBaseFields;
- (id)eventTime:(id)a3;
- (id)knownFields;
- (id)metricsDataWithEventType:(id)a3 eventData:(id)a4;
@end

@implementation MTFlexibleEventHandler

- (id)metricsDataWithEventType:(id)a3 eventData:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  v12 = @"eventType";
  v13[0] = a3;
  v6 = NSDictionary;
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 dictionaryWithObjects:v13 forKeys:&v12 count:1];

  v10 = -[MTEventHandler metricsDataWithFields:](self, "metricsDataWithFields:", v9, v7, 0);

  return v10;
}

- (id)eventTime:(id)a3
{
  id v4 = a3;
  v5 = [(MTObject *)self metricsKit];
  v6 = [v5 eventHandlers];
  id v7 = [v6 base];
  id v8 = [v7 eventTime:v4];

  return v8;
}

- (id)knownFields
{
  v10[2] = *MEMORY[0x263EF8340];
  v3 = [(MTEventDataProvider *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(MTEventDataProvider *)self delegate];
    v6 = [v5 knownFields];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MTFlexibleEventHandler;
    v5 = [(MTEventHandler *)&v9 knownFields];
    v10[0] = @"eventTime";
    v10[1] = @"eventType";
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
    v6 = [v5 arrayByAddingObjectsFromArray:v7];
  }

  return v6;
}

- (BOOL)mtIncludeBaseFields
{
  v3 = [(MTEventDataProvider *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = [v5 mtIncludeBaseFields];

  return v6;
}

@end