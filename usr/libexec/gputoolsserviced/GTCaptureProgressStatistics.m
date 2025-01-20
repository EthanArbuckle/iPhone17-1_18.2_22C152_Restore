@interface GTCaptureProgressStatistics
+ (BOOL)supportsSecureCoding;
- (GTCaptureProgressStatistics)initWithCoder:(id)a3;
- (unint64_t)GPUDataDownloaded;
- (unint64_t)GPUDataSize;
- (unint64_t)commitCount;
- (unint64_t)commitOther;
- (unint64_t)frameCount;
- (unint64_t)frameOther;
- (unint64_t)resourceCount;
- (unint64_t)resourceDownloaded;
- (void)encodeWithCoder:(id)a3;
- (void)setCommitCount:(unint64_t)a3;
- (void)setCommitOther:(unint64_t)a3;
- (void)setFrameCount:(unint64_t)a3;
- (void)setFrameOther:(unint64_t)a3;
- (void)setGPUDataDownloaded:(unint64_t)a3;
- (void)setGPUDataSize:(unint64_t)a3;
- (void)setResourceCount:(unint64_t)a3;
- (void)setResourceDownloaded:(unint64_t)a3;
@end

@implementation GTCaptureProgressStatistics

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTCaptureProgressStatistics)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GTCaptureProgressStatistics;
  v5 = [(GTCaptureProgressStatistics *)&v8 init];
  if (v5)
  {
    v5->_frameCount = (unint64_t)[v4 decodeInt64ForKey:@"frameCount"];
    v5->_frameOther = (unint64_t)[v4 decodeInt64ForKey:@"frameOther"];
    v5->_commitCount = (unint64_t)[v4 decodeInt64ForKey:@"commitCount"];
    v5->_commitOther = (unint64_t)[v4 decodeInt64ForKey:@"commitOther"];
    v5->_resourceCount = (unint64_t)[v4 decodeInt64ForKey:@"resourceCount"];
    v5->_resourceDownloaded = (unint64_t)[v4 decodeInt64ForKey:@"resourceDownloaded"];
    v5->_GPUDataSize = (unint64_t)[v4 decodeInt64ForKey:@"GPUDataSize"];
    v5->_GPUDataDownloaded = (unint64_t)[v4 decodeInt64ForKey:@"GPUDataDownloaded"];
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t frameCount = self->_frameCount;
  id v5 = a3;
  [v5 encodeInt64:frameCount forKey:@"frameCount"];
  [v5 encodeInt64:self->_frameOther forKey:@"frameOther"];
  [v5 encodeInt64:self->_commitCount forKey:@"commitCount"];
  [v5 encodeInt64:self->_commitOther forKey:@"commitOther"];
  [v5 encodeInt64:self->_resourceCount forKey:@"resourceCount"];
  [v5 encodeInt64:self->_resourceDownloaded forKey:@"resourceDownloaded"];
  [v5 encodeInt64:self->_GPUDataSize forKey:@"GPUDataSize"];
  [v5 encodeInt64:self->_GPUDataDownloaded forKey:@"GPUDataDownloaded"];
}

- (unint64_t)frameCount
{
  return self->_frameCount;
}

- (void)setFrameCount:(unint64_t)a3
{
  self->_unint64_t frameCount = a3;
}

- (unint64_t)frameOther
{
  return self->_frameOther;
}

- (void)setFrameOther:(unint64_t)a3
{
  self->_frameOther = a3;
}

- (unint64_t)commitCount
{
  return self->_commitCount;
}

- (void)setCommitCount:(unint64_t)a3
{
  self->_commitCount = a3;
}

- (unint64_t)commitOther
{
  return self->_commitOther;
}

- (void)setCommitOther:(unint64_t)a3
{
  self->_commitOther = a3;
}

- (unint64_t)resourceCount
{
  return self->_resourceCount;
}

- (void)setResourceCount:(unint64_t)a3
{
  self->_resourceCount = a3;
}

- (unint64_t)resourceDownloaded
{
  return self->_resourceDownloaded;
}

- (void)setResourceDownloaded:(unint64_t)a3
{
  self->_resourceDownloaded = a3;
}

- (unint64_t)GPUDataSize
{
  return self->_GPUDataSize;
}

- (void)setGPUDataSize:(unint64_t)a3
{
  self->_GPUDataSize = a3;
}

- (unint64_t)GPUDataDownloaded
{
  return self->_GPUDataDownloaded;
}

- (void)setGPUDataDownloaded:(unint64_t)a3
{
  self->_GPUDataDownloaded = a3;
}

@end