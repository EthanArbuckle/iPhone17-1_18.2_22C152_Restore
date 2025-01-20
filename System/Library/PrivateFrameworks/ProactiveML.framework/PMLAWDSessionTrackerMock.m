@interface PMLAWDSessionTrackerMock
- (NSArray)trackedSessions;
- (PMLAWDSessionTrackerMock)initWithModel:(id)a3;
- (void)clearTrackedSessions;
- (void)postMetricId:(unsigned int)a3 message:(id)a4;
@end

@implementation PMLAWDSessionTrackerMock

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedSessions, 0);
  objc_storeStrong((id *)&self->_internalTrackedSessions, 0);
}

- (NSArray)trackedSessions
{
  return self->_trackedSessions;
}

- (void)clearTrackedSessions
{
}

- (void)postMetricId:(unsigned int)a3 message:(id)a4
{
}

- (PMLAWDSessionTrackerMock)initWithModel:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PMLAWDSessionTrackerMock;
  v3 = [(PMLAWDBaseTracker *)&v7 initWithModel:a3];
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    internalTrackedSessions = v3->_internalTrackedSessions;
    v3->_internalTrackedSessions = (NSMutableArray *)v4;

    objc_storeStrong((id *)&v3->_trackedSessions, v3->_internalTrackedSessions);
  }
  return v3;
}

@end