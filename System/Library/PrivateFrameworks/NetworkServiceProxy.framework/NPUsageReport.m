@interface NPUsageReport
+ (BOOL)supportsSecureCoding;
- (NPUsageReport)initWithCoder:(id)a3;
- (NPUsageReport)initWithSigningIdentifier:(id)a3 fallbackReason:(int64_t)a4;
- (NSString)geohash;
- (NSString)signingIdentifier;
- (NSUUID)dayPassUUID;
- (int64_t)fallbackReason;
- (unint64_t)rtt;
- (unsigned)addressFamily;
- (unsigned)edgeIndex;
- (unsigned)keybagGeneration;
- (unsigned)waldoTimestamp;
- (void)encodeWithCoder:(id)a3;
- (void)setAddressFamily:(unsigned __int8)a3;
- (void)setDayPassUUID:(id)a3;
- (void)setEdgeIndex:(unsigned int)a3;
- (void)setGeohash:(id)a3;
- (void)setKeybagGeneration:(unsigned int)a3;
- (void)setRtt:(unint64_t)a3;
- (void)setWaldoTimestamp:(unsigned int)a3;
@end

@implementation NPUsageReport

- (NPUsageReport)initWithSigningIdentifier:(id)a3 fallbackReason:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NPUsageReport;
  v8 = [(NPUsageReport *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_signingIdentifier, a3);
    v9->_fallbackReason = a4;
    v9->_rtt = 0xFFFFFFFFLL;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPUsageReport)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NPUsageReport;
  v5 = [(NPUsageReport *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dpuuid"];
    dayPassUUID = v5->_dayPassUUID;
    v5->_dayPassUUID = (NSUUID *)v6;

    v5->_rtt = [v4 decodeIntegerForKey:@"rtt"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"geo"];
    geohash = v5->_geohash;
    v5->_geohash = (NSString *)v8;

    v5->_fallbackReason = [v4 decodeIntegerForKey:@"fb"];
    v5->_addressFamily = [v4 decodeIntForKey:@"af"];
    v5->_edgeIndex = [v4 decodeInt32ForKey:@"eidx"];
    v5->_keybagGeneration = [v4 decodeInt32ForKey:@"gen"];
    v5->_waldoTimestamp = [v4 decodeInt32ForKey:@"ts"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  dayPassUUID = self->_dayPassUUID;
  id v5 = a3;
  [v5 encodeObject:dayPassUUID forKey:@"dpuuid"];
  [v5 encodeInteger:self->_rtt forKey:@"rtt"];
  [v5 encodeObject:self->_geohash forKey:@"geo"];
  [v5 encodeInteger:self->_fallbackReason forKey:@"fb"];
  [v5 encodeInt:self->_addressFamily forKey:@"af"];
  [v5 encodeInt32:self->_edgeIndex forKey:@"eidx"];
  [v5 encodeInt32:self->_keybagGeneration forKey:@"gen"];
  [v5 encodeInt32:self->_waldoTimestamp forKey:@"ts"];
}

- (NSString)signingIdentifier
{
  return self->_signingIdentifier;
}

- (int64_t)fallbackReason
{
  return self->_fallbackReason;
}

- (NSUUID)dayPassUUID
{
  return self->_dayPassUUID;
}

- (void)setDayPassUUID:(id)a3
{
}

- (unint64_t)rtt
{
  return self->_rtt;
}

- (void)setRtt:(unint64_t)a3
{
  self->_rtt = a3;
}

- (NSString)geohash
{
  return self->_geohash;
}

- (void)setGeohash:(id)a3
{
}

- (unsigned)addressFamily
{
  return self->_addressFamily;
}

- (void)setAddressFamily:(unsigned __int8)a3
{
  self->_addressFamily = a3;
}

- (unsigned)edgeIndex
{
  return self->_edgeIndex;
}

- (void)setEdgeIndex:(unsigned int)a3
{
  self->_edgeIndex = a3;
}

- (unsigned)keybagGeneration
{
  return self->_keybagGeneration;
}

- (void)setKeybagGeneration:(unsigned int)a3
{
  self->_keybagGeneration = a3;
}

- (unsigned)waldoTimestamp
{
  return self->_waldoTimestamp;
}

- (void)setWaldoTimestamp:(unsigned int)a3
{
  self->_waldoTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geohash, 0);
  objc_storeStrong((id *)&self->_dayPassUUID, 0);
  objc_storeStrong((id *)&self->_signingIdentifier, 0);
}

@end