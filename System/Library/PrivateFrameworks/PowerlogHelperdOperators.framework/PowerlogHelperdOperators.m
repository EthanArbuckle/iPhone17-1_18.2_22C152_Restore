id PLLogCamera()
{
  void *v0;
  uint64_t vars8;

  if (PLLogCamera_onceToken != -1) {
    dispatch_once(&PLLogCamera_onceToken, &__block_literal_global);
  }
  v0 = (void *)PLLogCamera___logObj;
  return v0;
}

uint64_t __PLLogCamera_block_invoke()
{
  PLLogCamera___logObj = (uint64_t)os_log_create("com.apple.powerlog", "camera");
  return MEMORY[0x1F41817F8]();
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1E4227344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

id PLLogCoalition()
{
  if (PLLogCoalition_onceToken != -1) {
    dispatch_once(&PLLogCoalition_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)PLLogCoalition___logObj;
  return v0;
}

uint64_t __PLLogCoalition_block_invoke()
{
  PLLogCoalition___logObj = (uint64_t)os_log_create("com.apple.powerlog", "coalition");
  return MEMORY[0x1F41817F8]();
}

void sub_1E422C1D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E4232CB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1E4233EA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void NotificationCallback(uint64_t a1, void *a2)
{
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x3032000000;
  v4[3] = __Block_byref_object_copy__2;
  v4[4] = __Block_byref_object_dispose__2;
  id v5 = a2;
  v2 = dispatch_get_global_queue(-2, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __NotificationCallback_block_invoke;
  block[3] = &unk_1E6E47B58;
  block[4] = v4;
  dispatch_async(v2, block);

  _Block_object_dispose(v4, 8);
}

void sub_1E423BEF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __NotificationCallback_block_invoke(uint64_t a1)
{
  v1 = NSString;
  v2 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) batteryBreakdownAndGraphWithPayload:&unk_1F400E840];
  v3 = [v1 stringWithFormat:@"%@", v2];

  v4 = (void *)MEMORY[0x1E4F929B8];
  id v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryUIService.m"];
  v6 = [v5 lastPathComponent];
  v7 = [NSString stringWithUTF8String:"NotificationCallback_block_invoke"];
  [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:124];

  v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
  }
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_debug_impl(a1, v4, OS_LOG_TYPE_DEBUG, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_8(uint64_t a1, uint64_t a2)
{
  return a2;
}

void OUTLINED_FUNCTION_9(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_10(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_1E423C3CC(void *a1)
{
  MEMORY[0x1E4E7E820](v1, 0x10B1C40CB89C51DLL);
  objc_begin_catch(a1);
  objc_end_catch();
  JUMPOUT(0x1E423C3B8);
}

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_10_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_11_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_1E42421A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void PowerChangedCallback(void *a1, uint64_t a2, uint64_t a3, intptr_t a4)
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x3032000000;
  v74 = __Block_byref_object_copy__4;
  v75 = __Block_byref_object_dispose__4;
  id v76 = a1;
  HIDWORD(v6) = a3;
  LODWORD(v6) = a3 + 536870288;
  switch((v6 >> 4))
  {
    case 0u:
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v7 = objc_opt_class();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __PowerChangedCallback_block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v7;
        if (PowerChangedCallback_defaultOnce != -1) {
          dispatch_once(&PowerChangedCallback_defaultOnce, block);
        }
        if (PowerChangedCallback_classDebugEnabled)
        {
          v8 = [NSString stringWithFormat:@"Sleep: start listening"];
          uint64_t v9 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m"];
          v11 = [v10 lastPathComponent];
          uint64_t v12 = [NSString stringWithUTF8String:"PowerChangedCallback"];
          [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:1126];

          v13 = PLLogCommon();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }
        }
      }
      uint64_t v14 = [(id)v72[5] canSleepSemaphore];
      [v14 signalStartListening];

      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v15 = objc_opt_class();
        v69[0] = MEMORY[0x1E4F143A8];
        v69[1] = 3221225472;
        v69[2] = __PowerChangedCallback_block_invoke_497;
        v69[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v69[4] = v15;
        if (PowerChangedCallback_defaultOnce_495 != -1) {
          dispatch_once(&PowerChangedCallback_defaultOnce_495, v69);
        }
        if (PowerChangedCallback_classDebugEnabled_496)
        {
          uint64_t v16 = [NSString stringWithFormat:@"Sleep: log entry"];
          uint64_t v17 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m"];
          v19 = [v18 lastPathComponent];
          v20 = [NSString stringWithUTF8String:"PowerChangedCallback"];
          [v17 logMessage:v16 fromFile:v19 fromFunction:v20 fromLineNumber:1128];

          v21 = PLLogCommon();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }
        }
      }
      uint64_t v63 = 0;
      v64 = &v63;
      uint64_t v65 = 0x3032000000;
      v66 = __Block_byref_object_copy__4;
      v67 = __Block_byref_object_dispose__4;
      id v68 = [[PLEventForwardPowerStateEntry alloc] initEntryWithIOMessage:a3];
      [(id)v72[5] logEntry:v64[5]];
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v22 = objc_opt_class();
        v62[0] = MEMORY[0x1E4F143A8];
        v62[1] = 3221225472;
        v62[2] = __PowerChangedCallback_block_invoke_503;
        v62[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v62[4] = v22;
        if (PowerChangedCallback_defaultOnce_501 != -1) {
          dispatch_once(&PowerChangedCallback_defaultOnce_501, v62);
        }
        if (PowerChangedCallback_classDebugEnabled_502)
        {
          v23 = objc_msgSend(NSString, "stringWithFormat:", @"Sleep: begin block entry.id=%lld", objc_msgSend((id)v64[5], "entryID"));
          v24 = (void *)MEMORY[0x1E4F929B8];
          v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m"];
          v26 = [v25 lastPathComponent];
          v27 = [NSString stringWithUTF8String:"PowerChangedCallback"];
          [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:1131];

          v28 = PLLogCommon();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }
        }
      }
      v29 = [(id)v72[5] canSleepSemaphore];
      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      v61[2] = __PowerChangedCallback_block_invoke_507;
      v61[3] = &unk_1E6E47CC0;
      v61[4] = &v71;
      v61[5] = &v63;
      v61[6] = a4;
      [v29 waitWithBlock:v61];

      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v30 = objc_opt_class();
        v60[0] = MEMORY[0x1E4F143A8];
        v60[1] = 3221225472;
        v60[2] = __PowerChangedCallback_block_invoke_513;
        v60[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v60[4] = v30;
        if (PowerChangedCallback_defaultOnce_511 != -1) {
          dispatch_once(&PowerChangedCallback_defaultOnce_511, v60);
        }
        if (PowerChangedCallback_classDebugEnabled_512)
        {
          v31 = objc_msgSend(NSString, "stringWithFormat:", @"Sleep: after block entry.id=%lld", objc_msgSend((id)v64[5], "entryID"));
          v32 = (void *)MEMORY[0x1E4F929B8];
          v33 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m"];
          v34 = [v33 lastPathComponent];
          v35 = [NSString stringWithUTF8String:"PowerChangedCallback"];
          [v32 logMessage:v31 fromFile:v34 fromFunction:v35 fromLineNumber:1136];

          v36 = PLLogCommon();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }
        }
      }
      _Block_object_dispose(&v63, 8);

      break;
    case 1u:
      id v37 = [[PLEventForwardPowerStateEntry alloc] initEntryWithIOMessage:a3];
      [(id)v72[5] logEntry:v37];
      IOAllowPowerChange([(id)v72[5] rootDomainConnect], a4);

      break;
    case 2u:
      id v54 = [[PLEventForwardPowerStateEntry alloc] initEntryWithIOMessage:a3];
      [(id)v72[5] getSleepStatisticsApps];
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v38 = [obj countByEnumeratingWithState:&v56 objects:v79 count:16];
      if (v38)
      {
        uint64_t v39 = *(void *)v57;
        do
        {
          for (uint64_t i = 0; i != v38; ++i)
          {
            if (*(void *)v57 != v39) {
              objc_enumerationMutation(obj);
            }
            v41 = *(void **)(*((void *)&v56 + 1) + 8 * i);
            v77[0] = @"PID";
            v42 = [v41 objectForKeyedSubscript:@"PID"];
            v78[0] = v42;
            v77[1] = @"AppName";
            v43 = [v41 objectForKeyedSubscript:@"AppName"];
            v78[1] = v43;
            v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:v77 count:2];

            v45 = [v41 objectForKeyedSubscript:@"ResponseType"];
            [v54 setObject:v45 forKeyedSubscript:v44];
          }
          uint64_t v38 = [obj countByEnumeratingWithState:&v56 objects:v79 count:16];
        }
        while (v38);
      }

      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v46 = objc_opt_class();
        v55[0] = MEMORY[0x1E4F143A8];
        v55[1] = 3221225472;
        v55[2] = __PowerChangedCallback_block_invoke_519;
        v55[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v55[4] = v46;
        if (PowerChangedCallback_defaultOnce_517 != -1) {
          dispatch_once(&PowerChangedCallback_defaultOnce_517, v55);
        }
        if (PowerChangedCallback_classDebugEnabled_518)
        {
          v47 = objc_msgSend(NSString, "stringWithFormat:", @"Sleep: SystemWillNotSleep dict[kPLSWE_ResponseType] =%lld ", objc_msgSend(v54, "entryID"));
          v48 = (void *)MEMORY[0x1E4F929B8];
          v49 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m"];
          v50 = [v49 lastPathComponent];
          v51 = [NSString stringWithUTF8String:"PowerChangedCallback"];
          [v48 logMessage:v47 fromFile:v50 fromFunction:v51 fromLineNumber:1149];

          v52 = PLLogCommon();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }
        }
      }
      [(id)v72[5] logEntry:v54];

      break;
    case 9u:
      [(id)v72[5] systemPoweredOn];
      break;
    default:
      break;
  }
  _Block_object_dispose(&v71, 8);
}

void sub_1E42483D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
}

void fakeSleep(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __fakeSleep_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (fakeSleep_defaultOnce != -1) {
      dispatch_once(&fakeSleep_defaultOnce, block);
    }
    if (fakeSleep_classDebugEnabled)
    {
      uint64_t v4 = [NSString stringWithFormat:@"Sleep Fake: start listening"];
      id v5 = (void *)MEMORY[0x1E4F929B8];
      unint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m"];
      uint64_t v7 = [v6 lastPathComponent];
      v8 = [NSString stringWithUTF8String:"fakeSleep"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:1084];

      uint64_t v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  uint64_t v10 = [v2 canSleepSemaphore];
  [v10 signalStartListening];

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v11 = objc_opt_class();
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __fakeSleep_block_invoke_454;
    v41[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v41[4] = v11;
    if (fakeSleep_defaultOnce_452 != -1) {
      dispatch_once(&fakeSleep_defaultOnce_452, v41);
    }
    if (fakeSleep_classDebugEnabled_453)
    {
      uint64_t v12 = [NSString stringWithFormat:@"Sleep Fake: log entry"];
      v13 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m"];
      uint64_t v15 = [v14 lastPathComponent];
      uint64_t v16 = [NSString stringWithUTF8String:"fakeSleep"];
      [v13 logMessage:v12 fromFile:v15 fromFunction:v16 fromLineNumber:1087];

      uint64_t v17 = PLLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  uint64_t v18 = [PLEventForwardPowerStateEntry alloc];
  v19 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  id v20 = [(PLEventForwardPowerStateEntry *)v18 initEntryWithState:1 withEvent:3 withReason:&unk_1F4012688 withDate:v19];

  [v2 logEntry:v20];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v21 = objc_opt_class();
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __fakeSleep_block_invoke_466;
    v40[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v40[4] = v21;
    if (fakeSleep_defaultOnce_464 != -1) {
      dispatch_once(&fakeSleep_defaultOnce_464, v40);
    }
    if (fakeSleep_classDebugEnabled_465)
    {
      uint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"Sleep Fake: begin block entry.id=%lld", objc_msgSend(v20, "entryID"));
      v23 = (void *)MEMORY[0x1E4F929B8];
      v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m"];
      v25 = [v24 lastPathComponent];
      v26 = [NSString stringWithUTF8String:"fakeSleep"];
      [v23 logMessage:v22 fromFile:v25 fromFunction:v26 fromLineNumber:1090];

      v27 = PLLogCommon();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  v28 = [v2 canSleepSemaphore];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __fakeSleep_block_invoke_470;
  v38[3] = &unk_1E6E47848;
  id v29 = v20;
  id v39 = v29;
  [v28 waitWithBlock:v38];

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v30 = objc_opt_class();
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __fakeSleep_block_invoke_476;
    v37[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v37[4] = v30;
    if (fakeSleep_defaultOnce_474 != -1) {
      dispatch_once(&fakeSleep_defaultOnce_474, v37);
    }
    if (fakeSleep_classDebugEnabled_475)
    {
      v31 = objc_msgSend(NSString, "stringWithFormat:", @"Sleep Fake: after block entry.id=%lld", objc_msgSend(v29, "entryID"));
      v32 = (void *)MEMORY[0x1E4F929B8];
      v33 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m"];
      v34 = [v33 lastPathComponent];
      v35 = [NSString stringWithUTF8String:"fakeSleep"];
      [v32 logMessage:v31 fromFile:v34 fromFunction:v35 fromLineNumber:1095];

      v36 = PLLogCommon();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
}

void fakeWakeBB(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [PLEventForwardPowerStateEntry alloc];
  id v5 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  id v4 = [(PLEventForwardPowerStateEntry *)v3 initEntryWithState:0 withEvent:0 withReason:&unk_1F40126A0 withDate:v5];
  [v2 logEntry:v4];
}

void fakeWakeWiFi(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [PLEventForwardPowerStateEntry alloc];
  id v5 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  id v4 = [(PLEventForwardPowerStateEntry *)v3 initEntryWithState:0 withEvent:0 withReason:&unk_1F40126B8 withDate:v5];
  [v2 logEntry:v4];
}

uint64_t __fakeSleep_block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  fakeSleep_classDebugEnabled = result;
  return result;
}

uint64_t __fakeSleep_block_invoke_454(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  fakeSleep_classDebugEnabled_453 = result;
  return result;
}

uint64_t __fakeSleep_block_invoke_466(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  fakeSleep_classDebugEnabled_465 = result;
  return result;
}

void __fakeSleep_block_invoke_470(uint64_t a1)
{
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __fakeSleep_block_invoke_2;
    uint64_t v14 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v15 = v2;
    if (kPLSleepWakeAgentEventPointNameScheduledWakeProcessName_block_invoke_3_defaultOnce != -1) {
      dispatch_once(&kPLSleepWakeAgentEventPointNameScheduledWakeProcessName_block_invoke_3_defaultOnce, &block);
    }
    if (kPLSleepWakeAgentEventPointNameScheduledWakeProcessName_block_invoke_3_classDebugEnabled)
    {
      uint64_t v3 = NSString;
      uint64_t v4 = [*(id *)(a1 + 32) entryID];
      id v5 = objc_msgSend(v3, "stringWithFormat:", @"Sleep Fake: block Done entry.id=%lld", v4, block, v12, v13, v14, v15);
      unint64_t v6 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m"];
      v8 = [v7 lastPathComponent];
      uint64_t v9 = [NSString stringWithUTF8String:"fakeSleep_block_invoke"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:1093];

      uint64_t v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
}

uint64_t __fakeSleep_block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLSleepWakeAgentEventPointNameScheduledWakeProcessName_block_invoke_3_classDebugEnabled = result;
  return result;
}

uint64_t __fakeSleep_block_invoke_476(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  fakeSleep_classDebugEnabled_475 = result;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

uint64_t __PowerChangedCallback_block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  PowerChangedCallback_classDebugEnabled = result;
  return result;
}

uint64_t __PowerChangedCallback_block_invoke_497(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  PowerChangedCallback_classDebugEnabled_496 = result;
  return result;
}

uint64_t __PowerChangedCallback_block_invoke_503(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  PowerChangedCallback_classDebugEnabled_502 = result;
  return result;
}

void __PowerChangedCallback_block_invoke_507(void *a1)
{
  IOAllowPowerChange([*(id *)(*(void *)(a1[4] + 8) + 40) rootDomainConnect], a1[6]);
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __PowerChangedCallback_block_invoke_2;
    uint64_t v14 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v15 = v2;
    if (kPLSleepWakeAgentEventPointNameScheduledWakeProcessName_block_invoke_4_defaultOnce != -1) {
      dispatch_once(&kPLSleepWakeAgentEventPointNameScheduledWakeProcessName_block_invoke_4_defaultOnce, &block);
    }
    if (kPLSleepWakeAgentEventPointNameScheduledWakeProcessName_block_invoke_4_classDebugEnabled)
    {
      uint64_t v3 = NSString;
      uint64_t v4 = [*(id *)(*(void *)(a1[5] + 8) + 40) entryID];
      id v5 = objc_msgSend(v3, "stringWithFormat:", @"Sleep: block Done entry.id=%lld", v4, block, v12, v13, v14, v15);
      unint64_t v6 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m"];
      v8 = [v7 lastPathComponent];
      uint64_t v9 = [NSString stringWithUTF8String:"PowerChangedCallback_block_invoke"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:1134];

      uint64_t v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
}

uint64_t __PowerChangedCallback_block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLSleepWakeAgentEventPointNameScheduledWakeProcessName_block_invoke_4_classDebugEnabled = result;
  return result;
}

uint64_t __PowerChangedCallback_block_invoke_513(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  PowerChangedCallback_classDebugEnabled_512 = result;
  return result;
}

uint64_t __PowerChangedCallback_block_invoke_519(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  PowerChangedCallback_classDebugEnabled_518 = result;
  return result;
}

void sub_1E42525A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void OUTLINED_FUNCTION_3_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void myRelease(int a1, CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

id PLLogUrsa()
{
  if (PLLogUrsa_onceToken != -1) {
    dispatch_once(&PLLogUrsa_onceToken, &__block_literal_global_188);
  }
  v0 = (void *)PLLogUrsa___logObj;
  return v0;
}

uint64_t __PLLogUrsa_block_invoke()
{
  PLLogUrsa___logObj = (uint64_t)os_log_create("com.apple.powerlog", "Ursa");
  return MEMORY[0x1F41817F8]();
}

id PLLogComputeSafeguards()
{
  if (PLLogComputeSafeguards_onceToken != -1) {
    dispatch_once(&PLLogComputeSafeguards_onceToken, &__block_literal_global_209);
  }
  v0 = (void *)PLLogComputeSafeguards___logObj;
  return v0;
}

uint64_t __PLLogComputeSafeguards_block_invoke()
{
  PLLogComputeSafeguards___logObj = (uint64_t)os_log_create("com.apple.powerlog", "ComputeSafeguards");
  return MEMORY[0x1F41817F8]();
}

id PLLogPowerMetricMonitor()
{
  if (PLLogPowerMetricMonitor_onceToken != -1) {
    dispatch_once(&PLLogPowerMetricMonitor_onceToken, &__block_literal_global_6);
  }
  v0 = (void *)PLLogPowerMetricMonitor_log;
  return v0;
}

uint64_t __PLLogPowerMetricMonitor_block_invoke()
{
  PLLogPowerMetricMonitor_log = (uint64_t)os_log_create("com.apple.PerfPowerMetricMonitor", "powerMetricMonitorService");
  return MEMORY[0x1F41817F8]();
}

id PLLogPowerSignpost()
{
  if (PLLogPowerSignpost_onceToken != -1) {
    dispatch_once(&PLLogPowerSignpost_onceToken, &__block_literal_global_71);
  }
  v0 = (void *)PLLogPowerSignpost_log;
  return v0;
}

uint64_t __PLLogPowerSignpost_block_invoke()
{
  PLLogPowerSignpost_log = (uint64_t)os_log_create("com.apple.PerfPowerMetricMonitor", "Power");
  return MEMORY[0x1F41817F8]();
}

void sub_1E4269958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E4269A64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E4269B78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E426CD6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,id a40)
{
}

void sub_1E426E914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_6_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_1E4274ACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PLLogCommon()
{
  if (PLLogCommon_onceToken != -1) {
    dispatch_once(&PLLogCommon_onceToken, &__block_literal_global_720);
  }
  v0 = (void *)PLLogCommon___logObj;
  return v0;
}

id PLLogZlib()
{
  if (PLLogZlib_onceToken != -1) {
    dispatch_once(&PLLogZlib_onceToken, &__block_literal_global_733);
  }
  v0 = (void *)PLLogZlib___logObj;
  return v0;
}

void sub_1E42763EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_1E4276EC0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __PLLogCommon_block_invoke()
{
  PLLogCommon___logObj = (uint64_t)os_log_create("com.apple.powerlog", "");
  return MEMORY[0x1F41817F8]();
}

id PLLogPower()
{
  if (PLLogPower_onceToken != -1) {
    dispatch_once(&PLLogPower_onceToken, &__block_literal_global_724);
  }
  v0 = (void *)PLLogPower___logObj;
  return v0;
}

uint64_t __PLLogPower_block_invoke()
{
  PLLogPower___logObj = (uint64_t)os_log_create("com.apple.powerlog", "Power");
  return MEMORY[0x1F41817F8]();
}

id PLLogSubmission()
{
  if (PLLogSubmission_onceToken != -1) {
    dispatch_once(&PLLogSubmission_onceToken, &__block_literal_global_727);
  }
  v0 = (void *)PLLogSubmission___logObj;
  return v0;
}

uint64_t __PLLogSubmission_block_invoke()
{
  PLLogSubmission___logObj = (uint64_t)os_log_create("com.apple.powerlog", "submission");
  return MEMORY[0x1F41817F8]();
}

id PLLogSQLiteConnection()
{
  if (PLLogSQLiteConnection_onceToken != -1) {
    dispatch_once(&PLLogSQLiteConnection_onceToken, &__block_literal_global_730);
  }
  v0 = (void *)PLLogSQLiteConnection___logObj;
  return v0;
}

uint64_t __PLLogSQLiteConnection_block_invoke()
{
  PLLogSQLiteConnection___logObj = (uint64_t)os_log_create("com.apple.powerlog", "sqliteconnection");
  return MEMORY[0x1F41817F8]();
}

uint64_t __PLLogZlib_block_invoke()
{
  PLLogZlib___logObj = (uint64_t)os_log_create("com.apple.powerlog", "zlib");
  return MEMORY[0x1F41817F8]();
}

void PLEmitPowerSignpost(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (v9)
  {
    id v11 = v9;
    int v12 = strcmp((const char *)[v11 objCType], "f");
    id v13 = v11;
    uint64_t v14 = (const char *)[v13 objCType];
    if (!v12 || !strcmp(v14, "d"))
    {
      uint64_t v15 = NSString;
      [v13 doubleValue];
      objc_msgSend(v15, "stringWithFormat:", @"%.6e", v16);
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v13, "intValue"));
    uint64_t v17 = };
    BOOL v18 = os_signpost_enabled(v7);
    if (v10)
    {
      if (v18) {
        goto LABEL_10;
      }
    }
    else if (v18)
    {
LABEL_10:
      _os_signpost_emit_unreliably_with_name_impl();
    }
  }
}

void PLEmitSystemPowerSignpost()
{
  v0 = PLLogPower();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    PLEmitSystemPowerSignpost_cold_1();
  }
}

uint64_t __stringIsUUID_block_invoke()
{
  stringIsUUID_hexChars = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"0123456789ABCDEFabcdef"];
  return MEMORY[0x1F41817F8]();
}

void OUTLINED_FUNCTION_8_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x12u);
}

void logRunStateNotificationReceived(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v2 = *MEMORY[0x1E4F92D30];
    id v3 = a2;
    uint64_t v4 = +[PLOperator entryKeyForType:v2 andName:@"State"];
    uint64_t v7 = @"State";
    v8[0] = &unk_1F400C400;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    unint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4 withRawData:v5];
    [v3 logEntry:v6];
  }
}

void logPauseStateNotificationReceived(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v2 = *MEMORY[0x1E4F92D30];
    id v3 = a2;
    uint64_t v4 = +[PLOperator entryKeyForType:v2 andName:@"State"];
    uint64_t v7 = @"State";
    v8[0] = &unk_1F400C418;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    unint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4 withRawData:v5];
    [v3 logEntry:v6];
  }
}

id PLLogAggregateSummarizationService()
{
  if (PLLogAggregateSummarizationService_onceToken != -1) {
    dispatch_once(&PLLogAggregateSummarizationService_onceToken, &__block_literal_global_8);
  }
  v0 = (void *)PLLogAggregateSummarizationService___logObj;
  return v0;
}

uint64_t __PLLogAggregateSummarizationService_block_invoke()
{
  PLLogAggregateSummarizationService___logObj = (uint64_t)os_log_create("com.apple.powerlog", "aggregateSummarizationService");
  return MEMORY[0x1F41817F8]();
}

id PLLogScreenState()
{
  if (PLLogScreenState_onceToken != -1) {
    dispatch_once(&PLLogScreenState_onceToken, &__block_literal_global_9);
  }
  v0 = (void *)PLLogScreenState___logObj;
  return v0;
}

uint64_t __PLLogScreenState_block_invoke()
{
  PLLogScreenState___logObj = (uint64_t)os_log_create("com.apple.powerlog", "screenState");
  return MEMORY[0x1F41817F8]();
}

void sub_1E428AAD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void OUTLINED_FUNCTION_9_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xEu);
}

id PLLogApplication()
{
  if (PLLogApplication_onceToken != -1) {
    dispatch_once(&PLLogApplication_onceToken, &__block_literal_global_10);
  }
  v0 = (void *)PLLogApplication___logObj;
  return v0;
}

uint64_t __PLLogApplication_block_invoke()
{
  PLLogApplication___logObj = (uint64_t)os_log_create("com.apple.powerlog", "application");
  return MEMORY[0x1F41817F8]();
}

void sub_1E428BC1C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E428BD30(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E428BDCC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E4290A84(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 224));
  _Unwind_Resume(a1);
}

uint64_t TestRefreshAllAppsAndPlugins(uint64_t a1, void *a2)
{
  return [a2 refreshAllAppsAndPlugins];
}

void sub_1E4293EDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E4297770(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void sub_1E4297CAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48)
{
}

void sub_1E4298064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1E429841C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id PLLogSMC()
{
  if (PLLogSMC_onceToken != -1) {
    dispatch_once(&PLLogSMC_onceToken, &__block_literal_global_11);
  }
  v0 = (void *)PLLogSMC___logObj;
  return v0;
}

uint64_t __PLLogSMC_block_invoke()
{
  PLLogSMC___logObj = (uint64_t)os_log_create("com.apple.powerlog", "smc");
  return MEMORY[0x1F41817F8]();
}

void sub_1E42A175C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

void sub_1E42A22B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void OUTLINED_FUNCTION_2_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_6_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_9_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0xEu);
}

void OUTLINED_FUNCTION_11_1(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_1E42B5204(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id PLLogPush()
{
  if (PLLogPush_onceToken != -1) {
    dispatch_once(&PLLogPush_onceToken, &__block_literal_global_13);
  }
  v0 = (void *)PLLogPush___logObj;
  return v0;
}

uint64_t __PLLogPush_block_invoke()
{
  PLLogPush___logObj = (uint64_t)os_log_create("com.apple.powerlog", "push");
  return MEMORY[0x1F41817F8]();
}

void sub_1E42C14CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void testLogEvents(uint64_t a1, void *a2)
{
  v88[4] = *MEMORY[0x1E4F143B8];
  v87[0] = @"bundleID";
  v87[1] = @"updateType";
  v88[0] = @"cloudphotod";
  v88[1] = &unk_1F400CAC0;
  v87[2] = @"eventIntervals";
  v84[0] = @"startDate";
  uint64_t v2 = (void *)MEMORY[0x1E4F1C9C8];
  id v50 = a2;
  id v3 = [v2 dateWithTimeIntervalSince1970:0.0];
  v84[1] = @"endDate";
  v85[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:3.0];
  v85[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:v84 count:2];
  v86[0] = v5;
  v82[0] = @"startDate";
  unint64_t v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:8.0];
  v82[1] = @"endDate";
  v83[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:25.0];
  v83[1] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:v82 count:2];
  v86[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:2];
  v87[3] = @"childBundleIDToWeight";
  v88[2] = v9;
  v88[3] = &unk_1F400F5B0;
  v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v88 forKeys:v87 count:4];

  v80[0] = @"bundleID";
  v80[1] = @"updateType";
  v81[0] = @"com.apple.bird";
  v81[1] = &unk_1F400CAC0;
  v80[2] = @"eventIntervals";
  v77[0] = @"startDate";
  uint64_t v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:0.0];
  v78[0] = v10;
  v77[1] = @"endDate";
  id v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:5.0];
  v78[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:v77 count:2];
  v79[0] = v12;
  v75[0] = @"startDate";
  id v13 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:7.0];
  v76[0] = v13;
  v75[1] = @"endDate";
  uint64_t v14 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:12.0];
  v76[1] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:v75 count:2];
  v79[1] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:2];
  v81[2] = v16;
  v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v81 forKeys:v80 count:3];

  v73[0] = @"bundleID";
  v73[1] = @"updateType";
  v74[0] = @"nsurlsessiond";
  v74[1] = &unk_1F400CAC0;
  v73[2] = @"eventIntervals";
  v70[0] = @"startDate";
  v47 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:0.0];
  v70[1] = @"endDate";
  v71[0] = v47;
  uint64_t v46 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:1.0];
  v71[1] = v46;
  v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:v70 count:2];
  v72[0] = v45;
  v68[0] = @"startDate";
  v44 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:1.0];
  v68[1] = @"endDate";
  v69[0] = v44;
  v43 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:1.0];
  v69[1] = v43;
  v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:v68 count:2];
  v72[1] = v42;
  v66[0] = @"startDate";
  v41 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:1.0];
  v66[1] = @"endDate";
  v67[0] = v41;
  v40 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:1.0];
  v67[1] = v40;
  id v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:v66 count:2];
  v72[2] = v39;
  v64[0] = @"startDate";
  uint64_t v38 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:1.0];
  v64[1] = @"endDate";
  v65[0] = v38;
  id v37 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:2.0];
  v65[1] = v37;
  v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:2];
  v72[3] = v36;
  v62[0] = @"startDate";
  v35 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:2.0];
  v62[1] = @"endDate";
  v63[0] = v35;
  v34 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:7.0];
  v63[1] = v34;
  v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:2];
  v72[4] = v33;
  v60[0] = @"startDate";
  v32 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:7.0];
  v60[1] = @"endDate";
  v61[0] = v32;
  v31 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:14.0];
  v61[1] = v31;
  uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:2];
  v72[5] = v30;
  v58[0] = @"startDate";
  id v29 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:20.0];
  v58[1] = @"endDate";
  v59[0] = v29;
  uint64_t v17 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:24.0];
  v59[1] = v17;
  uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:2];
  v72[6] = v18;
  v56[0] = @"startDate";
  v19 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:27.0];
  v56[1] = @"endDate";
  v57[0] = v19;
  id v20 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:34.0];
  v57[1] = v20;
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:2];
  v72[7] = v21;
  v54[0] = @"startDate";
  uint64_t v22 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:34.0];
  v54[1] = @"endDate";
  v55[0] = v22;
  v23 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:40.0];
  v55[1] = v23;
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:2];
  v72[8] = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:9];
  v74[2] = v25;
  v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v74 forKeys:v73 count:3];

  v51[0] = v49;
  v51[1] = v48;
  v51[2] = v28;
  v52 = @"events";
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:3];
  v53 = v26;
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];

  [v50 didReceiveEventWithPayload:v27];
}

void testReportEnergy(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 energyResponse];
  id v3 = [NSString stringWithFormat:@"energyResponse=%@", v2];
  uint64_t v4 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
  unint64_t v6 = [v5 lastPathComponent];
  uint64_t v7 = [NSString stringWithUTF8String:"testReportEnergy"];
  [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:684];

  id v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
  }
}

uint64_t testStartEvent(uint64_t a1, void *a2)
{
  return [a2 didReceiveStartEventWithPayload:&unk_1F400F600];
}

uint64_t testStartEvent2(uint64_t a1, void *a2)
{
  return [a2 didReceiveStartEventWithPayload:&unk_1F400F650];
}

id testStopEvent(uint64_t a1, void *a2)
{
  return (id)[a2 didReceiveStopEventWithPayload:&unk_1F400F6A0];
}

void testStopEvent2(uint64_t a1, void *a2)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v8[1] = @"info";
  v9[0] = @"diagnosticd";
  v6[0] = &unk_1F400CAC0;
  v6[1] = &unk_1F400CB08;
  v7[0] = &unk_1F4011F18;
  v7[1] = &unk_1F4011F28;
  v8[0] = @"bundleID";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
  v9[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  id v5 = (id)[v2 didReceiveStopEventWithPayload:v4];
}

uint64_t testReset(uint64_t a1, void *a2)
{
  return [a2 didReceiveReset];
}

void testCapping(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  unsigned int v3 = 0;
  double v4 = 0.0;
  do
  {
    unsigned int v16 = v3;
    unsigned int v5 = -20;
    double v6 = 0.0;
    do
    {
      [v2 capUtilizationInSeconds:v4 withUpperBoundInError:90.0 withCapInError:1.0 withCappedUpperBound:30.0];
      uint64_t v8 = v7;
      [v2 capUtilizationInSeconds:v6 withUpperBoundInError:90.0 withCapInError:10.0 withCappedUpperBound:30.0];
      uint64_t v10 = [NSString stringWithFormat:@"%f, %f => %f, %f", *(void *)&v4, *(void *)&v6, v8, v9];
      id v11 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
      id v13 = [v12 lastPathComponent];
      uint64_t v14 = [NSString stringWithUTF8String:"testCappingWithInput"];
      [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:1034];

      uint64_t v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v18 = v10;
        _os_log_debug_impl(&dword_1E4220000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      double v6 = v6 + 20.0;
      v5 += 20;
    }
    while (v5 < 0xB4);
    double v4 = v4 + 20.0;
    unsigned int v3 = v16 + 20;
  }
  while (v16 < 0xB4);
}

void OUTLINED_FUNCTION_4_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

unsigned char *OUTLINED_FUNCTION_5_0(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = 0;
  *a2 = 0;
  return result;
}

id PLLogNetwork()
{
  if (PLLogNetwork_onceToken != -1) {
    dispatch_once(&PLLogNetwork_onceToken, &__block_literal_global_15);
  }
  v0 = (void *)PLLogNetwork___logObj;
  return v0;
}

uint64_t __PLLogNetwork_block_invoke()
{
  PLLogNetwork___logObj = (uint64_t)os_log_create("com.apple.powerlog", "network");
  return MEMORY[0x1F41817F8]();
}

void sub_1E42D2634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
}

void sub_1E42E1FCC(void *a1, int a2)
{
  if (a2 == 2)
  {
    objc_end_catch();
    JUMPOUT(0x1E42E1F9CLL);
  }
  objc_exception_rethrow();
}

void sub_1E42E1FF0(_Unwind_Exception *a1)
{
}

id PLLogProcessMonitor()
{
  if (PLLogProcessMonitor_onceToken != -1) {
    dispatch_once(&PLLogProcessMonitor_onceToken, &__block_literal_global_19);
  }
  v0 = (void *)PLLogProcessMonitor___logObj;
  return v0;
}

uint64_t __PLLogProcessMonitor_block_invoke()
{
  PLLogProcessMonitor___logObj = (uint64_t)os_log_create("com.apple.powerlog", "processMonitor");
  return MEMORY[0x1F41817F8]();
}

void sub_1E42EACF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29)
{
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_5_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_9_3(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

void OUTLINED_FUNCTION_10_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

id PLLogWifi()
{
  if (PLLogWifi_onceToken != -1) {
    dispatch_once(&PLLogWifi_onceToken, &__block_literal_global_20);
  }
  v0 = (void *)PLLogWifi___logObj;
  return v0;
}

uint64_t __PLLogWifi_block_invoke()
{
  PLLogWifi___logObj = (uint64_t)os_log_create("com.apple.powerlog", "wifi");
  return MEMORY[0x1F41817F8]();
}

void WiFiDeviceAttached(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  double v4 = [v3 workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __WiFiDeviceAttached_block_invoke;
  block[3] = &unk_1E6E47848;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

void WiFiVirtualInterfaceCallback(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__11;
  uint64_t v22 = __Block_byref_object_dispose__11;
  id v23 = a2;
  id v5 = (void *)v19[5];
  if (v5)
  {
    double v6 = [v5 objectForKeyedSubscript:@"LINK_CHANGED_IS_LINKDOWN"];

    if (v6)
    {
      id v7 = [v4 workQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __WiFiVirtualInterfaceCallback_block_invoke;
      block[3] = &unk_1E6E493F0;
      id v16 = v4;
      uint64_t v17 = &v18;
      dispatch_async(v7, block);
    }
  }
  uint64_t v8 = (void *)v19[5];
  if (v8)
  {
    uint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F78C18]];
    if (v9)
    {
      uint64_t v10 = [(id)v19[5] objectForKeyedSubscript:*MEMORY[0x1E4F78C10]];

      if (v10)
      {
        id v11 = [v4 workQueue];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __WiFiVirtualInterfaceCallback_block_invoke_2;
        v12[3] = &unk_1E6E493F0;
        id v13 = v4;
        uint64_t v14 = &v18;
        dispatch_async(v11, v12);
      }
    }
  }
  _Block_object_dispose(&v18, 8);
}

void sub_1E42FC6C4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t WiFiStateChangeCallback(uint64_t a1, void *a2)
{
  return [a2 logFromCFCallback:@"WiFiStateChangeCallback"];
}

uint64_t WiFiLinkChangeCallback(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 logFromLinkChangeCallback:@"WiFiLinkChangeCallback" withStats:a2];
}

void WiFiDeviceAvailableCallback(uint64_t a1, const __CFDictionary *a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(a2, @"DRIVER_AVAILABLE");
    if (CFBooleanGetValue(Value))
    {
      if (CFDictionaryContainsKey(a2, @"IO80211InterfaceWoWWakeUpParams")) {
        id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithDictionary:copyItems:", CFDictionaryGetValue(a2, @"IO80211InterfaceWoWWakeUpParams"), 1);
      }
      else {
        id v5 = 0;
      }
      [v6 logFromWiFiNoAvailableCallback:@"WiFiDeviceAvailableCallback" withAvailability:1 withWakeParams:v5];
    }
  }
}

void WiFiClientScanCacheCallback(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__11;
  uint64_t v18 = __Block_byref_object_dispose__11;
  id v19 = a5;
  if (a2)
  {
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(a2))
    {
      CFRetain(a2);
      id v7 = a2;
      uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v7];
      uint64_t v9 = (void *)v8;
      if (v15[5] && v8)
      {
        CFRelease(v7);
        uint64_t v10 = [(id)v15[5] workQueue];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __WiFiClientScanCacheCallback_block_invoke;
        v11[3] = &unk_1E6E47E68;
        id v13 = &v14;
        id v12 = v9;
        dispatch_async(v10, v11);
      }
    }
  }
  _Block_object_dispose(&v14, 8);
}

void sub_1E42FD07C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t WiFiManagerClientUserAutoJoinStateChangedCallback1(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return [a4 logFromAJCallback:@"WiFiManagerClientUserAutoJoinStateChangedCallback" withFlag:a2 withStats:a3];
}

void WiFiDeviceLinkQualityChanged(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [v4 remainingAllowedRSSIEntryCount];
  if (a2 && v5)
  {
    id v6 = a2;
    id v7 = [v4 workQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __WiFiDeviceLinkQualityChanged_block_invoke;
    void v9[3] = &unk_1E6E47EB8;
    id v10 = v4;
    id v11 = v6;
    id v8 = v6;
    dispatch_async(v7, v9);
  }
}

void __WiFiDeviceAttached_block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4E7EF70]();
  [*(id *)(a1 + 32) findWifiDevice];
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

void __WiFiVirtualInterfaceCallback_block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4E7EF70]();
  [*(id *)(a1 + 32) logEventForwardAWDLState:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void __WiFiVirtualInterfaceCallback_block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4E7EF70]();
  [*(id *)(a1 + 32) logEventForwardHotspotState:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void __WiFiDeviceLinkQualityChanged_block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4E7EF70]();
  [*(id *)(a1 + 32) logEventForwardRSSI:*(void *)(a1 + 40)];
}

uint64_t __WiFiClientScanCacheCallback_block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) updateEventBackwardUserScanDuration:*(void *)(a1 + 32)];
}

id PLLogBatteryGaugeService()
{
  if (PLLogBatteryGaugeService_onceToken != -1) {
    dispatch_once(&PLLogBatteryGaugeService_onceToken, &__block_literal_global_21);
  }
  v0 = (void *)PLLogBatteryGaugeService_log;
  return v0;
}

uint64_t __PLLogBatteryGaugeService_block_invoke()
{
  PLLogBatteryGaugeService_log = (uint64_t)os_log_create("com.apple.powerlog", "batteryGaugeService");
  return MEMORY[0x1F41817F8]();
}

void sub_1E430F3F8(_Unwind_Exception *a1)
{
}

void sub_1E430F57C(_Unwind_Exception *a1)
{
}

void sub_1E4312398(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
}

void OUTLINED_FUNCTION_2_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x1Cu);
}

void OUTLINED_FUNCTION_4_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x26u);
}

void OUTLINED_FUNCTION_5_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_7_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x26u);
}

void sub_1E43132C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E4313A98(_Unwind_Exception *a1)
{
}

void sub_1E4313E30(_Unwind_Exception *a1)
{
}

void sub_1E43140F0(_Unwind_Exception *a1)
{
}

void sub_1E43143C4(_Unwind_Exception *a1)
{
}

void sub_1E4314690(_Unwind_Exception *a1)
{
}

void sub_1E431495C(_Unwind_Exception *a1)
{
}

void sub_1E4314B20(_Unwind_Exception *a1)
{
}

void sub_1E4314EC4(_Unwind_Exception *a1)
{
}

void sub_1E431505C(_Unwind_Exception *a1)
{
}

void sub_1E4315210(_Unwind_Exception *a1)
{
}

void sub_1E43153BC(_Unwind_Exception *a1)
{
}

void sub_1E43154D4(_Unwind_Exception *a1)
{
}

void sub_1E4315680(_Unwind_Exception *a1)
{
}

id PLLogXPC()
{
  if (PLLogXPC_onceToken != -1) {
    dispatch_once(&PLLogXPC_onceToken, &__block_literal_global_23);
  }
  v0 = (void *)PLLogXPC___logObj;
  return v0;
}

uint64_t __PLLogXPC_block_invoke()
{
  PLLogXPC___logObj = (uint64_t)os_log_create("com.apple.powerlog", "xpc");
  return MEMORY[0x1F41817F8]();
}

void sub_1E433FF64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_11_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_13(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void fsEventsHandler(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v14 = a4;
  if (a3)
  {
    uint64_t v7 = 0;
    do
    {
      if ((~*(_DWORD *)(a5 + 4 * v7) & 0x10100) == 0)
      {
        id v8 = [v14 objectAtIndexedSubscript:v7];
        uint64_t v9 = [v8 lastPathComponent];

        if ((~*(_DWORD *)(a5 + 4 * v7) & 0x900) == 0)
        {
          uint64_t v10 = [v9 componentsSeparatedByString:@"."];
          if ([v10 count] == 4)
          {
            id v11 = [v10 objectAtIndexedSubscript:1];
            int v12 = [v11 isEqualToString:@"microstackshots"];

            if (v12) {
              [a2 logLogFileName:@"microstackshots" withName:v9];
            }
          }
        }
      }
      ++v7;
    }
    while (a3 != v7);
  }
}

void PLProcessCPU::PLProcessCPU(PLProcessCPU *this)
{
  *(void *)this = &unk_1F3FC7A90;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((_DWORD *)this + 10) = 1065353216;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_DWORD *)this + 20) = 1065353216;
  *((void *)this + 19) = 0;
  os_log_t v2 = os_log_create("com.apple.powerlog", "PLProcessCPU");
  id v3 = (void *)*((void *)this + 19);
  *((void *)this + 19) = v2;

  LODWORD(count) = 0;
  *((_DWORD *)this + 27) = 0;
  *((_DWORD *)this + 28) = 0;
  *((void *)this + 17) = 0x100000000;
  *((unsigned char *)this + 144) = 1;
  uint64_t v4 = mach_absolute_time();
  *((void *)this + 15) = v4;
  *((void *)this + 16) = v4;
  size_t v7 = 4;
  sysctlbyname("kern.maxproc", &count, &v7, 0, 0);
  *((void *)this + 11) = malloc_type_calloc((int)count, 4uLL, 0x100004052888210uLL);
  uint64_t v5 = malloc_type_calloc((int)count, 4uLL, 0x100004052888210uLL);
  *((void *)this + 12) = v5;
  *((_DWORD *)this + 26) = 4 * count;
  id v6 = *((void *)this + 19);
  if (!*((void *)this + 11) || !v5)
  {
    if (os_log_type_enabled(*((os_log_t *)this + 19), OS_LOG_TYPE_ERROR)) {
      PLProcessCPU::PLProcessCPU(v6);
    }
    __cxa_rethrow();
  }
  if (os_log_type_enabled(*((os_log_t *)this + 19), OS_LOG_TYPE_DEBUG)) {
    PLProcessCPU::PLProcessCPU(v6);
  }
}

void sub_1E4343F88(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>>>::~__hash_table(v3);
  std::__hash_table<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::__unordered_map_hasher<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>>>::~__hash_table(v2);
  _Unwind_Resume(a1);
}

void PLProcessCPU::~PLProcessCPU(void **this)
{
  *this = &unk_1F3FC7A90;
  free(this[11]);
  free(this[12]);

  std::__hash_table<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>>>::~__hash_table((uint64_t)(this + 6));
  std::__hash_table<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::__unordered_map_hasher<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>>>::~__hash_table((uint64_t)(this + 1));
}

void PLProcessCPU::findMissing(PLProcessCPU *this@<X0>, char **a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  uint64_t v3 = *((unsigned int *)this + *((int *)this + 35) + 27);
  if (v3)
  {
    unint64_t v5 = *((unsigned int *)this + *((int *)this + 34) + 27);
    if ((int)v5 >= 1 && (int)v3 >= 1)
    {
      size_t v7 = 0;
      unint64_t v8 = 0;
      LODWORD(v9) = 0;
      uint64_t v10 = a2 + 2;
      do
      {
        uint64_t v11 = v5 - v8;
        uint64_t v9 = (int)v9;
        while (1)
        {
          uint64_t v12 = *((void *)this + *((int *)this + 35) + 11);
          int v13 = *(_DWORD *)(v12 + 4 * v9);
          if (*(_DWORD *)(*((void *)this + *((int *)this + 34) + 11) + 4 * v8) == v13) {
            break;
          }
          if (v11 >= v3 - v9) {
            goto LABEL_31;
          }
          if ((unint64_t)v7 >= *v10)
          {
            uint64_t v15 = *a2;
            uint64_t v16 = (v7 - *a2) >> 2;
            unint64_t v17 = v16 + 1;
            if ((unint64_t)(v16 + 1) >> 62) {
              std::vector<int>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v18 = *v10 - (void)v15;
            if (v18 >> 1 > v17) {
              unint64_t v17 = v18 >> 1;
            }
            if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v19 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v19 = v17;
            }
            if (v19)
            {
              uint64_t v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(a2 + 2), v19);
              uint64_t v15 = *a2;
              size_t v7 = a2[1];
              int v13 = *(_DWORD *)(v12 + 4 * v9);
            }
            else
            {
              uint64_t v20 = 0;
            }
            uint64_t v21 = &v20[4 * v16];
            *(_DWORD *)uint64_t v21 = v13;
            id v14 = v21 + 4;
            while (v7 != v15)
            {
              int v22 = *((_DWORD *)v7 - 1);
              v7 -= 4;
              *((_DWORD *)v21 - 1) = v22;
              v21 -= 4;
            }
            *a2 = v21;
            a2[1] = v14;
            a2[2] = &v20[4 * v19];
            if (v15) {
              operator delete(v15);
            }
          }
          else
          {
            *(_DWORD *)size_t v7 = v13;
            id v14 = v7 + 4;
          }
          a2[1] = v14;
          ++v9;
          size_t v7 = v14;
          if (v9 >= v3) {
            return;
          }
        }
        if (v3 - v9 == v11) {
          return;
        }
        LODWORD(v9) = v9 + 1;
LABEL_31:
        ++v8;
      }
      while (v8 < v5 && (int)v9 < (int)v3);
    }
  }
}

void sub_1E43441CC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void PLProcessCPU::cleanupDeadPids(PLProcessCPU *this)
{
  PLProcessCPU::findMissing(this, &v9);
  uint64_t v2 = (int *)v9;
  uint64_t v3 = (int *)v10;
  if (v9 != v10)
  {
    uint64_t v4 = (void *)((char *)this + 8);
    unint64_t v5 = (char *)this + 48;
    do
    {
      int v8 = *v2;
      id v6 = std::__hash_table<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::__unordered_map_hasher<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>>>::find<int>(v4, &v8);
      if (v6)
      {
        uint64_t v11 = v6 + 3;
        size_t v7 = std::__hash_table<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)v5, (unint64_t *)v6 + 3, (uint64_t)&std::piecewise_construct, &v11);
        std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__erase_unique<int>(v7 + 3, &v8);
        std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__erase_unique<int>(v4, &v8);
      }
      ++v2;
    }
    while (v2 != v3);
    uint64_t v2 = (int *)v9;
  }
  if (v2)
  {
    uint64_t v10 = (char *)v2;
    operator delete(v2);
  }
}

void sub_1E43442B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

__darwin_ino64_t PLProcessCPU::getInode(PLProcessCPU *this, const char *a2)
{
  if (stat(a2, &v3) == -1) {
    return -1;
  }
  else {
    return v3.st_ino;
  }
}

char *PLProcessCPU::getName(PLProcessCPU *this, char *a2)
{
  return basename(a2);
}

unint64_t PLProcessCPU::updateInodeMap(PLProcessCPU *this, int *a2)
{
  buffer[128] = *MEMORY[0x1E4F143B8];
  if (*a2)
  {
    if (!proc_pidpath(*a2, buffer, 0x400u))
    {
      exception = __cxa_allocate_exception(8uLL);
      void *exception = "Unable to get path for pid, or process terminated";
      __cxa_throw(exception, MEMORY[0x1E4FBA308], 0);
    }
    uint64_t v4 = (**(uint64_t (***)(PLProcessCPU *, void *))this)(this, buffer);
    unint64_t v14 = v4;
    if (v4 == -1)
    {
      unint64_t v5 = __cxa_allocate_exception(8uLL);
      *unint64_t v5 = "Cannot find the inode for the process";
      __cxa_throw(v5, MEMORY[0x1E4FBA308], 0);
    }
  }
  else
  {
    uint64_t v4 = 0;
    strcpy((char *)buffer, "kernel_task");
    unint64_t v14 = 0;
  }
  *(void *)&long long v12 = a2;
  std::__hash_table<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::__unordered_map_hasher<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)this + 8, a2, (uint64_t)&std::piecewise_construct, (_DWORD **)&v12)[3] = v4;
  *(void *)&long long v12 = &v14;
  id v6 = std::__hash_table<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)this + 48, &v14, (uint64_t)&std::piecewise_construct, (void **)&v12);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((uint64_t)(v6 + 3), a2, a2);
  if (*((char *)v6 + 87) < 0)
  {
    if (v6[9]) {
      return v14;
    }
  }
  else if (*((unsigned char *)v6 + 87))
  {
    return v14;
  }
  size_t v7 = (char *)(*(uint64_t (**)(PLProcessCPU *, void *))(*(void *)this + 8))(this, buffer);
  if (!v7)
  {
    uint64_t v11 = __cxa_allocate_exception(8uLL);
    void *v11 = "Unable to get basename for the process";
    __cxa_throw(v11, MEMORY[0x1E4FBA308], 0);
  }
  std::string::basic_string[abi:ne180100]<0>(&v12, v7);
  int v8 = (void **)(v6 + 8);
  if (*((char *)v6 + 87) < 0) {
    operator delete(*v8);
  }
  *(_OWORD *)int v8 = v12;
  v6[10] = v13;
  return v14;
}

uint64_t PLProcessCPU::getCpu(PLProcessCPU *this, int pid, proc_taskinfo *buffer)
{
  return proc_pidinfo(pid, 4, 0, buffer, 96);
}

uint64_t PLProcessCPU::getRawCpu(PLProcessCPU *this, int *a2, unint64_t *a3)
{
  if ((*(unsigned int (**)(PLProcessCPU *, void, void *))(*(void *)this + 16))(this, *a2, v9) != 96)
  {
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__erase_unique<int>((void *)this + 1, a2);
    size_t v7 = std::__hash_table<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>>>::find<unsigned long long>((void *)this + 6, a3);
    if (!v7[6]) {
      std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__erase_unique<int>(v7 + 3, a2);
    }
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "Process terminated while acquiring pidinfo";
    __cxa_throw(exception, MEMORY[0x1E4FBA308], 0);
  }
  return v9[3] + v9[2];
}

uint64_t PLProcessCPU::aggregateCpu(uint64_t a1, void *a2, uint64_t *a3, unint64_t *a4)
{
  size_t v7 = std::__hash_table<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>>>::find<unsigned long long>(a2, a4);
  if (v7)
  {
    int v8 = v7;
    uint64_t result = v7[3];
    uint64_t v10 = *a3 + result;
    *a3 = v10;
    v8[3] = v10;
  }
  else
  {
    uint64_t v11 = *a3;
    uint64_t v13 = a4;
    long long v12 = std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)a2, a4, (uint64_t)&std::piecewise_construct, &v13);
    uint64_t result = 0;
    v12[3] = v11;
  }
  return result;
}

void PLProcessCPU::addToReport(uint64_t a1, unint64_t *a2, void *a3, uint64_t a4, uint64_t *a5, unint64_t *a6)
{
  uint64_t v10 = PLProcessCPU::aggregateCpu(a1, a3, a5, a2);
  v25[0] = *a2;
  v25[1] = v10;
  uint64_t v11 = std::__tree<std::pair<unsigned long long,unsigned long long>,PLProcessCPU::compare_t,std::allocator<std::pair<unsigned long long,unsigned long long>>>::find<std::pair<unsigned long long,unsigned long long>>(a4, v25);
  long long v12 = (uint64_t **)(a4 + 8);
  if ((uint64_t *)(a4 + 8) != v11)
  {
    uint64_t v13 = v11;
    std::__tree<std::pair<unsigned long long,unsigned long long>,PLProcessCPU::compare_t,std::allocator<std::pair<unsigned long long,unsigned long long>>>::__remove_node_pointer((uint64_t **)a4, v11);
    operator delete(v13);
  }
  unint64_t v14 = *a5;
  if (*(void *)(a4 + 16) != 10 || v14 > *a6)
  {
    *(void *)&long long v24 = *a2;
    *((void *)&v24 + 1) = v14;
    std::__tree<std::pair<unsigned long long,unsigned long long>,PLProcessCPU::compare_t,std::allocator<std::pair<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<std::pair<unsigned long long,unsigned long long>,std::pair<unsigned long long,unsigned long long>>((uint64_t **)a4, (uint64_t *)&v24, &v24);
    if (*(void *)(a4 + 16) >= 0xBuLL)
    {
      do
      {
        uint64_t v16 = *v12;
        unint64_t v17 = (uint64_t *)(a4 + 8);
        if (*v12)
        {
          do
          {
            unint64_t v17 = v16;
            uint64_t v16 = (uint64_t *)v16[1];
          }
          while (v16);
          uint64_t v18 = (uint64_t *)*v17;
        }
        else
        {
          do
          {
            unint64_t v19 = v17;
            unint64_t v17 = (uint64_t *)v17[2];
            uint64_t v18 = (uint64_t *)*v17;
          }
          while ((uint64_t *)*v17 == v19);
        }
        if (v18)
        {
          do
          {
            unint64_t v17 = v18;
            uint64_t v18 = (uint64_t *)v18[1];
          }
          while (v18);
          *a6 = v17[5];
        }
        else
        {
          do
          {
            int v22 = v17;
            unint64_t v17 = (uint64_t *)v17[2];
          }
          while ((uint64_t *)*v17 == v22);
          id v23 = (uint64_t *)v17[1];
          *a6 = v17[5];
          if (v23)
          {
            do
            {
              uint64_t v20 = v23;
              id v23 = (uint64_t *)*v23;
            }
            while (v23);
            goto LABEL_22;
          }
        }
        do
        {
          uint64_t v20 = (uint64_t *)v17[2];
          BOOL v21 = *v20 == (void)v17;
          unint64_t v17 = v20;
        }
        while (!v21);
LABEL_22:
        std::__tree<std::pair<unsigned long long,unsigned long long>,PLProcessCPU::compare_t,std::allocator<std::pair<unsigned long long,unsigned long long>>>::__remove_node_pointer((uint64_t **)a4, v20);
        operator delete(v20);
      }
      while (*(void *)(a4 + 16) > 0xAuLL);
    }
  }
}

void PLProcessCPU::reportCpus(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  +[PLUtilities secondsFromMachTime:*a3];
  float v6 = v5 * 1000.0;
  +[PLUtilities secondsFromMachTime:*(void *)(a1 + 120 + 8 * *(int *)(a1 + 136)) - *(void *)(a1 + 120 + 8 * *(int *)(a1 + 140))];
  if (a2[2])
  {
    double v8 = *(double *)&v7;
    uint64_t v9 = *(NSObject **)(a1 + 152);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      float v10 = v8;
      *(_DWORD *)buf = 134218240;
      *(double *)uint64_t v30 = v6;
      *(_WORD *)&v30[8] = 2048;
      *(double *)&v30[10] = v10;
      _os_log_impl(&dword_1E4220000, v9, OS_LOG_TYPE_DEFAULT, "plcpu-00, %8.2f ms, %6.2f s", buf, 0x16u);
    }
  }
  uint64_t v13 = (void *)*a2;
  uint64_t v11 = a2 + 1;
  long long v12 = v13;
  if (v13 != v11)
  {
    int v14 = 0;
    double v15 = v6;
    *(void *)&long long v7 = 67110146;
    long long v26 = v7;
    do
    {
      long long v27 = *((_OWORD *)v12 + 2);
      +[PLUtilities secondsFromMachTime:](PLUtilities, "secondsFromMachTime:", *((void *)&v27 + 1), v26, v27);
      double v17 = v16;
      uint64_t v18 = *(id *)(a1 + 152);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v28 = &v27;
        int v19 = *(_DWORD *)(std::__hash_table<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(a1 + 48, (unint64_t *)&v27, (uint64_t)&std::piecewise_construct, (void **)&v28)[5]+ 16);
        v28 = &v27;
        uint64_t v20 = std::__hash_table<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(a1 + 48, (unint64_t *)&v27, (uint64_t)&std::piecewise_construct, (void **)&v28);
        BOOL v21 = v20 + 8;
        if (*((char *)v20 + 87) < 0) {
          BOOL v21 = (void *)*v21;
        }
        float v22 = v17 * 1000.0;
        ++v14;
        *(_DWORD *)buf = v26;
        *(_DWORD *)uint64_t v30 = v14;
        *(_WORD *)&v30[4] = 2048;
        *(double *)&v30[6] = v22;
        *(_WORD *)&v30[14] = 2048;
        *(double *)&v30[16] = v22 * 100.0 / v15;
        __int16 v31 = 1024;
        int v32 = v19;
        __int16 v33 = 2080;
        v34 = v21;
        _os_log_impl(&dword_1E4220000, v18, OS_LOG_TYPE_DEFAULT, "plcpu-%02d, %8.2f ms, %6.2f %%, %5d, %s", buf, 0x2Cu);
      }

      id v23 = (void *)v12[1];
      if (v23)
      {
        do
        {
          long long v24 = v23;
          id v23 = (void *)*v23;
        }
        while (v23);
      }
      else
      {
        do
        {
          long long v24 = (void *)v12[2];
          BOOL v25 = *v24 == (void)v12;
          long long v12 = v24;
        }
        while (!v25);
      }
      long long v12 = v24;
    }
    while (v24 != v11);
  }
}

void sub_1E4344AC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t PLProcessCPU::processPids(int32x2_t *this)
{
  this[13].i32[this[17].i32[0] + 1] = proc_listallpids(*(void **)&this[this[17].i32[0] + 11], this[13].i32[0]);
  PLProcessCPU::cleanupDeadPids((PLProcessCPU *)this);
  memset(v16, 0, sizeof(v16));
  int v17 = 1065353216;
  v15[0] = 0;
  v15[1] = 0;
  unint64_t v13 = 0;
  int v14 = v15;
  uint64_t v12 = 0;
  uint64_t v2 = mach_absolute_time();
  uint64_t v3 = this[17].i32[0];
  this[v3 + 15] = (int32x2_t)v2;
  if (this[13].i32[v3 + 1] >= 1)
  {
    uint64_t v4 = 0;
    do
    {
      int v11 = 0;
      int v11 = *(_DWORD *)(*(void *)&this[v3 + 11] + 4 * v4);
      unint64_t v10 = 0;
      double v5 = std::__hash_table<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::__unordered_map_hasher<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>>>::find<int>(&this[1], &v11);
      float v6 = v5;
      if (v5) {
        unint64_t updated = v5[3];
      }
      else {
        unint64_t updated = PLProcessCPU::updateInodeMap((PLProcessCPU *)this, &v11);
      }
      unint64_t v10 = updated;
      uint64_t RawCpu = PLProcessCPU::getRawCpu((PLProcessCPU *)this, &v11, &v10);
      if (v6)
      {
        v6[this[17].i32[0] + 4] = RawCpu;
        if (!this[18].i8[0])
        {
          uint64_t v18 = (int *)(RawCpu - v6[this[17].i32[1] + 4]);
          v12 += (uint64_t)v18;
          if (v18) {
            PLProcessCPU::addToReport(RawCpu, &v10, v16, (uint64_t)&v14, (uint64_t *)&v18, &v13);
          }
        }
      }
      else
      {
        uint64_t v18 = &v11;
        std::__hash_table<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::__unordered_map_hasher<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)&this[1], &v11, (uint64_t)&std::piecewise_construct, &v18)[this[17].i32[0] + 4] = RawCpu;
      }
      ++v4;
      uint64_t v3 = this[17].i32[0];
    }
    while (v4 < this[13].i32[v3 + 1]);
  }
  PLProcessCPU::reportCpus((uint64_t)this, &v14, &v12);
  this[17] = vrev64_s32(this[17]);
  this[18].i8[0] = 0;
  std::__tree<std::pair<unsigned long long,unsigned long long>,PLProcessCPU::compare_t,std::allocator<std::pair<unsigned long long,unsigned long long>>>::destroy((uint64_t)&v14, v15[0]);
  return std::__hash_table<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::__unordered_map_hasher<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>>>::~__hash_table((uint64_t)v16);
}

void sub_1E4344CE0()
{
}

uint64_t std::__hash_table<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::__unordered_map_hasher<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>>>::~__hash_table(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      uint64_t v3 = (void *)*v2;
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>>>::__deallocate_node(a1, *(void **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>>>::__deallocate_node(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      uint64_t v3 = (void *)*v2;
      std::__destroy_at[abi:ne180100]<std::pair<unsigned long long const,PLProcessCPU::inode_data_t>,0>((uint64_t)(v2 + 2));
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

uint64_t std::__destroy_at[abi:ne180100]<std::pair<unsigned long long const,PLProcessCPU::inode_data_t>,0>(uint64_t a1)
{
  if (*(char *)(a1 + 71) < 0) {
    operator delete(*(void **)(a1 + 48));
  }
  return std::__hash_table<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::__unordered_map_hasher<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>>>::~__hash_table(a1 + 8);
}

void std::vector<int>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E6E47050, MEMORY[0x1E4FBA1C8]);
}

void sub_1E4344E78(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(4 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E4FBA350], MEMORY[0x1E4FBA1F8]);
}

uint64_t *std::__hash_table<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::__unordered_map_hasher<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>>>::find<int>(void *a1, int *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (*(void *)&v2 <= v3) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (*(void *)&v2 - 1) & v3;
  }
  float v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  for (uint64_t result = *v6; result; uint64_t result = (uint64_t *)*result)
  {
    unint64_t v8 = result[1];
    if (v8 == v3)
    {
      if (*((_DWORD *)result + 4) == v3) {
        return result;
      }
    }
    else
    {
      if (v4.u32[0] > 1uLL)
      {
        if (v8 >= *(void *)&v2) {
          v8 %= *(void *)&v2;
        }
      }
      else
      {
        v8 &= *(void *)&v2 - 1;
      }
      if (v8 != v5) {
        return 0;
      }
    }
  }
  return result;
}

void *std::__hash_table<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(uint64_t a1, unint64_t *a2, uint64_t a3, void **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    unint64_t v10 = *(void **)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      int v11 = (void *)*v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (v11[2] == v7) {
              return v11;
            }
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4) {
              break;
            }
          }
          int v11 = (void *)*v11;
        }
        while (v11);
      }
    }
  }
  uint64_t v13 = a1 + 16;
  int v14 = (char *)operator new(0x58uLL);
  v24[0] = v14;
  v24[1] = a1 + 16;
  *(void *)int v14 = 0;
  *((void *)v14 + 1) = v7;
  *((void *)v14 + 2) = **a4;
  *((void *)v14 + 7) = 0;
  *((void *)v14 + 8) = 0;
  *(_OWORD *)(v14 + 40) = 0u;
  *(_OWORD *)(v14 + 24) = 0u;
  *((_DWORD *)v14 + 14) = 1065353216;
  *((void *)v14 + 9) = 0;
  *((void *)v14 + 10) = 0;
  char v25 = 1;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v16 = *(float *)(a1 + 32);
  if (!v8 || (float)(v16 * (float)v8) < v15)
  {
    BOOL v17 = 1;
    if (v8 >= 3) {
      BOOL v17 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v8);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    std::__hash_table<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>>>::__rehash<true>(a1, v20);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }
  BOOL v21 = *(void **)(*(void *)a1 + 8 * v4);
  if (v21)
  {
    *(void *)v24[0] = *v21;
    void *v21 = v24[0];
  }
  else
  {
    *(void *)v24[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v24[0];
    *(void *)(*(void *)a1 + 8 * v4) = v13;
    if (*(void *)v24[0])
    {
      unint64_t v22 = *(void *)(*(void *)v24[0] + 8);
      if ((v8 & (v8 - 1)) != 0)
      {
        if (v22 >= v8) {
          v22 %= v8;
        }
      }
      else
      {
        v22 &= v8 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v22) = v24[0];
    }
  }
  int v11 = (void *)v24[0];
  v24[0] = 0;
  ++*(void *)(a1 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,void *>>>>::reset[abi:ne180100]((uint64_t)v24, 0);
  return v11;
}

void sub_1E4345240(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>>>::__rehash<true>(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      std::__hash_table<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>>>::__do_rehash<true>(a1, prime);
    }
  }
}

void std::__hash_table<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      int v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            void *v7 = *v11;
            void *v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            int v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          int v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    unint64_t v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  int8x8_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<unsigned long long const,PLProcessCPU::inode_data_t>,0>((uint64_t)v2 + 16);
    }
    operator delete(v2);
  }
}

uint64_t *std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__erase_unique<int>(void *a1, int *a2)
{
  uint64_t result = std::__hash_table<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::__unordered_map_hasher<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>>>::find<int>(a1, a2);
  if (result)
  {
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::erase(a1, result);
    return (uint64_t *)1;
  }
  return result;
}

uint64_t std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::erase(void *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::remove(a1, a2, (uint64_t)&__p);
  unint64_t v3 = __p;
  __p = 0;
  if (v3) {
    operator delete(v3);
  }
  return v2;
}

void *std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::remove@<X0>(void *result@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  int8x8_t v3 = (int8x8_t)result[1];
  unint64_t v4 = a2[1];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(void *)&v3) {
      v4 %= *(void *)&v3;
    }
  }
  else
  {
    v4 &= *(void *)&v3 - 1;
  }
  uint64_t v6 = *(void **)(*result + 8 * v4);
  do
  {
    uint64_t v7 = v6;
    uint64_t v6 = (void *)*v6;
  }
  while (v6 != a2);
  if (v7 == result + 2) {
    goto LABEL_18;
  }
  unint64_t v8 = v7[1];
  if (v5.u32[0] > 1uLL)
  {
    if (v8 >= *(void *)&v3) {
      v8 %= *(void *)&v3;
    }
  }
  else
  {
    v8 &= *(void *)&v3 - 1;
  }
  if (v8 != v4)
  {
LABEL_18:
    if (!*a2) {
      goto LABEL_19;
    }
    unint64_t v9 = *(void *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v9 >= *(void *)&v3) {
        v9 %= *(void *)&v3;
      }
    }
    else
    {
      v9 &= *(void *)&v3 - 1;
    }
    if (v9 != v4) {
LABEL_19:
    }
      *(void *)(*result + 8 * v4) = 0;
  }
  uint64_t v10 = *a2;
  if (*a2)
  {
    unint64_t v11 = *(void *)(v10 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v11 >= *(void *)&v3) {
        v11 %= *(void *)&v3;
      }
    }
    else
    {
      v11 &= *(void *)&v3 - 1;
    }
    if (v11 != v4)
    {
      *(void *)(*result + 8 * v11) = v7;
      uint64_t v10 = *a2;
    }
  }
  void *v7 = v10;
  *a2 = 0;
  --result[3];
  *(void *)a3 = a2;
  *(void *)(a3 + 8) = result + 2;
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void *std::__hash_table<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::__unordered_map_hasher<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(uint64_t a1, int *a2, uint64_t a3, _DWORD **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    uint64_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      unint64_t v11 = *v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (*((_DWORD *)v11 + 4) == v7) {
              return v11;
            }
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4) {
              break;
            }
          }
          unint64_t v11 = (void *)*v11;
        }
        while (v11);
      }
    }
  }
  unint64_t v11 = operator new(0x30uLL);
  void *v11 = 0;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
  void v11[4] = 0;
  v11[5] = 0;
  v11[3] = 0;
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    BOOL v15 = 1;
    if (v8 >= 3) {
      BOOL v15 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v8);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    std::__hash_table<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>>>::__rehash<true>(a1, v18);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }
  uint64_t v19 = *(void *)a1;
  size_t v20 = *(void **)(*(void *)a1 + 8 * v4);
  if (v20)
  {
    void *v11 = *v20;
LABEL_38:
    void *v20 = v11;
    goto LABEL_39;
  }
  void *v11 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v11;
  *(void *)(v19 + 8 * v4) = a1 + 16;
  if (*v11)
  {
    unint64_t v21 = *(void *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8) {
        v21 %= v8;
      }
    }
    else
    {
      v21 &= v8 - 1;
    }
    size_t v20 = (void *)(*(void *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v11;
}

void sub_1E43458C0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>(uint64_t a1, int *a2, _DWORD *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
    uint8x8_t v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      uint64_t v10 = *v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == v6)
          {
            if (*((_DWORD *)v10 + 4) == v6) {
              return v10;
            }
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7) {
                v11 %= v7;
              }
            }
            else
            {
              v11 &= v7 - 1;
            }
            if (v11 != v3) {
              break;
            }
          }
          uint64_t v10 = (void *)*v10;
        }
        while (v10);
      }
    }
  }
  uint64_t v10 = operator new(0x18uLL);
  *uint64_t v10 = 0;
  v10[1] = v6;
  *((_DWORD *)v10 + 4) = *a3;
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    std::__hash_table<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>>>::__rehash<true>(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }
  uint64_t v18 = *(void *)a1;
  uint64_t v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    *uint64_t v10 = *v19;
LABEL_38:
    void *v19 = v10;
    goto LABEL_39;
  }
  *uint64_t v10 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*v10)
  {
    unint64_t v20 = *(void *)(*v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7) {
        v20 %= v7;
      }
    }
    else
    {
      v20 &= v7 - 1;
    }
    uint64_t v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v10;
}

void sub_1E4345ADC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    unint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    unint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void *std::__hash_table<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>>>::find<unsigned long long>(void *a1, unint64_t *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (v3 >= *(void *)&v2) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (*(void *)&v2 - 1) & v3;
  }
  unint64_t v6 = *(void **)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  uint64_t result = (void *)*v6;
  if (*v6)
  {
    do
    {
      unint64_t v8 = result[1];
      if (v8 == v3)
      {
        if (result[2] == v3) {
          return result;
        }
      }
      else
      {
        if (v4.u32[0] > 1uLL)
        {
          if (v8 >= *(void *)&v2) {
            v8 %= *(void *)&v2;
          }
        }
        else
        {
          v8 &= *(void *)&v2 - 1;
        }
        if (v8 != v5) {
          return 0;
        }
      }
      uint64_t result = (void *)*result;
    }
    while (result);
  }
  return result;
}

void *std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(uint64_t a1, unint64_t *a2, uint64_t a3, void **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    uint64_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      for (uint64_t i = *v10; i; uint64_t i = (void *)*i)
      {
        unint64_t v12 = i[1];
        if (v12 == v7)
        {
          if (i[2] == v7) {
            return i;
          }
        }
        else
        {
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= v8) {
              v12 %= v8;
            }
          }
          else
          {
            v12 &= v8 - 1;
          }
          if (v12 != v4) {
            break;
          }
        }
      }
    }
  }
  uint64_t i = operator new(0x20uLL);
  *uint64_t i = 0;
  i[1] = v7;
  i[2] = **a4;
  i[3] = 0;
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    BOOL v15 = 1;
    if (v8 >= 3) {
      BOOL v15 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v8);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    std::__hash_table<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>>>::__rehash<true>(a1, v18);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }
  uint64_t v19 = *(void *)a1;
  unint64_t v20 = *(void **)(*(void *)a1 + 8 * v4);
  if (v20)
  {
    *uint64_t i = *v20;
LABEL_38:
    void *v20 = i;
    goto LABEL_39;
  }
  *uint64_t i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v19 + 8 * v4) = a1 + 16;
  if (*i)
  {
    unint64_t v21 = *(void *)(*i + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8) {
        v21 %= v8;
      }
    }
    else
    {
      v21 &= v8 - 1;
    }
    unint64_t v20 = (void *)(*(void *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_1E4345E7C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__tree<std::pair<unsigned long long,unsigned long long>,PLProcessCPU::compare_t,std::allocator<std::pair<unsigned long long,unsigned long long>>>::find<std::pair<unsigned long long,unsigned long long>>(uint64_t a1, uint64_t *a2)
{
  unint64_t v4 = *(void **)(a1 + 8);
  int8x8_t v2 = (void *)(a1 + 8);
  unint64_t v3 = v4;
  if (!v4) {
    return v2;
  }
  uint64_t v5 = *a2;
  unint64_t v6 = a2[1];
  unint64_t v7 = v2;
  do
  {
    unint64_t v8 = v3[5];
    BOOL v9 = v8 >= v6;
    BOOL v10 = v8 > v6;
    int v11 = v9;
    if (v3[4] == v5) {
      int v12 = v10;
    }
    else {
      int v12 = v11;
    }
    BOOL v13 = v12 == 0;
    if (v12) {
      float v14 = v3 + 1;
    }
    else {
      float v14 = v3;
    }
    if (v13) {
      unint64_t v7 = v3;
    }
    unint64_t v3 = (void *)*v14;
  }
  while (*v14);
  if (v7 == v2) {
    return v2;
  }
  unint64_t v15 = v7[5];
  BOOL v9 = v6 >= v15;
  BOOL v16 = v6 > v15;
  BOOL v17 = v9;
  if (v5 == v7[4] ? v16 : v17) {
    return v2;
  }
  return v7;
}

uint64_t *std::__tree<std::pair<unsigned long long,unsigned long long>,PLProcessCPU::compare_t,std::allocator<std::pair<unsigned long long,unsigned long long>>>::__remove_node_pointer(uint64_t **a1, uint64_t *a2)
{
  int8x8_t v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      unint64_t v3 = v2;
      int8x8_t v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    unint64_t v4 = a2;
    do
    {
      unint64_t v3 = (uint64_t *)v4[2];
      BOOL v5 = *v3 == (void)v4;
      unint64_t v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2) {
    *a1 = v3;
  }
  unint64_t v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v6, a2);
  return v3;
}

uint64_t *std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  unint64_t v3 = a2;
  if (*a2)
  {
    unint64_t v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      unint64_t v3 = a2;
      goto LABEL_7;
    }
    do
    {
      unint64_t v3 = v4;
      unint64_t v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  uint64_t v2 = v3[1];
  if (v2)
  {
LABEL_7:
    int v5 = 0;
    *(void *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  int v5 = 1;
LABEL_8:
  unint64_t v6 = (uint64_t **)v3[2];
  unint64_t v7 = *v6;
  if (*v6 == v3)
  {
    uint64_t *v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      unint64_t v7 = 0;
      uint64_t result = (uint64_t *)v2;
    }
    else
    {
      unint64_t v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  int v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    uint64_t v9 = a2[2];
    v3[2] = v9;
    *(void *)(v9 + 8 * (*(void *)a2[2] != (void)a2)) = v3;
    uint64_t v11 = *a2;
    uint64_t v10 = a2[1];
    *(void *)(v11 + 16) = v3;
    uint64_t *v3 = v11;
    v3[1] = v10;
    if (v10) {
      *(void *)(v10 + 16) = v3;
    }
    *((unsigned char *)v3 + 24) = *((unsigned char *)a2 + 24);
    if (result == a2) {
      uint64_t result = v3;
    }
  }
  if (!v8 || !result) {
    return result;
  }
  if (!v5)
  {
    *(unsigned char *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    uint64_t v12 = v7[2];
    if (*(uint64_t **)v12 == v7) {
      break;
    }
    if (!*((unsigned char *)v7 + 24))
    {
      *((unsigned char *)v7 + 24) = 1;
      *(unsigned char *)(v12 + 24) = 0;
      BOOL v13 = *(uint64_t **)(v12 + 8);
      uint64_t v14 = *v13;
      *(void *)(v12 + 8) = *v13;
      if (v14) {
        *(void *)(v14 + 16) = v12;
      }
      v13[2] = *(void *)(v12 + 16);
      *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v13;
      uint64_t *v13 = v12;
      *(void *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7) {
        uint64_t result = v7;
      }
      unint64_t v7 = *(uint64_t **)(*v7 + 8);
    }
    unint64_t v15 = (void *)*v7;
    if (*v7 && !*((unsigned char *)v15 + 24))
    {
      BOOL v16 = (uint64_t *)v7[1];
      if (!v16) {
        goto LABEL_56;
      }
LABEL_55:
      if (*((unsigned char *)v16 + 24))
      {
LABEL_56:
        *((unsigned char *)v15 + 24) = 1;
        *((unsigned char *)v7 + 24) = 0;
        uint64_t v22 = v15[1];
        uint64_t *v7 = v22;
        if (v22) {
          *(void *)(v22 + 16) = v7;
        }
        v15[2] = v7[2];
        *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v15;
        v15[1] = v7;
        void v7[2] = (uint64_t)v15;
        BOOL v16 = v7;
      }
      else
      {
        unint64_t v15 = v7;
      }
      uint64_t v23 = v15[2];
      *((unsigned char *)v15 + 24) = *(unsigned char *)(v23 + 24);
      *(unsigned char *)(v23 + 24) = 1;
      *((unsigned char *)v16 + 24) = 1;
      long long v24 = *(uint64_t **)(v23 + 8);
      uint64_t v25 = *v24;
      *(void *)(v23 + 8) = *v24;
      if (v25) {
        *(void *)(v25 + 16) = v23;
      }
      void v24[2] = *(void *)(v23 + 16);
      *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
      uint64_t *v24 = v23;
      goto LABEL_72;
    }
    BOOL v16 = (uint64_t *)v7[1];
    if (v16 && !*((unsigned char *)v16 + 24)) {
      goto LABEL_55;
    }
    *((unsigned char *)v7 + 24) = 0;
    BOOL v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      BOOL v17 = result;
LABEL_53:
      *((unsigned char *)v17 + 24) = 1;
      return result;
    }
    if (!*((unsigned char *)v17 + 24)) {
      goto LABEL_53;
    }
LABEL_49:
    unint64_t v7 = *(uint64_t **)(v17[2] + 8 * (*(void *)v17[2] == (void)v17));
  }
  if (!*((unsigned char *)v7 + 24))
  {
    *((unsigned char *)v7 + 24) = 1;
    *(unsigned char *)(v12 + 24) = 0;
    uint64_t v18 = v7[1];
    *(void *)uint64_t v12 = v18;
    if (v18) {
      *(void *)(v18 + 16) = v12;
    }
    void v7[2] = *(void *)(v12 + 16);
    *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(void *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12) {
      uint64_t result = v7;
    }
    unint64_t v7 = *(uint64_t **)v12;
  }
  uint64_t v19 = (void *)*v7;
  if (*v7 && !*((unsigned char *)v19 + 24)) {
    goto LABEL_68;
  }
  unint64_t v20 = (uint64_t *)v7[1];
  if (!v20 || *((unsigned char *)v20 + 24))
  {
    *((unsigned char *)v7 + 24) = 0;
    BOOL v17 = (uint64_t *)v7[2];
    if (*((unsigned char *)v17 + 24)) {
      BOOL v21 = v17 == result;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21) {
      goto LABEL_53;
    }
    goto LABEL_49;
  }
  if (v19 && !*((unsigned char *)v19 + 24))
  {
LABEL_68:
    unint64_t v20 = v7;
  }
  else
  {
    *((unsigned char *)v20 + 24) = 1;
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v26 = *v20;
    v7[1] = *v20;
    if (v26) {
      *(void *)(v26 + 16) = v7;
    }
    v20[2] = v7[2];
    *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v20;
    uint64_t *v20 = (uint64_t)v7;
    void v7[2] = (uint64_t)v20;
    uint64_t v19 = v7;
  }
  uint64_t v23 = v20[2];
  *((unsigned char *)v20 + 24) = *(unsigned char *)(v23 + 24);
  *(unsigned char *)(v23 + 24) = 1;
  *((unsigned char *)v19 + 24) = 1;
  long long v24 = *(uint64_t **)v23;
  uint64_t v27 = *(void *)(*(void *)v23 + 8);
  *(void *)uint64_t v23 = v27;
  if (v27) {
    *(void *)(v27 + 16) = v23;
  }
  void v24[2] = *(void *)(v23 + 16);
  *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(void *)(v23 + 16) = v24;
  return result;
}

uint64_t *std::__tree<std::pair<unsigned long long,unsigned long long>,PLProcessCPU::compare_t,std::allocator<std::pair<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<std::pair<unsigned long long,unsigned long long>,std::pair<unsigned long long,unsigned long long>>(uint64_t **a1, uint64_t *a2, _OWORD *a3)
{
  int v5 = (void **)std::__tree<std::pair<unsigned long long,unsigned long long>,PLProcessCPU::compare_t,std::allocator<std::pair<unsigned long long,unsigned long long>>>::__find_equal<std::pair<unsigned long long,unsigned long long>>((uint64_t)a1, &v9, a2);
  unint64_t v6 = (uint64_t *)*v5;
  if (!*v5)
  {
    unint64_t v7 = (uint64_t **)v5;
    unint64_t v6 = (uint64_t *)operator new(0x30uLL);
    *((_OWORD *)v6 + 2) = *a3;
    std::__tree<std::pair<unsigned long long,unsigned long long>,PLProcessCPU::compare_t,std::allocator<std::pair<unsigned long long,unsigned long long>>>::__insert_node_at(a1, v9, v7, v6);
  }
  return v6;
}

void *std::__tree<std::pair<unsigned long long,unsigned long long>,PLProcessCPU::compare_t,std::allocator<std::pair<unsigned long long,unsigned long long>>>::__find_equal<std::pair<unsigned long long,unsigned long long>>(uint64_t a1, void *a2, uint64_t *a3)
{
  int v5 = *(void **)(a1 + 8);
  uint64_t result = (void *)(a1 + 8);
  unint64_t v4 = v5;
  if (v5)
  {
    uint64_t v6 = *a3;
    unint64_t v7 = a3[1];
    do
    {
      while (1)
      {
        int v8 = v4;
        uint64_t v9 = v4[4];
        unint64_t v10 = v8[5];
        BOOL v11 = v7 > v10;
        if (v6 != v9) {
          BOOL v11 = v7 >= v10;
        }
        if (!v11) {
          break;
        }
        unint64_t v4 = (void *)*v8;
        uint64_t result = v8;
        if (!*v8) {
          goto LABEL_18;
        }
      }
      BOOL v12 = v10 >= v7;
      BOOL v13 = v10 > v7;
      int v14 = v12;
      if (v6 == v9) {
        int v15 = v13;
      }
      else {
        int v15 = v14;
      }
      if (v15 != 1) {
        break;
      }
      uint64_t result = v8 + 1;
      unint64_t v4 = (void *)v8[1];
    }
    while (v4);
  }
  else
  {
    int v8 = result;
  }
LABEL_18:
  *a2 = v8;
  return result;
}

uint64_t *std::__tree<std::pair<unsigned long long,unsigned long long>,PLProcessCPU::compare_t,std::allocator<std::pair<unsigned long long,unsigned long long>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  int v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  uint64_t result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      uint64_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      unint64_t v3 = (uint64_t *)v2[2];
      unint64_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), int v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            uint64_t v9 = (uint64_t **)a2[2];
          }
          else
          {
            uint64_t v9 = (uint64_t **)v2[1];
            unint64_t v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              unint64_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *uint64_t v9 = v2;
            v2[2] = (uint64_t)v9;
            unint64_t v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          uint64_t *v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), int v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            unint64_t v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          unint64_t v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      *int v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void std::__tree<std::pair<unsigned long long,unsigned long long>,PLProcessCPU::compare_t,std::allocator<std::pair<unsigned long long,unsigned long long>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::pair<unsigned long long,unsigned long long>,PLProcessCPU::compare_t,std::allocator<std::pair<unsigned long long,unsigned long long>>>::destroy(a1, *a2);
    std::__tree<std::pair<unsigned long long,unsigned long long>,PLProcessCPU::compare_t,std::allocator<std::pair<unsigned long long,unsigned long long>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

void sub_1E4352648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13(uint64_t a1)
{
}

id PLLogDisplay()
{
  if (PLLogDisplay_onceToken != -1) {
    dispatch_once(&PLLogDisplay_onceToken, &__block_literal_global_25);
  }
  v0 = (void *)PLLogDisplay___logObj;
  return v0;
}

uint64_t __PLLogDisplay_block_invoke()
{
  PLLogDisplay___logObj = (uint64_t)os_log_create("com.apple.powerlog", "display");
  return MEMORY[0x1F41817F8]();
}

void serviceInterestCallback(void *a1, uint64_t a2, int a3)
{
  if (a3 == -536870896)
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    id v5 = a1;
    [v5 cancel];
    [v5 setValid:0];

    int v6 = PLLogDisplay();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1E4220000, v6, OS_LOG_TYPE_DEFAULT, "Cancelled AFKInterface", v7, 2u);
    }
  }
}

uint64_t handleIOMFBPowerCallback(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!_os_feature_enabled_impl()
    || (uint64_t result = [MEMORY[0x1E4F92A38] hasAOD], (result & 1) == 0))
  {
    return [a4 logEventPointDisplayBacklightWithState:a3];
  }
  return result;
}

void sub_1E4360D4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E4366B40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id location)
{
  objc_destroyWeak(v32);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __HIDTouchEventCallback(void *a1)
{
  if (IOHIDEventGetType() != 11) {
    return;
  }
  uint64_t Children = IOHIDEventGetChildren();
  if (!Children) {
    return;
  }
  CFArrayRef v3 = (const __CFArray *)Children;
  id v9 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFIndex Count = CFArrayGetCount(v3);
    if (Count >= 1)
    {
      uint64_t v5 = Count;
      CFIndex v6 = 0;
      int v7 = 0;
      while (1)
      {
        CFArrayGetValueAtIndex(v3, v6);
        if (IOHIDEventGetType() == 11)
        {
          if (IOHIDEventGetIntegerValue()) {
            break;
          }
        }
        CFIndex v6 = ++v7;
        if (v5 <= v7) {
          goto LABEL_9;
        }
      }
      if ([v9 userTouch]) {
        goto LABEL_15;
      }
      uint64_t v8 = 1;
      goto LABEL_14;
    }
LABEL_9:
    if ([v9 userTouch])
    {
      uint64_t v8 = 0;
LABEL_14:
      [v9 logEventBackwardUserTouch:v8];
    }
  }
LABEL_15:
}

void sub_1E4367624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 200), 8);
  _Block_object_dispose((const void *)(v34 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14(uint64_t a1)
{
}

uint64_t updateDisplayIOReportAZLStats(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    if ([v1 subscription])
    {
      [v2 subscription];
      CFArrayRef v3 = [v2 subscribedChannels];
      Samples = IOReportCreateSamples();

      if (Samples)
      {
        uint64_t v5 = [MEMORY[0x1E4F1C9C8] monotonicDate];
        CFIndex v6 = [v2 ioReportSample];

        if (!v6)
        {
LABEL_7:
          [v2 setIoReportSample:Samples];
          unint64_t v10 = [v2 sampleTime];
          [v2 setSampleTimePrevious:v10];

          [v2 setSampleTime:v5];
          uint64_t v11 = 1;
LABEL_19:

          goto LABEL_20;
        }
        int v7 = [v2 ioReportSample];
        SamplesDelta = (void *)IOReportCreateSamplesDelta();

        if (SamplesDelta)
        {
          int v14 = objc_alloc_init(PLDisplayAZLStats);
          id v9 = v14;
          IOReportIterate();
          [v2 setDisplayAZLStats:v9];

          goto LABEL_7;
        }
        uint64_t v12 = PLLogDisplay();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          updateDisplayIOReportAZLStats_cold_4();
        }
      }
      else
      {
        uint64_t v5 = PLLogDisplay();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
          updateDisplayIOReportAZLStats_cold_3();
        }
      }
      uint64_t v11 = 0;
      goto LABEL_19;
    }
    Samples = PLLogDisplay();
    if (os_log_type_enabled(Samples, OS_LOG_TYPE_DEBUG)) {
      updateDisplayIOReportAZLStats_cold_2();
    }
  }
  else
  {
    Samples = PLLogDisplay();
    if (os_log_type_enabled(Samples, OS_LOG_TYPE_DEBUG)) {
      updateDisplayIOReportAZLStats_cold_1();
    }
  }
  uint64_t v11 = 0;
LABEL_20:

  return v11;
}

void __updateDisplayIOReportAZLStats_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4E7EF70]();
  CFArrayRef v3 = IOReportChannelGetChannelName();
  uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithLongLong:IOReportSimpleGetIntegerValue()];
  uint64_t v5 = (void *)v4;
  CFIndex v6 = &unk_1F400DAC8;
  if (v4) {
    CFIndex v6 = (void *)v4;
  }
  id v7 = v6;

  if ([v3 isEqualToString:@"power"])
  {
    [*(id *)(a1 + 32) setAvgPower:v7];
    uint64_t v8 = PLLogDisplay();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __updateDisplayIOReportAZLStats_block_invoke_cold_1(v7, v8);
    }
LABEL_18:

    goto LABEL_19;
  }
  if ([v3 isEqualToString:@"azl_accum"])
  {
    [*(id *)(a1 + 32) setAzlAccum:v7];
    uint64_t v8 = PLLogDisplay();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __updateDisplayIOReportAZLStats_block_invoke_cold_2(v7, v8);
    }
    goto LABEL_18;
  }
  if ([v3 isEqualToString:@"nits_accum"])
  {
    [*(id *)(a1 + 32) setNitsAccum:v7];
    uint64_t v8 = PLLogDisplay();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __updateDisplayIOReportAZLStats_block_invoke_cold_3(v7, v8);
    }
    goto LABEL_18;
  }
  if ([v3 isEqualToString:@"bl_update_count"])
  {
    [*(id *)(a1 + 32) setBlUpdateCount:v7];
    uint64_t v8 = PLLogDisplay();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __updateDisplayIOReportAZLStats_block_invoke_cold_4(v7, v8);
    }
    goto LABEL_18;
  }
  if ([v3 isEqualToString:@"bl_frame_count"])
  {
    [*(id *)(a1 + 32) setBlFrameCount:v7];
    uint64_t v8 = PLLogDisplay();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __updateDisplayIOReportAZLStats_block_invoke_cold_5(v7, v8);
    }
    goto LABEL_18;
  }
LABEL_19:
}

uint64_t updateDisplayIOReportAODStats(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    uint64_t v3 = [v1 subscription];
    Samples = PLLogDisplay();
    BOOL v5 = os_log_type_enabled(Samples, OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      if (v5) {
        updateDisplayIOReportAODStats_cold_6();
      }

      [v2 subscription];
      CFIndex v6 = [v2 subscribedChannels];
      Samples = IOReportCreateSamples();

      if (Samples)
      {
        id v7 = [MEMORY[0x1E4F1C9C8] monotonicDate];
        uint64_t v8 = PLLogDisplay();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          updateDisplayIOReportAODStats_cold_5(v2, v8);
        }

        id v9 = [v2 ioReportSample];

        if (!v9) {
          goto LABEL_11;
        }
        unint64_t v10 = [v2 ioReportSample];
        SamplesDelta = (void *)IOReportCreateSamplesDelta();

        if (SamplesDelta)
        {
          BOOL v17 = objc_alloc_init(PLDisplayAODStats);
          uint64_t v12 = v17;
          IOReportIterate();
          [v2 setDisplayAODStats:v12];

LABEL_11:
          [v2 setIoReportSample:Samples];
          uint64_t v13 = [v2 sampleTime];
          [v2 setSampleTimePrevious:v13];

          [v2 setSampleTime:v7];
          uint64_t v14 = 1;
LABEL_23:

          goto LABEL_24;
        }
        int v15 = PLLogDisplay();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          updateDisplayIOReportAODStats_cold_4();
        }
      }
      else
      {
        id v7 = PLLogDisplay();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
          updateDisplayIOReportAODStats_cold_3();
        }
      }
      uint64_t v14 = 0;
      goto LABEL_23;
    }
    if (v5) {
      updateDisplayIOReportAODStats_cold_2();
    }
  }
  else
  {
    Samples = PLLogDisplay();
    if (os_log_type_enabled(Samples, OS_LOG_TYPE_DEBUG)) {
      updateDisplayIOReportAODStats_cold_1();
    }
  }
  uint64_t v14 = 0;
LABEL_24:

  return v14;
}

void __updateDisplayIOReportAODStats_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4E7EF70]();
  uint64_t v3 = IOReportChannelGetChannelName();
  uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithLongLong:IOReportSimpleGetIntegerValue()];
  BOOL v5 = (void *)v4;
  CFIndex v6 = &unk_1F400DAC8;
  if (v4) {
    CFIndex v6 = (void *)v4;
  }
  id v7 = v6;

  if ([v3 isEqualToString:@"awake_count"])
  {
    [*(id *)(a1 + 32) setAwakeCount:v7];
    uint64_t v8 = PLLogDisplay();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __updateDisplayIOReportAODStats_block_invoke_cold_1(v7, v8);
    }
LABEL_36:

    goto LABEL_37;
  }
  if ([v3 isEqualToString:@"media_count"])
  {
    [*(id *)(a1 + 32) setMediaCount:v7];
    uint64_t v8 = PLLogDisplay();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __updateDisplayIOReportAODStats_block_invoke_cold_2(v7, v8);
    }
    goto LABEL_36;
  }
  if ([v3 isEqualToString:@"flipbook_count"])
  {
    [*(id *)(a1 + 32) setFlipbookCount:v7];
    uint64_t v8 = PLLogDisplay();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __updateDisplayIOReportAODStats_block_invoke_cold_3(v7, v8);
    }
    goto LABEL_36;
  }
  if ([v3 isEqualToString:@"flipbook_delay"])
  {
    [*(id *)(a1 + 32) setFlipbookDelay:v7];
    uint64_t v8 = PLLogDisplay();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __updateDisplayIOReportAODStats_block_invoke_cold_4(v7, v8);
    }
    goto LABEL_36;
  }
  if ([v3 isEqualToString:@"media_scanout"])
  {
    [*(id *)(a1 + 32) setMediaScanout:v7];
    uint64_t v8 = PLLogDisplay();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __updateDisplayIOReportAODStats_block_invoke_cold_5(v7, v8);
    }
    goto LABEL_36;
  }
  if ([v3 isEqualToString:@"ambient_count"])
  {
    [*(id *)(a1 + 32) setAmbientCount:v7];
    uint64_t v8 = PLLogDisplay();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __updateDisplayIOReportAODStats_block_invoke_cold_6(v7, v8);
    }
    goto LABEL_36;
  }
  if ([v3 isEqualToString:@"prc_repeat_coun"])
  {
    [*(id *)(a1 + 32) setPrcRepeatCoun:v7];
    uint64_t v8 = PLLogDisplay();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __updateDisplayIOReportAODStats_block_invoke_cold_7(v7, v8);
    }
    goto LABEL_36;
  }
  if ([v3 isEqualToString:@"pdc_repeat_coun"])
  {
    [*(id *)(a1 + 32) setPdcRepeatCoun:v7];
    uint64_t v8 = PLLogDisplay();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __updateDisplayIOReportAODStats_block_invoke_cold_8(v7, v8);
    }
    goto LABEL_36;
  }
  if ([v3 isEqualToString:@"llm_count"])
  {
    [*(id *)(a1 + 32) setLlmCount:v7];
    uint64_t v8 = PLLogDisplay();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __updateDisplayIOReportAODStats_block_invoke_cold_9(v7, v8);
    }
    goto LABEL_36;
  }
  if ([v3 isEqualToString:@"apl_sum"])
  {
    [*(id *)(a1 + 32) setAplSum:v7];
    uint64_t v8 = PLLogDisplay();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __updateDisplayIOReportAODStats_block_invoke_cold_10(v7, v8);
    }
    goto LABEL_36;
  }
  if ([v3 isEqualToString:@"apl_count"])
  {
    [*(id *)(a1 + 32) setAplCount:v7];
    uint64_t v8 = PLLogDisplay();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __updateDisplayIOReportAODStats_block_invoke_cold_11(v7, v8);
    }
    goto LABEL_36;
  }
LABEL_37:
}

void sub_1E436A2A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_5_3()
{
  return v0;
}

void sub_1E436D4EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__15(uint64_t a1)
{
}

id PLLogDuetServiceDAS()
{
  if (PLLogDuetServiceDAS_onceToken != -1) {
    dispatch_once(&PLLogDuetServiceDAS_onceToken, &__block_literal_global_26);
  }
  uint64_t v0 = (void *)PLLogDuetServiceDAS___logObj;
  return v0;
}

uint64_t __PLLogDuetServiceDAS_block_invoke()
{
  PLLogDuetServiceDAS___logObj = (uint64_t)os_log_create("com.apple.powerlog", "DuetServiceDAS");
  return MEMORY[0x1F41817F8]();
}

id PLLogPausedCharging()
{
  if (PLLogPausedCharging_onceToken != -1) {
    dispatch_once(&PLLogPausedCharging_onceToken, &__block_literal_global_28);
  }
  uint64_t v0 = (void *)PLLogPausedCharging___logObj;
  return v0;
}

uint64_t __PLLogPausedCharging_block_invoke()
{
  PLLogPausedCharging___logObj = (uint64_t)os_log_create("com.apple.powerlog", "pausedCharging");
  return MEMORY[0x1F41817F8]();
}

id PLLogUrsaNotification()
{
  if (PLLogUrsaNotification_onceToken != -1) {
    dispatch_once(&PLLogUrsaNotification_onceToken, &__block_literal_global_11);
  }
  uint64_t v0 = (void *)PLLogUrsaNotification___logObj;
  return v0;
}

uint64_t __PLLogUrsaNotification_block_invoke()
{
  PLLogUrsaNotification___logObj = (uint64_t)os_log_create("com.apple.powerlog", "Ursa");
  return MEMORY[0x1F41817F8]();
}

void OUTLINED_FUNCTION_7_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_1E43780F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E4379378(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E437DD28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62,uint64_t a63)
{
  _Block_object_dispose(&a62, 8);
  _Block_object_dispose(&a68, 8);
  _Block_object_dispose(&STACK[0x208], 8);
  _Block_object_dispose(&STACK[0x238], 8);
  _Block_object_dispose(&STACK[0x268], 8);
  _Block_object_dispose(&STACK[0x298], 8);
  _Block_object_dispose(&STACK[0x2B8], 8);
  _Block_object_dispose((const void *)(v68 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16(uint64_t a1)
{
}

id PLLogSoC()
{
  if (PLLogSoC_onceToken != -1) {
    dispatch_once(&PLLogSoC_onceToken, &__block_literal_global_29);
  }
  uint64_t v0 = (void *)PLLogSoC___logObj;
  return v0;
}

uint64_t __PLLogSoC_block_invoke()
{
  PLLogSoC___logObj = (uint64_t)os_log_create("com.apple.powerlog", "soc");
  return MEMORY[0x1F41817F8]();
}

void sub_1E4380C50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,id location)
{
}

void sub_1E438150C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E4382DAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
}

uint64_t pushConfigToAggd(uint64_t a1, void *a2)
{
  if (a2) {
    return [a2 aggdTimerFired];
  }
  return result;
}

void sub_1E439C60C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17(uint64_t a1)
{
}

void sub_1E439C9C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_1E43A6FE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1E43A72B4(void *a1, int a2)
{
  if (a2 == 2)
  {
    objc_end_catch();
    JUMPOUT(0x1E43A7288);
  }
  objc_exception_rethrow();
}

void sub_1E43A72EC(_Unwind_Exception *a1)
{
}

void sub_1E43A7E44(void *a1, int a2)
{
  if (a2 == 2)
  {
    objc_end_catch();
    JUMPOUT(0x1E43A7E08);
  }
  objc_exception_rethrow();
}

void sub_1E43A7E74(_Unwind_Exception *a1)
{
}

void sub_1E43A7F48(_Unwind_Exception *a1)
{
}

void sub_1E43A86B0(void *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a2 == 2)
  {
    id v12 = objc_begin_catch(exc_buf);
    uint64_t v13 = PLLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[PLBatteryAgent parseTimeAtHighSoc:]();
    }

    objc_end_catch();
    JUMPOUT(0x1E43A8644);
  }
  objc_begin_catch(exc_buf);
  JUMPOUT(0x1E43A8648);
}

void sub_1E43A88C8(void *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  if (a2 == 2)
  {
    id v11 = objc_begin_catch(exc_buf);
    id v12 = PLLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[PLBatteryAgent parseLowVoltageResidencyCounters:]();
    }

    objc_end_catch();
    JUMPOUT(0x1E43A8854);
  }
  objc_begin_catch(exc_buf);
  JUMPOUT(0x1E43A8858);
}

void sub_1E43A8BAC(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x1E43A8BB8);
  }
  _Unwind_Resume(a1);
}

void sub_1E43A8BC8(_Unwind_Exception *a1)
{
  if (v1) {
    objc_end_catch();
  }
  _Unwind_Resume(a1);
}

void sub_1E43A8BD8(uint64_t a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  JUMPOUT(0x1E43A8BE4);
}

void sub_1E43A8E54()
{
}

void sub_1E43A8E70(_Unwind_Exception *exception_object)
{
  if (v1) {
    objc_end_catch();
  }
  _Unwind_Resume(exception_object);
}

void sub_1E43AC29C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t block, uint64_t a19, uint64_t (*a20)(uint64_t a1),void *a21,uint64_t a22)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v22 = objc_begin_catch(exception_object);
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v23 = objc_opt_class();
        uint64_t block = MEMORY[0x1E4F143A8];
        a19 = 3221225472;
        a20 = __46__PLBatteryAgent_logEventPointBatteryShutdown__block_invoke;
        a21 = &__block_descriptor_40_e5_v8__0lu32l8;
        a22 = v23;
        if (logEventPointBatteryShutdown_defaultOnce != -1) {
          dispatch_once(&logEventPointBatteryShutdown_defaultOnce, &block);
        }
        if (logEventPointBatteryShutdown_classDebugEnabled)
        {
          long long v24 = [NSString stringWithFormat:@"BatteryShutdown data could not be parsed"];
          uint64_t v25 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
          uint64_t v27 = [v26 lastPathComponent];
          v28 = [NSString stringWithUTF8String:"-[PLBatteryAgent logEventPointBatteryShutdown]"];
          [v25 logMessage:v24 fromFile:v27 fromFunction:v28 fromLineNumber:7394];

          id v29 = PLLogCommon();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }
        }
      }

      objc_end_catch();
      JUMPOUT(0x1E43AC250);
    }
    objc_begin_catch(exception_object);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_1E43AC6E8(void *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t (*a11)(uint64_t a1), void *a12, uint64_t a13)
{
  if (a2 == 2)
  {
    id v14 = objc_begin_catch(exc_buf);
    if ([*(id *)(v13 + 2496) debugEnabled])
    {
      uint64_t v15 = objc_opt_class();
      a9 = MEMORY[0x1E4F143A8];
      a10 = 3221225472;
      a11 = __52__PLBatteryAgent_logEventPointBatteryPanicShutdown___block_invoke_2;
      a12 = &__block_descriptor_40_e5_v8__0lu32l8;
      a13 = v15;
      if (logEventPointBatteryPanicShutdown__defaultOnce != -1) {
        dispatch_once(&logEventPointBatteryPanicShutdown__defaultOnce, &a9);
      }
      if (logEventPointBatteryPanicShutdown__classDebugEnabled)
      {
        BOOL v16 = [NSString stringWithFormat:@"BatteryPanicShutdown data could not be parsed"];
        BOOL v17 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
        uint64_t v19 = [v18 lastPathComponent];
        unint64_t v20 = [NSString stringWithUTF8String:"-[PLBatteryAgent logEventPointBatteryPanicShutdown:]"];
        [v17 logMessage:v16 fromFile:v19 fromFunction:v20 fromLineNumber:7439];

        BOOL v21 = PLLogCommon();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }

    objc_end_catch();
    JUMPOUT(0x1E43AC6B8);
  }
  objc_begin_catch(exc_buf);
  objc_exception_rethrow();
}

void sub_1E43AC87C(_Unwind_Exception *a1)
{
}

void sub_1E43AF130(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t (*a23)(uint64_t a1),void *a24,uint64_t a25)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v25 = objc_begin_catch(exception_object);
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v26 = objc_opt_class();
        a21 = MEMORY[0x1E4F143A8];
        a22 = 3221225472;
        a23 = __55__PLBatteryAgent_logEventNoneBatteryConfigWithRawData___block_invoke_5064;
        a24 = &__block_descriptor_40_e5_v8__0lu32l8;
        a25 = v26;
        uint64_t v27 = &a21;
        if (logEventNoneBatteryConfigWithRawData__defaultOnce_5062 != -1) {
          dispatch_once(&logEventNoneBatteryConfigWithRawData__defaultOnce_5062, v27);
        }

        if (logEventNoneBatteryConfigWithRawData__classDebugEnabled_5063)
        {
          v28 = [NSString stringWithFormat:@"BatteryConfig data could not be parsed"];
          id v29 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
          __int16 v31 = [v30 lastPathComponent];
          int v32 = [NSString stringWithUTF8String:"-[PLBatteryAgent logEventNoneBatteryConfigWithRawData:]"];
          [v29 logMessage:v28 fromFile:v31 fromFunction:v32 fromLineNumber:7886];

          __int16 v33 = PLLogCommon();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }
        }
      }

      objc_end_catch();
      JUMPOUT(0x1E43AF0D0);
    }
    objc_begin_catch(exception_object);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

id PLLogBH()
{
  if (PLLogBH_onceToken != -1) {
    dispatch_once(&PLLogBH_onceToken, &__block_literal_global_5393);
  }
  uint64_t v0 = (void *)PLLogBH___logObj;
  return v0;
}

uint64_t __PLLogBH_block_invoke()
{
  PLLogBH___logObj = (uint64_t)os_log_create("com.apple.powerlog", "batteryhealth");
  return MEMORY[0x1F41817F8]();
}

void sub_1E43BA3E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 208), 8);
  _Block_object_dispose((const void *)(v35 - 176), 8);
  _Block_object_dispose((const void *)(v35 - 144), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_13_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 8u);
}

uint64_t OUTLINED_FUNCTION_15(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  return result;
}

void OUTLINED_FUNCTION_19(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x1Eu);
}

void sub_1E43BDDFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id logHandle()
{
  if (logHandle_onceToken != -1) {
    dispatch_once(&logHandle_onceToken, &__block_literal_global_33);
  }
  uint64_t v0 = (void *)logHandle__logHandle;
  return v0;
}

uint64_t __logHandle_block_invoke()
{
  logHandle__logHandle = (uint64_t)os_log_create("com.apple.PerfPowerServicesSignpostReader", "");
  return MEMORY[0x1F41817F8]();
}

void sub_1E43BF0C4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__18(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18(uint64_t a1)
{
}

void NotificationCallback_0(uint64_t a1, void *a2)
{
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x3032000000;
  v4[3] = __Block_byref_object_copy__19;
  v4[4] = __Block_byref_object_dispose__19;
  id v5 = a2;
  uint64_t v2 = dispatch_get_global_queue(-2, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __NotificationCallback_block_invoke_0;
  block[3] = &unk_1E6E47B58;
  void block[4] = v4;
  dispatch_async(v2, block);

  _Block_object_dispose(v4, 8);
}

uint64_t __Block_byref_object_copy__19(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__19(uint64_t a1)
{
}

id __NotificationCallback_block_invoke_0(uint64_t a1)
{
  return (id)[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) batteryBreakdownWithPayload:&unk_1F40119A0];
}

id hdqRead16(mach_port_t a1, unsigned int a2)
{
  kern_return_t v2;
  void *v3;
  uint64_t v5;
  uint32_t outputCnt;
  uint64_t output[2];
  uint64_t vars8;

  output[1] = *MEMORY[0x1E4F143B8];
  output[0] = 0;
  outputCnt = 1;
  id v5 = a2;
  uint64_t v2 = IOConnectCallScalarMethod(a1, 8u, &v5, 1u, output, &outputCnt);
  uint64_t v3 = 0;
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28ED0] numberWithShort:SLOWORD(output[0])];
  }
  return v3;
}

id PLLogDuetServiceLpmSource()
{
  if (PLLogDuetServiceLpmSource_onceToken != -1) {
    dispatch_once(&PLLogDuetServiceLpmSource_onceToken, &__block_literal_global_35);
  }
  uint64_t v0 = (void *)PLLogDuetServiceLpmSource___logObj;
  return v0;
}

uint64_t __PLLogDuetServiceLpmSource_block_invoke()
{
  PLLogDuetServiceLpmSource___logObj = (uint64_t)os_log_create("com.apple.powerlog", "lpmsource");
  return MEMORY[0x1F41817F8]();
}

uint64_t bq_sealed(mach_port_t a1)
{
  unsigned __int16 v2 = 0;
  if (!controlReadU16(a1, 0, &v2)) {
    return (v2 >> 13) & 1;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    bq_sealed_cold_1();
  }
  return 0xFFFFFFFFLL;
}

uint64_t bq_sleep_mode(uint64_t a1, int a2, int a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ((readBlock(a1, 64, 0, inputStruct, 0) & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  if (a2)
  {
    if ((inputStruct[0] & 0x20) == 0 || a3)
    {
      char v6 = inputStruct[0] | 0x20;
      goto LABEL_11;
    }
    return 1;
  }
  if ((inputStruct[0] & 0x20) == 0 && !a3) {
    return 1;
  }
  char v6 = inputStruct[0] & 0xDF;
LABEL_11:
  inputStruct[0] = v6;
  if ((writeBlock(a1, 64, 0, inputStruct) & 0x80000000) != 0) {
    return 4294967294;
  }
  if ((readBlock(a1, 64, 0, inputStruct, 0) & 0x80000000) != 0) {
    return 4294967293;
  }
  if (((inputStruct[0] & 0x20) == 0) != a2) {
    return 0;
  }
  return 4294967292;
}

uint64_t bq_write_dfchecksum(uint64_t a1, unsigned int a2)
{
  mach_port_t v3 = a1;
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ((readBlock(a1, 57, 0, inputStruct, 0) & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  __int16 v6 = __rev16(a2);
  return ((int)writeBlock(v3, 57, 0, inputStruct) >> 31);
}

uint64_t bq_vlow_enable(uint64_t a1, int a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unsigned __int16 v4 = controlRead16(a1, 28);
  unsigned __int16 v5 = v4;
  if (v4 > 0xC602u)
  {
    if (v4 <= 0xCEC5u)
    {
      if (v4 > 0xC71Eu)
      {
        if (v4 > 0xCEBBu)
        {
          if (v4 == 52924) {
            goto LABEL_60;
          }
          int v9 = 52933;
        }
        else
        {
          if (v4 == 50975) {
            goto LABEL_60;
          }
          int v9 = 52923;
        }
      }
      else
      {
        if (v4 <= 0xC71Cu)
        {
          if (v4 != 50691)
          {
            int v7 = 50692;
            goto LABEL_59;
          }
LABEL_47:
          unsigned __int16 v10 = (v4 & 0x7FFF) + a2;
          goto LABEL_64;
        }
        if (v4 == 50973) {
          goto LABEL_47;
        }
        int v9 = 50974;
      }
LABEL_46:
      if (v4 != v9) {
        goto LABEL_89;
      }
      goto LABEL_47;
    }
    if (v4 > 0xD401u)
    {
      if (v4 > 0xD743u)
      {
        if (v4 == 55108) {
          goto LABEL_47;
        }
        int v7 = 55109;
      }
      else
      {
        if (v4 == 54274) {
          goto LABEL_47;
        }
        int v7 = 54275;
      }
    }
    else
    {
      if (v4 <= 0xD0ABu)
      {
        if (v4 == 52934) {
          goto LABEL_60;
        }
        int v9 = 53419;
        goto LABEL_46;
      }
      if (v4 == 53420) {
        goto LABEL_47;
      }
      int v7 = 53421;
    }
LABEL_59:
    if (v4 != v7) {
      goto LABEL_89;
    }
LABEL_60:
    unsigned __int16 v10 = (v4 & 0x7FFF) - (a2 ^ 1);
    goto LABEL_64;
  }
  if (v4 > 0x4EC5u)
  {
    if (v4 > 0x5401u)
    {
      if (v4 > 0x5743u)
      {
        if (v4 == 22340) {
          goto LABEL_53;
        }
        int v6 = 22341;
      }
      else
      {
        if (v4 == 21506) {
          goto LABEL_53;
        }
        int v6 = 21507;
      }
    }
    else
    {
      if (v4 <= 0x50ABu)
      {
        if (v4 != 20166)
        {
          int v8 = 20651;
          goto LABEL_42;
        }
        goto LABEL_51;
      }
      if (v4 == 20652) {
        goto LABEL_61;
      }
      int v6 = 20653;
    }
LABEL_50:
    if (v4 == v6) {
      goto LABEL_51;
    }
LABEL_89:
    if ((v4 & 0x8000u) != 0) {
      return 4294967289;
    }
    else {
      return 4294967290;
    }
  }
  if (v4 > 0x471Eu)
  {
    if (v4 > 0x4EBBu)
    {
      if (v4 != 20156)
      {
        int v8 = 20165;
LABEL_42:
        if (v4 != v8) {
          goto LABEL_89;
        }
        goto LABEL_53;
      }
    }
    else if (v4 != 18207)
    {
      int v8 = 20155;
      goto LABEL_42;
    }
LABEL_51:
    if (a2) {
      return 1;
    }
    unsigned __int16 v10 = v4 - 1;
    goto LABEL_64;
  }
  if (v4 > 0x471Cu)
  {
    if (v4 == 18205) {
      goto LABEL_53;
    }
LABEL_61:
    if (a2) {
      unsigned __int16 v10 = v4 + 1;
    }
    else {
      unsigned __int16 v10 = v4 - 1;
    }
    goto LABEL_64;
  }
  if (v4 != 17923)
  {
    int v6 = 17924;
    goto LABEL_50;
  }
LABEL_53:
  if (!a2) {
    return 4294967292;
  }
  unsigned __int16 v10 = v4 + 1;
LABEL_64:
  if ((readBlock(a1, 49, 0, inputStruct, 0) & 0x80000000) != 0) {
    return 4294967294;
  }
  if (v18 != a2)
  {
    unsigned __int8 v18 = a2;
    if ((writeBlock(a1, 49, 0, inputStruct) & 0x80000000) == 0)
    {
      int Block = readBlock(a1, 49, 0, inputStruct, 0);
      uint64_t result = 4294967294;
      if (Block < 0 || v18 != a2) {
        return result;
      }
      goto LABEL_78;
    }
    return 4294967294;
  }
  if ((v5 & 0x8000) == 0)
  {
    if (v5 != 20652 && v5 != 18206) {
      return 4294967290;
    }
    unsigned __int16 v12 = controlRead16(a1, 28);
    if (v12 != v5 || (__int16)v12 <= -1) {
      return 4294967293;
    }
    else {
      return 1;
    }
  }
LABEL_78:
  if ((bq_write_dfchecksum(a1, v10) & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  unsigned __int16 v15 = controlRead16(a1, 28);
  if (v10 != v15 || (__int16)v15 <= -1) {
    return 4294967293;
  }
  else {
    return 0;
  }
}

uint64_t gasgauge_swupdate()
{
  return gasgauge_swupdate_log(0);
}

uint64_t gasgauge_swupdate_log(uint64_t (*a1)())
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (a1) {
    uint64_t v1 = a1;
  }
  else {
    uint64_t v1 = log_default;
  }
  size_t v4 = 64;
  if (sysctlbyname("hw.model", v5, &v4, 0, 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      gasgauge_swupdate_log_cold_1();
    }
    return 0xFFFFFFFFLL;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)mach_port_t v3 = 0;
      _os_log_impl(&dword_1E4220000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "No gas gauge update for this platform.", v3, 2u);
    }
    ((void (*)(const char *))v1)("No gas gauge update for this platform.");
    return 0;
  }
}

uint64_t log_default()
{
  return 0;
}

uint64_t gasgauge_start_update_thread()
{
  return startUpdateThread(0);
}

uint64_t gasgauge_info(uint64_t result, _DWORD *a2, _DWORD *a3, _DWORD *a4)
{
  *a2 = *(_DWORD *)(*(void *)(result + 8) + 24);
  *a4 = *(_DWORD *)(result + 4);
  *a3 = *(_DWORD *)(result + 16);
  return result;
}

unsigned int *gasgauge_open()
{
  if (!okToLoad()) {
    return 0;
  }
  uint64_t v0 = (unsigned int *)malloc(0x18uLL);
  if (v0)
  {
    uint64_t v1 = ggctl_connect(0);
    unsigned int *v0 = v1;
    if (v1)
    {
      uint64_t v2 = v1;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      long long v8 = 0u;
      long long v9 = 0u;
      long long v6 = 0u;
      long long v7 = 0u;
      long long v5 = 0u;
      memset(v4, 0, sizeof(v4));
      ggctl_get_device_configuration(v1, v4);
      if (!ggctl_map_currentlog(v2, (void *)v0 + 1))
      {
        v0[4] = 0;
        v0[1] = HIDWORD(v5);
        return v0;
      }
      ggctl_disconnect(*v0);
    }
    free(v0);
    return 0;
  }
  return v0;
}

void gasgauge_close(void *a1)
{
  if (a1)
  {
    if (a1[1])
    {
      MEMORY[0x1E4E7DE00](*(unsigned int *)a1, 0, *MEMORY[0x1E4F14960]);
      a1[1] = 0;
    }
    ggctl_disconnect(*(unsigned int *)a1);
    free(a1);
  }
}

uint64_t gasgauge_currentlog_interval(uint64_t a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!*(_DWORD *)a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v1 = *(unsigned char **)(a1 + 8);
  if (!v1) {
    return 0xFFFFFFFFLL;
  }
  if (*v1) {
    return *(unsigned int *)(a1 + 4);
  }
  return 1;
}

uint64_t gasgauge_currentlog_sleepinterval(uint64_t a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!*(_DWORD *)a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v1 = *(unsigned char **)(a1 + 8);
  if (!v1) {
    return 0xFFFFFFFFLL;
  }
  if (*v1) {
    return 30;
  }
  return 0;
}

uint64_t gasgauge_currentlog_start__(unsigned int *a1, int a2, char a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = *a1;
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  long long v5 = (unsigned __int8 *)*((void *)a1 + 1);
  if (!v5) {
    return 0xFFFFFFFFLL;
  }
  if (a2) {
    *long long v5 = 1;
  }
  if (!*v5) {
    goto LABEL_17;
  }
  int v6 = a3 & 3;
  uint64_t v7 = ggctl_open_device(v4, 1, v6 == 1);
  if ((v7 & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v8 = v7;
  if (v6 == 1)
  {
    uint64_t v9 = ggctl_drainDataLog(v7);
    if (v9)
    {
      uint64_t v10 = v9;
      ggctl_close_device(*a1, v8);
      goto LABEL_14;
    }
  }
  uint64_t v10 = ggctl_enable_currentlog(*a1, 1u);
  ggctl_close_device(*a1, v8);
  if (v10)
  {
LABEL_14:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      gasgauge_currentlog_start___cold_1();
    }
    return v10;
  }
  long long v5 = (unsigned __int8 *)*((void *)a1 + 1);
LABEL_17:
  a1[4] = *((_DWORD *)v5 + 6);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v12 = *v5;
    int v15 = 67109120;
    int v16 = v12;
    _os_log_impl(&dword_1E4220000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "data log supported: %d", (uint8_t *)&v15, 8u);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v13 = *(_DWORD *)(*((void *)a1 + 1) + 4);
    int v15 = 67109120;
    int v16 = v13;
    _os_log_impl(&dword_1E4220000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "data log clients: %d", (uint8_t *)&v15, 8u);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v14 = *(_DWORD *)(*((void *)a1 + 1) + 24);
    int v15 = 67109120;
    int v16 = v14;
    _os_log_impl(&dword_1E4220000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "data log entries: %u", (uint8_t *)&v15, 8u);
  }
  return 0;
}

uint64_t gasgauge_currentlog_start(unsigned int *a1)
{
  return gasgauge_currentlog_start__(a1, 0, 1);
}

uint64_t gasgauge_currentlog_start_collection(unsigned int *a1, char a2)
{
  return gasgauge_currentlog_start__(a1, 0, a2);
}

uint64_t gasgauge_currentlog_stop(uint64_t a1)
{
  if (!a1) {
    return 4294967294;
  }
  mach_port_t v2 = *(_DWORD *)a1;
  if (!v2) {
    return 4294967293;
  }
  mach_port_t v3 = *(unsigned char **)(a1 + 8);
  if (!v3) {
    return 4294967293;
  }
  if (!*v3) {
    return 0;
  }
  uint64_t result = ggctl_enable_currentlog(v2, 0);
  if (result)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      gasgauge_currentlog_stop_cold_1();
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t gasgauge_currentlog_entries(unsigned int *a1, uint64_t a2, unint64_t *a3, char a4)
{
  uint64_t v4 = 4294967294;
  if (!a1 || !a3) {
    return v4;
  }
  uint64_t v7 = *a1;
  if (!v7) {
    return 4294967293;
  }
  uint64_t v8 = *((void *)a1 + 1);
  if (!v8) {
    return 4294967293;
  }
  uint64_t v9 = a2;
  int v10 = a4 & 3;
  if (!*(unsigned char *)v8)
  {
    if (v10 != 1) {
      return v4;
    }
    if (!a2)
    {
      uint64_t v4 = 0;
      *a3 = 1;
      return v4;
    }
    if (!*a3) {
      return 0;
    }
    uint64_t v17 = ggctl_open_device(v7, 1, 1);
    if ((v17 & 0x80000000) == 0)
    {
      uint64_t v12 = v17;
      int v18 = ggctl_hdqRead16(v17, 20);
      if (v18 < 0)
      {
        uint64_t v4 = v18 & (v18 >> 31);
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          gasgauge_currentlog_entries_cold_1();
        }
      }
      else
      {
        *(_DWORD *)uint64_t v9 = 0;
        gettimeofday((timeval *)(v9 + 8), 0);
        uint64_t v4 = 0;
        --*(void *)(v9 + 8);
        *a3 = 1;
      }
      goto LABEL_38;
    }
    return 0xFFFFFFFFLL;
  }
  if (v10 == 1)
  {
    uint64_t v11 = ggctl_open_device(v7, 1, 1);
    if ((v11 & 0x80000000) == 0)
    {
      uint64_t v12 = v11;
      uint64_t v13 = ggctl_drainDataLog(v11);
      unsigned int v14 = a1[4];
      uint64_t v8 = *((void *)a1 + 1);
      int v15 = (_DWORD *)(v8 + 24);
      if (v14 <= *(_DWORD *)(v8 + 24))
      {
        uint64_t v4 = v13;
        if (v13)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            gasgauge_currentlog_entries_cold_2();
          }
LABEL_38:
          ggctl_close_device(*a1, v12);
          return v4;
        }
        goto LABEL_23;
      }
      return 4294967292;
    }
    return 0xFFFFFFFFLL;
  }
  unsigned int v14 = a1[4];
  int v15 = (_DWORD *)(v8 + 24);
  if (v14 > *(_DWORD *)(v8 + 24)) {
    return 4294967292;
  }
  uint64_t v12 = 0xFFFFFFFFLL;
LABEL_23:
  if (v9)
  {
    uint64_t v19 = (_DWORD *)(v8 + 24);
    if (v14 >= *(_DWORD *)(v8 + 24))
    {
      unint64_t v20 = 0;
    }
    else
    {
      unint64_t v20 = 0;
      do
      {
        if (v20 >= *a3) {
          break;
        }
        unsigned int v21 = a1[1];
        if (*v19 - v14 > v21) {
          unsigned int v14 = *v19 - v21;
        }
        a1[4] = v14 + 1;
        ++v20;
        uint64_t v22 = v8 + 24 * (int)(v14 % v21);
        long long v23 = *(_OWORD *)(v22 + 32);
        *(void *)(v9 + 16) = *(void *)(v22 + 48);
        *(_OWORD *)uint64_t v9 = v23;
        v9 += 24;
        unsigned int v14 = a1[4];
        uint64_t v8 = *((void *)a1 + 1);
        uint64_t v19 = (_DWORD *)(v8 + 24);
      }
      while (v14 < *(_DWORD *)(v8 + 24));
    }
  }
  else
  {
    unsigned int v24 = a1[1];
    if (*v15 - v14 < v24) {
      unsigned int v24 = *v15 - v14;
    }
    unint64_t v20 = v24;
  }
  uint64_t v4 = 0;
  *a3 = v20;
  if (v12 != -1) {
    goto LABEL_38;
  }
  return v4;
}

uint64_t gasgauge_currentlog_get_entries(unsigned int *a1, uint64_t a2, unint64_t *a3)
{
  return gasgauge_currentlog_entries(a1, a2, a3, 1);
}

uint64_t gasgauge_sn(mach_port_t *a1, char *a2, unsigned int a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  memset(v12, 0, sizeof(v12));
  if (ggctl_get_device_configuration(*a1, v12)) {
    return 4294967274;
  }
  uint64_t v7 = ggctl_open_device(*a1, 1, 1);
  if ((v7 & 0x80000000) != 0) {
    return 4294967277;
  }
  uint64_t v8 = v7;
  if (LODWORD(v12[0])) {
    uint64_t v9 = LODWORD(v12[0]);
  }
  else {
    uint64_t v9 = 2;
  }
  uint64_t Block = readBlock(v7, 0xFFFFFFFFLL, v9, __src, 0);
  if ((Block & 0x80000000) != 0)
  {
    memset(__src, 48, 6);
    uint64_t Block = 4294967291;
  }
  ggctl_close_device(*a1, v8);
  if (a3 >= 0x12) {
    size_t v10 = 18;
  }
  else {
    size_t v10 = a3;
  }
  strncpy(a2, __src, v10);
  return Block;
}

uint64_t gasgauge_disconnect(mach_port_t *a1)
{
  long long v6 = 0u;
  memset(v5, 0, sizeof(v5));
  if (ggctl_get_device_configuration(*a1, v5)) {
    return 4294967274;
  }
  if (!DWORD1(v6)) {
    return 0;
  }
  uint64_t v3 = ggctl_open_device(*a1, 1, 1);
  if ((v3 & 0x80000000) != 0) {
    return 4294967277;
  }
  uint64_t v4 = v3;
  uint64_t result = gaugeDisconnect(v3);
  if ((result & 0x80000000) == 0)
  {
    ggctl_close_device(*a1, v4);
    return 4294967282;
  }
  return result;
}

uint64_t gasgauge_watch()
{
  return 0xFFFFFFFFLL;
}

void bq_sealed_cold_1()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_1E4220000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "could not read gas gauge control status", v0, 2u);
}

void gasgauge_swupdate_log_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = __error();
  uint64_t v1 = strerror(*v0);
  int v2 = 136315138;
  uint64_t v3 = v1;
  _os_log_error_impl(&dword_1E4220000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "could not find hw.model: %s", (uint8_t *)&v2, 0xCu);
}

void gasgauge_currentlog_start___cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6_2(&dword_1E4220000, MEMORY[0x1E4F14500], v0, "cannot enable current log (%d)", v1, v2, v3, v4, v5);
}

void gasgauge_currentlog_stop_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6_2(&dword_1E4220000, MEMORY[0x1E4F14500], v0, "cannot disable currentlog %#x", v1, v2, v3, v4, v5);
}

void gasgauge_currentlog_entries_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6_2(&dword_1E4220000, MEMORY[0x1E4F14500], v0, "cannot read average current (%d)", v1, v2, v3, v4, v5);
}

void gasgauge_currentlog_entries_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6_2(&dword_1E4220000, MEMORY[0x1E4F14500], v0, "cannot drain data log (%d)", v1, v2, v3, v4, v5);
}

uint64_t ggctl_connect(io_object_t *a1)
{
  io_connect_t connect = 0;
  mach_port_t v2 = *MEMORY[0x1E4F2EEF0];
  CFDictionaryRef v3 = IOServiceMatching("AppleHDQGasGaugeControl");
  io_service_t MatchingService = IOServiceGetMatchingService(v2, v3);
  if (MatchingService)
  {
    io_object_t v5 = MatchingService;
    uint64_t v6 = IOServiceOpen(MatchingService, *MEMORY[0x1E4F14960], 0, &connect);
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = logger;
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
        ggctl_connect_cold_2(v7, v8, v9, v10, v11, v12, v13, v14);
      }
      io_connect_t connect = 0;
    }
    if (a1) {
      *a1 = v5;
    }
    else {
      IOObjectRelease(v5);
    }
    return connect;
  }
  else
  {
    int v15 = logger;
    uint64_t result = os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR);
    if (result)
    {
      ggctl_connect_cold_1(v15);
      return 0;
    }
  }
  return result;
}

uint64_t ggctl_disconnect(uint64_t connect)
{
  if (connect) {
    return IOServiceClose(connect);
  }
  return connect;
}

void ggctl_reset(mach_port_t a1, unsigned int a2)
{
  kern_return_t v2;
  NSObject *v3;
  uint8_t buf[8];
  uint64_t input;

  input = a2;
  mach_port_t v2 = IOConnectCallMethod(a1, 0, &input, 1u, 0, 0, 0, 0, 0, 0);
  CFDictionaryRef v3 = logger;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
      ggctl_reset_cold_1();
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4220000, v3, OS_LOG_TYPE_DEFAULT, "gas gauge: reset", buf, 2u);
    }
    ++gauge_reset_count;
  }
}

uint64_t ggctl_get_hdq_state(mach_port_t a1)
{
  kern_return_t v1;
  uint32_t outputCnt;
  uint64_t output;

  output = 0;
  outputCnt = 1;
  uint64_t v1 = IOConnectCallMethod(a1, 1u, 0, 0, 0, 0, &output, &outputCnt, 0, 0);
  if (v1 == -536870183) {
    return 4294967294;
  }
  if (v1) {
    return 0xFFFFFFFFLL;
  }
  return output != 0;
}

uint64_t ggctl_get_device_configuration(mach_port_t a1, void *outputStruct)
{
  size_t outputStructCnt = 352;
  return IOConnectCallStructMethod(a1, 2u, 0, 0, outputStruct, &outputStructCnt);
}

uint64_t ggctl_enable_currentlog(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 3u, &input, 1u, 0, 0);
}

uint64_t ggctl_map_currentlog(uint64_t a1, void *a2)
{
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t result = MEMORY[0x1E4E7DDF0](a1, 0, *MEMORY[0x1E4F14960], &v6, &v5, 1);
  uint64_t v4 = v6;
  if (result) {
    uint64_t v4 = 0;
  }
  *a2 = v4;
  return result;
}

uint64_t ggctl_open_device(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = a1;
  if (!a3) {
    return v3;
  }
  int hdq_state = ggctl_get_hdq_state(a1);
  if (hdq_state < 0)
  {
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
      ggctl_open_device_cold_2();
    }
  }
  else
  {
    if (hdq_state)
    {
      if (IOConnectCallScalarMethod(v3, 6u, 0, 0, 0, 0)
        && os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
      {
        ggctl_open_device_cold_4();
      }
      return v3;
    }
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
      ggctl_open_device_cold_3();
    }
    ggctl_reset(v3, 1u);
  }
  uint64_t v5 = logger;
  if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
    ggctl_open_device_cold_1(v5);
  }
  return 0xFFFFFFFFLL;
}

uint64_t hdqBreak(mach_port_t a1)
{
  kern_return_t v1;
  unsigned int v2;

  uint64_t v1 = IOConnectCallScalarMethod(a1, 6u, 0, 0, 0, 0);
  if (v1 == -536870183) {
    mach_port_t v2 = -2;
  }
  else {
    mach_port_t v2 = -1;
  }
  if (v1) {
    return v2;
  }
  else {
    return 0;
  }
}

uint64_t ggctl_hdqBreak(mach_port_t a1)
{
  kern_return_t v1;
  unsigned int v2;

  uint64_t v1 = IOConnectCallScalarMethod(a1, 6u, 0, 0, 0, 0);
  if (v1 == -536870183) {
    mach_port_t v2 = -2;
  }
  else {
    mach_port_t v2 = -1;
  }
  if (v1) {
    return v2;
  }
  else {
    return 0;
  }
}

uint64_t ggctl_hdqRead8(mach_port_t a1, int a2)
{
  output[1] = *MEMORY[0x1E4F143B8];
  output[0] = 0;
  uint64_t input = a2;
  int64x2_t v5 = vdupq_n_s64(8uLL);
  uint32_t outputCnt = 1;
  if (IOConnectCallScalarMethod(a1, 7u, &input, 3u, output, &outputCnt)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return LODWORD(output[0]);
  }
}

uint64_t ggctl_hdqRead16(mach_port_t a1, int a2)
{
  output[1] = *MEMORY[0x1E4F143B8];
  output[0] = 0;
  uint32_t outputCnt = 1;
  uint64_t v3 = a2;
  if (IOConnectCallScalarMethod(a1, 8u, &v3, 1u, output, &outputCnt)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return LODWORD(output[0]);
  }
}

uint64_t ggctl_hdqWrite8(mach_port_t a1, char a2, unsigned __int8 a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a2 & 0x7F | (a3 << 8) | 0x80u;
  long long v5 = xmmword_1E44048D0;
  if (IOConnectCallScalarMethod(a1, 7u, &v4, 3u, 0, 0)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t ggctl_controlRead16(mach_port_t a1, int a2)
{
  output[1] = *MEMORY[0x1E4F143B8];
  output[0] = 0;
  uint32_t outputCnt = 1;
  uint64_t v3 = a2;
  if (IOConnectCallScalarMethod(a1, 0xBu, &v3, 1u, output, &outputCnt)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return LODWORD(output[0]);
  }
}

uint64_t ggctl_controlWrite16(mach_port_t a1, int a2, int a3)
{
  input[2] = *MEMORY[0x1E4F143B8];
  input[0] = a2;
  input[1] = a3;
  if (IOConnectCallScalarMethod(a1, 0xAu, input, 2u, 0, 0)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t ggctl_readBlock(mach_port_t a1, int a2, int a3, void *outputStruct, unsigned char *a5)
{
  input[2] = *MEMORY[0x1E4F143B8];
  input[0] = a2;
  input[1] = a3;
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  size_t v7 = 32;
  if (IOConnectCallMethod(a1, 9u, input, 2u, 0, 0, &output, &outputCnt, outputStruct, &v7)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0;
  if (a5) {
    *a5 = output;
  }
  return result;
}

uint64_t ggctl_writeBlock(mach_port_t a1, int a2, int a3, void *inputStruct)
{
  input[2] = *MEMORY[0x1E4F143B8];
  input[0] = a2;
  input[1] = a3;
  if (IOConnectCallMethod(a1, 0xFu, input, 2u, inputStruct, 0x20uLL, 0, 0, 0, 0)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t ggctl_drainDataLog(mach_port_t a1)
{
  if (IOConnectCallMethod(a1, 0xEu, 0, 0, 0, 0, 0, 0, 0, 0)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t ggctl_gaugeInterrupts(mach_port_t a1, unsigned int a2)
{
  kern_return_t v2;
  unsigned int v3;
  uint64_t input;

  uint64_t input = a2;
  mach_port_t v2 = IOConnectCallScalarMethod(a1, 0x10u, &input, 1u, 0, 0);
  if (v2 == -536870183) {
    uint64_t v3 = -2;
  }
  else {
    uint64_t v3 = -1;
  }
  if (v2) {
    return v3;
  }
  else {
    return 0;
  }
}

CFDictionaryRef pmps_service()
{
  keys = @"built-in";
  CFDictionaryRef result = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)&keys, MEMORY[0x1E4F1CFD0], 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (result)
  {
    CFDictionaryRef v1 = result;
    mach_port_t v2 = IOServiceMatching("IOPMPowerSource");
    CFDictionarySetValue(v2, @"IOPropertyMatch", v1);
    CFRelease(v1);
    return (CFDictionaryRef)IOServiceGetMatchingService(*MEMORY[0x1E4F2EEF0], v2);
  }
  return result;
}

uint64_t uart_open_device(uint64_t a1, uint64_t a2, int a3)
{
  return ggctl_open_device(a1, 0, a3);
}

uint64_t hdqRead16_0(mach_port_t a1, int a2)
{
  output[1] = *MEMORY[0x1E4F143B8];
  output[0] = 0;
  uint32_t outputCnt = 1;
  uint64_t v3 = a2;
  if (IOConnectCallScalarMethod(a1, 8u, &v3, 1u, output, &outputCnt)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return LODWORD(output[0]);
  }
}

uint64_t hdqWrite8(mach_port_t a1, char a2, unsigned __int8 a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a2 & 0x7F | (a3 << 8) | 0x80u;
  long long v5 = xmmword_1E44048D0;
  if (IOConnectCallScalarMethod(a1, 7u, &v4, 3u, 0, 0)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t controlOp16(mach_port_t a1, int a2)
{
  uint64_t input = a2;
  if (IOConnectCallScalarMethod(a1, 0xAu, &input, 1u, 0, 0)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t controlRead16(mach_port_t a1, int a2)
{
  output[1] = *MEMORY[0x1E4F143B8];
  output[0] = 0;
  uint32_t outputCnt = 1;
  uint64_t v3 = a2;
  if (IOConnectCallScalarMethod(a1, 0xBu, &v3, 1u, output, &outputCnt)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return LODWORD(output[0]);
  }
}

uint64_t controlWrite16(mach_port_t a1, int a2, int a3)
{
  input[2] = *MEMORY[0x1E4F143B8];
  input[0] = a2;
  input[1] = a3;
  if (IOConnectCallScalarMethod(a1, 0xAu, input, 2u, 0, 0)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t writeBlock(mach_port_t a1, int a2, int a3, void *inputStruct)
{
  input[2] = *MEMORY[0x1E4F143B8];
  input[0] = a2;
  input[1] = a3;
  if (IOConnectCallMethod(a1, 0xFu, input, 2u, inputStruct, 0x20uLL, 0, 0, 0, 0)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t drainDataLog(mach_port_t a1)
{
  if (IOConnectCallMethod(a1, 0xEu, 0, 0, 0, 0, 0, 0, 0, 0)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t gaugeEnableInterrupts(mach_port_t a1)
{
  kern_return_t v1;
  unsigned int v2;
  uint64_t input;

  uint64_t input = 1;
  CFDictionaryRef v1 = IOConnectCallScalarMethod(a1, 0x10u, &input, 1u, 0, 0);
  if (v1 == -536870183) {
    mach_port_t v2 = -2;
  }
  else {
    mach_port_t v2 = -1;
  }
  if (v1) {
    return v2;
  }
  else {
    return 0;
  }
}

uint64_t gaugeDisableInterrupts(mach_port_t a1)
{
  kern_return_t v1;
  unsigned int v2;
  uint64_t input;

  uint64_t input = 0;
  CFDictionaryRef v1 = IOConnectCallScalarMethod(a1, 0x10u, &input, 1u, 0, 0);
  if (v1 == -536870183) {
    mach_port_t v2 = -2;
  }
  else {
    mach_port_t v2 = -1;
  }
  if (v1) {
    return v2;
  }
  else {
    return 0;
  }
}

uint64_t gaugeDisconnect(mach_port_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)uint64_t input = xmmword_1E44048E0;
  IOConnectCallScalarMethod(a1, 0xAu, input, 2u, 0, 0);
  for (int i = 0; i != 3; ++i)
  {
    input[0] = 0;
    uint32_t outputCnt = 1;
    uint64_t v8 = 23;
    if (IOConnectCallScalarMethod(a1, 0xBu, &v8, 1u, input, &outputCnt)) {
      int v3 = -1;
    }
    else {
      int v3 = input[0];
    }
    if (!v3) {
      break;
    }
    uint64_t v4 = logger;
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
    {
      LODWORD(input[0]) = 67109376;
      HIDWORD(input[0]) = i;
      LOWORD(input[1]) = 1024;
      *(_DWORD *)((char *)&input[1] + 2) = v3;
      _os_log_error_impl(&dword_1E4220000, v4, OS_LOG_TYPE_ERROR, "%d: retry OpenProtector (%d)", (uint8_t *)input, 0xEu);
    }
    usleep(0xF4240u);
  }
  __int16 v7 = 0;
  input[0] = 0;
  uint32_t outputCnt = 1;
  uint64_t v8 = 32;
  IOConnectCallScalarMethod(a1, 0xBu, &v8, 1u, input, &outputCnt);
  if (controlReadU16(a1, 0, &v7)) {
    return 4294967291;
  }
  if (v3) {
    unsigned int v6 = -36;
  }
  else {
    unsigned int v6 = 0;
  }
  if ((v7 & 0x2000) != 0) {
    return v6;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t controlReadU16(mach_port_t a1, int a2, _WORD *a3)
{
  output[1] = *MEMORY[0x1E4F143B8];
  output[0] = 0;
  uint32_t outputCnt = 1;
  uint64_t v5 = a2;
  if (IOConnectCallScalarMethod(a1, 0xBu, &v5, 1u, output, &outputCnt)) {
    uint64_t result = 0xFFFFFFFFLL;
  }
  else {
    uint64_t result = LODWORD(output[0]);
  }
  if ((result & 0x80000000) == 0)
  {
    if (a3) {
      *a3 = result;
    }
    return 0;
  }
  return result;
}

uint64_t hdqReadS16(mach_port_t a1, int a2, _WORD *a3)
{
  output[1] = *MEMORY[0x1E4F143B8];
  output[0] = 0;
  uint32_t outputCnt = 1;
  uint64_t v5 = a2;
  if (IOConnectCallScalarMethod(a1, 8u, &v5, 1u, output, &outputCnt)) {
    uint64_t result = 0xFFFFFFFFLL;
  }
  else {
    uint64_t result = LODWORD(output[0]);
  }
  if ((result & 0x80000000) == 0)
  {
    if (a3) {
      *a3 = result;
    }
    return 0;
  }
  return result;
}

uint64_t hdqReadU16(mach_port_t a1, int a2, _WORD *a3)
{
  output[1] = *MEMORY[0x1E4F143B8];
  output[0] = 0;
  uint32_t outputCnt = 1;
  uint64_t v5 = a2;
  if (IOConnectCallScalarMethod(a1, 8u, &v5, 1u, output, &outputCnt)) {
    uint64_t result = 0xFFFFFFFFLL;
  }
  else {
    uint64_t result = LODWORD(output[0]);
  }
  if ((result & 0x80000000) == 0)
  {
    if (a3) {
      *a3 = result;
    }
    return 0;
  }
  return result;
}

uint64_t hdqReadS8(mach_port_t a1, int a2, unsigned char *a3)
{
  uint64_t result = ggctl_hdqRead8(a1, a2);
  if ((result & 0x80000000) == 0)
  {
    if (a3) {
      *a3 = result;
    }
    return 0;
  }
  return result;
}

uint64_t hdqReadU8(mach_port_t a1, int a2, unsigned char *a3)
{
  uint64_t result = ggctl_hdqRead8(a1, a2);
  if ((result & 0x80000000) == 0)
  {
    if (a3) {
      *a3 = result;
    }
    return 0;
  }
  return result;
}

uint64_t controlReadS16(mach_port_t a1, int a2, _WORD *a3)
{
  output[1] = *MEMORY[0x1E4F143B8];
  output[0] = 0;
  uint32_t outputCnt = 1;
  uint64_t v5 = a2;
  if (IOConnectCallScalarMethod(a1, 0xBu, &v5, 1u, output, &outputCnt)) {
    uint64_t result = 0xFFFFFFFFLL;
  }
  else {
    uint64_t result = LODWORD(output[0]);
  }
  if ((result & 0x80000000) == 0)
  {
    if (a3) {
      *a3 = result;
    }
    return 0;
  }
  return result;
}

uint64_t dumpBuffer(unsigned __int8 *a1, int a2)
{
  if (a2 >= 1)
  {
    uint64_t v4 = a2;
    do
    {
      int v5 = *a1++;
      printf(" %02x", v5);
      --v4;
    }
    while (v4);
  }
  return putchar(10);
}

uint64_t registerName(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0x600)
  {
    if (a2 - 1281 > 1 || (*(_DWORD *)a1 | 4) != 0x1E) {
      goto LABEL_8;
    }
    return 0;
  }
  if ((*(_DWORD *)a1 | 2) == 0xE) {
    return 0;
  }
LABEL_8:
  uint64_t v2 = *(void *)(a1 + 72);
  if (!v2
    && (a2 < 0x600 || (uint64_t v2 = *(void *)(a1 + 48)) == 0)
    && (a2 < 0x501 || (uint64_t v2 = *(void *)(a1 + 40)) == 0)
    && (a2 < 0x313 || (uint64_t v2 = *(void *)(a1 + 32)) == 0)
    && (a2 < 0x132 || (uint64_t v2 = *(void *)(a1 + 24)) == 0))
  {
    if (a2 < 0x119) {
      return *(void *)(a1 + 8);
    }
    uint64_t v2 = *(void *)(a1 + 16);
    if (!v2) {
      return *(void *)(a1 + 8);
    }
  }
  return v2;
}

uint64_t readRegister(_WORD *a1, uint64_t a2, mach_port_t a3)
{
  int v4 = *(_DWORD *)(a2 + 4);
  uint64_t result = 0xFFFFFFFFLL;
  if (v4 <= 1)
  {
    if (v4)
    {
      if (v4 == 1)
      {
        int v6 = *(_DWORD *)a2;
        return hdqReadU16(a3, v6, a1);
      }
    }
    else
    {
      int v9 = *(_DWORD *)a2;
      return hdqReadS16(a3, v9, a1);
    }
  }
  else
  {
    switch(v4)
    {
      case 100:
        __int16 v7 = *(uint64_t (**)(_WORD *))(a2 + 64);
        if (v7)
        {
          return v7(a1);
        }
        break;
      case 10:
        int v8 = *(_DWORD *)a2;
        return controlReadU16(a3, v8, a1);
      case 2:
        uint64_t result = ggctl_hdqRead8(a3, *(_DWORD *)a2);
        if ((result & 0x80000000) == 0)
        {
          if (a1) {
            *(unsigned char *)a1 = result;
          }
          return 0;
        }
        break;
    }
  }
  return result;
}

uint64_t getFWVersion(mach_port_t a1, __int16 *a2)
{
  __int16 v3 = getFWVersion_gFWVersion;
  if (getFWVersion_gFWVersion) {
    goto LABEL_2;
  }
  if (!controlReadU16(a1, 2, &getFWVersion_gFWVersion))
  {
    __int16 v3 = getFWVersion_gFWVersion;
    if (getFWVersion_gFWVersion == 256)
    {
      __int16 v3 = 1536;
      getFWVersion_gFWVersion = 1536;
    }
LABEL_2:
    uint64_t result = 0;
    *a2 = v3;
    return result;
  }
  return 0xFFFFFFFFLL;
}

double readLifetimeData(_OWORD *a1, uint64_t a2, mach_port_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  unsigned __int16 v8 = 0;
  if ((getFWVersion(a3, (__int16 *)&v8) & 0x80000000) == 0
    && v8 >= 0x313u
    && !ggctl_readBlock(a3, -1, 4, &outputStruct, 0))
  {
    long long v6 = v10;
    *a1 = outputStruct;
    a1[1] = v6;
    if (!ggctl_readBlock(a3, -1, 6, &outputStruct, 0))
    {
      double result = *(double *)&outputStruct;
      long long v7 = v10;
      a1[2] = outputStruct;
      a1[3] = v7;
    }
  }
  return result;
}

double readRaTableData(_OWORD *a1, uint64_t a2, mach_port_t a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  unsigned __int16 v7 = 0;
  if ((getFWVersion(a3, (__int16 *)&v7) & 0x80000000) == 0
    && v7 >= 0x600u
    && !ggctl_readBlock(a3, -1, 7, outputStruct, 0))
  {
    double result = *(double *)outputStruct;
    long long v6 = outputStruct[1];
    *a1 = outputStruct[0];
    a1[1] = v6;
  }
  return result;
}

double readIMAXAndSOCSmoothData(_OWORD *a1, uint64_t a2, mach_port_t a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  unsigned __int16 v7 = 0;
  if ((getFWVersion(a3, (__int16 *)&v7) & 0x80000000) == 0
    && v7 >= 0x600u
    && !ggctl_readBlock(a3, -1, 8, outputStruct, 0))
  {
    double result = *(double *)outputStruct;
    long long v6 = outputStruct[1];
    *a1 = outputStruct[0];
    a1[1] = v6;
  }
  return result;
}

uint64_t findRaWeightMulitplier(int a1)
{
  uint64_t v1 = 0;
  while ((unsigned __int16)battery_health_metric_config[v1] != a1)
  {
    v1 += 4;
    if (v1 == 68) {
      return 0;
    }
  }
  return *(unsigned int *)&battery_health_metric_config[v1 + 2];
}

float calculateWra(unsigned int a1, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5, unsigned int a6, unsigned int a7, unsigned int a8, unsigned __int16 a9)
{
  return (double)a2 * 0.137995
       + (double)a1 * 0.0693069
       + (double)a3 * 0.137376
       + (double)a4 * 0.137376
       + (double)a5 * 0.137376
       + (double)a6 * 0.137376
       + (double)a7 * 0.137376
       + (double)a8 * 0.0872525
       + (double)a9 * 0.0185644;
}

float calculateChemicalWeightedRa(unsigned int a1, float a2)
{
  return (float)((float)a1 * a2) / 1000.0;
}

CFDictionaryRef readShutdownReasonData(mach_port_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v7 = 0;
  long long v6 = 0u;
  memset(v5, 0, sizeof(v5));
  memset(v12, 0, sizeof(v12));
  if (ggctl_logShutdownReason(a1, (uint64_t)v5, 1u))
  {
    uint64_t v2 = logger;
    if (!os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    *(_DWORD *)buf = 136315394;
    uint64_t v9 = "readShutdownReasonData";
    __int16 v10 = 1024;
    int v11 = 2502;
    __int16 v3 = "%s:%d cannot read data";
LABEL_4:
    _os_log_impl(&dword_1E4220000, v2, OS_LOG_TYPE_DEFAULT, v3, buf, 0x12u);
    return 0;
  }
  if (!*((void *)&v6 + 1))
  {
    uint64_t v2 = logger;
    if (!os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    *(_DWORD *)buf = 136315394;
    uint64_t v9 = "readShutdownReasonData";
    __int16 v10 = 1024;
    int v11 = 2506;
    __int16 v3 = "%s:%d invalid timestamp";
    goto LABEL_4;
  }
  return parseShutdownReason((__int16 *)v5, (const UInt8 *)v12, a1);
}

uint64_t ggctl_logShutdownReason(mach_port_t a1, uint64_t a2, unsigned int a3)
{
  kern_return_t v4;
  long long v5;
  long long v7;
  uint64_t input;
  uint64_t v9;
  size_t v10;
  long long outputStruct;
  long long v12;
  long long v13;
  long long v14;
  _OWORD inputStruct[3];
  int v16;
  uint64_t v17;

  uint64_t v17 = *MEMORY[0x1E4F143B8];
  __int16 v10 = 64;
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (a3)
  {
    uint64_t v13 = 0u;
    uint64_t v14 = 0u;
    long long outputStruct = 0u;
    uint64_t v12 = 0u;
    uint64_t input = a3;
    int v4 = IOConnectCallMethod(a1, 0x11u, &input, 1u, inputStruct, 0x40uLL, 0, 0, &outputStruct, &v10);
    if (!v4)
    {
      int v5 = v12;
      *(_OWORD *)a2 = outputStruct;
      *(_OWORD *)(a2 + 16) = v5;
      *(_OWORD *)(a2 + 32) = v13;
      *(_DWORD *)(a2 + 48) = v14;
    }
  }
  else
  {
    int v7 = *(_OWORD *)(a2 + 16);
    inputStruct[0] = *(_OWORD *)a2;
    inputStruct[1] = v7;
    inputStruct[2] = *(_OWORD *)(a2 + 32);
    int v16 = *(_DWORD *)(a2 + 48);
    uint64_t v9 = a3;
    int v4 = IOConnectCallMethod(a1, 0x11u, &v9, 1u, inputStruct, 0x40uLL, 0, 0, &outputStruct, &v10);
  }
  if (v4) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

CFDictionaryRef parseShutdownReason(__int16 *a1, const UInt8 *a2, mach_port_t a3)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v41 = 0;
  keys[0] = @"ShutDownTimestamp";
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  uint64_t valuePtr = *((void *)a1 + 5);
  values[0] = CFNumberCreate(v6, kCFNumberLongType, &valuePtr);
  keys[1] = @"ShutDownUISoc";
  int v34 = *((_DWORD *)a1 + 12);
  values[1] = CFNumberCreate(v6, kCFNumberFloatType, &v34);
  keys[2] = @"ShutDownTemperature";
  int v33 = *a1;
  values[2] = CFNumberCreate(v6, kCFNumberIntType, &v33);
  keys[3] = @"ShutDownPresentDOD";
  int v32 = a1[1];
  values[3] = CFNumberCreate(v6, kCFNumberIntType, &v32);
  keys[4] = @"ShutDownMaxRa08";
  int v31 = a1[2];
  values[4] = CFNumberCreate(v6, kCFNumberIntType, &v31);
  keys[5] = @"ShutDownNominalChargeCapacity";
  int v30 = (unsigned __int16)a1[3];
  values[5] = CFNumberCreate(v6, kCFNumberIntType, &v30);
  keys[6] = @"ShutDownPrevNominalChargeCapacity";
  int v29 = (unsigned __int16)a1[4];
  values[6] = CFNumberCreate(v6, kCFNumberIntType, &v29);
  keys[7] = @"ShutDownFullChargeCapacity";
  int v28 = a1[5];
  values[7] = CFNumberCreate(v6, kCFNumberIntType, &v28);
  keys[8] = @"ShutDownPrevFullChargeCapacity";
  int v27 = a1[6];
  values[8] = CFNumberCreate(v6, kCFNumberIntType, &v27);
  keys[9] = @"ShutDownRemainingCapacity";
  int v26 = a1[7];
  values[9] = CFNumberCreate(v6, kCFNumberIntType, &v26);
  keys[10] = @"ShutDownPrevRemainingCapacity";
  int v25 = a1[8];
  values[10] = CFNumberCreate(v6, kCFNumberIntType, &v25);
  keys[11] = @"ShutDownCycleCount";
  int v24 = (unsigned __int16)a1[9];
  values[11] = CFNumberCreate(v6, kCFNumberIntType, &v24);
  keys[12] = @"ShutDownMaxDischargeCurrent";
  int v23 = a1[10];
  values[12] = CFNumberCreate(v6, kCFNumberIntType, &v23);
  keys[13] = @"ShutDownTimeAbove95";
  int v22 = *((unsigned __int8 *)a1 + 22);
  values[13] = CFNumberCreate(v6, kCFNumberIntType, &v22);
  keys[14] = @"ShutDownVoltage";
  int v21 = *(__int16 *)((char *)a1 + 23);
  values[14] = CFNumberCreate(v6, kCFNumberIntType, &v21);
  keys[15] = @"ShutDownPrevVoltage";
  int v20 = *(__int16 *)((char *)a1 + 25);
  values[15] = CFNumberCreate(v6, kCFNumberIntType, &v20);
  keys[16] = @"ShutDownAverageCurrent";
  int v19 = *(__int16 *)((char *)a1 + 27);
  values[16] = CFNumberCreate(v6, kCFNumberIntType, &v19);
  keys[17] = @"ShutDownPrevAverageCurrent";
  int v18 = *(__int16 *)((char *)a1 + 29);
  values[17] = CFNumberCreate(v6, kCFNumberIntType, &v18);
  keys[18] = @"ShutDownCycleCountLastQmax";
  int v17 = *((unsigned __int8 *)a1 + 31);
  values[18] = CFNumberCreate(v6, kCFNumberIntType, &v17);
  keys[19] = @"ShutDownResScale";
  int v16 = (unsigned __int16)a1[16];
  values[19] = CFNumberCreate(v6, kCFNumberIntType, &v16);
  keys[20] = @"ShutDownQstart";
  int v15 = a1[17];
  values[20] = CFNumberCreate(v6, kCFNumberIntType, &v15);
  keys[21] = @"ShutDownPassedCharge";
  int v14 = a1[18];
  values[21] = CFNumberCreate(v6, kCFNumberIntType, &v14);
  keys[22] = @"ShutDownDOD0";
  int v13 = (unsigned __int16)a1[19];
  *(void *)&long long v43 = CFNumberCreate(v6, kCFNumberIntType, &v13);
  *(void *)&long long v39 = @"Raw";
  *((void *)&v43 + 1) = CFDataCreate(v6, (const UInt8 *)a1, 52);
  uint64_t v48 = 0;
  *(_OWORD *)bytes = 0u;
  long long v47 = 0u;
  size_t v37 = 40;
  uint64_t v51 = 0;
  long long outputStruct = 0u;
  long long v50 = 0u;
  uint64_t input = 1;
  if (!IOConnectCallMethod(a3, 0x12u, &input, 1u, 0, 0, 0, 0, &outputStruct, &v37))
  {
    *(_OWORD *)bytes = outputStruct;
    long long v47 = v50;
    uint64_t v48 = v51;
  }
  *((void *)&v39 + 1) = @"ShutDownDLog";
  *(void *)&long long v44 = CFDataCreate(v6, bytes, 40);
  *(void *)&long long v40 = @"timeSinceAwake";
  uint64_t v12 = *(void *)a2;
  *((void *)&v44 + 1) = CFNumberCreate(v6, kCFNumberLongType, &v12);
  *((void *)&v40 + 1) = @"ShutDownRaTableRaw";
  *(void *)&long long v45 = CFDataCreate(v6, a2 + 8, 32);
  v41 = @"ShutDownRSS";
  uint64_t v11 = *((unsigned __int16 *)a2 + 20);
  *((void *)&v45 + 1) = CFNumberCreate(v6, kCFNumberIntType, &v11);
  CFDictionaryRef v7 = CFDictionaryCreate(v6, (const void **)keys, (const void **)values, 28, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  uint64_t v8 = 27;
  do
  {
    CFRelease(values[v8]);
    unint64_t v9 = v8-- + 1;
  }
  while (v9 > 1);
  return v7;
}

uint64_t writeBatteryDiagnosticData(mach_port_t a1)
{
  v5[44] = *MEMORY[0x1E4F143B8];
  bzero(v4, 0x258uLL);
  size_t outputStructCnt = 352;
  return IOConnectCallStructMethod(a1, 2u, 0, 0, v5, &outputStructCnt);
}

BOOL okToLoad()
{
  memset(&v1, 0, sizeof(v1));
  return stat("/dev/cu.gas-gauge", &v1) == 0;
}

uint64_t startUpdateThread(unsigned int a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  memset(&v7, 0, sizeof(v7));
  if (stat("/dev/cu.gas-gauge", &v7)) {
    return 0xFFFFFFFFLL;
  }
  pthread_t v6 = 0;
  memset(&v7, 0, 64);
  pthread_attr_init((pthread_attr_t *)&v7);
  pthread_attr_setdetachstate((pthread_attr_t *)&v7, 2);
  logger = (uint64_t)os_log_create("com.apple.AppleHDQGasGauge", "battery");
  if (!logger) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = pthread_create(&v6, (const pthread_attr_t *)&v7, (void *(__cdecl *)(void *))updateThread, (void *)a1);
  if (v2)
  {
    int v4 = logger;
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v5 = 0;
      _os_log_error_impl(&dword_1E4220000, v4, OS_LOG_TYPE_ERROR, "pthread_create", v5, 2u);
      int v4 = logger;
    }
    os_release(v4);
  }
  else
  {
    pthread_attr_destroy((pthread_attr_t *)&v7);
  }
  return v2;
}

uint64_t updateThread(uint64_t a1)
{
  kern_return_t v66;
  int v67;
  NSObject *v68;
  int v69;
  int v70;
  NSObject *v71;
  CFAbsoluteTime v72;
  BOOL v73;
  BOOL v74;
  char v75;
  double v76;
  double v77;
  NSObject *v78;
  NSObject *v79;
  int v80;
  int v81;
  int v82;
  NSObject *v83;
  int v84;
  NSObject *v85;
  int v86;
  CFTypeRef CFProperty;
  CFTypeRef v88;
  CFTypeID v89;
  int v90;
  unsigned __int8 v91;
  NSObject *v92;
  int v93;
  int hdq_state;
  CFPropertyListRef v95;
  BOOL v96;
  io_connect_t v97;
  int v98;
  int *v99;
  int v100;
  NSObject *v101;
  unsigned int v102;
  int v103;
  int v104;
  NSObject *v105;
  NSObject *v106;
  int v107;
  BOOL v108;
  uint64_t v109;
  int v110;
  int v111;
  CFNumberRef v112;
  CFNumberRef v113;
  int v114;
  BOOL v115;
  NSObject *v116;
  int v117;
  int Block;
  NSObject *v119;
  __darwin_time_t v120;
  unint64_t v121;
  NSObject *v122;
  __darwin_time_t v123;
  int v124;
  NSObject *v125;
  __darwin_time_t v126;
  unint64_t v127;
  NSObject *v128;
  NSObject *v129;
  __darwin_time_t v130;
  char v131;
  NSObject *v132;
  unint64_t v133;
  BOOL v134;
  BOOL v135;
  unint64_t v136;
  BOOL v137;
  NSObject *v138;
  int v139;
  int v140;
  NSObject *v141;
  NSObject *v142;
  int v143;
  NSObject *v144;
  uint64_t v145;
  int BatteryData;
  CFDictionaryRef ChargerData;
  BOOL v148;
  int v149;
  int v150;
  BOOL v151;
  int v152;
  int v153;
  __int16 v154;
  NSObject *v155;
  BOOL v156;
  __int16 v157;
  int v158;
  unsigned int v159;
  NSObject *v160;
  NSObject *v161;
  BOOL v162;
  int v163;
  BOOL v164;
  NSObject *v165;
  NSObject *v166;
  BOOL v167;
  CFDictionaryRef v168;
  NSObject *v169;
  CFAllocatorRef v170;
  int v171;
  __CFString *v172;
  int v173;
  int v174;
  NSObject *v175;
  BOOL v176;
  unsigned int v177;
  int v179;
  CFNumberRef v180;
  uint64_t v181;
  uint64_t v182;
  int U16;
  BOOL v184;
  NSObject *v185;
  unint64_t v186;
  NSObject *v187;
  CFNumberRef v188;
  uint64_t v189;
  uint64_t v190;
  CFNumberRef v191;
  uint64_t v192;
  CFNumberRef v193;
  uint64_t v194;
  CFNumberRef v195;
  uint64_t v196;
  CFNumberRef v197;
  uint64_t v198;
  unsigned int v199;
  CFNumberRef v200;
  uint64_t v201;
  const void *v202;
  uint64_t v203;
  CFNumberRef v204;
  uint64_t v205;
  char *v206;
  CFNumberRef v207;
  uint64_t v208;
  CFNumberRef v209;
  uint64_t v210;
  CFNumberRef v211;
  uint64_t v212;
  CFNumberRef v213;
  uint64_t v214;
  CFDictionaryRef v215;
  CFDictionaryRef v216;
  CFDictionaryRef v217;
  NSObject *v218;
  CFDictionaryRef v219;
  CFDictionaryRef v220;
  NSObject *v221;
  CFDictionaryRef v222;
  NSObject *v223;
  int S16;
  int v226;
  NSObject *v227;
  time_t v228;
  uint64_t v229;
  NSObject *v230;
  const char *v231;
  char v232;
  time_t v233;
  char v234;
  uint64_t v235;
  BOOL v236;
  NSObject *v237;
  const char *v238;
  int v239;
  int v240;
  NSObject *v241;
  __int16 v242;
  BOOL v243;
  NSObject *v244;
  int v245;
  int v246;
  int v247;
  NSObject *v248;
  char v249;
  NSObject *v250;
  int v251;
  NSObject *v252;
  int v253;
  int v254;
  int v255;
  NSObject *v256;
  NSObject *v257;
  uint64_t v258;
  BOOL v259;
  NSObject *v260;
  const char *v261;
  uint32_t v262;
  CFAbsoluteTime v263;
  NSObject *v264;
  NSObject *v265;
  int v266;
  BOOL v267;
  NSObject *log;
  os_log_t loga;
  os_log_t logb;
  os_log_t logc;
  int v272;
  int v273;
  BOOL v274;
  int v275;
  int v276;
  int v277;
  uint64_t v278;
  os_log_t v279;
  BOOL v280;
  NSObject *v281;
  time_t v282;
  BOOL v283;
  char v284;
  BOOL v285;
  int v286;
  uint64_t v287;
  BOOL v288;
  int v289;
  int v290;
  int v291;
  uint64_t v292;
  int v293;
  CFPropertyListRef v294;
  int v295;
  BOOL *v296;
  unsigned int v297;
  BOOL v298;
  BOOL v299;
  CFStringRef v300;
  CFStringRef v301;
  CFStringRef mode;
  io_connect_t v303;
  BOOL v304;
  BOOL v305;
  CFAllocatorRef allocator;
  io_connect_t kernelPort;
  CFTypeRef v308;
  BOOL v309;
  int v310;
  char v311;
  char v312;
  char v313[7];
  int v314;
  int v315;
  int v316;
  int v317;
  int v318;
  int v319;
  int v320;
  int v321;
  int v322;
  int v323;
  int v324;
  int v325;
  int v326;
  int v327;
  int v328;
  int v329;
  BOOL v330;
  int v331;
  char v332;
  char v333[15];
  char v334;
  char v335[15];
  char v336;
  char v337[15];
  size_t v338;
  int valuePtr;
  uint64_t refCon;
  intptr_t notificationID;
  io_object_t notifier;
  IONotificationPortRef thePortRef;
  unsigned __int16 v344;
  int v345;
  io_object_t notification[2];
  uint8_t v347[4];
  int v348[3];
  uint8_t v349[4];
  const char *v350;
  __int16 v351;
  int v352;
  void *keys[2];
  long long v354;
  long long v355;
  unsigned char input[52];
  double v357;
  int v358;
  void *v359[2];
  long long v360;
  long long v361;
  long long v362;
  long long v363;
  long long v364;
  long long v365;
  long long v366;
  long long v367;
  long long v368;
  long long v369;
  long long v370;
  long long v371;
  long long v372;
  long long v373;
  long long v374;
  long long v375;
  long long v376;
  long long v377;
  long long v378;
  long long v379;
  long long v380;
  uint8_t buf[32];
  long long v382;
  long long v383;
  long long v384;
  long long v385;
  long long v386;
  long long v387;
  long long v388;
  long long v389;
  long long v390;
  long long v391;
  long long v392;
  long long v393;
  long long v394;
  long long v395;
  long long v396;
  long long v397;
  long long v398;
  long long v399;
  long long v400;
  long long v401;
  char v402[64];
  uint64_t v403;

  v403 = *MEMORY[0x1E4F143B8];
  *(void *)notification = 0;
  v345 = 0;
  v344 = 0;
  thePortRef = 0;
  notifier = 0;
  notificationID = 0;
  refCon = 0;
  pthread_setname_np("GasGauge-updateThread");
  uint64_t v2 = &handlePeer_forEvent__classDebugEnabled_685;
  gRestrictLogMessagesCounter = 0;
  __int16 v3 = &OBJC_IVAR___PLXPCAgent__telNotificationXPCListener;
  int v4 = logger;
  if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4220000, v4, OS_LOG_TYPE_DEFAULT, "gasgauge: updateThread start", buf, 2u);
  }
  unsigned int v5 = pmps_service();
  if (v5)
  {
    io_service_t v6 = v5;
    mach_port_t v7 = *MEMORY[0x1E4F2EEF0];
    uint64_t v8 = IONotificationPortCreate(*MEMORY[0x1E4F2EEF0]);
    if (IOServiceAddInterestNotification(v8, v6, "IOGeneralInterest", (IOServiceInterestCallback)iokit_callback, &refCon, notification))
    {
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
        updateThread_cold_10();
      }
      return 0;
    }
    Current = CFRunLoopGetCurrent();
    RunLoopSource = IONotificationPortGetRunLoopSource(v8);
    CFStringRef v11 = (const __CFString *)*MEMORY[0x1E4F1D418];
    CFRunLoopAddSource(Current, RunLoopSource, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
    kernelPort = IORegisterForSystemPower(&refCon, &thePortRef, (IOServiceInterestCallback)iokit_callback, &notifier);
    if (kernelPort && thePortRef)
    {
      uint64_t v12 = CFRunLoopGetCurrent();
      int v13 = IONotificationPortGetRunLoopSource(thePortRef);
      CFRunLoopAddSource(v12, v13, v11);
      uint64_t v14 = ggctl_connect(&notification[1]);
      if (!v14) {
        return 0;
      }
      io_connect_t v15 = v14;
      *(void *)buf = 0;
      v359[0] = 0;
      mach_error_t v16 = MEMORY[0x1E4E7DDF0](v14, 0, *MEMORY[0x1E4F14960], buf, v359, 1);
      if (v16) {
        int v17 = 0;
      }
      else {
        int v17 = *(BOOL **)buf;
      }
      if (v16)
      {
        mach_error_t v18 = v16;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
          updateThread_cold_9(v18);
        }
        IOServiceClose(v15);
        return 0;
      }
      v292 = *(void *)buf;
      v296 = v17;
      mode = v11;
      *(void *)buf = 352;
      IOConnectCallStructMethod(v15, 2u, 0, 0, &dword_1EAE47A50, (size_t *)buf);
      byte_1EAE4799C = dword_1EAE47AF4 != 0;
      v344 = word_1EAE47ADE;
      v289 = dword_1EAE47BA8;
      uint64_t valuePtr = dword_1EAE47AE4;
      v300 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
      v301 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
      CFNumberRef v20 = (const __CFNumber *)CFPreferencesCopyValue(@"UpdateSampleConfig", @"com.apple.gasgauge", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
      if (v20)
      {
        CFNumberRef v21 = v20;
        CFTypeID v22 = CFGetTypeID(v20);
        if (v22 == CFNumberGetTypeID())
        {
          CFNumberGetValue(v21, kCFNumberSInt32Type, &valuePtr);
          int v23 = logger;
          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = valuePtr;
            _os_log_impl(&dword_1E4220000, v23, OS_LOG_TYPE_DEFAULT, "changed updateSampleConfig=%#x", buf, 8u);
          }
        }
        CFRelease(v21);
      }
      v297 = valuePtr;
      CFNumberRef v24 = (const __CFNumber *)CFPreferencesCopyValue(@"CriticalBattery", @"com.apple.gasgauge", v301, v300);
      if (v24)
      {
        CFNumberRef v25 = v24;
        CFTypeID v26 = CFGetTypeID(v24);
        if (v26 == CFNumberGetTypeID())
        {
          CFNumberGetValue(v25, kCFNumberSInt32Type, &word_1EAE47ADC);
          CFRelease(v25);
        }
        else
        {
          int Value = CFBooleanGetValue(v25);
          CFRelease(v25);
          if (!Value)
          {
            v265 = logger;
            v295 = 0;
            if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1E4220000, v265, OS_LOG_TYPE_DEFAULT, "Critical battery shutdown disabled", buf, 2u);
              v295 = 0;
            }
            goto LABEL_30;
          }
        }
      }
      v295 = 1;
LABEL_30:
      CFBooleanRef v28 = (const __CFBoolean *)CFPreferencesCopyValue(@"UserMode", @"com.apple.gasgauge", v301, v300);
      if (v28)
      {
        CFBooleanRef v29 = v28;
        CFTypeID v30 = CFGetTypeID(v28);
        v298 = v30 == CFBooleanGetTypeID() && CFBooleanGetValue(v29) != 0;
        CFRelease(v29);
        int v31 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v298;
          _os_log_impl(&dword_1E4220000, v31, OS_LOG_TYPE_DEFAULT, "gas gauge: userModeEnabled=%d", buf, 8u);
        }
      }
      else
      {
        v298 = 0;
      }
      CFNumberRef v32 = (const __CFNumber *)CFPreferencesCopyValue(@"CriticalFlagDelay", @"com.apple.gasgauge", v301, v300);
      if (v32)
      {
        CFNumberRef v33 = v32;
        CFTypeID v34 = CFGetTypeID(v32);
        if (v34 == CFNumberGetTypeID()) {
          CFNumberGetValue(v33, kCFNumberSInt32Type, &v344);
        }
        CFRelease(v33);
        uint64_t v35 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v344;
          _os_log_impl(&dword_1E4220000, v35, OS_LOG_TYPE_DEFAULT, "gas gauge: critical flag delay %d", buf, 8u);
        }
      }
      CFBooleanRef v36 = (const __CFBoolean *)CFPreferencesCopyValue(@"DebugPolling", @"com.apple.gasgauge", v301, v300);
      if (v36)
      {
        CFBooleanRef v37 = v36;
        CFTypeID v38 = CFGetTypeID(v36);
        if (v38 == CFBooleanGetTypeID()) {
          debug_polling = CFBooleanGetValue(v37) != 0;
        }
        CFRelease(v37);
        long long v39 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = debug_polling;
          _os_log_impl(&dword_1E4220000, v39, OS_LOG_TYPE_DEFAULT, "gas gauge: debug_polling=%d", buf, 8u);
        }
      }
      CFNumberRef v40 = (const __CFNumber *)CFPreferencesCopyValue(@"RestricLogCounter", @"com.apple.gasgauge", v301, v300);
      if (v40)
      {
        CFNumberRef v41 = v40;
        CFTypeID v42 = CFGetTypeID(v40);
        if (v42 == CFNumberGetTypeID()) {
          CFNumberGetValue(v41, kCFNumberSInt32Type, &gRestrictLogCounter);
        }
        CFRelease(v41);
        long long v43 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = gRestrictLogCounter;
          _os_log_impl(&dword_1E4220000, v43, OS_LOG_TYPE_DEFAULT, "gas gauge: log counter %d", buf, 8u);
        }
      }
      v310 = dword_1EAE47AE8;
      if (dword_1EAE47AE8)
      {
        long long v44 = IONotificationPortCreate(v7);
        uint64_t v45 = IOServiceAddInterestNotification(v44, notification[1], "IOGeneralInterest", (IOServiceInterestCallback)iokit_callback, &refCon, notification);
        uint64_t v46 = logger;
        if (v45)
        {
          uint64_t v47 = v45;
          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
            updateThread_cold_8(v47, v46, v48, v49, v50, v51, v52, v53);
          }
        }
        else
        {
          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1E4220000, v46, OS_LOG_TYPE_DEFAULT, "gasgauge: listening for battery interrupts", buf, 2u);
          }
          id v54 = CFRunLoopGetCurrent();
          v55 = IONotificationPortGetRunLoopSource(v44);
          CFRunLoopAddSource(v54, v55, v11);
        }
      }
      v345 = 0;
      getUPOData(@"IOPMUBootUPOState", &v345);
      v304 = v345 != 0;
      getUPOData(@"IOPMUBootBatteryHealthMetric", &dword_1EAE47A48);
      v338 = 64;
      if (sysctlbyname("hw.model", v402, &v338, 0, 0) && os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
        updateThread_cold_7();
      }
      v303 = v15;
      __darwin_time_t v56 = UpSeconds();
      long long v57 = logger;
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134219776;
        *(void *)&uint8_t buf[4] = v56;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v295;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = (unsigned __int16)word_1EAE47ADC;
        *(_WORD *)&buf[24] = 1024;
        *(_DWORD *)&buf[26] = valuePtr;
        *(_WORD *)&buf[30] = 1024;
        LODWORD(v382) = byte_1EAE4799C;
        WORD2(v382) = 1024;
        *(_DWORD *)((char *)&v382 + 6) = v344;
        WORD5(v382) = 1024;
        HIDWORD(v382) = dword_1EAE47AE0;
        LOWORD(v383) = 1024;
        *(_DWORD *)((char *)&v383 + 2) = v345;
        _os_log_impl(&dword_1E4220000, v57, OS_LOG_TYPE_DEFAULT, "gasgauge: %llu updateThread critical(%d, 0x%x), uscfg=0x%x, dyn=%d cfd=%d cfd-voltage=%d, upos=%x", buf, 0x36u);
      }
      v287 = a1;
      v283 = a1 != 0;
      LOBYTE(v58) = 0;
      v288 = 0;
      v309 = 0;
      v305 = 0;
      v299 = 0;
      char v59 = 0;
      v311 = 0;
      v284 = 0;
      v282 = 0;
      int v60 = 0;
      v293 = 0;
      int v61 = 0;
      qword_1EAE47A40 = time(0);
      v285 = (dword_1EAE47AF8 | dword_1EAE47B3C) != 0;
      v291 = (v297 >> 2) & 1;
      v290 = (v297 >> 3) & 1;
      allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      v308 = (CFTypeRef)*MEMORY[0x1E4F1CFD0];
      v294 = (CFPropertyListRef)*MEMORY[0x1E4F1CFC8];
      double v62 = 0.0;
      double v63 = 0.0;
      LOBYTE(v286) = 1;
      int v64 = -1;
      mach_port_t v65 = -1;
      while (1)
      {
        v401 = 0u;
        v400 = 0u;
        v399 = 0u;
        v398 = 0u;
        v397 = 0u;
        v396 = 0u;
        v395 = 0u;
        v394 = 0u;
        v393 = 0u;
        v392 = 0u;
        v391 = 0u;
        v390 = 0u;
        v389 = 0u;
        v388 = 0u;
        v387 = 0u;
        v386 = 0u;
        v385 = 0u;
        v384 = 0u;
        v383 = 0u;
        v382 = 0u;
        memset(buf, 0, sizeof(buf));
        v380 = 0u;
        v379 = 0u;
        v378 = 0u;
        v377 = 0u;
        v376 = 0u;
        v375 = 0u;
        v374 = 0u;
        v373 = 0u;
        v372 = 0u;
        v371 = 0u;
        v370 = 0u;
        v368 = 0u;
        v369 = 0u;
        v366 = 0u;
        v367 = 0u;
        v364 = 0u;
        v365 = 0u;
        v362 = 0u;
        v363 = 0u;
        v360 = 0u;
        v361 = 0u;
        *(_OWORD *)v359 = 0u;
        if (v310 && v65 != -1)
        {
          *(void *)uint64_t input = 1;
          v66 = IOConnectCallScalarMethod(v65, 0x10u, (const uint64_t *)input, 1u, 0, 0);
          v67 = v66 == -536870183 ? -2 : -1;
          if (v66)
          {
            uint64_t v68 = *((void *)v3 + 385);
            if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)uint64_t input = 67109120;
              *(_DWORD *)&input[4] = v67;
              _os_log_impl(&dword_1E4220000, v68, OS_LOG_TYPE_DEFAULT, "cannot enable gauge interrupts (%d)", input, 8u);
            }
          }
        }
        LODWORD(refCon) = 0;
        if (v60)
        {
          v69 = *((_DWORD *)v2 + 748);
          if (v69)
          {
            v70 = v69 - 1;
          }
          else
          {
            if (v62 == 0.0) {
              goto LABEL_81;
            }
            uint64_t v71 = *((void *)v3 + 385);
            if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
            {
              v72 = CFAbsoluteTimeGetCurrent();
              *(_DWORD *)uint64_t input = 67109632;
              *(_DWORD *)&input[4] = v60;
              *(_WORD *)&input[8] = 2048;
              *(double *)&input[10] = v72 - v62;
              *(_WORD *)&input[18] = 1024;
              *(_DWORD *)&input[20] = gRestrictLogCounter;
              _os_log_impl(&dword_1E4220000, v71, OS_LOG_TYPE_DEFAULT, "failure last_update_failed_counter=%d last_success at %g, supressing %d subsequent errors", input, 0x18u);
            }
            v70 = gRestrictLogCounter;
          }
          *((_DWORD *)v2 + 748) = v70;
        }
LABEL_81:
        uint64_t v73 = v64 != -1;
        v74 = v64 < 50;
        v75 = v73 && v74;
        if (v73 && v74) {
          id v76 = 5.0;
        }
        else {
          id v76 = 20.0;
        }
        if (v59)
        {
LABEL_527:
          IOObjectRelease(v6);
          MEMORY[0x1E4E7DE00](v303, 0, *MEMORY[0x1E4F14960], v296);
          IOServiceClose(v303);
          *((_DWORD *)v2 + 748) = 0;
          v264 = *((void *)v3 + 385);
          if (os_log_type_enabled(v264, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1E4220000, v264, OS_LOG_TYPE_DEFAULT, "gasgauge: updateThread terminated", buf, 2u);
          }
          return 0;
        }
        if (!(v61 | v60)) {
          goto LABEL_122;
        }
        v77 = CFAbsoluteTimeGetCurrent();
        if (debug_polling && (v78 = *((void *)v3 + 385), os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG)))
        {
          *(_DWORD *)uint64_t input = 136316418;
          *(void *)&input[4] = "updateThread";
          *(_WORD *)&input[12] = 1024;
          *(_DWORD *)&input[14] = 2802;
          *(_WORD *)&input[18] = 1024;
          *(_DWORD *)&input[20] = v61;
          *(_WORD *)&input[24] = 1024;
          *(_DWORD *)&input[26] = v58 & 1;
          *(_WORD *)&input[30] = 2048;
          *(double *)&input[32] = v77;
          *(_WORD *)&input[40] = 2048;
          *(double *)&input[42] = v63;
          _os_log_debug_impl(&dword_1E4220000, v78, OS_LOG_TYPE_DEBUG, "*** %s:%d updatesDone=%d last_update_ignored=%d now=%f deadline=%f *** ", input, 0x32u);
          if ((v58 & 1) == 0)
          {
LABEL_92:
            double v63 = v76 + v77;
            goto LABEL_93;
          }
        }
        else if ((v58 & 1) == 0)
        {
          goto LABEL_92;
        }
        id v76 = 0.0;
        if (v77 < v63) {
          id v76 = v63 - v77;
        }
LABEL_93:
        if (debug_polling)
        {
          v79 = *((void *)v3 + 385);
          if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)uint64_t input = 136316674;
            *(void *)&input[4] = "updateThread";
            *(_WORD *)&input[12] = 1024;
            *(_DWORD *)&input[14] = 2860;
            *(_WORD *)&input[18] = 1024;
            *(_DWORD *)&input[20] = v61;
            *(_WORD *)&input[24] = 1024;
            *(_DWORD *)&input[26] = v58 & 1;
            *(_WORD *)&input[30] = 2048;
            *(double *)&input[32] = v77;
            *(_WORD *)&input[40] = 2048;
            *(double *)&input[42] = v63;
            *(_WORD *)&input[50] = 2048;
            v357 = v76;
            _os_log_error_impl(&dword_1E4220000, v79, OS_LOG_TYPE_ERROR, "*** %s:%d updatesDone=%d last_update_ignored=%d now=%f deadline=%f update_interval=%f *** ", input, 0x3Cu);
          }
        }
        if (v76 == 0.0)
        {
          int v58 = 0;
          LODWORD(refCon) = 0;
LABEL_121:
          LOBYTE(v58) = v58 != 0;
          goto LABEL_122;
        }
        if (CFRunLoopRunInMode(mode, v76, 1u) != kCFRunLoopRunHandledSource)
        {
          int v58 = 0;
          goto LABEL_121;
        }
        int v58 = 0;
        uint64_t v80 = refCon;
        v81 = 1;
        if ((int)refCon > -536870145)
        {
          if (refCon == -536870144 || refCon == -536723200) {
            goto LABEL_113;
          }
          v82 = -469794560;
        }
        else
        {
          if ((refCon + 536870288) <= 0x20
            && ((1 << (refCon - 112)) & 0x100010001) != 0)
          {
            goto LABEL_113;
          }
          v82 = -536870320;
        }
        if (refCon != v82)
        {
          v81 = debug_polling;
          if (debug_polling)
          {
            v83 = *((void *)v3 + 385);
            if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)uint64_t input = 136315906;
              *(void *)&input[4] = "updateThread";
              *(_WORD *)&input[12] = 1024;
              *(_DWORD *)&input[14] = 2879;
              *(_WORD *)&input[18] = 1024;
              *(_DWORD *)&input[20] = v61;
              *(_WORD *)&input[24] = 1024;
              *(_DWORD *)&input[26] = v80;
              _os_log_error_impl(&dword_1E4220000, v83, OS_LOG_TYPE_ERROR, "*** %s:%d updatesDone=%d message.messageType=%#x  (ign) *** ", input, 0x1Eu);
            }
            v81 = 0;
            int v58 = 1;
          }
          else
          {
            int v58 = 1;
          }
        }
LABEL_113:
        if (v80 > -536870145)
        {
          if (v80 == -536870144 || v80 == -469794560) {
            goto LABEL_121;
          }
          v84 = -536723200;
        }
        else
        {
          if ((v80 + 536870288) <= 0x20 && ((1 << (v80 - 112)) & 0x100010001) != 0) {
            goto LABEL_121;
          }
          v84 = -536870320;
        }
        if (v80 == v84) {
          goto LABEL_121;
        }
        if (v81)
        {
LABEL_122:
          if (debug_polling && (v85 = *((void *)v3 + 385), os_log_type_enabled(v85, OS_LOG_TYPE_ERROR)))
          {
            *(_DWORD *)uint64_t input = 136316162;
            *(void *)&input[4] = "updateThread";
            *(_WORD *)&input[12] = 1024;
            *(_DWORD *)&input[14] = 2897;
            *(_WORD *)&input[18] = 1024;
            *(_DWORD *)&input[20] = v61;
            *(_WORD *)&input[24] = 1024;
            *(_DWORD *)&input[26] = refCon;
            *(_WORD *)&input[30] = 1024;
            *(_DWORD *)&input[32] = v311 & 1;
            _os_log_error_impl(&dword_1E4220000, v85, OS_LOG_TYPE_ERROR, "*** %s:%d updatesDone=%d message.messageType=%#x system_sleep=%d *** ", input, 0x24u);
            if (v61) {
              goto LABEL_125;
            }
LABEL_126:
            CFProperty = IORegistryEntryCreateCFProperty(v6, @"AdapterInfo", allocator, 0);
            v88 = IORegistryEntryCreateCFProperty(v6, @"AppleRawExternalConnected", allocator, 0);
            LODWORD(keys[0]) = 0;
            if (CFProperty)
            {
              v89 = CFGetTypeID(CFProperty);
              if (v89 == CFNumberGetTypeID()) {
                CFNumberGetValue((CFNumberRef)CFProperty, kCFNumberSInt32Type, keys);
              }
              CFRelease(CFProperty);
              v90 = (int)keys[0];
              if (v309 != (LODWORD(keys[0]) == 0))
              {
LABEL_132:
                v91 = v305 ^ (v88 != v308);
                goto LABEL_133;
              }
              v91 = 0;
            }
            else
            {
              v90 = 0;
              v91 = 0;
              if (!v309) {
                goto LABEL_132;
              }
            }
LABEL_133:
            if (debug_polling)
            {
              v92 = logger;
              if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)uint64_t input = 136316418;
                *(void *)&input[4] = "updateThread";
                *(_WORD *)&input[12] = 1024;
                *(_DWORD *)&input[14] = 2921;
                *(_WORD *)&input[18] = 1024;
                *(_DWORD *)&input[20] = v61;
                *(_WORD *)&input[24] = 1024;
                *(_DWORD *)&input[26] = v91 & 1;
                *(_WORD *)&input[30] = 1024;
                *(_DWORD *)&input[32] = v90;
                *(_WORD *)&input[36] = 1024;
                *(_DWORD *)&input[38] = v88 == v308;
                _os_log_impl(&dword_1E4220000, v92, OS_LOG_TYPE_DEFAULT, "*** %s:%d updatesDone=%d same_adaptor=%d adaptor_type=%d external_connected=%d *** ", input, 0x2Au);
              }
            }
            if ((v91 & (v61 != 0)) != 1 || v76 == 0.0)
            {
              v93 = (int)keys[0];
              v309 = LODWORD(keys[0]) != 0;
              v305 = v88 == v308;
              uint64_t v2 = &handlePeer_forEvent__classDebugEnabled_685;
              if (v88) {
                CFRelease(v88);
              }
              if (v93 != 0 && v304)
              {
                setUPOData(@"IOPMUBootUPOState", 0);
                v304 = 0;
              }
              ++debug_cnt_ut_recv;
              v86 = refCon;
              __int16 v3 = &OBJC_IVAR___PLXPCAgent__telNotificationXPCListener;
              goto LABEL_147;
            }
            uint64_t v2 = &handlePeer_forEvent__classDebugEnabled_685;
            if (v88) {
              CFRelease(v88);
            }
            char v59 = 0;
            mach_port_t v65 = -1;
            LOBYTE(v58) = 1;
LABEL_141:
            __int16 v3 = &OBJC_IVAR___PLXPCAgent__telNotificationXPCListener;
          }
          else
          {
            if (!v61) {
              goto LABEL_126;
            }
LABEL_125:
            v86 = refCon;
            if (refCon == -536723200) {
              goto LABEL_126;
            }
LABEL_147:
            if (v86 == -469794560)
            {
              LOBYTE(v58) = 1;
              if (v76 != 0.0) {
                v75 = 1;
              }
            }
            if ((v311 & (v86 != -536870144)) != 0)
            {
LABEL_156:
              char v59 = 0;
              mach_port_t v65 = -1;
              v311 = 1;
            }
            else if (v86 == -536870288)
            {
              IOAllowPowerChange(kernelPort, notificationID);
              char v59 = 0;
              mach_port_t v65 = -1;
              LOBYTE(v58) = 1;
            }
            else
            {
              if (v60 && v86 == -536870272)
              {
                IOAllowPowerChange(kernelPort, notificationID);
                goto LABEL_156;
              }
              if (v303 == -1)
              {
                char v59 = 0;
                ++v60;
                goto LABEL_166;
              }
              if (v86 == -536870144)
              {
                if (v299) {
                  updateThermalCoolDownState(notification[1], 0);
                }
                v299 = 0;
                if (v311)
                {
                  v311 = 0;
                  qword_1EAE47A40 = time(0);
                }
                else
                {
                  v311 = 0;
                }
              }
              int hdq_state = ggctl_get_hdq_state(v303);
              if (hdq_state == -2)
              {
                char v59 = 1;
                goto LABEL_445;
              }
              if (hdq_state)
              {
                if (hdq_state < 0)
                {
                  if (os_log_type_enabled(*((os_log_t *)v3 + 385), OS_LOG_TYPE_ERROR)) {
                    updateThread_cold_2(&v332, v333);
                  }
                  char v59 = 0;
                  goto LABEL_444;
                }
                v98 = hdqBreak(v303);
                if (v98 != -2)
                {
                  if (v98 < 0)
                  {
                    v99 = v3;
                    v100 = ++updateThread_debug_break_failures;
                    v101 = *((void *)v99 + 385);
                    if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)uint64_t input = 136315906;
                      *(void *)&input[4] = "updateThread";
                      *(_WORD *)&input[12] = 1024;
                      *(_DWORD *)&input[14] = 3024;
                      *(_WORD *)&input[18] = 1024;
                      *(_DWORD *)&input[20] = v100;
                      *(_WORD *)&input[24] = 1024;
                      *(_DWORD *)&input[26] = -1;
                      _os_log_error_impl(&dword_1E4220000, v101, OS_LOG_TYPE_ERROR, "%s:%d break failed break_failures=%d (%d)", input, 0x1Eu);
                      v100 = updateThread_debug_break_failures;
                    }
                    if ((-858993459 * v100) <= 0x33333333)
                    {
                      statsAndLogs(notification[1], 0);
                      __int16 v3 = &OBJC_IVAR___PLXPCAgent__telNotificationXPCListener;
                    }
                    else
                    {
                      v102 = -1227133513 * v100;
                      __int16 v3 = &OBJC_IVAR___PLXPCAgent__telNotificationXPCListener;
                      if (v102 <= 0x24924924) {
                        debugLog(notification[1], 63);
                      }
                    }
                  }
                  else if (updateThread_debug_break_failures)
                  {
                    statsAndLogs(notification[1], 1);
                    debugLog(notification[1], 0);
                    updateThread_debug_break_failures = 0;
                  }
                }
                if (v310)
                {
                  if (v61)
                  {
                    v103 = gaugeDisableInterrupts(v303);
                    if (v103 < 0)
                    {
                      v104 = v103;
                      v105 = *((void *)v3 + 385);
                      if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)uint64_t input = 136315650;
                        *(void *)&input[4] = "updateThread";
                        *(_WORD *)&input[12] = 1024;
                        *(_DWORD *)&input[14] = 3044;
                        *(_WORD *)&input[18] = 1024;
                        *(_DWORD *)&input[20] = v104;
                        _os_log_error_impl(&dword_1E4220000, v105, OS_LOG_TYPE_ERROR, "%s:%d cannot disable gauge interrupts (%d)", input, 0x18u);
                      }
                    }
                  }
                }
                if (refCon == -536870272)
                {
                  v111 = OSThermalNotificationCurrentLevel();
                  v299 = v111 > 14;
                  uint64_t v2 = &handlePeer_forEvent__classDebugEnabled_685;
                  if (v111 >= 15) {
                    updateThermalCoolDownState(notification[1], 1);
                  }
                  IOAllowPowerChange(kernelPort, notificationID);
                  char v59 = 0;
                  v311 = 1;
                  goto LABEL_445;
                }
                uint64_t v2 = &handlePeer_forEvent__classDebugEnabled_685;
                if (refCon == -536870320) {
                  goto LABEL_527;
                }
                if (v61)
                {
                  v278 = 0;
                  goto LABEL_203;
                }
                if ((getFWVersion(v303, &word_1EAE4797E) & 0x80000000) != 0)
                {
                  char v59 = 0;
                  int v61 = 0;
                  ++v60;
                  mach_port_t v65 = v303;
                }
                else
                {
                  v112 = CFNumberCreate(allocator, kCFNumberIntType, &word_1EAE4797E);
                  if (v112)
                  {
                    v113 = v112;
                    IORegistryEntrySetCFProperty(v6, @"GasGaugeFirmwareVersion", v112);
                    CFRelease(v113);
                  }
                  v114 = (unsigned __int16)word_1EAE4797E;
                  v115 = (unsigned __int16)word_1EAE4797E - 1281 < 2;
                  *v296 = (unsigned __int16)word_1EAE4797E > 0x131u;
                  if (v114 == 265)
                  {
                    v116 = logger;
                    v295 = 0;
                    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)uint64_t input = 0;
                      _os_log_impl(&dword_1E4220000, v116, OS_LOG_TYPE_DEFAULT, "gas gauge firmware 1.09: disabling critical battery shutdown", input, 2u);
                      v295 = 0;
                    }
                  }
                  LOBYTE(v291) = v291 | v115;
                  keys[0] = 0;
                  if ((readChargeTable(v303, (__CFData **)keys) & 0x80000000) != 0)
                  {
                    char v59 = 0;
                    int v61 = 0;
                    ++v60;
                    mach_port_t v65 = v303;
                    goto LABEL_141;
                  }
                  __int16 v3 = &OBJC_IVAR___PLXPCAgent__telNotificationXPCListener;
                  if (keys[0])
                  {
                    *(void **)buf = keys[0];
                    v359[0] = @"ChargeTable";
                    v278 = 1;
                  }
                  else
                  {
                    v278 = 0;
                  }
                  if (dword_1EAE47A50) {
                    v117 = dword_1EAE47A50;
                  }
                  else {
                    v117 = 2;
                  }
                  uint64_t Block = ggctl_readBlock(v303, -1, v117, updateThread_batteryInfo, 0);
                  if (Block < 0) {
                    strcpy((char *)updateThread_batteryInfo, "000000");
                  }
                  if (v290)
                  {
                    byte_1EAE47980 = dword_1EAE47AF0;
                    if ((_BYTE)dword_1EAE47AF0)
                    {
                      LOBYTE(v290) = 1;
                    }
                    else
                    {
                      v161 = logger;
                      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                      {
                        *(void *)uint64_t input = 67109376;
                        *(_WORD *)&input[8] = 1024;
                        *(_DWORD *)&input[10] = Block;
                        _os_log_error_impl(&dword_1E4220000, v161, OS_LOG_TYPE_ERROR, "disabled passedCharge PCFF=%d err=%d", input, 0xEu);
                      }
                      LOBYTE(v290) = 0;
                      uint64_t v2 = &handlePeer_forEvent__classDebugEnabled_685;
                    }
                  }
                  else
                  {
                    LOBYTE(v290) = 0;
                  }
                  if (byte_1EAE4799C) {
                    word_1EAE4797C = 136;
                  }
                  if (hdqReadS16(v303, 60, &word_1EAE4797A)) {
                    word_1EAE4797A = 0;
                  }
                  if (controlReadU16(v303, 8, &word_1EAE47978))
                  {
                    word_1EAE47978 = 0;
                    v274 = 0;
                    v275 = 1;
                    v109 = v278;
LABEL_280:
                    v330 = v61 < 16;
                    *(void *)&buf[8 * v109] = CFNumberCreate(allocator, kCFNumberIntType, &v330);
                    v359[v109] = @"ForceFullGGUpdateOnBoot";
                    HIDWORD(v133) = -1431655764 * v61 + 143165576;
                    LODWORD(v133) = HIDWORD(v133);
                    v134 = (v133 >> 2) < 0x4444445 && v61 < 16;
                    if (v134)
                    {
                      v135 = 1;
                    }
                    else
                    {
                      HIDWORD(v136) = -1813430636 * v61 + 9544368;
                      LODWORD(v136) = HIDWORD(v136);
                      v135 = (v136 >> 4) < 0x123457;
                    }
                    v279 = (os_log_t)v109;
                    if (debug_polling)
                    {
                      v137 = v135;
                      v138 = logger;
                      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)uint64_t input = 136316418;
                        *(void *)&input[4] = "updateThread";
                        *(_WORD *)&input[12] = 1024;
                        *(_DWORD *)&input[14] = 3254;
                        *(_WORD *)&input[18] = 1024;
                        *(_DWORD *)&input[20] = v61;
                        *(_WORD *)&input[24] = 1024;
                        *(_DWORD *)&input[26] = v137;
                        *(_WORD *)&input[30] = 1024;
                        *(_DWORD *)&input[32] = v134;
                        *(_WORD *)&input[36] = 1024;
                        *(_DWORD *)&input[38] = v61 < 16;
                        _os_log_impl(&dword_1E4220000, v138, OS_LOG_TYPE_DEFAULT, "%s:%d  updatesDone=%d, fullUpdate=%d, bootFullUpdate=%d, forceFullUpdate=%d] ", input, 0x2Au);
                        v139 = debug_polling;
                      }
                      else
                      {
                        v139 = 1;
                      }
                      if (v61) {
                        v140 = v137;
                      }
                      else {
                        v140 = 0;
                      }
                      __int16 v3 = &OBJC_IVAR___PLXPCAgent__telNotificationXPCListener;
                      v135 = v137;
                      if (v139)
                      {
                        v109 = (uint64_t)v279;
                        if (v140)
                        {
                          v140 = 1;
                          statsAndLogs(notification[1], 1);
                        }
                      }
                      else
                      {
                        v109 = (uint64_t)v279;
                      }
                    }
                    else
                    {
                      if (v61) {
                        v140 = v135;
                      }
                      else {
                        v140 = 0;
                      }
                      __int16 v3 = &OBJC_IVAR___PLXPCAgent__telNotificationXPCListener;
                    }
                    if (v275)
                    {
LABEL_440:
                      if (*v296 && *(_DWORD *)(v292 + 4)) {
                        ++*(_DWORD *)(v292 + 28);
                      }
                      char v59 = 0;
                      ++debug_cnt_ut_err;
LABEL_444:
                      ++v60;
                      goto LABEL_445;
                    }
                    v267 = v135;
                    if (debug_polling)
                    {
                      v141 = *((void *)v3 + 385);
                      if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)uint64_t input = 136315650;
                        *(void *)&input[4] = "updateThread";
                        *(_WORD *)&input[12] = 1024;
                        *(_DWORD *)&input[14] = 3295;
                        *(_WORD *)&input[18] = 1024;
                        *(_DWORD *)&input[20] = v61;
                        _os_log_impl(&dword_1E4220000, v141, OS_LOG_TYPE_DEFAULT, "%s:%d  updatesDone=%d POLLING THE BATTERY", input, 0x18u);
                      }
                    }
                    v142 = (v109 + 1);
                    v143 = !v298;
                    if (!v61) {
                      v143 = 1;
                    }
                    v272 = v143;
                    if (v143 != 1) {
                      goto LABEL_317;
                    }
                    v144 = (v109 + 1);
                    if (v267) {
                      v145 = 18;
                    }
                    else {
                      v145 = 10;
                    }
                    BatteryData = readBatteryData((uint64_t)&updateThread_updates, v145, v303);
                    if (BatteryData == v145)
                    {
                      calculateBatteryHealthMetric();
                      v142 = v144;
                      goto LABEL_317;
                    }
                    v276 = BatteryData;
                    log = *((void *)v3 + 385);
                    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)uint64_t input = 67109376;
                      *(_DWORD *)&input[4] = v145;
                      *(_WORD *)&input[8] = 1024;
                      *(_DWORD *)&input[10] = v276;
                      _os_log_impl(&dword_1E4220000, log, OS_LOG_TYPE_DEFAULT, "cannot read battery data count=%d (err=%d)", input, 0xEu);
                    }
                    calculateBatteryHealthMetric();
                    v142 = v144;
                    LODWORD(ChargerData) = v276;
                    if (v276)
                    {
                      v148 = 0;
                    }
                    else
                    {
LABEL_317:
                      v149 = word_1EAE47982;
                      v150 = word_1EAE4798A;
                      if (word_1EAE4798A) {
                        v151 = 0;
                      }
                      else {
                        v151 = word_1EAE47982 == 3600;
                      }
                      v152 = (unsigned __int16)word_1EAE479B2;
                      if (v151 || (unsigned __int16)word_1EAE479B2 == 0xFFFF)
                      {
                        logb = v142;
                        v160 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)uint64_t input = 67110144;
                          *(_DWORD *)&input[4] = v152;
                          *(_WORD *)&input[8] = 1024;
                          *(_DWORD *)&input[10] = word_1EAE4798C;
                          *(_WORD *)&input[14] = 1024;
                          *(_DWORD *)&input[16] = word_1EAE47984;
                          *(_WORD *)&input[20] = 1024;
                          *(_DWORD *)&input[22] = v149;
                          *(_WORD *)&input[26] = 1024;
                          *(_DWORD *)&input[28] = v150;
                          _os_log_impl(&dword_1E4220000, v160, OS_LOG_TYPE_DEFAULT, "gas gauge reset detected (flags %#x capacity %d/%dmAh voltage %dmV current %dmA)", input, 0x20u);
                        }
                        v148 = 0;
                        LODWORD(ChargerData) = -1;
                        __int16 v3 = &OBJC_IVAR___PLXPCAgent__telNotificationXPCListener;
                        v142 = logb;
                      }
                      else
                      {
                        if (!v61 && v345)
                        {
                          loga = v142;
                          v345 = 0;
                          v153 = word_1EAE47984;
                          v154 = 100 * (word_1EAE47984 / 100) + 100;
                          v155 = logger;
                          v156 = os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT);
                          v157 = v154;
                          v158 = v154;
                          if (v156)
                          {
                            *(void *)uint64_t input = 67110144;
                            v159 = ((26215 * v154) >> 18) + ((26215 * v154) >> 31);
                            *(_WORD *)&input[8] = 1024;
                            *(_DWORD *)&input[10] = v153;
                            *(_WORD *)&input[14] = 1024;
                            *(_DWORD *)&input[16] = word_1EAE4798C;
                            *(_WORD *)&input[20] = 1024;
                            *(_DWORD *)&input[22] = v158;
                            *(_WORD *)&input[26] = 1024;
                            *(_DWORD *)&input[28] = ((26215 * v158) >> 18) + ((26215 * v158) >> 31);
                            _os_log_impl(&dword_1E4220000, v155, OS_LOG_TYPE_DEFAULT, "mask real UPOState=%x FCC=%d RemCap=%d new FCC=%d new RemCap=%d", input, 0x20u);
                          }
                          else
                          {
                            v159 = ((26215 * v154) >> 18) + ((26215 * v154) >> 31);
                          }
                          word_1EAE47984 = v157;
                          word_1EAE4798C = v159;
                          v142 = loga;
                        }
                        if ((v272 ^ 1))
                        {
                          LODWORD(ChargerData) = 0;
                          v162 = v305;
                        }
                        else
                        {
                          v162 = v305;
                          if (v305) {
                            v163 = 24;
                          }
                          else {
                            v163 = 22;
                          }
                          LODWORD(ChargerData) = hdqReadS16(v303, v163, &word_1EAE4798E);
                        }
                        v148 = ChargerData == 0;
                        v164 = ChargerData != 0;
                        if ((v297 & 2) == 0) {
                          v164 = 1;
                        }
                        if ((v164 || !v162) | (v272 ^ 1) & 1)
                        {
                          __int16 v3 = &OBJC_IVAR___PLXPCAgent__telNotificationXPCListener;
                        }
                        else
                        {
                          ChargerData = readChargerData(v291 & 1, v290 & 1, v303);
                          *(void *)&buf[8 * (void)v142] = ChargerData;
                          __int16 v3 = &OBJC_IVAR___PLXPCAgent__telNotificationXPCListener;
                          if (ChargerData)
                          {
                            if (v287) {
                              CFShow(ChargerData);
                            }
                            LODWORD(ChargerData) = 0;
                            v359[(void)v142] = @"ChargerData";
                            v142 = ((char *)&v279->isa + 2);
                          }
                        }
                      }
                    }
                    v277 = (int)ChargerData;
                    v280 = v148;
                    if (v148 && (unsigned __int16)word_1EAE4797E >= 0x501u)
                    {
                      v329 = (unsigned __int16)word_1EAE47986;
                      *(void *)&buf[8 * (void)v142] = CFNumberCreate(allocator, kCFNumberIntType, &v329);
                      v359[(void)v142] = @"NominalChargeCapacity";
                      v165 = ((char *)&v142->isa + 1);
                    }
                    else
                    {
                      v165 = v142;
                    }
                    if (debug_polling)
                    {
                      v166 = *((void *)v3 + 385);
                      if (os_log_type_enabled(v166, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)uint64_t input = 67109376;
                        *(_DWORD *)&input[4] = dword_1EAE47AF8;
                        *(_WORD *)&input[8] = 1024;
                        *(_DWORD *)&input[10] = dword_1EAE47B3C;
                        _os_log_impl(&dword_1E4220000, v166, OS_LOG_TYPE_DEFAULT, "determineVACVoltage, vacLevelCount=%d, vac95LevelCount=%d", input, 0xEu);
                      }
                    }
                    v167 = v305;
                    v266 = v140;
                    if (!byte_1EAE4799C || v61 != 0 && !v305)
                    {
                      if (v285 && (v61 == 0 || v305))
                      {
                        v173 = determineVACVoltage();
                        if (v173 != dword_1EAE479A0)
                        {
                          v174 = v173;
                          dword_1EAE479A0 = v173;
                          v175 = *((void *)v3 + 385);
                          if (os_log_type_enabled(v175, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)uint64_t input = 67109120;
                            *(_DWORD *)&input[4] = v174;
                            _os_log_impl(&dword_1E4220000, v175, OS_LOG_TYPE_DEFAULT, "Added atvAbsMaxVoltageMV=%u to battery dict", input, 8u);
                            v174 = dword_1EAE479A0;
                          }
                          v170 = allocator;
                          v328 = v174;
                          v169 = v165;
                          *(void *)&buf[8 * (void)v165] = CFNumberCreate(allocator, kCFNumberIntType, &v328);
                          v172 = @"atvAbsMaxVoltageMV";
                          v167 = v305;
                          v171 = v272;
LABEL_375:
                          v359[(void)v169] = v172;
                          v169 = ((char *)v169 + 1);
                          goto LABEL_376;
                        }
                        v167 = v305;
                      }
                      v170 = allocator;
                      v169 = v165;
                      goto LABEL_371;
                    }
                    v168 = dynamicATV(v303);
                    v169 = v165;
                    *(void *)&buf[8 * (void)v165] = v168;
                    v170 = allocator;
                    if (v168)
                    {
                      v171 = v272;
                      if (v287) {
                        CFShow(v168);
                      }
                      v172 = @"AppleDynamicATV";
                      goto LABEL_375;
                    }
LABEL_371:
                    v171 = v272;
LABEL_376:
                    v176 = v280;
                    if ((v297 & 2) != 0) {
                      v176 = 0;
                    }
                    if ((v171 & (v176 && v167)) == 1)
                    {
                      *(void *)uint64_t input = 0;
                      keys[0] = 0;
                      *(void *)uint64_t input = CFNumberCreate(v170, kCFNumberIntType, &dword_1EAE479A0);
                      keys[0] = @"ChargingVoltage";
                      *(void *)&buf[8 * (void)v169] = CFDictionaryCreate(v170, (const void **)keys, (const void **)input, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
                      v359[(void)v169] = @"ChargerData";
                      v169 = ((char *)v169 + 1);
                      CFRelease(*(CFTypeRef *)input);
                    }
                    if (dword_1EAE47B80)
                    {
                      v177 = determinePoSMThreshold();
                      if (v177 != dword_1EAE479A8) {
                        dword_1EAE479A8 = v177;
                      }
                      *(_DWORD *)uint64_t input = HIWORD(v177);
                      LODWORD(keys[0]) = (unsigned __int16)v177;
                      if ((unsigned __int16)v177 == 0xFFFF || HIWORD(v177) == 0xFFFF) {
                        v179 = 0;
                      }
                      else {
                        v179 = dword_1EAE47B80;
                      }
                      *(_DWORD *)v349 = v179;
                      *(void *)&buf[8 * (void)v169] = CFNumberCreate(v170, kCFNumberIntType, v349);
                      v359[(void)v169] = @"PoSMEnabled";
                      v180 = CFNumberCreate(allocator, kCFNumberIntType, input);
                      v181 = 8 * (void)v169 + 8;
                      *(void *)&buf[v181] = v180;
                      *(void **)((char *)v359 + v181) = @"PoSMUpperThreshold";
                      v169 = ((char *)v169 + 2);
                      *(void *)&buf[8 * (void)v169] = CFNumberCreate(allocator, kCFNumberIntType, keys);
                      v359[(void)v169] = @"PoSMLowerThreshold";
                    }
                    else
                    {
                      *(_DWORD *)uint64_t input = 0;
                      *(void *)&buf[8 * (void)v169] = CFNumberCreate(v170, kCFNumberIntType, input);
                      v359[(void)v169] = @"PoSMEnabled";
                    }
                    if ((v280 & v297) != 0) {
                      U16 = 0;
                    }
                    else {
                      U16 = v277;
                    }
                    if ((v171 & v280 & v297) == 1) {
                      U16 = hdqReadU16(v303, 110, &word_1EAE47990);
                    }
                    __int16 v3 = &OBJC_IVAR___PLXPCAgent__telNotificationXPCListener;
                    uint64_t v2 = &handlePeer_forEvent__classDebugEnabled_685;
                    v184 = v274;
                    v185 = v169;
                    v186 = (unint64_t)&v169->isa + 1;
                    if (!U16)
                    {
                      v187 = v185;
                      logc = v185;
                      v327 = 10 * word_1EAE47988 - 27320;
                      *(void *)&buf[8 * v186] = CFNumberCreate(allocator, kCFNumberIntType, &v327);
                      v359[v186] = @"Temperature";
                      v326 = word_1EAE4798A;
                      v188 = CFNumberCreate(allocator, kCFNumberIntType, &v326);
                      v189 = 8 * (void)v187;
                      v190 = 8 * (void)v187 + 16;
                      *(void *)&buf[v190] = v188;
                      *(void **)((char *)v359 + v190) = @"Amperage";
                      v325 = word_1EAE47982;
                      v191 = CFNumberCreate(allocator, kCFNumberIntType, &v325);
                      v192 = 8 * (void)v187 + 24;
                      *(void *)&buf[v192] = v191;
                      *(void **)((char *)v359 + v192) = @"Voltage";
                      v324 = word_1EAE4798E;
                      v193 = CFNumberCreate(allocator, kCFNumberIntType, &v324);
                      v194 = 8 * (void)v187 + 32;
                      *(void *)&buf[v194] = v193;
                      *(void **)((char *)v359 + v194) = @"TimeRemaining";
                      int v64 = word_1EAE4798C;
                      v323 = word_1EAE4798C;
                      v195 = CFNumberCreate(allocator, kCFNumberIntType, &v323);
                      v196 = v189 + 40;
                      *(void *)&buf[v196] = v195;
                      *(void **)((char *)v359 + v196) = @"CurrentCapacity";
                      v322 = word_1EAE47984;
                      v197 = CFNumberCreate(allocator, kCFNumberIntType, &v322);
                      v198 = v189 + 48;
                      *(void *)&buf[v198] = v197;
                      *(void **)((char *)v359 + v198) = @"MaxCapacity";
                      HIWORD(v199) = -18304;
                      LOWORD(v199) = word_1EAE479AE;
                      *(_DWORD *)uint64_t input = llroundf((float)((float)((float)word_1EAE47992 * -0.000061035) + 1.0) * (float)v199);
                      v200 = CFNumberCreate(allocator, kCFNumberIntType, input);
                      v201 = v189 + 56;
                      *(void *)&buf[v201] = v200;
                      *(void **)((char *)v359 + v201) = @"AbsoluteCapacity";
                      v202 = v308;
                      if (!v274) {
                        v202 = v294;
                      }
                      v203 = v189 + 64;
                      *(void *)&buf[v203] = v202;
                      *(void **)((char *)v359 + v203) = @"AtCriticalLevel";
                      v321 = (unsigned __int16)word_1EAE479B2;
                      v204 = CFNumberCreate(allocator, kCFNumberIntType, &v321);
                      v205 = v189 + 72;
                      *(void *)&buf[v205] = v204;
                      *(void **)((char *)v359 + v205) = @"AppleRawBatteryFlags";
                      v206 = (char *)&logc[1].isa + 2;
                      if (v297)
                      {
                        v320 = (unsigned __int16)word_1EAE47990;
                        *(void *)&buf[8 * (void)v206] = CFNumberCreate(allocator, kCFNumberIntType, &v320);
                        v359[(void)v206] = @"ITMiscStatus";
                        v319 = word_1EAE47990 & 3;
                        v207 = CFNumberCreate(allocator, kCFNumberIntType, &v319);
                        v208 = v189 + 88;
                        *(void *)&buf[v208] = v207;
                        *(void **)((char *)v359 + v208) = @"ITSimulationCounter";
                        v318 = ((unsigned __int16)word_1EAE47990 >> 2) & 3;
                        v209 = CFNumberCreate(allocator, kCFNumberIntType, &v318);
                        v210 = v189 + 96;
                        *(void *)&buf[v210] = v209;
                        *(void **)((char *)v359 + v210) = @"RaUpdateCounter";
                        v206 = (char *)&logc[1].isa + 5;
                      }
                      v317 = word_1EAE479B2 & 0x80;
                      *(void *)&buf[8 * (void)v206] = CFNumberCreate(allocator, kCFNumberIntType, &v317);
                      v359[(void)v206] = @"OCVTakenFlag";
                      v316 = word_1EAE479B2 & 0x200;
                      v211 = CFNumberCreate(allocator, kCFNumberIntType, &v316);
                      v212 = 8 * (void)v206 + 8;
                      *(void *)&buf[v212] = v211;
                      *(void **)((char *)v359 + v212) = @"FCFlag";
                      v186 = (unint64_t)(v206 + 2);
                      if (!v267) {
                        goto LABEL_406;
                      }
                      v315 = (unsigned __int16)word_1EAE479AC;
                      *(void *)&buf[8 * v186] = CFNumberCreate(allocator, kCFNumberIntType, &v315);
                      v359[v186] = @"CycleCount";
                      v314 = word_1EAE4797A;
                      v213 = CFNumberCreate(allocator, kCFNumberIntType, &v314);
                      v214 = 8 * (void)v206 + 24;
                      *(void *)&buf[v214] = v213;
                      *(void **)((char *)v359 + v214) = @"DesignCapacity";
                      v186 = (unint64_t)(v206 + 4);
                      v215 = parseBatteryData(v297 & 1, v283);
                      *(void *)&buf[8 * (void)(v206 + 4)] = v215;
                      if (v215)
                      {
                        U16 = 0;
                        if (v287) {
                          CFShow(v215);
                        }
                        v359[v186] = @"BatteryData";
                        v186 = (unint64_t)(v206 + 5);
                        v184 = v274;
                      }
                      else
                      {
LABEL_406:
                        v184 = v274;
                        U16 = 0;
                      }
                      uint64_t v2 = &handlePeer_forEvent__classDebugEnabled_685;
                    }
                    if (v289 && (updateThread_oneTime & 1) == 0)
                    {
                      v355 = 0u;
                      memset(input, 0, sizeof(input));
                      *(_OWORD *)keys = 0u;
                      v354 = 0u;
                      if (ggctl_logShutdownReason(v303, (uint64_t)input, 1u) || !*(void *)&input[40])
                      {
                        v218 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)v349 = 136315394;
                          v350 = "updateThread";
                          v351 = 1024;
                          v352 = 3577;
                          _os_log_impl(&dword_1E4220000, v218, OS_LOG_TYPE_DEFAULT, "%s:%d  Error Reading Shutdown reason", v349, 0x12u);
                        }
                        uint64_t v2 = &handlePeer_forEvent__classDebugEnabled_685;
                      }
                      else
                      {
                        ggctl_logShutdownReason2(v303, keys, 1u);
                        v216 = parseShutdownReason((__int16 *)input, (const UInt8 *)keys, v303);
                        if (v216)
                        {
                          v217 = v216;
                          if (v287) {
                            CFShow(v216);
                          }
                          *(void *)&buf[8 * v186] = v217;
                          v359[v186++] = @"BatteryShutdownReason";
                        }
                        memset(input, 0, sizeof(input));
                        ggctl_logShutdownReason(v303, (uint64_t)input, 0);
                        *(_OWORD *)keys = 0u;
                        v354 = 0u;
                        v355 = 0u;
                        ggctl_logShutdownReason2(v303, keys, 0);
                        uint64_t v2 = &handlePeer_forEvent__classDebugEnabled_685;
                      }
                      updateThread_oneTime = 1;
                      v184 = v274;
                    }
                    if (v184) {
                      readIMAXAndSOCSmoothData(byte_1EAE47A16, v182, v303);
                    }
                    if (!U16)
                    {
                      v219 = CFDictionaryCreate(allocator, (const void **)v359, (const void **)buf, v186, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
                      if (v219)
                      {
                        v220 = v219;
                        if (v287) {
                          CFShow(v219);
                        }
                        if (debug_polling)
                        {
                          v221 = logger;
                          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)uint64_t input = 136315650;
                            *(void *)&input[4] = "updateThread";
                            *(_WORD *)&input[12] = 1024;
                            *(_DWORD *)&input[14] = 3600;
                            *(_WORD *)&input[18] = 1024;
                            *(_DWORD *)&input[20] = v61;
                            _os_log_impl(&dword_1E4220000, v221, OS_LOG_TYPE_DEFAULT, "%s:%d  updatesDone=%d PUBLISHING BATTERY data", input, 0x18u);
                          }
                        }
                        v222 = v220;
                        U16 = IORegistryEntrySetCFProperties(v6, v220);
                        if (U16)
                        {
                          v281 = logger;
                          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)uint64_t input = 67109120;
                            *(_DWORD *)&input[4] = U16;
                            _os_log_error_impl(&dword_1E4220000, v281, OS_LOG_TYPE_ERROR, "IORegistryEntrySetCFProperties(0x%x)", input, 8u);
                          }
                        }
                        CFRelease(v222);
                        ++debug_cnt_ut_sent;
                      }
                      else
                      {
                        v223 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)uint64_t input = 136315650;
                          *(void *)&input[4] = "updateThread";
                          *(_WORD *)&input[12] = 1024;
                          *(_DWORD *)&input[14] = 3608;
                          *(_WORD *)&input[18] = 1024;
                          *(_DWORD *)&input[20] = v61;
                          _os_log_error_impl(&dword_1E4220000, v223, OS_LOG_TYPE_ERROR, "%s:%d  updatesDone=%d dictionary failed", input, 0x18u);
                        }
                        U16 = 0;
                      }
                      uint64_t v2 = &handlePeer_forEvent__classDebugEnabled_685;
                    }
                    do
                      CFRelease(*(CFTypeRef *)&buf[8 * v186 - 8]);
                    while (v186-- > 1);
                    if (U16) {
                      goto LABEL_440;
                    }
                    if (v298)
                    {
                      if (v286)
                      {
                        S16 = controlReadS16(v303, 25, 0);
                        if (S16)
                        {
                          v226 = S16;
                          v227 = logger;
                          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)uint64_t input = 67109120;
                            *(_DWORD *)&input[4] = v226;
                            _os_log_error_impl(&dword_1E4220000, v227, OS_LOG_TYPE_ERROR, "CCA: usermode cannot disable DLOG (%#x)", input, 8u);
                          }
                          LOBYTE(v286) = 1;
                        }
                        else
                        {
                          LOBYTE(v286) = 0;
                          *(_DWORD *)(v292 + 24) = 0;
                          *(_DWORD *)(v292 + 16) = 0;
                          *(void *)(v292 + 8) = 0;
                        }
                        goto LABEL_517;
                      }
                      LOBYTE(v286) = 0;
LABEL_518:
                      if (*((_DWORD *)v2 + 748))
                      {
                        *((_DWORD *)v2 + 748) = 0;
                        v258 = logger;
                        v259 = os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT);
                        if (v62 == 0.0)
                        {
                          if (v259)
                          {
                            *(_WORD *)uint64_t input = 0;
                            v260 = v258;
                            v261 = "gasgauge success after previous failure";
                            v262 = 2;
                            goto LABEL_524;
                          }
                        }
                        else if (v259)
                        {
                          v263 = CFAbsoluteTimeGetCurrent();
                          *(_DWORD *)uint64_t input = 134217984;
                          *(double *)&input[4] = v263 - v62;
                          v260 = v258;
                          v261 = "gasgauge success after previous %gs failure";
                          v262 = 12;
LABEL_524:
                          _os_log_impl(&dword_1E4220000, v260, OS_LOG_TYPE_DEFAULT, v261, input, v262);
                        }
                      }
                      double v62 = CFAbsoluteTimeGetCurrent();
                      char v59 = 0;
                      int v60 = 0;
                      word_1EAE47A36 = word_1EAE47982;
                      word_1EAE47A38 = word_1EAE4798A;
                      dword_1EAE47A3A = *(_DWORD *)&word_1EAE47984;
                      word_1EAE47A3E = word_1EAE4798C;
                      ++v61;
                      goto LABEL_445;
                    }
                    if ((unsigned __int16)word_1EAE4797E < 0x132u) {
                      goto LABEL_518;
                    }
                    if (v284)
                    {
                      v228 = time(0);
                      if (v228 < v282)
                      {
                        v229 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)uint64_t input = 134217984;
                          *(void *)&input[4] = v282;
                          v230 = v229;
                          v231 = "CCA: wait for deadline now=%lu";
                          goto LABEL_476;
                        }
                        goto LABEL_477;
                      }
                      v233 = v228;
                      if ((unsigned __int16)word_1EAE4797E < 0x600u)
                      {
                        LOWORD(keys[0]) = 0;
                        v239 = controlReadU16(v303, 0, keys);
                        if (v239)
                        {
                          v240 = v239;
                          v241 = logger;
                          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)uint64_t input = 67109120;
                            *(_DWORD *)&input[4] = v240;
                            _os_log_error_impl(&dword_1E4220000, v241, OS_LOG_TYPE_ERROR, "CCA: cannot read DLOG status (%#x)", input, 8u);
                          }
                          goto LABEL_477;
                        }
                        v242 = (__int16)keys[0];
                        v235 = logger;
                        v243 = os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT);
                        if ((v242 & 0x800) != 0)
                        {
                          if (!v243) {
                            goto LABEL_477;
                          }
                          goto LABEL_475;
                        }
                        if (v243)
                        {
                          *(_DWORD *)uint64_t input = 67109376;
                          *(_DWORD *)&input[4] = v61;
                          *(_WORD *)&input[8] = 2048;
                          *(void *)&input[10] = v233;
                          v237 = v235;
                          v238 = "CCA: re-enable DLOG updatesDone=%d, now=%lu";
LABEL_472:
                          _os_log_impl(&dword_1E4220000, v237, OS_LOG_TYPE_DEFAULT, v238, input, 0x12u);
                        }
LABEL_473:
                        v232 = 0;
                        v282 = 0;
                      }
                      else
                      {
                        v234 = word_1EAE479B2;
                        v235 = logger;
                        v236 = os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT);
                        if ((v234 & 0x20) == 0)
                        {
                          if (v236)
                          {
                            *(_DWORD *)uint64_t input = 67109376;
                            *(_DWORD *)&input[4] = v61;
                            *(_WORD *)&input[8] = 2048;
                            *(void *)&input[10] = v233;
                            v237 = v235;
                            v238 = "CCA: re-enable DLOG updatesDone=%u, now=%lu";
                            goto LABEL_472;
                          }
                          goto LABEL_473;
                        }
                        if (!v236) {
                          goto LABEL_477;
                        }
LABEL_475:
                        *(_DWORD *)uint64_t input = 134217984;
                        *(void *)&input[4] = v233;
                        v230 = v235;
                        v231 = "CCA: GasGauge still calibrating now=%lu";
LABEL_476:
                        _os_log_impl(&dword_1E4220000, v230, OS_LOG_TYPE_DEFAULT, v231, input, 0xCu);
LABEL_477:
                        v232 = 1;
                      }
                    }
                    else
                    {
                      v232 = 0;
                    }
                    if (v286)
                    {
                      if (*(_DWORD *)(v292 + 4)) {
                        goto LABEL_485;
                      }
                      v244 = logger;
                      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                      {
                        v245 = *(_DWORD *)(v292 + 4);
                        *(_DWORD *)uint64_t input = 67109120;
                        *(_DWORD *)&input[4] = v245;
                        _os_log_impl(&dword_1E4220000, v244, OS_LOG_TYPE_DEFAULT, "disabling DLOG (num_clients=%i)", input, 8u);
                      }
                      v246 = controlReadS16(v303, 25, 0);
                      if (v246)
                      {
                        v247 = v246;
                        v248 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)uint64_t input = 67109120;
                          *(_DWORD *)&input[4] = v247;
                          _os_log_error_impl(&dword_1E4220000, v248, OS_LOG_TYPE_ERROR, "cannot disable DLOG (%#x)", input, 8u);
                        }
LABEL_485:
                        v286 = 1;
                      }
                      else
                      {
                        v286 = 0;
                        *(_DWORD *)(v292 + 24) = 0;
                        *(_DWORD *)(v292 + 16) = 0;
                        *(void *)(v292 + 8) = 0;
                      }
                    }
                    else
                    {
                      v286 = 0;
                    }
                    if (*(_DWORD *)(v292 + 4)) {
                      v249 = v232;
                    }
                    else {
                      v249 = 1;
                    }
                    if ((v249 & 1) == 0)
                    {
                      if (!v61 || v286 != 1)
                      {
                        v250 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                        {
                          v251 = *(_DWORD *)(v292 + 4);
                          *(_DWORD *)uint64_t input = 67109376;
                          *(_DWORD *)&input[4] = v61;
                          *(_WORD *)&input[8] = 1024;
                          *(_DWORD *)&input[10] = v251;
                          _os_log_impl(&dword_1E4220000, v250, OS_LOG_TYPE_DEFAULT, "gathering data log updatesDone=%d num_clients=%d", input, 0xEu);
                        }
                      }
                      if ((*(_DWORD *)(v292 + 4) & 0x80000000) != 0
                        && os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                      {
                        updateThread_cold_4(&v312, v313);
                      }
                      if (drainDataLog(v303))
                      {
                        v252 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
                          updateThread_cold_3(v347, v348, v252);
                        }
                      }
                      v286 = 1;
                    }
                    if (v232)
                    {
                      v253 = 1;
                    }
                    else if ((unsigned __int16)word_1EAE4797E < 0x600u)
                    {
                      v253 = v266;
                      if ((unsigned __int16)word_1EAE4797E <= 0x501u) {
                        v253 = 0;
                      }
                    }
                    else
                    {
                      v253 = ((unsigned __int16)word_1EAE479B2 >> 5) & 1;
                    }
                    v284 = v253;
                    if ((v286 & v253) == 1)
                    {
                      v254 = controlReadS16(v303, 25, 0);
                      if (v254)
                      {
                        v255 = v254;
                        v256 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)uint64_t input = 67109120;
                          *(_DWORD *)&input[4] = v255;
                          _os_log_error_impl(&dword_1E4220000, v256, OS_LOG_TYPE_ERROR, "CCA: cannot disable DLOG (%#x)", input, 8u);
                        }
                        v284 = 0;
                        LOBYTE(v286) = 1;
                      }
                      else
                      {
                        *(_DWORD *)(v292 + 16) = 0;
                        *(void *)(v292 + 8) = 0;
                        v282 = time(0) + 20;
                        v257 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)uint64_t input = 67109376;
                          *(_DWORD *)&input[4] = v61;
                          *(_WORD *)&input[8] = 2048;
                          *(void *)&input[10] = v282;
                          _os_log_impl(&dword_1E4220000, v257, OS_LOG_TYPE_DEFAULT, "CCA: disabled DLOG updatesDone=%d ccaDeadline=%lu", input, 0x12u);
                        }
                        LOBYTE(v286) = 0;
                        v284 = 1;
                      }
                    }
                    __int16 v3 = &OBJC_IVAR___PLXPCAgent__telNotificationXPCListener;
LABEL_517:
                    uint64_t v2 = &handlePeer_forEvent__classDebugEnabled_685;
                    goto LABEL_518;
                  }
LABEL_203:
                  if (debug_polling)
                  {
                    v106 = *((void *)v3 + 385);
                    if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)uint64_t input = 136315650;
                      *(void *)&input[4] = "updateThread";
                      *(_WORD *)&input[12] = 1024;
                      *(_DWORD *)&input[14] = 3146;
                      *(_WORD *)&input[18] = 1024;
                      *(_DWORD *)&input[20] = v61;
                      _os_log_impl(&dword_1E4220000, v106, OS_LOG_TYPE_DEFAULT, "%s:%d  updatesDone=%d READING FLAGS", input, 0x18u);
                    }
                  }
                  v107 = hdqReadU16(v303, 10, &word_1EAE479B2);
                  v108 = 0;
                  v275 = v107;
                  if (v107 || (unsigned __int16)word_1EAE479B2 == 0xFFFF)
                  {
                    v109 = v278;
                  }
                  else
                  {
                    v109 = v278;
                    if (((v295 ^ 1) & 1) == 0)
                    {
                      if (word_1EAE47ADC)
                      {
                        v273 = 0;
                        if ((v297 & 0x20) != 0)
                        {
                          v110 = v288
                              && (unsigned __int16)(word_1EAE47ADC & word_1EAE479B2) == (unsigned __int16)word_1EAE47ADC;
                          v288 = (unsigned __int16)(word_1EAE47ADC & word_1EAE479B2) == (unsigned __int16)word_1EAE47ADC;
                        }
                        else
                        {
                          v110 = (unsigned __int16)(word_1EAE47ADC & word_1EAE479B2) == (unsigned __int16)word_1EAE47ADC;
                        }
                      }
                      else if (v61 && dword_1EAE47AE0 >= word_1EAE47982)
                      {
                        v273 = 0;
                        v110 = 1;
                      }
                      else
                      {
                        v110 = ((unsigned __int16)word_1EAE479B2 >> 2) & 1;
                        v273 = 1;
                      }
                      if (debug_polling)
                      {
                        v119 = *((void *)v3 + 385);
                        if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
                        {
                          v120 = UpSeconds();
                          *(_DWORD *)uint64_t input = 136317186;
                          *(void *)&input[4] = "updateThread";
                          *(_WORD *)&input[12] = 1024;
                          *(_DWORD *)&input[14] = 3178;
                          *(_WORD *)&input[18] = 1024;
                          *(_DWORD *)&input[20] = v61;
                          *(_WORD *)&input[24] = 1024;
                          *(_DWORD *)&input[26] = v110;
                          *(_WORD *)&input[30] = 1024;
                          *(_DWORD *)&input[32] = v305;
                          __int16 v3 = &OBJC_IVAR___PLXPCAgent__telNotificationXPCListener;
                          *(_WORD *)&input[36] = 2048;
                          *(void *)&input[38] = v120;
                          *(_WORD *)&input[46] = 1024;
                          *(_DWORD *)&input[48] = v344;
                          LOWORD(v357) = 1024;
                          *(_DWORD *)((char *)&v357 + 2) = dword_1EAE47AE0;
                          HIWORD(v357) = 1024;
                          v358 = word_1EAE47982;
                          _os_log_impl(&dword_1E4220000, v119, OS_LOG_TYPE_DEFAULT, "%s:%d  updatesDone=%d criticalValue=%d external_connected=%d UpSeconds=%llu cfd=%d cfd-voltage=%d batteryInfo.voltage=%d", input, 0x40u);
                        }
                      }
                      if (!v344) {
                        goto LABEL_263;
                      }
                      v121 = UpSeconds();
                      if (v121 <= v344)
                      {
                        if (!v61) {
                          goto LABEL_533;
                        }
                        v124 = word_1EAE47982;
                        if (dword_1EAE47AE0 >= word_1EAE47982)
                        {
                          v127 = v121;
                          v128 = logger;
                          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)uint64_t input = 136316162;
                            *(void *)&input[4] = "updateThread";
                            *(_WORD *)&input[12] = 1024;
                            *(_DWORD *)&input[14] = 3201;
                            *(_WORD *)&input[18] = 1024;
                            *(_DWORD *)&input[20] = v61;
                            *(_WORD *)&input[24] = 2048;
                            *(void *)&input[26] = v127;
                            *(_WORD *)&input[34] = 1024;
                            *(_DWORD *)&input[36] = v124;
                            _os_log_impl(&dword_1E4220000, v128, OS_LOG_TYPE_DEFAULT, "%s:%d updatesDone=%d UpSeconds=%llu voltage=%d (low)", input, 0x28u);
                          }
                          v273 = 0;
                          v110 = 1;
                          __int16 v3 = &OBJC_IVAR___PLXPCAgent__telNotificationXPCListener;
                          goto LABEL_263;
                        }
                        __int16 v3 = &OBJC_IVAR___PLXPCAgent__telNotificationXPCListener;
                        if (v305)
                        {
LABEL_533:
                          if (debug_polling)
                          {
                            if (v110)
                            {
                              v125 = *((void *)v3 + 385);
                              if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
                              {
                                v126 = UpSeconds();
                                *(_DWORD *)uint64_t input = 136315906;
                                *(void *)&input[4] = "updateThread";
                                *(_WORD *)&input[12] = 1024;
                                *(_DWORD *)&input[14] = 3209;
                                *(_WORD *)&input[18] = 2048;
                                *(void *)&input[20] = v126;
                                *(_WORD *)&input[28] = 1024;
                                *(_DWORD *)&input[30] = v344;
                                _os_log_impl(&dword_1E4220000, v125, OS_LOG_TYPE_DEFAULT, "%s:%d UpSeconds=%llu (cfd = %u) forcing critical to 0", input, 0x22u);
                              }
                            }
                          }
                          if (!v273) {
                            v110 = 0;
                          }
                          v273 = v273 << 31 >> 31;
                        }
                      }
                      else if (debug_polling)
                      {
                        v122 = *((void *)v3 + 385);
                        if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
                        {
                          v123 = UpSeconds();
                          *(_DWORD *)uint64_t input = 136315906;
                          *(void *)&input[4] = "updateThread";
                          *(_WORD *)&input[12] = 1024;
                          *(_DWORD *)&input[14] = 3191;
                          *(_WORD *)&input[18] = 2048;
                          *(void *)&input[20] = v123;
                          *(_WORD *)&input[28] = 1024;
                          *(_DWORD *)&input[30] = v344;
                          _os_log_impl(&dword_1E4220000, v122, OS_LOG_TYPE_DEFAULT, "%s:%d deadline expired at UpSeconds=%llu (cfd = %u)", input, 0x22u);
                        }
                      }
LABEL_263:
                      if (!word_1EAE47ADC)
                      {
                        v331 = v273;
                        *(void *)((unint64_t)buf | (8 * v278)) = CFNumberCreate(allocator, kCFNumberIntType, &v331);
                        *(void *)((unint64_t)v359 & 0xFFFFFFFFFFFFFFF7 | (8 * (v278 & 1))) = @"SOCBasedShutdown";
                        v109 = v278 + 1;
                      }
                      if (debug_polling)
                      {
                        if (v110)
                        {
                          v129 = *((void *)v3 + 385);
                          if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
                          {
                            v130 = UpSeconds();
                            *(_DWORD *)uint64_t input = 136316674;
                            *(void *)&input[4] = "updateThread";
                            *(_WORD *)&input[12] = 1024;
                            *(_DWORD *)&input[14] = 3227;
                            *(_WORD *)&input[18] = 1024;
                            *(_DWORD *)&input[20] = v61;
                            *(_WORD *)&input[24] = 1024;
                            *(_DWORD *)&input[26] = 1;
                            *(_WORD *)&input[30] = 1024;
                            *(_DWORD *)&input[32] = v305;
                            __int16 v3 = &OBJC_IVAR___PLXPCAgent__telNotificationXPCListener;
                            *(_WORD *)&input[36] = 2048;
                            *(void *)&input[38] = v130;
                            *(_WORD *)&input[46] = 1024;
                            *(_DWORD *)&input[48] = word_1EAE47982;
                            _os_log_impl(&dword_1E4220000, v129, OS_LOG_TYPE_DEFAULT, "%s:%d  updatesDone=%d criticalValue=%d external_connected=%d UpSeconds=%llu batteryInfo.voltage=%d", input, 0x34u);
                          }
                        }
                      }
                      v108 = v110 != 0;
                      uint64_t v2 = &handlePeer_forEvent__classDebugEnabled_685;
                    }
                  }
                  if ((v75 & 1) == 0 || (v293 > 2 ? (v131 = 1) : (v131 = v108), (v131 & 1) != 0 || v60))
                  {
                    v274 = v108;
                    v293 = 0;
                    goto LABEL_280;
                  }
                  ++v293;
                  v132 = *((void *)v3 + 385);
                  if (os_log_type_enabled(v132, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)uint64_t input = 0;
                    _os_log_impl(&dword_1E4220000, v132, OS_LOG_TYPE_INFO, "flags update only", input, 2u);
                  }
                  char v59 = 0;
                  int v60 = 0;
LABEL_445:
                  mach_port_t v65 = v303;
                }
              }
              else
              {
                v95 = CFPreferencesCopyValue(@"ResetEnabled", @"com.apple.gasgauge", v301, v300);
                v96 = os_log_type_enabled(*((os_log_t *)v3 + 385), OS_LOG_TYPE_ERROR);
                if (v95 == v294)
                {
                  v97 = v303;
                  if (v96) {
                    updateThread_cold_5(&v336, v337);
                  }
                }
                else
                {
                  if (v96) {
                    updateThread_cold_6(&v334, v335);
                  }
                  v97 = v303;
                  ggctl_reset(v303, 1u);
                }
                char v59 = 0;
                ++v60;
                mach_port_t v65 = v97;
              }
            }
          }
        }
        else
        {
          char v59 = 0;
LABEL_166:
          mach_port_t v65 = -1;
        }
      }
    }
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
      updateThread_cold_1();
    }
  }
  return 0;
}

uint64_t batteryThread(unsigned int a1)
{
  return 0;
}

uint64_t iokit_callback(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  *(_DWORD *)double result = a3;
  *(void *)(result + 8) = a4;
  return result;
}

void getUPOData(CFStringRef key, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  io_registry_entry_t v4 = find_pmu_pmu_service;
  unsigned int v5 = (CFAllocatorRef *)MEMORY[0x1E4F1CF80];
  if (find_pmu_pmu_service) {
    goto LABEL_7;
  }
  CFMutableDictionaryRef v6 = IOServiceMatching("IOService");
  if (v6)
  {
    mach_port_t v7 = v6;
    int v15 = 0;
    CFAllocatorRef v8 = *v5;
    find_pmu_zero_number = (uint64_t)CFNumberCreate(*v5, kCFNumberSInt32Type, &v15);
    CFDictionaryRef v9 = CFDictionaryCreate(v8, (const void **)find_pmu_tmp, (const void **)&find_pmu_zero_number, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    if (v9)
    {
      CFDictionaryRef v10 = v9;
      CFDictionarySetValue(v7, @"IOPropertyMatch", v9);
      CFRelease(v10);
      find_pmu_pmu_service = IOServiceGetMatchingService(*MEMORY[0x1E4F2EEF0], v7);
    }
    else
    {
      CFRelease(v7);
    }
  }
  io_registry_entry_t v4 = find_pmu_pmu_service;
  if (find_pmu_pmu_service)
  {
LABEL_7:
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v4, key, *v5, 0);
    if (CFProperty)
    {
      uint64_t v12 = CFProperty;
      CFTypeID TypeID = CFNumberGetTypeID();
      if (TypeID != CFGetTypeID(v12) || !CFNumberGetValue((CFNumberRef)v12, kCFNumberSInt32Type, a2))
      {
        uint64_t v14 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 136315394;
          mach_error_t v16 = "/Library/Caches/com.apple.xbs/Sources/AppleHDQGasGauge/AppleHDQGasGauge.c";
          __int16 v17 = 1024;
          int v18 = 2348;
          _os_log_impl(&dword_1E4220000, v14, OS_LOG_TYPE_DEFAULT, "%s:%d cannot read upo data", (uint8_t *)&v15, 0x12u);
        }
      }
      CFRelease(v12);
    }
  }
}

void setUPOData(const __CFString *a1, int a2)
{
  int v14 = a2;
  CFMutableDictionaryRef v3 = IOServiceMatching("IOService");
  if (v3)
  {
    io_registry_entry_t v4 = v3;
    int valuePtr = 0;
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFNumberRef v12 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt32Type, &valuePtr);
    CFDictionaryRef v6 = CFDictionaryCreate(v5, (const void **)&setUPOData_tmp, (const void **)&v12, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    if (v6)
    {
      CFDictionaryRef v7 = v6;
      CFDictionarySetValue(v4, @"IOPropertyMatch", v6);
      CFRelease(v7);
      io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x1E4F2EEF0], v4);
      if (!MatchingService) {
        return;
      }
      io_registry_entry_t v9 = MatchingService;
      CFNumberRef v10 = CFNumberCreate(v5, kCFNumberSInt32Type, &v14);
      IORegistryEntrySetCFProperty(v9, a1, v10);
      IOObjectRelease(v9);
      CFNumberRef v11 = v10;
    }
    else
    {
      CFNumberRef v11 = v4;
    }
    CFRelease(v11);
  }
}

void updateThermalCoolDownState(io_registry_entry_t a1, int a2)
{
  keys[1] = *(void **)MEMORY[0x1E4F143B8];
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  keys[0] = (void *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], "ThermalCoolDown", 0x8000100u);
  CFAllocatorRef v5 = (void **)MEMORY[0x1E4F1CFD0];
  if (!a2) {
    CFAllocatorRef v5 = (void **)MEMORY[0x1E4F1CFC8];
  }
  values = *v5;
  CFDictionaryRef v6 = CFDictionaryCreate(v4, (const void **)keys, (const void **)&values, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (v6)
  {
    CFDictionaryRef v7 = v6;
    IORegistryEntrySetCFProperties(a1, v6);
    CFRelease(v7);
  }
  else if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
  {
    updateThermalCoolDownState_cold_1();
  }
}

void statsAndLogs(io_registry_entry_t a1, int a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  CFStringRef v12 = 0;
  CFTypeRef cf = 0;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  keys = (void *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], "stats", 0x8000100u);
  CFAllocatorRef v5 = (const void *)*MEMORY[0x1E4F1CFC8];
  values = (void *)*MEMORY[0x1E4F1CFC8];
  if (a2)
  {
    CFStringRef v12 = CFStringCreateWithCString(v4, "log", 0x8000100u);
    CFTypeRef cf = v5;
    CFIndex v6 = 2;
  }
  else
  {
    CFIndex v6 = 1;
  }
  CFDictionaryRef v7 = CFDictionaryCreate(v4, (const void **)&keys, (const void **)&values, v6, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (v7)
  {
    CFDictionaryRef v8 = v7;
    if (IORegistryEntrySetCFProperties(a1, v7) && os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
      statsAndLogs_cold_2();
    }
    CFRelease(v8);
    CFRelease(values);
    if (a2) {
      CFRelease(cf);
    }
  }
  else if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
  {
    statsAndLogs_cold_1();
  }
}

void debugLog(io_registry_entry_t a1, int a2)
{
  keys[1] = *(void **)MEMORY[0x1E4F143B8];
  int valuePtr = a2;
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  keys[0] = (void *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], "debug", 0x8000100u);
  values = CFNumberCreate(v3, kCFNumberSInt32Type, &valuePtr);
  CFDictionaryRef v4 = CFDictionaryCreate(v3, (const void **)keys, (const void **)&values, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (v4)
  {
    CFDictionaryRef v5 = v4;
    if (IORegistryEntrySetCFProperties(a1, v4))
    {
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
        debugLog_cold_2();
      }
    }
    CFRelease(v5);
    CFRelease(values);
  }
  else if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
  {
    debugLog_cold_1();
  }
}

uint64_t readChargeTable(mach_port_t a1, __CFData **a2)
{
  *(void *)&v48[26] = *MEMORY[0x1E4F143B8];
  *a2 = 0;
  if (!dword_1EAE47A54) {
    return 0;
  }
  uint64_t v3 = 0xFFFFFFFFLL;
  if (!ggctl_readBlock(a1, -1, dword_1EAE47A54, &outputStruct, 0))
  {
    int v4 = v47;
    if (v47 == 255)
    {
      unsigned int v9 = outputStruct;
      unint64_t v10 = (unint64_t)outputStruct >> 4;
      uint64_t v11 = 6 * v10 + 4;
      if (outputStruct <= 0x4FuLL)
      {
        unsigned __int8 v13 = 0;
        unsigned int v37 = v46;
        p_unsigned __int8 outputStruct = (char *)&outputStruct;
        do
        {
          char v15 = *p_outputStruct++;
          v13 += v15;
          --v11;
        }
        while (v11);
        int v16 = v13;
        if (v13)
        {
          uint64_t v17 = logger;
          uint64_t v3 = 0;
          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109632;
            int v39 = v16;
            __int16 v40 = 1024;
            int v41 = v45;
            __int16 v42 = 1024;
            int v43 = 256 - (v16 - v45);
            CFIndex v6 = "gas gauge charge table bad checksum: checksum %#x checksum byte %#x expecting %#x";
            CFDictionaryRef v7 = v17;
            uint32_t v8 = 20;
            goto LABEL_14;
          }
        }
        else
        {
          unint64_t v19 = (unint64_t)v46 >> 4;
          uint64_t v20 = 4 * v19 + 8;
          Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v20 * (unint64_t)v10);
          CFDataSetLength(Mutable, v20 * (unint64_t)v10);
          if (v9 >= 0x10)
          {
            uint64_t v22 = 0;
            if (v19 <= 1) {
              uint64_t v23 = 1;
            }
            else {
              uint64_t v23 = v19;
            }
            uint64_t v36 = v23;
            if (v10 <= 1) {
              uint64_t v24 = 1;
            }
            else {
              uint64_t v24 = v10;
            }
            CFNumberRef v25 = v48;
            uint64_t v26 = 10;
            do
            {
              MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
              CFBooleanRef v28 = &MutableBytePtr[v22 * v20];
              CFBooleanRef v29 = (char *)(&outputStruct + 6 * v22);
              *(_WORD *)CFBooleanRef v28 = 100 * v29[4];
              *((_WORD *)v28 + 1) = 100 * v29[5];
              *((_DWORD *)v28 + 1) = v19;
              if (v37 >= 0x10)
              {
                CFTypeID v30 = &MutableBytePtr[v26];
                uint64_t v31 = v19 - 1;
                uint64_t v32 = v36;
                CFNumberRef v33 = v25;
                do
                {
                  if (v31) {
                    int v34 = updateThread_batteryInfo[(*v33 & 0xF) + 64];
                  }
                  else {
                    LOWORD(v34) = -1;
                  }
                  *((_WORD *)v30 - 1) = v34;
                  unsigned int v35 = *v33++;
                  *(_WORD *)CFTypeID v30 = *(int *)((char *)&updateThread_batteryInfo[80] + (((unint64_t)v35 >> 2) & 0x3C));
                  v30 += 4;
                  --v31;
                  --v32;
                }
                while (v32);
              }
              ++v22;
              v26 += v20;
              v25 += 6;
            }
            while (v22 != v24);
          }
          uint64_t v3 = 0;
          *a2 = Mutable;
        }
      }
      else
      {
        uint64_t v12 = logger;
        uint64_t v3 = 0;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          int v39 = v10;
          __int16 v40 = 1024;
          int v41 = 6 * v10 + 4;
          CFIndex v6 = "gas gauge charge table inconsistent: %d data entries, %d bytes";
          CFDictionaryRef v7 = v12;
          uint32_t v8 = 14;
          goto LABEL_14;
        }
      }
    }
    else
    {
      uint64_t v5 = logger;
      uint64_t v3 = 0;
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v39 = v4;
        CFIndex v6 = "gas gauge charge table invalid type: %#x";
        CFDictionaryRef v7 = v5;
        uint32_t v8 = 8;
LABEL_14:
        _os_log_impl(&dword_1E4220000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
        return 0;
      }
    }
  }
  return v3;
}

uint64_t readRemainingCapacity__(_WORD *a1, int *a2, mach_port_t a3)
{
  unsigned __int16 v8 = 0;
  if ((getFWVersion(a3, (__int16 *)&v8) & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  if (v8 <= 0x118u) {
    int v6 = *a2;
  }
  else {
    int v6 = 50;
  }
  return hdqReadS16(a3, v6, a1);
}

uint64_t readFAC__(_WORD *a1, uint64_t a2, mach_port_t a3)
{
  __int16 v6 = 0;
  if ((getFWVersion(a3, &v6) & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  if (v6 == 1536) {
    return 0;
  }
  return hdqReadU16(a3, 14, a1);
}

uint64_t readBatteryData(uint64_t a1, uint64_t a2, mach_port_t a3)
{
  unsigned __int16 v10 = 0;
  if ((getFWVersion(a3, (__int16 *)&v10) & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  if ((int)a2 >= 1)
  {
    uint64_t v6 = 0;
    unsigned int v7 = v10;
    while (1)
    {
      if (*(_DWORD *)(a1 + 4) == -1) {
        return v6;
      }
      if (registerName(a1, v7))
      {
        uint64_t Register = readRegister(*(_WORD **)(a1 + 56), a1, a3);
        if ((Register & 0x80000000) != 0) {
          break;
        }
      }
      ++v6;
      a1 += 80;
      if (a2 == v6) {
        return a2;
      }
    }
    return Register;
  }
  return a2;
}

void calculateBatteryHealthMetric()
{
  if ((unsigned __int16)word_1EAE4797E >= 0x600u)
  {
    uint64_t v0 = 0;
    float v1 = (double)(bswap32((unsigned __int16)word_1EAE479F8) >> 16) * 0.137995
       + (double)(bswap32((unsigned __int16)word_1EAE479F6) >> 16) * 0.0693069
       + (double)(bswap32((unsigned __int16)word_1EAE479FA) >> 16) * 0.137376
       + (double)(bswap32((unsigned __int16)word_1EAE479FC) >> 16) * 0.137376
       + (double)(bswap32((unsigned __int16)word_1EAE479FE) >> 16) * 0.137376
       + (double)(bswap32((unsigned __int16)word_1EAE47A00) >> 16) * 0.137376
       + (double)(bswap32((unsigned __int16)word_1EAE47A02) >> 16) * 0.137376
       + (double)(bswap32((unsigned __int16)word_1EAE47A04) >> 16) * 0.0872525
       + (double)(bswap32((unsigned __int16)word_1EAE47A06) >> 16) * 0.0185644;
    word_1EAE47A4C = (int)v1;
    while (battery_health_metric_config[v0] != word_1EAE47978)
    {
      v0 += 4;
      if (v0 == 68)
      {
        float v2 = 0.0;
        goto LABEL_7;
      }
    }
    float v2 = (float)*(unsigned int *)&battery_health_metric_config[v0 + 2];
LABEL_7:
    float v3 = (float)(v2 * v1) / 1000.0;
    word_1EAE47A4E = (int)v3;
    if (dword_1EAE47A48 < (int)v3)
    {
      dword_1EAE47A48 = (int)v3;
      setUPOData(@"IOPMUBootBatteryHealthMetric", (int)v3);
    }
  }
}

CFDictionaryRef readChargerData(int a1, int a2, mach_port_t a3)
{
  values[8] = *(void **)MEMORY[0x1E4F143B8];
  if (readBatteryData((uint64_t)&readChargerData_chargerRegs, 5, a3) != 5) {
    return 0;
  }
  memset(&values[2], 0, 48);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  values[0] = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt8Type, &readChargerData_notChargingReason);
  keys[0] = @"NotChargingReason";
  values[1] = CFNumberCreate(v6, kCFNumberSInt8Type, &readChargerData_chargerAlert);
  keys[1] = @"ChargerAlert";
  if (!a1) {
    goto LABEL_11;
  }
  int v7 = readChargerData_notChargingReason & 0x10;
  if (a2)
  {
    if ((readChargerData_notChargingReason & 0x10) != 0)
    {
      int v7 = (readChargerData_notChargingReason >> 4) & 1;
      LOWORD(v19) = 0;
      if ((hdqReadU16(a3, 52, &v19) & 0x80000000) == 0)
      {
        uint64_t v8 = 1717986919 * byte_1EAE47980 * word_1EAE4797A;
        if ((int)((v8 >> 34) + ((unint64_t)v8 >> 63)) > (unsigned __int16)v19) {
          int v7 = 0;
        }
      }
    }
  }
  if (v7)
  {
    values[2] = *(void **)MEMORY[0x1E4F1CFD0];
    *(void *)&long long v21 = @"ChargerTimeout";
    uint64_t v9 = 3;
  }
  else
  {
LABEL_11:
    uint64_t v9 = 2;
  }
  if ((readChargerData_notChargingReason & 0x20) != 0)
  {
    values[v9] = (void *)*MEMORY[0x1E4F1CFD0];
    keys[v9++] = @"ChargerWatchdogTimeout";
  }
  values[v9] = CFNumberCreate(v6, kCFNumberSInt8Type, &readChargerData_chargingCurrent);
  keys[v9] = @"ChargingCurrent";
  CFNumberRef v11 = CFNumberCreate(v6, kCFNumberSInt8Type, &readChargerData_chargingVoltage);
  uint64_t v12 = 8 * v9 + 8;
  *(void **)((char *)values + v12) = v11;
  *(void **)((char *)keys + v12) = @"ChargingVoltage";
  CFNumberRef v13 = CFNumberCreate(v6, kCFNumberSInt8Type, &readChargerData_chargerStatus);
  uint64_t v14 = 8 * v9 + 16;
  *(void **)((char *)values + v14) = v13;
  *(void **)((char *)keys + v14) = @"ChargerStatus";
  time_t v19 = time(0);
  CFNumberRef v15 = CFNumberCreate(v6, kCFNumberLongType, &v19);
  uint64_t v16 = 8 * v9 + 24;
  *(void **)((char *)values + v16) = v15;
  *(void **)((char *)keys + v16) = @"UpdateTime";
  CFDictionaryRef v10 = CFDictionaryCreate(v6, (const void **)keys, (const void **)values, v9 + 4, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  do
  {
    CFRelease(values[v9 + 3]);
    unint64_t v17 = v9 + 4;
    --v9;
  }
  while (v17 > 1);
  return v10;
}

CFDictionaryRef dynamicATV(mach_port_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  CFNumberRef v21 = 0;
  time_t v19 = 0;
  *(_OWORD *)uint64_t input = xmmword_1E44048F0;
  uint64_t v23 = 0;
  if (IOConnectCallScalarMethod(a1, 7u, input, 3u, 0, 0))
  {
    float v1 = logger;
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
      dynamicATV_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
    }
  }
  unsigned int v9 = word_1EAE4797C + (unsigned __int16)word_1EAE47986;
  int v10 = word_1EAE4797A;
  if (v9 <= (__int16)(v10 + ((unsigned __int16)(v10 & 0x8000) >> 15)) >> 1) {
    int v11 = (__int16)(word_1EAE4797A + ((word_1EAE4797A & 0x8000u) >> 15)) >> 1;
  }
  else {
    int v11 = word_1EAE4797C + (unsigned __int16)word_1EAE47986;
  }
  if (v9 <= word_1EAE4797A) {
    int v10 = v11;
  }
  dword_1EAE479A4 = v10;
  CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  values = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberIntType, &dword_1EAE479A4);
  int v18 = @"atvBatteryCapacityMA";
  if (dword_1EAE47AF8)
  {
    int v13 = determineVACVoltage();
    if (v13 != dword_1EAE479A0) {
      dword_1EAE479A0 = v13;
    }
    CFNumberRef v21 = CFNumberCreate(v12, kCFNumberIntType, &dword_1EAE479A0);
    time_t v19 = @"atvAbsMaxVoltageMV";
    unint64_t v14 = 2;
  }
  else
  {
    unint64_t v14 = 1;
  }
  CFDictionaryRef v15 = CFDictionaryCreate(v12, (const void **)&v18, (const void **)&values, v14, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  do
    CFRelease(*(&v19 + v14));
  while (v14-- > 1);
  return v15;
}

uint64_t determineVACVoltage()
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  unsigned int v0 = dword_1EAE479A0;
  uint64_t v1 = dword_1EAE47AF8;
  if (dword_1EAE47AF8)
  {
    if (determineVACVoltage_lastBatteryCycleCount != (unsigned __int16)word_1EAE479AC || dword_1EAE479A0 == 0)
    {
      determineVACVoltage_lastBatteryCycleCFIndex Count = (unsigned __int16)word_1EAE479AC;
      uint64_t v3 = &dword_1EAE47AFC;
      while (1)
      {
        unsigned int v5 = *v3++;
        unsigned __int16 v4 = v5;
        unsigned int v6 = HIWORD(v5);
        if (v5 < 0x10000 || v6 > (unsigned __int16)word_1EAE479AC) {
          break;
        }
        if (!--v1)
        {
          int v8 = determineVACVoltage_vacBasedVoltageMV;
          if (determineVACVoltage_vacBasedVoltageMV) {
            goto LABEL_17;
          }
          goto LABEL_16;
        }
      }
      int v8 = v4;
      if (v4) {
        goto LABEL_17;
      }
LABEL_16:
      int v8 = LOWORD(updateThread_batteryInfo[dword_1EAE47AF8 + 104]);
LABEL_17:
      determineVACVoltage_vacBasedVoltageMV = v8;
      unsigned int v9 = logger;
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
      {
        int v37 = 67109120;
        int v38 = v8;
        _os_log_impl(&dword_1E4220000, v9, OS_LOG_TYPE_DEFAULT, "determineVACVoltage:: vacBasedVoltageMV=%d", (uint8_t *)&v37, 8u);
        int v8 = determineVACVoltage_vacBasedVoltageMV;
      }
      if (v0) {
        BOOL v10 = 1;
      }
      else {
        BOOL v10 = v8 == 0;
      }
      if (!v10) {
        unsigned int v0 = v8;
      }
    }
  }
  uint64_t v11 = dword_1EAE47B3C;
  if (dword_1EAE47B3C && (unsigned __int16)word_1EAE4797E >= 0x313u)
  {
    unsigned __int8 v12 = word_1EAE479E6;
    if ((unsigned __int16)word_1EAE4797E <= 0x500u) {
      __int16 v13 = word_1EAE479E6;
    }
    else {
      __int16 v13 = word_1EAE479E4;
    }
    unint64_t v14 = (unsigned __int8 *)&word_1EAE479E6 + 1;
    if ((unsigned __int16)word_1EAE4797E > 0x500u) {
      unint64_t v14 = (unsigned __int8 *)&word_1EAE479E4 + 1;
    }
    unsigned __int16 v15 = *v14 | (unsigned __int16)(v13 << 8);
    if ((unsigned __int16)word_1EAE4797E <= 0x500u) {
      unsigned __int8 v12 = byte_1EAE479E8;
    }
    if (v12 && v15 != 0)
    {
      if (determineVACVoltage_lastTimeAbove95 != v12
        || ((unsigned __int16)determineVACVoltage_lastToT == v15 ? (BOOL v17 = v0 == 0) : (BOOL v17 = 1), v17))
      {
        determineVACVoltage_lastTimeAbove95 = v12;
        determineVACVoltage_lastToT = v15;
        unint64_t v18 = (42949673 * (unint64_t)(v12 * v15)) >> 32;
        time_t v19 = &dword_1EAE47B40;
        while (1)
        {
          unsigned int v21 = *v19++;
          unsigned __int16 v20 = v21;
          unsigned int v22 = HIWORD(v21);
          if (v21 < 0x10000 || v18 < v22) {
            break;
          }
          if (!--v11)
          {
            int v24 = determineVACVoltage_vac95BasedVoltageMV;
            if (determineVACVoltage_vac95BasedVoltageMV) {
              goto LABEL_54;
            }
            goto LABEL_53;
          }
        }
        int v24 = v20;
        if (v20) {
          goto LABEL_54;
        }
LABEL_53:
        int v24 = LOWORD(updateThread_batteryInfo[dword_1EAE47B3C + 121]);
LABEL_54:
        determineVACVoltage_vac95BasedVoltageMV = v24;
        CFNumberRef v25 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          int v37 = 67109376;
          int v38 = v24;
          __int16 v39 = 1024;
          unsigned int v40 = v0;
          _os_log_impl(&dword_1E4220000, v25, OS_LOG_TYPE_DEFAULT, "determineVACVoltage:: vac95BasedVoltageMV=%d absMaxVoltageMV=%d", (uint8_t *)&v37, 0xEu);
          int v24 = determineVACVoltage_vac95BasedVoltageMV;
        }
        if (v0) {
          BOOL v26 = 1;
        }
        else {
          BOOL v26 = v24 == 0;
        }
        if (!v26) {
          unsigned int v0 = v24;
        }
      }
    }
  }
  unsigned int v27 = determineVACVoltage_vacBasedVoltageMV;
  if (determineVACVoltage_vacBasedVoltageMV >= v0 || determineVACVoltage_vacBasedVoltageMV == 0) {
    unsigned int v27 = v0;
  }
  if (determineVACVoltage_vac95BasedVoltageMV >= v27 || determineVACVoltage_vac95BasedVoltageMV == 0) {
    uint64_t v30 = v27;
  }
  else {
    uint64_t v30 = determineVACVoltage_vac95BasedVoltageMV;
  }
  uint64_t v31 = dword_1EAE479A0;
  int v32 = word_1EAE47982;
  if (dword_1EAE479A0) {
    BOOL v33 = v30 >= word_1EAE47982;
  }
  else {
    BOOL v33 = 1;
  }
  if (v33) {
    return v30;
  }
  int v34 = logger;
  if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
  {
    int v37 = 67109376;
    int v38 = v32;
    __int16 v39 = 1024;
    unsigned int v40 = v30;
    _os_log_impl(&dword_1E4220000, v34, OS_LOG_TYPE_DEFAULT, "determineVACVoltage:: waiting for vbat(%d) < vac(%d)", (uint8_t *)&v37, 0xEu);
    return dword_1EAE479A0;
  }
  return v31;
}

uint64_t determinePoSMThreshold()
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if ((unsigned __int16)word_1EAE4797E <= 0x500u)
  {
    if ((unsigned __int16)word_1EAE4797E < 0x313u) {
      return 0xFFFFFFFFLL;
    }
    uint64_t v2 = &word_1EAE479E6;
    unsigned int v0 = (__int16 *)&byte_1EAE479E8;
    uint64_t v1 = (unsigned __int8 *)&word_1EAE479E6 + 1;
  }
  else
  {
    unsigned int v0 = &word_1EAE479E6;
    uint64_t v1 = (unsigned __int8 *)&word_1EAE479E4 + 1;
    uint64_t v2 = &word_1EAE479E4;
  }
  unsigned int v3 = *v1 | (*(unsigned __int8 *)v2 << 8);
  unsigned int v4 = *(unsigned __int8 *)v0;
  int v5 = (unsigned __int16)dword_1EAE47B84;
  BOOL v6 = (unsigned __int16)dword_1EAE47B84 != 0;
  int v7 = (unsigned __int16)word_1EAE47B88;
  BOOL v8 = word_1EAE47B88 != 0;
  int v9 = (unsigned __int16)word_1EAE47B90;
  BOOL v10 = word_1EAE47B90 != 0;
  BOOL v11 = determinePoSMThreshold_lastBatteryCycleCount != (unsigned __int16)word_1EAE479AC
     && (unsigned __int16)dword_1EAE47B84 != 0;
  BOOL v12 = (unsigned __int16)determinePoSMThreshold_lastToT != v3 && word_1EAE47B88 != 0;
  BOOL v13 = determinePoSMThreshold_lastAbove95 != v4
     || (unsigned __int16)determinePoSMThreshold_lastToT != v3;
  BOOL v14 = determinePoSMThreshold_lastAbove95 != v4 && word_1EAE47B90 != 0;
  BOOL v32 = v11;
  BOOL v33 = v14;
  int v15 = (unsigned __int16)dword_1EAE47B8C;
  BOOL v31 = (unsigned __int16)dword_1EAE47B8C != 0;
  if ((_WORD)dword_1EAE47B8C) {
    BOOL v16 = v13;
  }
  else {
    BOOL v16 = 0;
  }
  if (v11)
  {
    determinePoSMThreshold_lastBatteryCycleCFIndex Count = (unsigned __int16)word_1EAE479AC;
    if ((unsigned __int16)word_1EAE479AC <= HIWORD(dword_1EAE47B84)) {
      int v17 = -1;
    }
    else {
      int v17 = dword_1EAE47B94;
    }
    determinePoSMThreshold_vacThreshold = v17;
  }
  if (v12)
  {
    determinePoSMThreshold_lastToT = v3;
    if (v3 <= HIWORD(*(_DWORD *)&word_1EAE47B88)) {
      int v18 = -1;
    }
    else {
      int v18 = dword_1EAE47B98;
    }
    determinePoSMThreshold_vacpThreshold = v18;
  }
  if (v16)
  {
    determinePoSMThreshold_lastToT = v3;
    determinePoSMThreshold_lastAbove95 = v4;
    if ((42949673 * (unint64_t)(v4 * v3)) >> 32 <= HIWORD(dword_1EAE47B8C)) {
      int v19 = -1;
    }
    else {
      int v19 = dword_1EAE47B9C;
    }
    determinePoSMThreshold_vac95Threshold = v19;
  }
  int v34 = (unsigned __int16)word_1EAE479AC;
  if (word_1EAE47B90)
  {
    determinePoSMThreshold_lastAbove95 = v4;
    if (v4 <= HIWORD(*(_DWORD *)&word_1EAE47B90))
    {
      unsigned int v21 = &handlePeer_forEvent__classDebugEnabled_685;
      unsigned int v20 = -1;
    }
    else
    {
      unsigned int v20 = dword_1EAE47BA0;
      unsigned int v21 = &handlePeer_forEvent__classDebugEnabled_685;
    }
    *((_DWORD *)v21 + 777) = v20;
  }
  else
  {
    unsigned int v20 = determinePoSMThreshold_vac95pThreshold;
  }
  if (determinePoSMThreshold_vacThreshold == -1 || v5 == 0) {
    unsigned int v24 = -1;
  }
  else {
    unsigned int v24 = determinePoSMThreshold_vacThreshold;
  }
  if (determinePoSMThreshold_vacpThreshold >= v24 || v7 == 0) {
    unsigned int v26 = v24;
  }
  else {
    unsigned int v26 = determinePoSMThreshold_vacpThreshold;
  }
  if (determinePoSMThreshold_vac95Threshold < v26 && v15 != 0) {
    unsigned int v26 = determinePoSMThreshold_vac95Threshold;
  }
  if (v20 >= v26 || v9 == 0) {
    uint64_t v22 = v26;
  }
  else {
    uint64_t v22 = v20;
  }
  CFBooleanRef v29 = logger;
  if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109888;
    BOOL v36 = v6;
    __int16 v37 = 1024;
    int v38 = v8;
    __int16 v39 = 1024;
    int v40 = v31;
    __int16 v41 = 1024;
    int v42 = v10;
    _os_log_impl(&dword_1E4220000, v29, OS_LOG_TYPE_DEFAULT, "determinePoSMThreshold, enabled:%d %d %d %d ", buf, 0x1Au);
    CFBooleanRef v29 = logger;
  }
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109888;
    BOOL v36 = v32;
    __int16 v37 = 1024;
    int v38 = v12;
    __int16 v39 = 1024;
    int v40 = v16;
    __int16 v41 = 1024;
    int v42 = v33;
    _os_log_impl(&dword_1E4220000, v29, OS_LOG_TYPE_DEFAULT, "determinePoSMThreshold, changed:%d %d %d %d ", buf, 0x1Au);
    CFBooleanRef v29 = logger;
  }
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110912;
    BOOL v36 = v34;
    __int16 v37 = 1024;
    int v38 = HIWORD(dword_1EAE47B84);
    __int16 v39 = 1024;
    int v40 = v3;
    __int16 v41 = 1024;
    int v42 = (unsigned __int16)word_1EAE47B8A;
    __int16 v43 = 1024;
    int v44 = (42949673 * (unint64_t)(v4 * v3)) >> 32;
    __int16 v45 = 1024;
    int v46 = HIWORD(dword_1EAE47B8C);
    __int16 v47 = 1024;
    unsigned int v48 = v4;
    __int16 v49 = 1024;
    int v50 = (unsigned __int16)word_1EAE47B92;
    _os_log_impl(&dword_1E4220000, v29, OS_LOG_TYPE_DEFAULT, "determinePoSMThreshold, cmp:%d>%u %d>%u %d>%u %d>%u", buf, 0x32u);
    CFBooleanRef v29 = logger;
  }
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110144;
    BOOL v36 = v22;
    __int16 v37 = 1024;
    int v38 = determinePoSMThreshold_vacThreshold;
    __int16 v39 = 1024;
    int v40 = determinePoSMThreshold_vacpThreshold;
    __int16 v41 = 1024;
    int v42 = determinePoSMThreshold_vac95Threshold;
    __int16 v43 = 1024;
    int v44 = determinePoSMThreshold_vac95pThreshold;
    _os_log_impl(&dword_1E4220000, v29, OS_LOG_TYPE_DEFAULT, "determinePoSMThreshold,minThreshold=%u threshold:%u %u %u %u", buf, 0x20u);
  }
  return v22;
}

CFDictionaryRef parseBatteryData(int a1, int a2)
{
  uint64_t v130 = *MEMORY[0x1E4F143B8];
  *(void *)&valuePtr[4] = 0;
  uint64_t v121 = 0;
  long long v120 = 0u;
  long long v119 = 0u;
  long long v118 = 0u;
  long long v117 = 0u;
  long long v116 = 0u;
  long long v115 = 0u;
  long long v114 = 0u;
  long long v113 = 0u;
  long long v112 = 0u;
  long long v111 = 0u;
  long long v110 = 0u;
  long long v109 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  uint64_t v106 = 0;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  v107 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const UInt8 *)updateThread_batteryInfo, 32);
  v93[0] = @"MfgData";
  v108[0] = createStringWithBytes((UInt8 *)updateThread_batteryInfo, 0x12uLL);
  v93[1] = @"Serial";
  *(void *)int valuePtr = word_1EAE4797A;
  v108[1] = CFNumberCreate(v4, kCFNumberIntType, valuePtr);
  v93[2] = @"DesignCapacity";
  int v64 = (unsigned __int16)word_1EAE479AE;
  values = CFNumberCreate(v4, kCFNumberIntType, &v64);
  if (values)
  {
    *(void *)&long long v109 = CFArrayCreate(v4, (const void **)&values, 1, MEMORY[0x1E4F1D510]);
    *(void *)&long long v94 = @"Qmax";
    CFRelease(values);
    uint64_t v5 = 4;
  }
  else
  {
    uint64_t v5 = 3;
  }
  int v63 = word_1EAE47984;
  v108[v5 - 1] = CFNumberCreate(v4, kCFNumberIntType, &v63);
  v93[v5] = @"MaxCapacity";
  int v62 = (unsigned __int16)word_1EAE479AC;
  CFNumberRef v6 = CFNumberCreate(v4, kCFNumberIntType, &v62);
  uint64_t v7 = 8 * v5 + 8;
  *(void *)((char *)&v108[-1] + v7) = v6;
  *(void **)((char *)v93 + v7) = @"CycleCount";
  int v61 = (unsigned __int16)word_1EAE479B0;
  CFNumberRef v8 = CFNumberCreate(v4, kCFNumberIntType, &v61);
  uint64_t v9 = 8 * v5 + 16;
  *(void *)((char *)&v108[-1] + v9) = v8;
  *(void **)((char *)v93 + v9) = @"StateOfCharge";
  int v60 = word_1EAE47982;
  CFNumberRef v10 = CFNumberCreate(v4, kCFNumberIntType, &v60);
  uint64_t v11 = 8 * v5 + 24;
  *(void *)((char *)&v108[-1] + v11) = v10;
  *(void **)((char *)v93 + v11) = @"Voltage";
  int v59 = (unsigned __int16)word_1EAE479B2;
  CFNumberRef v12 = CFNumberCreate(v4, kCFNumberIntType, &v59);
  uint64_t v13 = 8 * v5 + 32;
  *(void *)((char *)&v108[-1] + v13) = v12;
  *(void **)((char *)v93 + v13) = @"Flags";
  CFStringRef StringWithBytes = createStringWithBytes((UInt8 *)updateThread_batteryInfo + 2, 4uLL);
  uint64_t v15 = 8 * v5 + 40;
  *(void *)((char *)&v108[-1] + v15) = StringWithBytes;
  *(void **)((char *)v93 + v15) = @"ManufactureDate";
  __int16 v58 = word_1EAE47978;
  CFNumberRef v16 = CFNumberCreate(v4, kCFNumberSInt16Type, &v58);
  uint64_t v17 = 8 * v5 + 48;
  *(void *)((char *)&v108[-1] + v17) = v16;
  *(void **)((char *)v93 + v17) = @"ChemID";
  uint64_t v18 = v5 + 7;
  if (word_1EAE4797E != 1536)
  {
    int v57 = (unsigned __int16)word_1EAE479B4;
    v108[v18 - 1] = CFNumberCreate(v4, kCFNumberIntType, &v57);
    v93[v18] = @"FullAvailableCapacity";
    uint64_t v18 = v5 | 8;
    if ((unsigned __int16)word_1EAE4797E < 0x313u) {
      goto LABEL_20;
    }
  }
  long long v127 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  uint64_t v125 = 0;
  time_t v92 = time(0);
  keys[0] = @"UpdateTime";
  v126[0] = CFNumberCreate(v4, kCFNumberLongType, &v92);
  keys[1] = @"MaximumTemperature";
  int v91 = (__int16)(byte_1EAE479B6 << 8) | byte_1EAE479B7;
  v126[1] = CFNumberCreate(v4, kCFNumberIntType, &v91);
  keys[2] = @"MinimumTemperature";
  int v90 = (__int16)(byte_1EAE479B8 << 8) | byte_1EAE479B9;
  v126[2] = CFNumberCreate(v4, kCFNumberIntType, &v90);
  keys[3] = @"MaximumPackVoltage";
  int v89 = (__int16)(byte_1EAE479BA << 8) | byte_1EAE479BB;
  v126[3] = CFNumberCreate(v4, kCFNumberIntType, &v89);
  keys[4] = @"MinimumPackVoltage";
  int v88 = (__int16)(byte_1EAE479BC << 8) | byte_1EAE479BD;
  v126[4] = CFNumberCreate(v4, kCFNumberIntType, &v88);
  keys[5] = @"MaximumChargeCurrent";
  int v87 = (__int16)(byte_1EAE479BE << 8) | byte_1EAE479BF;
  v126[5] = CFNumberCreate(v4, kCFNumberIntType, &v87);
  keys[6] = @"MaximumDischargeCurrent";
  int v86 = (__int16)(byte_1EAE479C0 << 8) | byte_1EAE479C1;
  v126[6] = CFNumberCreate(v4, kCFNumberIntType, &v86);
  keys[7] = @"MaximumOverChargedCapacity";
  int v85 = (__int16)(byte_1EAE479C2 << 8) | byte_1EAE479C3;
  v126[7] = CFNumberCreate(v4, kCFNumberIntType, &v85);
  keys[8] = @"MaximumOverDischargedCapacity";
  int v84 = (__int16)(byte_1EAE479C4 << 8) | byte_1EAE479C5;
  v126[8] = CFNumberCreate(v4, kCFNumberIntType, &v84);
  keys[9] = @"MaximumFCC";
  int v83 = (__int16)(byte_1EAE479C6 << 8) | byte_1EAE479C7;
  v126[9] = CFNumberCreate(v4, kCFNumberIntType, &v83);
  keys[10] = @"MinimumFCC";
  int v82 = (__int16)(byte_1EAE479C8 << 8) | byte_1EAE479C9;
  v126[10] = CFNumberCreate(v4, kCFNumberIntType, &v82);
  keys[11] = @"MaximumDeltaVoltage";
  int v81 = (__int16)(byte_1EAE479CA << 8) | byte_1EAE479CB;
  v126[11] = CFNumberCreate(v4, kCFNumberIntType, &v81);
  keys[12] = @"MinimumDeltaVoltage";
  int v80 = (__int16)(byte_1EAE479CC << 8) | byte_1EAE479CD;
  v126[12] = CFNumberCreate(v4, kCFNumberIntType, &v80);
  keys[13] = @"LowAvgCurrentLastRun";
  int v79 = (__int16)(byte_1EAE479CE << 8) | byte_1EAE479CF;
  v126[13] = CFNumberCreate(v4, kCFNumberIntType, &v79);
  keys[14] = @"HighAvgCurrentLastRun";
  int v78 = (__int16)(byte_1EAE479D0 << 8) | byte_1EAE479D1;
  v126[14] = CFNumberCreate(v4, kCFNumberIntType, &v78);
  keys[15] = @"MaximumQmax";
  int v77 = (__int16)(byte_1EAE479D2 << 8) | byte_1EAE479D3;
  v126[15] = CFNumberCreate(v4, kCFNumberIntType, &v77);
  keys[16] = @"MinimumQmax";
  int v76 = (__int16)(byte_1EAE479D4 << 8) | byte_1EAE479D5;
  v126[16] = CFNumberCreate(v4, kCFNumberIntType, &v76);
  keys[17] = @"MaximumRa0-8";
  int v75 = (__int16)(byte_1EAE479D6 << 8) | byte_1EAE479D7;
  v126[17] = CFNumberCreate(v4, kCFNumberIntType, &v75);
  keys[18] = @"MinimumRa0-8";
  int v74 = (__int16)(byte_1EAE479D8 << 8) | byte_1EAE479D9;
  v126[18] = CFNumberCreate(v4, kCFNumberIntType, &v74);
  keys[19] = @"AverageTemperature";
  int v73 = byte_1EAE479DA;
  v126[19] = CFNumberCreate(v4, kCFNumberIntType, &v73);
  keys[20] = @"TemperatureSamples";
  unsigned int v72 = bswap32(unk_1EAE479DB);
  v126[20] = CFNumberCreate(v4, kCFNumberIntType, &v72);
  keys[21] = @"FlashWriteCount";
  unsigned int v71 = __rev16(unk_1EAE479DF);
  *(void *)&long long v127 = CFNumberCreate(v4, kCFNumberIntType, &v71);
  *(void *)&long long v123 = @"RDISCnt";
  unsigned int v70 = __rev16(unk_1EAE479E1);
  *((void *)&v127 + 1) = CFNumberCreate(v4, kCFNumberIntType, &v70);
  *((void *)&v123 + 1) = @"CycleCountLastQmax";
  int v69 = byte_1EAE479E3;
  *(void *)&long long v128 = CFNumberCreate(v4, kCFNumberIntType, &v69);
  if ((unsigned __int16)word_1EAE4797E < 0x501u)
  {
    if ((unsigned __int16)word_1EAE4797E < 0x313u)
    {
      uint64_t v22 = 24;
      goto LABEL_12;
    }
    int v19 = &word_1EAE479E6;
  }
  else
  {
    int v19 = &word_1EAE479E4;
  }
  unsigned int v20 = __rev16((unsigned __int16)*v19);
  *(void *)&long long v124 = @"TotalOperatingTime";
  unsigned int v68 = v20;
  *((void *)&v128 + 1) = CFNumberCreate(v4, kCFNumberIntType, &v68);
  int v21 = *((unsigned __int8 *)v19 + 2);
  *((void *)&v124 + 1) = @"TimeAbove95Perc";
  int v67 = v21;
  *(void *)&long long v129 = CFNumberCreate(v4, kCFNumberIntType, &v67);
  uint64_t v22 = 26;
LABEL_12:
  keys[v22] = @"Raw";
  v126[v22] = CFDataCreate(v4, (const UInt8 *)&byte_1EAE479B6, 64);
  CFDictionaryRef v23 = CFDictionaryCreate(v4, (const void **)keys, (const void **)v126, v22 | 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  do
  {
    CFRelease(v126[v22]);
    unint64_t v24 = v22-- + 1;
  }
  while (v24 > 1);
  if (!v23)
  {
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
    {
      parseBatteryData_cold_2();
      if (!a1) {
        goto LABEL_22;
      }
LABEL_21:
      int v56 = (unsigned __int16)word_1EAE47990;
      v108[v18 - 1] = CFNumberCreate(v4, kCFNumberIntType, &v56);
      v93[v18] = @"ITMiscStatus";
      int v55 = word_1EAE47990 & 3;
      CFNumberRef v25 = CFNumberCreate(v4, kCFNumberIntType, &v55);
      uint64_t v26 = 8 * v18 + 8;
      *(void *)((char *)&v108[-1] + v26) = v25;
      *(void **)((char *)v93 + v26) = @"ITSimulationCounter";
      v18 += 2;
      goto LABEL_22;
    }
LABEL_20:
    if (!a1) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if (a2) {
    CFShow(v23);
  }
  v108[v18 - 1] = v23;
  v93[v18++] = @"LifetimeData";
  if (a1) {
    goto LABEL_21;
  }
LABEL_22:
  if ((unsigned __int16)word_1EAE4797E >= 0x600u)
  {
    *(void *)&valuePtr[4] = CFDataCreate(v4, (const UInt8 *)&word_1EAE479F6, 32);
    if (*(void *)&valuePtr[4])
    {
      v108[v18 - 1] = CFArrayCreate(v4, (const void **)&valuePtr[4], 1, MEMORY[0x1E4F1D510]);
      v93[v18++] = @"RaTableRaw";
      CFRelease(*(CFTypeRef *)&valuePtr[4]);
    }
    int v54 = (unsigned __int16)word_1EAE47A4C;
    v108[v18 - 1] = CFNumberCreate(v4, kCFNumberIntType, &v54);
    v93[v18] = @"WeightedRa";
    int v53 = (unsigned __int16)word_1EAE47A4E;
    CFNumberRef v27 = CFNumberCreate(v4, kCFNumberIntType, &v53);
    uint64_t v28 = 8 * v18 + 8;
    *(void *)((char *)&v108[-1] + v28) = v27;
    *(void **)((char *)v93 + v28) = @"ChemicalWeightedRa";
    int v52 = dword_1EAE47A48;
    CFNumberRef v29 = CFNumberCreate(v4, kCFNumberIntType, &v52);
    uint64_t v30 = 8 * v18 + 16;
    *(void *)((char *)&v108[-1] + v30) = v29;
    *(void **)((char *)v93 + v30) = @"BatteryHealthMetric";
    uint64_t v31 = v18 + 3;
    if ((unsigned __int16)word_1EAE4797E < 0x600u)
    {
      v18 += 3;
    }
    else
    {
      v108[v31 - 1] = CFDataCreate(v4, byte_1EAE47A16, 32);
      v93[v31] = @"iMaxAndSocSmoothTable";
      unsigned int v51 = __rev16(*(unsigned __int16 *)&byte_1EAE47A16[1]);
      CFNumberRef v32 = CFNumberCreate(v4, kCFNumberIntType, &v51);
      uint64_t v33 = 8 * v18 + 32;
      *(void *)((char *)&v108[-1] + v33) = v32;
      *(void **)((char *)v93 + v33) = @"RSS";
      v18 += 5;
    }
  }
  int v50 = (unsigned __int16)word_1EAE47994;
  v108[v18 - 1] = CFNumberCreate(v4, kCFNumberIntType, &v50);
  v93[v18] = @"ResScale";
  int v49 = word_1EAE47996;
  CFNumberRef v34 = CFNumberCreate(v4, kCFNumberIntType, &v49);
  uint64_t v35 = 8 * v18 + 8;
  *(void *)((char *)&v108[-1] + v35) = v34;
  *(void **)((char *)v93 + v35) = @"Qstart";
  int v48 = word_1EAE47998;
  CFNumberRef v36 = CFNumberCreate(v4, kCFNumberIntType, &v48);
  uint64_t v37 = 8 * v18 + 16;
  *(void *)((char *)&v108[-1] + v37) = v36;
  *(void **)((char *)v93 + v37) = @"PassedCharge";
  uint64_t v38 = v18 + 3;
  int v47 = (unsigned __int16)word_1EAE4799A;
  values = CFNumberCreate(v4, kCFNumberIntType, &v47);
  if (values)
  {
    v108[v38 - 1] = CFArrayCreate(v4, (const void **)&values, 1, MEMORY[0x1E4F1D510]);
    v93[v38] = @"DOD0";
    uint64_t v38 = v18 + 4;
    CFRelease(values);
  }
  int v46 = word_1EAE47992;
  values = CFNumberCreate(v4, kCFNumberIntType, &v46);
  if (values)
  {
    v108[v38 - 1] = CFArrayCreate(v4, (const void **)&values, 1, MEMORY[0x1E4F1D510]);
    v93[v38++] = @"PresentDOD";
    CFRelease(values);
  }
  int v45 = (unsigned __int16)word_1EAE479B2;
  v108[v38 - 1] = CFNumberCreate(v4, kCFNumberIntType, &v45);
  v93[v38] = @"GaugeFlagRaw";
  uint64_t v44 = gauge_reset_count;
  CFNumberRef v39 = CFNumberCreate(v4, kCFNumberLongLongType, &v44);
  uint64_t v40 = 8 * v38 + 8;
  *(void *)((char *)&v108[-1] + v40) = v39;
  *(void **)((char *)v93 + v40) = @"GaugeResetCounter";
  if (v38 >= 27) {
    parseBatteryData_cold_1();
  }
  CFDictionaryRef v41 = CFDictionaryCreate(v4, (const void **)v93, (const void **)&v107, v38 + 2, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (v38 >= -1)
  {
    do
    {
      CFRelease((CFTypeRef)v108[v38]);
      unint64_t v42 = v38 + 2;
      --v38;
    }
    while (v42 > 1);
  }
  return v41;
}

uint64_t ggctl_logShutdownReason2(uint64_t result, _OWORD *a2, unsigned int a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  size_t v8 = 48;
  if (a2)
  {
    if (a3)
    {
      long long v10 = 0u;
      long long v11 = 0u;
      long long outputStruct = 0u;
      uint64_t input = a3;
      double result = IOConnectCallMethod(result, 0x13u, &input, 1u, inputStruct, 0x30uLL, 0, 0, &outputStruct, &v8);
      if (!result)
      {
        long long v4 = v10;
        *a2 = outputStruct;
        a2[1] = v4;
        a2[2] = v11;
      }
    }
    else
    {
      long long v5 = a2[1];
      inputStruct[0] = *a2;
      inputStruct[1] = v5;
      inputStruct[2] = a2[2];
      uint64_t v7 = a3;
      return IOConnectCallMethod(result, 0x13u, &v7, 1u, inputStruct, 0x30uLL, 0, 0, &outputStruct, &v8);
    }
  }
  return result;
}

__darwin_time_t UpSeconds()
{
  if (!UpSeconds_boottime)
  {
    v1.tv_sec = 16;
    sysctlbyname("kern.boottime", &UpSeconds_boottime, (size_t *)&v1, 0, 0);
  }
  v1.tv_sec = 0;
  *(void *)&v1.tv_usec = 0;
  gettimeofday(&v1, 0);
  return v1.tv_sec - UpSeconds_boottime;
}

CFStringRef createStringWithBytes(UInt8 *bytes, unint64_t a2)
{
  unint64_t v2 = 0;
  if (a2)
  {
    unsigned int v3 = 1;
    do
    {
      if (!bytes[v2]) {
        break;
      }
      unint64_t v2 = v3++;
    }
    while (v2 < a2);
  }
  return CFStringCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], bytes, v2, 0x8000100u, 0, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
}

void OUTLINED_FUNCTION_2_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void OUTLINED_FUNCTION_5_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_6_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x18u);
}

void ggctl_connect_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  unint64_t v2 = "AppleHDQGasGaugeControl";
  _os_log_error_impl(&dword_1E4220000, log, OS_LOG_TYPE_ERROR, "could not find %s service", (uint8_t *)&v1, 0xCu);
}

void ggctl_connect_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ggctl_reset_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "gas gauge: cannot issue a reset", v2, v3, v4, v5, v6);
}

void ggctl_open_device_cold_1(NSObject *a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = __error();
  uint64_t v3 = strerror(*v2);
  int v4 = 136315394;
  uint64_t v5 = "checkreset";
  __int16 v6 = 2080;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_1E4220000, a1, OS_LOG_TYPE_ERROR, "%s: %s", (uint8_t *)&v4, 0x16u);
}

void ggctl_open_device_cold_2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "gas gauge: cannot determine the state of SWI line", v2, v3, v4, v5, v6);
}

void ggctl_open_device_cold_3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "gas gauge: SWI line low, issuing reset", v2, v3, v4, v5, v6);
}

void ggctl_open_device_cold_4()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_6_4(&dword_1E4220000, v0, v1, "%s:%d break failed (%d)", v2, v3, v4, v5, 2u);
}

void updateThread_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "gasgauge: could not register for system power notifications", v2, v3, v4, v5, v6);
}

void updateThread_cold_2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_5_0(a1, a2);
  OUTLINED_FUNCTION_2_5(&dword_1E4220000, v2, (uint64_t)v2, "gasgauge: SWI line, cannot determine the state of line", v3);
}

void updateThread_cold_3(uint8_t *buf, _DWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *a2 = -1;
  _os_log_error_impl(&dword_1E4220000, log, OS_LOG_TYPE_ERROR, "cannot drain the data log (%d)", buf, 8u);
}

void updateThread_cold_4(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_5_0(a1, a2);
  OUTLINED_FUNCTION_2_5(&dword_1E4220000, v2, (uint64_t)v2, "num_client<0, client error?", v3);
}

void updateThread_cold_5(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_5_0(a1, a2);
  OUTLINED_FUNCTION_2_5(&dword_1E4220000, v2, (uint64_t)v2, "gasgauge: SWI line low reset disabled, ignoring", v3);
}

void updateThread_cold_6(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_5_0(a1, a2);
  OUTLINED_FUNCTION_2_5(&dword_1E4220000, v2, (uint64_t)v2, "gasgauge: SWI line low issuing reset", v3);
}

void updateThread_cold_7()
{
  unsigned int v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_10_0(&dword_1E4220000, v1, v2, "could not find hw.model: %s", v3, v4, v5, v6, 2u);
}

void updateThread_cold_8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6_2(&dword_1E4220000, a2, a3, "gasgauge: could not register for battery events err=%x", a5, a6, a7, a8, 0);
}

void updateThread_cold_9(mach_error_t a1)
{
  mach_error_string(a1);
  OUTLINED_FUNCTION_10_0(&dword_1E4220000, v1, v2, "gasgauge: could not map data log: %s", v3, v4, v5, v6, 2u);
}

void updateThread_cold_10()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "gasgauge: could not register for power source events", v2, v3, v4, v5, v6);
}

void updateThermalCoolDownState_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_4(&dword_1E4220000, v0, v1, "%s:%d cannot update thermal state", v2, v3, v4, v5, 2u);
}

void statsAndLogs_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_4(&dword_1E4220000, v0, v1, "%s:%d cannot create dictionary", v2, v3, v4, v5, 2u);
}

void statsAndLogs_cold_2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_6_4(&dword_1E4220000, v0, v1, "%s:%d cannot dump stats and logs (%x)", v2, v3, v4, v5, 2u);
}

void debugLog_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_4(&dword_1E4220000, v0, v1, "%s:%d cannot create dictionary", v2, v3, v4, v5, 2u);
}

void debugLog_cold_2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_6_4(&dword_1E4220000, v0, v1, "%s:%d cannot dump stats and logs (%x)", v2, v3, v4, v5, 2u);
}

void dynamicATV_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void parseBatteryData_cold_1()
{
  __assert_rtn("parseBatteryData", "AppleHDQGasGauge.c", 1565, "batteryDataCount<=kNumBatteryDataUpdateKeys");
}

void parseBatteryData_cold_2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "Cannot create the lifetime dictionary", v2, v3, v4, v5, v6);
}

void PLEmitSystemPowerSignpost_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "unsupported config", v2, v3, v4, v5, v6);
}

void PLProcessCPU::PLProcessCPU(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1E4220000, log, OS_LOG_TYPE_ERROR, "Unable to allocate memory.", v1, 2u);
}

{
  uint8_t v1[16];

  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1E4220000, log, OS_LOG_TYPE_DEBUG, "PLProcessCPU initialized.", v1, 2u);
}

void updateDisplayIOReportAZLStats_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "LogDisplayAZL !ioReportStats", v2, v3, v4, v5, v6);
}

void updateDisplayIOReportAZLStats_cold_2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "LogDisplayAZL !ioReportStats.subscription", v2, v3, v4, v5, v6);
}

void updateDisplayIOReportAZLStats_cold_3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "LogDisplayAZL,no newSample", v2, v3, v4, v5, v6);
}

void updateDisplayIOReportAZLStats_cold_4()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "LogDisplayAZL,no delta", v2, v3, v4, v5, v6);
}

void __updateDisplayIOReportAZLStats_block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [a1 unsignedLongLongValue];
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_5_3(), "numberWithUnsignedLongLong:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_2(&dword_1E4220000, a2, v4, "AZL power is equal to %@", v5);
}

void __updateDisplayIOReportAZLStats_block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [a1 unsignedLongLongValue];
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_5_3(), "numberWithUnsignedLongLong:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_2(&dword_1E4220000, a2, v4, "AZL azl_accum is equal to %@", v5);
}

void __updateDisplayIOReportAZLStats_block_invoke_cold_3(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [a1 unsignedLongLongValue];
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_5_3(), "numberWithUnsignedLongLong:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_2(&dword_1E4220000, a2, v4, "AZL nits_accum is equal to %@", v5);
}

void __updateDisplayIOReportAZLStats_block_invoke_cold_4(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [a1 unsignedLongLongValue];
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_5_3(), "numberWithUnsignedLongLong:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_2(&dword_1E4220000, a2, v4, "AZL bl_update_count is equal to %@", v5);
}

void __updateDisplayIOReportAZLStats_block_invoke_cold_5(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [a1 unsignedLongLongValue];
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_5_3(), "numberWithUnsignedLongLong:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_2(&dword_1E4220000, a2, v4, "AZL bl_frame_count is equal to %@", v5);
}

void updateDisplayIOReportAODStats_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "LogDisplayAOD !ioReportStats", v2, v3, v4, v5, v6);
}

void updateDisplayIOReportAODStats_cold_2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "LogDisplayAOD !ioReportStats.subscription", v2, v3, v4, v5, v6);
}

void updateDisplayIOReportAODStats_cold_3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "LogDisplayAOD,no newSample", v2, v3, v4, v5, v6);
}

void updateDisplayIOReportAODStats_cold_4()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "LogDisplayAOD,no delta", v2, v3, v4, v5, v6);
}

void updateDisplayIOReportAODStats_cold_5(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 ioReportSample];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_2(&dword_1E4220000, a2, v4, "Got callback for updateDisplayIOReportAODStat with ioReportAODStats.ioReportSample %@", v5);
}

void updateDisplayIOReportAODStats_cold_6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Got callback for updateDisplayIOReportAODStat with ioReportAODStats %@", v2, v3, v4, v5, v6);
}

void __updateDisplayIOReportAODStats_block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [a1 unsignedLongLongValue];
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_5_3(), "numberWithUnsignedLongLong:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_2(&dword_1E4220000, a2, v4, "AOD awake_count is equal to %@", v5);
}

void __updateDisplayIOReportAODStats_block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [a1 unsignedLongLongValue];
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_5_3(), "numberWithUnsignedLongLong:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_2(&dword_1E4220000, a2, v4, "AOD media_count is equal to %@", v5);
}

void __updateDisplayIOReportAODStats_block_invoke_cold_3(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [a1 unsignedLongLongValue];
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_5_3(), "numberWithUnsignedLongLong:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_2(&dword_1E4220000, a2, v4, "AOD flipbook_count is equal to %@", v5);
}

void __updateDisplayIOReportAODStats_block_invoke_cold_4(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [a1 unsignedLongLongValue];
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_5_3(), "numberWithUnsignedLongLong:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_2(&dword_1E4220000, a2, v4, "AOD flipbook_delay is equal to %@", v5);
}

void __updateDisplayIOReportAODStats_block_invoke_cold_5(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [a1 unsignedLongLongValue];
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_5_3(), "numberWithUnsignedLongLong:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_2(&dword_1E4220000, a2, v4, "AOD media_scanout is equal to %@", v5);
}

void __updateDisplayIOReportAODStats_block_invoke_cold_6(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [a1 unsignedLongLongValue];
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_5_3(), "numberWithUnsignedLongLong:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_2(&dword_1E4220000, a2, v4, "AOD ambient_count is equal to %@", v5);
}

void __updateDisplayIOReportAODStats_block_invoke_cold_7(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [a1 unsignedLongLongValue];
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_5_3(), "numberWithUnsignedLongLong:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_2(&dword_1E4220000, a2, v4, "AOD prc_repeat_coun is equal to %@", v5);
}

void __updateDisplayIOReportAODStats_block_invoke_cold_8(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [a1 unsignedLongLongValue];
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_5_3(), "numberWithUnsignedLongLong:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_2(&dword_1E4220000, a2, v4, "AOD pdc_repeat_coun is equal to %@", v5);
}

void __updateDisplayIOReportAODStats_block_invoke_cold_9(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [a1 unsignedLongLongValue];
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_5_3(), "numberWithUnsignedLongLong:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_2(&dword_1E4220000, a2, v4, "AOD llm_count is equal to %@", v5);
}

void __updateDisplayIOReportAODStats_block_invoke_cold_10(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [a1 unsignedLongLongValue];
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_5_3(), "numberWithUnsignedLongLong:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_2(&dword_1E4220000, a2, v4, "AOD apl_sum is equal to %@", v5);
}

void __updateDisplayIOReportAODStats_block_invoke_cold_11(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [a1 unsignedLongLongValue];
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_5_3(), "numberWithUnsignedLongLong:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_2(&dword_1E4220000, a2, v4, "AOD apl_count is equal to %@", v5);
}

uint64_t ADClientSetValueForScalarKey()
{
  return MEMORY[0x1F4107218]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1F41138A0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

uint64_t AppAnalyticsEnabled()
{
  return MEMORY[0x1F4116E48]();
}

uint64_t BKSHIDServicesLastUserEventTime()
{
  return MEMORY[0x1F410BFB8]();
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9710](data, *(void *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1F40D7170](allocator, values, numValues, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

uint64_t CFBundleCopyLocalizedStringForLocalization()
{
  return MEMORY[0x1F40D74B0]();
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1F40D7568](bundle);
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1F40D75D0](bundle, key);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7808](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1F40D7858](theData);
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1F40D7968](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFIndex CFNumberGetByteSize(CFNumberRef number)
{
  return MEMORY[0x1F40D7DF8](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B8]();
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1F40D8128](mode, returnAfterSourceHandled, seconds);
}

void CFShow(CFTypeRef obj)
{
}

CFStringRef CFStringCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1F40D8440](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation, contentsDeallocator);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

uint64_t CLCopyAppsUsingLocation()
{
  return MEMORY[0x1F40DB578]();
}

uint64_t CLCopyTechnologiesInUse()
{
  return MEMORY[0x1F40DB580]();
}

FSEventStreamRef FSEventStreamCreate(CFAllocatorRef allocator, FSEventStreamCallback callback, FSEventStreamContext *context, CFArrayRef pathsToWatch, FSEventStreamEventId sinceWhen, CFTimeInterval latency, FSEventStreamCreateFlags flags)
{
  return (FSEventStreamRef)MEMORY[0x1F40DEDC0](allocator, callback, context, pathsToWatch, sinceWhen, *(void *)&flags, latency);
}

void FSEventStreamScheduleWithRunLoop(FSEventStreamRef streamRef, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
}

Boolean FSEventStreamStart(FSEventStreamRef streamRef)
{
  return MEMORY[0x1F40DEDF8](streamRef);
}

void FSEventStreamStop(FSEventStreamRef streamRef)
{
}

void FSEventStreamUnscheduleFromRunLoop(FSEventStreamRef streamRef, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x1F40E8678](*(void *)&kernelPort, notificationID);
}

CFTypeRef IOCFUnserializeWithSize(const char *buffer, size_t bufferSize, CFAllocatorRef allocator, CFOptionFlags options, CFStringRef *errorString)
{
  return (CFTypeRef)MEMORY[0x1F40E8698](buffer, bufferSize, allocator, options, errorString);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1F40E86C8](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x1F40E86D0](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1F40E86D8](*(void *)&connection, *(void *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectMapMemory(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return MEMORY[0x1F40E86E0](*(void *)&connect, *(void *)&memoryType, *(void *)&intoTask, atAddress, ofSize, *(void *)&options);
}

kern_return_t IOConnectUnmapMemory(io_connect_t connect, uint32_t memoryType, task_port_t fromTask, mach_vm_address_t atAddress)
{
  return MEMORY[0x1F40E8730](*(void *)&connect, *(void *)&memoryType, *(void *)&fromTask, atAddress);
}

IOReturn IOHIDDeviceClose(IOHIDDeviceRef device, IOOptionBits options)
{
  return MEMORY[0x1F40E8798](device, *(void *)&options);
}

IOReturn IOHIDDeviceGetReport(IOHIDDeviceRef device, IOHIDReportType reportType, CFIndex reportID, uint8_t *report, CFIndex *pReportLength)
{
  return MEMORY[0x1F40E87C8](device, *(void *)&reportType, reportID, report, pReportLength);
}

io_service_t IOHIDDeviceGetService(IOHIDDeviceRef device)
{
  return MEMORY[0x1F40E87D8](device);
}

IOReturn IOHIDDeviceOpen(IOHIDDeviceRef device, IOOptionBits options)
{
  return MEMORY[0x1F40E87E8](device, *(void *)&options);
}

IOReturn IOHIDDeviceSetReport(IOHIDDeviceRef device, IOHIDReportType reportType, CFIndex reportID, const uint8_t *report, CFIndex reportLength)
{
  return MEMORY[0x1F40E8848](device, *(void *)&reportType, reportID, report, reportLength);
}

uint64_t IOHIDEventGetChildren()
{
  return MEMORY[0x1F40E89C8]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x1F40E8A00]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x1F40E8A38]();
}

uint64_t IOHIDEventSystemClientCreate()
{
  return MEMORY[0x1F40E8AC0]();
}

uint64_t IOHIDEventSystemClientRegisterEventCallback()
{
  return MEMORY[0x1F40E8AF0]();
}

uint64_t IOHIDEventSystemClientScheduleWithDispatchQueue()
{
  return MEMORY[0x1F40E8B18]();
}

uint64_t IOHIDEventSystemClientSetMatching()
{
  return MEMORY[0x1F40E8B38]();
}

uint64_t IOHIDEventSystemClientUnregisterDeviceMatchingCallback()
{
  return MEMORY[0x1F40E8B58]();
}

uint64_t IOHIDEventSystemClientUnregisterEventCallback()
{
  return MEMORY[0x1F40E8B68]();
}

void IOHIDManagerActivate(IOHIDManagerRef manager)
{
}

CFSetRef IOHIDManagerCopyDevices(IOHIDManagerRef manager)
{
  return (CFSetRef)MEMORY[0x1F40E8C58](manager);
}

IOHIDManagerRef IOHIDManagerCreate(CFAllocatorRef allocator, IOOptionBits options)
{
  return (IOHIDManagerRef)MEMORY[0x1F40E8C68](allocator, *(void *)&options);
}

void IOHIDManagerSetDeviceMatching(IOHIDManagerRef manager, CFDictionaryRef matching)
{
}

void IOHIDManagerSetDispatchQueue(IOHIDManagerRef manager, dispatch_queue_t queue)
{
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1F40E8ED8](*(void *)&iterator);
}

uint64_t IOMobileFramebufferDisablePowerNotifications()
{
  return MEMORY[0x1F41249E0]();
}

uint64_t IOMobileFramebufferEnablePowerNotifications()
{
  return MEMORY[0x1F4124A00]();
}

uint64_t IOMobileFramebufferGetBufBlock()
{
  return MEMORY[0x1F4124A30]();
}

uint64_t IOMobileFramebufferGetMainDisplay()
{
  return MEMORY[0x1F4124A88]();
}

uint64_t IOMobileFramebufferGetRunLoopSource()
{
  return MEMORY[0x1F4124AA0]();
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x1F40E8F08](*(void *)&mainPort);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40E8F20](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

CFStringRef IOObjectCopyClass(io_object_t object)
{
  return (CFStringRef)MEMORY[0x1F40E8F40](*(void *)&object);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

uint64_t IOPMCopyBatteryHeatMap()
{
  return MEMORY[0x1F40E8FF8]();
}

uint64_t IOPMCopyCurrentScheduledWake()
{
  return MEMORY[0x1F40E9000]();
}

uint64_t IOPMCopyCycleCountData()
{
  return MEMORY[0x1F40E9008]();
}

uint64_t IOPMCopyKioskModeData()
{
  return MEMORY[0x1F40E9010]();
}

uint64_t IOPMIsADarkWake()
{
  return MEMORY[0x1F40E9038]();
}

uint64_t IOPMIsASleep()
{
  return MEMORY[0x1F40E9040]();
}

uint64_t IOPMIsAUserWake()
{
  return MEMORY[0x1F40E9048]();
}

uint64_t IOPMScheduleAssertionExceptionNotification()
{
  return MEMORY[0x1F40E9058]();
}

uint64_t IOPMSetAssertionExceptionLimits()
{
  return MEMORY[0x1F40E9090]();
}

uint64_t IOPMSleepWakeCopyUUID()
{
  return MEMORY[0x1F40E90A0]();
}

uint64_t IOPMUserIsActive()
{
  return MEMORY[0x1F40E90C8]();
}

uint64_t IOPSCopyPowerSourcesByType()
{
  return MEMORY[0x1F40E90D8]();
}

uint64_t IOPSCopyPowerSourcesByTypePrecise()
{
  return MEMORY[0x1F40E90E0]();
}

CFArrayRef IOPSCopyPowerSourcesList(CFTypeRef blob)
{
  return (CFArrayRef)MEMORY[0x1F40E90F0](blob);
}

uint64_t IOPSGaugingMitigationGetState()
{
  return MEMORY[0x1F40E9108]();
}

uint64_t IOPSGetPercentRemaining()
{
  return MEMORY[0x1F40E9110]();
}

CFDictionaryRef IOPSGetPowerSourceDescription(CFTypeRef blob, CFTypeRef ps)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9118](blob, ps);
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return MEMORY[0x1F40E9148](refcon, thePortRef, callback, notifier);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x1F40E9158](*(void *)&entry, properties, allocator, *(void *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9168](*(void *)&entry, key, allocator, *(void *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x1F40E9188](*(void *)&mainPort, path);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x1F40E91F8](*(void *)&entry, entryID);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9208](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntrySetCFProperties(io_registry_entry_t entry, CFTypeRef properties)
{
  return MEMORY[0x1F40E9218](*(void *)&entry, properties);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x1F40E9220](*(void *)&entry, propertyName, property);
}

uint64_t IOReportChannelGetChannelName()
{
  return MEMORY[0x1F417A738]();
}

uint64_t IOReportCreateSamples()
{
  return MEMORY[0x1F417A798]();
}

uint64_t IOReportCreateSamplesDelta()
{
  return MEMORY[0x1F417A7A0]();
}

uint64_t IOReportIterate()
{
  return MEMORY[0x1F417A7D0]();
}

uint64_t IOReportSimpleGetIntegerValue()
{
  return MEMORY[0x1F417A7F8]();
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x1F40E9230](notifyPort, *(void *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1F40E9240](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1F40E9250](*(void *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x1F40E9258](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9268](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x1F40E9280](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MKBUserTypeDeviceMode()
{
  return MEMORY[0x1F412FA18]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1F40E7278]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *NSUserName(void)
{
  return (NSString *)MEMORY[0x1F40E72F0]();
}

uint64_t NStatManagerAddAllTCP()
{
  return MEMORY[0x1F4130868]();
}

uint64_t NStatManagerAddAllUDP()
{
  return MEMORY[0x1F4130870]();
}

uint64_t NStatManagerCreate()
{
  return MEMORY[0x1F4130878]();
}

uint64_t NStatSourceSetCountsBlock()
{
  return MEMORY[0x1F41308C8]();
}

uint64_t NStatSourceSetDescriptionBlock()
{
  return MEMORY[0x1F41308D0]();
}

uint64_t NStatSourceSetRemovedBlock()
{
  return MEMORY[0x1F41308E0]();
}

uint64_t OSAMoveFileForSubmissions()
{
  return MEMORY[0x1F4116E80]();
}

uint64_t OSThermalNotificationCurrentLevel()
{
  return MEMORY[0x1F40C9A18]();
}

uint64_t PLADClientAddValueForScalarKey()
{
  return MEMORY[0x1F4145DF8]();
}

uint64_t PLADClientBatchKeys()
{
  return MEMORY[0x1F4145E00]();
}

uint64_t PLADClientPushValueForDistributionKey()
{
  return MEMORY[0x1F4145E08]();
}

uint64_t PLADClientSetValueForScalarKey()
{
  return MEMORY[0x1F4145E10]();
}

uint64_t PLBatteryUsageUIKeyFromConfiguration()
{
  return MEMORY[0x1F4145D50]();
}

uint64_t PLBatteryUsageUIStringForQueryRange()
{
  return MEMORY[0x1F4145D58]();
}

uint64_t PLBatteryUsageUIStringForResponseType()
{
  return MEMORY[0x1F4145D60]();
}

uint64_t PLCalculateEndOfDayWithDate()
{
  return MEMORY[0x1F4145D68]();
}

uint64_t PLCalculateEndOfHourWithDate()
{
  return MEMORY[0x1F4145D70]();
}

uint64_t PLLogAppDeletion()
{
  return MEMORY[0x1F4145E18]();
}

uint64_t PLOSAMoveFileForSubmissions()
{
  return MEMORY[0x1F4145E28]();
}

uint64_t PLQueryRegistered()
{
  return MEMORY[0x1F4145DA0]();
}

uint64_t PLTalkToPowerlogHelper()
{
  return MEMORY[0x1F4145DB0]();
}

uint64_t SBSBacklightChangeSourceForDisplayLayoutTransitionReason()
{
  return MEMORY[0x1F415C2D8]();
}

uint64_t SBSCopyApplicationDisplayIdentifiers()
{
  return MEMORY[0x1F415C2F8]();
}

uint64_t SBSCopyDisplayIdentifiers()
{
  return MEMORY[0x1F415C308]();
}

uint64_t SBSCopyLocalizedApplicationNameForDisplayIdentifier()
{
  return MEMORY[0x1F415C320]();
}

uint64_t SBSGetApplicationState()
{
  return MEMORY[0x1F415C370]();
}

uint64_t SBSProcessIDForDisplayIdentifier()
{
  return MEMORY[0x1F415C3E0]();
}

uint64_t SBSRegisterDisplayIdentifiersChangedBlock()
{
  return MEMORY[0x1F415C3E8]();
}

uint64_t SMCAccumGetChannelInfoForKey()
{
  return MEMORY[0x1F417D0F8]();
}

uint64_t SMCCloseConnection()
{
  return MEMORY[0x1F417D100]();
}

uint64_t SMCGetKeyInfo()
{
  return MEMORY[0x1F417D110]();
}

uint64_t SMCMakeUInt32Key()
{
  return MEMORY[0x1F417D118]();
}

uint64_t SMCOSAccumIsSupported()
{
  return MEMORY[0x1F417D120]();
}

uint64_t SMCOSAccumSampleChannel()
{
  return MEMORY[0x1F417D128]();
}

uint64_t SMCOpenConnectionWithDefaultService()
{
  return MEMORY[0x1F417D138]();
}

uint64_t SMCReadKey()
{
  return MEMORY[0x1F417D140]();
}

uint64_t SMCReadKeyAsNumericWithKnownKeyInfo()
{
  return MEMORY[0x1F417D150]();
}

uint64_t SMCWriteKeyAsNumeric()
{
  return MEMORY[0x1F417D160]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1F40F7168](allocator, token);
}

uint32_t SecTaskGetCodeSignStatus(SecTaskRef task)
{
  return MEMORY[0x1F40F7180](task);
}

uint64_t WiFiDeviceClientCopyCurrentNetwork()
{
  return MEMORY[0x1F412FD90]();
}

uint64_t WiFiDeviceClientCopyInterfaceStateInfo()
{
  return MEMORY[0x1F412FDA8]();
}

uint64_t WiFiDeviceClientCopyProperty()
{
  return MEMORY[0x1F412FDB0]();
}

uint64_t WiFiDeviceClientGetInterfaceName()
{
  return MEMORY[0x1F412FDB8]();
}

uint64_t WiFiDeviceClientGetPower()
{
  return MEMORY[0x1F412FDC8]();
}

uint64_t WiFiDeviceClientIsInterfaceAWDL()
{
  return MEMORY[0x1F412FDD8]();
}

uint64_t WiFiDeviceClientIsInterfaceHostAp()
{
  return MEMORY[0x1F412FDE0]();
}

uint64_t WiFiDeviceClientRegisterDeviceAvailableCallback()
{
  return MEMORY[0x1F412FDF8]();
}

uint64_t WiFiDeviceClientRegisterExtendedLinkCallback()
{
  return MEMORY[0x1F412FE00]();
}

uint64_t WiFiDeviceClientRegisterLQMCallback()
{
  return MEMORY[0x1F412FE10]();
}

uint64_t WiFiDeviceClientRegisterPowerCallback()
{
  return MEMORY[0x1F412FE18]();
}

uint64_t WiFiDeviceClientRegisterScanUpdateCallback()
{
  return MEMORY[0x1F412FE28]();
}

uint64_t WiFiDeviceClientRegisterVirtualInterfaceStateChangeCallback()
{
  return MEMORY[0x1F412FE30]();
}

uint64_t WiFiGetNetworkChannel()
{
  return MEMORY[0x1F412FE68]();
}

uint64_t WiFiManagerClientCopyDevices()
{
  return MEMORY[0x1F412FE78]();
}

uint64_t WiFiManagerClientCopyInterfaces()
{
  return MEMORY[0x1F412FE88]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x1F412FEA0]();
}

uint64_t WiFiManagerClientGetWoWCapability()
{
  return MEMORY[0x1F412FEE0]();
}

uint64_t WiFiManagerClientGetWoWState()
{
  return MEMORY[0x1F412FEE8]();
}

uint64_t WiFiManagerClientRegisterDeviceAttachmentCallback()
{
  return MEMORY[0x1F412FEF0]();
}

uint64_t WiFiManagerClientRegisterUserAutoJoinStateChangedCallback()
{
  return MEMORY[0x1F412FF08]();
}

uint64_t WiFiManagerClientScheduleWithRunLoop()
{
  return MEMORY[0x1F412FF20]();
}

uint64_t WiFiManagerClientUnscheduleFromRunLoop()
{
  return MEMORY[0x1F412FF58]();
}

uint64_t WiFiNetworkGetOperatingBand()
{
  return MEMORY[0x1F412FFB0]();
}

uint64_t WiFiNetworkGetProperty()
{
  return MEMORY[0x1F412FFB8]();
}

uint64_t WiFiNetworkGetSSID()
{
  return MEMORY[0x1F412FFC8]();
}

uint64_t WiFiNetworkIsCarPlay()
{
  return MEMORY[0x1F4130000]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x1F40D8BB0]();
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x1F40D8C30]();
}

uint64_t _CFCopySupplementalVersionDictionary()
{
  return MEMORY[0x1F40D8D08]();
}

uint64_t _CFPreferencesCopyAppValueWithContainer()
{
  return MEMORY[0x1F40D8F40]();
}

uint64_t _CFPreferencesCopyValueWithContainer()
{
  return MEMORY[0x1F40D8F58]();
}

uint64_t _CFPreferencesSetValueWithContainer()
{
  return MEMORY[0x1F40D8FD0]();
}

uint64_t _CFXPCCreateCFObjectFromXPCMessage()
{
  return MEMORY[0x1F40D9428]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1F40D9438]();
}

uint64_t _CFXPCCreateXPCMessageWithCFObject()
{
  return MEMORY[0x1F40D9440]();
}

uint64_t _SBFScreenTimeRegisterForExternalChangeNotification()
{
  return MEMORY[0x1F415C4B0]();
}

uint64_t _SBSAutolockTimerRegisterForExternalChangeNotification()
{
  return MEMORY[0x1F415C4C0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40C9C28]();
}

uint64_t __strncat_chk()
{
  return MEMORY[0x1F40C9CE0]();
}

uint64_t _launch_service_stats_copy_4ppse_impl()
{
  return MEMORY[0x1F40C9F58]();
}

uint64_t _os_assumes_log()
{
  return MEMORY[0x1F40C9F98]();
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

uint64_t _os_signpost_emit_unreliably_with_name_impl()
{
  return MEMORY[0x1F40CA058]();
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

char *__cdecl basename(char *a1)
{
  return (char *)MEMORY[0x1F40CA518](a1);
}

void bzero(void *a1, size_t a2)
{
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1F40CB3A8](a1, *(void *)&a2, *(void *)&a3);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1F4181558](cls);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1F40CB3D8](*(void *)&__clock_id);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

uint64_t coalition_info_resource_usage()
{
  return MEMORY[0x1F40CB408]();
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return MEMORY[0x1F40CB438](*(void *)&a1, a2, a3);
}

uint64_t container_system_group_path_for_identifier()
{
  return MEMORY[0x1F40CB7F8]();
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1F4182BD0](strm, *(void *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x1F4182BE0](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x1F4182BE8](strm, *(void *)&level, *(void *)&method, *(void *)&windowBits, *(void *)&memLevel, *(void *)&strategy, version, *(void *)&stream_size);
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

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1F40CBBD8](queue);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
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

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

int feof(FILE *a1)
{
  return MEMORY[0x1F40CC098](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1F40CC0A0](a1);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1F40CC0D8](*(void *)&a1, a2, a3, *(void *)&a4);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  MEMORY[0x1F40CC1A8](a1, a2);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC200](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

uint64_t getClientPermissions()
{
  return MEMORY[0x1F4145E38]();
}

uint64_t getPowermodels()
{
  return MEMORY[0x1F4145E40]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x1F40CC4D8](a1);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1F40CC568](a1, a2);
}

kern_return_t host_statistics64(host_t host_priv, host_flavor_t flavor, host_info64_t host_info64_out, mach_msg_type_number_t *host_info64_outCnt)
{
  return MEMORY[0x1F40CC628](*(void *)&host_priv, *(void *)&flavor, host_info64_out, host_info64_outCnt);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x1F40CC678](*(void *)&a1, a2, a3, *(void *)&a4);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x1F4182CB0](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x1F4182CB8](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x1F4182CC8](strm, *(void *)&windowBits, version, *(void *)&stream_size);
}

uint64_t initComputeSafeguards()
{
  return MEMORY[0x1F4112C40]();
}

uint64_t launch_service_stats_disable_4ppse()
{
  return MEMORY[0x1F40CC7D0]();
}

uint64_t launch_service_stats_enable_4ppse()
{
  return MEMORY[0x1F40CC7D8]();
}

uint64_t launch_service_stats_is_enabled_4ppse()
{
  return MEMORY[0x1F40CC7E0]();
}

uint64_t ledger()
{
  return MEMORY[0x1F40CC818]();
}

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1F40CC940](*(void *)&error_value);
}

uint64_t mach_get_times()
{
  return MEMORY[0x1F40CC948]();
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1F40CC950]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1F40CC9B8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

uint64_t malloc_get_all_zones()
{
  return MEMORY[0x1F40CCB48]();
}

const char *__cdecl malloc_get_zone_name(malloc_zone_t *zone)
{
  return (const char *)MEMORY[0x1F40CCB50](zone);
}

void *__cdecl malloc_type_aligned_alloc(size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB88](alignment, size, type_id);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBA8](ptr, size, type_id);
}

void malloc_zone_statistics(malloc_zone_t *zone, malloc_statistics_t *stats)
{
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

uint64_t memorystatus_control()
{
  return MEMORY[0x1F40CCD18]();
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

int mkstemp(char *a1)
{
  return MEMORY[0x1F40CCE08](a1);
}

mstats *mstats(mstats *__return_ptr retstr)
{
  return (mstats *)MEMORY[0x1F40CCE70](retstr);
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

Class *__cdecl objc_copyClassList(unsigned int *outCount)
{
  return (Class *)MEMORY[0x1F4181698](outCount);
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_release(void *object)
{
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
}

int proc_listallpids(void *buffer, int buffersize)
{
  return MEMORY[0x1F40CD870](buffer, *(void *)&buffersize);
}

uint64_t proc_listcoalitions()
{
  return MEMORY[0x1F40CD878]();
}

int proc_listpids(uint32_t type, uint32_t typeinfo, void *buffer, int buffersize)
{
  return MEMORY[0x1F40CD880](*(void *)&type, *(void *)&typeinfo, buffer, *(void *)&buffersize);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD888](*(void *)&pid, buffer, *(void *)&buffersize);
}

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return MEMORY[0x1F40CD890](*(void *)&pid, *(void *)&flavor, buffer);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x1F40CD8A8](*(void *)&pid, *(void *)&flavor, arg, buffer, *(void *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD8B8](*(void *)&pid, buffer, *(void *)&buffersize);
}

uint64_t proc_reset_footprint_interval()
{
  return MEMORY[0x1F40CD8D0]();
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x1F40CD918](a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x1F40CD930](a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1F40CD940](a1, *(void *)&a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1F40CD9B8](a1, a2, a3, a4);
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x1F40CDB60](a1);
}

int putchar(int a1)
{
  return MEMORY[0x1F40CDBA8](*(void *)&a1);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1F40CE078](*(void *)&a1);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1F40CE1F8](__dst, __src, __n);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2A0](__str, __endptr, *(void *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1F40CE470](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

kern_return_t task_name_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *tn)
{
  return MEMORY[0x1F40CE480](*(void *)&target_tport, *(void *)&pid, tn);
}

uint64_t tcp_connection_fallback_watcher_create()
{
  return MEMORY[0x1F40F40D8]();
}

uint64_t tcp_fallback_watcher_fallback_inuse()
{
  return MEMORY[0x1F40F4278]();
}

time_t time(time_t *a1)
{
  return MEMORY[0x1F40CE588](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1F40CEA58](xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x1F40CEA90](xarray, index);
}

uint64_t xpc_coalition_copy_info()
{
  return MEMORY[0x1F40CEB60]();
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x1F40CEBE8]();
}

void *__cdecl xpc_connection_get_context(xpc_connection_t connection)
{
  return (void *)MEMORY[0x1F40CEBF8](connection);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1F40CEC20](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1F40CEC68](connection, message);
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1F40CEE40](original);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1F40CEEE0](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

uint64_t xpc_get_service_name_from_pid()
{
  return MEMORY[0x1F40CF138]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}