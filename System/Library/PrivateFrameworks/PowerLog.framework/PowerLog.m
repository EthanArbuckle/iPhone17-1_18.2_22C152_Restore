void sub_1A11A7420(_Unwind_Exception *a1)
{
  objc_sync_exit(@"___CacheSync___");
  _Unwind_Resume(a1);
}

void sub_1A11A7764(_Unwind_Exception *a1)
{
}

void sub_1A11A78F8(_Unwind_Exception *a1)
{
}

void sub_1A11A797C(_Unwind_Exception *a1)
{
}

void sub_1A11A7A6C(_Unwind_Exception *a1)
{
}

void sub_1A11A7AFC(_Unwind_Exception *a1)
{
}

void sub_1A11A7C60(_Unwind_Exception *a1)
{
}

uint64_t PLShouldLogRegisteredEvent(uint64_t a1, void *a2)
{
  if (+[PLClientLogger isMessageOnDeviceDisabled]) {
    return 0;
  }
  id v5 = a2;
  v6 = +[PLClientLogger sharedInstance];
  int v7 = [v6 blockedPermissionForClientID:a1 withKey:v5 withType:@"Post" withTimeout:0];

  v8 = +[PLClientLogger sharedInstance];
  int v9 = [v8 clientDebug];

  if (v7)
  {
    if (!v9) {
      return 1;
    }
    v10 = PLLogClientLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      PLShouldLogRegisteredEvent_cold_2();
    }
    uint64_t v4 = 1;
    goto LABEL_12;
  }
  if (v9)
  {
    v10 = PLLogClientLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      PLShouldLogRegisteredEvent_cold_1();
    }
    uint64_t v4 = 0;
LABEL_12:

    return v4;
  }
  return 0;
}

void PLLogTimeSensitiveRegisteredEvent(uint64_t a1, void *a2, void *a3)
{
  if (!+[PLClientLogger isMessageOnDeviceDisabled])
  {
    id v6 = a2;
    id v9 = (id)[a3 mutableCopy];
    int v7 = [MEMORY[0x1E4F1C9C8] date];
    [v9 setObject:v7 forKey:@"__pl_internal_timeSensitiveSystemDate"];

    v8 = +[PLClientLogger sharedInstance];
    [v8 logForClientID:a1 withKey:v6 withPayload:v9];
  }
}

void sub_1A11A8CD0(_Unwind_Exception *a1)
{
}

void sub_1A11A8E60(_Unwind_Exception *a1)
{
}

void sub_1A11A91A4(_Unwind_Exception *a1)
{
}

void PLLogRegisteredEvent(uint64_t a1, void *a2, void *a3)
{
  if (!+[PLClientLogger isMessageOnDeviceDisabled])
  {
    id v6 = a3;
    id v7 = a2;
    id v8 = +[PLClientLogger sharedInstance];
    [v8 logForClientID:a1 withKey:v7 withPayload:v6];
  }
}

void sub_1A11A96F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A11A9E70(_Unwind_Exception *a1)
{
}

void sub_1A11AA090(_Unwind_Exception *a1)
{
}

id PLLogClientLogging()
{
  if (PLLogClientLogging_onceToken != -1) {
    dispatch_once(&PLLogClientLogging_onceToken, &__block_literal_global_5);
  }
  v0 = (void *)PLLogClientLogging___logObj;
  return v0;
}

PPSTelemetryIdentifier *PPSCreateTelemetryIdentifier(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v3 UTF8String];
  id v6 = v4;
  uint64_t v7 = [v6 UTF8String];

  return +[PPSClientDonation createIdentifierForSubsystem:v5 category:v7];
}

void sub_1A11AA360(_Unwind_Exception *a1)
{
}

void sub_1A11AA6A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id logHandle()
{
  if (logHandle_onceToken != -1) {
    dispatch_once(&logHandle_onceToken, &__block_literal_global_30);
  }
  v0 = (void *)logHandle__logHandle;
  return v0;
}

id logHandle_0()
{
  if (logHandle_onceToken_0 != -1) {
    dispatch_once(&logHandle_onceToken_0, &__block_literal_global_6);
  }
  v0 = (void *)logHandle__logHandle_0;
  return v0;
}

id logHandle_1()
{
  if (logHandle_onceToken_1 != -1) {
    dispatch_once(&logHandle_onceToken_1, &__block_literal_global_8);
  }
  v0 = (void *)logHandle__logHandle_1;
  return v0;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t PPSSendTelemetry(uint64_t a1, uint64_t a2)
{
  return +[PPSClientDonation sendEventWithIdentifier:a1 payload:a2];
}

uint64_t pps_send_telemetry(uint64_t a1, uint64_t a2)
{
  return +[PPSClientDonation sendEventWithIdentifier:a1 payload:a2];
}

uint64_t __logHandle_block_invoke()
{
  logHandle__logHandle = (uint64_t)os_log_create("com.apple.PerfPowerServices", "ClientRegistration");
  return MEMORY[0x1F41817F8]();
}

uint64_t __logHandle_block_invoke_0()
{
  logHandle__logHandle_0 = (uint64_t)os_log_create("com.apple.PerfPowerServices", "ClientDonation");
  return MEMORY[0x1F41817F8]();
}

uint64_t __logHandle_block_invoke_1()
{
  logHandle__logHandle_1 = (uint64_t)os_log_create("com.apple.batteryui", "");
  return MEMORY[0x1F41817F8]();
}

id PLLogDiscretionaryEnergyMonitor()
{
  if (PLLogDiscretionaryEnergyMonitor_onceToken != -1) {
    dispatch_once(&PLLogDiscretionaryEnergyMonitor_onceToken, &__block_literal_global);
  }
  v0 = (void *)PLLogDiscretionaryEnergyMonitor___logObj;
  return v0;
}

uint64_t __PLLogClientLogging_block_invoke()
{
  PLLogClientLogging___logObj = (uint64_t)os_log_create("com.apple.powerlog", "ClientLogging");
  return MEMORY[0x1F41817F8]();
}

id discretionaryEnergyMonitorQueue()
{
  if (discretionaryEnergyMonitorQueue_queueCreationGuard != -1) {
    dispatch_once(&discretionaryEnergyMonitorQueue_queueCreationGuard, &__block_literal_global_4);
  }
  v0 = (void *)discretionaryEnergyMonitorQueue_queue;
  return v0;
}

uint64_t __PLLogDiscretionaryEnergyMonitor_block_invoke()
{
  PLLogDiscretionaryEnergyMonitor___logObj = (uint64_t)os_log_create("com.apple.powerlog.energybudgeting", "discretionaryenergymonitor");
  return MEMORY[0x1F41817F8]();
}

void __discretionaryEnergyMonitorQueue_block_invoke()
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v1 = dispatch_queue_create("PLFrameworkEnergyBudgetingWorkQueue", v0);
  v2 = (void *)discretionaryEnergyMonitorQueue_queue;
  discretionaryEnergyMonitorQueue_queue = (uint64_t)v1;
}

void sub_1A11ACBA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void PLBatteryLifeMonitorLogCoreDuetEventsAggregate(void *a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"events";
  v5[0] = a1;
  dispatch_queue_t v1 = (void *)MEMORY[0x1E4F1C9E8];
  id v2 = a1;
  id v3 = [v1 dictionaryWithObjects:v5 forKeys:&v4 count:1];

  PLLogRegisteredEvent(24, @"BLMNotifyDuetEvent", v3);
}

void sub_1A11B1128(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A11B1ADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void didReceiveNotification(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = discretionaryEnergyMonitorQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __didReceiveNotification_block_invoke;
  v6[3] = &__block_descriptor_48_e5_v8__0l;
  v6[4] = a2;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

void PLBatteryLifeMonitorLogDuetEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v18[6] = *MEMORY[0x1E4F143B8];
  id v8 = [MEMORY[0x1E4F1C9C8] date];
  [v8 timeIntervalSince1970];
  double v10 = v9;

  v17[0] = @"time";
  v11 = [NSNumber numberWithDouble:v10];
  v18[0] = v11;
  v17[1] = @"bundleID";
  v12 = [NSString stringWithUTF8String:a1];
  v18[1] = v12;
  v17[2] = @"updateType";
  v13 = [NSNumber numberWithShort:a2];
  v18[2] = v13;
  v17[3] = @"sequenceNumber";
  v14 = [NSNumber numberWithUnsignedLongLong:a3];
  v18[3] = v14;
  v17[4] = @"eventType";
  v15 = [NSNumber numberWithShort:a4];
  v17[5] = @"BLMLogType";
  v18[4] = v15;
  v18[5] = &unk_1EF4505E0;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:6];

  PLLogRegisteredEvent(24, @"BLMNotifyDuetEvent", v16);
}

void PLBatteryLifeMonitorStopAllDuetEvents()
{
  v6[3] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1C9C8] date];
  [v0 timeIntervalSince1970];
  double v2 = v1;

  v5[0] = @"time";
  id v3 = [NSNumber numberWithDouble:v2];
  v6[0] = v3;
  v6[1] = MEMORY[0x1E4F1CC38];
  v5[1] = @"BLMStopAllDuetEvents";
  void v5[2] = @"BLMLogType";
  v6[2] = &unk_1EF4505E0;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:3];

  PLLogRegisteredEvent(24, @"BLMNotifyDuetEvent", v4);
}

void PLBatteryLifeMonitorLogCoreDuetAdmissionEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6, double a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  v34[11] = *MEMORY[0x1E4F143B8];
  if (+[PLModelingUtilities internalBuild])
  {
    v19 = [MEMORY[0x1E4F1C9C8] date];
    [v19 timeIntervalSince1970];
    double v21 = v20;

    v33[0] = @"time";
    v32 = [NSNumber numberWithDouble:v21];
    v34[0] = v32;
    v33[1] = @"clientID";
    v31 = [NSNumber numberWithUnsignedLongLong:a1];
    v34[1] = v31;
    v33[2] = @"attributeID";
    v22 = [NSNumber numberWithUnsignedLongLong:a2];
    v34[2] = v22;
    v33[3] = @"attributeName";
    v23 = [NSString stringWithUTF8String:a10];
    v34[3] = v23;
    v33[4] = @"value";
    v24 = [NSString stringWithUTF8String:a3];
    v34[4] = v24;
    v33[5] = @"Probability";
    v25 = [NSNumber numberWithDouble:a6];
    v34[5] = v25;
    v33[6] = @"PT";
    v26 = [NSNumber numberWithDouble:a7];
    v34[6] = v26;
    v33[7] = @"BON";
    v27 = [NSNumber numberWithUnsignedLongLong:a4];
    v34[7] = v27;
    v33[8] = @"reason";
    v28 = [NSString stringWithUTF8String:a5];
    v34[8] = v28;
    v33[9] = @"ableID";
    v29 = [NSNumber numberWithUnsignedLongLong:a9];
    v33[10] = @"BLMLogType";
    v34[9] = v29;
    v34[10] = &unk_1EF4505F8;
    v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:11];

    PLLogRegisteredEvent(24, @"BLMNotifyDuetEvent", v30);
  }
}

void PLBatteryLifeMonitorLogCoreDuetEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  v36[13] = *MEMORY[0x1E4F143B8];
  v18 = [MEMORY[0x1E4F1C9C8] date];
  [v18 timeIntervalSince1970];
  double v20 = v19;

  v35[0] = @"time";
  v34 = [NSNumber numberWithDouble:v20];
  v36[0] = v34;
  v35[1] = @"clientID";
  v33 = [NSNumber numberWithUnsignedLongLong:a1];
  v36[1] = v33;
  v35[2] = @"attributeID";
  v32 = [NSNumber numberWithUnsignedLongLong:a2];
  v36[2] = v32;
  v35[3] = @"attributeName";
  double v21 = [NSString stringWithUTF8String:a11];
  v36[3] = v21;
  v35[4] = @"updateType";
  v22 = [NSNumber numberWithShort:a3];
  v36[4] = v22;
  v35[5] = @"sequenceNumber";
  v23 = [NSNumber numberWithUnsignedLongLong:a4];
  v36[5] = v23;
  v35[6] = @"eventType";
  v24 = [NSNumber numberWithShort:a5];
  v36[6] = v24;
  v35[7] = @"value";
  v25 = [NSString stringWithUTF8String:a6];
  v36[7] = v25;
  v35[8] = @"cellin";
  v26 = [NSNumber numberWithUnsignedLongLong:a7];
  v36[8] = v26;
  v35[9] = @"cellout";
  v27 = [NSNumber numberWithUnsignedLongLong:a8];
  v36[9] = v27;
  v35[10] = @"wifiin";
  v28 = [NSNumber numberWithUnsignedLongLong:a9];
  v36[10] = v28;
  v35[11] = @"wifiout";
  v29 = [NSNumber numberWithUnsignedLongLong:a10];
  v35[12] = @"BLMLogType";
  v36[11] = v29;
  v36[12] = &unk_1EF450610;
  v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:13];

  PLLogRegisteredEvent(24, @"BLMNotifyDuetEvent", v30);
}

void PLBatteryLifeMonitorLogCoreDuetPredictionEvents(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, float a8)
{
  v31[10] = *MEMORY[0x1E4F143B8];
  if (+[PLModelingUtilities internalBuild])
  {
    v16 = [MEMORY[0x1E4F1C9C8] date];
    [v16 timeIntervalSince1970];
    double v18 = v17;

    double v19 = objc_msgSend(NSNumber, "numberWithDouble:", v18, @"time");
    v31[0] = v19;
    v30[1] = @"prediction_c_a";
    double v20 = [NSNumber numberWithUnsignedLongLong:a1];
    v31[1] = v20;
    v30[2] = @"prediction_c_b";
    double v21 = [NSNumber numberWithUnsignedLongLong:a2];
    v31[2] = v21;
    v30[3] = @"prediction_c_c";
    v22 = [NSNumber numberWithUnsignedLongLong:a3];
    v31[3] = v22;
    v30[4] = @"prediction_b1";
    v23 = [NSNumber numberWithBool:a4];
    v31[4] = v23;
    v30[5] = @"prediction_b2";
    v24 = [NSNumber numberWithBool:a5];
    v31[5] = v24;
    v30[6] = @"prediction_r2";
    *(float *)&double v25 = a8;
    v26 = [NSNumber numberWithFloat:v25];
    v31[6] = v26;
    v30[7] = @"ableID";
    v27 = [NSNumber numberWithUnsignedLongLong:a6];
    v31[7] = v27;
    v30[8] = @"selectedModel";
    v28 = [NSString stringWithUTF8String:a7];
    v30[9] = @"BLMLogType";
    v31[8] = v28;
    v31[9] = &unk_1EF450628;
    v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:10];

    PLLogRegisteredEvent(24, @"BLMNotifyDuetEvent", v29);
  }
}

id PLBatteryLifeMonitorGenericDuetQuery(void *a1)
{
  id v1 = a1;
  if (+[PLModelingUtilities isHomePod]) {
    goto LABEL_11;
  }
  double v2 = PLFDefaultsValueForKey();

  if (v2)
  {
    id v3 = PLFDefaultsValueForKey();
    uint64_t v4 = [v3 integerValue];
  }
  else
  {
    uint64_t v4 = 30;
  }
  uint64_t v5 = PLFDefaultsValueForKey();

  if (v5)
  {
    id v6 = PLFDefaultsValueForKey();
    unsigned int v7 = [v6 unsignedIntValue];
  }
  else
  {
    unsigned int v7 = 2;
  }
  if (v4 < 1)
  {
LABEL_11:
    double v9 = 0;
  }
  else
  {
    while (1)
    {
      uint64_t v8 = PLQueryRegistered(24, @"BLMReportEnergyDuet", v1);
      if (v8) {
        break;
      }
      sleep(v7);
      if (!--v4) {
        goto LABEL_11;
      }
    }
    double v9 = (void *)v8;
  }

  return v9;
}

id PLBatteryLifeMonitorReportEnergyDuet(void *a1)
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  double v2 = PLFDefaultsValueForKey();
  int v3 = [v2 BOOLValue];

  if (v3)
  {
    NSLog(&cfstr_DuetToPowerlog.isa);
    v13[0] = MEMORY[0x1E4F1CBF0];
    v12[0] = @"BLMEnergyForDuet";
    v12[1] = @"BLMEnergyReferenceDate";
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
    v13[1] = v4;
    v12[2] = @"BLMBatteryCapacity";
    uint64_t v5 = NSNumber;
    +[PLModelingUtilities defaultBatteryEnergyCapacity];
    id v6 = objc_msgSend(v5, "numberWithDouble:");
    v13[2] = v6;
    unsigned int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  }
  else
  {
    v10[0] = @"BLMEnergyForDuet";
    uint64_t v8 = v1;
    if (!v1)
    {
      uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
    }
    v10[1] = @"BLMLogType";
    v11[0] = v8;
    v11[1] = &unk_1EF4505E0;
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
    if (!v1) {

    }
    unsigned int v7 = PLBatteryLifeMonitorGenericDuetQuery(v4);
  }

  return v7;
}

uint64_t PLBatteryLifeMonitorReportCumulativeTotalDiscretionaryEnergyCoreDuet()
{
  return PLQueryRegistered(24, @"BLMReportEnergyDuet", 0);
}

id PLBatteryLifeMonitorReportEnergyCoreDuet(void *a1)
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  double v2 = PLFDefaultsValueForKey();
  int v3 = [v2 BOOLValue];

  if (v3)
  {
    NSLog(&cfstr_DuetToPowerlog.isa);
    v13[0] = MEMORY[0x1E4F1CBF0];
    v12[0] = @"BLMEnergyForDuet";
    v12[1] = @"BLMEnergyReferenceDate";
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
    v13[1] = v4;
    v12[2] = @"BLMBatteryCapacity";
    uint64_t v5 = NSNumber;
    +[PLModelingUtilities defaultBatteryEnergyCapacity];
    id v6 = objc_msgSend(v5, "numberWithDouble:");
    v13[2] = v6;
    unsigned int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  }
  else
  {
    v10[0] = @"BLMEnergyForDuet";
    uint64_t v8 = v1;
    if (!v1)
    {
      uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
    }
    v10[1] = @"BLMLogType";
    v11[0] = v8;
    v11[1] = &unk_1EF450610;
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
    if (!v1) {

    }
    unsigned int v7 = PLBatteryLifeMonitorGenericDuetQuery(v4);
  }

  return v7;
}

id PLBatteryLifeMonitorReportBatteryCapacityForCoreDuet()
{
  void v11[2] = *MEMORY[0x1E4F143B8];
  v0 = PLFDefaultsValueForKey();
  int v1 = [v0 BOOLValue];

  if (v1)
  {
    NSLog(&cfstr_DuetToPowerlog.isa);
    v10[0] = @"BLMEnergyReferenceDate";
    double v2 = [MEMORY[0x1E4F1C9C8] date];
    v10[1] = @"BLMBatteryCapacity";
    v11[0] = v2;
    int v3 = NSNumber;
    +[PLModelingUtilities defaultBatteryEnergyCapacity];
    uint64_t v4 = objc_msgSend(v3, "numberWithDouble:");
    v11[1] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  }
  else
  {
    uint64_t v8 = @"BLMBatteryCapacity";
    id v6 = NSNumber;
    +[PLModelingUtilities defaultBatteryEnergyCapacity];
    double v2 = objc_msgSend(v6, "numberWithDouble:");
    double v9 = v2;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  }

  return v5;
}

uint64_t PLBatteryLifeMonitorReportDiscretionaryBudgetForDuet()
{
  return +[PLModelingUtilities duetDiscretionaryBudget];
}

id PLBuildUsageSnapshot()
{
  v0 = objc_opt_new();
  return v0;
}

id PLBuildEnergyBucket()
{
  v0 = objc_opt_new();
  [v0 setLevel:1];
  return v0;
}

id PLBuildEnergyBucketTillNow()
{
  v0 = objc_opt_new();
  int v1 = objc_opt_new();
  [v1 setLevel:1];

  return v1;
}

void __didReceiveNotification_block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if ([*(id *)(a1 + 40) caseInsensitiveCompare:@"com.apple.energybudgetingdebug.quickEnergySnapshots"])
  {
    if ([*(id *)(a1 + 40) caseInsensitiveCompare:@"com.apple.energybudgetingdebug.queryPowerlog"])
    {
      if ([*(id *)(a1 + 40) caseInsensitiveCompare:@"com.apple.energybudgetingdebug.generateEnergyReport"])
      {
        if (![*(id *)(a1 + 40) caseInsensitiveCompare:@"com.apple.energybudgetingdebug.discretionaryIntervals"])
        {
          unsigned int v7 = PLLogDiscretionaryEnergyMonitor();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v23 = 0;
            _os_log_impl(&dword_1A11A5000, v7, OS_LOG_TYPE_INFO, "DEBUG OUTPUT: Discretionary Intervals: ", v23, 2u);
          }

          int v3 = [v2 intervalManager];
          [v3 logDiscretionaryIntervals];
          goto LABEL_36;
        }
        if (![*(id *)(a1 + 40) caseInsensitiveCompare:@"com.apple.energybudgetingdebug.lastPowerlogEnergy"])
        {
          uint64_t v8 = [v2 lastPowerlogResponse];
          [v2 getPowerlogEnergySum:v8];
          double v10 = v9 * 1000.0;

          int v3 = [NSNumber numberWithDouble:v10];
          v11 = @"com.apple.energybudgetingdebug.lastPowerlogEnergy";
          goto LABEL_35;
        }
        if (![*(id *)(a1 + 40) caseInsensitiveCompare:@"com.apple.energybudgetingdebug.lastPowerlogTimestamp"])
        {
          v12 = [v2 powerlogTimestampLast];
          [v12 timeIntervalSince1970];
          double v14 = v13;

          int v3 = [NSNumber numberWithDouble:v14];
          v11 = @"com.apple.energybudgetingdebug.lastPowerlogTimestamp";
          goto LABEL_35;
        }
        if ([*(id *)(a1 + 40) caseInsensitiveCompare:@"com.apple.energybudgetingdebug.chargingStatus"])
        {
          if ([*(id *)(a1 + 40) caseInsensitiveCompare:@"com.apple.energybudgetingdebug.lastReportedTotalEnergy"])
          {
            if ([*(id *)(a1 + 40) caseInsensitiveCompare:@"com.apple.energybudgetingdebug.lastReportedCPUEnergy"])
            {
              if ([*(id *)(a1 + 40) caseInsensitiveCompare:@"com.apple.energybudgetingdebug.lastReportedNetworkEnergy"])
              {
                if ([*(id *)(a1 + 40) caseInsensitiveCompare:@"com.apple.energybudgetingdebug.accumulatedCPUEnergy"])
                {
                  if ([*(id *)(a1 + 40) caseInsensitiveCompare:@"com.apple.energybudgetingdebug.accumulatedNetworkEnergy"])
                  {
                    int v3 = PLLogDiscretionaryEnergyMonitor();
                    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
                      __didReceiveNotification_block_invoke_cold_1();
                    }
                    goto LABEL_36;
                  }
                  [v2 accumulatedNetworkEnergy];
                  int v3 = [NSNumber numberWithDouble:v22 * 1000.0];
                  v11 = @"com.apple.energybudgetingdebug.accumulatedNetworkEnergy";
                }
                else
                {
                  [v2 accumulatedCPUEnergy];
                  int v3 = [NSNumber numberWithDouble:v21 * 1000.0];
                  v11 = @"com.apple.energybudgetingdebug.accumulatedCPUEnergy";
                }
              }
              else
              {
                [v2 lastReportedNetworkEnergy];
                int v3 = [NSNumber numberWithDouble:v20 * 1000.0];
                v11 = @"com.apple.energybudgetingdebug.lastReportedNetworkEnergy";
              }
            }
            else
            {
              [v2 lastReportedCPUEnergy];
              int v3 = [NSNumber numberWithDouble:v19 * 1000.0];
              v11 = @"com.apple.energybudgetingdebug.lastReportedCPUEnergy";
            }
          }
          else
          {
            [v2 lastReportedTotalEnergy];
            int v3 = [NSNumber numberWithDouble:v18 * 1000.0];
            v11 = @"com.apple.energybudgetingdebug.lastReportedTotalEnergy";
          }
LABEL_35:
          [v2 setStateForNotification:v11 withState:v3];
LABEL_36:

          goto LABEL_37;
        }
        v15 = NSNumber;
        v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v2, "isCharging"));
        double v17 = objc_msgSend(v15, "numberWithInt:", objc_msgSend(v16, "intValue"));
        [v2 setStateForNotification:@"com.apple.energybudgetingdebug.chargingStatus" withState:v17];
      }
      else
      {
        id v6 = PLLogDiscretionaryEnergyMonitor();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v24 = 0;
          _os_log_impl(&dword_1A11A5000, v6, OS_LOG_TYPE_INFO, "DEBUG OUTPUT: Generating energyReport ...: ", v24, 2u);
        }

        [v2 generateEnergyReport];
      }
    }
    else
    {
      uint64_t v5 = PLLogDiscretionaryEnergyMonitor();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)double v25 = 0;
        _os_log_impl(&dword_1A11A5000, v5, OS_LOG_TYPE_INFO, "DEBUG OUTPUT: Querying powerlog for discretionary energy ...: ", v25, 2u);
      }

      [v2 queryPowerlogForDiscretionaryEnergy];
    }
  }
  else
  {
    uint64_t v4 = PLLogDiscretionaryEnergyMonitor();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11A5000, v4, OS_LOG_TYPE_INFO, "DEBUG OUTPUT: Quick energy snapshots: ", buf, 2u);
    }

    [v2 logQuickEnergySnapshots];
  }
LABEL_37:
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_11(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_12(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_13(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1A11B513C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __clientInterface_block_invoke()
{
  clientInterface_interface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF4553D0];
  return MEMORY[0x1F41817F8]();
}

PPSTelemetryIdentifier *PerfPowerTelemetryCreateIdentifier(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v3 UTF8String];
  id v6 = v4;
  uint64_t v7 = [v6 UTF8String];

  return +[PPSClientDonation createIdentifierForSubsystem:v5 category:v7];
}

uint64_t PerfPowerTelemetrySendEvent(uint64_t a1, uint64_t a2)
{
  return +[PPSClientDonation sendEventWithIdentifier:a1 payload:a2];
}

PPSTelemetryIdentifier *perfpowertelemetry_create_identifier(uint64_t a1, uint64_t a2)
{
  return +[PPSClientDonation createIdentifierForSubsystem:a1 category:a2];
}

uint64_t perfpowertelemetry_send_event(uint64_t a1, uint64_t a2)
{
  return +[PPSClientDonation sendEventWithIdentifier:a1 payload:a2];
}

void sub_1A11B81DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PLLogRegisteredAggregateEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = +[PLClientLogAggregator sharedInstance];
  uint64_t v9 = objc_msgSend(v8, "aggregateForClientID_async:eventName:eventDictionary:configuration:", a1, a2, a3, a4);

  return v9;
}

id __aggregationBlockForType_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (a2)
  {
    id v6 = NSNumber;
    [a2 floatValue];
    float v8 = v7;
    [v5 floatValue];
    *(float *)&double v10 = v8 + v9;
    id v11 = [v6 numberWithFloat:v10];
  }
  else
  {
    id v11 = v4;
  }
  v12 = v11;

  return v12;
}

id __aggregationBlockForType_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (a2)
  {
    id v6 = NSNumber;
    [a2 floatValue];
    float v8 = v7;
    [v5 floatValue];
    if (v8 >= *(float *)&v9) {
      *(float *)&double v9 = v8;
    }
    id v10 = [v6 numberWithFloat:v9];
  }
  else
  {
    id v10 = v4;
  }
  id v11 = v10;

  return v11;
}

id __aggregationBlockForType_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (a2)
  {
    id v6 = NSNumber;
    [a2 floatValue];
    float v8 = v7;
    [v5 floatValue];
    if (v8 < *(float *)&v9) {
      *(float *)&double v9 = v8;
    }
    id v10 = [v6 numberWithFloat:v9];
  }
  else
  {
    id v10 = v4;
  }
  id v11 = v10;

  return v11;
}

id __aggregationBlockForType_block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v4)
  {
    if (v5)
    {
      float v7 = NSNumber;
      [v4 floatValue];
      float v9 = v8;
      [v6 floatValue];
      id v11 = [v7 numberWithDouble:(float)(v9 + v10) * 0.5];
    }
    else
    {
      id v11 = v4;
    }
  }
  else
  {
    id v11 = v5;
  }
  v12 = v11;

  return v12;
}

id logHandleBatteryUIExternalData()
{
  if (logHandleBatteryUIExternalData_onceToken != -1) {
    dispatch_once(&logHandleBatteryUIExternalData_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)logHandleBatteryUIExternalData__logHandle;
  return v0;
}

uint64_t __logHandleBatteryUIExternalData_block_invoke()
{
  logHandleBatteryUIExternalData__logHandle = (uint64_t)os_log_create("com.apple.batteryui", "externaldata");
  return MEMORY[0x1F41817F8]();
}

uint64_t batteryUIHasNoteworthyInformation()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v0 = PLConfigureBUIQueryNoteworthyInformation();
  int v1 = PLRunBUIQuery(v0);
  id v2 = logHandleBatteryUIExternalData();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    float v8 = v0;
    __int16 v9 = 2112;
    float v10 = v1;
    _os_log_impl(&dword_1A11A5000, v2, OS_LOG_TYPE_DEFAULT, "config: %@, queryResult: %@", (uint8_t *)&v7, 0x16u);
  }

  id v3 = logHandleBatteryUIExternalData();
  id v4 = v3;
  if (v1)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      float v8 = v1;
      _os_log_impl(&dword_1A11A5000, v4, OS_LOG_TYPE_DEFAULT, "valid queryResult=%@", (uint8_t *)&v7, 0xCu);
    }

    id v4 = [v1 objectForKeyedSubscript:@"hasNoteworthyInformation"];
    uint64_t v5 = [v4 BOOLValue];
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      batteryUIHasNoteworthyInformation_cold_1(v4);
    }
    uint64_t v5 = 0;
  }

  return v5;
}

void sub_1A11BA060(_Unwind_Exception *a1)
{
}

void sub_1A11BAC20(_Unwind_Exception *a1)
{
}

void sub_1A11BB0F0(_Unwind_Exception *a1)
{
}

void sub_1A11BB57C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
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

uint64_t PLShouldLogEvent(void *a1)
{
  if (+[PLClientLogger isMessageOnDeviceDisabled]) {
    return 0;
  }
  id v2 = +[PLClientLogger sharedInstance];
  int v3 = [v2 blockedPermissionForClientID:0 withKey:a1 withType:@"Post" withTimeout:0];

  id v4 = +[PLClientLogger sharedInstance];
  int v5 = [v4 clientDebug];

  if (v3 == 1)
  {
    if (!v5) {
      return 1;
    }
    id v6 = PLLogClientLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      PLShouldLogEvent_cold_1();
    }
    uint64_t v7 = 1;
    goto LABEL_11;
  }
  if (!v5) {
    return 0;
  }
  id v6 = PLLogClientLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    PLShouldLogEvent_cold_2();
  }
  uint64_t v7 = 0;
LABEL_11:

  return v7;
}

void PLLogEvent(void *a1, void *a2)
{
  if (!+[PLClientLogger isMessageOnDeviceDisabled])
  {
    PLLogRegisteredEvent(0, a1, a2);
  }
}

void PLLogRegisteredEventFilterByInterval(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  if (+[PLClientLogger isMessageOnDeviceDisabled]
    || !a2
    || !a3)
  {
    return;
  }
  id v12 = a2;
  float v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:a3 copyItems:1];
  __int16 v9 = +[PLClientLogger sharedInstance];
  int v10 = [v9 shouldLogNowForClientID:a1 withKey:v12 withPayload:v8 withFilterInterval:a4];

  if (v10 == 1)
  {
    uint64_t v11 = +[PLClientLogger sharedInstance];
    [v11 logLaterForClientID:a1 withKey:v12 withFilterInterval:a4];
    goto LABEL_9;
  }
  if (!v10)
  {
    uint64_t v11 = +[PLClientLogger sharedInstance];
    [v11 logWithCurrentDateForClientID:a1 withKey:v12 withPayload:v8];
LABEL_9:
  }
}

uint64_t PLQueryRegistered(int a1, __CFString *a2, void *a3)
{
  if (!+[PLClientLogger isMessageOnDeviceDisabled])
  {
    uint64_t v7 = @"unknownQuery;";
    if (a2) {
      uint64_t v7 = a2;
    }
    float v8 = NSString;
    __int16 v9 = v7;
    id v10 = a3;
    uint64_t v11 = a2;
    [v8 stringWithFormat:@"com.apple.PLQueryRegistered.%d.%@.start", a1, v9];
    objc_claimAutoreleasedReturnValue();
    PLADClientAddValueForScalarKey();
    [NSString stringWithFormat:@"com.apple.PLQueryRegistered.%d.%@.queryTime", a1, v9];
    objc_claimAutoreleasedReturnValue();
    PLADMonotonicTimeGetCurrent();
  }
  return 0;
}

void PLTalkToPowerlogHelper(int a1)
{
  id v2 = +[PLClientLogger sharedInstance];
  [v2 setTalkToPowerlogHelper:a1 != 0];
}

void PLForceBatching(int a1)
{
  id v2 = +[PLClientLogger sharedInstance];
  [v2 setForceBatching:a1 != 0];
}

void PLBatchDropMessages(int a1)
{
  id v2 = +[PLClientLogger sharedInstance];
  [v2 setBatchDropMessages:a1 != 0];
}

void PLMovePowerlogsToCR()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Starting powerlog copy to Crash Reporter", v0, 2u);
  }
  PLCrashMoverCopyPowerlog();
}

void OUTLINED_FUNCTION_5_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_8_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_11_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x2Au);
}

uint64_t PLADClientAddValueForScalarKey()
{
  return MEMORY[0x1F41071E0]();
}

uint64_t PLADPushTimeIntervalForDistributionKeySinceStartTime()
{
  return MEMORY[0x1F4107230]();
}

double PLBatteryGaugeVersion()
{
  return 1.0;
}

id queryPowerlog(void *a1)
{
  id v1 = a1;
  PLTalkToPowerlogHelper(1);
  id v2 = (void *)PLQueryRegistered(48, @"PLBatteryGaugeQuery", v1);

  id v3 = v2;
  return v3;
}

uint64_t PLBatteryGaugeStartTracing(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  [v6 timeIntervalSince1970];
  double v8 = v7;

  uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v10 = [NSNumber numberWithDouble:v8];
  [v9 setObject:v10 forKey:@"time"];

  [v9 setObject:&unk_1EF4508B0 forKey:@"battery_gauge_event"];
  if (a1)
  {
    uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%d", a1);
    [v9 setObject:v11 forKey:@"pid"];
  }
  if (a2)
  {
    id v12 = [NSString stringWithUTF8String:a2];
    [v9 setObject:v12 forKey:@"bundle_id"];
  }
  if (a3)
  {
    double v13 = [NSString stringWithUTF8String:a3];
    [v9 setObject:v13 forKey:@"process_name"];
  }
  double v14 = queryPowerlog(v9);
  v15 = [v14 objectForKeyedSubscript:&unk_1EF4508C8];
  v16 = [v15 objectForKeyedSubscript:@"return_value"];
  uint64_t v17 = [v16 intValue];

  return v17;
}

uint64_t PLBatteryGaugeStopTracing(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  [v6 timeIntervalSince1970];
  double v8 = v7;

  uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v10 = [NSNumber numberWithDouble:v8];
  [v9 setObject:v10 forKey:@"time"];

  [v9 setObject:&unk_1EF4508E0 forKey:@"battery_gauge_event"];
  if (a1)
  {
    uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%d", a1);
    [v9 setObject:v11 forKey:@"pid"];
  }
  if (a2)
  {
    id v12 = [NSString stringWithUTF8String:a2];
    [v9 setObject:v12 forKey:@"bundle_id"];
  }
  if (a3)
  {
    double v13 = [NSString stringWithUTF8String:a3];
    [v9 setObject:v13 forKey:@"process_name"];
  }
  double v14 = queryPowerlog(v9);
  v15 = [v14 objectForKeyedSubscript:&unk_1EF4508C8];
  v16 = [v15 objectForKeyedSubscript:@"return_value"];
  uint64_t v17 = [v16 intValue];

  return v17;
}

uint64_t PLBatteryGaugePauseTracing(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  [v6 timeIntervalSince1970];
  double v8 = v7;

  uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v10 = [NSNumber numberWithDouble:v8];
  [v9 setObject:v10 forKey:@"time"];

  [v9 setObject:&unk_1EF4508F8 forKey:@"battery_gauge_event"];
  if (a1)
  {
    uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%d", a1);
    [v9 setObject:v11 forKey:@"pid"];
  }
  if (a2)
  {
    id v12 = [NSString stringWithUTF8String:a2];
    [v9 setObject:v12 forKey:@"bundle_id"];
  }
  if (a3)
  {
    double v13 = [NSString stringWithUTF8String:a3];
    [v9 setObject:v13 forKey:@"process_name"];
  }
  double v14 = queryPowerlog(v9);
  v15 = [v14 objectForKeyedSubscript:&unk_1EF4508C8];
  v16 = [v15 objectForKeyedSubscript:@"return_value"];
  uint64_t v17 = [v16 intValue];

  return v17;
}

uint64_t PLBatteryGaugeResumeTracing(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  [v6 timeIntervalSince1970];
  double v8 = v7;

  uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v10 = [NSNumber numberWithDouble:v8];
  [v9 setObject:v10 forKey:@"time"];

  [v9 setObject:&unk_1EF450910 forKey:@"battery_gauge_event"];
  if (a1)
  {
    uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%d", a1);
    [v9 setObject:v11 forKey:@"pid"];
  }
  if (a2)
  {
    id v12 = [NSString stringWithUTF8String:a2];
    [v9 setObject:v12 forKey:@"bundle_id"];
  }
  if (a3)
  {
    double v13 = [NSString stringWithUTF8String:a3];
    [v9 setObject:v13 forKey:@"process_name"];
  }
  double v14 = queryPowerlog(v9);
  v15 = [v14 objectForKeyedSubscript:&unk_1EF4508C8];
  v16 = [v15 objectForKeyedSubscript:@"return_value"];
  uint64_t v17 = [v16 intValue];

  return v17;
}

uint64_t PLBatteryGaugeStartMetricMonitor(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  [v6 timeIntervalSince1970];
  double v8 = v7;

  uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v10 = [NSNumber numberWithDouble:v8];
  [v9 setObject:v10 forKey:@"time"];

  [v9 setObject:&unk_1EF4508B0 forKey:@"battery_gauge_event"];
  if (a1)
  {
    uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%d", a1);
    [v9 setObject:v11 forKey:@"pid"];
  }
  if (a2)
  {
    id v12 = [NSString stringWithUTF8String:a2];
    [v9 setObject:v12 forKey:@"bundle_id"];
  }
  if (a3)
  {
    double v13 = [NSString stringWithUTF8String:a3];
    [v9 setObject:v13 forKey:@"process_name"];
  }
  double v14 = [MEMORY[0x1E4F89CE0] defaultConfiguration];
  [v14 setMode:2];
  [v14 setUpdateInterval:0.2];
  [v14 setUpdateDelegate:0];
  [v14 setIncludeBackBoardUsage:1];
  v15 = objc_alloc_init(MetricDelegate);
  v16 = (void *)delegate;
  delegate = (uint64_t)v15;

  id v17 = objc_alloc(MEMORY[0x1E4F89CD8]);
  id v29 = 0;
  uint64_t v18 = [v17 initWithConfiguration:v14 delegate:delegate error:&v29];
  id v19 = v29;
  double v20 = *(void **)monitor;
  *(void *)monitor = v18;

  if (a1)
  {
    id v28 = v19;
    int v21 = [monitor startMonitoringProcessWithPID:a1 error:&v28];
    id v22 = v28;

    if (v21)
    {
      pid2monitor = a1;
      goto LABEL_14;
    }
  }
  else
  {
    if (!a3)
    {
      id v22 = v19;
      goto LABEL_14;
    }
    v23 = *(void **)monitor;
    v24 = [NSString stringWithUTF8String:a3];
    id v27 = v19;
    LODWORD(v23) = [v23 startMonitoringProcessWithName:v24 error:&v27];
    id v22 = v27;

    if (v23)
    {
LABEL_14:
      uint64_t v25 = 0;
      goto LABEL_15;
    }
  }
  uint64_t v25 = 0xFFFFFFFFLL;
LABEL_15:

  return v25;
}

id PLBatteryGaugeGetMetricMonitorSnapshot()
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v68 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v0 = [monitor collectMetricsOnDemand];
  id v1 = [v0 processMetrics];
  id v2 = [NSNumber numberWithInt:pid2monitor];
  id v3 = [v1 objectForKeyedSubscript:v2];
  uint64_t v4 = [v3 applicationState];
  [v4 doubleValue];
  double v6 = v5;

  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  double v7 = [v0 processMetrics];
  double v8 = [v7 allKeys];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v72 objects:v98 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    double v11 = 0.0;
    uint64_t v12 = *(void *)v73;
    double v13 = 0.0;
    double v14 = 0.0;
    double v15 = 0.0;
    double v16 = 0.0;
    double v17 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v73 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v19 = *(void *)(*((void *)&v72 + 1) + 8 * i);
        if (v6 != 8.0)
        {
          int v20 = [*(id *)(*((void *)&v72 + 1) + 8 * i) intValue];
          if (v20 != pid2monitor) {
            continue;
          }
        }
        int v21 = [v0 processMetrics];
        id v22 = [v21 objectForKeyedSubscript:v19];
        v23 = [v22 cpuCost];
        [v23 doubleValue];
        double v17 = v17 + v24;

        uint64_t v25 = [v0 processMetrics];
        v26 = [v25 objectForKeyedSubscript:v19];
        id v27 = [v26 gpuCost];
        [v27 doubleValue];
        double v16 = v16 + v28;

        id v29 = [v0 processMetrics];
        v30 = [v29 objectForKeyedSubscript:v19];
        v31 = [v30 networkCost];
        [v31 doubleValue];
        double v15 = v15 + v32;

        v33 = [v0 processMetrics];
        v34 = [v33 objectForKeyedSubscript:v19];
        v35 = [v34 locationCost];
        [v35 doubleValue];
        double v14 = v14 + v36;

        v37 = [v0 processMetrics];
        v38 = [v37 objectForKeyedSubscript:v19];
        v39 = [v38 energyCost];
        [v39 doubleValue];
        double v13 = v13 + v40;

        v41 = [v0 processMetrics];
        v42 = [v41 objectForKeyedSubscript:v19];
        v43 = [v42 energyOverhead];
        [v43 doubleValue];
        double v11 = v11 + v44;
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v72 objects:v98 count:16];
    }
    while (v10);
  }
  else
  {
    double v11 = 0.0;
    double v13 = 0.0;
    double v14 = 0.0;
    double v15 = 0.0;
    double v16 = 0.0;
    double v17 = 0.0;
  }

  v96[0] = @"cost";
  v45 = [NSNumber numberWithDouble:v13];
  v97[0] = v45;
  v96[1] = @"overhead";
  v46 = [NSNumber numberWithDouble:v11];
  v97[1] = v46;
  v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v97 forKeys:v96 count:2];

  v94[0] = @"cost";
  v47 = [NSNumber numberWithDouble:v17];
  v94[1] = @"overhead";
  v95[0] = v47;
  v95[1] = &unk_1EF450928;
  v70 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v95 forKeys:v94 count:2];

  v92[0] = @"cost";
  v48 = [NSNumber numberWithDouble:v16];
  v92[1] = @"overhead";
  v93[0] = v48;
  v93[1] = &unk_1EF450928;
  v69 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:v92 count:2];

  v90[0] = @"cost";
  v49 = [NSNumber numberWithDouble:v15];
  v90[1] = @"overhead";
  v91[0] = v49;
  v50 = [NSNumber numberWithDouble:v11];
  v91[1] = v50;
  v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:2];

  v88[0] = @"cost";
  v51 = [NSNumber numberWithDouble:v14];
  v88[1] = @"overhead";
  v89[0] = v51;
  v89[1] = &unk_1EF450928;
  v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:v88 count:2];

  v86[0] = @"cost";
  v52 = [NSNumber numberWithDouble:v6];
  v86[1] = @"overhead";
  v87[0] = v52;
  v87[1] = &unk_1EF450928;
  v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:v86 count:2];

  v84[0] = @"cost";
  v53 = NSNumber;
  v54 = [v0 displayCost];
  [v54 doubleValue];
  v55 = objc_msgSend(v53, "numberWithDouble:");
  v84[1] = @"overhead";
  v85[0] = v55;
  v85[1] = &unk_1EF450928;
  v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:v84 count:2];

  if (v6 != 8.0)
  {

    v56 = &unk_1EF450BD0;
  }
  v82[0] = @"cost";
  v57 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v0, "thermalPressure"));
  v82[1] = @"overhead";
  v83[0] = v57;
  v83[1] = &unk_1EF450928;
  v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:v82 count:2];

  v80[0] = @"cost";
  v58 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v0, "inducedThermalPressure"));
  v80[1] = @"overhead";
  v81[0] = v58;
  v81[1] = &unk_1EF450928;
  v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v81 forKeys:v80 count:2];

  v78[0] = &unk_1EF4508E0;
  v78[1] = &unk_1EF450940;
  v79[0] = v71;
  v79[1] = v70;
  v78[2] = &unk_1EF450958;
  v78[3] = &unk_1EF450970;
  v79[2] = v69;
  v79[3] = v56;
  v78[4] = &unk_1EF450988;
  v78[5] = &unk_1EF4509A0;
  v79[4] = v67;
  v79[5] = v66;
  v78[6] = &unk_1EF4509B8;
  v78[7] = &unk_1EF4509D0;
  v79[6] = v65;
  v79[7] = v64;
  v78[8] = &unk_1EF4509E8;
  v79[8] = v59;
  v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:v78 count:9];
  v76 = @"usage_data";
  v77 = v60;
  v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
  v62 = [NSNumber numberWithInt:pid2monitor];
  [v68 setObject:v61 forKeyedSubscript:v62];

  return v68;
}

uint64_t PLBatteryGaugeStartTracingForPid(uint64_t a1)
{
  if (_os_feature_enabled_impl())
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "metric monitor feature enabled", v3, 2u);
    }
    return PLBatteryGaugeStartMetricMonitor(a1, 0, 0);
  }
  else
  {
    return PLBatteryGaugeStartTracing(a1, 0, 0);
  }
}

uint64_t PLBatteryGaugeStartTracingForBundleId(uint64_t a1)
{
  uint64_t v2 = _os_feature_enabled_impl();
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "metric monitor feature enabled", v4, 2u);
    }
    return PLBatteryGaugeStartMetricMonitor(0, a1, 0);
  }
  else
  {
    return PLBatteryGaugeStartTracing(v2, a1, 0);
  }
}

uint64_t PLBatteryGaugeStartTracingForProcessName(uint64_t a1)
{
  uint64_t v2 = _os_feature_enabled_impl();
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "metric monitor feature enabled", v4, 2u);
    }
    return PLBatteryGaugeStartMetricMonitor(0, 0, a1);
  }
  else
  {
    return PLBatteryGaugeStartTracing(v2, 0, a1);
  }
}

uint64_t PLBatteryGaugeStopTracingForPid(uint64_t a1)
{
  if (_os_feature_enabled_impl())
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "metric monitor feature enabled", v3, 2u);
    }
    [monitor stopMonitoring];
    return 0;
  }
  else
  {
    return PLBatteryGaugeStopTracing(a1, 0, 0);
  }
}

uint64_t PLBatteryGaugeStopTracingForBundleId(uint64_t a1)
{
  uint64_t v2 = _os_feature_enabled_impl();
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "metric monitor feature enabled", v4, 2u);
    }
    [monitor stopMonitoring];
    return 0;
  }
  else
  {
    return PLBatteryGaugeStopTracing(v2, a1, 0);
  }
}

uint64_t PLBatteryGaugeStopTracingForProcessName(uint64_t a1)
{
  uint64_t v2 = _os_feature_enabled_impl();
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "metric monitor feature enabled", v4, 2u);
    }
    [monitor stopMonitoring];
    return 0;
  }
  else
  {
    return PLBatteryGaugeStopTracing(v2, 0, a1);
  }
}

uint64_t PLBatteryGaugePauseTracingForPid(uint64_t a1)
{
  if (_os_feature_enabled_impl())
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "metric monitor feature enabled", v3, 2u);
    }
    [monitor stopMonitoring];
    return 0;
  }
  else
  {
    return PLBatteryGaugePauseTracing(a1, 0, 0);
  }
}

uint64_t PLBatteryGaugePauseTracingForBundleId(uint64_t a1)
{
  uint64_t v2 = _os_feature_enabled_impl();
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "metric monitor feature enabled", v4, 2u);
    }
    [monitor stopMonitoring];
    return 0;
  }
  else
  {
    return PLBatteryGaugePauseTracing(v2, a1, 0);
  }
}

uint64_t PLBatteryGaugePauseTracingForProcessName(uint64_t a1)
{
  uint64_t v2 = _os_feature_enabled_impl();
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "metric monitor feature enabled", v4, 2u);
    }
    [monitor stopMonitoring];
    return 0;
  }
  else
  {
    return PLBatteryGaugePauseTracing(v2, 0, a1);
  }
}

uint64_t PLBatteryGaugeResumeTracingForPid(uint64_t a1)
{
  if (_os_feature_enabled_impl())
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "metric monitor feature enabled", v3, 2u);
    }
    return PLBatteryGaugeStartMetricMonitor(a1, 0, 0);
  }
  else
  {
    return PLBatteryGaugeResumeTracing(a1, 0, 0);
  }
}

uint64_t PLBatteryGaugeResumeTracingForBundleId(uint64_t a1)
{
  uint64_t v2 = _os_feature_enabled_impl();
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "metric monitor feature enabled", v4, 2u);
    }
    return PLBatteryGaugeStartMetricMonitor(0, a1, 0);
  }
  else
  {
    return PLBatteryGaugeResumeTracing(v2, a1, 0);
  }
}

uint64_t PLBatteryGaugeResumeTracingForProcessName(uint64_t a1)
{
  uint64_t v2 = _os_feature_enabled_impl();
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "metric monitor feature enabled", v4, 2u);
    }
    return PLBatteryGaugeStartMetricMonitor(0, 0, a1);
  }
  else
  {
    return PLBatteryGaugeResumeTracing(v2, 0, a1);
  }
}

id PLBatteryGaugeGetSnapshot()
{
  if (_os_feature_enabled_impl()) {
    PLBatteryGaugeGetMetricMonitorSnapshot();
  }
  else {
  v0 = queryPowerlog(&unk_1EF450BF8);
  }
  return v0;
}

id getContainerPath()
{
  if (getContainerPath_onceToken != -1) {
    dispatch_once(&getContainerPath_onceToken, &__block_literal_global_7);
  }
  v0 = (void *)getContainerPath_containerPath;
  return v0;
}

void __getContainerPath_block_invoke()
{
  v0 = (void *)container_create_or_lookup_system_group_paths();
  if (v0)
  {
    id v1 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    uint64_t v2 = [v1 objectForKeyedSubscript:@"systemgroup.com.apple.powerlog"];
    id v3 = (void *)getContainerPath_containerPath;
    getContainerPath_containerPath = v2;
  }
}

id shortUUIDString()
{
  v0 = [MEMORY[0x1E4F29128] UUID];
  id v1 = [v0 UUIDString];

  if ((unint64_t)[v1 length] >= 8)
  {
    uint64_t v2 = objc_msgSend(v1, "substringFromIndex:", objc_msgSend(v1, "length") - 8);
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

id dateFormatter()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  id v1 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US_POSIX"];
  [v0 setDateFormat:@"yyyy-MM-dd_HH-mm"];
  uint64_t v2 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  [v0 setTimeZone:v2];

  id v3 = [v1 objectForKey:*MEMORY[0x1E4F1C3E0]];
  [v0 setCalendar:v3];

  [v0 setLocale:v1];
  return v0;
}

uint64_t PLMarkFileAsPurgeable(void *a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = a2 | 0x10005;
  id v3 = a1;
  int v4 = open((const char *)[v3 UTF8String], 0);
  if (v4 < 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      PLMarkFileAsPurgeable_cold_1((uint64_t)v3);
    }
    goto LABEL_7;
  }
  int v5 = v4;
  int v6 = ffsctl(v4, 0xC0084A44uLL, &v9, 0);
  close(v5);
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      PLMarkFileAsPurgeable_cold_2((uint64_t)v3, &v9, v6);
    }
LABEL_7:
    uint64_t v7 = 0;
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v11 = v3;
    __int16 v12 = 2048;
    uint64_t v13 = a2;
    _os_log_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Client Framework -- Marked %@ purgeable with urgency: %llu", buf, 0x16u);
  }
  uint64_t v7 = 1;
LABEL_11:

  return v7;
}

id PLCopyDB(void *a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v44 = v3;
    __int16 v45 = 2112;
    id v46 = v4;
    _os_log_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Starting copy of dB: %@ to dst: %@\n", buf, 0x16u);
  }
  int v5 = objc_opt_new();
  v41 = 0;
  ppDb = 0;
  id v6 = v4;
  int v7 = sqlite3_open((const char *)[v6 UTF8String], &ppDb);
  if (v7)
  {
    PLADClientAddValueForScalarKey();
    BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v8) {
      PLCopyDB_cold_3(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    uint64_t v16 = 2;
  }
  else
  {
    uint64_t v16 = 0;
  }
  id v17 = v3;
  if (sqlite3_open_v2((const char *)[v17 UTF8String], &v41, 1, 0))
  {
    uint64_t v16 = 1;
    PLADClientAddValueForScalarKey();
    BOOL v18 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v18)
    {
      PLCopyDB_cold_2(v18, v19, v20, v21, v22, v23, v24, v25);
      uint64_t v16 = 1;
    }
  }
  else if (!v7)
  {
    if (sqlite3_file_control(ppDb, 0, 102, v41))
    {
      PLADClientAddValueForScalarKey();
      BOOL v26 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v26) {
        PLCopyDB_cold_1(v26, v27, v28, v29, v30, v31, v32, v33);
      }
      uint64_t v16 = 3;
    }
    else
    {
      uint64_t v16 = 0;
    }
  }
  sqlite3_exec(ppDb, "pragma journal_mode=delete", 0, 0, 0);
  if (v41) {
    sqlite3_close(v41);
  }
  if (ppDb) {
    sqlite3_close(ppDb);
  }
  v34 = [MEMORY[0x1E4F28CB8] defaultManager];
  v35 = [NSString stringWithFormat:@"%@-shm", v6];
  [v34 removeItemAtPath:v35 error:0];

  if (!v16)
  {
    [v5 setObject:v6 forKey:@"path"];
    double v36 = getpwnam("mobile");
    id v37 = v6;
    int v38 = chown((const char *)[v37 fileSystemRepresentation], v36->pw_uid, v36->pw_gid);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v44) = v38;
      _os_log_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "PLCopyPowerlog file chown success = %d", buf, 8u);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "PLCopyPowerlog file copy status success", buf, 2u);
    }
    if ([v37 hasPrefix:@"/var/mobile/Library/Logs/CrashReporter/"]) {
      PLMarkFileAsPurgeable(v37, 512);
    }
  }
  v39 = [NSNumber numberWithUnsignedInt:v16];
  [v5 setObject:v39 forKey:@"status"];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v44 = v5;
    _os_log_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "PLCopyPowerlog output: %@", buf, 0xCu);
  }

  return v5;
}

double PLGetPowerlogDuration(void *a1)
{
  uint64_t v6 = 0;
  int v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  ppDb = 0;
  id v1 = a1;
  if (!sqlite3_open((const char *)[v1 UTF8String], &ppDb))
  {
    id v2 = [NSString stringWithFormat:@"SELECT MAX(timestamp) - MIN(timestamp) from PLBatteryAgent_EventBackward_Battery;"];
    [v2 UTF8String];
    sqlite3_exec_b();
  }
  if (ppDb) {
    sqlite3_close(ppDb);
  }
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void sub_1A11BE378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __PLGetPowerlogDuration_block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = sqlite3_column_double(a2, 0);
  return 0;
}

id PLCopyQuarantineDB(void *a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = getContainerPath();
  double v3 = [v2 stringByAppendingString:@"/Library/BatteryLife/CurrentPowerlog.PLSQL"];

  double v4 = PLGetPowerlogDuration(v3);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v49 = v4;
    _os_log_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "PLCopyPowerlog: main log duration = %f", buf, 0xCu);
  }
  if (v4 >= 21600.0)
  {
    v34 = 0;
    goto LABEL_31;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "PLCopyPowerlog: Powerlog is short! Looking in quarantine...", buf, 2u);
  }
  int v5 = getContainerPath();
  uint64_t v6 = [v5 stringByAppendingString:@"/Library/BatteryLife/Quarantine/"];

  id v7 = [MEMORY[0x1E4F1C9C8] distantPast];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  double v40 = (void *)v6;
  uint64_t v9 = [v8 contentsOfDirectoryAtPath:v6 error:0];

  id obj = v9;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (!v10)
  {
    uint64_t v28 = v7;
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    v34 = 0;
LABEL_29:

    goto LABEL_30;
  }
  uint64_t v11 = v10;
  double v36 = v3;
  id v37 = v1;
  int v38 = 0;
  v39 = 0;
  uint64_t v12 = *(void *)v44;
  uint64_t v13 = @"PLSQL";
  do
  {
    uint64_t v14 = 0;
    uint64_t v41 = v11;
    do
    {
      if (*(void *)v44 != v12) {
        objc_enumerationMutation(obj);
      }
      uint64_t v15 = *(void **)(*((void *)&v43 + 1) + 8 * v14);
      uint64_t v16 = [v15 pathExtension];
      int v17 = [v16 isEqualToString:v13];

      if (v17)
      {
        BOOL v18 = v13;
        uint64_t v19 = [v40 stringByAppendingString:v15];
        uint64_t v20 = [MEMORY[0x1E4F28CB8] defaultManager];
        uint64_t v21 = [v20 attributesOfItemAtPath:v19 error:0];

        uint64_t v22 = [v21 fileModificationDate];
        uint64_t v23 = [v22 laterDate:v7];
        uint64_t v24 = v7;
        int v25 = [v23 isEqualToDate:v22];

        if (v25)
        {
          id v26 = v19;

          id v27 = v15;
          id v7 = v22;

          int v38 = v26;
          v39 = v27;
        }
        else
        {
          id v7 = v24;
        }

        uint64_t v13 = v18;
        uint64_t v11 = v41;
      }
      ++v14;
    }
    while (v11 != v14);
    uint64_t v11 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
  }
  while (v11);
  uint64_t v28 = v7;

  uint64_t v29 = v38;
  if (v38)
  {
    double v3 = v36;
    id v1 = v37;
    uint64_t v30 = v39;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v49 = *(double *)&v38;
      _os_log_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "PLCopyPowerlog: quarantineSrcPath = %@", buf, 0xCu);
    }
    id obj = [v37 stringByAppendingPathComponent:v39];
    uint64_t v31 = PLCopyDB(v38, obj);
    uint64_t v32 = (void *)[v31 mutableCopy];

    uint64_t v33 = [v32 objectForKeyedSubscript:@"status"];
    if (v33)
    {

      v34 = 0;
    }
    else
    {
      v34 = [v32 objectForKeyedSubscript:@"path"];

      if (v34)
      {
        v34 = [v32 objectForKeyedSubscript:@"path"];
      }
    }

    goto LABEL_29;
  }
  v34 = 0;
  double v3 = v36;
  id v1 = v37;
  uint64_t v30 = v39;
LABEL_30:

LABEL_31:
  return v34;
}

void *PLCopyPowerlog(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (!v1 || [(__CFString *)v1 isEqualToString:&stru_1EF44BBB0])
  {

    id v2 = @"/var/mobile/Library/Logs/CrashReporter/";
  }
  double v3 = dateFormatter();
  double v4 = [MEMORY[0x1E4F1C9C8] date];
  int v5 = [v3 stringFromDate:v4];

  uint64_t v6 = NSString;
  id v7 = shortUUIDString();
  uint64_t v8 = [v6 stringWithFormat:@"powerlog_%@_%@.PLSQL", v5, v7];

  uint64_t v9 = getContainerPath();
  uint64_t v10 = [v9 stringByAppendingString:@"/Library/BatteryLife/CurrentPowerlog.PLSQL"];

  if ([(__CFString *)v2 hasSuffix:@".PLSQL"])
  {
    uint64_t v11 = v2;
  }
  else
  {
    uint64_t v11 = [(__CFString *)v2 stringByAppendingPathComponent:v8];
  }
  uint64_t v12 = v11;
  uint64_t v13 = PLCopyDB(v10, v11);
  uint64_t v14 = (void *)[v13 mutableCopy];

  uint64_t v15 = [(__CFString *)v12 stringByDeletingLastPathComponent];
  uint64_t v16 = PLCopyQuarantineDB(v15);

  if (v16) {
    [v14 setObject:v16 forKeyedSubscript:@"quarantine_path"];
  }

  return v14;
}

uint64_t PLResetPowerlog()
{
  id v0 = (void *)MEMORY[0x1E4F1CB10];
  id v1 = getContainerPath();
  id v2 = [v0 fileURLWithPath:v1];

  if (v2)
  {
    double v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v17 = 0;
    unsigned int v4 = [v3 removeItemAtURL:v2 error:&v17];
    id v5 = v17;

    if (v5) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = v4;
    }
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v16 = 0;
        _os_log_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Performed powerlog reset as requested", v16, 2u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      PLResetPowerlog_cold_2();
    }
  }
  else
  {
    BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v7) {
      PLResetPowerlog_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t PLCopyExtendedPersistenceLog(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (!v1 || [(__CFString *)v1 isEqualToString:&stru_1EF44BBB0])
  {

    id v2 = @"/var/mobile/Library/Logs/CrashReporter/";
  }
  double v3 = dateFormatter();
  unsigned int v4 = [MEMORY[0x1E4F1C9C8] date];
  id v5 = [v3 stringFromDate:v4];

  uint64_t v6 = NSString;
  BOOL v7 = shortUUIDString();
  uint64_t v8 = [v6 stringWithFormat:@"log_%@_%@.EPSQL", v5, v7];

  uint64_t v9 = getContainerPath();
  uint64_t v10 = [v9 stringByAppendingString:@"/Library/PerfPowerTelemetry/ExtendedPersistence/CurrentLog.EPSQL"];

  if ([(__CFString *)v2 hasSuffix:@".EPSQL"])
  {
    uint64_t v11 = v2;
  }
  else
  {
    uint64_t v11 = [(__CFString *)v2 stringByAppendingPathComponent:v8];
  }
  uint64_t v12 = v11;
  uint64_t v13 = PLCopyDB(v10, v11);

  return v13;
}

uint64_t PLCopyCleanEnergyLog(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (!v1 || [(__CFString *)v1 isEqualToString:&stru_1EF44BBB0])
  {

    id v2 = @"/var/mobile/Library/Logs/CrashReporter/";
  }
  double v3 = dateFormatter();
  unsigned int v4 = [MEMORY[0x1E4F1C9C8] date];
  id v5 = [v3 stringFromDate:v4];

  uint64_t v6 = NSString;
  BOOL v7 = shortUUIDString();
  uint64_t v8 = [v6 stringWithFormat:@"log_%@_%@.CESQL", v5, v7];

  uint64_t v9 = getContainerPath();
  uint64_t v10 = [v9 stringByAppendingString:@"/Library/PerfPowerTelemetry/CleanEnergy/CurrentCleanEnergyDB.CESQL"];

  if ([(__CFString *)v2 hasSuffix:@".CESQL"])
  {
    uint64_t v11 = v2;
  }
  else
  {
    uint64_t v11 = [(__CFString *)v2 stringByAppendingPathComponent:v8];
  }
  uint64_t v12 = v11;
  uint64_t v13 = PLCopyDB(v10, v11);

  return v13;
}

uint64_t PLCopyXcodeOrganizerLog(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (!v1 || [(__CFString *)v1 isEqualToString:&stru_1EF44BBB0])
  {

    id v2 = @"/var/mobile/Library/Logs/CrashReporter/";
  }
  double v3 = dateFormatter();
  unsigned int v4 = [MEMORY[0x1E4F1C9C8] date];
  id v5 = [v3 stringFromDate:v4];

  uint64_t v6 = NSString;
  BOOL v7 = shortUUIDString();
  uint64_t v8 = [v6 stringWithFormat:@"log_%@_%@.XCSQL", v5, v7];

  uint64_t v9 = getContainerPath();
  uint64_t v10 = [v9 stringByAppendingString:@"/Library/PerfPowerTelemetry/XcodeOrganizer/CurrentXcodeOrganizerDB.XCSQL"];

  if ([(__CFString *)v2 hasSuffix:@".XCSQL"])
  {
    uint64_t v11 = v2;
  }
  else
  {
    uint64_t v11 = [(__CFString *)v2 stringByAppendingPathComponent:v8];
  }
  uint64_t v12 = v11;
  uint64_t v13 = PLCopyDB(v10, v11);

  return v13;
}

uint64_t dropTable(void *a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  errmsg = 0;
  ppDb = 0;
  id v5 = v3;
  if (sqlite3_open_v2((const char *)[v5 UTF8String], &ppDb, 2, 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      dropTable_cold_5();
    }
    goto LABEL_15;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Configure the page cache", buf, 2u);
  }
  if (!sqlite3_exec(ppDb, "PRAGMA cache_size = 50;", 0, 0, &errmsg))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Configure the cache_spill", buf, 2u);
    }
    if (sqlite3_exec(ppDb, "PRAGMA cache_spill = 256;", 0, 0, &errmsg))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        dropTable_cold_3((uint64_t)&errmsg, v13, v14, v15, v16, v17, v18, v19);
      }
      goto LABEL_14;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v4;
      _os_log_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Drop %@", buf, 0xCu);
    }
    uint64_t v22 = [NSString stringWithFormat:@"DROP TABLE '%@';", v4];
    uint64_t v23 = ppDb;
    id v24 = v22;
    if (sqlite3_exec(v23, (const char *)[v24 UTF8String], 0, 0, &errmsg))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        dropTable_cold_2();
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Vacuum", buf, 2u);
      }
      if (!sqlite3_exec(ppDb, (const char *)[@"PRAGMA incremental_vacuum;" UTF8String],
              0,
              0,
              &errmsg))
      {
        uint64_t v20 = 1;
        goto LABEL_28;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        dropTable_cold_1((uint64_t)&errmsg, v25, v26, v27, v28, v29, v30, v31);
      }
    }
    sqlite3_free(errmsg);
    uint64_t v20 = 0;
LABEL_28:
    sqlite3_close(ppDb);

    goto LABEL_16;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    dropTable_cold_4((uint64_t)&errmsg, v6, v7, v8, v9, v10, v11, v12);
  }
LABEL_14:
  sqlite3_free(errmsg);
  sqlite3_close(ppDb);
LABEL_15:
  uint64_t v20 = 0;
LABEL_16:

  return v20;
}

void *PLSysdiagnoseCopyBackgroundProcessingLog(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v1 = PLCopyBackgroundProcessingLog(a1);
  id v2 = (void *)[v1 mutableCopy];
  id v3 = [v2 objectForKeyedSubscript:@"status"];
  int v4 = [v3 intValue];

  if (!v4)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v6 = [v2 objectForKeyedSubscript:@"path"];
    if (dropTable(v6, @"BackgroundProcessing_DASActivityLifecycle_24_5")) {
      int v7 = dropTable(v6, @"BackgroundProcessing_DASPoliciesBlockingCriteria_24_5");
    }
    else {
      int v7 = 0;
    }
    double v8 = CFAbsoluteTimeGetCurrent();
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67109376;
      v10[1] = v7;
      __int16 v11 = 2048;
      double v12 = v8 - Current;
      _os_log_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "BGSQL DROP Success: %d Execution Time: %f", (uint8_t *)v10, 0x12u);
    }
    if ((v7 & 1) == 0) {
      [v2 setObject:&unk_1EF450A00 forKeyedSubscript:@"status"];
    }
  }
  return v2;
}

uint64_t PLCopyBackgroundProcessingLog(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (!v1 || [(__CFString *)v1 isEqualToString:&stru_1EF44BBB0])
  {

    id v2 = @"/var/mobile/Library/Logs/CrashReporter/";
  }
  id v3 = dateFormatter();
  int v4 = [MEMORY[0x1E4F1C9C8] date];
  id v5 = [v3 stringFromDate:v4];

  uint64_t v6 = NSString;
  int v7 = shortUUIDString();
  double v8 = [v6 stringWithFormat:@"log_%@_%@.BGSQL", v5, v7];

  uint64_t v9 = getContainerPath();
  uint64_t v10 = [v9 stringByAppendingString:@"/Library/PerfPowerTelemetry/BackgroundProcessing/CurrentBackgroundProcessingDB.BGSQL"];

  if ([(__CFString *)v2 hasSuffix:@".BGSQL"])
  {
    __int16 v11 = v2;
  }
  else
  {
    __int16 v11 = [(__CFString *)v2 stringByAppendingPathComponent:v8];
  }
  double v12 = v11;
  uint64_t v13 = PLCopyDB(v10, v11);

  return v13;
}

void handleXPCEvent(void *a1, uint64_t a2, char a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  if (([v5 isEqualToString:@"ThermalMonitor"] & 1) != 0
    || (double Current = 0.0, [v5 isEqualToString:@"XPCCacheFlush"]))
  {
    double Current = CFAbsoluteTimeGetCurrent();
  }
  id v7 = v5;
  double v8 = dispatch_queue_create((const char *)[v7 UTF8String], 0);
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  dispatch_time_t v10 = dispatch_time(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __handleXPCEvent_block_invoke;
  block[3] = &unk_1E5A461D0;
  id v11 = v7;
  id v24 = v11;
  char v26 = a3;
  double v12 = v9;
  uint64_t v25 = v12;
  dispatch_after(v10, v8, block);
  dispatch_time_t v13 = dispatch_time(0, 1000000000 * a2);
  intptr_t v14 = dispatch_semaphore_wait(v12, v13);
  if (v14)
  {
    intptr_t v15 = v14;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v28 = v11;
      __int16 v29 = 2048;
      intptr_t v30 = v15;
      _os_log_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%@ semaphore timeout %lu", buf, 0x16u);
    }
  }
  if (([v11 isEqualToString:@"ThermalMonitor"] & 1) != 0
    || (v16 = [v11 isEqualToString:@"XPCCacheFlush"], double v17 = 0.0, v16))
  {
    double v17 = CFAbsoluteTimeGetCurrent();
  }
  float v18 = v17 - Current;
  LODWORD(v9) = vcvtps_s32_f32(v18 * 1000.0);
  uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([v11 isEqualToString:@"ThermalMonitor"])
  {
    uint64_t v20 = [NSNumber numberWithInt:v9];
    uint64_t v21 = @"collectLogsTime";
LABEL_14:
    [v19 setObject:v20 forKeyedSubscript:v21];

    goto LABEL_15;
  }
  if ([v11 isEqualToString:@"XPCCacheFlush"])
  {
    uint64_t v20 = [NSNumber numberWithInt:v9];
    uint64_t v21 = @"flushCacheTime";
    goto LABEL_14;
  }
LABEL_15:
  if (([v11 isEqualToString:@"ThermalMonitor"] & 1) != 0
    || [v11 isEqualToString:@"XPCCacheFlush"])
  {
    id v22 = v19;
    AnalyticsSendEventLazy();
  }
}

void __handleXPCEvent_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = PLQueryRegistered(1, *(__CFString **)(a1 + 32), MEMORY[0x1E4F1CC08]);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412546;
    uint64_t v5 = v3;
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%@ result: %@", (uint8_t *)&v4, 0x16u);
  }
  if (*(unsigned char *)(a1 + 48)) {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
}

id __handleXPCEvent_block_invoke_134(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void *PLSysdiagnoseCopyPowerlog(void *a1, unint64_t a2)
{
  uint64_t v3 = a2 >> 2;
  handleXPCEvent(@"ThermalMonitor", a2 >> 2, 0);
  handleXPCEvent(@"XPCCacheFlush", v3, 1);
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v5 = PLCopyPowerlog(a1);
  float v6 = CFAbsoluteTimeGetCurrent() - Current;
  LODWORD(v3) = vcvtps_s32_f32(v6 * 1000.0);
  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v8 = [NSNumber numberWithInt:v3];
  [v7 setObject:v8 forKeyedSubscript:@"copyPowerlogTime"];

  id v9 = v7;
  AnalyticsSendEventLazy();

  return v5;
}

id __PLSysdiagnoseCopyPowerlog_block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t PLSysdiagnoseCopyLogs(void *a1, unint64_t a2, const __CFArray *a3)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a2 >> 2;
  handleXPCEvent(@"ThermalMonitor", a2 >> 2, 0);
  handleXPCEvent(@"XPCCacheFlush", v5, 1);
  if (a3 && CFArrayGetCount(a3) && CFArrayGetCount(a3))
  {
    unint64_t v7 = 0;
    unsigned __int8 v38 = 0;
    uint64_t v37 = *MEMORY[0x1E4F28390];
    uint64_t v8 = MEMORY[0x1E4F14500];
    *(void *)&long long v6 = 138412546;
    long long v36 = v6;
    do
    {
      unsigned int valuePtr = 0;
      ValueAtIndex = CFArrayGetValueAtIndex(a3, v7);
      CFTypeID v10 = CFGetTypeID(ValueAtIndex);
      if (v10 == CFNumberGetTypeID())
      {
        CFNumberGetValue((CFNumberRef)ValueAtIndex, kCFNumberIntType, &valuePtr);
        uint64_t v11 = valuePtr;
        if (valuePtr < 5)
        {
          double Current = CFAbsoluteTimeGetCurrent();
          switch((int)v11)
          {
            case 0:
              CFDictionaryRef v13 = (const __CFDictionary *)PLCopyPowerlog(a1);
              intptr_t v14 = @"PLSQL";
              goto LABEL_16;
            case 1:
              CFDictionaryRef v13 = (const __CFDictionary *)PLSysdiagnoseCopyExtendedPersistenceLog(a1);
              intptr_t v14 = @"EPSQL";
              goto LABEL_16;
            case 2:
              CFDictionaryRef v13 = (const __CFDictionary *)PLCopyCleanEnergyLog(a1);
              intptr_t v14 = @"CESQL";
              goto LABEL_16;
            case 4:
              CFDictionaryRef v13 = (const __CFDictionary *)PLSysdiagnoseCopyBackgroundProcessingLog(a1);
              intptr_t v14 = @"BGSQL";
LABEL_16:
              float v15 = CFAbsoluteTimeGetCurrent() - Current;
              LODWORD(v3) = vcvtps_s32_f32(v15 * 1000.0);
              CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v13, @"status");
              if (Value
                && (CFNumberRef v17 = Value, v18 = CFGetTypeID(Value), v18 == CFNumberGetTypeID())
                && (*(_DWORD *)buf = 0, CFNumberGetValue(v17, kCFNumberIntType, buf))
                && !*(_DWORD *)buf)
              {
                id v28 = (void *)CFDictionaryGetValue(v13, @"path");
                __int16 v29 = (void *)MEMORY[0x1E4F28CB8];
                id v30 = v28;
                uint64_t v31 = [v29 defaultManager];
                uint64_t v32 = [v31 attributesOfItemAtPath:v30 error:0];

                float v19 = -1.0;
                if (v32)
                {
                  uint64_t v33 = [v32 objectForKeyedSubscript:v37];

                  if (v33)
                  {
                    v34 = [v32 objectForKeyedSubscript:v37];
                    float v19 = (float)[v34 longLongValue] * 0.00000095367;
                  }
                }

                unsigned __int8 v38 = 1;
                uint64_t v20 = 1;
              }
              else
              {
                float v19 = 0.0;
                if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v36;
                  v51 = v14;
                  __int16 v52 = 1024;
                  int v53 = v3;
                  _os_log_error_impl(&dword_1A11A5000, v8, OS_LOG_TYPE_ERROR, "Copying %@ data failed, time taken = %d", buf, 0x12u);
                }
                uint64_t v20 = 0;
              }
              objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v36);
              uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
              [(__CFString *)v21 setObject:v14 forKeyedSubscript:@"name"];
              id v22 = [NSNumber numberWithUnsignedChar:v20];
              [(__CFString *)v21 setObject:v22 forKeyedSubscript:@"status"];

              *(float *)&double v23 = v19;
              id v24 = [NSNumber numberWithFloat:v23];
              [(__CFString *)v21 setObject:v24 forKeyedSubscript:@"size"];

              uint64_t v25 = [NSNumber numberWithInt:v3];
              [(__CFString *)v21 setObject:v25 forKeyedSubscript:@"copyingTime"];

              if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v51 = v21;
                _os_log_impl(&dword_1A11A5000, v8, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
              }
              char v26 = [NSNumber numberWithUnsignedInt:v11];
              [(__CFString *)v21 setObject:v26 forKeyedSubscript:@"name"];

              uint64_t v41 = MEMORY[0x1E4F143A8];
              uint64_t v42 = 3221225472;
              long long v43 = __copyLogAndUpdateSuccess_block_invoke;
              long long v44 = &unk_1E5A461F8;
              long long v45 = v21;
              uint64_t v27 = v21;
              AnalyticsSendEventLazy();
              CFRelease(v13);

              break;
            default:
              break;
          }
        }
        else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          PLSysdiagnoseCopyLogs_cold_1(&v46, v7, &v47);
        }
      }
      else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        PLSysdiagnoseCopyLogs_cold_1(&v48, v7, &v49);
      }
      ++v7;
    }
    while (v7 < CFArrayGetCount(a3));
  }
  else
  {
    return 0;
  }
  return v38;
}

void PLSysdiagnoseTimeSensitivePhase()
{
  if (PLSysdiagnoseTimeSensitivePhase_onceToken != -1) {
    dispatch_once(&PLSysdiagnoseTimeSensitivePhase_onceToken, &__block_literal_global_140);
  }
  if (PLSysdiagnoseTimeSensitivePhase_hasBaseband)
  {
    handleXPCEvent(@"BBLogsForSysdiagnose", 1, 0);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v0 = 0;
      _os_log_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "PLSysdiagnoseTimeSensitivePhase returned", v0, 2u);
    }
  }
}

void __PLSysdiagnoseTimeSensitivePhase_block_invoke()
{
  CFBooleanRef v0 = (const __CFBoolean *)MGCopyAnswer();
  PLSysdiagnoseTimeSensitivePhase_hasBaseband = CFBooleanGetValue(v0) != 0;
  CFRelease(v0);
}

uint64_t copyFiles(void *a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v30 = 0;
  id v24 = v3;
  long long v6 = [v5 contentsOfDirectoryAtPath:v3 error:&v30];
  id v7 = v30;
  double v23 = v4;
  int v8 = [v4 hasPrefix:@"/var/mobile/Library/Logs/CrashReporter/"];
  if (v6)
  {
    int v9 = v8;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = v6;
    uint64_t v10 = [obj countByEnumeratingWithState:&v26 objects:v35 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v21 = v6;
      uint64_t v12 = *(void *)v27;
      while (2)
      {
        uint64_t v13 = 0;
        intptr_t v14 = v7;
        do
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v26 + 1) + 8 * v13);
          int v16 = [v24 stringByAppendingPathComponent:v15];
          CFNumberRef v17 = [v23 stringByAppendingPathComponent:v15];
          id v25 = v14;
          char v18 = [v5 copyItemAtPath:v16 toPath:v17 error:&v25];
          id v7 = v25;

          if ((v18 & 1) == 0)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v32 = v24;
              __int16 v33 = 2112;
              id v34 = v7;
              _os_log_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Error copying for srcDir %@ : %@", buf, 0x16u);
            }

            uint64_t v19 = 0;
            goto LABEL_16;
          }
          if (v9) {
            PLMarkFileAsPurgeable(v17, 512);
          }

          ++v13;
          intptr_t v14 = v7;
        }
        while (v11 != v13);
        uint64_t v11 = [obj countByEnumeratingWithState:&v26 objects:v35 count:16];
        if (v11) {
          continue;
        }
        break;
      }
      uint64_t v19 = 1;
LABEL_16:
      long long v6 = v21;
    }
    else
    {
      uint64_t v19 = 1;
    }
  }
  else
  {
    uint64_t v19 = 1;
  }

  return v19;
}

void copyArchivesToCrashMover()
{
  CFBooleanRef v0 = getContainerPath();
  id v1 = [v0 stringByAppendingString:@"/Library/BatteryLife/Archives/"];

  if ((copyFiles(v1, @"/var/mobile/Library/Logs/CrashReporter/") & 1) == 0
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Archive copying failed", v2, 2u);
  }
}

void copyQuarantinesToCrashMover()
{
  CFBooleanRef v0 = getContainerPath();
  id v1 = [v0 stringByAppendingString:@"/Library/BatteryLife/Quarantine/"];

  if ((copyFiles(v1, @"/var/mobile/Library/Logs/CrashReporter/") & 1) == 0
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Quarantine copying failed", v2, 2u);
  }
}

void copyUpgradeLogsToCrashMover()
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  CFBooleanRef v0 = getContainerPath();
  id v1 = [v0 stringByAppendingString:@"/Library/BatteryLife/UpgradeLogs/MajorVersion"];

  id v2 = getContainerPath();
  id v3 = [v2 stringByAppendingString:@"/Library/BatteryLife/UpgradeLogs/MinorVersion"];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v27 = 0;
  uint64_t v5 = [v4 contentsOfDirectoryAtPath:v1 error:&v27];
  id v21 = v27;

  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v41 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    int v9 = MEMORY[0x1E4F14500];
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = [v1 stringByAppendingPathComponent:*(void *)(*((void *)&v28 + 1) + 8 * v10)];
        if (copyFiles(v11, @"/var/mobile/Library/Logs/CrashReporter/"))
        {
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
            copyUpgradeLogsToCrashMover_cold_5(&v39, (uint64_t)v11, &v40);
          }
        }
        else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          copyUpgradeLogsToCrashMover_cold_6(&v37, (uint64_t)v11, &v38);
        }

        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v41 count:16];
    }
    while (v7);
  }

  if (v21 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    copyUpgradeLogsToCrashMover_cold_4();
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v22 = v21;
  uint64_t v13 = [v12 contentsOfDirectoryAtPath:v3 error:&v22];
  id v20 = v22;

  uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v24;
    CFNumberRef v17 = MEMORY[0x1E4F14500];
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v19 = objc_msgSend(v3, "stringByAppendingPathComponent:", *(void *)(*((void *)&v23 + 1) + 8 * v18), v20);
        if (copyFiles(v19, @"/var/mobile/Library/Logs/CrashReporter/"))
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            copyUpgradeLogsToCrashMover_cold_2(&v34, (uint64_t)v19, &v35);
          }
        }
        else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          copyUpgradeLogsToCrashMover_cold_3(&v32, (uint64_t)v19, &v33);
        }

        ++v18;
      }
      while (v15 != v18);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v36 count:16];
    }
    while (v15);
  }

  if (v20 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    copyUpgradeLogsToCrashMover_cold_1();
  }
}

void PLCrashMoverCopyPowerlog()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  getContainerPath();
  CFBooleanRef v0 = (void *)_CFPreferencesCopyValueWithContainer();
  if ([v0 intValue] == 1)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v2) = 0;
      _os_log_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "PLCrashMoverCopyPowerlog starts cache flush", (uint8_t *)&v2, 2u);
    }
    handleXPCEvent(@"XPCCacheFlush", 1000000000, 1);
    id v1 = PLCopyPowerlog(@"/var/mobile/Library/Logs/CrashReporter/");
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v2 = 138412290;
      id v3 = v1;
      _os_log_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "PLCrashMoverCopyPowerlog done copying powerlog : %@", (uint8_t *)&v2, 0xCu);
    }
    CFRelease(v1);
    copyArchivesToCrashMover();
    copyQuarantinesToCrashMover();
    if (_os_feature_enabled_impl()) {
      copyUpgradeLogsToCrashMover();
    }
  }
}

BOOL PLSysdiagnoseCopyBatteryUILogs(void *a1, CFErrorRef *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  BOOL v4 = PLCopyBatteryUIPlists(@"Sysdiagnose", v3);
  if (!v4)
  {
    uint64_t v5 = (void *)[[NSString alloc] initWithFormat:@"Failed to copy files to %@", v3];
    uint64_t v8 = *MEMORY[0x1E4F28568];
    v9[0] = v5;
    CFDictionaryRef v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    if (a2) {
      *a2 = CFErrorCreate(0, @"com.apple.powerlog", 1, v6);
    }
  }
  return v4;
}

void *PLSysdiagnoseCopyExtendedPersistenceLog(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v1 = PLCopyExtendedPersistenceLog(a1);
  int v2 = (void *)[v1 mutableCopy];
  id v3 = [v2 objectForKeyedSubscript:@"status"];
  int v4 = [v3 intValue];

  if (!v4)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    CFDictionaryRef v6 = [v2 objectForKeyedSubscript:@"path"];
    int v7 = dropTable(v6, @"BatteryDataCollection_BDC_AMA_30_1");
    double v8 = CFAbsoluteTimeGetCurrent();
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67109376;
      v10[1] = v7;
      __int16 v11 = 2048;
      double v12 = v8 - Current;
      _os_log_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "EPSQL DROP Success: %d Execution Time: %f", (uint8_t *)v10, 0x12u);
    }
    if ((v7 & 1) == 0) {
      [v2 setObject:&unk_1EF450A00 forKeyedSubscript:@"status"];
    }
  }
  return v2;
}

id __copyLogAndUpdateSuccess_block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

float *OUTLINED_FUNCTION_3_0(float *result, uint64_t a2, void *a3, float a4)
{
  *result = a4;
  *a3 = a2;
  return result;
}

uint64_t PLBatteryUsageUIQuery(__CFString *a1, void *a2)
{
  return PLQueryRegistered(50, a1, a2);
}

id PLConfigureBUIQueryiOS()
{
  CFBooleanRef v0 = [MEMORY[0x1E4F1CA60] dictionary];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __PLConfigureBUIQueryiOS_block_invoke;
  v27[3] = &unk_1E5A46228;
  id v1 = v0;
  id v28 = v1;
  int v2 = (void (**)(void, void))MEMORY[0x1A622E8B0](v27);
  id v3 = PLCalculateEndOfHour();
  int v4 = PLCalculateEndOfDay();
  uint64_t v5 = PLBatteryUsageUIConfiguration(5, v3, 86400.0, 86400.0);
  ((void (**)(void, void *))v2)[2](v2, v5);

  CFDictionaryRef v6 = PLBatteryUsageUIConfiguration(7, v3, 86400.0, 900.0);
  ((void (**)(void, void *))v2)[2](v2, v6);

  int v7 = PLBatteryUsageUIConfiguration(6, v4, 864000.0, 86400.0);
  ((void (**)(void, void *))v2)[2](v2, v7);

  double v8 = PLBatteryUsageUIConfiguration(1, v3, 86400.0, 86400.0);
  ((void (**)(void, void *))v2)[2](v2, v8);

  int v9 = PLBatteryUsageUIConfiguration(1, v3, 86400.0, 3600.0);
  ((void (**)(void, void *))v2)[2](v2, v9);

  uint64_t v10 = PLBatteryUsageUIConfiguration(1, v4, 864000.0, 864000.0);
  ((void (**)(void, void *))v2)[2](v2, v10);

  __int16 v11 = PLBatteryUsageUIConfiguration(1, v4, 864000.0, 86400.0);
  ((void (**)(void, void *))v2)[2](v2, v11);

  double v12 = PLBatteryUsageUIConfiguration(8, v3, 86400.0, 3600.0);
  ((void (**)(void, void *))v2)[2](v2, v12);

  uint64_t v13 = PLBatteryUsageUIConfiguration(8, v4, 864000.0, 86400.0);
  ((void (**)(void, void *))v2)[2](v2, v13);

  uint64_t v14 = PLBatteryUsageUIConfiguration(11, v3, 86400.0, 86400.0);
  ((void (**)(void, void *))v2)[2](v2, v14);

  uint64_t v15 = PLBatteryUsageUIConfiguration(12, v3, 86400.0, 86400.0);
  ((void (**)(void, void *))v2)[2](v2, v15);

  uint64_t v16 = PLBatteryUsageUIConfiguration(13, v3, 86400.0, 86400.0);
  ((void (**)(void, void *))v2)[2](v2, v16);

  CFNumberRef v17 = PLBatteryUsageUIConfiguration(14, v3, 86400.0, 86400.0);
  ((void (**)(void, void *))v2)[2](v2, v17);

  uint64_t v18 = PLBatteryUsageUIConfiguration(15, v3, 86400.0, 86400.0);
  ((void (**)(void, void *))v2)[2](v2, v18);

  if (_os_feature_enabled_impl())
  {
    uint64_t v19 = PLBatteryUsageUIConfiguration(16, v3, 86400.0, 86400.0);
    ((void (**)(void, void *))v2)[2](v2, v19);
  }
  if (_os_feature_enabled_impl())
  {
    id v20 = PLBatteryUsageUIConfiguration(9, v3, 86400.0, 86400.0);
    ((void (**)(void, void *))v2)[2](v2, v20);
  }
  if (_os_feature_enabled_impl()) {
    uint64_t v21 = 10;
  }
  else {
    uint64_t v21 = 0;
  }
  id v22 = PLBatteryUsageUIConfiguration(v21, v3, 86400.0, 86400.0);
  ((void (**)(void, void *))v2)[2](v2, v22);

  if (_os_feature_enabled_impl())
  {
    long long v23 = PLBatteryUsageUIConfiguration(17, v4, 1209600.0, 86400.0);
    ((void (**)(void, void *))v2)[2](v2, v23);
  }
  if (_os_feature_enabled_impl())
  {
    long long v24 = PLBatteryUsageUIConfiguration(21, v3, 86400.0, 86400.0);
    ((void (**)(void, void *))v2)[2](v2, v24);
  }
  id v25 = v1;

  return v25;
}

void __PLConfigureBUIQueryiOS_block_invoke(uint64_t a1, void *a2)
{
  int v2 = *(void **)(a1 + 32);
  id v3 = a2;
  PLBatteryUsageUIKeyForRequest(v3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setObject:v3 forKeyedSubscript:v4];
}

id PLBatteryUsageUIKeyForRequest(void *a1)
{
  id v1 = a1;
  int v2 = [v1 objectForKeyedSubscript:@"enum"];
  id v3 = PLBatteryUsageUIStringForResponseType((int)[v2 intValue]);

  id v4 = PLBatteryUsageUIKeyFromConfiguration(v1);

  if (v4)
  {
    uint64_t v5 = [NSString stringWithFormat:@"%@_%@", v3, v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

id PLCalculateEndOfHour()
{
  CFBooleanRef v0 = [MEMORY[0x1E4F1C9C8] date];
  id v1 = PLCalculateEndOfHourWithDate(v0);

  return v1;
}

id PLCalculateEndOfDay()
{
  CFBooleanRef v0 = [MEMORY[0x1E4F1C9C8] date];
  id v1 = PLCalculateEndOfDayWithDate(v0);

  return v1;
}

id PLBatteryUsageUIConfiguration(uint64_t a1, void *a2, double a3, double a4)
{
  v20[4] = *MEMORY[0x1E4F143B8];
  double v6 = -a3;
  id v7 = a2;
  double v8 = [v7 dateByAddingTimeInterval:v6];
  v19[0] = @"start";
  int v9 = NSNumber;
  [v8 timeIntervalSince1970];
  uint64_t v10 = objc_msgSend(v9, "numberWithDouble:");
  v20[0] = v10;
  v19[1] = @"end";
  __int16 v11 = NSNumber;
  [v7 timeIntervalSince1970];
  double v13 = v12;

  uint64_t v14 = [v11 numberWithDouble:v13];
  v20[1] = v14;
  v19[2] = @"bucket";
  uint64_t v15 = [NSNumber numberWithDouble:a4];
  v20[2] = v15;
  v19[3] = @"enum";
  uint64_t v16 = [NSNumber numberWithInteger:a1];
  v20[3] = v16;
  CFNumberRef v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:4];

  return v17;
}

id PLConfigureBUIQueryWithRangeType(int a1)
{
  int v2 = [MEMORY[0x1E4F1CA60] dictionary];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __PLConfigureBUIQueryWithRangeType_block_invoke;
  v24[3] = &unk_1E5A46228;
  id v3 = v2;
  id v25 = v3;
  id v4 = (void (**)(void, void))MEMORY[0x1A622E8B0](v24);
  uint64_t v5 = PLCalculateEndOfHour();
  PLCalculateEndOfDay();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v6;
  if (a1)
  {
    double v8 = 86400.0;
    id v9 = v6;
    if (a1 == 2)
    {
      double v8 = 864000.0;
      id v9 = v6;
    }
  }
  else
  {
    id v9 = v5;

    double v8 = 10800.0;
  }
  uint64_t v10 = PLBatteryUsageUIConfiguration(1, v9, v8, v8);
  ((void (**)(void, void *))v4)[2](v4, v10);

  __int16 v11 = PLBatteryUsageUIConfiguration(11, v5, 86400.0, 86400.0);
  ((void (**)(void, void *))v4)[2](v4, v11);

  double v12 = PLBatteryUsageUIConfiguration(12, v5, 86400.0, 86400.0);
  ((void (**)(void, void *))v4)[2](v4, v12);

  double v13 = PLBatteryUsageUIConfiguration(13, v5, 86400.0, 86400.0);
  ((void (**)(void, void *))v4)[2](v4, v13);

  uint64_t v14 = PLBatteryUsageUIConfiguration(14, v5, 86400.0, 86400.0);
  ((void (**)(void, void *))v4)[2](v4, v14);

  uint64_t v15 = PLBatteryUsageUIConfiguration(15, v5, 86400.0, 86400.0);
  ((void (**)(void, void *))v4)[2](v4, v15);

  if (_os_feature_enabled_impl())
  {
    uint64_t v16 = PLBatteryUsageUIConfiguration(16, v5, 86400.0, 86400.0);
    ((void (**)(void, void *))v4)[2](v4, v16);
  }
  if (_os_feature_enabled_impl())
  {
    CFNumberRef v17 = PLBatteryUsageUIConfiguration(9, v5, 86400.0, 86400.0);
    ((void (**)(void, void *))v4)[2](v4, v17);
  }
  if (_os_feature_enabled_impl()) {
    uint64_t v18 = 10;
  }
  else {
    uint64_t v18 = 0;
  }
  uint64_t v19 = PLBatteryUsageUIConfiguration(v18, v5, 86400.0, 86400.0);
  ((void (**)(void, void *))v4)[2](v4, v19);

  if (_os_feature_enabled_impl())
  {
    id v20 = PLBatteryUsageUIConfiguration(17, v7, 1209600.0, 86400.0);
    ((void (**)(void, void *))v4)[2](v4, v20);
  }
  if (_os_feature_enabled_impl())
  {
    uint64_t v21 = PLBatteryUsageUIConfiguration(21, v5, 86400.0, 86400.0);
    ((void (**)(void, void *))v4)[2](v4, v21);
  }
  id v22 = v3;

  return v22;
}

void __PLConfigureBUIQueryWithRangeType_block_invoke(uint64_t a1, void *a2)
{
  int v2 = *(void **)(a1 + 32);
  id v3 = a2;
  PLBatteryUsageUIKeyForRequest(v3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setObject:v3 forKeyedSubscript:v4];
}

id PLConfigureBUIQueryNoteworthyInformation()
{
  CFBooleanRef v0 = [MEMORY[0x1E4F1CA60] dictionary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __PLConfigureBUIQueryNoteworthyInformation_block_invoke;
  v14[3] = &unk_1E5A46228;
  id v1 = v0;
  id v15 = v1;
  int v2 = (void (**)(void, void))MEMORY[0x1A622E8B0](v14);
  id v3 = PLCalculateEndOfHour();
  id v4 = PLCalculateEndOfDay();
  uint64_t v5 = PLBatteryUsageUIConfiguration(6, v4, 864000.0, 86400.0);
  ((void (**)(void, void *))v2)[2](v2, v5);

  id v6 = PLBatteryUsageUIConfiguration(1, v3, 86400.0, 86400.0);
  ((void (**)(void, void *))v2)[2](v2, v6);

  id v7 = PLBatteryUsageUIConfiguration(13, v3, 86400.0, 86400.0);
  ((void (**)(void, void *))v2)[2](v2, v7);

  double v8 = PLBatteryUsageUIConfiguration(14, v3, 86400.0, 86400.0);
  ((void (**)(void, void *))v2)[2](v2, v8);

  id v9 = PLBatteryUsageUIConfiguration(15, v3, 86400.0, 86400.0);
  ((void (**)(void, void *))v2)[2](v2, v9);

  uint64_t v10 = PLBatteryUsageUIConfiguration(17, v3, 86400.0, 86400.0);
  ((void (**)(void, void *))v2)[2](v2, v10);

  __int16 v11 = PLBatteryUsageUIConfiguration(18, v3, 86400.0, 86400.0);
  ((void (**)(void, void *))v2)[2](v2, v11);

  id v12 = v1;
  return v12;
}

void __PLConfigureBUIQueryNoteworthyInformation_block_invoke(uint64_t a1, void *a2)
{
  int v2 = *(void **)(a1 + 32);
  id v3 = a2;
  PLBatteryUsageUIKeyForRequest(v3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setObject:v3 forKeyedSubscript:v4];
}

id PLRunBUIQueryWithRangeType(int a1)
{
  id v1 = PLConfigureBUIQueryWithRangeType(a1);
  int v2 = PLQueryRegistered(50, @"BatteryQueryForResponderService", v1);

  return v2;
}

id PLRunBUIQuery(void *a1)
{
  id v1 = a1;
  if (_os_feature_enabled_impl())
  {
    int v2 = logHandle_1();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      PLRunBUIQuery_cold_1(v2);
    }

    id v3 = @"BatteryQueryForResponderService";
  }
  else
  {
    id v3 = @"PLBatteryUIQueryFunctionKey";
  }
  id v4 = PLQueryRegistered(50, v3, v1);

  return v4;
}

BOOL PLGenerateBatteryUIPlist(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = PLConfigureBUIQueryiOS();
  [v2 setObject:v1 forKeyedSubscript:@"requestingService"];

  id v3 = PLRunBUIQuery(v2);
  id v4 = logHandle_1();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412546;
      id v8 = v2;
      __int16 v9 = 2112;
      uint64_t v10 = v3;
      _os_log_impl(&dword_1A11A5000, v5, OS_LOG_TYPE_DEFAULT, "Successfully generated plist with configuration %@ and result %@", (uint8_t *)&v7, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    PLGenerateBatteryUIPlist_cold_1(v5);
  }

  return v3 != 0;
}

BOOL PLCopyBatteryUIPlists(void *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = a1;
  id v5 = PLConfigureBUIQueryiOS();
  [v5 setObject:v4 forKeyedSubscript:@"requestingService"];

  [v5 setObject:v3 forKeyedSubscript:@"plistCopyDestination"];
  id v6 = PLRunBUIQuery(v5);
  int v7 = logHandle_1();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      id v11 = v5;
      __int16 v12 = 2112;
      double v13 = v6;
      _os_log_impl(&dword_1A11A5000, v8, OS_LOG_TYPE_DEFAULT, "Performed successful query and copy with configuration %@ and result %@", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    PLCopyBatteryUIPlists_cold_1();
  }

  return v6 != 0;
}

__CFString *PLBatteryUsageUIStringForResponseType(unint64_t a1)
{
  if (a1 < 0x16 && ((0x27FFFFu >> a1) & 1) != 0)
  {
    id v1 = off_1E5A46248[a1];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown_%lu", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

__CFString *PLBatteryUsageUIStringForQueryRange(double a1)
{
  if (a1 == 864000.0) {
    return @"10d";
  }
  if (a1 == 604800.0) {
    return @"7d";
  }
  if (a1 == 86400.0) {
    return @"24hr";
  }
  if (a1 == 3600.0) {
    return @"1hr";
  }
  return @"UnknownRange";
}

id PLCalculateEndOfHourWithDate(void *a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = logHandle_1();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    PLCalculateEndOfHourWithDate_cold_4();
  }

  id v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v4 = [v3 components:60 fromDate:v1];
  unint64_t v5 = [v4 valueForComponent:32];
  id v6 = logHandle_1();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = [v3 dateFromComponents:v4];
    int v15 = 138412802;
    id v16 = v1;
    __int16 v17 = 2112;
    uint64_t v18 = v14;
    __int16 v19 = 2048;
    unint64_t v20 = v5;
    _os_log_debug_impl(&dword_1A11A5000, v6, OS_LOG_TYPE_DEBUG, "Date: %@ -> %@ -> %ld", (uint8_t *)&v15, 0x20u);
  }
  int v7 = logHandle_1();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    PLCalculateEndOfHourWithDate_cold_2();
  }

  unint64_t v8 = ((v5 % 3) ^ 3) + v5;
  __int16 v9 = logHandle_1();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    PLCalculateEndOfHourWithDate_cold_2();
  }

  [v4 setValue:v8 forComponent:32];
  int v10 = [v3 dateFromComponents:v4];
  id v11 = logHandle_1();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    PLCalculateEndOfHourWithDate_cold_1();
  }

  __int16 v12 = logHandle_1();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v10;
    _os_log_impl(&dword_1A11A5000, v12, OS_LOG_TYPE_DEFAULT, "end of hour: %@", (uint8_t *)&v15, 0xCu);
  }

  return v10;
}

id PLCalculateEndOfDayWithDate(void *a1)
{
  id v1 = (void *)MEMORY[0x1E4F1C9A8];
  id v2 = a1;
  id v3 = [v1 currentCalendar];
  id v4 = objc_opt_new();
  [v4 setHour:0];
  [v4 setMinute:0];
  [v4 setSecond:0];
  unint64_t v5 = [v3 nextDateAfterDate:v2 matchingComponents:v4 options:2];

  return v5;
}

__CFString *PLBatteryUsageUIKeyFromConfiguration(void *a1)
{
  id v1 = a1;
  id v2 = [v1 objectForKeyedSubscript:@"end"];
  [v2 doubleValue];
  double v4 = v3;
  unint64_t v5 = [v1 objectForKeyedSubscript:@"start"];
  [v5 doubleValue];
  double v7 = v4 - v6;

  unint64_t v8 = [v1 objectForKeyedSubscript:@"bucket"];

  [v8 doubleValue];
  double v10 = v9;

  if (v7 / v10 == 1.0)
  {
    if (v7 == 864000.0)
    {
      __int16 v12 = @"10d";
    }
    else if (v7 == 604800.0)
    {
      __int16 v12 = @"7d";
    }
    else if (v7 == 86400.0)
    {
      __int16 v12 = @"24hr";
    }
    else
    {
      __int16 v12 = @"UnknownRange";
      if (v7 == 3600.0) {
        __int16 v12 = @"1hr";
      }
    }
    double v13 = v12;
  }
  else
  {
    if (v7 == 864000.0)
    {
      id v11 = @"10d";
    }
    else if (v7 == 604800.0)
    {
      id v11 = @"7d";
    }
    else if (v7 == 86400.0)
    {
      id v11 = @"24hr";
    }
    else
    {
      id v11 = @"UnknownRange";
      if (v7 == 3600.0) {
        id v11 = @"1hr";
      }
    }
    double v13 = [NSString stringWithFormat:@"%@_%zu", v11, (unint64_t)v10];
  }
  return v13;
}

void sub_1A11C2738(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A11C283C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

PPSTelemetryIdentifier *pps_create_telemetry_identifier(uint64_t a1, uint64_t a2)
{
  return +[PPSClientDonation createIdentifierForSubsystem:a1 category:a2];
}

id containerPath()
{
  if (containerPath_onceToken != -1) {
    dispatch_once(&containerPath_onceToken, &__block_literal_global_9);
  }
  CFBooleanRef v0 = (void *)containerPath_containerPath;
  return v0;
}

void __containerPath_block_invoke()
{
  CFBooleanRef v0 = (void *)container_create_or_lookup_system_group_paths();
  if (v0)
  {
    id v1 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    uint64_t v2 = [v1 objectForKeyedSubscript:@"systemgroup.com.apple.powerlog"];
    double v3 = (void *)containerPath_containerPath;
    containerPath_containerPath = v2;
  }
  else
  {
    NSLog(&cfstr_ErrorFetchingG.isa, @"com.apple.systemcontainer", 1);
  }
}

id PLFDefaultsValueForKey()
{
  containerPath();
  CFBooleanRef v0 = (void *)_CFPreferencesCopyValueWithContainer();
  return v0;
}

void __didReceiveNotification_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_1A11A5000, v0, v1, "DEBUG OUTPUT: Notification name not recognized", v2, v3, v4, v5, v6);
}

void batteryUIHasNoteworthyInformation_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A11A5000, log, OS_LOG_TYPE_ERROR, "invalid queryResult", v1, 2u);
}

void PLShouldLogRegisteredEvent_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_1A11A5000, v0, v1, "PLShouldLogRegisteredEvent: NO", v2, v3, v4, v5, v6);
}

void PLShouldLogRegisteredEvent_cold_2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_1A11A5000, v0, v1, "PLShouldLogRegisteredEvent: YES", v2, v3, v4, v5, v6);
}

void PLShouldLogEvent_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_1A11A5000, v0, v1, "PLShouldLogEvent: YES", v2, v3, v4, v5, v6);
}

void PLShouldLogEvent_cold_2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_1A11A5000, v0, v1, "PLShouldLogEvent: NO", v2, v3, v4, v5, v6);
}

void PLMarkFileAsPurgeable_cold_1(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = __error();
  uint64_t v3 = strerror(*v2);
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  double v7 = v3;
  _os_log_error_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Client Framework --  Failed to mark %@ purgeable - can't open error: %s", (uint8_t *)&v4, 0x16u);
}

void PLMarkFileAsPurgeable_cold_2(uint64_t a1, uint64_t *a2, int a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *a2;
  __int16 v6 = __error();
  double v7 = strerror(*v6);
  int v8 = 138413058;
  uint64_t v9 = a1;
  __int16 v10 = 2048;
  uint64_t v11 = v5;
  __int16 v12 = 1024;
  int v13 = a3;
  __int16 v14 = 2080;
  int v15 = v7;
  _os_log_error_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Client Framework -- Failed to mark %@ purgeable - flags 0x%llx returned %d (%s)", (uint8_t *)&v8, 0x26u);
}

void PLCopyDB_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void PLCopyDB_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void PLCopyDB_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void PLResetPowerlog_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void PLResetPowerlog_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_1A11A5000, MEMORY[0x1E4F14500], v0, "Unable to remove directory during powerlog reset, err: %@", v1, v2, v3, v4, v5);
}

void dropTable_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void dropTable_cold_2()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v2 = 2080;
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to drop %@ data with error %s", v1, 0x16u);
}

void dropTable_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void dropTable_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void dropTable_cold_5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_1A11A5000, MEMORY[0x1E4F14500], v0, "Failed to open database connection at path: %@", v1, v2, v3, v4, v5);
}

void PLSysdiagnoseCopyLogs_cold_1(float *a1, uint64_t a2, void *a3)
{
  OUTLINED_FUNCTION_3_0(a1, a2, a3, 3.852e-34);
  OUTLINED_FUNCTION_1_0(&dword_1A11A5000, MEMORY[0x1E4F14500], v3, "Invalid entry in databases at index %zu", v4);
}

void copyUpgradeLogsToCrashMover_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_1A11A5000, MEMORY[0x1E4F14500], v0, "PowerlogFileUtilities: failed to copy minor upgrade logs with error %@", v1, v2, v3, v4, v5);
}

void copyUpgradeLogsToCrashMover_cold_2(float *a1, uint64_t a2, void *a3)
{
  OUTLINED_FUNCTION_3_0(a1, a2, a3, 5.7779e-34);
  _os_log_debug_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "PowerlogFileUtilities: successfully copied minor upgrade logs, srcPath = %@", v3, 0xCu);
}

void copyUpgradeLogsToCrashMover_cold_3(float *a1, uint64_t a2, void *a3)
{
  OUTLINED_FUNCTION_3_0(a1, a2, a3, 5.7779e-34);
  OUTLINED_FUNCTION_1_0(&dword_1A11A5000, MEMORY[0x1E4F14500], v3, "PowerlogFileUtilities: failed to copy minor upgrade logs, srcPath = %@", v4);
}

void copyUpgradeLogsToCrashMover_cold_4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_1A11A5000, MEMORY[0x1E4F14500], v0, "PowerlogFileUtilities: failed to copy major upgrade logs with error %@", v1, v2, v3, v4, v5);
}

void copyUpgradeLogsToCrashMover_cold_5(float *a1, uint64_t a2, void *a3)
{
  OUTLINED_FUNCTION_3_0(a1, a2, a3, 5.7779e-34);
  _os_log_debug_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "PowerlogFileUtilities: successfully copied major upgrade logs, srcPath = %@", v3, 0xCu);
}

void copyUpgradeLogsToCrashMover_cold_6(float *a1, uint64_t a2, void *a3)
{
  OUTLINED_FUNCTION_3_0(a1, a2, a3, 5.7779e-34);
  OUTLINED_FUNCTION_1_0(&dword_1A11A5000, MEMORY[0x1E4F14500], v3, "PowerlogFileUtilities: failed to copy major upgrade logs, srcPath = %@", v4);
}

void PLRunBUIQuery_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1A11A5000, log, OS_LOG_TYPE_DEBUG, "\"bui_backend_iOS\" feature flag is enabled. Running query via Responder Service...", v1, 2u);
}

void PLGenerateBatteryUIPlist_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A11A5000, log, OS_LOG_TYPE_ERROR, "Failed to generate a new BatteryUI plist", v1, 2u);
}

void PLCopyBatteryUIPlists_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1A11A5000, v0, OS_LOG_TYPE_ERROR, "Failed to copy files to %@", v1, 0xCu);
}

void PLCalculateEndOfHourWithDate_cold_1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1A11A5000, v1, OS_LOG_TYPE_DEBUG, "System hour bucket: %@ -> %@", v2, 0x16u);
}

void PLCalculateEndOfHourWithDate_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A11A5000, v0, v1, "hourNum: %lu", v2, v3, v4, v5, v6);
}

void PLCalculateEndOfHourWithDate_cold_4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A11A5000, v0, v1, "calculating end of hour from %@", v2, v3, v4, v5, v6);
}

uint64_t ADMonotonicTimeGetCurrent()
{
  return MEMORY[0x1F4107228]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1F40D7A98](allocator, domain, code, userInfo);
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

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGCopyAnswerWithError()
{
  return MEMORY[0x1F417CDE8]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGIsDeviceOneOfType()
{
  return MEMORY[0x1F417CE48]();
}

void NSLog(NSString *format, ...)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFPreferencesCopyValueWithContainer()
{
  return MEMORY[0x1F40D8F58]();
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1F40C9CD8]();
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

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1F40CB3A8](a1, *(void *)&a2, *(void *)&a3);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

uint64_t coalition_info_resource_usage()
{
  return MEMORY[0x1F40CB408]();
}

uint64_t container_create_or_lookup_system_group_paths()
{
  return MEMORY[0x1F40CB590]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1F40CBD40](when, delta);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1F40CC0D8](*(void *)&a1, a2, a3, *(void *)&a4);
}

void free(void *a1)
{
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x1F40CC4D8](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
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

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1F40CD650]();
}

uint64_t os_variant_is_darwinos()
{
  return MEMORY[0x1F40CD660]();
}

uint64_t proc_listcoalitions()
{
  return MEMORY[0x1F40CD878]();
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1F40CE078](*(void *)&a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1F4182060](a1);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  MEMORY[0x1F4182098](a1, *(void *)&iCol);
  return result;
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1F41821A8](a1, sql, callback, a4, errmsg);
}

uint64_t sqlite3_exec_b()
{
  return MEMORY[0x1F41821B0]();
}

int sqlite3_file_control(sqlite3 *a1, const char *zDbName, int op, void *a4)
{
  return MEMORY[0x1F41821D0](a1, zDbName, *(void *)&op, a4);
}

void sqlite3_free(void *a1)
{
}

int sqlite3_open(const char *filename, sqlite3 **ppDb)
{
  return MEMORY[0x1F4182278](filename, ppDb);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1F4182280](filename, ppDb, *(void *)&flags, zVfs);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

uint64_t xpc_coalition_copy_info()
{
  return MEMORY[0x1F40CEB60]();
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1F40CEC20](connection);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1F40CEC68](connection, message);
}

uint64_t xpc_connection_send_notification()
{
  return MEMORY[0x1F40CEC70]();
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

uint64_t xpc_connection_set_target_user_session_uid()
{
  return MEMORY[0x1F40CECF0]();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1F40CF288]();
}

uint64_t xpc_user_sessions_enabled()
{
  return MEMORY[0x1F40CF340]();
}

uint64_t xpc_user_sessions_get_foreground_uid()
{
  return MEMORY[0x1F40CF348]();
}