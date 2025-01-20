@interface NPTMetadataEvent
- (Class)collectorType;
- (NPTMetadataEvent)initWithType:(Class)a3 eventType:(int)a4 timeStamp:(id)a5 data:(id)a6;
- (NSDate)timeStamp;
- (NSDictionary)asDictionary;
- (NSDictionary)data;
- (double)timeSinceStart;
- (int)eventType;
- (void)setCollectorType:(Class)a3;
- (void)setData:(id)a3;
- (void)setEventType:(int)a3;
- (void)setTimeSinceStart:(double)a3;
- (void)setTimeStamp:(id)a3;
@end

@implementation NPTMetadataEvent

- (NPTMetadataEvent)initWithType:(Class)a3 eventType:(int)a4 timeStamp:(id)a5 data:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = a6;
  id v11 = a5;
  [(NPTMetadataEvent *)self setCollectorType:a3];
  [(NPTMetadataEvent *)self setEventType:v7];
  [(NPTMetadataEvent *)self setTimeStamp:v11];

  [(NPTMetadataEvent *)self setData:v10];
  return self;
}

- (NSDictionary)asDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263F08790]);
  [v3 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSxxx"];
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [(NPTMetadataEvent *)self collectorType];
  if ([(id)objc_opt_class() conformsToProtocol:&unk_26CAD7758])
  {
    [(NPTMetadataEvent *)self collectorType];
    v5 = [(id)objc_opt_class() collectorName];
    [v4 setObject:v5 forKeyedSubscript:@"collector_type"];
  }
  v6 = +[NPTMetadataEventTypeConverter getTypeAsString:[(NPTMetadataEvent *)self eventType]];
  [v4 setObject:v6 forKeyedSubscript:@"event_type"];

  [(NPTMetadataEvent *)self timeSinceStart];
  if (v7 <= 0.0)
  {
    [v4 setObject:0 forKeyedSubscript:@"time_since_start"];
  }
  else
  {
    id v8 = objc_alloc(NSNumber);
    [(NPTMetadataEvent *)self timeSinceStart];
    v9 = objc_msgSend(v8, "initWithDouble:");
    [v4 setObject:v9 forKeyedSubscript:@"time_since_start"];
  }
  id v10 = [(NPTMetadataEvent *)self timeStamp];
  id v11 = [v3 stringFromDate:v10];
  [v4 setObject:v11 forKeyedSubscript:@"time_stamp"];

  v12 = [(NPTMetadataEvent *)self data];
  [v4 setObject:v12 forKeyedSubscript:@"data"];

  v13 = [NSDictionary dictionaryWithDictionary:v4];

  return (NSDictionary *)v13;
}

- (Class)collectorType
{
  return self->_collectorType;
}

- (void)setCollectorType:(Class)a3
{
}

- (int)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int)a3
{
  self->_eventType = a3;
}

- (NSDate)timeStamp
{
  return self->_timeStamp;
}

- (void)setTimeStamp:(id)a3
{
}

- (double)timeSinceStart
{
  return self->_timeSinceStart;
}

- (void)setTimeSinceStart:(double)a3
{
  self->_timeSinceStart = a3;
}

- (NSDictionary)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_timeStamp, 0);

  objc_storeStrong((id *)&self->_collectorType, 0);
}

@end