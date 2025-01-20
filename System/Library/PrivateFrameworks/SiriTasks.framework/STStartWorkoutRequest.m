@interface STStartWorkoutRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isOpenGoal;
- (BOOL)skipActivitySetup;
- (STStartWorkoutRequest)initWithCoder:(id)a3;
- (id)_initWithType:(int64_t)a3 location:(int64_t)a4 goal:(id)a5 goalType:(int64_t)a6 userMode:(int64_t)a7 isOpenGoal:(BOOL)a8 skipActivitySetup:(BOOL)a9;
- (id)createResponse;
- (id)workoutGoal;
- (int64_t)activityType;
- (int64_t)goalType;
- (int64_t)locationType;
- (int64_t)userMode;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STStartWorkoutRequest

- (void).cxx_destruct
{
}

- (STStartWorkoutRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)STStartWorkoutRequest;
  v5 = [(AFSiriRequest *)&v10 initWithCoder:v4];
  if (v5)
  {
    v5->_locationType = [v4 decodeIntegerForKey:@"kSTStartWorkoutRequestLocationTypeKey"];
    v5->_activityType = [v4 decodeIntegerForKey:@"kSTStartWorkoutRequestActivityTypeKey"];
    v5->_userMode = [v4 decodeIntegerForKey:@"kSTStartWorkoutRequestUserModeTypeKey"];
    v5->_goalType = [v4 decodeIntegerForKey:@"kSTStartWorkoutRequestGoalTypeKey"];
    id HKQuantityClass = getHKQuantityClass();
    if (HKQuantityClass)
    {
      uint64_t v7 = [v4 decodeObjectOfClass:HKQuantityClass forKey:@"kSTStartWorkoutRequestGoalKey"];
      goal = v5->_goal;
      v5->_goal = (HKQuantity *)v7;
    }
    v5->_skipActivitySetup = [v4 decodeBoolForKey:@"kSTStartWorkoutRequestSkipActivitySetupKey"];
    v5->_isOpenGoal = [v4 decodeBoolForKey:@"kSTStartWorkoutRequestIsOpenGoalKey"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STStartWorkoutRequest;
  id v4 = a3;
  [(AFSiriRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_locationType, @"kSTStartWorkoutRequestLocationTypeKey", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_activityType forKey:@"kSTStartWorkoutRequestActivityTypeKey"];
  [v4 encodeInteger:self->_userMode forKey:@"kSTStartWorkoutRequestUserModeTypeKey"];
  [v4 encodeInteger:self->_goalType forKey:@"kSTStartWorkoutRequestGoalTypeKey"];
  [v4 encodeObject:self->_goal forKey:@"kSTStartWorkoutRequestGoalKey"];
  [v4 encodeBool:self->_skipActivitySetup forKey:@"kSTStartWorkoutRequestSkipActivitySetupKey"];
  [v4 encodeBool:self->_isOpenGoal forKey:@"kSTStartWorkoutRequestIsOpenGoalKey"];
}

- (id)createResponse
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F28620]) _initWithRequest:self];
  return v2;
}

- (BOOL)isOpenGoal
{
  return self->_isOpenGoal;
}

- (BOOL)skipActivitySetup
{
  return self->_skipActivitySetup;
}

- (id)workoutGoal
{
  return self->_goal;
}

- (int64_t)goalType
{
  return self->_goalType;
}

- (int64_t)userMode
{
  return self->_userMode;
}

- (int64_t)locationType
{
  return self->_locationType;
}

- (int64_t)activityType
{
  return self->_activityType;
}

- (id)_initWithType:(int64_t)a3 location:(int64_t)a4 goal:(id)a5 goalType:(int64_t)a6 userMode:(int64_t)a7 isOpenGoal:(BOOL)a8 skipActivitySetup:(BOOL)a9
{
  id v16 = a5;
  v19.receiver = self;
  v19.super_class = (Class)STStartWorkoutRequest;
  v17 = [(AFSiriRequest *)&v19 init];
  if (v17)
  {
    initHKQuantity();
    v17->_activityType = a3;
    v17->_locationType = a4;
    v17->_userMode = a7;
    objc_storeStrong((id *)&v17->_goal, a5);
    v17->_goalType = a6;
    v17->_isOpenGoal = a8;
    v17->_skipActivitySetup = a9;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end