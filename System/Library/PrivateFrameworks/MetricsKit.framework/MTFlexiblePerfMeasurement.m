@interface MTFlexiblePerfMeasurement
- (MTFlexiblePerfMeasurement)initWithMeasurementTransformer:(id)a3 eventType:(id)a4 eventData:(id)a5;
- (NSString)eventType;
- (void)mark:(id)a3;
- (void)mark:(id)a3 date:(id)a4;
- (void)mark:(id)a3 time:(int64_t)a4;
- (void)setEventType:(id)a3;
- (void)setXpSamplingForced:(BOOL)a3;
- (void)setXpSamplingPercentage:(double)a3;
@end

@implementation MTFlexiblePerfMeasurement

- (void)mark:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF910];
  id v5 = a3;
  -[MTFlexiblePerfMeasurement mark:time:](self, "mark:time:", v5, objc_msgSend(v4, "mt_longMillisecondsSince1970"));
}

- (void)mark:(id)a3 time:(int64_t)a4
{
  v6 = NSNumber;
  id v7 = a3;
  id v9 = [v6 numberWithLongLong:a4];
  v8 = [(MTPerfBaseMeasurement *)self timestamps];
  [v8 setObject:v9 forKeyedSubscript:v7];
}

- (MTFlexiblePerfMeasurement)initWithMeasurementTransformer:(id)a3 eventType:(id)a4 eventData:(id)a5
{
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MTFlexiblePerfMeasurement;
  id v9 = [(MTPerfBaseMeasurement *)&v13 initWithMeasurementTransformer:a3 eventData:a5];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    eventType = v9->_eventType;
    v9->_eventType = (NSString *)v10;
  }
  return v9;
}

- (void).cxx_destruct
{
}

- (void)setXpSamplingForced:(BOOL)a3
{
  id v5 = [NSNumber numberWithBool:a3];
  v4 = [(MTPerfBaseMeasurement *)self measurementSpecificData];
  [v4 setObject:v5 forKeyedSubscript:@"xpSamplingForced"];
}

- (void)setXpSamplingPercentage:(double)a3
{
  id v5 = [NSNumber numberWithDouble:a3];
  v4 = [(MTPerfBaseMeasurement *)self measurementSpecificData];
  [v4 setObject:v5 forKeyedSubscript:@"xpSamplingPercentage"];
}

- (NSString)eventType
{
  return self->_eventType;
}

- (void)setEventType:(id)a3
{
}

- (void)mark:(id)a3 date:(id)a4
{
  id v6 = a3;
  -[MTFlexiblePerfMeasurement mark:time:](self, "mark:time:", v6, objc_msgSend(a4, "mt_longMillisecondsSince1970"));
}

@end