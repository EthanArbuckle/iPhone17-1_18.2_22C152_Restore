@interface SMMadridMessageWaitingForAck
- (NSDate)messageSentDate;
- (NSString)identifier;
- (SMConversation)conversation;
- (SMMadridMessageWaitingForAck)initWithIdentifier:(id)a3 messageType:(unint64_t)a4 messageSentDate:(id)a5 pendingRetryCount:(int64_t)a6 conversation:(id)a7 callback:(id)a8;
- (id)callback;
- (int64_t)pendingRetryCount;
- (unint64_t)messageType;
- (void)setCallback:(id)a3;
- (void)setConversation:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMessageSentDate:(id)a3;
- (void)setMessageType:(unint64_t)a3;
- (void)setPendingRetryCount:(int64_t)a3;
@end

@implementation SMMadridMessageWaitingForAck

- (SMMadridMessageWaitingForAck)initWithIdentifier:(id)a3 messageType:(unint64_t)a4 messageSentDate:(id)a5 pendingRetryCount:(int64_t)a6 conversation:(id)a7 callback:(id)a8
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  if (!v15)
  {
    v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v25 = "Invalid parameter not satisfying: identifier";
LABEL_13:
    _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, v25, buf, 2u);
    goto LABEL_14;
  }
  if (!v16)
  {
    v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v25 = "Invalid parameter not satisfying: messageSentDate";
    goto LABEL_13;
  }
  if (a6 < 0)
  {
    v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v25 = "Invalid parameter not satisfying: pendingRetryCount >= 0";
      goto LABEL_13;
    }
LABEL_14:

    v23 = 0;
    goto LABEL_15;
  }
  v27.receiver = self;
  v27.super_class = (Class)SMMadridMessageWaitingForAck;
  v19 = [(SMMadridMessageWaitingForAck *)&v27 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_identifier, a3);
    v20->_messageType = a4;
    uint64_t v21 = [v18 copy];
    id callback = v20->_callback;
    v20->_id callback = (id)v21;

    objc_storeStrong((id *)&v20->_messageSentDate, a5);
    v20->_pendingRetryCount = a6;
    objc_storeStrong((id *)&v20->_conversation, a7);
  }
  self = v20;
  v23 = self;
LABEL_15:

  return v23;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unint64_t)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(unint64_t)a3
{
  self->_messageType = a3;
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

- (NSDate)messageSentDate
{
  return self->_messageSentDate;
}

- (void)setMessageSentDate:(id)a3
{
}

- (int64_t)pendingRetryCount
{
  return self->_pendingRetryCount;
}

- (void)setPendingRetryCount:(int64_t)a3
{
  self->_pendingRetryCount = a3;
}

- (SMConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_storeStrong((id *)&self->_messageSentDate, 0);
  objc_storeStrong(&self->_callback, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end