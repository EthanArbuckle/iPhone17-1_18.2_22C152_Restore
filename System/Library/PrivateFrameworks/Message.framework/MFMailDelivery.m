@interface MFMailDelivery
+ (BOOL)deliverMessage:(id)a3;
+ (id)log;
+ (id)newWithHeaders:(id)a3 HTML:(id)a4 plainTextAlternative:(id)a5 other:(id)a6;
+ (id)newWithHeaders:(id)a3 mixedContent:(id)a4 textPartsAreHTML:(BOOL)a5;
+ (id)newWithMessage:(id)a3;
- (BOOL)isUserRequested;
- (BOOL)shouldEncrypt;
- (BOOL)shouldSign;
- (EMMessageObjectID)originalMessageObjectID;
- (MFMailDelivery)init;
- (MFMailDelivery)initWithHeaders:(id)a3 HTML:(id)a4 plainTextAlternative:(id)a5 other:(id)a6;
- (MFMailDelivery)initWithHeaders:(id)a3 mixedContent:(id)a4 textPartsAreHTML:(BOOL)a5;
- (MFMailDelivery)initWithMessage:(id)a3;
- (MFMailMessage)originalMessage;
- (NSDictionary)compositionSpecification;
- (id)_htmlBodyForMessage:(id)a3;
- (id)account;
- (id)archiveAccount;
- (id)delegate;
- (id)deliverMessageData:(id)a3 toRecipients:(id)a4;
- (id)deliverSynchronously;
- (id)deliveryResult;
- (id)followUpWarning;
- (id)headersForDelivery;
- (id)message;
- (id)newMessageWriter;
- (id)originalHeaders;
- (int64_t)action;
- (int64_t)deliveryStatus;
- (unint64_t)conversationFlags;
- (void)_checkAndApplyFollowUpToDeliveredMessage:(id)a3;
- (void)archive;
- (void)dealloc;
- (void)deliverAsynchronously;
- (void)setAccount:(id)a3;
- (void)setAction:(int64_t)a3;
- (void)setArchiveAccount:(id)a3;
- (void)setCellDataOnly:(BOOL)a3;
- (void)setCompositionSpecification:(id)a3;
- (void)setConversationFlags:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setIsUserRequested:(BOOL)a3;
- (void)setOriginalMessage:(id)a3;
- (void)setOriginalMessageObjectID:(id)a3;
- (void)setShouldEncrypt:(BOOL)a3;
- (void)setShouldSign:(BOOL)a3;
- (void)updateOriginalMessageFromHeaders:(id)a3;
@end

@implementation MFMailDelivery

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __21__MFMailDelivery_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_6 != -1) {
    dispatch_once(&log_onceToken_6, block);
  }
  v2 = (void *)log_log_6;
  return v2;
}

void __21__MFMailDelivery_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_6;
  log_log_6 = (uint64_t)v1;
}

+ (id)newWithMessage:(id)a3
{
  id v3 = a3;
  v4 = +[MailAccount accountThatMessageIsFrom:v3];
  v5 = [v4 deliveryAccount];

  if (!v5)
  {
    v5 = +[MailAccount defaultDeliveryAccount];
  }
  v6 = (void *)[v5 newDeliveryWithMessage:v3];

  return v6;
}

+ (id)newWithHeaders:(id)a3 mixedContent:(id)a4 textPartsAreHTML:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  v9 = accountForHeaders(v7);
  v10 = (void *)[v9 newDeliveryWithHeaders:v7 mixedContent:v8 textPartsAreHTML:v5];

  return v10;
}

+ (id)newWithHeaders:(id)a3 HTML:(id)a4 plainTextAlternative:(id)a5 other:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = accountForHeaders(v9);
  v14 = (void *)[v13 newDeliveryWithHeaders:v9 HTML:v10 plainTextAlternative:v11 other:v12];

  return v14;
}

+ (BOOL)deliverMessage:(id)a3
{
  id v3 = (void *)[a1 newWithMessage:a3];
  v4 = v3;
  if (v3)
  {
    BOOL v5 = [v3 deliverSynchronously];
    BOOL v6 = [v5 status] == 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (MFMailDelivery)init
{
  v11.receiver = self;
  v11.super_class = (Class)MFMailDelivery;
  v2 = [(MFMailDelivery *)&v11 init];
  id v3 = v2;
  if (v2)
  {
    objc_storeWeak(&v2->_delegate, 0);
    v4 = (void *)MEMORY[0x1E4F60D70];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __22__MFMailDelivery_init__block_invoke;
    v9[3] = &unk_1E5D3C3D8;
    BOOL v5 = v3;
    id v10 = v5;
    uint64_t v6 = [v4 lazyFutureWithBlock:v9];
    followUpFuture = v5->_followUpFuture;
    v5->_followUpFuture = (EFFuture *)v6;
  }
  return v3;
}

MFFollowUpWarningResult *__22__MFMailDelivery_init__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v4 = [*(id *)(a1 + 32) message];
  BOOL v5 = [v4 subject];
  uint64_t v6 = [v5 subjectString];
  id v7 = (void *)v6;
  id v8 = &stru_1EFF11268;
  if (v6) {
    id v8 = (__CFString *)v6;
  }
  id v9 = v8;

  v21 = [*(id *)(a1 + 32) _htmlBodyForMessage:v4];
  id v10 = objc_msgSend(MEMORY[0x1E4F608B0], "snippetFromHTMLBody:options:maxLength:preservingQuotedForwardedContent:");
  objc_super v11 = objc_msgSend(MEMORY[0x1E4F60E00], "ec_partiallyRedactedStringForSubjectOrSummary:", v9);
  id v12 = objc_msgSend(MEMORY[0x1E4F60E00], "ec_partiallyRedactedStringForSubjectOrSummary:", v10);
  v13 = +[MFMailDelivery log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v24 = v11;
    __int16 v25 = 2114;
    v26 = v12;
    _os_log_impl(&dword_1A7EFF000, v13, OS_LOG_TYPE_DEFAULT, "_followUpFuture calling suggestionService with Subject: %{public}@ Body: %{public}@", buf, 0x16u);
  }

  v14 = [MEMORY[0x1E4F5DB70] serviceForMail];
  [v14 setSyncTimeout:1.0];
  v15 = [v4 dateSent];
  id v22 = 0;
  v16 = [v14 identifyFollowUpWarningFromSubject:v9 body:v10 date:v15 error:&v22];
  id v17 = v22;

  id v18 = v17;
  *a2 = v18;
  v19 = [[MFFollowUpWarningResult alloc] initWithFollowUpWarning:v16 error:v18];

  return v19;
}

- (MFMailDelivery)initWithMessage:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(MFMailDelivery *)self init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_message, a3);
  }

  return v7;
}

- (MFMailDelivery)initWithHeaders:(id)a3 mixedContent:(id)a4 textPartsAreHTML:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(MFMailDelivery *)self init];
  if (v10)
  {
    uint64_t v11 = [v8 mutableCopy];
    headers = v10->_headers;
    v10->_headers = (MFMutableMessageHeaders *)v11;

    [(MFMailDelivery *)v10 updateOriginalMessageFromHeaders:v10->_headers];
    [(MFMutableMessageHeaders *)v10->_headers stripInternalHeaders];
    objc_storeStrong((id *)&v10->_mixedContent, a4);
    v10->_textPartsAreHTML = a5;
  }

  return v10;
}

- (MFMailDelivery)initWithHeaders:(id)a3 HTML:(id)a4 plainTextAlternative:(id)a5 other:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(MFMailDelivery *)self init];
  if (v14)
  {
    uint64_t v15 = [v10 mutableCopy];
    headers = v14->_headers;
    v14->_headers = (MFMutableMessageHeaders *)v15;

    [(MFMailDelivery *)v14 updateOriginalMessageFromHeaders:v14->_headers];
    [(MFMutableMessageHeaders *)v14->_headers stripInternalHeaders];
    objc_storeStrong((id *)&v14->_htmlString, a4);
    objc_storeStrong((id *)&v14->_plainTextAlternative, a5);
    objc_storeStrong((id *)&v14->_otherStringsAndAttachments, a6);
    v14->_textPartsAreHTML = 1;
  }

  return v14;
}

- (void)dealloc
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(MFMailMessage *)self->_message setMessageBody:0];
  }
  v3.receiver = self;
  v3.super_class = (Class)MFMailDelivery;
  [(MFMailDelivery *)&v3 dealloc];
}

- (id)newMessageWriter
{
  objc_super v3 = [MFMessageWriter alloc];
  v4 = [(MFMailDelivery *)self compositionSpecification];
  id v5 = [(MFMessageWriter *)v3 initWithCompositionSpecification:v4];

  return v5;
}

- (id)message
{
  message = self->_message;
  if (!message)
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
        id v7 = (MFMailMessage *)[v6 createMessageWithPlainTextDocumentsAndAttachments:self->_mixedContent headers:self->_headers];
        goto LABEL_6;
      }
    }
    id v7 = (MFMailMessage *)[v4 createMessageWithHTMLStringAndMIMECharset:self->_htmlString plainTextAlternative:self->_plainTextAlternative otherHtmlStringsAndAttachments:self->_otherStringsAndAttachments headers:self->_headers];
LABEL_6:
    id v8 = self->_message;
    self->_message = v7;

    id v9 = [MEMORY[0x1E4F1C9C8] date];
    [v9 timeIntervalSince1970];
    -[MFMailMessage setDateSentAsTimeIntervalSince1970:](self->_message, "setDateSentAsTimeIntervalSince1970:");

    message = self->_message;
  }
  return message;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)archiveAccount
{
  return self->_archiveAccount;
}

- (void)setArchiveAccount:(id)a3
{
}

- (id)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  id v5 = (DeliveryAccount *)a3;
  if (self->_account != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_account, a3);
    id v5 = v6;
    *((unsigned char *)self + 104) &= ~2u;
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
  objc_super v3 = self->_headers;
  if (!v3)
  {
    objc_super v3 = [(MFMailMessage *)self->_message headers];
  }
  return v3;
}

- (id)headersForDelivery
{
  objc_super v3 = [(MFMailMessage *)self->_message headers];
  if (!v3)
  {
    objc_super v3 = [(MFMailDelivery *)self originalHeaders];
  }
  id v4 = (void *)[v3 mutableCopy];
  [v4 removeHeaderForKey:*MEMORY[0x1E4F73410]];
  [v4 stripInternalHeaders];
  uint64_t v5 = *MEMORY[0x1E4F60760];
  id v6 = [v4 firstHeaderForKey:*MEMORY[0x1E4F60760]];

  if (!v6)
  {
    id v7 = NSString;
    id v8 = EFProductName();
    id v9 = objc_msgSend(v7, "stringWithFormat:", @"%@ ("), v8;
    id v10 = (void *)[v9 mutableCopy];

    id v11 = EFSystemBuildVersion();
    [v10 appendString:v11];

    [v10 appendString:@""]);
    [v4 setHeader:v10 forKey:v5];
  }
  return v4;
}

- (void)deliverAsynchronously
{
  objc_super v3 = NSString;
  id v4 = MFLookupLocalizedString(@"SEND_MESSAGE_FORMAT", @"Sending message: %@", @"Message");
  uint64_t v5 = [(MFMailMessage *)self->_message subject];
  uint64_t v6 = [v5 length];
  if (v6)
  {
    id v7 = [(MFMailMessage *)self->_message subject];
    id v8 = [v7 subjectString];
  }
  else
  {
    id v8 = MFLookupLocalizedString(@"NO_SUBJECT", @"No subject", @"Message");
    id v7 = v8;
  }
  objc_msgSend(v3, "stringWithFormat:", v4, v8);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v6) {

  }
  id v9 = +[MFInvocationQueue sharedInvocationQueue];
  id v10 = +[MFMonitoredInvocation invocationWithSelector:sel_deliverSynchronously target:self taskName:v11 priority:6 canBeCancelled:1];
  [v9 addInvocation:v10];
}

- (id)deliverSynchronously
{
  objc_super v3 = +[MFActivityMonitor currentMonitor];
  id v4 = [(MFMailDelivery *)self message];
  uint64_t v5 = [(MFMailDelivery *)self headersForDelivery];
  if (!v4)
  {
    v24 = [v3 error];

    if (v24) {
      goto LABEL_11;
    }
  }
  uint64_t v27 = v5;
  v28 = v3;
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  id v7 = [MEMORY[0x1E4F73540] data];
  id v8 = [v4 messageBody];
  id v9 = [v8 rawData];

  [v5 appendHeaderData:v7 andRecipients:v6];
  id v10 = [MEMORY[0x1E4F734C8] dataHolderWithData:v7];
  id v11 = v10;
  if (v9) {
    [v10 addData:v9];
  }
  if (v6 && [v6 count])
  {
    id v12 = [(MFMailDelivery *)self deliverMessageData:v11 toRecipients:v6];
    id v13 = self->_result;
    self->_result = v12;

    int64_t v14 = [(MFDeliveryResult *)self->_result status];
  }
  else
  {
    uint64_t v15 = NSString;
    v16 = MFLookupLocalizedString(@"INTERNAL_DELIVERY_ERROR_FORMAT", @"This message couldn’t be delivered because the following internal error occurred: %@", @"Delayed");
    id v17 = MFLookupLocalizedString(@"NO_RECIPIENTS", @"This message couldn’t be delivered because you haven’t specified any recipients.", @"Delayed");
    id v18 = objc_msgSend(v15, "stringWithFormat:", v16, v17);
    v19 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1048 localizedDescription:v18];
    [v28 setError:v19];

    int64_t v14 = 1;
  }

  uint64_t v5 = v27;
  objc_super v3 = v28;
  if (v14 == 3)
  {
    v20 = NSString;
    v21 = MFLookupLocalizedString(@"INTERNAL_DELIVERY_ERROR_FORMAT", @"This message couldn’t be delivered because the following internal error occurred: %@", @"Delayed");
    id v22 = objc_msgSend(v20, "stringWithFormat:", v21, &stru_1EFF11268);

    v23 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1030 localizedDescription:v22];
    [v28 setError:v23];

LABEL_11:
    int64_t v14 = 1;
  }
  [(MFDeliveryResult *)self->_result setStatus:v14];
  __int16 v25 = self->_result;

  return v25;
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
  *((unsigned char *)self + 104) = *((unsigned char *)self + 104) & 0xFD | v3;
}

- (id)followUpWarning
{
  followUpFuture = self->_followUpFuture;
  id v7 = 0;
  char v3 = [(EFFuture *)followUpFuture result:&v7];
  id v4 = v7;
  uint64_t v5 = [v3 followUpWarning];

  return v5;
}

- (void)archive
{
  v16[1] = *MEMORY[0x1E4F143B8];
  char v3 = +[MFActivityMonitor currentMonitor];
  archiveAccount = self->_archiveAccount;
  if (archiveAccount)
  {
    uint64_t v5 = [(MailAccount *)archiveAccount mailboxUidOfType:4 createIfNeeded:1];
    [v3 setCanBeCancelled:1];
    uint64_t v6 = [v5 store];
    int v7 = [v6 allowsAppend];

    if (v7)
    {
      uint64_t v15 = +[MFMailMessageLibrary defaultInstance];
      id v8 = [v15 persistence];
      id v9 = [v8 messageChangeManager];
      id v10 = [(MFMailDelivery *)self message];
      v16[0] = v10;
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
      id v12 = [v5 URL];
      id v13 = [v9 addNewMessages:v11 mailboxURL:v12 userInitiated:0];
      int64_t v14 = [v13 firstObject];

      [(MFMailDelivery *)self _checkAndApplyFollowUpToDeliveredMessage:v14];
    }
  }
}

- (void)updateOriginalMessageFromHeaders:(id)a3
{
  id v14 = a3;
  id v4 = [v14 firstHeaderForKey:*MEMORY[0x1E4F73420]];
  uint64_t v5 = [v14 firstHeaderForKey:*MEMORY[0x1E4F73408]];
  uint64_t v6 = (void *)v5;
  self->_action = 0;
  if (v4)
  {
    int v7 = (void *)MEMORY[0x1E4F603A0];
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedData:v4 options:0];
    id v9 = [v7 objectIDFromSerializedRepresentation:v8];
    originalMessageObjectID = self->_originalMessageObjectID;
    self->_originalMessageObjectID = v9;
    int64_t v11 = 1;
  }
  else
  {
    if (!v5) {
      goto LABEL_6;
    }
    id v12 = (void *)MEMORY[0x1E4F603A0];
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedData:v5 options:0];
    id v13 = [v12 objectIDFromSerializedRepresentation:v8];
    originalMessageObjectID = self->_originalMessageObjectID;
    self->_originalMessageObjectID = v13;
    int64_t v11 = 2;
  }

  self->_action = v11;
LABEL_6:
}

- (void)_checkAndApplyFollowUpToDeliveredMessage:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(MFMailDelivery *)self followUpWarning];
  if (!v5) {
    goto LABEL_16;
  }
  uint64_t v6 = +[MFMailMessageLibrary defaultInstance];
  int v7 = [v6 persistence];
  id v8 = [v7 messageChangeManager];

  int v9 = [MEMORY[0x1E4F602E0] preferenceEnabled:20];
  int v10 = [MEMORY[0x1E4F602E0] preferenceEnabled:21];
  if (v9) {
    [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:10.0];
  }
  else {
  int64_t v11 = [v5 startDate];
  }
  id v12 = v11;
  if (v10)
  {
    id v13 = [v11 dateByAddingTimeInterval:60.0];
  }
  else
  {
    id v13 = [v5 endDate];
    if (!v9)
    {
      id v17 = &stru_1EFF11268;
      goto LABEL_10;
    }
  }
  id v14 = NSString;
  uint64_t v15 = [v5 startDate];
  v16 = [v5 endDate];
  id v17 = [v14 stringWithFormat:@"using DebugStartDate (original startDate:%@, endDate:%@)", v15, v16];

LABEL_10:
  if (objc_opt_respondsToSelector())
  {
    id v18 = [v5 toLightJson];
  }
  else
  {
    id v18 = 0;
  }
  v19 = (void *)[objc_alloc(MEMORY[0x1E4F60298]) initWithStartDate:v12 endDate:v13 jsonStringForModelEvaluationForSuggestions:v18];
  v20 = +[MFMailDelivery log];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = [v5 score];
    *(_DWORD *)buf = 138543874;
    __int16 v25 = v21;
    __int16 v26 = 2114;
    uint64_t v27 = v19;
    __int16 v28 = 2114;
    v29 = v17;
    _os_log_impl(&dword_1A7EFF000, v20, OS_LOG_TYPE_DEFAULT, "suggestionService warning.score:%{public}@ followUp:%{public}@ %{public}@", buf, 0x20u);
  }
  id v23 = v4;
  id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  [v8 applyFollowUp:v19 toMessages:v22];

LABEL_16:
}

- (id)_htmlBodyForMessage:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  char v3 = [a3 messageBodyIfAvailable];
  id v14 = [v3 htmlContent];
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v14;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        int v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v10 = [v9 htmlData];
          int64_t v11 = [v9 preferredCharacterSet];
          MFEncodingForCharset();
          id v12 = (void *)MFCreateStringWithData();

          [v4 appendString:v12];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return v4;
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

- (EMMessageObjectID)originalMessageObjectID
{
  return self->_originalMessageObjectID;
}

- (void)setOriginalMessageObjectID:(id)a3
{
}

- (MFMailMessage)originalMessage
{
  return self->_originalMessage;
}

- (void)setOriginalMessage:(id)a3
{
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

- (BOOL)shouldSign
{
  return self->_shouldSign;
}

- (void)setShouldSign:(BOOL)a3
{
  self->_shouldSign = a3;
}

- (BOOL)shouldEncrypt
{
  return self->_shouldEncrypt;
}

- (void)setShouldEncrypt:(BOOL)a3
{
  self->_shouldEncrypt = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalMessage, 0);
  objc_storeStrong((id *)&self->_originalMessageObjectID, 0);
  objc_storeStrong((id *)&self->_followUpFuture, 0);
  objc_storeStrong((id *)&self->_otherStringsAndAttachments, 0);
  objc_storeStrong((id *)&self->_plainTextAlternative, 0);
  objc_storeStrong((id *)&self->_htmlString, 0);
  objc_storeStrong((id *)&self->_mixedContent, 0);
  objc_storeStrong((id *)&self->_compositionSpecification, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_archiveAccount, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_destroyWeak(&self->_delegate);
}

@end