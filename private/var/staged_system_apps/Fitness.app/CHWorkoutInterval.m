@interface CHWorkoutInterval
- (BOOL)wasSuccessful;
- (NSString)stepKeyPath;
- (id)description;
- (void)setStepKeyPath:(id)a3;
- (void)setWasSuccessful:(BOOL)a3;
@end

@implementation CHWorkoutInterval

- (id)description
{
  v13.receiver = self;
  v13.super_class = (Class)CHWorkoutInterval;
  v3 = [(CHWorkoutSegment *)&v13 description];
  [(CHWorkoutSegment *)self elapsedTime];
  v5 = +[NSNumber numberWithDouble:v4 / 60.0];
  v6 = +[HKUnit kilocalorieUnit];
  v7 = [(CHWorkoutSegment *)self formattedActiveEnergyValueForUnit:v6];
  v8 = +[HKUnit mileUnit];
  v9 = [(CHWorkoutSegment *)self formattedDistanceValueForUnit:v8];
  v10 = [(CHWorkoutInterval *)self stepKeyPath];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"(INTERVAL) %@: Duration: %@ min; Energy: %@; Distance: %@; KeyPath: %@; Success: %i",
    v3,
    v5,
    v7,
    v9,
    v10,
  v11 = [(CHWorkoutInterval *)self wasSuccessful]);

  return v11;
}

- (NSString)stepKeyPath
{
  return self->_stepKeyPath;
}

- (void)setStepKeyPath:(id)a3
{
}

- (BOOL)wasSuccessful
{
  return self->_wasSuccessful;
}

- (void)setWasSuccessful:(BOOL)a3
{
  self->_wasSuccessful = a3;
}

- (void).cxx_destruct
{
}

@end