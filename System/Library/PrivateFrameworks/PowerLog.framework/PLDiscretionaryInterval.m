@interface PLDiscretionaryInterval
- (BOOL)isClosed;
- (BOOL)shouldClose;
- (NSDate)currentStartDate;
- (NSDate)endDate;
- (NSDate)originalStartDate;
- (PLCPUEnergySnapshot)cpuEnergySnapshot;
- (PLDiscretionaryInterval)initWithIdentifier:(id)a3 andInfo:(id)a4 andSnapshottingEnabled:(BOOL)a5 andMockData:(id)a6;
- (PLNetworkUsageSnapshot)networkEnergySnapshot;
- (double)checkOpenIntervalDuration:(id)a3;
- (double)openCount;
- (double)startCount;
- (id)description;
- (void)closeInterval;
- (void)setCpuEnergySnapshot:(id)a3;
- (void)setCurrentStartDate:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setNetworkEnergySnapshot:(id)a3;
- (void)setOpenCount:(double)a3;
- (void)setOriginalStartDate:(id)a3;
- (void)setStartCount:(double)a3;
@end

@implementation PLDiscretionaryInterval

- (PLDiscretionaryInterval)initWithIdentifier:(id)a3 andInfo:(id)a4 andSnapshottingEnabled:(BOOL)a5 andMockData:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PLDiscretionaryInterval;
  v13 = [(PLDiscretionaryInterval *)&v18 init];
  if (v13)
  {
    v14 = [MEMORY[0x1E4F1C9C8] date];
    [(PLDiscretionaryInterval *)v13 setOriginalStartDate:v14];

    v15 = [(PLDiscretionaryInterval *)v13 originalStartDate];
    [(PLDiscretionaryInterval *)v13 setCurrentStartDate:v15];

    [(PLDiscretionaryInterval *)v13 setOpenCount:1.0];
    [(PLDiscretionaryInterval *)v13 setStartCount:1.0];
    if (a5)
    {
      if ([v10 isEqualToString:@"discretionaryNetworkTasks"])
      {
        v16 = [[PLNetworkUsageSnapshot alloc] initWithInfo:v11];
        [(PLDiscretionaryInterval *)v13 setNetworkEnergySnapshot:v16];
      }
      else
      {
        v16 = [[PLCPUEnergySnapshot alloc] initWithIdentifier:v10 andMockData:v12];
        [(PLDiscretionaryInterval *)v13 setCpuEnergySnapshot:v16];
      }
    }
    else
    {
      PLLogDiscretionaryEnergyMonitor();
      v16 = (PLNetworkUsageSnapshot *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v16->super, OS_LOG_TYPE_DEBUG)) {
        -[PLDiscretionaryInterval initWithIdentifier:andInfo:andSnapshottingEnabled:andMockData:]();
      }
    }
  }
  return v13;
}

- (BOOL)shouldClose
{
  [(PLDiscretionaryInterval *)self openCount];
  return v2 < 1.0;
}

- (BOOL)isClosed
{
  double v2 = [(PLDiscretionaryInterval *)self endDate];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)closeInterval
{
  [a1 openCount];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_13(&dword_1A11A5000, v1, v2, "Attempted to close interval with openCount=%f", v3, v4, v5, v6, v7);
}

- (double)checkOpenIntervalDuration:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PLDiscretionaryInterval *)self isClosed])
  {
    uint64_t v5 = PLLogDiscretionaryEnergyMonitor();
    double v6 = 0.0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[PLDiscretionaryInterval checkOpenIntervalDuration:]();
    }
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
    uint8_t v7 = [(PLDiscretionaryInterval *)self originalStartDate];
    [v5 timeIntervalSinceDate:v7];
    double v6 = v8;

    v9 = PLLogDiscretionaryEnergyMonitor();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v12 = [(PLDiscretionaryInterval *)self originalStartDate];
      int v13 = 134218498;
      double v14 = v6;
      __int16 v15 = 2112;
      v16 = (PLDiscretionaryInterval *)v5;
      __int16 v17 = 2112;
      id v18 = v12;
      _os_log_debug_impl(&dword_1A11A5000, v9, OS_LOG_TYPE_DEBUG, "timeSinceIntervalStart=%f, now=%@, intervalStartDate=%@", (uint8_t *)&v13, 0x20u);
    }
    if (v6 > 600.0)
    {
      id v10 = PLLogDiscretionaryEnergyMonitor();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v13 = 134218498;
        double v14 = v6;
        __int16 v15 = 2112;
        v16 = self;
        __int16 v17 = 2112;
        id v18 = v4;
        _os_log_error_impl(&dword_1A11A5000, v10, OS_LOG_TYPE_ERROR, "Interval open for %f seconds, potential unclosed interval=%@ for identifier=%@", (uint8_t *)&v13, 0x20u);
      }
    }
  }

  return v6;
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = [(PLDiscretionaryInterval *)self originalStartDate];
  uint64_t v5 = [(PLDiscretionaryInterval *)self currentStartDate];
  double v6 = [(PLDiscretionaryInterval *)self endDate];
  uint8_t v7 = [(PLDiscretionaryInterval *)self cpuEnergySnapshot];
  double v8 = [(PLDiscretionaryInterval *)self networkEnergySnapshot];
  [(PLDiscretionaryInterval *)self openCount];
  uint64_t v10 = v9;
  [(PLDiscretionaryInterval *)self startCount];
  id v12 = [v3 stringWithFormat:@"originalStartDate=%@, currentStartDate=%@, endDate=%@, cpuEnergySnapshot=%@, networkEnergySnapshot=%@, openCount=%f, startCount=%f", v4, v5, v6, v7, v8, v10, v11];

  return v12;
}

- (NSDate)originalStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setOriginalStartDate:(id)a3
{
}

- (NSDate)currentStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCurrentStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEndDate:(id)a3
{
}

- (PLCPUEnergySnapshot)cpuEnergySnapshot
{
  return (PLCPUEnergySnapshot *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCpuEnergySnapshot:(id)a3
{
}

- (PLNetworkUsageSnapshot)networkEnergySnapshot
{
  return (PLNetworkUsageSnapshot *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNetworkEnergySnapshot:(id)a3
{
}

- (double)startCount
{
  return self->_startCount;
}

- (void)setStartCount:(double)a3
{
  self->_startCount = a3;
}

- (double)openCount
{
  return self->_openCount;
}

- (void)setOpenCount:(double)a3
{
  self->_openCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkEnergySnapshot, 0);
  objc_storeStrong((id *)&self->_cpuEnergySnapshot, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_currentStartDate, 0);
  objc_storeStrong((id *)&self->_originalStartDate, 0);
}

- (void)initWithIdentifier:andInfo:andSnapshottingEnabled:andMockData:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v2 = 1024;
  int v3 = 0;
  _os_log_debug_impl(&dword_1A11A5000, v0, OS_LOG_TYPE_DEBUG, "Initializing discretionary interval without snapshotting for identifier=%@, snapshottingEnabled=%d", v1, 0x12u);
}

- (void)checkOpenIntervalDuration:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_1A11A5000, v0, v1, "Attempting to check open interval duration for a closed interval", v2, v3, v4, v5, v6);
}

@end