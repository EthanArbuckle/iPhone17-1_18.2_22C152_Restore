@interface MNNavigationTraceInfo
- (NSString)pedestrianTracePath;
- (double)pedestrianTraceStartRelativeTimestamp;
- (void)setPedestrianTracePath:(id)a3;
- (void)setPedestrianTraceStartRelativeTimestamp:(double)a3;
@end

@implementation MNNavigationTraceInfo

- (NSString)pedestrianTracePath
{
  return self->_pedestrianTracePath;
}

- (void)setPedestrianTracePath:(id)a3
{
}

- (double)pedestrianTraceStartRelativeTimestamp
{
  return self->_pedestrianTraceStartRelativeTimestamp;
}

- (void)setPedestrianTraceStartRelativeTimestamp:(double)a3
{
  self->_pedestrianTraceStartRelativeTimestamp = a3;
}

- (void).cxx_destruct
{
}

@end