@interface SUBProgress
+ (BOOL)supportsSecureCoding;
- (BOOL)isDone;
- (NSString)phase;
- (NSString)taskID;
- (SUBProgress)initWithCoder:(id)a3;
- (double)estimatedTimeRemaining;
- (float)portionComplete;
- (id)copy;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setEstimatedTimeRemaining:(double)a3;
- (void)setIsDone:(BOOL)a3;
- (void)setPhase:(id)a3;
- (void)setPortionComplete:(float)a3;
- (void)setTaskID:(id)a3;
@end

@implementation SUBProgress

- (SUBProgress)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUBProgress;
  v5 = [(SUBProgress *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phase"];
    phase = v5->_phase;
    v5->_phase = (NSString *)v6;

    [v4 decodeFloatForKey:@"portionComplete"];
    v5->_portionComplete = v8;
    [v4 decodeFloatForKey:@"estimatedTimeRemaining"];
    v5->_estimatedTimeRemaining = v9;
    v5->_isDone = [v4 decodeBoolForKey:@"isDone"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"taskID"];
    taskID = v5->_taskID;
    v5->_taskID = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  phase = self->_phase;
  id v7 = a3;
  [v7 encodeObject:phase forKey:@"phase"];
  *(float *)&double v5 = self->_portionComplete;
  [v7 encodeFloat:@"portionComplete" forKey:v5];
  double estimatedTimeRemaining = self->_estimatedTimeRemaining;
  *(float *)&double estimatedTimeRemaining = estimatedTimeRemaining;
  [v7 encodeFloat:@"estimatedTimeRemaining" forKey:estimatedTimeRemaining];
  [v7 encodeBool:self->_isDone forKey:@"isDone"];
  [v7 encodeObject:self->_taskID forKey:@"taskID"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Phase: %@\nPortion complete: %f\nEstimated time remaining: %f TaskID: %@", self->_phase, self->_portionComplete, *(void *)&self->_estimatedTimeRemaining, self->_taskID];
}

- (id)copy
{
  v2 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  v3 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:0];

  return v3;
}

- (NSString)phase
{
  return self->_phase;
}

- (void)setPhase:(id)a3
{
}

- (float)portionComplete
{
  return self->_portionComplete;
}

- (void)setPortionComplete:(float)a3
{
  self->_portionComplete = a3;
}

- (double)estimatedTimeRemaining
{
  return self->_estimatedTimeRemaining;
}

- (void)setEstimatedTimeRemaining:(double)a3
{
  self->_double estimatedTimeRemaining = a3;
}

- (BOOL)isDone
{
  return self->_isDone;
}

- (void)setIsDone:(BOOL)a3
{
  self->_isDone = a3;
}

- (NSString)taskID
{
  return self->_taskID;
}

- (void)setTaskID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskID, 0);
  objc_storeStrong((id *)&self->_phase, 0);
}

@end