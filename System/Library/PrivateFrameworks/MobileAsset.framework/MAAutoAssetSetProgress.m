@interface MAAutoAssetSetProgress
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStalled;
- (MAAutoAssetSetProgress)init;
- (MAAutoAssetSetProgress)initWithCoder:(id)a3;
- (double)expectedTimeRemainingSecs;
- (id)copy;
- (id)summary;
- (int64_t)downloadedAssetCount;
- (int64_t)remainingAssetCount;
- (int64_t)totalExpectedBytes;
- (int64_t)totalWrittenBytes;
- (void)encodeWithCoder:(id)a3;
- (void)setDownloadedAssetCount:(int64_t)a3;
- (void)setExpectedTimeRemainingSecs:(double)a3;
- (void)setIsStalled:(BOOL)a3;
- (void)setRemainingAssetCount:(int64_t)a3;
- (void)setTotalExpectedBytes:(int64_t)a3;
- (void)setTotalWrittenBytes:(int64_t)a3;
@end

@implementation MAAutoAssetSetProgress

- (MAAutoAssetSetProgress)init
{
  v3.receiver = self;
  v3.super_class = (Class)MAAutoAssetSetProgress;
  result = [(MAAutoAssetSetProgress *)&v3 init];
  if (result)
  {
    result->_isStalled = 0;
    *(_OWORD *)&result->_downloadedAssetCount = 0u;
    *(_OWORD *)&result->_totalExpectedBytes = 0u;
    result->_expectedTimeRemainingSecs = 0.0;
  }
  return result;
}

- (MAAutoAssetSetProgress)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MAAutoAssetSetProgress;
  v5 = [(MAAutoAssetSetProgress *)&v8 init];
  if (v5)
  {
    v5->_downloadedAssetCount = [v4 decodeInt64ForKey:@"downloadedAssetCount"];
    v5->_remainingAssetCount = [v4 decodeInt64ForKey:@"remainingAssetCount"];
    v5->_totalExpectedBytes = [v4 decodeInt64ForKey:@"totalExpectedBytes"];
    v5->_totalWrittenBytes = [v4 decodeInt64ForKey:@"totalWrittenBytes"];
    v5->_isStalled = [v4 decodeBoolForKey:@"isStalled"];
    [v4 decodeFloatForKey:@"expectedTimeRemainingSecs"];
    v5->_expectedTimeRemainingSecs = v6;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", -[MAAutoAssetSetProgress downloadedAssetCount](self, "downloadedAssetCount"), @"downloadedAssetCount");
  objc_msgSend(v5, "encodeInt64:forKey:", -[MAAutoAssetSetProgress remainingAssetCount](self, "remainingAssetCount"), @"remainingAssetCount");
  objc_msgSend(v5, "encodeInt64:forKey:", -[MAAutoAssetSetProgress totalExpectedBytes](self, "totalExpectedBytes"), @"totalExpectedBytes");
  objc_msgSend(v5, "encodeInt64:forKey:", -[MAAutoAssetSetProgress totalWrittenBytes](self, "totalWrittenBytes"), @"totalWrittenBytes");
  objc_msgSend(v5, "encodeBool:forKey:", -[MAAutoAssetSetProgress isStalled](self, "isStalled"), @"isStalled");
  [(MAAutoAssetSetProgress *)self expectedTimeRemainingSecs];
  *(float *)&double v4 = v4;
  [v5 encodeFloat:@"expectedTimeRemainingSecs" forKey:v4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  objc_super v3 = objc_alloc_init(MAAutoAssetSetProgress);
  [(MAAutoAssetSetProgress *)v3 setDownloadedAssetCount:[(MAAutoAssetSetProgress *)self downloadedAssetCount]];
  [(MAAutoAssetSetProgress *)v3 setRemainingAssetCount:[(MAAutoAssetSetProgress *)self remainingAssetCount]];
  [(MAAutoAssetSetProgress *)v3 setTotalExpectedBytes:[(MAAutoAssetSetProgress *)self totalExpectedBytes]];
  [(MAAutoAssetSetProgress *)v3 setTotalWrittenBytes:[(MAAutoAssetSetProgress *)self totalWrittenBytes]];
  [(MAAutoAssetSetProgress *)v3 setIsStalled:[(MAAutoAssetSetProgress *)self isStalled]];
  [(MAAutoAssetSetProgress *)self expectedTimeRemainingSecs];
  -[MAAutoAssetSetProgress setExpectedTimeRemainingSecs:](v3, "setExpectedTimeRemainingSecs:");
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (MAAutoAssetSetProgress *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(MAAutoAssetSetProgress *)v5 downloadedAssetCount];
      if (v6 == [(MAAutoAssetSetProgress *)self downloadedAssetCount]
        && (uint64_t v7 = [(MAAutoAssetSetProgress *)v5 remainingAssetCount],
            v7 == [(MAAutoAssetSetProgress *)self remainingAssetCount])
        && (uint64_t v8 = [(MAAutoAssetSetProgress *)v5 totalExpectedBytes],
            v8 == [(MAAutoAssetSetProgress *)self totalExpectedBytes])
        && (uint64_t v9 = [(MAAutoAssetSetProgress *)v5 totalWrittenBytes],
            v9 == [(MAAutoAssetSetProgress *)self totalWrittenBytes])
        && (BOOL v10 = [(MAAutoAssetSetProgress *)v5 isStalled],
            v10 == [(MAAutoAssetSetProgress *)self isStalled]))
      {
        [(MAAutoAssetSetProgress *)v5 expectedTimeRemainingSecs];
        double v14 = v13;
        [(MAAutoAssetSetProgress *)self expectedTimeRemainingSecs];
        BOOL v11 = v14 == v15;
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (id)summary
{
  objc_super v3 = NSString;
  int64_t v4 = [(MAAutoAssetSetProgress *)self downloadedAssetCount];
  int64_t v5 = [(MAAutoAssetSetProgress *)self remainingAssetCount];
  int64_t v6 = [(MAAutoAssetSetProgress *)self totalExpectedBytes];
  int64_t v7 = [(MAAutoAssetSetProgress *)self totalWrittenBytes];
  if ([(MAAutoAssetSetProgress *)self isStalled]) {
    uint64_t v8 = @"Y";
  }
  else {
    uint64_t v8 = @"N";
  }
  [(MAAutoAssetSetProgress *)self expectedTimeRemainingSecs];
  return (id)[v3 stringWithFormat:@"downloadedCount:%lld|remainingAssetCount:%lld|expectedBytes:%lld|writtenBytes:%lld|stalled:%@|timeRemainingSecs:%f", v4, v5, v6, v7, v8, v9];
}

- (int64_t)downloadedAssetCount
{
  return self->_downloadedAssetCount;
}

- (void)setDownloadedAssetCount:(int64_t)a3
{
  self->_downloadedAssetCount = a3;
}

- (int64_t)remainingAssetCount
{
  return self->_remainingAssetCount;
}

- (void)setRemainingAssetCount:(int64_t)a3
{
  self->_remainingAssetCount = a3;
}

- (int64_t)totalExpectedBytes
{
  return self->_totalExpectedBytes;
}

- (void)setTotalExpectedBytes:(int64_t)a3
{
  self->_totalExpectedBytes = a3;
}

- (int64_t)totalWrittenBytes
{
  return self->_totalWrittenBytes;
}

- (void)setTotalWrittenBytes:(int64_t)a3
{
  self->_totalWrittenBytes = a3;
}

- (BOOL)isStalled
{
  return self->_isStalled;
}

- (void)setIsStalled:(BOOL)a3
{
  self->_isStalled = a3;
}

- (double)expectedTimeRemainingSecs
{
  return self->_expectedTimeRemainingSecs;
}

- (void)setExpectedTimeRemainingSecs:(double)a3
{
  self->_expectedTimeRemainingSecs = a3;
}

@end