@interface RTFMCScoreBoard
- (BOOL)assisted;
- (BOOL)engaged;
- (NSDate)creationDate;
- (RTFMCScoreBoard)init;
- (RTFMCScoreBoard)initWithLocationType:(int)a3;
- (int)assistances;
- (int)assistedParkingEvents;
- (int)engagedParkingEvents;
- (int)engagements;
- (int)locationType;
- (int)parkingEvents;
- (int)suppressedEvents;
- (void)assistanceEvent;
- (void)clearScoreBoard;
- (void)copyToMetric:(id)a3;
- (void)engagementEvent;
- (void)parkingEvent;
- (void)setAssistances:(int)a3;
- (void)setAssisted:(BOOL)a3;
- (void)setAssistedParkingEvents:(int)a3;
- (void)setCreationDate:(id)a3;
- (void)setEngaged:(BOOL)a3;
- (void)setEngagedParkingEvents:(int)a3;
- (void)setEngagements:(int)a3;
- (void)setLocationType:(int)a3;
- (void)setParkingEvents:(int)a3;
- (void)setSuppressedEvents:(int)a3;
- (void)suppressedEvent;
@end

@implementation RTFMCScoreBoard

- (RTFMCScoreBoard)init
{
  return [(RTFMCScoreBoard *)self initWithLocationType:0xFFFFFFFFLL];
}

- (RTFMCScoreBoard)initWithLocationType:(int)a3
{
  v7.receiver = self;
  v7.super_class = (Class)RTFMCScoreBoard;
  v4 = [(RTFMCScoreBoard *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_locationType = a3;
    [(RTFMCScoreBoard *)v4 clearScoreBoard];
  }
  return v5;
}

- (void)clearScoreBoard
{
  v3 = [MEMORY[0x1E4F1C9C8] date];
  [(RTFMCScoreBoard *)self setCreationDate:v3];

  [(RTFMCScoreBoard *)self setEngaged:0];
  [(RTFMCScoreBoard *)self setAssisted:0];
  [(RTFMCScoreBoard *)self setParkingEvents:0];
  [(RTFMCScoreBoard *)self setEngagedParkingEvents:0];
  [(RTFMCScoreBoard *)self setAssistedParkingEvents:0];
  [(RTFMCScoreBoard *)self setEngagements:0];
  [(RTFMCScoreBoard *)self setAssistances:0];

  [(RTFMCScoreBoard *)self setSuppressedEvents:0];
}

- (void)copyToMetric:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v8 = a3;
  v5 = [v4 date];
  v6 = [(RTFMCScoreBoard *)self creationDate];
  [v5 timeIntervalSinceDate:v6];
  [v8 setDuration:(int)v7];

  [v8 setParkingEvents:-[RTFMCScoreBoard parkingEvents](self, "parkingEvents")];
  [v8 setEngagedParkingEvents:-[RTFMCScoreBoard engagedParkingEvents](self, "engagedParkingEvents")];
  [v8 setAssistedParkingEvents:-[RTFMCScoreBoard assistedParkingEvents](self, "assistedParkingEvents")];
  [v8 setEngagements:-[RTFMCScoreBoard engagements](self, "engagements")];
  [v8 setAssistances:-[RTFMCScoreBoard assistances](self, "assistances")];
  [v8 setSuppressedParkingEvents:-[RTFMCScoreBoard suppressedEvents](self, "suppressedEvents")];
  [v8 setLocationType:-[RTFMCScoreBoard locationType](self, "locationType")];
}

- (void)parkingEvent
{
  [(RTFMCScoreBoard *)self setParkingEvents:[(RTFMCScoreBoard *)self parkingEvents] + 1];
  [(RTFMCScoreBoard *)self setEngaged:0];
  [(RTFMCScoreBoard *)self setAssisted:0];
  v3 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "FMC scoreboard: parked", v4, 2u);
  }
}

- (void)assistanceEvent
{
  [(RTFMCScoreBoard *)self setAssistances:[(RTFMCScoreBoard *)self assistances] + 1];
  if ([(RTFMCScoreBoard *)self assisted])
  {
    v3 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      __int16 v6 = 0;
      v4 = "FMC scoreboard: assistance";
      v5 = (uint8_t *)&v6;
LABEL_6:
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, v4, v5, 2u);
    }
  }
  else
  {
    [(RTFMCScoreBoard *)self setAssistedParkingEvents:[(RTFMCScoreBoard *)self assistedParkingEvents] + 1];
    [(RTFMCScoreBoard *)self setAssisted:1];
    v3 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v4 = "FMC scoreboard: first assistance";
      v5 = buf;
      goto LABEL_6;
    }
  }
}

- (void)engagementEvent
{
  [(RTFMCScoreBoard *)self setEngagements:[(RTFMCScoreBoard *)self engagements] + 1];
  if ([(RTFMCScoreBoard *)self engaged])
  {
    v3 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      __int16 v6 = 0;
      v4 = "FMC scoreboard: engagement";
      v5 = (uint8_t *)&v6;
LABEL_6:
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, v4, v5, 2u);
    }
  }
  else
  {
    [(RTFMCScoreBoard *)self setEngagedParkingEvents:[(RTFMCScoreBoard *)self engagedParkingEvents] + 1];
    [(RTFMCScoreBoard *)self setEngaged:1];
    v3 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v4 = "FMC scoreboard: first engagement";
      v5 = buf;
      goto LABEL_6;
    }
  }
}

- (void)suppressedEvent
{
  [(RTFMCScoreBoard *)self setSuppressedEvents:[(RTFMCScoreBoard *)self suppressedEvents] + 1];
  v2 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "FMC scoreboard: suppression", v3, 2u);
  }
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (int)locationType
{
  return self->_locationType;
}

- (void)setLocationType:(int)a3
{
  self->_locationType = a3;
}

- (BOOL)engaged
{
  return self->_engaged;
}

- (void)setEngaged:(BOOL)a3
{
  self->_engaged = a3;
}

- (BOOL)assisted
{
  return self->_assisted;
}

- (void)setAssisted:(BOOL)a3
{
  self->_assisted = a3;
}

- (int)parkingEvents
{
  return self->_parkingEvents;
}

- (void)setParkingEvents:(int)a3
{
  self->_parkingEvents = a3;
}

- (int)engagedParkingEvents
{
  return self->_engagedParkingEvents;
}

- (void)setEngagedParkingEvents:(int)a3
{
  self->_engagedParkingEvents = a3;
}

- (int)assistedParkingEvents
{
  return self->_assistedParkingEvents;
}

- (void)setAssistedParkingEvents:(int)a3
{
  self->_assistedParkingEvents = a3;
}

- (int)engagements
{
  return self->_engagements;
}

- (void)setEngagements:(int)a3
{
  self->_engagements = a3;
}

- (int)assistances
{
  return self->_assistances;
}

- (void)setAssistances:(int)a3
{
  self->_assistances = a3;
}

- (int)suppressedEvents
{
  return self->_suppressedEvents;
}

- (void)setSuppressedEvents:(int)a3
{
  self->_suppressedEvents = a3;
}

- (void).cxx_destruct
{
}

@end