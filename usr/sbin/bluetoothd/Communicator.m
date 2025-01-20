@interface Communicator
+ (id)myNumber;
- (BOOL)_appearsToBeEmailAddress:(id)a3;
- (BOOL)supports3WC;
- (CallList)calls;
- (Communicator)initWithDelegate:(Delegate *)a3;
- (CoreTelephonyClient)ctClient;
- (Delegate)delegate;
- (TUCallCenter)tuCallCenter;
- (__CTServerConnection)ctServerConnection;
- (id).cxx_construct;
- (id)_callForIdentifier:(id)a3;
- (id)_getSubscriptionContext;
- (id)_identifierForCall:(id)a3;
- (id)_myNumber;
- (id)getCountryCode;
- (id)getCountryCodeForIdentifier:(id)a3;
- (id)getCountryCodeIdentifer;
- (id)getRegistrationStatus;
- (int)_answerCall:(id)a3 uid:(const void *)a4 behavior:(int64_t)a5;
- (int)_dialNumber:(const void *)a3 uid:(const void *)a4 providerIdentifier:(const void *)a5;
- (int)_redialNumberWhileScreening:(const void *)a3 uid:(const void *)a4 providerIdentifier:(const void *)a5;
- (int)addHeldCall;
- (int)addVirtualCall;
- (int)answerIncomingCall:()basic_string<char;
- (int)dialNumber:(const void *)a3 uid:()basic_string<char;
- (int)enableEchoCancellationNoiseReduction:(BOOL)a3;
- (int)getCurrentCalls:(void *)a3;
- (int)getCurrentExpanseCalls:(void *)a3;
- (int)getCurrentScreeningCalls:(void *)a3;
- (int)getMobileEquipmentIdentity:(void *)a3;
- (int)getMobileSubscriberIdentity:(void *)a3;
- (int)getOperatorStatus:(void *)a3;
- (int)getSignalStrength:(int *)a3 mode:(int)a4;
- (int)getSubscriberNumber:(void *)a3;
- (int)getTransmitState:(BOOL *)a3;
- (int)hangupActiveCall;
- (int)holdActiveCalls:()basic_string<char;
- (int)privateConference:(id)a3;
- (int)redialLastNumberWithUid:()basic_string<char;
- (int)rejectIncomingCall;
- (int)releaseActiveCalls:()basic_string<char;
- (int)releaseCall:(id)a3;
- (int)releaseHeldCalls;
- (int)removeVirtualCall;
- (int)sendDTMFTone:(unsigned __int8)a3;
- (int)setScreeningCall:(id)a3 isScreening:(BOOL)a4;
- (void)_handleCTCellularTransmitStateChangedNotification:(__CFDictionary *)a3;
- (void)_handleTUCallCenterCallExpanseStatusChangedNotification:(id)a3;
- (void)_handleTUCallCenterCallStatusChangedNotification:(id)a3;
- (void)_updateCalls;
- (void)activeSubscriptionsDidChange;
- (void)context:(id)a3 capabilitiesChanged:(id)a4;
- (void)dealloc;
- (void)displayStatusChanged:(id)a3 status:(id)a4;
- (void)invalidate;
- (void)networkReselectionNeeded:(id)a3;
- (void)networkSelected:(id)a3 success:(BOOL)a4 mode:(id)a5;
- (void)operatorNameChanged:(id)a3 name:(id)a4;
- (void)setCalls:(CallList *)a3;
- (void)setDelegate:(Delegate *)a3;
- (void)signalStrengthChanged:(id)a3 info:(id)a4;
@end

@implementation Communicator

- (Communicator)initWithDelegate:(Delegate *)a3
{
  v27.receiver = self;
  v27.super_class = (Class)Communicator;
  v4 = [(Communicator *)&v27 init];
  v5 = v4;
  if (v4)
  {
    v4->_delegate = a3;
    if (NSClassFromString(@"TUCallCenter"))
    {
      id v6 = *(id *)(sub_1004AFA9C() + 8);
      uint64_t v7 = +[TUCallCenter callCenterWithQueue:v6];
      tuCallCenter = v5->_tuCallCenter;
      v5->_tuCallCenter = (TUCallCenter *)v7;

      v9 = [(TUCallCenter *)v5->_tuCallCenter callServicesClientCapabilities];
      [v9 setWantsToScreenCalls:1];

      v10 = [(TUCallCenter *)v5->_tuCallCenter callServicesClientCapabilities];
      [v10 save];

      v11 = +[NSNotificationCenter defaultCenter];
      [v11 addObserver:v5 selector:"_handleTUCallCenterCallStatusChangedNotification:" name:TUCallCenterCallStatusChangedNotification object:0];

      v12 = +[NSNotificationCenter defaultCenter];
      [v12 addObserver:v5 selector:"_handleTUCallCenterCallStatusChangedNotification:" name:TUCallCenterVideoCallStatusChangedNotification object:0];

      v13 = +[NSNotificationCenter defaultCenter];
      [v13 addObserver:v5 selector:"_handleTUCallCenterCallStatusChangedNotification:" name:TUCallCenterCallInvitationSentNotification object:0];

      v14 = +[NSNotificationCenter defaultCenter];
      [v14 addObserver:v5 selector:"_handleTUCallCenterCallStatusChangedNotification:" name:TUCallCenterVideoCallInvitationSentNotification object:0];

      v15 = +[NSNotificationCenter defaultCenter];
      [v15 addObserver:v5 selector:"_handleTUCallCenterCallStatusChangedNotification:" name:TUCallCenterCallerIDChangedNotification object:0];

      v16 = +[NSNotificationCenter defaultCenter];
      [v16 addObserver:v5 selector:"_handleTUCallCenterCallStatusChangedNotification:" name:TUCallCenterCallConnectedNotification object:0];

      v17 = +[NSNotificationCenter defaultCenter];
      [v17 addObserver:v5 selector:"_handleTUCallCenterCallStatusChangedNotification:" name:TUCallCenterCallContinuityStateChangedNotification object:0];

      v18 = +[NSNotificationCenter defaultCenter];
      [v18 addObserver:v5 selector:"_handleTUCallCenterCallExpanseStatusChangedNotification:" name:TUCallMixesVoiceWithMediaChangedNotification object:0];

      v19 = +[NSNotificationCenter defaultCenter];
      [v19 addObserver:v5 selector:"_handleTUCallCenterCallStatusChangedNotification:" name:TUCallCenterIsScreeningChangedNotification object:0];

      [(Communicator *)v5 _updateCalls];
    }
    if (sub_10053FF50())
    {
      id v20 = *(id *)(sub_1004AFA9C() + 8);
      v5->_ctServerConnection = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue();

      id v21 = objc_alloc((Class)CoreTelephonyClient);
      id v22 = *(id *)(sub_1004AFA9C() + 8);
      v23 = (CoreTelephonyClient *)[v21 initWithQueue:v22];
      ctClient = v5->_ctClient;
      v5->_ctClient = v23;

      [(CoreTelephonyClient *)v5->_ctClient setDelegate:v5];
      [(Communicator *)v5 ctServerConnection];
      v26 = v5;
      _CTServerConnectionRegisterBlockForNotification();
    }
  }
  return v5;
}

- (void)invalidate
{
  if ([(Communicator *)self ctServerConnection])
  {
    [(Communicator *)self ctServerConnection];
    _CTServerConnectionUnregisterForAllNotifications();
  }
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(Communicator *)self setDelegate:0];
}

- (void)dealloc
{
  if ([(Communicator *)self ctServerConnection]) {
    CFRelease([(Communicator *)self ctServerConnection]);
  }
  v3.receiver = self;
  v3.super_class = (Class)Communicator;
  [(Communicator *)&v3 dealloc];
}

- (id)_identifierForCall:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)NSUUID);
  v5 = [v3 uniqueProxyIdentifier];
  id v6 = [v4 initWithUUIDString:v5];

  return v6;
}

- (id)_callForIdentifier:(id)a3
{
  id v4 = [a3 UUIDString];
  v5 = [(Communicator *)self tuCallCenter];
  id v6 = [v5 callWithUniqueProxyIdentifier:v4];

  return v6;
}

- (BOOL)_appearsToBeEmailAddress:(id)a3
{
  return [a3 containsString:@"@"];
}

- (void)_updateCalls
{
  id v3 = [(Communicator *)self tuCallCenter];
  v29 = [v3 currentAudioAndVideoCalls];

  v41 = 0;
  v42 = 0;
  uint64_t v43 = 0;
  [(Communicator *)self calls];
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  sub_10061F99C(&v38);
  id v4 = qword_100A19EC0;
  if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v29;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Current TU call(s): %@", buf, 0xCu);
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v29;
  id v5 = [obj countByEnumeratingWithState:&v34 objects:v48 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v35;
LABEL_5:
    uint64_t v7 = 0;
    while (2)
    {
      if (*(void *)v35 != v6) {
        objc_enumerationMutation(obj);
      }
      v8 = *(void **)(*((void *)&v34 + 1) + 8 * v7);
      memset(&v47, 0, sizeof(v47));
      *(_OWORD *)buf = 0u;
      memset(v46, 0, sizeof(v46));
      v9 = [(Communicator *)self _identifierForCall:v8];
      sub_100495778((uint64_t)buf, v9);

      id v10 = *(id *)buf;
      v11 = sub_10061FB58(&v41, v10);

      unsigned int v12 = [v8 status];
      switch(v12)
      {
        case 0u:
        case 6u:
          goto LABEL_43;
        case 1u:
          if ((unint64_t)[obj count] < 2)
          {
            unsigned int v12 = 1;
          }
          else if ([v8 isConnected])
          {
            unsigned int v12 = 1;
          }
          else
          {
            unsigned int v12 = 6;
          }
          goto LABEL_22;
        case 2u:
          goto LABEL_22;
        case 3u:
          BOOL v13 = [v8 hasSentInvitation] == 0;
          int v14 = 3;
          goto LABEL_15;
        case 4u:
          BOOL v13 = [obj count] == (id)1;
          int v14 = 5;
LABEL_15:
          if (v13) {
            unsigned int v12 = v14;
          }
          else {
            unsigned int v12 = v14 + 1;
          }
          goto LABEL_22;
        case 5u:
          if ([obj count] != (id)1 || v42 == v11) {
            goto LABEL_43;
          }
          unsigned int v12 = *((_DWORD *)v11 + 4);
LABEL_22:
          LODWORD(v46[0]) = v12;
LABEL_23:
          if (v42 != v11) {
            *(_DWORD *)&buf[8] = *((_DWORD *)v11 + 2);
          }
          buf[12] = [v8 isOutgoing];
          buf[13] = [v8 isConferenced];
          buf[14] = [v8 mixesVoiceWithMedia];
          buf[15] = [v8 isScreening];
          v15 = [v8 handle];
          v16 = v15;
          if (v15)
          {
            v17 = [v15 value];
            unsigned __int8 v18 = [(Communicator *)self _appearsToBeEmailAddress:v17];

            if ((v18 & 1) == 0)
            {
              id v19 = [v16 value];
              sub_10062E840(&__str, [v19 UTF8String]);
              sub_10062E90C((std::string *)((char *)v46 + 8), (uint64_t)&__str);
              sub_10062E8E8(&__str);
            }
            if (v42 == v11 || !sub_10062E958((unsigned __int8 *)v11 + 24, (unsigned __int8 *)v46 + 8))
            {
              id v20 = [v8 displayName];
              id v21 = v20;
              if (v20)
              {
                if ((unint64_t)[v20 length] >= 0x81)
                {
                  uint64_t v22 = [v21 substringToIndex:128];

                  id v21 = (void *)v22;
                }
                id v23 = v21;
                if ([v23 UTF8String])
                {
                  sub_10004191C(__p, (char *)[v23 UTF8String]);
                  sub_10044A25C((uint64_t)__p, &__str);
                  std::string::operator=(&v47, &__str);
                  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
                    operator delete(__str.__r_.__value_.__l.__data_);
                  }
                  if (v33 < 0) {
                    operator delete(__p[0]);
                  }
                }
                else
                {
                  v24 = qword_100A19EC0;
                  if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_ERROR))
                  {
                    LODWORD(__str.__r_.__value_.__l.__data_) = 138412290;
                    *(std::string::size_type *)((char *)__str.__r_.__value_.__r.__words + 4) = (std::string::size_type)v8;
                    _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Invalid call display name for %@", (uint8_t *)&__str, 0xCu);
                  }
                }
              }
            }
            else
            {
              std::string::operator=(&v47, (const std::string *)(v11 + 10));
            }
          }

          sub_10061FA2C(&v38, (uint64_t)buf);
LABEL_43:
          if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v47.__r_.__value_.__l.__data_);
          }
          sub_10062E8E8((char *)v46 + 8);

          if (v5 != (id)++v7) {
            continue;
          }
          id v5 = [obj countByEnumeratingWithState:&v34 objects:v48 count:16];
          if (!v5) {
            goto LABEL_47;
          }
          goto LABEL_5;
        default:
          goto LABEL_23;
      }
    }
  }
LABEL_47:

  uint64_t v26 = v38;
  uint64_t v25 = v39;
  while (v26 != v25)
  {
    if (!*(_DWORD *)(v26 + 8))
    {
      *(_DWORD *)(v26 + 8) = sub_10061FC1C(&v38);
      uint64_t v25 = v39;
    }
    v26 += 104;
  }
  objc_super v27 = (id)qword_100A19EC0;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    sub_10061FC64(&v38, (std::string *)buf);
    v28 = (SBYTE7(v46[0]) & 0x80u) == 0 ? buf : *(uint8_t **)buf;
    LODWORD(__str.__r_.__value_.__l.__data_) = 136315138;
    *(std::string::size_type *)((char *)__str.__r_.__value_.__r.__words + 4) = (std::string::size_type)v28;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Updated call(s): %s", (uint8_t *)&__str, 0xCu);
    if (SBYTE7(v46[0]) < 0) {
      operator delete(*(void **)buf);
    }
  }

  sub_10061FA28((int)v31);
  [(Communicator *)self setCalls:v31];
  *(void *)buf = v31;
  sub_10027696C((void ***)buf);
  *(void *)buf = &v38;
  sub_10027696C((void ***)buf);
  *(void *)buf = &v41;
  sub_10027696C((void ***)buf);
}

- (id)_myNumber
{
  v2 = [(Communicator *)self _getSubscriptionContext];
  id v3 = [v2 phoneNumber];

  return v3;
}

- (int)_dialNumber:(const void *)a3 uid:(const void *)a4 providerIdentifier:(const void *)a5
{
  id v9 = objc_alloc_init((Class)TUCallProviderManager);
  if (*((char *)a5 + 23) >= 0) {
    id v10 = a5;
  }
  else {
    id v10 = *(const void **)a5;
  }
  v11 = +[NSString stringWithUTF8String:v10];
  unsigned int v12 = [v9 providerWithIdentifier:v11];
  BOOL v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [v9 telephonyProvider];
  }
  v15 = v14;

  id v16 = [objc_alloc((Class)TUDialRequest) initWithProvider:v15];
  if (*((char *)a3 + 23) >= 0) {
    v17 = a3;
  }
  else {
    v17 = *(const void **)a3;
  }
  unsigned __int8 v18 = +[NSString stringWithUTF8String:v17];
  id v19 = +[TUHandle handleWithDestinationID:v18];
  [v16 setHandle:v19];

  if (*((char *)a4 + 23) >= 0) {
    id v20 = a4;
  }
  else {
    id v20 = *(const void **)a4;
  }
  id v21 = +[NSString stringWithUTF8String:v20];
  [v16 setAudioSourceIdentifier:v21];

  uint64_t v22 = qword_100A19EC0;
  if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_INFO))
  {
    if (*((char *)a3 + 23) >= 0) {
      id v23 = a3;
    }
    else {
      id v23 = *(const void **)a3;
    }
    int v26 = 136315394;
    objc_super v27 = v23;
    __int16 v28 = 2112;
    v29 = v15;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Dialing '%s' with TU provider %@", (uint8_t *)&v26, 0x16u);
  }
  v24 = [(Communicator *)self tuCallCenter];
  [v24 launchAppForDialRequest:v16 completion:0];

  return 0;
}

- (int)_redialNumberWhileScreening:(const void *)a3 uid:(const void *)a4 providerIdentifier:(const void *)a5
{
  id v9 = objc_alloc_init((Class)TUCallProviderManager);
  if (*((char *)a5 + 23) >= 0) {
    id v10 = a5;
  }
  else {
    id v10 = *(const void **)a5;
  }
  v11 = +[NSString stringWithUTF8String:v10];
  unsigned int v12 = [v9 providerWithIdentifier:v11];
  BOOL v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [v9 telephonyProvider];
  }
  v15 = v14;

  id v16 = [objc_alloc((Class)TUDialRequest) initWithProvider:v15];
  if (*((char *)a3 + 23) >= 0) {
    v17 = a3;
  }
  else {
    v17 = *(const void **)a3;
  }
  unsigned __int8 v18 = +[NSString stringWithUTF8String:v17];
  id v19 = +[TUHandle handleWithDestinationID:v18];
  [v16 setHandle:v19];

  if (*((char *)a4 + 23) >= 0) {
    id v20 = a4;
  }
  else {
    id v20 = *(const void **)a4;
  }
  id v21 = +[NSString stringWithUTF8String:v20];
  [v16 setAudioSourceIdentifier:v21];

  uint64_t v22 = qword_100A19EC0;
  if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_INFO))
  {
    if (*((char *)a3 + 23) >= 0) {
      id v23 = a3;
    }
    else {
      id v23 = *(const void **)a3;
    }
    int v28 = 136315394;
    v29 = v23;
    __int16 v30 = 2112;
    v31 = v15;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Calling handleRedialCommandWhileScreening '%s' with TU provider %@", (uint8_t *)&v28, 0x16u);
  }
  v24 = [(Communicator *)self tuCallCenter];
  char v25 = objc_opt_respondsToSelector();

  int v26 = [(Communicator *)self tuCallCenter];
  if (v25) {
    [v26 handleRedialCommandWhileScreening:v16];
  }
  else {
    [v26 launchAppForDialRequest:v16 completion:0];
  }

  return 0;
}

- (int)_answerCall:(id)a3 uid:(const void *)a4 behavior:(int64_t)a5
{
  id v8 = a3;
  id v9 = [objc_alloc((Class)TUAnswerRequest) initWithCall:v8];
  if (*((char *)a4 + 23) >= 0) {
    id v10 = a4;
  }
  else {
    id v10 = *(const void **)a4;
  }
  v11 = +[NSString stringWithUTF8String:v10];
  [v9 setSourceIdentifier:v11];

  [v9 setBehavior:a5];
  unsigned int v12 = [(Communicator *)self tuCallCenter];
  [v12 answerWithRequest:v9];

  return 0;
}

- (id)_getSubscriptionContext
{
  v2 = [(Communicator *)self ctClient];
  id v3 = [v2 getSubscriptionInfoWithError:0];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [v3 subscriptions];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v9 = [v8 userDefaultVoice];
        unsigned __int8 v10 = [v9 BOOLValue];

        if (v10)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void)activeSubscriptionsDidChange
{
  if ([(Communicator *)self delegate])
  {
    id v3 = qword_100A19EC0;
    if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Received 'active subscriptions did change' delegate", v11, 2u);
    }
    id v4 = [(Communicator *)self _getSubscriptionContext];
    id v5 = [(Communicator *)self ctClient];
    uint64_t v6 = [v5 getSignalStrengthInfo:v4 error:0];

    uint64_t v7 = [(Communicator *)self delegate];
    id v8 = [v6 bars];
    (*((void (**)(Delegate *, void))v7->var0 + 4))(v7, [v8 unsignedIntValue]);

    id v9 = [(Communicator *)self delegate];
    (*((void (**)(Delegate *))v9->var0 + 3))(v9);
    unsigned __int8 v10 = [(Communicator *)self delegate];
    (*((void (**)(Delegate *))v10->var0 + 1))(v10);
  }
}

- (void)operatorNameChanged:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(Communicator *)self delegate])
  {
    id v8 = [v6 userDefaultVoice];
    unsigned int v9 = [v8 BOOLValue];

    if (v9)
    {
      unsigned __int8 v10 = qword_100A19EC0;
      if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Received 'operator name changed' delegate", v12, 2u);
      }
      v11 = [(Communicator *)self delegate];
      (*((void (**)(Delegate *))v11->var0 + 1))(v11);
    }
  }
}

- (void)signalStrengthChanged:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(Communicator *)self delegate])
  {
    id v8 = [v6 userDefaultVoice];
    unsigned int v9 = [v8 BOOLValue];

    if (v9)
    {
      unsigned __int8 v10 = qword_100A19EC0;
      if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Received 'signal strength changed' delegate", v14, 2u);
      }
      v11 = [v7 bars];
      unsigned __int8 v12 = [v11 unsignedIntValue];

      long long v13 = [(Communicator *)self delegate];
      (*((void (**)(Delegate *, void))v13->var0 + 4))(v13, v12);
    }
  }
}

- (void)displayStatusChanged:(id)a3 status:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(Communicator *)self delegate])
  {
    id v8 = [v6 userDefaultVoice];
    unsigned int v9 = [v8 BOOLValue];

    if (v9)
    {
      unsigned __int8 v10 = qword_100A19EC0;
      if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)unsigned __int8 v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Received 'display status changed' delegate", v12, 2u);
      }
      v11 = [(Communicator *)self delegate];
      (*((void (**)(Delegate *))v11->var0 + 3))(v11);
    }
  }
}

- (void)context:(id)a3 capabilitiesChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(Communicator *)self delegate])
  {
    id v8 = qword_100A19EC0;
    if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unsigned __int8 v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Received 'context capabilities changed' notification", v10, 2u);
    }
    unsigned int v9 = [(Communicator *)self delegate];
    (*((void (**)(Delegate *))v9->var0 + 2))(v9);
  }
}

- (void)networkReselectionNeeded:(id)a3
{
  id v4 = a3;
  if ([(Communicator *)self delegate])
  {
    id v5 = qword_100A19EC0;
    if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Received 'network selection needed' notification", v8, 2u);
    }
    id v6 = [(Communicator *)self delegate];
    (*((void (**)(Delegate *))v6->var0 + 1))(v6);
    id v7 = [(Communicator *)self delegate];
    (*((void (**)(Delegate *))v7->var0 + 3))(v7);
  }
}

- (void)networkSelected:(id)a3 success:(BOOL)a4 mode:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([(Communicator *)self delegate])
  {
    unsigned int v9 = qword_100A19EC0;
    if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unsigned __int8 v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Received 'network selection changed' notification", v12, 2u);
    }
    unsigned __int8 v10 = [(Communicator *)self delegate];
    (*((void (**)(Delegate *))v10->var0 + 1))(v10);
    v11 = [(Communicator *)self delegate];
    (*((void (**)(Delegate *))v11->var0 + 3))(v11);
  }
}

- (void)_handleTUCallCenterCallStatusChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  id v6 = [(Communicator *)self _identifierForCall:v5];

  id v7 = *(NSObject **)(sub_1004AFA9C() + 8);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100491F18;
  v9[3] = &unk_100998510;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);
}

- (void)_handleTUCallCenterCallExpanseStatusChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = (id)qword_100A19EC0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 object];
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Expanse status changed for call: %@", (uint8_t *)&v7, 0xCu);
  }
  [(Communicator *)self _updateCalls];
}

- (void)_handleCTCellularTransmitStateChangedNotification:(__CFDictionary *)a3
{
  if ([(Communicator *)self delegate])
  {
    id v5 = qword_100A19EC0;
    if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unsigned int v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Received 'cellular transmit state changed' notification", v9, 2u);
    }
    Value = CFDictionaryGetValue(a3, kKeyCTCellularTransmitState);
    if (Value)
    {
      BOOL v7 = CFEqual(Value, kCTCellularTransmitStarted) != 0;
      id v8 = [(Communicator *)self delegate];
      (*((void (**)(Delegate *, BOOL))v8->var0 + 5))(v8, v7);
    }
  }
}

+ (id)myNumber
{
  id v2 = [objc_alloc((Class)CoreTelephonyClient) initWithQueue:0];
  id v3 = [v2 getSubscriptionInfoWithError:0];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [v3 subscriptions];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        unsigned int v9 = [v8 userDefaultVoice];
        unsigned int v10 = [v9 BOOLValue];

        if (v10)
        {
          id v5 = [v8 phoneNumber];
          goto LABEL_11;
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (BOOL)supports3WC
{
  if ([(Communicator *)self ctServerConnection])
  {
    [(Communicator *)self ctServerConnection];
    _CTServerConnectionCopySystemCapabilities();
  }
  return 1;
}

- (int)answerIncomingCall:()basic_string<char
{
  id v5 = [(Communicator *)self tuCallCenter];
  uint64_t v6 = [v5 audioOrVideoCallWithStatus:4];

  BOOL v7 = qword_100A19EC0;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Found incoming TU call to answer: %@", (uint8_t *)&v10, 0xCu);
    }
    int v8 = [(Communicator *)self _answerCall:v6 uid:a3 behavior:0];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_ERROR)) {
      sub_10076C924();
    }
    int v8 = 13;
  }

  return v8;
}

- (int)rejectIncomingCall
{
  id v3 = [(Communicator *)self tuCallCenter];
  id v4 = [v3 audioOrVideoCallWithStatus:4];

  id v5 = qword_100A19EC0;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      int v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Found incoming TU call to reject: %@", (uint8_t *)&v9, 0xCu);
    }
    uint64_t v6 = [(Communicator *)self tuCallCenter];
    [v6 disconnectCall:v4];

    int v7 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_ERROR)) {
      sub_10076C958();
    }
    int v7 = 13;
  }

  return v7;
}

- (int)hangupActiveCall
{
  id v3 = [(Communicator *)self tuCallCenter];
  id v4 = [v3 audioOrVideoCallWithStatus:3];

  if (v4)
  {
    id v5 = qword_100A19EC0;
    if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      long long v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Found sending TU call to disconnect: %@", (uint8_t *)&v13, 0xCu);
    }
    uint64_t v6 = [(Communicator *)self tuCallCenter];
    [v6 disconnectCall:v4];
LABEL_9:
    int v11 = 0;
    goto LABEL_10;
  }
  int v7 = [(Communicator *)self tuCallCenter];
  uint64_t v6 = [v7 audioAndVideoCallsWithStatus:1];

  id v8 = [v6 count];
  int v9 = qword_100A19EC0;
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      long long v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Found active TU calls to disconnect: %@", (uint8_t *)&v13, 0xCu);
    }
    int v10 = [(Communicator *)self tuCallCenter];
    [v10 disconnectCurrentCallAndActivateHeld];

    goto LABEL_9;
  }
  if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_ERROR)) {
    sub_10076C98C();
  }
  int v11 = 13;
LABEL_10:

  return v11;
}

- (int)releaseHeldCalls
{
  id v3 = [(Communicator *)self tuCallCenter];
  id v4 = [v3 audioAndVideoCallsWithStatus:2];

  long long v14 = v4;
  if ([v4 count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v16;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          int v10 = qword_100A19EC0;
          if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v20 = v9;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Found held TU call to disconnect: %@", buf, 0xCu);
          }
          int v11 = [(Communicator *)self tuCallCenter];
          [v11 disconnectCall:v9];
        }
        id v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
      }
      while (v6);
    }

    int v12 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_ERROR)) {
      sub_10076C9C0();
    }
    int v12 = 13;
  }

  return v12;
}

- (int)releaseActiveCalls:()basic_string<char
{
  id v5 = [(Communicator *)self tuCallCenter];
  id v6 = [v5 audioOrVideoCallWithStatus:4];

  if (v6)
  {
    uint64_t v7 = qword_100A19EC0;
    if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412290;
      long long v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Found incoming TU call to answer: %@", (uint8_t *)&v15, 0xCu);
    }
    int v8 = [(Communicator *)self _answerCall:v6 uid:a3 behavior:0];
  }
  else
  {
    uint64_t v9 = [(Communicator *)self tuCallCenter];
    int v10 = [v9 audioAndVideoCallsWithStatus:1];

    id v11 = [v10 count];
    int v12 = qword_100A19EC0;
    if (v11)
    {
      if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_INFO))
      {
        int v15 = 138412290;
        long long v16 = v10;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Found active TU calls to disconnect: %@", (uint8_t *)&v15, 0xCu);
      }
      int v13 = [(Communicator *)self tuCallCenter];
      [v13 disconnectCurrentCallAndActivateHeld];

      int v8 = 0;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_ERROR)) {
        sub_10076C98C();
      }
      int v8 = 13;
    }
  }
  return v8;
}

- (int)holdActiveCalls:()basic_string<char
{
  id v5 = [(Communicator *)self tuCallCenter];
  id v6 = [v5 audioOrVideoCallWithStatus:4];

  if (!v6)
  {
    id v11 = [(Communicator *)self tuCallCenter];
    int v12 = [v11 audioOrVideoCallWithStatus:1];

    int v13 = [(Communicator *)self tuCallCenter];
    long long v14 = [v13 audioOrVideoCallWithStatus:2];

    if (v12 && v14)
    {
      int v15 = qword_100A19EC0;
      if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_INFO))
      {
        LOWORD(v24) = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Swapping TU calls", (uint8_t *)&v24, 2u);
      }
      long long v16 = [(Communicator *)self tuCallCenter];
      [v16 swapCalls];
    }
    else if (!v12 || v14)
    {
      uint64_t v22 = qword_100A19EC0;
      if (v12 || !v14)
      {
        if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_ERROR)) {
          sub_10076C9F4();
        }
        int v10 = 13;
        goto LABEL_14;
      }
      if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_INFO))
      {
        int v24 = 138412290;
        char v25 = v14;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Found held TU call to resume: %@", (uint8_t *)&v24, 0xCu);
      }
      id v23 = [(Communicator *)self tuCallCenter];
      [v23 unholdCall:v14];
    }
    else
    {
      long long v18 = qword_100A19EC0;
      if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_INFO))
      {
        int v24 = 138412290;
        char v25 = v12;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Found active TU call to hold: %@", (uint8_t *)&v24, 0xCu);
      }
      id v19 = [v12 model];
      unsigned int v20 = [v19 supportsHolding];

      if (!v20)
      {
        if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_ERROR)) {
          sub_10076CA28();
        }
        int v10 = 2;
        goto LABEL_14;
      }
      id v21 = [(Communicator *)self tuCallCenter];
      [v21 holdCall:v12];
    }
    int v10 = 0;
LABEL_14:

    goto LABEL_15;
  }
  uint64_t v7 = [(Communicator *)self tuCallCenter];
  if ([v7 isHoldAndAnswerAllowed]) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 0;
  }

  uint64_t v9 = qword_100A19EC0;
  if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_INFO))
  {
    int v24 = 138412546;
    char v25 = v6;
    __int16 v26 = 2048;
    uint64_t v27 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Found incoming TU call to answer %@ with behavior %ld", (uint8_t *)&v24, 0x16u);
  }
  int v10 = [(Communicator *)self _answerCall:v6 uid:a3 behavior:v8];
LABEL_15:

  return v10;
}

- (int)addHeldCall
{
  id v3 = [(Communicator *)self tuCallCenter];
  id v4 = [v3 audioOrVideoCallWithStatus:2];

  id v5 = [(Communicator *)self tuCallCenter];
  id v6 = [v5 audioOrVideoCallWithStatus:1];

  uint64_t v7 = qword_100A19EC0;
  if (v4 && v6)
  {
    if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      int v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Found held TU call to create a conference: %@", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v8 = qword_100A19EC0;
    if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      int v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Found active TU call to create a conference: %@", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v9 = [(Communicator *)self tuCallCenter];
    unsigned int v10 = [v9 canGroupCall:v4 withCall:v6];

    if (v10)
    {
      id v11 = [(Communicator *)self tuCallCenter];
      [v11 groupCall:v4 withOtherCall:v6];

      int v12 = 0;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_ERROR)) {
        sub_10076CA5C();
      }
      int v12 = 2;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_ERROR)) {
      sub_10076CA90();
    }
    int v12 = 13;
  }

  return v12;
}

- (int)releaseCall:(id)a3
{
  id v4 = a3;
  id v5 = [(Communicator *)self _callForIdentifier:v4];
  id v6 = qword_100A19EC0;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      int v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Found TU call to disconnect: %@", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v7 = [(Communicator *)self tuCallCenter];
    [v7 disconnectCall:v5];

    uint64_t v8 = [(Communicator *)self tuCallCenter];
    uint64_t v9 = [v8 audioOrVideoCallWithStatus:2];

    if (v9)
    {
      unsigned int v10 = qword_100A19EC0;
      if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_INFO))
      {
        int v14 = 138412290;
        int v15 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Found held TU call to resume: %@", (uint8_t *)&v14, 0xCu);
      }
      id v11 = [(Communicator *)self tuCallCenter];
      [v11 unholdCall:v9];
    }
    int v12 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_ERROR)) {
      sub_10076CAC4();
    }
    int v12 = 15;
  }

  return v12;
}

- (int)privateConference:(id)a3
{
  id v4 = a3;
  id v5 = [(Communicator *)self _callForIdentifier:v4];
  id v6 = qword_100A19EC0;
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_ERROR)) {
      sub_10076CAF8();
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412290;
    int v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Found TU call to leave the conference: %@", (uint8_t *)&v12, 0xCu);
  }
  if (![v5 isConferenced])
  {
    if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_ERROR)) {
      sub_10076CB60();
    }
LABEL_11:
    int v10 = 15;
    goto LABEL_12;
  }
  uint64_t v7 = [v5 model];
  unsigned int v8 = [v7 supportsUngrouping];

  if (v8)
  {
    uint64_t v9 = [(Communicator *)self tuCallCenter];
    [v9 ungroupCall:v5];

    int v10 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_ERROR)) {
      sub_10076CB2C();
    }
    int v10 = 2;
  }
LABEL_12:

  return v10;
}

- (int)dialNumber:(const void *)a3 uid:()basic_string<char
{
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  sub_10061F99C(&v14);
  [(Communicator *)self getCurrentScreeningCalls:&v14];
  if (v14 == v15)
  {
    sub_10062EA20((char *)a3, (uint64_t)v12);
    sub_10004191C(__p, "");
    unsigned int v7 = [(Communicator *)self _dialNumber:v12 uid:a4 providerIdentifier:__p];
  }
  else
  {
    sub_10062EA20((char *)a3, (uint64_t)v12);
    sub_10004191C(__p, "");
    unsigned int v7 = [(Communicator *)self _redialNumberWhileScreening:v12 uid:a4 providerIdentifier:__p];
  }
  int v8 = v7;
  if (v11 < 0) {
    operator delete(__p[0]);
  }
  if (v13 < 0) {
    operator delete(v12[0]);
  }
  v12[0] = &v14;
  sub_10027696C((void ***)v12);
  return v8;
}

- (int)redialLastNumberWithUid:()basic_string<char
{
}

- (int)sendDTMFTone:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v4 = [(Communicator *)self tuCallCenter];
  id v5 = [v4 audioOrVideoCallWithStatus:1];

  id v6 = [v5 model];
  unsigned int v7 = [v6 supportsDTMF];

  if (v7)
  {
    [v5 playDTMFToneForKey:v3];
    int v8 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_ERROR)) {
      sub_10076CB94();
    }
    int v8 = 13;
  }

  return v8;
}

- (int)enableEchoCancellationNoiseReduction:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(Communicator *)self ctServerConnection]
    || ([(Communicator *)self ctServerConnection],
        (int result = _CTServerConnectionEchoCancelationAndNoiseReduction()) != 0))
  {
    id v6 = qword_100A19EC0;
    if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_ERROR)) {
      sub_10076CBC8(v3, v6, v7, v8, v9, v10, v11, v12);
    }
    return 2;
  }
  return result;
}

- (int)addVirtualCall
{
  char v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  [(Communicator *)self calls];
  v16[0] = 0;
  v16[1] = 0;
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:v16];
  id v4 = sub_10061FB58(&v13, v3);
  if (v14 == v4)
  {
    memset(&__p, 0, sizeof(__p));
    memset(v11, 0, sizeof(v11));
    sub_100495778((uint64_t)v11, v3);
    *(_DWORD *)&uint8_t v11[16] = 7;
    *(_DWORD *)&v11[8] = 1;
    *(_WORD *)&v11[12] = 1;
    id v6 = [(Communicator *)self _myNumber];
    sub_10062E840(&__str, [v6 UTF8String]);
    sub_10062E90C((std::string *)&v11[24], (uint64_t)&__str);
    sub_10062E8E8(&__str);

    sub_100379650(@"MY_NUMBER", @"My Number");
    id v7 = objc_claimAutoreleasedReturnValue();
    sub_10004191C(&__str, (char *)[v7 UTF8String]);
    std::string::operator=(&__p, &__str);
    if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__str.__r_.__value_.__l.__data_);
    }

    if (v13 != v14)
    {
      if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_ERROR)) {
        sub_10076CC4C();
      }
      sub_10061FA80((uint64_t *)&v13);
    }
    sub_10061FA2C((uint64_t *)&v13, (uint64_t)v11);
    sub_10061FA28((int)v9);
    [(Communicator *)self setCalls:v9];
    __str.__r_.__value_.__r.__words[0] = (std::string::size_type)v9;
    sub_10027696C((void ***)&__str);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    sub_10062E8E8(&v11[24]);

    int v5 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_ERROR)) {
      sub_10076CC80();
    }
    int v5 = 15;
  }

  *(void *)uint64_t v11 = &v13;
  sub_10027696C((void ***)v11);
  return v5;
}

- (int)removeVirtualCall
{
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  [(Communicator *)self calls];
  v12[0] = 0;
  v12[1] = 0;
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:v12];
  id v4 = sub_10061FB58(&v8, v3);
  if (v9 == v4)
  {
    if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_ERROR)) {
      sub_10076CCB4();
    }
    int v5 = 15;
  }
  else
  {
    sub_10061FAD4((uint64_t)&v8, v4);
    sub_10061FA28((int)v7);
    [(Communicator *)self setCalls:v7];
    uint64_t v11 = (void **)v7;
    sub_10027696C(&v11);
    int v5 = 0;
  }

  v12[0] = (void **)&v8;
  sub_10027696C(v12);
  return v5;
}

- (int)getCurrentCalls:(void *)a3
{
  [(Communicator *)self calls];
  if (&v5 != a3) {
    sub_100276A50((uint64_t)a3, v5, v6, 0x4EC4EC4EC4EC4EC5 * ((v6 - v5) >> 3));
  }
  id v7 = (void **)&v5;
  sub_10027696C(&v7);
  return 0;
}

- (int)getCurrentExpanseCalls:(void *)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  [(Communicator *)self calls];
  id v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  sub_10061F99C(&v7);
  uint64_t v5 = v10;
  uint64_t v4 = v11;
  while (v5 != v4)
  {
    if (*(unsigned char *)(v5 + 14))
    {
      sub_10061FA2C((uint64_t *)&v7, v5);
      uint64_t v4 = v11;
    }
    v5 += 104;
  }
  if (&v7 != a3) {
    sub_100276A50((uint64_t)a3, (uint64_t)v7, v8, 0x4EC4EC4EC4EC4EC5 * ((v8 - (uint64_t)v7) >> 3));
  }
  char v13 = &v7;
  sub_10027696C((void ***)&v13);
  id v7 = (void **)&v10;
  sub_10027696C(&v7);
  return 0;
}

- (int)setScreeningCall:(id)a3 isScreening:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(Communicator *)self _callForIdentifier:v6];
  if (v7)
  {
    uint64_t v8 = qword_100A19EC0;
    if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = v4;
      LOWORD(v18) = 2112;
      *(void *)((char *)&v18 + 2) = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Screening:%d Call:%@", buf, 0x12u);
    }
    [(Communicator *)self _updateCalls];
    *(void *)buf = 0;
    long long v18 = 0uLL;
    [(Communicator *)self calls];
    uint64_t v9 = sub_10061FB58((id **)buf, v6);
    if ((id *)v18 != v9)
    {
      uint64_t v10 = qword_100A19EC0;
      if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Found Call. Updating State", v16, 2u);
      }
      *((unsigned char *)v9 + 15) = v4;
      sub_10061FA28((int)v15);
      [(Communicator *)self setCalls:v15];
      *(void *)uint64_t v16 = v15;
      sub_10027696C((void ***)v16);
      uint64_t v11 = [(Communicator *)self delegate];
      (*(void (**)(Delegate *, id))v11->var0)(v11, v6);
      *(void *)uint64_t v16 = buf;
      sub_10027696C((void ***)v16);
      int v12 = 0;
      goto LABEL_11;
    }
    *(void *)uint64_t v16 = buf;
    sub_10027696C((void ***)v16);
  }
  char v13 = qword_100A19EC0;
  int v12 = 16;
  if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_ERROR)) {
    sub_10076CCE8((uint64_t)v7, v4, v13);
  }
LABEL_11:

  return v12;
}

- (int)getCurrentScreeningCalls:(void *)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  [(Communicator *)self calls];
  id v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  sub_10061F99C(&v7);
  uint64_t v5 = v10;
  uint64_t v4 = v11;
  while (v5 != v4)
  {
    if (*(unsigned char *)(v5 + 15))
    {
      sub_10061FA2C((uint64_t *)&v7, v5);
      uint64_t v4 = v11;
    }
    v5 += 104;
  }
  if (&v7 != a3) {
    sub_100276A50((uint64_t)a3, (uint64_t)v7, v8, 0x4EC4EC4EC4EC4EC5 * ((v8 - (uint64_t)v7) >> 3));
  }
  char v13 = &v7;
  sub_10027696C((void ***)&v13);
  id v7 = (void **)&v10;
  sub_10027696C(&v7);
  return 0;
}

- (int)getOperatorStatus:(void *)a3
{
  if ([(Communicator *)self ctServerConnection])
  {
    *(_OWORD *)uint64_t v11 = 0u;
    long long v12 = 0u;
    sub_10004191C(&v11[1], "");
    CFTypeRef cf1 = 0;
    [(Communicator *)self ctServerConnection];
    if (!_CTServerConnectionGetNetworkSelectionMode()
      && CFEqual(cf1, kCTRegistrationNetworkSelectionModeManual))
    {
      LODWORD(v11[0]) = 1;
    }
    uint64_t v5 = [(Communicator *)self _getSubscriptionContext];
    id v6 = [(Communicator *)self ctClient];
    id v7 = [v6 getLocalizedOperatorName:v5 error:0];

    if (v7)
    {
      sub_10004191C(&__p, (char *)[v7 UTF8String]);
      std::string::operator=((std::string *)&v11[1], &__p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      std::string::operator=((std::string *)((char *)a3 + 8), (const std::string *)&v11[1]);
      *(_DWORD *)a3 = v11[0];
    }

    if (SHIBYTE(v12) < 0)
    {
      operator delete(v11[1]);
      if (v7) {
        return 0;
      }
    }
    else if (v7)
    {
      return 0;
    }
  }
  if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_ERROR)) {
    sub_10076CD74();
  }
  return 2;
}

- (id)getRegistrationStatus
{
  if ([(Communicator *)self ctServerConnection])
  {
    id v3 = [(Communicator *)self _getSubscriptionContext];
    uint64_t v4 = [(Communicator *)self ctClient];
    id v5 = [v4 copyRegistrationDisplayStatus:v3 error:0];

    id v6 = [v5 registrationDisplayStatus];
    id v7 = objc_alloc_init(BDRegistrationStatus);
    if ([v6 isEqualToString:kCTRegistrationStatusRegisteredHome]) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = (uint64_t)[v6 isEqualToString:kCTRegistrationStatusRegisteredRoaming];
    }
    [(BDRegistrationStatus *)v7 setService:v8];
    -[BDRegistrationStatus setRoaming:](v7, "setRoaming:", [v6 isEqualToString:kCTRegistrationStatusRegisteredRoaming]);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_ERROR)) {
      sub_10076CDA8();
    }
    id v7 = 0;
  }

  return v7;
}

- (int)getSignalStrength:(int *)a3 mode:(int)a4
{
  if ([(Communicator *)self ctServerConnection])
  {
    id v7 = [(Communicator *)self _getSubscriptionContext];
    uint64_t v8 = [(Communicator *)self ctClient];
    uint64_t v9 = [v8 getSignalStrengthInfo:v7 error:0];

    if (a4)
    {
      if (a4 != 1)
      {
LABEL_10:

        return 0;
      }
      uint64_t v10 = [v9 bars];
      int v11 = 20 * [v10 intValue];
    }
    else
    {
      uint64_t v10 = [v9 bars];
      int v11 = [v10 intValue];
    }
    *a3 = v11;

    goto LABEL_10;
  }
  if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_ERROR)) {
    sub_10076CDDC();
  }
  return 2;
}

- (int)getSubscriberNumber:(void *)a3
{
  uint64_t v4 = [(Communicator *)self _myNumber];
  id v5 = v4;
  if (v4)
  {
    sub_10062E840(v8, [v4 UTF8String]);
    sub_10062E90C((std::string *)a3, (uint64_t)v8);
    sub_10062E8E8(v8);
    int v6 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_ERROR)) {
      sub_10076CE10();
    }
    int v6 = 2;
  }

  return v6;
}

- (int)getMobileSubscriberIdentity:(void *)a3
{
  if ([(Communicator *)self ctServerConnection]
    && ([(Communicator *)self ctServerConnection],
        !_CTServerConnectionCopyMobileEquipmentInfo())
    && (CFAutorelease(0), (Value = (void *)CFDictionaryGetValue(0, kCTMobileEquipmentInfoCurrentSubscriberId)) != 0))
  {
    std::string::assign((std::string *)a3, (const std::string::value_type *)[Value UTF8String]);
    return 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_ERROR)) {
      sub_10076CE44();
    }
    return 2;
  }
}

- (int)getMobileEquipmentIdentity:(void *)a3
{
  if ([(Communicator *)self ctServerConnection]
    && ([(Communicator *)self ctServerConnection],
        !_CTServerConnectionCopyMobileEquipmentInfo())
    && (CFAutorelease(0), (Value = (void *)CFDictionaryGetValue(0, kCTMobileEquipmentInfoCurrentMobileId)) != 0))
  {
    std::string::assign((std::string *)a3, (const std::string::value_type *)[Value UTF8String]);
    return 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_ERROR)) {
      sub_10076CE78();
    }
    return 2;
  }
}

- (id)getCountryCodeForIdentifier:(id)a3
{
  id v4 = a3;
  if ([(Communicator *)self ctServerConnection]
    || ([(Communicator *)self ctClient],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    if (v4)
    {
      [(Communicator *)self ctServerConnection];
      _CTServerConnectionCopyISOForMCC();
    }
  }

  return 0;
}

- (id)getCountryCode
{
  if ([(Communicator *)self ctServerConnection]
    || ([(Communicator *)self ctClient],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    id v5 = [(Communicator *)self ctClient];
    int v6 = [v5 getCurrentDataSubscriptionContextSync:0];

    id v7 = [(Communicator *)self ctClient];
    id v19 = 0;
    id v8 = [v7 copyLastKnownMobileCountryCode:v6 error:&v19];
    id v9 = v19;

    if (v9)
    {
      uint64_t v10 = qword_100A19EC0;
      if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_ERROR)) {
        sub_10076CEAC((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
    else
    {
      id v17 = [(Communicator *)self getCountryCodeForIdentifier:v8];
    }
  }
  return 0;
}

- (id)getCountryCodeIdentifer
{
  id v3 = [(Communicator *)self ctClient];

  if (v3)
  {
    id v4 = [(Communicator *)self ctClient];
    id v5 = [v4 getCurrentDataSubscriptionContextSync:0];

    int v6 = [(Communicator *)self ctClient];
    id v17 = 0;
    id v7 = [v6 copyMobileCountryCode:v5 error:&v17];
    id v8 = v17;

    if (v8)
    {
      id v9 = qword_100A19EC0;
      if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_ERROR)) {
        sub_10076CEAC((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);
      }

      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (int)getTransmitState:(BOOL *)a3
{
  if ([(Communicator *)self ctServerConnection]
    && ([(Communicator *)self ctServerConnection],
        !_CTServerConnectionCopyCellularTransmitState())
    && (CFAutorelease(0), (Value = CFDictionaryGetValue(0, kKeyCTCellularTransmitState)) != 0))
  {
    int v7 = CFEqual(Value, kCTCellularTransmitStarted);
    int result = 0;
    *a3 = v7 != 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100A19EC0, OS_LOG_TYPE_ERROR)) {
      sub_10076CF18();
    }
    return 2;
  }
  return result;
}

- (Delegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(Delegate *)a3
{
  self->_delegate = a3;
}

- (TUCallCenter)tuCallCenter
{
  return self->_tuCallCenter;
}

- (__CTServerConnection)ctServerConnection
{
  return self->_ctServerConnection;
}

- (CoreTelephonyClient)ctClient
{
  return self->_ctClient;
}

- (CallList)calls
{
  return (CallList *)sub_10061FA28((int)retstr);
}

- (void)setCalls:(CallList *)a3
{
  p_calls = &self->_calls;
  if (p_calls != a3) {
    sub_100276A50((uint64_t)p_calls, (uint64_t)a3->fCalls.__begin_, (uint64_t)a3->fCalls.__end_, 0x4EC4EC4EC4EC4EC5 * ((a3->fCalls.__end_ - a3->fCalls.__begin_) >> 3));
  }
}

- (void).cxx_destruct
{
  p_calls = &self->_calls;
  sub_10027696C((void ***)&p_calls);
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_storeStrong((id *)&self->_tuCallCenter, 0);
}

- (id).cxx_construct
{
  return self;
}

@end