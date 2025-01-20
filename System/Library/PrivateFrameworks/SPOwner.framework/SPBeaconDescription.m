@interface SPBeaconDescription
+ (BOOL)supportsSecureCoding;
- (NSString)model;
- (NSString)name;
- (NSString)stableIdentifier;
- (NSString)systemVersion;
- (SPBeaconDescription)initWithCoder:(id)a3;
- (SPBeaconDescription)initWithStableIdentifier:(id)a3 name:(id)a4 model:(id)a5 systemVersion:(id)a6 vendorId:(int64_t)a7 productId:(int64_t)a8 role:(int64_t)a9;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)productId;
- (int64_t)role;
- (int64_t)vendorId;
- (void)encodeWithCoder:(id)a3;
- (void)setModel:(id)a3;
- (void)setName:(id)a3;
- (void)setProductId:(int64_t)a3;
- (void)setRole:(int64_t)a3;
- (void)setSystemVersion:(id)a3;
- (void)setVendorId:(int64_t)a3;
@end

@implementation SPBeaconDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPBeaconDescription)initWithStableIdentifier:(id)a3 name:(id)a4 model:(id)a5 systemVersion:(id)a6 vendorId:(int64_t)a7 productId:(int64_t)a8 role:(int64_t)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SPBeaconDescription;
  v19 = [(SPBeaconDescription *)&v22 init];
  if (v19)
  {
    if ([v15 length])
    {
      objc_storeStrong((id *)&v19->_stableIdentifier, a3);
      objc_storeStrong((id *)&v19->_name, a4);
      objc_storeStrong((id *)&v19->_model, a5);
      objc_storeStrong((id *)&v19->_systemVersion, a6);
      v19->_vendorId = a7;
      v19->_productId = a8;
      v19->_role = a9;
    }
    else
    {

      v19 = 0;
    }
  }

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SPBeaconDescription alloc];
  v5 = [(SPBeaconDescription *)self stableIdentifier];
  v6 = [(SPBeaconDescription *)self name];
  v7 = [(SPBeaconDescription *)self model];
  v8 = [(SPBeaconDescription *)self systemVersion];
  v9 = [(SPBeaconDescription *)v4 initWithStableIdentifier:v5 name:v6 model:v7 systemVersion:v8 vendorId:[(SPBeaconDescription *)self vendorId] productId:[(SPBeaconDescription *)self productId] role:[(SPBeaconDescription *)self role]];

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  stableIdentifier = self->_stableIdentifier;
  id v5 = a3;
  [v5 encodeObject:stableIdentifier forKey:@"stableIdentifier"];
  [v5 encodeObject:self->_name forKey:@"name"];
  [v5 encodeObject:self->_model forKey:@"model"];
  [v5 encodeObject:self->_systemVersion forKey:@"systemVersion"];
  [v5 encodeInteger:self->_vendorId forKey:@"vendorId"];
  [v5 encodeInteger:self->_productId forKey:@"productId"];
  [v5 encodeInteger:self->_role forKey:@"role"];
}

- (SPBeaconDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stableIdentifier"];
  stableIdentifier = self->_stableIdentifier;
  self->_stableIdentifier = v5;

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  name = self->_name;
  self->_name = v7;

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"model"];
  model = self->_model;
  self->_model = v9;

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"systemVersion"];
  systemVersion = self->_systemVersion;
  self->_systemVersion = v11;

  self->_vendorId = [v4 decodeIntegerForKey:@"vendorId"];
  self->_productId = [v4 decodeIntegerForKey:@"productId"];
  int64_t v13 = [v4 decodeIntegerForKey:@"role"];

  self->_role = v13;
  return self;
}

- (NSString)stableIdentifier
{
  return self->_stableIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (NSString)systemVersion
{
  return self->_systemVersion;
}

- (void)setSystemVersion:(id)a3
{
}

- (int64_t)vendorId
{
  return self->_vendorId;
}

- (void)setVendorId:(int64_t)a3
{
  self->_vendorId = a3;
}

- (int64_t)productId
{
  return self->_productId;
}

- (void)setProductId:(int64_t)a3
{
  self->_productId = a3;
}

- (int64_t)role
{
  return self->_role;
}

- (void)setRole:(int64_t)a3
{
  self->_role = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemVersion, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_stableIdentifier, 0);
}

@end