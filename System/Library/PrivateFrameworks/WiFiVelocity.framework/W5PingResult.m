@interface W5PingResult
+ (BOOL)supportsSecureCoding;
- (BOOL)conformsToProtocol:(id)a3;
- (NSString)address;
- (NSString)command;
- (NSString)interfaceName;
- (NSString)output;
- (W5PingResult)initWithCoder:(id)a3;
- (double)avg;
- (double)endedAt;
- (double)interval;
- (double)max;
- (double)min;
- (double)packetLoss;
- (double)startedAt;
- (double)stddev;
- (double)timeout;
- (double)wait;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)count;
- (int64_t)trafficClass;
- (unint64_t)dataLength;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAddress:(id)a3;
- (void)setAvg:(double)a3;
- (void)setCommand:(id)a3;
- (void)setCount:(int64_t)a3;
- (void)setDataLength:(unint64_t)a3;
- (void)setEndedAt:(double)a3;
- (void)setInterfaceName:(id)a3;
- (void)setInterval:(double)a3;
- (void)setMax:(double)a3;
- (void)setMin:(double)a3;
- (void)setOutput:(id)a3;
- (void)setPacketLoss:(double)a3;
- (void)setStartedAt:(double)a3;
- (void)setStddev:(double)a3;
- (void)setTimeout:(double)a3;
- (void)setTrafficClass:(int64_t)a3;
- (void)setWait:(double)a3;
@end

@implementation W5PingResult

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)W5PingResult;
  [(W5PingResult *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = (void *)[MEMORY[0x263F089D8] stringWithCapacity:0];
  [v3 appendFormat:@"Address: %@\n", self->_address];
  [v3 appendFormat:@"Interface Name: %@\n", self->_interfaceName];
  objc_msgSend(v3, "appendFormat:", @"Count: %ld\n", self->_count);
  objc_msgSend(v3, "appendFormat:", @"Timeout: %f\n", *(void *)&self->_timeout);
  objc_msgSend(v3, "appendFormat:", @"Wait: %f\n", *(void *)&self->_wait);
  objc_msgSend(v3, "appendFormat:", @"Interval: %f\n", *(void *)&self->_interval);
  [v3 appendFormat:@"Traffic Class: %@\n", W5DescriptionForPingTrafficClass(self->_trafficClass)];
  objc_msgSend(v3, "appendFormat:", @"Data Length: %ldb\n", self->_dataLength + 64);
  [v3 appendFormat:@"Packet Loss: %.2f%%\n", *(void *)&self->_packetLoss];
  [v3 appendFormat:@"Min: %.2fms\n", *(void *)&self->_min];
  [v3 appendFormat:@"Max: %.2fms\n", *(void *)&self->_max];
  [v3 appendFormat:@"Avg: %.2fms\n", *(void *)&self->_avg];
  [v3 appendFormat:@"Std Dev: %.2fms\n", *(void *)&self->_stddev];
  id v4 = objc_alloc_init(MEMORY[0x263F08790]);
  [v4 setDateStyle:0];
  [v4 setTimeStyle:2];
  objc_msgSend(v4, "setLocale:", objc_msgSend(MEMORY[0x263EFF960], "currentLocale"));
  [v3 appendFormat:@"StartedAt: %@\n", objc_msgSend(v4, "stringFromDate:", objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceReferenceDate:", self->_startedAt))];
  [v3 appendFormat:@"EndedAt: %@\n", objc_msgSend(v4, "stringFromDate:", objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceReferenceDate:", self->_endedAt))];
  v5 = (void *)[v3 copy];
  return v5;
}

- (BOOL)conformsToProtocol:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)W5PingResult;
  if (-[W5PingResult conformsToProtocol:](&v5, sel_conformsToProtocol_)
    || ([a3 isEqual:&unk_26C50B870] & 1) != 0)
  {
    return 1;
  }
  else
  {
    return [a3 isEqual:&unk_26C50B6D8];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[W5PingResult allocWithZone:a3] init];
  [(W5PingResult *)v4 setAddress:self->_address];
  [(W5PingResult *)v4 setInterfaceName:self->_interfaceName];
  [(W5PingResult *)v4 setCount:self->_count];
  [(W5PingResult *)v4 setTimeout:self->_timeout];
  [(W5PingResult *)v4 setWait:self->_wait];
  [(W5PingResult *)v4 setInterval:self->_interval];
  [(W5PingResult *)v4 setPacketLoss:self->_packetLoss];
  [(W5PingResult *)v4 setMin:self->_min];
  [(W5PingResult *)v4 setMax:self->_max];
  [(W5PingResult *)v4 setAvg:self->_avg];
  [(W5PingResult *)v4 setStddev:self->_stddev];
  [(W5PingResult *)v4 setStartedAt:self->_startedAt];
  [(W5PingResult *)v4 setEndedAt:self->_endedAt];
  [(W5PingResult *)v4 setTrafficClass:self->_trafficClass];
  [(W5PingResult *)v4 setDataLength:self->_dataLength];
  [(W5PingResult *)v4 setCommand:self->_command];
  [(W5PingResult *)v4 setOutput:self->_output];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_address forKey:@"_address"];
  [a3 encodeObject:self->_interfaceName forKey:@"_interfaceName"];
  [a3 encodeInteger:self->_count forKey:@"_count"];
  [a3 encodeDouble:@"_timeout" forKey:self->_timeout];
  [a3 encodeDouble:@"_wait" forKey:self->_wait];
  [a3 encodeDouble:@"_interval" forKey:self->_interval];
  [a3 encodeDouble:@"_packetLoss" forKey:self->_packetLoss];
  [a3 encodeDouble:@"_min" forKey:self->_min];
  [a3 encodeDouble:@"_max" forKey:self->_max];
  [a3 encodeDouble:@"_avg" forKey:self->_avg];
  [a3 encodeDouble:@"_stddev" forKey:self->_stddev];
  [a3 encodeDouble:@"_startedAt" forKey:self->_startedAt];
  [a3 encodeDouble:@"_endedAt" forKey:self->_endedAt];
  [a3 encodeInteger:self->_trafficClass forKey:@"_trafficClass"];
  [a3 encodeInteger:self->_dataLength forKey:@"_dataLength"];
  [a3 encodeObject:self->_command forKey:@"_command"];
  output = self->_output;
  [a3 encodeObject:output forKey:@"_output"];
}

- (W5PingResult)initWithCoder:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)W5PingResult;
  id v4 = [(W5PingResult *)&v16 init];
  if (v4)
  {
    v4->_address = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_address"), "copy");
    v4->_interfaceName = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_interfaceName"), "copy");
    v4->_count = [a3 decodeIntegerForKey:@"_count"];
    [a3 decodeDoubleForKey:@"_timeout"];
    v4->_timeout = v5;
    [a3 decodeDoubleForKey:@"_wait"];
    v4->_wait = v6;
    [a3 decodeDoubleForKey:@"_interval"];
    v4->_interval = v7;
    [a3 decodeDoubleForKey:@"_packetLoss"];
    v4->_packetLoss = v8;
    [a3 decodeDoubleForKey:@"_min"];
    v4->_min = v9;
    [a3 decodeDoubleForKey:@"_max"];
    v4->_max = v10;
    [a3 decodeDoubleForKey:@"_avg"];
    v4->_avg = v11;
    [a3 decodeDoubleForKey:@"_stddev"];
    v4->_stddev = v12;
    [a3 decodeDoubleForKey:@"_startedAt"];
    v4->_startedAt = v13;
    [a3 decodeDoubleForKey:@"_endedAt"];
    v4->_endedAt = v14;
    v4->_trafficClass = [a3 decodeIntegerForKey:@"_trafficClass"];
    v4->_dataLength = [a3 decodeIntegerForKey:@"_dataLength"];
    v4->_command = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_command"), "copy");
    v4->_output = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_output"), "copy");
  }
  return v4;
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (double)wait
{
  return self->_wait;
}

- (void)setWait:(double)a3
{
  self->_wait = a3;
}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (int64_t)trafficClass
{
  return self->_trafficClass;
}

- (void)setTrafficClass:(int64_t)a3
{
  self->_trafficClass = a3;
}

- (unint64_t)dataLength
{
  return self->_dataLength;
}

- (void)setDataLength:(unint64_t)a3
{
  self->_dataLength = a3;
}

- (double)packetLoss
{
  return self->_packetLoss;
}

- (void)setPacketLoss:(double)a3
{
  self->_packetLoss = a3;
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

- (double)avg
{
  return self->_avg;
}

- (void)setAvg:(double)a3
{
  self->_avg = a3;
}

- (double)stddev
{
  return self->_stddev;
}

- (void)setStddev:(double)a3
{
  self->_stddev = a3;
}

- (NSString)command
{
  return self->_command;
}

- (void)setCommand:(id)a3
{
}

- (NSString)output
{
  return self->_output;
}

- (void)setOutput:(id)a3
{
}

- (double)startedAt
{
  return self->_startedAt;
}

- (void)setStartedAt:(double)a3
{
  self->_startedAt = a3;
}

- (double)endedAt
{
  return self->_endedAt;
}

- (void)setEndedAt:(double)a3
{
  self->_endedAt = a3;
}

@end