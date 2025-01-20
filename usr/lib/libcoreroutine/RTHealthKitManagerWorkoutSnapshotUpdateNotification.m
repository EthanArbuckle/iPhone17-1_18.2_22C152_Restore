@interface RTHealthKitManagerWorkoutSnapshotUpdateNotification
- (RTCurrentWorkoutSnapshot)workoutSnapshot;
- (RTHealthKitManagerWorkoutSnapshotUpdateNotification)initWithWorkoutSnapshot:(id)a3;
@end

@implementation RTHealthKitManagerWorkoutSnapshotUpdateNotification

- (RTHealthKitManagerWorkoutSnapshotUpdateNotification)initWithWorkoutSnapshot:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTHealthKitManagerWorkoutSnapshotUpdateNotification;
  v5 = [(RTNotification *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    workoutSnapshot = v5->_workoutSnapshot;
    v5->_workoutSnapshot = (RTCurrentWorkoutSnapshot *)v6;
  }
  return v5;
}

- (RTCurrentWorkoutSnapshot)workoutSnapshot
{
  return self->_workoutSnapshot;
}

- (void).cxx_destruct
{
}

@end