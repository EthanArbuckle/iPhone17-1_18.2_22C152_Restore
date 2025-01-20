@interface HKSPOverrideOccurrenceGenerationResult
- (BOOL)upcomingOccurrenceWasOverride;
- (BOOL)wasGeneratedFromTemplate;
- (HKSPMutableSleepScheduleOccurrence)overrideOccurrence;
- (void)setOverrideOccurrence:(id)a3;
- (void)setUpcomingOccurrenceWasOverride:(BOOL)a3;
- (void)setWasGeneratedFromTemplate:(BOOL)a3;
@end

@implementation HKSPOverrideOccurrenceGenerationResult

- (HKSPMutableSleepScheduleOccurrence)overrideOccurrence
{
  return self->_overrideOccurrence;
}

- (void)setOverrideOccurrence:(id)a3
{
}

- (BOOL)wasGeneratedFromTemplate
{
  return self->_wasGeneratedFromTemplate;
}

- (void)setWasGeneratedFromTemplate:(BOOL)a3
{
  self->_wasGeneratedFromTemplate = a3;
}

- (BOOL)upcomingOccurrenceWasOverride
{
  return self->_upcomingOccurrenceWasOverride;
}

- (void)setUpcomingOccurrenceWasOverride:(BOOL)a3
{
  self->_upcomingOccurrenceWasOverride = a3;
}

- (void).cxx_destruct
{
}

@end