@interface TAFilterGeneralSettings
- (BOOL)allowNavGeoHintAsPrivateVehicleHint;
- (TAFilterGeneralSettings)initWithDefaults;
- (TAFilterGeneralSettings)initWithDurationOfConsideration:(double)a3 thresholdOfLocationRelevance:(double)a4 thresholdOfSignificantDuration:(double)a5 thresholdOfSignificantDistance:(double)a6 capOfReasonableWalkingSpeed:(double)a7 allowNavGeoHintAsPrivateVehicleHint:(BOOL)a8 vehicularImmediacyType:(unint64_t)a9 beepOnMoveVehicularImmediacyType:(unint64_t)a10 beepOnMovePedestrianImmediacyType:(unint64_t)a11 nextPLOIVehicularImmediacyType:(unint64_t)a12 nextPLOIPedestrianImmediacyType:(unint64_t)a13 beepOnMoveConsiderationTimeInterval:(unint64_t)a14;
- (TAFilterGeneralSettings)initWithDurationOfConsiderationOrDefault:(id)a3 thresholdOfLocationRelevanceOrDefault:(id)a4 thresholdOfSignificantDurationOrDefault:(id)a5 thresholdOfSignificantDistanceOrDefault:(id)a6 capOfReasonableWalkingSpeedOrDefault:(id)a7 allowNavGeoHintAsPrivateVehicleHintOrDefault:(id)a8 vehicularImmediacyTypeOrDefault:(id)a9 beepOnMoveVehicularImmediacyTypeOrDefault:(id)a10 beepOnMovePedestrianImmediacyTypeOrDefault:(id)a11 nextPLOIVehicularImmediacyTypeOrDefault:(id)a12 nextPLOIPedestrianImmediacyTypeOrDefault:(id)a13 beepOnMoveConsiderationTimeIntervalOrDefault:(id)a14;
- (double)capOfReasonableWalkingSpeed;
- (double)durationOfConsideration;
- (double)thresholdOfLocationRelevance;
- (double)thresholdOfSignificantDistance;
- (double)thresholdOfSignificantDuration;
- (unint64_t)beepOnMoveConsiderationTimeInterval;
- (unint64_t)beepOnMovePedestrianImmediacyType;
- (unint64_t)beepOnMoveVehicularImmediacyType;
- (unint64_t)nextPLOIPedestrianImmediacyType;
- (unint64_t)nextPLOIVehicularImmediacyType;
- (unint64_t)vehicularImmediacyType;
@end

@implementation TAFilterGeneralSettings

- (TAFilterGeneralSettings)initWithDurationOfConsideration:(double)a3 thresholdOfLocationRelevance:(double)a4 thresholdOfSignificantDuration:(double)a5 thresholdOfSignificantDistance:(double)a6 capOfReasonableWalkingSpeed:(double)a7 allowNavGeoHintAsPrivateVehicleHint:(BOOL)a8 vehicularImmediacyType:(unint64_t)a9 beepOnMoveVehicularImmediacyType:(unint64_t)a10 beepOnMovePedestrianImmediacyType:(unint64_t)a11 nextPLOIVehicularImmediacyType:(unint64_t)a12 nextPLOIPedestrianImmediacyType:(unint64_t)a13 beepOnMoveConsiderationTimeInterval:(unint64_t)a14
{
  v26.receiver = self;
  v26.super_class = (Class)TAFilterGeneralSettings;
  result = [(TAFilterGeneralSettings *)&v26 init];
  if (result)
  {
    result->_durationOfConsideration = a3;
    result->_thresholdOfLocationRelevance = a4;
    result->_thresholdOfSignificantDuration = a5;
    result->_thresholdOfSignificantDistance = a6;
    result->_capOfReasonableWalkingSpeed = a7;
    result->_allowNavGeoHintAsPrivateVehicleHint = a8;
    result->_vehicularImmediacyType = a9;
    result->_beepOnMoveVehicularImmediacyType = a10;
    result->_beepOnMovePedestrianImmediacyType = a11;
    result->_nextPLOIVehicularImmediacyType = a12;
    result->_nextPLOIPedestrianImmediacyType = a13;
    result->_beepOnMoveConsiderationTimeInterval = a14;
  }
  return result;
}

- (TAFilterGeneralSettings)initWithDurationOfConsiderationOrDefault:(id)a3 thresholdOfLocationRelevanceOrDefault:(id)a4 thresholdOfSignificantDurationOrDefault:(id)a5 thresholdOfSignificantDistanceOrDefault:(id)a6 capOfReasonableWalkingSpeedOrDefault:(id)a7 allowNavGeoHintAsPrivateVehicleHintOrDefault:(id)a8 vehicularImmediacyTypeOrDefault:(id)a9 beepOnMoveVehicularImmediacyTypeOrDefault:(id)a10 beepOnMovePedestrianImmediacyTypeOrDefault:(id)a11 nextPLOIVehicularImmediacyTypeOrDefault:(id)a12 nextPLOIPedestrianImmediacyTypeOrDefault:(id)a13 beepOnMoveConsiderationTimeIntervalOrDefault:(id)a14
{
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a6;
  id v58 = a7;
  id v57 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a11;
  id v26 = a12;
  id v56 = a13;
  id v27 = a14;
  v55 = v19;
  if (v19)
  {
    [v19 doubleValue];
    double v29 = v28;
    if (v20) {
      goto LABEL_3;
    }
  }
  else
  {
    double v29 = 900.0;
    if (v20)
    {
LABEL_3:
      [v20 doubleValue];
      double v31 = v30;
      if (v21) {
        goto LABEL_4;
      }
LABEL_8:
      double v33 = 600.0;
      if (v22) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  double v31 = 60.0;
  if (!v21) {
    goto LABEL_8;
  }
LABEL_4:
  [v21 doubleValue];
  double v33 = v32;
  if (v22)
  {
LABEL_5:
    [v22 doubleValue];
    double v35 = v34;
    goto LABEL_10;
  }
LABEL_9:
  double v35 = 840.0;
LABEL_10:
  if (v58)
  {
    [v58 doubleValue];
    double v37 = v36;
  }
  else
  {
    double v37 = 5.5;
  }
  v52 = v22;
  if (v57) {
    uint64_t v38 = [v57 BOOLValue];
  }
  else {
    uint64_t v38 = 0;
  }
  v53 = v21;
  if (v23) {
    uint64_t v39 = [v23 unsignedIntegerValue];
  }
  else {
    uint64_t v39 = 1;
  }
  v54 = v20;
  v50 = v24;
  if (v24) {
    uint64_t v40 = [v24 unsignedIntegerValue];
  }
  else {
    uint64_t v40 = 2;
  }
  v41 = v23;
  if (v25)
  {
    uint64_t v42 = [v25 unsignedIntegerValue];
    if (v26)
    {
LABEL_24:
      v43 = v26;
      uint64_t v44 = [v26 unsignedIntegerValue];
      goto LABEL_27;
    }
  }
  else
  {
    uint64_t v42 = 2;
    if (v26) {
      goto LABEL_24;
    }
  }
  v43 = v26;
  uint64_t v44 = 3;
LABEL_27:
  v45 = v25;
  if (!v56)
  {
    uint64_t v46 = 3;
    if (v27) {
      goto LABEL_29;
    }
LABEL_31:
    uint64_t v47 = 25;
    goto LABEL_32;
  }
  uint64_t v46 = [v56 unsignedIntegerValue];
  if (!v27) {
    goto LABEL_31;
  }
LABEL_29:
  uint64_t v47 = [v27 unsignedIntegerValue];
LABEL_32:
  v48 = [(TAFilterGeneralSettings *)self initWithDurationOfConsideration:v38 thresholdOfLocationRelevance:v39 thresholdOfSignificantDuration:v40 thresholdOfSignificantDistance:v42 capOfReasonableWalkingSpeed:v44 allowNavGeoHintAsPrivateVehicleHint:v46 vehicularImmediacyType:v29 beepOnMoveVehicularImmediacyType:v31 beepOnMovePedestrianImmediacyType:v33 nextPLOIVehicularImmediacyType:v35 nextPLOIPedestrianImmediacyType:v37 beepOnMoveConsiderationTimeInterval:v47];

  return v48;
}

- (TAFilterGeneralSettings)initWithDefaults
{
  return [(TAFilterGeneralSettings *)self initWithDurationOfConsideration:0 thresholdOfLocationRelevance:1 thresholdOfSignificantDuration:2 thresholdOfSignificantDistance:2 capOfReasonableWalkingSpeed:3 allowNavGeoHintAsPrivateVehicleHint:3 vehicularImmediacyType:900.0 beepOnMoveVehicularImmediacyType:60.0 beepOnMovePedestrianImmediacyType:600.0 nextPLOIVehicularImmediacyType:840.0 nextPLOIPedestrianImmediacyType:5.5 beepOnMoveConsiderationTimeInterval:25];
}

- (double)durationOfConsideration
{
  return self->_durationOfConsideration;
}

- (double)thresholdOfLocationRelevance
{
  return self->_thresholdOfLocationRelevance;
}

- (double)thresholdOfSignificantDuration
{
  return self->_thresholdOfSignificantDuration;
}

- (double)thresholdOfSignificantDistance
{
  return self->_thresholdOfSignificantDistance;
}

- (double)capOfReasonableWalkingSpeed
{
  return self->_capOfReasonableWalkingSpeed;
}

- (BOOL)allowNavGeoHintAsPrivateVehicleHint
{
  return self->_allowNavGeoHintAsPrivateVehicleHint;
}

- (unint64_t)vehicularImmediacyType
{
  return self->_vehicularImmediacyType;
}

- (unint64_t)beepOnMoveVehicularImmediacyType
{
  return self->_beepOnMoveVehicularImmediacyType;
}

- (unint64_t)beepOnMovePedestrianImmediacyType
{
  return self->_beepOnMovePedestrianImmediacyType;
}

- (unint64_t)nextPLOIVehicularImmediacyType
{
  return self->_nextPLOIVehicularImmediacyType;
}

- (unint64_t)nextPLOIPedestrianImmediacyType
{
  return self->_nextPLOIPedestrianImmediacyType;
}

- (unint64_t)beepOnMoveConsiderationTimeInterval
{
  return self->_beepOnMoveConsiderationTimeInterval;
}

@end