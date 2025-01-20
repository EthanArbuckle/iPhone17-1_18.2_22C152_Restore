@interface MFOutgoingMessageDelivery
+ (id)log;
+ (id)newWithHeaders:(id)a3 HTML:(id)a4 plainTextAlternative:(id)a5 other:(id)a6;
+ (id)newWithHeaders:(id)a3 mixedContent:(id)a4 textPartsAreHTML:(BOOL)a5;
+ (id)newWithMessage:(id)a3;
- (BOOL)isUserRequested;
- (BOOL)shouldEncrypt;
- (BOOL)shouldSign;
- (MFAttachmentCompositionContext)attachmentContext;
- (MFDeliveryDelegate)delegate;
- (MFMailMessage)originalMessage;
- (MFOutgoingMessageDelivery)init;
- (MFOutgoingMessageDelivery)initWithHeaders:(id)a3 HTML:(id)a4 plainTextAlternative:(id)a5 other:(id)a6;
- (MFOutgoingMessageDelivery)initWithHeaders:(id)a3 mixedContent:(id)a4 textPartsAreHTML:(BOOL)a5;
- (MFOutgoingMessageDelivery)initWithMessage:(id)a3;
- (NSDictionary)compositionSpecification;
- (id)_currentDeliveryObject;
- (id)_deliverSynchronouslyWithCurrentSettings:(BOOL)a3;
- (id)_deliveryAccountForInitializers;
- (id)account;
- (id)deliverSynchronouslyWithCompletion:(id)a3;
- (id)message;
- (id)originalHeaders;
- (id)originalMessageObjectID;
- (int64_t)action;
- (int64_t)deliveryStatus;
- (int64_t)originalConversationId;
- (int64_t)retryCount;
- (unint64_t)conversationFlags;
- (void)_deliveryAccountForInitializers;
- (void)setAccount:(id)a3;
- (void)setAction:(int64_t)a3;
- (void)setArchiveAccount:(id)a3;
- (void)setAttachmentContext:(id)a3;
- (void)setCompositionSpecification:(id)a3;
- (void)setConversationFlags:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setIsUserRequested:(BOOL)a3;
- (void)setOriginalConversationId:(int64_t)a3;
- (void)setOriginalMessage:(id)a3;
- (void)setRetryCount:(int64_t)a3;
- (void)setShouldEncrypt:(BOOL)a3;
- (void)setShouldSign:(BOOL)a3;
@end

@implementation MFOutgoingMessageDelivery

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__MFOutgoingMessageDelivery_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_26 != -1) {
    dispatch_once(&log_onceToken_26, block);
  }
  v2 = (void *)log_log_26;
  return v2;
}

void __32__MFOutgoingMessageDelivery_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_26;
  log_log_26 = (uint64_t)v1;
}

- (MFOutgoingMessageDelivery)init
{
  v3.receiver = self;
  v3.super_class = (Class)MFOutgoingMessageDelivery;
  return [(MFOutgoingMessageDelivery *)&v3 init];
}

- (MFOutgoingMessageDelivery)initWithMessage:(id)a3
{
  id v5 = a3;
  v6 = [(MFOutgoingMessageDelivery *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_message, a3);
  }

  return v7;
}

- (MFOutgoingMessageDelivery)initWithHeaders:(id)a3 mixedContent:(id)a4 textPartsAreHTML:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = [(MFOutgoingMessageDelivery *)self init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_headers, a3);
    objc_storeStrong((id *)&v12->_mixedContent, a4);
    v12->_textPartsAreHTML = a5;
  }

  return v12;
}

- (MFOutgoingMessageDelivery)initWithHeaders:(id)a3 HTML:(id)a4 plainTextAlternative:(id)a5 other:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [(MFOutgoingMessageDelivery *)self init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_headers, a3);
    objc_storeStrong((id *)&v16->_htmlBody, a4);
    objc_storeStrong((id *)&v16->_plainTextAlternative, a5);
    objc_storeStrong((id *)&v16->_otherHTMLAndAttachments, a6);
  }

  return v16;
}

+ (id)newWithMessage:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithMessage:v4];

  return v5;
}

+ (id)newWithHeaders:(id)a3 mixedContent:(id)a4 textPartsAreHTML:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)[objc_alloc((Class)a1) initWithHeaders:v8 mixedContent:v9 textPartsAreHTML:v5];

  return v10;
}

+ (id)newWithHeaders:(id)a3 HTML:(id)a4 plainTextAlternative:(id)a5 other:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)[objc_alloc((Class)a1) initWithHeaders:v10 HTML:v11 plainTextAlternative:v12 other:v13];

  return v14;
}

- (id)_currentDeliveryObject
{
  currentDeliveryObject = self->_currentDeliveryObject;
  if (currentDeliveryObject) {
    goto LABEL_21;
  }
  id v4 = [(MFOutgoingMessageDelivery *)self account];

  message = self->_message;
  if (!v4)
  {
    if (message)
    {
      id v9 = [[MFMailDelivery alloc] initWithMessage:self->_message];
      id v10 = self->_currentDeliveryObject;
      self->_currentDeliveryObject = v9;

      goto LABEL_19;
    }
    if (self->_mixedContent)
    {
      id v13 = [[MFMailDelivery alloc] initWithHeaders:self->_headers mixedContent:self->_mixedContent textPartsAreHTML:self->_textPartsAreHTML];
    }
    else
    {
      if (!self->_htmlBody && !self->_plainTextAlternative) {
        goto LABEL_19;
      }
      id v13 = [[MFMailDelivery alloc] initWithHeaders:self->_headers HTML:self->_htmlBody plainTextAlternative:self->_plainTextAlternative other:self->_otherHTMLAndAttachments];
    }
    v15 = self->_currentDeliveryObject;
    self->_currentDeliveryObject = v13;

    self->_action = [(MFMailDelivery *)self->_currentDeliveryObject action];
    goto LABEL_19;
  }
  if (message)
  {
    v6 = [(MFOutgoingMessageDelivery *)self account];
    v7 = (MFMailDelivery *)[v6 newDeliveryWithMessage:self->_message];
    id v8 = self->_currentDeliveryObject;
    self->_currentDeliveryObject = v7;

    goto LABEL_19;
  }
  if (self->_mixedContent)
  {
    id v11 = [(MFOutgoingMessageDelivery *)self account];
    id v12 = (MFMailDelivery *)[v11 newDeliveryWithHeaders:self->_headers mixedContent:self->_mixedContent textPartsAreHTML:self->_textPartsAreHTML];
LABEL_14:
    id v14 = self->_currentDeliveryObject;
    self->_currentDeliveryObject = v12;

    self->_action = [(MFMailDelivery *)self->_currentDeliveryObject action];
    self->_shouldSign = [(MFMailDelivery *)self->_currentDeliveryObject shouldSign];
    self->_shouldEncrypt = [(MFMailDelivery *)self->_currentDeliveryObject shouldEncrypt];
    self->_conversationFlags = [(MFMailDelivery *)self->_currentDeliveryObject conversationFlags];
    goto LABEL_19;
  }
  if (self->_htmlBody || self->_plainTextAlternative)
  {
    id v11 = [(MFOutgoingMessageDelivery *)self account];
    id v12 = (MFMailDelivery *)[v11 newDeliveryWithHeaders:self->_headers HTML:self->_htmlBody plainTextAlternative:self->_plainTextAlternative other:self->_otherHTMLAndAttachments];
    goto LABEL_14;
  }
LABEL_19:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [(MFMailDelivery *)self->_currentDeliveryObject setDelegate:WeakRetained];

  v17 = [(MFOutgoingMessageDelivery *)self compositionSpecification];
  [(MFMailDelivery *)self->_currentDeliveryObject setCompositionSpecification:v17];

  currentDeliveryObject = self->_currentDeliveryObject;
  if (self->_archiveAccount)
  {
    -[MFMailDelivery setArchiveAccount:](currentDeliveryObject, "setArchiveAccount:");
    currentDeliveryObject = self->_currentDeliveryObject;
  }
LABEL_21:
  return currentDeliveryObject;
}

- (void)setCompositionSpecification:(id)a3
{
  BOOL v5 = (NSDictionary *)a3;
  if (self->_compositionSpecification != v5)
  {
    objc_storeStrong((id *)&self->_compositionSpecification, a3);
    [(MFMailDelivery *)self->_currentDeliveryObject setCompositionSpecification:v5];
  }
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

- (id)_deliverSynchronouslyWithCurrentSettings:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(MFOutgoingMessageDelivery *)self _currentDeliveryObject];
  v6 = v5;
  if (v5)
  {
    if (v3) {
      [v5 setCellDataOnly:1];
    }
    [v6 setArchiveAccount:self->_archiveAccount];
    objc_msgSend(v6, "setConversationFlags:", -[MFOutgoingMessageDelivery conversationFlags](self, "conversationFlags"));
    objc_msgSend(v6, "setIsUserRequested:", -[MFOutgoingMessageDelivery isUserRequested](self, "isUserRequested"));
    objc_msgSend(v6, "setAction:", -[MFOutgoingMessageDelivery action](self, "action"));
    objc_msgSend(v6, "setShouldSign:", -[MFOutgoingMessageDelivery shouldSign](self, "shouldSign"));
    objc_msgSend(v6, "setShouldEncrypt:", -[MFOutgoingMessageDelivery shouldEncrypt](self, "shouldEncrypt"));
    v7 = [(MFOutgoingMessageDelivery *)self originalMessageObjectID];
    [v6 setOriginalMessageObjectID:v7];

    id v8 = [(MFOutgoingMessageDelivery *)self originalMessage];
    [v6 setOriginalMessage:v8];

    id v9 = [v6 deliverSynchronously];
    if ([(MFDeliveryResult *)v9 status])
    {
      if (v9) {
        goto LABEL_13;
      }
    }
    else
    {
      id v12 = [MEMORY[0x1E4F4BE40] sharedAggregateDictionary];
      id v13 = [v6 message];
      objc_msgSend(v12, "pushValue:forKey:", @"com.apple.mobilemail.sentMessageSize", (double)(unint64_t)objc_msgSend(v13, "messageSize"));

      if (v9) {
        goto LABEL_13;
      }
    }
    uint64_t v11 = 2;
  }
  else
  {
    id v10 = +[MFOutgoingMessageDelivery log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MFOutgoingMessageDelivery _deliverSynchronouslyWithCurrentSettings:](v10);
    }

    uint64_t v11 = 5;
  }
  id v9 = [[MFDeliveryResult alloc] initWithStatus:v11];
LABEL_13:

  return v9;
}

- (id)deliverSynchronouslyWithCompletion:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t))a3;
  if (![(MailAccount *)self->_archiveAccount isPrimaryDeliveryAccountDisabled]
    && ([(MFOutgoingMessageDelivery *)self account], (BOOL v5 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([(MailAccount *)self->_archiveAccount deliveryAccountAlternates],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        [v5 count]))
  {

    goto LABEL_5;
  }
  BOOL v10 = [(MailAccount *)self->_archiveAccount canUseCarrierDeliveryFallback];

  if (v10)
  {
LABEL_5:
    v6 = [[MFDeliveryResult alloc] initWithStatus:2];
    v7 = [(MFOutgoingMessageDelivery *)self account];
    if ([v7 isActive])
    {
      BOOL v8 = [(MailAccount *)self->_archiveAccount isPrimaryDeliveryAccountDisabled];

      if (v8)
      {
        BOOL v39 = 1;
        id v9 = v6;
LABEL_16:
        if ([(MFDeliveryResult *)v9 status] == 5 || [(MFDeliveryResult *)v9 status] == 2) {
          goto LABEL_18;
        }
        if ([(MFDeliveryResult *)v9 status] == 1)
        {
          v34 = +[MFActivityMonitor currentMonitor];
          v35 = [v34 error];

          if (v35)
          {
            v36 = [v35 domain];
            if (@"MFMessageErrorDomain" == v36)
            {
              uint64_t v38 = [v35 code];

              if (v38 == 1047)
              {
LABEL_18:
                [(MailAccount *)self->_archiveAccount deliveryAccountAlternates];
                long long v42 = 0u;
                long long v43 = 0u;
                long long v40 = 0u;
                long long v41 = 0u;
                id v18 = (id)objc_claimAutoreleasedReturnValue();
                uint64_t v19 = [v18 countByEnumeratingWithState:&v40 objects:v44 count:16];
                if (v19)
                {
                  uint64_t v20 = *(void *)v41;
LABEL_20:
                  uint64_t v21 = 0;
                  while (1)
                  {
                    if (*(void *)v41 != v20) {
                      objc_enumerationMutation(v18);
                    }
                    uint64_t v22 = *(void *)(*((void *)&v40 + 1) + 8 * v21);
                    v23 = +[MFActivityMonitor currentMonitor];
                    [v23 setShouldCancel:0];

                    if ([(MailAccount *)self->_archiveAccount canUseDeliveryAccount:v22])
                    {
                      [(MFOutgoingMessageDelivery *)self setAccount:v22];
                      uint64_t v24 = [(MFOutgoingMessageDelivery *)self _deliverSynchronouslyWithCurrentSettings:0];

                      id v9 = (MFDeliveryResult *)v24;
                    }
                    if ([(MFDeliveryResult *)v9 status] != 2 && [(MFDeliveryResult *)v9 status] != 1) {
                      break;
                    }
                    if (v19 == ++v21)
                    {
                      uint64_t v19 = [v18 countByEnumeratingWithState:&v40 objects:v44 count:16];
                      if (v19) {
                        goto LABEL_20;
                      }
                      break;
                    }
                  }
                }

                if (([(MFDeliveryResult *)v9 status] == 2 || [(MFDeliveryResult *)v9 status] == 1)
                  && [(MailAccount *)self->_archiveAccount canUseCarrierDeliveryFallback])
                {
                  v25 = +[DeliveryAccount carrierDeliveryAccount];
                  if (v25)
                  {
                    v26 = +[MFActivityMonitor currentMonitor];
                    [v26 setShouldCancel:0];

                    [(MFOutgoingMessageDelivery *)self setAccount:v25];
                    uint64_t v27 = [(MFOutgoingMessageDelivery *)self _deliverSynchronouslyWithCurrentSettings:1];

                    id v9 = (MFDeliveryResult *)v27;
                  }
                }
              }
            }
            else
            {
            }
          }
        }
        if (![(MFDeliveryResult *)v9 status])
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          char v29 = objc_opt_respondsToSelector();

          if (v29)
          {
            id v30 = objc_loadWeakRetained((id *)&self->_delegate);
            [v30 notifyUserDeliverySucceeded:self];
          }
        }
        if ([(MFDeliveryResult *)v9 status]) {
          BOOL v31 = 0;
        }
        else {
          BOOL v31 = v39;
        }
        if (v31)
        {
          v32 = [(MFOutgoingMessageDelivery *)self _currentDeliveryObject];
          [v32 archive];
        }
        if (v4) {
          v4[2](v4, [(MFDeliveryResult *)v9 status]);
        }
        goto LABEL_46;
      }
      id v9 = [(MFOutgoingMessageDelivery *)self _deliverSynchronouslyWithCurrentSettings:0];

      v15 = [(MFOutgoingMessageDelivery *)self _currentDeliveryObject];
      v16 = [v15 account];
      char v17 = [v16 supportsOutboxCopy];

      if ([(MFDeliveryResult *)v9 status]
        || (v17 & 1) == 0 && [(MailAccount *)self->_archiveAccount mustArchiveSentMessages])
      {
        BOOL v39 = 1;
        goto LABEL_16;
      }
      if (![(MailAccount *)self->_archiveAccount canArchiveSentMessages])
      {
        BOOL v39 = 0;
        goto LABEL_16;
      }
      v7 = [(MFOutgoingMessageDelivery *)self _currentDeliveryObject];
      v37 = [v7 followUpWarning];
      BOOL v39 = v37 != 0;
    }
    else
    {
      BOOL v39 = 1;
      id v9 = v6;
    }

    goto LABEL_16;
  }
  uint64_t v11 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1051 userInfo:0];
  id v12 = +[MFActivityMonitor currentMonitor];
  [v12 setError:v11];

  id v13 = +[MFOutgoingMessageDelivery log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    id v14 = objc_msgSend(v11, "ef_publicDescription");
    [(MFOutgoingMessageDelivery *)v14 deliverSynchronouslyWithCompletion:v13];
  }

  id v9 = [[MFDeliveryResult alloc] initWithStatus:5];
LABEL_46:

  return v9;
}

- (int64_t)deliveryStatus
{
  BOOL v3 = [(MFOutgoingMessageDelivery *)self _currentDeliveryObject];
  if (v3)
  {
    id v4 = [(MFOutgoingMessageDelivery *)self _currentDeliveryObject];
    int64_t v5 = [v4 deliveryStatus];
  }
  else
  {
    int64_t v5 = 5;
  }

  return v5;
}

- (id)message
{
  BOOL v3 = [(MFOutgoingMessageDelivery *)self _currentDeliveryObject];
  id v4 = [v3 message];

  if (!v4)
  {
    int64_t v5 = [(MFOutgoingMessageDelivery *)self account];

    if (v5)
    {
LABEL_3:
      id v4 = 0;
      goto LABEL_12;
    }
    message = self->_message;
    if (message)
    {
      id v4 = message;
    }
    else
    {
      if (self->_mixedContent)
      {
        v7 = [[MFMailDelivery alloc] initWithHeaders:self->_headers mixedContent:self->_mixedContent textPartsAreHTML:self->_textPartsAreHTML];
        uint64_t v8 = [(MFMailDelivery *)v7 message];
      }
      else
      {
        if (!self->_htmlBody && !self->_plainTextAlternative) {
          goto LABEL_3;
        }
        v7 = [[MFMailDelivery alloc] initWithHeaders:self->_headers HTML:self->_htmlBody plainTextAlternative:self->_plainTextAlternative other:self->_otherHTMLAndAttachments];
        uint64_t v8 = [(MFMailDelivery *)v7 message];
      }
      id v4 = (MFMailMessage *)v8;
    }
  }
LABEL_12:
  return v4;
}

- (id)_deliveryAccountForInitializers
{
  if (self->_message)
  {
    v2 = +[MailAccount accountThatMessageIsFrom:](MailAccount, "accountThatMessageIsFrom:");
    BOOL v3 = [v2 deliveryAccount];
LABEL_5:

    goto LABEL_6;
  }
  headers = self->_headers;
  if (headers)
  {
    v2 = [(MFMutableMessageHeaders *)headers firstSenderAddress];
    int64_t v5 = +[MailAccount accountContainingEmailAddress:v2];
    BOOL v3 = [v5 deliveryAccount];

    goto LABEL_5;
  }
  v7 = +[MFOutgoingMessageDelivery log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[MFOutgoingMessageDelivery _deliveryAccountForInitializers](v7);
  }

  BOOL v3 = 0;
LABEL_6:
  return v3;
}

- (id)account
{
  deliveryAccount = self->_deliveryAccount;
  if (!deliveryAccount)
  {
    id v4 = [(MFOutgoingMessageDelivery *)self _deliveryAccountForInitializers];
    int64_t v5 = self->_deliveryAccount;
    self->_deliveryAccount = v4;

    deliveryAccount = self->_deliveryAccount;
  }
  return deliveryAccount;
}

- (void)setArchiveAccount:(id)a3
{
  objc_storeStrong((id *)&self->_archiveAccount, a3);
  id v5 = a3;
  [(MFMailDelivery *)self->_currentDeliveryObject setArchiveAccount:self->_archiveAccount];
}

- (void)setAccount:(id)a3
{
  p_deliveryAccount = &self->_deliveryAccount;
  uint64_t v8 = (DeliveryAccount *)a3;
  if (*p_deliveryAccount != v8)
  {
    objc_storeStrong((id *)&self->_deliveryAccount, a3);
    [(DeliveryAccount *)*p_deliveryAccount deliveryClass];
    if (self->_currentDeliveryObject)
    {
      char isKindOfClass = objc_opt_isKindOfClass();
      currentDeliveryObject = self->_currentDeliveryObject;
      if (isKindOfClass)
      {
        [(MFMailDelivery *)currentDeliveryObject setAccount:*p_deliveryAccount];
      }
      else
      {
        self->_currentDeliveryObject = 0;
      }
    }
  }
}

- (id)originalMessageObjectID
{
  return [(MFMailDelivery *)self->_currentDeliveryObject originalMessageObjectID];
}

- (NSDictionary)compositionSpecification
{
  return self->_compositionSpecification;
}

- (MFDeliveryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MFDeliveryDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MFAttachmentCompositionContext)attachmentContext
{
  return self->_attachmentContext;
}

- (void)setAttachmentContext:(id)a3
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

- (MFMailMessage)originalMessage
{
  return self->_originalMessage;
}

- (void)setOriginalMessage:(id)a3
{
}

- (int64_t)originalConversationId
{
  return self->_originalConversationId;
}

- (void)setOriginalConversationId:(int64_t)a3
{
  self->_originalConversationId = a3;
}

- (BOOL)isUserRequested
{
  return self->_isUserRequested;
}

- (void)setIsUserRequested:(BOOL)a3
{
  self->_isUserRequested = a3;
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

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(int64_t)a3
{
  self->_retryCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalMessage, 0);
  objc_storeStrong((id *)&self->_attachmentContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentDeliveryObject, 0);
  objc_storeStrong((id *)&self->_compositionSpecification, 0);
  objc_storeStrong((id *)&self->_deliveryAccount, 0);
  objc_storeStrong((id *)&self->_archiveAccount, 0);
  objc_storeStrong((id *)&self->_otherHTMLAndAttachments, 0);
  objc_storeStrong((id *)&self->_plainTextAlternative, 0);
  objc_storeStrong((id *)&self->_htmlBody, 0);
  objc_storeStrong((id *)&self->_mixedContent, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

- (void)_deliverSynchronouslyWithCurrentSettings:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "Failed to find a valid delivery object", v1, 2u);
}

- (void)deliverSynchronouslyWithCompletion:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "Failed to deliver message due to error %{public}@", buf, 0xCu);
}

- (void)_deliveryAccountForInitializers
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "Failed to find an account to deliver message", v1, 2u);
}

@end