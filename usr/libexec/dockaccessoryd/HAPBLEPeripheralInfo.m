@interface HAPBLEPeripheralInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HAPBLEPeripheralInfo)initWithCoder:(id)a3;
- (HAPBLEPeripheralInfo)initWithPeripheralInfo:(id)a3 advertisedProtocolVersion:(unint64_t)a4 previousProtocolVersion:(int64_t)a5 resumeSessionId:(unint64_t)a6 lastSeen:(double)a7 statusFlags:(id)a8 stateNumber:(id)a9 configNumber:(id)a10 categoryIdentifier:(id)a11 accessoryName:(id)a12;
- (NSData)broadcastKey;
- (NSNumber)categoryIdentifier;
- (NSNumber)configNumber;
- (NSNumber)keyUpdatedStateNumber;
- (NSNumber)stateNumber;
- (NSNumber)statusFlags;
- (NSString)accessoryName;
- (NSUUID)peripheralUUID;
- (double)keyUpdatedTime;
- (double)lastSeen;
- (id)description;
- (unint64_t)advertisedProtocolVersion;
- (unint64_t)hash;
- (unint64_t)previousProtocolVersion;
- (unint64_t)resumeSessionId;
- (void)encodeWithCoder:(id)a3;
- (void)resetBroadcastKeyConfig;
- (void)saveBroadcastKey:(id)a3 keyUpdatedStateNumber:(id)a4 updatedTime:(double)a5;
- (void)setAccessoryName:(id)a3;
- (void)setAdvertisedProtocolVersion:(unint64_t)a3;
- (void)setBroadcastKey:(id)a3;
- (void)setKeyUpdatedStateNumber:(id)a3;
- (void)setKeyUpdatedTime:(double)a3;
- (void)setPreviousProtocolVersion:(unint64_t)a3;
- (void)setResumeSessionId:(unint64_t)a3;
- (void)setStateNumber:(id)a3;
- (void)updateAccessoryName:(id)a3;
- (void)updateBroadcastKey:(id)a3;
- (void)updateProtocolVersion:(unint64_t)a3;
- (void)updateResumeSessionId:(unint64_t)a3;
@end

@implementation HAPBLEPeripheralInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HAPBLEPeripheralInfo)initWithPeripheralInfo:(id)a3 advertisedProtocolVersion:(unint64_t)a4 previousProtocolVersion:(int64_t)a5 resumeSessionId:(unint64_t)a6 lastSeen:(double)a7 statusFlags:(id)a8 stateNumber:(id)a9 configNumber:(id)a10 categoryIdentifier:(id)a11 accessoryName:(id)a12
{
  id v28 = a3;
  id v27 = a8;
  id v26 = a9;
  id v25 = a10;
  id v18 = a11;
  id v19 = a12;
  v29.receiver = self;
  v29.super_class = (Class)HAPBLEPeripheralInfo;
  v20 = [(HAPBLEPeripheralInfo *)&v29 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_peripheralUUID, a3);
    v21->_advertisedProtocolVersion = a4;
    v21->_previousProtocolVersion = a5;
    v21->_resumeSessionId = a6;
    v21->_lastSeen = a7;
    objc_storeStrong((id *)&v21->_statusFlags, a8);
    objc_storeStrong((id *)&v21->_stateNumber, a9);
    objc_storeStrong((id *)&v21->_configNumber, a10);
    objc_storeStrong((id *)&v21->_categoryIdentifier, a11);
    objc_storeStrong((id *)&v21->_accessoryName, a12);
  }

  return v21;
}

- (void)updateProtocolVersion:(unint64_t)a3
{
  if ([(HAPBLEPeripheralInfo *)self advertisedProtocolVersion] != a3)
  {
    [(HAPBLEPeripheralInfo *)self setPreviousProtocolVersion:[(HAPBLEPeripheralInfo *)self advertisedProtocolVersion]];
    [(HAPBLEPeripheralInfo *)self setAdvertisedProtocolVersion:a3];
  }
}

- (void)updateResumeSessionId:(unint64_t)a3
{
}

- (void)saveBroadcastKey:(id)a3 keyUpdatedStateNumber:(id)a4 updatedTime:(double)a5
{
  id v11 = a3;
  id v8 = a4;
  v9 = [(HAPBLEPeripheralInfo *)self broadcastKey];
  unsigned __int8 v10 = [v11 isEqualToData:v9];

  if ((v10 & 1) == 0)
  {
    [(HAPBLEPeripheralInfo *)self setBroadcastKey:v11];
    if (a5 > 0.0) {
      [(HAPBLEPeripheralInfo *)self setKeyUpdatedTime:a5];
    }
    [(HAPBLEPeripheralInfo *)self setKeyUpdatedStateNumber:v8];
  }
}

- (void)updateBroadcastKey:(id)a3
{
  id v6 = a3;
  v4 = [(HAPBLEPeripheralInfo *)self broadcastKey];
  unsigned __int8 v5 = [v6 isEqualToData:v4];

  if ((v5 & 1) == 0)
  {
    [(HAPBLEPeripheralInfo *)self setBroadcastKey:v6];
    [(HAPBLEPeripheralInfo *)self setKeyUpdatedTime:CFAbsoluteTimeGetCurrent()];
  }
}

- (void)updateAccessoryName:(id)a3
{
  id v7 = a3;
  id v4 = [v7 length];
  unsigned __int8 v5 = [(HAPBLEPeripheralInfo *)self accessoryName];
  id v6 = [v5 length];

  if (v4 > v6) {
    [(HAPBLEPeripheralInfo *)self setAccessoryName:v7];
  }
}

- (void)resetBroadcastKeyConfig
{
  [(HAPBLEPeripheralInfo *)self setKeyUpdatedStateNumber:0];
  [(HAPBLEPeripheralInfo *)self setBroadcastKey:0];

  [(HAPBLEPeripheralInfo *)self setKeyUpdatedTime:0.0];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(HAPBLEPeripheralInfo *)self peripheralUUID];
  [v4 encodeObject:v5 forKey:@"PUUI"];

  [v4 encodeInteger:-[HAPBLEPeripheralInfo advertisedProtocolVersion](self, "advertisedProtocolVersion") forKey:@"PV"];
  [v4 encodeInteger:-[HAPBLEPeripheralInfo previousProtocolVersion](self, "previousProtocolVersion") forKey:@"PPV"];
  [v4 encodeInt64:-[HAPBLEPeripheralInfo resumeSessionId](self, "resumeSessionId") forKey:@"RSI"];
  [(HAPBLEPeripheralInfo *)self lastSeen];
  [v4 encodeDouble:@"LS" forKey:];
  id v6 = [(HAPBLEPeripheralInfo *)self statusFlags];
  [v4 encodeObject:v6 forKey:@"SF"];

  id v7 = [(HAPBLEPeripheralInfo *)self stateNumber];
  [v4 encodeObject:v7 forKey:@"SN"];

  id v8 = [(HAPBLEPeripheralInfo *)self configNumber];
  [v4 encodeObject:v8 forKey:@"CF"];

  v9 = [(HAPBLEPeripheralInfo *)self categoryIdentifier];
  [v4 encodeObject:v9 forKey:@"CI"];

  unsigned __int8 v10 = [(HAPBLEPeripheralInfo *)self accessoryName];
  [v4 encodeObject:v10 forKey:@"AN"];

  id v11 = [(HAPBLEPeripheralInfo *)self broadcastKey];
  [v4 encodeObject:v11 forKey:@"BK"];

  [(HAPBLEPeripheralInfo *)self keyUpdatedTime];
  [v4 encodeDouble:@"BKUT" forKey:@"BKUT"];
  id v12 = [(HAPBLEPeripheralInfo *)self keyUpdatedStateNumber];
  [v4 encodeObject:v12 forKey:@"BKUSN"];
}

- (HAPBLEPeripheralInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HAPBLEPeripheralInfo;
  unsigned __int8 v5 = [(HAPBLEPeripheralInfo *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PUUI"];
    peripheralUUID = v5->_peripheralUUID;
    v5->_peripheralUUID = (NSUUID *)v6;

    v5->_advertisedProtocolVersion = (unint64_t)[v4 decodeIntegerForKey:@"PV"];
    v5->_previousProtocolVersion = (unint64_t)[v4 decodeIntegerForKey:@"PPV"];
    v5->_resumeSessionId = (unint64_t)[v4 decodeInt64ForKey:@"RSI"];
    [v4 decodeDoubleForKey:@"LS"];
    v5->_lastSeen = v8;
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SF"];
    statusFlags = v5->_statusFlags;
    v5->_statusFlags = (NSNumber *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SN"];
    stateNumber = v5->_stateNumber;
    v5->_stateNumber = (NSNumber *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CF"];
    configNumber = v5->_configNumber;
    v5->_configNumber = (NSNumber *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CI"];
    categoryIdentifier = v5->_categoryIdentifier;
    v5->_categoryIdentifier = (NSNumber *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AN"];
    accessoryName = v5->_accessoryName;
    v5->_accessoryName = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BK"];
    broadcastKey = v5->_broadcastKey;
    v5->_broadcastKey = (NSData *)v19;

    [v4 decodeDoubleForKey:@"BKUT"];
    v5->_keyUpdatedTime = v21;
    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BKUSN"];
    keyUpdatedStateNumber = v5->_keyUpdatedStateNumber;
    v5->_keyUpdatedStateNumber = (NSNumber *)v22;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HAPBLEPeripheralInfo *)a3;
  if (self == v4)
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned __int8 v5 = v4;
      uint64_t v6 = [(HAPBLEPeripheralInfo *)self peripheralUUID];
      id v7 = [(HAPBLEPeripheralInfo *)v5 peripheralUUID];

      unsigned __int8 v8 = [v6 isEqual:v7];
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(HAPBLEPeripheralInfo *)self peripheralUUID];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (id)description
{
  v16 = [(HAPBLEPeripheralInfo *)self peripheralUUID];
  unint64_t v15 = [(HAPBLEPeripheralInfo *)self advertisedProtocolVersion];
  unint64_t v3 = [(HAPBLEPeripheralInfo *)self previousProtocolVersion];
  unint64_t v4 = [(HAPBLEPeripheralInfo *)self resumeSessionId];
  [(HAPBLEPeripheralInfo *)self lastSeen];
  unsigned __int8 v5 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  uint64_t v6 = [(HAPBLEPeripheralInfo *)self statusFlags];
  id v7 = [(HAPBLEPeripheralInfo *)self stateNumber];
  unsigned __int8 v8 = [(HAPBLEPeripheralInfo *)self configNumber];
  uint64_t v9 = [(HAPBLEPeripheralInfo *)self categoryIdentifier];
  unsigned __int8 v10 = [(HAPBLEPeripheralInfo *)self accessoryName];
  [(HAPBLEPeripheralInfo *)self keyUpdatedTime];
  uint64_t v11 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  id v12 = [(HAPBLEPeripheralInfo *)self keyUpdatedStateNumber];
  uint64_t v13 = +[NSString stringWithFormat:@"\nPeripheral Info:\n\tPeripheral UUID: %@,\n\tProtocol Version: %tu,\n\tPrevious Version: %tu,\n\tResume Id: %llu,\n\tLast Seen:%@,\n\tStatus Flags: %@,\n\tState Number:%@,\n\tConfig Number: %@,\n\tCategory Id: %@,\n\tName: %@,\n\tKeyUpdatedTime: %@,\n\tKeyUpdated State Number: %@", v16, v15, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return v13;
}

- (NSUUID)peripheralUUID
{
  return self->_peripheralUUID;
}

- (unint64_t)advertisedProtocolVersion
{
  return self->_advertisedProtocolVersion;
}

- (void)setAdvertisedProtocolVersion:(unint64_t)a3
{
  self->_advertisedProtocolVersion = a3;
}

- (unint64_t)previousProtocolVersion
{
  return self->_previousProtocolVersion;
}

- (void)setPreviousProtocolVersion:(unint64_t)a3
{
  self->_previousProtocolVersion = a3;
}

- (unint64_t)resumeSessionId
{
  return self->_resumeSessionId;
}

- (void)setResumeSessionId:(unint64_t)a3
{
  self->_resumeSessionId = a3;
}

- (double)lastSeen
{
  return self->_lastSeen;
}

- (NSNumber)statusFlags
{
  return self->_statusFlags;
}

- (NSNumber)stateNumber
{
  return self->_stateNumber;
}

- (void)setStateNumber:(id)a3
{
}

- (NSNumber)configNumber
{
  return self->_configNumber;
}

- (NSNumber)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (NSString)accessoryName
{
  return self->_accessoryName;
}

- (void)setAccessoryName:(id)a3
{
}

- (NSData)broadcastKey
{
  return self->_broadcastKey;
}

- (void)setBroadcastKey:(id)a3
{
}

- (double)keyUpdatedTime
{
  return self->_keyUpdatedTime;
}

- (void)setKeyUpdatedTime:(double)a3
{
  self->_keyUpdatedTime = a3;
}

- (NSNumber)keyUpdatedStateNumber
{
  return self->_keyUpdatedStateNumber;
}

- (void)setKeyUpdatedStateNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyUpdatedStateNumber, 0);
  objc_storeStrong((id *)&self->_broadcastKey, 0);
  objc_storeStrong((id *)&self->_accessoryName, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_storeStrong((id *)&self->_configNumber, 0);
  objc_storeStrong((id *)&self->_stateNumber, 0);
  objc_storeStrong((id *)&self->_statusFlags, 0);

  objc_storeStrong((id *)&self->_peripheralUUID, 0);
}

@end