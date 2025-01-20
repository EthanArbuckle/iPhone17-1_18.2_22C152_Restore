@interface PHInCallUIUtilities
+ (BOOL)hasMultipleSenderIdentities;
+ (BOOL)isExplicitTransferSupportedForSubscriptionLabelIdentifier:(id)a3;
+ (BOOL)isSpringBoardPasscodeLocked;
+ (BOOL)layoutIsLocked:(id)a3;
+ (BOOL)shouldRequestPasscodeUnlockForMMICode:(id)a3;
+ (id)fbsOrientationObserver;
+ (id)handleNavigationControllerIfNecessary:(id)a3;
+ (id)sharedInstance;
+ (id)telephonyClient;
+ (int64_t)deviceOrientationForBSInterfaceOrientation:(int64_t)a3;
+ (int64_t)frontboardOrientation;
+ (int64_t)interfaceOrientationForDeviceOrientation:(int64_t)a3;
- (BOOL)isSpringBoardLocked;
- (PHInCallUIUtilities)init;
- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5;
- (void)setSpringBoardLocked:(BOOL)a3;
@end

@implementation PHInCallUIUtilities

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002A4D0;
  block[3] = &unk_1000A20B0;
  block[4] = a1;
  if (qword_1000BC020 != -1) {
    dispatch_once(&qword_1000BC020, block);
  }
  v2 = (void *)qword_1000BC018;

  return v2;
}

- (PHInCallUIUtilities)init
{
  v9.receiver = self;
  v9.super_class = (Class)PHInCallUIUtilities;
  v2 = [(PHInCallUIUtilities *)&v9 init];
  if (v2)
  {
    v3 = +[FBSDisplayLayoutMonitor sharedMonitorForDisplayType:0];
    v4 = objc_opt_class();
    v5 = [v3 currentLayout];
    if ([v4 layoutIsLocked:v5])
    {
      BOOL v6 = 1;
    }
    else
    {
      uint64_t v11 = 0;
      v12 = &v11;
      uint64_t v13 = 0x2020000000;
      v7 = (unsigned int (*)(void))off_1000BC058;
      v14 = off_1000BC058;
      if (!off_1000BC058)
      {
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_10002B430;
        v10[3] = &unk_1000A21E8;
        v10[4] = &v11;
        sub_10002B430((uint64_t)v10);
        v7 = (unsigned int (*)(void))v12[3];
      }
      _Block_object_dispose(&v11, 8);
      if (!v7) {
        sub_10006A63C();
      }
      BOOL v6 = v7(0) != 0;
    }
    v2->_springBoardLocked = v6;

    [v3 addObserver:v2];
  }
  return v2;
}

+ (id)telephonyClient
{
  if (qword_1000BC030 != -1) {
    dispatch_once(&qword_1000BC030, &stru_1000A2180);
  }
  v2 = (void *)qword_1000BC028;

  return v2;
}

+ (int64_t)interfaceOrientationForDeviceOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) >= 3) {
    return 1;
  }
  else {
    return a3;
  }
}

+ (int64_t)deviceOrientationForBSInterfaceOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 2) {
    return 1;
  }
  else {
    return qword_10007D5B8[a3 - 2];
  }
}

+ (id)handleNavigationControllerIfNecessary:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 topViewController];
  }
  else
  {
    id v4 = v3;
  }
  v5 = v4;

  return v5;
}

+ (BOOL)shouldRequestPasscodeUnlockForMMICode:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"*#06#"])
  {
    v5 = [a1 telephonyClient];
    id v33 = 0;
    BOOL v6 = [v5 getSubscriptionInfoWithError:&v33];
    v7 = v33;

    if (v7)
    {
      v27 = sub_100012C68();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_10006A71C();
      }
    }
    else
    {
      objc_super v9 = [v6 subscriptions];
      id v10 = [v9 count];

      if (v10)
      {
        v27 = [objc_alloc((Class)CTBundle) initWithBundleType:2];
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        uint64_t v11 = [v6 subscriptions];
        id v12 = [v11 countByEnumeratingWithState:&v29 objects:v38 count:16];
        if (v12)
        {
          id v13 = v12;
          v25 = v6;
          id v26 = v4;
          v7 = 0;
          uint64_t v14 = *(void *)v30;
          while (2)
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v30 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = *(void **)(*((void *)&v29 + 1) + 8 * i);
              if ((objc_msgSend(v16, "isSimHidden", v25, v26) & 1) == 0)
              {
                v17 = [a1 telephonyClient];
                v28 = v7;
                id v18 = [v17 copyCarrierBundleValueWithDefault:v16 key:@"ShowIMEIsInLockScreen" bundleType:v27 error:&v28];
                v19 = v28;

                if (v19)
                {
                  v20 = sub_100012C68();
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(void *)v35 = v19;
                    _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Received error: %@ while querying -copyCarrierBundleValueWithDefault", buf, 0xCu);
                  }
                }
                else
                {
                  if (objc_opt_respondsToSelector()) {
                    unsigned int v21 = [v18 BOOLValue];
                  }
                  else {
                    unsigned int v21 = 0;
                  }
                  v22 = sub_100012C68();
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                  {
                    v23 = [v16 uuid];
                    *(_DWORD *)buf = 67109634;
                    *(_DWORD *)v35 = v21;
                    *(_WORD *)&v35[4] = 2112;
                    *(void *)&v35[6] = v18;
                    __int16 v36 = 2112;
                    v37 = v23;
                    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Received regionWantsPasscodeBypassForIMEI: %d from carrierBundleValue: %@ subscription: %@", buf, 0x1Cu);
                  }
                  if (v21)
                  {

                    BOOL v8 = 0;
                    v7 = 0;
                    goto LABEL_34;
                  }
                }

                v7 = v19;
              }
            }
            id v13 = [v11 countByEnumeratingWithState:&v29 objects:v38 count:16];
            if (v13) {
              continue;
            }
            break;
          }
          BOOL v8 = 1;
LABEL_34:
          BOOL v6 = v25;
          id v4 = v26;
        }
        else
        {
          v7 = 0;
          BOOL v8 = 1;
        }

        goto LABEL_37;
      }
      v27 = sub_100012C68();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_10006A6B4();
      }
      v7 = 0;
    }
    BOOL v8 = 1;
LABEL_37:

    goto LABEL_38;
  }
  v7 = sub_100012C68();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Code is not for IMEI, should request passcode unlock", buf, 2u);
  }
  BOOL v8 = 1;
LABEL_38:

  return v8;
}

+ (BOOL)isSpringBoardPasscodeLocked
{
  return MKBGetDeviceLockState() - 1 < 2;
}

+ (BOOL)layoutIsLocked:(id)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  [a3 elements];
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    uint64_t v7 = FBSDisplayLayoutElementLockScreenIdentifier;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_super v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) identifier];
        unsigned __int8 v10 = [v9 isEqualToString:v7];

        if (v10)
        {
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

+ (BOOL)hasMultipleSenderIdentities
{
  if (qword_1000BC038 != -1) {
    dispatch_once(&qword_1000BC038, &stru_1000A21A0);
  }
  v2 = [(id)qword_1000BC040 prioritizedSenderIdentities];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

+ (id)fbsOrientationObserver
{
  if (qword_1000BC050 != -1) {
    dispatch_once(&qword_1000BC050, &stru_1000A21C0);
  }
  v2 = (void *)qword_1000BC048;

  return v2;
}

+ (BOOL)isExplicitTransferSupportedForSubscriptionLabelIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [a1 telephonyClient];
  id v38 = 0;
  uint64_t v6 = [v5 getSubscriptionInfoWithError:&v38];
  id v7 = v38;

  if (v7)
  {
    long long v32 = sub_100012C68();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_10006A7EC();
    }
    goto LABEL_30;
  }
  BOOL v8 = [v6 subscriptions];
  id v9 = [v8 count];

  unsigned __int8 v10 = sub_100012C68();
  BOOL v11 = v10;
  if (!v9)
  {
    long long v32 = v10;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10006A784();
    }
    goto LABEL_29;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v6 subscriptions];
    *(_DWORD *)buf = 138412290;
    id v40 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "ShowExplicitCallTransferButton: all the subscriptions are: %@", buf, 0xCu);
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v13 = [v6 subscriptions];
  id v14 = [v13 countByEnumeratingWithState:&v34 objects:v45 count:16];
  long long v32 = v13;
  if (!v14)
  {
LABEL_29:
    id v7 = 0;
LABEL_30:
    BOOL v28 = 0;
    goto LABEL_31;
  }
  id v15 = v14;
  id v31 = a1;
  long long v16 = 0;
  uint64_t v17 = *(void *)v35;
  id v30 = v4;
  while (2)
  {
    for (i = 0; i != v15; i = (char *)i + 1)
    {
      if (*(void *)v35 != v17) {
        objc_enumerationMutation(v13);
      }
      v19 = *(void **)(*((void *)&v34 + 1) + 8 * i);
      v20 = sub_100012C68();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v40 = v19;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "ShowExplicitCallTransferButton: checking subscription: %@", buf, 0xCu);
      }

      if (([v19 isSimHidden] & 1) == 0)
      {
        unsigned int v21 = [v19 labelID];
        unsigned int v22 = [v21 isEqualToString:v4];

        if (v22)
        {
          id v23 = [objc_alloc((Class)CTBundle) initWithBundleType:1];
          v24 = [v31 telephonyClient];
          id v33 = v16;
          id v25 = [v24 copyCarrierBundleValue:v19 keyHierarchy:&off_1000A6020 bundleType:v23 error:&v33];
          id v7 = v33;

          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
            unsigned __int8 v26 = [v25 BOOLValue];
          }
          else {
            unsigned __int8 v26 = 0;
          }
          v27 = sub_100012C68();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            id v40 = v25;
            __int16 v41 = 2112;
            v42 = v19;
            __int16 v43 = 2112;
            id v44 = v7;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "ShowExplicitCallTransferButton: retrieved ShowExplicitCallTransferButton value %@ for subscription %@ with error %@", buf, 0x20u);
          }

          if (v26)
          {
            BOOL v28 = 1;
            id v4 = v30;
            goto LABEL_31;
          }
          long long v16 = v7;
          id v4 = v30;
          long long v13 = v32;
        }
      }
    }
    id v15 = [v13 countByEnumeratingWithState:&v34 objects:v45 count:16];
    if (v15) {
      continue;
    }
    break;
  }
  BOOL v28 = 0;
  id v7 = v16;
LABEL_31:

  return v28;
}

+ (int64_t)frontboardOrientation
{
  v2 = [a1 fbsOrientationObserver];
  BOOL v3 = (char *)[v2 activeInterfaceOrientation];
  if ((unint64_t)(v3 - 1) > 3) {
    int64_t v4 = 0;
  }
  else {
    int64_t v4 = qword_10007D5D0[(void)(v3 - 1)];
  }

  return v4;
}

- (BOOL)isSpringBoardLocked
{
  return self->_springBoardLocked;
}

- (void)setSpringBoardLocked:(BOOL)a3
{
  self->_springBoardLocked = a3;
}

- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5
{
  id v6 = a4;
  unsigned __int8 v7 = [(id)objc_opt_class() layoutIsLocked:v6];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002B39C;
  v8[3] = &unk_1000A1DA0;
  v8[4] = self;
  unsigned __int8 v9 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
}

@end