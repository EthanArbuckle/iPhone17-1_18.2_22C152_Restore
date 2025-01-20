@interface ALActivityLog
- (ALActivityOverrideMsg)activityOverrideMsg;
- (ALCLAllDayHeartRate)allDayHeartRate;
- (ALCLBodyMetrics)bodyMetrics;
- (ALCLElevationDeprecated)elevationDeprecated;
- (ALCLIDSStatus)idsStatus;
- (ALCLJacksonData)jacksonData;
- (ALCLNatalieDataDeprecated)natalieData;
- (ALCLOdometer)odometer;
- (ALCLRowingModel)rowingModel;
- (ALCLSedentaryAlarmData)sedentaryAlarmData;
- (ALCLSedentaryAlarmDataDeprecated)sedentaryAlarmDataDeprecated;
- (ALCLSessionCatherine)sessionCatherineData;
- (ALCLStairClimbingModel)stairClimbingModel;
- (ALCLStepCountEntry)stepCountData;
- (ALCLStrideCalEntry)strideCalData;
- (ALCLStrideCalEntryDeprecated)strideCalDataDeprecated;
- (ALCMCalorieData)calorieData;
- (ALCMCalorieDataDeprecated)calorieDataDeprecated;
- (ALCMCoarseElevation)coarseElevation;
- (ALCMCoarseElevationDeprecated)coarseElevationDeprecated;
- (ALCMElevation)elevation;
- (ALCMExerciseMinute)exerciseMinute;
- (ALCMFitnessTracking)fitnessTracking;
- (ALCMWorkoutEvent)workoutEvent;
- (ALCMWorkoutEventDeprecated)workoutEventDeprecated;
- (ALMotionState)motionState;
- (BOOL)hasActivityOverrideMsg;
- (BOOL)hasAllDayHeartRate;
- (BOOL)hasBodyMetrics;
- (BOOL)hasCalorieData;
- (BOOL)hasCalorieDataDeprecated;
- (BOOL)hasCoarseElevation;
- (BOOL)hasCoarseElevationDeprecated;
- (BOOL)hasElevation;
- (BOOL)hasElevationDeprecated;
- (BOOL)hasExerciseMinute;
- (BOOL)hasFitnessTracking;
- (BOOL)hasIdsStatus;
- (BOOL)hasJacksonData;
- (BOOL)hasMotionState;
- (BOOL)hasNatalieData;
- (BOOL)hasOdometer;
- (BOOL)hasRowingModel;
- (BOOL)hasSedentaryAlarmData;
- (BOOL)hasSedentaryAlarmDataDeprecated;
- (BOOL)hasSessionCatherineData;
- (BOOL)hasStairClimbingModel;
- (BOOL)hasStepCountData;
- (BOOL)hasStrideCalData;
- (BOOL)hasStrideCalDataDeprecated;
- (BOOL)hasWorkoutEvent;
- (BOOL)hasWorkoutEventDeprecated;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setActivityOverrideMsg:(id)a3;
- (void)setAllDayHeartRate:(id)a3;
- (void)setBodyMetrics:(id)a3;
- (void)setCalorieData:(id)a3;
- (void)setCalorieDataDeprecated:(id)a3;
- (void)setCoarseElevation:(id)a3;
- (void)setCoarseElevationDeprecated:(id)a3;
- (void)setElevation:(id)a3;
- (void)setElevationDeprecated:(id)a3;
- (void)setExerciseMinute:(id)a3;
- (void)setFitnessTracking:(id)a3;
- (void)setIdsStatus:(id)a3;
- (void)setJacksonData:(id)a3;
- (void)setMotionState:(id)a3;
- (void)setNatalieData:(id)a3;
- (void)setOdometer:(id)a3;
- (void)setRowingModel:(id)a3;
- (void)setSedentaryAlarmData:(id)a3;
- (void)setSedentaryAlarmDataDeprecated:(id)a3;
- (void)setSessionCatherineData:(id)a3;
- (void)setStairClimbingModel:(id)a3;
- (void)setStepCountData:(id)a3;
- (void)setStrideCalData:(id)a3;
- (void)setStrideCalDataDeprecated:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setWorkoutEvent:(id)a3;
- (void)setWorkoutEventDeprecated:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALActivityLog

- (void)dealloc
{
  [(ALActivityLog *)self setActivityOverrideMsg:0];
  [(ALActivityLog *)self setBodyMetrics:0];
  [(ALActivityLog *)self setMotionState:0];
  [(ALActivityLog *)self setStepCountData:0];
  [(ALActivityLog *)self setSessionCatherineData:0];
  [(ALActivityLog *)self setJacksonData:0];
  [(ALActivityLog *)self setStrideCalData:0];
  [(ALActivityLog *)self setSedentaryAlarmData:0];
  [(ALActivityLog *)self setAllDayHeartRate:0];
  [(ALActivityLog *)self setFitnessTracking:0];
  [(ALActivityLog *)self setOdometer:0];
  [(ALActivityLog *)self setIdsStatus:0];
  [(ALActivityLog *)self setStairClimbingModel:0];
  [(ALActivityLog *)self setRowingModel:0];
  [(ALActivityLog *)self setExerciseMinute:0];
  [(ALActivityLog *)self setElevation:0];
  [(ALActivityLog *)self setCoarseElevation:0];
  [(ALActivityLog *)self setCalorieData:0];
  [(ALActivityLog *)self setWorkoutEvent:0];
  [(ALActivityLog *)self setNatalieData:0];
  [(ALActivityLog *)self setSedentaryAlarmDataDeprecated:0];
  [(ALActivityLog *)self setStrideCalDataDeprecated:0];
  [(ALActivityLog *)self setCalorieDataDeprecated:0];
  [(ALActivityLog *)self setCoarseElevationDeprecated:0];
  [(ALActivityLog *)self setElevationDeprecated:0];
  [(ALActivityLog *)self setWorkoutEventDeprecated:0];
  v3.receiver = self;
  v3.super_class = (Class)ALActivityLog;
  [(ALActivityLog *)&v3 dealloc];
}

- (BOOL)hasActivityOverrideMsg
{
  return self->_activityOverrideMsg != 0;
}

- (BOOL)hasBodyMetrics
{
  return self->_bodyMetrics != 0;
}

- (BOOL)hasMotionState
{
  return self->_motionState != 0;
}

- (BOOL)hasStepCountData
{
  return self->_stepCountData != 0;
}

- (BOOL)hasSessionCatherineData
{
  return self->_sessionCatherineData != 0;
}

- (BOOL)hasJacksonData
{
  return self->_jacksonData != 0;
}

- (BOOL)hasStrideCalData
{
  return self->_strideCalData != 0;
}

- (BOOL)hasSedentaryAlarmData
{
  return self->_sedentaryAlarmData != 0;
}

- (BOOL)hasAllDayHeartRate
{
  return self->_allDayHeartRate != 0;
}

- (BOOL)hasFitnessTracking
{
  return self->_fitnessTracking != 0;
}

- (BOOL)hasOdometer
{
  return self->_odometer != 0;
}

- (BOOL)hasIdsStatus
{
  return self->_idsStatus != 0;
}

- (BOOL)hasStairClimbingModel
{
  return self->_stairClimbingModel != 0;
}

- (BOOL)hasRowingModel
{
  return self->_rowingModel != 0;
}

- (BOOL)hasExerciseMinute
{
  return self->_exerciseMinute != 0;
}

- (BOOL)hasElevation
{
  return self->_elevation != 0;
}

- (BOOL)hasCoarseElevation
{
  return self->_coarseElevation != 0;
}

- (BOOL)hasCalorieData
{
  return self->_calorieData != 0;
}

- (BOOL)hasWorkoutEvent
{
  return self->_workoutEvent != 0;
}

- (BOOL)hasNatalieData
{
  return self->_natalieData != 0;
}

- (BOOL)hasSedentaryAlarmDataDeprecated
{
  return self->_sedentaryAlarmDataDeprecated != 0;
}

- (BOOL)hasStrideCalDataDeprecated
{
  return self->_strideCalDataDeprecated != 0;
}

- (BOOL)hasCalorieDataDeprecated
{
  return self->_calorieDataDeprecated != 0;
}

- (BOOL)hasCoarseElevationDeprecated
{
  return self->_coarseElevationDeprecated != 0;
}

- (BOOL)hasElevationDeprecated
{
  return self->_elevationDeprecated != 0;
}

- (BOOL)hasWorkoutEventDeprecated
{
  return self->_workoutEventDeprecated != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)ALActivityLog;
  return +[NSString stringWithFormat:@"%@ %@", [(ALActivityLog *)&v3 description], [(ALActivityLog *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timestamp)] forKey:@"timestamp"];
  activityOverrideMsg = self->_activityOverrideMsg;
  if (activityOverrideMsg) {
    [v3 setObject:-[ALActivityOverrideMsg dictionaryRepresentation](activityOverrideMsg, "dictionaryRepresentation") forKey:@"activityOverrideMsg"];
  }
  bodyMetrics = self->_bodyMetrics;
  if (bodyMetrics) {
    [v3 setObject:[[-[ALCLBodyMetrics dictionaryRepresentation](bodyMetrics, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"bodyMetrics"];
  }
  motionState = self->_motionState;
  if (motionState) {
    [v3 setObject:[-[ALMotionState dictionaryRepresentation](motionState, "dictionaryRepresentation")] forKey:@"motionState"];
  }
  stepCountData = self->_stepCountData;
  if (stepCountData) {
    [v3 setObject:[[-[ALCLStepCountEntry dictionaryRepresentation](stepCountData, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"stepCountData"];
  }
  sessionCatherineData = self->_sessionCatherineData;
  if (sessionCatherineData) {
    [v3 setObject:[[-[ALCLSessionCatherine dictionaryRepresentation](sessionCatherineData, "dictionaryRepresentation")] forKey:@"sessionCatherineData"];
  }
  jacksonData = self->_jacksonData;
  if (jacksonData) {
    [v3 setObject: -[ALCLJacksonData dictionaryRepresentation](jacksonData, "dictionaryRepresentation") forKey:@"jacksonData"];
  }
  strideCalData = self->_strideCalData;
  if (strideCalData) {
    [v3 setObject:-[ALCLStrideCalEntry dictionaryRepresentation](strideCalData, "dictionaryRepresentation") forKey:@"strideCalData"];
  }
  sedentaryAlarmData = self->_sedentaryAlarmData;
  if (sedentaryAlarmData) {
    [v3 setObject:-[ALCLSedentaryAlarmData dictionaryRepresentation](sedentaryAlarmData, "dictionaryRepresentation") forKey:@"sedentaryAlarmData"];
  }
  allDayHeartRate = self->_allDayHeartRate;
  if (allDayHeartRate) {
    [v3 setObject:-[ALCLAllDayHeartRate dictionaryRepresentation](allDayHeartRate, "dictionaryRepresentation") forKey:@"allDayHeartRate"];
  }
  fitnessTracking = self->_fitnessTracking;
  if (fitnessTracking) {
    [v3 setObject:[[fitnessTracking dictionaryRepresentation] forKey:@"fitnessTracking"];
  }
  odometer = self->_odometer;
  if (odometer) {
    [v3 setObject:-[ALCLOdometer dictionaryRepresentation](odometer, "dictionaryRepresentation") forKey:@"odometer"];
  }
  idsStatus = self->_idsStatus;
  if (idsStatus) {
    [v3 setObject: -[ALCLIDSStatus dictionaryRepresentation](idsStatus, "dictionaryRepresentation") forKey:@"idsStatus"];
  }
  stairClimbingModel = self->_stairClimbingModel;
  if (stairClimbingModel) {
    [v3 setObject:-[ALCLStairClimbingModel dictionaryRepresentation](stairClimbingModel, "dictionaryRepresentation") forKey:@"stairClimbingModel"];
  }
  rowingModel = self->_rowingModel;
  if (rowingModel) {
    [v3 setObject:[-[ALCLRowingModel dictionaryRepresentation](rowingModel, "dictionaryRepresentation")] forKey:@"rowingModel"];
  }
  exerciseMinute = self->_exerciseMinute;
  if (exerciseMinute) {
    [v3 setObject:exerciseMinute dictionaryRepresentation forKey:@"exerciseMinute"];
  }
  elevation = self->_elevation;
  if (elevation) {
    [v3 setObject:elevation dictionaryRepresentation forKey:@"elevation"];
  }
  coarseElevation = self->_coarseElevation;
  if (coarseElevation) {
    [v3 setObject:-[ALCMCoarseElevation dictionaryRepresentation](coarseElevation, "dictionaryRepresentation") forKey:@"coarseElevation"];
  }
  calorieData = self->_calorieData;
  if (calorieData) {
    [v3 setObject:-[ALCMCalorieData dictionaryRepresentation](calorieData, "dictionaryRepresentation") forKey:@"calorieData"];
  }
  workoutEvent = self->_workoutEvent;
  if (workoutEvent) {
    [v3 setObject:-[ALCMWorkoutEvent dictionaryRepresentation](workoutEvent, "dictionaryRepresentation") forKey:@"workoutEvent"];
  }
  natalieData = self->_natalieData;
  if (natalieData) {
    [v3 setObject:-[ALCLNatalieDataDeprecated dictionaryRepresentation](natalieData, "dictionaryRepresentation") forKey:@"natalieData"];
  }
  sedentaryAlarmDataDeprecated = self->_sedentaryAlarmDataDeprecated;
  if (sedentaryAlarmDataDeprecated) {
    [v3 setObject:[[sedentaryAlarmDataDeprecated dictionaryRepresentation] forKey:@"sedentaryAlarmDataDeprecated"];
  }
  strideCalDataDeprecated = self->_strideCalDataDeprecated;
  if (strideCalDataDeprecated) {
    [v3 setObject:[[-[ALCLStrideCalEntryDeprecated dictionaryRepresentation](strideCalDataDeprecated, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"strideCalDataDeprecated"];
  }
  calorieDataDeprecated = self->_calorieDataDeprecated;
  if (calorieDataDeprecated) {
    [v3 setObject:[[-[ALCMCalorieDataDeprecated dictionaryRepresentation](calorieDataDeprecated, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"calorieDataDeprecated"];
  }
  coarseElevationDeprecated = self->_coarseElevationDeprecated;
  if (coarseElevationDeprecated) {
    [v3 setObject:-[ALCMCoarseElevationDeprecated dictionaryRepresentation](coarseElevationDeprecated, "dictionaryRepresentation") forKey:@"coarseElevationDeprecated"];
  }
  elevationDeprecated = self->_elevationDeprecated;
  if (elevationDeprecated) {
    [v3 setObject:elevationDeprecated dictionaryRepresentation forKey:@"elevationDeprecated"];
  }
  workoutEventDeprecated = self->_workoutEventDeprecated;
  if (workoutEventDeprecated) {
    [v3 setObject:[[-[ALCMWorkoutEventDeprecated dictionaryRepresentation](workoutEventDeprecated, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"workoutEventDeprecated"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10047A714((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteDoubleField();
  if (self->_activityOverrideMsg) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_bodyMetrics) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_motionState) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_natalieData) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_sedentaryAlarmDataDeprecated) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_stepCountData) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_strideCalDataDeprecated) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_sessionCatherineData) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_jacksonData) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_strideCalData) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_sedentaryAlarmData) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_allDayHeartRate) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_calorieDataDeprecated) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_coarseElevationDeprecated) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_fitnessTracking) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_odometer) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_elevationDeprecated) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_idsStatus) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_stairClimbingModel) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_rowingModel) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_exerciseMinute) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_workoutEventDeprecated) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_elevation) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_coarseElevation) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_calorieData) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_workoutEvent)
  {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  *((void *)a3 + 1) = *(void *)&self->_timestamp;
  if (self->_activityOverrideMsg) {
    [a3 setActivityOverrideMsg:];
  }
  if (self->_bodyMetrics) {
    [a3 setBodyMetrics:];
  }
  if (self->_motionState) {
    [a3 setMotionState:];
  }
  if (self->_natalieData) {
    [a3 setNatalieData:];
  }
  if (self->_sedentaryAlarmDataDeprecated) {
    [a3 setSedentaryAlarmDataDeprecated:];
  }
  if (self->_stepCountData) {
    [a3 setStepCountData:];
  }
  if (self->_strideCalDataDeprecated) {
    [a3 setStrideCalDataDeprecated:];
  }
  if (self->_sessionCatherineData) {
    [a3 setSessionCatherineData:];
  }
  if (self->_jacksonData) {
    [a3 setJacksonData:];
  }
  if (self->_strideCalData) {
    [a3 setStrideCalData:];
  }
  if (self->_sedentaryAlarmData) {
    [a3 setSedentaryAlarmData:];
  }
  if (self->_allDayHeartRate) {
    [a3 setAllDayHeartRate:];
  }
  if (self->_calorieDataDeprecated) {
    [a3 setCalorieDataDeprecated:];
  }
  if (self->_coarseElevationDeprecated) {
    [a3 setCoarseElevationDeprecated:];
  }
  if (self->_fitnessTracking) {
    [a3 setFitnessTracking:];
  }
  if (self->_odometer) {
    [a3 setOdometer:];
  }
  if (self->_elevationDeprecated) {
    [a3 setElevationDeprecated:];
  }
  if (self->_idsStatus) {
    [a3 setIdsStatus:];
  }
  if (self->_stairClimbingModel) {
    [a3 setStairClimbingModel:];
  }
  if (self->_rowingModel) {
    [a3 setRowingModel:];
  }
  if (self->_exerciseMinute) {
    [a3 setExerciseMinute:];
  }
  if (self->_workoutEventDeprecated) {
    [a3 setWorkoutEventDeprecated:];
  }
  if (self->_elevation) {
    [a3 setElevation:];
  }
  if (self->_coarseElevation) {
    [a3 setCoarseElevation:];
  }
  if (self->_calorieData) {
    [a3 setCalorieData:];
  }
  if (self->_workoutEvent)
  {
    [a3 setWorkoutEvent:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  *((void *)v5 + 1) = *(void *)&self->_timestamp;

  *((void *)v5 + 2) = [(ALActivityOverrideMsg *)self->_activityOverrideMsg copyWithZone:a3];
  *((void *)v5 + 4) = [(ALCLBodyMetrics *)self->_bodyMetrics copyWithZone:a3];

  *((void *)v5 + 15) = [(ALMotionState *)self->_motionState copyWithZone:a3];
  *((void *)v5 + 16) = [(ALCLNatalieDataDeprecated *)self->_natalieData copyWithZone:a3];

  *((void *)v5 + 20) = [(ALCLSedentaryAlarmDataDeprecated *)self->_sedentaryAlarmDataDeprecated copyWithZone:a3];
  *((void *)v5 + 23) = [(ALCLStepCountEntry *)self->_stepCountData copyWithZone:a3];

  *((void *)v5 + 25) = [(ALCLStrideCalEntryDeprecated *)self->_strideCalDataDeprecated copyWithZone:a3];
  *((void *)v5 + 21) = [(ALCLSessionCatherine *)self->_sessionCatherineData copyWithZone:a3];

  *((void *)v5 + 14) = [(ALCLJacksonData *)self->_jacksonData copyWithZone:a3];
  *((void *)v5 + 24) = [(ALCLStrideCalEntry *)self->_strideCalData copyWithZone:a3];

  *((void *)v5 + 19) = [(ALCLSedentaryAlarmData *)self->_sedentaryAlarmData copyWithZone:a3];
  *((void *)v5 + 3) = [(ALCLAllDayHeartRate *)self->_allDayHeartRate copyWithZone:a3];

  *((void *)v5 + 6) = [(ALCMCalorieDataDeprecated *)self->_calorieDataDeprecated copyWithZone:a3];
  *((void *)v5 + 8) = [(ALCMCoarseElevationDeprecated *)self->_coarseElevationDeprecated copyWithZone:a3];

  *((void *)v5 + 12) = [(ALCMFitnessTracking *)self->_fitnessTracking copyWithZone:a3];
  *((void *)v5 + 17) = [(ALCLOdometer *)self->_odometer copyWithZone:a3];

  *((void *)v5 + 10) = [(ALCLElevationDeprecated *)self->_elevationDeprecated copyWithZone:a3];
  *((void *)v5 + 13) = [(ALCLIDSStatus *)self->_idsStatus copyWithZone:a3];

  *((void *)v5 + 22) = [(ALCLStairClimbingModel *)self->_stairClimbingModel copyWithZone:a3];
  *((void *)v5 + 18) = [(ALCLRowingModel *)self->_rowingModel copyWithZone:a3];

  *((void *)v5 + 11) = [(ALCMExerciseMinute *)self->_exerciseMinute copyWithZone:a3];
  *((void *)v5 + 27) = [(ALCMWorkoutEventDeprecated *)self->_workoutEventDeprecated copyWithZone:a3];

  *((void *)v5 + 9) = [(ALCMElevation *)self->_elevation copyWithZone:a3];
  *((void *)v5 + 7) = [(ALCMCoarseElevation *)self->_coarseElevation copyWithZone:a3];

  *((void *)v5 + 5) = [(ALCMCalorieData *)self->_calorieData copyWithZone:a3];
  *((void *)v5 + 26) = [(ALCMWorkoutEvent *)self->_workoutEvent copyWithZone:a3];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (self->_timestamp == *((double *)a3 + 1))
    {
      activityOverrideMsg = self->_activityOverrideMsg;
      if (!((unint64_t)activityOverrideMsg | *((void *)a3 + 2))
        || (unsigned int v5 = -[ALActivityOverrideMsg isEqual:](activityOverrideMsg, "isEqual:")) != 0)
      {
        bodyMetrics = self->_bodyMetrics;
        if (!((unint64_t)bodyMetrics | *((void *)a3 + 4))
          || (unsigned int v5 = -[ALCLBodyMetrics isEqual:](bodyMetrics, "isEqual:")) != 0)
        {
          motionState = self->_motionState;
          if (!((unint64_t)motionState | *((void *)a3 + 15))
            || (unsigned int v5 = -[ALMotionState isEqual:](motionState, "isEqual:")) != 0)
          {
            natalieData = self->_natalieData;
            if (!((unint64_t)natalieData | *((void *)a3 + 16))
              || (unsigned int v5 = -[ALCLNatalieDataDeprecated isEqual:](natalieData, "isEqual:")) != 0)
            {
              sedentaryAlarmDataDeprecated = self->_sedentaryAlarmDataDeprecated;
              if (!((unint64_t)sedentaryAlarmDataDeprecated | *((void *)a3 + 20))
                || (unsigned int v5 = -[ALCLSedentaryAlarmDataDeprecated isEqual:](sedentaryAlarmDataDeprecated, "isEqual:")) != 0)
              {
                stepCountData = self->_stepCountData;
                if (!((unint64_t)stepCountData | *((void *)a3 + 23))
                  || (unsigned int v5 = -[ALCLStepCountEntry isEqual:](stepCountData, "isEqual:")) != 0)
                {
                  strideCalDataDeprecated = self->_strideCalDataDeprecated;
                  if (!((unint64_t)strideCalDataDeprecated | *((void *)a3 + 25))
                    || (unsigned int v5 = -[ALCLStrideCalEntryDeprecated isEqual:](strideCalDataDeprecated, "isEqual:")) != 0)
                  {
                    sessionCatherineData = self->_sessionCatherineData;
                    if (!((unint64_t)sessionCatherineData | *((void *)a3 + 21))
                      || (unsigned int v5 = -[ALCLSessionCatherine isEqual:](sessionCatherineData, "isEqual:")) != 0)
                    {
                      jacksonData = self->_jacksonData;
                      if (!((unint64_t)jacksonData | *((void *)a3 + 14))
                        || (unsigned int v5 = -[ALCLJacksonData isEqual:](jacksonData, "isEqual:")) != 0)
                      {
                        strideCalData = self->_strideCalData;
                        if (!((unint64_t)strideCalData | *((void *)a3 + 24))
                          || (unsigned int v5 = -[ALCLStrideCalEntry isEqual:](strideCalData, "isEqual:")) != 0)
                        {
                          sedentaryAlarmData = self->_sedentaryAlarmData;
                          if (!((unint64_t)sedentaryAlarmData | *((void *)a3 + 19))
                            || (unsigned int v5 = -[ALCLSedentaryAlarmData isEqual:](sedentaryAlarmData, "isEqual:")) != 0)
                          {
                            allDayHeartRate = self->_allDayHeartRate;
                            if (!((unint64_t)allDayHeartRate | *((void *)a3 + 3))
                              || (unsigned int v5 = -[ALCLAllDayHeartRate isEqual:](allDayHeartRate, "isEqual:")) != 0)
                            {
                              calorieDataDeprecated = self->_calorieDataDeprecated;
                              if (!((unint64_t)calorieDataDeprecated | *((void *)a3 + 6))
                                || (unsigned int v5 = -[ALCMCalorieDataDeprecated isEqual:](calorieDataDeprecated, "isEqual:")) != 0)
                              {
                                coarseElevationDeprecated = self->_coarseElevationDeprecated;
                                if (!((unint64_t)coarseElevationDeprecated | *((void *)a3 + 8))
                                  || (unsigned int v5 = -[ALCMCoarseElevationDeprecated isEqual:](coarseElevationDeprecated, "isEqual:")) != 0)
                                {
                                  fitnessTracking = self->_fitnessTracking;
                                  if (!((unint64_t)fitnessTracking | *((void *)a3 + 12))
                                    || (unsigned int v5 = -[ALCMFitnessTracking isEqual:](fitnessTracking, "isEqual:")) != 0)
                                  {
                                    odometer = self->_odometer;
                                    if (!((unint64_t)odometer | *((void *)a3 + 17))
                                      || (unsigned int v5 = -[ALCLOdometer isEqual:](odometer, "isEqual:")) != 0)
                                    {
                                      elevationDeprecated = self->_elevationDeprecated;
                                      if (!((unint64_t)elevationDeprecated | *((void *)a3 + 10))
                                        || (unsigned int v5 = -[ALCLElevationDeprecated isEqual:](elevationDeprecated, "isEqual:")) != 0)
                                      {
                                        idsStatus = self->_idsStatus;
                                        if (!((unint64_t)idsStatus | *((void *)a3 + 13))
                                          || (unsigned int v5 = -[ALCLIDSStatus isEqual:](idsStatus, "isEqual:")) != 0)
                                        {
                                          stairClimbingModel = self->_stairClimbingModel;
                                          if (!((unint64_t)stairClimbingModel | *((void *)a3 + 22))
                                            || (unsigned int v5 = -[ALCLStairClimbingModel isEqual:](stairClimbingModel, "isEqual:")) != 0)
                                          {
                                            rowingModel = self->_rowingModel;
                                            if (!((unint64_t)rowingModel | *((void *)a3 + 18))
                                              || (unsigned int v5 = -[ALCLRowingModel isEqual:](rowingModel, "isEqual:")) != 0)
                                            {
                                              exerciseMinute = self->_exerciseMinute;
                                              if (!((unint64_t)exerciseMinute | *((void *)a3 + 11))
                                                || (unsigned int v5 = -[ALCMExerciseMinute isEqual:](exerciseMinute, "isEqual:")) != 0)
                                              {
                                                workoutEventDeprecated = self->_workoutEventDeprecated;
                                                if (!((unint64_t)workoutEventDeprecated | *((void *)a3 + 27))
                                                  || (unsigned int v5 = -[ALCMWorkoutEventDeprecated isEqual:](workoutEventDeprecated, "isEqual:")) != 0)
                                                {
                                                  elevation = self->_elevation;
                                                  if (!((unint64_t)elevation | *((void *)a3 + 9))
                                                    || (unsigned int v5 = -[ALCMElevation isEqual:](elevation, "isEqual:")) != 0)
                                                  {
                                                    coarseElevation = self->_coarseElevation;
                                                    if (!((unint64_t)coarseElevation | *((void *)a3 + 7))
                                                      || (unsigned int v5 = -[ALCMCoarseElevation isEqual:](coarseElevation, "isEqual:")) != 0)
                                                    {
                                                      calorieData = self->_calorieData;
                                                      if (!((unint64_t)calorieData | *((void *)a3 + 5))
                                                        || (unsigned int v5 = -[ALCMCalorieData isEqual:](calorieData, "isEqual:")) != 0)
                                                      {
                                                        workoutEvent = self->_workoutEvent;
                                                        if ((unint64_t)workoutEvent | *((void *)a3 + 26))
                                                        {
                                                          LOBYTE(v5) = -[ALCMWorkoutEvent isEqual:](workoutEvent, "isEqual:");
                                                        }
                                                        else
                                                        {
                                                          LOBYTE(v5) = 1;
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
        }
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  double timestamp = self->_timestamp;
  double v4 = -timestamp;
  if (timestamp >= 0.0) {
    double v4 = self->_timestamp;
  }
  long double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  double v7 = fmod(v5, 1.84467441e19);
  unint64_t v8 = 2654435761u * (unint64_t)v7;
  unint64_t v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0) {
    unint64_t v9 = 2654435761u * (unint64_t)v7;
  }
  unint64_t v10 = v8 - (unint64_t)fabs(v6);
  if (v6 < 0.0) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = v9;
  }
  unint64_t v12 = [(ALActivityOverrideMsg *)self->_activityOverrideMsg hash];
  unint64_t v13 = v11 ^ [(ALCLBodyMetrics *)self->_bodyMetrics hash];
  unint64_t v14 = v12 ^ [(ALMotionState *)self->_motionState hash];
  unint64_t v15 = v14 ^ [(ALCLNatalieDataDeprecated *)self->_natalieData hash];
  unint64_t v16 = v15 ^ [(ALCLSedentaryAlarmDataDeprecated *)self->_sedentaryAlarmDataDeprecated hash];
  unint64_t v17 = v16 ^ [(ALCLStepCountEntry *)self->_stepCountData hash];
  unint64_t v18 = v17 ^ [(ALCLStrideCalEntryDeprecated *)self->_strideCalDataDeprecated hash];
  unint64_t v19 = v18 ^ [(ALCLSessionCatherine *)self->_sessionCatherineData hash];
  unint64_t v20 = v19 ^ [(ALCLJacksonData *)self->_jacksonData hash];
  unint64_t v21 = v20 ^ [(ALCLStrideCalEntry *)self->_strideCalData hash];
  unint64_t v22 = v21 ^ [(ALCLSedentaryAlarmData *)self->_sedentaryAlarmData hash];
  unint64_t v23 = v22 ^ [(ALCLAllDayHeartRate *)self->_allDayHeartRate hash];
  unint64_t v24 = v23 ^ [(ALCMCalorieDataDeprecated *)self->_calorieDataDeprecated hash];
  unint64_t v25 = v24 ^ [(ALCMCoarseElevationDeprecated *)self->_coarseElevationDeprecated hash];
  unint64_t v26 = v25 ^ [(ALCMFitnessTracking *)self->_fitnessTracking hash];
  unint64_t v27 = v26 ^ [(ALCLOdometer *)self->_odometer hash];
  unint64_t v28 = v27 ^ [(ALCLElevationDeprecated *)self->_elevationDeprecated hash];
  unint64_t v29 = v28 ^ [(ALCLIDSStatus *)self->_idsStatus hash];
  unint64_t v30 = v29 ^ [(ALCLStairClimbingModel *)self->_stairClimbingModel hash];
  unint64_t v31 = v30 ^ [(ALCLRowingModel *)self->_rowingModel hash];
  unint64_t v32 = v31 ^ [(ALCMExerciseMinute *)self->_exerciseMinute hash];
  unint64_t v33 = v32 ^ [(ALCMWorkoutEventDeprecated *)self->_workoutEventDeprecated hash];
  unint64_t v34 = v33 ^ [(ALCMElevation *)self->_elevation hash];
  unint64_t v35 = v34 ^ [(ALCMCoarseElevation *)self->_coarseElevation hash];
  unint64_t v36 = v35 ^ [(ALCMCalorieData *)self->_calorieData hash];
  return v36 ^ [(ALCMWorkoutEvent *)self->_workoutEvent hash] ^ v13;
}

- (void)mergeFrom:(id)a3
{
  self->_double timestamp = *((double *)a3 + 1);
  activityOverrideMsg = self->_activityOverrideMsg;
  uint64_t v6 = *((void *)a3 + 2);
  if (activityOverrideMsg)
  {
    if (v6) {
      -[ALActivityOverrideMsg mergeFrom:](activityOverrideMsg, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[ALActivityLog setActivityOverrideMsg:](self, "setActivityOverrideMsg:");
  }
  bodyMetrics = self->_bodyMetrics;
  uint64_t v8 = *((void *)a3 + 4);
  if (bodyMetrics)
  {
    if (v8) {
      -[ALCLBodyMetrics mergeFrom:](bodyMetrics, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[ALActivityLog setBodyMetrics:](self, "setBodyMetrics:");
  }
  motionState = self->_motionState;
  uint64_t v10 = *((void *)a3 + 15);
  if (motionState)
  {
    if (v10) {
      -[ALMotionState mergeFrom:](motionState, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[ALActivityLog setMotionState:](self, "setMotionState:");
  }
  natalieData = self->_natalieData;
  uint64_t v12 = *((void *)a3 + 16);
  if (natalieData)
  {
    if (v12) {
      -[ALCLNatalieDataDeprecated mergeFrom:](natalieData, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[ALActivityLog setNatalieData:](self, "setNatalieData:");
  }
  sedentaryAlarmDataDeprecated = self->_sedentaryAlarmDataDeprecated;
  uint64_t v14 = *((void *)a3 + 20);
  if (sedentaryAlarmDataDeprecated)
  {
    if (v14) {
      -[ALCLSedentaryAlarmDataDeprecated mergeFrom:](sedentaryAlarmDataDeprecated, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[ALActivityLog setSedentaryAlarmDataDeprecated:](self, "setSedentaryAlarmDataDeprecated:");
  }
  stepCountData = self->_stepCountData;
  uint64_t v16 = *((void *)a3 + 23);
  if (stepCountData)
  {
    if (v16) {
      -[ALCLStepCountEntry mergeFrom:](stepCountData, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[ALActivityLog setStepCountData:](self, "setStepCountData:");
  }
  strideCalDataDeprecated = self->_strideCalDataDeprecated;
  uint64_t v18 = *((void *)a3 + 25);
  if (strideCalDataDeprecated)
  {
    if (v18) {
      -[ALCLStrideCalEntryDeprecated mergeFrom:](strideCalDataDeprecated, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[ALActivityLog setStrideCalDataDeprecated:](self, "setStrideCalDataDeprecated:");
  }
  sessionCatherineData = self->_sessionCatherineData;
  uint64_t v20 = *((void *)a3 + 21);
  if (sessionCatherineData)
  {
    if (v20) {
      -[ALCLSessionCatherine mergeFrom:](sessionCatherineData, "mergeFrom:");
    }
  }
  else if (v20)
  {
    -[ALActivityLog setSessionCatherineData:](self, "setSessionCatherineData:");
  }
  jacksonData = self->_jacksonData;
  uint64_t v22 = *((void *)a3 + 14);
  if (jacksonData)
  {
    if (v22) {
      -[ALCLJacksonData mergeFrom:](jacksonData, "mergeFrom:");
    }
  }
  else if (v22)
  {
    -[ALActivityLog setJacksonData:](self, "setJacksonData:");
  }
  strideCalData = self->_strideCalData;
  uint64_t v24 = *((void *)a3 + 24);
  if (strideCalData)
  {
    if (v24) {
      -[ALCLStrideCalEntry mergeFrom:](strideCalData, "mergeFrom:");
    }
  }
  else if (v24)
  {
    -[ALActivityLog setStrideCalData:](self, "setStrideCalData:");
  }
  sedentaryAlarmData = self->_sedentaryAlarmData;
  uint64_t v26 = *((void *)a3 + 19);
  if (sedentaryAlarmData)
  {
    if (v26) {
      -[ALCLSedentaryAlarmData mergeFrom:](sedentaryAlarmData, "mergeFrom:");
    }
  }
  else if (v26)
  {
    -[ALActivityLog setSedentaryAlarmData:](self, "setSedentaryAlarmData:");
  }
  allDayHeartRate = self->_allDayHeartRate;
  uint64_t v28 = *((void *)a3 + 3);
  if (allDayHeartRate)
  {
    if (v28) {
      -[ALCLAllDayHeartRate mergeFrom:](allDayHeartRate, "mergeFrom:");
    }
  }
  else if (v28)
  {
    -[ALActivityLog setAllDayHeartRate:](self, "setAllDayHeartRate:");
  }
  calorieDataDeprecated = self->_calorieDataDeprecated;
  uint64_t v30 = *((void *)a3 + 6);
  if (calorieDataDeprecated)
  {
    if (v30) {
      -[ALCMCalorieDataDeprecated mergeFrom:](calorieDataDeprecated, "mergeFrom:");
    }
  }
  else if (v30)
  {
    -[ALActivityLog setCalorieDataDeprecated:](self, "setCalorieDataDeprecated:");
  }
  coarseElevationDeprecated = self->_coarseElevationDeprecated;
  uint64_t v32 = *((void *)a3 + 8);
  if (coarseElevationDeprecated)
  {
    if (v32) {
      -[ALCMCoarseElevationDeprecated mergeFrom:](coarseElevationDeprecated, "mergeFrom:");
    }
  }
  else if (v32)
  {
    -[ALActivityLog setCoarseElevationDeprecated:](self, "setCoarseElevationDeprecated:");
  }
  fitnessTracking = self->_fitnessTracking;
  uint64_t v34 = *((void *)a3 + 12);
  if (fitnessTracking)
  {
    if (v34) {
      -[ALCMFitnessTracking mergeFrom:](fitnessTracking, "mergeFrom:");
    }
  }
  else if (v34)
  {
    -[ALActivityLog setFitnessTracking:](self, "setFitnessTracking:");
  }
  odometer = self->_odometer;
  uint64_t v36 = *((void *)a3 + 17);
  if (odometer)
  {
    if (v36) {
      -[ALCLOdometer mergeFrom:](odometer, "mergeFrom:");
    }
  }
  else if (v36)
  {
    -[ALActivityLog setOdometer:](self, "setOdometer:");
  }
  elevationDeprecated = self->_elevationDeprecated;
  uint64_t v38 = *((void *)a3 + 10);
  if (elevationDeprecated)
  {
    if (v38) {
      -[ALCLElevationDeprecated mergeFrom:](elevationDeprecated, "mergeFrom:");
    }
  }
  else if (v38)
  {
    -[ALActivityLog setElevationDeprecated:](self, "setElevationDeprecated:");
  }
  idsStatus = self->_idsStatus;
  uint64_t v40 = *((void *)a3 + 13);
  if (idsStatus)
  {
    if (v40) {
      -[ALCLIDSStatus mergeFrom:](idsStatus, "mergeFrom:");
    }
  }
  else if (v40)
  {
    -[ALActivityLog setIdsStatus:](self, "setIdsStatus:");
  }
  stairClimbingModel = self->_stairClimbingModel;
  uint64_t v42 = *((void *)a3 + 22);
  if (stairClimbingModel)
  {
    if (v42) {
      -[ALCLStairClimbingModel mergeFrom:](stairClimbingModel, "mergeFrom:");
    }
  }
  else if (v42)
  {
    -[ALActivityLog setStairClimbingModel:](self, "setStairClimbingModel:");
  }
  rowingModel = self->_rowingModel;
  uint64_t v44 = *((void *)a3 + 18);
  if (rowingModel)
  {
    if (v44) {
      -[ALCLRowingModel mergeFrom:](rowingModel, "mergeFrom:");
    }
  }
  else if (v44)
  {
    -[ALActivityLog setRowingModel:](self, "setRowingModel:");
  }
  exerciseMinute = self->_exerciseMinute;
  uint64_t v46 = *((void *)a3 + 11);
  if (exerciseMinute)
  {
    if (v46) {
      -[ALCMExerciseMinute mergeFrom:](exerciseMinute, "mergeFrom:");
    }
  }
  else if (v46)
  {
    -[ALActivityLog setExerciseMinute:](self, "setExerciseMinute:");
  }
  workoutEventDeprecated = self->_workoutEventDeprecated;
  uint64_t v48 = *((void *)a3 + 27);
  if (workoutEventDeprecated)
  {
    if (v48) {
      -[ALCMWorkoutEventDeprecated mergeFrom:](workoutEventDeprecated, "mergeFrom:");
    }
  }
  else if (v48)
  {
    [(ALActivityLog *)self setWorkoutEventDeprecated:"setWorkoutEventDeprecated:"];
  }
  elevation = self->_elevation;
  uint64_t v50 = *((void *)a3 + 9);
  if (elevation)
  {
    if (v50) {
      -[ALCMElevation mergeFrom:](elevation, "mergeFrom:");
    }
  }
  else if (v50)
  {
    -[ALActivityLog setElevation:](self, "setElevation:");
  }
  coarseElevation = self->_coarseElevation;
  uint64_t v52 = *((void *)a3 + 7);
  if (coarseElevation)
  {
    if (v52) {
      -[ALCMCoarseElevation mergeFrom:](coarseElevation, "mergeFrom:");
    }
  }
  else if (v52)
  {
    -[ALActivityLog setCoarseElevation:](self, "setCoarseElevation:");
  }
  calorieData = self->_calorieData;
  uint64_t v54 = *((void *)a3 + 5);
  if (calorieData)
  {
    if (v54) {
      -[ALCMCalorieData mergeFrom:](calorieData, "mergeFrom:");
    }
  }
  else if (v54)
  {
    -[ALActivityLog setCalorieData:](self, "setCalorieData:");
  }
  workoutEvent = self->_workoutEvent;
  uint64_t v56 = *((void *)a3 + 26);
  if (workoutEvent)
  {
    if (v56)
    {
      -[ALCMWorkoutEvent mergeFrom:](workoutEvent, "mergeFrom:");
    }
  }
  else if (v56)
  {
    [(ALActivityLog *)self setWorkoutEvent:"setWorkoutEvent:"];
  }
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_double timestamp = a3;
}

- (ALActivityOverrideMsg)activityOverrideMsg
{
  return self->_activityOverrideMsg;
}

- (void)setActivityOverrideMsg:(id)a3
{
}

- (ALCLBodyMetrics)bodyMetrics
{
  return self->_bodyMetrics;
}

- (void)setBodyMetrics:(id)a3
{
}

- (ALMotionState)motionState
{
  return self->_motionState;
}

- (void)setMotionState:(id)a3
{
}

- (ALCLStepCountEntry)stepCountData
{
  return self->_stepCountData;
}

- (void)setStepCountData:(id)a3
{
}

- (ALCLSessionCatherine)sessionCatherineData
{
  return self->_sessionCatherineData;
}

- (void)setSessionCatherineData:(id)a3
{
}

- (ALCLJacksonData)jacksonData
{
  return self->_jacksonData;
}

- (void)setJacksonData:(id)a3
{
}

- (ALCLStrideCalEntry)strideCalData
{
  return self->_strideCalData;
}

- (void)setStrideCalData:(id)a3
{
}

- (ALCLSedentaryAlarmData)sedentaryAlarmData
{
  return self->_sedentaryAlarmData;
}

- (void)setSedentaryAlarmData:(id)a3
{
}

- (ALCLAllDayHeartRate)allDayHeartRate
{
  return self->_allDayHeartRate;
}

- (void)setAllDayHeartRate:(id)a3
{
}

- (ALCMFitnessTracking)fitnessTracking
{
  return self->_fitnessTracking;
}

- (void)setFitnessTracking:(id)a3
{
}

- (ALCLOdometer)odometer
{
  return self->_odometer;
}

- (void)setOdometer:(id)a3
{
}

- (ALCLIDSStatus)idsStatus
{
  return self->_idsStatus;
}

- (void)setIdsStatus:(id)a3
{
}

- (ALCLStairClimbingModel)stairClimbingModel
{
  return self->_stairClimbingModel;
}

- (void)setStairClimbingModel:(id)a3
{
}

- (ALCLRowingModel)rowingModel
{
  return self->_rowingModel;
}

- (void)setRowingModel:(id)a3
{
}

- (ALCMExerciseMinute)exerciseMinute
{
  return self->_exerciseMinute;
}

- (void)setExerciseMinute:(id)a3
{
}

- (ALCMElevation)elevation
{
  return self->_elevation;
}

- (void)setElevation:(id)a3
{
}

- (ALCMCoarseElevation)coarseElevation
{
  return self->_coarseElevation;
}

- (void)setCoarseElevation:(id)a3
{
}

- (ALCMCalorieData)calorieData
{
  return self->_calorieData;
}

- (void)setCalorieData:(id)a3
{
}

- (ALCMWorkoutEvent)workoutEvent
{
  return self->_workoutEvent;
}

- (void)setWorkoutEvent:(id)a3
{
}

- (ALCLNatalieDataDeprecated)natalieData
{
  return self->_natalieData;
}

- (void)setNatalieData:(id)a3
{
}

- (ALCLSedentaryAlarmDataDeprecated)sedentaryAlarmDataDeprecated
{
  return self->_sedentaryAlarmDataDeprecated;
}

- (void)setSedentaryAlarmDataDeprecated:(id)a3
{
}

- (ALCLStrideCalEntryDeprecated)strideCalDataDeprecated
{
  return self->_strideCalDataDeprecated;
}

- (void)setStrideCalDataDeprecated:(id)a3
{
}

- (ALCMCalorieDataDeprecated)calorieDataDeprecated
{
  return self->_calorieDataDeprecated;
}

- (void)setCalorieDataDeprecated:(id)a3
{
}

- (ALCMCoarseElevationDeprecated)coarseElevationDeprecated
{
  return self->_coarseElevationDeprecated;
}

- (void)setCoarseElevationDeprecated:(id)a3
{
}

- (ALCLElevationDeprecated)elevationDeprecated
{
  return self->_elevationDeprecated;
}

- (void)setElevationDeprecated:(id)a3
{
}

- (ALCMWorkoutEventDeprecated)workoutEventDeprecated
{
  return self->_workoutEventDeprecated;
}

- (void)setWorkoutEventDeprecated:(id)a3
{
}

@end