@interface SCMLPerformance
- (BOOL)computePerf;
- (NSMutableDictionary)results;
- (SCMLPerformance)initWithOptions:(id)a3;
- (void)run:(id)a3 block:(id)a4;
@end

@implementation SCMLPerformance

- (SCMLPerformance)initWithOptions:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SCMLPerformance;
  v5 = [(SCMLPerformance *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:SCMLTrackPerformance[0]];
    int v7 = [v6 BOOLValue];
    v5->_computePerf = v7;
    if (v7)
    {
      uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
      results = v5->_results;
      v5->_results = (NSMutableDictionary *)v8;
    }
  }

  return v5;
}

- (void)run:(id)a3 block:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(void))a4;
  if ([(SCMLPerformance *)self computePerf])
  {
    pc_session_create();
    uint64_t v8 = [MEMORY[0x263F08AB0] processInfo];
    [v8 processIdentifier];
    pc_session_set_procpid();

    pc_session_add_metric();
    pc_session_add_metric();
    pc_session_add_metric();
    pc_session_add_metric();
    pc_session_add_metric();
    pc_session_begin();
    v9 = [MEMORY[0x263EFF910] date];
    if (v7) {
      v7[2](v7);
    }
    v10 = [MEMORY[0x263EFF910] date];
    [v10 timeIntervalSinceDate:v9];
    double v12 = v11;

    pc_session_end();
    v13 = [[SCMLPerformanceResult alloc] initWithName:v6];
    pc_session_get_value();
    pc_session_get_value();
    pc_session_get_value();
    pc_session_get_value();
    pc_session_get_value();
    pc_session_get_value();
    pc_session_destroy();
    float64x2_t v14 = (float64x2_t)vdupq_n_s64(0x3F50000000000000uLL);
    *(float64x2_t *)&v13->maxpeak = vmulq_f64(*(float64x2_t *)&v13->maxpeak, v14);
    *(float64x2_t *)&v13->recentpeak = vmulq_f64(*(float64x2_t *)&v13->recentpeak, v14);
    v13->cpuTime = v13->cpuTime / 1000000.0;
    v13->timeInterval = v12;
    v15 = [(SCMLPerformance *)self results];
    v16 = [v15 objectForKeyedSubscript:v6];

    if (!v16)
    {
      v17 = [MEMORY[0x263EFF980] array];
      v18 = [(SCMLPerformance *)self results];
      [v18 setObject:v17 forKeyedSubscript:v6];
    }
    v19 = [(SCMLPerformance *)self results];
    v20 = [v19 objectForKeyedSubscript:v6];
    v21 = [(SCMLPerformanceResult *)v13 dict];
    [v20 addObject:v21];
  }
  else if (v7)
  {
    v7[2](v7);
  }
}

- (BOOL)computePerf
{
  return self->_computePerf;
}

- (NSMutableDictionary)results
{
  return self->_results;
}

- (void).cxx_destruct
{
}

@end