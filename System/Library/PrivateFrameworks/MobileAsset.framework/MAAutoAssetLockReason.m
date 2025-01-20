@interface MAAutoAssetLockReason
+ (BOOL)supportsSecureCoding;
- (MAAutoAssetLockReason)initWithCoder:(id)a3;
- (NSString)autoAssetClientName;
- (NSString)lockReason;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initForClientName:(id)a3 forLockReason:(id)a4;
- (id)newSummaryDictionary;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)setAutoAssetClientName:(id)a3;
- (void)setLockReason:(id)a3;
@end

@implementation MAAutoAssetLockReason

- (id)initForClientName:(id)a3 forLockReason:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MAAutoAssetLockReason;
  v9 = [(MAAutoAssetLockReason *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_autoAssetClientName, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (MAAutoAssetLockReason)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MAAutoAssetLockReason;
  v5 = [(MAAutoAssetLockReason *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"autoAssetClientName"];
    autoAssetClientName = v5->_autoAssetClientName;
    v5->_autoAssetClientName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lockReason"];
    lockReason = v5->_lockReason;
    v5->_lockReason = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MAAutoAssetLockReason *)self autoAssetClientName];
  [v4 encodeObject:v5 forKey:@"autoAssetClientName"];

  id v6 = [(MAAutoAssetLockReason *)self lockReason];
  [v4 encodeObject:v6 forKey:@"lockReason"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(MAAutoAssetLockReason *)self autoAssetClientName];
  [v4 setAutoAssetClientName:v5];

  id v6 = [(MAAutoAssetLockReason *)self lockReason];
  [v4 setLockReason:v6];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)summary
{
  v3 = NSString;
  id v4 = [(MAAutoAssetLockReason *)self autoAssetClientName];
  v5 = [(MAAutoAssetLockReason *)self lockReason];
  id v6 = [v3 stringWithFormat:@"client:%@|reason:%@", v4, v5];

  return v6;
}

- (id)newSummaryDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(MAAutoAssetLockReason *)self autoAssetClientName];
  [v3 setSafeObject:v4 forKey:@"autoAssetClientName"];

  v5 = [(MAAutoAssetLockReason *)self lockReason];
  [v3 setSafeObject:v5 forKey:@"lockReason"];

  return v3;
}

- (NSString)autoAssetClientName
{
  return self->_autoAssetClientName;
}

- (void)setAutoAssetClientName:(id)a3
{
}

- (NSString)lockReason
{
  return self->_lockReason;
}

- (void)setLockReason:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockReason, 0);
  objc_storeStrong((id *)&self->_autoAssetClientName, 0);
}

@end