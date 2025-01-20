@interface WOSyncIdentity
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)instanceDiscriminator;
- (NSUUID)databaseIdentifier;
- (NSUUID)hardwareIdentifier;
- (WOSyncIdentity)initWithCoder:(id)a3;
- (WOSyncIdentity)initWithHardwareIdentifier:(id)a3 databaseIdentifier:(id)a4 instanceDiscriminator:(id)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WOSyncIdentity

- (WOSyncIdentity)initWithHardwareIdentifier:(id)a3 databaseIdentifier:(id)a4 instanceDiscriminator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)WOSyncIdentity;
  v11 = [(WOSyncIdentity *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    hardwareIdentifier = v11->_hardwareIdentifier;
    v11->_hardwareIdentifier = (NSUUID *)v12;

    uint64_t v14 = [v9 copy];
    databaseIdentifier = v11->_databaseIdentifier;
    v11->_databaseIdentifier = (NSUUID *)v14;

    uint64_t v16 = [v10 copy];
    instanceDiscriminator = v11->_instanceDiscriminator;
    v11->_instanceDiscriminator = (NSString *)v16;
  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WOSyncIdentity *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      hardwareIdentifier = self->_hardwareIdentifier;
      v6 = [(WOSyncIdentity *)v4 hardwareIdentifier];
      if ([(NSUUID *)hardwareIdentifier isEqual:v6])
      {
        databaseIdentifier = self->_databaseIdentifier;
        id v8 = [(WOSyncIdentity *)v4 databaseIdentifier];
        if ([(NSUUID *)databaseIdentifier isEqual:v8])
        {
          instanceDiscriminator = self->_instanceDiscriminator;
          id v10 = [(WOSyncIdentity *)v4 instanceDiscriminator];
          char v11 = [(NSString *)instanceDiscriminator isEqual:v10];
        }
        else
        {
          char v11 = 0;
        }
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  hardwareIdentifier = self->_hardwareIdentifier;
  id v5 = a3;
  [v5 encodeObject:hardwareIdentifier forKey:@"hwID"];
  [v5 encodeObject:self->_databaseIdentifier forKey:@"dbID"];
  [v5 encodeObject:self->_instanceDiscriminator forKey:@"instanceDisc"];
}

- (WOSyncIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hwID"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dbID"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"instanceDisc"];

  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8 || v7 == 0)
  {
    id v10 = 0;
  }
  else
  {
    self = [(WOSyncIdentity *)self initWithHardwareIdentifier:v5 databaseIdentifier:v6 instanceDiscriminator:v7];
    id v10 = self;
  }

  return v10;
}

- (NSUUID)hardwareIdentifier
{
  return self->_hardwareIdentifier;
}

- (NSUUID)databaseIdentifier
{
  return self->_databaseIdentifier;
}

- (NSString)instanceDiscriminator
{
  return self->_instanceDiscriminator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceDiscriminator, 0);
  objc_storeStrong((id *)&self->_databaseIdentifier, 0);
  objc_storeStrong((id *)&self->_hardwareIdentifier, 0);
}

@end