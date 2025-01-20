@interface SPOfflineAdvertisingConfiguration
+ (BOOL)supportsSecureCoding;
- (SPOfflineAdvertisingConfiguration)initWithCoder:(id)a3;
- (SPOfflineAdvertisingConfiguration)initWithDictionaryRepresentation:(id)a3;
- (SPOfflineAdvertisingConfiguration)initWithShortIntervalCount:(int64_t)a3 longIntervalCount:(int64_t)a4;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)longIntervalCount;
- (int64_t)shortIntervalCount;
- (void)encodeWithCoder:(id)a3;
- (void)setLongIntervalCount:(int64_t)a3;
- (void)setShortIntervalCount:(int64_t)a3;
@end

@implementation SPOfflineAdvertisingConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPOfflineAdvertisingConfiguration)initWithShortIntervalCount:(int64_t)a3 longIntervalCount:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SPOfflineAdvertisingConfiguration;
  result = [(SPOfflineAdvertisingConfiguration *)&v7 init];
  if (result)
  {
    result->_shortIntervalCount = a3;
    result->_longIntervalCount = a4;
  }
  return result;
}

- (SPOfflineAdvertisingConfiguration)initWithDictionaryRepresentation:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SPOfflineAdvertisingConfiguration;
  id v3 = a3;
  v4 = [(SPOfflineAdvertisingConfiguration *)&v10 init];
  v5 = objc_msgSend(v3, "objectForKeyedSubscript:", @"s", v10.receiver, v10.super_class);
  uint64_t v6 = [v5 integerValue];

  objc_super v7 = [v3 objectForKeyedSubscript:@"l"];

  uint64_t v8 = [v7 integerValue];
  if (v4)
  {
    v4->_shortIntervalCount = v6;
    v4->_longIntervalCount = v8;
  }
  return v4;
}

- (id)dictionaryRepresentation
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"s";
  id v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[SPOfflineAdvertisingConfiguration shortIntervalCount](self, "shortIntervalCount"));
  v7[1] = @"l";
  v8[0] = v3;
  v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[SPOfflineAdvertisingConfiguration longIntervalCount](self, "longIntervalCount"));
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t shortIntervalCount = self->_shortIntervalCount;
  id v5 = a3;
  [v5 encodeInteger:shortIntervalCount forKey:@"s"];
  [v5 encodeInteger:self->_longIntervalCount forKey:@"l"];
}

- (SPOfflineAdvertisingConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  self->_int64_t shortIntervalCount = [v4 decodeIntegerForKey:@"s"];
  int64_t v5 = [v4 decodeIntegerForKey:@"l"];

  self->_longIntervalCount = v5;
  return self;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"[short: %lu, long: %lu]", -[SPOfflineAdvertisingConfiguration shortIntervalCount](self, "shortIntervalCount"), -[SPOfflineAdvertisingConfiguration longIntervalCount](self, "longIntervalCount")];
}

- (int64_t)shortIntervalCount
{
  return self->_shortIntervalCount;
}

- (void)setShortIntervalCount:(int64_t)a3
{
  self->_int64_t shortIntervalCount = a3;
}

- (int64_t)longIntervalCount
{
  return self->_longIntervalCount;
}

- (void)setLongIntervalCount:(int64_t)a3
{
  self->_longIntervalCount = a3;
}

@end