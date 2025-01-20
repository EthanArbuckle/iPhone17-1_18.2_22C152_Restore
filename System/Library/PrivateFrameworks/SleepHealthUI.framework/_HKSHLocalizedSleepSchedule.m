@interface _HKSHLocalizedSleepSchedule
- (BOOL)isEqual:(id)a3;
- (NSAttributedString)localizedBedTime;
- (NSAttributedString)localizedWakeTime;
- (_HKSHLocalizedSleepSchedule)initWithSleepSchedule:(id)a3 calendar:(id)a4 dayStart:(id)a5 timeFont:(id)a6 amPmFont:(id)a7;
- (unint64_t)hash;
@end

@implementation _HKSHLocalizedSleepSchedule

- (_HKSHLocalizedSleepSchedule)initWithSleepSchedule:(id)a3 calendar:(id)a4 dayStart:(id)a5 timeFont:(id)a6 amPmFont:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)_HKSHLocalizedSleepSchedule;
  v17 = [(_HKSHLocalizedSleepSchedule *)&v25 init];
  if (v17)
  {
    v18 = [v12 bedTimeComponents];
    uint64_t v19 = HKSHLocalizedTimeForComponents((uint64_t)v18, v13, (uint64_t)v14, v15, v16);
    localizedBedTime = v17->_localizedBedTime;
    v17->_localizedBedTime = (NSAttributedString *)v19;

    v21 = [v12 wakeTimeComponents];
    uint64_t v22 = HKSHLocalizedTimeForComponents((uint64_t)v21, v13, (uint64_t)v14, v15, v16);
    localizedWakeTime = v17->_localizedWakeTime;
    v17->_localizedWakeTime = (NSAttributedString *)v22;
  }
  return v17;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_HKSHLocalizedSleepSchedule *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = [(_HKSHLocalizedSleepSchedule *)self localizedBedTime];
    v8 = [(_HKSHLocalizedSleepSchedule *)v6 localizedBedTime];
    if ([v7 isEqualToAttributedString:v8])
    {
      v9 = [(_HKSHLocalizedSleepSchedule *)self localizedWakeTime];
      v10 = [(_HKSHLocalizedSleepSchedule *)v6 localizedWakeTime];
      char v11 = [v9 isEqualToAttributedString:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = [(_HKSHLocalizedSleepSchedule *)self localizedBedTime];
  uint64_t v4 = [v3 hash];
  v5 = [(_HKSHLocalizedSleepSchedule *)self localizedWakeTime];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (NSAttributedString)localizedBedTime
{
  return self->_localizedBedTime;
}

- (NSAttributedString)localizedWakeTime
{
  return self->_localizedWakeTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedWakeTime, 0);
  objc_storeStrong((id *)&self->_localizedBedTime, 0);
}

@end