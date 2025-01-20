@interface RTVisitMonitorState
- (RTVisit)lastLowConfidenceVisitIncident;
- (RTVisit)lastVisitIncident;
- (RTVisitMonitorState)init;
- (RTVisitMonitorState)initWithLastVisit:(id)a3 lastLowConfidenceVisit:(id)a4;
- (void)dump;
- (void)setLastLowConfidenceVisitIncident:(id)a3;
- (void)setLastVisitIncident:(id)a3;
@end

@implementation RTVisitMonitorState

- (RTVisitMonitorState)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithLastVisit_lastLowConfidenceVisit_);
}

- (RTVisitMonitorState)initWithLastVisit:(id)a3 lastLowConfidenceVisit:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RTVisitMonitorState;
  v9 = [(RTVisitMonitorState *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_lastVisitIncident, a3);
    objc_storeStrong((id *)&v10->_lastLowConfidenceVisitIncident, a4);
  }

  return v10;
}

- (void)dump
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    v3 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = (objc_class *)objc_opt_class();
      v5 = NSStringFromClass(v4);
      v6 = [(RTVisitMonitorState *)self lastVisitIncident];
      id v7 = [(RTVisitMonitorState *)self lastLowConfidenceVisitIncident];
      int v8 = 138412802;
      v9 = v5;
      __int16 v10 = 2112;
      v11 = v6;
      __int16 v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%@, lastVisit, %@, lastLowConfidenceVisit, %@", (uint8_t *)&v8, 0x20u);
    }
  }
}

- (RTVisit)lastVisitIncident
{
  return self->_lastVisitIncident;
}

- (void)setLastVisitIncident:(id)a3
{
}

- (RTVisit)lastLowConfidenceVisitIncident
{
  return self->_lastLowConfidenceVisitIncident;
}

- (void)setLastLowConfidenceVisitIncident:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastLowConfidenceVisitIncident, 0);

  objc_storeStrong((id *)&self->_lastVisitIncident, 0);
}

@end