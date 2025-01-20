@interface GTCaptureProgress
+ (BOOL)supportsSecureCoding;
- (GTCaptureCompletionState)completionState;
- (GTCaptureDescriptor)descriptor;
- (GTCaptureProgress)initWithCoder:(id)a3;
- (GTCaptureProgressStatistics)stats;
- (id)description;
- (unint64_t)captureState;
- (unint64_t)capturedCommandsBuffers;
- (void)encodeWithCoder:(id)a3;
- (void)setCaptureState:(unint64_t)a3;
- (void)setCapturedCommandsBuffers:(unint64_t)a3;
- (void)setCompletionState:(id)a3;
- (void)setDescriptor:(id)a3;
- (void)setStats:(id)a3;
@end

@implementation GTCaptureProgress

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTCaptureProgress)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GTCaptureProgress;
  v5 = [(GTCaptureProgress *)&v15 init];
  if (v5)
  {
    v5->_captureState = (unint64_t)[v4 decodeInt64ForKey:@"captureState"];
    v5->_capturedCommandsBuffers = (unint64_t)[v4 decodeInt64ForKey:@"capturedCommandsBuffers"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"descriptor"];
    descriptor = v5->_descriptor;
    v5->_descriptor = (GTCaptureDescriptor *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stats"];
    stats = v5->_stats;
    v5->_stats = (GTCaptureProgressStatistics *)v8;

    uint64_t v10 = objc_opt_new();
    completionState = v5->_completionState;
    v5->_completionState = (GTCaptureCompletionState *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"completionState.archiveURL"];
    [(GTCaptureCompletionState *)v5->_completionState setArchiveURL:v12];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"completionState.error"];
    [(GTCaptureCompletionState *)v5->_completionState setError:v13];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t captureState = self->_captureState;
  id v5 = a3;
  [v5 encodeInt64:captureState forKey:@"captureState"];
  [v5 encodeInt64:self->_capturedCommandsBuffers forKey:@"capturedCommandsBuffers"];
  [v5 encodeObject:self->_descriptor forKey:@"descriptor"];
  [v5 encodeObject:self->_stats forKey:@"stats"];
  uint64_t v6 = [(GTCaptureCompletionState *)self->_completionState archiveURL];
  [v5 encodeObject:v6 forKey:@"completionState.archiveURL"];

  id v7 = [(GTCaptureCompletionState *)self->_completionState error];
  [v5 encodeObject:v7 forKey:@"completionState.error"];
}

- (id)description
{
  v5.receiver = self;
  v5.super_class = (Class)GTCaptureProgress;
  v2 = [(GTCaptureProgress *)&v5 description];
  v3 = +[NSString stringWithFormat:@"%@", v2];

  return v3;
}

- (unint64_t)captureState
{
  return self->_captureState;
}

- (void)setCaptureState:(unint64_t)a3
{
  self->_unint64_t captureState = a3;
}

- (GTCaptureDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
}

- (GTCaptureCompletionState)completionState
{
  return self->_completionState;
}

- (void)setCompletionState:(id)a3
{
}

- (unint64_t)capturedCommandsBuffers
{
  return self->_capturedCommandsBuffers;
}

- (void)setCapturedCommandsBuffers:(unint64_t)a3
{
  self->_capturedCommandsBuffers = a3;
}

- (GTCaptureProgressStatistics)stats
{
  return self->_stats;
}

- (void)setStats:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stats, 0);
  objc_storeStrong((id *)&self->_completionState, 0);

  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end