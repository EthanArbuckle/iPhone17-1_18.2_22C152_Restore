@interface CSDPinExchangeController
- (BOOL)sendApprovalDisplayPinToDevice:(id)a3;
- (BOOL)sendIDSAction:(id)a3 toDevice:(id)a4;
- (BOOL)sendIDSAction:(id)a3 toDevices:(id)a4;
- (CSDPinExchangeController)initWithDelegate:(id)a3;
- (CSDPinExchangeDelegate)pinExchangeDelegate;
- (NSMutableDictionary)pendingCodesToDevicesForApproval;
- (NSString)outgoingPinRequestIdentifier;
- (id)allIDSTelephonyDevices;
- (id)idsDeviceFromUniqueID:(id)a3;
- (unint64_t)randomSixDigitCode;
- (void)cancelPinRequests;
- (void)displayErrorNotificationWithMessage:(id)a3;
- (void)displayMismatchedAccountsNotification;
- (void)displayPinErrorNotification;
- (void)displaySlotsFullNotification;
- (void)handlePINCodeEnteredSuccessfully:(BOOL)a3 canceled:(BOOL)a4 fromDevice:(id)a5 isPrimaryDevice:(BOOL)a6;
- (void)removeErrorNotifications;
- (void)requestPinFromDevice:(id)a3;
- (void)sendApprovalResponseToDevice:(id)a3 enteredCorrectly:(BOOL)a4 wasCancelled:(BOOL)a5;
- (void)sendPinCodeAndPromptForResponseToDevice:(id)a3 forSenderIdentityUUID:(id)a4;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setOutgoingPinRequestIdentifier:(id)a3;
- (void)setPendingCodesToDevicesForApproval:(id)a3;
- (void)setPinExchangeDelegate:(id)a3;
@end

@implementation CSDPinExchangeController

- (CSDPinExchangeController)initWithDelegate:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSDPinExchangeController;
  v6 = [(CSDPinExchangeController *)&v11 init];
  if (v6)
  {
    v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting up Pin Exchange controller", v10, 2u);
    }

    objc_storeStrong((id *)&v6->_pinExchangeDelegate, a3);
    v8 = +[CSDThumperIDSService sharedInstance];
    [v8 addServiceDelegate:v6 queue:&_dispatch_main_q];
  }
  return v6;
}

- (void)requestPinFromDevice:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Requesting PIN from device %@", buf, 0xCu);
  }

  if (+[TUCallCapabilities accountsSupportSecondaryCalling])
  {
    v6 = [(CSDPinExchangeController *)self pinExchangeDelegate];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000DE8A4;
    v8[3] = &unk_1005072B0;
    v8[4] = self;
    id v9 = v4;
    [v6 displayServiceConfirmationWithCompletionHandler:v8];
  }
  else
  {
    v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[WARN] accountsSupportSecondaryCalling=NO. Displaying mismatched accounts notification", buf, 2u);
    }

    [(CSDPinExchangeController *)self displayMismatchedAccountsNotification];
  }
}

- (void)cancelPinRequests
{
  v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Canceling all PIN requests", buf, 2u);
  }

  id v4 = [(CSDPinExchangeController *)self allIDSTelephonyDevices];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(CSDPinExchangeController *)self sendIDSAction:@"CSDPinExchangeActionCancelledSecondary" toDevice:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }
}

- (id)idsDeviceFromUniqueID:(id)a3
{
  id v3 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = +[CSDThumperIDSService sharedInstance];
  id v5 = [v4 devices];

  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        long long v10 = [v9 uniqueID];
        unsigned int v11 = [v10 isEqualToString:v3];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)allIDSTelephonyDevices
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = +[CSDThumperIDSService sharedInstance];
  id v4 = [v3 devices];

  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 supportsPhoneCalls]) {
          [v2 addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v2;
}

- (void)sendPinCodeAndPromptForResponseToDevice:(id)a3 forSenderIdentityUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 uniqueID];
  long long v9 = [(CSDPinExchangeController *)self idsDeviceFromUniqueID:v8];

  if (v9)
  {
    if ([(CSDPinExchangeController *)self sendApprovalDisplayPinToDevice:v9])
    {
      [(CSDPinExchangeController *)self removeErrorNotifications];
      objc_initWeak(location, self);
      long long v10 = [(CSDPinExchangeController *)self pinExchangeDelegate];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000DEEF4;
      v14[3] = &unk_1005072D8;
      objc_copyWeak(&v17, location);
      id v15 = v9;
      id v16 = v7;
      [v10 displayPinMessageForDevice:v15 completionHandler:v14];

      objc_destroyWeak(&v17);
      objc_destroyWeak(location);
      goto LABEL_10;
    }
  }
  else
  {
    long long v11 = sub_100008DCC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      long long v12 = [v6 uniqueID];
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find device for unique ID %@", (uint8_t *)location, 0xCu);
    }
  }
  long long v13 = sub_100008DCC();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_1003AAAB4(v13);
  }

LABEL_10:
}

- (BOOL)sendApprovalDisplayPinToDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDPinExchangeController *)self pendingCodesToDevicesForApproval];
  id v6 = [v4 uniqueID];
  id v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    v8 = sub_100008DCC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      long long v9 = [v4 uniqueID];
      int v19 = 138412290;
      id v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring request to send PIN code because we already have one pending for device with unique ID %@", (uint8_t *)&v19, 0xCu);
    }
    BOOL v10 = 0;
  }
  else
  {
    unint64_t v11 = [(CSDPinExchangeController *)self randomSixDigitCode];
    if (!self->_pendingCodesToDevicesForApproval)
    {
      long long v12 = +[NSMutableDictionary dictionary];
      pendingCodesToDevicesForApproval = self->_pendingCodesToDevicesForApproval;
      self->_pendingCodesToDevicesForApproval = v12;
    }
    long long v14 = +[NSNumber numberWithUnsignedInteger:v11];
    id v15 = self->_pendingCodesToDevicesForApproval;
    id v16 = [v4 uniqueID];
    [(NSMutableDictionary *)v15 setObject:v14 forKeyedSubscript:v16];

    id v17 = sub_100008DCC();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Sending a PIN code to device %@ to display to enroll them into Thumper", (uint8_t *)&v19, 0xCu);
    }

    BOOL v10 = [(CSDPinExchangeController *)self sendIDSAction:@"CSDPinExchangeActionSendPIN" toDevice:v4];
  }

  return v10;
}

- (void)sendApprovalResponseToDevice:(id)a3 enteredCorrectly:(BOOL)a4 wasCancelled:(BOOL)a5
{
  CFStringRef v6 = @"CSDPinExchangeActionUnapproved";
  if (a4) {
    CFStringRef v6 = @"CSDPinExchangeActionApproved";
  }
  if (a5) {
    CFStringRef v7 = @"CSDPinExchangeActionCancelledPrimary";
  }
  else {
    CFStringRef v7 = v6;
  }
  [(CSDPinExchangeController *)self sendIDSAction:v7 toDevice:a3];
}

- (BOOL)sendIDSAction:(id)a3 toDevice:(id)a4
{
  id v10 = a4;
  id v6 = a4;
  id v7 = a3;
  v8 = +[NSArray arrayWithObjects:&v10 count:1];

  LOBYTE(a3) = -[CSDPinExchangeController sendIDSAction:toDevices:](self, "sendIDSAction:toDevices:", v7, v8, v10);
  return (char)a3;
}

- (BOOL)sendIDSAction:(id)a3 toDevices:(id)a4
{
  id v5 = (__CFString *)a3;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = a4;
  id v37 = [obj countByEnumeratingWithState:&v47 objects:v61 count:16];
  if (v37)
  {
    int v6 = 1;
    uint64_t v35 = IDSSendMessageOptionTimeoutKey;
    uint64_t v36 = *(void *)v48;
    id v7 = &OBJC_METACLASS___CSDCallCapabilities;
    do
    {
      for (i = 0; i != v37; i = (char *)i + 1)
      {
        if (*(void *)v48 != v36) {
          objc_enumerationMutation(obj);
        }
        long long v9 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        uint64_t v10 = IDSCopyIDForDevice();
        unint64_t v11 = +[NSMutableDictionary dictionary];
        [v11 setObject:v5 forKeyedSubscript:@"CSDPinExchangeActionKey"];
        long long v12 = [&v7[52] sharedInstance];
        long long v13 = [v12 callerID];

        if ([v13 length])
        {
          [v11 setObject:v13 forKeyedSubscript:@"CSDPinExchangeCallerIDKey"];
        }
        else
        {
          long long v14 = sub_100008DCC();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            sub_1003AAAF8(v59, &v60, v14);
          }
        }
        if ([(__CFString *)v5 isEqualToString:@"CSDPinExchangeActionSendPIN"])
        {
          pendingCodesToDevicesForApproval = self->_pendingCodesToDevicesForApproval;
          id v16 = [v9 uniqueID];
          id v17 = [(NSMutableDictionary *)pendingCodesToDevicesForApproval objectForKey:v16];

          if (v17) {
            [v11 setObject:v17 forKeyedSubscript:@"CSDPinExchangePinKey"];
          }
        }
        v43 = v13;
        v18 = sub_100008DCC();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          CFStringRef v54 = v5;
          __int16 v55 = 2112;
          id v56 = v9;
          __int16 v57 = 2112;
          id v58 = v11;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Sending IDS action %@ to device %@ with message %@", buf, 0x20u);
        }

        int v19 = JWEncodeDictionary();
        id v42 = [v19 _FTCopyGzippedData];
        id v20 = +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:");
        uint64_t v51 = v35;
        v52 = &off_100523B00;
        v21 = +[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
        v44 = (void *)v10;
        if (v20)
        {
          v39 = v19;
          v40 = v11;
          int v41 = v6;
          v22 = [&v7[52] sharedInstance];
          v23 = [v22 service];
          v24 = IMSingleObjectArray();
          objc_msgSend(v24, "__imSetFromArray");
          v26 = v25 = v5;
          id v45 = 0;
          id v46 = 0;
          v38 = v21;
          unsigned int v27 = [v23 sendMessage:v20 fromAccount:0 toDestinations:v26 priority:300 options:v21 identifier:&v46 error:&v45];
          id v28 = v46;
          id v29 = v45;

          id v5 = v25;
          if (v27
            && [(__CFString *)v25 isEqualToString:@"CSDPinExchangeActionRequestPIN"])
          {
            [(CSDPinExchangeController *)self setOutgoingPinRequestIdentifier:v28];
          }
          v30 = sub_100008DCC();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            CFStringRef v31 = @"NO";
            if (v27) {
              CFStringRef v31 = @"YES";
            }
            CFStringRef v54 = v31;
            __int16 v55 = 2112;
            id v56 = v29;
            __int16 v57 = 2112;
            id v58 = v28;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Thumper IDS action sent to device with success: %@ error: %@ identifier: %@", buf, 0x20u);
          }

          int v6 = v41 & v27;
          id v7 = &OBJC_METACLASS___CSDCallCapabilities;
          int v19 = v39;
          unint64_t v11 = v40;
          v21 = v38;
        }
        else
        {
          id v28 = 0;
          id v29 = 0;
        }
      }
      id v37 = [obj countByEnumeratingWithState:&v47 objects:v61 count:16];
    }
    while (v37);
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6 & 1;
}

- (unint64_t)randomSixDigitCode
{
  return (int)(arc4random_uniform(0xDBB9Fu) + 100000);
}

- (void)displayErrorNotificationWithMessage:(id)a3
{
  id v4 = a3;
  id v5 = TUBundle();
  int v6 = [v5 localizedStringForKey:@"OK" value:&stru_100517F40 table:@"TelephonyUtilities"];

  id v7 = [(CSDPinExchangeDelegate *)self->_pinExchangeDelegate serviceDescription];
  v8 = +[IMUserNotification userNotificationWithIdentifier:@"com.apple.telephonyutilities.callservicesd.pinexchangeerror" title:v7 message:v4 defaultButton:v6 alternateButton:0 otherButton:0];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DFB14;
  block[3] = &unk_100504EC0;
  id v11 = v8;
  id v9 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)removeErrorNotifications
{
  id v2 = +[IMUserNotificationCenter sharedInstance];
  [v2 removeNotificationsForServiceIdentifier:@"com.apple.telephonyutilities.callservicesd.pinexchangeerror"];
}

- (void)displayPinErrorNotification
{
  id v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[WARN] Displaying PIN error notification", v6, 2u);
  }

  id v4 = TUBundle();
  id v5 = [v4 localizedStringForKey:@"INCORRECT_PIN_ENTERED" value:&stru_100517F40 table:@"TelephonyUtilities"];
  [(CSDPinExchangeController *)self displayErrorNotificationWithMessage:v5];
}

- (void)displayMismatchedAccountsNotification
{
  id v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[WARN] Displaying mismatched accounts notification", v8, 2u);
  }

  id v4 = objc_alloc_init((Class)TUFeatureFlags);
  [v4 appleAccountRebrandEnabled];
  id v5 = TUBundle();
  int v6 = TUStringKeyForNetwork();
  id v7 = [v5 localizedStringForKey:v6 value:&stru_100517F40 table:@"TelephonyUtilities"];
  [(CSDPinExchangeController *)self displayErrorNotificationWithMessage:v7];
}

- (void)displaySlotsFullNotification
{
  id v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[WARN] Displaying slots full notification", v6, 2u);
  }

  id v4 = TUBundle();
  id v5 = [v4 localizedStringForKey:@"MAX_SLOTS_FILLED" value:&stru_100517F40 table:@"TelephonyUtilities"];
  [(CSDPinExchangeController *)self displayErrorNotificationWithMessage:v5];
}

- (void)handlePINCodeEnteredSuccessfully:(BOOL)a3 canceled:(BOOL)a4 fromDevice:(id)a5 isPrimaryDevice:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a5;
  id v11 = [(CSDPinExchangeController *)self pendingCodesToDevicesForApproval];
  long long v12 = [v10 uniqueID];
  [v11 setObject:0 forKeyedSubscript:v12];

  long long v13 = [(CSDPinExchangeController *)self pinExchangeDelegate];
  id v15 = v13;
  if (v6) {
    id v14 = v10;
  }
  else {
    id v14 = 0;
  }
  [v13 pinCodeEnteredSuccessfully:v8 cancelled:v7 onPrimaryDevice:v14];
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a3;
  id v11 = a6;
  long long v12 = [a5 objectForKey:@"CSDPinExchangeCompressedDataKey"];
  long long v13 = [v12 _FTDecompressData];

  id v14 = JWDecodeDictionary();
  id v15 = +[CSDThumperIDSService sharedInstance];
  id v16 = [v15 deviceForFromID:v11];

  id v17 = sub_100008DCC();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v65 = v10;
    __int16 v66 = 2112;
    v67 = v16;
    __int16 v68 = 1024;
    unsigned int v69 = [v16 isHSATrusted];
    __int16 v70 = 2112;
    v71 = v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Received message for service %@ from device %@ (isHSATrusted=%d): %@", buf, 0x26u);
  }

  v18 = [v14 objectForKeyedSubscript:@"CSDPinExchangeActionKey"];
  int v19 = [v14 objectForKeyedSubscript:@"CSDPinExchangeCallerIDKey"];
  if ([v18 isEqualToString:@"CSDPinExchangeActionRequestPIN"])
  {
    id v20 = [(CSDPinExchangeController *)self outgoingPinRequestIdentifier];

    if (v20)
    {
      v21 = sub_100008DCC();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Ignoring pin request: There is already a pending pin request that has not yet completed.", buf, 2u);
      }
      goto LABEL_9;
    }
    id v56 = objc_alloc_init((Class)TUCallProviderManager);
    v23 = [v56 faceTimeProvider];
    v24 = [v23 prioritizedSenderIdentities];

    __int16 v57 = v24;
    if ([v24 count])
    {
      __int16 v55 = self;
      if ([v24 count] == (id)1)
      {
        v25 = [v24 firstObject];
        v26 = [v25 UUID];

        unsigned int v27 = sub_100008DCC();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v65 = v26;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "One sender identity exists; continuing Thumper registration using UUID %@",
            buf,
            0xCu);
        }
        goto LABEL_48;
      }
      id v34 = [v19 length];
      v30 = sub_100008DCC();
      BOOL v35 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
      if (v34)
      {
        if (v35)
        {
          *(_DWORD *)buf = 138412546;
          v65 = v19;
          __int16 v66 = 2112;
          v67 = v57;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Multiple sender identities exist; checking whether caller ID %@ matches a sender identity in %@",
            buf,
            0x16u);
        }

        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        unsigned int v27 = v57;
        v26 = [v27 countByEnumeratingWithState:&v59 objects:v63 count:16];
        if (v26)
        {
          long long v50 = v14;
          uint64_t v51 = v18;
          v52 = v13;
          id v53 = v11;
          CFStringRef v54 = v10;
          uint64_t v36 = *(void *)v60;
          while (2)
          {
            for (i = 0; i != v26; i = ((char *)i + 1))
            {
              if (*(void *)v60 != v36) {
                objc_enumerationMutation(v27);
              }
              v38 = v27;
              v39 = *(void **)(*((void *)&v59 + 1) + 8 * i);
              v40 = objc_msgSend(v39, "handle", v50);
              int v41 = [v40 isoCountryCode];
              id v42 = +[TUHandle normalizedPhoneNumberHandleForValue:v19 isoCountryCode:v41];

              if (v40) {
                BOOL v43 = v42 == 0;
              }
              else {
                BOOL v43 = 1;
              }
              if (!v43 && [v42 isEqualToHandle:v40])
              {
                v26 = [v39 UUID];

                id v11 = v53;
                id v10 = v54;
                long long v13 = v52;
                v18 = v51;
                unsigned int v27 = v38;
                goto LABEL_47;
              }

              unsigned int v27 = v38;
            }
            v26 = [v38 countByEnumeratingWithState:&v59 objects:v63 count:16];
            if (v26) {
              continue;
            }
            break;
          }
          id v11 = v53;
          id v10 = v54;
          long long v13 = v52;
          v18 = v51;
LABEL_47:
          id v14 = v50;
        }
LABEL_48:

        if (v26)
        {
          if ([v16 isHSATrusted]
            && ([v16 uniqueID],
                v44 = objc_claimAutoreleasedReturnValue(),
                unsigned int v45 = +[TUCallCapabilities isRelayCallingEnabledForDeviceWithID:v44], v44, v45))
          {
            id v46 = sub_100008DCC();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Device requesting PIN is HSA trusted. Forgoing PIN exchange and enrolling the device immediately", buf, 2u);
            }

            long long v47 = [(CSDPinExchangeController *)v55 pinExchangeDelegate];
            [v47 enrollDevice:v16 forSenderIdentityUUID:v26];

            long long v48 = sub_100008DCC();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v65 = v16;
              _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Activated Thumper for requesting device %@", buf, 0xCu);
            }

            [(CSDPinExchangeController *)v55 sendIDSAction:@"CSDPinExchangeActionApproved" toDevice:v16];
          }
          else
          {
            long long v49 = sub_100008DCC();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v65 = v16;
              __int16 v66 = 2112;
              v67 = v26;
              _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Received request to enroll device %@ in Thumper for sender identity with UUID %@", buf, 0x16u);
            }

            [(CSDPinExchangeController *)v55 sendPinCodeAndPromptForResponseToDevice:v16 forSenderIdentityUUID:v26];
          }
LABEL_61:

          goto LABEL_62;
        }
LABEL_56:
        v26 = sub_100008DCC();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[WARN] Aborting Thumper registration; could not obtain sender identity UUID.",
            buf,
            2u);
        }
        goto LABEL_61;
      }
      if (v35)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "[WARN] Aborting Thumper registration; multiple sender identities exist but caller ID not supplied",
          buf,
          2u);
      }
    }
    else
    {
      v30 = sub_100008DCC();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_1003AAB74(v56, v30);
      }
    }

    goto LABEL_56;
  }
  if (![v18 isEqualToString:@"CSDPinExchangeActionSendPIN"])
  {
    if ([v18 isEqualToString:@"CSDPinExchangeActionOneTimeReminder"])
    {
      [(CSDPinExchangeDelegate *)self->_pinExchangeDelegate resetOneTimeMessage];
      goto LABEL_62;
    }
    if ([v18 isEqualToString:@"CSDPinExchangeActionApproved"])
    {
      id v28 = self;
      uint64_t v29 = 1;
    }
    else
    {
      if (![v18 isEqualToString:@"CSDPinExchangeActionUnapproved"])
      {
        if (![v18 isEqualToString:@"CSDPinExchangeActionCancelledPrimary"])
        {
          if (![v18 isEqualToString:@"CSDPinExchangeActionCancelledSecondary"]) {
            goto LABEL_62;
          }
          id v28 = self;
          uint64_t v29 = 0;
          uint64_t v31 = 1;
          v32 = v16;
          uint64_t v33 = 0;
          goto LABEL_25;
        }
        id v28 = self;
        uint64_t v29 = 0;
        uint64_t v31 = 1;
LABEL_24:
        v32 = v16;
        uint64_t v33 = 1;
LABEL_25:
        [(CSDPinExchangeController *)v28 handlePINCodeEnteredSuccessfully:v29 canceled:v31 fromDevice:v32 isPrimaryDevice:v33];
        goto LABEL_62;
      }
      id v28 = self;
      uint64_t v29 = 0;
    }
    uint64_t v31 = 0;
    goto LABEL_24;
  }
  v21 = [v14 objectForKey:@"CSDPinExchangePinKey"];
  pinExchangeDelegate = self->_pinExchangeDelegate;
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_1000E0740;
  v58[3] = &unk_1005055A8;
  v58[4] = self;
  [(CSDPinExchangeDelegate *)pinExchangeDelegate displayIncomingPinCode:v21 fromID:v11 completionHandler:v58];
LABEL_9:

LABEL_62:
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = sub_100008DCC();
  id v17 = v16;
  if (v8)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412290;
      id v23 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Received didSendWithSuccess=YES for message with identifier %@", (uint8_t *)&v22, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1003AAC0C((uint64_t)v14, (uint64_t)v15, v17);
    }

    v18 = [(CSDPinExchangeController *)self outgoingPinRequestIdentifier];
    unsigned int v19 = [v18 isEqualToString:v14];

    if (v19) {
      [(CSDPinExchangeDelegate *)self->_pinExchangeDelegate displayPinRequestFailure];
    }
  }
  id v20 = [(CSDPinExchangeController *)self outgoingPinRequestIdentifier];
  unsigned int v21 = [v20 isEqualToString:v14];

  if (v21) {
    [(CSDPinExchangeController *)self setOutgoingPinRequestIdentifier:0];
  }
}

- (NSMutableDictionary)pendingCodesToDevicesForApproval
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPendingCodesToDevicesForApproval:(id)a3
{
}

- (CSDPinExchangeDelegate)pinExchangeDelegate
{
  return (CSDPinExchangeDelegate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPinExchangeDelegate:(id)a3
{
}

- (NSString)outgoingPinRequestIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOutgoingPinRequestIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outgoingPinRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_pinExchangeDelegate, 0);

  objc_storeStrong((id *)&self->_pendingCodesToDevicesForApproval, 0);
}

@end