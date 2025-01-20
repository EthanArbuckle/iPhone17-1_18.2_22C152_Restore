@interface PRSHostConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)hostConfigurationWithConfigurationEntries:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsBSXPCSecureCoding;
- (NSArray)entries;
- (PRSHostConfiguration)initWithBSXPCCoder:(id)a3;
- (PRSHostConfiguration)initWithCoder:(id)a3;
- (PRSHostConfiguration)initWithConfigurationEntries:(id)a3;
- (unint64_t)hash;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setEntries:(id)a3;
@end

@implementation PRSHostConfiguration

+ (id)hostConfigurationWithConfigurationEntries:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithConfigurationEntries:v3];

  return v4;
}

- (PRSHostConfiguration)initWithConfigurationEntries:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PRSHostConfiguration;
  v5 = [(PRSHostConfiguration *)&v8 init];
  v6 = v5;
  if (v5) {
    [(PRSHostConfiguration *)v5 setEntries:v4];
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PRSHostConfiguration *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    v6 = v4;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        v7 = v6;
      }
      else {
        v7 = 0;
      }
    }
    else
    {
      v7 = 0;
    }
    v9 = v7;

    if (v9)
    {
      v10 = [(PRSHostConfiguration *)v9 entries];
      char v8 = BSEqualArrays();
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
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F4F758] builder];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_entries;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = (id)objc_msgSend(v3, "appendObject:", *(void *)(*((void *)&v12 + 1) + 8 * v8++), (void)v12);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  unint64_t v10 = [v3 hash];
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (PRSHostConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PRSHostConfiguration;
  uint64_t v5 = [(PRSHostConfiguration *)&v8 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_entries"];
    if (v6) {
      [(PRSHostConfiguration *)v5 setEntries:v6];
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
}

- (PRSHostConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRSHostConfiguration;
  uint64_t v5 = [(PRSHostConfiguration *)&v9 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [v4 decodeCollectionOfClass:v6 containingClass:objc_opt_class() forKey:@"_entries"];
    if (v7) {
      [(PRSHostConfiguration *)v5 setEntries:v7];
    }
  }
  return v5;
}

- (NSArray)entries
{
  return self->_entries;
}

- (void)setEntries:(id)a3
{
}

- (void).cxx_destruct
{
}

@end