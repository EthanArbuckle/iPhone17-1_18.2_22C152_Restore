@interface Ping
+ (BOOL)supportsSecureCoding;
- (BOOL)wasSuccessful;
- (NSDate)endTime;
- (NSDate)startTime;
- (NSDictionary)dictionary;
- (Ping)init;
- (Ping)initWithCoder:(id)a3;
- (double)latency;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setEndTime:(id)a3;
- (void)setStartTime:(id)a3;
- (void)setWasSuccessful:(BOOL)a3;
@end

@implementation Ping

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Ping)init
{
  v7.receiver = self;
  v7.super_class = (Class)Ping;
  v2 = [(Ping *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(Ping *)v2 setWasSuccessful:0];
    id v4 = objc_alloc_init(MEMORY[0x263EFF910]);
    [(Ping *)v3 setStartTime:v4];

    id v5 = objc_alloc_init(MEMORY[0x263EFF910]);
    [(Ping *)v3 setEndTime:v5];
  }
  return v3;
}

- (double)latency
{
  if (![(Ping *)self wasSuccessful]) {
    return 0.0;
  }
  v3 = [(Ping *)self endTime];
  id v4 = [(Ping *)self startTime];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  return v6;
}

- (NSDictionary)dictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = objc_alloc_init(MEMORY[0x263F08790]);
  [v4 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSxxx"];
  double v5 = [(Ping *)self startTime];
  double v6 = [v4 stringFromDate:v5];

  objc_super v7 = [(Ping *)self endTime];
  v8 = [v4 stringFromDate:v7];

  [v3 setValue:v6 forKey:@"start_time"];
  [v3 setValue:v8 forKey:@"end_time"];
  v9 = NSNumber;
  [(Ping *)self latency];
  v10 = objc_msgSend(v9, "numberWithDouble:");
  [v3 setValue:v10 forKey:@"latency"];

  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[Ping wasSuccessful](self, "wasSuccessful"));
  [v3 setValue:v11 forKey:@"was_successful"];

  v12 = [NSDictionary dictionaryWithDictionary:v3];

  return (NSDictionary *)v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[Ping wasSuccessful](self, "wasSuccessful"), @"wasSuccessful");
  double v5 = [(Ping *)self startTime];
  [v4 encodeObject:v5 forKey:@"startTime"];

  id v6 = [(Ping *)self endTime];
  [v4 encodeObject:v6 forKey:@"endTime"];
}

- (Ping)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)Ping;
  id v3 = a3;
  id v4 = [(Ping *)&v8 init];
  -[Ping setWasSuccessful:](v4, "setWasSuccessful:", objc_msgSend(v3, "decodeBoolForKey:", @"wasSuccessful", v8.receiver, v8.super_class));
  double v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"startTime"];
  [(Ping *)v4 setStartTime:v5];

  id v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"endTime"];

  [(Ping *)v4 setEndTime:v6];
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[Ping allocWithZone:a3] init];
  double v5 = [(Ping *)self startTime];
  [(Ping *)v4 setStartTime:v5];

  id v6 = [(Ping *)self endTime];
  [(Ping *)v4 setEndTime:v6];

  [(Ping *)v4 setWasSuccessful:[(Ping *)self wasSuccessful]];
  return v4;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
}

- (BOOL)wasSuccessful
{
  return self->_wasSuccessful;
}

- (void)setWasSuccessful:(BOOL)a3
{
  self->_wasSuccessful = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);

  objc_storeStrong((id *)&self->_startTime, 0);
}

@end