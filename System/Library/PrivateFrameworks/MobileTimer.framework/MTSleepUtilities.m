@interface MTSleepUtilities
+ (id)alarmFromSleepOccurrence:(id)a3 scheduleEnabled:(BOOL)a4 keepOffUntilDate:(id)a5;
+ (unint64_t)alarmRepeatScheduleFrom:(unint64_t)a3;
@end

@implementation MTSleepUtilities

+ (id)alarmFromSleepOccurrence:(id)a3 scheduleEnabled:(BOOL)a4 keepOffUntilDate:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = +[MTAlarm sleepAlarmWithSchedule:](MTMutableAlarm, "sleepAlarmWithSchedule:", objc_msgSend(a1, "alarmRepeatScheduleFrom:", objc_msgSend(v8, "weekdays")));
  v11 = [v8 bedtimeComponents];
  objc_msgSend(v10, "setBedtimeHour:", objc_msgSend(v11, "hour"));

  v12 = [v8 bedtimeComponents];
  objc_msgSend(v10, "setBedtimeMinute:", objc_msgSend(v12, "minute"));

  v13 = [v8 wakeUpComponents];
  objc_msgSend(v10, "setHour:", objc_msgSend(v13, "hour"));

  v14 = [v8 wakeUpComponents];
  objc_msgSend(v10, "setMinute:", objc_msgSend(v14, "minute"));

  if ([v8 isSingleDayOverride])
  {
    v15 = [v8 wakeUpComponents];
    objc_msgSend(v10, "setDay:", objc_msgSend(v15, "day"));

    v16 = [v8 wakeUpComponents];
    objc_msgSend(v10, "setMonth:", objc_msgSend(v16, "month"));

    v17 = [v8 wakeUpComponents];
    objc_msgSend(v10, "setYear:", objc_msgSend(v17, "year"));
  }
  if (a4)
  {
    v18 = [v8 alarmConfiguration];
    objc_msgSend(v10, "setEnabled:", objc_msgSend(v18, "isEnabled"));
  }
  else
  {
    [v10 setEnabled:0];
  }
  v19 = [v8 alarmConfiguration];
  v20 = [v19 toneIdentifier];
  v21 = [v8 alarmConfiguration];
  v22 = [v21 vibrationIdentifier];
  v23 = [v8 alarmConfiguration];
  v24 = [v23 soundVolume];
  v25 = +[MTSound toneSoundWithIdentifier:v20 vibrationIdentifer:v22 volume:v24];
  [v10 setSound:v25];

  [v10 setBedtimeReminder:0];
  [v10 setBedtimeReminderMinutes:0];
  [v10 setKeepOffUntilDate:v9];

  v26 = [v8 alarmConfiguration];
  objc_msgSend(v10, "setAllowsSnooze:", objc_msgSend(v26, "allowsSnooze"));

  v27 = (void *)[v10 copy];
  return v27;
}

+ (unint64_t)alarmRepeatScheduleFrom:(unint64_t)a3
{
  return a3 & 0x7F;
}

@end