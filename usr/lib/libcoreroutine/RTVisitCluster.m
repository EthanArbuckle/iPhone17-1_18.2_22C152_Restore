@interface RTVisitCluster
- (BOOL)isCompleteAndExitDateIsEqualToDate:(id)a3;
- (BOOL)isDateInside:(id)a3;
- (BOOL)isExitDateBeforeDate:(id)a3;
- (BOOL)isPartialAndExitDateIsEqualToDate:(id)a3;
- (RTVisit)visit;
- (RTVisitCluster)init;
- (RTVisitCluster)initWithPoints:(id)a3;
- (RTVisitCluster)initWithPoints:(id)a3 visit:(id)a4;
- (RTVisitLocationPoints)points;
- (id)description;
@end

@implementation RTVisitCluster

- (RTVisitCluster)initWithPoints:(id)a3 visit:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unint64_t v7 = (unint64_t)a3;
  id v8 = a4;
  uint64_t v9 = [v8 exit];
  unint64_t v10 = v7 | v9;

  if (!v10)
  {
    v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[RTVisitCluster initWithPoints:visit:]";
      __int16 v21 = 1024;
      int v22 = 23;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visit.exit || points (in %s:%d)", buf, 0x12u);
    }
  }
  uint64_t v12 = [v8 exit];
  unint64_t v13 = v7 | v12;

  if (v13)
  {
    v18.receiver = self;
    v18.super_class = (Class)RTVisitCluster;
    v14 = [(RTVisitCluster *)&v18 init];
    p_isa = (id *)&v14->super.isa;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_points, a3);
      objc_storeStrong(p_isa + 2, a4);
    }
    self = p_isa;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (RTVisitCluster)initWithPoints:(id)a3
{
  return [(RTVisitCluster *)self initWithPoints:a3 visit:0];
}

- (RTVisitCluster)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithPoints_visit_);
}

- (BOOL)isDateInside:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      v11 = "-[RTVisitCluster isDateInside:]";
      __int16 v12 = 1024;
      int v13 = 46;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date (in %s:%d)", (uint8_t *)&v10, 0x12u);
    }

    goto LABEL_7;
  }
  v5 = [(RTVisit *)self->_visit entry];
  char v6 = [v5 isAfterDate:v4];

  if (v6)
  {
LABEL_7:
    LOBYTE(v7) = 0;
    goto LABEL_8;
  }
  BOOL v7 = ![(RTVisitCluster *)self isExitDateBeforeDate:v4];
LABEL_8:

  return v7;
}

- (BOOL)isExitDateBeforeDate:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = [(RTVisit *)self->_visit exit];
    char v6 = [v5 isBeforeDate:v4];
  }
  else
  {
    BOOL v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      int v10 = "-[RTVisitCluster isExitDateBeforeDate:]";
      __int16 v11 = 1024;
      int v12 = 63;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date (in %s:%d)", (uint8_t *)&v9, 0x12u);
    }

    char v6 = 0;
  }

  return v6;
}

- (BOOL)isPartialAndExitDateIsEqualToDate:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = [(RTVisit *)self->_visit exit];
    if (v5)
    {
      char v6 = 0;
    }
    else
    {
      id v8 = [(RTVisitLocationPoints *)self->_points lastDate];
      char v6 = [v4 isEqualToDate:v8];
    }
  }
  else
  {
    BOOL v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      __int16 v11 = "-[RTVisitCluster isPartialAndExitDateIsEqualToDate:]";
      __int16 v12 = 1024;
      int v13 = 74;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date (in %s:%d)", (uint8_t *)&v10, 0x12u);
    }

    char v6 = 0;
  }

  return v6;
}

- (BOOL)isCompleteAndExitDateIsEqualToDate:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = [(RTVisit *)self->_visit exit];
    if (v5)
    {
      char v6 = [(RTVisit *)self->_visit exit];
      char v7 = [v4 isEqualToDate:v6];
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      __int16 v11 = "-[RTVisitCluster isCompleteAndExitDateIsEqualToDate:]";
      __int16 v12 = 1024;
      int v13 = 83;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date (in %s:%d)", (uint8_t *)&v10, 0x12u);
    }

    char v7 = 0;
  }

  return v7;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"visit, %@, points, %@", self->_visit, self->_points];
}

- (RTVisitLocationPoints)points
{
  return self->_points;
}

- (RTVisit)visit
{
  return self->_visit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visit, 0);

  objc_storeStrong((id *)&self->_points, 0);
}

@end