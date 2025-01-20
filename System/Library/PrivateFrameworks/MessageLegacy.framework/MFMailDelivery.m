@interface MFMailDelivery
+ (BOOL)deliverMessage:(id)a3;
+ (id)newWithHeaders:(id)a3 HTML:(id)a4 plainTextAlternative:(id)a5 other:(id)a6 charsets:(id)a7;
+ (id)newWithHeaders:(id)a3 mixedContent:(id)a4 textPartsAreHTML:(BOOL)a5;
+ (id)newWithMessage:(id)a3;
- (BOOL)isUserRequested;
- (BOOL)shouldEncryptMessage;
- (BOOL)shouldSignMessage;
- (MFMailDelivery)init;
- (MFMailDelivery)initWithHeaders:(id)a3 HTML:(id)a4 plainTextAlternative:(id)a5 other:(id)a6 charsets:(id)a7;
- (MFMailDelivery)initWithHeaders:(id)a3 mixedContent:(id)a4 textPartsAreHTML:(BOOL)a5;
- (MFMailDelivery)initWithMessage:(id)a3;
- (NSDictionary)compositionSpecification;
- (id)account;
- (id)archiveAccount;
- (id)delegate;
- (id)deliverMessageData:(id)a3 toRecipients:(id)a4;
- (id)deliverSynchronously;
- (id)deliveryResult;
- (id)headersForDelivery;
- (id)message;
- (id)newMessageWriter;
- (id)originalHeaders;
- (int64_t)deliveryStatus;
- (unint64_t)conversationFlags;
- (void)archive;
- (void)dealloc;
- (void)deliverAsynchronously;
- (void)setAccount:(id)a3;
- (void)setArchiveAccount:(id)a3;
- (void)setCellDataOnly:(BOOL)a3;
- (void)setCompositionSpecification:(id)a3;
- (void)setConversationFlags:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setIsUserRequested:(BOOL)a3;
@end

@implementation MFMailDelivery

+ (id)newWithMessage:(id)a3
{
  id v4 = (id)objc_msgSend(+[MailAccount accountThatMessageIsFrom:](MailAccount, "accountThatMessageIsFrom:"), "deliveryAccount");
  if (!v4) {
    id v4 = +[MailAccount defaultDeliveryAccount];
  }
  return (id)[v4 newDeliveryWithMessage:a3];
}

+ (id)newWithHeaders:(id)a3 mixedContent:(id)a4 textPartsAreHTML:(BOOL)a5
{
  BOOL v5 = a5;
  v8 = objc_msgSend(+[MailAccount accountContainingEmailAddress:](MailAccount, "accountContainingEmailAddress:", objc_msgSend(a3, "firstSenderAddress")), "deliveryAccount");
  return (id)[v8 newDeliveryWithHeaders:a3 mixedContent:a4 textPartsAreHTML:v5];
}

+ (id)newWithHeaders:(id)a3 HTML:(id)a4 plainTextAlternative:(id)a5 other:(id)a6 charsets:(id)a7
{
  v12 = objc_msgSend(+[MailAccount accountContainingEmailAddress:](MailAccount, "accountContainingEmailAddress:", objc_msgSend(a3, "firstSenderAddress")), "deliveryAccount");
  return (id)[v12 newDeliveryWithHeaders:a3 HTML:a4 plainTextAlternative:a5 other:a6 charsets:a7];
}

+ (BOOL)deliverMessage:(id)a3
{
  v3 = (void *)[a1 newWithMessage:a3];
  if (v3)
  {
    id v4 = v3;
    BOOL v5 = (void *)[v3 deliverSynchronously];

    LOBYTE(v3) = [v5 status] == 0;
  }
  return (char)v3;
}

- (MFMailDelivery)init
{
  v3.receiver = self;
  v3.super_class = (Class)MFMailDelivery;
  result = [(MFMailDelivery *)&v3 init];
  if (result) {
    result->_delegate = 0;
  }
  return result;
}

- (MFMailDelivery)initWithMessage:(id)a3
{
  id v4 = [(MFMailDelivery *)self init];
  if (v4) {
    v4->_message = (MFMessage *)a3;
  }
  return v4;
}

- (MFMailDelivery)initWithHeaders:(id)a3 mixedContent:(id)a4 textPartsAreHTML:(BOOL)a5
{
  v8 = [(MFMailDelivery *)self init];
  if (v8)
  {
    v9 = (MFMutableMessageHeaders *)[a3 mutableCopy];
    v8->_headers = v9;
    [(MFMutableMessageHeaders *)v9 stripInternalHeaders];
    v8->_mixedContent = (NSArray *)a4;
    v8->_textPartsAreHTML = a5;
  }
  return v8;
}

- (MFMailDelivery)initWithHeaders:(id)a3 HTML:(id)a4 plainTextAlternative:(id)a5 other:(id)a6 charsets:(id)a7
{
  v12 = [(MFMailDelivery *)self init];
  if (v12)
  {
    v13 = (MFMutableMessageHeaders *)[a3 mutableCopy];
    v12->_headers = v13;
    [(MFMutableMessageHeaders *)v13 stripInternalHeaders];
    v12->_htmlString = (NSString *)a4;
    v12->_plainTextAlternative = (MFPlainTextDocument *)a5;
    v12->_otherStringsAndAttachments = (NSArray *)a6;
    v12->_charsets = (NSArray *)a7;
    v12->_textPartsAreHTML = 1;
  }
  return v12;
}

- (void)dealloc
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(MFMessage *)self->_message setMessageBody:0];
  }

  v3.receiver = self;
  v3.super_class = (Class)MFMailDelivery;
  [(MFMailDelivery *)&v3 dealloc];
}

- (id)newMessageWriter
{
  objc_super v3 = [MFMessageWriter alloc];
  id v4 = [(MFMailDelivery *)self compositionSpecification];
  return [(MFMessageWriter *)v3 initWithCompositionSpecification:v4];
}

- (id)message
{
  id result = self->_message;
  if (!result)
  {
    if (self->_htmlString)
    {
      id v4 = [(MFMailDelivery *)self newMessageWriter];
    }
    else
    {
      otherStringsAndAttachments = self->_otherStringsAndAttachments;
      id v6 = [(MFMailDelivery *)self newMessageWriter];
      id v4 = v6;
      if (!otherStringsAndAttachments)
      {
        v7 = (MFMessage *)[v6 createMessageWithPlainTextDocumentsAndAttachments:self->_mixedContent headers:self->_headers];
        goto LABEL_6;
      }
    }
    v7 = (MFMessage *)[v4 createMessageWithHtmlString:self->_htmlString plainTextAlternative:self->_plainTextAlternative otherHtmlStringsAndAttachments:self->_otherStringsAndAttachments charsets:self->_charsets headers:self->_headers];
LABEL_6:
    v8 = v7;
    self->_message = v7;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9C8], "date"), "timeIntervalSince1970");
    -[MFMessage setDateSentTimeIntervalSince1970:](v8, "setDateSentTimeIntervalSince1970:");

    return self->_message;
  }
  return result;
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (id)archiveAccount
{
  return self->_archiveAccount;
}

- (void)setArchiveAccount:(id)a3
{
  archiveAccount = self->_archiveAccount;
  if (archiveAccount != a3)
  {

    self->_archiveAccount = (MailAccount *)a3;
  }
}

- (id)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  account = self->_account;
  if (account != a3)
  {

    self->_account = (DeliveryAccount *)a3;
    *((unsigned char *)self + 112) &= ~2u;
  }
}

- (int64_t)deliveryStatus
{
  return [(MFDeliveryResult *)self->_result status];
}

- (id)deliveryResult
{
  return self->_result;
}

- (id)originalHeaders
{
  if (self->_headers) {
    return self->_headers;
  }
  else {
    return (id)[(MFMessage *)self->_message headers];
  }
}

- (id)headersForDelivery
{
  id v3 = (id)[(MFMessage *)self->_message headers];
  if (!v3) {
    id v3 = [(MFMailDelivery *)self originalHeaders];
  }
  id v4 = (id)[v3 mutableCopy];
  [v4 removeHeaderForKey:*MEMORY[0x1E4F73410]];
  [v4 stripInternalHeaders];
  uint64_t v5 = *MEMORY[0x1E4F60760];
  if (![v4 firstHeaderForKey:*MEMORY[0x1E4F60760]])
  {
    id v6 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"%@ ("), EFProductName(), "mutableCopyWithZone:", -[MFMailDelivery zone](self, "zone"));
    [v6 appendString:MEMORY[0x1D25DCC90]()];
    [v6 appendString:@""]);
    [v4 setHeader:v6 forKey:v5];
  }
  return v4;
}

- (BOOL)shouldSignMessage
{
  id v2 = [(NSDictionary *)self->_compositionSpecification objectForKey:@"ShouldSign"];
  return [v2 BOOLValue];
}

- (BOOL)shouldEncryptMessage
{
  id v2 = [(NSDictionary *)self->_compositionSpecification objectForKey:@"ShouldEncrypt"];
  return [v2 BOOLValue];
}

- (void)deliverAsynchronously
{
  id v3 = +[MFInvocationQueue sharedInvocationQueue];
  id v4 = NSString;
  uint64_t v5 = MFLookupLocalizedString(@"SEND_MESSAGE_FORMAT", @"Sending message: %@", 0);
  if (objc_msgSend((id)-[MFMessage subject](self->_message, "subject"), "length")) {
    uint64_t v6 = [(MFMessage *)self->_message subject];
  }
  else {
    uint64_t v6 = MFLookupLocalizedString(@"NO_SUBJECT", @"No subject", 0);
  }
  v7 = +[MFMonitoredInvocation invocationWithSelector:target:taskName:priority:canBeCancelled:](MFMonitoredInvocation, "invocationWithSelector:target:taskName:priority:canBeCancelled:", sel_deliverSynchronously, self, objc_msgSend(v4, "stringWithFormat:", v5, v6), 6, 1);
  [v3 addInvocation:v7];
}

- (id)deliverSynchronously
{
  id v3 = +[MFActivityMonitor currentMonitor];
  id v4 = [(MFMailDelivery *)self message];
  id v5 = [(MFMailDelivery *)self headersForDelivery];
  if (!v4 && [v3 error]) {
    goto LABEL_11;
  }
  uint64_t v6 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v7 = [MEMORY[0x1E4F73540] data];
  uint64_t v8 = objc_msgSend((id)objc_msgSend(v4, "messageBody"), "rawData");
  [v5 appendHeaderData:v7 andRecipients:v6];
  v9 = (void *)[MEMORY[0x1E4F734C8] dataHolderWithData:v7];
  v10 = v9;
  if (v8) {
    [v9 addData:v8];
  }
  if (!v6 || ![v6 count])
  {
    v16 = NSString;
    uint64_t v17 = MFLookupLocalizedString(@"INTERNAL_DELIVERY_ERROR_FORMAT", @"This message couldn’t be delivered because the following internal error occurred: %@", @"Delayed");
    uint64_t v14 = [v16 stringWithFormat:v17, MFLookupLocalizedString(@"NO_RECIPIENTS", @"This message couldn’t be delivered because you haven’t specified any recipients.", @"Delayed"];
    uint64_t v15 = 1048;
    goto LABEL_9;
  }
  v11 = [(MFMailDelivery *)self deliverMessageData:v10 toRecipients:v6];
  self->_id result = v11;
  v12 = v11;
  int64_t v13 = [(MFDeliveryResult *)self->_result status];
  if (v13 == 3)
  {
    uint64_t v14 = [NSString stringWithFormat:MFLookupLocalizedString(@"INTERNAL_DELIVERY_ERROR_FORMAT", @"This message couldn’t be delivered because the following internal error occurred: %@", @"Delayed", &stru_1F265CF90];
    uint64_t v15 = 1030;
LABEL_9:
    objc_msgSend(v3, "setError:", +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", @"MFMessageErrorDomain", v15, v14));
LABEL_11:
    int64_t v13 = 1;
  }
  [(MFDeliveryResult *)self->_result setStatus:v13];
  return self->_result;
}

- (id)deliverMessageData:(id)a3 toRecipients:(id)a4
{
  id v4 = [[MFDeliveryResult alloc] initWithStatus:1];
  return v4;
}

- (void)setCellDataOnly:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 112) = *((unsigned char *)self + 112) & 0xFD | v3;
}

- (void)archive
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138543362;
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a1, "error"), "ef_publicDescription");
  _os_log_error_impl(&dword_1CFCFE000, a2, OS_LOG_TYPE_ERROR, "Error %{public}@ occurred while trying to append messages to outgoing store. Ignoring and proceeding with delivery...", (uint8_t *)&v3, 0xCu);
}

- (NSDictionary)compositionSpecification
{
  return self->_compositionSpecification;
}

- (void)setCompositionSpecification:(id)a3
{
}

- (unint64_t)conversationFlags
{
  return self->_conversationFlags;
}

- (void)setConversationFlags:(unint64_t)a3
{
  self->_conversationFlags = a3;
}

- (BOOL)isUserRequested
{
  return self->_isUserRequested;
}

- (void)setIsUserRequested:(BOOL)a3
{
  self->_isUserRequested = a3;
}

@end