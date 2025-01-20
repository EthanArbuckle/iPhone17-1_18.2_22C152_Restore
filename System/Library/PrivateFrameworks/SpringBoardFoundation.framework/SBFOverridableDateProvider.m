@interface SBFOverridableDateProvider
- (SBFOverridableDateProvider)init;
- (SBFOverridableDateProvider)initWithDateProvider:(id)a3;
- (id)date;
- (id)observeMinuteUpdatesWithHandler:(id)a3;
- (void)_fireHandlersForDate:(id)a3;
- (void)_updateForOverrides;
- (void)_updateUnderlyingProvider;
- (void)removeMinuteUpdateHandler:(id)a3;
@end

@implementation SBFOverridableDateProvider

uint64_t __51__SBFOverridableDateProvider__fireHandlersForDate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, void))(a3 + 16))(a3, *(void *)(a1 + 32));
}

- (id)date
{
  v3 = self->_overrideDate;
  if (!v3)
  {
    v3 = [(SBFDateProviding *)self->_underlyingProvider date];
  }
  if (self->_overrideDateOffset != 0.0)
  {
    uint64_t v4 = -[NSDate dateByAddingTimeInterval:](v3, "dateByAddingTimeInterval:");

    v3 = (NSDate *)v4;
  }
  return v3;
}

void __55__SBFOverridableDateProvider__updateUnderlyingProvider__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (*(double *)(a1 + 40) == 0.0)
  {
    id v5 = v6;
  }
  else
  {
    uint64_t v4 = objc_msgSend(v6, "dateByAddingTimeInterval:");

    id v5 = (id)v4;
  }
  id v7 = v5;
  [WeakRetained _fireHandlersForDate:v5];
}

- (void)_fireHandlersForDate:(id)a3
{
  id v4 = a3;
  minuteHandlers = self->_minuteHandlers;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__SBFOverridableDateProvider__fireHandlersForDate___block_invoke;
  v7[3] = &unk_1E548CF40;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)minuteHandlers enumerateKeysAndObjectsUsingBlock:v7];
}

- (SBFOverridableDateProvider)init
{
  v3 = objc_alloc_init(SBFDefaultDateProvider);
  id v4 = [(SBFOverridableDateProvider *)self initWithDateProvider:v3];

  return v4;
}

- (SBFOverridableDateProvider)initWithDateProvider:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBFOverridableDateProvider;
  id v6 = [(SBFOverridableDateProvider *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_underlyingProvider, a3);
    uint64_t v8 = +[SBFDateTimeController sharedInstance];
    dateTimeController = v7->_dateTimeController;
    v7->_dateTimeController = (SBFDateTimeController *)v8;

    [(SBFDateTimeController *)v7->_dateTimeController addObserver:v7];
    [(SBFOverridableDateProvider *)v7 _updateForOverrides];
  }

  return v7;
}

- (id)observeMinuteUpdatesWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = NSNumber;
  ++self->_nextToken;
  id v6 = objc_msgSend(v5, "numberWithUnsignedInteger:");
  if (!self->_minuteHandlers)
  {
    id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    minuteHandlers = self->_minuteHandlers;
    self->_minuteHandlers = v7;
  }
  v9 = (void *)[v4 copy];
  v10 = (void *)MEMORY[0x18C133210]();
  [(NSMutableDictionary *)self->_minuteHandlers setObject:v10 forKeyedSubscript:v6];

  [(SBFOverridableDateProvider *)self _updateUnderlyingProvider];
  return v6;
}

- (void)removeMinuteUpdateHandler:(id)a3
{
  [(NSMutableDictionary *)self->_minuteHandlers removeObjectForKey:a3];
  [(SBFOverridableDateProvider *)self _updateUnderlyingProvider];
}

- (void)_updateForOverrides
{
  v3 = [(SBFDateTimeController *)self->_dateTimeController overrideDate];
  id v4 = (NSDate *)[v3 copy];
  overrideDate = self->_overrideDate;
  self->_overrideDate = v4;

  [(SBFDateTimeController *)self->_dateTimeController overrideDateOffset];
  self->_overrideDateOffset = v6;
  [(SBFOverridableDateProvider *)self _updateUnderlyingProvider];
  id v7 = [(SBFOverridableDateProvider *)self date];
  [(SBFOverridableDateProvider *)self _fireHandlersForDate:v7];
}

- (void)_updateUnderlyingProvider
{
  uint64_t v3 = [(NSMutableDictionary *)self->_minuteHandlers count];
  id underlyingToken = self->_underlyingToken;
  overrideDate = self->_overrideDate;
  if (v3) {
    BOOL v6 = overrideDate == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    if (!underlyingToken)
    {
      double overrideDateOffset = self->_overrideDateOffset;
      objc_initWeak(&location, self);
      underlyingProvider = self->_underlyingProvider;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __55__SBFOverridableDateProvider__updateUnderlyingProvider__block_invoke;
      v14[3] = &unk_1E548D1B0;
      objc_copyWeak(v15, &location);
      v15[1] = *(id *)&overrideDateOffset;
      v12 = [(SBFDateProviding *)underlyingProvider observeMinuteUpdatesWithHandler:v14];
      id v13 = self->_underlyingToken;
      self->_id underlyingToken = v12;

      objc_destroyWeak(v15);
      objc_destroyWeak(&location);
    }
  }
  else if (underlyingToken)
  {
    if (v3) {
      BOOL v7 = overrideDate == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (!v7)
    {
      uint64_t v8 = [(SBFOverridableDateProvider *)self date];
      [(SBFOverridableDateProvider *)self _fireHandlersForDate:v8];

      id underlyingToken = self->_underlyingToken;
    }
    [(SBFDateProviding *)self->_underlyingProvider removeMinuteUpdateHandler:underlyingToken];
    id v9 = self->_underlyingToken;
    self->_id underlyingToken = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong(&self->_underlyingToken, 0);
  objc_storeStrong((id *)&self->_minuteHandlers, 0);
  objc_storeStrong((id *)&self->_underlyingProvider, 0);
  objc_storeStrong((id *)&self->_dateTimeController, 0);
}

@end