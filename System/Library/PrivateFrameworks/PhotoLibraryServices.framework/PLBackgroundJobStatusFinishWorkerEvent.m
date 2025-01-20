@interface PLBackgroundJobStatusFinishWorkerEvent
- (NSString)worker;
- (id)statusDump;
- (void)setWorker:(id)a3;
@end

@implementation PLBackgroundJobStatusFinishWorkerEvent

- (void).cxx_destruct
{
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
  v8.super_class = (Class)PLBackgroundJobStatusFinishWorkerEvent;
  v4 = [(PLBackgroundJobStatusEvent *)&v8 statusDump];
  v5 = [(PLBackgroundJobStatusFinishWorkerEvent *)self worker];
  v6 = [v3 stringWithFormat:@"%@ - %@ finished running jobs\n", v4, v5];

  return v6;
}

@end