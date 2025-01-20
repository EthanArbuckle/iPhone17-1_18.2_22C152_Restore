@interface SMMessageDeletedNotification
- (SMMessage)message;
- (SMMessageDeletedNotification)init;
- (SMMessageDeletedNotification)initWithMessage:(id)a3;
@end

@implementation SMMessageDeletedNotification

- (SMMessageDeletedNotification)init
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    v6 = "-[SMMessageDeletedNotification init]";
    __int16 v7 = 1024;
    int v8 = 93;
    _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "default initializer not supported for SMMessageDeletedNotification (in %s:%d)", (uint8_t *)&v5, 0x12u);
  }

  return 0;
}

- (SMMessageDeletedNotification)initWithMessage:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)SMMessageDeletedNotification;
    v6 = [(RTNotification *)&v11 init];
    __int16 v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_message, a3);
    }
    self = v7;
    int v8 = self;
  }
  else
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: message", buf, 2u);
    }

    int v8 = 0;
  }

  return v8;
}

- (SMMessage)message
{
  return self->_message;
}

- (void).cxx_destruct
{
}

@end