@interface PUTimingManager
+ (id)defaultManager;
- (PUTimingManager)init;
- (id)stopwatchForKey:(id)a3;
- (void)removeStopwatchForKey:(id)a3;
@end

@implementation PUTimingManager

- (void).cxx_destruct
{
}

- (void)removeStopwatchForKey:(id)a3
{
}

- (id)stopwatchForKey:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_stopwatches objectForKeyedSubscript:v4];

  if (!v5)
  {
    v6 = [PUVFXStopWatch alloc];
    v7 = __log();
    v8 = [(PUVFXStopWatch *)v6 initWithLog:v7];
    [(NSMutableDictionary *)self->_stopwatches setObject:v8 forKeyedSubscript:v4];
  }
  v9 = [(NSMutableDictionary *)self->_stopwatches objectForKeyedSubscript:v4];

  return v9;
}

- (PUTimingManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)PUTimingManager;
  v2 = [(PUTimingManager *)&v6 init];
  uint64_t v3 = objc_opt_new();
  stopwatches = v2->_stopwatches;
  v2->_stopwatches = (NSMutableDictionary *)v3;

  return v2;
}

+ (id)defaultManager
{
  if (defaultManager_onceToken != -1) {
    dispatch_once(&defaultManager_onceToken, &__block_literal_global_614);
  }
  v2 = (void *)defaultManager___default;
  return v2;
}

void __33__PUTimingManager_defaultManager__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)defaultManager___default;
  defaultManager___default = v0;
}

@end