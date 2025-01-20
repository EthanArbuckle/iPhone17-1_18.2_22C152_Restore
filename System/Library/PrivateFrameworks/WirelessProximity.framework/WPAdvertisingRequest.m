@interface WPAdvertisingRequest
+ (BOOL)supportsSecureCoding;
+ (id)requestForClientType:(unsigned __int8)a3;
- (BOOL)connectable;
- (BOOL)enableEPAForAdvertising;
- (BOOL)holdVoucher;
- (BOOL)isRanging;
- (BOOL)isValidOnConnectableInstance;
- (BOOL)stopOnAdvertisingAddressChange;
- (NSData)advertisingData;
- (NSDictionary)advertisingOptions;
- (NSNumber)advertisementRequestedAt;
- (WPAdvertisingRequest)init;
- (WPAdvertisingRequest)initWithCoder:(id)a3;
- (double)updateTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)advertisingRate;
- (int64_t)compare:(id)a3;
- (int64_t)priorityValue;
- (unsigned)clientType;
- (void)changePriorityValue:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAdvertisementRequestedAt:(id)a3;
- (void)setAdvertisingData:(id)a3;
- (void)setAdvertisingOptions:(id)a3;
- (void)setAdvertisingRate:(int64_t)a3;
- (void)setClientType:(unsigned __int8)a3;
- (void)setConnectable:(BOOL)a3;
- (void)setEnableEPAForAdvertising:(BOOL)a3;
- (void)setHoldVoucher:(BOOL)a3;
- (void)setIsRanging:(BOOL)a3;
- (void)setPriorityValue:(int64_t)a3;
- (void)setStopOnAdvertisingAddressChange:(BOOL)a3;
- (void)setUpdateTime:(double)a3;
@end

@implementation WPAdvertisingRequest

+ (id)requestForClientType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v4 = objc_alloc_init((Class)a1);
  [v4 setClientType:v3];

  return v4;
}

- (void)setClientType:(unsigned __int8)a3
{
  switch(a3)
  {
    case 0u:
    case 1u:
    case 3u:
    case 6u:
    case 7u:
    case 0x11u:
    case 0x1Bu:
      objc_msgSend(MEMORY[0x263EFF940], "raise:format:", @"Advertising not supported", @"Advertising is not supported for client type %hhu", a3);
      break;
    case 2u:
      uint64_t v5 = 9;
      goto LABEL_23;
    case 4u:
      uint64_t v5 = 6;
      goto LABEL_23;
    case 5u:
      uint64_t v5 = 15;
      goto LABEL_23;
    case 8u:
      uint64_t v5 = 17;
      goto LABEL_23;
    case 9u:
      uint64_t v5 = 8;
      goto LABEL_23;
    case 0xAu:
      uint64_t v5 = 10;
      goto LABEL_23;
    case 0xBu:
      uint64_t v5 = 5;
      goto LABEL_23;
    case 0xCu:
      uint64_t v5 = 7;
      goto LABEL_23;
    case 0xDu:
      uint64_t v5 = 12;
      goto LABEL_23;
    case 0xEu:
      uint64_t v5 = 11;
      goto LABEL_23;
    case 0xFu:
      uint64_t v5 = 14;
      goto LABEL_23;
    case 0x10u:
      uint64_t v5 = 3;
      goto LABEL_23;
    case 0x12u:
      uint64_t v5 = 99;
      goto LABEL_23;
    case 0x13u:
      uint64_t v5 = 13;
      goto LABEL_23;
    case 0x14u:
    case 0x17u:
    case 0x19u:
      objc_msgSend(MEMORY[0x263EFF940], "raise:format:", @"WPClientType not used", @"WPClientType: %hhu not used in advertising", a3);
      break;
    case 0x15u:
      uint64_t v5 = 16;
      goto LABEL_23;
    case 0x16u:
      uint64_t v5 = 1;
      goto LABEL_23;
    case 0x18u:
      uint64_t v5 = 2;
      goto LABEL_23;
    case 0x1Au:
      uint64_t v5 = 4;
LABEL_23:
      [(WPAdvertisingRequest *)self setPriorityValue:v5];
      break;
    default:
      break;
  }
  self->_clientType = a3;
}

- (void)setPriorityValue:(int64_t)a3
{
  self->_priorityValue = a3;
}

- (WPAdvertisingRequest)init
{
  v10.receiver = self;
  v10.super_class = (Class)WPAdvertisingRequest;
  v2 = [(WPAdvertisingRequest *)&v10 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_advertisingRate = 290;
    uint64_t v4 = [MEMORY[0x263EFF8F8] data];
    advertisingData = v3->_advertisingData;
    v3->_advertisingData = (NSData *)v4;

    *(_WORD *)&v3->_clientType = 27;
    v3->_stopOnAdvertisingAddressChange = 0;
    v3->_priorityValue = 0;
    v3->_updateTime = 0.0;
    uint64_t v6 = [NSDictionary dictionary];
    advertisingOptions = v3->_advertisingOptions;
    v3->_advertisingOptions = (NSDictionary *)v6;

    v3->_holdVoucher = 0;
    advertisementRequestedAt = v3->_advertisementRequestedAt;
    v3->_advertisementRequestedAt = 0;
  }
  return v3;
}

- (void)setStopOnAdvertisingAddressChange:(BOOL)a3
{
  self->_stopOnAdvertisingAddressChange = a3;
}

- (void)setConnectable:(BOOL)a3
{
  self->_connectable = a3;
}

- (void)setAdvertisingRate:(int64_t)a3
{
  self->_advertisingRate = a3;
}

- (void)setAdvertisingData:(id)a3
{
  uint64_t v4 = (NSData *)a3;
  int v5 = [(WPAdvertisingRequest *)self clientType];
  uint64_t v6 = [(NSData *)v4 length];
  BOOL v7 = v5 == 18;
  unint64_t v8 = 28;
  if (v5 == 18) {
    uint64_t v9 = 31;
  }
  else {
    uint64_t v9 = 28;
  }
  if (v7) {
    unint64_t v8 = 31;
  }
  if (v6 + 6 > v8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"The data that was provided is too large (%ld) to fit in a BTLE advertising packet (%d)", -[NSData length](v4, "length") + 6, v9);
    id v11 = [MEMORY[0x263EFF940] exceptionWithName:@"WPBadData" reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v11);
  }
  advertisingData = self->_advertisingData;
  self->_advertisingData = v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = [(WPAdvertisingRequest *)self clientType];
  int64_t v5 = [(WPAdvertisingRequest *)self priorityValue];
  int64_t v6 = [(WPAdvertisingRequest *)self advertisingRate];
  double v7 = (double)[(WPAdvertisingRequest *)self advertisingRate] * 0.625;
  unint64_t v8 = [(WPAdvertisingRequest *)self advertisingData];
  BOOL v9 = [(WPAdvertisingRequest *)self connectable];
  BOOL v10 = [(WPAdvertisingRequest *)self stopOnAdvertisingAddressChange];
  id v11 = [(WPAdvertisingRequest *)self advertisingOptions];
  v12 = [(WPAdvertisingRequest *)self advertisementRequestedAt];
  v13 = [v3 stringWithFormat:@"advertising request of type %ld, priority %ld, UseFG %ld (%.2f ms), data %@, connectable %d, addr change %d, options %@, advertisementRequestedAt %llu", v4, v5, v6, *(void *)&v7, v8, v9, v10, v11, objc_msgSend(v12, "longLongValue")];

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[WPAdvertisingRequest clientType](self, "clientType"), @"kClientType");
  objc_msgSend(v4, "encodeInteger:forKey:", -[WPAdvertisingRequest advertisingRate](self, "advertisingRate"), @"kAdvertisingRate");
  int64_t v5 = [(WPAdvertisingRequest *)self advertisingData];
  [v4 encodeObject:v5 forKey:@"kAdvertisingData"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[WPAdvertisingRequest priorityValue](self, "priorityValue"), @"kPriorityValue");
  [(WPAdvertisingRequest *)self updateTime];
  objc_msgSend(v4, "encodeDouble:forKey:", @"kUpdateTime");
  objc_msgSend(v4, "encodeBool:forKey:", -[WPAdvertisingRequest connectable](self, "connectable"), @"kConnectableAdvert");
  int64_t v6 = [(WPAdvertisingRequest *)self advertisingOptions];
  [v4 encodeObject:v6 forKey:@"kAdvertisingOptions"];

  objc_msgSend(v4, "encodeBool:forKey:", -[WPAdvertisingRequest stopOnAdvertisingAddressChange](self, "stopOnAdvertisingAddressChange"), @"kStopOnAddressChange");
  objc_msgSend(v4, "encodeBool:forKey:", -[WPAdvertisingRequest holdVoucher](self, "holdVoucher"), @"kHoldVoucher");
  id v7 = [(WPAdvertisingRequest *)self advertisementRequestedAt];
  [v4 encodeObject:v7 forKey:@"kAdvertisingRequestedAt"];
}

- (NSData)advertisingData
{
  return self->_advertisingData;
}

- (BOOL)stopOnAdvertisingAddressChange
{
  return self->_stopOnAdvertisingAddressChange;
}

- (int64_t)priorityValue
{
  return self->_priorityValue;
}

- (BOOL)connectable
{
  return self->_connectable;
}

- (NSDictionary)advertisingOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (NSNumber)advertisementRequestedAt
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (double)updateTime
{
  return self->_updateTime;
}

- (BOOL)holdVoucher
{
  return self->_holdVoucher;
}

- (int64_t)advertisingRate
{
  return self->_advertisingRate;
}

- (unsigned)clientType
{
  return self->_clientType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advertisementRequestedAt, 0);
  objc_storeStrong((id *)&self->_advertisingOptions, 0);

  objc_storeStrong((id *)&self->_advertisingData, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    objc_msgSend(v4, "setClientType:", -[WPAdvertisingRequest clientType](self, "clientType"));
    int64_t v5 = [(WPAdvertisingRequest *)self advertisingData];
    [v4 setAdvertisingData:v5];

    objc_msgSend(v4, "setAdvertisingRate:", -[WPAdvertisingRequest advertisingRate](self, "advertisingRate"));
    objc_msgSend(v4, "setPriorityValue:", -[WPAdvertisingRequest priorityValue](self, "priorityValue"));
    [(WPAdvertisingRequest *)self updateTime];
    objc_msgSend(v4, "setUpdateTime:");
    objc_msgSend(v4, "setConnectable:", -[WPAdvertisingRequest connectable](self, "connectable"));
    int64_t v6 = [(WPAdvertisingRequest *)self advertisingOptions];
    [v4 setAdvertisingOptions:v6];

    objc_msgSend(v4, "setStopOnAdvertisingAddressChange:", -[WPAdvertisingRequest stopOnAdvertisingAddressChange](self, "stopOnAdvertisingAddressChange"));
    objc_msgSend(v4, "setHoldVoucher:", -[WPAdvertisingRequest holdVoucher](self, "holdVoucher"));
    id v7 = [(WPAdvertisingRequest *)self advertisementRequestedAt];
    [v4 setAdvertisementRequestedAt:v7];
  }
  return v4;
}

- (WPAdvertisingRequest)initWithCoder:(id)a3
{
  v18[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WPAdvertisingRequest;
  int64_t v5 = [(WPAdvertisingRequest *)&v17 init];
  if (v5)
  {
    v5->_clientType = [v4 decodeIntegerForKey:@"kClientType"];
    v5->_advertisingRate = [v4 decodeIntegerForKey:@"kAdvertisingRate"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kAdvertisingData"];
    advertisingData = v5->_advertisingData;
    v5->_advertisingData = (NSData *)v6;

    v5->_priorityValue = [v4 decodeIntegerForKey:@"kPriorityValue"];
    [v4 decodeDoubleForKey:@"kUpdateTime"];
    v5->_updateTime = v8;
    v5->_connectable = [v4 decodeBoolForKey:@"kConnectableAdvert"];
    BOOL v9 = (void *)MEMORY[0x263EFFA08];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v18[2] = objc_opt_class();
    v18[3] = objc_opt_class();
    BOOL v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:4];
    id v11 = [v9 setWithArray:v10];
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"kAdvertisingOptions"];
    advertisingOptions = v5->_advertisingOptions;
    v5->_advertisingOptions = (NSDictionary *)v12;

    v5->_stopOnAdvertisingAddressChange = [v4 decodeBoolForKey:@"kStopOnAddressChange"];
    v5->_holdVoucher = [v4 decodeBoolForKey:@"kHoldVoucher"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kAdvertisingRequestedAt"];
    advertisementRequestedAt = v5->_advertisementRequestedAt;
    v5->_advertisementRequestedAt = (NSNumber *)v14;
  }
  return v5;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 priorityValue];
  if (v5 <= [(WPAdvertisingRequest *)self priorityValue])
  {
    uint64_t v7 = [v4 priorityValue];
    if (v7 == [(WPAdvertisingRequest *)self priorityValue])
    {
      int64_t v6 = 0;
    }
    else
    {
      uint64_t v8 = [v4 priorityValue];
      if (v8 >= [(WPAdvertisingRequest *)self priorityValue])
      {
        id v10 = [MEMORY[0x263EFF940] exceptionWithName:@"PriorityValueError" reason:@"There was an error comparing the priority values. Are you sure it was set for the advertising request?" userInfo:0];
        objc_exception_throw(v10);
      }
      int64_t v6 = -1;
    }
  }
  else
  {
    int64_t v6 = 1;
  }

  return v6;
}

- (void)changePriorityValue:(int64_t)a3
{
  if (a3 == 1)
  {
    [(WPAdvertisingRequest *)self setPriorityValue:99];
  }
  else if (!a3)
  {
    uint64_t v4 = [(WPAdvertisingRequest *)self clientType];
    [(WPAdvertisingRequest *)self setClientType:v4];
  }
}

- (BOOL)isValidOnConnectableInstance
{
  return (self->_clientType > 0x16uLL) | (0x37FBFFu >> self->_clientType) & 1;
}

- (void)setUpdateTime:(double)a3
{
  self->_updateTime = a3;
}

- (void)setAdvertisingOptions:(id)a3
{
}

- (BOOL)isRanging
{
  return self->_isRanging;
}

- (void)setIsRanging:(BOOL)a3
{
  self->_isRanging = a3;
}

- (void)setHoldVoucher:(BOOL)a3
{
  self->_holdVoucher = a3;
}

- (BOOL)enableEPAForAdvertising
{
  return self->_enableEPAForAdvertising;
}

- (void)setEnableEPAForAdvertising:(BOOL)a3
{
  self->_enableEPAForAdvertising = a3;
}

- (void)setAdvertisementRequestedAt:(id)a3
{
}

@end