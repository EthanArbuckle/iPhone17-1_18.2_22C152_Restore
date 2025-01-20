@interface CLFenceAnalyticsHistoricalStates
- (CLDaemonLocation)currentLocation;
- (CLDaemonLocation)nMinusOneStateChangeLocation;
- (CLDaemonLocation)nMinusTwoStateChangeLocation;
- (CLFenceAnalyticsHistoricalStates)init;
- (NSDate)timeOfCurrentStateChange;
- (NSDate)timeOfNMinusOneStateChange;
- (NSDate)timeOfNMinusTwoStateChange;
- (double)timeToInitialStateChange;
- (id).cxx_construct;
- (int)currentState;
- (int)nMinusOneState;
- (int)nMinusThreeState;
- (int)nMinusTwoState;
- (void)dealloc;
- (void)resetHistoricalStates;
- (void)setCurrentLocation:(CLDaemonLocation *)a3;
- (void)setCurrentState:(int)a3;
- (void)setNMinusOneState:(int)a3;
- (void)setNMinusOneStateChangeLocation:(CLDaemonLocation *)a3;
- (void)setNMinusThreeState:(int)a3;
- (void)setNMinusTwoState:(int)a3;
- (void)setNMinusTwoStateChangeLocation:(CLDaemonLocation *)a3;
- (void)setTimeOfCurrentStateChange:(id)a3;
- (void)setTimeOfNMinusOneStateChange:(id)a3;
- (void)setTimeOfNMinusTwoStateChange:(id)a3;
- (void)setTimeToInitialStateChange:(double)a3;
- (void)updateCurrentState:(int)a3 previousState:(int)a4 location:(CLDaemonLocation *)a5 locationReceivedTime:(double)a6;
- (void)updateTimeToInitialStateChange:(double)a3;
@end

@implementation CLFenceAnalyticsHistoricalStates

- (CLFenceAnalyticsHistoricalStates)init
{
  v5.receiver = self;
  v5.super_class = (Class)CLFenceAnalyticsHistoricalStates;
  v2 = [(CLFenceAnalyticsHistoricalStates *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CLFenceAnalyticsHistoricalStates *)v2 resetHistoricalStates];
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLFenceAnalyticsHistoricalStates;
  [(CLFenceAnalyticsHistoricalStates *)&v3 dealloc];
}

- (void)updateCurrentState:(int)a3 previousState:(int)a4 location:(CLDaemonLocation *)a5 locationReceivedTime:(double)a6
{
  uint64_t v9 = *(void *)&a3;
  if ([(CLFenceAnalyticsHistoricalStates *)self currentState] != a4)
  {
    if (qword_1024193C0 != -1) {
      dispatch_once(&qword_1024193C0, &stru_1022D38D0);
    }
    v11 = qword_1024193C8;
    if (os_log_type_enabled((os_log_t)qword_1024193C8, OS_LOG_TYPE_DEFAULT))
    {
      if ((v9 + 1) > 4) {
        v12 = "---";
      }
      else {
        v12 = off_1022D38F0[(int)v9 + 1];
      }
      if ((a4 + 1) > 4) {
        v13 = "---";
      }
      else {
        v13 = off_1022D38F0[a4 + 1];
      }
      *(_DWORD *)buf = 136315394;
      v48 = v12;
      __int16 v49 = 2080;
      v50 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#FenceMetrics Previous fence states don't match, reseting historical states, currentState %s, previousState %s", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193C0 != -1) {
        dispatch_once(&qword_1024193C0, &stru_1022D38D0);
      }
      if ((v9 + 1) > 4) {
        v24 = "---";
      }
      else {
        v24 = off_1022D38F0[(int)v9 + 1];
      }
      if ((a4 + 1) > 4) {
        v29 = "---";
      }
      else {
        v29 = off_1022D38F0[a4 + 1];
      }
      int v39 = 136315394;
      v40 = v24;
      __int16 v41 = 2080;
      v42 = v29;
      v30 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLFenceAnalyticsHistoricalStates updateCurrentState:previousState:location:locationReceivedTime:]", "%s\n", v30);
      if (v30 != (char *)buf) {
        free(v30);
      }
    }
    [(CLFenceAnalyticsHistoricalStates *)self resetHistoricalStates];
  }
  if (qword_1024193C0 != -1) {
    dispatch_once(&qword_1024193C0, &stru_1022D38D0);
  }
  v14 = qword_1024193C8;
  if (os_log_type_enabled((os_log_t)qword_1024193C8, OS_LOG_TYPE_DEFAULT))
  {
    if ((v9 + 1) > 4) {
      v15 = "---";
    }
    else {
      v15 = off_1022D38F0[(int)v9 + 1];
    }
    if ((a4 + 1) > 4) {
      v16 = "---";
    }
    else {
      v16 = off_1022D38F0[a4 + 1];
    }
    int lifespan_low = LODWORD(a5->lifespan);
    uint64_t v18 = *(void *)((char *)&a5->coordinate.longitude + 4);
    *(_DWORD *)buf = 136315906;
    v48 = v15;
    __int16 v49 = 2080;
    v50 = v16;
    __int16 v51 = 1024;
    int v52 = lifespan_low;
    __int16 v53 = 2048;
    uint64_t v54 = v18;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#FenceMetrics updating to currentState %s, previousState %s, provider %d, accuracy %f", buf, 0x26u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193C0 != -1) {
      dispatch_once(&qword_1024193C0, &stru_1022D38D0);
    }
    if ((v9 + 1) > 4) {
      v23 = "---";
    }
    else {
      v23 = off_1022D38F0[(int)v9 + 1];
    }
    if ((a4 + 1) > 4) {
      v25 = "---";
    }
    else {
      v25 = off_1022D38F0[a4 + 1];
    }
    int v26 = LODWORD(a5->lifespan);
    uint64_t v27 = *(void *)((char *)&a5->coordinate.longitude + 4);
    int v39 = 136315906;
    v40 = v23;
    __int16 v41 = 2080;
    v42 = v25;
    __int16 v43 = 1024;
    int v44 = v26;
    __int16 v45 = 2048;
    uint64_t v46 = v27;
    v28 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLFenceAnalyticsHistoricalStates updateCurrentState:previousState:location:locationReceivedTime:]", "%s\n", v28);
    if (v28 != (char *)buf) {
      free(v28);
    }
  }
  [(CLFenceAnalyticsHistoricalStates *)self setNMinusThreeState:self->_nMinusTwoState];
  [(CLFenceAnalyticsHistoricalStates *)self setNMinusTwoState:self->_nMinusOneState];
  [(CLFenceAnalyticsHistoricalStates *)self setTimeOfNMinusTwoStateChange:[(CLFenceAnalyticsHistoricalStates *)self timeOfNMinusOneStateChange]];
  [(CLFenceAnalyticsHistoricalStates *)self nMinusOneStateChangeLocation];
  v36[6] = *(_OWORD *)&v37[33];
  v36[7] = *(_OWORD *)&v37[37];
  *(_OWORD *)v37 = *(_OWORD *)v38;
  *(_OWORD *)&v37[3] = *(_OWORD *)&v38[12];
  v36[2] = *(_OWORD *)&v37[17];
  v36[3] = *(_OWORD *)&v37[21];
  v36[4] = *(_OWORD *)&v37[25];
  v36[5] = *(_OWORD *)&v37[29];
  v36[0] = *(_OWORD *)&v37[9];
  v36[1] = *(_OWORD *)&v37[13];
  [(CLFenceAnalyticsHistoricalStates *)self setNMinusTwoStateChangeLocation:v36];
  [(CLFenceAnalyticsHistoricalStates *)self setNMinusOneState:[(CLFenceAnalyticsHistoricalStates *)self currentState]];
  [(CLFenceAnalyticsHistoricalStates *)self setTimeOfNMinusOneStateChange:[(CLFenceAnalyticsHistoricalStates *)self timeOfCurrentStateChange]];
  [(CLFenceAnalyticsHistoricalStates *)self currentLocation];
  v33[6] = *(_OWORD *)&v34[33];
  v33[7] = *(_OWORD *)&v34[37];
  *(_OWORD *)v34 = *(_OWORD *)v35;
  *(_OWORD *)&v34[3] = *(_OWORD *)&v35[12];
  v33[2] = *(_OWORD *)&v34[17];
  v33[3] = *(_OWORD *)&v34[21];
  v33[4] = *(_OWORD *)&v34[25];
  v33[5] = *(_OWORD *)&v34[29];
  v33[0] = *(_OWORD *)&v34[9];
  v33[1] = *(_OWORD *)&v34[13];
  [(CLFenceAnalyticsHistoricalStates *)self setNMinusOneStateChangeLocation:v33];
  [(CLFenceAnalyticsHistoricalStates *)self setCurrentState:v9];
  [(CLFenceAnalyticsHistoricalStates *)self setTimeOfCurrentStateChange:+[NSDate dateWithTimeIntervalSinceReferenceDate:a6]];
  $AB5116BA7E623E054F959CECB034F4E7 rawCoordinate = a5->rawCoordinate;
  v31[6] = *(_OWORD *)&a5->lifespan;
  v31[7] = rawCoordinate;
  v32[0] = *(_OWORD *)&a5->rawCourse;
  *(_OWORD *)((char *)v32 + 12) = *(_OWORD *)&a5->integrity;
  long long v20 = *(_OWORD *)&a5->speed;
  v31[2] = *(_OWORD *)&a5->altitude;
  v31[3] = v20;
  long long v21 = *(_OWORD *)&a5->timestamp;
  v31[4] = *(_OWORD *)&a5->course;
  v31[5] = v21;
  long long v22 = *(_OWORD *)&a5->coordinate.longitude;
  v31[0] = *(_OWORD *)&a5->suitability;
  v31[1] = v22;
  [(CLFenceAnalyticsHistoricalStates *)self setCurrentLocation:v31];
}

- (void)updateTimeToInitialStateChange:(double)a3
{
  self->_timeToInitialStateChange = a3;
}

- (void)resetHistoricalStates
{
  *(void *)&long long v3 = 0x300000003;
  *((void *)&v3 + 1) = 0x300000003;
  *(_OWORD *)&self->_currentState = v3;
  [(CLFenceAnalyticsHistoricalStates *)self setTimeOfCurrentStateChange:0];
  [(CLFenceAnalyticsHistoricalStates *)self setTimeOfNMinusOneStateChange:0];
  [(CLFenceAnalyticsHistoricalStates *)self setTimeOfNMinusTwoStateChange:0];
  *(_OWORD *)&self->_currentLocation.coordinate.longitude = xmmword_101D82EC8;
  *(_OWORD *)&self->_currentLocation.suitability = xmmword_101D82EB8;
  *(_OWORD *)&self->_currentLocation.speed = xmmword_101D82EE8;
  *(_OWORD *)&self->_currentLocation.altitude = xmmword_101D82ED8;
  *(_OWORD *)&self->_currentLocation.timestamp = xmmword_101D82F08;
  *(_OWORD *)&self->_currentLocation.course = xmmword_101D82EF8;
  *(_OWORD *)&self->_currentLocation.lifespan = xmmword_101D82F18;
  self->_currentLocation.$AB5116BA7E623E054F959CECB034F4E7 rawCoordinate = ($AB5116BA7E623E054F959CECB034F4E7)xmmword_101D82F28;
  *(_OWORD *)&self->_currentLocation.rawCourse = xmmword_101D82F38;
  *(_OWORD *)&self->_currentLocation.integrity = *(long long *)((char *)&xmmword_101D82F38 + 12);
  *(_OWORD *)(&self->_nMinusOneStateChangeLocation.confidence + 1) = xmmword_101D82F28;
  *(_OWORD *)(&self->_nMinusOneStateChangeLocation.type + 1) = xmmword_101D82F38;
  *($AB5116BA7E623E054F959CECB034F4E7 *)((char *)&self->_nMinusOneStateChangeLocation.coordinate + 4) = ($AB5116BA7E623E054F959CECB034F4E7)xmmword_101D82ED8;
  *(_OWORD *)((char *)&self->_nMinusOneStateChangeLocation.horizontalAccuracy + 4) = xmmword_101D82EE8;
  *(_OWORD *)((char *)&self->_nMinusOneStateChangeLocation.verticalAccuracy + 4) = xmmword_101D82EF8;
  *(_OWORD *)((char *)&self->_nMinusOneStateChangeLocation.speedAccuracy + 4) = xmmword_101D82F08;
  *(_OWORD *)((char *)&self->_nMinusOneStateChangeLocation.courseAccuracy + 4) = xmmword_101D82F18;
  *(_OWORD *)(&self->_currentLocation.signalEnvironmentType + 1) = xmmword_101D82EB8;
  *(_OWORD *)(&self->_currentLocation.fromSimulationController + 4) = xmmword_101D82EC8;
  *(_OWORD *)&self->_nMinusTwoStateChangeLocation.courseAccuracy = xmmword_101D82F28;
  *(_OWORD *)&self->_nMinusTwoStateChangeLocation.confidence = xmmword_101D82F38;
  *(_OWORD *)((char *)&self->_nMinusTwoStateChangeLocation.lifespan + 4) = *(long long *)((char *)&xmmword_101D82F38 + 12);
  self->_nMinusTwoStateChangeLocation.coordinate = ($AB5116BA7E623E054F959CECB034F4E7)xmmword_101D82EE8;
  *(_OWORD *)&self->_nMinusTwoStateChangeLocation.horizontalAccuracy = xmmword_101D82EF8;
  *(_OWORD *)&self->_nMinusTwoStateChangeLocation.verticalAccuracy = xmmword_101D82F08;
  *(_OWORD *)&self->_nMinusTwoStateChangeLocation.speedAccuracy = xmmword_101D82F18;
  *(_OWORD *)&self->_nMinusOneStateChangeLocation.rawCoordinate.longitude = *(long long *)((char *)&xmmword_101D82F38 + 12);
  *(_OWORD *)&self->_nMinusOneStateChangeLocation.floor = xmmword_101D82EB8;
  *(_OWORD *)&self->_nMinusOneStateChangeLocation.signalEnvironmentType = xmmword_101D82EC8;
  *(_OWORD *)&self->_nMinusOneStateChangeLocation.fromSimulationController = xmmword_101D82ED8;
  self->_timeToInitialStateChange = -1.0;
}

- (int)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(int)a3
{
  self->_currentState = a3;
}

- (NSDate)timeOfCurrentStateChange
{
  return self->_timeOfCurrentStateChange;
}

- (void)setTimeOfCurrentStateChange:(id)a3
{
}

- (CLDaemonLocation)currentLocation
{
  $AB5116BA7E623E054F959CECB034F4E7 v3 = *($AB5116BA7E623E054F959CECB034F4E7 *)&self->fromSimulationController;
  *(_OWORD *)&retstr->lifespan = *(_OWORD *)&self->signalEnvironmentType;
  retstr->$AB5116BA7E623E054F959CECB034F4E7 rawCoordinate = v3;
  *($AB5116BA7E623E054F959CECB034F4E7 *)&retstr->rawCourse = self[1].coordinate;
  *(_OWORD *)&retstr->integrity = *(_OWORD *)((char *)&self[1].coordinate.longitude + 4);
  long long v4 = *(_OWORD *)&self->type;
  *(_OWORD *)&retstr->altitude = *(_OWORD *)&self->confidence;
  *(_OWORD *)&retstr->speed = v4;
  long long v5 = *(_OWORD *)&self->floor;
  *(_OWORD *)&retstr->course = *(_OWORD *)&self->rawCoordinate.longitude;
  *(_OWORD *)&retstr->timestamp = v5;
  long long v6 = *(_OWORD *)&self->courseAccuracy;
  *(_OWORD *)&retstr->suitability = *(_OWORD *)&self->speedAccuracy;
  *(_OWORD *)&retstr->coordinate.longitude = v6;
  return self;
}

- (void)setCurrentLocation:(CLDaemonLocation *)a3
{
  long long v3 = *(_OWORD *)&a3->suitability;
  *(_OWORD *)&self->_currentLocation.coordinate.longitude = *(_OWORD *)&a3->coordinate.longitude;
  *(_OWORD *)&self->_currentLocation.suitability = v3;
  long long v4 = *(_OWORD *)&a3->altitude;
  long long v5 = *(_OWORD *)&a3->speed;
  long long v6 = *(_OWORD *)&a3->course;
  *(_OWORD *)&self->_currentLocation.timestamp = *(_OWORD *)&a3->timestamp;
  *(_OWORD *)&self->_currentLocation.course = v6;
  *(_OWORD *)&self->_currentLocation.speed = v5;
  *(_OWORD *)&self->_currentLocation.altitude = v4;
  long long v7 = *(_OWORD *)&a3->lifespan;
  $AB5116BA7E623E054F959CECB034F4E7 rawCoordinate = a3->rawCoordinate;
  long long v9 = *(_OWORD *)&a3->rawCourse;
  *(_OWORD *)&self->_currentLocation.integrity = *(_OWORD *)&a3->integrity;
  *(_OWORD *)&self->_currentLocation.rawCourse = v9;
  self->_currentLocation.$AB5116BA7E623E054F959CECB034F4E7 rawCoordinate = rawCoordinate;
  *(_OWORD *)&self->_currentLocation.lifespan = v7;
}

- (int)nMinusOneState
{
  return self->_nMinusOneState;
}

- (void)setNMinusOneState:(int)a3
{
  self->_nMinusOneState = a3;
}

- (NSDate)timeOfNMinusOneStateChange
{
  return self->_timeOfNMinusOneStateChange;
}

- (void)setTimeOfNMinusOneStateChange:(id)a3
{
}

- (CLDaemonLocation)nMinusOneStateChangeLocation
{
  *(_OWORD *)&retstr->integrity = *(_OWORD *)&self[2].suitability;
  long long v3 = *(_OWORD *)((char *)&self[1].course + 4);
  long long v4 = *(_OWORD *)((char *)&self[1].speed + 4);
  *(_OWORD *)&retstr->suitability = *(_OWORD *)((char *)&self[1].altitude + 4);
  *(_OWORD *)&retstr->coordinate.longitude = v4;
  $AB5116BA7E623E054F959CECB034F4E7 v5 = *($AB5116BA7E623E054F959CECB034F4E7 *)&self[1].rawReferenceFrame;
  long long v6 = *(_OWORD *)((char *)&self[1].ellipsoidalAltitude + 4);
  long long v7 = *(long long *)((char *)&self[1].rawCoordinate + 4);
  *(_OWORD *)&retstr->lifespan = *(_OWORD *)((char *)&self[1].rawCourse + 4);
  retstr->$AB5116BA7E623E054F959CECB034F4E7 rawCoordinate = v5;
  *(_OWORD *)&retstr->rawCourse = v6;
  long long v8 = *(_OWORD *)((char *)&self[1].timestamp + 4);
  long long v9 = *(_OWORD *)((char *)&self[1].lifespan + 4);
  *(_OWORD *)&retstr->altitude = v3;
  *(_OWORD *)&retstr->speed = v8;
  *(_OWORD *)&retstr->course = v9;
  *(_OWORD *)&retstr->timestamp = v7;
  return self;
}

- (void)setNMinusOneStateChangeLocation:(CLDaemonLocation *)a3
{
  long long v3 = *(_OWORD *)&a3->suitability;
  *(_OWORD *)(&self->_currentLocation.fromSimulationController + 4) = *(_OWORD *)&a3->coordinate.longitude;
  *(_OWORD *)(&self->_currentLocation.signalEnvironmentType + 1) = v3;
  $AB5116BA7E623E054F959CECB034F4E7 v4 = *($AB5116BA7E623E054F959CECB034F4E7 *)&a3->altitude;
  long long v5 = *(_OWORD *)&a3->speed;
  long long v6 = *(_OWORD *)&a3->timestamp;
  *(_OWORD *)((char *)&self->_nMinusOneStateChangeLocation.verticalAccuracy + 4) = *(_OWORD *)&a3->course;
  *(_OWORD *)((char *)&self->_nMinusOneStateChangeLocation.speedAccuracy + 4) = v6;
  *(_OWORD *)((char *)&self->_nMinusOneStateChangeLocation.horizontalAccuracy + 4) = v5;
  *($AB5116BA7E623E054F959CECB034F4E7 *)((char *)&self->_nMinusOneStateChangeLocation.coordinate + 4) = v4;
  long long v7 = *(_OWORD *)&a3->lifespan;
  $AB5116BA7E623E054F959CECB034F4E7 rawCoordinate = a3->rawCoordinate;
  long long v9 = *(_OWORD *)&a3->rawCourse;
  *(_OWORD *)&self->_nMinusOneStateChangeLocation.rawCoordinate.longitude = *(_OWORD *)&a3->integrity;
  *($AB5116BA7E623E054F959CECB034F4E7 *)(&self->_nMinusOneStateChangeLocation.confidence + 1) = rawCoordinate;
  *(_OWORD *)(&self->_nMinusOneStateChangeLocation.type + 1) = v9;
  *(_OWORD *)((char *)&self->_nMinusOneStateChangeLocation.courseAccuracy + 4) = v7;
}

- (int)nMinusTwoState
{
  return self->_nMinusTwoState;
}

- (void)setNMinusTwoState:(int)a3
{
  self->_nMinusTwoState = a3;
}

- (NSDate)timeOfNMinusTwoStateChange
{
  return self->_timeOfNMinusTwoStateChange;
}

- (void)setTimeOfNMinusTwoStateChange:(id)a3
{
}

- (CLDaemonLocation)nMinusTwoStateChangeLocation
{
  $AB5116BA7E623E054F959CECB034F4E7 v3 = *($AB5116BA7E623E054F959CECB034F4E7 *)&self[2].rawCourse;
  *($AB5116BA7E623E054F959CECB034F4E7 *)&retstr->lifespan = self[2].rawCoordinate;
  retstr->$AB5116BA7E623E054F959CECB034F4E7 rawCoordinate = v3;
  *(_OWORD *)&retstr->rawCourse = *(_OWORD *)&self[2].referenceFrame;
  long long v4 = *(_OWORD *)&self[2].course;
  *(_OWORD *)&retstr->altitude = *(_OWORD *)&self[2].speed;
  *(_OWORD *)&retstr->speed = v4;
  long long v5 = *(_OWORD *)&self[2].lifespan;
  *(_OWORD *)&retstr->course = *(_OWORD *)&self[2].timestamp;
  *(_OWORD *)&retstr->timestamp = v5;
  long long v6 = *(_OWORD *)&self[2].altitude;
  *(_OWORD *)&retstr->suitability = *(_OWORD *)&self[2].coordinate.longitude;
  *(_OWORD *)&retstr->coordinate.longitude = v6;
  *(_OWORD *)&retstr->integrity = *(_OWORD *)(&self[2].signalEnvironmentType + 1);
  return self;
}

- (void)setNMinusTwoStateChangeLocation:(CLDaemonLocation *)a3
{
  long long v3 = *(_OWORD *)&a3->coordinate.longitude;
  *(_OWORD *)&self->_nMinusOneStateChangeLocation.floor = *(_OWORD *)&a3->suitability;
  *(_OWORD *)&self->_nMinusOneStateChangeLocation.signalEnvironmentType = v3;
  long long v4 = *(_OWORD *)&a3->altitude;
  $AB5116BA7E623E054F959CECB034F4E7 v5 = *($AB5116BA7E623E054F959CECB034F4E7 *)&a3->speed;
  long long v6 = *(_OWORD *)&a3->timestamp;
  *(_OWORD *)&self->_nMinusTwoStateChangeLocation.horizontalAccuracy = *(_OWORD *)&a3->course;
  *(_OWORD *)&self->_nMinusTwoStateChangeLocation.verticalAccuracy = v6;
  *(_OWORD *)&self->_nMinusOneStateChangeLocation.fromSimulationController = v4;
  self->_nMinusTwoStateChangeLocation.coordinate = v5;
  long long v7 = *(_OWORD *)&a3->lifespan;
  $AB5116BA7E623E054F959CECB034F4E7 rawCoordinate = a3->rawCoordinate;
  long long v9 = *(_OWORD *)&a3->rawCourse;
  *(_OWORD *)((char *)&self->_nMinusTwoStateChangeLocation.lifespan + 4) = *(_OWORD *)&a3->integrity;
  *($AB5116BA7E623E054F959CECB034F4E7 *)&self->_nMinusTwoStateChangeLocation.courseAccuracy = rawCoordinate;
  *(_OWORD *)&self->_nMinusTwoStateChangeLocation.confidence = v9;
  *(_OWORD *)&self->_nMinusTwoStateChangeLocation.speedAccuracy = v7;
}

- (int)nMinusThreeState
{
  return self->_nMinusThreeState;
}

- (void)setNMinusThreeState:(int)a3
{
  self->_nMinusThreeState = a3;
}

- (double)timeToInitialStateChange
{
  return self->_timeToInitialStateChange;
}

- (void)setTimeToInitialStateChange:(double)a3
{
  self->_timeToInitialStateChange = a3;
}

- (id).cxx_construct
{
  *((_DWORD *)self + 14) = 0xFFFF;
  *(void *)((char *)self + 68) = 0;
  *(void *)((char *)self + 60) = 0;
  *(_OWORD *)((char *)self + 76) = xmmword_101D1C320;
  __asm { FMOV            V1.2D, #-1.0 }
  *(_OWORD *)((char *)self + 92) = _Q1;
  *(_OWORD *)((char *)self + 108) = _Q1;
  *(_OWORD *)((char *)self + 124) = _Q1;
  *((_DWORD *)self + 35) = 0;
  *((void *)self + 19) = 0;
  *((void *)self + 20) = 0;
  *((void *)self + 18) = 0xBFF0000000000000;
  *((_DWORD *)self + 42) = 0;
  *(void *)((char *)self + 172) = 0xBFF0000000000000;
  *((_DWORD *)self + 45) = 0x7FFFFFFF;
  *((void *)self + 24) = 0;
  *((void *)self + 25) = 0;
  *((void *)self + 23) = 0;
  *((unsigned char *)self + 208) = 0;
  *((_DWORD *)self + 53) = 0xFFFF;
  *((void *)self + 27) = 0;
  *((void *)self + 28) = 0;
  *(_OWORD *)((char *)self + 232) = xmmword_101D1C320;
  *(_OWORD *)((char *)self + 248) = _Q1;
  *((void *)self + 33) = 0xBFF0000000000000;
  *((_OWORD *)self + 17) = _Q1;
  *((void *)self + 36) = 0xBFF0000000000000;
  *((_DWORD *)self + 74) = 0;
  *(void *)((char *)self + 300) = 0xBFF0000000000000;
  *((_DWORD *)self + 81) = 0;
  *(void *)((char *)self + 308) = 0;
  *(void *)((char *)self + 316) = 0;
  *((void *)self + 41) = 0xBFF0000000000000;
  *((_DWORD *)self + 84) = 0x7FFFFFFF;
  *(void *)((char *)self + 356) = 0;
  *(void *)((char *)self + 340) = 0;
  *(void *)((char *)self + 348) = 0;
  *((unsigned char *)self + 364) = 0;
  *((_DWORD *)self + 92) = 0xFFFF;
  *(void *)((char *)self + 380) = 0;
  *(void *)((char *)self + 372) = 0;
  *(_OWORD *)((char *)self + 388) = xmmword_101D1C320;
  *(_OWORD *)((char *)self + 404) = _Q1;
  *(_OWORD *)((char *)self + 420) = _Q1;
  *(_OWORD *)((char *)self + 436) = _Q1;
  *((_DWORD *)self + 113) = 0;
  *((_DWORD *)self + 120) = 0;
  *((void *)self + 57) = 0xBFF0000000000000;
  *((void *)self + 58) = 0;
  *((void *)self + 59) = 0;
  *(void *)((char *)self + 484) = 0xBFF0000000000000;
  *((_DWORD *)self + 123) = 0x7FFFFFFF;
  *((void *)self + 62) = 0;
  *((void *)self + 63) = 0;
  *((void *)self + 64) = 0;
  *((unsigned char *)self + 520) = 0;
  return self;
}

@end