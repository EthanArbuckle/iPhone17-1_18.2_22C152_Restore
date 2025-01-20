@interface PDTimestampedPointCloud
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timestamp;
- (ADJasperPointCloud)pointCloud;
- (PDTimestampedPointCloud)initWithPointCloud:(id)a3 andTimestamp:(id *)a4;
@end

@implementation PDTimestampedPointCloud

- (void).cxx_destruct
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timestamp
{
  objc_copyStruct(retstr, &self->_timestamp, 24, 1, 0);
  return result;
}

- (ADJasperPointCloud)pointCloud
{
  return (ADJasperPointCloud *)objc_getProperty(self, a2, 8, 1);
}

- (PDTimestampedPointCloud)initWithPointCloud:(id)a3 andTimestamp:(id *)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PDTimestampedPointCloud;
  v8 = [(PDTimestampedPointCloud *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_pointCloud, a3);
    long long v10 = *(_OWORD *)&a4->var0;
    v9->_timestamp.epoch = a4->var3;
    *(_OWORD *)&v9->_timestamp.value = v10;
  }

  return v9;
}

@end