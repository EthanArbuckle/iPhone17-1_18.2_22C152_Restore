@interface SBBestAppSuggestion
- (BOOL)isArrivedAtHomePrediction;
- (BOOL)isArrivedAtWorkPrediction;
- (BOOL)isBluetoothAudioPrediction;
- (BOOL)isBluetoothPrediction;
- (BOOL)isCallContinuitySuggestion;
- (BOOL)isCarPlayPrediction;
- (BOOL)isEligibleForLockScreen;
- (BOOL)isFirstWakePrediction;
- (BOOL)isHandoff;
- (BOOL)isHeadphonesPrediction;
- (BOOL)isLocallyGeneratedSuggestion;
- (BOOL)isLocationBasedSuggestion;
- (BOOL)isLocationPredictionFromSource:(unint64_t)a3;
- (BOOL)isLocationPredictionOfType:(unint64_t)a3;
- (BOOL)isNotificationSuggestion;
- (BOOL)isOpenURLSuggestion;
- (BOOL)isPrediction;
- (BOOL)isSiriSuggestion;
- (BOOL)launchURLRequiresInboxCopy;
- (NSDate)lastUpdateTime;
- (NSString)activityType;
- (NSString)bundleIdentifier;
- (NSString)description;
- (NSString)originatingBundleIdentifier;
- (NSString)originatingDeviceIdentifier;
- (NSString)originatingDeviceName;
- (NSString)originatingDeviceType;
- (NSString)suggestedLocationName;
- (NSURL)launchURL;
- (NSUUID)uniqueIdentifier;
- (id)makeInboxCopyOfLaunchURLToInboxURL:(id)a3;
@end

@implementation SBBestAppSuggestion

- (NSUUID)uniqueIdentifier
{
  return 0;
}

- (NSString)bundleIdentifier
{
  return 0;
}

- (NSString)activityType
{
  return 0;
}

- (NSDate)lastUpdateTime
{
  return 0;
}

- (NSString)originatingDeviceIdentifier
{
  return 0;
}

- (NSString)originatingDeviceName
{
  return 0;
}

- (NSString)originatingDeviceType
{
  return 0;
}

- (NSString)originatingBundleIdentifier
{
  return 0;
}

- (NSURL)launchURL
{
  return 0;
}

- (NSString)suggestedLocationName
{
  return 0;
}

- (BOOL)isNotificationSuggestion
{
  return 0;
}

- (BOOL)isOpenURLSuggestion
{
  return 0;
}

- (BOOL)isCallContinuitySuggestion
{
  return 0;
}

- (BOOL)isLocallyGeneratedSuggestion
{
  return 0;
}

- (BOOL)launchURLRequiresInboxCopy
{
  return 0;
}

- (id)makeInboxCopyOfLaunchURLToInboxURL:(id)a3
{
  return 0;
}

- (BOOL)isSiriSuggestion
{
  v2 = [(SBBestAppSuggestion *)self bundleIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.Siri"];

  return v3;
}

- (BOOL)isLocationBasedSuggestion
{
  return 0;
}

- (BOOL)isEligibleForLockScreen
{
  return 1;
}

- (BOOL)isPrediction
{
  return 0;
}

- (BOOL)isHeadphonesPrediction
{
  return 0;
}

- (BOOL)isBluetoothPrediction
{
  return 0;
}

- (BOOL)isBluetoothAudioPrediction
{
  return 0;
}

- (BOOL)isCarPlayPrediction
{
  return 0;
}

- (BOOL)isFirstWakePrediction
{
  return 0;
}

- (BOOL)isArrivedAtWorkPrediction
{
  return 0;
}

- (BOOL)isArrivedAtHomePrediction
{
  return 0;
}

- (BOOL)isLocationPredictionOfType:(unint64_t)a3
{
  return 0;
}

- (BOOL)isLocationPredictionFromSource:(unint64_t)a3
{
  return 0;
}

- (BOOL)isHandoff
{
  return 0;
}

- (NSString)description
{
  v44[16] = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v4 = [(SBBestAppSuggestion *)self uniqueIdentifier];
  id v5 = (id)[v3 appendObject:v4 withName:@"uniqueIdentifier"];

  v6 = [(SBBestAppSuggestion *)self bundleIdentifier];
  id v7 = (id)[v3 appendObject:v6 withName:@"bundleIdentifier"];

  v8 = [(SBBestAppSuggestion *)self activityType];
  id v9 = (id)[v3 appendObject:v8 withName:@"activityType"];

  v10 = [(SBBestAppSuggestion *)self lastUpdateTime];
  id v11 = (id)[v3 appendObject:v10 withName:@"lastUpdateTime"];

  v12 = [(SBBestAppSuggestion *)self originatingDeviceIdentifier];
  id v13 = (id)[v3 appendObject:v12 withName:@"originatingDeviceIdentifier"];

  v14 = [(SBBestAppSuggestion *)self originatingDeviceName];
  id v15 = (id)[v3 appendObject:v14 withName:@"originatingDeviceName"];

  v16 = [(SBBestAppSuggestion *)self originatingDeviceType];
  id v17 = (id)[v3 appendObject:v16 withName:@"originatingDeviceType"];

  v18 = [(SBBestAppSuggestion *)self originatingBundleIdentifier];
  id v19 = (id)[v3 appendObject:v18 withName:@"originatingBundleIdentifier"];

  v20 = [(SBBestAppSuggestion *)self suggestedLocationName];
  id v21 = (id)[v3 appendObject:v20 withName:@"suggestedLocationName"];

  v22 = [(SBBestAppSuggestion *)self launchURL];
  id v23 = (id)[v3 appendObject:v22 withName:@"launchURL"];

  v43[0] = @"isNotificationSuggestion";
  v42 = objc_msgSend(NSNumber, "numberWithBool:", -[SBBestAppSuggestion isNotificationSuggestion](self, "isNotificationSuggestion"));
  v44[0] = v42;
  v43[1] = @"isOpenURLSuggestion";
  v41 = objc_msgSend(NSNumber, "numberWithBool:", -[SBBestAppSuggestion isOpenURLSuggestion](self, "isOpenURLSuggestion"));
  v44[1] = v41;
  v43[2] = @"isCallContinuitySuggestion";
  v40 = objc_msgSend(NSNumber, "numberWithBool:", -[SBBestAppSuggestion isCallContinuitySuggestion](self, "isCallContinuitySuggestion"));
  v44[2] = v40;
  v43[3] = @"isLocallyGeneratedSuggestion";
  v39 = objc_msgSend(NSNumber, "numberWithBool:", -[SBBestAppSuggestion isLocallyGeneratedSuggestion](self, "isLocallyGeneratedSuggestion"));
  v44[3] = v39;
  v43[4] = @"isEligibleForLockScreen";
  v38 = objc_msgSend(NSNumber, "numberWithBool:", -[SBBestAppSuggestion isEligibleForLockScreen](self, "isEligibleForLockScreen"));
  v44[4] = v38;
  v43[5] = @"isSiriSuggestion";
  v37 = objc_msgSend(NSNumber, "numberWithBool:", -[SBBestAppSuggestion isSiriSuggestion](self, "isSiriSuggestion"));
  v44[5] = v37;
  v43[6] = @"isLocationBasedSuggestion";
  v36 = objc_msgSend(NSNumber, "numberWithBool:", -[SBBestAppSuggestion isLocationBasedSuggestion](self, "isLocationBasedSuggestion"));
  v44[6] = v36;
  v43[7] = @"isPrediction";
  v35 = objc_msgSend(NSNumber, "numberWithBool:", -[SBBestAppSuggestion isPrediction](self, "isPrediction"));
  v44[7] = v35;
  v43[8] = @"isHeadphonesPrediction";
  v24 = objc_msgSend(NSNumber, "numberWithBool:", -[SBBestAppSuggestion isHeadphonesPrediction](self, "isHeadphonesPrediction"));
  v44[8] = v24;
  v43[9] = @"isBluetoothPrediction";
  v25 = objc_msgSend(NSNumber, "numberWithBool:", -[SBBestAppSuggestion isBluetoothPrediction](self, "isBluetoothPrediction"));
  v44[9] = v25;
  v43[10] = @"isBluetoothAudioPrediction";
  v26 = objc_msgSend(NSNumber, "numberWithBool:", -[SBBestAppSuggestion isBluetoothAudioPrediction](self, "isBluetoothAudioPrediction"));
  v44[10] = v26;
  v43[11] = @"isCarPlayPrediction";
  v27 = objc_msgSend(NSNumber, "numberWithBool:", -[SBBestAppSuggestion isCarPlayPrediction](self, "isCarPlayPrediction"));
  v44[11] = v27;
  v43[12] = @"isFirstWakePrediction";
  v28 = objc_msgSend(NSNumber, "numberWithBool:", -[SBBestAppSuggestion isFirstWakePrediction](self, "isFirstWakePrediction"));
  v44[12] = v28;
  v43[13] = @"isArrivedAtWorkPrediction";
  v29 = objc_msgSend(NSNumber, "numberWithBool:", -[SBBestAppSuggestion isArrivedAtWorkPrediction](self, "isArrivedAtWorkPrediction"));
  v44[13] = v29;
  v43[14] = @"isArrivedAtHomePrediction";
  v30 = objc_msgSend(NSNumber, "numberWithBool:", -[SBBestAppSuggestion isArrivedAtHomePrediction](self, "isArrivedAtHomePrediction"));
  v44[14] = v30;
  v43[15] = @"isHandoff";
  v31 = objc_msgSend(NSNumber, "numberWithBool:", -[SBBestAppSuggestion isHandoff](self, "isHandoff"));
  v44[15] = v31;
  v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:16];
  [v3 appendDictionarySection:v32 withName:@"wat" skipIfEmpty:0];

  v33 = [v3 build];

  return (NSString *)v33;
}

@end