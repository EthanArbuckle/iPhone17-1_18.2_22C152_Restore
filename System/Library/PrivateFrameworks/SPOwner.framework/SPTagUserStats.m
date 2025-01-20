@interface SPTagUserStats
+ (BOOL)supportsSecureCoding;
- (SPTagUserStats)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (unint64_t)multiTime;
- (unint64_t)nearOwnerTime;
- (unint64_t)wildTime;
- (unsigned)crashCount;
- (unsigned)overflowFlag;
- (unsigned)ownerPlaySoundCount;
- (unsigned)ownerPlaySoundTime;
- (unsigned)rangingCount;
- (unsigned)rangingTime;
- (unsigned)version;
- (void)encodeWithCoder:(id)a3;
- (void)setCrashCount:(unsigned __int16)a3;
- (void)setMultiTime:(unint64_t)a3;
- (void)setNearOwnerTime:(unint64_t)a3;
- (void)setOverflowFlag:(unsigned __int8)a3;
- (void)setOwnerPlaySoundCount:(unsigned int)a3;
- (void)setOwnerPlaySoundTime:(unsigned int)a3;
- (void)setRangingCount:(unsigned int)a3;
- (void)setRangingTime:(unsigned int)a3;
- (void)setVersion:(unsigned __int8)a3;
- (void)setWildTime:(unint64_t)a3;
@end

@implementation SPTagUserStats

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  objc_msgSend(v4, "setOverflowFlag:", -[SPTagUserStats overflowFlag](self, "overflowFlag"));
  objc_msgSend(v4, "setCrashCount:", -[SPTagUserStats crashCount](self, "crashCount"));
  objc_msgSend(v4, "setMultiTime:", -[SPTagUserStats multiTime](self, "multiTime"));
  objc_msgSend(v4, "setNearOwnerTime:", -[SPTagUserStats nearOwnerTime](self, "nearOwnerTime"));
  objc_msgSend(v4, "setWildTime:", -[SPTagUserStats wildTime](self, "wildTime"));
  objc_msgSend(v4, "setOwnerPlaySoundCount:", -[SPTagUserStats ownerPlaySoundCount](self, "ownerPlaySoundCount"));
  objc_msgSend(v4, "setOwnerPlaySoundTime:", -[SPTagUserStats ownerPlaySoundTime](self, "ownerPlaySoundTime"));
  objc_msgSend(v4, "setRangingCount:", -[SPTagUserStats rangingCount](self, "rangingCount"));
  objc_msgSend(v4, "setRangingTime:", -[SPTagUserStats rangingTime](self, "rangingTime"));
  objc_msgSend(v4, "setVersion:", -[SPTagUserStats version](self, "version"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t overflowFlag = self->_overflowFlag;
  id v5 = a3;
  [v5 encodeInteger:overflowFlag forKey:@"overflowFlag"];
  [v5 encodeInteger:self->_crashCount forKey:@"crashCount"];
  [v5 encodeInt64:self->_multiTime forKey:@"multiTime"];
  [v5 encodeInt64:self->_nearOwnerTime forKey:@"nearOwnerTime"];
  [v5 encodeInt64:self->_wildTime forKey:@"wildTime"];
  [v5 encodeInteger:self->_ownerPlaySoundCount forKey:@"ownerPlaySoundCount"];
  [v5 encodeInteger:self->_ownerPlaySoundTime forKey:@"ownerPlaySoundTime"];
  [v5 encodeInteger:self->_rangingCount forKey:@"rangingCount"];
  [v5 encodeInteger:self->_rangingTime forKey:@"rangingTime"];
  [v5 encodeInteger:self->_version forKey:@"version"];
}

- (SPTagUserStats)initWithCoder:(id)a3
{
  id v4 = a3;
  self->_uint64_t overflowFlag = [v4 decodeIntegerForKey:@"overflowFlag"];
  self->_crashCount = [v4 decodeIntegerForKey:@"crashCount"];
  self->_multiTime = [v4 decodeIntegerForKey:@"multiTime"];
  self->_nearOwnerTime = [v4 decodeIntegerForKey:@"nearOwnerTime"];
  self->_wildTime = [v4 decodeIntegerForKey:@"wildTime"];
  self->_ownerPlaySoundCount = [v4 decodeIntegerForKey:@"ownerPlaySoundCount"];
  self->_ownerPlaySoundTime = [v4 decodeIntegerForKey:@"ownerPlaySoundTime"];
  self->_rangingCount = [v4 decodeIntegerForKey:@"rangingCount"];
  self->_rangingTime = [v4 decodeIntegerForKey:@"rangingTime"];
  unsigned __int8 v5 = [v4 decodeIntegerForKey:@"version"];

  self->_version = v5;
  return self;
}

- (id)debugDescription
{
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"Overflow Flag: %d\n", -[SPTagUserStats overflowFlag](self, "overflowFlag"));
  id v4 = [&stru_1F0B18CC8 stringByAppendingString:v3];

  unsigned __int8 v5 = objc_msgSend(NSString, "stringWithFormat:", @"Crash Count: %d\n", -[SPTagUserStats crashCount](self, "crashCount"));
  v6 = [v4 stringByAppendingString:v5];

  v7 = objc_msgSend(NSString, "stringWithFormat:", @"Multi Time: %llu\n", -[SPTagUserStats multiTime](self, "multiTime"));
  v8 = [v6 stringByAppendingString:v7];

  v9 = objc_msgSend(NSString, "stringWithFormat:", @"Near Owner Time: %llu\n", -[SPTagUserStats nearOwnerTime](self, "nearOwnerTime"));
  v10 = [v8 stringByAppendingString:v9];

  v11 = objc_msgSend(NSString, "stringWithFormat:", @"Wild Time: %llu\n", -[SPTagUserStats wildTime](self, "wildTime"));
  v12 = [v10 stringByAppendingString:v11];

  v13 = objc_msgSend(NSString, "stringWithFormat:", @"Owner Play Sound Count: %u\n", -[SPTagUserStats ownerPlaySoundCount](self, "ownerPlaySoundCount"));
  v14 = [v12 stringByAppendingString:v13];

  v15 = objc_msgSend(NSString, "stringWithFormat:", @"Owner Play Sound Time: %u\n", -[SPTagUserStats ownerPlaySoundTime](self, "ownerPlaySoundTime"));
  v16 = [v14 stringByAppendingString:v15];

  v17 = objc_msgSend(NSString, "stringWithFormat:", @"Ranging Count: %u\n", -[SPTagUserStats rangingCount](self, "rangingCount"));
  v18 = [v16 stringByAppendingString:v17];

  v19 = objc_msgSend(NSString, "stringWithFormat:", @"Ranging Time: %u\n", -[SPTagUserStats rangingTime](self, "rangingTime"));
  v20 = [v18 stringByAppendingString:v19];

  v21 = objc_msgSend(NSString, "stringWithFormat:", @"Version: %d\n", -[SPTagUserStats version](self, "version"));
  v22 = [v20 stringByAppendingString:v21];

  return v22;
}

- (unsigned)overflowFlag
{
  return self->_overflowFlag;
}

- (void)setOverflowFlag:(unsigned __int8)a3
{
  self->_uint64_t overflowFlag = a3;
}

- (unsigned)crashCount
{
  return self->_crashCount;
}

- (void)setCrashCount:(unsigned __int16)a3
{
  self->_crashCount = a3;
}

- (unint64_t)multiTime
{
  return self->_multiTime;
}

- (void)setMultiTime:(unint64_t)a3
{
  self->_multiTime = a3;
}

- (unint64_t)nearOwnerTime
{
  return self->_nearOwnerTime;
}

- (void)setNearOwnerTime:(unint64_t)a3
{
  self->_nearOwnerTime = a3;
}

- (unint64_t)wildTime
{
  return self->_wildTime;
}

- (void)setWildTime:(unint64_t)a3
{
  self->_wildTime = a3;
}

- (unsigned)ownerPlaySoundCount
{
  return self->_ownerPlaySoundCount;
}

- (void)setOwnerPlaySoundCount:(unsigned int)a3
{
  self->_ownerPlaySoundCount = a3;
}

- (unsigned)ownerPlaySoundTime
{
  return self->_ownerPlaySoundTime;
}

- (void)setOwnerPlaySoundTime:(unsigned int)a3
{
  self->_ownerPlaySoundTime = a3;
}

- (unsigned)rangingCount
{
  return self->_rangingCount;
}

- (void)setRangingCount:(unsigned int)a3
{
  self->_rangingCount = a3;
}

- (unsigned)rangingTime
{
  return self->_rangingTime;
}

- (void)setRangingTime:(unsigned int)a3
{
  self->_rangingTime = a3;
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned __int8)a3
{
  self->_version = a3;
}

@end