@interface RTCurrentWorkoutSnapshot
- (BOOL)isFirstPartyWorkout;
- (NSDate)snapshotDate;
- (NSDate)workoutStartDate;
- (NSUUID)sessionIdentifier;
- (RTCurrentWorkoutSnapshot)initWithHKCurrentWorkoutSnapshot:(id)a3;
- (RTCurrentWorkoutSnapshot)initWithSessionIdentifier:(id)a3 activityType:(unint64_t)a4 locationType:(int64_t)a5 swimmingLocationType:(int64_t)a6 isFirstPartyWorkout:(BOOL)a7 sessionState:(unint64_t)a8 workoutStartDate:(id)a9 snapshotDate:(id)a10;
- (id)description;
- (int64_t)locationType;
- (int64_t)swimmingLocationType;
- (unint64_t)activityType;
- (unint64_t)sessionState;
@end

@implementation RTCurrentWorkoutSnapshot

- (RTCurrentWorkoutSnapshot)initWithSessionIdentifier:(id)a3 activityType:(unint64_t)a4 locationType:(int64_t)a5 swimmingLocationType:(int64_t)a6 isFirstPartyWorkout:(BOOL)a7 sessionState:(unint64_t)a8 workoutStartDate:(id)a9 snapshotDate:(id)a10
{
  id v15 = a3;
  id v16 = a9;
  id v17 = a10;
  v23.receiver = self;
  v23.super_class = (Class)RTCurrentWorkoutSnapshot;
  v18 = [(RTCurrentWorkoutSnapshot *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_sessionIdentifier, a3);
    v19->_activityType = a4;
    v19->_locationType = a5;
    v19->_isFirstPartyWorkout = a7;
    v19->_swimmingLocationType = a6;
    v19->_sessionState = a8;
    objc_storeStrong((id *)&v19->_workoutStartDate, a9);
    objc_storeStrong((id *)&v19->_snapshotDate, a10);
  }

  return v19;
}

- (RTCurrentWorkoutSnapshot)initWithHKCurrentWorkoutSnapshot:(id)a3
{
  id v3 = a3;
  id v16 = [v3 sessionIdentifier];
  v4 = [v3 configuration];
  uint64_t v15 = [v4 activityType];
  v5 = [v3 configuration];
  uint64_t v6 = [v5 locationType];
  v7 = [v3 configuration];
  uint64_t v8 = [v7 swimmingLocationType];
  uint64_t v9 = [v3 isFirstPartyWorkout];
  unint64_t v10 = +[RTHealthKitManager RTHealthKitWorkoutSessionStateFromHKWorkoutSessionState:](RTHealthKitManager, "RTHealthKitWorkoutSessionStateFromHKWorkoutSessionState:", [v3 sessionState]);
  v11 = [v3 builderStartDate];
  v12 = [v3 snapshotDate];

  v13 = [(RTCurrentWorkoutSnapshot *)self initWithSessionIdentifier:v16 activityType:v15 locationType:v6 swimmingLocationType:v8 isFirstPartyWorkout:v9 sessionState:v10 workoutStartDate:v11 snapshotDate:v12];
  return v13;
}

- (id)description
{
  id v3 = NSString;
  long long v11 = *(_OWORD *)&self->_sessionIdentifier;
  int64_t locationType = self->_locationType;
  int64_t swimmingLocationType = self->_swimmingLocationType;
  if (self->_isFirstPartyWorkout) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  v7 = +[RTHealthKitManager workoutSessionStateToString:self->_sessionState];
  uint64_t v8 = [(NSDate *)self->_workoutStartDate stringFromDate];
  uint64_t v9 = [v3 stringWithFormat:@"sessionIdentifier, %@, activityType, %lu, locationType, %lu, swimmingLocationType, %lu, isFirstPartyWorkout, %@, sessionState, %@, workoutStartDate, %@", v11, locationType, swimmingLocationType, v6, v7, v8];

  return v9;
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (unint64_t)activityType
{
  return self->_activityType;
}

- (int64_t)locationType
{
  return self->_locationType;
}

- (int64_t)swimmingLocationType
{
  return self->_swimmingLocationType;
}

- (BOOL)isFirstPartyWorkout
{
  return self->_isFirstPartyWorkout;
}

- (unint64_t)sessionState
{
  return self->_sessionState;
}

- (NSDate)workoutStartDate
{
  return self->_workoutStartDate;
}

- (NSDate)snapshotDate
{
  return self->_snapshotDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotDate, 0);
  objc_storeStrong((id *)&self->_workoutStartDate, 0);

  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end