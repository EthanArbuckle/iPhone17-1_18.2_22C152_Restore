@interface MFDAMessage
- (BOOL)messageData:(id *)a3 messageSize:(unint64_t *)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6;
- (BOOL)messageDataHolder:(id *)a3 messageSize:(unint64_t *)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6;
- (DAMailMessage)DAMailMessage;
- (ECMessageHeaders)headers;
- (EDIndexableMailbox)mailbox;
- (EDMessageCategorizationResult)categorizationResult;
- (MFDAMessage)initWithDAMailMessage:(id)a3 mailbox:(id)a4;
- (NSString)remoteID;
- (id)externalConversationID;
- (id)messageBody;
- (id)remoteMailboxURL;
- (int64_t)authenticationState;
- (unint64_t)messageFlags;
- (unint64_t)messageSize;
- (void)setAuthenticationState:(int64_t)a3;
- (void)setCategorizationResult:(id)a3;
@end

@implementation MFDAMessage

- (MFDAMessage)initWithDAMailMessage:(id)a3 mailbox:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MFDAMessage;
  v9 = [(MFDAMessage *)&v18 init];
  if (v9)
  {
    v10 = [v7 rfc822Data];
    uint64_t v11 = +[MFMessage messageWithRFC822Data:v10];
    rfc822CreatedMessage = v9->_rfc822CreatedMessage;
    v9->_rfc822CreatedMessage = (MFMessage *)v11;

    objc_storeStrong((id *)&v9->_DAMailMessage, a3);
    objc_storeStrong((id *)&v9->_mailbox, a4);
    uint64_t v13 = MFCreateExternalConversationID(v9->_DAMailMessage);
    externalConversationID = v9->_externalConversationID;
    v9->_externalConversationID = (NSString *)v13;

    v15 = MFLogGeneral();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = [(MFDAMessage *)v9 subject];
      *(_DWORD *)buf = 138412290;
      v20 = v16;
      _os_log_impl(&dword_1A7EFF000, v15, OS_LOG_TYPE_INFO, "#Power [New Message] subject=%@;", buf, 0xCu);
    }
  }

  return v9;
}

- (NSString)remoteID
{
  return (NSString *)[self->_DAMailMessage remoteID];
}

- (id)externalConversationID
{
  return self->_externalConversationID;
}

- (EDIndexableMailbox)mailbox
{
  return (EDIndexableMailbox *)self->_mailbox;
}

- (ECMessageHeaders)headers
{
  return (ECMessageHeaders *)[(MFMessage *)self->_rfc822CreatedMessage headers];
}

- (unint64_t)messageFlags
{
  v14.receiver = self;
  v14.super_class = (Class)MFDAMessage;
  unint64_t v3 = [(MFMailMessage *)&v14 messageFlags];
  unint64_t v4 = v3 | [self->_DAMailMessage read];
  if ([self->_DAMailMessage flagged]) {
    v4 |= 0x10uLL;
  }
  int v5 = [self->_DAMailMessage lastVerb];
  uint64_t v6 = v4 | 4;
  if (v5 == 1) {
    uint64_t v7 = v4 | 4;
  }
  else {
    uint64_t v7 = v4;
  }
  if (v5 != 2) {
    uint64_t v6 = v7;
  }
  if (v5 == 3) {
    uint64_t v8 = v4 | 0x100;
  }
  else {
    uint64_t v8 = v6;
  }
  v9 = [self->_DAMailMessage attachments];
  char v10 = [v9 count];

  uint64_t v11 = [self->_DAMailMessage meetingRequestUUID];

  if (v11) {
    char v12 = v10 + 1;
  }
  else {
    char v12 = v10;
  }
  return v8 & 0xFFFFFFFFFFFF03FFLL | ((unint64_t)(v12 & 0x3F) << 10);
}

- (id)messageBody
{
  return (id)[(MFMessage *)self->_rfc822CreatedMessage messageBody];
}

- (BOOL)messageData:(id *)a3 messageSize:(unint64_t *)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6
{
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  return 0;
}

- (BOOL)messageDataHolder:(id *)a3 messageSize:(unint64_t *)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6
{
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  return 0;
}

- (id)remoteMailboxURL
{
  v2 = [(MFDAMessage *)self mailbox];
  unint64_t v3 = [v2 URLString];

  return v3;
}

- (unint64_t)messageSize
{
  int v3 = [self->_DAMailMessage bodySize];
  unint64_t v4 = [self->_DAMailMessage attachments];
  int v5 = [v4 valueForKeyPath:@"@sum.size"];
  int v6 = [v5 intValue] + v3;

  return v6;
}

- (EDMessageCategorizationResult)categorizationResult
{
  return self->_categorizationResult;
}

- (void)setCategorizationResult:(id)a3
{
}

- (int64_t)authenticationState
{
  return self->_authenticationState;
}

- (void)setAuthenticationState:(int64_t)a3
{
  self->_authenticationState = a3;
}

- (DAMailMessage)DAMailMessage
{
  return self->_DAMailMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_DAMailMessage, 0);
  objc_storeStrong((id *)&self->_categorizationResult, 0);
  objc_storeStrong((id *)&self->_externalConversationID, 0);
  objc_storeStrong((id *)&self->_mailbox, 0);
  objc_storeStrong((id *)&self->_rfc822CreatedMessage, 0);
}

@end