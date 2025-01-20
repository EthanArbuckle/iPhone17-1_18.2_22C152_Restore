@interface WBSCyclerStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)isConnectedToTestTarget;
- (BOOL)isRunning;
- (NSString)activeTestSuiteName;
- (WBSCyclerStatus)init;
- (WBSCyclerStatus)initWithActiveTestSuiteName:(id)a3 seed:(unint64_t)a4 isConnectedToTestTarget:(BOOL)a5 isRunning:(BOOL)a6 iterationCount:(unint64_t)a7 executionTime:(double)a8;
- (WBSCyclerStatus)initWithCoder:(id)a3;
- (double)executionTime;
- (unint64_t)iterationCount;
- (unint64_t)seed;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WBSCyclerStatus

- (WBSCyclerStatus)init
{
  return 0;
}

- (WBSCyclerStatus)initWithActiveTestSuiteName:(id)a3 seed:(unint64_t)a4 isConnectedToTestTarget:(BOOL)a5 isRunning:(BOOL)a6 iterationCount:(unint64_t)a7 executionTime:(double)a8
{
  id v14 = a3;
  v20.receiver = self;
  v20.super_class = (Class)WBSCyclerStatus;
  v15 = [(WBSCyclerStatus *)&v20 init];
  if (v15)
  {
    uint64_t v16 = [v14 copy];
    activeTestSuiteName = v15->_activeTestSuiteName;
    v15->_activeTestSuiteName = (NSString *)v16;

    v15->_connectedToTestTarget = a5;
    v15->_running = a6;
    v15->_seed = a4;
    v15->_iterationCount = a7;
    v15->_executionTime = a8;
    v18 = v15;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSCyclerStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activeTestSuiteName"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"seed"];
  uint64_t v7 = [v4 decodeBoolForKey:@"connectedToTestTarget"];
  uint64_t v8 = [v4 decodeBoolForKey:@"running"];
  uint64_t v9 = [v4 decodeIntegerForKey:@"iterationCount"];
  [v4 decodeDoubleForKey:@"executionTime"];
  double v11 = v10;

  v12 = [(WBSCyclerStatus *)self initWithActiveTestSuiteName:v5 seed:v6 isConnectedToTestTarget:v7 isRunning:v8 iterationCount:v9 executionTime:v11];
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL connectedToTestTarget = self->_connectedToTestTarget;
  id v5 = a3;
  [v5 encodeBool:connectedToTestTarget forKey:@"connectedToTestTarget"];
  [v5 encodeBool:self->_running forKey:@"running"];
  [v5 encodeObject:self->_activeTestSuiteName forKey:@"activeTestSuiteName"];
  [v5 encodeInteger:self->_seed forKey:@"seed"];
  [v5 encodeInteger:self->_iterationCount forKey:@"iterationCount"];
  [v5 encodeDouble:@"executionTime" forKey:self->_executionTime];
}

- (NSString)activeTestSuiteName
{
  return self->_activeTestSuiteName;
}

- (unint64_t)seed
{
  return self->_seed;
}

- (BOOL)isConnectedToTestTarget
{
  return self->_connectedToTestTarget;
}

- (BOOL)isRunning
{
  return self->_running;
}

- (unint64_t)iterationCount
{
  return self->_iterationCount;
}

- (double)executionTime
{
  return self->_executionTime;
}

- (void).cxx_destruct
{
}

@end