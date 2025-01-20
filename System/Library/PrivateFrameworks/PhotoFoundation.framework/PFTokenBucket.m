@interface PFTokenBucket
- (BOOL)removeToken;
- (PFTokenBucket)initWithName:(id)a3 capacity:(int64_t)a4 decimalRefillRatePerMsec:(id)a5 timeService:(id)a6;
- (PFTokenBucket)initWithName:(id)a3 capacity:(int64_t)a4 refillPeriod:(int64_t)a5;
- (PFTokenBucket)initWithName:(id)a3 capacity:(int64_t)a4 refillPeriod:(int64_t)a5 timeService:(id)a6;
- (PFTokenBucket)initWithName:(id)a3 capacity:(int64_t)a4 refillRate:(int64_t)a5;
- (PFTokenBucket)initWithName:(id)a3 capacity:(int64_t)a4 refillRate:(int64_t)a5 timeService:(id)a6;
- (id)stateCaptureDictionary;
@end

@implementation PFTokenBucket

- (PFTokenBucket)initWithName:(id)a3 capacity:(int64_t)a4 refillRate:(int64_t)a5
{
  id v8 = a3;
  v9 = +[PFTimeService defaultTimeService];
  v10 = [(PFTokenBucket *)self initWithName:v8 capacity:a4 refillRate:a5 timeService:v9];

  return v10;
}

- (PFTokenBucket)initWithName:(id)a3 capacity:(int64_t)a4 refillRate:(int64_t)a5 timeService:(id)a6
{
  v10 = (objc_class *)MEMORY[0x1E4F28C28];
  id v11 = a6;
  id v12 = a3;
  v13 = (void *)[[v10 alloc] initWithMantissa:a5 exponent:4294967293 isNegative:0];
  v14 = [(PFTokenBucket *)self initWithName:v12 capacity:a4 decimalRefillRatePerMsec:v13 timeService:v11];

  return v14;
}

- (BOOL)removeToken
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28C28] one];
  if (self)
  {
    os_unfair_lock_lock(&self->_lock);
    v4 = (void *)MEMORY[0x1C186E190]();
    os_unfair_lock_assert_owner(&self->_lock);
    unint64_t v5 = [(PFTimeService *)self->_timeService clock_gettime_nsec_np:4] / 0xF4240;
    unint64_t lock_lastRefillMsecs = self->_lock_lastRefillMsecs;
    if (v5 > lock_lastRefillMsecs)
    {
      v7 = (void *)[objc_alloc(MEMORY[0x1E4F28C28]) initWithMantissa:v5 - lock_lastRefillMsecs exponent:0 isNegative:0];
      id v8 = [v7 decimalNumberByMultiplyingBy:self->_refillRatePerMsec];
      v9 = [(NSDecimalNumber *)self->_lock_availableTokens decimalNumberByAdding:v8];
      if ([(NSDecimalNumber *)v9 compare:self->_capacity] == NSOrderedDescending)
      {
        v10 = self->_capacity;

        v9 = v10;
      }
      lock_availableTokens = self->_lock_availableTokens;
      self->_lock_availableTokens = v9;
      id v12 = v9;

      self->_unint64_t lock_lastRefillMsecs = v5;
    }
    NSComparisonResult v13 = [(NSDecimalNumber *)self->_lock_availableTokens compare:v3];
    BOOL v14 = v13 != NSOrderedAscending;
    if (v13 != NSOrderedAscending)
    {
      os_signpost_id_t v15 = os_signpost_id_generate((os_log_t)self->_log);
      v16 = self->_log;
      v17 = v16;
      if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v16))
      {
        name = self->_name;
        v19 = self->_lock_availableTokens;
        int v23 = 138412546;
        v24 = name;
        __int16 v25 = 2112;
        v26 = v19;
        _os_signpost_emit_with_name_impl(&dword_1BC3A8000, v17, OS_SIGNPOST_EVENT, v15, "PFTokenBucket consume", "name: %@, availableTokens: %@", (uint8_t *)&v23, 0x16u);
      }

      v20 = [(NSDecimalNumber *)self->_lock_availableTokens decimalNumberBySubtracting:v3];
      v21 = self->_lock_availableTokens;
      self->_lock_availableTokens = v20;
    }
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (PFTokenBucket)initWithName:(id)a3 capacity:(int64_t)a4 decimalRefillRatePerMsec:(id)a5 timeService:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v26.receiver = self;
  v26.super_class = (Class)PFTokenBucket;
  NSComparisonResult v13 = [(PFTokenBucket *)&v26 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    name = v13->_name;
    v13->_name = (NSString *)v14;

    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F28C28]) initWithMantissa:a4 exponent:0 isNegative:0];
    capacity = v13->_capacity;
    v13->_capacity = (NSDecimalNumber *)v16;

    objc_storeStrong((id *)&v13->_refillRatePerMsec, a5);
    objc_storeStrong((id *)&v13->_timeService, a6);
    uint64_t v18 = PFBackendGetLog();
    log = v13->_log;
    v13->_log = (OS_os_log *)v18;

    v13->_lock._os_unfair_lock_opaque = 0;
    uint64_t v20 = [objc_alloc(MEMORY[0x1E4F28C28]) initWithMantissa:a4 exponent:0 isNegative:0];
    lock_availableTokens = v13->_lock_availableTokens;
    v13->_lock_availableTokens = (NSDecimalNumber *)v20;

    v13->_unint64_t lock_lastRefillMsecs = [(PFTimeService *)v13->_timeService clock_gettime_nsec_np:4]/ 0xF4240;
    v22 = [[PFStateCaptureHandler alloc] initWithProvider:v13];
    stateHandler = v13->_stateHandler;
    v13->_stateHandler = v22;

    v24 = v13;
  }

  return v13;
}

- (PFTokenBucket)initWithName:(id)a3 capacity:(int64_t)a4 refillPeriod:(int64_t)a5
{
  id v8 = a3;
  v9 = +[PFTimeService defaultTimeService];
  id v10 = [(PFTokenBucket *)self initWithName:v8 capacity:a4 refillPeriod:a5 timeService:v9];

  return v10;
}

- (PFTokenBucket)initWithName:(id)a3 capacity:(int64_t)a4 refillPeriod:(int64_t)a5 timeService:(id)a6
{
  id v10 = (objc_class *)MEMORY[0x1E4F28C28];
  id v11 = a6;
  id v12 = a3;
  NSComparisonResult v13 = (void *)[[v10 alloc] initWithMantissa:a5 exponent:3 isNegative:0];
  uint64_t v14 = [MEMORY[0x1E4F28C28] one];
  os_signpost_id_t v15 = [v14 decimalNumberByDividingBy:v13];
  uint64_t v16 = [(PFTokenBucket *)self initWithName:v12 capacity:a4 decimalRefillRatePerMsec:v15 timeService:v11];

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_availableTokens, 0);
  objc_storeStrong((id *)&self->_stateHandler, 0);
  objc_storeStrong((id *)&self->_timeService, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_refillRatePerMsec, 0);
  objc_storeStrong((id *)&self->_capacity, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (id)stateCaptureDictionary
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t lock_lastRefillMsecs = self->_lock_lastRefillMsecs;
  unint64_t v5 = self->_lock_availableTokens;
  os_unfair_lock_unlock(p_lock);
  unint64_t v6 = [(PFTimeService *)self->_timeService clock_gettime_nsec_np:4] / 0xF4240
     - lock_lastRefillMsecs;
  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  [v7 setObject:self->_name forKeyedSubscript:@"name"];
  [v7 setObject:self->_capacity forKeyedSubscript:@"capacity"];
  [v7 setObject:self->_refillRatePerMsec forKeyedSubscript:@"refillRatePerMsec"];
  [v7 setObject:v5 forKeyedSubscript:@"available tokens"];

  id v8 = [NSNumber numberWithUnsignedLongLong:v6];
  [v7 setObject:v8 forKeyedSubscript:@"last refill (ms ago)"];

  return v7;
}

@end