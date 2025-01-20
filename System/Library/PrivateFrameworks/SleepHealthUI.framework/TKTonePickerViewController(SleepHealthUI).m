@interface TKTonePickerViewController(SleepHealthUI)
+ (id)hksh_alarmPickerWithToneIdentifier:()SleepHealthUI vibrationIdentifier:styleProvider:;
+ (uint64_t)hksh_alarmPickerWithToneIdentifier:()SleepHealthUI vibrationIdentifier:;
@end

@implementation TKTonePickerViewController(SleepHealthUI)

+ (uint64_t)hksh_alarmPickerWithToneIdentifier:()SleepHealthUI vibrationIdentifier:
{
  return objc_msgSend(a1, "hksh_alarmPickerWithToneIdentifier:vibrationIdentifier:styleProvider:", a3, a4, 0);
}

+ (id)hksh_alarmPickerWithToneIdentifier:()SleepHealthUI vibrationIdentifier:styleProvider:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)[[a1 alloc] _initWithAlertType:13 tableViewStyle:2];
  [v11 setTopic:*MEMORY[0x1E4FAF610]];
  [v11 setShowsNone:0];
  [v11 setShowsVibrations:1];
  v12 = HKSHUILocalizedString(@"SCHEDULE_OCCURRENCE_ALARM_SOUND_TITLE");
  [v11 setTitle:v12];

  if (v8) {
    [v11 setSelectedToneIdentifier:v8];
  }
  if (v9) {
    [v11 setSelectedVibrationIdentifier:v9];
  }
  [v11 setStyleProvider:v10];

  return v11;
}

@end