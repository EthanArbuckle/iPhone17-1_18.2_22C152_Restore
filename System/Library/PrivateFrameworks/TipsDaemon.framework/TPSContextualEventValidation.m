@interface TPSContextualEventValidation
+ (id)_eventProviderForContextualEvent:(id)a3;
+ (id)contextualEventFromEventDictionary:(id)a3;
- (BOOL)isRegistrable;
- (TPSContextualEvent)event;
- (TPSContextualEventValidation)initWithContextualEvent:(id)a3;
- (TPSEventsProvider)eventProvider;
- (id)completionHandler;
- (void)dataProvider:(id)a3 didFinishQueryWithResults:(id)a4;
- (void)setCompletionHandler:(id)a3;
- (void)setEvent:(id)a3;
- (void)setEventProvider:(id)a3;
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSContextualEventValidation

- (void)dataProvider:(id)a3 didFinishQueryWithResults:(id)a4
{
  v5 = objc_msgSend(a4, "firstObject", a3);
  v6 = [(TPSContextualEventValidation *)self event];
  uint64_t v7 = [v6 status];

  if (v7 == 1)
  {
    v8 = [v5 observationMap];
    unint64_t v10 = [v8 count];
    v11 = [(TPSContextualEventValidation *)self event];
    BOOL v9 = v10 >= [v11 minObservationCount];

    goto LABEL_5;
  }
  if (!v7)
  {
    v8 = [v5 observationMap];
    BOOL v9 = [v8 count] == 0;
LABEL_5:

    goto LABEL_9;
  }
  v12 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[TPSContextualEventValidation dataProvider:didFinishQueryWithResults:](self, v12);
  }

  BOOL v9 = 0;
LABEL_9:
  v13 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[TPSContextualEventValidation dataProvider:didFinishQueryWithResults:](self, v9, v13);
  }

  v14 = [(TPSContextualEventValidation *)self completionHandler];
  v14[2](v14, v9, 0);

  [(TPSContextualEventValidation *)self setCompletionHandler:0];
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)validateWithCompletion:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void, void *))a3;
  v5 = [(TPSContextualEventValidation *)self event];

  if (!v5)
  {
    v6 = objc_opt_class();
    uint64_t v7 = [(TPSTargetingValidation *)self value];
    v8 = [v6 contextualEventFromEventDictionary:v7];
    [(TPSContextualEventValidation *)self setEvent:v8];

    BOOL v9 = [(TPSContextualEventValidation *)self event];

    if (!v9)
    {
      v22 = [MEMORY[0x1E4FAF480] targeting];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = [(TPSTargetingValidation *)self value];
        *(_DWORD *)buf = 138412290;
        v28 = v23;
        v24 = "Failed to create event from value: %@";
        goto LABEL_11;
      }
LABEL_12:

      v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
      v4[2](v4, 0, v15);
      goto LABEL_16;
    }
  }
  unint64_t v10 = objc_opt_class();
  v11 = [(TPSContextualEventValidation *)self event];
  v12 = [v10 _eventProviderForContextualEvent:v11];
  [(TPSContextualEventValidation *)self setEventProvider:v12];

  v13 = [(TPSContextualEventValidation *)self eventProvider];

  if (!v13)
  {
    v22 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = [(TPSContextualEventValidation *)self event];
      *(_DWORD *)buf = 138412290;
      v28 = v23;
      v24 = "Failed to create event provider from event: %@";
LABEL_11:
      _os_log_impl(&dword_1E4492000, v22, OS_LOG_TYPE_INFO, v24, buf, 0xCu);

      goto LABEL_12;
    }
    goto LABEL_12;
  }
  v14 = [(TPSContextualEventValidation *)self event];
  v15 = [v14 eventSinceDate];

  if (v15
    && ([MEMORY[0x1E4F1C9C8] now],
        v16 = objc_claimAutoreleasedReturnValue(),
        uint64_t v17 = [v16 compare:v15],
        v16,
        v17 == -1))
  {
    v25 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v15;
      _os_log_impl(&dword_1E4492000, v25, OS_LOG_TYPE_INFO, "Event since date (%@) is the future - skipping", buf, 0xCu);
    }

    v4[2](v4, 0, 0);
  }
  else
  {
    [(TPSContextualEventValidation *)self setCompletionHandler:v4];
    v18 = [(TPSContextualEventValidation *)self eventProvider];
    [v18 setDelegate:self];

    v19 = [(TPSContextualEventValidation *)self eventProvider];
    v20 = [(TPSContextualEventValidation *)self event];
    v26 = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
    [v19 queryEvents:v21];
  }
LABEL_16:
}

- (TPSContextualEvent)event
{
  return self->_event;
}

- (TPSEventsProvider)eventProvider
{
  return self->_eventProvider;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void)setEventProvider:(id)a3
{
}

+ (id)_eventProviderForContextualEvent:(id)a3
{
  uint64_t v3 = [a3 type];
  if (v3 == 3) {
    goto LABEL_4;
  }
  uint64_t v4 = v3;
  if (v3 == 2)
  {
    v5 = (objc_class *)MEMORY[0x1E4FAF410];
    goto LABEL_6;
  }
  if (!v3)
  {
LABEL_4:
    v5 = (objc_class *)MEMORY[0x1E4FAF3D0];
LABEL_6:
    id v6 = objc_alloc_init(v5);
    goto LABEL_10;
  }
  uint64_t v7 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    +[TPSContextualEventValidation _eventProviderForContextualEvent:](v4, v7);
  }

  id v6 = 0;
LABEL_10:

  return v6;
}

- (void)setEvent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_eventProvider, 0);

  objc_storeStrong((id *)&self->_event, 0);
}

- (TPSContextualEventValidation)initWithContextualEvent:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSContextualEventValidation;
  id v6 = [(TPSTargetingValidation *)&v9 initWithTargetContext:MEMORY[0x1E4F1CC08]];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_event, a3);
  }

  return v7;
}

- (BOOL)isRegistrable
{
  v2 = (void *)MEMORY[0x1E4FAF440];
  uint64_t v3 = [(TPSTargetingValidation *)self value];
  uint64_t v4 = [v2 typeFromEventDictionary:v3];

  return v4 == 3;
}

+ (id)contextualEventFromEventDictionary:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4FAF440] typeFromEventDictionary:v3];
  if (v4 == 3)
  {
    uint64_t v6 = [MEMORY[0x1E4FAF428] contextualBiomeEventFromDictionary:v3];
    goto LABEL_7;
  }
  uint64_t v5 = v4;
  if (v4 == 2)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4FAF438]) initWithDictionary:v3];
    goto LABEL_7;
  }
  if (!v4)
  {
    uint64_t v6 = [MEMORY[0x1E4FAF428] contextualBiomeEventFromDuetEventDictionary:v3];
LABEL_7:
    uint64_t v7 = (void *)v6;
    goto LABEL_11;
  }
  v8 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    +[TPSContextualEventValidation contextualEventFromEventDictionary:](v5, v8);
  }

  uint64_t v7 = 0;
LABEL_11:

  return v7;
}

+ (void)contextualEventFromEventDictionary:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E4492000, a2, OS_LOG_TYPE_ERROR, "Failed creating contextualEvent. Unsupported/unrecognized eventType: %ld", (uint8_t *)&v2, 0xCu);
}

+ (void)_eventProviderForContextualEvent:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E4492000, a2, OS_LOG_TYPE_ERROR, "Failed finding event provider. Unsupported/unrecognized eventType: %ld", (uint8_t *)&v2, 0xCu);
}

- (void)dataProvider:(NSObject *)a3 didFinishQueryWithResults:.cold.1(void *a1, char a2, NSObject *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a1 name];
  uint64_t v7 = [a1 targetContext];
  v8 = [a1 event];
  objc_super v9 = [v8 debugDescription];
  int v10 = 138413058;
  v11 = v6;
  __int16 v12 = 2112;
  v13 = v7;
  __int16 v14 = 2112;
  v15 = v9;
  __int16 v16 = 1024;
  int v17 = a2 & 1;
  _os_log_debug_impl(&dword_1E4492000, a3, OS_LOG_TYPE_DEBUG, "%@ - targetContext: %@. Event: %@, Valid: %d", (uint8_t *)&v10, 0x26u);
}

- (void)dataProvider:(void *)a1 didFinishQueryWithResults:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 name];
  uint64_t v5 = [a1 targetContext];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  objc_super v9 = v5;
  _os_log_error_impl(&dword_1E4492000, a2, OS_LOG_TYPE_ERROR, "%@ - targetContext: %@. Unknown Event Status", (uint8_t *)&v6, 0x16u);
}

@end