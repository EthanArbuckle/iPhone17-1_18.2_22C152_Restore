@interface SYDStoreConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)processName;
- (SYDStoreConfiguration)init;
- (SYDStoreConfiguration)initWithCoder:(id)a3;
- (SYDStoreConfiguration)initWithStoreID:(id)a3;
- (SYDStoreID)storeID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setProcessName:(id)a3;
- (void)setStoreID:(id)a3;
@end

@implementation SYDStoreConfiguration

- (NSString)processName
{
  return self->_processName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
}

- (void)encodeWithCoder:(id)a3
{
  storeID = self->_storeID;
  id v5 = a3;
  [v5 encodeObject:storeID forKey:@"s"];
  [v5 encodeObject:self->_processName forKey:@"n"];
}

- (SYDStoreConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SYDStoreConfiguration;
  id v5 = [(SYDStoreConfiguration *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"s"];
    storeID = v5->_storeID;
    v5->_storeID = (SYDStoreID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"n"];
    processName = v5->_processName;
    v5->_processName = (NSString *)v8;
  }
  return v5;
}

- (id)description
{
  v3 = (void *)MEMORY[0x263F089D8];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(SYDStoreConfiguration *)self storeID];
  v7 = [v3 stringWithFormat:@"<%@: %p storeID=%@", v5, self, v6];;

  [v7 appendString:@">"];
  return v7;
}

- (SYDStoreID)storeID
{
  return self->_storeID;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SYDStoreConfiguration)initWithStoreID:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    [v13 handleFailureInMethod:a2, self, @"SYDStoreConfiguration.m", 34, @"Must specify a non-nil storeID when initializing %@", v15 object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)SYDStoreConfiguration;
  v7 = [(SYDStoreConfiguration *)&v16 init];
  uint64_t v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_storeID, a3);
    v9 = [MEMORY[0x263F08AB0] processInfo];
    uint64_t v10 = [v9 processName];
    processName = v8->_processName;
    v8->_processName = (NSString *)v10;
  }
  return v8;
}

- (SYDStoreConfiguration)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  v7 = NSStringFromSelector(sel_initWithStoreID_);
  [v4 handleFailureInMethod:a2, self, @"SYDStoreConfiguration.m", 45, @"Use -[%@ %@]", v6, v7 object file lineNumber description];

  return 0;
}

- (unint64_t)hash
{
  v3 = [(SYDStoreConfiguration *)self storeID];
  uint64_t v4 = [v3 hash];
  id v5 = [(SYDStoreConfiguration *)self processName];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    unint64_t v6 = [v5 storeID];
    v7 = [(SYDStoreConfiguration *)self storeID];
    int v8 = [v6 isEqual:v7];

    if (v8)
    {
      v9 = [v5 processName];
      uint64_t v10 = [(SYDStoreConfiguration *)self processName];
      char v11 = [v9 isEqual:v10];
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

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [SYDStoreConfiguration alloc];
  id v5 = [(SYDStoreConfiguration *)self storeID];
  unint64_t v6 = (void *)[v5 copy];
  v7 = [(SYDStoreConfiguration *)v4 initWithStoreID:v6];

  int v8 = [(SYDStoreConfiguration *)self processName];
  v9 = (void *)[v8 copy];
  [(SYDStoreConfiguration *)v7 setProcessName:v9];

  return v7;
}

- (void)setStoreID:(id)a3
{
}

- (void)setProcessName:(id)a3
{
}

@end