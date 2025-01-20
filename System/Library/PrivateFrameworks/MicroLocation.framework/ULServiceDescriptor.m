@interface ULServiceDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (BOOL)isEqual:(id)a3;
- (NSArray)locationTypes;
- (NSUUID)serviceIdentifier;
- (ULServiceDescriptor)init;
- (ULServiceDescriptor)initWithCoder:(id)a3;
- (ULServiceDescriptor)initWithServiceIdentifier:(id)a3 serviceType:(unint64_t)a4 locationTypes:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)serviceType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ULServiceDescriptor

- (ULServiceDescriptor)initWithServiceIdentifier:(id)a3 serviceType:(unint64_t)a4 locationTypes:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ULServiceDescriptor;
  v11 = [(ULServiceDescriptor *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_serviceIdentifier, a3);
    v12->_serviceType = a4;
    objc_storeStrong((id *)&v12->_locationTypes, a5);
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v6 = (void *)[(NSUUID *)self->_serviceIdentifier copyWithZone:a3];
  unint64_t serviceType = self->_serviceType;
  v8 = (void *)[(NSArray *)self->_locationTypes copyWithZone:a3];
  id v9 = (void *)[v5 initWithServiceIdentifier:v6 serviceType:serviceType locationTypes:v8];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ULServiceDescriptor)initWithCoder:(id)a3
{
  v18[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ULServiceDescriptor;
  v5 = [(ULServiceDescriptor *)&v17 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceIdentifier"];
    if (v6)
    {
      uint64_t v7 = self;

      serviceIdentifier = v5->_serviceIdentifier;
      v5->_serviceIdentifier = (NSUUID *)v7;

      id v9 = (void *)MEMORY[0x263EFFA08];
      v18[0] = objc_opt_class();
      v18[1] = objc_opt_class();
      id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
      v11 = [v9 setWithArray:v10];
      v6 = [v4 decodeObjectOfClasses:v11 forKey:@"locationTypes"];

      if (v6)
      {
        uint64_t v12 = self;

        locationTypes = v5->_locationTypes;
        v5->_locationTypes = (NSArray *)v12;

        objc_super v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceType"];
        v6 = v14;
        if (v14)
        {
          unint64_t v15 = [(ULServiceDescriptor *)v14 unsignedIntValue];

          v5->_unint64_t serviceType = v15;
          v6 = v5;
        }
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  locationTypes = self->_locationTypes;
  id v5 = a3;
  [v5 encodeObject:locationTypes forKey:@"locationTypes"];
  [v5 encodeObject:self->_serviceIdentifier forKey:@"serviceIdentifier"];
  id v6 = [NSNumber numberWithUnsignedInteger:self->_serviceType];
  [v5 encodeObject:v6 forKey:@"serviceType"];
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = (void *)[v3 initWithFormat:@"<%@: ", v5];

  unint64_t serviceType = self->_serviceType;
  if (serviceType > 4) {
    v8 = @"Unknown";
  }
  else {
    v8 = off_2653F7FE0[serviceType];
  }
  [v6 appendFormat:@", serviceType: %@", v8];
  [v6 appendFormat:@", serviceIdentifier: %@", self->_serviceIdentifier];
  [v6 appendFormat:@", locationTypes: %@", self->_locationTypes];
  [v6 appendString:@">"];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(ULServiceDescriptor *)self serviceType];
    if (v6 == [v5 serviceType])
    {
      uint64_t v7 = [(ULServiceDescriptor *)self locationTypes];
      v8 = [v5 locationTypes];
      if ([v7 isEqual:v8])
      {

        goto LABEL_8;
      }
      id v10 = [(ULServiceDescriptor *)self locationTypes];
      v11 = [v5 locationTypes];

      if (v10 == v11)
      {
LABEL_8:
        uint64_t v12 = [(ULServiceDescriptor *)self serviceIdentifier];
        v13 = [v5 serviceIdentifier];
        if ([v12 isEqual:v13])
        {

          char v9 = 1;
        }
        else
        {
          objc_super v14 = [(ULServiceDescriptor *)self serviceIdentifier];
          unint64_t v15 = [v5 serviceIdentifier];
          BOOL v16 = v14 != v15;

          char v9 = !v16;
        }
        goto LABEL_11;
      }
    }
    char v9 = 0;
LABEL_11:

    goto LABEL_12;
  }
  char v9 = 0;
LABEL_12:

  return v9 & 1;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_serviceIdentifier hash];
  return v3 ^ [(NSArray *)self->_locationTypes hash] ^ self->_serviceType ^ 0x1F;
}

- (ULServiceDescriptor)init
{
}

+ (id)new
{
}

- (NSUUID)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (unint64_t)serviceType
{
  return self->_serviceType;
}

- (NSArray)locationTypes
{
  return self->_locationTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationTypes, 0);

  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
}

@end