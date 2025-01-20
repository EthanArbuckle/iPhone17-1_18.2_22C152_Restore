void __MSNMonitorSetMicrophoneState_block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;

  switch(g_microphoneState)
  {
    case 1:
      if (!*(unsigned char *)(a1 + 32)) {
        MSNMonitorStoppingMicrophone();
      }
      break;
    case 2:
      if (*(unsigned char *)(a1 + 32)) {
        MSNMonitorStartingMicrophone();
      }
      break;
    case 3:
      v2 = MSNLog();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
        __MSNMonitorSetMicrophoneState_block_invoke_cold_1();
      }

      return;
  }
  if (*(unsigned char *)(a1 + 32)) {
    v3 = 1;
  }
  else {
    v3 = 2;
  }
  g_microphoneState = v3;
}

void MSNMonitorStartingMicrophone()
{
  v0 = MSNLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1DC736000, v0, OS_LOG_TYPE_INFO, "Starting mic.", v1, 2u);
  }
}

void __MSNMonitorSetCameraState_block_invoke(uint64_t a1)
{
  switch(g_cameraState)
  {
    case 1:
      if (!*(unsigned char *)(a1 + 32)) {
        MSNMonitorStoppingCamera();
      }
      break;
    case 2:
      if (*(unsigned char *)(a1 + 32)) {
        MSNMonitorStartingCamera();
      }
      break;
    case 3:
      v2 = MSNLog();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
        __MSNMonitorSetCameraState_block_invoke_cold_1();
      }

      return;
  }
  if (*(unsigned char *)(a1 + 32)) {
    int v3 = 1;
  }
  else {
    int v3 = 2;
  }
  g_cameraState = v3;
}

void MSNMonitorStartingCamera()
{
  v0 = MSNLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1DC736000, v0, OS_LOG_TYPE_INFO, "Starting cam.", v1, 2u);
  }
}

void MSNMonitorSetMicrophoneState(char a1)
{
  if (MediaSafetyNetIsLocalMonitor())
  {
    if (MediaSafetyNetActive())
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __MSNMonitorSetMicrophoneState_block_invoke;
      block[3] = &__block_descriptor_33_e5_v8__0l;
      char v4 = a1;
      dispatch_sync((dispatch_queue_t)s_mediaSafetyNetQueue, block);
    }
  }
  else
  {
    v2 = MSNLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      MSNMonitorSetCameraState_cold_1();
    }
  }
}

void MSNMonitorSetLastMicrophoneClient(uint64_t a1)
{
  if (MediaSafetyNetIsLocalMonitor())
  {
    if (MediaSafetyNetActive())
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __MSNMonitorSetLastMicrophoneClient_block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      void block[4] = a1;
      dispatch_sync((dispatch_queue_t)s_mediaSafetyNetQueue, block);
    }
  }
  else
  {
    v2 = MSNLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      MSNMonitorSetCameraState_cold_1();
    }
  }
}

void __MSNMonitorSetLastMicrophoneClient_block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    free((void *)g_microphoneClient);
    g_microphoneClient = (uint64_t)strdup(*(const char **)(a1 + 32));
    v2 = MSNLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __MSNMonitorSetLastMicrophoneClient_block_invoke_cold_1(v2);
    }
  }
}

char *__MSNMonitorSetCameraNonStandardCameraClient_block_invoke(uint64_t a1)
{
  free((void *)g_cameraExceptionState);
  result = *(char **)(a1 + 32);
  if (result) {
    result = strdup(result);
  }
  g_cameraExceptionState = (uint64_t)result;
  return result;
}

void __MSNMonitorSetLastCameraClient_block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    free((void *)g_cameraClient);
    g_cameraClient = (uint64_t)strdup(*(const char **)(a1 + 32));
    v2 = MSNLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __MSNMonitorSetLastCameraClient_block_invoke_cold_1(v2);
    }
  }
}

void MSNMonitorSetCameraState(char a1)
{
  if (MediaSafetyNetIsLocalMonitor())
  {
    if (MediaSafetyNetActive())
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __MSNMonitorSetCameraState_block_invoke;
      block[3] = &__block_descriptor_33_e5_v8__0l;
      char v4 = a1;
      dispatch_sync((dispatch_queue_t)s_mediaSafetyNetQueue, block);
    }
  }
  else
  {
    v2 = MSNLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      MSNMonitorSetCameraState_cold_1();
    }
  }
}

void MSNMonitorSetLastCameraClient(uint64_t a1)
{
  if (MediaSafetyNetIsLocalMonitor())
  {
    if (MediaSafetyNetActive())
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __MSNMonitorSetLastCameraClient_block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      void block[4] = a1;
      dispatch_sync((dispatch_queue_t)s_mediaSafetyNetQueue, block);
    }
  }
  else
  {
    v2 = MSNLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      MSNMonitorSetCameraState_cold_1();
    }
  }
}

void MSNMonitorSetCameraNonStandardCameraClient(uint64_t a1)
{
  if (MediaSafetyNetIsLocalMonitor())
  {
    if (MediaSafetyNetActive())
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __MSNMonitorSetCameraNonStandardCameraClient_block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      void block[4] = a1;
      dispatch_sync((dispatch_queue_t)s_mediaSafetyNetQueue, block);
    }
  }
  else
  {
    v2 = MSNLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      MSNMonitorSetCameraState_cold_1();
    }
  }
}

uint64_t MediaSafetyNetIsLocalMonitor()
{
  return (s_mediaSafetyNetQueue != 0) | s_mediaSafetyNetDisabledOnThisHardware & 1u;
}

BOOL MediaSafetyNetActive()
{
  return s_mediaSafetyNetQueue != 0;
}

void MSNValidateState()
{
  v160[7] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E01A2660]();
  if (s_lockPill)
  {
    if ((os_variant_allows_internal_security_policies() & 1) == 0) {
      MSNValidateState_cold_44();
    }
    v1 = MSNLog();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DC736000, v1, OS_LOG_TYPE_INFO, "Overriding pill state. This is not a production configuration.", buf, 2u);
    }
  }
  else if (g_microphoneState == 1)
  {
    v2 = (void *)s_pillDataSource;
    int v3 = [NSString stringWithUTF8String:g_microphoneClient];
    [v2 fetchPillRegistrationForProcess:v3 withCompletion:&__block_literal_global_87];
  }
  else
  {
    g_pillState = 0;
  }
  int v4 = g_microphoneState;
  if (g_uiState) {
    BOOL v5 = g_microphoneState == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5 || g_cameraState == 0 || g_keyboardState == 0)
  {
    v8 = MSNLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = "";
      if (g_production) {
        v10 = "";
      }
      else {
        v10 = "Testing: ";
      }
      if (g_uiState >= 4)
      {
        qword_1EAA9AC80 = (uint64_t)"Unknown state";
        v119 = MSNLog();
        if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
          goto LABEL_282;
        }
        goto LABEL_281;
      }
      if (g_cameraState >= 4)
      {
        qword_1EAA9AC80 = (uint64_t)"Unknown state";
        v119 = MSNLog();
        if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
          goto LABEL_282;
        }
        goto LABEL_281;
      }
      v11 = ":";
      v12 = (const char *)g_cameraClient;
      if (g_cameraClient) {
        v13 = ":";
      }
      else {
        v13 = "";
      }
      if (!g_cameraClient) {
        v12 = "";
      }
      if (g_microphoneState >= 4)
      {
        qword_1EAA9AC80 = (uint64_t)"Unknown state";
        v119 = MSNLog();
        if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
          goto LABEL_282;
        }
        goto LABEL_281;
      }
      if (g_microphoneClient) {
        v9 = (const char *)g_microphoneClient;
      }
      else {
        v11 = "";
      }
      if (g_pillState >= 3)
      {
        qword_1EAA9AC80 = (uint64_t)"Unknown state";
        v119 = MSNLog();
        if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
          goto LABEL_282;
        }
        goto LABEL_281;
      }
      if (g_keyboardState >= 3)
      {
        qword_1EAA9AC80 = (uint64_t)"Unknown state";
        v119 = MSNLog();
        if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
          goto LABEL_282;
        }
        goto LABEL_281;
      }
      v14 = off_1E6CA0390[g_uiState];
      v15 = off_1E6CA03B0[g_cameraState];
      v16 = off_1E6CA03B0[g_microphoneState];
      v17 = off_1E6CA03D0[g_pillState];
      v18 = off_1E6CA0378[g_keyboardState];
      v19 = (const char *)g_cameraExceptionState;
      *(_DWORD *)buf = 136317698;
      if (!g_cameraExceptionState) {
        v19 = "None";
      }
      *(void *)&buf[4] = v10;
      __int16 v135 = 2080;
      v136 = v14;
      __int16 v137 = 2080;
      v138 = v15;
      __int16 v139 = 2080;
      v140 = v13;
      __int16 v141 = 2080;
      v142 = v12;
      __int16 v143 = 2080;
      v144 = v16;
      __int16 v145 = 2080;
      v146 = v11;
      __int16 v147 = 2080;
      v148 = v9;
      __int16 v149 = 2080;
      v150 = v17;
      __int16 v151 = 2080;
      v152 = v18;
      __int16 v153 = 2080;
      v154 = v19;
      _os_log_impl(&dword_1DC736000, v8, OS_LOG_TYPE_INFO, "MediaSafetyNet state: %sUI(%s) Cam(%s%s%s) Mic(%s%s%s) Pill(%s) Kbd(%s) CameraException(%s) unknown.", buf, 0x70u);
    }
    goto LABEL_40;
  }
  BOOL v21 = (g_cameraState & 0xFFFFFFFE) == 2 && (g_microphoneState & 0xFFFFFFFE) == 2;
  if (g_uiState == 3 || v21) {
    goto LABEL_59;
  }
  if (g_microphoneState != 1 && g_cameraState != 1)
  {
    qword_1EAA9AC80 = (uint64_t)"Expected at least one hot sensor.";
    v119 = MSNLog();
    if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
      MSNValidateState_cold_43(v119, v121, v122, v123, v124, v125, v126, v127);
    }
    goto LABEL_282;
  }
  if (g_cameraState == 1)
  {
    if (!HotCameraAllowed())
    {
LABEL_70:
      unsigned int v27 = ++s_inconsistentCount;
      if (MSNValidateState_inconsistencyDuration != -1) {
        ++MSNValidateState_inconsistencyDuration;
      }
      if (v27 >= 0xA)
      {
        if (qword_1EB9F3A10 != -1) {
          dispatch_once(&qword_1EB9F3A10, &__block_literal_global_66);
        }
        int v28 = _MergedGlobals;
        while (2)
        {
          switch(v28)
          {
            case 1:
              v54 = MSNLog();
              if (!os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
                goto LABEL_163;
              }
              v55 = "";
              if (g_production) {
                v56 = "";
              }
              else {
                v56 = "Testing: ";
              }
              if (g_uiState >= 4)
              {
                qword_1EAA9AC80 = (uint64_t)"Unknown state";
                v119 = MSNLog();
                if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_282;
                }
              }
              else if (g_cameraState >= 4)
              {
                qword_1EAA9AC80 = (uint64_t)"Unknown state";
                v119 = MSNLog();
                if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_282;
                }
              }
              else
              {
                v57 = ":";
                v58 = (const char *)g_cameraClient;
                if (g_cameraClient) {
                  v59 = ":";
                }
                else {
                  v59 = "";
                }
                if (!g_cameraClient) {
                  v58 = "";
                }
                if (g_microphoneState >= 4)
                {
                  qword_1EAA9AC80 = (uint64_t)"Unknown state";
                  v119 = MSNLog();
                  if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_282;
                  }
                }
                else
                {
                  if (g_microphoneClient) {
                    v55 = (const char *)g_microphoneClient;
                  }
                  else {
                    v57 = "";
                  }
                  if (g_pillState >= 3)
                  {
                    qword_1EAA9AC80 = (uint64_t)"Unknown state";
                    v119 = MSNLog();
                    if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_282;
                    }
                  }
                  else
                  {
                    if (g_keyboardState < 3)
                    {
                      v60 = off_1E6CA0390[g_uiState];
                      v61 = off_1E6CA03B0[g_cameraState];
                      v62 = off_1E6CA03B0[g_microphoneState];
                      v63 = off_1E6CA03D0[g_pillState];
                      v64 = off_1E6CA0378[g_keyboardState];
                      v65 = (const char *)g_cameraExceptionState;
                      *(_DWORD *)buf = 136317698;
                      if (!g_cameraExceptionState) {
                        v65 = "None";
                      }
                      goto LABEL_260;
                    }
                    qword_1EAA9AC80 = (uint64_t)"Unknown state";
                    v119 = MSNLog();
                    if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_282;
                    }
                  }
                }
              }
              goto LABEL_281;
            case 2:
              if (MSNStateFailureWithMode_once != -1) {
                dispatch_once(&MSNStateFailureWithMode_once, &__block_literal_global_120);
              }
              v54 = MSNLog();
              if (!os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
                goto LABEL_163;
              }
              v55 = "";
              if (g_production) {
                v56 = "";
              }
              else {
                v56 = "Testing: ";
              }
              if (g_uiState >= 4)
              {
                qword_1EAA9AC80 = (uint64_t)"Unknown state";
                v119 = MSNLog();
                if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_282;
                }
              }
              else if (g_cameraState >= 4)
              {
                qword_1EAA9AC80 = (uint64_t)"Unknown state";
                v119 = MSNLog();
                if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_282;
                }
              }
              else
              {
                v57 = ":";
                v58 = (const char *)g_cameraClient;
                if (g_cameraClient) {
                  v59 = ":";
                }
                else {
                  v59 = "";
                }
                if (!g_cameraClient) {
                  v58 = "";
                }
                if (g_microphoneState >= 4)
                {
                  qword_1EAA9AC80 = (uint64_t)"Unknown state";
                  v119 = MSNLog();
                  if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_282;
                  }
                }
                else
                {
                  if (g_microphoneClient) {
                    v55 = (const char *)g_microphoneClient;
                  }
                  else {
                    v57 = "";
                  }
                  if (g_pillState >= 3)
                  {
                    qword_1EAA9AC80 = (uint64_t)"Unknown state";
                    v119 = MSNLog();
                    if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_282;
                    }
                  }
                  else
                  {
                    if (g_keyboardState < 3)
                    {
                      v60 = off_1E6CA0390[g_uiState];
                      v61 = off_1E6CA03B0[g_cameraState];
                      v62 = off_1E6CA03B0[g_microphoneState];
                      v63 = off_1E6CA03D0[g_pillState];
                      v64 = off_1E6CA0378[g_keyboardState];
                      v65 = (const char *)g_cameraExceptionState;
                      *(_DWORD *)buf = 136317698;
                      if (!g_cameraExceptionState) {
                        v65 = "None";
                      }
LABEL_260:
                      *(void *)&buf[4] = v56;
                      __int16 v135 = 2080;
                      v136 = v60;
                      __int16 v137 = 2080;
                      v138 = v61;
                      __int16 v139 = 2080;
                      v140 = v59;
                      __int16 v141 = 2080;
                      v142 = v58;
                      __int16 v143 = 2080;
                      v144 = v62;
                      __int16 v145 = 2080;
                      v146 = v57;
                      __int16 v147 = 2080;
                      v148 = v55;
                      __int16 v149 = 2080;
                      v150 = v63;
                      __int16 v151 = 2080;
                      v152 = v64;
                      __int16 v153 = 2080;
                      v154 = v65;
                      _os_log_error_impl(&dword_1DC736000, v54, OS_LOG_TYPE_ERROR, "MediaSafetyNet failure with states: %sUI(%s) Cam(%s%s%s) Mic(%s%s%s) Pill(%s) Kbd(%s) CameraException(%s)", buf, 0x70u);
LABEL_163:

LABEL_164:
                      int v24 = 1;
                      v25 = &s_inconsistentCount;
                      goto LABEL_64;
                    }
                    qword_1EAA9AC80 = (uint64_t)"Unknown state";
                    v119 = MSNLog();
                    if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_282;
                    }
                  }
                }
              }
              goto LABEL_281;
            case 3:
              if (!g_production) {
                goto LABEL_178;
              }
              v159[0] = @"Mic";
              if (g_microphoneState >= 4)
              {
                qword_1EAA9AC80 = (uint64_t)"Unknown state";
                v119 = MSNLog();
                if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_282;
                }
              }
              else
              {
                uint64_t v66 = [NSString stringWithUTF8String:off_1E6CA03B0[g_microphoneState]];
                v160[0] = v66;
                v159[1] = @"Cam";
                if (g_cameraState >= 4)
                {
                  qword_1EAA9AC80 = (uint64_t)"Unknown state";
                  v119 = MSNLog();
                  if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_282;
                  }
                }
                else
                {
                  v67 = (void *)v66;
                  uint64_t v68 = [NSString stringWithUTF8String:off_1E6CA03B0[g_cameraState]];
                  v160[1] = v68;
                  v159[2] = @"MicClient";
                  if (g_microphoneClient) {
                    v69 = (const char *)g_microphoneClient;
                  }
                  else {
                    v69 = "None";
                  }
                  v70 = [NSString stringWithUTF8String:v69];
                  v160[2] = v70;
                  v159[3] = @"CamClient";
                  if (g_cameraClient) {
                    v71 = (const char *)g_cameraClient;
                  }
                  else {
                    v71 = "None";
                  }
                  uint64_t v72 = [NSString stringWithUTF8String:v71];
                  v160[3] = v72;
                  v159[4] = @"Pill";
                  if (g_pillState >= 3)
                  {
                    qword_1EAA9AC80 = (uint64_t)"Unknown state";
                    v119 = MSNLog();
                    if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_282;
                    }
                  }
                  else
                  {
                    v73 = (void *)v72;
                    uint64_t v74 = [NSString stringWithUTF8String:off_1E6CA03D0[g_pillState]];
                    v160[4] = v74;
                    v159[5] = @"UI";
                    if (g_uiState >= 4)
                    {
                      qword_1EAA9AC80 = (uint64_t)"Unknown state";
                      v119 = MSNLog();
                      if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_282;
                      }
                    }
                    else
                    {
                      v75 = (void *)v74;
                      v131 = (void *)v68;
                      v133 = v67;
                      uint64_t v76 = [NSString stringWithUTF8String:off_1E6CA0390[g_uiState]];
                      v160[5] = v76;
                      v159[6] = @"Kbd";
                      if (g_keyboardState >= 3)
                      {
                        qword_1EAA9AC80 = (uint64_t)"Unknown state";
                        v119 = MSNLog();
                        if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
                          goto LABEL_282;
                        }
                      }
                      else
                      {
                        v77 = (void *)v76;
                        v78 = [NSString stringWithUTF8String:off_1E6CA0378[g_keyboardState]];
                        v160[6] = v78;
                        v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v160 forKeys:v159 count:7];
                        AnalyticsSendEvent();

LABEL_178:
                        v80 = MSNLog();
                        if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
                        {
                          v81 = "";
                          if (g_production) {
                            v82 = "";
                          }
                          else {
                            v82 = "Testing: ";
                          }
                          if (g_uiState >= 4)
                          {
                            qword_1EAA9AC80 = (uint64_t)"Unknown state";
                            v119 = MSNLog();
                            if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
                              goto LABEL_282;
                            }
                            goto LABEL_281;
                          }
                          if (g_cameraState >= 4)
                          {
                            qword_1EAA9AC80 = (uint64_t)"Unknown state";
                            v119 = MSNLog();
                            if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
                              goto LABEL_282;
                            }
                            goto LABEL_281;
                          }
                          v83 = ":";
                          v84 = (const char *)g_cameraClient;
                          if (g_cameraClient) {
                            v85 = ":";
                          }
                          else {
                            v85 = "";
                          }
                          if (!g_cameraClient) {
                            v84 = "";
                          }
                          if (g_microphoneState >= 4)
                          {
                            qword_1EAA9AC80 = (uint64_t)"Unknown state";
                            v119 = MSNLog();
                            if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
                              goto LABEL_282;
                            }
                            goto LABEL_281;
                          }
                          if (g_microphoneClient) {
                            v81 = (const char *)g_microphoneClient;
                          }
                          else {
                            v83 = "";
                          }
                          if (g_pillState >= 3)
                          {
                            qword_1EAA9AC80 = (uint64_t)"Unknown state";
                            v119 = MSNLog();
                            if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
                              goto LABEL_282;
                            }
                            goto LABEL_281;
                          }
                          if (g_keyboardState >= 3)
                          {
                            qword_1EAA9AC80 = (uint64_t)"Unknown state";
                            v119 = MSNLog();
                            if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
                              goto LABEL_282;
                            }
                            goto LABEL_281;
                          }
                          v86 = off_1E6CA0390[g_uiState];
                          v87 = off_1E6CA03B0[g_cameraState];
                          v88 = off_1E6CA03B0[g_microphoneState];
                          v89 = off_1E6CA03D0[g_pillState];
                          v90 = off_1E6CA0378[g_keyboardState];
                          v91 = (const char *)g_cameraExceptionState;
                          *(_DWORD *)buf = 136317698;
                          if (!g_cameraExceptionState) {
                            v91 = "None";
                          }
                          *(void *)&buf[4] = v82;
                          __int16 v135 = 2080;
                          v136 = v86;
                          __int16 v137 = 2080;
                          v138 = v87;
                          __int16 v139 = 2080;
                          v140 = v85;
                          __int16 v141 = 2080;
                          v142 = v84;
                          __int16 v143 = 2080;
                          v144 = v88;
                          __int16 v145 = 2080;
                          v146 = v83;
                          __int16 v147 = 2080;
                          v148 = v81;
                          __int16 v149 = 2080;
                          v150 = v89;
                          __int16 v151 = 2080;
                          v152 = v90;
                          __int16 v153 = 2080;
                          v154 = v91;
                          _os_log_error_impl(&dword_1DC736000, v80, OS_LOG_TYPE_ERROR, "MediaSafetyNet failure with states: %sUI(%s) Cam(%s%s%s) Mic(%s%s%s) Pill(%s) Kbd(%s) CameraException(%s)", buf, 0x70u);
                        }

                        *(void *)buf = 0;
                        if (g_production) {
                          v92 = "";
                        }
                        else {
                          v92 = "Testing: ";
                        }
                        if (g_uiState >= 4)
                        {
                          qword_1EAA9AC80 = (uint64_t)"Unknown state";
                          v119 = MSNLog();
                          if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
                            goto LABEL_282;
                          }
                        }
                        else if (g_cameraState >= 4)
                        {
                          qword_1EAA9AC80 = (uint64_t)"Unknown state";
                          v119 = MSNLog();
                          if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
                            goto LABEL_282;
                          }
                        }
                        else
                        {
                          v93 = (const char *)g_cameraClient;
                          if (g_cameraClient) {
                            v94 = ":";
                          }
                          else {
                            v94 = "";
                          }
                          if (!g_cameraClient) {
                            v93 = "";
                          }
                          if (g_microphoneState >= 4)
                          {
                            qword_1EAA9AC80 = (uint64_t)"Unknown state";
                            v119 = MSNLog();
                            if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
                              goto LABEL_282;
                            }
                          }
                          else
                          {
                            v95 = (const char *)g_microphoneClient;
                            if (g_microphoneClient) {
                              v96 = ":";
                            }
                            else {
                              v96 = "";
                            }
                            if (!g_microphoneClient) {
                              v95 = "";
                            }
                            if (g_pillState >= 3)
                            {
                              qword_1EAA9AC80 = (uint64_t)"Unknown state";
                              v119 = MSNLog();
                              if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
                                goto LABEL_282;
                              }
                            }
                            else if (g_keyboardState >= 3)
                            {
                              qword_1EAA9AC80 = (uint64_t)"Unknown state";
                              v119 = MSNLog();
                              if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
                                goto LABEL_282;
                              }
                            }
                            else
                            {
                              v97 = (const char *)g_cameraExceptionState;
                              if (!g_cameraExceptionState) {
                                v97 = "None";
                              }
                              if (asprintf((char **)buf, "MediaSafetyNet failure with states: %sUI(%s) Cam(%s%s%s) Mic(%s%s%s) Pill(%s) Kbd(%s) CameraException(%s)", v92, off_1E6CA0390[g_uiState], off_1E6CA03B0[g_cameraState], v94, v93, off_1E6CA03B0[g_microphoneState], v96, v95, off_1E6CA03D0[g_pillState], off_1E6CA0378[g_keyboardState], v97) < 0)*(void *)buf = 0; {
                              if (g_production)
                              }
                                v98 = "";
                              else {
                                v98 = "Testing: ";
                              }
                              if (g_uiState >= 4)
                              {
                                qword_1EAA9AC80 = (uint64_t)"Unknown state";
                                v119 = MSNLog();
                                if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
                                  goto LABEL_282;
                                }
                              }
                              else if (g_cameraState >= 4)
                              {
                                qword_1EAA9AC80 = (uint64_t)"Unknown state";
                                v119 = MSNLog();
                                if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
                                  goto LABEL_282;
                                }
                              }
                              else
                              {
                                v99 = (const char *)g_cameraClient;
                                if (g_cameraClient) {
                                  v100 = ":";
                                }
                                else {
                                  v100 = "";
                                }
                                if (!g_cameraClient) {
                                  v99 = "";
                                }
                                if (g_microphoneState >= 4)
                                {
                                  qword_1EAA9AC80 = (uint64_t)"Unknown state";
                                  v119 = MSNLog();
                                  if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
                                    goto LABEL_282;
                                  }
                                }
                                else
                                {
                                  v101 = (const char *)g_microphoneClient;
                                  if (g_microphoneClient) {
                                    v102 = ":";
                                  }
                                  else {
                                    v102 = "";
                                  }
                                  if (!g_microphoneClient) {
                                    v101 = "";
                                  }
                                  if (g_pillState >= 3)
                                  {
                                    qword_1EAA9AC80 = (uint64_t)"Unknown state";
                                    v119 = MSNLog();
                                    if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
                                      goto LABEL_282;
                                    }
                                  }
                                  else
                                  {
                                    if (g_keyboardState < 3)
                                    {
                                      v103 = (const char *)g_cameraExceptionState;
                                      if (!g_cameraExceptionState) {
                                        v103 = "None";
                                      }
                                      v104 = objc_msgSend(NSString, "stringWithFormat:", @"MediaSafetyNet: %sUI(%s) Cam(%s%s%s) Mic(%s%s%s) Pill(%s) Kbd(%s) CameraException(%s)", v98, off_1E6CA0390[g_uiState], off_1E6CA03B0[g_cameraState], v100, v99, off_1E6CA03B0[g_microphoneState], v102, v101, off_1E6CA03D0[g_pillState], off_1E6CA0378[g_keyboardState], v103);
                                      CFPreferencesSetAppValue(@"MediaSafetyNetWaitingTTR", v104, @"com.apple.mediaserverd");

                                      v105 = [MEMORY[0x1E4F1C9C8] date];
                                      CFPreferencesSetAppValue(@"MediaSafetyNetWaitingTTRDate", v105, @"com.apple.mediaserverd");

                                      CFPreferencesAppSynchronize(@"com.apple.mediaserverd");
                                      qword_1EAA9AC80 = *(void *)buf;
                                      v119 = MSNLog();
                                      if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
                                        MSNValidateState_cold_17((uint64_t)buf, v119, v106, v107, v108, v109, v110, v111);
                                      }
LABEL_282:

                                      abort();
                                    }
                                    qword_1EAA9AC80 = (uint64_t)"Unknown state";
                                    v119 = MSNLog();
                                    if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
                                      goto LABEL_282;
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
LABEL_281:
              __MSNMonitorStartServerMode_block_invoke_cold_1(v119, v112, v113, v114, v115, v116, v117, v118);
              goto LABEL_282;
            case 4:
              int v29 = os_variant_allows_internal_security_policies();
              int v30 = g_microphoneState;
              v31 = (const char *)g_microphoneClient;
              BOOL v39 = g_microphoneState == 1
                 && g_microphoneClient != 0
                 && strcmp((const char *)g_microphoneClient, "corespeechd") == 0;
              BOOL v40 = v30 != 1 || g_pillState == 2;
              if (!v40 && !strcmp(v31, "callservicesd"))
              {
                int v28 = 3;
              }
              else if (g_cameraState == 1)
              {
                if (!strcmp((const char *)g_cameraClient, "com.apple.callservicesd")) {
                  int v28 = 3;
                }
                else {
                  int v28 = 2;
                }
              }
              else
              {
                int v28 = 2;
              }
              if (!(v29 ^ 1 | v39)) {
                int v28 = 3;
              }
              continue;
            case 5:
              if (g_cameraState == 1)
              {
                int v33 = 0;
                if ((HotCameraAllowed() & 1) == 0 && g_cameraClient)
                {
                  if (MSNStateFailureWithMode_onceToken != -1) {
                    dispatch_once(&MSNStateFailureWithMode_onceToken, &__block_literal_global_159);
                  }
                  v34 = (void *)MSNStateFailureWithMode_terminatingProcesses;
                  v35 = [NSString stringWithUTF8String:g_cameraClient];
                  int v33 = [v34 containsObject:v35];
                }
              }
              else
              {
                int v33 = 0;
              }
              if ((v33 & 1) != 0 || g_microphoneState != 1)
              {
                int v28 = 2;
                if (!v33) {
                  continue;
                }
LABEL_99:
                int v28 = 3;
                continue;
              }
              char v36 = HotMicAllowed();
              int v28 = 2;
              if ((v36 & 1) == 0 && g_microphoneClient)
              {
                if (MSNStateFailureWithMode_onceToken_168 != -1) {
                  dispatch_once(&MSNStateFailureWithMode_onceToken_168, &__block_literal_global_170);
                }
                uint64_t v37 = MSNStateFailureWithMode_terminatingProcesses_167;
                v38 = [NSString stringWithUTF8String:g_microphoneClient];
                LOBYTE(v37) = [(id)v37 containsObject:v38];

                int v28 = 2;
                if (v37) {
                  goto LABEL_99;
                }
              }
              continue;
            default:
              goto LABEL_164;
          }
        }
      }
      if (!v27)
      {
        int v24 = 1;
        goto LABEL_65;
      }
      v8 = MSNLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        if (g_production) {
          v41 = "";
        }
        else {
          v41 = "Testing: ";
        }
        if (g_uiState >= 4)
        {
          qword_1EAA9AC80 = (uint64_t)"Unknown state";
          v119 = MSNLog();
          if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
            goto LABEL_282;
          }
          goto LABEL_281;
        }
        if (g_cameraState >= 4)
        {
          qword_1EAA9AC80 = (uint64_t)"Unknown state";
          v119 = MSNLog();
          if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
            goto LABEL_282;
          }
          goto LABEL_281;
        }
        if (g_cameraClient) {
          v42 = ":";
        }
        else {
          v42 = "";
        }
        if (g_cameraClient) {
          v43 = (const char *)g_cameraClient;
        }
        else {
          v43 = "";
        }
        if (g_microphoneState >= 4)
        {
          qword_1EAA9AC80 = (uint64_t)"Unknown state";
          v119 = MSNLog();
          if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
            goto LABEL_282;
          }
          goto LABEL_281;
        }
        if (g_microphoneClient) {
          v44 = ":";
        }
        else {
          v44 = "";
        }
        if (g_microphoneClient) {
          v45 = (const char *)g_microphoneClient;
        }
        else {
          v45 = "";
        }
        if (g_pillState >= 3)
        {
          qword_1EAA9AC80 = (uint64_t)"Unknown state";
          v119 = MSNLog();
          if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
            goto LABEL_282;
          }
          goto LABEL_281;
        }
        v128 = v44;
        v129 = v45;
        v130 = v42;
        v132 = v43;
        if (g_keyboardState >= 3)
        {
          qword_1EAA9AC80 = (uint64_t)"Unknown state";
          v119 = MSNLog();
          if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
            goto LABEL_282;
          }
          goto LABEL_281;
        }
        v46 = v41;
        v47 = off_1E6CA0390[g_uiState];
        v48 = off_1E6CA03B0[g_cameraState];
        v49 = off_1E6CA03B0[g_microphoneState];
        v50 = off_1E6CA03D0[g_pillState];
        v51 = off_1E6CA0378[g_keyboardState];
        if (g_cameraExceptionState) {
          v52 = (const char *)g_cameraExceptionState;
        }
        else {
          v52 = "None";
        }
        v53 = ConsistencyDescription(1);
        *(_DWORD *)buf = 136318210;
        *(void *)&buf[4] = v46;
        __int16 v135 = 2080;
        v136 = v47;
        __int16 v137 = 2080;
        v138 = v48;
        __int16 v139 = 2080;
        v140 = v130;
        __int16 v141 = 2080;
        v142 = v132;
        __int16 v143 = 2080;
        v144 = v49;
        __int16 v145 = 2080;
        v146 = v128;
        __int16 v147 = 2080;
        v148 = v129;
        __int16 v149 = 2080;
        v150 = v50;
        __int16 v151 = 2080;
        v152 = v51;
        __int16 v153 = 2080;
        v154 = v52;
        __int16 v155 = 2080;
        v156 = v53;
        __int16 v157 = 1024;
        int v158 = s_inconsistentCount;
        _os_log_error_impl(&dword_1DC736000, v8, OS_LOG_TYPE_ERROR, "MediaSafetyNet temporarily inconsistent state: %sUI(%s) Cam(%s%s%s) Mic(%s%s%s) Pill(%s) Kbd(%s) CameraException(%s) consistency: %s inconsistentCount: %i", buf, 0x80u);
      }
LABEL_40:

      goto LABEL_69;
    }
    int v4 = g_microphoneState;
  }
  if (v4 == 1 && (HotMicAllowed() & 1) == 0) {
    goto LABEL_70;
  }
LABEL_59:
  if (MSNValidateState_inconsistencyDuration)
  {
    v23 = MSNLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = MSNValidateState_inconsistencyDuration;
      _os_log_impl(&dword_1DC736000, v23, OS_LOG_TYPE_INFO, "MediaSafetyNet inconsistency ended after: %u", buf, 8u);
    }
  }
  s_inconsistentCount = 0;
  int v24 = 2;
  v25 = &MSNValidateState_inconsistencyDuration;
LABEL_64:
  int *v25 = 0;
LABEL_65:
  if (MSNPeriodicLog_once != -1) {
    dispatch_once(&MSNPeriodicLog_once, &__block_literal_global_177);
  }
  v26 = (void *)MSNPeriodicLog_log;
  if (os_log_type_enabled((os_log_t)MSNPeriodicLog_log, OS_LOG_TYPE_DEBUG)) {
    MSNValidateState_cold_6(v26, v24);
  }
LABEL_69:
}

void __MSNMonitorStartServerMode_block_invoke_15(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  int v4 = s_mediaSafetyNetQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __MSNMonitorStartServerMode_block_invoke_2;
  block[3] = &unk_1E6CA01D0;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

void __MSNMonitorStartServerMode_block_invoke_2(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 32);
  if (!v1)
  {
    g_uiState = 3;
    return;
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v2 = [v1 elements];
  id v3 = (void *)[v2 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (!v3)
  {

    int v4 = 0;
    id v5 = 0;
    goto LABEL_29;
  }
  int v4 = 0;
  char v36 = 0;
  id v5 = 0;
  uint64_t v6 = *(void *)v39;
  uint64_t v7 = *MEMORY[0x1E4FA6F40];
  uint64_t v35 = *MEMORY[0x1E4F625B0];
  id obj = v2;
  do
  {
    for (i = 0; i != v3; i = (char *)i + 1)
    {
      if (*(void *)v39 != v6) {
        objc_enumerationMutation(obj);
      }
      v9 = *(void **)(*((void *)&v38 + 1) + 8 * i);
      v10 = [v9 identifier];
      char v11 = [v10 isEqualToString:v7];

      if (v11)
      {
        v12 = v5;
        v13 = v4;
        id v5 = v9;
LABEL_15:
        id v17 = v9;

        int v4 = v13;
        continue;
      }
      v14 = [v9 identifier];
      char v15 = [v14 isEqualToString:v35];

      if (v15)
      {
        v12 = v36;
        v13 = v4;
        char v36 = v9;
        goto LABEL_15;
      }
      if (!v4)
      {
        v12 = 0;
        v13 = v9;
        goto LABEL_15;
      }
      uint64_t v16 = [v9 level];
      v12 = v4;
      v13 = v9;
      if (v16 > [v4 level]) {
        goto LABEL_15;
      }
    }
    id v3 = (void *)[obj countByEnumeratingWithState:&v38 objects:v44 count:16];
  }
  while (v3);

  id v3 = v36;
  if (v36 || !v5)
  {
    if (v36)
    {
      if (!v4 || (uint64_t v19 = [v36 level], v19 > objc_msgSend(v4, "level")))
      {
        int v20 = 1;
        goto LABEL_32;
      }
    }
    goto LABEL_29;
  }
  if (!v4)
  {
    id v3 = 0;
    goto LABEL_31;
  }
  uint64_t v18 = [v5 level];
  id v3 = 0;
  if (v18 <= [v4 level])
  {
LABEL_29:
    int v20 = 3;
    goto LABEL_32;
  }
LABEL_31:
  int v20 = 2;
LABEL_32:
  g_uiState = v20;
  BOOL v21 = MSNLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    if (g_uiState >= 4)
    {
      qword_1EAA9AC80 = (uint64_t)"Unknown state";
      unsigned int v27 = MSNLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        __MSNMonitorStartServerMode_block_invoke_cold_1(v27, v28, v29, v30, v31, v32, v33, v34);
      }

      abort();
    }
    v22 = off_1E6CA0390[g_uiState];
    *(_DWORD *)buf = 136315138;
    v43 = v22;
    _os_log_impl(&dword_1DC736000, v21, OS_LOG_TYPE_INFO, "Updated view state: %s", buf, 0xCu);
  }

  if (g_uiState == 2)
  {
    if (s_pillDataSource_block_invoke_once != -1) {
      dispatch_once(&s_pillDataSource_block_invoke_once, &__block_literal_global_21);
    }
    v23 = +[MSNTTR sharedInstance];
    int v24 = [v23 pendedTTR];

    if (v24)
    {
      v25 = MSNLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DC736000, v25, OS_LOG_TYPE_INFO, "Home, continuing TTR.", buf, 2u);
      }

      v26 = +[MSNTTR sharedInstance];
      [v26 continueTTR];
    }
  }
}

id MSNLog()
{
  if (MSNLog_once != -1) {
    dispatch_once(&MSNLog_once, &__block_literal_global);
  }
  v0 = (void *)MSNLog_log;

  return v0;
}

void MSNMonitorSetXCTestExceptionState(int a1)
{
  if (a1) {
    MSNMonitorSetCameraNonStandardCameraClient((uint64_t)"xctest");
  }
  else {
    MSNMonitorSetCameraNonStandardCameraClient(0);
  }
}

void MSNMonitorBeginException(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1E01A2660]();
  [NSString stringWithUTF8String:a1];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v10 = long long v15 = 0u;
  v2 = +[MSNScopedExceptionsServer proxiesForException:](MSNScopedExceptionsServer, "proxiesForException:");
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v12 + 1) + 8 * v6);
        v8 = MSNLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v17 = a1;
          __int16 v18 = 2112;
          uint64_t v19 = v7;
          _os_log_debug_impl(&dword_1DC736000, v8, OS_LOG_TYPE_DEBUG, "Begin exception %s with proxy %@", buf, 0x16u);
        }

        v9 = [NSString stringWithUTF8String:a1];
        [v7 beginException:v9];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v20 count:16];
    }
    while (v4);
  }
}

void MSNMonitorEndException(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1E01A2660]();
  [NSString stringWithUTF8String:a1];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v10 = long long v15 = 0u;
  v2 = +[MSNScopedExceptionsServer proxiesForException:](MSNScopedExceptionsServer, "proxiesForException:");
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v12 + 1) + 8 * v6);
        v8 = MSNLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v17 = a1;
          __int16 v18 = 2112;
          uint64_t v19 = v7;
          _os_log_debug_impl(&dword_1DC736000, v8, OS_LOG_TYPE_DEBUG, "End exception %s with proxy %@", buf, 0x16u);
        }

        v9 = [NSString stringWithUTF8String:a1];
        [v7 endException:v9];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v20 count:16];
    }
    while (v4);
  }
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1DC73A1F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  _Block_object_dispose((const void *)(v15 - 80), 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DC73A948(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

void __getSTDynamicActivityAttributionMonitorClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("STDynamicActivityAttributionMonitor");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSTDynamicActivityAttributionMonitorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getSTDynamicActivityAttributionMonitorClass_block_invoke_cold_1();
    SystemStatusLibrary();
  }
}

void SystemStatusLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!SystemStatusLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __SystemStatusLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E6CA0290;
    uint64_t v3 = 0;
    SystemStatusLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!SystemStatusLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __SystemStatusLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SystemStatusLibraryCore_frameworkLibrary = result;
  return result;
}

MSNPillDataSourceController *__getSTCallingStatusDomainClass_block_invoke(uint64_t a1)
{
  SystemStatusLibrary();
  uint64_t result = (MSNPillDataSourceController *)objc_getClass("STCallingStatusDomain");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSTCallingStatusDomainClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (MSNPillDataSourceController *)__getSTCallingStatusDomainClass_block_invoke_cold_1();
    return [(MSNPillDataSourceController *)v3 initWithQueue:v5];
  }
  return result;
}

void sub_1DC73B3D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __MSNLog_block_invoke()
{
  MSNLog_log = (uint64_t)os_log_create("com.apple.MediaSafetyNet", "state");

  return MEMORY[0x1F41817F8]();
}

void MSNMonitorStoppingCamera()
{
  v0 = MSNLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1DC736000, v0, OS_LOG_TYPE_INFO, "Stopping cam.", v1, 2u);
  }
}

void MSNMonitorStoppingMicrophone()
{
  v0 = MSNLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1DC736000, v0, OS_LOG_TYPE_INFO, "Stopping mic.", v1, 2u);
  }
}

void MSNMonitorStart()
{
  if (!_os_feature_enabled_impl() || (_os_feature_enabled_impl() & 1) == 0)
  {
    if ((_os_feature_enabled_impl() & 1) != 0 || (int v0 = _os_feature_enabled_impl()) != 0)
    {
      if (_os_feature_enabled_impl())
      {
        int v0 = 2;
      }
      else
      {
        if ((_os_feature_enabled_impl() & 1) == 0)
        {
          qword_1EAA9AC80 = (uint64_t)"Not reachable";
          v1 = MSNLog();
          if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
            MSNMonitorStart_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
          }

          abort();
        }
        int v0 = 1;
      }
    }
    MSNMonitorStartServerMode(v0);
  }
}

void MSNMonitorStartServerMode(int a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E01A2660]();
  g_serverMode = a1;
  uint64_t v3 = MSNLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    MSNMonitorStartServerMode_cold_7(v3);
  }

  if (s_mediaSafetyNetQueue) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = s_mediaSafetyNetDisabledOnThisHardware == 0;
  }
  if (!v4)
  {
    uint64_t v5 = MSNLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DC736000, v5, OS_LOG_TYPE_INFO, "MediaSafetyNet already initialized.", buf, 2u);
    }
    goto LABEL_48;
  }
  if (os_variant_has_factory_content())
  {
    uint64_t v6 = MSNLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      uint64_t v7 = "Not using MediaSafetyNet on NonUI.";
LABEL_51:
      _os_log_impl(&dword_1DC736000, v6, OS_LOG_TYPE_INFO, v7, buf, 2u);
    }
  }
  else
  {
    uint64_t v8 = (void *)MGCopyAnswer();
    int v9 = [v8 intValue];
    if (v8) {
      CFRelease(v8);
    }
    if (v9 == 1) {
      goto LABEL_19;
    }
    if (v9 != 2)
    {
      uint64_t v6 = MSNLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        uint64_t v7 = "Not using MediaSafetyNet on devices of this type (not an iPhone/iPod).";
        goto LABEL_51;
      }
      goto LABEL_52;
    }
    if (MGGetProductType() != 3460419847)
    {
LABEL_19:
      v10 = MSNLog();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);

      if (v11)
      {
        long long v12 = MSNLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          MSNMonitorStartServerMode_cold_6(v12);
        }
      }
      int out_token = 0;
      notify_register_check("com.apple.MediaSafetyNet.connectionrequest", &out_token);
      notify_set_state(out_token, 1uLL);
      notify_post("com.apple.MediaSafetyNet.connectionrequest");
      dispatch_queue_t v13 = dispatch_queue_create("MediaSafetyNet", 0);
      long long v14 = (void *)s_mediaSafetyNetQueue;
      s_mediaSafetyNetQueue = (uint64_t)v13;

      if (s_mediaSafetyNetQueue)
      {
        g_uiState = 0;
        if (a1 == 1) {
          int v15 = 3;
        }
        else {
          int v15 = 2;
        }
        g_cameraState = v15;
        if (a1 == 2) {
          int v16 = 3;
        }
        else {
          int v16 = 2;
        }
        g_microphoneState = v16;
        g_pillState = 0;
        g_keyboardState = 0;
        int v51 = -1;
        if (!notify_register_dispatch("com.apple.keyboard.isOnScreen", &v51, (dispatch_queue_t)s_mediaSafetyNetQueue, &__block_literal_global_13))__MSNMonitorStartServerMode_block_invoke(0, v51); {
        uint64_t v5 = [MEMORY[0x1E4F62958] configurationForDefaultMainDisplayMonitor];
        }
        [v5 setNeedsUserInteractivePriority:1];
        [v5 setTransitionHandler:&__block_literal_global_18];
        uint64_t v17 = [MEMORY[0x1E4F62940] monitorWithConfiguration:v5];
        __int16 v18 = (void *)s_monitor;
        s_monitor = v17;

        if (g_serverMode <= 1)
        {
          uint64_t v19 = objc_opt_new();
          int v20 = (void *)s_carplay;
          s_carplay = v19;
        }
        uint64_t v21 = [MSNScopedExceptionsServer alloc];
        uint64_t v22 = [(MSNScopedExceptionsServer *)v21 initWithQueue:s_mediaSafetyNetQueue];
        v23 = (void *)s_exceptions;
        s_exceptions = v22;

        int v24 = [MSNPillDataSourceServer alloc];
        uint64_t v25 = [(MSNPillDataSourceServer *)v24 initWithQueue:s_mediaSafetyNetQueue];
        v26 = (void *)s_pillDataSource;
        s_pillDataSource = v25;

        if (os_variant_allows_internal_security_policies())
        {
          *(void *)buf = 0;
          if (g_microphoneState != 3)
          {
            unsigned int v27 = MSNLog();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              LOWORD(token[0]) = 0;
              _os_log_impl(&dword_1DC736000, v27, OS_LOG_TYPE_INFO, "Installing internal microphone override", (uint8_t *)token, 2u);
            }

            token[0] = -1;
            if (notify_register_dispatch("com.apple.mediasafetynet.simulate_microphone", token, (dispatch_queue_t)s_mediaSafetyNetQueue, &__block_literal_global_36))
            {
              MSNMonitorStartServerMode_cold_5();
            }
            notify_get_state(token[0], (uint64_t *)buf);
          }
          if (g_cameraState != 3)
          {
            uint64_t v28 = MSNLog();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              LOWORD(token[0]) = 0;
              _os_log_impl(&dword_1DC736000, v28, OS_LOG_TYPE_INFO, "Installing internal camera override", (uint8_t *)token, 2u);
            }

            token[0] = -1;
            if (notify_register_dispatch("com.apple.mediasafetynet.simulate_camera", token, (dispatch_queue_t)s_mediaSafetyNetQueue, &__block_literal_global_42))
            {
              MSNMonitorStartServerMode_cold_4();
            }
            notify_get_state(token[0], (uint64_t *)buf);
          }
          token[0] = -1;
          if (notify_register_dispatch("com.apple.mediasafetynet.pill_state", token, (dispatch_queue_t)s_mediaSafetyNetQueue, &__block_literal_global_46))
          {
            MSNMonitorStartServerMode_cold_3();
          }
        }
        dispatch_source_t v29 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)s_mediaSafetyNetQueue);
        uint64_t v30 = (void *)s_timer;
        s_timer = (uint64_t)v29;

        uint64_t v31 = s_timer;
        if (s_timer)
        {
          dispatch_time_t v32 = dispatch_time(0, 1000000000);
          dispatch_source_set_timer(v31, v32, 0x3B9ACA00uLL, 0x5F5E100uLL);
          dispatch_source_set_event_handler((dispatch_source_t)s_timer, &__block_literal_global_51);
          dispatch_resume((dispatch_object_t)s_timer);
LABEL_48:

          goto LABEL_55;
        }
        qword_1EAA9AC80 = (uint64_t)"Failed to create timer";
        uint64_t v34 = MSNLog();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          MSNMonitorStartServerMode_cold_2(v34, v42, v43, v44, v45, v46, v47, v48);
        }
      }
      else
      {
        qword_1EAA9AC80 = (uint64_t)"Unexpected NULL dispatch queue.";
        uint64_t v34 = MSNLog();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          MSNMonitorStartServerMode_cold_1(v34, v35, v36, v37, v38, v39, v40, v41);
        }
      }

      abort();
    }
    uint64_t v6 = MSNLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      uint64_t v7 = "Not using MediaSafetyNet on specific devices.";
      goto LABEL_51;
    }
  }
LABEL_52:

  uint64_t v33 = MSNLog();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DC736000, v33, OS_LOG_TYPE_INFO, "Not using MediaSafetyNet on this device.", buf, 2u);
  }

  s_mediaSafetyNetDisabledOnThisHardware = 1;
LABEL_55:
}

void MSNMonitorStartCam()
{
}

void MSNMonitorStartMic()
{
}

char *ServerModeDescription(unsigned int a1)
{
  if (a1 >= 3)
  {
    qword_1EAA9AC80 = (uint64_t)"Unknown mode";
    uint64_t v2 = MSNLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      ServerModeDescription_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }

    abort();
  }
  return off_1E6CA0330[a1];
}

char *FailureModeDescription(unsigned int a1)
{
  if (a1 >= 6)
  {
    qword_1EAA9AC80 = (uint64_t)"Unknown mode";
    uint64_t v2 = MSNLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      ServerModeDescription_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }

    abort();
  }
  return off_1E6CA0348[a1];
}

void __MSNMonitorStartServerMode_block_invoke(int a1, int token)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t state64 = 0;
  uint32_t state = notify_get_state(token, &state64);
  if (state64) {
    int v3 = 2;
  }
  else {
    int v3 = 1;
  }
  if (state) {
    int v3 = 0;
  }
  g_keyboardState = v3;
  uint64_t v4 = MSNLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    if (g_keyboardState >= 3)
    {
      qword_1EAA9AC80 = (uint64_t)"Unknown state";
      uint64_t v6 = MSNLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __MSNMonitorStartServerMode_block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
      }

      abort();
    }
    uint64_t v5 = off_1E6CA0378[g_keyboardState];
    *(_DWORD *)buf = 136315138;
    int v16 = v5;
    _os_log_impl(&dword_1DC736000, v4, OS_LOG_TYPE_INFO, "Updated keyboard state: %s", buf, 0xCu);
  }
}

char *KeyboardStateDescription(unsigned int a1)
{
  if (a1 >= 3)
  {
    qword_1EAA9AC80 = (uint64_t)"Unknown state";
    uint64_t v2 = MSNLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __MSNMonitorStartServerMode_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }

    abort();
  }
  return off_1E6CA0378[a1];
}

char *UIStateDescription(unsigned int a1)
{
  if (a1 >= 4)
  {
    qword_1EAA9AC80 = (uint64_t)"Unknown state";
    uint64_t v2 = MSNLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __MSNMonitorStartServerMode_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }

    abort();
  }
  return off_1E6CA0390[a1];
}

void __MSNMonitorStartServerMode_block_invoke_19()
{
  CFPropertyListRef v0 = CFPreferencesCopyAppValue(@"MediaSafetyNetWaitingTTR", @"com.apple.mediaserverd");
  if (v0)
  {
    v1 = v0;
    CFPropertyListRef v2 = CFPreferencesCopyAppValue(@"MediaSafetyNetWaitingTTRDate", @"com.apple.mediaserverd");
    uint64_t v3 = +[MSNTTR sharedInstance];
    [v3 beginTTRWithTitle:v1 date:v2];

    if (v2) {
      CFRelease(v2);
    }
    CFRelease(v1);
  }
}

void __MSNMonitorStartServerMode_block_invoke_34(uint64_t a1, int a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  g_production = 0;
  uint64_t v3 = MSNLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DC736000, v3, OS_LOG_TYPE_INFO, "Microphone override changed", buf, 2u);
  }

  uint64_t state64 = 0;
  uint32_t state = notify_get_state(a2, &state64);
  if (state64) {
    int v5 = 1;
  }
  else {
    int v5 = 2;
  }
  if (state) {
    int v5 = 0;
  }
  g_microphoneState = v5;
  uint64_t v6 = MSNLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if (g_microphoneState >= 4)
    {
      qword_1EAA9AC80 = (uint64_t)"Unknown state";
      uint64_t v8 = MSNLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __MSNMonitorStartServerMode_block_invoke_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
      }

      abort();
    }
    uint64_t v7 = off_1E6CA03B0[g_microphoneState];
    *(_DWORD *)buf = 136315138;
    __int16 v18 = v7;
    _os_log_impl(&dword_1DC736000, v6, OS_LOG_TYPE_INFO, "Updated microphone state: %s", buf, 0xCu);
  }
}

char *MicrophoneStateDescription(unsigned int a1)
{
  if (a1 >= 4)
  {
    qword_1EAA9AC80 = (uint64_t)"Unknown state";
    CFPropertyListRef v2 = MSNLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __MSNMonitorStartServerMode_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }

    abort();
  }
  return off_1E6CA03B0[a1];
}

void __MSNMonitorStartServerMode_block_invoke_40(uint64_t a1, int a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  g_production = 0;
  uint64_t v3 = MSNLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DC736000, v3, OS_LOG_TYPE_INFO, "Camera override changed", buf, 2u);
  }

  uint64_t state64 = 0;
  uint32_t state = notify_get_state(a2, &state64);
  if (state64) {
    int v5 = 1;
  }
  else {
    int v5 = 2;
  }
  if (state) {
    int v5 = 0;
  }
  g_cameraState = v5;
  uint64_t v6 = MSNLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if (g_cameraState >= 4)
    {
      qword_1EAA9AC80 = (uint64_t)"Unknown state";
      uint64_t v8 = MSNLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __MSNMonitorStartServerMode_block_invoke_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
      }

      abort();
    }
    uint64_t v7 = off_1E6CA03B0[g_cameraState];
    *(_DWORD *)buf = 136315138;
    __int16 v18 = v7;
    _os_log_impl(&dword_1DC736000, v6, OS_LOG_TYPE_INFO, "Updated camera state: %s", buf, 0xCu);
  }
}

void __MSNMonitorStartServerMode_block_invoke_44(int a1, int token)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  g_production = 0;
  uint64_t state64 = 0;
  if (!notify_get_state(token, &state64))
  {
    if (state64)
    {
      g_pillState = state64;
      s_lockPill = 1;
      CFPropertyListRef v2 = MSNLog();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        if (g_pillState < 3)
        {
          uint64_t v3 = off_1E6CA03D0[g_pillState];
          *(_DWORD *)buf = 136315138;
          int v16 = v3;
          uint64_t v4 = "Updated pill state: %s";
LABEL_9:
          _os_log_impl(&dword_1DC736000, v2, OS_LOG_TYPE_INFO, v4, buf, 0xCu);
          goto LABEL_10;
        }
        qword_1EAA9AC80 = (uint64_t)"Unknown state";
        uint64_t v6 = MSNLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
LABEL_15:
        }
          __MSNMonitorStartServerMode_block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
LABEL_16:

        abort();
      }
    }
    else
    {
      s_lockPill = 0;
      g_pillState = 0;
      CFPropertyListRef v2 = MSNLog();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        if (g_pillState < 3)
        {
          int v5 = off_1E6CA03D0[g_pillState];
          *(_DWORD *)buf = 136315138;
          int v16 = v5;
          uint64_t v4 = "Reset pill state: %s";
          goto LABEL_9;
        }
        qword_1EAA9AC80 = (uint64_t)"Unknown state";
        uint64_t v6 = MSNLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          goto LABEL_15;
        }
        goto LABEL_16;
      }
    }
LABEL_10:
  }
}

char *PillStateDescription(unsigned int a1)
{
  if (a1 >= 3)
  {
    qword_1EAA9AC80 = (uint64_t)"Unknown state";
    CFPropertyListRef v2 = MSNLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __MSNMonitorStartServerMode_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }

    abort();
  }
  return off_1E6CA03D0[a1];
}

void __MSNFailureMode_block_invoke()
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  Boolean keyExistsAndHasValidFormat = 0;
  int AppIntegerValue = CFPreferencesGetAppIntegerValue(@"MediaSafetyNetFailureMode", @"com.apple.mediaserverd", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    int v1 = AppIntegerValue;
  }
  else {
    int v1 = 2;
  }
  _MergedGlobals = v1;
  if (os_variant_allows_internal_security_policies())
  {
    memset(&v15, 0, sizeof(v15));
    if (!stat("/var/db/internal_disable_mediasafetynet_cookie", &v15))
    {
      CFPropertyListRef v2 = MSNLog();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
        __MSNFailureMode_block_invoke_cold_2(v2);
      }

      _MergedGlobals = 1;
    }
  }
  uint64_t v3 = MSNLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    if (_MergedGlobals >= 6)
    {
      qword_1EAA9AC80 = (uint64_t)"Unknown mode";
      uint64_t v6 = MSNLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        ServerModeDescription_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
      }

      abort();
    }
    uint64_t v4 = "";
    uint64_t v5 = off_1E6CA0348[_MergedGlobals];
    if (!keyExistsAndHasValidFormat) {
      uint64_t v4 = " default";
    }
    v15.st_dev = 136315394;
    *(void *)&v15.st_mode = v4;
    WORD2(v15.st_ino) = 2080;
    *(__darwin_ino64_t *)((char *)&v15.st_ino + 6) = (__darwin_ino64_t)v5;
    _os_log_impl(&dword_1DC736000, v3, OS_LOG_TYPE_INFO, "MediaSafetyNet%s failure mode: %s", (uint8_t *)&v15, 0x16u);
  }
}

const char *ConsistencyDescription(int a1)
{
  if (a1 == 1) {
    return "Inconsistent";
  }
  if (a1 != 2)
  {
    qword_1EAA9AC80 = (uint64_t)"Unknown state";
    CFPropertyListRef v2 = MSNLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __MSNMonitorStartServerMode_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }

    abort();
  }
  return "Consistent";
}

void __MSNPollStates_block_invoke(uint64_t a1, int a2)
{
  int v2 = a2 == 3;
  if (a2 == 2) {
    int v2 = 2;
  }
  g_pillState = v2;
}

uint64_t HotCameraAllowed()
{
  if (_AXSSwitchControlEnabledAndNeedsCameraOnLockScreen())
  {
    CFPropertyListRef v0 = MSNLog();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_1DC736000, v0, OS_LOG_TYPE_INFO, "Switch Control enabled.", v3, 2u);
    }

    return 1;
  }
  if (g_cameraExceptionState
    || ([(id)s_exceptions isExceptionInEffect:0x1F37C3768] & 1) != 0
    || ([(id)s_exceptions isExceptionInEffect:0x1F37C3828] & 1) != 0
    || ([(id)s_exceptions isExceptionInEffect:0x1F37C38A8] & 1) != 0
    || ([(id)s_exceptions isExceptionInEffect:0x1F37C38C8] & 1) != 0)
  {
    return 1;
  }
  int v2 = (void *)s_exceptions;

  return [v2 isExceptionInEffect:0x1F37C3868];
}

uint64_t HotMicAllowed()
{
  if ((g_pillState & 0xFFFFFFFD) == 0) {
    return 1;
  }
  if (_AXSCommandAndControlEnabled())
  {
    CFPropertyListRef v0 = MSNLog();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      __int16 v6 = 0;
      int v1 = "Command and Control enabled.";
      int v2 = (uint8_t *)&v6;
LABEL_11:
      _os_log_impl(&dword_1DC736000, v0, OS_LOG_TYPE_INFO, v1, v2, 2u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (_AXSSoundDetectionRunning())
  {
    CFPropertyListRef v0 = MSNLog();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      __int16 v7 = 0;
      int v1 = "Sound Detection enabled.";
      int v2 = (uint8_t *)&v7;
      goto LABEL_11;
    }
LABEL_12:

    return 1;
  }
  if (_AXSSwitchControlEnabledAndNeedsMicrophoneOnLockScreen())
  {
    CFPropertyListRef v0 = MSNLog();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      int v1 = "Switch Control sound triggers enabled.";
      int v2 = buf;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  if (_AXSLiveTranscriptionEnabled() && _AXSLiveTranscriptionMicOn())
  {
    CFPropertyListRef v0 = MSNLog();
    if (!os_log_type_enabled(v0, OS_LOG_TYPE_INFO)) {
      goto LABEL_12;
    }
    __int16 v9 = 0;
    int v1 = "LiveTranscription enabled.";
    int v2 = (uint8_t *)&v9;
    goto LABEL_11;
  }
  char v4 = [(id)s_carplay carplayConnected];
  uint64_t result = 1;
  if ((v4 & 1) == 0 && g_keyboardState != 2)
  {
    if (([(id)s_exceptions isExceptionInEffect:0x1F37C3808] & 1) == 0
      && ([(id)s_exceptions isExceptionInEffect:0x1F37C3748] & 1) == 0
      && ([(id)s_exceptions isExceptionInEffect:0x1F37C3768] & 1) == 0
      && ([(id)s_exceptions isExceptionInEffect:0x1F37C3788] & 1) == 0
      && ([(id)s_exceptions isExceptionInEffect:0x1F37C37A8] & 1) == 0
      && ([(id)s_exceptions isExceptionInEffect:0x1F37C37C8] & 1) == 0
      && ([(id)s_exceptions isExceptionInEffect:0x1F37C37E8] & 1) == 0
      && ([(id)s_exceptions isExceptionInEffect:0x1F37C3848] & 1) == 0
      && ([(id)s_exceptions isExceptionInEffect:0x1F37C3868] & 1) == 0)
    {
      if (!os_variant_allows_internal_security_policies()) {
        return 0;
      }
      uint64_t v5 = (const char *)g_microphoneClient;
      if (!g_microphoneClient
        || strcmp((const char *)g_microphoneClient, "qrecord")
        && strcmp(v5, "auriotest")
        && strcmp(v5, "minilab")
        && strcmp(v5, "xctest")
        && strcmp(v5, "avcapture")
        && strcmp(v5, "halperformancemetrics")
        && strcmp(v5, "avvctest")
        && strcmp(v5, "audioloopback")
        && strcmp(v5, "algen")
        && strcmp(v5, "austriptool")
        && strcmp(v5, "dspprocess")
        && strcmp(v5, "auprocess")
        && strcmp(v5, "ssplay")
        && strcmp(v5, "vpiotest")
        && strcmp(v5, "multiroutetest")
        && strcmp(v5, "afinfo")
        && strcmp(v5, "afconvert")
        && strcmp(v5, "audiodetect")
        && strcmp(v5, "avrecord")
        && strcmp(v5, "qplay")
        && strcmp(v5, "auval")
        && strcmp(v5, "auvaltool")
        && strcmp(v5, "sounddiff")
        && strcmp(v5, "afmetadata")
        && strcmp(v5, "audioperftest")
        && strcmp(v5, "attentiond")
        && strcmp(v5, "audiotest")
        && strcmp(v5, "AVAudioDeviceTes")
        && strcmp(v5, "CoreContextAmbie"))
      {
        return 0;
      }
    }
    return 1;
  }
  return result;
}

void __MSNStateFailureWithMode_block_invoke()
{
  v81[7] = *MEMORY[0x1E4F143B8];
  if (g_production)
  {
    v80[0] = @"Mic";
    if (g_microphoneState >= 4)
    {
      qword_1EAA9AC80 = (uint64_t)"Unknown state";
      uint64_t v36 = MSNLog();
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        goto LABEL_85;
      }
    }
    else
    {
      uint64_t v0 = [NSString stringWithUTF8String:off_1E6CA03B0[g_microphoneState]];
      v81[0] = v0;
      v80[1] = @"Cam";
      if (g_cameraState >= 4)
      {
        qword_1EAA9AC80 = (uint64_t)"Unknown state";
        uint64_t v36 = MSNLog();
        if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          goto LABEL_85;
        }
      }
      else
      {
        int v1 = (void *)v0;
        int v2 = [NSString stringWithUTF8String:off_1E6CA03B0[g_cameraState]];
        v81[1] = v2;
        v80[2] = @"MicClient";
        if (g_microphoneClient) {
          uint64_t v3 = (const char *)g_microphoneClient;
        }
        else {
          uint64_t v3 = "None";
        }
        char v4 = [NSString stringWithUTF8String:v3];
        v81[2] = v4;
        v80[3] = @"CamClient";
        if (g_cameraClient) {
          uint64_t v5 = (const char *)g_cameraClient;
        }
        else {
          uint64_t v5 = "None";
        }
        uint64_t v6 = [NSString stringWithUTF8String:v5];
        v81[3] = v6;
        v80[4] = @"Pill";
        if (g_pillState >= 3)
        {
          qword_1EAA9AC80 = (uint64_t)"Unknown state";
          uint64_t v36 = MSNLog();
          if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
            goto LABEL_85;
          }
        }
        else
        {
          __int16 v7 = (void *)v6;
          uint64_t v8 = [NSString stringWithUTF8String:off_1E6CA03D0[g_pillState]];
          v81[4] = v8;
          v80[5] = @"UI";
          if (g_uiState >= 4)
          {
            qword_1EAA9AC80 = (uint64_t)"Unknown state";
            uint64_t v36 = MSNLog();
            if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
              goto LABEL_85;
            }
          }
          else
          {
            __int16 v9 = (void *)v8;
            uint64_t v10 = [NSString stringWithUTF8String:off_1E6CA0390[g_uiState]];
            v81[5] = v10;
            v80[6] = @"Kbd";
            if (g_keyboardState < 3)
            {
              uint64_t v11 = (void *)v10;
              uint64_t v12 = [NSString stringWithUTF8String:off_1E6CA0378[g_keyboardState]];
              v81[6] = v12;
              uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v81 forKeys:v80 count:7];
              AnalyticsSendEvent();

              goto LABEL_14;
            }
            qword_1EAA9AC80 = (uint64_t)"Unknown state";
            uint64_t v36 = MSNLog();
            if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
              goto LABEL_85;
            }
          }
        }
      }
    }
    __MSNMonitorStartServerMode_block_invoke_cold_1(v36, v51, v52, v53, v54, v55, v56, v57);
    goto LABEL_85;
  }
LABEL_14:
  uint64_t v14 = MSNLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    __MSNStateFailureWithMode_block_invoke_cold_11(v14);
  }

  stat v15 = MSNLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
  {
    if (g_production) {
      uint64_t v25 = "";
    }
    else {
      uint64_t v25 = "Testing: ";
    }
    if (g_uiState >= 4)
    {
      qword_1EAA9AC80 = (uint64_t)"Unknown state";
      uint64_t v36 = MSNLog();
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        goto LABEL_85;
      }
      goto LABEL_74;
    }
    if (g_cameraState >= 4)
    {
      qword_1EAA9AC80 = (uint64_t)"Unknown state";
      uint64_t v36 = MSNLog();
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        goto LABEL_85;
      }
      goto LABEL_74;
    }
    v26 = (const char *)g_cameraClient;
    if (g_cameraClient) {
      unsigned int v27 = ":";
    }
    else {
      unsigned int v27 = "";
    }
    if (!g_cameraClient) {
      v26 = "";
    }
    if (g_microphoneState >= 4)
    {
      qword_1EAA9AC80 = (uint64_t)"Unknown state";
      uint64_t v36 = MSNLog();
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        goto LABEL_85;
      }
      goto LABEL_74;
    }
    uint64_t v28 = (const char *)g_microphoneClient;
    if (g_microphoneClient) {
      dispatch_source_t v29 = ":";
    }
    else {
      dispatch_source_t v29 = "";
    }
    if (!g_microphoneClient) {
      uint64_t v28 = "";
    }
    if (g_pillState >= 3)
    {
      qword_1EAA9AC80 = (uint64_t)"Unknown state";
      uint64_t v36 = MSNLog();
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        goto LABEL_85;
      }
      goto LABEL_74;
    }
    if (g_keyboardState < 3)
    {
      uint64_t v30 = off_1E6CA0390[g_uiState];
      uint64_t v31 = off_1E6CA03B0[g_cameraState];
      dispatch_time_t v32 = off_1E6CA03B0[g_microphoneState];
      uint64_t v33 = off_1E6CA03D0[g_pillState];
      uint64_t v34 = off_1E6CA0378[g_keyboardState];
      uint64_t v35 = (const char *)g_cameraExceptionState;
      if (!g_cameraExceptionState) {
        uint64_t v35 = "None";
      }
      *(_DWORD *)buf = 136317698;
      v59 = v25;
      __int16 v60 = 2080;
      v61 = v30;
      __int16 v62 = 2080;
      v63 = v31;
      __int16 v64 = 2080;
      v65 = v27;
      __int16 v66 = 2080;
      v67 = v26;
      __int16 v68 = 2080;
      v69 = v32;
      __int16 v70 = 2080;
      v71 = v29;
      __int16 v72 = 2080;
      v73 = v28;
      __int16 v74 = 2080;
      v75 = v33;
      __int16 v76 = 2080;
      v77 = v34;
      __int16 v78 = 2080;
      v79 = v35;
      _os_log_fault_impl(&dword_1DC736000, v15, OS_LOG_TYPE_FAULT, "MediaSafetyNet failure with states: %sUI(%s) Cam(%s%s%s) Mic(%s%s%s) Pill(%s) Kbd(%s) CameraException(%s)", buf, 0x70u);
      goto LABEL_17;
    }
    qword_1EAA9AC80 = (uint64_t)"Unknown state";
    uint64_t v36 = MSNLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
LABEL_74:
    }
      __MSNMonitorStartServerMode_block_invoke_cold_1(v36, v44, v45, v46, v47, v48, v49, v50);
LABEL_85:

    abort();
  }
LABEL_17:

  uint64_t v16 = +[MSNTTR sharedInstance];
  if (g_uiState >= 4)
  {
    qword_1EAA9AC80 = (uint64_t)"Unknown state";
    uint64_t v36 = MSNLog();
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      goto LABEL_85;
    }
LABEL_64:
    __MSNMonitorStartServerMode_block_invoke_cold_1(v36, v37, v38, v39, v40, v41, v42, v43);
    goto LABEL_85;
  }
  if (g_cameraState >= 4)
  {
    qword_1EAA9AC80 = (uint64_t)"Unknown state";
    uint64_t v36 = MSNLog();
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      goto LABEL_85;
    }
    goto LABEL_64;
  }
  if (g_microphoneState >= 4)
  {
    qword_1EAA9AC80 = (uint64_t)"Unknown state";
    uint64_t v36 = MSNLog();
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      goto LABEL_85;
    }
    goto LABEL_64;
  }
  if (g_pillState >= 3)
  {
    qword_1EAA9AC80 = (uint64_t)"Unknown state";
    uint64_t v36 = MSNLog();
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      goto LABEL_85;
    }
    goto LABEL_64;
  }
  if (g_keyboardState >= 3)
  {
    qword_1EAA9AC80 = (uint64_t)"Unknown state";
    uint64_t v36 = MSNLog();
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      goto LABEL_85;
    }
    goto LABEL_64;
  }
  uint64_t v17 = (void *)v16;
  __int16 v18 = (const char *)g_cameraClient;
  uint64_t v19 = (const char *)g_microphoneClient;
  if (g_microphoneClient)
  {
    int v20 = ":";
  }
  else
  {
    uint64_t v19 = "";
    int v20 = "";
  }
  if (g_cameraClient)
  {
    uint64_t v21 = ":";
  }
  else
  {
    __int16 v18 = "";
    uint64_t v21 = "";
  }
  if (g_production) {
    uint64_t v22 = "";
  }
  else {
    uint64_t v22 = "Testing: ";
  }
  v23 = (const char *)g_cameraExceptionState;
  if (!g_cameraExceptionState) {
    v23 = "None";
  }
  int v24 = objc_msgSend(NSString, "stringWithFormat:", @"MediaSafetyNet: %sUI(%s) Cam(%s%s%s) Mic(%s%s%s) Pill(%s) Kbd(%s) CameraException(%s)", v22, off_1E6CA0390[g_uiState], off_1E6CA03B0[g_cameraState], v21, v18, off_1E6CA03B0[g_microphoneState], v20, v19, off_1E6CA03D0[g_pillState], off_1E6CA0378[g_keyboardState], v23);
  [v17 beginTTRWithTitle:v24];
}

void __MSNStateFailureWithMode_block_invoke_157()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [@"com.apple.mediaserverd|com.apple.callservicesd|com.apple.telephonyd|com.apple.CommCenter" componentsSeparatedByString:@"|"];
  uint64_t v1 = [v0 setWithArray:v3];
  int v2 = (void *)MSNStateFailureWithMode_terminatingProcesses;
  MSNStateFailureWithMode_terminatingProcesses = v1;
}

void __MSNStateFailureWithMode_block_invoke_2()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [@"callservicesd|mediaserverd|telephonyd|CommCenter" componentsSeparatedByString:@"|"];
  uint64_t v1 = [v0 setWithArray:v3];
  int v2 = (void *)MSNStateFailureWithMode_terminatingProcesses_167;
  MSNStateFailureWithMode_terminatingProcesses_167 = v1;
}

uint64_t __MSNPeriodicLog_block_invoke()
{
  MSNPeriodicLog_log = (uint64_t)os_log_create("com.apple.MediaSafetyNet", "periodic");

  return MEMORY[0x1F41817F8]();
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void CarPlayNotificationCallback(int a1, uint64_t a2, int a3, int a4, CFTypeRef cf)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  CFTypeID v7 = CFGetTypeID(cf);
  if (v7 != CFDictionaryGetTypeID())
  {
    qword_1EAA9AC80 = (uint64_t)"Unexpected notification payload type";
    uint64_t v11 = MSNLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      CarPlayNotificationCallback_cold_1(v11);
    }
LABEL_11:

    abort();
  }
  CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)cf, (const void *)*MEMORY[0x1E4F74FB8]);
  uint64_t v9 = MSNLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v14 = CFBooleanGetValue(Value);
    _os_log_impl(&dword_1DC736000, v9, OS_LOG_TYPE_INFO, "Received notification of CarPlay status: %{BOOL}d", buf, 8u);
  }

  if (!Value || (CFTypeID v10 = CFGetTypeID(Value), v10 != CFBooleanGetTypeID()))
  {
    qword_1EAA9AC80 = (uint64_t)"Unexpected notification payload type";
    uint64_t v11 = MSNLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      CarPlayNotificationCallback_cold_1(v11);
    }
    goto LABEL_11;
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __CarPlayNotificationCallback_block_invoke;
  v12[3] = &__block_descriptor_48_e5_v8__0l;
  v12[4] = a2;
  v12[5] = Value;
  dispatch_async((dispatch_queue_t)s_mediaSafetyNetQueue, v12);
}

void __CarPlayNotificationCallback_block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = CFBooleanGetValue(*(CFBooleanRef *)(a1 + 40)) != 0;
  int v2 = MSNLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int Value = CFBooleanGetValue(*(CFBooleanRef *)(a1 + 40));
    v4[0] = 67109120;
    v4[1] = Value;
    _os_log_impl(&dword_1DC736000, v2, OS_LOG_TYPE_INFO, "Updated CarPlay status to: %{BOOL}d", (uint8_t *)v4, 8u);
  }
}

void sub_1DC73EE38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void MSNTTRUserNotificationCallback(uint64_t a1, uint64_t a2)
{
  id v3 = +[MSNTTR sharedInstance];
  [v3 handleCallback:a2];
}

void sub_1DC73F1E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *__getSBUserNotificationDismissOnLockSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!SpringBoardServicesLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __SpringBoardServicesLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E6CA0428;
    uint64_t v7 = 0;
    SpringBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    id v3 = (void *)v5[0];
    int v2 = (void *)SpringBoardServicesLibraryCore_frameworkLibrary;
    if (SpringBoardServicesLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      id v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  int v2 = (void *)SpringBoardServicesLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "SBUserNotificationDismissOnLock");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSBUserNotificationDismissOnLockSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SpringBoardServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SpringBoardServicesLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getLSApplicationWorkspaceClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!MobileCoreServicesLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    _DWORD v4[2] = 3221225472;
    v4[3] = __MobileCoreServicesLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6CA0440;
    uint64_t v6 = 0;
    MobileCoreServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    int v2 = (void *)v4[0];
    if (!MobileCoreServicesLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("LSApplicationWorkspace");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    int v2 = (void *)__getLSApplicationWorkspaceClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getLSApplicationWorkspaceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MobileCoreServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MobileCoreServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void MSNMonitorSetCameraState_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DC736000, v0, v1, "MSN state set outside of mediaserverd or before MSN was initialized.", v2, v3, v4, v5, v6);
}

void __MSNMonitorSetCameraState_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DC736000, v0, v1, "Camera status should not be set when cam process is broken out.", v2, v3, v4, v5, v6);
}

void __MSNMonitorSetMicrophoneState_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DC736000, v0, v1, "Microphone status should not be set when mic process is broken out.", v2, v3, v4, v5, v6);
}

void __MSNMonitorSetLastCameraClient_block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = g_cameraClient;
  _os_log_debug_impl(&dword_1DC736000, log, OS_LOG_TYPE_DEBUG, "Last camera client: %s", (uint8_t *)&v1, 0xCu);
}

void __MSNMonitorSetLastMicrophoneClient_block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = g_microphoneClient;
  _os_log_debug_impl(&dword_1DC736000, log, OS_LOG_TYPE_DEBUG, "Last microphone client: %s", (uint8_t *)&v1, 0xCu);
}

uint64_t __getSTDynamicActivityAttributionMonitorClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSTCallingStatusDomainClass_block_invoke_cold_1(v0);
}

uint64_t __getSTCallingStatusDomainClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return MSNMonitorStart_cold_1(v0);
}

void MSNMonitorStart_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MSNMonitorStartServerMode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MSNMonitorStartServerMode_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MSNMonitorStartServerMode_cold_3()
{
  __assert_rtn("MSNMonitorStartServerMode", "MSNServer.m", 654, "0 == err");
}

void MSNMonitorStartServerMode_cold_4()
{
  __assert_rtn("MSNMonitorStartServerMode", "MSNServer.m", 633, "0 == err");
}

void MSNMonitorStartServerMode_cold_5()
{
  __assert_rtn("MSNMonitorStartServerMode", "MSNServer.m", 614, "0 == err");
}

void MSNMonitorStartServerMode_cold_6(NSObject *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = ServerModeDescription(g_serverMode);
  if (qword_1EB9F3A10 != -1) {
    dispatch_once(&qword_1EB9F3A10, &__block_literal_global_66);
  }
  int v3 = 136315394;
  uint64_t v4 = v2;
  __int16 v5 = 2080;
  uint8_t v6 = FailureModeDescription(_MergedGlobals);
  _os_log_debug_impl(&dword_1DC736000, a1, OS_LOG_TYPE_DEBUG, "Starting MediaSafetyNet in server mode: %s failure mode: %s", (uint8_t *)&v3, 0x16u);
}

void MSNMonitorStartServerMode_cold_7(NSObject *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109376;
  v2[1] = _os_feature_enabled_impl();
  __int16 v3 = 1024;
  int v4 = _os_feature_enabled_impl();
  _os_log_debug_impl(&dword_1DC736000, a1, OS_LOG_TYPE_DEBUG, "Separate Cam: %i Separate Mic: %i", (uint8_t *)v2, 0xEu);
}

void ServerModeDescription_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __MSNMonitorStartServerMode_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MSNValidateState_cold_6(void *a1, int a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (g_production) {
    uint64_t v2 = "";
  }
  else {
    uint64_t v2 = "Testing: ";
  }
  int v14 = v2;
  unsigned int v3 = g_uiState;
  log = a1;
  int v4 = UIStateDescription(v3);
  uint64_t v5 = MicrophoneStateDescription(g_cameraState);
  if (g_cameraClient) {
    uint8_t v6 = ":";
  }
  else {
    uint8_t v6 = "";
  }
  if (g_cameraClient) {
    uint64_t v7 = (const char *)g_cameraClient;
  }
  else {
    uint64_t v7 = "";
  }
  uint64_t v8 = MicrophoneStateDescription(g_microphoneState);
  if (g_microphoneClient) {
    uint64_t v9 = ":";
  }
  else {
    uint64_t v9 = "";
  }
  if (g_microphoneClient) {
    uint64_t v10 = (const char *)g_microphoneClient;
  }
  else {
    uint64_t v10 = "";
  }
  uint64_t v11 = PillStateDescription(g_pillState);
  uint64_t v12 = KeyboardStateDescription(g_keyboardState);
  if (g_cameraExceptionState) {
    uint64_t v13 = (const char *)g_cameraExceptionState;
  }
  else {
    uint64_t v13 = "None";
  }
  *(_DWORD *)buf = 136317954;
  __int16 v18 = v14;
  __int16 v19 = 2080;
  int v20 = v4;
  __int16 v21 = 2080;
  uint64_t v22 = v5;
  __int16 v23 = 2080;
  int v24 = v6;
  __int16 v25 = 2080;
  v26 = v7;
  __int16 v27 = 2080;
  uint64_t v28 = v8;
  __int16 v29 = 2080;
  uint64_t v30 = v9;
  __int16 v31 = 2080;
  dispatch_time_t v32 = v10;
  __int16 v33 = 2080;
  uint64_t v34 = v11;
  __int16 v35 = 2080;
  uint64_t v36 = v12;
  __int16 v37 = 2080;
  uint64_t v38 = v13;
  __int16 v39 = 2080;
  uint64_t v40 = ConsistencyDescription(a2);
  _os_log_debug_impl(&dword_1DC736000, log, OS_LOG_TYPE_DEBUG, "MediaSafetyNet state: %sUI(%s) Cam(%s%s%s) Mic(%s%s%s) Pill(%s) Kbd(%s) CameraException(%s) consistency: %s", buf, 0x7Au);
}

void MSNValidateState_cold_17(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MSNValidateState_cold_43(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MSNValidateState_cold_44()
{
}

void __MSNFailureMode_block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_1DC736000, log, OS_LOG_TYPE_ERROR, "MediaSafetyNet state failure downgraded to log due to existence of /var/db/disable_mediasafetynet.", v1, 2u);
}

void __MSNStateFailureWithMode_block_invoke_cold_11(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_1DC736000, log, OS_LOG_TYPE_ERROR, "MediaSafetyNet generating fault", v1, 2u);
}

void CarPlayNotificationCallback_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "Unexpected notification payload type";
  _os_log_error_impl(&dword_1DC736000, log, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v1, 0xCu);
}

uint64_t __getLSApplicationWorkspaceClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[MSNScopedExceptionsServer initWithQueue:](v0);
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1F41138A0]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE8](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B8]();
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1F40D8A28](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8A40](allocator, userNotification, callout, order);
}

uint64_t CMNotificationCenterAddListener()
{
  return MEMORY[0x1F40DBCA8]();
}

uint64_t CMSessionGetNotificationCenter()
{
  return MEMORY[0x1F412C9D8]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1F417CE18]();
}

uint64_t _AXSCommandAndControlEnabled()
{
  return MEMORY[0x1F4178A18]();
}

uint64_t _AXSLiveTranscriptionEnabled()
{
  return MEMORY[0x1F4178D60]();
}

uint64_t _AXSLiveTranscriptionMicOn()
{
  return MEMORY[0x1F4178D68]();
}

uint64_t _AXSSoundDetectionRunning()
{
  return MEMORY[0x1F4179038]();
}

uint64_t _AXSSwitchControlEnabledAndNeedsCameraOnLockScreen()
{
  return MEMORY[0x1F4179058]();
}

uint64_t _AXSSwitchControlEnabledAndNeedsMicrophoneOnLockScreen()
{
  return MEMORY[0x1F4179060]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
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
  return MEMORY[0x1F415B160]();
}

void abort(void)
{
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1F40CA440](a1, a2);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40CD058](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1F40CD088](*(void *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
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
  return (id)MEMORY[0x1F4181A18](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1F40CD630]();
}

uint64_t os_variant_has_factory_content()
{
  return MEMORY[0x1F40CD640]();
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}