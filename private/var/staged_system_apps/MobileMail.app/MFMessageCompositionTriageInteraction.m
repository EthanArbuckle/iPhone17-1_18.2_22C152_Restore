@interface MFMessageCompositionTriageInteraction
+ (OS_os_log)log;
+ (id)compositionRepresentationRequestForMessage:(id)a3;
+ (id)interactionWithContentRequest:(id)a3 scene:(id)a4;
- (BOOL)_hasIncompleteAttachments;
- (BOOL)_noSelection;
- (BOOL)_selectedTextContainsAttachments;
- (BOOL)includeAttachmentsWithoutPrompting;
- (BOOL)isActingOnEML;
- (BOOL)loadRestOfMessage;
- (BOOL)shouldPromptToLoadRestOfMessage;
- (ComposeCapable)scene;
- (EMDaemonInterface)daemonInterface;
- (EMMailboxObjectID)mailboxObjectID;
- (EMMessage)emailMessage;
- (MFMailMessage)message;
- (MFMessageCompositionTriageInteraction)init;
- (MFMessageLoadingContext)loadingContext;
- (MessageContentRepresentationRequest)contentRequest;
- (NSArray)messageSourceMailboxes;
- (NSArray)originalContent;
- (NSString)fromAddress;
- (id)_confirmIncludingAttachments;
- (id)_confirmLoadingRestOfMessage;
- (int64_t)attachmentPolicy;
- (unint64_t)includeAttachmentsByDefault;
- (unint64_t)includeAttachmentsForCurrentPolicy;
- (unint64_t)promptForAttachmentsResult;
- (unint64_t)shouldIncludeAttachments;
- (unint64_t)shouldLoadRestOfMessage;
- (void)_performInteractionAfterPreparation:(id)a3 completion:(id)a4;
- (void)_performInteraction_Internal;
- (void)presentComposeWithContext:(id)a3;
- (void)setAttachmentPolicy:(int64_t)a3;
- (void)setContentRequest:(id)a3;
- (void)setDaemonInterface:(id)a3;
- (void)setFromAddress:(id)a3;
- (void)setIsActingOnEML:(BOOL)a3;
- (void)setLoadRestOfMessage:(BOOL)a3;
- (void)setLoadingContext:(id)a3;
- (void)setMailboxObjectID:(id)a3;
- (void)setMessage:(id)a3;
- (void)setMessageSourceMailboxes:(id)a3;
- (void)setOriginalContent:(id)a3;
- (void)setPromptForAttachmentsResult:(unint64_t)a3;
- (void)setScene:(id)a3;
- (void)setShouldPromptToLoadRestOfMessage:(BOOL)a3;
@end

@implementation MFMessageCompositionTriageInteraction

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001AFF1C;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699B68 != -1) {
    dispatch_once(&qword_100699B68, block);
  }
  v2 = (void *)qword_100699B60;

  return (OS_os_log *)v2;
}

+ (id)compositionRepresentationRequestForMessage:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)MessageContentRepresentationRequest);
  id v5 = [v4 initWithMessage:v3 includeSuggestions:0 representationType:EMContentRepresentationTypeHTML delegate:0];

  return v5;
}

+ (id)interactionWithContentRequest:(id)a3 scene:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)a1);
  id v9 = objc_alloc((Class)MSMessageListItemSelection);
  v10 = [v6 message];
  v15 = v10;
  v11 = +[NSArray arrayWithObjects:&v15 count:1];
  id v12 = [v9 initWithMessageListItems:v11];
  [v8 setMessageListItemSelection:v12];

  [v8 setContentRequest:v6];
  v13 = [v7 daemonInterface];
  [v8 setDaemonInterface:v13];

  [v8 setPromptForAttachmentsResult:0];
  [v8 setScene:v7];

  return v8;
}

- (MFMessageCompositionTriageInteraction)init
{
  v5.receiver = self;
  v5.super_class = (Class)MFMessageCompositionTriageInteraction;
  v2 = [(MFTriageInteraction *)&v5 init];
  id v3 = v2;
  if (v2)
  {
    [(MFMessageCompositionTriageInteraction *)v2 setShouldPromptToLoadRestOfMessage:1];
    [(MFMessageCompositionTriageInteraction *)v3 setIsActingOnEML:0];
  }
  return v3;
}

- (EMMessage)emailMessage
{
  v2 = [(MFTriageInteraction *)self messageListItemSelection];
  id v3 = [v2 messageListItems];
  id v4 = [v3 firstObject];
  objc_super v5 = [v4 displayMessage];
  id v6 = [v5 result];

  return (EMMessage *)v6;
}

- (BOOL)_hasIncompleteAttachments
{
  v2 = [(MFMessageCompositionTriageInteraction *)self contentRequest];
  id v3 = [v2 resultIfAvailable];

  id v4 = [v3 relatedContentItems];
  unsigned __int8 v5 = [v4 ef_any:&stru_10060BFA8];

  return v5;
}

- (unint64_t)includeAttachmentsForCurrentPolicy
{
  int64_t v3 = [(MFMessageCompositionTriageInteraction *)self attachmentPolicy];
  if (v3 == 3)
  {
    if ([(MFMessageCompositionTriageInteraction *)self includeAttachmentsWithoutPrompting])
    {
      return 2;
    }
    else
    {
      return 1;
    }
  }
  else if (v3 == 2)
  {
    return 0;
  }
  else if (v3)
  {
    return 2;
  }
  else
  {
    return [(MFMessageCompositionTriageInteraction *)self includeAttachmentsByDefault];
  }
}

- (unint64_t)includeAttachmentsByDefault
{
  return 1;
}

- (BOOL)includeAttachmentsWithoutPrompting
{
  return 0;
}

- (unint64_t)shouldLoadRestOfMessage
{
  unsigned __int8 v3 = [(MFMessageCompositionTriageInteraction *)self shouldPromptToLoadRestOfMessage];
  unint64_t v4 = [(MFMessageCompositionTriageInteraction *)self promptForAttachmentsResult];
  if (!v4) {
    unint64_t v4 = [(MFMessageCompositionTriageInteraction *)self includeAttachmentsForCurrentPolicy];
  }
  unsigned __int8 v5 = [(MFMessageCompositionTriageInteraction *)self contentRequest];
  id v6 = [v5 resultIfAvailable];

  if (v6)
  {
    unsigned __int8 v7 = [v6 hasMoreContent];
    char v8 = v7;
    if ((v3 & 1) == 0)
    {
      if (v7) {
        goto LABEL_18;
      }
LABEL_16:
      if (v4 != 2
        || ![(MFMessageCompositionTriageInteraction *)self _hasIncompleteAttachments])
      {
        unint64_t v10 = 1;
        goto LABEL_20;
      }
      goto LABEL_18;
    }
  }
  else
  {
    if ((v3 & 1) == 0)
    {
LABEL_18:
      unint64_t v10 = 2;
      goto LABEL_20;
    }
    char v8 = 1;
  }
  if ((id)[(MFMessageCompositionTriageInteraction *)self promptForAttachmentsResult] == (id)2) {
    char v9 = 0;
  }
  else {
    char v9 = v8;
  }
  if (v9) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = 2;
  }
  if ((v8 & 1) == 0) {
    goto LABEL_16;
  }
LABEL_20:

  return v10;
}

- (BOOL)_selectedTextContainsAttachments
{
  v2 = [(MFMessageCompositionTriageInteraction *)self originalContent];
  unsigned __int8 v3 = [v2 firstObject];
  unsigned __int8 v4 = [v3 containsString:@"<attachment"];

  return v4;
}

- (BOOL)_noSelection
{
  v2 = [(MFMessageCompositionTriageInteraction *)self originalContent];
  BOOL v3 = v2 == 0;

  return v3;
}

- (unint64_t)shouldIncludeAttachments
{
  BOOL v3 = [(MFMessageCompositionTriageInteraction *)self emailMessage];
  if (![v3 hasAttachments])
  {

    return 1;
  }
  if (![(MFMessageCompositionTriageInteraction *)self _noSelection])
  {
    unsigned __int8 v5 = [(MFMessageCompositionTriageInteraction *)self _selectedTextContainsAttachments];

    if (v5) {
      goto LABEL_7;
    }
    return 1;
  }

LABEL_7:

  return [(MFMessageCompositionTriageInteraction *)self includeAttachmentsForCurrentPolicy];
}

- (id)_confirmLoadingRestOfMessage
{
  unint64_t v3 = [(MFMessageCompositionTriageInteraction *)self shouldLoadRestOfMessage];
  if (v3)
  {
    unsigned __int8 v4 = +[NSNumber numberWithInt:v3 == 2];
    unsigned __int8 v5 = +[EFFuture futureWithResult:v4];
  }
  else
  {
    id v6 = +[EFPromise promise];
    unsigned __int8 v7 = +[NSBundle mainBundle];
    char v8 = [v7 localizedStringForKey:@"DOWNLOAD_REST_OF_MESSAGE" value:&stru_100619928 table:@"Main"];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1001B0A50;
    v24[3] = &unk_1006079A8;
    id v9 = v6;
    id v25 = v9;
    unint64_t v10 = +[UIAlertController mf_actionSheetWithTitle:v8 cancellationHandler:v24];

    v11 = +[NSBundle mainBundle];
    id v12 = [v11 localizedStringForKey:@"YES" value:&stru_100619928 table:@"Main"];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1001B0AB0;
    v22[3] = &unk_1006079A8;
    id v13 = v9;
    id v23 = v13;
    v14 = +[UIAlertAction actionWithTitle:v12 style:0 handler:v22];
    [v10 addAction:v14];

    v15 = +[NSBundle mainBundle];
    v16 = [v15 localizedStringForKey:@"NO" value:&stru_100619928 table:@"Main"];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1001B0AC0;
    v20[3] = &unk_1006079A8;
    id v17 = v13;
    id v21 = v17;
    v18 = +[UIAlertAction actionWithTitle:v16 style:0 handler:v20];
    [v10 addAction:v18];

    [(MFTriageInteraction *)self _presentConfirmationSheet:v10];
    unsigned __int8 v5 = [v17 future];
  }

  return v5;
}

- (id)_confirmIncludingAttachments
{
  unint64_t v3 = [(MFMessageCompositionTriageInteraction *)self shouldIncludeAttachments];
  if (v3)
  {
    unsigned __int8 v4 = +[NSNumber numberWithInt:v3 == 2];
    unsigned __int8 v5 = +[EFFuture futureWithResult:v4];
  }
  else
  {
    id v6 = +[EFPromise promise];
    unsigned __int8 v7 = +[NSBundle mainBundle];
    char v8 = [v7 localizedStringForKey:@"INCLUDE_ATTACHMENTS" value:&stru_100619928 table:@"Main"];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1001B0EE4;
    v25[3] = &unk_1006079A8;
    id v9 = v6;
    id v26 = v9;
    unint64_t v10 = +[UIAlertController mf_actionSheetWithTitle:v8 cancellationHandler:v25];

    v11 = +[NSBundle mainBundle];
    id v12 = [v11 localizedStringForKey:@"YES_INCLUDE" value:&stru_100619928 table:@"Main"];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1001B0F44;
    v23[3] = &unk_1006079A8;
    id v13 = v9;
    id v24 = v13;
    v14 = +[UIAlertAction actionWithTitle:v12 style:0 handler:v23];

    v15 = +[NSBundle mainBundle];
    v16 = [v15 localizedStringForKey:@"NO_INCLUDE" value:&stru_100619928 table:@"Main"];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1001B0F54;
    v21[3] = &unk_1006079A8;
    id v17 = v13;
    id v22 = v17;
    v18 = +[UIAlertAction actionWithTitle:v16 style:0 handler:v21];

    [v10 addAction:v14];
    [v10 addAction:v18];
    v19 = [v10 title];
    [v19 setAccessibilityIdentifier:MSAccessibiltyIdentifierIncludeAttachmentsAlert];

    [v14 setAccessibilityIdentifier:MSAccessibiltyIdentifierIncludeAttachmentsAlertYesInclude];
    [v18 setAccessibilityIdentifier:MSAccessibiltyIdentifierIncludeAttachmentsAlertNoInclude];
    [(MFTriageInteraction *)self _presentConfirmationSheet:v10];
    unsigned __int8 v5 = [v17 future];
  }

  return v5;
}

- (void)_performInteractionAfterPreparation:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = [(MFMessageCompositionTriageInteraction *)self _confirmIncludingAttachments];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001B1178;
  v15[3] = &unk_10060BFD0;
  v15[4] = self;
  unsigned __int8 v7 = [v6 then:v15];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001B11F0;
  v14[3] = &unk_10060BFD0;
  v14[4] = self;
  char v8 = [v7 then:v14];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001B1264;
  v12[3] = &unk_10060A978;
  v12[4] = self;
  id v9 = v5;
  id v13 = v9;
  [v8 addSuccessBlock:v12];
  if (v9)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1001B17D0;
    v10[3] = &unk_100605A60;
    v10[4] = self;
    id v11 = v9;
    [v8 addFailureBlock:v10];
  }
}

- (void)_performInteraction_Internal
{
}

- (void)presentComposeWithContext:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    [v4 setShowKeyboardImmediately:1];
    id v6 = [(MFMessageCompositionTriageInteraction *)self scene];
    unsigned __int8 v7 = [(MFMessageCompositionTriageInteraction *)self fromAddress];

    if (v7)
    {
      char v8 = [(MFMessageCompositionTriageInteraction *)self fromAddress];
      [v5 setPreferredSendingEmailAddress:v8];
    }
    else
    {
      char v20 = 1;
      char v8 = [v6 composeAccountIsDefault:&v20];
      id v9 = [v8 emailAddresses];
      unint64_t v10 = [v9 firstObject];
      id v11 = [v10 simpleAddress];
      [v5 setPreferredSendingEmailAddress:v11];
    }
    [v5 setLoadRest:[self loadRestOfMessage]];
    [v5 setIncludeAttachments:[self promptForAttachmentsResult] == 2];
    id v12 = [(MFMessageCompositionTriageInteraction *)self loadingContext];
    [v5 setLoadingContext:v12];

    id v13 = [(MFMessageCompositionTriageInteraction *)self mailboxObjectID];
    v14 = [v13 serializedRepresentation];
    [v5 setSerializedMailboxObjectID:v14];

    v15 = [(MFMessageCompositionTriageInteraction *)self originalContent];
    id v16 = [v15 count];

    if (v16)
    {
      id v17 = [(MFMessageCompositionTriageInteraction *)self originalContent];
      [v5 setOriginalContent:v17];
    }
    unsigned int v18 = [(MFTriageInteraction *)self isTriggeredFromMenuAction];
    if (v18)
    {
      v19 = [(MFTriageInteraction *)self presentationSource];
    }
    else
    {
      v19 = 0;
    }
    [v6 showComposeWithContext:v5 animated:1 initialTitle:0 presentationSource:v19 completionBlock:0];
    if (v18) {
  }
    }
}

- (MFMailMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (MFMessageLoadingContext)loadingContext
{
  return self->_loadingContext;
}

- (void)setLoadingContext:(id)a3
{
}

- (EMDaemonInterface)daemonInterface
{
  return self->_daemonInterface;
}

- (void)setDaemonInterface:(id)a3
{
}

- (MessageContentRepresentationRequest)contentRequest
{
  return self->_contentRequest;
}

- (void)setContentRequest:(id)a3
{
}

- (NSArray)originalContent
{
  return self->_originalContent;
}

- (void)setOriginalContent:(id)a3
{
}

- (NSArray)messageSourceMailboxes
{
  return self->_messageSourceMailboxes;
}

- (void)setMessageSourceMailboxes:(id)a3
{
}

- (ComposeCapable)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  return (ComposeCapable *)WeakRetained;
}

- (void)setScene:(id)a3
{
}

- (BOOL)shouldPromptToLoadRestOfMessage
{
  return self->_shouldPromptToLoadRestOfMessage;
}

- (void)setShouldPromptToLoadRestOfMessage:(BOOL)a3
{
  self->_shouldPromptToLoadRestOfMessage = a3;
}

- (int64_t)attachmentPolicy
{
  return self->_attachmentPolicy;
}

- (void)setAttachmentPolicy:(int64_t)a3
{
  self->_attachmentPolicy = a3;
}

- (BOOL)isActingOnEML
{
  return self->_isActingOnEML;
}

- (void)setIsActingOnEML:(BOOL)a3
{
  self->_isActingOnEML = a3;
}

- (NSString)fromAddress
{
  return self->_fromAddress;
}

- (void)setFromAddress:(id)a3
{
}

- (EMMailboxObjectID)mailboxObjectID
{
  return self->_mailboxObjectID;
}

- (void)setMailboxObjectID:(id)a3
{
}

- (BOOL)loadRestOfMessage
{
  return self->_loadRestOfMessage;
}

- (void)setLoadRestOfMessage:(BOOL)a3
{
  self->_loadRestOfMessage = a3;
}

- (unint64_t)promptForAttachmentsResult
{
  return self->_promptForAttachmentsResult;
}

- (void)setPromptForAttachmentsResult:(unint64_t)a3
{
  self->_promptForAttachmentsResult = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxObjectID, 0);
  objc_storeStrong((id *)&self->_fromAddress, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_messageSourceMailboxes, 0);
  objc_storeStrong((id *)&self->_originalContent, 0);
  objc_storeStrong((id *)&self->_contentRequest, 0);
  objc_storeStrong((id *)&self->_daemonInterface, 0);
  objc_storeStrong((id *)&self->_loadingContext, 0);

  objc_storeStrong((id *)&self->_message, 0);
}

@end