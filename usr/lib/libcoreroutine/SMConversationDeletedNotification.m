@interface SMConversationDeletedNotification
- (SMConversation)conversation;
- (SMConversationDeletedNotification)init;
- (SMConversationDeletedNotification)initWithConversation:(id)a3;
@end

@implementation SMConversationDeletedNotification

- (SMConversationDeletedNotification)init
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    v6 = "-[SMConversationDeletedNotification init]";
    __int16 v7 = 1024;
    int v8 = 113;
    _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "default initializer not supported for SMConversationDeletedNotification (in %s:%d)", (uint8_t *)&v5, 0x12u);
  }

  return 0;
}

- (SMConversationDeletedNotification)initWithConversation:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    v17.receiver = self;
    v17.super_class = (Class)SMConversationDeletedNotification;
    __int16 v7 = [(RTNotification *)&v17 init];
    int v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_conversation, a3);
      uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v13 = (objc_class *)objc_opt_class();
        v14 = NSStringFromClass(v13);
        v15 = NSStringFromSelector(a2);
        conversation = v8->_conversation;
        *(_DWORD *)buf = 138412802;
        v19 = v14;
        __int16 v20 = 2112;
        v21 = v15;
        __int16 v22 = 2112;
        v23 = conversation;
        _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "#SafetyCache,%@,%@,conversation,%@", buf, 0x20u);
      }
    }
    self = v8;
    v10 = self;
  }
  else
  {
    v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: conversation", buf, 2u);
    }

    v10 = 0;
  }

  return v10;
}

- (SMConversation)conversation
{
  return self->_conversation;
}

- (void).cxx_destruct
{
}

@end