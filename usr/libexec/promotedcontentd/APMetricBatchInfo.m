@interface APMetricBatchInfo
- (NSString)identifier;
- (id)fileSystemToken;
- (int64_t)purpose;
- (unint64_t)metricsCount;
- (void)setFileSystemToken:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMetricsCount:(unint64_t)a3;
- (void)setPurpose:(int64_t)a3;
@end

@implementation APMetricBatchInfo

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (id)fileSystemToken
{
  return self->_fileSystemToken;
}

- (void)setFileSystemToken:(id)a3
{
}

- (int64_t)purpose
{
  return self->_purpose;
}

- (void)setPurpose:(int64_t)a3
{
  self->_purpose = a3;
}

- (unint64_t)metricsCount
{
  return self->_metricsCount;
}

- (void)setMetricsCount:(unint64_t)a3
{
  self->_metricsCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fileSystemToken, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end