@interface NNMKRequestContext
- (BOOL)hasProtectedMessages;
- (NSArray)mailboxes;
- (NSDate)beforeDate;
- (NSString)conversationId;
- (unint64_t)count;
- (unint64_t)messagesForSpecialMailbox;
- (unint64_t)resendInterval;
- (void)setBeforeDate:(id)a3;
- (void)setConversationId:(id)a3;
- (void)setCount:(unint64_t)a3;
- (void)setHasProtectedMessages:(BOOL)a3;
- (void)setMailboxes:(id)a3;
- (void)setMessagesForSpecialMailbox:(unint64_t)a3;
- (void)setResendInterval:(unint64_t)a3;
@end

@implementation NNMKRequestContext

- (NSArray)mailboxes
{
  return self->_mailboxes;
}

- (void)setMailboxes:(id)a3
{
}

- (NSString)conversationId
{
  return self->_conversationId;
}

- (void)setConversationId:(id)a3
{
}

- (NSDate)beforeDate
{
  return self->_beforeDate;
}

- (void)setBeforeDate:(id)a3
{
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (BOOL)hasProtectedMessages
{
  return self->_hasProtectedMessages;
}

- (void)setHasProtectedMessages:(BOOL)a3
{
  self->_hasProtectedMessages = a3;
}

- (unint64_t)resendInterval
{
  return self->_resendInterval;
}

- (void)setResendInterval:(unint64_t)a3
{
  self->_resendInterval = a3;
}

- (unint64_t)messagesForSpecialMailbox
{
  return self->_messagesForSpecialMailbox;
}

- (void)setMessagesForSpecialMailbox:(unint64_t)a3
{
  self->_messagesForSpecialMailbox = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_beforeDate, 0);
  objc_storeStrong((id *)&self->_conversationId, 0);
  objc_storeStrong((id *)&self->_mailboxes, 0);
}

@end