@interface RTXPCActivityTask
- (NSString)identifier;
- (OS_xpc_object)activity;
- (RTXPCActivityTask)init;
- (RTXPCActivityTask)initWithIdentifier:(id)a3 activity:(id)a4 handler:(id)a5;
- (id)handler;
@end

@implementation RTXPCActivityTask

- (RTXPCActivityTask)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithIdentifier_activity_handler_);
}

- (RTXPCActivityTask)initWithIdentifier:(id)a3 activity:(id)a4 handler:(id)a5
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
    v19 = "Invalid parameter not satisfying: activity";
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
  v21.super_class = (Class)RTXPCActivityTask;
  v13 = [(RTXPCActivityTask *)&v21 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_identifier, a3);
    objc_storeStrong((id *)&v14->_activity, a4);
    uint64_t v15 = [v12 copy];
    id handler = v14->_handler;
    v14->_id handler = (id)v15;
  }
  self = v14;
  v17 = self;
LABEL_15:

  return v17;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (id)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_activity, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end