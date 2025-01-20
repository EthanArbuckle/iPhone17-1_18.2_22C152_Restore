@interface STWorkoutSetStateRequest
+ (BOOL)supportsSecureCoding;
- (STWorkoutSetStateRequest)initWithCoder:(id)a3;
- (id)_initWithState:(int64_t)a3;
- (id)createResponse;
- (int64_t)workoutState;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STWorkoutSetStateRequest

- (STWorkoutSetStateRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)STWorkoutSetStateRequest;
  v5 = [(AFSiriRequest *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_workoutState = [v4 decodeIntegerForKey:@"_workoutState"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STWorkoutSetStateRequest;
  id v4 = a3;
  [(AFSiriRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_workoutState, @"_workoutState", v5.receiver, v5.super_class);
}

- (id)createResponse
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F28620]) _initWithRequest:self];
  return v2;
}

- (int64_t)workoutState
{
  return self->_workoutState;
}

- (id)_initWithState:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STWorkoutSetStateRequest;
  id result = [(AFSiriRequest *)&v5 init];
  if (result) {
    *((void *)result + 5) = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end