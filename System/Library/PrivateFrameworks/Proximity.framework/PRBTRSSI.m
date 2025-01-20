@interface PRBTRSSI
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (PRBTRSSI)initWithCoder:(id)a3;
- (PRBTRSSI)initWithTimeStamp:(double)a3 rssi_dbm:(int)a4 channel:(int)a5;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)channel;
- (int)rssi_dbm;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRBTRSSI

- (PRBTRSSI)initWithTimeStamp:(double)a3 rssi_dbm:(int)a4 channel:(int)a5
{
  v9.receiver = self;
  v9.super_class = (Class)PRBTRSSI;
  result = [(PRBTRSSI *)&v9 init];
  if (result)
  {
    result->_timestamp = a3;
    result->_rssi_dbm = a4;
    result->_channel = a5;
  }
  return result;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"PRBTRSSI: timestamp: %.6f, rssi_dbm: %4.2d, channel: %d", *(void *)&self->_timestamp, self->_rssi_dbm, self->_channel];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [(PRBTRSSI *)self timestamp];
    double v7 = v6;
    [v5 timestamp];
    if (v7 == v8 && (int v9 = -[PRBTRSSI rssi_dbm](self, "rssi_dbm"), v9 == objc_msgSend(v5, "rssi_dbm")))
    {
      int v10 = [(PRBTRSSI *)self channel];
      BOOL v11 = v10 == [v5 channel];
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRBTRSSI)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"timestamp"];
  double v6 = -[PRBTRSSI initWithTimeStamp:rssi_dbm:channel:](self, "initWithTimeStamp:rssi_dbm:channel:", [v4 decodeIntForKey:@"rssi"], objc_msgSend(v4, "decodeIntForKey:", @"channel"), v5);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeDouble:@"timestamp" forKey:self->_timestamp];
  [v4 encodeInt:self->_rssi_dbm forKey:@"rssi"];
  [v4 encodeInt:self->_channel forKey:@"channel"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [PRBTRSSI alloc];
  double timestamp = self->_timestamp;
  uint64_t rssi_dbm = self->_rssi_dbm;
  uint64_t channel = self->_channel;
  return [(PRBTRSSI *)v4 initWithTimeStamp:rssi_dbm rssi_dbm:channel channel:timestamp];
}

- (double)timestamp
{
  return self->_timestamp;
}

- (int)rssi_dbm
{
  return self->_rssi_dbm;
}

- (int)channel
{
  return self->_channel;
}

@end