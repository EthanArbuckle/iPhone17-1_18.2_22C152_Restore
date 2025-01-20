@interface PKHMAccessory
+ (BOOL)supportsSecureCoding;
- (NSString)name;
- (NSUUID)uniqueIdentifier;
- (PKHMAccessory)initWithCoder:(id)a3;
- (PKHMAccessory)initWithUniqueIdentifier:(id)a3 name:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setName:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation PKHMAccessory

- (PKHMAccessory)initWithUniqueIdentifier:(id)a3 name:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKHMAccessory;
  v9 = [(PKHMAccessory *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_uniqueIdentifier, a3);
    objc_storeStrong((id *)&v10->_name, a4);
  }

  return v10;
}

- (PKHMAccessory)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKHMAccessory;
  v5 = [(PKHMAccessory *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueIdentifier"];
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uniqueIdentifier = self->_uniqueIdentifier;
  id v5 = a3;
  [v5 encodeObject:uniqueIdentifier forKey:@"uniqueIdentifier"];
  [v5 encodeObject:self->_name forKey:@"name"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end