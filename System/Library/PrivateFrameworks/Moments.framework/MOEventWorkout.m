@interface MOEventWorkout
+ (BOOL)supportsSecureCoding;
- (BOOL)isFitnessPlusSession;
- (BOOL)isIndoors;
- (CLLocation)workoutLocationStart;
- (MOEventWorkout)init;
- (MOEventWorkout)initWithCoder:(id)a3;
- (NSArray)workoutLocationRoute;
- (NSNumber)workoutDuration;
- (NSNumber)workoutTotalDistance;
- (NSNumber)workoutTotalEnergyBurned;
- (NSString)workoutType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setIsFitnessPlusSession:(BOOL)a3;
- (void)setIsIndoors:(BOOL)a3;
- (void)setWorkoutDuration:(id)a3;
- (void)setWorkoutLocationRoute:(id)a3;
- (void)setWorkoutLocationStart:(id)a3;
- (void)setWorkoutTotalDistance:(id)a3;
- (void)setWorkoutTotalEnergyBurned:(id)a3;
- (void)setWorkoutType:(id)a3;
@end

@implementation MOEventWorkout

- (MOEventWorkout)init
{
  v3.receiver = self;
  v3.super_class = (Class)MOEventWorkout;
  result = [(MOEventWorkout *)&v3 init];
  if (result) {
    *(_WORD *)&result->_isFitnessPlusSession = 0;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  workoutType = self->_workoutType;
  id v5 = a3;
  [v5 encodeObject:workoutType forKey:@"workoutType"];
  [v5 encodeObject:self->_workoutTotalDistance forKey:@"workoutTotalDistance"];
  [v5 encodeObject:self->_workoutTotalEnergyBurned forKey:@"workoutTotalEnergyBurned"];
  [v5 encodeObject:self->_workoutDuration forKey:@"workoutDuration"];
  [v5 encodeObject:self->_workoutLocationStart forKey:@"workoutLocationStart"];
  [v5 encodeObject:self->_workoutLocationRoute forKey:@"workoutLocationRoute"];
  [v5 encodeBool:self->_isFitnessPlusSession forKey:@"isFitnessPlusSession"];
  [v5 encodeBool:self->_isIndoors forKey:@"isIndoors"];
}

- (MOEventWorkout)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MOEventWorkout;
  id v5 = [(MOEventWorkout *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"workoutType"];
    workoutType = v5->_workoutType;
    v5->_workoutType = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"workoutTotalDistance"];
    workoutTotalDistance = v5->_workoutTotalDistance;
    v5->_workoutTotalDistance = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"workoutTotalEnergyBurned"];
    workoutTotalEnergyBurned = v5->_workoutTotalEnergyBurned;
    v5->_workoutTotalEnergyBurned = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"workoutDuration"];
    workoutDuration = v5->_workoutDuration;
    v5->_workoutDuration = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"workoutLocationStart"];
    workoutLocationStart = v5->_workoutLocationStart;
    v5->_workoutLocationStart = (CLLocation *)v14;

    v16 = (void *)MEMORY[0x1D26065F0]();
    id v17 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v18 = objc_opt_class();
    v19 = objc_msgSend(v17, "initWithObjects:", v18, objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"workoutLocationRoute"];
    workoutLocationRoute = v5->_workoutLocationRoute;
    v5->_workoutLocationRoute = (NSArray *)v20;

    v5->_isFitnessPlusSession = [v4 decodeBoolForKey:@"isFitnessPlusSession"];
    v5->_isIndoors = [v4 decodeBoolForKey:@"isIndoors"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(MOEventWorkout);
  objc_storeStrong((id *)&v4->_workoutType, self->_workoutType);
  objc_storeStrong((id *)&v4->_workoutTotalDistance, self->_workoutTotalDistance);
  objc_storeStrong((id *)&v4->_workoutTotalEnergyBurned, self->_workoutTotalEnergyBurned);
  objc_storeStrong((id *)&v4->_workoutDuration, self->_workoutDuration);
  objc_storeStrong((id *)&v4->_workoutLocationStart, self->_workoutLocationStart);
  objc_storeStrong((id *)&v4->_workoutLocationRoute, self->_workoutLocationRoute);
  v4->_isFitnessPlusSession = self->_isFitnessPlusSession;
  v4->_isIndoors = self->_isIndoors;
  return v4;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"workoutType, %@", self->_workoutType];
  return v2;
}

- (NSString)workoutType
{
  return self->_workoutType;
}

- (void)setWorkoutType:(id)a3
{
}

- (NSNumber)workoutTotalDistance
{
  return self->_workoutTotalDistance;
}

- (void)setWorkoutTotalDistance:(id)a3
{
}

- (NSNumber)workoutTotalEnergyBurned
{
  return self->_workoutTotalEnergyBurned;
}

- (void)setWorkoutTotalEnergyBurned:(id)a3
{
}

- (NSNumber)workoutDuration
{
  return self->_workoutDuration;
}

- (void)setWorkoutDuration:(id)a3
{
}

- (CLLocation)workoutLocationStart
{
  return self->_workoutLocationStart;
}

- (void)setWorkoutLocationStart:(id)a3
{
}

- (NSArray)workoutLocationRoute
{
  return self->_workoutLocationRoute;
}

- (void)setWorkoutLocationRoute:(id)a3
{
}

- (BOOL)isFitnessPlusSession
{
  return self->_isFitnessPlusSession;
}

- (void)setIsFitnessPlusSession:(BOOL)a3
{
  self->_isFitnessPlusSession = a3;
}

- (BOOL)isIndoors
{
  return self->_isIndoors;
}

- (void)setIsIndoors:(BOOL)a3
{
  self->_isIndoors = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutLocationRoute, 0);
  objc_storeStrong((id *)&self->_workoutLocationStart, 0);
  objc_storeStrong((id *)&self->_workoutDuration, 0);
  objc_storeStrong((id *)&self->_workoutTotalEnergyBurned, 0);
  objc_storeStrong((id *)&self->_workoutTotalDistance, 0);
  objc_storeStrong((id *)&self->_workoutType, 0);
}

@end