@interface PLBackgroundJobStatusStartWorkerEvent
- (NSString)worker;
- (id)statusDump;
- (unint64_t)jobsCount;
- (void)setJobsCount:(unint64_t)a3;
- (void)setWorker:(id)a3;
@end

@implementation PLBackgroundJobStatusStartWorkerEvent

- (void).cxx_destruct
{
}

- (void)setJobsCount:(unint64_t)a3
{
  self->_jobsCount = a3;
}

- (unint64_t)jobsCount
{
  return self->_jobsCount;
}

- (void)setWorker:(id)a3
{
}

- (NSString)worker
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)statusDump
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PLBackgroundJobStatusStartWorkerEvent;
  v4 = [(PLBackgroundJobStatusEvent *)&v8 statusDump];
  v5 = [(PLBackgroundJobStatusStartWorkerEvent *)self worker];
  v6 = [v3 stringWithFormat:@"%@ - %@ working on %lu jobs\n", v4, v5, -[PLBackgroundJobStatusStartWorkerEvent jobsCount](self, "jobsCount")];

  return v6;
}

@end