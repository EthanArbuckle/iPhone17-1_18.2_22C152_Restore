@interface PLCPLDownloadContext
- (BOOL)completed;
- (NSError)error;
- (NSString)resourceTypeDescription;
- (NSString)taskIdentifier;
- (double)progress;
- (double)updateLastQueuedTime;
- (id)description;
- (void)setCompleted:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setProgress:(double)a3;
- (void)setResourceTypeDescription:(id)a3;
- (void)setTaskIdentifier:(id)a3;
- (void)setUpdateLastQueuedTime:(double)a3;
- (void)updateFromDownloadStatusUserInfo:(id)a3;
@end

@implementation PLCPLDownloadContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_resourceTypeDescription, 0);
  objc_storeStrong((id *)&self->_taskIdentifier, 0);
}

- (void)setUpdateLastQueuedTime:(double)a3
{
  self->_updateLastQueuedTime = a3;
}

- (double)updateLastQueuedTime
{
  return self->_updateLastQueuedTime;
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (double)progress
{
  return self->_progress;
}

- (void)setResourceTypeDescription:(id)a3
{
}

- (NSString)resourceTypeDescription
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTaskIdentifier:(id)a3
{
}

- (NSString)taskIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)updateFromDownloadStatusUserInfo:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"progress"];
  id v11 = v5;
  if (v5)
  {
    [v5 doubleValue];
    double v7 = v6;
  }
  else
  {
    double v7 = NAN;
  }
  v8 = [v4 objectForKeyedSubscript:@"completed"];
  uint64_t v9 = [v8 BOOLValue];

  v10 = [v4 objectForKeyedSubscript:@"error"];

  if (v7 >= 0.0) {
    [(PLCPLDownloadContext *)self setProgress:v7];
  }
  [(PLCPLDownloadContext *)self setCompleted:v9];
  if (v10) {
    [(PLCPLDownloadContext *)self setError:v10];
  }
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<PLCPLDownloadContext resourceTypeDescription=%@ taskIdentifier=%@>", self->_resourceTypeDescription, self->_taskIdentifier];
}

@end