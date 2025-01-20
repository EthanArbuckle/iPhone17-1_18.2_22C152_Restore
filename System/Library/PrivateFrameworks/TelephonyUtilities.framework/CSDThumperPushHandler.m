@interface CSDThumperPushHandler
- (BOOL)thumperCallingAllowedOnDefaultPairedDeviceDefault;
- (__CFString)ctServiceType;
- (id)serviceDescription;
- (void)displayIncomingPinCode:(id)a3 fromID:(id)a4 completionHandler:(id)a5;
- (void)displayPinMessageForDevice:(id)a3 completionHandler:(id)a4;
- (void)displayPinRequestFailure;
- (void)displayServiceConfirmationWithCompletionHandler:(id)a3;
- (void)enrollDevice:(id)a3 forSenderIdentityUUID:(id)a4;
- (void)pinCodeEnteredSuccessfully:(BOOL)a3 cancelled:(BOOL)a4 onPrimaryDevice:(id)a5;
- (void)setThumperCallingAllowedOnDefaultPairedDeviceDefault:(BOOL)a3;
- (void)unenrollDevice:(id)a3;
- (void)updateUINotification;
@end

@implementation CSDThumperPushHandler

- (__CFString)ctServiceType
{
  return (__CFString *)kCTCapabilityPhoneServices;
}

- (id)serviceDescription
{
  v2 = TUBundle();
  v3 = TUStringKeyForNetwork();
  v4 = [v2 localizedStringForKey:v3 value:&stru_100517F40 table:@"TelephonyUtilities"];

  return v4;
}

- (void)enrollDevice:(id)a3 forSenderIdentityUUID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Enabling relay calling on secondary device %@.", (uint8_t *)&v11, 0xCu);
  }

  v8 = [v5 uniqueIDOverride];
  +[TUCallCapabilities setRelayCallingEnabled:1 forDeviceWithID:v8];

  v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Activating Thumper calling on secondary device %@ for telephony subscription with UUID %@.", (uint8_t *)&v11, 0x16u);
  }

  v10 = [v5 uniqueIDOverride];
  +[TUCallCapabilities setThumperCallingAllowed:1 onSecondaryDeviceWithID:v10 forSenderIdentityWithUUID:v6];
}

- (void)unenrollDevice:(id)a3
{
  v4 = [a3 uniqueIDOverride];
  +[TUCallCapabilities setThumperCallingAllowed:0 onSecondaryDeviceWithID:v4];

  [(CSDThumperPushHandler *)self updateUINotification];
}

- (void)displayPinMessageForDevice:(id)a3 completionHandler:(id)a4
{
  id v32 = a4;
  id v5 = a3;
  v31 = [v5 name];
  id v6 = TUStringKeyForNetwork();
  v7 = [v5 normalizedDeviceType];

  v33 = [v6 stringByAppendingFormat:@"_%@", v7];

  v8 = TUBundle();
  v30 = [v8 localizedStringForKey:v33 value:&stru_100517F40 table:@"TelephonyUtilities"];

  v9 = TUBundle();
  v10 = TUStringKeyForNetwork();
  v29 = [v9 localizedStringForKey:v10 value:&stru_100517F40 table:@"TelephonyUtilities"];

  int v11 = TUBundle();
  v28 = [v11 localizedStringForKey:@"ALLOW" value:&stru_100517F40 table:@"TelephonyUtilities"];

  id v12 = TUBundle();
  __int16 v13 = [v12 localizedStringForKey:@"CANCEL" value:&stru_100517F40 table:@"TelephonyUtilities"];

  uint64_t v27 = IMUserNotificationTitleKey;
  id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v30, v31);
  uint64_t v15 = IMUserNotificationMessageKey;
  v16 = +[NSArray arrayWithObject:&stru_100517F40];
  uint64_t v17 = IMUserNotificationTextFieldValuesKey;
  v18 = +[NSArray arrayWithObject:&stru_100517F40];
  uint64_t v19 = IMUserNotificationTextFieldTitlesKey;
  uint64_t v20 = IMUserNotificationDefaultButtonTitleKey;
  uint64_t v21 = IMUserNotificationAlternateButtonTitleKey;
  v22 = +[NSNumber numberWithInt:5];
  v23 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v29, v27, v14, v15, v16, v17, v18, v19, v28, v20, v13, v21, v22, kCFUserNotificationKeyboardTypesKey, 0);

  v24 = +[IMUserNotification userNotificationWithIdentifier:@"PrimaryDeviceNotification" timeout:3 alertLevel:0 displayFlags:v23 displayInformation:0.0];
  v25 = +[IMUserNotificationCenter sharedInstance];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000AB958;
  v34[3] = &unk_100506AA8;
  id v35 = v32;
  id v26 = v32;
  [v25 addUserNotification:v24 listener:0 completionHandler:v34];
}

- (void)displayServiceConfirmationWithCompletionHandler:(id)a3
{
  id v3 = a3;
  v4 = sub_100008DCC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Showing service confirmation dialog to user", buf, 2u);
  }

  id v5 = TUBundle();
  id v6 = TUStringKeyForNetwork();
  v7 = [v5 localizedStringForKey:v6 value:&stru_100517F40 table:@"TelephonyUtilities"];

  v8 = TUBundle();
  v9 = TUStringKeyForNetwork();
  v10 = [v8 localizedStringForKey:v9 value:&stru_100517F40 table:@"TelephonyUtilities"];

  int v11 = TUBundle();
  id v12 = [v11 localizedStringForKey:@"THUMPER_PUSH_HANDLER_CONSENT_ALERT_ENABLE" value:&stru_100517F40 table:@"TelephonyUtilities"];

  __int16 v13 = TUBundle();
  id v14 = [v13 localizedStringForKey:@"THUMPER_PUSH_HANDLER_CONSENT_ALERT_CANCEL" value:&stru_100517F40 table:@"TelephonyUtilities"];

  uint64_t v15 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v10, IMUserNotificationTitleKey, v7, IMUserNotificationMessageKey, v12, IMUserNotificationDefaultButtonTitleKey, v14, IMUserNotificationAlternateButtonTitleKey, 0);
  v16 = +[IMUserNotification userNotificationWithIdentifier:@"SecondaryDeviceNotification" timeout:3 alertLevel:0 displayFlags:v15 displayInformation:0.0];
  uint64_t v17 = +[IMUserNotificationCenter sharedInstance];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000ABD50;
  v19[3] = &unk_100506AA8;
  id v20 = v3;
  id v18 = v3;
  [v17 addUserNotification:v16 listener:0 completionHandler:v19];
}

- (void)pinCodeEnteredSuccessfully:(BOOL)a3 cancelled:(BOOL)a4 onPrimaryDevice:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109376;
    v11[1] = v6;
    __int16 v12 = 1024;
    BOOL v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PIN code entered with success=%d cancelled=%d", (uint8_t *)v11, 0xEu);
  }

  v9 = +[IMUserNotificationCenter sharedInstance];
  [v9 removeNotificationsForServiceIdentifier:@"PrimaryDeviceNotification"];

  v10 = +[IMUserNotificationCenter sharedInstance];
  [v10 removeNotificationsForServiceIdentifier:@"SecondaryDeviceNotification"];

  [(CSDThumperPushHandler *)self updateUINotification];
  if (v6)
  {
    +[TUCallCapabilities setRelayCallingEnabled:1];
    +[TUCallCapabilities setThumperCallingEnabled:1];
  }
}

- (void)displayIncomingPinCode:(id)a3 fromID:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Device Pin Exchange received an incoming approval request", buf, 2u);
  }

  int v11 = +[CSDThumperIDSService sharedInstance];
  __int16 v12 = [v11 deviceForFromID:v8];

  if ([v12 supportsPhoneCalls])
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    BOOL v13 = [v12 linkedUserURIs];
    id v14 = [v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v34;
LABEL_6:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v34 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = (void *)IDSCopyRawAddressForDestination();
        if (IMStringIsPhoneNumber()) {
          break;
        }

        if (v15 == (id)++v17)
        {
          id v15 = [v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
          if (v15) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }
      uint64_t v19 = IMFormattedDisplayStringForNumber();

      if (v19) {
        goto LABEL_17;
      }
    }
    else
    {
LABEL_12:
    }
    id v20 = +[CSDThumperIDSService sharedInstance];
    uint64_t v21 = [v20 service];
    v22 = [v21 uriForFromID:v8];

    uint64_t v19 = IDSCopyRawAddressForDestination();
LABEL_17:
    v23 = TUBundle();
    v24 = TUStringKeyForNetworkAndProduct();
    v25 = [v23 localizedStringForKey:v24 value:&stru_100517F40 table:@"TelephonyUtilities"];

    id v26 = TUBundle();
    uint64_t v27 = [v26 localizedStringForKey:@"CANCEL" value:&stru_100517F40 table:@"TelephonyUtilities"];

    v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v25, v19, v7);
    v29 = +[IMUserNotification userNotificationWithIdentifier:@"SecondaryDeviceNotification" title:v28 message:0 defaultButton:v27 alternateButton:0 otherButton:0];

    if (v29)
    {
      [v29 setUsesNotificationCenter:0];
      [v29 setRepresentedApplicationBundle:TUBundleIdentifierTelephonyUtilitiesFramework];
      v30 = +[IMUserNotificationCenter sharedInstance];
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_1000AC35C;
      v31[3] = &unk_100506AA8;
      id v32 = v9;
      [v30 addUserNotification:v29 listener:0 completionHandler:v31];
    }
  }
  else
  {
    uint64_t v19 = sub_100008DCC();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v12;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[WARN] We received an incoming pin code alert from a non-telephony device: %@", buf, 0xCu);
    }
  }
}

- (void)displayPinRequestFailure
{
  v2 = sub_100008DCC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Request for pin exchange failed", v14, 2u);
  }

  id v3 = TUBundle();
  v4 = TUStringKeyForNetwork();
  BOOL v5 = [v3 localizedStringForKey:v4 value:&stru_100517F40 table:@"TelephonyUtilities"];

  BOOL v6 = TUBundle();
  id v7 = TUStringKeyForNetworkAndProduct();
  id v8 = [v6 localizedStringForKey:v7 value:&stru_100517F40 table:@"TelephonyUtilities"];

  id v9 = TUBundle();
  v10 = [v9 localizedStringForKey:@"OK" value:&stru_100517F40 table:@"TelephonyUtilities"];

  int v11 = +[IMUserNotification userNotificationWithIdentifier:@"SecondaryDeviceNotification" title:v5 message:v8 defaultButton:v10 alternateButton:0 otherButton:0];
  __int16 v12 = v11;
  if (v11)
  {
    [v11 setUsesNotificationCenter:0];
    [v12 setRepresentedApplicationBundle:TUBundleIdentifierTelephonyUtilitiesFramework];
    BOOL v13 = +[IMUserNotificationCenter sharedInstance];
    [v13 addUserNotification:v12 listener:0 completionHandler:0];
  }
}

- (void)updateUINotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v3 = (const __CFString *)TUCallCapabilitiesThumperPinAlertCompletedNotification;

  CFNotificationCenterPostNotification(DarwinNotifyCenter, v3, 0, 0, 1u);
}

- (BOOL)thumperCallingAllowedOnDefaultPairedDeviceDefault
{
  return self->_thumperCallingAllowedOnDefaultPairedDeviceDefault;
}

- (void)setThumperCallingAllowedOnDefaultPairedDeviceDefault:(BOOL)a3
{
  self->_thumperCallingAllowedOnDefaultPairedDeviceDefault = a3;
}

@end