@interface HKSPSleepScheduleRange
- (BOOL)earliestBedtimeIsOnPreviousDay;
- (HKSPSleepScheduleRange)initWithLatestWakeUpComponents:(id)a3 latestBedtimeComponents:(id)a4 earliestWakeUpComponents:(id)a5 earliestBedtimeComponents:(id)a6 earliestBedtimeIsOnPreviousDay:(BOOL)a7;
- (NSDateComponents)earliestBedtimeComponents;
- (NSDateComponents)earliestWakeUpComponents;
- (NSDateComponents)latestBedtimeComponents;
- (NSDateComponents)latestWakeUpComponents;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
@end

@implementation HKSPSleepScheduleRange

- (HKSPSleepScheduleRange)initWithLatestWakeUpComponents:(id)a3 latestBedtimeComponents:(id)a4 earliestWakeUpComponents:(id)a5 earliestBedtimeComponents:(id)a6 earliestBedtimeIsOnPreviousDay:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v27.receiver = self;
  v27.super_class = (Class)HKSPSleepScheduleRange;
  v16 = [(HKSPSleepScheduleRange *)&v27 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    latestWakeUpComponents = v16->_latestWakeUpComponents;
    v16->_latestWakeUpComponents = (NSDateComponents *)v17;

    uint64_t v19 = [v13 copy];
    latestBedtimeComponents = v16->_latestBedtimeComponents;
    v16->_latestBedtimeComponents = (NSDateComponents *)v19;

    uint64_t v21 = [v14 copy];
    earliestWakeUpComponents = v16->_earliestWakeUpComponents;
    v16->_earliestWakeUpComponents = (NSDateComponents *)v21;

    uint64_t v23 = [v15 copy];
    earliestBedtimeComponents = v16->_earliestBedtimeComponents;
    v16->_earliestBedtimeComponents = (NSDateComponents *)v23;

    v16->_earliestBedtimeIsOnPreviousDay = a7;
    v25 = v16;
  }

  return v16;
}

- (id)succinctDescription
{
  v2 = [(HKSPSleepScheduleRange *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v15 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v3 = NSString;
  v4 = [(HKSPSleepScheduleRange *)self earliestBedtimeComponents];
  v5 = objc_msgSend(v4, "hksp_description");
  if ([(HKSPSleepScheduleRange *)self earliestBedtimeIsOnPreviousDay]) {
    v6 = @"(-1)";
  }
  else {
    v6 = &stru_1EFE54160;
  }
  v7 = [(HKSPSleepScheduleRange *)self earliestWakeUpComponents];
  v8 = objc_msgSend(v7, "hksp_description");
  v9 = [(HKSPSleepScheduleRange *)self latestBedtimeComponents];
  v10 = objc_msgSend(v9, "hksp_description");
  v11 = [(HKSPSleepScheduleRange *)self latestWakeUpComponents];
  id v12 = objc_msgSend(v11, "hksp_description");
  id v13 = [v3 stringWithFormat:@"[%@%@ - %@] - [%@ - %@]", v5, v6, v8, v10, v12];
  [v15 appendString:v13 withName:@"range"];

  return v15;
}

- (NSDateComponents)latestWakeUpComponents
{
  return self->_latestWakeUpComponents;
}

- (NSDateComponents)earliestWakeUpComponents
{
  return self->_earliestWakeUpComponents;
}

- (NSDateComponents)latestBedtimeComponents
{
  return self->_latestBedtimeComponents;
}

- (NSDateComponents)earliestBedtimeComponents
{
  return self->_earliestBedtimeComponents;
}

- (BOOL)earliestBedtimeIsOnPreviousDay
{
  return self->_earliestBedtimeIsOnPreviousDay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_earliestBedtimeComponents, 0);
  objc_storeStrong((id *)&self->_latestBedtimeComponents, 0);
  objc_storeStrong((id *)&self->_earliestWakeUpComponents, 0);
  objc_storeStrong((id *)&self->_latestWakeUpComponents, 0);
}

@end