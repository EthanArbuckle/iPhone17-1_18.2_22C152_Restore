@interface MOSuggestionAssetWorkoutRoute
+ (BOOL)supportsSecureCoding;
- (HKWorkout)workout;
- (MOSuggestionAssetWorkoutRoute)initWithCoder:(id)a3;
- (NSArray)locationReadings;
- (id)init:(id)a3 workout:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setLocationReadings:(id)a3;
- (void)setWorkout:(id)a3;
@end

@implementation MOSuggestionAssetWorkoutRoute

- (id)init:(id)a3 workout:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MOSuggestionAssetWorkoutRoute;
  v9 = [(MOSuggestionAssetWorkoutRoute *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_locationReadings, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  locationReadings = self->_locationReadings;
  id v5 = a3;
  [v5 encodeObject:locationReadings forKey:@"coderKeyMOSuggestionAssetHKLocationReadings"];
  [v5 encodeObject:self->_workout forKey:@"coderKeyMOSuggestionAssetHKWorkout"];
}

- (MOSuggestionAssetWorkoutRoute)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MOSuggestionAssetWorkoutRoute;
  id v5 = [(MOSuggestionAssetWorkoutRoute *)&v14 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"coderKeyMOSuggestionAssetHKLocationReadings"];
    locationReadings = v5->_locationReadings;
    v5->_locationReadings = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"coderKeyMOSuggestionAssetHKWorkout"];
    workout = v5->_workout;
    v5->_workout = (HKWorkout *)v11;
  }
  return v5;
}

- (NSArray)locationReadings
{
  return self->_locationReadings;
}

- (void)setLocationReadings:(id)a3
{
}

- (HKWorkout)workout
{
  return self->_workout;
}

- (void)setWorkout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workout, 0);
  objc_storeStrong((id *)&self->_locationReadings, 0);
}

@end