@interface RTDarwinNotificationRecord
- (NSNumber)registrationToken;
- (NSString)notificationName;
- (RTDarwinNotificationRecord)init;
- (RTDarwinNotificationRecord)initWithNotificationName:(id)a3 registrationToken:(id)a4 handler:(id)a5;
- (id)handler;
- (void)setHandler:(id)a3;
- (void)setNotificationName:(id)a3;
- (void)setRegistrationToken:(id)a3;
@end

@implementation RTDarwinNotificationRecord

- (NSNumber)registrationToken
{
  return self->_registrationToken;
}

- (id)handler
{
  return self->_handler;
}

- (RTDarwinNotificationRecord)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithNotificationName_registrationToken_handler_);
}

- (RTDarwinNotificationRecord)initWithNotificationName:(id)a3 registrationToken:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (!v8)
  {
    v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v21 = "Invalid parameter not satisfying: notificationName";
LABEL_13:
    _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, v21, buf, 2u);
    goto LABEL_14;
  }
  if (!v9)
  {
    v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v21 = "Invalid parameter not satisfying: registrationToken";
    goto LABEL_13;
  }
  if (!v10)
  {
    v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v21 = "Invalid parameter not satisfying: handler";
      goto LABEL_13;
    }
LABEL_14:

    v19 = 0;
    goto LABEL_15;
  }
  v23.receiver = self;
  v23.super_class = (Class)RTDarwinNotificationRecord;
  v12 = [(RTDarwinNotificationRecord *)&v23 init];
  if (v12)
  {
    uint64_t v13 = [v8 copy];
    notificationName = v12->_notificationName;
    v12->_notificationName = (NSString *)v13;

    uint64_t v15 = [v9 copy];
    registrationToken = v12->_registrationToken;
    v12->_registrationToken = (NSNumber *)v15;

    uint64_t v17 = [v11 copy];
    id handler = v12->_handler;
    v12->_id handler = (id)v17;
  }
  self = v12;
  v19 = self;
LABEL_15:

  return v19;
}

- (NSString)notificationName
{
  return self->_notificationName;
}

- (void)setNotificationName:(id)a3
{
}

- (void)setRegistrationToken:(id)a3
{
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_registrationToken, 0);

  objc_storeStrong((id *)&self->_notificationName, 0);
}

@end