@interface SMSessionStartMessageSendResultNotification
- (BOOL)success;
- (NSError)error;
- (NSString)messageGUID;
- (SMSessionStartMessage)message;
- (SMSessionStartMessageSendResultNotification)init;
- (SMSessionStartMessageSendResultNotification)initWithSessionStartMessage:(id)a3 messageGUID:(id)a4 success:(BOOL)a5 error:(id)a6;
@end

@implementation SMSessionStartMessageSendResultNotification

- (SMSessionStartMessageSendResultNotification)init
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    v6 = "-[SMSessionStartMessageSendResultNotification init]";
    __int16 v7 = 1024;
    int v8 = 38;
    _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "default initializer not supported for SMSessionStartMessageSendResultNotification (in %s:%d)", (uint8_t *)&v5, 0x12u);
  }

  return 0;
}

- (SMSessionStartMessageSendResultNotification)initWithSessionStartMessage:(id)a3 messageGUID:(id)a4 success:(BOOL)a5 error:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (!v11)
  {
    v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v16 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v18 = "Invalid parameter not satisfying: message";
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, v18, buf, 2u);
    goto LABEL_9;
  }
  if (!v12)
  {
    v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v18 = "Invalid parameter not satisfying: messageGUID";
    goto LABEL_12;
  }
  v20.receiver = self;
  v20.super_class = (Class)SMSessionStartMessageSendResultNotification;
  v14 = [(RTNotification *)&v20 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_message, a3);
    objc_storeStrong((id *)&v15->_messageGUID, a4);
    v15->_success = a5;
    objc_storeStrong((id *)&v15->_error, a6);
  }
  self = v15;
  v16 = self;
LABEL_10:

  return v16;
}

- (SMSessionStartMessage)message
{
  return self->_message;
}

- (NSString)messageGUID
{
  return self->_messageGUID;
}

- (BOOL)success
{
  return self->_success;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_messageGUID, 0);

  objc_storeStrong((id *)&self->_message, 0);
}

@end