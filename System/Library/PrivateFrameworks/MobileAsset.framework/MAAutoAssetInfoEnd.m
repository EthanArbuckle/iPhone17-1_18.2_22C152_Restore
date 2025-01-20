@interface MAAutoAssetInfoEnd
+ (BOOL)supportsSecureCoding;
- (MAAutoAssetInfoEnd)initWithCoder:(id)a3;
- (MAAutoAssetInfoEnd)initWithLockReason:(id)a3 endingLockCount:(int64_t)a4;
- (NSString)endLockReason;
- (id)summary;
- (int64_t)endLockCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MAAutoAssetInfoEnd

- (MAAutoAssetInfoEnd)initWithLockReason:(id)a3 endingLockCount:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MAAutoAssetInfoEnd;
  v8 = [(MAAutoAssetInfoEnd *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_endLockReason, a3);
    v9->_endLockCount = a4;
  }

  return v9;
}

- (MAAutoAssetInfoEnd)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MAAutoAssetInfoEnd;
  v5 = [(MAAutoAssetInfoEnd *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endLockReason"];
    endLockReason = v5->_endLockReason;
    v5->_endLockReason = (NSString *)v6;

    v5->_endLockCount = [v4 decodeIntegerForKey:@"endLockCount"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(MAAutoAssetInfoEnd *)self endLockReason];
  [v5 encodeObject:v4 forKey:@"endLockReason"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[MAAutoAssetInfoEnd endLockCount](self, "endLockCount"), @"endLockCount");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)summary
{
  v3 = NSString;
  id v4 = [(MAAutoAssetInfoEnd *)self endLockReason];
  id v5 = [v3 stringWithFormat:@"%@|endCount:%ld", v4, -[MAAutoAssetInfoEnd endLockCount](self, "endLockCount")];

  return v5;
}

- (NSString)endLockReason
{
  return self->_endLockReason;
}

- (int64_t)endLockCount
{
  return self->_endLockCount;
}

- (void).cxx_destruct
{
}

@end