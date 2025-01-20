@interface NDODeviceInfo
+ (BOOL)supportsSecureCoding;
+ (id)deviceInfoWithDevice:(id)a3 warranty:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NDODevice)device;
- (NDODeviceInfo)initWithCoder:(id)a3;
- (NDODeviceInfo)initWithDevice:(id)a3 warranty:(id)a4;
- (NDOWarranty)warranty;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDevice:(id)a3;
- (void)setWarranty:(id)a3;
@end

@implementation NDODeviceInfo

+ (id)deviceInfoWithDevice:(id)a3 warranty:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[NDODeviceInfo alloc] initWithDevice:v6 warranty:v5];

  return v7;
}

- (NDODeviceInfo)initWithDevice:(id)a3 warranty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NDODeviceInfo;
  v8 = [(NDODeviceInfo *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(NDODeviceInfo *)v8 setDevice:v6];
    [(NDODeviceInfo *)v9 setWarranty:v7];
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [v5 device];
    id v7 = [(NDODeviceInfo *)self device];
    if ([v6 isEqual:v7])
    {
      v8 = [v5 warranty];
      v9 = [(NDODeviceInfo *)self warranty];
      unsigned __int8 v10 = [v8 isEqual:v9];
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)NDODeviceInfo;
    unsigned __int8 v10 = [(NDODeviceInfo *)&v12 isEqual:v4];
  }

  return v10;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(NDODeviceInfo *)self device];
  id v5 = [(NDODeviceInfo *)self warranty];
  if (v5) {
    id v6 = @"has warranty";
  }
  else {
    id v6 = @"missing warranty";
  }
  id v7 = [(NDODeviceInfo *)self warranty];
  if ([v7 acOfferDisplay])
  {
    v8 = NSString;
    v9 = [(NDODeviceInfo *)self warranty];
    unsigned __int8 v10 = [v9 acOfferEligibleUntil];
    objc_super v11 = [v8 stringWithFormat:@"eligible until %@", v10];
    objc_super v12 = [v3 stringWithFormat:@"%@: %@ %@", v4, v6, v11];
  }
  else
  {
    objc_super v12 = [v3 stringWithFormat:@"%@: %@ %@", v4, v6, @"No offer"];
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(NDODeviceInfo *)self device];
  [v4 encodeObject:v5 forKey:@"device"];

  id v6 = [(NDODeviceInfo *)self warranty];
  [v4 encodeObject:v6 forKey:@"warranty"];
}

- (NDODeviceInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NDODeviceInfo;
  id v5 = [(NDODeviceInfo *)&v9 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"device"];
    [(NDODeviceInfo *)v5 setDevice:v6];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"warranty"];
    [(NDODeviceInfo *)v5 setWarranty:v7];
  }
  return v5;
}

- (NDODevice)device
{
  return (NDODevice *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDevice:(id)a3
{
}

- (NDOWarranty)warranty
{
  return (NDOWarranty *)objc_getProperty(self, a2, 16, 1);
}

- (void)setWarranty:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warranty, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end