@interface NNMKUpdatesResult
- (NNMKProtoMessageStatusUpdates)protoMessageUpdatesWithDefaultPriority;
- (NNMKProtoMessageStatusUpdates)protoMessageUpdatesWithDefaultPriorityAndProtectedChannel;
- (NNMKProtoMessageStatusUpdates)protoMessageUpdatesWithNotificationPriority;
- (NSArray)messageIdsToDelete;
- (NSArray)messageIdsWithDefaultPriority;
- (NSArray)messageIdsWithDefaultPriorityAndProtectedChannel;
- (NSArray)messageIdsWithNotificationPriority;
- (NSArray)messagesToAdd;
- (void)setMessageIdsToDelete:(id)a3;
- (void)setMessageIdsWithDefaultPriority:(id)a3;
- (void)setMessageIdsWithDefaultPriorityAndProtectedChannel:(id)a3;
- (void)setMessageIdsWithNotificationPriority:(id)a3;
- (void)setMessagesToAdd:(id)a3;
- (void)setProtoMessageUpdatesWithDefaultPriority:(id)a3;
- (void)setProtoMessageUpdatesWithDefaultPriorityAndProtectedChannel:(id)a3;
- (void)setProtoMessageUpdatesWithNotificationPriority:(id)a3;
@end

@implementation NNMKUpdatesResult

- (NNMKProtoMessageStatusUpdates)protoMessageUpdatesWithNotificationPriority
{
  return self->_protoMessageUpdatesWithNotificationPriority;
}

- (void)setProtoMessageUpdatesWithNotificationPriority:(id)a3
{
}

- (NNMKProtoMessageStatusUpdates)protoMessageUpdatesWithDefaultPriority
{
  return self->_protoMessageUpdatesWithDefaultPriority;
}

- (void)setProtoMessageUpdatesWithDefaultPriority:(id)a3
{
}

- (NNMKProtoMessageStatusUpdates)protoMessageUpdatesWithDefaultPriorityAndProtectedChannel
{
  return self->_protoMessageUpdatesWithDefaultPriorityAndProtectedChannel;
}

- (void)setProtoMessageUpdatesWithDefaultPriorityAndProtectedChannel:(id)a3
{
}

- (NSArray)messageIdsWithNotificationPriority
{
  return self->_messageIdsWithNotificationPriority;
}

- (void)setMessageIdsWithNotificationPriority:(id)a3
{
}

- (NSArray)messageIdsWithDefaultPriority
{
  return self->_messageIdsWithDefaultPriority;
}

- (void)setMessageIdsWithDefaultPriority:(id)a3
{
}

- (NSArray)messageIdsWithDefaultPriorityAndProtectedChannel
{
  return self->_messageIdsWithDefaultPriorityAndProtectedChannel;
}

- (void)setMessageIdsWithDefaultPriorityAndProtectedChannel:(id)a3
{
}

- (NSArray)messagesToAdd
{
  return self->_messagesToAdd;
}

- (void)setMessagesToAdd:(id)a3
{
}

- (NSArray)messageIdsToDelete
{
  return self->_messageIdsToDelete;
}

- (void)setMessageIdsToDelete:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageIdsToDelete, 0);
  objc_storeStrong((id *)&self->_messagesToAdd, 0);
  objc_storeStrong((id *)&self->_messageIdsWithDefaultPriorityAndProtectedChannel, 0);
  objc_storeStrong((id *)&self->_messageIdsWithDefaultPriority, 0);
  objc_storeStrong((id *)&self->_messageIdsWithNotificationPriority, 0);
  objc_storeStrong((id *)&self->_protoMessageUpdatesWithDefaultPriorityAndProtectedChannel, 0);
  objc_storeStrong((id *)&self->_protoMessageUpdatesWithDefaultPriority, 0);
  objc_storeStrong((id *)&self->_protoMessageUpdatesWithNotificationPriority, 0);
}

@end