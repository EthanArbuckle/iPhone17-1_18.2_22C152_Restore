@interface PBBridgeCAReporter
+ (id)_orientationHumanReadable:(int64_t)a3;
+ (id)_pairingStyle:(int64_t)a3;
+ (id)_reportingPlatform;
+ (id)_wristChoiceHumanReadable:(int64_t)a3;
+ (id)descriptionForCommTimingType:(unint64_t)a3;
+ (id)descriptionForSuccessType:(unint64_t)a3;
+ (id)descriptionForTimingType:(unint64_t)a3;
+ (id)stringForSigninEventDaily:(unint64_t)a3;
+ (id)stringForSigninEventPostPair:(unint64_t)a3;
+ (id)stringForSigninFollowup:(unint64_t)a3;
+ (id)stringForSigninPair:(unint64_t)a3;
+ (void)activationServerRespondedAtPage:(unint64_t)a3;
+ (void)incrementSuccessType:(unint64_t)a3;
+ (void)pushCommunicationTimingType:(unint64_t)a3 withValue:(double)a4;
+ (void)pushTimingForTypeNamed:(id)a3 withValue:(double)a4;
+ (void)pushTimingType:(unint64_t)a3 withValue:(double)a4;
+ (void)recordAllWatchesDetailButtonVisit:(BOOL)a3;
+ (void)recordAlreadyPairedAlertFired:(BOOL)a3 afterDuration:(double)a4 hasFiredBefore:(BOOL)a5;
+ (void)recordAlreadyPairedAlertFiredAndWatchRecovered:(double)a3;
+ (void)recordAlreadyPairedAlertLearnedMore:(BOOL)a3;
+ (void)recordDeviceEnrollmentResult:(BOOL)a3 retryCount:(unint64_t)a4;
+ (void)recordEndOfLifePhoneAlertPresented:(BOOL)a3;
+ (void)recordEndOfLifePhoneAlertUserResponse:(BOOL)a3;
+ (void)recordMaterial:(unint64_t)a3 andSize:(unint64_t)a4;
+ (void)recordPairingInitiatedDeviceOrientationChoice:(int64_t)a3 pairingSelectionType:(int64_t)a4;
+ (void)recordPairingInitiatedDeviceWristChoice:(int64_t)a3 pairingSelectionType:(int64_t)a4;
+ (void)recordPairingTimeBackupsCount:(unint64_t)a3;
+ (void)recordPasscodeChallenge:(int64_t)a3;
+ (void)recordPasscodeCreatedWithType:(int64_t)a3 wasChallenged:(BOOL)a4;
+ (void)recordSetupAppInstallChoice:(BOOL)a3;
+ (void)recordSigninEventDaily:(unint64_t)a3;
+ (void)recordSigninEventFollowup:(unint64_t)a3;
+ (void)recordSigninEventPair:(unint64_t)a3;
+ (void)recordSigninEventPostPair:(unint64_t)a3;
+ (void)recordTabSelection:(int64_t)a3 classicCount:(unint64_t)a4 tinkerCount:(unint64_t)a5;
+ (void)recordTinkerGuardianAcceptedDiagsAndUsage:(BOOL)a3;
+ (void)recordTransitionedDynamicHelpViewFromType:(int64_t)a3 toType:(int64_t)a4;
+ (void)recordUserAwarenessNotificationDuringSetup;
+ (void)recordUserAwarenessNotificationDuringSetupUserEngaged;
+ (void)recordUserInitiatedDeviceOrientationChange:(int64_t)a3;
+ (void)recordUserInitiatedDeviceWristChange:(int64_t)a3;
+ (void)sendEvent:(id)a3 with:(id)a4;
@end

@implementation PBBridgeCAReporter

+ (void)recordTabSelection:(int64_t)a3 classicCount:(unint64_t)a4 tinkerCount:(unint64_t)a5
{
  v13[3] = *MEMORY[0x263EF8340];
  v12[0] = @"type";
  v8 = [NSNumber numberWithInteger:a3];
  v13[0] = v8;
  v12[1] = @"classicCount";
  v9 = [NSNumber numberWithUnsignedInteger:a4];
  v13[1] = v9;
  v12[2] = @"tinkerCount";
  v10 = [NSNumber numberWithUnsignedInteger:a5];
  v13[2] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];
  [a1 sendEvent:@"com.apple.Bridge.TabViewSelection" with:v11];
}

+ (void)sendEvent:(id)a3 with:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = pbb_shared_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2114;
    id v11 = v6;
    _os_log_impl(&dword_21C445000, v7, OS_LOG_TYPE_DEFAULT, "[PBBridgeCAReporter] Sending event: <%{public}@; %{public}@>",
      (uint8_t *)&v8,
      0x16u);
  }

  AnalyticsSendEvent();
}

+ (id)descriptionForSuccessType:(unint64_t)a3
{
  if (a3 > 0x3A) {
    return &stru_26CC94B60;
  }
  else {
    return off_264400908[a3];
  }
}

+ (void)activationServerRespondedAtPage:(unint64_t)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  v4 = NSString;
  id v5 = PBBuddyControllerDescription(a3);
  id v6 = [v4 stringWithFormat:@"ActivationResponded-%@", v5, @"screen"];
  v9[0] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [a1 sendEvent:@"com.apple.nanobuddy.activationRespond" with:v7];
}

+ (void)incrementSuccessType:(unint64_t)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  id v6 = @"type";
  v4 = +[PBBridgeCAReporter descriptionForSuccessType:a3];
  v7[0] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [a1 sendEvent:@"com.apple.nanobuddy.flow" with:v5];
}

+ (id)descriptionForTimingType:(unint64_t)a3
{
  if (a3 > 0xA) {
    return &stru_26CC94B60;
  }
  else {
    return off_264400AE0[a3];
  }
}

+ (void)pushTimingType:(unint64_t)a3 withValue:(double)a4
{
  id v6 = +[PBBridgeCAReporter descriptionForTimingType:a3];
  [a1 pushTimingForTypeNamed:v6 withValue:a4];
}

+ (void)pushTimingForTypeNamed:(id)a3 withValue:(double)a4
{
  v11[2] = *MEMORY[0x263EF8340];
  v10[0] = @"type";
  v10[1] = @"duration";
  v11[0] = a3;
  id v6 = NSNumber;
  id v7 = a3;
  uint64_t v8 = [v6 numberWithDouble:a4];
  v11[1] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  [a1 sendEvent:@"com.apple.nanobuddy.timing" with:v9];
}

+ (id)descriptionForCommTimingType:(unint64_t)a3
{
  v3 = &stru_26CC94B60;
  if (a3 == 1) {
    v3 = @"OWD";
  }
  if (a3) {
    return v3;
  }
  else {
    return @"RTT";
  }
}

+ (void)pushCommunicationTimingType:(unint64_t)a3 withValue:(double)a4
{
  void v10[2] = *MEMORY[0x263EF8340];
  v9[0] = @"type";
  id v6 = +[PBBridgeCAReporter descriptionForCommTimingType:a3];
  v9[1] = @"duration";
  v10[0] = v6;
  id v7 = [NSNumber numberWithDouble:a4];
  v10[1] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  [a1 sendEvent:@"com.apple.nanobuddy.comm.timing" with:v8];
}

+ (id)stringForSigninPair:(unint64_t)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Not handled %lu", a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_264400B38[a3];
  }
  return v3;
}

+ (void)recordSigninEventPair:(unint64_t)a3
{
  void v7[2] = *MEMORY[0x263EF8340];
  v6[0] = @"type";
  v6[1] = @"value";
  v7[0] = @"pair";
  v4 = [a1 stringForSigninPair:a3];
  v7[1] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  [a1 sendEvent:@"com.apple.nanobuddy.signin" with:v5];
}

+ (id)stringForSigninFollowup:(unint64_t)a3
{
  if (a3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Not handled %lu", a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = @"NoSignin";
  }
  return v4;
}

+ (void)recordSigninEventFollowup:(unint64_t)a3
{
  void v7[2] = *MEMORY[0x263EF8340];
  v6[0] = @"type";
  v6[1] = @"value";
  v7[0] = @"followup";
  v4 = [a1 stringForSigninFollowup:a3];
  v7[1] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  [a1 sendEvent:@"com.apple.nanobuddy.signin" with:v5];
}

+ (id)stringForSigninEventDaily:(unint64_t)a3
{
  if (a3 == 1)
  {
    v4 = @"SignedIn";
  }
  else if (a3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Not handled %lu", a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = @"NotSignedIn";
  }
  return v4;
}

+ (void)recordSigninEventDaily:(unint64_t)a3
{
  void v7[2] = *MEMORY[0x263EF8340];
  v6[0] = @"type";
  v6[1] = @"value";
  v7[0] = @"daily";
  v4 = [a1 stringForSigninEventDaily:a3];
  v7[1] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  [a1 sendEvent:@"com.apple.nanobuddy.signin" with:v5];
}

+ (id)stringForSigninEventPostPair:(unint64_t)a3
{
  if (a3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Not handled %lu", a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = @"SignedIn";
  }
  return v4;
}

+ (void)recordSigninEventPostPair:(unint64_t)a3
{
  void v7[2] = *MEMORY[0x263EF8340];
  v6[0] = @"type";
  v6[1] = @"value";
  v7[0] = @"postpair";
  v4 = [a1 stringForSigninEventPostPair:a3];
  v7[1] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  [a1 sendEvent:@"com.apple.nanobuddy.signin" with:v5];
}

+ (void)recordAlreadyPairedAlertFired:(BOOL)a3 afterDuration:(double)a4 hasFiredBefore:(BOOL)a5
{
  BOOL v5 = a5;
  v13[3] = *MEMORY[0x263EF8340];
  v12[0] = @"AlreadyPairedAlertFired";
  uint64_t v8 = [NSNumber numberWithBool:a3];
  v13[0] = v8;
  v12[1] = @"DetectionDuration";
  id v9 = [NSNumber numberWithDouble:a4];
  v13[1] = v9;
  v12[2] = @"HasFiredBefore";
  __int16 v10 = [NSNumber numberWithBool:v5];
  v13[2] = v10;
  id v11 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];
  [a1 sendEvent:@"com.apple.Bridge.AlreadyPairedAlert.Fired" with:v11];
}

+ (void)recordAlreadyPairedAlertLearnedMore:(BOOL)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  id v6 = @"LearnMoreChoice";
  v4 = [NSNumber numberWithBool:a3];
  v7[0] = v4;
  BOOL v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [a1 sendEvent:@"com.apple.Bridge.AlreadyPairedAlert.Response" with:v5];
}

+ (void)recordAlreadyPairedAlertFiredAndWatchRecovered:(double)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  id v6 = @"RecoveryInterval";
  v4 = [NSNumber numberWithDouble:a3];
  v7[0] = v4;
  BOOL v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [a1 sendEvent:@"com.apple.Bridge.AlreadyPairedAlert.Recovered" with:v5];
}

+ (void)recordEndOfLifePhoneAlertPresented:(BOOL)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  id v6 = @"EOLType";
  v4 = [NSNumber numberWithBool:a3];
  v7[0] = v4;
  BOOL v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [a1 sendEvent:@"com.apple.Bridge.EndOfLifePhoneAlert.Fired" with:v5];
}

+ (void)recordEndOfLifePhoneAlertUserResponse:(BOOL)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  id v6 = @"LearnMoreChoice";
  v4 = [NSNumber numberWithBool:a3];
  v7[0] = v4;
  BOOL v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [a1 sendEvent:@"com.apple.Bridge.EndOfLifePhoneAlert.Response" with:v5];
}

+ (void)recordSetupAppInstallChoice:(BOOL)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  id v6 = @"installAllApps";
  v4 = [NSNumber numberWithBool:a3];
  v7[0] = v4;
  BOOL v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [a1 sendEvent:@"com.apple.Bridge.InstallAppSetup.Response" with:v5];
}

+ (void)recordAllWatchesDetailButtonVisit:(BOOL)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  id v6 = @"PairingType";
  v4 = [NSNumber numberWithInt:a3];
  v7[0] = v4;
  BOOL v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [a1 sendEvent:@"com.apple.Bridge.AllWatchesDetailButtonVisit.Response" with:v5];
}

+ (void)recordUserAwarenessNotificationDuringSetup
{
}

+ (void)recordUserAwarenessNotificationDuringSetupUserEngaged
{
}

+ (void)recordPasscodeCreatedWithType:(int64_t)a3 wasChallenged:(BOOL)a4
{
  BOOL v4 = a4;
  v11[2] = *MEMORY[0x263EF8340];
  v10[0] = @"PasscodeType";
  uint64_t v6 = [NSNumber numberWithInteger:a3];
  id v7 = (void *)v6;
  v10[1] = @"HasBeenChallenged";
  uint64_t v8 = MEMORY[0x263EFFA80];
  if (v4) {
    uint64_t v8 = MEMORY[0x263EFFA88];
  }
  v11[0] = v6;
  v11[1] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  [a1 sendEvent:@"com.apple.Bridge.PasscodeChoice" with:v9];
}

+ (void)recordPasscodeChallenge:(int64_t)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = @"ChallengeType";
  BOOL v4 = [NSNumber numberWithInteger:a3];
  v7[0] = v4;
  BOOL v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [a1 sendEvent:@"com.apple.Bridge.PasscodeChallenge" with:v5];
}

+ (void)recordTransitionedDynamicHelpViewFromType:(int64_t)a3 toType:(int64_t)a4
{
  void v10[2] = *MEMORY[0x263EF8340];
  v9[0] = @"FromType";
  uint64_t v6 = [NSNumber numberWithInteger:a3];
  v9[1] = @"ToType";
  v10[0] = v6;
  id v7 = [NSNumber numberWithInteger:a4];
  v10[1] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  [a1 sendEvent:@"com.apple.Bridge.DynamicHelpTransitioned" with:v8];
}

+ (void)recordTinkerGuardianAcceptedDiagsAndUsage:(BOOL)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  if (a3) {
    uint64_t v4 = MEMORY[0x263EFFA88];
  }
  else {
    uint64_t v4 = MEMORY[0x263EFFA80];
  }
  uint64_t v6 = @"Choice";
  v7[0] = v4;
  BOOL v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [a1 sendEvent:@"com.apple.Bridge.Tinker.DiagsAndUsage" with:v5];
}

+ (void)recordPairingTimeBackupsCount:(unint64_t)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = @"BackupsCount";
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:a3];
  v7[0] = v4;
  BOOL v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [a1 sendEvent:@"com.apple.Bridge.BackupsCount" with:v5];
}

+ (void)recordDeviceEnrollmentResult:(BOOL)a3 retryCount:(unint64_t)a4
{
  void v10[2] = *MEMORY[0x263EF8340];
  v9[0] = @"EnrollmentResult";
  uint64_t v6 = [NSNumber numberWithBool:a3];
  v9[1] = @"EnrollmentRetryCount";
  v10[0] = v6;
  id v7 = [NSNumber numberWithUnsignedInteger:a4];
  v10[1] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  [a1 sendEvent:@"com.apple.Bridge.DeviceEnrollment" with:v8];
}

+ (id)_reportingPlatform
{
  return @"iOS";
}

+ (id)_orientationHumanReadable:(int64_t)a3
{
  uint64_t v3 = @"UnsetCrown";
  if (a3 == 2) {
    uint64_t v3 = @"CrownOnLeft";
  }
  if (a3 == 1) {
    return @"CrownOnRight";
  }
  else {
    return v3;
  }
}

+ (id)_wristChoiceHumanReadable:(int64_t)a3
{
  uint64_t v3 = @"UnsetHand";
  if (a3 == 2) {
    uint64_t v3 = @"RightHand";
  }
  if (a3 == 1) {
    return @"LeftHand";
  }
  else {
    return v3;
  }
}

+ (void)recordUserInitiatedDeviceOrientationChange:(int64_t)a3
{
  v8[2] = *MEMORY[0x263EF8340];
  v7[0] = @"DeviceOrientation";
  uint64_t v4 = [a1 _orientationHumanReadable:a3];
  v7[1] = @"SettingsPlatform";
  v8[0] = v4;
  BOOL v5 = [a1 _reportingPlatform];
  v8[1] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  [a1 sendEvent:@"com.apple.Bridge.UserInitiatedDeviceOrientationChange" with:v6];
}

+ (void)recordUserInitiatedDeviceWristChange:(int64_t)a3
{
  v8[2] = *MEMORY[0x263EF8340];
  v7[0] = @"WristChoice";
  uint64_t v4 = [a1 _wristChoiceHumanReadable:a3];
  v7[1] = @"SettingsPlatform";
  v8[0] = v4;
  BOOL v5 = [a1 _reportingPlatform];
  v8[1] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  [a1 sendEvent:@"com.apple.Bridge.UserInitiatedDeviceWristChange" with:v6];
}

+ (id)_pairingStyle:(int64_t)a3
{
  uint64_t v3 = @"PairingUnset";
  if (a3 == 2) {
    uint64_t v3 = @"PairingAutomatic";
  }
  if (a3 == 1) {
    return @"PairingManual";
  }
  else {
    return v3;
  }
}

+ (void)recordPairingInitiatedDeviceOrientationChoice:(int64_t)a3 pairingSelectionType:(int64_t)a4
{
  void v10[2] = *MEMORY[0x263EF8340];
  v9[0] = @"DeviceOrientation";
  uint64_t v6 = [a1 _orientationHumanReadable:a3];
  v9[1] = @"SettingsPlatform";
  v10[0] = v6;
  id v7 = [a1 _pairingStyle:a4];
  v10[1] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  [a1 sendEvent:@"com.apple.Bridge.UserInitiatedDeviceOrientationChange" with:v8];
}

+ (void)recordPairingInitiatedDeviceWristChoice:(int64_t)a3 pairingSelectionType:(int64_t)a4
{
  void v10[2] = *MEMORY[0x263EF8340];
  v9[0] = @"WristChoice";
  uint64_t v6 = [a1 _wristChoiceHumanReadable:a3];
  v9[1] = @"SettingsPlatform";
  v10[0] = v6;
  id v7 = [a1 _pairingStyle:a4];
  v10[1] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  [a1 sendEvent:@"com.apple.Bridge.UserInitiatedDeviceWristChange" with:v8];
}

+ (void)recordMaterial:(unint64_t)a3 andSize:(unint64_t)a4
{
  void v10[2] = *MEMORY[0x263EF8340];
  v9[0] = @"Material";
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:a3];
  v9[1] = @"Size";
  v10[0] = v6;
  id v7 = [NSNumber numberWithUnsignedInteger:a4];
  v10[1] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  [a1 sendEvent:@"com.apple.Bridge.MaterialDetails" with:v8];
}

@end