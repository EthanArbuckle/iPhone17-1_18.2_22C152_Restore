@interface SiriAnalyticsTimeAnnotatedMessage
- (NSUUID)messageUUID;
- (NSUUID)streamUUID;
- (SISchemaTopLevelUnionType)message;
- (unint64_t)timestamp;
- (void)setMessage:(id)a3;
- (void)setMessageUUID:(id)a3;
- (void)setStreamUUID:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
@end

@implementation SiriAnalyticsTimeAnnotatedMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_messageUUID, 0);
  objc_storeStrong((id *)&self->_streamUUID, 0);
}

- (void)setMessage:(id)a3
{
}

- (SISchemaTopLevelUnionType)message
{
  return self->_message;
}

- (void)setMessageUUID:(id)a3
{
}

- (NSUUID)messageUUID
{
  return self->_messageUUID;
}

- (void)setStreamUUID:(id)a3
{
}

- (NSUUID)streamUUID
{
  return self->_streamUUID;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

@end