@interface SBSoundDefaults
- (void)_bindAndRegisterDefaults;
@end

@implementation SBSoundDefaults

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"ringerMuted"];
  uint64_t v4 = MEMORY[0x1E4F1CC28];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SBRingerMuted" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];

  v5 = [NSString stringWithUTF8String:"calendarAlarmPath"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v5 withDefaultKey:@"calendar-alarm" toDefaultValue:@"/Applications/MobileCal.app/alarm.aiff" options:1];

  v6 = [NSString stringWithUTF8String:"vibrateWhenSilent"];
  uint64_t v7 = MEMORY[0x1E4F1CC38];
  [(BSAbstractDefaultDomain *)self _bindProperty:v6 withDefaultKey:@"silent-vibrate" toDefaultValue:MEMORY[0x1E4F1CC38] options:1];

  v8 = [NSString stringWithUTF8String:"vibrateWhenRinging"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v8 withDefaultKey:@"ring-vibrate" toDefaultValue:v7 options:1];

  id v9 = [NSString stringWithUTF8String:"playSoundOnDeviceWake"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v9 withDefaultKey:@"SBPlaySoundOnDeviceWake" toDefaultValue:v4 options:1];
}

@end