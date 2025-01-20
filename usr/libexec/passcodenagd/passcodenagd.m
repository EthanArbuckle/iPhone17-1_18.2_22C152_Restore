id sub_100003A08(void *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  void v8[5];

  v2 = (void *)a1[4];
  v1 = a1[5];
  v3 = a1[6];
  v4 = a1[7];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100003AA8;
  v8[3] = &unk_100008260;
  v5 = a1[8];
  v8[4] = a1[9];
  BYTE2(v7) = 1;
  LOWORD(v7) = 256;
  return [v2 displayUserNotificationWithIdentifier:@"passcodenagd-user-notification-id" title:v1 message:v3 defaultButtonText:v4 alternateButtonText:v5 textfieldPlaceholder:0 defaultButtonText:0.0 displayOnLockScreen:0 dismissOnLock:0 displayInAppWhitelistModes:0 dismissAfterTimeInterval:v7 assertion:v8 completionBlock:v9];
}

void sub_100003AA8(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2 == 1)
  {
    v7 = _MCLogObjects[6];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    __int16 v11 = 0;
    v8 = "later!";
    v9 = (uint8_t *)&v11;
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    goto LABEL_11;
  }
  if (a2)
  {
    v7 = _MCLogObjects[6];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    __int16 v10 = 0;
    v8 = "default behavior!";
    v9 = (uint8_t *)&v10;
    goto LABEL_10;
  }
  v6 = _MCLogObjects[6];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "change now!", buf, 2u);
  }
  [*(id *)(a1 + 32) beginPromptForChangePasscode];
LABEL_11:
}

id sub_100003D14(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  uint64_t v3 = a1[6];
  uint64_t v4 = a1[7];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100003DB4;
  v8[3] = &unk_100008260;
  uint64_t v5 = a1[8];
  v8[4] = a1[9];
  BYTE2(v7) = 1;
  LOWORD(v7) = 256;
  return [v2 displayUserNotificationWithIdentifier:@"passcodenagd-user-notification-id" title:v1 message:v3 defaultButtonText:v4 alternateButtonText:v5 textfieldPlaceholder:0 defaultButtonText:0 alternateButtonText:0 textfieldPlaceholder:0 displayOnLockScreen:0 dismissOnLock:0 displayInAppWhitelistModes:0 dismissAfterTimeInterval:0 assertion:v7 completionBlock:v8];
}

void sub_100003DB4(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2 == 1)
  {
    uint64_t v7 = _MCLogObjects[6];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    __int16 v11 = 0;
    v8 = "cancel";
    v9 = (uint8_t *)&v11;
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    goto LABEL_11;
  }
  if (a2)
  {
    uint64_t v7 = _MCLogObjects[6];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    __int16 v10 = 0;
    v8 = "default behavior?";
    v9 = (uint8_t *)&v10;
    goto LABEL_10;
  }
  v6 = _MCLogObjects[6];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Continue", buf, 2u);
  }
  [*(id *)(a1 + 32) beginPromptForChangePasscode];
LABEL_11:
}

id sub_100003FF8(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  uint64_t v3 = a1[6];
  uint64_t v4 = a1[7];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000409C;
  v7[3] = &unk_100008260;
  v7[4] = a1[8];
  BYTE2(v6) = 1;
  LOWORD(v6) = 256;
  return [v2 displayUserNotificationWithIdentifier:@"passcodenagd-user-notification-id" title:v1 message:v3 defaultButtonText:v4 alternateButtonText:0 textfieldPlaceholder:0 displayOnLockScreen:0 dismissOnLock:0 displayInAppWhitelistModes:0 dismissAfterTimeInterval:0 assertion:0 completionBlock:v6];
}

void sub_10000409C(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = _MCLogObjects[6];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "default behavior?", v8, 2u);
    }
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Change Passcode", buf, 2u);
    }
    [*(id *)(a1 + 32) beginPromptForChangePasscode];
  }
}

void sub_100004454(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  uint64_t v6 = a1[8];
  uint64_t v7 = a1[9];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100004544;
  v12[3] = &unk_100008300;
  v8 = (void *)a1[10];
  uint64_t v14 = a1[11];
  id v9 = v8;
  uint64_t v10 = a1[12];
  id v13 = v9;
  uint64_t v15 = v10;
  BYTE2(v11) = 1;
  LOWORD(v11) = 256;
  [v2 displayUserNotificationWithIdentifier:@"passcodenagd-user-notification-id" title:v3 message:v4 defaultButtonText:v5 alternateButtonText:v6 textfieldPlaceholder:0 defaultButtonText:v7 alternateButtonText:v8 textfieldPlaceholder:0 dismissOnLock:0 displayInAppWhitelistModes:0 dismissAfterTimeInterval:v9 assertion:v10 completionBlock:v11];
}

void sub_100004544(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2 == 1)
  {
    v17 = _MCLogObjects[6];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Emergency Call", buf, 2u);
    }
    v18 = objc_opt_new();
    [v18 launchEmergencyDialerWithCompletion:0];
    [v18 invalidate];
  }
  else if (a2)
  {
    v19 = _MCLogObjects[6];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v49 = a2;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Unexpected response type: %d", buf, 8u);
    }
  }
  else
  {
    uint64_t v6 = _MCLogObjects[6];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Continue", buf, 2u);
    }
    uint64_t v7 = *(void *)(a1 + 40);
    switch(v7)
    {
      case 2:
        id v20 = [v5 copy];
        v21 = (void *)qword_10000C378;
        qword_10000C378 = (uint64_t)v20;

        unsigned int v22 = [(id)qword_10000C370 isEqualToString:qword_10000C378];
        v23 = _MCLogObjects[6];
        if (v22)
        {
          if (os_log_type_enabled((os_log_t)_MCLogObjects[6], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "passcode matches!", buf, 2u);
          }
          id v24 = [objc_alloc((Class)DMCProcessAssertion) initWithReason:@"passcodenagd-changePasscode"];
          +[PNDConnection setIsChangingPasscode:1];
          v25 = *(void **)(a1 + 32);
          id v45 = 0;
          unsigned __int8 v26 = [v25 changePasscodeFrom:qword_10000C368 to:qword_10000C378 outError:&v45];
          id v27 = v45;
          if (v26)
          {
            v28 = _MCLogObjects[6];
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "New passcode has been set!", buf, 2u);
            }
            uint64_t v29 = qword_10000C378;
            v43[0] = _NSConcreteStackBlock;
            v43[1] = 3221225472;
            v43[2] = sub_100004AF4;
            v43[3] = &unk_1000082D8;
            id v44 = v24;
            +[PNDConnection notifyCDPThatPasscodeChangedTo:v29 completion:v43];
          }
          else
          {
            +[PNDConnection setIsChangingPasscode:0];
            uint64_t v41 = [v27 localizedDescription];
            v42 = (void *)qword_10000C360;
            qword_10000C360 = v41;

            qword_10000C380 = 1;
            [*(id *)(a1 + 48) showCFUserNotifcationWithSecureTextFieldOptionForState:1];
          }
        }
        else
        {
          if (os_log_type_enabled((os_log_t)_MCLogObjects[6], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "passcode does not match!", buf, 2u);
          }
          uint64_t v37 = MCLocalizedFormat();
          v38 = (void *)qword_10000C360;
          qword_10000C360 = v37;

          qword_10000C380 = 1;
          [*(id *)(a1 + 48) showCFUserNotifcationWithSecureTextFieldOptionForState:1];
        }
        break;
      case 1:
        id v30 = [v5 copy];
        v31 = (void *)qword_10000C370;
        qword_10000C370 = (uint64_t)v30;

        v32 = [*(id *)(a1 + 32) localizedDescriptionOfCurrentPasscodeConstraints];
        v33 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v32, NSLocalizedDescriptionKey, 0);
        v34 = +[NSError errorWithDomain:@"EmptyPasscode" code:0 userInfo:v33];

        v35 = *(void **)(a1 + 32);
        id v46 = v34;
        LODWORD(v32) = [v35 passcode:qword_10000C370 meetsCurrentConstraintsOutError:&v46];
        id v14 = v46;

        v36 = _MCLogObjects[6];
        if (v32)
        {
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "passcode works!", buf, 2u);
          }
          qword_10000C380 = 2;
          uint64_t v15 = *(void **)(a1 + 48);
          uint64_t v16 = 2;
          goto LABEL_33;
        }
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "passcode does not work!", buf, 2u);
        }
        uint64_t v39 = [v14 localizedDescription];
        v40 = (void *)qword_10000C360;
        qword_10000C360 = v39;

        goto LABEL_32;
      case 0:
        id v8 = [v5 copy];
        id v9 = (void *)qword_10000C368;
        qword_10000C368 = (uint64_t)v8;

        uint64_t v10 = [*(id *)(a1 + 32) localizedDescriptionOfCurrentPasscodeConstraints];
        uint64_t v11 = (void *)qword_10000C360;
        qword_10000C360 = v10;

        v12 = *(void **)(a1 + 32);
        id v47 = 0;
        unsigned int v13 = [v12 unlockDeviceWithPasscode:qword_10000C368 outError:&v47];
        id v14 = v47;
        if (v13)
        {
          qword_10000C380 = 1;
          uint64_t v15 = *(void **)(a1 + 48);
          uint64_t v16 = 1;
LABEL_33:
          [v15 showCFUserNotifcationWithSecureTextFieldOptionForState:v16];

          break;
        }
LABEL_32:
        uint64_t v15 = *(void **)(a1 + 48);
        uint64_t v16 = qword_10000C380;
        goto LABEL_33;
    }
  }
}

void sub_100004AF4()
{
  +[PNDConnection setIsChangingPasscode:0];
  v0 = +[NSFileManager defaultManager];
  uint64_t v1 = MCPasscodeNagKeepAliveFilePath();
  unsigned int v2 = [v0 fileExistsAtPath:v1];

  if (v2)
  {
    uint64_t v3 = _MCLogObjects[6];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Deleting Keep-Alive file", buf, 2u);
    }
    uint64_t v4 = +[NSFileManager defaultManager];
    id v5 = MCPasscodeNagKeepAliveFilePath();
    id v11 = 0;
    unsigned __int8 v6 = [v4 removeItemAtPath:v5 error:&v11];
    id v7 = v11;

    if ((v6 & 1) == 0)
    {
      id v8 = _MCLogObjects[6];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = v8;
        uint64_t v10 = [v7 localizedDescription];
        *(_DWORD *)buf = 138543362;
        unsigned int v13 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Error deleting Keep-Alive file: %{public}@", buf, 0xCu);
      }
    }
  }
}

void sub_100004CF0(id a1)
{
  qword_10000C3A0 = (uint64_t)objc_alloc_init((Class)NSObject);

  _objc_release_x1();
}

id sub_100005004(uint64_t a1)
{
  unsigned int v2 = _MCLogObjects[6];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Keep-Alive file has been deleted!", buf, 2u);
  }
  if (![*(id *)(a1 + 32) isChangingPasscode]) {
    return [*(id *)(a1 + 32) shutdown];
  }
  uint64_t v3 = _MCLogObjects[6];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Currently changing passcode. Postponing handling this notification until passcode change completes", v5, 2u);
  }
  return [*(id *)(a1 + 32) setPendingKeepAliveDeletion:1];
}

uint64_t sub_1000050D8(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

void sub_10000520C(id a1)
{
  uint64_t v1 = _MCLogObjects[6];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Dying now...", v2, 2u);
  }
  exit(0);
}

void sub_10000539C(uint64_t a1, int token)
{
  uint64_t state64 = 0;
  notify_get_state(token, &state64);
  if (state64 == 1)
  {
    uint64_t v3 = _MCLogObjects[6];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Notified that we landed on HomeScreen", buf, 2u);
    }
    if ([*(id *)(a1 + 32) isChangingPasscode])
    {
      uint64_t v4 = _MCLogObjects[6];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Currently changing passcode. Ignoring this notification for now...", v5, 2u);
      }
    }
    else
    {
      [*(id *)(a1 + 32) _checkPasscodeCompliance];
    }
  }
}

void sub_100005564(id a1, int a2)
{
  unsigned int v2 = _MCLogObjects[6];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Notified that device lock state changed", v5, 2u);
  }
  uint64_t v3 = +[NSDate date];
  uint64_t v4 = (void *)qword_10000C388;
  qword_10000C388 = v3;
}

id sub_100005638()
{
  v0 = _MCLogObjects[6];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "System language changed", v2, 2u);
  }
  return +[PNDConnection shutdown];
}

void sub_100005750(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  switch(a2)
  {
    case 0:
      id v9 = _MCLogObjects[6];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "getPasscodeComplianceWarningLastLockDate completion: kMCPasscodeComplianceNone", buf, 2u);
      }
      break;
    case 1:
      v17 = _MCLogObjects[6];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "getPasscodeComplianceWarningLastLockDate completion: kMCPasscodeComplianceMandatory", buf, 2u);
      }
      id v20 = _NSConcreteStackBlock;
      uint64_t v21 = 3221225472;
      unsigned int v22 = sub_100005AEC;
      v23 = &unk_100008450;
      id v24 = v7;
      id v25 = v8;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v20);
      v18 = *(void **)(a1 + 32);
      v19 = +[NSDate date];
      [v18 notifyUserHasSeenComplianceMessageWithLastLockDate:v19];

      unsigned int v13 = v24;
      goto LABEL_13;
    case 2:
      uint64_t v10 = _MCLogObjects[6];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "getPasscodeComplianceWarningLastLockDate completion: kMCPasscodeComplianceOptional", buf, 2u);
      }
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100005AC4;
      block[3] = &unk_100008450;
      id v30 = v7;
      id v31 = v8;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      id v11 = *(void **)(a1 + 32);
      v12 = +[NSDate date];
      [v11 notifyUserHasSeenComplianceMessageWithLastLockDate:v12];

      unsigned int v13 = v30;
      goto LABEL_13;
    case 3:
      id v14 = _MCLogObjects[6];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "getPasscodeComplianceWarningLastLockDate completion: kMCPasscodeComplianceAdvisory", buf, 2u);
      }
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100005AD8;
      v26[3] = &unk_100008450;
      id v27 = v7;
      id v28 = v8;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v26);
      uint64_t v15 = *(void **)(a1 + 32);
      uint64_t v16 = +[NSDate date];
      [v15 notifyUserHasSeenComplianceMessageWithLastLockDate:v16];

      unsigned int v13 = v27;
LABEL_13:

      break;
    default:
      break;
  }
}

id sub_100005AC4(uint64_t a1)
{
  return +[PNDUserNotificationView showPasscodePromptForMCPasscodeComplianceTypeOptionalWithTitle:*(void *)(a1 + 32) message:*(void *)(a1 + 40)];
}

id sub_100005AD8(uint64_t a1)
{
  return +[PNDUserNotificationView showPasscodePromptForMCPasscodeComplianceTypeAdvisoryWithTitle:*(void *)(a1 + 32) message:*(void *)(a1 + 40)];
}

id sub_100005AEC(uint64_t a1)
{
  return +[PNDUserNotificationView showPasscodePromptForMCPasscodeComplianceTypeMandatoryWithTitle:*(void *)(a1 + 32) message:*(void *)(a1 + 40)];
}

void sub_100005C34(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  unsigned __int8 v6 = _MCLogObjects[6];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Successfully notified CDP of passcode change", (uint8_t *)&v10, 2u);
    }
  }
  else if (v7)
  {
    id v8 = v6;
    id v9 = [v5 localizedDescription];
    int v10 = 138543362;
    id v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Failed to notify CDP of passcode change. Error: %{public}@", (uint8_t *)&v10, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t start()
{
  MCLoggingInitialize();
  uint64_t v1 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "passcodenagd starting...", buf, 2u);
  }
  unsigned int v2 = +[NSFileManager defaultManager];
  uint64_t v3 = MCPasscodeNagKeepAliveFilePath();
  unsigned int v4 = [v2 fileExistsAtPath:v3];

  if (v4)
  {
    +[PNDConnection registerKeepAliveFileDeleteNotification];
    +[PNDConnection registerSpringboardNotification];
    +[PNDConnection registerLockStateChangedNotification];
    +[PNDConnection registerLanguageChangedNotification];
  }
  else
  {
    id v5 = _MCLogObjects[6];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "No Keep-Alive file!", v8, 2u);
    }
    +[PNDConnection shutdown];
  }
  unsigned __int8 v6 = +[NSRunLoop mainRunLoop];
  [v6 run];

  return 0;
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

uint64_t MCLocalizedFormat()
{
  return _MCLocalizedFormat();
}

uint64_t MCLoggingInitialize()
{
  return _MCLoggingInitialize();
}

uint64_t MCPasscodeNagKeepAliveFilePath()
{
  return _MCPasscodeNagKeepAliveFilePath();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void exit(int a1)
{
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__checkPasscodeCompliance(void *a1, const char *a2, ...)
{
  return [a1 _checkPasscodeCompliance];
}

id objc_msgSend_beginPromptForChangePasscode(void *a1, const char *a2, ...)
{
  return [a1 beginPromptForChangePasscode];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isChangingPasscode(void *a1, const char *a2, ...)
{
  return [a1 isChangingPasscode];
}

id objc_msgSend_isPasscodeSet(void *a1, const char *a2, ...)
{
  return [a1 isPasscodeSet];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_localizedDescriptionOfCurrentPasscodeConstraints(void *a1, const char *a2, ...)
{
  return [a1 localizedDescriptionOfCurrentPasscodeConstraints];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_registerKeepAliveFileDeleteNotification(void *a1, const char *a2, ...)
{
  return [a1 registerKeepAliveFileDeleteNotification];
}

id objc_msgSend_registerLanguageChangedNotification(void *a1, const char *a2, ...)
{
  return [a1 registerLanguageChangedNotification];
}

id objc_msgSend_registerLockStateChangedNotification(void *a1, const char *a2, ...)
{
  return [a1 registerLockStateChangedNotification];
}

id objc_msgSend_registerSpringboardNotification(void *a1, const char *a2, ...)
{
  return [a1 registerSpringboardNotification];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_shutdown(void *a1, const char *a2, ...)
{
  return [a1 shutdown];
}

id objc_msgSend_statusLock(void *a1, const char *a2, ...)
{
  return [a1 statusLock];
}

id objc_msgSend_unlockScreenTypeForPasscode_outSimplePasscodeType_(void *a1, const char *a2, ...)
{
  return [a1 unlockScreenTypeForPasscode:x0 outSimplePasscodeType:&x1];
}