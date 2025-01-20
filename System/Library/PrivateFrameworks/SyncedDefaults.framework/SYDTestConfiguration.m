@interface SYDTestConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)testDeviceID;
- (NSString)testServerName;
- (SYDTestConfiguration)initWithCoder:(id)a3;
- (SYDTestConfiguration)initWithTestServerName:(id)a3 testDeviceID:(id)a4;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SYDTestConfiguration

- (SYDTestConfiguration)initWithTestServerName:(id)a3 testDeviceID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SYDTestConfiguration;
  v8 = [(SYDTestConfiguration *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    testServerName = v8->_testServerName;
    v8->_testServerName = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    testDeviceID = v8->_testDeviceID;
    v8->_testDeviceID = (NSString *)v11;
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(SYDTestConfiguration *)self testServerName];
    id v7 = [v5 testServerName];
    int v8 = SYDObjectsAreBothNilOrEqual(v6, v7);

    if (v8)
    {
      uint64_t v9 = [(SYDTestConfiguration *)self testDeviceID];
      v10 = [v5 testDeviceID];
      char v11 = SYDObjectsAreBothNilOrEqual(v9, v10);
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

- (unint64_t)hash
{
  v3 = [(SYDTestConfiguration *)self testServerName];
  uint64_t v4 = [v3 hash];
  id v5 = [(SYDTestConfiguration *)self testDeviceID];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  unint64_t v6 = [(SYDTestConfiguration *)self testServerName];
  id v7 = [(SYDTestConfiguration *)self testDeviceID];
  int v8 = [v3 stringWithFormat:@"<%@ server=%@ device=%@>", v5, v6, v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SYDTestConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SYDTestConfiguration;
  id v5 = [(SYDTestConfiguration *)&v15 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    id v7 = NSStringFromSelector(sel_testServerName);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    testServerName = v5->_testServerName;
    v5->_testServerName = (NSString *)v8;

    uint64_t v10 = objc_opt_class();
    char v11 = NSStringFromSelector(sel_testDeviceID);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    testDeviceID = v5->_testDeviceID;
    v5->_testDeviceID = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  testServerName = self->_testServerName;
  id v5 = a3;
  uint64_t v6 = NSStringFromSelector(sel_testServerName);
  [v5 encodeObject:testServerName forKey:v6];

  testDeviceID = self->_testDeviceID;
  NSStringFromSelector(sel_testDeviceID);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:testDeviceID forKey:v8];
}

- (NSString)testServerName
{
  return self->_testServerName;
}

- (NSString)testDeviceID
{
  return self->_testDeviceID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testDeviceID, 0);
  objc_storeStrong((id *)&self->_testServerName, 0);
}

@end