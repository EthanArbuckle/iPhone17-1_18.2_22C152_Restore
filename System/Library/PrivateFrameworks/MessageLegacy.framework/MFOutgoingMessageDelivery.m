@interface MFOutgoingMessageDelivery
+ (id)newWithHeaders:(id)a3 HTML:(id)a4 plainTextAlternative:(id)a5 other:(id)a6 charsets:(id)a7;
+ (id)newWithHeaders:(id)a3 mixedContent:(id)a4 textPartsAreHTML:(BOOL)a5;
+ (id)newWithMessage:(id)a3;
- (BOOL)isUserRequested;
- (MFAttachmentCompositionContext)attachmentContext;
- (MFOutgoingMessageDelivery)init;
- (MFOutgoingMessageDelivery)initWithHeaders:(id)a3 HTML:(id)a4 plainTextAlternative:(id)a5 other:(id)a6 charsets:(id)a7;
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
- (int64_t)deliveryStatus;
- (int64_t)originalConversationId;
- (unint64_t)conversationFlags;
- (void)dealloc;
- (void)setAccount:(id)a3;
- (void)setArchiveAccount:(id)a3;
- (void)setAttachmentContext:(id)a3;
- (void)setCompositionSpecification:(id)a3;
- (void)setConversationFlags:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setIsUserRequested:(BOOL)a3;
- (void)setOriginalConversationId:(int64_t)a3;
@end

@implementation MFOutgoingMessageDelivery

- (MFOutgoingMessageDelivery)init
{
  v3.receiver = self;
  v3.super_class = (Class)MFOutgoingMessageDelivery;
  return [(MFOutgoingMessageDelivery *)&v3 init];
}

- (MFOutgoingMessageDelivery)initWithMessage:(id)a3
{
  v4 = [(MFOutgoingMessageDelivery *)self init];
  if (v4) {
    v4->_message = (MFMessage *)a3;
  }
  return v4;
}

- (MFOutgoingMessageDelivery)initWithHeaders:(id)a3 mixedContent:(id)a4 textPartsAreHTML:(BOOL)a5
{
  v8 = [(MFOutgoingMessageDelivery *)self init];
  if (v8)
  {
    v8->_headers = (MFMutableMessageHeaders *)a3;
    v8->_mixedContent = (NSArray *)a4;
    v8->_textPartsAreHTML = a5;
  }
  return v8;
}

- (MFOutgoingMessageDelivery)initWithHeaders:(id)a3 HTML:(id)a4 plainTextAlternative:(id)a5 other:(id)a6 charsets:(id)a7
{
  v12 = [(MFOutgoingMessageDelivery *)self init];
  if (v12)
  {
    v12->_headers = (MFMutableMessageHeaders *)a3;
    v12->_htmlBody = (NSString *)a4;
    v12->_plainTextAlternative = (MFPlainTextDocument *)a5;
    v12->_otherHTMLAndAttachments = (NSArray *)a6;
    v12->_charsets = (NSArray *)a7;
  }
  return v12;
}

+ (id)newWithMessage:(id)a3
{
  id v4 = objc_alloc((Class)a1);
  return (id)[v4 initWithMessage:a3];
}

+ (id)newWithHeaders:(id)a3 mixedContent:(id)a4 textPartsAreHTML:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = objc_alloc((Class)a1);
  return (id)[v8 initWithHeaders:a3 mixedContent:a4 textPartsAreHTML:v5];
}

+ (id)newWithHeaders:(id)a3 HTML:(id)a4 plainTextAlternative:(id)a5 other:(id)a6 charsets:(id)a7
{
  id v12 = objc_alloc((Class)a1);
  return (id)[v12 initWithHeaders:a3 HTML:a4 plainTextAlternative:a5 other:a6 charsets:a7];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MFOutgoingMessageDelivery;
  [(MFOutgoingMessageDelivery *)&v3 dealloc];
}

- (id)_currentDeliveryObject
{
  id result = self->_currentDeliveryObject;
  if (!result)
  {
    id v4 = [(MFOutgoingMessageDelivery *)self account];
    message = self->_message;
    if (v4)
    {
      if (message)
      {
        v6 = (MFMailDelivery *)objc_msgSend(-[MFOutgoingMessageDelivery account](self, "account"), "newDeliveryWithMessage:", self->_message);
      }
      else if (self->_mixedContent)
      {
        v6 = (MFMailDelivery *)objc_msgSend(-[MFOutgoingMessageDelivery account](self, "account"), "newDeliveryWithHeaders:mixedContent:textPartsAreHTML:", self->_headers, self->_mixedContent, self->_textPartsAreHTML);
      }
      else
      {
        if (!self->_htmlBody && !self->_plainTextAlternative) {
          goto LABEL_18;
        }
        v6 = (MFMailDelivery *)objc_msgSend(-[MFOutgoingMessageDelivery account](self, "account"), "newDeliveryWithHeaders:HTML:plainTextAlternative:other:charsets:", self->_headers, self->_htmlBody, self->_plainTextAlternative, self->_otherHTMLAndAttachments, self->_charsets);
      }
    }
    else if (message)
    {
      v6 = [[MFMailDelivery alloc] initWithMessage:self->_message];
    }
    else if (self->_mixedContent)
    {
      v6 = [[MFMailDelivery alloc] initWithHeaders:self->_headers mixedContent:self->_mixedContent textPartsAreHTML:self->_textPartsAreHTML];
    }
    else
    {
      if (!self->_htmlBody && !self->_plainTextAlternative) {
        goto LABEL_18;
      }
      v6 = [[MFMailDelivery alloc] initWithHeaders:self->_headers HTML:self->_htmlBody plainTextAlternative:self->_plainTextAlternative other:self->_otherHTMLAndAttachments charsets:self->_charsets];
    }
    self->_currentDeliveryObject = v6;
LABEL_18:
    [(MFMailDelivery *)self->_currentDeliveryObject setDelegate:self->_delegate];
    [(MFMailDelivery *)self->_currentDeliveryObject setCompositionSpecification:[(MFOutgoingMessageDelivery *)self compositionSpecification]];
    id result = self->_currentDeliveryObject;
    if (self->_archiveAccount)
    {
      objc_msgSend(result, "setArchiveAccount:");
      return self->_currentDeliveryObject;
    }
  }
  return result;
}

- (void)setCompositionSpecification:(id)a3
{
  compositionSpecification = self->_compositionSpecification;
  if (compositionSpecification != a3)
  {

    self->_compositionSpecification = (NSDictionary *)a3;
    currentDeliveryObject = self->_currentDeliveryObject;
    [(MFMailDelivery *)currentDeliveryObject setCompositionSpecification:a3];
  }
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

- (id)_deliverSynchronouslyWithCurrentSettings:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(MFOutgoingMessageDelivery *)self _currentDeliveryObject];
  if (v5)
  {
    v6 = v5;
    if (v3) {
      [v5 setCellDataOnly:1];
    }
    [v6 setArchiveAccount:self->_archiveAccount];
    objc_msgSend(v6, "setConversationFlags:", -[MFOutgoingMessageDelivery conversationFlags](self, "conversationFlags"));
    objc_msgSend(v6, "setIsUserRequested:", -[MFOutgoingMessageDelivery isUserRequested](self, "isUserRequested"));
    v7 = (void *)[v6 deliverSynchronously];
    if ([v7 status])
    {
      if (v7) {
        return v7;
      }
    }
    else
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F4BE40], "sharedAggregateDictionary"), "pushValue:forKey:", @"com.apple.mobilemail.sentMessageSize", (double)(unint64_t)objc_msgSend((id)objc_msgSend(v6, "message"), "messageSize"));
      if (v7) {
        return v7;
      }
    }
    uint64_t v9 = 2;
  }
  else
  {
    uint64_t v9 = 5;
  }
  v10 = [[MFDeliveryResult alloc] initWithStatus:v9];
  return v10;
}

- (id)deliverSynchronouslyWithCompletion:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (![(MailAccount *)self->_archiveAccount isPrimaryDeliveryAccountDisabled]
    && [(MFOutgoingMessageDelivery *)self account]
    || objc_msgSend(-[MailAccount deliveryAccountAlternates](self->_archiveAccount, "deliveryAccountAlternates"), "count")|| -[MailAccount canUseCarrierDeliveryFallback](self->_archiveAccount, "canUseCarrierDeliveryFallback"))
  {
    id v5 = [[MFDeliveryResult alloc] initWithStatus:2];
    BOOL v7 = 0;
    if (objc_msgSend(-[MFOutgoingMessageDelivery account](self, "account"), "isActive"))
    {
      if (![(MailAccount *)self->_archiveAccount isPrimaryDeliveryAccountDisabled])
      {
        id v5 = [(MFOutgoingMessageDelivery *)self _deliverSynchronouslyWithCurrentSettings:0];
        char v6 = objc_msgSend((id)objc_msgSend(-[MFOutgoingMessageDelivery _currentDeliveryObject](self, "_currentDeliveryObject"), "account"), "supportsOutboxCopy");
        if (![(MFDeliveryResult *)v5 status]
          && ((v6 & 1) != 0 || ![(MailAccount *)self->_archiveAccount archiveSentMessages]))
        {
          BOOL v7 = 1;
        }
      }
    }
    if ([(MFDeliveryResult *)v5 status] == 5
      || [(MFDeliveryResult *)v5 status] == 2
      || [(MFDeliveryResult *)v5 status] == 1
      && (v16 = objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "error")) != 0&& (v17 = v16, @"MFMessageErrorDomain" == (__CFString *)objc_msgSend(v16, "domain"))&& objc_msgSend(v17, "code") == 1047)
    {
      id v8 = [(MailAccount *)self->_archiveAccount deliveryAccountAlternates];
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v22;
LABEL_13:
        uint64_t v12 = 0;
        while (1)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * v12);
          objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "setShouldCancel:", 0);
          if ([(MailAccount *)self->_archiveAccount canUseDeliveryAccount:v13])
          {
            [(MFOutgoingMessageDelivery *)self setAccount:v13];
            id v5 = [(MFOutgoingMessageDelivery *)self _deliverSynchronouslyWithCurrentSettings:0];
          }
          if ([(MFDeliveryResult *)v5 status] != 2 && [(MFDeliveryResult *)v5 status] != 1) {
            break;
          }
          if (v10 == ++v12)
          {
            uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
            if (v10) {
              goto LABEL_13;
            }
            break;
          }
        }
      }
      if ([(MFDeliveryResult *)v5 status] == 2 || [(MFDeliveryResult *)v5 status] == 1)
      {
        if ([(MailAccount *)self->_archiveAccount canUseCarrierDeliveryFallback])
        {
          id v14 = +[DeliveryAccount carrierDeliveryAccount];
          if (v14)
          {
            id v15 = v14;
            objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "setShouldCancel:", 0);
            [(MFOutgoingMessageDelivery *)self setAccount:v15];
            id v5 = [(MFOutgoingMessageDelivery *)self _deliverSynchronouslyWithCurrentSettings:1];
          }
        }
      }
    }
    if (![(MFDeliveryResult *)v5 status] && (objc_opt_respondsToSelector() & 1) != 0) {
      [(MFDeliveryDelegate *)self->_delegate notifyUserDeliverySucceeded:self];
    }
    if (a3) {
      (*((void (**)(id, int64_t))a3 + 2))(a3, [(MFDeliveryResult *)v5 status]);
    }
    if ([(MFDeliveryResult *)v5 status]) {
      char v18 = 1;
    }
    else {
      char v18 = v7;
    }
    if ((v18 & 1) == 0) {
      objc_msgSend(-[MFOutgoingMessageDelivery _currentDeliveryObject](self, "_currentDeliveryObject"), "archive");
    }
    return v5;
  }
  else
  {
    objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "setError:", +[MFError errorWithDomain:code:userInfo:](MFError, "errorWithDomain:code:userInfo:", @"MFMessageErrorDomain", 1051, 0));
    v20 = [[MFDeliveryResult alloc] initWithStatus:5];
    return v20;
  }
}

- (int64_t)deliveryStatus
{
  if (![(MFOutgoingMessageDelivery *)self _currentDeliveryObject]) {
    return 5;
  }
  id v3 = [(MFOutgoingMessageDelivery *)self _currentDeliveryObject];
  return [v3 deliveryStatus];
}

- (id)message
{
  id v3 = (MFMessage *)objc_msgSend(-[MFOutgoingMessageDelivery _currentDeliveryObject](self, "_currentDeliveryObject"), "message");
  if (!v3)
  {
    if ([(MFOutgoingMessageDelivery *)self account]) {
      return 0;
    }
    message = self->_message;
    if (message)
    {
      id v3 = message;
LABEL_6:
      id v5 = 0;
LABEL_13:

      return v3;
    }
    if (self->_mixedContent)
    {
      char v6 = [[MFMailDelivery alloc] initWithHeaders:self->_headers mixedContent:self->_mixedContent textPartsAreHTML:self->_textPartsAreHTML];
    }
    else
    {
      if (!self->_htmlBody && !self->_plainTextAlternative)
      {
        id v3 = 0;
        goto LABEL_6;
      }
      char v6 = [[MFMailDelivery alloc] initWithHeaders:self->_headers HTML:self->_htmlBody plainTextAlternative:self->_plainTextAlternative other:self->_otherHTMLAndAttachments charsets:self->_charsets];
    }
    id v5 = v6;
    id v3 = [(MFMailDelivery *)v6 message];
    goto LABEL_13;
  }
  return v3;
}

- (id)_deliveryAccountForInitializers
{
  if (self->_message)
  {
    id v2 = +[MailAccount accountThatMessageIsFrom:](MailAccount, "accountThatMessageIsFrom:");
  }
  else
  {
    id result = self->_headers;
    if (!result) {
      return result;
    }
    id v2 = +[MailAccount accountContainingEmailAddress:](MailAccount, "accountContainingEmailAddress:", [result firstSenderAddress]);
  }
  return (id)[v2 deliveryAccount];
}

- (id)account
{
  id result = self->_deliveryAccount;
  if (!result)
  {
    id result = [(MFOutgoingMessageDelivery *)self _deliveryAccountForInitializers];
    self->_deliveryAccount = (DeliveryAccount *)result;
  }
  return result;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (MFDeliveryDelegate *)a3;
}

- (void)setArchiveAccount:(id)a3
{
  id v3 = (MailAccount *)a3;
  archiveAccount = self->_archiveAccount;
  if (archiveAccount != a3)
  {

    id v3 = v3;
    self->_archiveAccount = v3;
  }
  currentDeliveryObject = self->_currentDeliveryObject;
  [(MFMailDelivery *)currentDeliveryObject setArchiveAccount:v3];
}

- (void)setAccount:(id)a3
{
  deliveryAccount = self->_deliveryAccount;
  if (deliveryAccount != a3)
  {

    char v6 = (DeliveryAccount *)a3;
    self->_deliveryAccount = v6;
    [(DeliveryAccount *)v6 deliveryClass];
    if (self->_currentDeliveryObject)
    {
      char isKindOfClass = objc_opt_isKindOfClass();
      currentDeliveryObject = self->_currentDeliveryObject;
      if (isKindOfClass)
      {
        uint64_t v9 = self->_deliveryAccount;
        [(MFMailDelivery *)currentDeliveryObject setAccount:v9];
      }
      else
      {

        self->_currentDeliveryObject = 0;
      }
    }
  }
}

- (NSDictionary)compositionSpecification
{
  return self->_compositionSpecification;
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

@end