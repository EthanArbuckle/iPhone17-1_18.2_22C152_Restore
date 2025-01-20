@interface SMCurrentWorkoutSnapshot
+ (BOOL)supportsSecureCoding;
- (BOOL)isFirstPartyWorkout;
- (BOOL)isWorkoutOngoing;
- (NSUUID)sessionIdentifier;
- (SMCurrentWorkoutSnapshot)initWithCoder:(id)a3;
- (SMCurrentWorkoutSnapshot)initWithSessionIdentifier:(id)a3 activityType:(unint64_t)a4 isWorkoutOngoing:(BOOL)a5 isFirstPartyWorkout:(BOOL)a6;
- (unint64_t)activityType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SMCurrentWorkoutSnapshot

- (SMCurrentWorkoutSnapshot)initWithSessionIdentifier:(id)a3 activityType:(unint64_t)a4 isWorkoutOngoing:(BOOL)a5 isFirstPartyWorkout:(BOOL)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SMCurrentWorkoutSnapshot;
  v12 = [(SMCurrentWorkoutSnapshot *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sessionIdentifier, a3);
    v13->_activityType = a4;
    v13->_isWorkoutOngoing = a5;
    v13->_isFirstPartyWorkout = a6;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMCurrentWorkoutSnapshot)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMWorkoutSessionIdentifierKey"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"__kSMWorkoutActivityTypeKey"];
  uint64_t v7 = [v4 decodeBoolForKey:@"__kSMIsWorkoutOngoingKey"];
  uint64_t v8 = [v4 decodeBoolForKey:@"__kSMIsFirstPartyWorkoutKey"];

  v9 = [(SMCurrentWorkoutSnapshot *)self initWithSessionIdentifier:v5 activityType:v6 isWorkoutOngoing:v7 isFirstPartyWorkout:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  sessionIdentifier = self->_sessionIdentifier;
  id v5 = a3;
  [v5 encodeObject:sessionIdentifier forKey:@"__kSMWorkoutSessionIdentifierKey"];
  [v5 encodeInteger:self->_activityType forKey:@"__kSMWorkoutActivityTypeKey"];
  [v5 encodeBool:self->_isWorkoutOngoing forKey:@"__kSMIsWorkoutOngoingKey"];
  [v5 encodeBool:self->_isFirstPartyWorkout forKey:@"__kSMIsFirstPartyWorkoutKey"];
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (unint64_t)activityType
{
  return self->_activityType;
}

- (BOOL)isWorkoutOngoing
{
  return self->_isWorkoutOngoing;
}

- (BOOL)isFirstPartyWorkout
{
  return self->_isFirstPartyWorkout;
}

- (void).cxx_destruct
{
}

@end