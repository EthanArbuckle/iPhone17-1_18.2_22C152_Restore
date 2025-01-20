@interface SMInitiatorSessionInitializationRequest
- (BOOL)isEqual:(id)a3;
- (NSDate)startDate;
- (NSUUID)sessionID;
- (SMConversation)conversation;
- (SMInitiatorSessionInitializationRequest)initWithSessionID:(id)a3 conversation:(id)a4 handler:(id)a5;
- (id)description;
- (id)handler;
- (unint64_t)hash;
@end

@implementation SMInitiatorSessionInitializationRequest

- (SMInitiatorSessionInitializationRequest)initWithSessionID:(id)a3 conversation:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (!v9)
  {
    v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v21 = "Invalid parameter not satisfying: sessionID";
LABEL_13:
    _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, v21, buf, 2u);
    goto LABEL_14;
  }
  if (!v10)
  {
    v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v21 = "Invalid parameter not satisfying: conversation";
    goto LABEL_13;
  }
  if (!v11)
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
  v23.super_class = (Class)SMInitiatorSessionInitializationRequest;
  v13 = [(SMInitiatorSessionInitializationRequest *)&v23 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_sessionID, a3);
    objc_storeStrong((id *)&v14->_conversation, a4);
    uint64_t v15 = MEMORY[0x1E016DB00](v12);
    id handler = v14->_handler;
    v14->_id handler = (id)v15;

    uint64_t v17 = [MEMORY[0x1E4F1C9C8] date];
    startDate = v14->_startDate;
    v14->_startDate = (NSDate *)v17;
  }
  self = v14;
  v19 = self;
LABEL_15:

  return v19;
}

- (id)description
{
  v3 = NSString;
  v4 = [(SMInitiatorSessionInitializationRequest *)self sessionID];
  v5 = [v4 UUIDString];
  v6 = [(SMInitiatorSessionInitializationRequest *)self conversation];
  v7 = [v6 receiverHandles];
  v8 = [(SMInitiatorSessionInitializationRequest *)self startDate];
  id v9 = [v8 stringFromDate];
  id v10 = [MEMORY[0x1E4F1C9C8] date];
  id v11 = [(SMInitiatorSessionInitializationRequest *)self startDate];
  [v10 timeIntervalSinceDate:v11];
  v13 = [v3 stringWithFormat:@"sessionID, %@, handles, %@, startDate, %@, elapsed interval, %.2f", v5, v7, v9, v12];

  return v13;
}

- (unint64_t)hash
{
  v3 = [(SMInitiatorSessionInitializationRequest *)self sessionID];
  uint64_t v4 = [v3 hash];
  v5 = [(SMInitiatorSessionInitializationRequest *)self conversation];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(SMInitiatorSessionInitializationRequest *)self startDate];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (SMInitiatorSessionInitializationRequest *)a3;
  if (self == v6)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = v6;
      unint64_t v8 = [(SMInitiatorSessionInitializationRequest *)self sessionID];
      id v9 = [(SMInitiatorSessionInitializationRequest *)v7 sessionID];
      if (v8 != v9)
      {
        v3 = [(SMInitiatorSessionInitializationRequest *)self sessionID];
        uint64_t v4 = [(SMInitiatorSessionInitializationRequest *)v7 sessionID];
        if (![v3 isEqual:v4])
        {
          char v10 = 0;
          goto LABEL_19;
        }
      }
      id v11 = [(SMInitiatorSessionInitializationRequest *)self conversation];
      uint64_t v12 = [(SMInitiatorSessionInitializationRequest *)v7 conversation];
      if (v11 == v12)
      {
        v25 = v11;
      }
      else
      {
        v13 = [(SMInitiatorSessionInitializationRequest *)self conversation];
        v26 = [(SMInitiatorSessionInitializationRequest *)v7 conversation];
        if (!objc_msgSend(v13, "isEqual:"))
        {
          char v10 = 0;
          goto LABEL_17;
        }
        v24 = v13;
        v25 = v11;
      }
      v14 = [(SMInitiatorSessionInitializationRequest *)self startDate];
      uint64_t v15 = [(SMInitiatorSessionInitializationRequest *)v7 startDate];
      if (v14 == (void *)v15)
      {

        char v10 = 1;
      }
      else
      {
        v16 = (void *)v15;
        [(SMInitiatorSessionInitializationRequest *)self startDate];
        uint64_t v17 = v23 = v3;
        [(SMInitiatorSessionInitializationRequest *)v7 startDate];
        v22 = v4;
        v18 = v9;
        v20 = v19 = v8;
        char v10 = [v17 isEqual:v20];

        unint64_t v8 = v19;
        id v9 = v18;
        uint64_t v4 = v22;

        v3 = v23;
      }
      v13 = v24;
      id v11 = v25;
      if (v25 == v12)
      {
LABEL_18:

        if (v8 == v9)
        {
LABEL_20:

          goto LABEL_21;
        }
LABEL_19:

        goto LABEL_20;
      }
LABEL_17:

      goto LABEL_18;
    }
    char v10 = 0;
  }
LABEL_21:

  return v10;
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (SMConversation)conversation
{
  return self->_conversation;
}

- (id)handler
{
  return self->_handler;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_conversation, 0);

  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end