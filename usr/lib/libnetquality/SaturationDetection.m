@interface SaturationDetection
- (BOOL)add:(float)a3;
- (SaturationDetection)initWithConfig:(id)a3;
- (SaturationDetection)initWithConfig:(id)a3 withScalingFactor:(float)a4;
- (float)getAverage;
- (float)getSaturation;
@end

@implementation SaturationDetection

- (SaturationDetection)initWithConfig:(id)a3
{
  LODWORD(v3) = 1.0;
  return [(SaturationDetection *)self initWithConfig:a3 withScalingFactor:v3];
}

- (SaturationDetection)initWithConfig:(id)a3 withScalingFactor:(float)a4
{
  id v7 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SaturationDetection;
  v8 = [(SaturationDetection *)&v23 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_config, a3);
    v9->_scalingFactor = a4;
    v10 = [MovingAverage alloc];
    uint64_t v11 = [(NetworkQualityConfiguration *)v9->_config movingAveragePeriod];
    *(float *)&double v12 = v9->_scalingFactor;
    uint64_t v13 = [(MovingAverage *)v10 initWithSize:v11 withScalingFactor:v12];
    movingAvg = v9->_movingAvg;
    v9->_movingAvg = (MovingAverage *)v13;

    v15 = [MovingAverage alloc];
    double v16 = (double)[(NetworkQualityConfiguration *)v9->_config movingAveragePeriod] / 0.2;
    unint64_t v17 = (unint64_t)v16;
    *(float *)&double v16 = v9->_scalingFactor;
    uint64_t v18 = [(MovingAverage *)v15 initWithSize:v17 withScalingFactor:v16];
    instAvg = v9->_instAvg;
    v9->_instAvg = (MovingAverage *)v18;

    v9->_instValues = 0;
    *(void *)&v9->_currentAverage = 0;
    v9->_saturated = 0;
    uint64_t v20 = [MEMORY[0x263EFF910] now];
    start = v9->_start;
    v9->_start = (NSDate *)v20;
  }
  return v9;
}

- (BOOL)add:(float)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  -[MovingAverage add:overflow:](self->_instAvg, "add:overflow:", self->_saturated);
  int64_t v5 = self->_instValues + 1;
  self->_instValues = v5;
  if (0xCCCCCCCCCCCCCCCDLL * v5 + 0x1999999999999999 > 0x3333333333333332)
  {
LABEL_2:
    LOBYTE(v6) = 0;
    return v6;
  }
  float v7 = v4;
  -[MovingAverage add:overflow:](self->_movingAvg, "add:overflow:", 0);
  self->_currentAverage = v8;
  [(MovingAverage *)self->_movingAvg getStdDev];
  if (v9 < 0.0)
  {
    netqual_log_init();
    v10 = (void *)os_log_netqual;
    BOOL v11 = os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT);
    LOBYTE(v6) = 0;
    if (!v11) {
      return v6;
    }
    name = self->name;
    uint64_t v13 = v10;
    uint64_t v14 = [(NSString *)name UTF8String];
    int v35 = 136315906;
    float scalingFactor = self->_scalingFactor;
    v36 = "-[SaturationDetection add:]";
    __int16 v37 = 1024;
    int v38 = 160;
    __int16 v39 = 2080;
    uint64_t v40 = v14;
    __int16 v41 = 2048;
    double v42 = (float)(v7 / scalingFactor);
    _os_log_impl(&dword_2192FE000, v13, OS_LOG_TYPE_DEFAULT, "%s:%u - %s - Not enough samples with instantaneous moving average val %.2f", (uint8_t *)&v35, 0x26u);

    goto LABEL_2;
  }
  float v16 = v9;
  float v17 = v9 / self->_currentAverage;
  float v18 = (float)[(NetworkQualityConfiguration *)self->_config standardDeviationThreshold]
      / 100.0;
  netqual_log_init();
  v19 = (void *)os_log_netqual;
  BOOL v6 = os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT);
  if (v17 >= v18)
  {
    if (!v6) {
      return v6;
    }
    v25 = self->name;
    v26 = v19;
    uint64_t v27 = [(NSString *)v25 UTF8String];
    float v28 = self->_scalingFactor;
    double v29 = (float)(v7 / v28);
    double v30 = (float)(v16 / v28);
    double v31 = (float)((float)(v16 / self->_currentAverage) * 100.0);
    v32 = [MEMORY[0x263EFF910] now];
    [v32 timeIntervalSinceDate:self->_start];
    int v35 = 136316674;
    v36 = "-[SaturationDetection add:]";
    __int16 v37 = 1024;
    int v38 = 173;
    __int16 v39 = 2080;
    uint64_t v40 = v27;
    __int16 v41 = 2048;
    double v42 = v29;
    __int16 v43 = 2048;
    double v44 = v30;
    __int16 v45 = 2048;
    double v46 = v31;
    __int16 v47 = 2048;
    uint64_t v48 = v33;
    _os_log_impl(&dword_2192FE000, v26, OS_LOG_TYPE_DEFAULT, "%s:%u - %s - Didn't yet reach stability with instantaneous val %.2f stddev %.2f (%.2f %%), running for %.2f sec", (uint8_t *)&v35, 0x44u);

    goto LABEL_2;
  }
  if (v6)
  {
    uint64_t v20 = self->name;
    v21 = v19;
    uint64_t v22 = [(NSString *)v20 UTF8String];
    int v35 = 136316162;
    float v23 = self->_scalingFactor;
    movingAvg = self->_movingAvg;
    v36 = "-[SaturationDetection add:]";
    __int16 v37 = 1024;
    int v38 = 165;
    __int16 v39 = 2080;
    uint64_t v40 = v22;
    __int16 v41 = 2048;
    double v42 = (float)(v7 / v23);
    __int16 v43 = 2112;
    double v44 = *(double *)&movingAvg;
    _os_log_impl(&dword_2192FE000, v21, OS_LOG_TYPE_DEFAULT, "%s:%u - %s - Reached stability with last inst. val %.2f at: %@", (uint8_t *)&v35, 0x30u);
  }
  self->_saturationValue = self->_currentAverage;
  LOBYTE(v6) = 1;
  self->_saturated = 1;
  return v6;
}

- (float)getAverage
{
  [(MovingAverage *)self->_instAvg getAvg];
  return result;
}

- (float)getSaturation
{
  return self->_saturationValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->name, 0);
  objc_storeStrong((id *)&self->_start, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_instAvg, 0);

  objc_storeStrong((id *)&self->_movingAvg, 0);
}

@end