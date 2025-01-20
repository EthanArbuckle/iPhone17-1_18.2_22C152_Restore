@interface NSURL(FaceTime)
+ (__CFString)TUDialRequestSchemeDefaultApp;
+ (__CFString)TUDialRequestSchemeDefaultAppPrompt;
+ (__CFString)TUDialRequestSchemeForceTelephony;
+ (__CFString)TUDialRequestSchemeForceTelephonyPrompt;
+ (id)TUDialRequestSchemeFaceTime;
+ (id)TUDialRequestSchemeFaceTimeAudio;
+ (id)TUDialRequestSchemeTelephony;
+ (id)_applyFaceTimeScheme:()FaceTime toFaceTimeURL:;
+ (id)_faceTimeURLWithDestinationID:()FaceTime addressBookUID:audioOnly:;
+ (id)_faceTimeURLWithHandle:()FaceTime addressBookUID:audioOnly:;
+ (id)faceTimeAnswerURLWithSourceIdentifier:()FaceTime;
+ (id)faceTimeAppJoinConversationLinkURL;
+ (id)faceTimeAppJoinConversationURLForConversationLinkURL:()FaceTime;
+ (id)faceTimeAppVideoMessagePlaybackURLForUUID:()FaceTime;
+ (id)faceTimeAppViewLinkDetailsURL;
+ (id)faceTimeAppViewLinkDetailsURLForPseudonym:()FaceTime;
+ (id)faceTimeAppViewLinkRequesetDetailsURL;
+ (id)faceTimeAudioScheme;
+ (id)faceTimeLaunchForIncomingCallURL;
+ (id)faceTimeLaunchForOutgoingConversationURL;
+ (id)faceTimeLaunchForScreeningURL;
+ (id)faceTimeMultiwayScheme;
+ (id)faceTimeNeedsBackgroundLaunchURL;
+ (id)faceTimeOpenLinkScheme;
+ (id)faceTimePinExchangeScheme;
+ (id)faceTimePromptURLWithURL:()FaceTime;
+ (id)faceTimeRefreshShareableContentURL;
+ (id)faceTimeRefreshShareableContentURLForBundleIdentifier:()FaceTime;
+ (id)faceTimeScheme;
+ (id)faceTimeShowAccessoryButtonEventsNoticeUIURL;
+ (id)faceTimeShowCarPlayInCallUIURL;
+ (id)faceTimeShowHandoffEligibleNearbyURL;
+ (id)faceTimeShowHandoffUIURL;
+ (id)faceTimeShowInCallUIURL;
+ (id)faceTimeShowIncomingTransmissionNoticeUIURL;
+ (id)faceTimeShowInviteUIURL;
+ (id)faceTimeShowLagunaPullConversationURL;
+ (id)faceTimeShowSystemCallControlsURL;
+ (id)faceTimeSystemCallControlsScheme;
+ (id)faceTimeTelephonyURLWithPhoneNumber:()FaceTime showPrompt:;
+ (id)faceTimeURLWithDestinationID:()FaceTime addressBookUID:forceAssist:suppressAssist:wasAssisted:audioOnly:;
+ (id)faceTimeURLWithURL:()FaceTime;
+ (id)faceTimeUpdateForegroundAppURL;
+ (id)faceTimeUpdateForegroundAppURLForBundleIdentifier:()FaceTime applicationType:;
+ (id)faceTimeVideoMessagePlaybackURLForUUID:()FaceTime;
+ (id)faceTimeVideoMessageScheme;
+ (id)facetimeAppViewLinkRequestDetailsURL;
+ (id)openNoteURLForRecordingSession:()FaceTime;
+ (id)screenSharingAppURL;
+ (id)showKeypadURL;
+ (uint64_t)faceTimeTelephonyURLWithPhoneNumber:()FaceTime;
+ (uint64_t)faceTimeURLWithDestinationID:()FaceTime;
+ (uint64_t)faceTimeURLWithDestinationID:()FaceTime addressBookUID:;
+ (uint64_t)faceTimeURLWithDestinationID:()FaceTime addressBookUID:audioOnly:;
+ (uint64_t)isDefaultAppScheme:()FaceTime;
- (BOOL)_isPhoneNumberID:()FaceTime;
- (BOOL)hasNoPromptOption;
- (BOOL)isAnswerRequestURL;
- (BOOL)isFaceTimeRecentsDetailsViewURL;
- (id)answerRequestSourceIdentifier;
- (id)conversationLinkURLForJoinConversation;
- (id)conversationLinkURLForOpenLinkURL;
- (id)faceTimeDestinationAccount;
- (id)foregroundAppBundleIdentifier;
- (id)pseudonymForLinkDetailsView;
- (id)recentsUniqueID;
- (id)videoMessageUUID;
- (uint64_t)foregroundAppApplicationType;
- (uint64_t)isDialCallURL;
- (uint64_t)isFaceTimeAppJoinConversationLinkURL;
- (uint64_t)isFaceTimeAppVideoMessagePlaybackURL;
- (uint64_t)isFaceTimeAppViewLinkDetailsURL;
- (uint64_t)isFaceTimeAppViewLinkRequestDetailsURL;
- (uint64_t)isFaceTimeAudioPromptURL;
- (uint64_t)isFaceTimeAudioURL;
- (uint64_t)isFaceTimeMultiwayURL;
- (uint64_t)isFaceTimeNeedsBackgroundLaunchURL;
- (uint64_t)isFaceTimeOpenLinkURL;
- (uint64_t)isFaceTimePromptURL;
- (uint64_t)isFaceTimeURL;
- (uint64_t)isLaunchForIncomingCallURL;
- (uint64_t)isLaunchForOutgoingConversationURL;
- (uint64_t)isLaunchForScreeningURL;
- (uint64_t)isRefreshShareableContentURL;
- (uint64_t)isShowAccessoryButtonEventsNoticeURL;
- (uint64_t)isShowCarPlayInCallUIURL;
- (uint64_t)isShowHandoffEligibleNearbyURL;
- (uint64_t)isShowInCallUIURL;
- (uint64_t)isShowIncomingTransmissionNoticeURL;
- (uint64_t)isShowKeypadURL;
- (uint64_t)isShowLagunaPullConversationURL;
- (uint64_t)isShowScreenSharingURL;
- (uint64_t)isShowSystemCallControlsURL;
- (uint64_t)isSystemCallControlsURL;
- (uint64_t)isUpdateForegroundAppURL;
- (uint64_t)isVideoMessagePlaybackURL;
- (void)conversationLinkURLForOpenLinkURL;
- (void)pseudonymForLinkDetailsView;
@end

@implementation NSURL(FaceTime)

+ (id)faceTimePinExchangeScheme
{
  return legacySchemeIfEnabled(@"facetime");
}

+ (id)faceTimeScheme
{
  return legacySchemeIfEnabled(@"facetime");
}

+ (id)faceTimeAudioScheme
{
  return legacySchemeIfEnabled(@"facetime-audio");
}

+ (id)faceTimeSystemCallControlsScheme
{
  return legacySchemeIfEnabled(@"system-call-controls");
}

+ (id)faceTimeOpenLinkScheme
{
  return legacySchemeIfEnabled(@"incallservice-open-link");
}

+ (id)faceTimeMultiwayScheme
{
  return legacySchemeIfEnabled(@"facetime-group");
}

+ (__CFString)TUDialRequestSchemeDefaultApp
{
  return @"tel";
}

+ (__CFString)TUDialRequestSchemeDefaultAppPrompt
{
  return @"telprompt";
}

+ (__CFString)TUDialRequestSchemeForceTelephony
{
  return @"telephony";
}

+ (__CFString)TUDialRequestSchemeForceTelephonyPrompt
{
  return @"telephonyprompt";
}

+ (id)TUDialRequestSchemeTelephony
{
  return legacySchemeIfEnabled(@"tel");
}

+ (id)TUDialRequestSchemeFaceTime
{
  return legacySchemeIfEnabled(@"facetime");
}

+ (id)TUDialRequestSchemeFaceTimeAudio
{
  return legacySchemeIfEnabled(@"facetime-audio");
}

+ (id)faceTimeVideoMessageScheme
{
  return legacySchemeIfEnabled(@"facetime-video-message");
}

- (id)faceTimeDestinationAccount
{
  v1 = [a1 resourceSpecifier];
  v2 = [v1 stringByRemovingPercentEncoding];

  if ([v2 hasPrefix:@"//"])
  {
    uint64_t v3 = [v2 substringFromIndex:2];

    v2 = (void *)v3;
  }
  uint64_t v4 = [v2 rangeOfString:@"/"];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = [v2 substringToIndex:v4];

    v2 = (void *)v5;
  }
  uint64_t v6 = [v2 rangeOfString:@"?"];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = [v2 substringToIndex:v6];

    v2 = (void *)v7;
  }

  return v2;
}

- (BOOL)_isPhoneNumberID:()FaceTime
{
  id v3 = a3;
  uint64_t v4 = [v3 rangeOfString:@"\\+?[0-9]+" options:1024];
  uint64_t v6 = v4 + v5;
  uint64_t v7 = [v3 length];

  return v6 == v7;
}

+ (id)_faceTimeURLWithDestinationID:()FaceTime addressBookUID:audioOnly:
{
  v8 = +[TUHandle handleWithDestinationID:](TUHandle, "handleWithDestinationID:");
  v9 = [a1 _faceTimeURLWithHandle:v8 addressBookUID:a4 audioOnly:a5];

  return v9;
}

+ (id)_faceTimeURLWithHandle:()FaceTime addressBookUID:audioOnly:
{
  id v7 = a3;
  if (a5) {
    [MEMORY[0x1E4F1CB10] faceTimeAudioScheme];
  }
  else {
  v8 = [MEMORY[0x1E4F1CB10] faceTimeScheme];
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v9 setScheme:v8];
  v10 = [v7 value];
  v11 = _FormatDestinationID(v10);
  [v9 setHost:v11];

  v12 = [MEMORY[0x1E4F1CA48] array];
  v13 = objc_msgSend(MEMORY[0x1E4F290C8], "queryItemForHandleType:", objc_msgSend(v7, "type"));
  [v12 addObject:v13];

  if (a4 != -1)
  {
    v14 = [NSNumber numberWithInt:a4];
    v15 = [v14 stringValue];

    v16 = [MEMORY[0x1E4F290C8] queryItemWithName:@"uid" value:v15];
    [v12 addObject:v16];
  }
  if ([v12 count])
  {
    v17 = (void *)[v12 copy];
    [v9 setQueryItems:v17];
  }
  v18 = [v9 URL];

  return v18;
}

+ (uint64_t)faceTimeURLWithDestinationID:()FaceTime
{
  return [MEMORY[0x1E4F1CB10] _faceTimeURLWithDestinationID:a3 addressBookUID:0xFFFFFFFFLL audioOnly:0];
}

+ (uint64_t)faceTimeURLWithDestinationID:()FaceTime addressBookUID:
{
  return [MEMORY[0x1E4F1CB10] _faceTimeURLWithDestinationID:a3 addressBookUID:a4 audioOnly:0];
}

+ (uint64_t)faceTimeURLWithDestinationID:()FaceTime addressBookUID:audioOnly:
{
  return objc_msgSend(MEMORY[0x1E4F1CB10], "_faceTimeURLWithDestinationID:addressBookUID:audioOnly:");
}

+ (id)faceTimeURLWithDestinationID:()FaceTime addressBookUID:forceAssist:suppressAssist:wasAssisted:audioOnly:
{
  v11 = [MEMORY[0x1E4F1CB10] faceTimeURLWithDestinationID:a3 addressBookUID:a4 audioOnly:a8];
  v12 = [MEMORY[0x1E4F29088] componentsWithURL:v11 resolvingAgainstBaseURL:0];
  v13 = (void *)MEMORY[0x1E4F1CA48];
  v14 = [v12 queryItems];
  v15 = [v13 arrayWithArray:v14];

  if ((a5 & 1) != 0 || a6)
  {
    v16 = TelURLForceAssist;
    if (!a5) {
      v16 = TelURLSuppressAssist;
    }
    v17 = [MEMORY[0x1E4F290C8] queryItemWithName:*v16 value:@"1"];
    [v15 addObject:v17];
  }
  if (a7)
  {
    v18 = [MEMORY[0x1E4F290C8] queryItemWithName:@"wasAssisted" value:@"1"];
    [v15 addObject:v18];
  }
  [v12 setQueryItems:v15];
  v19 = [v12 URL];

  return v19;
}

+ (uint64_t)faceTimeTelephonyURLWithPhoneNumber:()FaceTime
{
  return [a1 faceTimeTelephonyURLWithPhoneNumber:a3 showPrompt:0];
}

+ (id)faceTimeTelephonyURLWithPhoneNumber:()FaceTime showPrompt:
{
  uint64_t v5 = TUURLHostForTelephoneNumber(a3);
  if ([v5 length])
  {
    uint64_t v6 = [MEMORY[0x1E4F28B88] URLHostAllowedCharacterSet];
    uint64_t v7 = [v5 stringByAddingPercentEncodingWithAllowedCharacters:v6];

    uint64_t v5 = (void *)v7;
  }
  v8 = [NSString stringWithFormat:@"%@://%@", @"tel", v5];
  id v9 = v8;
  if ((a4 & 1) == 0)
  {
    uint64_t v10 = [v8 stringByAppendingFormat:@"?%@", @"noprompt"];

    id v9 = (void *)v10;
  }
  v11 = [MEMORY[0x1E4F1CB10] URLWithString:v9];

  return v11;
}

+ (id)_applyFaceTimeScheme:()FaceTime toFaceTimeURL:
{
  id v5 = a3;
  id v6 = a4;
  char v7 = [v6 isFaceTimeURL];
  int v8 = [v6 isFaceTimeAudioURL];
  if ((v7 & 1) != 0 || v8)
  {
    id v9 = [v6 resourceSpecifier];
    if ([v9 hasPrefix:@"//"])
    {
      uint64_t v10 = [v9 substringFromIndex:2];

      id v9 = (void *)v10;
    }
    v11 = (void *)[[NSString alloc] initWithFormat:@"%@://%@", v5, v9];
    uint64_t v12 = [MEMORY[0x1E4F1CB10] URLWithString:v11];

    id v6 = (id)v12;
  }

  return v6;
}

+ (id)faceTimeURLWithURL:()FaceTime
{
  id v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = a3;
  id v5 = [v3 faceTimeScheme];
  id v6 = [v3 _applyFaceTimeScheme:v5 toFaceTimeURL:v4];

  return v6;
}

+ (id)faceTimePromptURLWithURL:()FaceTime
{
  id v3 = a3;
  int v4 = [v3 isFaceTimeAudioURL];
  id v5 = @"facetime-prompt";
  if (v4) {
    id v5 = @"facetime-audio-prompt";
  }
  id v6 = v5;
  char v7 = [v3 URLByDeletingQueryParameterWithKey:@"noprompt"];

  int v8 = [MEMORY[0x1E4F1CB10] _applyFaceTimeScheme:v6 toFaceTimeURL:v7];

  return v8;
}

+ (id)faceTimeLaunchForIncomingCallURL
{
  v0 = (void *)MEMORY[0x1E4F1CB10];
  v1 = NSString;
  v2 = [MEMORY[0x1E4F1CB10] faceTimeScheme];
  id v3 = [v1 stringWithFormat:@"%@://", v2];
  int v4 = [v0 URLWithString:v3];
  id v5 = [v4 URLBySettingQueryParameterValue:@"1" forKey:@"launchForIncomingCall"];

  return v5;
}

+ (id)faceTimeLaunchForOutgoingConversationURL
{
  v0 = (void *)MEMORY[0x1E4F1CB10];
  v1 = NSString;
  v2 = [MEMORY[0x1E4F1CB10] faceTimeMultiwayScheme];
  id v3 = [v1 stringWithFormat:@"%@://", v2];
  int v4 = [v0 URLWithString:v3];
  id v5 = [v4 URLBySettingQueryParameterValue:@"1" forKey:@"launchForOutgoingConversation"];

  return v5;
}

+ (id)faceTimeLaunchForScreeningURL
{
  v0 = (void *)MEMORY[0x1E4F1CB10];
  v1 = NSString;
  v2 = [MEMORY[0x1E4F1CB10] faceTimeScheme];
  id v3 = [v1 stringWithFormat:@"%@://", v2];
  int v4 = [v0 URLWithString:v3];
  id v5 = [v4 URLBySettingQueryParameterValue:@"1" forKey:@"launchForScreening"];

  return v5;
}

+ (id)faceTimeShowInCallUIURL
{
  v0 = (void *)MEMORY[0x1E4F1CB10];
  v1 = NSString;
  v2 = [MEMORY[0x1E4F1CB10] faceTimeScheme];
  id v3 = [v1 stringWithFormat:@"%@://", v2];
  int v4 = [v0 URLWithString:v3];
  id v5 = [v4 URLBySettingQueryParameterValue:@"1" forKey:@"showInCallUI"];

  return v5;
}

+ (id)faceTimeShowHandoffUIURL
{
  v0 = (void *)MEMORY[0x1E4F1CB10];
  v1 = NSString;
  v2 = [MEMORY[0x1E4F1CB10] faceTimeScheme];
  id v3 = [v1 stringWithFormat:@"%@://", v2];
  int v4 = [v0 URLWithString:v3];
  id v5 = [v4 URLBySettingQueryParameterValue:@"1" forKey:@"showInCallUI"];

  return v5;
}

+ (id)faceTimeShowInviteUIURL
{
  v0 = (void *)MEMORY[0x1E4F1CB10];
  v1 = NSString;
  v2 = [MEMORY[0x1E4F1CB10] faceTimeScheme];
  id v3 = [v1 stringWithFormat:@"%@://", v2];
  int v4 = [v0 URLWithString:v3];
  id v5 = [v4 URLBySettingQueryParameterValue:@"1" forKey:@"showInCallUI"];

  return v5;
}

+ (id)showKeypadURL
{
  v0 = (void *)MEMORY[0x1E4F1CB10];
  v1 = NSString;
  v2 = [MEMORY[0x1E4F1CB10] faceTimeScheme];
  id v3 = [v1 stringWithFormat:@"%@://", v2];
  int v4 = [v0 URLWithString:v3];
  id v5 = [v4 URLBySettingQueryParameterValue:@"1" forKey:@"showKeypad"];

  return v5;
}

+ (id)faceTimeShowCarPlayInCallUIURL
{
  v0 = (void *)MEMORY[0x1E4F1CB10];
  v1 = NSString;
  v2 = [MEMORY[0x1E4F1CB10] faceTimeScheme];
  id v3 = [v1 stringWithFormat:@"%@://", v2];
  int v4 = [v0 URLWithString:v3];
  id v5 = [v4 URLBySettingQueryParameterValue:@"1" forKey:@"showCarPlayInCallUI"];

  return v5;
}

+ (id)faceTimeShowSystemCallControlsURL
{
  v0 = (void *)MEMORY[0x1E4F1CB10];
  v1 = NSString;
  v2 = [MEMORY[0x1E4F1CB10] faceTimeSystemCallControlsScheme];
  id v3 = [v1 stringWithFormat:@"%@://", v2];
  int v4 = [v0 URLWithString:v3];
  id v5 = [v4 URLBySettingQueryParameterValue:@"1" forKey:@"showSystemCallControls"];

  return v5;
}

+ (id)faceTimeShowHandoffEligibleNearbyURL
{
  v0 = (void *)MEMORY[0x1E4F1CB10];
  v1 = NSString;
  v2 = [MEMORY[0x1E4F1CB10] faceTimeSystemCallControlsScheme];
  id v3 = [v1 stringWithFormat:@"%@://", v2];
  int v4 = [v0 URLWithString:v3];
  id v5 = [v4 URLBySettingQueryParameterValue:@"1" forKey:@"showHandoffEligibleNearby"];

  return v5;
}

+ (id)faceTimeShowLagunaPullConversationURL
{
  v0 = (void *)MEMORY[0x1E4F1CB10];
  v1 = NSString;
  v2 = [MEMORY[0x1E4F1CB10] faceTimeSystemCallControlsScheme];
  id v3 = [v1 stringWithFormat:@"%@://", v2];
  int v4 = [v0 URLWithString:v3];
  id v5 = [v4 URLBySettingQueryParameterValue:@"1" forKey:@"showLagunaPullConversation"];

  return v5;
}

+ (id)faceTimeShowIncomingTransmissionNoticeUIURL
{
  v0 = (void *)MEMORY[0x1E4F1CB10];
  v1 = NSString;
  v2 = [MEMORY[0x1E4F1CB10] faceTimeScheme];
  id v3 = [v1 stringWithFormat:@"%@://", v2];
  int v4 = [v0 URLWithString:v3];
  id v5 = [v4 URLBySettingQueryParameterValue:@"1" forKey:@"showIncomingTransmissionNotice"];

  return v5;
}

+ (id)faceTimeShowAccessoryButtonEventsNoticeUIURL
{
  v0 = (void *)MEMORY[0x1E4F1CB10];
  v1 = NSString;
  v2 = [MEMORY[0x1E4F1CB10] faceTimeScheme];
  id v3 = [v1 stringWithFormat:@"%@://", v2];
  int v4 = [v0 URLWithString:v3];
  id v5 = [v4 URLBySettingQueryParameterValue:@"1" forKey:@"showAccessoryButtonEventsNotice"];

  return v5;
}

+ (id)faceTimeUpdateForegroundAppURL
{
  v0 = (void *)MEMORY[0x1E4F1CB10];
  v1 = NSString;
  v2 = [MEMORY[0x1E4F1CB10] faceTimeSystemCallControlsScheme];
  id v3 = [v1 stringWithFormat:@"%@://", v2];
  int v4 = [v0 URLWithString:v3];
  id v5 = [v4 URLBySettingQueryParameterValue:@"1" forKey:@"updateForegroundApp"];

  return v5;
}

+ (id)faceTimeAppViewLinkDetailsURL
{
  v0 = (void *)MEMORY[0x1E4F1CB10];
  v1 = [NSString stringWithFormat:@"%@://", @"facetimeapp"];
  v2 = [v0 URLWithString:v1];
  id v3 = [v2 URLBySettingQueryParameterValue:@"1" forKey:@"viewLinkDetails"];

  return v3;
}

+ (id)faceTimeAppViewLinkRequesetDetailsURL
{
  v0 = (void *)MEMORY[0x1E4F1CB10];
  v1 = [NSString stringWithFormat:@"%@://", @"facetimeapp"];
  v2 = [v0 URLWithString:v1];
  id v3 = [v2 URLBySettingQueryParameterValue:@"1" forKey:@"viewLinkRequestDetails"];

  return v3;
}

+ (id)faceTimeNeedsBackgroundLaunchURL
{
  v0 = (void *)MEMORY[0x1E4F1CB10];
  v1 = NSString;
  v2 = [MEMORY[0x1E4F1CB10] faceTimeScheme];
  id v3 = [v1 stringWithFormat:@"%@://", v2];
  int v4 = [v0 URLWithString:v3];
  id v5 = [v4 URLBySettingQueryParameterValue:@"1" forKey:@"shouldBackgroundLaunch"];

  return v5;
}

+ (id)faceTimeAppJoinConversationLinkURL
{
  v0 = (void *)MEMORY[0x1E4F1CB10];
  v1 = [NSString stringWithFormat:@"%@://", @"facetimeapp"];
  v2 = [v0 URLWithString:v1];
  id v3 = [v2 URLBySettingQueryParameterValue:@"1" forKey:@"joinConversationLink"];

  return v3;
}

+ (id)faceTimeRefreshShareableContentURL
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F29088]);
  id v3 = [a1 faceTimeSystemCallControlsScheme];
  [v2 setScheme:v3];

  int v4 = [MEMORY[0x1E4F290C8] queryItemWithName:@"refreshShareableContent" value:@"1"];
  v8[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v2 setQueryItems:v5];

  id v6 = [v2 URL];

  return v6;
}

+ (id)faceTimeUpdateForegroundAppURLForBundleIdentifier:()FaceTime applicationType:
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v6 = (objc_class *)MEMORY[0x1E4F29088];
  id v7 = a3;
  id v8 = [v6 alloc];
  id v9 = [a1 faceTimeUpdateForegroundAppURL];
  uint64_t v10 = (void *)[v8 initWithURL:v9 resolvingAgainstBaseURL:0];

  v11 = [v10 queryItems];
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"bundleIdentifier" value:v7];

  id v13 = objc_alloc(MEMORY[0x1E4F290C8]);
  v14 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", a4, v12);
  v15 = (void *)[v13 initWithName:@"applicationType" value:v14];
  v20[1] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  v17 = [v11 arrayByAddingObjectsFromArray:v16];
  [v10 setQueryItems:v17];

  v18 = [v10 URL];

  return v18;
}

+ (id)faceTimeAnswerURLWithSourceIdentifier:()FaceTime
{
  id v3 = (void *)MEMORY[0x1E4F1CB10];
  int v4 = NSString;
  id v5 = a3;
  id v6 = [v3 faceTimeScheme];
  id v7 = [v4 stringWithFormat:@"%@://", v6];
  id v8 = [v3 URLWithString:v7];
  id v9 = [v8 URLBySettingQueryParameterValue:v5 forKey:@"answerSourceIdentifier"];

  return v9;
}

+ (id)faceTimeAppViewLinkDetailsURLForPseudonym:()FaceTime
{
  v15[1] = *MEMORY[0x1E4F143B8];
  int v4 = (objc_class *)MEMORY[0x1E4F29088];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [a1 faceTimeAppViewLinkDetailsURL];
  id v8 = (void *)[v6 initWithURL:v7 resolvingAgainstBaseURL:0];

  id v9 = [v8 queryItems];
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"pseudonym" value:v5];

  v15[0] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  uint64_t v12 = [v9 arrayByAddingObjectsFromArray:v11];
  [v8 setQueryItems:v12];

  id v13 = [v8 URL];

  return v13;
}

+ (id)facetimeAppViewLinkRequestDetailsURL
{
  id v2 = objc_alloc(MEMORY[0x1E4F29088]);
  id v3 = [a1 faceTimeAppViewLinkRequesetDetailsURL];
  int v4 = (void *)[v2 initWithURL:v3 resolvingAgainstBaseURL:0];

  id v5 = [v4 URL];

  return v5;
}

+ (id)faceTimeAppJoinConversationURLForConversationLinkURL:()FaceTime
{
  v17[1] = *MEMORY[0x1E4F143B8];
  int v4 = (objc_class *)MEMORY[0x1E4F29088];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [a1 faceTimeAppJoinConversationLinkURL];
  id v8 = (void *)[v6 initWithURL:v7 resolvingAgainstBaseURL:0];

  id v9 = [v8 queryItems];
  id v10 = objc_alloc(MEMORY[0x1E4F290C8]);
  v11 = [v5 absoluteString];

  uint64_t v12 = (void *)[v10 initWithName:@"conversationLink" value:v11];
  v17[0] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  v14 = [v9 arrayByAddingObjectsFromArray:v13];
  [v8 setQueryItems:v14];

  v15 = [v8 URL];

  return v15;
}

+ (id)faceTimeRefreshShareableContentURLForBundleIdentifier:()FaceTime
{
  int v4 = (void *)MEMORY[0x1E4F29088];
  id v5 = a3;
  id v6 = [a1 faceTimeRefreshShareableContentURL];
  id v7 = [v4 componentsWithURL:v6 resolvingAgainstBaseURL:0];

  id v8 = [v7 queryItems];
  id v9 = [MEMORY[0x1E4F290C8] queryItemWithName:@"bundleIdentifier" value:v5];

  id v10 = [v8 arrayByAddingObject:v9];
  [v7 setQueryItems:v10];

  v11 = [v7 URL];

  return v11;
}

+ (id)faceTimeVideoMessagePlaybackURLForUUID:()FaceTime
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)MEMORY[0x1E4F29088];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = [MEMORY[0x1E4F1CB10] faceTimeVideoMessageScheme];
  [v5 setScheme:v6];

  [v5 setHost:@"player"];
  id v7 = (void *)MEMORY[0x1E4F290C8];
  id v8 = [v4 UUIDString];

  id v9 = [v7 queryItemWithName:@"uuid" value:v8];
  v13[0] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  [v5 setQueryItems:v10];

  v11 = [v5 URL];

  return v11;
}

+ (id)faceTimeAppVideoMessagePlaybackURLForUUID:()FaceTime
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)MEMORY[0x1E4F29088];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setScheme:@"facetimeapp"];
  [v5 setHost:@"player"];
  id v6 = (void *)MEMORY[0x1E4F290C8];
  id v7 = [v4 UUIDString];

  id v8 = [v6 queryItemWithName:@"uuid" value:v7];
  v12[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [v5 setQueryItems:v9];

  id v10 = [v5 URL];

  return v10;
}

+ (id)openNoteURLForRecordingSession:()FaceTime
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)MEMORY[0x1E4F29088];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setScheme:@"applenotes"];
  [v5 setHost:@"showNote"];
  id v6 = (void *)MEMORY[0x1E4F290C8];
  id v7 = [v4 callUUID];

  id v8 = [v6 queryItemWithName:@"identifier" value:v7];
  v12[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [v5 setQueryItems:v9];

  id v10 = [v5 URL];

  return v10;
}

+ (uint64_t)isDefaultAppScheme:()FaceTime
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB10] TUDialRequestSchemeDefaultApp];
  if ([v3 isEqualToIgnoringCase:v4])
  {
    uint64_t v5 = 1;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CB10] TUDialRequestSchemeDefaultAppPrompt];
    uint64_t v5 = [v3 isEqualToIgnoringCase:v6];
  }
  return v5;
}

- (uint64_t)isFaceTimeURL
{
  v1 = [a1 scheme];
  id v2 = [MEMORY[0x1E4F1CB10] faceTimeScheme];
  if ([v1 isEqualToIgnoringCase:v2]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v1 isEqualToIgnoringCase:@"facetime-prompt"];
  }

  return v3;
}

- (uint64_t)isFaceTimePromptURL
{
  v1 = [a1 scheme];
  uint64_t v2 = [v1 isEqualToIgnoringCase:@"facetime-prompt"];

  return v2;
}

- (uint64_t)isFaceTimeAudioURL
{
  v1 = [a1 scheme];
  uint64_t v2 = [MEMORY[0x1E4F1CB10] faceTimeAudioScheme];
  if ([v1 isEqualToIgnoringCase:v2]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v1 isEqualToIgnoringCase:@"facetime-audio-prompt"];
  }

  return v3;
}

- (uint64_t)isFaceTimeAudioPromptURL
{
  v1 = [a1 scheme];
  uint64_t v2 = [v1 isEqualToIgnoringCase:@"facetime-audio-prompt"];

  return v2;
}

- (uint64_t)isFaceTimeMultiwayURL
{
  v1 = [a1 scheme];
  uint64_t v2 = [MEMORY[0x1E4F1CB10] faceTimeMultiwayScheme];
  uint64_t v3 = [v1 isEqualToString:v2];

  return v3;
}

- (uint64_t)isSystemCallControlsURL
{
  v1 = [a1 scheme];
  uint64_t v2 = [MEMORY[0x1E4F1CB10] faceTimeSystemCallControlsScheme];
  uint64_t v3 = [v1 isEqualToString:v2];

  return v3;
}

- (uint64_t)isFaceTimeAppViewLinkDetailsURL
{
  v1 = [a1 tuQueryParameters];
  uint64_t v2 = [v1 objectForKey:@"viewLinkDetails"];
  uint64_t v3 = [v2 isEqualToString:@"1"];

  return v3;
}

- (uint64_t)isFaceTimeAppViewLinkRequestDetailsURL
{
  v1 = [a1 tuQueryParameters];
  uint64_t v2 = [v1 objectForKey:@"viewLinkRequestDetails"];
  uint64_t v3 = [v2 isEqualToString:@"1"];

  return v3;
}

- (id)pseudonymForLinkDetailsView
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([a1 isFaceTimeAppViewLinkDetailsURL])
  {
    uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:a1 resolvingAgainstBaseURL:0];
    uint64_t v3 = [v2 queryItems];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v22 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          id v10 = objc_msgSend(v9, "name", (void)v21);
          char v11 = [v10 isEqualToString:@"pseudonym"];

          if (v11)
          {
            v19 = [v9 value];
            uint64_t v12 = v4;
            goto LABEL_15;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    uint64_t v12 = TUDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      [(NSURL(FaceTime) *)(uint64_t)a1 pseudonymForLinkDetailsView];
    }
    v19 = 0;
LABEL_15:
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (uint64_t)isFaceTimeOpenLinkURL
{
  v1 = [a1 scheme];
  uint64_t v2 = [MEMORY[0x1E4F1CB10] faceTimeOpenLinkScheme];
  uint64_t v3 = [v1 isEqualToString:v2];

  return v3;
}

- (id)conversationLinkURLForOpenLinkURL
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ([a1 isFaceTimeOpenLinkURL])
  {
    uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:a1 resolvingAgainstBaseURL:0];
    uint64_t v3 = [v2 queryItems];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v24 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          id v10 = objc_msgSend(v9, "name", (void)v23);
          char v11 = [v10 isEqualToString:@"link"];

          if (v11)
          {
            v20 = (void *)MEMORY[0x1E4F1CB10];
            long long v21 = [v9 value];
            v19 = [v20 URLWithString:v21];

            uint64_t v12 = v4;
            goto LABEL_15;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    uint64_t v12 = TUDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      [(NSURL(FaceTime) *)(uint64_t)a1 conversationLinkURLForOpenLinkURL];
    }
    v19 = 0;
LABEL_15:
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (uint64_t)isFaceTimeAppJoinConversationLinkURL
{
  v1 = [a1 tuQueryParameters];
  uint64_t v2 = [v1 objectForKey:@"joinConversationLink"];
  uint64_t v3 = [v2 isEqualToString:@"1"];

  return v3;
}

- (id)conversationLinkURLForJoinConversation
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ([a1 isFaceTimeAppJoinConversationLinkURL])
  {
    uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:a1 resolvingAgainstBaseURL:0];
    uint64_t v3 = [v2 queryItems];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v24 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          id v10 = objc_msgSend(v9, "name", (void)v23);
          char v11 = [v10 isEqualToString:@"conversationLink"];

          if (v11)
          {
            v20 = (void *)MEMORY[0x1E4F1CB10];
            long long v21 = [v9 value];
            v19 = [v20 URLWithString:v21];

            uint64_t v12 = v4;
            goto LABEL_15;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    uint64_t v12 = TUDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      [(NSURL(FaceTime) *)(uint64_t)a1 conversationLinkURLForOpenLinkURL];
    }
    v19 = 0;
LABEL_15:
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)hasNoPromptOption
{
  if ([a1 isFaceTimePromptURL] & 1) != 0 || (objc_msgSend(a1, "isFaceTimeAudioPromptURL")) {
    return 0;
  }
  uint64_t v3 = [a1 scheme];
  BOOL v2 = [v3 caseInsensitiveCompare:@"telprompt"] != 0;

  return v2;
}

- (uint64_t)isDialCallURL
{
  if ([a1 isLaunchForIncomingCallURL]) {
    return 0;
  }
  else {
    return [a1 isShowInCallUIURL] ^ 1;
  }
}

- (uint64_t)isLaunchForIncomingCallURL
{
  v1 = [a1 tuQueryParameters];
  BOOL v2 = [v1 objectForKey:@"launchForIncomingCall"];
  uint64_t v3 = [v2 isEqualToString:@"1"];

  return v3;
}

- (uint64_t)isLaunchForOutgoingConversationURL
{
  v1 = [a1 tuQueryParameters];
  BOOL v2 = [v1 objectForKey:@"launchForOutgoingConversation"];
  uint64_t v3 = [v2 isEqualToString:@"1"];

  return v3;
}

- (uint64_t)isLaunchForScreeningURL
{
  v1 = [a1 tuQueryParameters];
  BOOL v2 = [v1 objectForKey:@"launchForScreening"];
  uint64_t v3 = [v2 isEqualToString:@"1"];

  return v3;
}

- (uint64_t)isShowInCallUIURL
{
  v1 = [a1 tuQueryParameters];
  BOOL v2 = [v1 objectForKey:@"showInCallUI"];
  if ([v2 isEqualToString:@"1"])
  {
    uint64_t v3 = 1;
  }
  else
  {
    id v4 = [v1 objectForKey:@"showCarPlayInCallUI"];
    uint64_t v3 = [v4 isEqualToString:@"1"];
  }
  return v3;
}

- (uint64_t)isShowKeypadURL
{
  v1 = [a1 tuQueryParameters];
  BOOL v2 = [v1 objectForKey:@"showKeypad"];
  uint64_t v3 = [v2 isEqualToString:@"1"];

  return v3;
}

- (uint64_t)isShowIncomingTransmissionNoticeURL
{
  v1 = [a1 tuQueryParameters];
  BOOL v2 = [v1 objectForKey:@"showIncomingTransmissionNotice"];
  uint64_t v3 = [v2 isEqualToString:@"1"];

  return v3;
}

- (uint64_t)isShowAccessoryButtonEventsNoticeURL
{
  v1 = [a1 tuQueryParameters];
  BOOL v2 = [v1 objectForKey:@"showAccessoryButtonEventsNotice"];
  uint64_t v3 = [v2 isEqualToString:@"1"];

  return v3;
}

- (uint64_t)isShowCarPlayInCallUIURL
{
  v1 = [a1 tuQueryParameters];
  BOOL v2 = [v1 objectForKey:@"showCarPlayInCallUI"];
  uint64_t v3 = [v2 isEqualToString:@"1"];

  return v3;
}

- (uint64_t)isShowSystemCallControlsURL
{
  v1 = [a1 tuQueryParameters];
  BOOL v2 = [v1 objectForKey:@"showSystemCallControls"];
  uint64_t v3 = [v2 isEqualToString:@"1"];

  return v3;
}

- (uint64_t)isShowHandoffEligibleNearbyURL
{
  v1 = [a1 tuQueryParameters];
  BOOL v2 = [v1 objectForKey:@"showHandoffEligibleNearby"];
  uint64_t v3 = [v2 isEqualToString:@"1"];

  return v3;
}

- (uint64_t)isShowLagunaPullConversationURL
{
  v1 = [a1 tuQueryParameters];
  BOOL v2 = [v1 objectForKey:@"showLagunaPullConversation"];
  uint64_t v3 = [v2 isEqualToString:@"1"];

  return v3;
}

- (uint64_t)isShowScreenSharingURL
{
  v1 = [a1 scheme];
  uint64_t v2 = [v1 isEqualToString:@"system-screen-sharing"];

  return v2;
}

- (uint64_t)isUpdateForegroundAppURL
{
  v1 = [a1 tuQueryParameters];
  uint64_t v2 = [v1 objectForKey:@"updateForegroundApp"];
  uint64_t v3 = [v2 isEqualToString:@"1"];

  return v3;
}

- (uint64_t)isRefreshShareableContentURL
{
  v1 = [a1 tuQueryParameters];
  uint64_t v2 = [v1 objectForKey:@"refreshShareableContent"];
  uint64_t v3 = [v2 isEqualToString:@"1"];

  return v3;
}

- (uint64_t)isVideoMessagePlaybackURL
{
  uint64_t v2 = [a1 scheme];
  if ([v2 isEqualToString:@"facetime-video-message"])
  {
    uint64_t v3 = [a1 host];
    uint64_t v4 = [v3 isEqualToString:@"player"];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (uint64_t)isFaceTimeAppVideoMessagePlaybackURL
{
  uint64_t v2 = [a1 scheme];
  if ([v2 isEqualToString:@"facetimeapp"])
  {
    uint64_t v3 = [a1 host];
    uint64_t v4 = [v3 isEqualToString:@"player"];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)videoMessageUUID
{
  if (([a1 isVideoMessagePlaybackURL] & 1) != 0
    || [a1 isFaceTimeAppVideoMessagePlaybackURL])
  {
    id v2 = objc_alloc(MEMORY[0x1E4F29088]);
    uint64_t v3 = [a1 absoluteString];
    uint64_t v4 = (void *)[v2 initWithString:v3];

    uint64_t v5 = [v4 queryItems];
    uint64_t v6 = [v5 firstObject];

    uint64_t v7 = [v6 name];
    int v8 = [v7 isEqualToString:@"uuid"];

    if (v8)
    {
      id v9 = objc_alloc(MEMORY[0x1E4F29128]);
      id v10 = [v6 value];
      char v11 = (void *)[v9 initWithUUIDString:v10];
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

- (BOOL)isFaceTimeRecentsDetailsViewURL
{
  id v2 = [a1 scheme];
  if ([v2 isEqualToString:@"facetime-recents"])
  {
    uint64_t v3 = [a1 recentsUniqueID];
    BOOL v4 = [v3 length] != 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)recentsUniqueID
{
  id v2 = objc_alloc(MEMORY[0x1E4F29088]);
  uint64_t v3 = [a1 absoluteString];
  BOOL v4 = (void *)[v2 initWithString:v3];

  uint64_t v5 = [v4 queryItems];
  uint64_t v6 = [v5 firstObject];

  uint64_t v7 = [v6 name];
  if ([v7 isEqualToString:@"uniqueId"])
  {
    int v8 = [v6 value];

    if (v8)
    {
      id v9 = [v6 value];
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v9 = 0;
LABEL_6:

  return v9;
}

- (id)foregroundAppBundleIdentifier
{
  v1 = [a1 tuQueryParameters];
  id v2 = [v1 objectForKey:@"bundleIdentifier"];

  return v2;
}

- (uint64_t)foregroundAppApplicationType
{
  v1 = [a1 tuQueryParameters];
  id v2 = [v1 objectForKey:@"applicationType"];
  uint64_t v3 = [v2 integerValue];

  return v3;
}

- (uint64_t)isFaceTimeNeedsBackgroundLaunchURL
{
  v1 = [a1 tuQueryParameters];
  id v2 = [v1 objectForKey:@"shouldBackgroundLaunch"];
  uint64_t v3 = [v2 isEqualToString:@"1"];

  return v3;
}

- (BOOL)isAnswerRequestURL
{
  v1 = [a1 tuQueryParameters];
  id v2 = [v1 objectForKey:@"answerSourceIdentifier"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)answerRequestSourceIdentifier
{
  v1 = [a1 tuQueryParameters];
  id v2 = [v1 objectForKey:@"answerSourceIdentifier"];

  return v2;
}

+ (id)screenSharingAppURL
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CB10];
  v1 = [NSString stringWithFormat:@"%@://", @"system-screen-sharing"];
  id v2 = [v0 URLWithString:v1];

  BOOL v3 = [MEMORY[0x1E4F290C8] queryItemWithName:@"updateForegroundApp" value:@"1"];
  BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v2 resolvingAgainstBaseURL:0];
  v8[0] = v3;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v4 setQueryItems:v5];

  uint64_t v6 = [v4 URL];

  return v6;
}

- (void)pseudonymForLinkDetailsView
{
}

- (void)conversationLinkURLForOpenLinkURL
{
}

@end