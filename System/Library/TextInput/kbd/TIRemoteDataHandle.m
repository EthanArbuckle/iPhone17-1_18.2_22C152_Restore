@interface TIRemoteDataHandle
+ (BOOL)shouldAcceptRequestForMeCardWithAuditToken:(id *)a3;
+ (id)localDictionaryPath;
+ (id)localizedStringForKey:(id)a3;
- (TITextCheckerExemptions)textCheckerExemptions;
- (id)notificationDetailsForType:(int64_t)a3;
- (void)addLinguisticAssetsAssertionForLanguage:(id)a3 assertionID:(id)a4 region:(id)a5 clientID:(id)a6 withHandler:(id)a7;
- (void)alternativesForText:(id)a3 completionHandler:(id)a4;
- (void)appendWordToTextCheckerLocalDictionary:(id)a3;
- (void)dismissDialogWithCompletionHandler:(id)a3;
- (void)dismissedDataSharingWithResponse:(int64_t)a3;
- (void)fetchAssetUpdateStatusForInputModeIdentifier:(id)a3 callback:(id)a4;
- (void)ingestSentence:(id)a3 language:(id)a4 phraseRanges:(id)a5;
- (void)launchDictationSettings;
- (void)launchKeyboardSettings;
- (void)launchPencilSettings;
- (void)performTrainingForClient:(id)a3 withCompletionHandler:(id)a4;
- (void)presentDialogForType:(int64_t)a3 withCompletionHandler:(id)a4;
- (void)removeAllDynamicDictionariesWithCompletionHandler:(id)a3;
- (void)removeLinguisticAssetsAssertionWithIdentifier:(id)a3 forClientID:(id)a4 withHandler:(id)a5;
- (void)requestLinguisticAssetsForLanguage:(id)a3 completion:(id)a4;
- (void)requestMeCardWithCompletionHandler:(id)a3;
- (void)requestMeContactWithCompletionHandler:(id)a3;
- (void)requestTextCheckerLocalDictionaryWithCompletionHandler:(id)a3;
- (void)string:(id)a3 isExemptFromTextCheckerWithCompletionHandler:(id)a4;
- (void)updateAssetForInputModeIdentifier:(id)a3 callback:(id)a4;
- (void)updateForActiveLocaleIdentifiers:(id)a3;
- (void)updateKeyboardType:(unint64_t)a3 appIdentifier:(id)a4;
@end

@implementation TIRemoteDataHandle

+ (BOOL)shouldAcceptRequestForMeCardWithAuditToken:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)cf.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&cf.val[4] = v3;
  v4 = SecTaskCreateWithAuditToken(0, &cf);
  if (!v4) {
    return 0;
  }
  v5 = v4;
  *(void *)cf.val = 0;
  CFBooleanRef v6 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v4, @"com.apple.TextInput.rdt.me", (CFErrorRef *)&cf);
  if (v6)
  {
    CFBooleanRef v7 = v6;
    CFTypeID v8 = CFGetTypeID(v6);
    BOOL v9 = v8 == CFBooleanGetTypeID() && CFBooleanGetValue(v7) != 0;
    CFRelease(v7);
  }
  else
  {
    if (*(void *)cf.val)
    {
      if (TICanLogMessageAtLevel())
      {
        v10 = TIOSLogFacility();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          sub_1000113E8((uint64_t *)&cf);
        }
      }
      CFRelease(*(CFTypeRef *)cf.val);
    }
    BOOL v9 = 0;
  }
  CFRelease(v5);
  return v9;
}

- (void)requestLinguisticAssetsForLanguage:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  CFBooleanRef v7 = +[TILinguisticAssetDownloadServer sharedServer];
  [v7 start];

  id v8 = +[TILinguisticAssetDownloadServer sharedServer];
  [v8 requestLinguisticAssetsForLanguage:v6 completion:v5];
}

- (void)addLinguisticAssetsAssertionForLanguage:(id)a3 assertionID:(id)a4 region:(id)a5 clientID:(id)a6 withHandler:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = +[TILinguisticAssetDownloadServer sharedServer];
  [v16 start];

  id v17 = +[TILinguisticAssetDownloadServer sharedServer];
  [v17 addLinguisticAssetsAssertionForLanguage:v15 assertionID:v14 region:v13 clientID:v12 withHandler:v11];
}

- (void)removeLinguisticAssetsAssertionWithIdentifier:(id)a3 forClientID:(id)a4 withHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[TILinguisticAssetDownloadServer sharedServer];
  [v10 removeLinguisticAssetsAssertionWithIdentifier:v9 forClientID:v8 withHandler:v7];
}

- (void)fetchAssetUpdateStatusForInputModeIdentifier:(id)a3 callback:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[TILinguisticAssetDownloadServer sharedServer];
  [v7 fetchAssetUpdateStatusForInputModeIdentifier:v6 callback:v5];
}

- (void)updateAssetForInputModeIdentifier:(id)a3 callback:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[TILinguisticAssetDownloadServer sharedServer];
  [v7 updateAssetForInputModeIdentifier:v6 callback:v5];
}

- (void)requestMeCardWithCompletionHandler:(id)a3
{
  id v3 = a3;
  v4 = +[NSXPCConnection currentConnection];
  id v5 = v4;
  if (v4) {
    [v4 auditToken];
  }
  else {
    memset(v9, 0, sizeof(v9));
  }
  unsigned __int8 v6 = +[TIRemoteDataHandle shouldAcceptRequestForMeCardWithAuditToken:v9];

  if (v6)
  {
    id v8 = v3;
    TIGetMeCardAsync();
  }
  else
  {
    if (TICanLogMessageAtLevel())
    {
      id v7 = TIOSLogFacility();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        sub_100011490();
      }
    }
    (*((void (**)(id, void))v3 + 2))(v3, 0);
  }
}

- (void)requestMeContactWithCompletionHandler:(id)a3
{
  id v3 = a3;
  v4 = +[NSXPCConnection currentConnection];
  id v5 = v4;
  if (v4) {
    [v4 auditToken];
  }
  else {
    memset(v9, 0, sizeof(v9));
  }
  unsigned __int8 v6 = +[TIRemoteDataHandle shouldAcceptRequestForMeCardWithAuditToken:v9];

  if (v6)
  {
    id v8 = v3;
    TIGetMeCardAsync();
  }
  else
  {
    if (TICanLogMessageAtLevel())
    {
      id v7 = TIOSLogFacility();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        sub_100011558();
      }
    }
    (*((void (**)(id, void))v3 + 2))(v3, 0);
  }
}

- (void)launchKeyboardSettings
{
  sub_10000E9A4(@"prefs:root=General&path=Keyboard", 0);
}

- (void)launchDictationSettings
{
  sub_10000E9A4(@"prefs:root=General&path=Keyboard/DictationSettings", 0);
}

- (void)launchPencilSettings
{
  v3[0] = @"__UnlockDevice";
  v3[1] = @"__PromptUnlockDevice";
  v4[0] = &__kCFBooleanTrue;
  v4[1] = &__kCFBooleanTrue;
  v2 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
  sub_10000E9A4(@"prefs:root=Pencil", v2);
}

- (void)presentDialogForType:(int64_t)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  if (!v6)
  {
    id v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"TIRemoteDataServer.m" lineNumber:410 description:@"Required completion handler is missing"];
  }
  id v7 = v6;
  TIDispatchAsync();
}

- (id)notificationDetailsForType:(int64_t)a3
{
  if (a3 == 3)
  {
    id v20 = objc_alloc_init((Class)sub_10000F4F8());
    v21 = [v20 dictationDataSharingOptInReminderViewModel];
    id v3 = [v21 title];
    id v9 = [v21 message];
    id v17 = [v21 confirmationButtonTitle];

    v19 = 0;
    v18 = 0;
  }
  else if (a3 == 2)
  {
    id v22 = objc_alloc_init((Class)sub_10000F4F8());
    v23 = [v22 dictationDataSharingOptInAlertViewModel];
    id v3 = [v23 title];
    id v9 = [v23 message];
    v18 = [v23 optOutButtonTitle];
    id v17 = [v23 optInButtonTitle];

    v19 = 0;
  }
  else if (a3)
  {
    id v3 = [(id)objc_opt_class() localizedStringForKey:@"EXTENSION_OPT_IN_TITLE"];
    id v9 = [(id)objc_opt_class() localizedStringForKey:@"EXTENSION_OPT_IN_MESSAGE"];
    v18 = [(id)objc_opt_class() localizedStringForKey:@"EXTENSION_OPT_IN_ADD"];
    v19 = [(id)objc_opt_class() localizedStringForKey:@"DICTATION_OPT_IN_ABOUT"];
    id v17 = [(id)objc_opt_class() localizedStringForKey:@"DICTATION_OPT_IN_NOT_NOW"];
  }
  else
  {
    id v3 = [(id)objc_opt_class() localizedStringForKey:@"DICTATION_OPT_IN_TITLE"];
    v4 = [(id)objc_opt_class() localizedStringForKey:@"DICTATION_OPT_IN_ABOUT"];
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x2020000000;
    id v5 = (uint64_t (*)(void))off_100026EC8;
    v39 = off_100026EC8;
    if (!off_100026EC8)
    {
      v31 = _NSConcreteStackBlock;
      uint64_t v32 = 3221225472;
      v33 = sub_100010338;
      v34 = &unk_10001C810;
      v35 = &v36;
      sub_100010338((uint64_t)&v31);
      id v5 = (uint64_t (*)(void))v37[3];
    }
    _Block_object_dispose(&v36, 8);
    if (!v5) {
      sub_1000116A8();
    }
    uint64_t v6 = v5();
    id v7 = objc_opt_class();
    if (v6 == 10) {
      CFStringRef v8 = @"DICTATION_OPT_IN_MESSAGE_ON_DEVICE_DICTATION_CAPABLE";
    }
    else {
      CFStringRef v8 = @"DICTATION_OPT_IN_MESSAGE";
    }
    id v9 = [v7 localizedStringForKey:v8];
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x2050000000;
    id v10 = (void *)qword_100026ED8;
    v39 = (void *)qword_100026ED8;
    if (!qword_100026ED8)
    {
      v31 = _NSConcreteStackBlock;
      uint64_t v32 = 3221225472;
      v33 = sub_1000104D4;
      v34 = &unk_10001C810;
      v35 = &v36;
      sub_1000104D4((uint64_t)&v31);
      id v10 = (void *)v37[3];
    }
    id v11 = v10;
    _Block_object_dispose(&v36, 8);
    id v12 = [v11 bundleWithIdentifier:@"com.apple.onboarding.siri"];
    id v13 = [v12 privacyFlow];
    uint64_t v14 = [v13 localizedButtonTitle];
    id v15 = (void *)v14;
    if (v14) {
      v16 = (void *)v14;
    }
    else {
      v16 = v4;
    }
    id v17 = v16;

    v18 = [(id)objc_opt_class() localizedStringForKey:@"DICTATION_OPT_IN_ENABLE"];
    v19 = [(id)objc_opt_class() localizedStringForKey:@"DICTATION_OPT_IN_NOT_NOW"];
  }
  v24 = +[NSMutableDictionary dictionary];
  [v24 setObject:v3 forKey:kCFUserNotificationAlertHeaderKey];
  [v24 setObject:v9 forKey:kCFUserNotificationAlertMessageKey];
  [v24 setObject:v17 forKey:kCFUserNotificationDefaultButtonTitleKey];
  v25 = +[NSNumber numberWithBool:1];
  [v24 setObject:v25 forKey:@"DismissOnLock"];

  if (v19) {
    [v24 setObject:v19 forKey:kCFUserNotificationOtherButtonTitleKey];
  }
  if (v18) {
    [v24 setObject:v18 forKey:kCFUserNotificationAlternateButtonTitleKey];
  }
  v26 = +[NSNumber numberWithBool:1];
  [v24 setObject:v26 forKey:@"SBUserNotificationAllowMenuButtonDismissal"];

  v27 = +[NSNumber numberWithBool:1];
  [v24 setObject:v27 forKey:@"SBUserNotificationForcesModalAlertAppearance"];

  v28 = +[NSNumber numberWithBool:1];
  [v24 setObject:v28 forKey:@"SBUserNotificationDisplayActionButtonOnLockScreen"];

  v29 = +[NSNumber numberWithBool:1];
  [v24 setObject:v29 forKey:kCFUserNotificationAlertTopMostKey];

  return v24;
}

- (void)dismissDialogWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  TIDispatchAsync();
}

- (void)dismissedDataSharingWithResponse:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = qword_100015668[a3];
  }
  sub_10000F7BC(v3);
  id v4 = [(id)qword_100026EA0 sharedPreferences];
  [v4 setSiriDataSharingOptInAlertPresented:1 completion:0];
}

- (void)removeAllDynamicDictionariesWithCompletionHandler:(id)a3
{
  id v3 = a3;
  if (TICanLogMessageAtLevel())
  {
    id v4 = TIOSLogFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_100011720();
    }
  }
  id v5 = v3;
  TIDispatchAsync();
}

- (TITextCheckerExemptions)textCheckerExemptions
{
  textCheckerExemptions = self->_textCheckerExemptions;
  if (!textCheckerExemptions)
  {
    id v4 = (TITextCheckerExemptions *)objc_opt_new();
    id v5 = self->_textCheckerExemptions;
    self->_textCheckerExemptions = v4;

    [(TITextCheckerExemptions *)self->_textCheckerExemptions setAssertsObservers:1];
    [(TITextCheckerExemptions *)self->_textCheckerExemptions setAssertsObservers:0];
    textCheckerExemptions = self->_textCheckerExemptions;
  }
  return textCheckerExemptions;
}

- (void)string:(id)a3 isExemptFromTextCheckerWithCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  if ([v6 _looksLikeNumberInput])
  {
    id v8 = 0;
  }
  else
  {
    id v9 = [(TIRemoteDataHandle *)self textCheckerExemptions];
    id v8 = [v9 stringIsExemptFromChecker:v6];
  }
  if (TICanLogMessageAtLevel())
  {
    id v10 = TIOSLogFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_1000117C0((char)v8, (uint64_t)v6, v10);
    }
  }
  v7[2](v7, v8);
}

+ (id)localDictionaryPath
{
  v2 = +[TIKeyboardInputManager keyboardUserDirectory];
  id v3 = [v2 stringByAppendingPathComponent:@"LocalDictionary"];

  return v3;
}

- (void)requestTextCheckerLocalDictionaryWithCompletionHandler:(id)a3
{
  id v3 = (void (**)(id, void *))a3;
  if (TICanLogMessageAtLevel())
  {
    id v4 = TIOSLogFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_100011894();
    }
  }
  id v5 = +[TIRemoteDataHandle localDictionaryPath];
  id v6 = +[NSData dataWithContentsOfFile:v5];
  v3[2](v3, v6);
}

- (void)appendWordToTextCheckerLocalDictionary:(id)a3
{
  id v3 = a3;
  if (TICanLogMessageAtLevel())
  {
    id v4 = TIOSLogFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_100011934((uint64_t)v3);
    }
  }
  id v5 = v3;
  id v6 = (const char *)[v5 UTF8String];
  id v7 = +[TIRemoteDataHandle localDictionaryPath];
  id v8 = fopen((const char *)[v7 fileSystemRepresentation], "a+");
  if (v8)
  {
    id v9 = v8;
    if (v5)
    {
      if (v6)
      {
        size_t v10 = strlen(v6);
        if (v10)
        {
          fwrite(v6, 1uLL, v10, v9);
          fwrite("\n", 1uLL, 1uLL, v9);
          fflush(v9);
          int v11 = fileno(v9);
          fsync(v11);
        }
      }
    }
    fclose(v9);
  }
}

+ (id)localizedStringForKey:(id)a3
{
  id v3 = a3;
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = +[NSLocale _deviceLanguage];
  id v6 = [v4 localizations];
  id v15 = v5;
  id v7 = +[NSArray arrayWithObjects:&v15 count:1];
  id v8 = +[NSBundle preferredLocalizationsFromArray:v6 forPreferences:v7];

  id v9 = [v8 objectAtIndexedSubscript:0];
  size_t v10 = [v4 localizedStringForKey:v3 value:0 table:@"AssistantSettings" localization:v9];
  int v11 = v10;
  if (v10 && ([v10 isEqualToString:v3] & 1) == 0)
  {
    id v12 = v11;
  }
  else
  {
    id v12 = [v4 localizedStringForKey:v3 value:&stru_10001CF20 table:@"AssistantSettings"];
  }
  id v13 = v12;

  return v13;
}

- (void)performTrainingForClient:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[TIResponseKitTrainerImpl sharedTrainer];
  [v7 performTrainingForClient:v6 withCompletionHandler:v5];
}

- (void)updateForActiveLocaleIdentifiers:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  TIDispatchAsync();
}

- (void)updateKeyboardType:(unint64_t)a3 appIdentifier:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  TIDispatchAsync();
}

- (void)alternativesForText:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v5 = v8;
  id v6 = v7;
  TIDispatchAsync();
}

- (void)ingestSentence:(id)a3 language:(id)a4 phraseRanges:(id)a5
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_1000119D8();
  }
}

- (void).cxx_destruct
{
}

@end