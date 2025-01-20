@interface RTVisitMonitorStatus
- (BOOL)invalid;
- (BOOL)monitoringLeechedVisitIncidents;
- (BOOL)monitoringLowConfidenceVisitIncidents;
- (BOOL)monitoringVisitIncidents;
- (RTVisitMonitorStatus)initWithMonitoringVisitIncidents:(BOOL)a3 monitoringLeechedVisitIncidents:(BOOL)a4 monitoringLowConfidenceVisitIncidents:(BOOL)a5 feedBufferReferenceCounter:(unint64_t)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)feedBufferReferenceCounter;
- (void)setFeedBufferReferenceCounter:(unint64_t)a3;
- (void)setMonitoringLeechedVisitIncidents:(BOOL)a3;
- (void)setMonitoringLowConfidenceVisitIncidents:(BOOL)a3;
- (void)setMonitoringVisitIncidents:(BOOL)a3;
@end

@implementation RTVisitMonitorStatus

- (RTVisitMonitorStatus)initWithMonitoringVisitIncidents:(BOOL)a3 monitoringLeechedVisitIncidents:(BOOL)a4 monitoringLowConfidenceVisitIncidents:(BOOL)a5 feedBufferReferenceCounter:(unint64_t)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)RTVisitMonitorStatus;
  v10 = [(RTVisitMonitorStatus *)&v15 init];
  v11 = v10;
  if (v10
    && (v10->_monitoringVisitIncidents = a3,
        v10->_monitoringLeechedVisitIncidents = a4,
        v10->_monitoringLowConfidenceVisitIncidents = a5,
        v10->_feedBufferReferenceCounter = a6,
        [(RTVisitMonitorStatus *)v10 invalid]))
  {
    v12 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v11;
      _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "Invalid RTVisitMonitorStatus, %@", buf, 0xCu);
    }

    v13 = 0;
  }
  else
  {
    v13 = v11;
  }

  return v13;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(RTVisitMonitorStatus *)self feedBufferReferenceCounter];
  if ([(RTVisitMonitorStatus *)self monitoringVisitIncidents]) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  if ([(RTVisitMonitorStatus *)self monitoringLeechedVisitIncidents]) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  if ([(RTVisitMonitorStatus *)self monitoringLowConfidenceVisitIncidents]) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  v10 = [v3 stringWithFormat:@"%@, feedBufferReferenceCounter, %lu, monitoringVisitIncidents, %@, monitoringLeechedVisitIncidents, %@, monitoringLowConfVisitIncidents, %@", v5, v6, v7, v8, v9];

  return v10;
}

- (BOOL)invalid
{
  if ([(RTVisitMonitorStatus *)self monitoringVisitIncidents]) {
    BOOL v3 = [(RTVisitMonitorStatus *)self feedBufferReferenceCounter] == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if ([(RTVisitMonitorStatus *)self monitoringLeechedVisitIncidents]) {
    BOOL v4 = [(RTVisitMonitorStatus *)self feedBufferReferenceCounter] == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if ([(RTVisitMonitorStatus *)self monitoringLowConfidenceVisitIncidents]) {
    BOOL v5 = [(RTVisitMonitorStatus *)self feedBufferReferenceCounter] == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (![(RTVisitMonitorStatus *)self feedBufferReferenceCounter]
    || [(RTVisitMonitorStatus *)self monitoringVisitIncidents]
    || [(RTVisitMonitorStatus *)self monitoringLeechedVisitIncidents])
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    int v6 = ![(RTVisitMonitorStatus *)self monitoringLowConfidenceVisitIncidents];
  }
  return (v4 || v3) | v5 | v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  BOOL v5 = [(RTVisitMonitorStatus *)self monitoringVisitIncidents];
  BOOL v6 = [(RTVisitMonitorStatus *)self monitoringLeechedVisitIncidents];
  BOOL v7 = [(RTVisitMonitorStatus *)self monitoringLowConfidenceVisitIncidents];
  unint64_t v8 = [(RTVisitMonitorStatus *)self feedBufferReferenceCounter];

  return (id)[v4 initWithMonitoringVisitIncidents:v5 monitoringLeechedVisitIncidents:v6 monitoringLowConfidenceVisitIncidents:v7 feedBufferReferenceCounter:v8];
}

- (BOOL)monitoringVisitIncidents
{
  return self->_monitoringVisitIncidents;
}

- (void)setMonitoringVisitIncidents:(BOOL)a3
{
  self->_monitoringVisitIncidents = a3;
}

- (BOOL)monitoringLeechedVisitIncidents
{
  return self->_monitoringLeechedVisitIncidents;
}

- (void)setMonitoringLeechedVisitIncidents:(BOOL)a3
{
  self->_monitoringLeechedVisitIncidents = a3;
}

- (BOOL)monitoringLowConfidenceVisitIncidents
{
  return self->_monitoringLowConfidenceVisitIncidents;
}

- (void)setMonitoringLowConfidenceVisitIncidents:(BOOL)a3
{
  self->_monitoringLowConfidenceVisitIncidents = a3;
}

- (unint64_t)feedBufferReferenceCounter
{
  return self->_feedBufferReferenceCounter;
}

- (void)setFeedBufferReferenceCounter:(unint64_t)a3
{
  self->_feedBufferReferenceCounter = a3;
}

@end