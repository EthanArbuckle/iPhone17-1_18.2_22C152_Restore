@interface CLSensorMonitorSimulatedDataGenerator
+ (ActivityEvent)generateSimulatedPhysicalActivityEventsData:(SEL)a3;
+ (CLCatherineData)generateHighFrequencyHeartRateData:(SEL)a3;
+ (CLElevationChangeEntry)generateSimulatedElevationData:(SEL)a3;
+ (CLOdometerEntry)generateSimulatedOdometerData:(SEL)a3;
+ (CLOdometerSuitability)generateSimulatedOdometerSuitabilityData:(id)a3;
+ (CLStepCountEntry)generateSimulatedPedometerData:(SEL)a3;
@end

@implementation CLSensorMonitorSimulatedDataGenerator

+ (CLStepCountEntry)generateSimulatedPedometerData:(SEL)a3
{
  [a4 objectForKeyedSubscript:@"startTime"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [objc_msgSend(a4, "objectForKeyedSubscript:", @"startTime") doubleValue];
  }
  else {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  }
  retstr->startTime = Current;
  [a4 objectForKeyedSubscript:@"count"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned int v7 = [[a4 objectForKeyedSubscript:@"count"] unsignedIntValue];
  }
  else {
    unsigned int v7 = sub_100C4A650(2, 100);
  }
  retstr->count = v7;
  [a4 objectForKeyedSubscript:@"distance"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [objc_msgSend(a4, "objectForKeyedSubscript:", @"distance") doubleValue];
  }
  else {
    double v8 = sub_100C4A6FC(0.1, 10.0);
  }
  retstr->distance = v8;
  [a4 objectForKeyedSubscript:@"floorsAscended"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned int v9 = [[a4 objectForKeyedSubscript:@"floorsAscended"] unsignedIntValue];
  }
  else {
    unsigned int v9 = sub_100C4A650(2, 100);
  }
  retstr->floorsAscended = v9;
  [a4 objectForKeyedSubscript:@"floorsDescended"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned int v10 = [[a4 objectForKeyedSubscript:@"floorsDescended"] unsignedIntValue];
  }
  else {
    unsigned int v10 = sub_100C4A650(2, 100);
  }
  retstr->floorsDescended = v10;
  [a4 objectForKeyedSubscript:@"recordId"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v11 = [[a4 objectForKeyedSubscript:@"recordId"] unsignedIntValue];
  }
  else {
    int v11 = sub_100C4A650(1, 100);
  }
  retstr->recordId = v11;
  [a4 objectForKeyedSubscript:@"currentPace"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [objc_msgSend(a4, "objectForKeyedSubscript:", @"currentPace") doubleValue];
  }
  else {
    double v12 = sub_100C4A6FC(1.0, 2.0);
  }
  retstr->currentPace = v12;
  [a4 objectForKeyedSubscript:@"currentCadence"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [objc_msgSend(a4, "objectForKeyedSubscript:", @"currentCadence") doubleValue];
  }
  else {
    double v13 = sub_100C4A6FC(1.0, 2.0);
  }
  retstr->currentCadence = v13;
  [a4 objectForKeyedSubscript:@"firstStepTime"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [objc_msgSend(a4, "objectForKeyedSubscript:", @"firstStepTime") doubleValue];
  }
  else {
    CFAbsoluteTime v14 = CFAbsoluteTimeGetCurrent() + -5.0;
  }
  retstr->firstStepTime = v14;
  [a4 objectForKeyedSubscript:@"activeTime"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [objc_msgSend(a4, "objectForKeyedSubscript:", @"activeTime") doubleValue];
  }
  else {
    double v15 = sub_100C4A6FC(1.0, 2.0);
  }
  retstr->activeTime = v15;
  [a4 objectForKeyedSubscript:@"isOdometerDistance"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v16 = [[a4 objectForKeyedSubscript:@"isOdometerDistance"] BOOLValue];
  }
  else {
    unsigned __int8 v16 = sub_100C4A650(0, 1) != 0;
  }
  retstr->isOdometerDistance = v16;
  [a4 objectForKeyedSubscript:@"isOdometerPace"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v17 = [[a4 objectForKeyedSubscript:@"isOdometerPace"] boolValue];
  }
  else {
    unsigned __int8 v17 = sub_100C4A650(0, 1) != 0;
  }
  retstr->isOdometerPace = v17;
  [a4 objectForKeyedSubscript:@"pushCount"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned int v18 = [[a4 objectForKeyedSubscript:@"pushCount"] unsignedIntValue];
  }
  else {
    unsigned int v18 = sub_100C4A650(2, 100);
  }
  retstr->pushCount = v18;
  [a4 objectForKeyedSubscript:@"workoutType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned int v19 = [[a4 objectForKeyedSubscript:@"workoutType"] unsignedIntValue];
  }
  else {
    unsigned int v19 = sub_100C4A650(2, 3);
  }
  retstr->workoutType = v19;
  [a4 objectForKeyedSubscript:@"elevationAscended"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned int v20 = [[a4 objectForKeyedSubscript:@"elevationAscended"] unsignedIntValue];
  }
  else {
    unsigned int v20 = sub_100C4A650(2, 100);
  }
  retstr->elevationAscended = v20;
  [a4 objectForKeyedSubscript:@"elevationDescended"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned int v21 = [[a4 objectForKeyedSubscript:@"elevationDescended"] unsignedIntValue];
  }
  else {
    unsigned int v21 = sub_100C4A650(2, 100);
  }
  retstr->elevationDescended = v21;
  [a4 objectForKeyedSubscript:@"distanceSource"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v22 = [[a4 objectForKeyedSubscript:@"distanceSource"] unsignedIntValue];
  }
  else {
    unsigned __int8 v22 = sub_100C4A650(1, 5);
  }
  *(&retstr->falseStepDetectorState.data + 2) = v22;
  id v23 = objc_alloc_init((Class)NSUUID);
  [a4 objectForKeyedSubscript:@"sourceId"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    result = (CLStepCountEntry *)[a4 objectForKeyedSubscript:@"sourceId"];
  }
  else {
    result = (CLStepCountEntry *)[v23 UUIDString];
  }
  retstr->sourceId = (__CFString *)result;
  return result;
}

+ (CLOdometerSuitability)generateSimulatedOdometerSuitabilityData:(id)a3
{
  [a3 objectForKeyedSubscript:@"startTime"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [objc_msgSend(a3, "objectForKeyedSubscript:", @"startTime") doubleValue];
  }
  else {
    double Current = CFAbsoluteTimeGetCurrent();
  }
  double v5 = Current;
  [a3 objectForKeyedSubscript:@"suitableForRunning"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned int v6 = [[a3 objectForKeyedSubscript:@"suitableForRunning"] BOOLValue];
  }
  else {
    unsigned int v6 = sub_100C4A650(0, 1) != 0;
  }
  [a3 objectForKeyedSubscript:@"suitableForWalking"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned int v7 = [[a3 objectForKeyedSubscript:@"suitableForWalking"] boolValue];
  }
  else {
    unsigned int v7 = sub_100C4A650(0, 1) != 0;
  }
  uint64_t v8 = 256;
  if (!v7) {
    uint64_t v8 = 0;
  }
  uint64_t v9 = v8 | v6;
  double v10 = v5;
  result.var1 = v9;
  result.var2 = BYTE1(v9);
  result.var0 = v10;
  return result;
}

+ (CLOdometerEntry)generateSimulatedOdometerData:(SEL)a3
{
  [a4 objectForKeyedSubscript:@"startTime"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [objc_msgSend(a4, "objectForKeyedSubscript:", @"startTime") doubleValue];
  }
  else {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  }
  retstr->startTime = Current;
  [a4 objectForKeyedSubscript:@"distance"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [objc_msgSend(a4, "objectForKeyedSubscript:", @"distance") doubleValue];
  }
  else {
    double v7 = sub_100C4A6FC(0.1, 1000.0);
  }
  retstr->distance = v7;
  [a4 objectForKeyedSubscript:@"speed"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [objc_msgSend(a4, "objectForKeyedSubscript:", @"speed") doubleValue];
  }
  else {
    double v8 = sub_100C4A6FC(0.1, 10.0);
  }
  retstr->speed = v8;
  [a4 objectForKeyedSubscript:@"rawSpeed"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [objc_msgSend(a4, "objectForKeyedSubscript:", @"rawSpeed") doubleValue];
  }
  else {
    double v9 = sub_100C4A6FC(0.1, 10.0);
  }
  retstr->rawSpeed = v9;
  [a4 objectForKeyedSubscript:@"gpsSpeedAccuracy"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [objc_msgSend(a4, "objectForKeyedSubscript:", @"gpsSpeedAccuracy") doubleValue];
  }
  else {
    double v10 = sub_100C4A6FC(0.1, 10.0);
  }
  retstr->gpsSpeedAccuracy = v10;
  [a4 objectForKeyedSubscript:@"accuracy"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [objc_msgSend(a4, "objectForKeyedSubscript:", @"accuracy") doubleValue];
  }
  else {
    double v11 = sub_100C4A6FC(0.1, 10.0);
  }
  retstr->accuracy = v11;
  [a4 objectForKeyedSubscript:@"originDevice"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v12 = [[a4 objectForKeyedSubscript:@"originDevice"] unsignedIntValue];
  }
  else {
    int v12 = sub_100C4A650(1, 2);
  }
  retstr->originDevice = v12;
  [a4 objectForKeyedSubscript:@"groundAltitude"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [objc_msgSend(a4, "objectForKeyedSubscript:", @"groundAltitude") doubleValue];
  }
  else {
    double v13 = sub_100C4A6FC(10.0, 2000.0);
  }
  retstr->groundAltitude = v13;
  [a4 objectForKeyedSubscript:@"groundAltitudeUncertainty"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [objc_msgSend(a4, "objectForKeyedSubscript:", @"groundAltitudeUncertainty") doubleValue];
  }
  else {
    double v14 = sub_100C4A6FC(0.1, 10.0);
  }
  retstr->groundAltitudeUncertainty = v14;
  [a4 objectForKeyedSubscript:@"timestampGps"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [objc_msgSend(a4, "objectForKeyedSubscript:", @"timestampGps") doubleValue];
  }
  else {
    CFAbsoluteTime v15 = CFAbsoluteTimeGetCurrent();
  }
  retstr->timestampGps = v15;
  [a4 objectForKeyedSubscript:@"slope"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [objc_msgSend(a4, "objectForKeyedSubscript:", @"slope") doubleValue];
  }
  else {
    double v16 = sub_100C4A6FC(0.1, 2.0);
  }
  retstr->slope = v16;
  [a4 objectForKeyedSubscript:@"maxAbsSlope"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    CLOdometerSuitability result = (CLOdometerEntry *)[[a4 objectForKeyedSubscript:@"maxAbsSlope"] doubleValue];
  }
  else {
    double v18 = sub_100C4A6FC(0.1, 2.0);
  }
  retstr->maxAbsSlope = v18;
  return result;
}

+ (CLElevationChangeEntry)generateSimulatedElevationData:(SEL)a3
{
  [a4 objectForKeyedSubscript:@"startTime"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [objc_msgSend(a4, "objectForKeyedSubscript:", @"startTime") doubleValue];
  }
  else {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  }
  retstr->var1 = Current;
  [a4 objectForKeyedSubscript:@"elevationAscended"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned int v7 = [[a4 objectForKeyedSubscript:@"elevationAscended"] unsignedIntValue];
  }
  else {
    unsigned int v7 = sub_100C4A650(2, 1000);
  }
  retstr->var2 = v7;
  [a4 objectForKeyedSubscript:@"elevationDescended"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned int v8 = [[a4 objectForKeyedSubscript:@"elevationDescended"] unsignedIntValue];
  }
  else {
    unsigned int v8 = sub_100C4A650(2, 1000);
  }
  retstr->var3 = v8;
  [a4 objectForKeyedSubscript:@"source"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    CLOdometerSuitability result = (CLElevationChangeEntry *)[objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"source"), "unsignedIntValue");
  }
  else {
    CLOdometerSuitability result = (CLElevationChangeEntry *)sub_100C4A650(0, 5);
  }
  retstr->var6 = (int)result;
  return result;
}

+ (ActivityEvent)generateSimulatedPhysicalActivityEventsData:(SEL)a3
{
  [a4 objectForKeyedSubscript:@"startTime"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [objc_msgSend(a4, "objectForKeyedSubscript:", @"startTime") doubleValue];
  }
  else {
    CFAbsoluteTime v6 = CFAbsoluteTimeGetCurrent() + -5.0;
  }
  retstr->var0 = v6;
  [a4 objectForKeyedSubscript:@"eventType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v7 = [[a4 objectForKeyedSubscript:@"eventType"] unsignedIntValue];
  }
  else {
    int64_t v7 = (int)sub_100C4A650(0, 1);
  }
  retstr->var1 = v7;
  [a4 objectForKeyedSubscript:@"action"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v8 = [[a4 objectForKeyedSubscript:@"action"] unsignedIntValue];
  }
  else {
    int64_t v8 = (int)sub_100C4A650(0, 1);
  }
  retstr->var2 = v8;
  [a4 objectForKeyedSubscript:@"reason"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v9 = [[a4 objectForKeyedSubscript:@"reason"] unsignedIntValue];
  }
  else {
    int64_t v9 = (int)sub_100C4A650(1, 23);
  }
  retstr->var3 = v9;
  [a4 objectForKeyedSubscript:@"workoutType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v10 = [[a4 objectForKeyedSubscript:@"workoutType"] unsignedIntValue];
  }
  else {
    int64_t v10 = (int)sub_100C4A650(0, 10);
  }
  retstr->var4 = v10;
  [a4 objectForKeyedSubscript:@"recoveryStartTime"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [objc_msgSend(a4, "objectForKeyedSubscript:", @"recoveryStartTime") doubleValue];
  }
  else {
    CFAbsoluteTime v11 = CFAbsoluteTimeGetCurrent() + -2.0;
  }
  retstr->var5 = v11;
  [a4 objectForKeyedSubscript:@"recoveryEndTime"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    CLOdometerSuitability result = [[objc_msgSend(a4, "objectForKeyedSubscript:", @"recoveryEndTime") doubleValue];
  }
  else {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  }
  retstr->var6 = Current;
  return result;
}

+ (CLCatherineData)generateHighFrequencyHeartRateData:(SEL)a3
{
  [a4 objectForKeyedSubscript:@"startTime"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [objc_msgSend(a4, "objectForKeyedSubscript:", @"startTime") doubleValue];
  }
  else {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  }
  retstr->var6 = Current;
  [a4 objectForKeyedSubscript:@"heartRate"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned int v7 = [[a4 objectForKeyedSubscript:@"heartRate"] unsignedIntValue];
  }
  else {
    unsigned int v7 = sub_100C4A650(50, 200);
  }
  retstr->var2 = (double)v7;
  [a4 objectForKeyedSubscript:@"confidence"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [objc_msgSend(a4, "objectForKeyedSubscript:", @"confidence") doubleValue];
  }
  else {
    double v8 = sub_100C4A6FC(0.8, 1.0);
  }
  retstr->var3 = v8;
  [a4 objectForKeyedSubscript:@"error"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v9 = [[a4 objectForKeyedSubscript:@"error"] boolValue];
  }
  else {
    unsigned __int8 v9 = 0;
  }
  retstr->var4 = v9;
  [a4 objectForKeyedSubscript:@"dataSource"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v10 = [[a4 objectForKeyedSubscript:@"dataSource"] unsignedIntValue];
  }
  else {
    int v10 = 3;
  }
  retstr->var0 = v10;
  [a4 objectForKeyedSubscript:@"context"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v11 = [[a4 objectForKeyedSubscript:@"context"] unsignedIntValue];
  }
  else {
    int v11 = sub_100C4A650(1, 11);
  }
  retstr->var8 = v11;
  [a4 objectForKeyedSubscript:@"timestamp"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    CLOdometerSuitability result = [[objc_msgSend(a4, "objectForKeyedSubscript:", @"timestamp") doubleValue];
  }
  else {
    CFAbsoluteTime v13 = CFAbsoluteTimeGetCurrent();
  }
  retstr->var5 = v13;
  return result;
}

@end