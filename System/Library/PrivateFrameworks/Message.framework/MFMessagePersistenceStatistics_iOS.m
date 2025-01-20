@interface MFMessagePersistenceStatistics_iOS
- (BOOL)protectedDataAvailable;
- (unint64_t)mailboxesNeedingReconcilication;
- (unint64_t)messagesMarkedAsJournaled;
- (unint64_t)protectedMessageData;
- (void)setMailboxesNeedingReconcilication:(unint64_t)a3;
- (void)setMessagesMarkedAsJournaled:(unint64_t)a3;
- (void)setProtectedDataAvailable:(BOOL)a3;
- (void)setProtectedMessageData:(unint64_t)a3;
@end

@implementation MFMessagePersistenceStatistics_iOS

- (BOOL)protectedDataAvailable
{
  return self->_protectedDataAvailable;
}

- (void)setProtectedDataAvailable:(BOOL)a3
{
  self->_protectedDataAvailable = a3;
}

- (unint64_t)protectedMessageData
{
  return self->_protectedMessageData;
}

- (void)setProtectedMessageData:(unint64_t)a3
{
  self->_protectedMessageData = a3;
}

- (unint64_t)messagesMarkedAsJournaled
{
  return self->_messagesMarkedAsJournaled;
}

- (void)setMessagesMarkedAsJournaled:(unint64_t)a3
{
  self->_messagesMarkedAsJournaled = a3;
}

- (unint64_t)mailboxesNeedingReconcilication
{
  return self->_mailboxesNeedingReconcilication;
}

- (void)setMailboxesNeedingReconcilication:(unint64_t)a3
{
  self->_mailboxesNeedingReconcilication = a3;
}

@end