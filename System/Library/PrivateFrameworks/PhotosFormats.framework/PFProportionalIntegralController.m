@interface PFProportionalIntegralController
- (BOOL)outputReady;
- (NSMutableArray)statistics;
- (PFProportionalIntegralController)initWithSetPoint:(int64_t)a3;
- (double)integralGain;
- (double)proportionalGain;
- (id)statisticsDescription;
- (int64_t)integralError;
- (int64_t)integralErrorMax;
- (int64_t)integralErrorMin;
- (int64_t)output;
- (int64_t)outputMax;
- (int64_t)outputMin;
- (int64_t)setPoint;
- (void)addStatisticsSampleForTimestamp:(double)a3 error:(int64_t)a4 feedback:(int64_t)a5;
- (void)enumerateStatisticsMeasurementsWithHandler:(id)a3;
- (void)setIntegralError:(int64_t)a3;
- (void)setIntegralErrorMax:(int64_t)a3;
- (void)setIntegralErrorMin:(int64_t)a3;
- (void)setIntegralGain:(double)a3;
- (void)setOutput:(int64_t)a3;
- (void)setOutputMax:(int64_t)a3;
- (void)setOutputMin:(int64_t)a3;
- (void)setOutputReady:(BOOL)a3;
- (void)setProportionalGain:(double)a3;
- (void)setSetPoint:(int64_t)a3;
- (void)setStatistics:(id)a3;
- (void)updateWithTimestamp:(double)a3 error:(int64_t)a4 feedback:(int64_t)a5;
@end

@implementation PFProportionalIntegralController

- (void).cxx_destruct
{
}

- (void)setOutputReady:(BOOL)a3
{
  self->_outputReady = a3;
}

- (BOOL)outputReady
{
  return self->_outputReady;
}

- (void)setStatistics:(id)a3
{
}

- (NSMutableArray)statistics
{
  return (NSMutableArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setOutputMax:(int64_t)a3
{
  self->_outputMax = a3;
}

- (int64_t)outputMax
{
  return self->_outputMax;
}

- (void)setOutputMin:(int64_t)a3
{
  self->_outputMin = a3;
}

- (int64_t)outputMin
{
  return self->_outputMin;
}

- (void)setOutput:(int64_t)a3
{
  self->_output = a3;
}

- (int64_t)output
{
  return self->_output;
}

- (void)setIntegralGain:(double)a3
{
  self->_integralGain = a3;
}

- (double)integralGain
{
  return self->_integralGain;
}

- (void)setProportionalGain:(double)a3
{
  self->_proportionalGain = a3;
}

- (double)proportionalGain
{
  return self->_proportionalGain;
}

- (void)setIntegralErrorMax:(int64_t)a3
{
  self->_integralErrorMax = a3;
}

- (int64_t)integralErrorMax
{
  return self->_integralErrorMax;
}

- (void)setIntegralErrorMin:(int64_t)a3
{
  self->_integralErrorMin = a3;
}

- (int64_t)integralErrorMin
{
  return self->_integralErrorMin;
}

- (void)setIntegralError:(int64_t)a3
{
  self->_integralError = a3;
}

- (int64_t)integralError
{
  return self->_integralError;
}

- (void)setSetPoint:(int64_t)a3
{
  self->_setPoint = a3;
}

- (int64_t)setPoint
{
  return self->_setPoint;
}

- (id)statisticsDescription
{
  v3 = [MEMORY[0x1E4F28E78] string];
  [v3 appendString:@"timestamp\toutput\tfeedback\terror\tintegralError\tsetPoint\n"];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__PFProportionalIntegralController_statisticsDescription__block_invoke;
  v6[3] = &unk_1E5B2EFD0;
  id v4 = v3;
  id v7 = v4;
  [(PFProportionalIntegralController *)self enumerateStatisticsMeasurementsWithHandler:v6];

  return v4;
}

uint64_t __57__PFProportionalIntegralController_statisticsDescription__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, double a7)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"%f\t%ld\t%ld\t%ld\t%ld\t%ld\n", *(void *)&a7, a2, a3, a4, a5, a6);
}

- (void)enumerateStatisticsMeasurementsWithHandler:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unsigned char *, double))a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obj = self->_statistics;
  uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v23 = *(void *)v26;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v26 != v23) {
        objc_enumerationMutation(obj);
      }
      v8 = *(void **)(*((void *)&v25 + 1) + 8 * v7);
      v9 = [v8 objectAtIndexedSubscript:0];
      [v9 doubleValue];
      double v11 = v10;

      v12 = [v8 objectAtIndexedSubscript:1];
      uint64_t v13 = [v12 integerValue];

      v14 = [v8 objectAtIndexedSubscript:2];
      uint64_t v15 = [v14 integerValue];

      v16 = [v8 objectAtIndexedSubscript:3];
      uint64_t v17 = [v16 integerValue];

      v18 = [v8 objectAtIndexedSubscript:4];
      uint64_t v19 = [v18 integerValue];

      v20 = [v8 objectAtIndexedSubscript:5];
      uint64_t v21 = [v20 integerValue];

      char v24 = 0;
      v4[2](v4, v13, v15, v17, v19, v21, &v24, v11);
      if (v24) {
        break;
      }
      if (v6 == ++v7)
      {
        uint64_t v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)addStatisticsSampleForTimestamp:(double)a3 error:(int64_t)a4 feedback:(int64_t)a5
{
  v16[6] = *MEMORY[0x1E4F143B8];
  if (a5)
  {
    statistics = self->_statistics;
    v9 = [NSNumber numberWithDouble:a3];
    v16[0] = v9;
    double v10 = [NSNumber numberWithInteger:self->_output];
    v16[1] = v10;
    double v11 = [NSNumber numberWithInteger:a5];
    v16[2] = v11;
    v12 = [NSNumber numberWithInteger:a4];
    v16[3] = v12;
    uint64_t v13 = [NSNumber numberWithInteger:self->_integralError];
    v16[4] = v13;
    v14 = [NSNumber numberWithInteger:self->_setPoint];
    v16[5] = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:6];
    [(NSMutableArray *)statistics addObject:v15];
  }
}

- (void)updateWithTimestamp:(double)a3 error:(int64_t)a4 feedback:(int64_t)a5
{
  if (a3 != 0.0 && a5 != 0)
  {
    if (!self->_outputReady) {
      self->_outputReady = 1;
    }
    uint64_t v6 = (uint64_t)(self->_proportionalGain * (double)a4);
    int64_t v7 = self->_integralError + a4;
    self->_integralError = v7;
    int64_t integralErrorMax = self->_integralErrorMax;
    if (v7 > integralErrorMax || (int64_t integralErrorMax = self->_integralErrorMin, v7 < integralErrorMax))
    {
      self->_integralError = integralErrorMax;
      int64_t v7 = integralErrorMax;
    }
    int64_t v9 = self->_output - v6 - (uint64_t)(self->_integralGain * (double)v7);
    self->_output = v9;
    int64_t outputMax = self->_outputMax;
    if (outputMax)
    {
      if (outputMax < v9) {
        int64_t v9 = self->_outputMax;
      }
      self->_output = v9;
    }
    int64_t outputMin = self->_outputMin;
    if (outputMin)
    {
      if (outputMin > v9) {
        int64_t v9 = self->_outputMin;
      }
      self->_output = v9;
    }
    -[PFProportionalIntegralController addStatisticsSampleForTimestamp:error:feedback:](self, "addStatisticsSampleForTimestamp:error:feedback:");
  }
}

- (PFProportionalIntegralController)initWithSetPoint:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PFProportionalIntegralController;
  id v4 = [(PFProportionalIntegralController *)&v9 init];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_setPoint = a3;
    v4->_output = a3;
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    statistics = v5->_statistics;
    v5->_statistics = (NSMutableArray *)v6;
  }
  return v5;
}

@end