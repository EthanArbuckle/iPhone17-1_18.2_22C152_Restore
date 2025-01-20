@interface MAAutoAssetInfoInstance
+ (BOOL)supportsSecureCoding;
- (MAAutoAssetInfoInstance)initWithCoder:(id)a3;
- (MAAutoAssetSelector)clientAssetSelector;
- (NSString)autoAssetClientName;
- (NSString)clientProcessName;
- (NSUUID)frameworkInstanceUUID;
- (id)description;
- (id)initForClientName:(id)a3 withProcessName:(id)a4 withProcessID:(int64_t)a5 usingAssetSelector:(id)a6 associatingFrameworkUUID:(id)a7;
- (id)summary;
- (int64_t)clientProcessID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MAAutoAssetInfoInstance

- (id)initForClientName:(id)a3 withProcessName:(id)a4 withProcessID:(int64_t)a5 usingAssetSelector:(id)a6 associatingFrameworkUUID:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)MAAutoAssetInfoInstance;
  v17 = [(MAAutoAssetInfoInstance *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_autoAssetClientName, a3);
    objc_storeStrong((id *)&v18->_clientProcessName, a4);
    v18->_clientProcessID = a5;
    objc_storeStrong((id *)&v18->_clientAssetSelector, a6);
    objc_storeStrong((id *)&v18->_frameworkInstanceUUID, a7);
  }

  return v18;
}

- (MAAutoAssetInfoInstance)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MAAutoAssetInfoInstance;
  v5 = [(MAAutoAssetInfoInstance *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"autoAssetClientName"];
    autoAssetClientName = v5->_autoAssetClientName;
    v5->_autoAssetClientName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientProcessName"];
    clientProcessName = v5->_clientProcessName;
    v5->_clientProcessName = (NSString *)v8;

    v5->_clientProcessID = [v4 decodeIntegerForKey:@"clientProcessID"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientAssetSelector"];
    clientAssetSelector = v5->_clientAssetSelector;
    v5->_clientAssetSelector = (MAAutoAssetSelector *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"frameworkInstanceUUID"];
    frameworkInstanceUUID = v5->_frameworkInstanceUUID;
    v5->_frameworkInstanceUUID = (NSUUID *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MAAutoAssetInfoInstance *)self autoAssetClientName];
  [v4 encodeObject:v5 forKey:@"autoAssetClientName"];

  uint64_t v6 = [(MAAutoAssetInfoInstance *)self clientProcessName];
  [v4 encodeObject:v6 forKey:@"clientProcessName"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetInfoInstance clientProcessID](self, "clientProcessID"), @"clientProcessID");
  v7 = [(MAAutoAssetInfoInstance *)self clientAssetSelector];
  [v4 encodeObject:v7 forKey:@"clientAssetSelector"];

  id v8 = [(MAAutoAssetInfoInstance *)self frameworkInstanceUUID];
  [v4 encodeObject:v8 forKey:@"frameworkInstanceUUID"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(MAAutoAssetInfoInstance *)self summary];
  v5 = [(MAAutoAssetInfoInstance *)self frameworkInstanceUUID];
  uint64_t v6 = [v3 stringWithFormat:@"%@|%@", v4, v5];

  return v6;
}

- (id)summary
{
  v3 = NSString;
  id v4 = [(MAAutoAssetInfoInstance *)self autoAssetClientName];
  v5 = [(MAAutoAssetInfoInstance *)self clientAssetSelector];
  uint64_t v6 = [v5 summary];
  v7 = [(MAAutoAssetInfoInstance *)self clientProcessName];
  id v8 = [v3 stringWithFormat:@"%@(%@)%@:%ld", v4, v6, v7, -[MAAutoAssetInfoInstance clientProcessID](self, "clientProcessID")];

  return v8;
}

- (NSString)autoAssetClientName
{
  return self->_autoAssetClientName;
}

- (NSString)clientProcessName
{
  return self->_clientProcessName;
}

- (int64_t)clientProcessID
{
  return self->_clientProcessID;
}

- (MAAutoAssetSelector)clientAssetSelector
{
  return self->_clientAssetSelector;
}

- (NSUUID)frameworkInstanceUUID
{
  return self->_frameworkInstanceUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameworkInstanceUUID, 0);
  objc_storeStrong((id *)&self->_clientAssetSelector, 0);
  objc_storeStrong((id *)&self->_clientProcessName, 0);
  objc_storeStrong((id *)&self->_autoAssetClientName, 0);
}

@end