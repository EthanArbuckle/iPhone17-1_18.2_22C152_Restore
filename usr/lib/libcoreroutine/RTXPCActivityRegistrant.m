@interface RTXPCActivityRegistrant
- (NSString)identifier;
- (RTXPCActivityCriteria)criteria;
- (RTXPCActivityRegistrant)init;
- (RTXPCActivityRegistrant)initWithIdentifier:(id)a3 criteria:(id)a4 handler:(id)a5;
- (id)description;
- (id)handler;
@end

@implementation RTXPCActivityRegistrant

- (RTXPCActivityRegistrant)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithIdentifier_criteria_handler_);
}

- (RTXPCActivityRegistrant)initWithIdentifier:(id)a3 criteria:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (!v9)
  {
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: identifier";
LABEL_13:
    _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, v19, buf, 2u);
    goto LABEL_14;
  }
  if (!v10)
  {
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: criteria";
    goto LABEL_13;
  }
  if (!v11)
  {
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v19 = "Invalid parameter not satisfying: handler";
      goto LABEL_13;
    }
LABEL_14:

    v17 = 0;
    goto LABEL_15;
  }
  v21.receiver = self;
  v21.super_class = (Class)RTXPCActivityRegistrant;
  v13 = [(RTXPCActivityRegistrant *)&v21 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_identifier, a3);
    objc_storeStrong((id *)&v14->_criteria, a4);
    uint64_t v15 = [v12 copy];
    id handler = v14->_handler;
    v14->_id handler = (id)v15;
  }
  self = v14;
  v17 = self;
LABEL_15:

  return v17;
}

- (id)description
{
  v3 = NSString;
  v4 = [(RTXPCActivityRegistrant *)self identifier];
  v5 = [(RTXPCActivityRegistrant *)self criteria];
  v6 = [v3 stringWithFormat:@"identifier, %@, criteria, %@", v4, v5];

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (RTXPCActivityCriteria)criteria
{
  return self->_criteria;
}

- (id)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_criteria, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end