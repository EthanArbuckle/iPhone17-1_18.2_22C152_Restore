@interface SASRecordingInfo
+ (id)recordingInfo;
- (BOOL)ringerSwitchOff;
- (BOOL)zeroLatencyLaunch;
- (NSNumber)activationAudioAlertDuration;
- (NSNumber)activationAudioAlertStartTime;
- (NSNumber)activationHapticAlertDuration;
- (NSNumber)activationHapticAlertStartTime;
- (NSNumber)activationTime;
- (NSNumber)beamFormingStartTime;
- (NSNumber)buttonDowntime;
- (NSNumber)buttonUpTime;
- (NSString)alertType;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setActivationAudioAlertDuration:(id)a3;
- (void)setActivationAudioAlertStartTime:(id)a3;
- (void)setActivationHapticAlertDuration:(id)a3;
- (void)setActivationHapticAlertStartTime:(id)a3;
- (void)setActivationTime:(id)a3;
- (void)setAlertType:(id)a3;
- (void)setBeamFormingStartTime:(id)a3;
- (void)setButtonDowntime:(id)a3;
- (void)setButtonUpTime:(id)a3;
- (void)setRingerSwitchOff:(BOOL)a3;
- (void)setZeroLatencyLaunch:(BOOL)a3;
@end

@implementation SASRecordingInfo

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"RecordingInfo";
}

+ (id)recordingInfo
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)activationAudioAlertDuration
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"activationAudioAlertDuration"];
}

- (void)setActivationAudioAlertDuration:(id)a3
{
}

- (NSNumber)activationAudioAlertStartTime
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"activationAudioAlertStartTime"];
}

- (void)setActivationAudioAlertStartTime:(id)a3
{
}

- (NSNumber)activationHapticAlertDuration
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"activationHapticAlertDuration"];
}

- (void)setActivationHapticAlertDuration:(id)a3
{
}

- (NSNumber)activationHapticAlertStartTime
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"activationHapticAlertStartTime"];
}

- (void)setActivationHapticAlertStartTime:(id)a3
{
}

- (NSNumber)activationTime
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"activationTime"];
}

- (void)setActivationTime:(id)a3
{
}

- (NSString)alertType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"alertType"];
}

- (void)setAlertType:(id)a3
{
}

- (NSNumber)beamFormingStartTime
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"beamFormingStartTime"];
}

- (void)setBeamFormingStartTime:(id)a3
{
}

- (NSNumber)buttonDowntime
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"buttonDowntime"];
}

- (void)setButtonDowntime:(id)a3
{
}

- (NSNumber)buttonUpTime
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"buttonUpTime"];
}

- (void)setButtonUpTime:(id)a3
{
}

- (BOOL)ringerSwitchOff
{
  return AceObjectBoolForProperty(self, @"ringerSwitchOff");
}

- (void)setRingerSwitchOff:(BOOL)a3
{
}

- (BOOL)zeroLatencyLaunch
{
  return AceObjectBoolForProperty(self, @"zeroLatencyLaunch");
}

- (void)setZeroLatencyLaunch:(BOOL)a3
{
}

@end