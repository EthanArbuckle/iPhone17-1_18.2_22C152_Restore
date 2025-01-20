@interface SMMessageReceivedNotification
- (BOOL)fromMe;
- (SMHandle)from;
- (SMMessage)message;
- (SMMessageReceivedNotification)init;
- (SMMessageReceivedNotification)initWithMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5;
@end

@implementation SMMessageReceivedNotification

- (SMMessageReceivedNotification)init
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    v6 = "-[SMMessageReceivedNotification init]";
    __int16 v7 = 1024;
    int v8 = 68;
    _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "default initializer not supported for SMMessageReceivedNotification (in %s:%d)", (uint8_t *)&v5, 0x12u);
  }

  return 0;
}

- (SMMessageReceivedNotification)initWithMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if (!v9)
  {
    v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v14 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: message";
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
    goto LABEL_9;
  }
  if (!v10)
  {
    v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: from";
    goto LABEL_12;
  }
  v18.receiver = self;
  v18.super_class = (Class)SMMessageReceivedNotification;
  v12 = [(RTNotification *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_message, a3);
    objc_storeStrong((id *)&v13->_from, a4);
    v13->_fromMe = a5;
  }
  self = v13;
  v14 = self;
LABEL_10:

  return v14;
}

- (SMMessage)message
{
  return self->_message;
}

- (SMHandle)from
{
  return self->_from;
}

- (BOOL)fromMe
{
  return self->_fromMe;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_from, 0);

  objc_storeStrong((id *)&self->_message, 0);
}

@end