@interface HKSPSleepEventTimelineResults
- (BOOL)sleepScheduleInvalid;
- (BOOL)snoozeFireDateNeedsReset;
- (HKSPMutableSleepSchedule)mutableValidSleepSchedule;
- (HKSPSleepEventTimeline)timeline;
- (HKSPSleepEventTimeline)unadjustedTimeline;
- (HKSPSleepSchedule)originalSleepSchedule;
- (HKSPSleepSchedule)validSleepSchedule;
- (unint64_t)sleepScheduleInvalidReason;
- (void)setMutableValidSleepSchedule:(id)a3;
- (void)setOriginalSleepSchedule:(id)a3;
- (void)setSleepScheduleInvalid:(BOOL)a3;
- (void)setSleepScheduleInvalidReason:(unint64_t)a3;
- (void)setSnoozeFireDateNeedsReset:(BOOL)a3;
- (void)setTimeline:(id)a3;
- (void)setUnadjustedTimeline:(id)a3;
@end

@implementation HKSPSleepEventTimelineResults

- (HKSPSleepEventTimeline)timeline
{
  return self->_timeline;
}

- (void)setUnadjustedTimeline:(id)a3
{
}

- (void)setTimeline:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableValidSleepSchedule, 0);
  objc_storeStrong((id *)&self->_originalSleepSchedule, 0);
  objc_storeStrong((id *)&self->_unadjustedTimeline, 0);
  objc_storeStrong((id *)&self->_timeline, 0);
}

- (HKSPSleepSchedule)validSleepSchedule
{
  if (self->_sleepScheduleInvalid) {
    v2 = (HKSPSleepSchedule *)[(HKSPMutableSleepSchedule *)self->_mutableValidSleepSchedule copy];
  }
  else {
    v2 = self->_originalSleepSchedule;
  }
  return v2;
}

- (BOOL)sleepScheduleInvalid
{
  return self->_sleepScheduleInvalid;
}

- (void)setSleepScheduleInvalid:(BOOL)a3
{
  self->_sleepScheduleInvalid = a3;
}

- (unint64_t)sleepScheduleInvalidReason
{
  return self->_sleepScheduleInvalidReason;
}

- (void)setSleepScheduleInvalidReason:(unint64_t)a3
{
  self->_sleepScheduleInvalidReason = a3;
}

- (BOOL)snoozeFireDateNeedsReset
{
  return self->_snoozeFireDateNeedsReset;
}

- (void)setSnoozeFireDateNeedsReset:(BOOL)a3
{
  self->_snoozeFireDateNeedsReset = a3;
}

- (HKSPSleepEventTimeline)unadjustedTimeline
{
  return self->_unadjustedTimeline;
}

- (HKSPSleepSchedule)originalSleepSchedule
{
  return self->_originalSleepSchedule;
}

- (void)setOriginalSleepSchedule:(id)a3
{
}

- (HKSPMutableSleepSchedule)mutableValidSleepSchedule
{
  return self->_mutableValidSleepSchedule;
}

- (void)setMutableValidSleepSchedule:(id)a3
{
}

@end