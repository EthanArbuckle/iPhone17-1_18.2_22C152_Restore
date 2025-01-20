@interface _LTAnalyticsEvent
+ (id)timedEventWithName:(id)a3;
- (NSLocale)sourceLocale;
- (NSLocale)targetLocale;
- (_LTAnalyticsEvent)initWithName:(id)a3;
- (void)addFieldsFromDictionary:(id)a3;
- (void)addFieldsFromDictionary:(id)a3 internalOnly:(BOOL)a4;
- (void)addFieldsWithError:(id)a3;
- (void)markEnd;
- (void)markStart;
- (void)sendLazy;
- (void)setSourceLocale:(id)a3;
- (void)setTargetLocale:(id)a3;
- (void)timestampWithName:(id)a3;
@end

@implementation _LTAnalyticsEvent

- (_LTAnalyticsEvent)initWithName:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_LTAnalyticsEvent;
  v5 = [(_LTAnalyticsEvent *)&v15 init];
  v6 = v5;
  if (v5)
  {
    *(_OWORD *)&v5->_startTime = xmmword_26027B540;
    uint64_t v7 = [NSString stringWithFormat:@"%@.%@", @"com.apple.translation", v4];
    eventName = v6->_eventName;
    v6->_eventName = (NSString *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.translation.analytics-event", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    fields = v6->_fields;
    v6->_fields = (NSMutableDictionary *)v11;

    v13 = v6;
  }

  return v6;
}

+ (id)timedEventWithName:(id)a3
{
  id v3 = a3;
  id v4 = [[_LTAnalyticsEvent alloc] initWithName:v3];

  [(_LTAnalyticsEvent *)v4 markStart];
  return v4;
}

- (void)markStart
{
  id v4 = [MEMORY[0x263F08AB0] processInfo];
  [v4 systemUptime];
  self->_startTime = v3;
}

- (void)markEnd
{
  id v4 = [MEMORY[0x263F08AB0] processInfo];
  [v4 systemUptime];
  self->_endTime = v3;
}

- (void)timestampWithName:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F08AB0] processInfo];
  [v5 systemUptime];
  double v7 = v6;

  double v8 = v7 - self->_startTime;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __39___LTAnalyticsEvent_timestampWithName___block_invoke;
  v11[3] = &unk_265545C48;
  objc_copyWeak(v13, &location);
  id v12 = v4;
  v13[1] = *(id *)&v8;
  id v10 = v4;
  dispatch_async(queue, v11);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

- (void)addFieldsFromDictionary:(id)a3
{
}

- (void)addFieldsFromDictionary:(id)a3 internalOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!v4 || _LTIsInternalInstall())
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58___LTAnalyticsEvent_addFieldsFromDictionary_internalOnly___block_invoke;
    block[3] = &unk_265545C70;
    objc_copyWeak(&v10, &location);
    id v9 = v6;
    dispatch_async(queue, block);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)addFieldsWithError:(id)a3
{
  v11[3] = *MEMORY[0x263EF8340];
  v10[0] = @"errorDomain";
  id v4 = a3;
  v5 = [v4 domain];
  v11[0] = v5;
  v10[1] = @"errorCode";
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "code"));
  v11[1] = v6;
  v10[2] = @"errorDescription";
  double v7 = [v4 localizedDescription];

  double v8 = &stru_270C008E8;
  if (v7) {
    double v8 = v7;
  }
  v11[2] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];
  [(_LTAnalyticsEvent *)self addFieldsFromDictionary:v9];
}

- (void)sendLazy
{
  if (self->_endTime < 0.0) {
    [(_LTAnalyticsEvent *)self markEnd];
  }
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29___LTAnalyticsEvent_sendLazy__block_invoke;
  block[3] = &unk_265545C70;
  objc_copyWeak(&v5, &location);
  void block[4] = self;
  dispatch_async(queue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (NSLocale)sourceLocale
{
  return self->_sourceLocale;
}

- (void)setSourceLocale:(id)a3
{
}

- (NSLocale)targetLocale
{
  return self->_targetLocale;
}

- (void)setTargetLocale:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetLocale, 0);
  objc_storeStrong((id *)&self->_sourceLocale, 0);
  objc_storeStrong((id *)&self->_fields, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
}

@end