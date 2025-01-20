@interface RTPointOfInterestMonitorVisitNotification
- (RTPointOfInterestMonitorVisitNotification)init;
- (RTPointOfInterestMonitorVisitNotification)initWithVisit:(id)a3;
- (RTVisit)visit;
@end

@implementation RTPointOfInterestMonitorVisitNotification

- (RTPointOfInterestMonitorVisitNotification)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithVisit_);
}

- (RTPointOfInterestMonitorVisitNotification)initWithVisit:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v11.receiver = self;
    v11.super_class = (Class)RTPointOfInterestMonitorVisitNotification;
    v5 = [(RTNotification *)&v11 init];
    if (v5)
    {
      uint64_t v6 = [v4 copy];
      visit = v5->_visit;
      v5->_visit = (RTVisit *)v6;
    }
    self = v5;
    v8 = self;
  }
  else
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visit", buf, 2u);
    }

    v8 = 0;
  }

  return v8;
}

- (RTVisit)visit
{
  return self->_visit;
}

- (void).cxx_destruct
{
}

@end