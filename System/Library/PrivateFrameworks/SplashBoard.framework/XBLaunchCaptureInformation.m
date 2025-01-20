@interface XBLaunchCaptureInformation
+ (BOOL)supportsSecureCoding;
- (NSString)caarFilePath;
- (XBLaunchCaptureInformation)init;
- (XBLaunchCaptureInformation)initWithCoder:(id)a3;
- (unint64_t)estimatedMemoryImpact;
- (void)encodeWithCoder:(id)a3;
- (void)setCaarFilePath:(id)a3;
- (void)setEstimatedMemoryImpact:(unint64_t)a3;
@end

@implementation XBLaunchCaptureInformation

- (XBLaunchCaptureInformation)init
{
  v6.receiver = self;
  v6.super_class = (Class)XBLaunchCaptureInformation;
  v2 = [(XBLaunchCaptureInformation *)&v6 init];
  v3 = v2;
  if (v2)
  {
    caarFilePath = v2->_caarFilePath;
    v2->_estimatedMemoryImpact = -1;
    v2->_caarFilePath = 0;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t estimatedMemoryImpact = self->_estimatedMemoryImpact;
  id v5 = a3;
  [v5 encodeInt64:estimatedMemoryImpact forKey:@"XBLaunchCaptureInformationEstimatedSize"];
  [v5 encodeObject:self->_caarFilePath forKey:@"XBLaunchCaptureInformationCaarPath"];
}

- (XBLaunchCaptureInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(XBLaunchCaptureInformation *)self init];
  if (v5)
  {
    v5->_unint64_t estimatedMemoryImpact = [v4 decodeInt64ForKey:@"XBLaunchCaptureInformationEstimatedSize"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"XBLaunchCaptureInformationCaarPath"];
    caarFilePath = v5->_caarFilePath;
    v5->_caarFilePath = (NSString *)v6;
  }
  return v5;
}

- (unint64_t)estimatedMemoryImpact
{
  return self->_estimatedMemoryImpact;
}

- (void)setEstimatedMemoryImpact:(unint64_t)a3
{
  self->_unint64_t estimatedMemoryImpact = a3;
}

- (NSString)caarFilePath
{
  return self->_caarFilePath;
}

- (void)setCaarFilePath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end