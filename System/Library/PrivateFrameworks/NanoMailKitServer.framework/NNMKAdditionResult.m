@interface NNMKAdditionResult
- (BOOL)receivedOldMessages;
- (NNMKProtoMessageAdditions)protoMessagesWithDefaultPriority;
- (NNMKProtoMessageAdditions)protoMessagesWithNotificationPriority;
- (NSMutableArray)messageIdsWithDefaultPriority;
- (NSMutableArray)messageIdsWithNotificationPriority;
- (unint64_t)resendInterval;
- (void)setMessageIdsWithDefaultPriority:(id)a3;
- (void)setMessageIdsWithNotificationPriority:(id)a3;
- (void)setProtoMessagesWithDefaultPriority:(id)a3;
- (void)setProtoMessagesWithNotificationPriority:(id)a3;
- (void)setReceivedOldMessages:(BOOL)a3;
- (void)setResendInterval:(unint64_t)a3;
@end

@implementation NNMKAdditionResult

- (NNMKProtoMessageAdditions)protoMessagesWithNotificationPriority
{
  return self->_protoMessagesWithNotificationPriority;
}

- (void)setProtoMessagesWithNotificationPriority:(id)a3
{
}

- (NNMKProtoMessageAdditions)protoMessagesWithDefaultPriority
{
  return self->_protoMessagesWithDefaultPriority;
}

- (void)setProtoMessagesWithDefaultPriority:(id)a3
{
}

- (NSMutableArray)messageIdsWithNotificationPriority
{
  return self->_messageIdsWithNotificationPriority;
}

- (void)setMessageIdsWithNotificationPriority:(id)a3
{
}

- (NSMutableArray)messageIdsWithDefaultPriority
{
  return self->_messageIdsWithDefaultPriority;
}

- (void)setMessageIdsWithDefaultPriority:(id)a3
{
}

- (BOOL)receivedOldMessages
{
  return self->_receivedOldMessages;
}

- (void)setReceivedOldMessages:(BOOL)a3
{
  self->_receivedOldMessages = a3;
}

- (unint64_t)resendInterval
{
  return self->_resendInterval;
}

- (void)setResendInterval:(unint64_t)a3
{
  self->_resendInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageIdsWithDefaultPriority, 0);
  objc_storeStrong((id *)&self->_messageIdsWithNotificationPriority, 0);
  objc_storeStrong((id *)&self->_protoMessagesWithDefaultPriority, 0);
  objc_storeStrong((id *)&self->_protoMessagesWithNotificationPriority, 0);
}

@end