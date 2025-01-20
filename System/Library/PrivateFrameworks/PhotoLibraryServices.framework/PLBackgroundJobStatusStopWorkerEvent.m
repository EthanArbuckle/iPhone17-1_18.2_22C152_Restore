@interface PLBackgroundJobStatusStopWorkerEvent
- (NSString)worker;
- (id)statusDump;
- (unint64_t)pendingJobsCount;
- (void)setPendingJobsCount:(unint64_t)a3;
- (void)setWorker:(id)a3;
@end

@implementation PLBackgroundJobStatusStopWorkerEvent

- (void).cxx_destruct
{
}

- (void)setPendingJobsCount:(unint64_t)a3
{
  self->_pendingJobsCount = a3;
}

- (unint64_t)pendingJobsCount
{
  return self->_pendingJobsCount;
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
  v8.super_class = (Class)PLBackgroundJobStatusStopWorkerEvent;
  v4 = [(PLBackgroundJobStatusEvent *)&v8 statusDump];
  v5 = [(PLBackgroundJobStatusStopWorkerEvent *)self worker];
  v6 = [v3 stringWithFormat:@"%@ - %@ told to stop working with %lu jobs still remaining\n", v4, v5, -[PLBackgroundJobStatusStopWorkerEvent pendingJobsCount](self, "pendingJobsCount")];

  return v6;
}

@end