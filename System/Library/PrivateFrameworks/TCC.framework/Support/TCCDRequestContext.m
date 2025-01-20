@interface TCCDRequestContext
- (BOOL)accessSetPrompt;
- (BOOL)initialPrompt;
- (BOOL)isPreflight;
- (BOOL)reminderPrompt;
- (BOOL)watchInitiatedPrompt;
- (NSDictionary)clientDict;
- (NSDictionary)daemonDict;
- (NSString)functionName;
- (NSString)identityDescription;
- (NSString)messageIdentifier;
- (OS_dispatch_semaphore)promptingSemaphore;
- (OS_tcc_identity)explicitlyAssumedIdentity;
- (TCCDAccessIdentity)subjectIdentity;
- (TCCDAttributionChain)attributionChain;
- (TCCDRequestContext)init;
- (TCCDRequestContext)initWithRequestMessage:(id)a3 forServer:(id)a4 error:(id *)a5;
- (TCCDServer)server;
- (TCCDService)service;
- (id)initForSyncRequestForSubjectBundleIdentifier:(id)a3 service:(id)a4;
- (int)promptingSemaphoreHeld;
- (int)userTccdUnavailable;
- (unint64_t)desiredAuth;
- (unint64_t)promptRightsMask;
- (unint64_t)promptingPolicy;
- (unint64_t)queryCount;
- (unint64_t)recordUpgradePolicy;
- (unint64_t)spiVersion;
- (unint64_t)usageStringPolicy;
- (void)dealloc;
- (void)presentAsynchronousDenialNotificationForService:(id)a3;
- (void)presentAsynchronousDenialNotificationWithMessage:(id)a3 buttonTitle:(id)a4;
- (void)presentSynchronousPromptWithHeader:(id)a3 message:(id)a4 aButtonTitle:(id)a5 aButtonAuth:(unint64_t)a6 bButtonTitle:(id)a7 bButtonAuth:(unint64_t)a8 cButtonTitle:(id)a9 cButtonAuth:(unint64_t)a10 currentAuth:(unint64_t)a11 updatingResult:(id)a12;
- (void)presentSynchronousPromptWithHeader:(id)a3 message:(id)a4 aButtonTitle:(id)a5 aButtonAuth:(unint64_t)a6 bButtonTitle:(id)a7 bButtonAuth:(unint64_t)a8 cButtonTitle:(id)a9 cButtonAuth:(unint64_t)a10 currentAuth:(unint64_t)a11 withTimeoutInSeconds:(unsigned int)a12 updatingResult:(id)a13;
- (void)presentSynchronousPromptWithHeader:(id)a3 message:(id)a4 aButtonTitle:(id)a5 aButtonAuth:(unint64_t)a6 bButtonTitle:(id)a7 bButtonAuth:(unint64_t)a8 currentAuth:(unint64_t)a9 updatingResult:(id)a10;
- (void)setAccessSetPrompt:(BOOL)a3;
- (void)setAttributionChain:(id)a3;
- (void)setClientDict:(id)a3;
- (void)setDesiredAuth:(unint64_t)a3;
- (void)setExplicitlyAssumedIdentity:(id)a3;
- (void)setFunctionName:(id)a3;
- (void)setInitialPrompt:(BOOL)a3;
- (void)setMessageIdentifier:(id)a3;
- (void)setPromptRightsMask:(unint64_t)a3;
- (void)setPromptingPolicy:(unint64_t)a3;
- (void)setPromptingSemaphore:(id)a3;
- (void)setPromptingSemaphoreHeld:(int)a3;
- (void)setQueryCount:(unint64_t)a3;
- (void)setRecordUpgradePolicy:(unint64_t)a3;
- (void)setReminderPrompt:(BOOL)a3;
- (void)setServer:(id)a3;
- (void)setService:(id)a3;
- (void)setSpiVersion:(unint64_t)a3;
- (void)setSubjectIdentity:(id)a3;
- (void)setUsageStringPolicy:(unint64_t)a3;
- (void)setUserTccdUnavailable:(int)a3;
- (void)setWatchInitiatedPrompt:(BOOL)a3;
@end

@implementation TCCDRequestContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promptingSemaphore, 0);
  objc_storeStrong((id *)&self->_explicitlyAssumedIdentity, 0);
  objc_storeStrong((id *)&self->_clientDict, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_subjectIdentity, 0);
  objc_storeStrong((id *)&self->_attributionChain, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_messageIdentifier, 0);
  objc_storeStrong((id *)&self->_functionName, 0);
}

- (TCCDRequestContext)initWithRequestMessage:(id)a3 forServer:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v60.receiver = self;
  v60.super_class = (Class)TCCDRequestContext;
  v10 = [(TCCDRequestContext *)&v60 init];
  v11 = v10;
  if (!v10
    || ([(TCCDRequestContext *)v10 setPromptingPolicy:0],
        [(TCCDRequestContext *)v11 setUsageStringPolicy:0],
        [(TCCDRequestContext *)v11 setRecordUpgradePolicy:0],
        [(TCCDRequestContext *)v11 setUserTccdUnavailable:0],
        [(TCCDRequestContext *)v11 setServer:v9],
        !v8)
    || !v9)
  {
LABEL_57:
    v46 = v11;
    goto LABEL_58;
  }
  v11->_unint64_t spiVersion = 1;
  uint64_t v12 = xpc_dictionary_get_value(v8, "TCCD_MSG_REQUEST_TYPE_KEY");
  if (v12)
  {
    v13 = (void *)v12;
    uint64_t uint64 = xpc_dictionary_get_uint64(v8, "TCCD_MSG_REQUEST_TYPE_KEY");

    if (!uint64)
    {
      functionName = v11->_functionName;
      v11->_functionName = (NSString *)@"TCCAccessRequest";

      v11->_unint64_t spiVersion = xpc_dictionary_get_uint64(v8, "TCCD_MSG_SPI_VERSION");
      goto LABEL_11;
    }
  }
  string = xpc_dictionary_get_string(v8, "function");
  if (string)
  {
    uint64_t v16 = +[NSString stringWithUTF8String:string];
    v17 = v11->_functionName;
    v11->_functionName = (NSString *)v16;

LABEL_11:
    uint64_t v21 = [v9 serviceFromMessage:v8 error:a5];
    service = v11->_service;
    v11->_service = (TCCDService *)v21;

    if (v11->_service)
    {
      v23 = xpc_dictionary_get_string(v8, "TCCD_MSG_ID");
      if (v23)
      {
        v24 = (NSString *)[objc_alloc((Class)NSString) initWithUTF8String:v23];
        messageIdentifier = v11->_messageIdentifier;
        v11->_messageIdentifier = v24;
      }
      else
      {
        messageIdentifier = v11->_messageIdentifier;
        v11->_messageIdentifier = (NSString *)@"?";
      }

      v26 = [[TCCDAttributionChain alloc] initWithMessage:v8];
      p_attributionChain = (id *)&v11->_attributionChain;
      attributionChain = v11->_attributionChain;
      v11->_attributionChain = v26;

      if (v11->_attributionChain)
      {
        v29 = [(TCCDAttributionChain *)v11->_attributionChain requestingProcess];

        if (v29)
        {
          v30 = [*p_attributionChain accessingProcess];

          if (v30)
          {
            v31 = [*p_attributionChain responsibleProcess];

            if (v31)
            {
              v32 = xpc_dictionary_get_dictionary(v8, "TCC_MSG_REQUEST_AUTHORIZATION_SUBJECT_CREDENTIAL_DICTIONARY_KEY");
              v33 = xpc_dictionary_get_dictionary(v32, "TCCD_MSG_CREDENTIAL_ASSUMED_IDENTITY");
              v34 = v33;
              if (v33)
              {
                xpc_dictionary_get_uint64(v33, "TCCD_MSG_IDENTITY_TYPE_KEY");
                if (xpc_dictionary_get_string(v34, "TCCD_MSG_IDENTITY_ID_KEY"))
                {
                  uint64_t v35 = tcc_identity_create();
                  v36 = (void *)tcc_object_copy_description();
                  v37 = [v9 logHandle];
                  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
                    sub_10004F128((uint64_t *)&v11->_attributionChain, (uint64_t)v36, v37);
                  }

                  explicitlyAssumedIdentity = v11->_explicitlyAssumedIdentity;
                  v11->_explicitlyAssumedIdentity = (OS_tcc_identity *)v35;
                }
              }
              v11->_userTccdUnavailable = xpc_dictionary_get_BOOL(v8, "user_tccd_unavailable");
              unint64_t spiVersion = v11->_spiVersion;
              if (spiVersion == 2)
              {
                v11->_promptingPolicy = xpc_dictionary_get_uint64(v8, "TCCD_MSG_MESSAGE_OPTION_REQUEST_PROMPT_POLICY_KEY");
                v11->_usageStringPolicy = xpc_dictionary_get_uint64(v8, "TCCD_MSG_MESSAGE_OPTION_REQUEST_USAGE_STRING_POLICY_KEY");
                v11->_recordUpgradePolicy = xpc_dictionary_get_uint64(v8, "TCCD_MSG_MESSAGE_OPTION_REQUEST_RECORD_UPGRADE_POLICY_POLICY_KEY");
                v11->_promptRightsMask = xpc_dictionary_get_uint64(v8, "TCCD_MSG_MESSAGE_OPTION_REQUEST_PROMPT_RIGHTS_MASK_KEY");
                v11->_desiredAuth = xpc_dictionary_get_uint64(v8, "desired_auth_value");
                if (!-[TCCDAttributionChain accessingProcessSpecified](v11->_attributionChain, "accessingProcessSpecified")|| (-[TCCDAttributionChain requestingProcess](v11->_attributionChain, "requestingProcess"), v47 = objc_claimAutoreleasedReturnValue(), unsigned int v48 = [v47 hasEntitlement:@"com.apple.private.tcc.set_client_data" containsServiceAllOrService:v11->_service options:0], v47, v48))
                {
                  size_t length = 0;
                  data = (const UInt8 *)xpc_dictionary_get_data(v8, "TCCD_MSG_MESSAGE_OPTION_REQUEST_PROMPT_CLIENT_DICT_KEY", &length);
                  if (data)
                  {
                    if (length)
                    {
                      CFDataRef v50 = CFDataCreate(0, data, length);
                      if (v50)
                      {
                        CFDataRef v51 = v50;
                        CFDictionaryRef v52 = (const __CFDictionary *)CFPropertyListCreateWithData(0, v50, 0, 0, 0);
                        if (v52)
                        {
                          CFDictionaryRef v53 = v52;
                          CFTypeID v54 = CFGetTypeID(v52);
                          if (v54 == CFDictionaryGetTypeID())
                          {
                            CFDictionaryRef Copy = CFDictionaryCreateCopy(0, v53);
                            clientDict = v11->_clientDict;
                            v11->_clientDict = (NSDictionary *)Copy;
                          }
                          CFRelease(v53);
                        }
                        CFRelease(v51);
                      }
                    }
                  }
                  v57 = [v9 logHandle];
                  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG)) {
                    sub_10004F0AC((uint64_t *)&v11->_attributionChain, v57);
                  }
                }
                v11->_initialPrompt = 1;
              }
              else if (spiVersion == 1)
              {
                v40 = xpc_dictionary_get_value(v8, "require_purpose");
                v41 = v40;
                if (v40 && xpc_get_type(v40) == (xpc_type_t)&_xpc_type_BOOL)
                {
                  BOOL value = xpc_BOOL_get_value(v41);
                  uint64_t v43 = 1;
                  if (!value) {
                    uint64_t v43 = 2;
                  }
                  v11->_usageStringPolicy = v43;
                }
                BOOL v44 = xpc_dictionary_get_BOOL(v8, "preflight");
                uint64_t v45 = 2;
                if (!v44) {
                  uint64_t v45 = 0;
                }
                v11->_promptingPolicy = v45;
                v11->_recordUpgradePolicy = 1;
              }
              goto LABEL_57;
            }
            CFStringRef v18 = @"Failed to create Responsible Process from message.";
          }
          else
          {
            CFStringRef v18 = @"Failed to create Accessing Process from message.";
          }
        }
        else
        {
          CFStringRef v18 = @"Failed to create Requesting Process from message.";
        }
      }
      else
      {
        CFStringRef v18 = @"Failed to create Attribution Chain from message.";
      }
      if (a5)
      {
        uint64_t v19 = 5;
        goto LABEL_40;
      }
    }
LABEL_41:
    v46 = 0;
    goto LABEL_58;
  }
  if (!a5) {
    goto LABEL_41;
  }
  CFStringRef v18 = @"Refusing Request for missing function key.";
  uint64_t v19 = 7;
LABEL_40:
  v46 = 0;
  *a5 = +[TCCDServer newErrorWithCode:v19 format:v18];
LABEL_58:

  return v46;
}

- (TCCDService)service
{
  return self->_service;
}

- (TCCDAttributionChain)attributionChain
{
  return self->_attributionChain;
}

- (TCCDAccessIdentity)subjectIdentity
{
  return self->_subjectIdentity;
}

- (NSString)messageIdentifier
{
  return self->_messageIdentifier;
}

- (unint64_t)queryCount
{
  return self->_queryCount;
}

- (NSString)functionName
{
  return self->_functionName;
}

- (BOOL)isPreflight
{
  return (id)[(TCCDRequestContext *)self promptingPolicy] == (id)2
      || (id)[(TCCDRequestContext *)self promptingPolicy] == (id)1;
}

- (unint64_t)promptingPolicy
{
  return self->_promptingPolicy;
}

- (void)setUserTccdUnavailable:(int)a3
{
  self->_userTccdUnavailable = a3;
}

- (void)setUsageStringPolicy:(unint64_t)a3
{
  self->_usageStringPolicy = a3;
}

- (void)setServer:(id)a3
{
}

- (void)setRecordUpgradePolicy:(unint64_t)a3
{
  self->_recordUpgradePolicy = a3;
}

- (void)setQueryCount:(unint64_t)a3
{
  self->_queryCount = a3;
}

- (void)setPromptingPolicy:(unint64_t)a3
{
  self->_promptingPolicy = a3;
}

- (void)dealloc
{
  if (self->_promptingSemaphoreHeld)
  {
    v3 = tcc_access_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      messageIdentifier = self->_messageIdentifier;
      *(_DWORD *)buf = 138543362;
      v7 = messageIdentifier;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "signaling prompting semaphore for msgID=%{public}@", buf, 0xCu);
    }

    dispatch_semaphore_signal((dispatch_semaphore_t)self->_promptingSemaphore);
    self->_promptingSemaphoreHeld = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)TCCDRequestContext;
  [(TCCDRequestContext *)&v5 dealloc];
}

- (NSDictionary)daemonDict
{
  v12[0] = kTCCNotificationExtensionDaemonDataInitialPromptKey;
  v3 = +[NSNumber numberWithBool:[(TCCDRequestContext *)self initialPrompt]];
  v13[0] = v3;
  v12[1] = kTCCNotificationExtensionDaemonDataDesiredAuthKey;
  v4 = +[NSNumber numberWithUnsignedLongLong:[(TCCDRequestContext *)self desiredAuth]];
  v13[1] = v4;
  v12[2] = kTCCNotificationExtensionDaemonDataSetPromptKey;
  objc_super v5 = +[NSNumber numberWithBool:[(TCCDRequestContext *)self accessSetPrompt]];
  v13[2] = v5;
  v12[3] = kTCCNotificationExtensionDaemonDataInfoString;
  v6 = [(TCCDRequestContext *)self service];
  v7 = [(TCCDRequestContext *)self service];
  id v8 = [v7 requestNotificationExtensionTextLocalizationKey];
  id v9 = [v6 localizedTextWithKey:v8];
  v13[3] = v9;
  v10 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:4];

  return (NSDictionary *)v10;
}

- (unint64_t)desiredAuth
{
  return self->_desiredAuth;
}

- (BOOL)initialPrompt
{
  return self->_initialPrompt;
}

- (NSDictionary)clientDict
{
  return self->_clientDict;
}

- (BOOL)accessSetPrompt
{
  return self->_accessSetPrompt;
}

- (void)setSubjectIdentity:(id)a3
{
}

- (NSString)identityDescription
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  v4 = [(TCCDRequestContext *)self subjectIdentity];

  if (v4)
  {
    objc_super v5 = [(TCCDRequestContext *)self subjectIdentity];
    v6 = [v5 identifier];
    [v3 appendFormat:@"Sub:{%@}", v6];
  }
  v7 = [(TCCDRequestContext *)self attributionChain];
  id v8 = [v7 responsibleProcess];

  if (v8)
  {
    id v9 = [(TCCDRequestContext *)self attributionChain];
    v10 = [v9 responsibleProcess];
    v11 = [v10 description];
    [v3 appendFormat:@"Resp:{%@}", v11];
  }
  id v12 = [v3 copy];

  return (NSString *)v12;
}

- (unint64_t)spiVersion
{
  return self->_spiVersion;
}

- (unint64_t)recordUpgradePolicy
{
  return self->_recordUpgradePolicy;
}

- (void)presentAsynchronousDenialNotificationWithMessage:(id)a3 buttonTitle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = tcc_access_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [(TCCDRequestContext *)self subjectIdentity];
    v10 = [v9 identifier];
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[TCCDRequestContext(AsynchronousNotification) presentAsynchronousDenialNotificationWithMessage:buttonTitle:]";
    __int16 v61 = 2112;
    v62 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s: called for %@", buf, 0x16u);
  }
  if (qword_1000AC648 != -1) {
    dispatch_once(&qword_1000AC648, &stru_100096110);
  }
  if (qword_1000AC638)
  {
    v11 = objc_opt_new();
    if (v11)
    {
      id v12 = v11;
      id v57 = v6;
      [v11 setBody:v6];
      v13 = (void *)qword_1000AC638;
      v14 = [(TCCDRequestContext *)self service];
      v15 = [v14 name];
      id v16 = v13;
      id v17 = v15;
      id v56 = v7;
      id v18 = v7;
      if (!qword_1000AC668)
      {
        uint64_t v19 = objc_opt_new();
        v20 = (void *)qword_1000AC668;
        qword_1000AC668 = v19;
      }
      uint64_t v21 = +[NSString stringWithFormat:@"%@.%@", @"com.apple.tcc.notification", v17];
      v22 = [(id)qword_1000AC668 objectForKeyedSubscript:v21];
      if (!v22)
      {
        v55 = +[UNNotificationAction actionWithIdentifier:@"BUTTON_ACTION_ID" title:v18 options:0];
        *(void *)buf = v55;
        v23 = +[NSArray arrayWithObjects:buf count:1];
        v22 = +[UNNotificationCategory categoryWithIdentifier:v21 actions:v23 intentIdentifiers:&__NSArray0__struct options:0];

        [(id)qword_1000AC668 setObject:v22 forKeyedSubscript:v21];
        v24 = [(id)qword_1000AC668 allValues];
        v25 = +[NSSet setWithArray:v24];
        [v16 setNotificationCategories:v25];
      }
      [v12 setCategoryIdentifier:v21];

      [v12 setInterruptionLevel:1];
      v26 = +[UNNotificationSound defaultSound];
      [v12 setSound:v26];

      [v12 setShouldIgnoreDoNotDisturb:1];
      [v12 setShouldBackgroundDefaultAction:1];
      CFStringRef v58 = @"TCCServiceName";
      v27 = [(TCCDRequestContext *)self service];
      v28 = [v27 name];
      v59 = v28;
      v29 = +[NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
      [v12 setUserInfo:v29];

      v30 = +[NSUUID UUID];
      v31 = [v30 UUIDString];
      v32 = +[UNNotificationRequest requestWithIdentifier:v31 content:v12 trigger:0];

      if (v32)
      {
        [(id)qword_1000AC638 addNotificationRequest:v32 withCompletionHandler:&stru_100096150];

        id v7 = v56;
        id v6 = v57;
      }
      else
      {
        v47 = tcc_access_log();
        id v7 = v56;
        id v6 = v57;
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          sub_100041980(v47, v48, v49, v50, v51, v52, v53, v54);
        }
      }
    }
    else
    {
      id v12 = tcc_access_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100041908(v12, v40, v41, v42, v43, v44, v45, v46);
      }
    }
  }
  else
  {
    id v12 = tcc_access_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100041890(v12, v33, v34, v35, v36, v37, v38, v39);
    }
  }
}

- (void)presentAsynchronousDenialNotificationForService:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 notificationTitleTextLocalizationKey];
  id v6 = [v4 localizedTextWithKey:v5];

  id v7 = [(TCCDRequestContext *)self subjectIdentity];
  id v8 = [v7 displayName];
  id v9 = +[NSString stringWithValidatedFormat:v6, @"%@", 0, v8 validFormatSpecifiers error];

  if (v9)
  {
    v10 = [v4 notificationButtonTitleLocalizationKey];
    v11 = [v4 localizedTextWithKey:v10];

    if (v11) {
      [(TCCDRequestContext *)self presentAsynchronousDenialNotificationWithMessage:v9 buttonTitle:v11];
    }
  }
  else
  {
    v11 = tcc_access_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100041A84(v4, self, v11);
    }
  }
}

- (void)presentSynchronousPromptWithHeader:(id)a3 message:(id)a4 aButtonTitle:(id)a5 aButtonAuth:(unint64_t)a6 bButtonTitle:(id)a7 bButtonAuth:(unint64_t)a8 cButtonTitle:(id)a9 cButtonAuth:(unint64_t)a10 currentAuth:(unint64_t)a11 withTimeoutInSeconds:(unsigned int)a12 updatingResult:(id)a13
{
  id v19 = a3;
  id v167 = a4;
  id v166 = a5;
  id v165 = a7;
  id v164 = a9;
  id v20 = a13;
  if (qword_1000AC660 != -1) {
    dispatch_once(&qword_1000AC660, &stru_100096170);
  }
  [(TCCDRequestContext *)self setPromptingSemaphore:qword_1000AC650];
  if (![(TCCDRequestContext *)self promptingSemaphoreHeld])
  {
    [(TCCDRequestContext *)self setPromptingSemaphoreHeld:1];
    v22 = [(TCCDRequestContext *)self promptingSemaphore];
    intptr_t v23 = dispatch_semaphore_wait(v22, 0);

    if (v23)
    {
      v24 = tcc_access_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v25 = [(TCCDRequestContext *)self identityDescription];
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Delaying prompt for %{public}@", buf, 0xCu);
      }
      v26 = [(TCCDRequestContext *)self promptingSemaphore];
      dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);

      [v20 setDatabaseAction:2];
      goto LABEL_138;
    }
  }
  uint64_t v21 = [(TCCDRequestContext *)self service];
  objc_msgSend(v21, "ios_watchKitUserNotificationNumber");
  id v159 = v20;
  v162 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  if (v162)
  {
  }
  else
  {
    v27 = [(TCCDRequestContext *)self subjectIdentity];
    unsigned int v28 = objc_msgSend(v27, "is_wk2_proxy");

    if (!v28)
    {
      v162 = 0;
      goto LABEL_23;
    }
  }
  v29 = [(TCCDRequestContext *)self subjectIdentity];
  v30 = [v29 pluginBundleIdentifier];

  if (!v30)
  {
    uint64_t v38 = [(TCCDRequestContext *)self subjectIdentity];
    unsigned int v39 = objc_msgSend(v38, "is_wk2_proxy");

    if (v39)
    {
      uint64_t v40 = v162;
      if (!v162) {
        uint64_t v40 = &off_10009CF10;
      }
      uint64_t v41 = tcc_sync_log();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
        sub_100041CF4(v40, self, v41);
      }

      v32 = [sub_100040FA8() sharedDeviceConnection];
      v162 = v40;
      id v42 = [v40 integerValue];
      uint64_t v34 = [(TCCDRequestContext *)self subjectIdentity];
      uint64_t v35 = [v34 displayName];
      [v32 showUserNotification:v42 bundleID:v35];
      goto LABEL_21;
    }
LABEL_23:
    int v43 = 0;
    goto LABEL_24;
  }
  v31 = tcc_sync_log();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
    sub_100041DC0(v162, self, v31);
  }

  v32 = [sub_100040FA8() sharedDeviceConnection];
  id v33 = [v162 integerValue];
  uint64_t v34 = [(TCCDRequestContext *)self subjectIdentity];
  uint64_t v35 = [v34 displayName];
  uint64_t v36 = [(TCCDRequestContext *)self subjectIdentity];
  uint64_t v37 = [v36 pluginBundleIdentifier];
  [v32 showUserNotification:v33 applicationName:v35 extensionBundleID:v37];

LABEL_21:
  int v43 = 1;
  id v20 = v159;
LABEL_24:
  uint64_t v44 = self;
  id v45 = v19;
  id v46 = v167;
  id v47 = v166;
  id v170 = v165;
  id v169 = v164;
  id v157 = v20;
  uint64_t v48 = objc_opt_new();
  v161 = v45;
  if (!v45) {
    sub_100041B48();
  }
  if (!v47) {
    sub_100041B74();
  }
  if (!v170) {
    sub_100041BA0();
  }
  uint64_t v49 = (void *)v48;
  v168 = v47;
  v160 = v46;
  int v156 = v43;
  uint64_t v50 = tcc_access_log();
  v163 = v44;
  if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
  {
    uint64_t v51 = [(TCCDRequestContext *)v44 subjectIdentity];
    uint64_t v52 = [v51 identifier];
    uint64_t v53 = [(TCCDRequestContext *)v44 service];
    uint64_t v54 = [v53 name];
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "display_prompt";
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v52;
    *(_WORD *)&buf[22] = 2112;
    v181 = v54;
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "%s: called for %@ for service %@", buf, 0x20u);
  }
  v55 = [(TCCDRequestContext *)v44 service];
  id v56 = [v55 localizedResourcesBundle];
  id v57 = [v56 bundleURL];
  [v49 setObject:v57 forKeyedSubscript:kCFUserNotificationLocalizationURLKey];

  [v49 setObject:v161 forKeyedSubscript:kCFUserNotificationAlertHeaderKey];
  if (v160) {
    [v49 setObject:v160 forKeyedSubscript:kCFUserNotificationAlertMessageKey];
  }
  id v158 = v19;
  long long v187 = xmmword_1000764B0;
  long long v188 = unk_1000764C0;
  unint64_t v58 = a8;
  v59 = v168;
  if (v169)
  {
    *(void *)&long long v187 = a8;
    unint64_t v58 = a10;
  }
  *((void *)&v187 + 1) = v58;
  *(void *)&long long v188 = a6;
  v186[0] = (id)kCFUserNotificationDefaultButtonTitleKey;
  v186[1] = (id)kCFUserNotificationAlternateButtonTitleKey;
  uint64_t v60 = 0;
  v186[2] = (id)kCFUserNotificationOtherButtonTitleKey;
  v186[3] = 0;
  uint64_t v155 = 134217984;
  do
  {
    id v61 = (id)v186[v60];
    if (!v61) {
      goto LABEL_43;
    }
    uint64_t v62 = *(void *)((char *)&v187 + v60 * 8);
    if (v62 == a6)
    {
      v63 = v49;
      id v64 = v59;
LABEL_42:
      [v63 setObject:v64 forKeyedSubscript:v61];
      goto LABEL_43;
    }
    if (v62 == a8)
    {
      v63 = v49;
      id v64 = v170;
      goto LABEL_42;
    }
    if (v62 == a10)
    {
      if (!v169) {
        goto LABEL_43;
      }
      v63 = v49;
      id v64 = v169;
      goto LABEL_42;
    }
    v65 = tcc_access_log();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v62;
      _os_log_error_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "tried to assign invalid auth %llu to button", buf, 0xCu);
    }

    v59 = v168;
LABEL_43:

    ++v60;
  }
  while (v60 != 4);
  char v66 = _os_feature_enabled_impl();
  id v19 = v158;
  v67 = v163;
  if (v66)
  {
    v68 = [(TCCDRequestContext *)v163 service];
    if (![v68 usesTwoStagePrompting]) {
      goto LABEL_54;
    }
    v69 = [(TCCDRequestContext *)v163 service];
    uint64_t v70 = [v69 firstStagePromptHeaderAssetCatalogPath];
    if (!v70) {
      goto LABEL_53;
    }
    v71 = (void *)v70;
    v72 = [(TCCDRequestContext *)v163 service];
    a8 = [v72 firstStagePromptHeaderAssetName];

    if (a8)
    {
      v73 = [(TCCDRequestContext *)v163 service];
      v74 = [v73 firstStagePromptHeaderAssetCatalogPath];
      [v49 setObject:v74 forKeyedSubscript:SBUserNotificationHeaderImageAssetCatalogPathKey];

      v68 = [(TCCDRequestContext *)v163 service];
      v69 = [v68 firstStagePromptHeaderAssetName];
      [v49 setObject:v69 forKeyedSubscript:SBUserNotificationHeaderImageAssetCatalogImageKey];
LABEL_53:

LABEL_54:
    }
  }
  if (_os_feature_enabled_impl())
  {
    v75 = [(TCCDRequestContext *)v163 service];
    unsigned int v76 = [v75 usesTwoStagePrompting];

    if (v76) {
      [v49 setObject:&off_10009CF28 forKeyedSubscript:SBUserNotificationButtonLayoutDirectionKey];
    }
  }
  v77 = [(TCCDRequestContext *)v163 service];
  v78 = [v77 name];
  unsigned int v79 = [v78 isEqualToString:@"kTCCServiceFocusStatus"];

  if (v79) {
    [v49 setObject:@"com.apple.FocusSettingsUI.UserNotificationExtension" forKeyedSubscript:SBUserNotificationExtensionIdentifierKey];
  }
  v80 = [(TCCDRequestContext *)v163 service];
  v81 = [v80 name];
  id v82 = [v81 isEqualToString:@"kTCCServicePhotos"];

  if (v82) {
    [v49 setObject:@"com.apple.mobileslideshow.PhotosTCCNotificationExtension" forKeyedSubscript:SBUserNotificationExtensionIdentifierKey];
  }
  v83 = [(TCCDRequestContext *)v163 service];
  v84 = [v83 name];
  if (([v84 isEqualToString:@"kTCCServiceCalendar"] & 1) == 0)
  {

    goto LABEL_67;
  }
  id v82 = [(TCCDRequestContext *)v163 service];
  unsigned int v85 = [v82 supportsStagedPrompting];

  if (v85)
  {
    v86 = [(TCCDRequestContext *)v163 service];
    id v82 = [v86 authSpecificNotificationExtensionBundleIdentifier];
    v87 = +[NSNumber numberWithUnsignedLongLong:[(TCCDRequestContext *)v163 desiredAuth]];
    v83 = [v82 objectForKeyedSubscript:v87];

    if (v83) {
      [v49 setObject:v83 forKeyedSubscript:SBUserNotificationExtensionIdentifierKey];
    }
LABEL_67:
  }
  if (_os_feature_enabled_impl() && _os_feature_enabled_impl())
  {
    v88 = [(TCCDRequestContext *)v163 service];
    v83 = [v88 name];
    if ([v83 isEqualToString:@"kTCCServiceAddressBook"])
    {
      id v82 = [(TCCDRequestContext *)v163 desiredAuth];

      if (v82 == (id)2)
      {
        v89 = tcc_access_log();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
        {
          v83 = [(TCCDRequestContext *)v163 subjectIdentity];
          id v82 = [v83 identifier];
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "display_prompt";
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v82;
          _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_INFO, "%s: Contacts full access prompt called for %@", buf, 0x16u);
        }
        [v49 setObject:@"com.apple.ContactsUI.FullAccessSettingsPromptExtension" forKeyedSubscript:SBUserNotificationExtensionIdentifierKey];
        [v49 setObject:0 forKeyedSubscript:SBUserNotificationHeaderImageAssetCatalogPathKey];
        [v49 setObject:0 forKeyedSubscript:SBUserNotificationHeaderImageAssetCatalogImageKey];
      }
    }
    else
    {
    }
  }
  if (_os_feature_enabled_impl())
  {
    v90 = [(TCCDRequestContext *)v163 service];
    v83 = [v90 name];
    id v82 = [v83 isEqualToString:@"kTCCServiceBluetoothAlways"];

    if (v82) {
      [v49 setObject:@"com.apple.corelocation.CoreLocationNumberedMapCalloutPromptPlugin" forKeyedSubscript:SBUserNotificationExtensionIdentifierKey];
    }
  }
  v91 = [(TCCDRequestContext *)v163 service];
  unsigned int v92 = [v91 supportsStagedPrompting];
  char v93 = v92;
  v94 = &AnalyticsSendEventLazy_ptr;
  if (!v92)
  {
LABEL_82:
    int v96 = _os_feature_enabled_impl();
    if (v96)
    {
      v83 = [(TCCDRequestContext *)v163 service];
      id v82 = [v83 name];
      if ([v82 isEqualToString:@"kTCCServiceBluetoothAlways"])
      {

        v67 = v163;
        v94 = &AnalyticsSendEventLazy_ptr;
        if (v93) {
          goto LABEL_85;
        }
        goto LABEL_87;
      }
    }
    if _os_feature_enabled_impl() && (_os_feature_enabled_impl())
    {
      [(TCCDRequestContext *)v163 service];
      v98 = unint64_t v97 = a8;
      v99 = [v98 name];
      unsigned __int8 v100 = [v99 isEqualToString:@"kTCCServiceAddressBook"];

      id v19 = v158;
      a8 = v97;
      if (!v96)
      {
LABEL_94:
        if (v93)
        {
        }
        id v20 = v159;
        v67 = v163;
        v94 = &AnalyticsSendEventLazy_ptr;
        if (v100) {
          goto LABEL_97;
        }
        goto LABEL_111;
      }
    }
    else
    {
      unsigned __int8 v100 = 0;
      if ((v96 & 1) == 0) {
        goto LABEL_94;
      }
    }

    goto LABEL_94;
  }
  v95 = [(TCCDRequestContext *)v163 service];
  v83 = [v95 name];
  if (([v83 isEqualToString:@"kTCCServiceCalendar"] & 1) == 0)
  {
    v154 = v83;
    uint64_t v155 = (uint64_t)v95;
    a8 = [(TCCDRequestContext *)v163 service];
    v153 = [(id)a8 name];
    if (([v153 isEqualToString:@"kTCCServicePhotos"] & 1) == 0) {
      goto LABEL_82;
    }
LABEL_85:

    v95 = (void *)v155;
    v83 = v154;
  }

LABEL_87:
  id v20 = v159;
LABEL_97:
  v184[0] = kTCCNotificationExtensionClientDataKey;
  uint64_t v101 = [(TCCDRequestContext *)v67 clientDict];
  v102 = (void *)v101;
  if (v101) {
    v103 = (void *)v101;
  }
  else {
    v103 = &__NSDictionary0__struct;
  }
  v185[0] = v103;
  v184[1] = kTCCNotificationExtensionDaemonDataKey;
  uint64_t v104 = [(TCCDRequestContext *)v67 daemonDict];
  v105 = (void *)v104;
  if (v104) {
    v106 = (void *)v104;
  }
  else {
    v106 = &__NSDictionary0__struct;
  }
  v185[1] = v106;
  v184[2] = @"ClientBundleIdentifier";
  v107 = [(TCCDRequestContext *)v67 subjectIdentity];
  v108 = [v107 identifier];
  v185[2] = v108;
  v109 = +[NSDictionary dictionaryWithObjects:v185 forKeys:v184 count:3];

  id v110 = objc_alloc_init((Class)NSExtensionItem);
  [v110 setUserInfo:v109];
  v111 = tcc_access_log();
  if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v109;
    _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_DEFAULT, "extensionItem.userInfo: %@", buf, 0xCu);
  }

  id v183 = v110;
  v112 = [v94[333] arrayWithObjects:&v183 count:1];
  id v173 = 0;
  v113 = +[NSKeyedArchiver archivedDataWithRootObject:v112 requiringSecureCoding:1 error:&v173];
  id v114 = v173;

  if (v114)
  {
    v115 = tcc_access_log();
    if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR)) {
      sub_100041C88((uint64_t)v114, v115, v116, v117, v118, v119, v120, v121);
    }
  }
  else
  {
    [v49 setObject:v113 forKeyedSubscript:SBUserNotificationExtensionItemsKey];
  }

LABEL_111:
  if (&SBUserNotificationDefaultButtonTag) {
    [v49 setObject:&off_10009CF40 forKeyedSubscript:SBUserNotificationDefaultButtonTag];
  }
  if ([(TCCDRequestContext *)v67 reminderPrompt]) {
    [v49 setObject:&off_10009EAD0 forKeyedSubscript:SBUserNotificationAllowedApplicationsKey];
  }
  v122 = tcc_access_log();
  if (os_log_type_enabled(v122, OS_LOG_TYPE_DEBUG)) {
    sub_100041C10((uint64_t)v49, v122);
  }

  SInt32 error = 0;
  CFUserNotificationRef v123 = CFUserNotificationCreate(0, 0.0, 0x20uLL, &error, (CFDictionaryRef)v49);
  uint64_t v124 = error;
  if (!v123 || error)
  {
    v134 = [(TCCDRequestContext *)v67 service];
    v135 = [v134 name];
    v136 = [(TCCDRequestContext *)v67 identityDescription];
    uint64_t v152 = v124;
    v127 = v157;
    objc_msgSend(v157, "denyAuthorizationWithErrorCode:format:", 2, @"Failed CFUserNotificationCreate(): status %d; service %{public}@ and subject %{public}@",
      v152,
      v135,
      v136);
LABEL_129:

    goto LABEL_132;
  }
  v125 = v123;
  if ([(TCCDRequestContext *)v67 reminderPrompt])
  {
    v126 = tcc_access_log();
    v127 = v157;
    if (os_log_type_enabled(v126, OS_LOG_TYPE_DEBUG)) {
      sub_100041BCC(v126);
    }

    v128 = +[NSValue valueWithPointer:v125];
    *(void *)buf = v157;
    *(void *)&buf[8] = v67;
    v129 = [v94[333] arrayWithObjects:buf count:2];
    v130 = sub_1000412AC();
    [v130 setObject:v129 forKeyedSubscript:v128];

    CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource(kCFAllocatorDefault, v125, (CFUserNotificationCallBack)sub_100041300, 0);
    if (RunLoopSource)
    {
      v132 = RunLoopSource;
      Main = CFRunLoopGetMain();
      CFRunLoopAddSource(Main, v132, kCFRunLoopCommonModes);
      v125 = v132;
    }
    else
    {
      v141 = sub_1000412AC();
      [v141 removeObjectForKey:v128];
    }
    CFRelease(v125);

LABEL_132:
    int v142 = v156;
    goto LABEL_133;
  }
  v137 = +[TCCDPlatform currentPlatform];
  v138 = [v137 server];
  unsigned int v139 = [v138 generateBacktraceOnPrompt];

  v127 = v157;
  if (v139)
  {
    v140 = dispatch_get_global_queue(0, 0);
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_1000417B4;
    v181 = &unk_100094E78;
    v182 = v67;
    dispatch_async(v140, buf);
  }
  CFOptionFlags responseFlags = 0;
  SInt32 error = CFUserNotificationReceiveResponse(v125, (double)a12, &responseFlags);
  CFRelease(v125);
  if (error)
  {
    v134 = [(TCCDRequestContext *)v67 service];
    v135 = [v134 name];
    v136 = [(TCCDRequestContext *)v67 identityDescription];
    [v157 denyAuthorizationWithErrorCode:2, @"Failed CFUserNotificationReceiveResponse(): service %{public}@, subject %{public}@, status: %d", v135, v136, error format];
    goto LABEL_129;
  }
  v145 = tcc_access_log();
  if (os_log_type_enabled(v145, OS_LOG_TYPE_INFO))
  {
    CFOptionFlags v146 = responseFlags;
    v147 = [(TCCDRequestContext *)v67 service];
    v148 = [v147 name];
    v149 = [(TCCDRequestContext *)v67 subjectIdentity];
    v150 = [v149 identifier];
    *(_DWORD *)v174 = 134218498;
    CFOptionFlags v175 = v146;
    id v20 = v159;
    __int16 v176 = 2114;
    v177 = v148;
    __int16 v178 = 2114;
    v179 = v150;
    _os_log_impl((void *)&_mh_execute_header, v145, OS_LOG_TYPE_INFO, "CFUserNotification response: 0x%lx; service %{public}@ and subject %{public}@",
      v174,
      0x20u);

    v127 = v157;
  }

  CFOptionFlags v151 = responseFlags & 3;
  [v127 setAuthorizationValue:*((void *)&v187 + v151)];
  [v127 setDatabaseAction:1];
  if (v151 != 3)
  {
    [v127 setAuthorizationReason:2];
    goto LABEL_132;
  }
  int v142 = v156;
  if (a12)
  {
    objc_msgSend(v127, "setDatabaseFlags:", objc_msgSend(v127, "databaseFlags") | 1);
    [v127 setAuthorizationReason:9];
  }
  else
  {
    [v127 setAuthorizationReason:13];
    if ([v127 promptType] == (id)2) {
      [v127 setAuthorizationValue:a11];
    }
  }
LABEL_133:
  for (uint64_t i = 3; i != -1; --i)

  if (v142)
  {
    v144 = [sub_100040FA8() sharedDeviceConnection];
    [v144 hideUserNotification];
  }
LABEL_138:
}

- (void)presentSynchronousPromptWithHeader:(id)a3 message:(id)a4 aButtonTitle:(id)a5 aButtonAuth:(unint64_t)a6 bButtonTitle:(id)a7 bButtonAuth:(unint64_t)a8 cButtonTitle:(id)a9 cButtonAuth:(unint64_t)a10 currentAuth:(unint64_t)a11 updatingResult:(id)a12
{
  LODWORD(v12) = 0;
  [(TCCDRequestContext *)self presentSynchronousPromptWithHeader:a3 message:a4 aButtonTitle:a5 aButtonAuth:a6 bButtonTitle:a7 bButtonAuth:a8 cButtonTitle:a9 cButtonAuth:a10 currentAuth:a11 withTimeoutInSeconds:v12 updatingResult:a12];
}

- (void)presentSynchronousPromptWithHeader:(id)a3 message:(id)a4 aButtonTitle:(id)a5 aButtonAuth:(unint64_t)a6 bButtonTitle:(id)a7 bButtonAuth:(unint64_t)a8 currentAuth:(unint64_t)a9 updatingResult:(id)a10
{
}

- (TCCDRequestContext)init
{
  return [(TCCDRequestContext *)self initWithRequestMessage:0 forServer:0 error:0];
}

- (id)initForSyncRequestForSubjectBundleIdentifier:(id)a3 service:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TCCDRequestContext *)self initWithRequestMessage:0 forServer:0 error:0];
  id v9 = v8;
  if (v8)
  {
    functionName = v8->_functionName;
    v8->_unint64_t spiVersion = 2;
    v8->_functionName = (NSString *)@"TCCAccessRequest";

    objc_storeStrong((id *)&v9->_service, a4);
    v11 = [[TCCDAccessIdentity alloc] initWithBundleIdentifier:v6 isWK2Proxy:1];
    subjectIdentity = v9->_subjectIdentity;
    v9->_subjectIdentity = v11;

    v9->_watchInitiatedPrompt = 1;
  }

  return v9;
}

- (void)setSpiVersion:(unint64_t)a3
{
  self->_unint64_t spiVersion = a3;
}

- (void)setFunctionName:(id)a3
{
}

- (void)setMessageIdentifier:(id)a3
{
}

- (void)setService:(id)a3
{
}

- (void)setDesiredAuth:(unint64_t)a3
{
  self->_desiredAuth = a3;
}

- (void)setAttributionChain:(id)a3
{
}

- (void)setInitialPrompt:(BOOL)a3
{
  self->_initialPrompt = a3;
}

- (BOOL)reminderPrompt
{
  return self->_reminderPrompt;
}

- (void)setReminderPrompt:(BOOL)a3
{
  self->_reminderPrompt = a3;
}

- (TCCDServer)server
{
  return self->_server;
}

- (void)setAccessSetPrompt:(BOOL)a3
{
  self->_accessSetPrompt = a3;
}

- (BOOL)watchInitiatedPrompt
{
  return self->_watchInitiatedPrompt;
}

- (void)setWatchInitiatedPrompt:(BOOL)a3
{
  self->_watchInitiatedPrompt = a3;
}

- (void)setClientDict:(id)a3
{
}

- (OS_tcc_identity)explicitlyAssumedIdentity
{
  return self->_explicitlyAssumedIdentity;
}

- (void)setExplicitlyAssumedIdentity:(id)a3
{
}

- (unint64_t)usageStringPolicy
{
  return self->_usageStringPolicy;
}

- (unint64_t)promptRightsMask
{
  return self->_promptRightsMask;
}

- (void)setPromptRightsMask:(unint64_t)a3
{
  self->_promptRightsMask = a3;
}

- (int)userTccdUnavailable
{
  return self->_userTccdUnavailable;
}

- (int)promptingSemaphoreHeld
{
  return self->_promptingSemaphoreHeld;
}

- (void)setPromptingSemaphoreHeld:(int)a3
{
  self->_promptingSemaphoreHeld = a3;
}

- (OS_dispatch_semaphore)promptingSemaphore
{
  return self->_promptingSemaphore;
}

- (void)setPromptingSemaphore:(id)a3
{
}

@end