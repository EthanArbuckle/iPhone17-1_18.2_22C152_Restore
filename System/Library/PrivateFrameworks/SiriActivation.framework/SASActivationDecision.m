@interface SASActivationDecision
+ (BOOL)_shouldSiriActivateForSiriSetupWithSystemState:(id)a3;
+ (BOOL)canActivateForCondition:(id)a3;
@end

@implementation SASActivationDecision

+ (BOOL)canActivateForCondition:(id)a3
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 request];
  int v6 = [v4 buttonTriggerStateActive];
  v7 = [v4 systemState];
  v8 = [v4 pocketStateManager];
  v93 = [v4 preferences];
  uint64_t v90 = [v4 analyticsContext];
  uint64_t v9 = [v4 requestState];
  v91 = [v4 assetUtilities];
  v92 = [v4 uiPresentationIdentifier];
  uint64_t v10 = [v5 requestSource];
  v11 = [MEMORY[0x1E4F4E538] sharedPreferences];
  int v12 = [v11 alwaysAllowVoiceActivation];

  if (([v7 siriIsEnabled] & 1) == 0 && v10 != 53)
  {
    char v13 = [a1 _shouldSiriActivateForSiriSetupWithSystemState:v7];
LABEL_4:
    v14 = v8;
LABEL_5:
    v15 = (void *)v90;
    goto LABEL_218;
  }
  if (([v7 siriIsSupported] & 1) != 0 || v10 == 53)
  {
    v14 = v8;
    if ([v7 siriIsRestricted] && v10 != 53)
    {
      v15 = (void *)v90;
      if (v90)
      {
        v23 = +[SASAnalytics analytics];
        [v23 enqueueCurrentAnalyticsEventWithType:1405 context:v90];
      }
      v24 = *MEMORY[0x1E4F4E360];
      char v13 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_218;
      }
      *(_DWORD *)buf = 136315138;
      v95 = "+[SASActivationDecision canActivateForCondition:]";
      v25 = "%s #activation NO: Siri is restricted by profile";
      goto LABEL_216;
    }
    if (([v7 hasUnlockedSinceBoot] & 1) == 0
      && [v5 isVoiceRequest]
      && v10 != 53)
    {
      v15 = (void *)v90;
      if (v90)
      {
        v28 = +[SASAnalytics analytics];
        [v28 enqueueCurrentAnalyticsEventWithType:1405 context:v90];
      }
      v24 = *MEMORY[0x1E4F4E360];
      char v13 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_218;
      }
      *(_DWORD *)buf = 136315138;
      v95 = "+[SASActivationDecision canActivateForCondition:]";
      v25 = "%s #activation NO: Siri voice activation is disabled until first unlock.";
      goto LABEL_216;
    }
    if (![v5 isVoiceRequest]
      || ![v8 pocketStateShouldPreventVoiceTriggerForActivationRequest:v5]
      || ([v7 isConnectedToCarPlay] & 1) != 0)
    {
LABEL_37:
      if (v6 && [v5 isHoldToTalkSource])
      {
        v15 = (void *)v90;
        if (v90)
        {
          v29 = +[SASAnalytics analytics];
          [v29 enqueueCurrentAnalyticsEventWithType:1405 context:v90];
        }
        v24 = *MEMORY[0x1E4F4E360];
        char v13 = 0;
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_218;
        }
        *(_DWORD *)buf = 136315138;
        v95 = "+[SASActivationDecision canActivateForCondition:]";
        v25 = "%s #activation NO: There is an existing HoldToTalk trigger.";
        goto LABEL_216;
      }
      if ([v7 isAssessmentModeActive])
      {
        v15 = (void *)v90;
        if (v90)
        {
          v30 = +[SASAnalytics analytics];
          [v30 enqueueCurrentAnalyticsEventWithType:1405 context:v90];
        }
        v24 = *MEMORY[0x1E4F4E360];
        char v13 = 0;
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_218;
        }
        *(_DWORD *)buf = 136315138;
        v95 = "+[SASActivationDecision canActivateForCondition:]";
        v25 = "%s #activation NO: assessment mode is active.";
        goto LABEL_216;
      }
      if (![v7 smartCoverClosed]
        || ![v7 isPad]
        || ([v5 isDeviceButtonRequest] & 1) == 0 && !objc_msgSend(v5, "isVoiceRequest"))
      {
        goto LABEL_60;
      }
      if ([v5 isRemoteDisplayVoiceRequest])
      {
        v31 = (id)*MEMORY[0x1E4F4E360];
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
LABEL_59:

LABEL_60:
          if ([v7 smartCoverClosed]
            && ([v7 isPad] & 1) == 0
            && (([v5 isDeviceButtonRequest] & 1) != 0 || objc_msgSend(v5, "isVoiceRequest"))
            && ([v7 isConnectedToCarPlay] & 1) == 0)
          {
            int v34 = [v5 isVoiceRequest];
            v24 = *MEMORY[0x1E4F4E360];
            if ((v34 & v12) != 1)
            {
              char v13 = 0;
              v15 = (void *)v90;
              if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_218;
              }
              *(_DWORD *)buf = 136315138;
              v95 = "+[SASActivationDecision canActivateForCondition:]";
              v25 = "%s #activation NO: Siri is disabled because an iPhone Smart Cover is closed which blocks home button or Hey Siri";
              goto LABEL_216;
            }
            v35 = v24;
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v95 = "+[SASActivationDecision canActivateForCondition:]";
              _os_log_impl(&dword_1D9588000, v35, OS_LOG_TYPE_DEFAULT, "%s #activation: Smart Cover is closed, which would normally prevent voice trigger, but the user default to always allow voice activation is set, so ignoring Smart Cover state", buf, 0xCu);
            }
          }
          if ([v5 isDeviceButtonRequest] && _AXSHomeButtonAssistant())
          {
            v24 = *MEMORY[0x1E4F4E360];
            char v13 = 0;
            v15 = (void *)v90;
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_218;
            }
            *(_DWORD *)buf = 136315138;
            v95 = "+[SASActivationDecision canActivateForCondition:]";
            v25 = "%s #activation NO: \"Press Home/Side For Siri\" is disabled in Settings";
            goto LABEL_216;
          }
          if (v9 && v9 != 3)
          {
            v41 = (void *)*MEMORY[0x1E4F4E360];
            char v13 = 0;
            v15 = (void *)v90;
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_218;
            }
            v18 = v41;
            SASRequestStateGetName(v9);
            v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v95 = "+[SASActivationDecision canActivateForCondition:]";
            __int16 v96 = 2112;
            v97 = v19;
            __int16 v98 = 2112;
            v99 = v5;
            v20 = "%s #activation NO: Siri state is %@. Ignoring activationRequest %@.";
            v21 = v18;
            uint32_t v22 = 32;
            goto LABEL_12;
          }
          if (![v7 deviceIsPasscodeLocked] || v10 == 53) {
            goto LABEL_123;
          }
          uint64_t v36 = [v5 context];
          if (v36)
          {
            v37 = [v5 context];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              v39 = [v5 context];
              v40 = [v39 requestInfo];
              LOBYTE(v36) = [v40 requiresUserInteraction];
            }
            else
            {
              LOBYTE(v36) = 0;
            }
          }
          if (![v93 disableAssistantWhilePasscodeLocked]
            || (v36 & 1) != 0
            || ([v7 isConnectedToTrustedCarPlay] & 1) != 0)
          {
            uint64_t v43 = [v5 requestSource];
            if (v43 == 18)
            {
              v52 = [v5 context];
              objc_opt_class();
              char v53 = objc_opt_isKindOfClass();

              if ((v53 & 1) == 0) {
                goto LABEL_123;
              }
              v46 = [v5 context];
              v54 = [v46 speechRequestOptions];
              uint64_t v55 = [v54 activationEvent];
              v56 = (os_log_t *)MEMORY[0x1E4F4E360];
              v57 = (id)*MEMORY[0x1E4F4E360];
              if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
              {
                AFSpeechEventGetDescription();
                v58 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
                int v59 = [v46 isTemporaryDevice];
                *(_DWORD *)buf = 136315650;
                v95 = "+[SASActivationDecision canActivateForCondition:]";
                __int16 v96 = 2112;
                v97 = v58;
                __int16 v98 = 1024;
                LODWORD(v99) = v59;
                _os_log_impl(&dword_1D9588000, v57, OS_LOG_TYPE_DEFAULT, "%s event:%@ isTemporaryDevice:%i", buf, 0x1Cu);

                v56 = (os_log_t *)MEMORY[0x1E4F4E360];
              }

              if ((v55 & 0xFFFFFFFFFFFFFFFELL) == 0xE
                && [v46 isTemporaryDevice]
                && ([v7 isWirelessSplitterOn] & 1) == 0
                && [v7 isGuestConnected])
              {
                v60 = *v56;
                if (os_log_type_enabled(*v56, OS_LOG_TYPE_DEFAULT))
                {
                  v61 = @"Double-Tap";
                  if (v55 == 15) {
                    v61 = @"Hey Siri";
                  }
                  *(_DWORD *)buf = 136315394;
                  v95 = "+[SASActivationDecision canActivateForCondition:]";
                  __int16 v96 = 2112;
                  v97 = v61;
                  _os_log_impl(&dword_1D9588000, v60, OS_LOG_TYPE_DEFAULT, "%s #activation NO: Blocking wireless splitter guest that's using B288 %@", buf, 0x16u);
                }

                char v13 = 0;
                goto LABEL_4;
              }

              v14 = v8;
              goto LABEL_122;
            }
            if (v43 == 5)
            {
              v44 = [v5 context];
              objc_opt_class();
              char v45 = objc_opt_isKindOfClass();

              if (v45)
              {
                v46 = [v5 context];
                v47 = (os_log_t *)MEMORY[0x1E4F4E360];
                v48 = (id)*MEMORY[0x1E4F4E360];
                if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
                {
                  int v49 = [v46 isTemporaryDevice];
                  *(_DWORD *)buf = 136315394;
                  v95 = "+[SASActivationDecision canActivateForCondition:]";
                  __int16 v96 = 1024;
                  LODWORD(v97) = v49;
                  _os_log_impl(&dword_1D9588000, v48, OS_LOG_TYPE_DEFAULT, "%s requestSource:SASRequestSourceBluetoothHeadset isTemporaryDevice:%i", buf, 0x12u);
                }

                if ([v46 isTemporaryDevice]
                  && ([v7 isWirelessSplitterOn] & 1) == 0
                  && [v7 isGuestConnected])
                {
                  v50 = *v47;
                  if (os_log_type_enabled(*v47, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315138;
                    v95 = "+[SASActivationDecision canActivateForCondition:]";
                    _os_log_impl(&dword_1D9588000, v50, OS_LOG_TYPE_DEFAULT, "%s #activation NO: Blocking wireless splitter guest that's using B188 / bluetooth device", buf, 0xCu);
                  }

                  char v13 = 0;
                  goto LABEL_5;
                }
LABEL_122:
              }
            }
LABEL_123:
            if ([v7 deviceIsBlocked])
            {
              v15 = (void *)v90;
              if (v90)
              {
                v62 = +[SASAnalytics analytics];
                [v62 enqueueCurrentAnalyticsEventWithType:1405 context:v90];
              }
              v24 = *MEMORY[0x1E4F4E360];
              char v13 = 0;
              if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_218;
              }
              *(_DWORD *)buf = 136315138;
              v95 = "+[SASActivationDecision canActivateForCondition:]";
              v25 = "%s #activation NO: Siri is disabled because the device is blocked";
              goto LABEL_216;
            }
            if (![v7 isInActiveCall] || v10 == 53)
            {
LABEL_161:
              if ([v7 isRemoteWebcamMode])
              {
                v24 = *MEMORY[0x1E4F4E360];
                char v13 = 0;
                v15 = (void *)v90;
                if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_218;
                }
                *(_DWORD *)buf = 136315138;
                v95 = "+[SASActivationDecision canActivateForCondition:]";
                v25 = "%s #activation NO: in remote webcam mode";
                goto LABEL_216;
              }
              if ([MEMORY[0x1E4F4E638] isSAEEnabled])
              {
                if ([v7 isInAAAGame])
                {
                  v24 = *MEMORY[0x1E4F4E360];
                  char v13 = 0;
                  v15 = (void *)v90;
                  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_218;
                  }
                  *(_DWORD *)buf = 136315138;
                  v95 = "+[SASActivationDecision canActivateForCondition:]";
                  v25 = "%s #activation NO: siri disabled when playing AAA game";
                  goto LABEL_216;
                }
                if ([v5 requestSource] == 47)
                {
                  if ([v7 isConnectedToCarPlay])
                  {
                    v24 = *MEMORY[0x1E4F4E360];
                    char v13 = 0;
                    v15 = (void *)v90;
                    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT)) {
                      goto LABEL_218;
                    }
                    *(_DWORD *)buf = 136315138;
                    v95 = "+[SASActivationDecision canActivateForCondition:]";
                    v25 = "%s #activation NO: type to siri disabled when connected to CarPlay";
                    goto LABEL_216;
                  }
                  if ([v92 isEqualToString:@"com.apple.siri.EyesFree"])
                  {
                    v24 = *MEMORY[0x1E4F4E360];
                    char v13 = 0;
                    v15 = (void *)v90;
                    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT)) {
                      goto LABEL_218;
                    }
                    *(_DWORD *)buf = 136315138;
                    v95 = "+[SASActivationDecision canActivateForCondition:]";
                    v25 = "%s #activation NO: type to siri disabled when in eyesfree mode";
                    goto LABEL_216;
                  }
                  if ([v92 isEqualToString:@"com.apple.siri.BluetoothCar"])
                  {
                    v24 = *MEMORY[0x1E4F4E360];
                    char v13 = 0;
                    v14 = v8;
                    v15 = (void *)v90;
                    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT)) {
                      goto LABEL_218;
                    }
                    *(_DWORD *)buf = 136315138;
                    v95 = "+[SASActivationDecision canActivateForCondition:]";
                    v25 = "%s #activation NO: type to siri disabled when connected to bluetooth car";
                    goto LABEL_216;
                  }
                  v14 = v8;
                  if (([v5 isQuickTypeGestureEnabled] & 1) == 0)
                  {
                    v24 = *MEMORY[0x1E4F4E360];
                    char v13 = 0;
                    v15 = (void *)v90;
                    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT)) {
                      goto LABEL_218;
                    }
                    *(_DWORD *)buf = 136315138;
                    v95 = "+[SASActivationDecision canActivateForCondition:]";
                    v25 = "%s #activation NO: type to siri setting disabled in settings";
                    goto LABEL_216;
                  }
                }
                if (v10 == 53)
                {
                  if ([v7 isConnectedToCarPlay])
                  {
                    v24 = *MEMORY[0x1E4F4E360];
                    char v13 = 0;
                    v15 = (void *)v90;
                    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT)) {
                      goto LABEL_218;
                    }
                    *(_DWORD *)buf = 136315138;
                    v95 = "+[SASActivationDecision canActivateForCondition:]";
                    v25 = "%s #activation NO: Tamale Launch disabled when connected to CarPlay";
                    goto LABEL_216;
                  }
                  if ([v92 isEqualToString:@"com.apple.siri.EyesFree"])
                  {
                    v24 = *MEMORY[0x1E4F4E360];
                    char v13 = 0;
                    v15 = (void *)v90;
                    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT)) {
                      goto LABEL_218;
                    }
                    *(_DWORD *)buf = 136315138;
                    v95 = "+[SASActivationDecision canActivateForCondition:]";
                    v25 = "%s #activation NO: Tamale Launch disabled when in eyesfree mode";
                    goto LABEL_216;
                  }
                }
              }
              v87 = (id)*MEMORY[0x1E4F4E360];
              v15 = (void *)v90;
              if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
              {
                SASRequestSourceGetName([v5 requestSource]);
                v88 = (__CFString *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315394;
                v95 = "+[SASActivationDecision canActivateForCondition:]";
                __int16 v96 = 2112;
                v97 = v88;
                _os_log_impl(&dword_1D9588000, v87, OS_LOG_TYPE_DEFAULT, "%s #activation YES: source:%@", buf, 0x16u);
              }
              char v13 = 1;
              goto LABEL_218;
            }
            if ([v7 isConnectedToCarPlay])
            {
              v24 = *MEMORY[0x1E4F4E360];
              char v13 = 0;
              v15 = (void *)v90;
              if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_218;
              }
              *(_DWORD *)buf = 136315138;
              v95 = "+[SASActivationDecision canActivateForCondition:]";
              v25 = "%s #activation NO: active call while connected to CarPlay";
              goto LABEL_216;
            }
            if (([v7 isCallAudioRouteAllowed] & 1) == 0)
            {
              v24 = *MEMORY[0x1E4F4E360];
              char v13 = 0;
              v15 = (void *)v90;
              if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_218;
              }
              *(_DWORD *)buf = 136315138;
              v95 = "+[SASActivationDecision canActivateForCondition:]";
              v25 = "%s #activation NO: call on an unsupported audio route";
              goto LABEL_216;
            }
            int v63 = _os_feature_enabled_impl();
            if (([v7 hasRingingCall] & 1) == 0)
            {
              if (_os_feature_enabled_impl())
              {
                v64 = (id)*MEMORY[0x1E4F4E360];
                if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315138;
                  v95 = "+[SASActivationDecision canActivateForCondition:]";
                  _os_log_impl(&dword_1D9588000, v64, OS_LOG_TYPE_DEFAULT, "%s #activation in-call checks disabled", buf, 0xCu);
                }
              }
              else
              {
                int v72 = [v7 siriInCallEnabled];
                if (((v72 | [v7 callHangUpEnabled] | v63) & 1) == 0)
                {
                  v76 = (void *)*MEMORY[0x1E4F4E360];
                  char v13 = 0;
                  v15 = (void *)v90;
                  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_218;
                  }
                  v77 = (void *)MEMORY[0x1E4F28ED0];
                  v78 = v76;
                  v79 = [v77 numberWithBool:0];
                  v80 = [MEMORY[0x1E4F28ED0] numberWithBool:0];
                  v81 = [MEMORY[0x1E4F28ED0] numberWithBool:0];
                  *(_DWORD *)buf = 136315906;
                  v95 = "+[SASActivationDecision canActivateForCondition:]";
                  __int16 v96 = 2112;
                  v97 = v79;
                  __int16 v98 = 2112;
                  v99 = v80;
                  __int16 v100 = 2112;
                  v101 = v81;
                  _os_log_impl(&dword_1D9588000, v78, OS_LOG_TYPE_DEFAULT, "%s #activation NO: Siri is disabled in connected calls: inCallEnabled: %@, callHangUpEnabled: %@, typeToSiriInCallEnabled: %@", buf, 0x2Au);

                  v14 = v8;
LABEL_217:
                  char v13 = 0;
                  goto LABEL_218;
                }
                if ([v5 requestSource] == 8)
                {
                  BOOL v73 = 1;
                }
                else
                {
                  v82 = [v5 context];
                  v83 = [v82 speechRequestOptions];
                  BOOL v73 = [v83 activationEvent] == 15;
                }
                uint64_t v84 = [v5 requestSource];
                int v85 = [v7 callHangUpEnabled];
                if (v84 == 47) {
                  char v86 = v63;
                }
                else {
                  char v86 = 0;
                }
                if (v85 && !v73 && (v86 & 1) == 0)
                {
                  v24 = *MEMORY[0x1E4F4E360];
                  char v13 = 0;
                  v14 = v8;
                  v15 = (void *)v90;
                  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_218;
                  }
                  *(_DWORD *)buf = 136315138;
                  v95 = "+[SASActivationDecision canActivateForCondition:]";
                  v25 = "%s #activation NO: Siri only supports VT on a connected call for Call Hang Up device";
                  goto LABEL_216;
                }
                if (([v91 understandingOnDeviceAssetsAvailable] & 1) == 0)
                {
                  v14 = v8;
                  v24 = *MEMORY[0x1E4F4E360];
                  char v13 = 0;
                  v15 = (void *)v90;
                  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_218;
                  }
                  *(_DWORD *)buf = 136315138;
                  v95 = "+[SASActivationDecision canActivateForCondition:]";
                  v25 = "%s #activation NO: uod assets unavailable during a voice call";
                  goto LABEL_216;
                }
              }
            }
            if ([v5 isContinuityRequest])
            {
              v65 = [v5 context];
              v66 = [v65 requestInfo];
              uint64_t v67 = [v66 activationEvent];
            }
            else
            {
              uint64_t v67 = 0;
            }
            v68 = [v5 context];
            v69 = [v68 speechRequestOptions];
            uint64_t v70 = [v69 activationEvent];

            if (v70 == 15)
            {
              v71 = @"W2 HS activation event during a call";
            }
            else
            {
              v14 = v8;
              if ([v5 requestSource] == 8)
              {
                v71 = @"Voice Request during a call";
                goto LABEL_154;
              }
              if ([v5 requestSource] == 26)
              {
                v71 = @"triggerless reply to announce call during a call";
                goto LABEL_154;
              }
              if (v67 == 9)
              {
                v71 = @"announce call on headphones request during a call";
              }
              else if (v67 == 10)
              {
                v71 = @"gesture request during a call";
              }
              else if (_os_feature_enabled_impl())
              {
                v71 = @"all invocations allowed during a call";
              }
              else
              {
                if (!v63 || [v5 requestSource] != 47)
                {
                  v24 = *MEMORY[0x1E4F4E360];
                  char v13 = 0;
                  v14 = v8;
                  v15 = (void *)v90;
                  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_218;
                  }
                  *(_DWORD *)buf = 136315138;
                  v95 = "+[SASActivationDecision canActivateForCondition:]";
                  v25 = "%s #activation NO: request type unsupported during a call";
                  goto LABEL_216;
                }
                v71 = @"Type to Siri during a call";
              }
            }
            v14 = v8;
LABEL_154:
            if (canActivateForCondition__once != -1) {
              dispatch_once(&canActivateForCondition__once, &__block_literal_global_20);
            }
            v74 = (id)*MEMORY[0x1E4F4E360];
            if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v95 = "+[SASActivationDecision canActivateForCondition:]";
              __int16 v96 = 2112;
              v97 = v71;
              _os_log_impl(&dword_1D9588000, v74, OS_LOG_TYPE_DEFAULT, "%s #activation continue: %@", buf, 0x16u);
            }

            v75 = (id)canActivateForCondition__log;
            if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v95 = (const char *)v71;
              _os_log_impl(&dword_1D9588000, v75, OS_LOG_TYPE_INFO, "AnnounceTelephony: %@", buf, 0xCu);
            }

            goto LABEL_161;
          }
          v15 = (void *)v90;
          if (v90)
          {
            v51 = +[SASAnalytics analytics];
            [v51 enqueueCurrentAnalyticsEventWithType:1405 context:v90];
          }
          v24 = *MEMORY[0x1E4F4E360];
          char v13 = 0;
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_218;
          }
          *(_DWORD *)buf = 136315138;
          v95 = "+[SASActivationDecision canActivateForCondition:]";
          v25 = "%s #activation NO: Siri is disabled while passcode locked";
LABEL_216:
          _os_log_impl(&dword_1D9588000, v24, OS_LOG_TYPE_DEFAULT, v25, buf, 0xCu);
          goto LABEL_217;
        }
        *(_DWORD *)buf = 136315138;
        v95 = "+[SASActivationDecision canActivateForCondition:]";
        v32 = "%s #activation: Ignoring Smart cover state for connected remote display voice activation";
      }
      else
      {
        int v33 = [v5 isVoiceRequest];
        v24 = *MEMORY[0x1E4F4E360];
        if ((v33 & v12) != 1)
        {
          char v13 = 0;
          v15 = (void *)v90;
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_218;
          }
          *(_DWORD *)buf = 136315138;
          v95 = "+[SASActivationDecision canActivateForCondition:]";
          v25 = "%s #activation NO: Siri is disabled because an iPad Smart Cover is closed which blocks home button or Hey Siri";
          goto LABEL_216;
        }
        v31 = v24;
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_59;
        }
        *(_DWORD *)buf = 136315138;
        v95 = "+[SASActivationDecision canActivateForCondition:]";
        v32 = "%s #activation: Smart Cover is closed, which would normally prevent voice trigger, but the user default to"
              " always allow voice activation is set, so ignoring Smart Cover state";
      }
      _os_log_impl(&dword_1D9588000, v31, OS_LOG_TYPE_DEFAULT, v32, buf, 0xCu);
      goto LABEL_59;
    }
    if ([v5 isRemoteDisplayVoiceRequest])
    {
      v26 = (id)*MEMORY[0x1E4F4E360];
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
LABEL_36:

        v14 = v8;
        goto LABEL_37;
      }
      *(_DWORD *)buf = 136315138;
      v95 = "+[SASActivationDecision canActivateForCondition:]";
      v27 = "%s #activation: Ignoring pocket state for connected remote display voice activation";
    }
    else
    {
      if (!v12)
      {
        v15 = (void *)v90;
        if (v90)
        {
          v42 = +[SASAnalytics analytics];
          [v42 enqueueCurrentAnalyticsEventWithType:1405 context:v90];
        }
        v24 = *MEMORY[0x1E4F4E360];
        char v13 = 0;
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_218;
        }
        *(_DWORD *)buf = 136315138;
        v95 = "+[SASActivationDecision canActivateForCondition:]";
        v25 = "%s #activation NO: Pocket state prevents voice trigger activation";
        goto LABEL_216;
      }
      v26 = (id)*MEMORY[0x1E4F4E360];
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_36;
      }
      *(_DWORD *)buf = 136315138;
      v95 = "+[SASActivationDecision canActivateForCondition:]";
      v27 = "%s #activation: Pocket state would normally prevent voice trigger, but the user default to always allow voic"
            "e activation is set, so ignoring pocket state";
    }
    _os_log_impl(&dword_1D9588000, v26, OS_LOG_TYPE_DEFAULT, v27, buf, 0xCu);
    goto LABEL_36;
  }
  v14 = v8;
  v15 = (void *)v90;
  if (v90)
  {
    v16 = +[SASAnalytics analytics];
    [v16 enqueueCurrentAnalyticsEventWithType:1405 context:v90];
  }
  v17 = (void *)*MEMORY[0x1E4F4E360];
  char v13 = 0;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    v18 = v17;
    v19 = [v7 currentSpokenLanguageCode];
    *(_DWORD *)buf = 136315394;
    v95 = "+[SASActivationDecision canActivateForCondition:]";
    __int16 v96 = 2112;
    v97 = v19;
    v20 = "%s #activation NO: Siri is not supported. Language code: %@";
    v21 = v18;
    uint32_t v22 = 22;
LABEL_12:
    _os_log_impl(&dword_1D9588000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);

    goto LABEL_217;
  }
LABEL_218:

  return v13;
}

+ (BOOL)_shouldSiriActivateForSiriSetupWithSystemState:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 siriIsRestricted])
  {
    id v4 = *MEMORY[0x1E4F4E360];
    BOOL v5 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      uint64_t v9 = "+[SASActivationDecision _shouldSiriActivateForSiriSetupWithSystemState:]";
      int v6 = "%s #activation NO: Siri is restricted by profile.";
LABEL_13:
      _os_log_impl(&dword_1D9588000, v4, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v8, 0xCu);
      BOOL v5 = 0;
    }
  }
  else if ([v3 isInActiveCall])
  {
    id v4 = *MEMORY[0x1E4F4E360];
    BOOL v5 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      uint64_t v9 = "+[SASActivationDecision _shouldSiriActivateForSiriSetupWithSystemState:]";
      int v6 = "%s #activation NO: Siri is in an active call.";
      goto LABEL_13;
    }
  }
  else if ([v3 deviceIsPasscodeLocked])
  {
    id v4 = *MEMORY[0x1E4F4E360];
    BOOL v5 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      uint64_t v9 = "+[SASActivationDecision _shouldSiriActivateForSiriSetupWithSystemState:]";
      int v6 = "%s #activation NO: Siri Setup is disabled while passcode locked";
      goto LABEL_13;
    }
  }
  else
  {
    if (![v3 isAssessmentModeActive])
    {
      BOOL v5 = 1;
      goto LABEL_14;
    }
    id v4 = *MEMORY[0x1E4F4E360];
    BOOL v5 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      uint64_t v9 = "+[SASActivationDecision _shouldSiriActivateForSiriSetupWithSystemState:]";
      int v6 = "%s #activation NO: Siri Setup is disabled while assessment session is active";
      goto LABEL_13;
    }
  }
LABEL_14:

  return v5;
}

uint64_t __49__SASActivationDecision_canActivateForCondition___block_invoke()
{
  canActivateForCondition__log = (uint64_t)os_log_create("com.apple.siri", "AnnounceTelephony");
  return MEMORY[0x1F41817F8]();
}

@end