@interface PRSHostConfigurationEntry
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)entryWithExtensionID:(id)a3 descriptorID:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsBSXPCSecureCoding;
- (NSString)descriptorID;
- (NSString)extensionID;
- (PRSHostConfigurationEntry)initWithBSXPCCoder:(id)a3;
- (PRSHostConfigurationEntry)initWithCoder:(id)a3;
- (PRSHostConfigurationEntry)initWithExtensionID:(id)a3 descriptorID:(id)a4;
- (unint64_t)hash;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDescriptorID:(id)a3;
- (void)setExtensionID:(id)a3;
@end

@implementation PRSHostConfigurationEntry

+ (id)entryWithExtensionID:(id)a3 descriptorID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithExtensionID:v6 descriptorID:v5];

  return v7;
}

- (PRSHostConfigurationEntry)initWithExtensionID:(id)a3 descriptorID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (![v7 length])
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PRSHostConfiguration.m", 24, @"Invalid parameter not satisfying: %@", @"[extensionID length] > 0" object file lineNumber description];
  }
  if (![v8 length])
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PRSHostConfiguration.m", 25, @"Invalid parameter not satisfying: %@", @"[descriptorID length] > 0" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)PRSHostConfigurationEntry;
  v9 = [(PRSHostConfigurationEntry *)&v14 init];
  v10 = v9;
  if (v9)
  {
    [(PRSHostConfigurationEntry *)v9 setExtensionID:v7];
    [(PRSHostConfigurationEntry *)v10 setDescriptorID:v8];
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PRSHostConfigurationEntry *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    id v6 = v4;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        id v7 = v6;
      }
      else {
        id v7 = 0;
      }
    }
    else
    {
      id v7 = 0;
    }
    v9 = v7;

    if (v9)
    {
      extensionID = self->_extensionID;
      v11 = [(PRSHostConfigurationEntry *)v9 extensionID];
      if ([(NSString *)extensionID isEqualToString:v11])
      {
        descriptorID = self->_descriptorID;
        v13 = [(PRSHostConfigurationEntry *)v9 descriptorID];
        char v8 = [(NSString *)descriptorID isEqualToString:v13];
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }
  return v8;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendString:self->_extensionID];
  id v5 = (id)[v3 appendString:self->_descriptorID];
  unint64_t v6 = [v3 hash];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  extensionID = self->_extensionID;
  id v5 = a3;
  [v5 encodeObject:extensionID forKey:@"_extensionID"];
  [v5 encodeObject:self->_descriptorID forKey:@"_descriptorID"];
}

- (PRSHostConfigurationEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PRSHostConfigurationEntry;
  id v5 = [(PRSHostConfigurationEntry *)&v11 init];
  if (v5)
  {
    unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_extensionID"];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_descriptorID"];
    char v8 = (void *)v7;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (!v9)
    {
      [(PRSHostConfigurationEntry *)v5 setExtensionID:v6];
      [(PRSHostConfigurationEntry *)v5 setDescriptorID:v8];
    }
  }
  return v5;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  extensionID = self->_extensionID;
  id v5 = a3;
  [v5 encodeObject:extensionID forKey:@"_extensionID"];
  [v5 encodeObject:self->_descriptorID forKey:@"_descriptorID"];
}

- (PRSHostConfigurationEntry)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PRSHostConfigurationEntry;
  id v5 = [(PRSHostConfigurationEntry *)&v10 init];
  if (v5)
  {
    unint64_t v6 = [v4 decodeStringForKey:@"_extensionID"];
    uint64_t v7 = [v4 decodeStringForKey:@"_descriptorID"];
    char v8 = (void *)v7;
    if (v6 && v7)
    {
      [(PRSHostConfigurationEntry *)v5 setExtensionID:v6];
      [(PRSHostConfigurationEntry *)v5 setDescriptorID:v8];
    }
  }
  return v5;
}

- (NSString)extensionID
{
  return self->_extensionID;
}

- (void)setExtensionID:(id)a3
{
}

- (NSString)descriptorID
{
  return self->_descriptorID;
}

- (void)setDescriptorID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptorID, 0);
  objc_storeStrong((id *)&self->_extensionID, 0);
}

@end