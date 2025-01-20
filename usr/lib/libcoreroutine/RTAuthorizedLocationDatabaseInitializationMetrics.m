@interface RTAuthorizedLocationDatabaseInitializationMetrics
- (RTAuthorizedLocationDatabaseInitializationMetrics)init;
- (int)eraseInstallInitializationAttemptCount;
- (int)eraseInstallInitializationCompletionTimeHours;
- (int)numberOfALOIsGeneratedDuringEraseInstallInitialization;
- (int)numberOfVisitsRegisteredDuringEraseInstallInitialization;
- (void)setEraseInstallInitializationAttemptCount:(int)a3;
- (void)setEraseInstallInitializationCompletionTimeHours:(int)a3;
- (void)setNumberOfALOIsGeneratedDuringEraseInstallInitialization:(int)a3;
- (void)setNumberOfVisitsRegisteredDuringEraseInstallInitialization:(int)a3;
@end

@implementation RTAuthorizedLocationDatabaseInitializationMetrics

- (RTAuthorizedLocationDatabaseInitializationMetrics)init
{
  v3.receiver = self;
  v3.super_class = (Class)RTAuthorizedLocationDatabaseInitializationMetrics;
  result = [(RTAuthorizedLocationDatabaseInitializationMetrics *)&v3 init];
  if (result)
  {
    *(void *)&result->_eraseInstallInitializationAttemptCount = -1;
    *(void *)&result->_numberOfVisitsRegisteredDuringEraseInstallInitialization = -1;
  }
  return result;
}

- (int)eraseInstallInitializationAttemptCount
{
  return self->_eraseInstallInitializationAttemptCount;
}

- (void)setEraseInstallInitializationAttemptCount:(int)a3
{
  self->_eraseInstallInitializationAttemptCount = a3;
}

- (int)eraseInstallInitializationCompletionTimeHours
{
  return self->_eraseInstallInitializationCompletionTimeHours;
}

- (void)setEraseInstallInitializationCompletionTimeHours:(int)a3
{
  self->_eraseInstallInitializationCompletionTimeHours = a3;
}

- (int)numberOfVisitsRegisteredDuringEraseInstallInitialization
{
  return self->_numberOfVisitsRegisteredDuringEraseInstallInitialization;
}

- (void)setNumberOfVisitsRegisteredDuringEraseInstallInitialization:(int)a3
{
  self->_numberOfVisitsRegisteredDuringEraseInstallInitialization = a3;
}

- (int)numberOfALOIsGeneratedDuringEraseInstallInitialization
{
  return self->_numberOfALOIsGeneratedDuringEraseInstallInitialization;
}

- (void)setNumberOfALOIsGeneratedDuringEraseInstallInitialization:(int)a3
{
  self->_numberOfALOIsGeneratedDuringEraseInstallInitialization = a3;
}

@end