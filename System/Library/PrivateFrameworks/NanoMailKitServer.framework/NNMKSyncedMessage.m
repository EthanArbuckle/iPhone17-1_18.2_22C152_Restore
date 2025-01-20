@interface NNMKSyncedMessage
- (BOOL)contentRequestedByUser;
- (BOOL)contentSynced;
- (BOOL)contentSyncedBecauseUserRequested;
- (BOOL)contentSyncedUsingNotificationPriority;
- (BOOL)isContentCompletelySynced;
- (BOOL)isThreadSpecific;
- (BOOL)resendRequested;
- (BOOL)usedNotificationPriorityForMessageSync;
- (BOOL)usedProtectedChannelForMessageSync;
- (NNMKSyncedMessage)init;
- (NNMKSyncedMessage)initWithMessage:(id)a3;
- (NNMKSyncedMessage)initWithMessage:(id)a3 useDefaultMailbox:(BOOL)a4;
- (NSDate)dateReceived;
- (NSMutableSet)attachmentsContentIdsNotYetSynced;
- (NSString)conversationId;
- (NSString)mailboxId;
- (NSString)messageId;
- (NSString)sanitizedMessageId;
- (unint64_t)contentResendInterval;
- (unint64_t)isSpecialMailboxSpecific;
- (unint64_t)resendInterval;
- (unint64_t)status;
- (unint64_t)statusVersion;
- (void)setAttachmentsContentIdsNotYetSynced:(id)a3;
- (void)setContentRequestedByUser:(BOOL)a3;
- (void)setContentResendInterval:(unint64_t)a3;
- (void)setContentSynced:(BOOL)a3;
- (void)setContentSyncedBecauseUserRequested:(BOOL)a3;
- (void)setContentSyncedUsingNotificationPriority:(BOOL)a3;
- (void)setConversationId:(id)a3;
- (void)setDateReceived:(id)a3;
- (void)setIsSpecialMailboxSpecific:(unint64_t)a3;
- (void)setIsThreadSpecific:(BOOL)a3;
- (void)setMailboxId:(id)a3;
- (void)setMessageId:(id)a3;
- (void)setResendInterval:(unint64_t)a3;
- (void)setResendRequested:(BOOL)a3;
- (void)setSanitizedMessageId:(id)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setStatusVersion:(unint64_t)a3;
- (void)setUsedNotificationPriorityForMessageSync:(BOOL)a3;
- (void)setUsedProtectedChannelForMessageSync:(BOOL)a3;
@end

@implementation NNMKSyncedMessage

- (NNMKSyncedMessage)initWithMessage:(id)a3
{
  return [(NNMKSyncedMessage *)self initWithMessage:a3 useDefaultMailbox:0];
}

- (NNMKSyncedMessage)initWithMessage:(id)a3 useDefaultMailbox:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(NNMKSyncedMessage *)self init];
  if (v7)
  {
    uint64_t v8 = [v6 messageId];
    messageId = v7->_messageId;
    v7->_messageId = (NSString *)v8;

    v10 = [v6 messageId];
    uint64_t v11 = objc_msgSend(v10, "nnmk_sanitizedFileNameString");
    sanitizedMessageId = v7->_sanitizedMessageId;
    v7->_sanitizedMessageId = (NSString *)v11;

    v7->_status = [v6 status];
    uint64_t v13 = [v6 dateReceived];
    dateReceived = v7->_dateReceived;
    v7->_dateReceived = (NSDate *)v13;

    uint64_t v15 = [v6 conversationId];
    conversationId = v7->_conversationId;
    v7->_conversationId = (NSString *)v15;

    if (v4)
    {
      v17 = @"-1";
    }
    else
    {
      v17 = [v6 mailboxId];
    }
    mailboxId = v7->_mailboxId;
    v7->_mailboxId = &v17->isa;

    v7->_isThreadSpecific = [v6 isThreadSpecific];
    v7->_isSpecialMailboxSpecific = [v6 isSpecialMailboxSpecific];
  }

  return v7;
}

- (NNMKSyncedMessage)init
{
  v9.receiver = self;
  v9.super_class = (Class)NNMKSyncedMessage;
  v2 = [(NNMKSyncedMessage *)&v9 init];
  v3 = v2;
  if (v2)
  {
    messageId = v2->_messageId;
    v2->_messageId = 0;

    v3->_status = 0;
    v3->_statusVersion = 0;
    dateReceived = v3->_dateReceived;
    v3->_dateReceived = 0;

    *(_WORD *)&v3->_contentSynced = 0;
    *(_DWORD *)&v3->_usedProtectedChannelForMessageSync = 0;
    attachmentsContentIdsNotYetSynced = v3->_attachmentsContentIdsNotYetSynced;
    v3->_attachmentsContentIdsNotYetSynced = 0;

    conversationId = v3->_conversationId;
    v3->_conversationId = 0;

    v3->_resendRequested = 0;
    v3->_resendInterval = 0;
    v3->_contentResendInterval = 0;
  }
  return v3;
}

- (BOOL)isContentCompletelySynced
{
  if (![(NNMKSyncedMessage *)self contentSynced]) {
    return 0;
  }
  v3 = [(NNMKSyncedMessage *)self attachmentsContentIdsNotYetSynced];
  BOOL v4 = [v3 count] == 0;

  return v4;
}

- (NSString)messageId
{
  return self->_messageId;
}

- (void)setMessageId:(id)a3
{
}

- (NSString)sanitizedMessageId
{
  return self->_sanitizedMessageId;
}

- (void)setSanitizedMessageId:(id)a3
{
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (unint64_t)statusVersion
{
  return self->_statusVersion;
}

- (void)setStatusVersion:(unint64_t)a3
{
  self->_statusVersion = a3;
}

- (NSDate)dateReceived
{
  return self->_dateReceived;
}

- (void)setDateReceived:(id)a3
{
}

- (BOOL)usedProtectedChannelForMessageSync
{
  return self->_usedProtectedChannelForMessageSync;
}

- (void)setUsedProtectedChannelForMessageSync:(BOOL)a3
{
  self->_usedProtectedChannelForMessageSync = a3;
}

- (BOOL)usedNotificationPriorityForMessageSync
{
  return self->_usedNotificationPriorityForMessageSync;
}

- (void)setUsedNotificationPriorityForMessageSync:(BOOL)a3
{
  self->_usedNotificationPriorityForMessageSync = a3;
}

- (BOOL)contentSyncedUsingNotificationPriority
{
  return self->_contentSyncedUsingNotificationPriority;
}

- (void)setContentSyncedUsingNotificationPriority:(BOOL)a3
{
  self->_contentSyncedUsingNotificationPriority = a3;
}

- (BOOL)contentSyncedBecauseUserRequested
{
  return self->_contentSyncedBecauseUserRequested;
}

- (void)setContentSyncedBecauseUserRequested:(BOOL)a3
{
  self->_contentSyncedBecauseUserRequested = a3;
}

- (BOOL)contentSynced
{
  return self->_contentSynced;
}

- (void)setContentSynced:(BOOL)a3
{
  self->_contentSynced = a3;
}

- (BOOL)contentRequestedByUser
{
  return self->_contentRequestedByUser;
}

- (void)setContentRequestedByUser:(BOOL)a3
{
  self->_contentRequestedByUser = a3;
}

- (NSMutableSet)attachmentsContentIdsNotYetSynced
{
  return self->_attachmentsContentIdsNotYetSynced;
}

- (void)setAttachmentsContentIdsNotYetSynced:(id)a3
{
}

- (NSString)conversationId
{
  return self->_conversationId;
}

- (void)setConversationId:(id)a3
{
}

- (BOOL)resendRequested
{
  return self->_resendRequested;
}

- (void)setResendRequested:(BOOL)a3
{
  self->_resendRequested = a3;
}

- (unint64_t)resendInterval
{
  return self->_resendInterval;
}

- (void)setResendInterval:(unint64_t)a3
{
  self->_resendInterval = a3;
}

- (unint64_t)contentResendInterval
{
  return self->_contentResendInterval;
}

- (void)setContentResendInterval:(unint64_t)a3
{
  self->_contentResendInterval = a3;
}

- (NSString)mailboxId
{
  return self->_mailboxId;
}

- (void)setMailboxId:(id)a3
{
}

- (BOOL)isThreadSpecific
{
  return self->_isThreadSpecific;
}

- (void)setIsThreadSpecific:(BOOL)a3
{
  self->_isThreadSpecific = a3;
}

- (unint64_t)isSpecialMailboxSpecific
{
  return self->_isSpecialMailboxSpecific;
}

- (void)setIsSpecialMailboxSpecific:(unint64_t)a3
{
  self->_isSpecialMailboxSpecific = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxId, 0);
  objc_storeStrong((id *)&self->_conversationId, 0);
  objc_storeStrong((id *)&self->_attachmentsContentIdsNotYetSynced, 0);
  objc_storeStrong((id *)&self->_dateReceived, 0);
  objc_storeStrong((id *)&self->_sanitizedMessageId, 0);
  objc_storeStrong((id *)&self->_messageId, 0);
}

@end