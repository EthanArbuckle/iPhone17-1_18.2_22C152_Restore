@interface PPSPerformanceProfiler
+ (id)sharedInstance;
- (NSMutableDictionary)profilingStats;
- (NSMutableDictionary)start_times;
- (PPSPerformanceProfiler)init;
- (id)getProfilingStatsForQuery;
- (void)endProfilingForPhase:(id)a3;
- (void)setProfilingStats:(id)a3;
- (void)setStart_times:(id)a3;
- (void)startProfilingForPhase:(id)a3;
@end

@implementation PPSPerformanceProfiler

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_7);
  }
  v2 = (void *)sharedInstance_perfProfiler;
  return v2;
}

uint64_t __40__PPSPerformanceProfiler_sharedInstance__block_invoke()
{
  sharedInstance_perfProfiler = objc_alloc_init(PPSPerformanceProfiler);
  return MEMORY[0x270F9A758]();
}

- (PPSPerformanceProfiler)init
{
  v8.receiver = self;
  v8.super_class = (Class)PPSPerformanceProfiler;
  v2 = [(PPSPerformanceProfiler *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    start_times = v2->_start_times;
    v2->_start_times = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    profilingStats = v2->_profilingStats;
    v2->_profilingStats = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (void)startProfilingForPhase:(id)a3
{
  id v8 = a3;
  v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_start_times, "objectForKeyedSubscript:");

  if (!v4)
  {
    uint64_t v5 = NSNumber;
    v6 = [MEMORY[0x263EFF910] date];
    [v6 timeIntervalSince1970];
    v7 = objc_msgSend(v5, "numberWithDouble:");
    [(NSMutableDictionary *)self->_start_times setObject:v7 forKeyedSubscript:v8];
  }
}

- (void)endProfilingForPhase:(id)a3
{
  id v12 = a3;
  v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_start_times, "objectForKeyedSubscript:");

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263EFF910] date];
    [v5 timeIntervalSince1970];
    double v7 = v6;
    id v8 = [(NSMutableDictionary *)self->_start_times objectForKeyedSubscript:v12];
    [v8 doubleValue];
    double v10 = v7 - v9;

    v11 = [NSNumber numberWithDouble:round(v10 * 1000.0) / 1000.0];
    [(NSMutableDictionary *)self->_profilingStats setObject:v11 forKeyedSubscript:v12];
  }
}

- (id)getProfilingStatsForQuery
{
  uint64_t v3 = (void *)[(NSMutableDictionary *)self->_profilingStats copy];
  NSLog(&cfstr_PerformancePro.isa, v3);
  [(NSMutableDictionary *)self->_start_times removeAllObjects];
  [(NSMutableDictionary *)self->_profilingStats removeAllObjects];
  return v3;
}

- (NSMutableDictionary)start_times
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStart_times:(id)a3
{
}

- (NSMutableDictionary)profilingStats
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setProfilingStats:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profilingStats, 0);
  objc_storeStrong((id *)&self->_start_times, 0);
}

@end