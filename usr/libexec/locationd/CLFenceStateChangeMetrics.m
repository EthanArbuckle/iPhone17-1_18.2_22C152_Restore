@interface CLFenceStateChangeMetrics
- (BOOL)airplaneMode;
- (BOOL)cellAvailable;
- (BOOL)hasLoiAtFence;
- (BOOL)hasSignificantPrior;
- (BOOL)isConservativeEntry;
- (BOOL)isEmergencyFence;
- (BOOL)isFreeWake;
- (BOOL)isHelperFence;
- (BOOL)isLowPower;
- (BOOL)isThrottledFence;
- (BOOL)passcodeLocked;
- (BOOL)significantFence;
- (BOOL)wifiAvailable;
- (NSString)bundleId;
- (double)loiDistance;
- (double)loiRadius;
- (id)description;
- (id)metricDictionary;
- (int64_t)loiType;
- (unint64_t)adjustedDistance;
- (unint64_t)adjustedDistanceToFenceBoundary;
- (unint64_t)currentState;
- (unint64_t)distanceFromNMinusOneStateChange;
- (unint64_t)distanceFromNMinusTwoStateChange;
- (unint64_t)distanceToFenceBoundary;
- (unint64_t)dominantMotionState;
- (unint64_t)effectiveRadius;
- (unint64_t)entryRadius;
- (unint64_t)eventLatency;
- (unint64_t)eventType;
- (unint64_t)eventTypeNMinusOneStateChange;
- (unint64_t)eventTypeNMinusTwoStateChange;
- (unint64_t)exitRadius;
- (unint64_t)fenceCategoryType;
- (unint64_t)fenceRadius;
- (unint64_t)fenceType;
- (unint64_t)lastHandledLocationAccuracy;
- (unint64_t)lastHandledLocationAge;
- (unint64_t)lastHandledLocationProvider;
- (unint64_t)locationAccuracy;
- (unint64_t)locationProvider;
- (unint64_t)motionState;
- (unint64_t)motionStateAfterNMinusOneStateChange;
- (unint64_t)motionStateAfterNMinusTwoStateChange;
- (unint64_t)motionStateBeforeNMinusOneStateChange;
- (unint64_t)motionStateBeforeStateChange;
- (unint64_t)nMinusOneState;
- (unint64_t)nMinusOneStateChangeLocationAccuracy;
- (unint64_t)nMinusOneStateChangeLocationProvider;
- (unint64_t)nMinusThreeState;
- (unint64_t)nMinusTwoState;
- (unint64_t)nMinusTwoStateChangeLocationAccuracy;
- (unint64_t)nMinusTwoStateChangeLocationProvider;
- (unint64_t)previousLocationAccuracy;
- (unint64_t)previousLocationAge;
- (unint64_t)previousLocationProvider;
- (unint64_t)reachabilityStatus;
- (unint64_t)settledState;
- (unint64_t)signalEnvironmentType;
- (unint64_t)stepsSinceNMinusOneStateChange;
- (unint64_t)stepsSinceNMinusTwoStateChange;
- (unint64_t)timeSinceDominantActivityChange;
- (unint64_t)timeSinceMotionActivityChange;
- (unint64_t)timeSinceNMinusOneStateChange;
- (unint64_t)timeSinceNMinusTwoStateChange;
- (unint64_t)timeSinceWifiRoam;
- (unint64_t)timeToInitialStateChange;
- (void)dealloc;
- (void)setAdjustedDistance:(unint64_t)a3;
- (void)setAdjustedDistanceToFenceBoundary:(unint64_t)a3;
- (void)setAirplaneMode:(BOOL)a3;
- (void)setBundleId:(id)a3;
- (void)setCellAvailable:(BOOL)a3;
- (void)setCurrentState:(unint64_t)a3;
- (void)setDistanceFromNMinusOneStateChange:(unint64_t)a3;
- (void)setDistanceFromNMinusTwoStateChange:(unint64_t)a3;
- (void)setDistanceToFenceBoundary:(unint64_t)a3;
- (void)setDominantMotionState:(unint64_t)a3;
- (void)setEffectiveRadius:(unint64_t)a3;
- (void)setEntryRadius:(unint64_t)a3;
- (void)setEventLatency:(unint64_t)a3;
- (void)setEventType:(unint64_t)a3;
- (void)setEventTypeNMinusOneStateChange:(unint64_t)a3;
- (void)setEventTypeNMinusTwoStateChange:(unint64_t)a3;
- (void)setExitRadius:(unint64_t)a3;
- (void)setFenceCategoryType:(unint64_t)a3;
- (void)setFenceRadius:(unint64_t)a3;
- (void)setFenceType:(unint64_t)a3;
- (void)setHasLoiAtFence:(BOOL)a3;
- (void)setHasSignificantPrior:(BOOL)a3;
- (void)setIsConservativeEntry:(BOOL)a3;
- (void)setIsEmergencyFence:(BOOL)a3;
- (void)setIsFreeWake:(BOOL)a3;
- (void)setIsHelperFence:(BOOL)a3;
- (void)setIsLowPower:(BOOL)a3;
- (void)setIsThrottledFence:(BOOL)a3;
- (void)setLastHandledLocationAccuracy:(unint64_t)a3;
- (void)setLastHandledLocationAge:(unint64_t)a3;
- (void)setLastHandledLocationProvider:(unint64_t)a3;
- (void)setLocationAccuracy:(unint64_t)a3;
- (void)setLocationProvider:(unint64_t)a3;
- (void)setLoiDistance:(double)a3;
- (void)setLoiRadius:(double)a3;
- (void)setLoiType:(int64_t)a3;
- (void)setMotionState:(unint64_t)a3;
- (void)setMotionStateAfterNMinusOneStateChange:(unint64_t)a3;
- (void)setMotionStateAfterNMinusTwoStateChange:(unint64_t)a3;
- (void)setMotionStateBeforeNMinusOneStateChange:(unint64_t)a3;
- (void)setMotionStateBeforeStateChange:(unint64_t)a3;
- (void)setNMinusOneState:(unint64_t)a3;
- (void)setNMinusOneStateChangeLocationAccuracy:(unint64_t)a3;
- (void)setNMinusOneStateChangeLocationProvider:(unint64_t)a3;
- (void)setNMinusThreeState:(unint64_t)a3;
- (void)setNMinusTwoState:(unint64_t)a3;
- (void)setNMinusTwoStateChangeLocationAccuracy:(unint64_t)a3;
- (void)setNMinusTwoStateChangeLocationProvider:(unint64_t)a3;
- (void)setPasscodeLocked:(BOOL)a3;
- (void)setPreviousLocationAccuracy:(unint64_t)a3;
- (void)setPreviousLocationAge:(unint64_t)a3;
- (void)setPreviousLocationProvider:(unint64_t)a3;
- (void)setReachabilityStatus:(unint64_t)a3;
- (void)setSettledState:(unint64_t)a3;
- (void)setSignalEnvironmentType:(unint64_t)a3;
- (void)setSignificantFence:(BOOL)a3;
- (void)setStepsSinceNMinusOneStateChange:(unint64_t)a3;
- (void)setStepsSinceNMinusTwoStateChange:(unint64_t)a3;
- (void)setTimeSinceDominantActivityChange:(unint64_t)a3;
- (void)setTimeSinceMotionActivityChange:(unint64_t)a3;
- (void)setTimeSinceNMinusOneStateChange:(unint64_t)a3;
- (void)setTimeSinceNMinusTwoStateChange:(unint64_t)a3;
- (void)setTimeSinceWifiRoam:(unint64_t)a3;
- (void)setTimeToInitialStateChange:(unint64_t)a3;
- (void)setWifiAvailable:(BOOL)a3;
@end

@implementation CLFenceStateChangeMetrics

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLFenceStateChangeMetrics;
  [(CLFenceStateChangeMetrics *)&v3 dealloc];
}

- (id)description
{
  id v2 = [(CLFenceStateChangeMetrics *)self metricDictionary];

  return [v2 description];
}

- (id)metricDictionary
{
  v4[0] = @"adjustedDistance";
  v5[0] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self adjustedDistance]];
  v4[1] = @"airplaneMode";
  v5[1] = +[NSNumber numberWithBool:[(CLFenceStateChangeMetrics *)self airplaneMode]];
  v4[2] = @"cellAvailable";
  v5[2] = +[NSNumber numberWithBool:[(CLFenceStateChangeMetrics *)self cellAvailable]];
  v4[3] = @"distanceFromNMinusOneStateChange";
  v5[3] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self distanceFromNMinusOneStateChange]];
  v4[4] = @"distanceFromNMinusTwoStateChange";
  v5[4] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self distanceFromNMinusTwoStateChange]];
  v4[5] = @"distanceToFenceBoundary";
  v5[5] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self distanceToFenceBoundary]];
  v4[6] = @"adjustedDistanceToFenceBoundary";
  v5[6] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self adjustedDistanceToFenceBoundary]];
  v4[7] = @"dominantMotionState";
  v5[7] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self dominantMotionState]];
  v4[8] = @"effectiveRadius";
  v5[8] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self effectiveRadius]];
  v4[9] = @"entryRadius";
  v5[9] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self entryRadius]];
  v4[10] = @"eventLatency";
  v5[10] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self eventLatency]];
  v4[11] = @"timeToInitialStateChange";
  v5[11] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self timeToInitialStateChange]];
  v4[12] = @"currentState";
  v5[12] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self currentState]];
  v4[13] = @"nMinusOneState";
  v5[13] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self nMinusOneState]];
  v4[14] = @"nMinusTwoState";
  v5[14] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self nMinusTwoState]];
  v4[15] = @"nMinusThreeState";
  v5[15] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self nMinusThreeState]];
  v4[16] = @"nMinusOneStateChangeLocationAccuracy";
  v5[16] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self nMinusOneStateChangeLocationAccuracy]];
  v4[17] = @"nMinusTwoStateChangeLocationAccuracy";
  v5[17] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self nMinusTwoStateChangeLocationAccuracy]];
  v4[18] = @"nMinusOneStateChangeLocationProvider";
  v5[18] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self nMinusOneStateChangeLocationProvider]];
  v4[19] = @"nMinusTwoStateChangeLocationProvider";
  v5[19] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self nMinusTwoStateChangeLocationProvider]];
  v4[20] = @"eventType";
  v5[20] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self eventType]];
  v4[21] = @"eventTypeNMinusOneStateChange";
  v5[21] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self eventTypeNMinusOneStateChange]];
  v4[22] = @"eventTypeNMinusTwoStateChange";
  v5[22] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self eventTypeNMinusTwoStateChange]];
  v4[23] = @"exitRadius";
  v5[23] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self exitRadius]];
  v4[24] = @"fenceCategoryType";
  v5[24] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self fenceCategoryType]];
  v4[25] = @"fenceRadius";
  v5[25] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self fenceRadius]];
  v4[26] = @"fenceType";
  v5[26] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self fenceType]];
  v4[27] = @"hasSignificantPrior";
  v5[27] = +[NSNumber numberWithBool:[(CLFenceStateChangeMetrics *)self hasSignificantPrior]];
  v4[28] = @"isConservativeEntry";
  v5[28] = +[NSNumber numberWithBool:[(CLFenceStateChangeMetrics *)self isConservativeEntry]];
  v4[29] = @"isEmergencyFence";
  v5[29] = +[NSNumber numberWithBool:[(CLFenceStateChangeMetrics *)self isEmergencyFence]];
  v4[30] = @"isFreeWake";
  v5[30] = +[NSNumber numberWithBool:[(CLFenceStateChangeMetrics *)self isFreeWake]];
  v4[31] = @"isHelperFence";
  v5[31] = +[NSNumber numberWithBool:[(CLFenceStateChangeMetrics *)self isHelperFence]];
  v4[32] = @"isLowPower";
  v5[32] = +[NSNumber numberWithBool:[(CLFenceStateChangeMetrics *)self isLowPower]];
  v4[33] = @"isThrottledFence";
  v5[33] = +[NSNumber numberWithBool:[(CLFenceStateChangeMetrics *)self isThrottledFence]];
  v4[34] = @"locationAccuracy";
  v5[34] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self locationAccuracy]];
  v4[35] = @"locationProvider";
  v5[35] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self locationProvider]];
  v4[36] = @"loiDistance";
  [(CLFenceStateChangeMetrics *)self loiDistance];
  v5[36] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v4[37] = @"loiRadius";
  [(CLFenceStateChangeMetrics *)self loiRadius];
  v5[37] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v4[38] = @"motionStateBeforeNMinusOneStateChange";
  v5[38] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self motionStateBeforeNMinusOneStateChange]];
  v4[39] = @"motionState";
  v5[39] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self motionState]];
  v4[40] = @"motionStateAfterNMinusOneStateChange";
  v5[40] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self motionStateAfterNMinusOneStateChange]];
  v4[41] = @"motionStateAfterNMinusTwoStateChange";
  v5[41] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self motionStateAfterNMinusTwoStateChange]];
  v4[42] = @"motionStateBeforeStateChange";
  v5[42] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self motionStateBeforeStateChange]];
  v4[43] = @"previousLocationAccuracy";
  v5[43] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self previousLocationAccuracy]];
  v4[44] = @"passcodeLocked";
  v5[44] = +[NSNumber numberWithBool:[(CLFenceStateChangeMetrics *)self passcodeLocked]];
  v4[45] = @"previousLocationAge";
  v5[45] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self previousLocationAge]];
  v4[46] = @"previousLocationProvider";
  v5[46] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self previousLocationProvider]];
  v4[47] = @"lastHandledLocationAccuracy";
  v5[47] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self lastHandledLocationAccuracy]];
  v4[48] = @"lastHandledLocationAge";
  v5[48] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self lastHandledLocationAge]];
  v4[49] = @"lastHandledLocationProvider";
  v5[49] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self lastHandledLocationProvider]];
  v4[50] = @"reachabilityStatus";
  v5[50] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self reachabilityStatus]];
  v4[51] = @"settledState";
  v5[51] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self settledState]];
  v4[52] = @"signalEnvironmentType";
  v5[52] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self signalEnvironmentType]];
  v4[53] = @"significantFence";
  v5[53] = +[NSNumber numberWithBool:[(CLFenceStateChangeMetrics *)self significantFence]];
  v4[54] = @"stepsSinceNMinusOneStateChange";
  v5[54] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self stepsSinceNMinusOneStateChange]];
  v4[55] = @"stepsSinceNMinusTwoStateChange";
  v5[55] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self stepsSinceNMinusTwoStateChange]];
  v4[56] = @"timeSinceDominantActivityChange";
  v5[56] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self timeSinceDominantActivityChange]];
  v4[57] = @"timeSinceMotionActivityChange";
  v5[57] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self timeSinceMotionActivityChange]];
  v4[58] = @"timeSinceNMinusOneStateChange";
  v5[58] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self timeSinceNMinusOneStateChange]];
  v4[59] = @"timeSinceNMinusTwoStateChange";
  v5[59] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self timeSinceNMinusTwoStateChange]];
  v4[60] = @"timeSinceWifiRoam";
  v5[60] = +[NSNumber numberWithUnsignedInteger:[(CLFenceStateChangeMetrics *)self timeSinceWifiRoam]];
  v4[61] = @"wifiAvailable";
  v5[61] = +[NSNumber numberWithBool:[(CLFenceStateChangeMetrics *)self wifiAvailable]];
  return +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:62];
}

- (unint64_t)adjustedDistance
{
  return self->_adjustedDistance;
}

- (void)setAdjustedDistance:(unint64_t)a3
{
  self->_adjustedDistance = a3;
}

- (BOOL)airplaneMode
{
  return self->_airplaneMode;
}

- (void)setAirplaneMode:(BOOL)a3
{
  self->_airplaneMode = a3;
}

- (BOOL)cellAvailable
{
  return self->_cellAvailable;
}

- (void)setCellAvailable:(BOOL)a3
{
  self->_cellAvailable = a3;
}

- (unint64_t)distanceFromNMinusOneStateChange
{
  return self->_distanceFromNMinusOneStateChange;
}

- (void)setDistanceFromNMinusOneStateChange:(unint64_t)a3
{
  self->_distanceFromNMinusOneStateChange = a3;
}

- (unint64_t)distanceFromNMinusTwoStateChange
{
  return self->_distanceFromNMinusTwoStateChange;
}

- (void)setDistanceFromNMinusTwoStateChange:(unint64_t)a3
{
  self->_distanceFromNMinusTwoStateChange = a3;
}

- (unint64_t)distanceToFenceBoundary
{
  return self->_distanceToFenceBoundary;
}

- (void)setDistanceToFenceBoundary:(unint64_t)a3
{
  self->_distanceToFenceBoundary = a3;
}

- (unint64_t)adjustedDistanceToFenceBoundary
{
  return self->_adjustedDistanceToFenceBoundary;
}

- (void)setAdjustedDistanceToFenceBoundary:(unint64_t)a3
{
  self->_adjustedDistanceToFenceBoundary = a3;
}

- (unint64_t)dominantMotionState
{
  return self->_dominantMotionState;
}

- (void)setDominantMotionState:(unint64_t)a3
{
  self->_dominantMotionState = a3;
}

- (unint64_t)effectiveRadius
{
  return self->_effectiveRadius;
}

- (void)setEffectiveRadius:(unint64_t)a3
{
  self->_effectiveRadius = a3;
}

- (unint64_t)entryRadius
{
  return self->_entryRadius;
}

- (void)setEntryRadius:(unint64_t)a3
{
  self->_entryRadius = a3;
}

- (unint64_t)eventLatency
{
  return self->_eventLatency;
}

- (void)setEventLatency:(unint64_t)a3
{
  self->_eventLatency = a3;
}

- (unint64_t)timeToInitialStateChange
{
  return self->_timeToInitialStateChange;
}

- (void)setTimeToInitialStateChange:(unint64_t)a3
{
  self->_timeToInitialStateChange = a3;
}

- (unint64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(unint64_t)a3
{
  self->_currentState = a3;
}

- (unint64_t)nMinusOneState
{
  return self->_nMinusOneState;
}

- (void)setNMinusOneState:(unint64_t)a3
{
  self->_nMinusOneState = a3;
}

- (unint64_t)nMinusTwoState
{
  return self->_nMinusTwoState;
}

- (void)setNMinusTwoState:(unint64_t)a3
{
  self->_nMinusTwoState = a3;
}

- (unint64_t)nMinusThreeState
{
  return self->_nMinusThreeState;
}

- (void)setNMinusThreeState:(unint64_t)a3
{
  self->_nMinusThreeState = a3;
}

- (unint64_t)nMinusOneStateChangeLocationProvider
{
  return self->_nMinusOneStateChangeLocationProvider;
}

- (void)setNMinusOneStateChangeLocationProvider:(unint64_t)a3
{
  self->_nMinusOneStateChangeLocationProvider = a3;
}

- (unint64_t)nMinusTwoStateChangeLocationProvider
{
  return self->_nMinusTwoStateChangeLocationProvider;
}

- (void)setNMinusTwoStateChangeLocationProvider:(unint64_t)a3
{
  self->_nMinusTwoStateChangeLocationProvider = a3;
}

- (unint64_t)nMinusOneStateChangeLocationAccuracy
{
  return self->_nMinusOneStateChangeLocationAccuracy;
}

- (void)setNMinusOneStateChangeLocationAccuracy:(unint64_t)a3
{
  self->_nMinusOneStateChangeLocationAccuracy = a3;
}

- (unint64_t)nMinusTwoStateChangeLocationAccuracy
{
  return self->_nMinusTwoStateChangeLocationAccuracy;
}

- (void)setNMinusTwoStateChangeLocationAccuracy:(unint64_t)a3
{
  self->_nMinusTwoStateChangeLocationAccuracy = a3;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(unint64_t)a3
{
  self->_eventType = a3;
}

- (unint64_t)eventTypeNMinusOneStateChange
{
  return self->_eventTypeNMinusOneStateChange;
}

- (void)setEventTypeNMinusOneStateChange:(unint64_t)a3
{
  self->_eventTypeNMinusOneStateChange = a3;
}

- (unint64_t)eventTypeNMinusTwoStateChange
{
  return self->_eventTypeNMinusTwoStateChange;
}

- (void)setEventTypeNMinusTwoStateChange:(unint64_t)a3
{
  self->_eventTypeNMinusTwoStateChange = a3;
}

- (unint64_t)exitRadius
{
  return self->_exitRadius;
}

- (void)setExitRadius:(unint64_t)a3
{
  self->_exitRadius = a3;
}

- (unint64_t)fenceCategoryType
{
  return self->_fenceCategoryType;
}

- (void)setFenceCategoryType:(unint64_t)a3
{
  self->_fenceCategoryType = a3;
}

- (unint64_t)fenceRadius
{
  return self->_fenceRadius;
}

- (void)setFenceRadius:(unint64_t)a3
{
  self->_fenceRadius = a3;
}

- (unint64_t)fenceType
{
  return self->_fenceType;
}

- (void)setFenceType:(unint64_t)a3
{
  self->_fenceType = a3;
}

- (BOOL)isConservativeEntry
{
  return self->_isConservativeEntry;
}

- (void)setIsConservativeEntry:(BOOL)a3
{
  self->_isConservativeEntry = a3;
}

- (BOOL)isEmergencyFence
{
  return self->_isEmergencyFence;
}

- (void)setIsEmergencyFence:(BOOL)a3
{
  self->_isEmergencyFence = a3;
}

- (BOOL)isFreeWake
{
  return self->_isFreeWake;
}

- (void)setIsFreeWake:(BOOL)a3
{
  self->_isFreeWake = a3;
}

- (BOOL)isHelperFence
{
  return self->_isHelperFence;
}

- (void)setIsHelperFence:(BOOL)a3
{
  self->_isHelperFence = a3;
}

- (BOOL)isLowPower
{
  return self->_isLowPower;
}

- (void)setIsLowPower:(BOOL)a3
{
  self->_isLowPower = a3;
}

- (BOOL)isThrottledFence
{
  return self->_isThrottledFence;
}

- (void)setIsThrottledFence:(BOOL)a3
{
  self->_isThrottledFence = a3;
}

- (unint64_t)locationAccuracy
{
  return self->_locationAccuracy;
}

- (void)setLocationAccuracy:(unint64_t)a3
{
  self->_locationAccuracy = a3;
}

- (unint64_t)locationProvider
{
  return self->_locationProvider;
}

- (void)setLocationProvider:(unint64_t)a3
{
  self->_locationProvider = a3;
}

- (unint64_t)motionStateBeforeNMinusOneStateChange
{
  return self->_motionStateBeforeNMinusOneStateChange;
}

- (void)setMotionStateBeforeNMinusOneStateChange:(unint64_t)a3
{
  self->_motionStateBeforeNMinusOneStateChange = a3;
}

- (unint64_t)motionState
{
  return self->_motionState;
}

- (void)setMotionState:(unint64_t)a3
{
  self->_motionState = a3;
}

- (unint64_t)motionStateAfterNMinusOneStateChange
{
  return self->_motionStateAfterNMinusOneStateChange;
}

- (void)setMotionStateAfterNMinusOneStateChange:(unint64_t)a3
{
  self->_motionStateAfterNMinusOneStateChange = a3;
}

- (unint64_t)motionStateAfterNMinusTwoStateChange
{
  return self->_motionStateAfterNMinusTwoStateChange;
}

- (void)setMotionStateAfterNMinusTwoStateChange:(unint64_t)a3
{
  self->_motionStateAfterNMinusTwoStateChange = a3;
}

- (unint64_t)motionStateBeforeStateChange
{
  return self->_motionStateBeforeStateChange;
}

- (void)setMotionStateBeforeStateChange:(unint64_t)a3
{
  self->_motionStateBeforeStateChange = a3;
}

- (BOOL)passcodeLocked
{
  return self->_passcodeLocked;
}

- (void)setPasscodeLocked:(BOOL)a3
{
  self->_passcodeLocked = a3;
}

- (unint64_t)previousLocationAccuracy
{
  return self->_previousLocationAccuracy;
}

- (void)setPreviousLocationAccuracy:(unint64_t)a3
{
  self->_previousLocationAccuracy = a3;
}

- (unint64_t)previousLocationAge
{
  return self->_previousLocationAge;
}

- (void)setPreviousLocationAge:(unint64_t)a3
{
  self->_previousLocationAge = a3;
}

- (unint64_t)previousLocationProvider
{
  return self->_previousLocationProvider;
}

- (void)setPreviousLocationProvider:(unint64_t)a3
{
  self->_previousLocationProvider = a3;
}

- (unint64_t)lastHandledLocationAccuracy
{
  return self->_lastHandledLocationAccuracy;
}

- (void)setLastHandledLocationAccuracy:(unint64_t)a3
{
  self->_lastHandledLocationAccuracy = a3;
}

- (unint64_t)lastHandledLocationAge
{
  return self->_lastHandledLocationAge;
}

- (void)setLastHandledLocationAge:(unint64_t)a3
{
  self->_lastHandledLocationAge = a3;
}

- (unint64_t)lastHandledLocationProvider
{
  return self->_lastHandledLocationProvider;
}

- (void)setLastHandledLocationProvider:(unint64_t)a3
{
  self->_lastHandledLocationProvider = a3;
}

- (unint64_t)reachabilityStatus
{
  return self->_reachabilityStatus;
}

- (void)setReachabilityStatus:(unint64_t)a3
{
  self->_reachabilityStatus = a3;
}

- (unint64_t)settledState
{
  return self->_settledState;
}

- (void)setSettledState:(unint64_t)a3
{
  self->_settledState = a3;
}

- (unint64_t)signalEnvironmentType
{
  return self->_signalEnvironmentType;
}

- (void)setSignalEnvironmentType:(unint64_t)a3
{
  self->_signalEnvironmentType = a3;
}

- (BOOL)significantFence
{
  return self->_significantFence;
}

- (void)setSignificantFence:(BOOL)a3
{
  self->_significantFence = a3;
}

- (unint64_t)stepsSinceNMinusOneStateChange
{
  return self->_stepsSinceNMinusOneStateChange;
}

- (void)setStepsSinceNMinusOneStateChange:(unint64_t)a3
{
  self->_stepsSinceNMinusOneStateChange = a3;
}

- (unint64_t)stepsSinceNMinusTwoStateChange
{
  return self->_stepsSinceNMinusTwoStateChange;
}

- (void)setStepsSinceNMinusTwoStateChange:(unint64_t)a3
{
  self->_stepsSinceNMinusTwoStateChange = a3;
}

- (unint64_t)timeSinceDominantActivityChange
{
  return self->_timeSinceDominantActivityChange;
}

- (void)setTimeSinceDominantActivityChange:(unint64_t)a3
{
  self->_timeSinceDominantActivityChange = a3;
}

- (unint64_t)timeSinceMotionActivityChange
{
  return self->_timeSinceMotionActivityChange;
}

- (void)setTimeSinceMotionActivityChange:(unint64_t)a3
{
  self->_timeSinceMotionActivityChange = a3;
}

- (unint64_t)timeSinceNMinusOneStateChange
{
  return self->_timeSinceNMinusOneStateChange;
}

- (void)setTimeSinceNMinusOneStateChange:(unint64_t)a3
{
  self->_timeSinceNMinusOneStateChange = a3;
}

- (unint64_t)timeSinceNMinusTwoStateChange
{
  return self->_timeSinceNMinusTwoStateChange;
}

- (void)setTimeSinceNMinusTwoStateChange:(unint64_t)a3
{
  self->_timeSinceNMinusTwoStateChange = a3;
}

- (unint64_t)timeSinceWifiRoam
{
  return self->_timeSinceWifiRoam;
}

- (void)setTimeSinceWifiRoam:(unint64_t)a3
{
  self->_timeSinceWifiRoam = a3;
}

- (BOOL)wifiAvailable
{
  return self->_wifiAvailable;
}

- (void)setWifiAvailable:(BOOL)a3
{
  self->_wifiAvailable = a3;
}

- (double)loiDistance
{
  return self->_loiDistance;
}

- (void)setLoiDistance:(double)a3
{
  self->_loiDistance = a3;
}

- (double)loiRadius
{
  return self->_loiRadius;
}

- (void)setLoiRadius:(double)a3
{
  self->_loiRadius = a3;
}

- (BOOL)hasSignificantPrior
{
  return self->_hasSignificantPrior;
}

- (void)setHasSignificantPrior:(BOOL)a3
{
  self->_hasSignificantPrior = a3;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (int64_t)loiType
{
  return self->_loiType;
}

- (void)setLoiType:(int64_t)a3
{
  self->_loiType = a3;
}

- (BOOL)hasLoiAtFence
{
  return self->_hasLoiAtFence;
}

- (void)setHasLoiAtFence:(BOOL)a3
{
  self->_hasLoiAtFence = a3;
}

@end