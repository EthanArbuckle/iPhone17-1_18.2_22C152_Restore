@interface HAPDeviceID
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDeviceID:(id)a3;
- (HAPDeviceID)init;
- (HAPDeviceID)initWithCoder:(id)a3;
- (HAPDeviceID)initWithDeviceIDData:(id)a3;
- (HAPDeviceID)initWithDeviceIDString:(id)a3;
- (NSData)data;
- (NSString)deviceIDString;
- (id)debugDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HAPDeviceID

- (HAPDeviceID)init
{
  v2 = NSStringFromSelector(a2);
  v3 = +[NSString stringWithFormat:@"%@ is unavailable", v2];
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (HAPDeviceID)initWithDeviceIDString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = HAPDeviceIDLength;
  v6 = &buf[-((HAPDeviceIDLength + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v7 = v4;
  [v7 UTF8String];
  [v7 length];
  if (TextToHardwareAddress())
  {
    v8 = sub_100083F74();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = sub_100083FD0(0);
      *(_DWORD *)buf = 138543618;
      v13 = v9;
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}@Invalid device identifier string: %@", buf, 0x16u);
    }
    v10 = 0;
  }
  else
  {
    v8 = +[NSData dataWithBytes:v6 length:v5];
    self = [(HAPDeviceID *)self initWithDeviceIDData:v8];
    v10 = self;
  }

  return v10;
}

- (HAPDeviceID)initWithDeviceIDData:(id)a3
{
  id v4 = a3;
  id v5 = [v4 length];
  if (v5 == (id)HAPDeviceIDLength)
  {
    v13.receiver = self;
    v13.super_class = (Class)HAPDeviceID;
    v6 = [(HAPDeviceID *)&v13 init];
    if (v6)
    {
      id v7 = (NSData *)[v4 copy];
      data = v6->_data;
      v6->_data = v7;
    }
    self = v6;
    v9 = self;
  }
  else
  {
    v10 = sub_100083F74();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = sub_100083FD0(0);
      *(_DWORD *)buf = 138543618;
      id v15 = v11;
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@Invalid device identifier data: %@", buf, 0x16u);
    }
    v9 = 0;
  }

  return v9;
}

- (id)debugDescription
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(HAPDeviceID *)self deviceIDString];
  id v5 = +[NSString stringWithFormat:@"<%@ %p: %@>", v3, self, v4];

  return v5;
}

- (unint64_t)hash
{
  v2 = [(HAPDeviceID *)self data];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HAPDeviceID *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    v6 = v5;
    if (v6) {
      BOOL v7 = [(HAPDeviceID *)self isEqualToDeviceID:v6];
    }
    else {
      BOOL v7 = 0;
    }
  }
  return v7;
}

- (BOOL)isEqualToDeviceID:(id)a3
{
  if (self == a3) {
    return 1;
  }
  id v4 = a3;
  id v5 = [(HAPDeviceID *)self data];
  v6 = [v4 data];

  LOBYTE(v4) = [v5 isEqualToData:v6];
  return (char)v4;
}

- (NSString)deviceIDString
{
  id v3 = (char *)&v8 - ((3 * HAPDeviceIDLength + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = [(HAPDeviceID *)self data];
  [v4 bytes];
  id v5 = [(HAPDeviceID *)self data];
  [v5 length];
  HardwareAddressToCString();

  v6 = +[NSString stringWithUTF8String:v3];

  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HAPDeviceID)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 allowsKeyedCoding])
  {
    id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HAP.data"];
    self = [(HAPDeviceID *)self initWithDeviceIDData:v5];

    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  if ([v5 allowsKeyedCoding])
  {
    id v4 = [(HAPDeviceID *)self data];
    [v5 encodeObject:v4 forKey:@"HAP.data"];
  }
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
}

@end