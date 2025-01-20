@interface PLNetworkUsageSnapshot
- (NSDate)timestamp;
- (NSString)cellType;
- (NSString)quality;
- (NSString)wifi;
- (PLNetworkUsageSnapshot)initWithInfo:(id)a3;
- (double)computeEnergyDiff:(id)a3;
- (double)computeEnergyDiffUntilNow:(BOOL)a3;
- (id)description;
- (void)setCellType:(id)a3;
- (void)setQuality:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setWifi:(id)a3;
- (void)snapshotNetworkState;
@end

@implementation PLNetworkUsageSnapshot

- (PLNetworkUsageSnapshot)initWithInfo:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLNetworkUsageSnapshot;
  v5 = [(PLNetworkUsageSnapshot *)&v11 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F1C9C8] date];
    [(PLNetworkUsageSnapshot *)v5 setTimestamp:v6];

    v7 = [v4 objectForKeyedSubscript:@"cell"];
    [(PLNetworkUsageSnapshot *)v5 setCellType:v7];

    v8 = [v4 objectForKeyedSubscript:@"quality"];
    [(PLNetworkUsageSnapshot *)v5 setQuality:v8];

    v9 = [v4 objectForKeyedSubscript:@"wifi"];
    [(PLNetworkUsageSnapshot *)v5 setWifi:v9];
  }
  return v5;
}

- (void)snapshotNetworkState
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  [(PLNetworkUsageSnapshot *)self setTimestamp:v3];
}

- (double)computeEnergyDiffUntilNow:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = objc_alloc_init(PLNetworkUsageSnapshot);
  v6 = [MEMORY[0x1E4F1C9C8] date];
  [(PLNetworkUsageSnapshot *)v5 setTimestamp:v6];

  v7 = [(PLNetworkUsageSnapshot *)self cellType];
  [(PLNetworkUsageSnapshot *)v5 setCellType:v7];

  v8 = [(PLNetworkUsageSnapshot *)self quality];
  [(PLNetworkUsageSnapshot *)v5 setQuality:v8];

  v9 = [(PLNetworkUsageSnapshot *)self wifi];
  [(PLNetworkUsageSnapshot *)v5 setWifi:v9];

  [(PLNetworkUsageSnapshot *)v5 computeEnergyDiff:self];
  double v11 = v10;
  if (v3)
  {
    v12 = PLLogDiscretionaryEnergyMonitor();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[PLNetworkUsageSnapshot computeEnergyDiffUntilNow:]();
    }

    [(PLNetworkUsageSnapshot *)self snapshotNetworkState];
    v13 = PLLogDiscretionaryEnergyMonitor();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[PLNetworkUsageSnapshot computeEnergyDiffUntilNow:]();
    }
  }
  return v11;
}

- (double)computeEnergyDiff:(id)a3
{
  id v4 = a3;
  v5 = PLLogDiscretionaryEnergyMonitor();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[PLNetworkUsageSnapshot computeEnergyDiff:]();
  }

  v6 = [(PLNetworkUsageSnapshot *)self timestamp];
  v7 = [v4 timestamp];
  [v6 timeIntervalSinceDate:v7];
  double v9 = v8;

  double v10 = [(PLNetworkUsageSnapshot *)self wifi];

  if (v10)
  {
    double v11 = 15.3333333;
  }
  else
  {
    v12 = [(PLNetworkUsageSnapshot *)self cellType];
    char v13 = [v12 isEqualToString:@"5G"];

    if (v13)
    {
      double v11 = 47.3333333;
    }
    else
    {
      v14 = [(PLNetworkUsageSnapshot *)self cellType];
      char v15 = [v14 isEqualToString:@"LTE"];

      if (v15)
      {
        double v11 = 38.0;
      }
      else
      {
        v16 = [(PLNetworkUsageSnapshot *)self cellType];
        int v17 = [v16 isEqualToString:@"PreLTE"];

        double v11 = 0.0;
        if (v17) {
          double v11 = 30.0;
        }
      }
    }
  }
  double v18 = v9 / 3600.0 * v11;

  return v18;
}

- (id)description
{
  BOOL v3 = NSString;
  id v4 = [(PLNetworkUsageSnapshot *)self timestamp];
  v5 = [(PLNetworkUsageSnapshot *)self cellType];
  v6 = [(PLNetworkUsageSnapshot *)self quality];
  v7 = [(PLNetworkUsageSnapshot *)self wifi];
  double v8 = [v3 stringWithFormat:@"timestamp=%@, cellType=%@, quality=%@, WiFi=%@", v4, v5, v6, v7];

  return v8;
}

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTimestamp:(id)a3
{
}

- (NSString)cellType
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCellType:(id)a3
{
}

- (NSString)quality
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setQuality:(id)a3
{
}

- (NSString)wifi
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setWifi:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifi, 0);
  objc_storeStrong((id *)&self->_quality, 0);
  objc_storeStrong((id *)&self->_cellType, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

- (void)computeEnergyDiffUntilNow:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A11A5000, v0, v1, "after adjusting networkEnergySnapshot=%@", v2, v3, v4, v5, v6);
}

- (void)computeEnergyDiffUntilNow:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A11A5000, v0, v1, "adjusting networkEnergySnapshot=%@ to now", v2, v3, v4, v5, v6);
}

- (void)computeEnergyDiff:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1A11A5000, v0, v1, "computing network energy diff between self=%@ and otherSnapshot=%@");
}

@end