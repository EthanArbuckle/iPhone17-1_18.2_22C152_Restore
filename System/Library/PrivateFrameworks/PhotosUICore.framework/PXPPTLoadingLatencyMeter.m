@interface PXPPTLoadingLatencyMeter
+ (PXPPTLoadingLatencyMeter)sharedInstance;
+ (void)startMeasurementsForOutputType:(id)a3;
+ (void)stopMeasurements;
- ($78FA2DCC9A9B4AE6DCC3A2946DFE0BC9)measurementsForOutputQuality:(SEL)a3;
- (NSDictionary)measurementsDictionaryRepresentation;
- (NSString)measurementsUnit;
- (PXPPTLoadingLatencyMeter)initWithOutputType:(id)a3;
- (id)_measurementsDictionaryForOutputQuality:(int64_t)a3;
- (void)reportLatency:(double)a3 forOutputQuality:(int64_t)a4;
- (void)setMeasurementsUnit:(id)a3;
@end

@implementation PXPPTLoadingLatencyMeter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_measurementsUnit, 0);
  objc_storeStrong((id *)&self->_outputType, 0);
}

- (void)setMeasurementsUnit:(id)a3
{
}

- (NSString)measurementsUnit
{
  return self->_measurementsUnit;
}

- (id)_measurementsDictionaryForOutputQuality:(int64_t)a3
{
  -[PXPPTLoadingLatencyMeter measurementsForOutputQuality:](self, "measurementsForOutputQuality:");
  v3 = (void *)MEMORY[0x1E4F1CC08];
  return v3;
}

- (NSDictionary)measurementsDictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(PXPPTLoadingLatencyMeter *)self _measurementsDictionaryForOutputQuality:0];
  [v3 addEntriesFromDictionary:v4];

  v5 = [(PXPPTLoadingLatencyMeter *)self _measurementsDictionaryForOutputQuality:1];
  [v3 addEntriesFromDictionary:v5];

  v6 = [(PXPPTLoadingLatencyMeter *)self _measurementsDictionaryForOutputQuality:2];
  [v3 addEntriesFromDictionary:v6];

  v7 = (void *)[v3 copy];
  return (NSDictionary *)v7;
}

- ($78FA2DCC9A9B4AE6DCC3A2946DFE0BC9)measurementsForOutputQuality:(SEL)a3
{
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  if ((unint64_t)a4 <= 2)
  {
    v4 = &self[a4];
    long long v5 = *(_OWORD *)&v4->var3;
    *(_OWORD *)&retstr->var0 = *(_OWORD *)&v4->var1;
    *(_OWORD *)&retstr->var2 = v5;
  }
  return self;
}

- (void)reportLatency:(double)a3 forOutputQuality:(int64_t)a4
{
  p_highQualityResults = &self->_highQualityResults;
  p_mediumQualityResults = &self->_mediumQualityResults;
  p_lowQualityResults = &self->_lowQualityResults;
  if (a4) {
    p_lowQualityResults = 0;
  }
  if (a4 != 1) {
    p_mediumQualityResults = p_lowQualityResults;
  }
  if (a4 != 2) {
    p_highQualityResults = p_mediumQualityResults;
  }
  if (p_highQualityResults->minValue > a3) {
    p_highQualityResults->minValue = a3;
  }
  if (p_highQualityResults->maxValue < a3) {
    p_highQualityResults->maxValue = a3;
  }
  ++p_highQualityResults->count;
  p_highQualityResults->totalValue = p_highQualityResults->totalValue + a3;
}

- (PXPPTLoadingLatencyMeter)initWithOutputType:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXPPTLoadingLatencyMeter;
  long long v5 = [(PXPPTLoadingLatencyMeter *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_lowQualityResults.totalValue = 0.0;
    v5->_lowQualityResults.count = 0;
    v5->_highQualityResults.totalValue = 0.0;
    v5->_highQualityResults.count = 0;
    v5->_lowQualityResults.minValue = 3.40282347e38;
    v5->_lowQualityResults.maxValue = 0.0;
    v5->_highQualityResults.minValue = 3.40282347e38;
    v5->_highQualityResults.maxValue = 0.0;
    uint64_t v7 = [v4 capitalizedString];
    outputType = v6->_outputType;
    v6->_outputType = (NSString *)v7;
  }
  return v6;
}

+ (void)stopMeasurements
{
  v2 = (void *)instance;
  instance = 0;
}

+ (void)startMeasurementsForOutputType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [objc_alloc((Class)a1) initWithOutputType:v4];

  v6 = (void *)instance;
  instance = v5;
}

+ (PXPPTLoadingLatencyMeter)sharedInstance
{
  return (PXPPTLoadingLatencyMeter *)(id)instance;
}

@end