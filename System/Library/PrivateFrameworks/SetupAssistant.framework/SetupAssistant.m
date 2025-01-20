void sub_1000026F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100002764(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100002B50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100002C14(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

Class sub_100002CF4(uint64_t a1)
{
  sub_100002D4C();
  Class result = objc_getClass("ICCloudKitSyncer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100024CD8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_100010530();
    return (Class)sub_100002D4C();
  }
  return result;
}

uint64_t sub_100002D4C()
{
  v3[0] = 0;
  if (!qword_100024CE0)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = 3221225472;
    v3[3] = sub_100002E4C;
    v3[4] = &unk_10001C598;
    v3[5] = v3;
    long long v4 = off_10001C580;
    uint64_t v5 = 0;
    qword_100024CE0 = _sl_dlopen();
  }
  uint64_t v0 = qword_100024CE0;
  v1 = (void *)v3[0];
  if (!qword_100024CE0)
  {
    v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t sub_100002E4C()
{
  uint64_t result = _sl_dlopen();
  qword_100024CE0 = result;
  return result;
}

void *sub_100002EC0(uint64_t a1)
{
  v2 = (void *)sub_100002D4C();
  uint64_t result = dlsym(v2, "ICCloudContextErrorDomain");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100024CE8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_100002F10(uint64_t a1)
{
  v2 = (void *)sub_100002D4C();
  uint64_t result = dlsym(v2, "ICCloudContextErrorSyncingDisabled");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100024CF0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1000030B0(id a1)
{
  qword_100024D00 = objc_alloc_init(BYDaemonProximityController);
  _objc_release_x1();
}

void sub_100003408(_Unwind_Exception *a1)
{
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 96));
  _Unwind_Resume(a1);
}

void sub_100003458(uint64_t a1, unsigned int a2, void *a3)
{
  long long v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained setShowingPIN:1];
  v6 = [WeakRetained delegate];
  [v6 displayProximityPinCode:v5 visual:(a2 >> 8) & 1];
}

void sub_1000034E0(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setShowingPIN:0];
  long long v4 = [WeakRetained delegate];
  [v4 proximitySetupCompleted:v3];
}

void sub_100003558(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  v6 = _BYLoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (a2 > 299)
    {
      if (a2 > 799)
      {
        if (a2 <= 999)
        {
          switch(a2)
          {
            case 900:
              v7 = "SU-No-SetupScanAttempt";
              break;
            case 901:
              v7 = "SU-No-SetupStatusUpdate";
              break;
            case 902:
              v7 = "SU-No-SetupWipeWifi";
              break;
            case 903:
              v7 = "SU-No-SetupCancelled";
              break;
            case 904:
              v7 = "SU-No-SetupObliterate";
              break;
            case 905:
              v7 = "SU-No-SetupCannotCancel";
              break;
            case 906:
              v7 = "SysDrop AirDrop Event";
              break;
            case 907:
              v7 = "SysDrop Sysdiagnose Event";
              break;
            case 908:
              v7 = "SysDrop Cancel Event";
              break;
            case 909:
              v7 = "File Transfer Progress Event";
              break;
            case 910:
              v7 = "File Transfer Completed Event";
              break;
            case 911:
              v7 = "iOSWiFiSetup";
              break;
            case 912:
              v7 = "HKPrimaryResidentSSIDFetchStart";
              break;
            case 913:
              v7 = "LoggingProfileTransfer";
              break;
            default:
              switch(a2)
              {
                case 800:
                  v7 = "AuthAccountsStart";
                  break;
                case 803:
                  v7 = "AuthAccountsiCloudProgress";
                  break;
                case 804:
                  v7 = "AuthAccountsStoreProgress";
                  break;
                case 805:
                  v7 = "AuthAccountsGameCenterProgress";
                  break;
                default:
                  goto LABEL_166;
              }
              break;
          }
          goto LABEL_173;
        }
        if (a2 <= 1099)
        {
          if (a2 == 1000)
          {
            v7 = "SecureIntentStart";
            goto LABEL_173;
          }
          if (a2 == 1001)
          {
            v7 = "SecureIntentFinish";
            goto LABEL_173;
          }
          goto LABEL_166;
        }
        if (a2 == 1100)
        {
          v7 = "OneTimeCodeDetected";
          goto LABEL_173;
        }
        if (a2 == 2000)
        {
          v7 = "DependentStart";
          goto LABEL_173;
        }
        if (a2 != 2001) {
          goto LABEL_166;
        }
        v7 = "DependentEnd";
      }
      else if (a2 <= 519)
      {
        if (a2 <= 410)
        {
          if (a2 <= 399)
          {
            if (a2 == 300)
            {
              v7 = "BackupProgress";
              goto LABEL_173;
            }
            if (a2 == 310)
            {
              v7 = "SyncProgress";
              goto LABEL_173;
            }
            goto LABEL_166;
          }
          if (a2 == 400)
          {
            v7 = "StopSetup";
            goto LABEL_173;
          }
          if (a2 == 401)
          {
            v7 = "PINPair";
            goto LABEL_173;
          }
          if (a2 != 410) {
            goto LABEL_166;
          }
          v7 = "MigrateStart";
        }
        else
        {
          if (a2 > 430)
          {
            switch(a2)
            {
              case 431:
                v7 = "eSimExternal2FAStop";
                goto LABEL_173;
              case 500:
                v7 = "SiriWelcome";
                goto LABEL_173;
              case 510:
                v7 = "SiriDialogA";
                goto LABEL_173;
            }
            goto LABEL_166;
          }
          if (a2 == 411)
          {
            v7 = "MigrateStop";
            goto LABEL_173;
          }
          if (a2 == 420)
          {
            v7 = "FileTransferReady";
            goto LABEL_173;
          }
          if (a2 != 430) {
            goto LABEL_166;
          }
          v7 = "eSimExternal2FAStart";
        }
      }
      else if (a2 > 559)
      {
        if (a2 > 599)
        {
          switch(a2)
          {
            case 600:
              v7 = "SiriSkipDemo";
              goto LABEL_173;
            case 700:
              v7 = "StopSetupLEDs";
              goto LABEL_173;
            case 710:
              v7 = "AudioPasscodeEnded";
              goto LABEL_173;
          }
          goto LABEL_166;
        }
        if (a2 == 560)
        {
          v7 = "SiriDialogCMusic";
          goto LABEL_173;
        }
        if (a2 == 570)
        {
          v7 = "SiriDialogCNews";
          goto LABEL_173;
        }
        if (a2 != 580) {
          goto LABEL_166;
        }
        v7 = "SiriDialogCWeather";
      }
      else
      {
        if (a2 > 549)
        {
          switch(a2)
          {
            case 550:
              v7 = "SiriDialogBWeather";
              goto LABEL_173;
            case 555:
              v7 = "SiriDialogBClock";
              goto LABEL_173;
            case 558:
              v7 = "SiriDialogBMusic";
              goto LABEL_173;
          }
          goto LABEL_166;
        }
        if (a2 == 520)
        {
          v7 = "SiriDialogBStart";
          goto LABEL_173;
        }
        if (a2 == 530)
        {
          v7 = "SiriDialogBHome";
          goto LABEL_173;
        }
        if (a2 != 540) {
          goto LABEL_166;
        }
        v7 = "SiriDialogBNews";
      }
    }
    else if (a2 > 129)
    {
      if (a2 > 249)
      {
        switch(a2)
        {
          case 260:
            v7 = "TVLSStart";
            break;
          case 261:
          case 262:
          case 263:
          case 265:
          case 266:
          case 267:
          case 268:
          case 269:
          case 271:
          case 273:
          case 275:
            goto LABEL_166;
          case 264:
            v7 = "TVLSFinish";
            break;
          case 270:
            v7 = "TVLSEstimateStart";
            break;
          case 272:
            v7 = "TVLSEstimateFinal";
            break;
          case 274:
            v7 = "TVLSEstimateFailed";
            break;
          case 276:
            v7 = "TVLSTryAgain";
            break;
          case 277:
            v7 = "TVLSToneBegan";
            break;
          case 278:
            v7 = "TVLCalStart";
            break;
          case 279:
            v7 = "TVLCalStep";
            break;
          case 280:
            v7 = "TVLCalFailed";
            break;
          case 281:
            v7 = "TVLCalTryAgain";
            break;
          case 282:
            v7 = "TVLCalFinal";
            break;
          default:
            if (a2 != 250) {
              goto LABEL_166;
            }
            v7 = "ReportSuccess";
            break;
        }
        goto LABEL_173;
      }
      if (a2 > 219)
      {
        switch(a2)
        {
          case 230:
            v7 = "HomeKitStart";
            goto LABEL_173;
          case 231:
          case 232:
          case 233:
          case 235:
          case 237:
          case 238:
          case 239:
            goto LABEL_166;
          case 234:
            v7 = "HomeKitSetupStart";
            goto LABEL_173;
          case 236:
            v7 = "CDPSetupStart";
            goto LABEL_173;
          case 240:
            v7 = "BuddyStarting";
            goto LABEL_173;
          case 241:
            v7 = "BuddyProgress";
            goto LABEL_173;
          case 242:
            v7 = "BuddyFinished";
            goto LABEL_173;
          default:
            if (a2 == 220)
            {
              v7 = "iCloudStart";
            }
            else
            {
              if (a2 != 224) {
                goto LABEL_166;
              }
              v7 = "AppleIDSetupStart";
            }
            break;
        }
        goto LABEL_173;
      }
      if (a2 <= 149)
      {
        if (a2 == 130)
        {
          v7 = "WiFiPoweredOff";
          goto LABEL_173;
        }
        if (a2 == 140)
        {
          v7 = "RecognizeVoice";
          goto LABEL_173;
        }
        goto LABEL_166;
      }
      if (a2 == 150)
      {
        v7 = "SiriForEveryone";
        goto LABEL_173;
      }
      if (a2 == 200)
      {
        v7 = "WiFiStart";
        goto LABEL_173;
      }
      if (a2 != 210) {
        goto LABEL_166;
      }
      v7 = "ActivationStart";
    }
    else if (a2 > 79)
    {
      if (a2 <= 119)
      {
        switch(a2)
        {
          case 'P':
            v7 = "BasicConfigStart";
            break;
          case 'Z':
            v7 = "BasicConfigFinish";
            break;
          case '\\':
            v7 = "StepStart";
            break;
          case '^':
            v7 = "StepFinish";
            break;
          case '_':
            v7 = "PreFinish";
            break;
            v7 = "SetupFinished";
            break;
          case 'a':
            v7 = "SetupResumed";
            break;
          case 'b':
            v7 = "SetupSuspend";
            break;
          case 'c':
            v7 = "SetupPeerSWUpdate";
            break;
          case 'd':
            v7 = "Finished";
            break;
          default:
            goto LABEL_166;
        }
        goto LABEL_173;
      }
      if (a2 == 120)
      {
        v7 = "CheckingiCloud";
        goto LABEL_173;
      }
      if (a2 == 122)
      {
        v7 = "CheckingAppleMusic";
        goto LABEL_173;
      }
      if (a2 != 124) {
        goto LABEL_166;
      }
      v7 = "CheckingAccount";
    }
    else
    {
      if (a2 <= 49)
      {
        if (a2 > 29)
        {
          switch(a2)
          {
            case 30:
              v7 = "Error";
              break;
            case 31:
              v7 = "SessionStarted";
              break;
            case 32:
              v7 = "SessionEnded";
              break;
            case 33:
              v7 = "SessionSecured";
              break;
            case 35:
              v7 = "ConnectStart";
              break;
            case 40:
              v7 = "PreAuthStart";
              break;
            default:
              goto LABEL_166;
          }
          goto LABEL_173;
        }
        switch(a2)
        {
          case 0:
            v7 = "Invalid";
            goto LABEL_173;
          case 10:
            v7 = "Start";
            goto LABEL_173;
          case 20:
            v7 = "Final";
            goto LABEL_173;
        }
LABEL_166:
        v7 = "?";
        goto LABEL_173;
      }
      if (a2 > 64)
      {
        if (a2 == 65)
        {
          v7 = "SecurityAPCLoopStart";
          goto LABEL_173;
        }
        if (a2 == 70)
        {
          v7 = "SecurityFinish";
          goto LABEL_173;
        }
        goto LABEL_166;
      }
      if (a2 == 50)
      {
        v7 = "PreAuthFinish";
        goto LABEL_173;
      }
      if (a2 != 60) {
        goto LABEL_166;
      }
      v7 = "SecurityStart";
    }
LABEL_173:
    int v15 = 136315650;
    v16 = v7;
    __int16 v17 = 1024;
    int v18 = a2;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received proximity progress: %s (%d) %@", (uint8_t *)&v15, 0x1Cu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (a2 <= 32)
  {
    if (a2 == 31)
    {
      v13 = [v5 objectForKeyedSubscript:@"mst"];
      [v9 setMessageSession:v13];

      v12 = [v9 delegate];
      v14 = [v9 messageSession];
      [v12 proximityConnectionPreparing:v14];
    }
    else
    {
      if (a2 != 32) {
        goto LABEL_189;
      }
      if ([WeakRetained hasConnection])
      {
        [v9 setHasConnection:0];
        v12 = [v9 delegate];
        [v12 proximityConnectionTerminated];
      }
      else
      {
        if (![v9 showingPIN]) {
          goto LABEL_189;
        }
        [v9 setShowingPIN:0];
        v12 = [v9 delegate];
        [v12 dismissProximityPinCode];
      }
    }
LABEL_188:

    goto LABEL_189;
  }
  switch(a2)
  {
    case '!':
      [WeakRetained setHasConnection:1];
      [v9 setShowingPIN:0];
      v12 = [v9 delegate];
      [v12 proximityConnectionInitiated];
      goto LABEL_188;
    case 'a':
      [WeakRetained setHasConnection:1];
      v12 = [v9 delegate];
      [v12 proximityConnectionReconnected];
      goto LABEL_188;
    case 'b':
      v10 = [WeakRetained suspendCompletionBlock];

      if (v10)
      {
        v11 = [v9 suspendCompletionBlock];
        v11[2]();
      }
      [v9 setSuspendCompletionBlock:0];
      break;
  }
LABEL_189:
}

void sub_1000040D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = [v3 objectForKeyedSubscript:@"op"];
  unsigned int v5 = [v4 unsignedIntValue];

  if (v5 == 3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v7 = [v3 objectForKeyedSubscript:@"dclass"];
    v8 = objc_msgSend(WeakRetained, "deviceClassForSharingDeviceClass:", objc_msgSend(v7, "integerValue"));
    [WeakRetained setDeviceClass:v8];

    v9 = [v3 objectForKeyedSubscript:@"model"];
    [WeakRetained setModel:v9];

    v10 = [v3 objectForKeyedSubscript:@"langs"];
    if (![v10 count])
    {
      v11 = [v3 objectForKeyedSubscript:@"lang"];
      int v18 = v11;
      uint64_t v12 = +[NSArray arrayWithObjects:&v18 count:1];

      v10 = (void *)v12;
    }
    v13 = [WeakRetained delegate];
    v14 = [v3 objectForKeyedSubscript:@"locale"];
    int v15 = [WeakRetained model];
    v16 = [WeakRetained deviceClass];
    __int16 v17 = [v3 objectForKeyedSubscript:@"axSt"];
    [v13 receivedLanguages:v10 locale:v14 model:v15 deviceClass:v16 accessibilitySettings:v17];
  }
}

void sub_100004874(id a1)
{
  qword_100024D08 = objc_alloc_init(BYDaemonExpressActivity);
  _objc_release_x1();
}

void sub_100004B50(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state] == (id)2)
  {
    long long v4 = _BYLoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Maintenance task running...", v5, 2u);
    }

    [*(id *)(a1 + 32) _updateSettingsForActivity:v3];
  }
}

void sub_100004C8C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state] == (id)2)
  {
    long long v4 = _BYLoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Backup task running...", v5, 2u);
    }

    [*(id *)(a1 + 32) _updateSettingsForActivity:v3];
  }
}

void sub_100004EEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004F04(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100004F14(uint64_t a1)
{
}

void sub_100004F1C(uint64_t a1)
{
  v2 = _BYLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Updating express settings...", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) queue];
  long long v4 = +[BYExpressCloudSettings createExpressSettingsWithQueue:v3];

  if ([*(id *)(a1 + 40) shouldDefer])
  {
    unsigned int v5 = _BYLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Deferring update of express settings...", buf, 2u);
    }

    [*(id *)(a1 + 40) setState:3];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;
  }
  else
  {
    v8 = [*(id *)(a1 + 40) underlyingActivity];
    v9 = [*(id *)(a1 + 32) cloudSettings];
    [v9 setXpcActivity:v8];

    v10 = [*(id *)(a1 + 32) cloudSettings];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000050E4;
    v13[3] = &unk_10001C700;
    id v11 = *(id *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    id v14 = v11;
    uint64_t v15 = v12;
    [v10 updateSettings:v4 withCompletion:v13];

    v7 = v14;
  }
}

void sub_1000050E4(uint64_t a1, int a2)
{
  long long v4 = _BYLoggingFacility();
  unsigned int v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updated express settings", v9, 2u);
    }
    uint64_t v6 = 0;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100010558(v5);
    }
    uint64_t v6 = 3;
  }

  [*(id *)(a1 + 32) setCompletionStatus:v6];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
}

void sub_1000058F8(id a1, NSError *a2)
{
  v2 = a2;
  id v3 = _BYLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    unsigned int v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Failed to get the remote object proxy: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

uint64_t sub_100005B14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100005B2C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100005C0C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t start()
{
  v1 = _BYLoggingFacility();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "budd starting", buf, 2u);
  }

  v2 = +[BYDaemonConnectionManager sharedInstance];
  [v2 start];

  id v3 = +[BYDaemonBetaReEnrollmentManager sharedInstance];
  [v3 daemonStart];

  int v4 = +[BYDaemonExpressActivity sharedActivity];
  [v4 registerActivity];

  unsigned int v5 = +[BYDaemonConnectionManager sharedInstance];
  uint64_t v6 = [v5 flowSkipController];
  [v6 registerActivities];

  uint64_t v7 = _BYLoggingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "budd running", v14, 2u);
  }

  signal(15, (void (__cdecl *)(int))1);
  dispatch_source_t v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, 0);
  v9 = (void *)qword_100024D18;
  qword_100024D18 = (uint64_t)v8;

  dispatch_source_set_event_handler((dispatch_source_t)qword_100024D18, &stru_10001C7D8);
  dispatch_activate((dispatch_object_t)qword_100024D18);
  v10 = +[NSRunLoop mainRunLoop];
  [v10 run];

  id v11 = _BYLoggingFacility();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "budd exiting", v13, 2u);
  }

  return 0;
}

void sub_100005E38(id a1)
{
  v1 = _BYLoggingFacility();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Received SIGTERM, will attempt to exit clean...", v2, 2u);
  }

  xpc_transaction_exit_clean();
}

void sub_100005FA4(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) contextQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006044;
  block[3] = &unk_10001C800;
  id v4 = *(id *)(a1 + 32);
  dispatch_async(v2, block);
}

id sub_100006044(uint64_t a1)
{
  return [*(id *)(a1 + 32) _destroyContexts];
}

id sub_100006100(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  return [v2 _prepareContextTimeout];
}

void sub_100006244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000625C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000626C(uint64_t a1)
{
}

void sub_100006274(uint64_t a1)
{
}

id sub_10000633C(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  return [v2 _prepareContextTimeout];
}

void sub_100006480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100006498(uint64_t a1)
{
}

id sub_100006560(uint64_t a1)
{
  return [*(id *)(a1 + 32) _destroyContexts];
}

void sub_1000070E4(id a1)
{
  qword_100024D28 = (uint64_t)dispatch_queue_create("com.apple.budd.staticVariableSerialQueue", 0);
  _objc_release_x1();
}

uint64_t sub_1000071AC(uint64_t result)
{
  qword_100024D30 = *(void *)(result + 32);
  return result;
}

uint64_t sub_100007268(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = qword_100024D30;
  return result;
}

void sub_100007460(uint64_t a1)
{
  BYDaemonCreateMetadataArchive();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000075D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000075EC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000075FC(uint64_t a1)
{
}

void sub_100007604(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) flowSkipController];
  [v2 observeFinishSetupTriggers];

  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

uint64_t sub_100007708(uint64_t a1)
{
  id v2 = +[BYAppleIDAccountsManager sharedManager];
  [v2 performSilentICDPUpgrade];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void sub_100007828(uint64_t a1)
{
  id v2 = _BYLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Taking device lock assertion before deferring data migrator exit...", (uint8_t *)&buf, 2u);
  }

  CFStringRef v20 = @"MKBAssertionKey";
  CFStringRef v21 = @"RestoreFromBackup";
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  CFTypeRef cf = 0;
  uint64_t v16 = 0;
  __int16 v17 = &v16;
  uint64_t v18 = 0x2020000000;
  id v4 = (uint64_t (*)(void *, CFTypeRef *))off_100024D38;
  __int16 v19 = off_100024D38;
  if (!off_100024D38)
  {
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v23 = sub_100008820;
    v24 = &unk_10001C560;
    v25 = &v16;
    unsigned int v5 = (void *)sub_100008870();
    uint64_t v6 = dlsym(v5, "MKBDeviceLockAssertion");
    *(void *)(v25[1] + 24) = v6;
    off_100024D38 = *(_UNKNOWN **)(v25[1] + 24);
    id v4 = (uint64_t (*)(void *, CFTypeRef *))v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (!v4)
  {
    sub_10001050C();
    goto LABEL_21;
  }
  objc_msgSend(*(id *)(a1 + 32), "setDeviceLockAssertion:", v4(v3, &cf));
  if (![*(id *)(a1 + 32) deviceLockAssertion])
  {
    uint64_t v7 = _BYLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      char v12 = _BYIsInternalInstall();
      v13 = (void *)cf;
      if ((v12 & 1) == 0 && cf)
      {
        id v4 = [(id)cf domain];
        v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v4, [(id)cf code]);
        int v14 = 1;
      }
      else
      {
        int v14 = 0;
      }
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to take device lock assertion when deferring data migrator exit - %{public}@", (uint8_t *)&buf, 0xCu);
      if (v14)
      {
      }
    }

    CFRelease(cf);
  }
  id v8 = *(id *)(a1 + 40);
  uint64_t v16 = 0;
  __int16 v17 = &v16;
  uint64_t v18 = 0x2020000000;
  v9 = (void (*)(id))off_100024D48;
  __int16 v19 = off_100024D48;
  if (!off_100024D48)
  {
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v23 = sub_1000089E4;
    v24 = &unk_10001C560;
    v25 = &v16;
    v10 = (void *)sub_100008A34();
    id v11 = dlsym(v10, "DMDeferExit");
    *(void *)(v25[1] + 24) = v11;
    off_100024D48 = *(_UNKNOWN **)(v25[1] + 24);
    v9 = (void (*)(id))v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (!v9)
  {
    sub_10001050C();
LABEL_21:
    __break(1u);
  }
  v9(v8);
}

void sub_100007B84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100007C60(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) deviceLockAssertion];
  uint64_t v3 = _BYLoggingFacility();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Promoting device lock assertion before cancelling data migrator deferred exit...", (uint8_t *)&v17, 2u);
    }

    id v5 = [*(id *)(a1 + 32) deviceLockAssertion];
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2020000000;
    uint64_t v6 = (uint64_t (*)(id))off_100024D58;
    v25 = off_100024D58;
    if (!off_100024D58)
    {
      __int16 v17 = _NSConcreteStackBlock;
      uint64_t v18 = 3221225472;
      __int16 v19 = sub_100008BA8;
      CFStringRef v20 = &unk_10001C560;
      CFStringRef v21 = &v22;
      uint64_t v7 = (void *)sub_100008870();
      id v8 = dlsym(v7, "MKBDeviceLockAssertionPromote");
      *(void *)(v21[1] + 24) = v8;
      off_100024D58 = *(_UNKNOWN **)(v21[1] + 24);
      uint64_t v6 = (uint64_t (*)(id))v23[3];
    }
    _Block_object_dispose(&v22, 8);
    if (!v6)
    {
LABEL_20:
      uint64_t v16 = (_Unwind_Exception *)sub_10001050C();
      _Block_object_dispose(&v22, 8);
      _Unwind_Resume(v16);
    }
    int v9 = v6(v5);
    if (v9)
    {
      int v10 = v9;
      id v11 = _BYLoggingFacility();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000105E0(v10, v11);
      }
    }
    CFRelease([*(id *)(a1 + 32) deviceLockAssertion]);
    [*(id *)(a1 + 32) setDeviceLockAssertion:0];
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10001059C(v4);
    }
  }
  id v12 = *(id *)(a1 + 40);
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  v13 = (void (*)(id))off_100024D60;
  v25 = off_100024D60;
  if (!off_100024D60)
  {
    __int16 v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    __int16 v19 = sub_100008BF8;
    CFStringRef v20 = &unk_10001C560;
    CFStringRef v21 = &v22;
    int v14 = (void *)sub_100008A34();
    uint64_t v15 = dlsym(v14, "DMCancelDeferredExit");
    *(void *)(v21[1] + 24) = v15;
    off_100024D60 = *(_UNKNOWN **)(v21[1] + 24);
    v13 = (void (*)(id))v23[3];
  }
  _Block_object_dispose(&v22, 8);
  if (!v13)
  {
    sub_10001050C();
    goto LABEL_20;
  }
  v13(v12);
}

id sub_1000082D4(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100008354;
  v4[3] = &unk_10001C910;
  v4[4] = a1[6];
  return [v2 attemptSettingsUploadForAttempt:1 maxNumberOfAttempts:3 queue:v1 completion:v4];
}

void sub_100008354(uint64_t a1, int a2)
{
  id v4 = _BYLoggingFacility();
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating express settings succeeded", v8, 2u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    sub_100010658(v5);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

void sub_1000085BC(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v3();
  }
  else
  {
    unint64_t v4 = *(void *)(a1 + 64);
    unint64_t v5 = *(void *)(a1 + 56);
    uint64_t v6 = _BYLoggingFacility();
    uint64_t v7 = v6;
    if (v5 >= v4)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10001069C((uint64_t *)(a1 + 64), v7);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 56);
        uint64_t v9 = *(void *)(a1 + 64);
        *(_DWORD *)long long buf = 134218240;
        uint64_t v18 = v8;
        __int16 v19 = 2048;
        uint64_t v20 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to upload express settings; will attempt again (%ld / %ld attempts)",
          buf,
          0x16u);
      }

      dispatch_time_t v10 = dispatch_time(0, 5000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000087D0;
      block[3] = &unk_10001C938;
      long long v16 = *(_OWORD *)(a1 + 56);
      int8x16_t v12 = *(int8x16_t *)(a1 + 32);
      id v11 = (id)v12.i64[0];
      int8x16_t v14 = vextq_s8(v12, v12, 8uLL);
      id v15 = *(id *)(a1 + 48);
      dispatch_after(v10, v11, block);
    }
  }
}

id sub_1000087D0(uint64_t a1)
{
  return [*(id *)(a1 + 32) attemptSettingsUploadForAttempt:*(void *)(a1 + 56) + 1 maxNumberOfAttempts:*(void *)(a1 + 64) queue:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void *sub_100008820(uint64_t a1)
{
  id v2 = (void *)sub_100008870();
  uint64_t result = dlsym(v2, "MKBDeviceLockAssertion");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100024D38 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100008870()
{
  v3[0] = 0;
  if (!qword_100024D40)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = 3221225472;
    v3[3] = sub_100008970;
    v3[4] = &unk_10001C598;
    v3[5] = v3;
    long long v4 = off_10001C980;
    uint64_t v5 = 0;
    qword_100024D40 = _sl_dlopen();
  }
  uint64_t v0 = qword_100024D40;
  uint64_t v1 = (void *)v3[0];
  if (!qword_100024D40)
  {
    uint64_t v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t sub_100008970()
{
  uint64_t result = _sl_dlopen();
  qword_100024D40 = result;
  return result;
}

void *sub_1000089E4(uint64_t a1)
{
  id v2 = (void *)sub_100008A34();
  uint64_t result = dlsym(v2, "DMDeferExit");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100024D48 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100008A34()
{
  v3[0] = 0;
  if (!qword_100024D50)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = 3221225472;
    v3[3] = sub_100008B34;
    v3[4] = &unk_10001C598;
    v3[5] = v3;
    long long v4 = off_10001C998;
    uint64_t v5 = 0;
    qword_100024D50 = _sl_dlopen();
  }
  uint64_t v0 = qword_100024D50;
  uint64_t v1 = (void *)v3[0];
  if (!qword_100024D50)
  {
    uint64_t v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t sub_100008B34()
{
  uint64_t result = _sl_dlopen();
  qword_100024D50 = result;
  return result;
}

void *sub_100008BA8(uint64_t a1)
{
  id v2 = (void *)sub_100008870();
  uint64_t result = dlsym(v2, "MKBDeviceLockAssertionPromote");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100024D58 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_100008BF8(uint64_t a1)
{
  id v2 = (void *)sub_100008A34();
  uint64_t result = dlsym(v2, "DMCancelDeferredExit");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100024D60 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_10000A0DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_10000A0FC(uint64_t a1)
{
  v5[0] = 0;
  if (!qword_100024D70)
  {
    v5[1] = _NSConcreteStackBlock;
    v5[2] = 3221225472;
    v5[3] = sub_10000A23C;
    v5[4] = &unk_10001C598;
    v5[5] = v5;
    long long v6 = off_10001C9B0;
    uint64_t v7 = 0;
    qword_100024D70 = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    id v2 = (void *)qword_100024D70;
    if (qword_100024D70)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  id v2 = (void *)qword_100024D70;
LABEL_5:
  uint64_t result = dlsym(v2, "MKBDeviceLockAssertion");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100024D68 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10000A23C()
{
  uint64_t result = _sl_dlopen();
  qword_100024D70 = result;
  return result;
}

void sub_10000A94C(uint64_t a1)
{
  id v2 = _BYLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_1000107D4(v2);
  }

  uint64_t v3 = [*(id *)(a1 + 32) migrationController];
  [v3 cancel];
}

void sub_10000A9AC(uint64_t a1)
{
  id v2 = _BYLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_100010818(v2);
  }

  uint64_t v3 = [*(id *)(a1 + 32) migrationController];
  [v3 cancel];
}

void sub_10000ACCC(id a1)
{
  uint64_t v1 = [BYDaemonBetaReEnrollmentManager alloc];
  id v7 = objc_alloc_init((Class)BYSeedProgramManager);
  id v2 = +[BYXPCActivityRegistrar sharedInstance];
  uint64_t v3 = +[NSUserDefaults standardUserDefaults];
  long long v4 = objc_alloc_init(BYDaemonLockAssertionManager);
  uint64_t v5 = [(BYDaemonBetaReEnrollmentManager *)v1 initWithSeedProgramManager:v7 xpcActivityRegistrar:v2 setupAssistantFrameworkDefaults:v3 lockAssertionManager:v4];
  long long v6 = (void *)qword_100024D78;
  qword_100024D78 = (uint64_t)v5;
}

void sub_10000AF10(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "_onSerialQueue_needsEnrollWithCheckForExistingEnrollment:enrollBlock:", 0, 0))
  {
    id v2 = *(void **)(a1 + 32);
    objc_msgSend(v2, "_onSerialQueue_registerActivityForPurpose:", @"daemon start");
  }
  else
  {
    uint64_t v3 = _BYLoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Beta Re-Enroll: Activity registration unnecessary", v5, 2u);
    }

    long long v4 = [*(id *)(a1 + 32) xpcActivityRegistrar];
    [v4 unregisterActivityWithIdentifier:"com.apple.purplebuddy.betaReEnrollment"];
  }
}

id sub_10000B0DC(uint64_t a1)
{
  id v2 = _BYLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Beta Re-Enroll: Enroll requested", buf, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) setupAssistantFrameworkDefaults];
  [v3 setObject:*(void *)(a1 + 40) forKey:@"SeedEnrollmentProgramName"];

  long long v4 = [*(id *)(a1 + 32) setupAssistantFrameworkDefaults];
  [v4 setObject:*(void *)(a1 + 48) forKey:@"SeedEnrollmentAssetAudience"];

  if (*(void *)(a1 + 56))
  {
    uint64_t v5 = [*(id *)(a1 + 32) setupAssistantFrameworkDefaults];
    [v5 setObject:*(void *)(a1 + 56) forKey:@"SeedEnrollmentProgramID"];
  }
  long long v6 = [*(id *)(a1 + 32) setupAssistantFrameworkDefaults];
  [v6 setObject:&off_10001D3A8 forKey:@"SeedEnrollmentFailureCount"];

  id v7 = _BYLoggingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_time_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Beta Re-Enroll: Unregistering any preexisting activity prior to requested enroll", v10, 2u);
  }

  uint64_t v8 = [*(id *)(a1 + 32) xpcActivityRegistrar];
  [v8 unregisterActivityWithIdentifier:"com.apple.purplebuddy.betaReEnrollment"];

  return objc_msgSend(*(id *)(a1 + 32), "_onSerialQueue_registerActivityForPurpose:", @"enroll requested");
}

void sub_10000B43C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state])
  {
    if ([v3 state] == (id)2)
    {
      long long v4 = _BYLoggingFacility();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Beta Re-Enroll: Activity running", buf, 2u);
      }

      [v3 setState:4];
      *(void *)long long buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      CFStringRef v21 = sub_10000B7A8;
      uint64_t v22 = sub_10000B7B8;
      id v23 = (id)os_transaction_create();
      uint64_t v5 = [*(id *)(a1 + 40) serialQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000B7C0;
      block[3] = &unk_10001C728;
      id v6 = v3;
      uint64_t v7 = *(void *)(a1 + 40);
      id v17 = v6;
      uint64_t v18 = v7;
      __int16 v19 = buf;
      dispatch_async(v5, block);

      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    uint64_t v8 = [v3 criteria];
    xpc_object_t v9 = v8;
    if (v8)
    {
      int64_t int64 = xpc_dictionary_get_int64(v8, XPC_ACTIVITY_INTERVAL);
      id v11 = _BYLoggingFacility();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        v13 = +[NSNumber numberWithLongLong:int64];
        *(_DWORD *)long long buf = 138543618;
        *(void *)&uint8_t buf[4] = v12;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v13;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Beta Re-Enroll: Activity check-in (%{public}@) keeping existing criteria with interval %{public}@", buf, 0x16u);
      }
    }
    else
    {
      int8x16_t v14 = _BYLoggingFacility();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 138543362;
        *(void *)&uint8_t buf[4] = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Beta Re-Enroll: Activity check-in (%{public}@) setting initial criteria", buf, 0xCu);
      }

      xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v9, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
      xpc_dictionary_set_BOOL(v9, XPC_ACTIVITY_REQUIRES_CLASS_A, 1);
      xpc_dictionary_set_BOOL(v9, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
      xpc_dictionary_set_int64(v9, XPC_ACTIVITY_INTERVAL, 1);
      [v3 setCriteria:v9];
    }
  }
}

void sub_10000B788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000B7A8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000B7B8(uint64_t a1)
{
}

void sub_10000B7C0(uint64_t a1)
{
  if ([*(id *)(a1 + 32) shouldDefer])
  {
    id v2 = _BYLoggingFacility();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Beta Re-Enroll: Activity deferring", buf, 2u);
    }

    [*(id *)(a1 + 32) setState:3];
    [*(id *)(a1 + 40) setLockAssertion:0];
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    long long v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_onSerialQueue_attemptLockAssertionIfNecessary");
    uint64_t v5 = *(void **)(a1 + 40);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000BA08;
    v16[3] = &unk_10001CA40;
    v16[4] = v5;
    id v6 = *(id *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 48);
    id v17 = v6;
    uint64_t v18 = v7;
    if ((objc_msgSend(v5, "_onSerialQueue_needsEnrollWithCheckForExistingEnrollment:enrollBlock:", 1, v16) & 1) == 0)
    {
      uint64_t v8 = _BYLoggingFacility();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Beta Re-Enroll: Unregistering activity because no longer needed", buf, 2u);
      }

      [*(id *)(a1 + 32) setState:5];
      xpc_object_t v9 = [*(id *)(a1 + 40) xpcActivityRegistrar];
      [v9 unregisterActivityWithIdentifier:"com.apple.purplebuddy.betaReEnrollment"];

      dispatch_time_t v10 = [*(id *)(a1 + 40) setupAssistantFrameworkDefaults];
      [v10 setObject:0 forKey:@"SeedEnrollmentProgramName"];

      id v11 = [*(id *)(a1 + 40) setupAssistantFrameworkDefaults];
      [v11 setObject:0 forKey:@"SeedEnrollmentAssetAudience"];

      uint64_t v12 = [*(id *)(a1 + 40) setupAssistantFrameworkDefaults];
      [v12 setObject:0 forKey:@"SeedEnrollmentProgramID"];

      v13 = [*(id *)(a1 + 40) setupAssistantFrameworkDefaults];
      [v13 setObject:0 forKey:@"SeedEnrollmentFailureCount"];

      [*(id *)(a1 + 40) setLockAssertion:0];
      uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = 0;
    }
  }
}

void sub_10000BA08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *(void **)(a1 + 32);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000BAC8;
  v11[3] = &unk_10001CA18;
  v11[4] = v8;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  id v12 = v9;
  uint64_t v13 = v10;
  objc_msgSend(v8, "_onSerialQueue_performOneEnrollWithProgramName:assetAudience:programID:completionOnSerialQueue:", a2, a3, a4, v11);
}

void sub_10000BAC8(uint64_t a1, int a2)
{
  long long v4 = _BYLoggingFacility();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Beta Re-Enroll: Unregistering activity after successful enroll", (uint8_t *)&v10, 2u);
    }

    id v6 = [*(id *)(a1 + 32) xpcActivityRegistrar];
    [v6 unregisterActivityWithIdentifier:"com.apple.purplebuddy.betaReEnrollment"];
  }
  else
  {
    if (v5)
    {
      uint64_t v7 = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_1_HOUR];
      int v10 = 138543362;
      id v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Beta Re-Enroll: Adjusting activity interval to %{public}@ seconds", (uint8_t *)&v10, 0xCu);
    }
    id v6 = [*(id *)(a1 + 40) criteria];
    if (xpc_dictionary_get_int64(v6, XPC_ACTIVITY_INTERVAL) != XPC_ACTIVITY_INTERVAL_1_HOUR)
    {
      xpc_dictionary_set_int64(v6, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_HOUR);
      [*(id *)(a1 + 40) setCriteria:v6];
    }
  }

  [*(id *)(a1 + 40) setState:5];
  [*(id *)(a1 + 32) setLockAssertion:0];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;
}

void sub_10000C0C4(uint64_t a1, char a2)
{
  long long v4 = [*(id *)(a1 + 32) serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C178;
  block[3] = &unk_10001CA90;
  char v8 = a2;
  BOOL v5 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v5;
  dispatch_async(v4, block);
}

uint64_t sub_10000C178(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    id v2 = _BYLoggingFacility();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Beta Re-Enroll: Enroll succeeded", v12, 2u);
    }

    uint64_t v3 = [*(id *)(a1 + 32) setupAssistantFrameworkDefaults];
    [v3 setObject:0 forKey:@"SeedEnrollmentProgramName"];

    long long v4 = [*(id *)(a1 + 32) setupAssistantFrameworkDefaults];
    [v4 setObject:0 forKey:@"SeedEnrollmentAssetAudience"];

    BOOL v5 = [*(id *)(a1 + 32) setupAssistantFrameworkDefaults];
    [v5 setObject:0 forKey:@"SeedEnrollmentProgramID"];

    id v6 = [*(id *)(a1 + 32) setupAssistantFrameworkDefaults];
    [v6 setObject:0 forKey:@"SeedEnrollmentFailureCount"];
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) setupAssistantFrameworkDefaults];
    id v6 = [v7 objectForKey:@"SeedEnrollmentFailureCount"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)[v6 unsignedIntegerValue] + 1);

      id v9 = [*(id *)(a1 + 32) setupAssistantFrameworkDefaults];
      [v9 setObject:v8 forKey:@"SeedEnrollmentFailureCount"];

      id v6 = (void *)v8;
    }
    int v10 = _BYLoggingFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10001085C((uint64_t)v6, v10);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000C6AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000C838(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = _BYLoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100010918(v3);
    }
  }
  if (([*(id *)(a1 + 32) takeLock] & 1) == 0)
  {
    BOOL v5 = +[NSError errorWithDomain:@"BYDaemonBackupControllerErrorDomain" code:1 userInfo:0];
    id v6 = [*(id *)(a1 + 32) delegate];
    [v6 backupCompletedWithError:v5 dateOfLastBackup:0];
LABEL_11:

    goto LABEL_12;
  }
  long long v4 = [*(id *)(a1 + 32) manager];
  BOOL v5 = [v4 backupState];

  if ([v5 state] == 1 || objc_msgSend(v5, "state") == 2)
  {
    id v6 = _BYLoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 67109120;
      LODWORD(v12) = [v5 state];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Backup is already running (current state: %d)", (uint8_t *)&v11, 8u);
    }
    goto LABEL_11;
  }
  id v7 = _BYLoggingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Starting backup...", (uint8_t *)&v11, 2u);
  }

  uint64_t v8 = _BYLoggingFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [*(id *)(a1 + 32) manager];
    int v10 = [v9 dateOfLastBackup];
    int v11 = 138412290;
    id v12 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Last backup was at %@", (uint8_t *)&v11, 0xCu);
  }
  [*(id *)(a1 + 32) setLastPercentComplete:-1.0];
  [*(id *)(a1 + 32) attemptToBeginBackup:5];
LABEL_12:
}

id sub_10000CCD8(uint64_t a1)
{
  return [*(id *)(a1 + 32) attemptToBeginBackup:*(void *)(a1 + 40) - 1];
}

void sub_10000CF2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_10000D248(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_100024D90)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_10000D38C;
    v4[4] = &unk_10001C598;
    void v4[5] = v4;
    long long v5 = off_10001CB28;
    uint64_t v6 = 0;
    qword_100024D90 = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!qword_100024D90)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("MBManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)sub_10001095C();
LABEL_8:
    free(v2);
  }
  qword_100024D88 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10000D38C()
{
  uint64_t result = _sl_dlopen();
  qword_100024D90 = result;
  return result;
}

void *sub_10000D400(uint64_t a1)
{
  v5[0] = 0;
  if (!qword_100024DA0)
  {
    v5[1] = _NSConcreteStackBlock;
    v5[2] = 3221225472;
    v5[3] = sub_10000D540;
    v5[4] = &unk_10001C598;
    v5[5] = v5;
    long long v6 = off_10001CB40;
    uint64_t v7 = 0;
    qword_100024DA0 = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    id v2 = (void *)qword_100024DA0;
    if (qword_100024DA0)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  id v2 = (void *)qword_100024DA0;
LABEL_5:
  uint64_t result = dlsym(v2, "MKBDeviceLockAssertion");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100024D98 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10000D540()
{
  uint64_t result = _sl_dlopen();
  qword_100024DA0 = result;
  return result;
}

void sub_10000D608(id a1)
{
  qword_100024DB0 = objc_alloc_init(BYDaemonCloudSyncController);
  _objc_release_x1();
}

id sub_10000E4FC()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_100024DB8;
  uint64_t v7 = qword_100024DB8;
  if (!qword_100024DB8)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10000EAC4;
    v3[3] = &unk_10001C560;
    v3[4] = &v4;
    sub_10000EAC4((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_10000E5C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10000E5E0()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_100024DC8;
  uint64_t v7 = qword_100024DC8;
  if (!qword_100024DC8)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10000EC8C;
    v3[3] = &unk_10001C560;
    v3[4] = &v4;
    sub_10000EC8C((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_10000E6AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000EAC4(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("_CDClientContext");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100024DB8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_100010984();
    sub_10000EB1C();
  }
}

void sub_10000EB1C()
{
  v1[0] = 0;
  if (!qword_100024DC0)
  {
    v1[1] = _NSConcreteStackBlock;
    v1[2] = 3221225472;
    v1[3] = sub_10000EC18;
    v1[4] = &unk_10001C598;
    v1[5] = v1;
    long long v2 = off_10001CB78;
    uint64_t v3 = 0;
    qword_100024DC0 = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!qword_100024DC0)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t sub_10000EC18()
{
  uint64_t result = _sl_dlopen();
  qword_100024DC0 = result;
  return result;
}

BYDaemonMigrationSourceController *sub_10000EC8C(uint64_t a1)
{
  sub_10000EB1C();
  uint64_t result = (BYDaemonMigrationSourceController *)objc_getClass("_CDContextualKeyPath");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100024DC8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (BYDaemonMigrationSourceController *)sub_1000109AC();
    return [(BYDaemonMigrationSourceController *)v3 init];
  }
  return result;
}

void sub_10000F070(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) migrationManager];
  if (v2
    && (uint64_t v3 = (void *)v2,
        [*(id *)(a1 + 32) migrationManager],
        SEL v4 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v5 = [v4 isMigrating],
        v4,
        v3,
        (v5 & 1) != 0))
  {
    [*(id *)(a1 + 32) setMigrationCompleteBlock:*(void *)(a1 + 40)];
    dispatch_time_t v6 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
    uint64_t v7 = [*(id *)(a1 + 32) migrationCompleteQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000F1A4;
    block[3] = &unk_10001C800;
    void block[4] = *(void *)(a1 + 32);
    dispatch_after(v6, v7, block);
  }
  else
  {
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v8();
  }
}

void sub_10000F1A4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) migrationCompleteBlock];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) migrationCompleteBlock];
    v3[2](v3, 1);

    SEL v4 = *(void **)(a1 + 32);
    [v4 setMigrationCompleteBlock:0];
  }
}

void sub_10000F2B4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) migrationCompleteBlock];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) migrationCompleteBlock];
    v3[2](v3, 0);

    SEL v4 = *(void **)(a1 + 32);
    [v4 setMigrationCompleteBlock:0];
  }
}

void sub_10000F44C(id a1)
{
  qword_100024DD0 = objc_opt_new();
  _objc_release_x1();
}

void sub_10000F9C0(uint64_t a1, xpc_object_t xdict)
{
  id v3 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(xdict, _xpc_event_key_name)];
  if ([v3 isEqual:MCPasscodeChangedNotification])
  {
    [*(id *)(*(void *)(a1 + 32) + 88) passcodeDidChange];
  }
  else if ([v3 isEqualToString:MCEffectiveSettingsChangedNotification])
  {
    [*(id *)(*(void *)(a1 + 32) + 88) revisePendingFollowUpsForcingRepost:0];
  }
}

void sub_10000FBAC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 64);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000FC20;
  block[3] = &unk_10001C800;
  void block[4] = v1;
  dispatch_async(v2, block);
}

id sub_10000FC20(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 88) revisePendingFollowUpsForcingRepost:0];
}

void sub_10001022C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v25 - 88));
  _Unwind_Resume(a1);
}

void sub_100010274(uint64_t a1)
{
  uint64_t v2 = _BYLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    SEL v4 = [WeakRetained debugDescription];
    int v6 = 138543618;
    uint64_t v7 = v4;
    __int16 v8 = 2114;
    CFStringRef v9 = @"com.apple.purplebuddy.budd.proximityautomateddeviceenrollment.target.xpc";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Connection (%{public}@) to %{public}@ invalidated", (uint8_t *)&v6, 0x16u);
  }
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  [v5 setCurrentProximityAutomatedDeviceEnrollmentConnection:0];
}

void sub_10001036C(uint64_t a1)
{
  uint64_t v2 = _BYLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    sub_100010AD8(a1, v2);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setCurrentProximityAutomatedDeviceEnrollmentConnection:0];
}

void sub_1000104C8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Notes sync task finished successfully", v1, 2u);
}

uint64_t sub_10001050C()
{
  return sub_100010530();
}

uint64_t sub_100010530()
{
  uint64_t v0 = abort_report_np();
  return sub_100010558(v0);
}

void sub_100010558(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to update express settings!", v1, 2u);
}

void sub_10001059C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Did not promote as we do not have the lock assertion", v1, 2u);
}

void sub_1000105E0(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to promote device lock assertion: %d", (uint8_t *)v2, 8u);
}

void sub_100010658(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Updating express settings failed!", v1, 2u);
}

void sub_10001069C(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to upload express settings; no attempts remaining (%ld total)",
    (uint8_t *)&v3,
    0xCu);
}

void sub_100010718(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Raw data: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100010790(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Missing or corrupt data when restoring migration state!", v1, 2u);
}

void sub_1000107D4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Migration source connection invalidated; cancelling migration...",
    v1,
    2u);
}

void sub_100010818(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Migration source connection interrupted; cancelling migration...",
    v1,
    2u);
}

void sub_10001085C(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Beta Re-Enroll: Enroll failed (failure count %{public}@)", (uint8_t *)&v2, 0xCu);
}

void sub_1000108D4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Beta Re-Enroll: Failed to acquire lock assertion. Enrollment may fail.", v1, 2u);
}

void sub_100010918(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Timed out waiting for migration to complete; will attempt to start backup anyway...",
    v1,
    2u);
}

uint64_t sub_10001095C()
{
  uint64_t v0 = abort_report_np();
  return sub_100010984(v0);
}

uint64_t sub_100010984()
{
  uint64_t v0 = abort_report_np();
  return sub_1000109AC(v0);
}

uint64_t sub_1000109AC()
{
  uint64_t v0 = abort_report_np();
  return sub_1000109D4(v0);
}

void sub_1000109D4()
{
  sub_1000104B4();
  CFStringRef v2 = @"com.apple.purplebuddy.budd.access";
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Client %{public}@ is missing entitlement %{public}@", v1, 0x16u);
}

void sub_100010A54(os_log_t log)
{
  int v1 = 138543362;
  CFStringRef v2 = @"com.apple.purplebuddy.budd.proximityautomateddeviceenrollment.target.xpc";
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Refusing incoming connection to %{public}@, there is an existing connection", (uint8_t *)&v1, 0xCu);
}

void sub_100010AD8(uint64_t a1, NSObject *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = [WeakRetained debugDescription];
  sub_1000104B4();
  CFStringRef v6 = @"com.apple.purplebuddy.budd.proximityautomateddeviceenrollment.target.xpc";
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Connection (%{public}@) to %{public}@ interrupted.", v5, 0x16u);
}

uint64_t BYDaemonCreateMetadataArchive()
{
  return _BYDaemonCreateMetadataArchive();
}

uint64_t BYProcessNameForPID()
{
  return _BYProcessNameForPID();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t Daemon_BYSetupAssistantNeedsToRun()
{
  return _Daemon_BYSetupAssistantNeedsToRun();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t _BYIsInternalInstall()
{
  return __BYIsInternalInstall();
}

uint64_t _BYLoggingFacility()
{
  return __BYLoggingFacility();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
{
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

uint64_t voucher_copy()
{
  return _voucher_copy();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend__monitorLocalNotifications(void *a1, const char *a2, ...)
{
  return [a1 _monitorLocalNotifications];
}

id objc_msgSend__monitorXPCEvents(void *a1, const char *a2, ...)
{
  return [a1 _monitorXPCEvents];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_applePayAuthenticationContext(void *a1, const char *a2, ...)
{
  return [a1 applePayAuthenticationContext];
}

id objc_msgSend_assertionRef(void *a1, const char *a2, ...)
{
  return [a1 assertionRef];
}

id objc_msgSend_backupController(void *a1, const char *a2, ...)
{
  return [a1 backupController];
}

id objc_msgSend_backupLockAssertion(void *a1, const char *a2, ...)
{
  return [a1 backupLockAssertion];
}

id objc_msgSend_backupState(void *a1, const char *a2, ...)
{
  return [a1 backupState];
}

id objc_msgSend_beginAdvertising(void *a1, const char *a2, ...)
{
  return [a1 beginAdvertising];
}

id objc_msgSend_beginBroadcasting(void *a1, const char *a2, ...)
{
  return [a1 beginBroadcasting];
}

id objc_msgSend_beginEraseAndShutdown(void *a1, const char *a2, ...)
{
  return [a1 beginEraseAndShutdown];
}

id objc_msgSend_beginSIMSetupExternalAuthentication(void *a1, const char *a2, ...)
{
  return [a1 beginSIMSetupExternalAuthentication];
}

id objc_msgSend_biometricAuthenticationContext(void *a1, const char *a2, ...)
{
  return [a1 biometricAuthenticationContext];
}

id objc_msgSend_blockUntilShortLivedTokenUpgradeCompletes(void *a1, const char *a2, ...)
{
  return [a1 blockUntilShortLivedTokenUpgradeCompletes];
}

id objc_msgSend_blockUntilSilentLoginUpgradeCompletes(void *a1, const char *a2, ...)
{
  return [a1 blockUntilSilentLoginUpgradeCompletes];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_buddyPreferencesInternal(void *a1, const char *a2, ...)
{
  return [a1 buddyPreferencesInternal];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_cancelDaemonSync(void *a1, const char *a2, ...)
{
  return [a1 cancelDaemonSync];
}

id objc_msgSend_cancelNotesSync(void *a1, const char *a2, ...)
{
  return [a1 cancelNotesSync];
}

id objc_msgSend_cancelSync(void *a1, const char *a2, ...)
{
  return [a1 cancelSync];
}

id objc_msgSend_capabilities(void *a1, const char *a2, ...)
{
  return [a1 capabilities];
}

id objc_msgSend_clientInterface(void *a1, const char *a2, ...)
{
  return [a1 clientInterface];
}

id objc_msgSend_cloudSettings(void *a1, const char *a2, ...)
{
  return [a1 cloudSettings];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_completedUnitCount(void *a1, const char *a2, ...)
{
  return [a1 completedUnitCount];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_contextQueue(void *a1, const char *a2, ...)
{
  return [a1 contextQueue];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_criteria(void *a1, const char *a2, ...)
{
  return [a1 criteria];
}

id objc_msgSend_currentEnrollmentMetadata(void *a1, const char *a2, ...)
{
  return [a1 currentEnrollmentMetadata];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_currentProximityAutomatedDeviceEnrollmentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentProximityAutomatedDeviceEnrollmentConnection];
}

id objc_msgSend_daemonProgress(void *a1, const char *a2, ...)
{
  return [a1 daemonProgress];
}

id objc_msgSend_daemonProtocolInterface(void *a1, const char *a2, ...)
{
  return [a1 daemonProtocolInterface];
}

id objc_msgSend_daemonStart(void *a1, const char *a2, ...)
{
  return [a1 daemonStart];
}

id objc_msgSend_dateOfLastBackup(void *a1, const char *a2, ...)
{
  return [a1 dateOfLastBackup];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return [a1 debugDescription];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_delegates(void *a1, const char *a2, ...)
{
  return [a1 delegates];
}

id objc_msgSend_deviceClass(void *a1, const char *a2, ...)
{
  return [a1 deviceClass];
}

id objc_msgSend_deviceLockAssertion(void *a1, const char *a2, ...)
{
  return [a1 deviceLockAssertion];
}

id objc_msgSend_dismissProximityPinCode(void *a1, const char *a2, ...)
{
  return [a1 dismissProximityPinCode];
}

id objc_msgSend_displayShutdownUI(void *a1, const char *a2, ...)
{
  return [a1 displayShutdownUI];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_endAdvertising(void *a1, const char *a2, ...)
{
  return [a1 endAdvertising];
}

id objc_msgSend_endBroadcasting(void *a1, const char *a2, ...)
{
  return [a1 endBroadcasting];
}

id objc_msgSend_endDeviceToDeviceMigration(void *a1, const char *a2, ...)
{
  return [a1 endDeviceToDeviceMigration];
}

id objc_msgSend_endPairing(void *a1, const char *a2, ...)
{
  return [a1 endPairing];
}

id objc_msgSend_endSIMSetupExternalAuthentication(void *a1, const char *a2, ...)
{
  return [a1 endSIMSetupExternalAuthentication];
}

id objc_msgSend_enrollmentController(void *a1, const char *a2, ...)
{
  return [a1 enrollmentController];
}

id objc_msgSend_errors(void *a1, const char *a2, ...)
{
  return [a1 errors];
}

id objc_msgSend_fileTransferSessionTemplate(void *a1, const char *a2, ...)
{
  return [a1 fileTransferSessionTemplate];
}

id objc_msgSend_flowSkipController(void *a1, const char *a2, ...)
{
  return [a1 flowSkipController];
}

id objc_msgSend_fractionCompleted(void *a1, const char *a2, ...)
{
  return [a1 fractionCompleted];
}

id objc_msgSend_handshake(void *a1, const char *a2, ...)
{
  return [a1 handshake];
}

id objc_msgSend_hasConnection(void *a1, const char *a2, ...)
{
  return [a1 hasConnection];
}

id objc_msgSend_hasStashedValuesOnDisk(void *a1, const char *a2, ...)
{
  return [a1 hasStashedValuesOnDisk];
}

id objc_msgSend_inexpensiveCellularAccess(void *a1, const char *a2, ...)
{
  return [a1 inexpensiveCellularAccess];
}

id objc_msgSend_information(void *a1, const char *a2, ...)
{
  return [a1 information];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_intent(void *a1, const char *a2, ...)
{
  return [a1 intent];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isBackupEnabled(void *a1, const char *a2, ...)
{
  return [a1 isBackupEnabled];
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return [a1 isFinished];
}

id objc_msgSend_isLoginUser(void *a1, const char *a2, ...)
{
  return [a1 isLoginUser];
}

id objc_msgSend_isMigrating(void *a1, const char *a2, ...)
{
  return [a1 isMigrating];
}

id objc_msgSend_isMultiUser(void *a1, const char *a2, ...)
{
  return [a1 isMultiUser];
}

id objc_msgSend_lastPercentComplete(void *a1, const char *a2, ...)
{
  return [a1 lastPercentComplete];
}

id objc_msgSend_launchSetupForMigration(void *a1, const char *a2, ...)
{
  return [a1 launchSetupForMigration];
}

id objc_msgSend_lockAssertion(void *a1, const char *a2, ...)
{
  return [a1 lockAssertion];
}

id objc_msgSend_lockAssertionManager(void *a1, const char *a2, ...)
{
  return [a1 lockAssertionManager];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return [a1 manager];
}

id objc_msgSend_messageSession(void *a1, const char *a2, ...)
{
  return [a1 messageSession];
}

id objc_msgSend_migrationCompleteBlock(void *a1, const char *a2, ...)
{
  return [a1 migrationCompleteBlock];
}

id objc_msgSend_migrationCompleteQueue(void *a1, const char *a2, ...)
{
  return [a1 migrationCompleteQueue];
}

id objc_msgSend_migrationController(void *a1, const char *a2, ...)
{
  return [a1 migrationController];
}

id objc_msgSend_migrationManager(void *a1, const char *a2, ...)
{
  return [a1 migrationManager];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return [a1 model];
}

id objc_msgSend_notesProgress(void *a1, const char *a2, ...)
{
  return [a1 notesProgress];
}

id objc_msgSend_notesSync(void *a1, const char *a2, ...)
{
  return [a1 notesSync];
}

id objc_msgSend_notesSyncer(void *a1, const char *a2, ...)
{
  return [a1 notesSyncer];
}

id objc_msgSend_observeFinishSetupTriggers(void *a1, const char *a2, ...)
{
  return [a1 observeFinishSetupTriggers];
}

id objc_msgSend_passcodeDidChange(void *a1, const char *a2, ...)
{
  return [a1 passcodeDidChange];
}

id objc_msgSend_performSilentICDPUpgrade(void *a1, const char *a2, ...)
{
  return [a1 performSilentICDPUpgrade];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_productBuild(void *a1, const char *a2, ...)
{
  return [a1 productBuild];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_proximityConnectionInitiated(void *a1, const char *a2, ...)
{
  return [a1 proximityConnectionInitiated];
}

id objc_msgSend_proximityConnectionReconnected(void *a1, const char *a2, ...)
{
  return [a1 proximityConnectionReconnected];
}

id objc_msgSend_proximityConnectionTerminated(void *a1, const char *a2, ...)
{
  return [a1 proximityConnectionTerminated];
}

id objc_msgSend_proximitySourceClientInterface(void *a1, const char *a2, ...)
{
  return [a1 proximitySourceClientInterface];
}

id objc_msgSend_proximityTargetClientInterface(void *a1, const char *a2, ...)
{
  return [a1 proximityTargetClientInterface];
}

id objc_msgSend_purpose(void *a1, const char *a2, ...)
{
  return [a1 purpose];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_regionCode(void *a1, const char *a2, ...)
{
  return [a1 regionCode];
}

id objc_msgSend_registerActivities(void *a1, const char *a2, ...)
{
  return [a1 registerActivities];
}

id objc_msgSend_registerActivity(void *a1, const char *a2, ...)
{
  return [a1 registerActivity];
}

id objc_msgSend_registerBackupActivity(void *a1, const char *a2, ...)
{
  return [a1 registerBackupActivity];
}

id objc_msgSend_registerMaintenanceActivity(void *a1, const char *a2, ...)
{
  return [a1 registerMaintenanceActivity];
}

id objc_msgSend_releaseLock(void *a1, const char *a2, ...)
{
  return [a1 releaseLock];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_saveUnsyncedObjects(void *a1, const char *a2, ...)
{
  return [a1 saveUnsyncedObjects];
}

id objc_msgSend_seedProgramManager(void *a1, const char *a2, ...)
{
  return [a1 seedProgramManager];
}

id objc_msgSend_serialQueue(void *a1, const char *a2, ...)
{
  return [a1 serialQueue];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return [a1 service];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return [a1 session];
}

id objc_msgSend_setupAssistantFrameworkDefaults(void *a1, const char *a2, ...)
{
  return [a1 setupAssistantFrameworkDefaults];
}

id objc_msgSend_sharedActivity(void *a1, const char *a2, ...)
{
  return [a1 sharedActivity];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedController(void *a1, const char *a2, ...)
{
  return [a1 sharedController];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedNotifier(void *a1, const char *a2, ...)
{
  return [a1 sharedNotifier];
}

id objc_msgSend_shouldDefer(void *a1, const char *a2, ...)
{
  return [a1 shouldDefer];
}

id objc_msgSend_shouldStartBackup(void *a1, const char *a2, ...)
{
  return [a1 shouldStartBackup];
}

id objc_msgSend_showMigrationInterfaceOnSource(void *a1, const char *a2, ...)
{
  return [a1 showMigrationInterfaceOnSource];
}

id objc_msgSend_showingPIN(void *a1, const char *a2, ...)
{
  return [a1 showingPIN];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startBackup(void *a1, const char *a2, ...)
{
  return [a1 startBackup];
}

id objc_msgSend_startDaemonSync(void *a1, const char *a2, ...)
{
  return [a1 startDaemonSync];
}

id objc_msgSend_startNotesSync(void *a1, const char *a2, ...)
{
  return [a1 startNotesSync];
}

id objc_msgSend_startSync(void *a1, const char *a2, ...)
{
  return [a1 startSync];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_suspendCompletionBlock(void *a1, const char *a2, ...)
{
  return [a1 suspendCompletionBlock];
}

id objc_msgSend_takeLock(void *a1, const char *a2, ...)
{
  return [a1 takeLock];
}

id objc_msgSend_targetDeviceName(void *a1, const char *a2, ...)
{
  return [a1 targetDeviceName];
}

id objc_msgSend_totalUnitCount(void *a1, const char *a2, ...)
{
  return [a1 totalUnitCount];
}

id objc_msgSend_underlyingActivity(void *a1, const char *a2, ...)
{
  return [a1 underlyingActivity];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_userContext(void *a1, const char *a2, ...)
{
  return [a1 userContext];
}

id objc_msgSend_xpcActivityRegistrar(void *a1, const char *a2, ...)
{
  return [a1 xpcActivityRegistrar];
}