@interface CLHarvestDataAccessPoint
+ (BOOL)supportsSecureCoding;
- (BOOL)isApplePersonalHotspot;
- (CLHarvestDataAccessPoint)initWithAccessPoint:(AccessPoint *)a3;
- (CLHarvestDataAccessPoint)initWithCoder:(id)a3;
- (NSString)ssid;
- (double)age;
- (double)timestamp;
- (id)description;
- (id)jsonObject;
- (int)channel;
- (int)mode;
- (int)rssi;
- (unint64_t)macAddress;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLHarvestDataAccessPoint

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLHarvestDataAccessPoint)initWithAccessPoint:(AccessPoint *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CLHarvestDataAccessPoint;
  v4 = [(CLHarvestDataAccessPoint *)&v10 init];
  if (v4)
  {
    __p[0] = (void *)a3->var0.var0;
    v4->_macAddress = sub_1000D8908((uint64_t)__p);
    id v5 = objc_alloc((Class)NSString);
    if (*((char *)&a3->var1.__r_.__value_.var0.var1 + 23) < 0)
    {
      sub_1000DC48C(__p, a3->var1.__r_.__value_.var0.var1.__data_, a3->var1.__r_.__value_.var0.var1.__size_);
    }
    else
    {
      *(_OWORD *)__p = *(_OWORD *)a3->var1.__r_.__value_.var0.var0.__data_;
      uint64_t v9 = *((void *)&a3->var1.__r_.__value_.var0.var1 + 2);
    }
    if (v9 >= 0) {
      v6 = __p;
    }
    else {
      v6 = (void **)__p[0];
    }
    v4->_ssid = (NSString *)[v5 initWithUTF8String:v6, __p[0], __p[1], v9];
    if (SHIBYTE(v9) < 0) {
      operator delete(__p[0]);
    }
    v4->_rssi = a3->var1.__r_.var0;
    v4->_mode = *(_DWORD *)&a3->var1.__r_.var1;
    v4->_channel = a3->var1.var0;
    *(void *)&v4->_age = a3[1].var0.var0;
    *(void *)&v4->_timestamp = a3[1].var1.__r_.__value_.var0.var1.__data_;
    v4->_isApplePersonalHotspot = a3[1].var1.__r_.__value_.var0.var0.__data_[8];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLHarvestDataAccessPoint;
  [(CLHarvestDataAccessPoint *)&v3 dealloc];
}

- (CLHarvestDataAccessPoint)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CLHarvestDataAccessPoint;
  v4 = [(CLHarvestDataAccessPoint *)&v8 init];
  if (v4)
  {
    v4->_macAddress = (unint64_t)[a3 decodeInt64ForKey:@"MacAddressKey"];
    v4->_ssid = (NSString *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"SsidKey"];
    v4->_rssi = [a3 decodeIntForKey:@"RssiKey"];
    v4->_channel = [a3 decodeIntForKey:@"ChannelKey"];
    [a3 decodeDoubleForKey:@"AgeKey"];
    v4->_age = v5;
    [a3 decodeDoubleForKey:@"ScanTimestampKey"];
    v4->_timestamp = v6;
    v4->_isApplePersonalHotspot = [a3 decodeBoolForKey:@"ApplePersonalHotspotKey"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInt64:self->_macAddress forKey:@"MacAddressKey"];
  [a3 encodeObject:self->_ssid forKey:@"SsidKey"];
  [a3 encodeInt:self->_rssi forKey:@"RssiKey"];
  [a3 encodeInt:self->_mode forKey:@"ModeKey"];
  [a3 encodeInt:self->_channel forKey:@"ChannelKey"];
  [a3 encodeDouble:@"AgeKey" forKey:self->_age];
  [a3 encodeDouble:@"ScanTimestampKey" forKey:self->_timestamp];
  BOOL isApplePersonalHotspot = self->_isApplePersonalHotspot;

  [a3 encodeBool:isApplePersonalHotspot forKey:@"ApplePersonalHotspotKey"];
}

- (id)jsonObject
{
  v4[0] = @"macAddress";
  v5[0] = +[NSNumber numberWithUnsignedLongLong:[(CLHarvestDataAccessPoint *)self macAddress]];
  v4[1] = @"ssid";
  v5[1] = [(CLHarvestDataAccessPoint *)self ssid];
  v4[2] = @"rssi";
  v5[2] = +[NSNumber numberWithInt:[(CLHarvestDataAccessPoint *)self rssi]];
  v4[3] = @"mode";
  v5[3] = +[NSNumber numberWithInt:[(CLHarvestDataAccessPoint *)self mode]];
  v4[4] = @"channel";
  v5[4] = +[NSNumber numberWithInt:[(CLHarvestDataAccessPoint *)self channel]];
  v4[5] = @"age";
  [(CLHarvestDataAccessPoint *)self age];
  v5[5] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v4[6] = @"scanTimestamp";
  [(CLHarvestDataAccessPoint *)self timestamp];
  v5[6] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v4[7] = @"isApplePersonalHotspot";
  v5[7] = +[NSNumber numberWithBool:[(CLHarvestDataAccessPoint *)self isApplePersonalHotspot]];
  return +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:8];
}

- (id)description
{
  id v2 = [objc_alloc((Class)NSString) initWithData:+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", -[CLHarvestDataAccessPoint jsonObject](self, "jsonObject"), 0, 0) encoding:4];

  return v2;
}

- (unint64_t)macAddress
{
  return self->_macAddress;
}

- (NSString)ssid
{
  return self->_ssid;
}

- (int)rssi
{
  return self->_rssi;
}

- (int)mode
{
  return self->_mode;
}

- (int)channel
{
  return self->_channel;
}

- (double)age
{
  return self->_age;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (BOOL)isApplePersonalHotspot
{
  return self->_isApplePersonalHotspot;
}

@end