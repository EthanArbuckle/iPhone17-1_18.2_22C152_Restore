@interface CLLogFormatter
- (CLLogFormatter)init;
- (SEL)selectorForType:(id)a3;
- (id)JSONObjectWithType:(const char *)a3 value:(id)a4 info:(os_log_type_info_s *)a5;
- (id)JSONObjectWith_CLAppMonitor_Type__Notification:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_CLBTLEFenceManager_Type__Notification:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_CLBarometerCalibration_Types__Context:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_CLBatteryChargerType:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_CLClientAuthorizationStatus:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_CLClientCorrectiveCompensation:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_CLClientInUseLevel:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_CLClientLocationReferenceFrame:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_CLClientLocationSuitability:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_CLClientManager_Type__AuthorizationRequestType:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_CLClientRegistrationResult:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_CLClientServiceTypeMask:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_CLDaemonLocation:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_CLDaemonLocationPrivate__OriginDevice:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_CLDaemonStatus_Type__Battery:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_CLDaemonStatus_Type__Reachability:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_CLFenceManager_Type__Notification:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_CLLocationDictionaryUtilitiesArrowState:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_CLLocationDictionaryUtilitiesEntityClass:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_CLLocationProvider_Type__MotionDetected:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_CLLocationProvider_Type__Notification:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_CLLocationStreamingGranularity:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_CLLocationType:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_CLMonitoringState:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_CLMotionActivity:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_CLMotionActivity__Confidence:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_CLMotionActivity__Type:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_CLRegionState:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_CLSensorRecorder_Types__DataType:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_CLSimulationLocationDeliveryBehavior:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_CLSimulationLocationRepeatBehavior:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_CLStreamingAwareLocationProviderLocalGPSStateMachine__LocationSourceState:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_CLStreamingAwareLocationProviderLocalGPSStateMachine__WorkoutState:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_CLStreamingAwareLocationProviderNoLocalGPSStateMachine__LocationSourceState:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_CLStreamingAwareLocationProviderStateMachine__LocationSource:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_CLSubHarvesterIdentifier:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_CLTelephonyService_Type__Cell:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_CLWifiService_Type__ScanType:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_CMMotionCoprocessorReply_Log:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_CMWakeGestureCrownOrientation:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_CMWakeGestureState:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_CMWakeGestureWristOrientation:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_Generic:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_IOMessage:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_PSYSyncRestriction:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_PSYSyncSessionType:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_RBSTaskState:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_RTLGestureType:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_RTLState:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_RTLocationOfInterestType:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_RTRoutineMode:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_SYSessionState:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_SqliteResult:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith__CLClientManagerStateTrackerState:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith__CLDaemonStatusStateTrackerState:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith__CLLocationManagerStateTrackerState:(id)a3 info:(os_log_type_info_s *)a4;
- (id)JSONObjectWith_escape_only:(id)a3 info:(os_log_type_info_s *)a4;
- (void)dealloc;
@end

@implementation CLLogFormatter

- (CLLogFormatter)init
{
  v5.receiver = self;
  v5.super_class = (Class)CLLogFormatter;
  v2 = [(CLLogFormatter *)&v5 init];
  if (v2)
  {
    v2->_selectorForType = (NSMutableDictionary *)objc_opt_new();
    v2->_formatterSignature = (NSMethodSignature *)(id)[(id)objc_opt_class() instanceMethodSignatureForSelector:sel_JSONObjectWith_Generic_info_];
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x263EF83A8], DISPATCH_AUTORELEASE_FREQUENCY_NEVER);
    v2->_q = (OS_dispatch_queue *)dispatch_queue_create("CLLogFormatter", v3);
  }
  return v2;
}

- (void)dealloc
{
  self->_selectorForType = 0;
  self->_formatterSignature = 0;

  self->_q = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLLogFormatter;
  [(CLLogFormatter *)&v3 dealloc];
}

- (SEL)selectorForType:(id)a3
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  q = self->_q;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__CLLogFormatter_selectorForType___block_invoke;
  block[3] = &unk_2649A81C0;
  block[5] = a3;
  block[6] = &v11;
  block[4] = self;
  dispatch_sync(q, block);
  v6 = (const char *)v12[3];
  if (!v6)
  {
    v8 = self->_q;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __34__CLLogFormatter_selectorForType___block_invoke_2;
    v9[3] = &unk_2649A81C0;
    v9[5] = a3;
    v9[6] = &v11;
    v9[4] = self;
    dispatch_barrier_sync(v8, v9);
    v6 = (const char *)v12[3];
  }
  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __34__CLLogFormatter_selectorForType___block_invoke(void *a1)
{
  uint64_t result = [((id)objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", a1[5])) pointerValue];
  *(void *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

uint64_t __34__CLLogFormatter_selectorForType___block_invoke_2(uint64_t a1)
{
  uint64_t result = [((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "objectForKeyedSubscript:", *(void *)(a1 + 40))) pointerValue];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v3 = [*(id *)(a1 + 40) stringByReplacingOccurrencesOfString:@":" withString:@"_"];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = NSSelectorFromString((NSString *)[NSString stringWithFormat:@"JSONObjectWith_%@:info:", v3]);
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = sel_JSONObjectWith_Generic_info_;
    }
    uint64_t v4 = [MEMORY[0x263F08D40] valueWithPointer:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
    uint64_t v5 = *(void *)(a1 + 40);
    v6 = *(void **)(*(void *)(a1 + 32) + 8);
    return [v6 setObject:v4 forKeyedSubscript:v5];
  }
  return result;
}

- (id)JSONObjectWithType:(const char *)a3 value:(id)a4 info:(os_log_type_info_s *)a5
{
  v10 = a5;
  id v11 = a4;
  v7 = (void *)[MEMORY[0x263EFF958] invocationWithMethodSignature:self->_formatterSignature];
  [v7 setSelector: -[CLLogFormatter selectorForType:](self, "selectorForType:", [NSString stringWithUTF8String:a3])];
  [v7 setTarget:self];
  [v7 setArgument:&v11 atIndex:2];
  [v7 setArgument:&v10 atIndex:3];
  [v7 invoke];
  v9 = 0;
  [v7 getReturnValue:&v9];
  return v9;
}

- (id)JSONObjectWith_Generic:(id)a3 info:(os_log_type_info_s *)a4
{
  v6[3] = *MEMORY[0x263EF8340];
  v5[0] = @"type";
  v5[1] = @"expected type";
  v6[0] = @"decode failure";
  v6[1] = @"Generic";
  v5[2] = @"raw value";
  v6[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:3];
}

- (id)JSONObjectWith_escape_only:(id)a3 info:(os_log_type_info_s *)a4
{
  v10[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9[0] = @"type";
    v9[1] = @"expected type";
    v10[0] = @"decode failure";
    v10[1] = @"NSString";
    v9[2] = @"raw value";
    v10[2] = a3;
    return (id)[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];
  }
  size_t v5 = strlen((const char *)[a3 UTF8String]);
  if (v5 == [a3 length]) {
    return a3;
  }
  v6 = NSString;
  uint64_t v7 = [a3 UTF8String];

  return (id)[v6 stringWithUTF8String:v7];
}

- (id)JSONObjectWith_CLClientLocationReferenceFrame:(id)a3 info:(os_log_type_info_s *)a4
{
  v8[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v5 = [a3 intValue];
    if (v5 < 3) {
      return (id)*((void *)&off_2649A81E0 + (int)v5);
    }
  }
  v7[0] = @"type";
  v7[1] = @"expected type";
  v8[0] = @"decode failure";
  v8[1] = @"CLClientLocationReferenceFrame";
  v7[2] = @"raw value";
  v8[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (id)JSONObjectWith_CLClientLocationSuitability:(id)a3 info:(os_log_type_info_s *)a4
{
  v8[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v5 = [a3 intValue];
    switch(v5)
    {
      case 1:
        return @"RouteGuidance";
      case 0xFFFF:
        return @"Any";
      case 2:
        return @"Other";
    }
  }
  v7[0] = @"type";
  v7[1] = @"expected type";
  v8[0] = @"decode failure";
  v8[1] = @"CLClientLocationSuitability";
  v7[2] = @"raw value";
  v8[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (id)JSONObjectWith_CLLocationDictionaryUtilitiesEntityClass:(id)a3 info:(os_log_type_info_s *)a4
{
  v8[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v5 = [a3 intValue];
    if (v5 < 0xA) {
      return (id)*((void *)&off_2649A81F8 + (int)v5);
    }
  }
  v7[0] = @"type";
  v7[1] = @"expected type";
  v8[0] = @"decode failure";
  v8[1] = @"CLClientAuthorizationStatus";
  v7[2] = @"raw value";
  v8[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (id)JSONObjectWith_CLLocationDictionaryUtilitiesArrowState:(id)a3 info:(os_log_type_info_s *)a4
{
  v8[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v5 = [a3 intValue];
    if (v5 < 4) {
      return (id)*((void *)&off_2649A8248 + (int)v5);
    }
  }
  v7[0] = @"type";
  v7[1] = @"expected type";
  v8[0] = @"decode failure";
  v8[1] = @"CLClientAuthorizationStatus";
  v7[2] = @"raw value";
  v8[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (id)JSONObjectWith_CLClientAuthorizationStatus:(id)a3 info:(os_log_type_info_s *)a4
{
  v8[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v5 = [a3 intValue];
    if (v5 < 5) {
      return (id)*((void *)&off_2649A8268 + (int)v5);
    }
  }
  v7[0] = @"type";
  v7[1] = @"expected type";
  v8[0] = @"decode failure";
  v8[1] = @"CLClientAuthorizationStatus";
  v7[2] = @"raw value";
  v8[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (id)JSONObjectWith_CLClientCorrectiveCompensation:(id)a3 info:(os_log_type_info_s *)a4
{
  v8[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v5 = [a3 intValue];
    if (v5 < 3) {
      return (id)*((void *)&off_2649A8290 + (int)v5);
    }
  }
  v7[0] = @"type";
  v7[1] = @"expected type";
  v8[0] = @"decode failure";
  v8[1] = @"CLClientCorrectiveCompensation";
  v7[2] = @"raw value";
  v8[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (id)JSONObjectWith_CLRegionState:(id)a3 info:(os_log_type_info_s *)a4
{
  v8[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v5 = [a3 intValue];
    if (v5 < 3) {
      return (id)*((void *)&off_2649A82A8 + (int)v5);
    }
  }
  v7[0] = @"type";
  v7[1] = @"expected type";
  v8[0] = @"decode failure";
  v8[1] = @"CLRegionState";
  v7[2] = @"raw value";
  v8[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (id)JSONObjectWith_CLDaemonLocation:(id)a3 info:(os_log_type_info_s *)a4
{
  v42[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int __dst = 0xFFFF;
    double v24 = 0.0;
    double v25 = 0.0;
    __asm { FMOV            V0.2D, #-1.0 }
    long long v26 = xmmword_22D3C79A0;
    long long v27 = _Q0;
    long long v28 = _Q0;
    long long v29 = _Q0;
    unsigned int v30 = 0;
    double v31 = -1.0;
    memset(v32, 0, sizeof(v32));
    double v33 = -1.0;
    unsigned int v34 = 0x7FFFFFFF;
    double v37 = 0.0;
    uint64_t v35 = 0;
    uint64_t v36 = 0;
    char v38 = 0;
    v12 = (const void *)[a3 bytes];
    if ((unint64_t)[a3 length] <= 0x9C) {
      size_t v13 = [a3 length];
    }
    else {
      size_t v13 = 156;
    }
    memcpy(&__dst, v12, v13);
    id v18 = -[CLLogFormatter JSONObjectWith_CLClientLocationSuitability:info:](self, "JSONObjectWith_CLClientLocationSuitability:info:", [NSNumber numberWithUnsignedInt:__dst], a4);
    id v19 = -[CLLogFormatter JSONObjectWith_CLClientLocationReferenceFrame:info:](self, "JSONObjectWith_CLClientLocationReferenceFrame:info:", [NSNumber numberWithUnsignedInt:HIDWORD(v35)], a4);
    id v20 = -[CLLogFormatter JSONObjectWith_CLClientLocationReferenceFrame:info:](self, "JSONObjectWith_CLClientLocationReferenceFrame:info:", [NSNumber numberWithUnsignedInt:v36], a4);
    id v21 = -[CLLogFormatter JSONObjectWith_CLLocationType:info:](self, "JSONObjectWith_CLLocationType:info:", [NSNumber numberWithUnsignedInt:*(unsigned int *)v32], a4);
    v40[0] = v18;
    v39[0] = @"suitability";
    v39[1] = @"lat";
    v40[1] = [NSNumber numberWithDouble:v24];
    v39[2] = @"lon";
    v40[2] = [NSNumber numberWithDouble:v25];
    v39[3] = @"horizontalAccuracy";
    v40[3] = [NSNumber numberWithDouble:*(double *)&v26];
    v39[4] = @"altitude";
    v40[4] = [NSNumber numberWithDouble:*((double *)&v26 + 1)];
    v39[5] = @"ellipsoidalAltitude";
    v40[5] = [NSNumber numberWithDouble:v37];
    v39[6] = @"verticalAccuracy";
    v40[6] = [NSNumber numberWithDouble:*(double *)&v27];
    v39[7] = @"speed";
    v40[7] = [NSNumber numberWithDouble:*((double *)&v27 + 1)];
    v39[8] = @"speedAccuracy";
    v40[8] = [NSNumber numberWithDouble:*(double *)&v28];
    v39[9] = @"course";
    v40[9] = [NSNumber numberWithDouble:*((double *)&v28 + 1)];
    v39[10] = @"courseAccuracy";
    v40[10] = [NSNumber numberWithDouble:*(double *)&v29];
    v39[11] = @"timestamp";
    v40[11] = [NSNumber numberWithDouble:*((double *)&v29 + 1)];
    v39[12] = @"confidence";
    v40[12] = [NSNumber numberWithInt:v30];
    v39[13] = @"lifespan";
    v40[13] = [NSNumber numberWithDouble:v31];
    v40[14] = v21;
    v39[14] = @"type";
    v39[15] = @"rawLat";
    v40[15] = [NSNumber numberWithDouble:*(double *)&v32[4]];
    v39[16] = @"rawLon";
    v40[16] = [NSNumber numberWithDouble:*(double *)&v32[12]];
    v39[17] = @"rawCourse";
    v40[17] = [NSNumber numberWithDouble:v33];
    v39[18] = @"floor";
    v40[18] = [NSNumber numberWithInt:v34];
    v39[19] = @"integrity";
    v40[19] = [NSNumber numberWithUnsignedInt:v35];
    v40[20] = v19;
    v39[20] = @"referenceFrame";
    v39[21] = @"rawReferenceFrame";
    v40[21] = v20;
    v39[22] = @"fromSimulationController";
    v40[22] = [NSNumber numberWithBool:v38 != 0];
    uint64_t v14 = NSDictionary;
    v15 = v40;
    v16 = v39;
    uint64_t v17 = 23;
  }
  else
  {
    v41[0] = @"type";
    v41[1] = @"expected type";
    v41[2] = @"raw value";
    v42[0] = @"decode failure";
    v42[1] = @"CLDaemonLocation";
    v42[2] = a3;
    uint64_t v14 = NSDictionary;
    v15 = v42;
    v16 = v41;
    uint64_t v17 = 3;
  }
  return (id)[v14 dictionaryWithObjects:v15 forKeys:v16 count:v17];
}

- (id)JSONObjectWith_CLClientManager_Type__AuthorizationRequestType:(id)a3 info:(os_log_type_info_s *)a4
{
  v8[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v5 = [a3 intValue];
    if (v5 < 0x11) {
      return (id)*((void *)&off_2649A82C0 + (int)v5);
    }
  }
  v7[0] = @"type";
  v7[1] = @"expected type";
  v8[0] = @"decode failure";
  v8[1] = @"CLClientManager_Type::AuthorizationRequestType";
  v7[2] = @"raw value";
  v8[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (id)JSONObjectWith_CLClientInUseLevel:(id)a3 info:(os_log_type_info_s *)a4
{
  v8[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v5 = [a3 intValue];
    if (v5 < 6) {
      return (id)*((void *)&off_2649A8348 + (int)v5);
    }
  }
  v7[0] = @"type";
  v7[1] = @"expected type";
  v8[0] = @"decode failure";
  v8[1] = @"ClientInUseLevel";
  v7[2] = @"raw value";
  v8[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (id)JSONObjectWith_SqliteResult:(id)a3 info:(os_log_type_info_s *)a4
{
  v14[3] = *MEMORY[0x263EF8340];
  if ([a3 length] != 4)
  {
    v13[0] = @"type";
    v13[1] = @"expected type";
    v14[0] = @"decode failure";
    v14[1] = @"SqliteResult";
    v13[2] = @"raw value";
    v14[2] = a3;
    uint64_t v7 = NSDictionary;
    v8 = v14;
    v9 = v13;
    return (id)[v7 dictionaryWithObjects:v8 forKeys:v9 count:3];
  }
  int v5 = *(_DWORD *)[a3 bytes];
  if (v5 <= 515)
  {
    if (v5 > 99)
    {
      int v10 = v5 - 261;
      switch(v10)
      {
        case 0:
          return @"SQLITE_BUSY_RECOVERY";
        case 1:
          return @"SQLITE_LOCKED_SHAREDCACHE";
        case 2:
        case 4:
        case 7:
        case 8:
        case 10:
        case 11:
        case 12:
        case 13:
        case 15:
        case 16:
        case 17:
        case 19:
        case 20:
        case 21:
          goto LABEL_150;
        case 3:
          return @"SQLITE_READONLY_RECOVERY";
        case 5:
          return @"SQLITE_IOERR_READ";
        case 6:
          return @"SQLITE_CORRUPT_VTAB";
        case 9:
          return @"SQLITE_CANTOPEN_NOTEMPDIR";
        case 14:
          return @"SQLITE_CONSTRAINT_CHECK";
        case 18:
          return @"SQLITE_AUTH_USER";
        case 22:
          return @"SQLITE_NOTICE_RECOVER_WAL";
        case 23:
          return @"SQLITE_WARNING_AUTOINDEX";
        default:
          if (v10 == 100)
          {
            id result = @"SQLITE_ROW";
          }
          else
          {
            if (v10 != 101) {
              goto LABEL_150;
            }
            id result = @"SQLITE_DONE";
          }
          break;
      }
    }
    else
    {
      id result = @"SQLITE_OK";
      switch(v5)
      {
        case 0:
          return result;
        case 1:
          id result = @"SQLITE_ERROR";
          break;
        case 2:
          id result = @"SQLITE_INTERNAL";
          break;
        case 3:
          id result = @"SQLITE_PERM";
          break;
        case 4:
          id result = @"SQLITE_ABORT";
          break;
        case 5:
          id result = @"SQLITE_BUSY";
          break;
        case 6:
          id result = @"SQLITE_LOCKED";
          break;
        case 7:
          id result = @"SQLITE_NOMEM";
          break;
        case 8:
          id result = @"SQLITE_READONLY";
          break;
        case 9:
          id result = @"SQLITE_INTERRUPT";
          break;
        case 10:
          id result = @"SQLITE_IOERR";
          break;
        case 11:
          id result = @"SQLITE_CORRUPT";
          break;
        case 12:
          id result = @"SQLITE_NOTFOUND";
          break;
        case 13:
          id result = @"SQLITE_FULL";
          break;
        case 14:
          id result = @"SQLITE_CANTOPEN";
          break;
        case 15:
          id result = @"SQLITE_PROTOCOL";
          break;
        case 16:
          id result = @"SQLITE_EMPTY";
          break;
        case 17:
          id result = @"SQLITE_SCHEMA";
          break;
        case 18:
          id result = @"SQLITE_TOOBIG";
          break;
        case 19:
          id result = @"SQLITE_CONSTRAINT";
          break;
        case 20:
          id result = @"SQLITE_MISMATCH";
          break;
        case 21:
          id result = @"SQLITE_MISUSE";
          break;
        case 22:
          id result = @"SQLITE_NOLFS";
          break;
        case 23:
          id result = @"SQLITE_AUTH";
          break;
        case 24:
          id result = @"SQLITE_FORMAT";
          break;
        case 25:
          id result = @"SQLITE_RANGE";
          break;
        case 26:
          id result = @"SQLITE_NOTADB";
          break;
        case 27:
          id result = @"SQLITE_NOTICE";
          break;
        case 28:
          id result = @"SQLITE_WARNING";
          break;
        default:
          goto LABEL_150;
      }
    }
  }
  else
  {
    if (v5 > 2066)
    {
      if (v5 <= 4361)
      {
        if (v5 <= 2825)
        {
          if (v5 <= 2322)
          {
            if (v5 == 2067) {
              return @"SQLITE_CONSTRAINT_UNIQUE";
            }
            if (v5 == 2314) {
              return @"SQLITE_IOERR_RDLOCK";
            }
          }
          else
          {
            switch(v5)
            {
              case 2323:
                return @"SQLITE_CONSTRAINT_VTAB";
              case 2570:
                return @"SQLITE_IOERR_DELETE";
              case 2579:
                return @"SQLITE_CONSTRAINT_ROWID";
            }
          }
        }
        else if (v5 > 3593)
        {
          switch(v5)
          {
            case 3594:
              return @"SQLITE_IOERR_CHECKRESERVEDLOCK";
            case 3850:
              return @"SQLITE_IOERR_LOCK";
            case 4106:
              return @"SQLITE_IOERR_CLOSE";
          }
        }
        else
        {
          switch(v5)
          {
            case 2826:
              return @"SQLITE_IOERR_BLOCKED";
            case 3082:
              return @"SQLITE_IOERR_NOMEM";
            case 3338:
              return @"SQLITE_IOERR_ACCESS";
          }
        }
      }
      else if (v5 > 5897)
      {
        if (v5 > 6665)
        {
          switch(v5)
          {
            case 6666:
              return @"SQLITE_IOERR_CONVPATH";
            case 6922:
              return @"SQLITE_IOERR_VNODE";
            case 7178:
              return @"SQLITE_IOERR_AUTH";
          }
        }
        else
        {
          switch(v5)
          {
            case 5898:
              return @"SQLITE_IOERR_DELETE_NOENT";
            case 6154:
              return @"SQLITE_IOERR_MMAP";
            case 6410:
              return @"SQLITE_IOERR_GETTEMPPATH";
          }
        }
      }
      else if (v5 > 5129)
      {
        switch(v5)
        {
          case 5130:
            return @"SQLITE_IOERR_SHMLOCK";
          case 5386:
            return @"SQLITE_IOERR_SHMMAP";
          case 5642:
            return @"SQLITE_IOERR_SEEK";
        }
      }
      else
      {
        switch(v5)
        {
          case 4362:
            return @"SQLITE_IOERR_DIR_CLOSE";
          case 4618:
            return @"SQLITE_IOERR_SHMOPEN";
          case 4874:
            return @"SQLITE_IOERR_SHMSIZE";
        }
      }
      goto LABEL_150;
    }
    if (v5 > 1031)
    {
      if (v5 <= 1298)
      {
        if (v5 <= 1037)
        {
          if (v5 == 1032) {
            return @"SQLITE_READONLY_DBMOVED";
          }
          if (v5 == 1034) {
            return @"SQLITE_IOERR_FSYNC";
          }
        }
        else
        {
          switch(v5)
          {
            case 1038:
              return @"SQLITE_CANTOPEN_CONVPATH";
            case 1043:
              return @"SQLITE_CONSTRAINT_FUNCTION";
            case 1290:
              return @"SQLITE_IOERR_DIR_FSYNC";
          }
        }
      }
      else if (v5 > 1801)
      {
        switch(v5)
        {
          case 1802:
            return @"SQLITE_IOERR_FSTAT";
          case 1811:
            return @"SQLITE_CONSTRAINT_TRIGGER";
          case 2058:
            return @"SQLITE_IOERR_UNLOCK";
        }
      }
      else
      {
        switch(v5)
        {
          case 1299:
            return @"SQLITE_CONSTRAINT_NOTNULL";
          case 1546:
            return @"SQLITE_IOERR_TRUNCATE";
          case 1555:
            return @"SQLITE_CONSTRAINT_PRIMARYKEY";
        }
      }
      goto LABEL_150;
    }
    if (v5 > 530)
    {
      if (v5 > 777)
      {
        switch(v5)
        {
          case 778:
            return @"SQLITE_IOERR_WRITE";
          case 782:
            return @"SQLITE_CANTOPEN_FULLPATH";
          case 787:
            return @"SQLITE_CONSTRAINT_FOREIGNKEY";
        }
      }
      else
      {
        switch(v5)
        {
          case 531:
            return @"SQLITE_CONSTRAINT_COMMITHOOK";
          case 539:
            return @"SQLITE_NOTICE_RECOVER_ROLLBACK";
          case 776:
            return @"SQLITE_READONLY_ROLLBACK";
        }
      }
LABEL_150:
      v11[0] = @"type";
      v11[1] = @"expected type";
      v12[0] = @"decode failure";
      v12[1] = @"SqliteResult";
      v11[2] = @"raw value";
      v12[2] = a3;
      uint64_t v7 = NSDictionary;
      v8 = v12;
      v9 = v11;
      return (id)[v7 dictionaryWithObjects:v8 forKeys:v9 count:3];
    }
    switch(v5)
    {
      case 516:
        id result = @"SQLITE_ABORT_ROLLBACK";
        break;
      case 517:
        id result = @"SQLITE_BUSY_SNAPSHOT";
        break;
      case 520:
        id result = @"SQLITE_READONLY_CANTLOCK";
        break;
      case 522:
        id result = @"SQLITE_IOERR_SHORT_READ";
        break;
      case 526:
        id result = @"SQLITE_CANTOPEN_ISDIR";
        break;
      default:
        goto LABEL_150;
    }
  }
  return result;
}

- (id)JSONObjectWith_CLLocationProvider_Type__Notification:(id)a3 info:(os_log_type_info_s *)a4
{
  v8[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v5 = [a3 intValue];
    if (v5 < 0x31) {
      return (id)*((void *)&off_2649A8378 + (int)v5);
    }
  }
  v7[0] = @"type";
  v7[1] = @"expected type";
  v8[0] = @"decode failure";
  v8[1] = @"CLLocationProvider_Type::Notification";
  v7[2] = @"raw value";
  v8[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (id)JSONObjectWith_CLLocationStreamingGranularity:(id)a3 info:(os_log_type_info_s *)a4
{
  v8[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v5 = [a3 intValue];
    if (v5 < 4) {
      return (id)*((void *)&off_2649A8500 + (int)v5);
    }
  }
  v7[0] = @"type";
  v7[1] = @"expected type";
  v8[0] = @"decode failure";
  v8[1] = @"CLLocationStreamingGranularity";
  v7[2] = @"raw value";
  v8[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (id)JSONObjectWith_CLStreamingAwareLocationProviderNoLocalGPSStateMachine__LocationSourceState:(id)a3 info:(os_log_type_info_s *)a4
{
  v8[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v5 = [a3 intValue];
    if (v5 < 5) {
      return (id)*((void *)&off_2649A8520 + (int)v5);
    }
  }
  v7[0] = @"type";
  v7[1] = @"expected type";
  v8[0] = @"decode failure";
  v8[1] = @"CLStreamingAwareLocationProviderNoLocalGPSStateMachine::LocationSourceState";
  v7[2] = @"raw value";
  v8[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (id)JSONObjectWith_CLStreamingAwareLocationProviderLocalGPSStateMachine__LocationSourceState:(id)a3 info:(os_log_type_info_s *)a4
{
  v8[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v5 = [a3 intValue];
    if (v5 < 6) {
      return (id)*((void *)&off_2649A8548 + (int)v5);
    }
  }
  v7[0] = @"type";
  v7[1] = @"expected type";
  v8[0] = @"decode failure";
  v8[1] = @"CLStreamingAwareLocationProviderLocalGPSStateMachine::LocationSourceState";
  v7[2] = @"raw value";
  v8[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (id)JSONObjectWith_CLStreamingAwareLocationProviderLocalGPSStateMachine__WorkoutState:(id)a3 info:(os_log_type_info_s *)a4
{
  v8[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v5 = [a3 intValue];
    if (v5 < 3) {
      return (id)*((void *)&off_2649A8578 + (int)v5);
    }
  }
  v7[0] = @"type";
  v7[1] = @"expected type";
  v8[0] = @"decode failure";
  v8[1] = @"CLStreamingAwareLocationProviderLocalGPSStateMachine::LocationSourceState";
  v7[2] = @"raw value";
  v8[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (id)JSONObjectWith_CLStreamingAwareLocationProviderStateMachine__LocationSource:(id)a3 info:(os_log_type_info_s *)a4
{
  v8[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v5 = [a3 intValue];
    if (!v5) {
      return @"CLStreamingAwareLocationProviderStateMachine::kLocationSourceLocal";
    }
    if (v5 == 1) {
      return @"CLStreamingAwareLocationProviderStateMachine::kLocationSourceRemote";
    }
  }
  v7[0] = @"type";
  v7[1] = @"expected type";
  v8[0] = @"decode failure";
  v8[1] = @"CLStreamingAwareLocationProviderStateMachine::LocationSource";
  v7[2] = @"raw value";
  v8[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (id)JSONObjectWith_CLLocationProvider_Type__MotionDetected:(id)a3 info:(os_log_type_info_s *)a4
{
  v8[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v5 = [a3 intValue];
    if (v5 < 3) {
      return (id)*((void *)&off_2649A8590 + (int)v5);
    }
  }
  v7[0] = @"type";
  v7[1] = @"expected type";
  v8[0] = @"decode failure";
  v8[1] = @"CLLocationProvider_Type::MotionDetected";
  v7[2] = @"raw value";
  v8[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (id)JSONObjectWith_CLLocationType:(id)a3 info:(os_log_type_info_s *)a4
{
  v8[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v5 = [a3 intValue];
    if (v5 < 0xF) {
      return (id)*((void *)&off_2649A85A8 + (int)v5);
    }
  }
  v7[0] = @"type";
  v7[1] = @"expected type";
  v8[0] = @"decode failure";
  v8[1] = @"CLLocationType";
  v7[2] = @"raw value";
  v8[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (id)JSONObjectWith_CLDaemonLocationPrivate__OriginDevice:(id)a3 info:(os_log_type_info_s *)a4
{
  v8[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v5 = [a3 intValue];
    if (v5 < 3) {
      return (id)*((void *)&off_2649A8620 + (int)v5);
    }
  }
  v7[0] = @"type";
  v7[1] = @"expected type";
  v8[0] = @"decode failure";
  v8[1] = @"CLClientLocationOriginDevice";
  v7[2] = @"raw value";
  v8[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (id)JSONObjectWith_IOMessage:(id)a3 info:(os_log_type_info_s *)a4
{
  v8[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [a3 unsignedLongValue];
    if (v5 > 3758096943)
    {
      if (v5 > 3758097151)
      {
        if (v5 > 3758097199)
        {
          switch(v5)
          {
            case 3758097200:
              return @"CopyClientID";
            case 3758097216:
              return @"SystemCapabilityChange";
            case 3758097232:
              return @"DeviceSignaledWakeup";
          }
        }
        else
        {
          switch(v5)
          {
            case 3758097152:
              return @"SystemHasPoweredOn";
            case 3758097168:
              return @"SystemWillRestart";
            case 3758097184:
              return @"SystemWillPowerOn";
          }
        }
      }
      else if (v5 > 3758097007)
      {
        switch(v5)
        {
          case 3758097008:
            return @"CanSystemSleep";
          case 3758097024:
            return @"SystemWillSleep";
          case 3758097040:
            return @"SystemWillNotSleep";
        }
      }
      else
      {
        switch(v5)
        {
          case 3758096944:
            return @"DeviceHasPoweredOn";
          case 3758096976:
            return @"SystemWillPowerOff";
          case 3758096981:
            return @"SystemPagingOff";
        }
      }
    }
    else if (v5 > 3758096671)
    {
      if (v5 > 3758096895)
      {
        switch(v5)
        {
          case 3758096896:
            return @"CanDevicePowerOff";
          case 3758096912:
            return @"DeviceWillPowerOff";
          case 3758096928:
            return @"DeviceWillNotPowerOff";
        }
      }
      else
      {
        switch(v5)
        {
          case 3758096672:
            return @"ServiceBusyStateChange";
          case 3758096680:
            return @"ConsoleSecurityChange";
          case 3758096688:
            return @"ServicePropertyChange";
        }
      }
    }
    else if (v5 > 3758096639)
    {
      switch(v5)
      {
        case 3758096640:
          return @"ServiceIsRequestingClose";
        case 3758096641:
          return @"ServiceIsAttemptingOpen";
        case 3758096656:
          return @"ServiceWasClosed";
      }
    }
    else
    {
      switch(v5)
      {
        case 3758096400:
          return @"ServiceIsTerminated";
        case 3758096416:
          return @"ServiceIsSuspended";
        case 3758096432:
          return @"ServiceIsResumed";
      }
    }
  }
  v7[0] = @"type";
  v7[1] = @"expected type";
  v8[0] = @"decode failure";
  v8[1] = @"IOMessage";
  v7[2] = @"raw value";
  v8[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (id)JSONObjectWith_CLDaemonStatus_Type__Reachability:(id)a3 info:(os_log_type_info_s *)a4
{
  v8[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v5 = [a3 intValue];
    if (v5 > 1)
    {
      if (v5 == 2) {
        return @"kReachabilityLarge";
      }
      if (v5 == 1000) {
        return @"kReachabilityUnachievable";
      }
    }
    else
    {
      if (!v5) {
        return @"kReachabilityUnavailable";
      }
      if (v5 == 1) {
        return @"kReachabilitySmall";
      }
    }
  }
  v7[0] = @"type";
  v7[1] = @"expected type";
  v8[0] = @"decode failure";
  v8[1] = @"CLDaemonStatus_Type::Reachability";
  v7[2] = @"raw value";
  v8[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (id)JSONObjectWith_CLBatteryChargerType:(id)a3 info:(os_log_type_info_s *)a4
{
  v8[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v5 = [a3 intValue];
    if (v5 < 5) {
      return (id)*((void *)&off_2649A8638 + (int)v5);
    }
  }
  v7[0] = @"type";
  v7[1] = @"expected type";
  v8[0] = @"decode failure";
  v8[1] = @"CLBatteryChargerType";
  v7[2] = @"raw value";
  v8[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (id)JSONObjectWith_CLDaemonStatus_Type__Battery:(id)a3 info:(os_log_type_info_s *)a4
{
  v23[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18[0] = @"type";
    v18[1] = @"expected type";
    v19[0] = @"decode failure";
    v19[1] = @"CLDaemonStatus_Type::Battery";
    v18[2] = @"raw value";
    v19[2] = a3;
    size_t v13 = NSDictionary;
    uint64_t v14 = v19;
    v15 = v18;
LABEL_6:
    uint64_t v16 = 3;
    return (id)[v13 dictionaryWithObjects:v14 forKeys:v15 count:v16];
  }
  if ([a3 length] != 24)
  {
    v22[0] = @"type";
    v22[1] = @"expected type";
    v23[0] = @"decode failure";
    v23[1] = @"CLDaemonStatus_Type::Battery";
    v22[2] = @"raw value";
    v23[2] = a3;
    size_t v13 = NSDictionary;
    uint64_t v14 = v23;
    v15 = v22;
    goto LABEL_6;
  }
  uint64_t v7 = [a3 bytes];
  double v8 = *(double *)v7;
  char v9 = *(unsigned char *)(v7 + 8);
  char v10 = *(unsigned char *)(v7 + 9);
  char v11 = *(unsigned char *)(v7 + 16);
  uint64_t v12 = [NSNumber numberWithInt:*(unsigned int *)(v7 + 12)];
  v20[0] = @"level";
  v21[0] = [NSNumber numberWithDouble:v8];
  v20[1] = @"charged";
  v21[1] = [NSNumber numberWithBool:v9 & 1];
  v20[2] = @"connected";
  v21[2] = [NSNumber numberWithBool:v10 & 1];
  v20[3] = @"chargerType";
  v21[3] = [(CLLogFormatter *)self JSONObjectWith_CLBatteryChargerType:v12 info:a4];
  v20[4] = @"wasConnected";
  v21[4] = [NSNumber numberWithBool:v11 & 1];
  size_t v13 = NSDictionary;
  uint64_t v14 = v21;
  v15 = v20;
  uint64_t v16 = 5;
  return (id)[v13 dictionaryWithObjects:v14 forKeys:v15 count:v16];
}

- (id)JSONObjectWith_CLClientServiceTypeMask:(id)a3 info:(os_log_type_info_s *)a4
{
  v15[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12[0] = @"type";
    v12[1] = @"expected type";
    v13[0] = @"decode failure";
    v13[1] = @"CLClientServiceTypeMask";
    v12[2] = @"raw value";
    v13[2] = a3;
    double v8 = NSDictionary;
    char v9 = v13;
    char v10 = v12;
    return (id)[v8 dictionaryWithObjects:v9 forKeys:v10 count:3];
  }
  uint64_t v5 = [a3 integerValue];
  id v6 = (id)objc_opt_new();
  uint64_t v7 = v6;
  if (v5)
  {
    [v6 addObject:@"RegionBeacon"];
    if ((v5 & 2) == 0)
    {
LABEL_4:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_22;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_4;
  }
  [v7 addObject:@"RegionCircular"];
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v7 addObject:@"Ranging"];
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v7 addObject:@"PersistentSLC"];
  if ((v5 & 0x10) == 0)
  {
LABEL_7:
    if ((v5 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  [v7 addObject:@"Location"];
  if ((v5 & 0x20) == 0)
  {
LABEL_8:
    if ((v5 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  [v7 addObject:@"BackgroundLocation"];
  if ((v5 & 0x40) == 0)
  {
LABEL_9:
    if ((v5 & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  [v7 addObject:@"SLV"];
  if ((v5 & 0x80) == 0)
  {
LABEL_10:
    if ((v5 & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  [v7 addObject:@"RemoteLocation_Deprecated"];
  if ((v5 & 0x100) == 0)
  {
LABEL_11:
    if ((v5 & 0x200) == 0) {
      goto LABEL_12;
    }
LABEL_29:
    [v7 addObject:@"RemoteRegionCircular_Deprecated"];
    if ((v5 & 0x800) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_28:
  [v7 addObject:@"MicroLocation_Deprecated"];
  if ((v5 & 0x200) != 0) {
    goto LABEL_29;
  }
LABEL_12:
  if ((v5 & 0x800) != 0) {
LABEL_13:
  }
    [v7 addObject:@"NonPersistentSLC"];
LABEL_14:
  if (![v7 count] && v5)
  {
    v14[0] = @"type";
    v14[1] = @"expected type";
    v15[0] = @"decode failure";
    v15[1] = @"CLClientServiceTypeMask";
    v14[2] = @"raw value";
    v15[2] = a3;
    double v8 = NSDictionary;
    char v9 = v15;
    char v10 = v14;
    return (id)[v8 dictionaryWithObjects:v9 forKeys:v10 count:3];
  }
  return v7;
}

- (id)JSONObjectWith_CLTelephonyService_Type__Cell:(id)a3 info:(os_log_type_info_s *)a4
{
  v24[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v19[0] = @"type";
    v19[1] = @"expected type";
    v20[0] = @"decode failure";
    v20[1] = @"CLTelephonyService_Type::Cell";
    v19[2] = @"raw value";
    v20[2] = a3;
    uint64_t v14 = NSDictionary;
    v15 = v20;
    uint64_t v16 = v19;
LABEL_6:
    uint64_t v17 = 3;
    return (id)[v14 dictionaryWithObjects:v15 forKeys:v16 count:v17];
  }
  if ([a3 length] != 32)
  {
    v23[0] = @"type";
    v23[1] = @"expected type";
    v24[0] = @"decode failure";
    v24[1] = @"CLTelephonyService_Type::Cell";
    v23[2] = @"raw value";
    v24[2] = a3;
    uint64_t v14 = NSDictionary;
    v15 = v24;
    uint64_t v16 = v23;
    goto LABEL_6;
  }
  uint64_t v5 = (unsigned int *)[a3 bytes];
  uint64_t v6 = *v5;
  uint64_t v7 = v5[1];
  uint64_t v8 = v5[2];
  uint64_t v9 = v5[3];
  uint64_t v11 = v5[4];
  uint64_t v10 = v5[5];
  uint64_t v13 = v5[6];
  uint64_t v12 = v5[7];
  v21[0] = @"mcc";
  v22[0] = [NSNumber numberWithInt:v6];
  v21[1] = @"mnc";
  v22[1] = [NSNumber numberWithInt:v7];
  v21[2] = @"lac";
  v22[2] = [NSNumber numberWithInt:v8];
  v21[3] = @"ci";
  void v22[3] = [NSNumber numberWithInt:v9];
  v21[4] = @"uarfcn";
  v22[4] = [NSNumber numberWithInt:v11];
  void v21[5] = @"psc";
  v22[5] = [NSNumber numberWithInt:v10];
  v21[6] = @"rscp";
  v22[6] = [NSNumber numberWithInt:v13];
  v21[7] = @"ecn0";
  v22[7] = [NSNumber numberWithInt:v12];
  uint64_t v14 = NSDictionary;
  v15 = v22;
  uint64_t v16 = v21;
  uint64_t v17 = 8;
  return (id)[v14 dictionaryWithObjects:v15 forKeys:v16 count:v17];
}

- (id)JSONObjectWith_PSYSyncRestriction:(id)a3 info:(os_log_type_info_s *)a4
{
  v8[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [a3 longLongValue];
    if (!v5) {
      return @"PSYSyncRestrictionNone";
    }
    if (v5 == 1) {
      return @"PSYSyncRestrictionLimitPush";
    }
  }
  v7[0] = @"type";
  v7[1] = @"expected type";
  v8[0] = @"decode failure";
  v8[1] = @"PSYSyncRestriction";
  v7[2] = @"raw value";
  v8[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (id)JSONObjectWith_PSYSyncSessionType:(id)a3 info:(os_log_type_info_s *)a4
{
  v8[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [a3 longLongValue];
    if (!v5) {
      return @"PSYSyncSessionTypeFullSync";
    }
    if (v5 == 1) {
      return @"PSYSyncSessionTypeReunionSync";
    }
  }
  v7[0] = @"type";
  v7[1] = @"expected type";
  v8[0] = @"decode failure";
  v8[1] = @"PSYSyncSessionType";
  v7[2] = @"raw value";
  v8[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (id)JSONObjectWith_SYSessionState:(id)a3 info:(os_log_type_info_s *)a4
{
  v8[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v5 = [a3 longLongValue];
    if (v5 < 0xA) {
      return (id)*((void *)&off_2649A8660 + v5);
    }
  }
  v7[0] = @"type";
  v7[1] = @"expected type";
  v8[0] = @"decode failure";
  v8[1] = @"SYSessionState";
  v7[2] = @"raw value";
  v8[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (id)JSONObjectWith_CLMonitoringState:(id)a3 info:(os_log_type_info_s *)a4
{
  v8[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v5 = [a3 longLongValue];
    if (v5 < 3) {
      return (id)*((void *)&off_2649A86B0 + v5);
    }
  }
  v7[0] = @"type";
  v7[1] = @"expected type";
  v8[0] = @"decode failure";
  v8[1] = @"CLMonitoringState";
  v7[2] = @"raw value";
  v8[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (id)JSONObjectWith_CLFenceManager_Type__Notification:(id)a3 info:(os_log_type_info_s *)a4
{
  v8[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v5 = [a3 intValue];
    if (v5 < 0xC) {
      return (id)*((void *)&off_2649A86C8 + (int)v5);
    }
  }
  v7[0] = @"type";
  v7[1] = @"expected type";
  v8[0] = @"decode failure";
  v8[1] = @"CLFenceManager_Type::Notification";
  v7[2] = @"raw value";
  v8[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (id)JSONObjectWith_CLBTLEFenceManager_Type__Notification:(id)a3 info:(os_log_type_info_s *)a4
{
  v8[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v5 = [a3 intValue];
    if (v5 < 4) {
      return (id)*((void *)&off_2649A8728 + (int)v5);
    }
  }
  v7[0] = @"type";
  v7[1] = @"expected type";
  v8[0] = @"decode failure";
  v8[1] = @"CLBTLEFenceManager_Type::Notification";
  v7[2] = @"raw value";
  v8[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (id)JSONObjectWith_CLMotionActivity__Type:(id)a3 info:(os_log_type_info_s *)a4
{
  void v9[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_105:
    v8[0] = @"type";
    v8[1] = @"expected type";
    v9[0] = @"decode failure";
    v9[1] = @"CLMotionActivity::Type";
    v8[2] = @"raw value";
    v9[2] = a3;
    return (id)[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];
  }
  int v5 = [a3 intValue];
  int v6 = v5;
  if (v5 > 11804)
  {
    if (v5 > 15651)
    {
      if (v5 > 18199)
      {
        if (v5 <= 19149)
        {
          if (v5 > 19029)
          {
            if (v5 == 19030) {
              return @"CLMotionActivity::kTypeIndoorSkatingSports";
            }
            if (v5 == 19090) {
              return @"CLMotionActivity::kTypeCrossCountrySkiing";
            }
          }
          else
          {
            if (v5 == 18200) {
              return @"CLMotionActivity::kTypeScubaDiving";
            }
            if (v5 == 18240) {
              return @"CLMotionActivity::kTypeSwimming";
            }
          }
        }
        else if (v5 <= 515620)
        {
          if (v5 == 19150) {
            return @"CLMotionActivity::kTypeDownhillSkiing";
          }
          if (v5 == 90603) {
            return @"CLMotionActivity::kTypeOutdoorWheelchair";
          }
        }
        else
        {
          switch(v5)
          {
            case 515621:
              return @"CLMotionActivity::kTypeBaseball";
            case 515652:
              return @"CLMotionActivity::kTypeRacquetball";
            case 519150:
              return @"CLMotionActivity::kTypeSnowboarding";
          }
        }
      }
      else if (v5 <= 15710)
      {
        if (v5 > 15669)
        {
          if (v5 == 15670) {
            return @"CLMotionActivity::kTypeTaiChi";
          }
          if (v5 == 15675) {
            return @"CLMotionActivity::kTypeTennis";
          }
        }
        else
        {
          if (v5 == 15652) {
            return @"CLMotionActivity::kTypeSquash";
          }
          if (v5 == 15660) {
            return @"CLMotionActivity::kTypeTableTennis";
          }
        }
      }
      else if (v5 <= 17149)
      {
        if (v5 == 15711) {
          return @"CLMotionActivity::kTypeVolleyball";
        }
        if (v5 == 15733) {
          return @"CLMotionActivity::kTypeTrackAndField";
        }
      }
      else
      {
        switch(v5)
        {
          case 17150:
            return @"CLMotionActivity::kTypeIndoorWalking";
          case 18050:
            return @"CLMotionActivity::kTypeOutdoorRowing";
          case 18100:
            return @"CLMotionActivity::kTypePaddleSports";
        }
      }
    }
    else if (v5 > 15254)
    {
      if (v5 <= 15459)
      {
        if (v5 > 15349)
        {
          if (v5 == 15350) {
            return @"CLMotionActivity::kTypeOutdoorHockey";
          }
          if (v5 == 15360) {
            return @"CLMotionActivity::kTypeIndoorHockey";
          }
        }
        else
        {
          if (v5 == 15255) {
            return @"CLMotionActivity::kTypeGolfing";
          }
          if (v5 == 15330) {
            return @"CLMotionActivity::kTypeHandball";
          }
        }
      }
      else if (v5 <= 15591)
      {
        if (v5 == 15460) {
          return @"CLMotionActivity::kTypeLacrosse";
        }
        if (v5 == 15560) {
          return @"CLMotionActivity::kTypeRugby";
        }
      }
      else
      {
        switch(v5)
        {
          case 15592:
            return @"CLMotionActivity::kTypeOutdoorSkatingSports";
          case 15610:
            return @"CLMotionActivity::kTypeOutdoorSoccer";
          case 15620:
            return @"CLMotionActivity::kTypeSoftball";
        }
      }
    }
    else if (v5 <= 15099)
    {
      if (v5 > 15029)
      {
        if (v5 == 15030) {
          return @"CLMotionActivity::kTypeBadminton";
        }
        if (v5 == 15055) {
          return @"CLMotionActivity::kTypeBasketball";
        }
      }
      else
      {
        if (v5 == 11805) {
          return @"CLMotionActivity::kTypePushingWheelchair";
        }
        if (v5 == 12150) {
          return @"CLMotionActivity::kTypeIndoorRunning";
        }
      }
    }
    else if (v5 <= 15149)
    {
      if (v5 == 15100) {
        return @"CLMotionActivity::kTypeBoxing";
      }
      if (v5 == 15110) {
        return @"CLMotionActivity::kTypeKickboxing";
      }
    }
    else
    {
      switch(v5)
      {
        case 15150:
          return @"CLMotionActivity::kTypeCricket";
        case 15230:
          return @"CLMotionActivity::kTypeAmericanFootball";
        case 15250:
          return @"CLMotionActivity::kTypeDiscSports";
      }
    }
    goto LABEL_105;
  }
  if (v5 > 99)
  {
    if (v5 <= 2064)
    {
      if (v5 <= 2021)
      {
        switch(v5)
        {
          case 100:
            return @"CLMotionActivity::kTypeCyclingLeg";
          case 2010:
            return @"CLMotionActivity::kTypeStationaryCycling";
          case 2020:
            return @"CLMotionActivity::kTypeCalisthenics";
        }
      }
      else if (v5 > 2047)
      {
        if (v5 == 2048) {
          return @"CLMotionActivity::kTypeElliptical";
        }
        if (v5 == 2061) {
          return @"CLMotionActivity::kTypeCrossTraining";
        }
      }
      else
      {
        if (v5 == 2022) {
          return @"CLMotionActivity::kTypeFunctionalStrength";
        }
        if (v5 == 2024) {
          return @"CLMotionActivity::kTypeCoreTraining";
        }
      }
    }
    else if (v5 > 2104)
    {
      if (v5 > 3014)
      {
        if (v5 == 3015) {
          return @"CLMotionActivity::kTypeDancing";
        }
        if (v5 == 3016) {
          return @"CLMotionActivity::kTypeStepTraining";
        }
      }
      else
      {
        if (v5 == 2105) {
          return @"CLMotionActivity::kTypePilates";
        }
        if (v5 == 2150) {
          return @"CLMotionActivity::kTypeYoga";
        }
      }
    }
    else if (v5 > 2070)
    {
      if (v5 == 2071) {
        return @"CLMotionActivity::kTypeRowing";
      }
      if (v5 == 2101) {
        return @"CLMotionActivity::kTypeCoolDown";
      }
    }
    else
    {
      if (v5 == 2065) {
        return @"CLMotionActivity::kTypeStairClimbing";
      }
      if (v5 == 2068) {
        return @"CLMotionActivity::kTypeJumpRope";
      }
    }
    goto LABEL_105;
  }
  id result = @"CLMotionActivity::kTypeUnknown";
  switch(v6)
  {
    case 0:
      return result;
    case 1:
      id result = @"CLMotionActivity::kTypeFrozen";
      break;
    case 2:
      id result = @"CLMotionActivity::kTypeStatic";
      break;
    case 3:
      id result = @"CLMotionActivity::kTypeMoving";
      break;
    case 4:
      id result = @"CLMotionActivity::kTypeWalking";
      break;
    case 5:
      id result = @"CLMotionActivity::kTypeDriving";
      break;
    case 6:
      id result = @"CLMotionActivity::kTypeCycling";
      break;
    case 7:
      id result = @"CLMotionActivity::kTypeSemiStationary";
      break;
    case 8:
      id result = @"CLMotionActivity::kTypeRunning";
      break;
    case 9:
      id result = @"CLMotionActivity::kTypeMovingCoarse";
      break;
    case 10:
      id result = @"CLMotionActivity::kTypeInVehicleFrozen";
      break;
    case 11:
      id result = @"CLMotionActivity::kTypeInVehicleStatic";
      break;
    default:
      switch(v6)
      {
        case '4':
          id result = @"CLMotionActivity::kTypeVehicularInHand";
          break;
        case '5':
        case '6':
        case '7':
        case '9':
        case ':':
        case ';':
        case '<':
        case 'C':
        case 'D':
        case 'E':
        case 'F':
          goto LABEL_105;
        case '8':
          id result = @"CLMotionActivity::kTypeDrivingOther";
          break;
        case '=':
          id result = @"CLMotionActivity::kTypeMachineWorkout";
          break;
        case '>':
          id result = @"CLMotionActivity::kTypeWorkout";
          break;
        case '?':
          id result = @"CLMotionActivity::kTypeMultiSportTransition";
          break;
        case '@':
          id result = @"CLMotionActivity::kTypeIndoorSoccer";
          break;
        case 'A':
          id result = @"CLMotionActivity::kTypeAustralianFootball";
          break;
        case 'B':
          id result = @"CLMotionActivity::kTypePickleball";
          break;
        case 'G':
          id result = @"CLMotionActivity::kTypeCount";
          break;
        default:
          if (v6 != 41) {
            goto LABEL_105;
          }
          id result = @"CLMotionActivity::kTypeWalkingSlow";
          break;
      }
      break;
  }
  return result;
}

- (id)JSONObjectWith_CLMotionActivity__Confidence:(id)a3 info:(os_log_type_info_s *)a4
{
  void v8[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v5 = [a3 intValue];
    if (v5 < 3) {
      return (id)*((void *)&off_2649A8748 + (int)v5);
    }
  }
  v7[0] = @"type";
  v7[1] = @"expected type";
  v8[0] = @"decode failure";
  v8[1] = @"CLMotionActivity::Confidence";
  v7[2] = @"raw value";
  v8[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (id)JSONObjectWith_CLMotionActivity:(id)a3 info:(os_log_type_info_s *)a4
{
  void v20[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v19[0] = @"type";
    v19[1] = @"expected type";
    v20[0] = @"decode failure";
    v20[1] = @"CLMotionActiviy";
    v19[2] = @"raw value";
    v20[2] = a3;
    uint64_t v10 = NSDictionary;
    uint64_t v11 = v20;
    uint64_t v12 = v19;
LABEL_6:
    uint64_t v13 = 3;
    return (id)[v10 dictionaryWithObjects:v11 forKeys:v12 count:v13];
  }
  if ([a3 length] != 136)
  {
    v17[0] = @"type";
    v17[1] = @"expected type";
    v18[0] = @"decode failure";
    v18[1] = @"CLMotionActiviy";
    v17[2] = @"raw value";
    v18[2] = a3;
    uint64_t v10 = NSDictionary;
    uint64_t v11 = v18;
    uint64_t v12 = v17;
    goto LABEL_6;
  }
  uint64_t v7 = (unsigned int *)[a3 bytes];
  uint64_t v8 = v7[1];
  id v9 = -[CLLogFormatter JSONObjectWith_CLMotionActivity__Type:info:](self, "JSONObjectWith_CLMotionActivity__Type:info:", [NSNumber numberWithUnsignedInt:*v7], a4);
  v15[0] = @"type";
  v15[1] = @"confidence";
  v16[0] = v9;
  v16[1] = -[CLLogFormatter JSONObjectWith_CLMotionActivity__Confidence:info:](self, "JSONObjectWith_CLMotionActivity__Confidence:info:", [NSNumber numberWithUnsignedInt:v8], a4);
  uint64_t v10 = NSDictionary;
  uint64_t v11 = v16;
  uint64_t v12 = v15;
  uint64_t v13 = 2;
  return (id)[v10 dictionaryWithObjects:v11 forKeys:v12 count:v13];
}

- (id)JSONObjectWith_CMWakeGestureWristOrientation:(id)a3 info:(os_log_type_info_s *)a4
{
  void v8[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v5 = [a3 intValue];
    if (!v5) {
      return @"Left";
    }
    if (v5 == 1) {
      return @"Right";
    }
  }
  v7[0] = @"type";
  v7[1] = @"expected type";
  v8[0] = @"decode failure";
  v8[1] = @"CMWakeGestureWristOrientation";
  v7[2] = @"raw value";
  v8[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (id)JSONObjectWith_CMWakeGestureCrownOrientation:(id)a3 info:(os_log_type_info_s *)a4
{
  void v8[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v5 = [a3 intValue];
    if (!v5) {
      return @"Left";
    }
    if (v5 == 1) {
      return @"Right";
    }
  }
  v7[0] = @"type";
  v7[1] = @"expected type";
  v8[0] = @"decode failure";
  v8[1] = @"CMWakeGestureCrownOrientation";
  v7[2] = @"raw value";
  v8[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (id)JSONObjectWith_CMWakeGestureState:(id)a3 info:(os_log_type_info_s *)a4
{
  void v8[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v5 = [a3 intValue];
    if (v5 < 6) {
      return (id)*((void *)&off_2649A8760 + (int)v5);
    }
  }
  v7[0] = @"type";
  v7[1] = @"expected type";
  v8[0] = @"decode failure";
  v8[1] = @"CMWakeGestureState";
  v7[2] = @"raw value";
  v8[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (id)JSONObjectWith_RTLState:(id)a3 info:(os_log_type_info_s *)a4
{
  void v8[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned __int8 v5 = [a3 intValue];
    if (v5 < 9u) {
      return (id)*((void *)&off_2649A8790 + (char)v5);
    }
  }
  v7[0] = @"type";
  v7[1] = @"expected type";
  v8[0] = @"decode failure";
  v8[1] = @"GestureState";
  v7[2] = @"raw value";
  v8[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (id)JSONObjectWith_RTLGestureType:(id)a3 info:(os_log_type_info_s *)a4
{
  void v8[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned __int8 v5 = [a3 intValue];
    if (v5 < 0xAu) {
      return (id)*((void *)&off_2649A87D8 + (char)v5);
    }
  }
  v7[0] = @"type";
  v7[1] = @"expected type";
  v8[0] = @"decode failure";
  v8[1] = @"GestureType";
  v7[2] = @"raw value";
  v8[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (id)JSONObjectWith_CMMotionCoprocessorReply_Log:(id)a3 info:(os_log_type_info_s *)a4
{
  v24[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([a3 length] == 72)
    {
      unsigned __int8 v5 = (void *)[a3 bytes];
      int v6 = [MEMORY[0x263EFF980] array:v5[0] v5[1] v5[2] v5[3] v5[4] v5[5] v5[6] v5[7] v5[8]];
      if (v16 >= 0x10u) {
        uint64_t v7 = 16;
      }
      else {
        uint64_t v7 = v16;
      }
      if (v7)
      {
        uint64_t v8 = (unsigned int *)&v18;
        do
        {
          unsigned int v9 = *v8++;
          [v6 addObject:[NSNumber numberWithUnsignedInt:v9]];
          --v7;
        }
        while (v7);
      }
      v21[0] = @"flags";
      v22[0] = [NSNumber numberWithUnsignedChar:v15];
      v21[1] = @"seq";
      uint64_t v10 = [NSNumber numberWithUnsignedInt:v17];
      v21[2] = @"data";
      v22[1] = v10;
      v22[2] = v6;
      uint64_t v11 = NSDictionary;
      uint64_t v12 = v22;
      uint64_t v13 = v21;
    }
    else
    {
      v23[0] = @"type";
      v23[1] = @"expected type";
      v24[0] = @"decode failure";
      v24[1] = @"CMMotionCoprocessorReply::Log";
      v23[2] = @"raw value";
      v24[2] = a3;
      uint64_t v11 = NSDictionary;
      uint64_t v12 = v24;
      uint64_t v13 = v23;
    }
  }
  else
  {
    v19[0] = @"type";
    v19[1] = @"expected type";
    v20[0] = @"decode failure";
    v20[1] = @"CMMotionCoprocessorReply::Log";
    v19[2] = @"raw value";
    v20[2] = a3;
    uint64_t v11 = NSDictionary;
    uint64_t v12 = v20;
    uint64_t v13 = v19;
  }
  return (id)[v11 dictionaryWithObjects:v12 forKeys:v13 count:3];
}

- (id)JSONObjectWith_CLSubHarvesterIdentifier:(id)a3 info:(os_log_type_info_s *)a4
{
  void v8[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v5 = [a3 intValue];
    if (v5 < 0xF) {
      return (id)*((void *)&off_2649A8828 + (int)v5);
    }
  }
  v7[0] = @"type";
  v7[1] = @"expected type";
  v8[0] = @"decode failure";
  v8[1] = @"CLSubHarvesterIdentifier";
  v7[2] = @"raw value";
  v8[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (id)JSONObjectWith_CLWifiService_Type__ScanType:(id)a3 info:(os_log_type_info_s *)a4
{
  void v8[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = (char)[a3 intValue] + 1;
    if (v5 < 0xF) {
      return (id)*((void *)&off_2649A88A0 + v5);
    }
  }
  v7[0] = @"type";
  v7[1] = @"expected type";
  v8[0] = @"decode failure";
  v8[1] = @"CLWifiService_Type::ScanType";
  v7[2] = @"raw value";
  v8[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (id)JSONObjectWith_RTRoutineMode:(id)a3 info:(os_log_type_info_s *)a4
{
  void v8[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v5 = [a3 intValue];
    if (v5 < 3) {
      return (id)*((void *)&off_2649A8918 + (int)v5);
    }
  }
  v7[0] = @"type";
  v7[1] = @"expected type";
  v8[0] = @"decode failure";
  v8[1] = @"RTRoutineMode";
  v7[2] = @"raw value";
  v8[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (id)JSONObjectWith_RTLocationOfInterestType:(id)a3 info:(os_log_type_info_s *)a4
{
  void v8[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v5 = (int)[a3 intValue] + 1;
    if (v5 < 5) {
      return (id)*((void *)&off_2649A8930 + v5);
    }
  }
  v7[0] = @"type";
  v7[1] = @"expected type";
  v8[0] = @"decode failure";
  v8[1] = @"RTLocationOfInterestType";
  v7[2] = @"raw value";
  v8[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (id)JSONObjectWith_RBSTaskState:(id)a3 info:(os_log_type_info_s *)a4
{
  void v8[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned __int8 v5 = [a3 intValue];
    if (v5 < 5u) {
      return (id)*((void *)&off_2649A8958 + (char)v5);
    }
  }
  v7[0] = @"type";
  v7[1] = @"expected type";
  v8[0] = @"decode failure";
  v8[1] = @"RBSTaskState";
  v7[2] = @"raw value";
  v8[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (id)JSONObjectWith_CLAppMonitor_Type__Notification:(id)a3 info:(os_log_type_info_s *)a4
{
  void v8[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v5 = [a3 intValue];
    if (v5 < 0xD) {
      return (id)*((void *)&off_2649A8980 + (int)v5);
    }
  }
  v7[0] = @"type";
  v7[1] = @"expected type";
  v8[0] = @"decode failure";
  v8[1] = @"CLAppMonitor_Type::Notification";
  v7[2] = @"raw value";
  v8[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (id)JSONObjectWith__CLLocationManagerStateTrackerState:(id)a3 info:(os_log_type_info_s *)a4
{
  void v41[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v5 = (const void *)[a3 bytes];
    if ((unint64_t)[a3 length] <= 0x50) {
      size_t v6 = [a3 length];
    }
    else {
      size_t v6 = 80;
    }
    memcpy(v12, v5, v6);
    v38[0] = @"distanceFilter";
    v39[0] = [NSNumber numberWithDouble:v12[0]];
    v38[1] = @"desiredAccuracy";
    v39[1] = [NSNumber numberWithDouble:v12[1]];
    v38[2] = @"updatingLocation";
    v39[2] = [NSNumber numberWithBool:v13 & 1];
    v38[3] = @"requestingLocation";
    v39[3] = [NSNumber numberWithBool:v14 & 1];
    v38[4] = @"updatingHeading";
    v39[4] = [NSNumber numberWithBool:v15 & 1];
    v38[5] = @"headingFilter";
    v39[5] = [NSNumber numberWithDouble:v16];
    v38[6] = @"allowsLocationPrompts";
    v39[6] = [NSNumber numberWithBool:v17 & 1];
    v38[7] = @"allowsAlteredAccessoryLocations";
    v39[7] = [NSNumber numberWithBool:v18 & 1];
    v38[8] = @"dynamicAccuracyReductionEnabled";
    v39[8] = [NSNumber numberWithBool:v19 & 1];
    v38[9] = @"previousAuthorizationStatusValid";
    v39[9] = [NSNumber numberWithBool:v20 & 1];
    v38[10] = @"previousAuthorizationStatus";
    v39[10] = [NSNumber numberWithUnsignedInt:v21];
    v38[11] = @"limitsPrecision";
    v39[11] = [NSNumber numberWithBool:v22 & 1];
    v38[12] = @"activityType";
    v39[12] = [NSNumber numberWithInteger:v23];
    v38[13] = @"pausesLocationUpdatesAutomatically";
    v39[13] = [NSNumber numberWithUnsignedInt:v24];
    v38[14] = @"paused";
    v39[14] = [NSNumber numberWithBool:v25 & 1];
    v38[15] = @"allowsBackgroundLocationUpdates";
    v39[15] = [NSNumber numberWithBool:v26 & 1];
    v38[16] = @"showsBackgroundLocationIndicator";
    v39[16] = [NSNumber numberWithBool:v27 & 1];
    v38[17] = @"allowsMapCorrection";
    v39[17] = [NSNumber numberWithBool:v28 & 1];
    v38[18] = @"batchingLocation";
    v39[18] = [NSNumber numberWithBool:v29 & 1];
    v38[19] = @"updatingVehicleSpeed";
    v39[19] = [NSNumber numberWithBool:v30 & 1];
    v38[20] = @"updatingVehicleHeading";
    v39[20] = [NSNumber numberWithBool:v31 & 1];
    v38[21] = @"matchInfoEnabled";
    v39[21] = [NSNumber numberWithBool:v32 & 1];
    v38[22] = @"groundAltitudeEnabled";
    v39[22] = [NSNumber numberWithBool:v33 & 1];
    v38[23] = @"fusionInfoEnabled";
    void v39[23] = [NSNumber numberWithBool:v34 & 1];
    v38[24] = @"courtesyPromptNeeded";
    v39[24] = [NSNumber numberWithBool:v35 & 1];
    v38[25] = @"isAuthorizedForWidgetUpdates";
    v39[25] = [NSNumber numberWithBool:v36 & 1];
    v38[26] = @"trackRunInfoEnabled";
    v39[26] = [NSNumber numberWithBool:v37 & 1];
    uint64_t v7 = NSDictionary;
    uint64_t v8 = v39;
    unsigned int v9 = v38;
    uint64_t v10 = 27;
  }
  else
  {
    v40[0] = @"type";
    v40[1] = @"expected type";
    v41[0] = @"decode failure";
    v41[1] = @"_CLLocationManagerStateTrackerState";
    v40[2] = @"raw value";
    v41[2] = a3;
    uint64_t v7 = NSDictionary;
    uint64_t v8 = v41;
    unsigned int v9 = v40;
    uint64_t v10 = 3;
  }
  return (id)[v7 dictionaryWithObjects:v8 forKeys:v9 count:v10];
}

- (id)JSONObjectWith__CLDaemonStatusStateTrackerState:(id)a3 info:(os_log_type_info_s *)a4
{
  void v23[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = (const void *)[a3 bytes];
    if ((unint64_t)[a3 length] <= 0x28) {
      size_t v8 = [a3 length];
    }
    else {
      size_t v8 = 40;
    }
    memcpy(&v14, v7, v8);
    v20[0] = @"batteryData";
    v21[0] = -[CLLogFormatter JSONObjectWith_CLDaemonStatus_Type__Battery:info:](self, "JSONObjectWith_CLDaemonStatus_Type__Battery:info:", [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:&v14 length:24 freeWhenDone:0], a4);
    v20[1] = @"reachability";
    v21[1] = -[CLLogFormatter JSONObjectWith_CLDaemonStatus_Type__Reachability:info:](self, "JSONObjectWith_CLDaemonStatus_Type__Reachability:info:", [NSNumber numberWithUnsignedInt:v15], a4);
    v20[2] = @"thermalLevel";
    v21[2] = [NSNumber numberWithInt:v16];
    void v20[3] = @"airplaneMode";
    void v21[3] = [NSNumber numberWithBool:v17];
    void v20[4] = @"batterySaverModeEnabled";
    v21[4] = [NSNumber numberWithBool:v18];
    void v20[5] = @"restrictedMode";
    void v21[5] = [NSNumber numberWithBool:v19];
    unsigned int v9 = NSDictionary;
    uint64_t v10 = v21;
    uint64_t v11 = v20;
    uint64_t v12 = 6;
  }
  else
  {
    v22[0] = @"type";
    v22[1] = @"expected type";
    v23[0] = @"decode failure";
    v23[1] = @"_CLDaemonStatusStateTrackerState";
    v22[2] = @"raw value";
    v23[2] = a3;
    unsigned int v9 = NSDictionary;
    uint64_t v10 = v23;
    uint64_t v11 = v22;
    uint64_t v12 = 3;
  }
  return (id)[v9 dictionaryWithObjects:v10 forKeys:v11 count:v12];
}

- (id)JSONObjectWith__CLClientManagerStateTrackerState:(id)a3 info:(os_log_type_info_s *)a4
{
  void v18[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v5 = (const void *)[a3 bytes];
    if ((unint64_t)[a3 length] <= 8) {
      size_t v6 = [a3 length];
    }
    else {
      size_t v6 = 8;
    }
    memcpy(&v13, v5, v6);
    v15[0] = @"locationServicesEnabledStatus";
    uint64_t v11 = [NSNumber numberWithUnsignedInt:v13];
    v15[1] = @"locationRestricted";
    v16[0] = v11;
    v16[1] = [NSNumber numberWithBool:v14 & 1];
    uint64_t v7 = NSDictionary;
    size_t v8 = v16;
    unsigned int v9 = v15;
    uint64_t v10 = 2;
  }
  else
  {
    v17[0] = @"type";
    v17[1] = @"expected type";
    v18[0] = @"decode failure";
    v18[1] = @"_CLClientManagerStateTrackerState";
    v17[2] = @"raw value";
    v18[2] = a3;
    uint64_t v7 = NSDictionary;
    size_t v8 = v18;
    unsigned int v9 = v17;
    uint64_t v10 = 3;
  }
  return (id)[v7 dictionaryWithObjects:v8 forKeys:v9 count:v10];
}

- (id)JSONObjectWith_CLClientRegistrationResult:(id)a3 info:(os_log_type_info_s *)a4
{
  void v8[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v5 = [a3 intValue];
    if (v5 < 9) {
      return (id)*((void *)&off_2649A89E8 + (int)v5);
    }
  }
  v7[0] = @"type";
  v7[1] = @"expected type";
  v8[0] = @"decode failure";
  v8[1] = @"CLClientRegistrationResult";
  v7[2] = @"raw value";
  v8[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (id)JSONObjectWith_CLSensorRecorder_Types__DataType:(id)a3 info:(os_log_type_info_s *)a4
{
  void v14[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v5 = NSString;
    unsigned int v6 = [a3 intValue];
    if (v6 > 2) {
      uint64_t v7 = (char *)&unk_22D3CB91F;
    }
    else {
      uint64_t v7 = off_2649A8A30[v6];
    }
    std::string::basic_string[abi:ne180100]<0>(__p, v7);
    if (v12 >= 0) {
      unsigned int v9 = __p;
    }
    else {
      unsigned int v9 = (void **)__p[0];
    }
    size_t v8 = (void *)[v5 stringWithUTF8String:v9];
    if (v12 < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    v13[0] = @"type";
    v13[1] = @"expected type";
    v14[0] = @"decode failure";
    v14[1] = @"CLSensorRecorder_Types::DataType";
    v13[2] = @"raw value";
    v14[2] = a3;
    return (id)[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
  }
  return v8;
}

- (id)JSONObjectWith_CLSimulationLocationDeliveryBehavior:(id)a3 info:(os_log_type_info_s *)a4
{
  void v8[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v5 = [a3 intValue];
    if (!v5) {
      return @"PassThrough";
    }
    if (v5 == 1) {
      return @"ConsiderType";
    }
  }
  v7[0] = @"type";
  v7[1] = @"expected type";
  v8[0] = @"decode failure";
  v8[1] = @"CLSimulationLocationDeliveryBehavior";
  v7[2] = @"raw value";
  v8[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (id)JSONObjectWith_CLSimulationLocationRepeatBehavior:(id)a3 info:(os_log_type_info_s *)a4
{
  void v8[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v5 = [a3 intValue];
    if (v5 < 3) {
      return off_2649A8A48[v5];
    }
  }
  v7[0] = @"type";
  v7[1] = @"expected type";
  v8[0] = @"decode failure";
  v8[1] = @"CLSimulationLocationRepeatBehavior";
  v7[2] = @"raw value";
  v8[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (id)JSONObjectWith_CLBarometerCalibration_Types__Context:(id)a3 info:(os_log_type_info_s *)a4
{
  void v8[3] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v5 = [a3 intValue];
    if (v5 < 0xB && ((0x40Fu >> v5) & 1) != 0) {
      return off_2649A8A60[v5];
    }
  }
  v7[0] = @"type";
  v7[1] = @"expected type";
  v8[0] = @"decode failure";
  v8[1] = @"CLBarometerCalibration_Types::Context::";
  v7[2] = @"raw value";
  v8[2] = a3;
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

@end