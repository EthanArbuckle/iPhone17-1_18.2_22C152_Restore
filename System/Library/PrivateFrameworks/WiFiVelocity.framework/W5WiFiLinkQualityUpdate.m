@interface W5WiFiLinkQualityUpdate
+ (BOOL)supportsSecureCoding;
- (BOOL)conformsToProtocol:(id)a3;
- (W5WiFiLinkQualityUpdate)initWithCoder:(id)a3;
- (double)timestamp;
- (float)cca;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)rssi;
- (int64_t)txRate;
- (void)encodeWithCoder:(id)a3;
- (void)setCca:(float)a3;
- (void)setRssi:(int64_t)a3;
- (void)setTimestamp:(double)a3;
- (void)setTxRate:(int64_t)a3;
@end

@implementation W5WiFiLinkQualityUpdate

- (BOOL)conformsToProtocol:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)W5WiFiLinkQualityUpdate;
  if (-[W5WiFiLinkQualityUpdate conformsToProtocol:](&v5, sel_conformsToProtocol_)
    || ([a3 isEqual:&unk_26C50B870] & 1) != 0)
  {
    return 1;
  }
  else
  {
    return [a3 isEqual:&unk_26C50B6D8];
  }
}

- (id)description
{
  v3 = (void *)[MEMORY[0x263F089D8] stringWithCapacity:0];
  objc_msgSend(v3, "appendFormat:", @"RSSI: %ld dBm\n", self->_rssi);
  objc_msgSend(v3, "appendFormat:", @"txRate: %ld Mbps\n", self->_txRate);
  objc_msgSend(v3, "appendFormat:", @"CCA: %f%%\n", self->_cca);
  objc_msgSend(v3, "appendFormat:", @"Timestamp: %f\n", *(void *)&self->_timestamp);
  v4 = (void *)[v3 copy];
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[W5WiFiLinkQualityUpdate allocWithZone:a3] init];
  [(W5WiFiLinkQualityUpdate *)v4 setRssi:self->_rssi];
  [(W5WiFiLinkQualityUpdate *)v4 setTxRate:self->_txRate];
  *(float *)&double v5 = self->_cca;
  [(W5WiFiLinkQualityUpdate *)v4 setCca:v5];
  [(W5WiFiLinkQualityUpdate *)v4 setTimestamp:self->_timestamp];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInteger:self->_rssi forKey:@"_rssi"];
  [a3 encodeInteger:self->_txRate forKey:@"_txRate"];
  *(float *)&double v5 = self->_cca;
  [a3 encodeFloat:@"_cca" forKey:v5];
  double timestamp = self->_timestamp;
  [a3 encodeDouble:@"_timestamp" forKey:timestamp];
}

- (W5WiFiLinkQualityUpdate)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)W5WiFiLinkQualityUpdate;
  v4 = [(W5WiFiLinkQualityUpdate *)&v8 init];
  if (v4)
  {
    v4->_rssi = [a3 decodeIntegerForKey:@"_rssi"];
    v4->_txRate = [a3 decodeIntegerForKey:@"_txRate"];
    [a3 decodeFloatForKey:@"_cca"];
    v4->_cca = v5;
    [a3 decodeDoubleForKey:@"_timestamp"];
    v4->_double timestamp = v6;
  }
  return v4;
}

- (int64_t)rssi
{
  return self->_rssi;
}

- (void)setRssi:(int64_t)a3
{
  self->_rssi = a3;
}

- (int64_t)txRate
{
  return self->_txRate;
}

- (void)setTxRate:(int64_t)a3
{
  self->_txRate = a3;
}

- (float)cca
{
  return self->_cca;
}

- (void)setCca:(float)a3
{
  self->_cca = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_double timestamp = a3;
}

@end