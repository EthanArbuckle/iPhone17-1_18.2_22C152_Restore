@interface CRPerformanceMetric
+ (id)metricWithDisplayName:(id)a3 unit:(id)a4 denominator:(double)a5 serializationKey:(id)a6;
+ (id)pcMetricWithDisplayName:(id)a3 pcMetricID:(unint64_t)a4 unit:(id)a5 denominator:(double)a6 serializationKey:(id)a7;
- (CRPerformanceMetric)initWithDictionary:(id)a3 key:(id)a4;
- (CRPerformanceMetric)initWithDisplayName:(id)a3 unit:(id)a4 denominator:(double)a5 serializationKey:(id)a6;
- (NSString)displayName;
- (NSString)serializationKey;
- (NSString)unit;
- (double)M2;
- (double)denominator;
- (double)first;
- (double)max;
- (double)mean;
- (double)min;
- (double)stdDev;
- (double)sumX;
- (double)variance;
- (double)welfordMean;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionary;
- (int64_t)numSamples;
- (unint64_t)pcMetricID;
- (void)addSample:(double)a3;
- (void)mergeMetric:(id)a3;
- (void)setDenominator:(double)a3;
- (void)setDisplayName:(id)a3;
- (void)setFirst:(double)a3;
- (void)setM2:(double)a3;
- (void)setMax:(double)a3;
- (void)setMin:(double)a3;
- (void)setNumSamples:(int64_t)a3;
- (void)setPcMetricID:(unint64_t)a3;
- (void)setSerializationKey:(id)a3;
- (void)setSumX:(double)a3;
- (void)setUnit:(id)a3;
- (void)setWelfordMean:(double)a3;
@end

@implementation CRPerformanceMetric

+ (id)metricWithDisplayName:(id)a3 unit:(id)a4 denominator:(double)a5 serializationKey:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  v12 = [[CRPerformanceMetric alloc] initWithDisplayName:v11 unit:v10 denominator:v9 serializationKey:a5];

  return v12;
}

+ (id)pcMetricWithDisplayName:(id)a3 pcMetricID:(unint64_t)a4 unit:(id)a5 denominator:(double)a6 serializationKey:(id)a7
{
  id v11 = a7;
  id v12 = a5;
  id v13 = a3;
  v14 = [[CRPerformanceMetric alloc] initWithDisplayName:v13 unit:v12 denominator:v11 serializationKey:a6];

  [(CRPerformanceMetric *)v14 setPcMetricID:a4];
  return v14;
}

- (CRPerformanceMetric)initWithDisplayName:(id)a3 unit:(id)a4 denominator:(double)a5 serializationKey:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CRPerformanceMetric;
  v14 = [(CRPerformanceMetric *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_displayName, a3);
    objc_storeStrong((id *)&v15->_unit, a4);
    v15->_denominator = a5;
    objc_storeStrong((id *)&v15->_serializationKey, a6);
    v15->_M2 = 0.0;
    *(_OWORD *)&v15->_pcMetricID = 0u;
    *(_OWORD *)&v15->_min = 0u;
    *(_OWORD *)&v15->_sumX = 0u;
  }

  return v15;
}

- (CRPerformanceMetric)initWithDictionary:(id)a3 key:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 objectForKeyedSubscript:@"CRPerformanceMetricName"];
  id v9 = [v6 objectForKeyedSubscript:@"CRPerformanceMetricUnit"];
  id v10 = [v6 objectForKeyedSubscript:@"CRPerformanceMetricDenominator"];
  [v10 doubleValue];
  double v12 = v11;

  id v13 = [v6 objectForKeyedSubscript:@"CRPerformanceMetricPCMetricID"];
  uint64_t v14 = [v13 longLongValue];

  v15 = [(CRPerformanceMetric *)self initWithDisplayName:v8 unit:v9 denominator:v7 serializationKey:v12];
  if (v15)
  {
    [(CRPerformanceMetric *)v15 setPcMetricID:v14];
    v16 = [v6 objectForKeyedSubscript:@"CRPerformanceMetricNumSamples"];
    -[CRPerformanceMetric setNumSamples:](v15, "setNumSamples:", [v16 integerValue]);

    objc_super v17 = [v6 objectForKeyedSubscript:@"CRPerformanceMetricFirst"];
    [v17 doubleValue];
    -[CRPerformanceMetric setFirst:](v15, "setFirst:");

    v18 = [v6 objectForKeyedSubscript:@"CRPerformanceMetricMin"];
    [v18 doubleValue];
    -[CRPerformanceMetric setMin:](v15, "setMin:");

    v19 = [v6 objectForKeyedSubscript:@"CRPerformanceMetricMax"];
    [v19 doubleValue];
    -[CRPerformanceMetric setMax:](v15, "setMax:");

    v20 = [v6 objectForKeyedSubscript:@"CRPerformanceMetricMean"];
    [v20 doubleValue];
    double v22 = v21;

    v23 = [v6 objectForKeyedSubscript:@"CRPerformanceMetricStdDev"];
    [v23 doubleValue];
    double v25 = v24;

    [(CRPerformanceMetric *)v15 setSumX:v22 * (double)[(CRPerformanceMetric *)v15 numSamples]];
    uint64_t v26 = [(CRPerformanceMetric *)v15 numSamples];
    double v27 = 1.0;
    if (v26 >= 2) {
      double v27 = (double)([(CRPerformanceMetric *)v15 numSamples] - 1);
    }
    [(CRPerformanceMetric *)v15 setM2:v25 * v25 * v27];
  }

  return v15;
}

- (id)dictionary
{
  v21[9] = *MEMORY[0x1E4F143B8];
  v3 = [(CRPerformanceMetric *)self displayName];
  v21[0] = v3;
  v20[1] = @"CRPerformanceMetricNumSamples";
  v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[CRPerformanceMetric numSamples](self, "numSamples"));
  v21[1] = v4;
  v20[2] = @"CRPerformanceMetricFirst";
  v5 = NSNumber;
  [(CRPerformanceMetric *)self first];
  id v6 = objc_msgSend(v5, "numberWithDouble:");
  v21[2] = v6;
  v20[3] = @"CRPerformanceMetricMin";
  id v7 = NSNumber;
  [(CRPerformanceMetric *)self min];
  v8 = objc_msgSend(v7, "numberWithDouble:");
  v21[3] = v8;
  v20[4] = @"CRPerformanceMetricMax";
  id v9 = NSNumber;
  [(CRPerformanceMetric *)self max];
  id v10 = objc_msgSend(v9, "numberWithDouble:");
  v21[4] = v10;
  v20[5] = @"CRPerformanceMetricMean";
  double v11 = NSNumber;
  [(CRPerformanceMetric *)self mean];
  double v12 = objc_msgSend(v11, "numberWithDouble:");
  v21[5] = v12;
  v20[6] = @"CRPerformanceMetricStdDev";
  id v13 = NSNumber;
  [(CRPerformanceMetric *)self stdDev];
  uint64_t v14 = objc_msgSend(v13, "numberWithDouble:");
  v21[6] = v14;
  v20[7] = @"CRPerformanceMetricUnit";
  v15 = [(CRPerformanceMetric *)self unit];
  v21[7] = v15;
  v20[8] = @"CRPerformanceMetricDenominator";
  v16 = NSNumber;
  [(CRPerformanceMetric *)self denominator];
  objc_super v17 = objc_msgSend(v16, "numberWithDouble:");
  v21[8] = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:9];

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CRPerformanceMetric allocWithZone:a3];
  v5 = [(CRPerformanceMetric *)self displayName];
  id v6 = [(CRPerformanceMetric *)self unit];
  [(CRPerformanceMetric *)self denominator];
  double v8 = v7;
  id v9 = [(CRPerformanceMetric *)self serializationKey];
  id v10 = [(CRPerformanceMetric *)v4 initWithDisplayName:v5 unit:v6 denominator:v9 serializationKey:v8];

  [(CRPerformanceMetric *)v10 setNumSamples:[(CRPerformanceMetric *)self numSamples]];
  [(CRPerformanceMetric *)self first];
  -[CRPerformanceMetric setFirst:](v10, "setFirst:");
  [(CRPerformanceMetric *)self min];
  -[CRPerformanceMetric setMin:](v10, "setMin:");
  [(CRPerformanceMetric *)self max];
  -[CRPerformanceMetric setMax:](v10, "setMax:");
  [(CRPerformanceMetric *)self sumX];
  -[CRPerformanceMetric setSumX:](v10, "setSumX:");
  [(CRPerformanceMetric *)v10 setPcMetricID:[(CRPerformanceMetric *)self pcMetricID]];
  [(CRPerformanceMetric *)self M2];
  -[CRPerformanceMetric setM2:](v10, "setM2:");
  return v10;
}

- (void)addSample:(double)a3
{
  [(CRPerformanceMetric *)self setNumSamples:[(CRPerformanceMetric *)self numSamples] + 1];
  [(CRPerformanceMetric *)self sumX];
  [(CRPerformanceMetric *)self setSumX:v5 + a3];
  if ([(CRPerformanceMetric *)self numSamples] == 1)
  {
    [(CRPerformanceMetric *)self setFirst:a3];
    [(CRPerformanceMetric *)self setMin:a3];
    [(CRPerformanceMetric *)self setMax:a3];
    [(CRPerformanceMetric *)self setM2:0.0];
    [(CRPerformanceMetric *)self setWelfordMean:a3];
  }
  else
  {
    [(CRPerformanceMetric *)self min];
    [(CRPerformanceMetric *)self setMin:fmin(v6, a3)];
    [(CRPerformanceMetric *)self max];
    [(CRPerformanceMetric *)self setMax:fmax(v7, a3)];
    [(CRPerformanceMetric *)self welfordMean];
    double v9 = a3 - v8;
    double v10 = (a3 - v8) / (double)[(CRPerformanceMetric *)self numSamples];
    [(CRPerformanceMetric *)self welfordMean];
    [(CRPerformanceMetric *)self setWelfordMean:v11 + v10];
    [(CRPerformanceMetric *)self welfordMean];
    double v13 = a3 - v12;
    [(CRPerformanceMetric *)self M2];
    double v15 = v14 + v9 * v13;
    [(CRPerformanceMetric *)self setM2:v15];
  }
}

- (void)mergeMetric:(id)a3
{
  id v21 = a3;
  if ([v21 numSamples])
  {
    if ([(CRPerformanceMetric *)self numSamples])
    {
      [v21 mean];
      double v5 = v4;
      [(CRPerformanceMetric *)self mean];
      double v7 = v5 - v6;
      [(CRPerformanceMetric *)self M2];
      double v9 = v8;
      [v21 M2];
      -[CRPerformanceMetric setM2:](self, "setM2:", v9+ v10+ v7* v7* (double)-[CRPerformanceMetric numSamples](self, "numSamples")* (double)[v21 numSamples]/ (double)(objc_msgSend(v21, "numSamples") + -[CRPerformanceMetric numSamples](self, "numSamples")));
      [(CRPerformanceMetric *)self min];
      double v12 = v11;
      [v21 min];
      [(CRPerformanceMetric *)self setMin:fmin(v12, v13)];
      [(CRPerformanceMetric *)self max];
      double v15 = v14;
      [v21 max];
      double v17 = fmax(v15, v16);
    }
    else
    {
      [v21 M2];
      -[CRPerformanceMetric setM2:](self, "setM2:");
      [v21 first];
      -[CRPerformanceMetric setFirst:](self, "setFirst:");
      [v21 min];
      -[CRPerformanceMetric setMin:](self, "setMin:");
      [v21 max];
    }
    [(CRPerformanceMetric *)self setMax:v17];
    -[CRPerformanceMetric setNumSamples:](self, "setNumSamples:", -[CRPerformanceMetric numSamples](self, "numSamples") + [v21 numSamples]);
    [v21 sumX];
    double v19 = v18;
    [(CRPerformanceMetric *)self sumX];
    [(CRPerformanceMetric *)self setSumX:v19 + v20];
  }
}

- (double)mean
{
  if (![(CRPerformanceMetric *)self numSamples]) {
    return 0.0;
  }
  [(CRPerformanceMetric *)self sumX];
  return v3 / (double)[(CRPerformanceMetric *)self numSamples];
}

- (double)variance
{
  uint64_t v3 = [(CRPerformanceMetric *)self numSamples];
  double result = 0.0;
  if (v3 >= 2)
  {
    [(CRPerformanceMetric *)self M2];
    return v5 / (double)([(CRPerformanceMetric *)self numSamples] - 1);
  }
  return result;
}

- (double)stdDev
{
  [(CRPerformanceMetric *)self variance];
  return sqrt(v2);
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)unit
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUnit:(id)a3
{
}

- (NSString)serializationKey
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSerializationKey:(id)a3
{
}

- (double)denominator
{
  return self->_denominator;
}

- (void)setDenominator:(double)a3
{
  self->_denominator = a3;
}

- (double)sumX
{
  return self->_sumX;
}

- (void)setSumX:(double)a3
{
  self->_sumX = a3;
}

- (double)first
{
  return self->_first;
}

- (void)setFirst:(double)a3
{
  self->_first = a3;
}

- (double)min
{
  return self->_min;
}

- (void)setMin:(double)a3
{
  self->_min = a3;
}

- (double)max
{
  return self->_max;
}

- (void)setMax:(double)a3
{
  self->_max = a3;
}

- (unint64_t)pcMetricID
{
  return self->_pcMetricID;
}

- (void)setPcMetricID:(unint64_t)a3
{
  self->_pcMetricID = a3;
}

- (int64_t)numSamples
{
  return self->_numSamples;
}

- (void)setNumSamples:(int64_t)a3
{
  self->_numSamples = a3;
}

- (double)M2
{
  return self->_M2;
}

- (void)setM2:(double)a3
{
  self->_M2 = a3;
}

- (double)welfordMean
{
  return self->_welfordMean;
}

- (void)setWelfordMean:(double)a3
{
  self->_welfordMean = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializationKey, 0);
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end