@interface MFMailComposeDeliveryController
+ (OS_os_log)log;
- (BOOL)deliverMessage;
- (EMMessage)draftMessage;
- (MFMailComposeDeliveryController)initWithComposeController:(id)a3;
- (MFMailComposeDeliveryController)initWithComposeController:(id)a3 backupCompletionHandler:(id)a4;
- (MFMailMessage)originalMessage;
- (MFMailboxUid)draftMailbox;
- (MailComposeDeliveryControllerDelegate)delegate;
- (NSString)sendingAddress;
- (id)backupCompletionHandler;
- (id)error;
- (int64_t)composeType;
- (void)_deliverMessage:(id)a3;
- (void)dealloc;
- (void)deliverMessage:(id)a3;
- (void)notifyUserDeliverySucceeded:(id)a3;
- (void)setBackupCompletionHandler:(id)a3;
- (void)setComposeType:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDraftMailbox:(id)a3;
- (void)setDraftMessage:(id)a3;
- (void)setOriginalMessage:(id)a3;
- (void)setPercentDone:(double)a3;
- (void)setSendingAddress:(id)a3;
@end

@implementation MFMailComposeDeliveryController

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A4FE0;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699B30 != -1) {
    dispatch_once(&qword_100699B30, block);
  }
  v2 = (void *)qword_100699B28;

  return (OS_os_log *)v2;
}

- (MFMailComposeDeliveryController)initWithComposeController:(id)a3
{
  return [(MFMailComposeDeliveryController *)self initWithComposeController:a3 backupCompletionHandler:0];
}

- (MFMailComposeDeliveryController)initWithComposeController:(id)a3 backupCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 needsDelivery])
  {
    v36.receiver = self;
    v36.super_class = (Class)MFMailComposeDeliveryController;
    v8 = [(MFMailComposeDeliveryController *)&v36 init];
    if (v8)
    {
      if ([v6 isSavingAsDraft])
      {
        uint64_t v9 = [v6 _messageForDraft];
        futureDraft = v8->_futureDraft;
        v8->_futureDraft = (EFFuture *)v9;
      }
      else
      {
        uint64_t v12 = [v6 delivery];
        delivery = v8->_delivery;
        v8->_delivery = (MFOutgoingMessageDelivery *)v12;

        [(MFOutgoingMessageDelivery *)v8->_delivery setDelegate:v8];
      }
      v8->_isHideMyEmailMessage = [v6 isHideMyEmailMessage];
      uint64_t v14 = [v6 sendingEmailAddress];
      sendingAddress = v8->_sendingAddress;
      v8->_sendingAddress = (NSString *)v14;

      uint64_t v16 = [v6 lastDraftMessage];
      draftMessage = v8->_draftMessage;
      v8->_draftMessage = (EMMessage *)v16;

      uint64_t v18 = [v6 documentID];
      draftDocumentID = v8->_draftDocumentID;
      v8->_draftDocumentID = (NSString *)v18;

      v20 = [v6 compositionContext];
      v21 = [v20 legacyMessage];

      v22 = [v6 compositionContext];
      if (v21)
      {
        uint64_t v23 = [v22 legacyMessage];
        originalMessage = v8->_originalMessage;
        v8->_originalMessage = (MFMailMessage *)v23;
      }
      else
      {
        originalMessage = [v22 originalMessage];
        v25 = +[MailAccount outboxMailboxUid];
        uint64_t v26 = +[MFComposeMailMessage legacyMessageWithMessage:originalMessage mailboxUid:v25];
        v27 = v8->_originalMessage;
        v8->_originalMessage = (MFMailMessage *)v26;
      }
      v8->_composeType = (int64_t)[v6 compositionType];
      id v28 = objc_retainBlock(v7);
      id backupCompletionHandler = v8->_backupCompletionHandler;
      v8->_id backupCompletionHandler = v28;

      v30 = [v6 compositionContext];
      uint64_t v31 = [v30 sendLaterDate];
      sendLaterDate = v8->_sendLaterDate;
      v8->_sendLaterDate = (NSDate *)v31;

      uint64_t v33 = [v6 autosaveIdentifier];
      autosaveIdentifier = v8->_autosaveIdentifier;
      v8->_autosaveIdentifier = (NSString *)v33;
    }
    self = v8;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)dealloc
{
  [(MFOutgoingMessageDelivery *)self->_delivery setDelegate:0];
  [(EFFuture *)self->_futureDraft cancel];
  [(MFOutgoingMessage *)self->_outgoingMessage setMessageBody:0];
  v3.receiver = self;
  v3.super_class = (Class)MFMailComposeDeliveryController;
  [(MFMailComposeDeliveryController *)&v3 dealloc];
}

- (BOOL)deliverMessage
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001A5498;
  v5[3] = &unk_10060BB00;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  id v7 = &v8;
  objc_super v3 = v6;
  [(MFMailComposeDeliveryController *)self deliverMessage:v5];
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(self) = *((unsigned char *)v9 + 24);

  _Block_object_dispose(&v8, 8);
  return (char)self;
}

- (void)deliverMessage:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (atomic_exchange(&self->_isDeliveringMessage._Value, 1u))
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
  else
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1001A55D4;
    v6[3] = &unk_10060BB28;
    objc_copyWeak(&v8, &location);
    id v7 = v5;
    [(MFMailComposeDeliveryController *)self _deliverMessage:v6];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)_deliverMessage:(id)a3
{
  id v64 = a3;
  if (pthread_main_np())
  {
    v58 = +[NSAssertionHandler currentHandler];
    [v58 handleFailureInMethod:a2 object:self file:@"MFMailComposeDeliveryController.m" lineNumber:150 description:@"Current thread is main"];
  }
  v5 = +[MFActivityMonitor currentMonitor];
  dispatch_semaphore_t v6 = +[MailAccount outboxMailboxUid];
  [v5 setMailbox:v6];

  v67 = [(MFMailComposeDeliveryController *)self delegate];
  id v7 = +[UIApplication sharedApplication];
  id v8 = [v7 daemonInterface];
  uint64_t v9 = [v8 outgoingMessageRepository];

  v66 = (void *)v9;
  uint64_t v10 = [(MFOutgoingMessageDelivery *)self->_delivery compositionSpecification];
  char v11 = [v10 objectForKeyedSubscript:MFSecureMIMECompositionSpecificationRecipientCertificates];
  uint64_t v12 = [v11 allKeys];

  v62 = v12;
  if ([v12 count]
    && _os_feature_enabled_impl()
    && +[EMInternalPreferences preferenceEnabled:29])
  {
    v13 = +[UIApplication sharedApplication];
    uint64_t v14 = [v13 daemonInterface];
    v15 = [v14 messageRepository];

    uint64_t v16 = [v15 metadataForAddresses:v12];
    id v92 = 0;
    v17 = [v16 result:&v92];
    id v18 = v92;
    if ([v17 count])
    {
      v19 = [(MFOutgoingMessageDelivery *)self->_delivery compositionSpecification];
      v20 = [v19 mutableCopy];

      [v20 setObject:v17 forKeyedSubscript:MFSecureMIMECompositionSpecificationAddressMetadata];
      [(MFOutgoingMessageDelivery *)self->_delivery setCompositionSpecification:v20];
    }
    else
    {
      v20 = +[MFMailComposeDeliveryController log];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = [v18 ef_publicDescription];
        sub_10045CC30(v21, (uint64_t)v95, v20);
      }
    }
  }
  v61 = +[MailAccount accountContainingEmailAddress:self->_sendingAddress];
  v65 = [v61 mailboxUidOfType:5 createIfNeeded:1];
  id v22 = objc_alloc((Class)EMMailboxObjectID);
  uint64_t v23 = [v65 URL];
  id v68 = [v22 initWithURL:v23];

  v24 = +[MFMailComposeDeliveryController log];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v94 = v68;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Delivering message from draft: %@", buf, 0xCu);
  }

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v89[0] = _NSConcreteStackBlock;
  v89[1] = 3221225472;
  v89[2] = sub_1001A6460;
  v89[3] = &unk_100604FE8;
  objc_copyWeak(&v90, &location);
  v63 = objc_retainBlock(v89);
  if (self->_delivery)
  {
    if (objc_opt_respondsToSelector()) {
      [v67 mailComposeDeliveryControllerWillAttemptToSend:self];
    }
    if (self->_isHideMyEmailMessage)
    {
      v25 = +[MFMailComposeDeliveryController log];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = [(MFOutgoingMessageDelivery *)self->_delivery originalMessageObjectID];
        *(_DWORD *)buf = 138543362;
        id v94 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Not updating CoreRecents library as message:<%{public}@> is HME message.", buf, 0xCu);
      }
    }
    else
    {
      v25 = [(objc_class *)off_1006907B8() defaultInstance];
      v37 = [(MFOutgoingMessageDelivery *)self->_delivery originalHeaders];
      [v25 recordContactEventsForHeaders:v37 recentsDomain:kMFMobileMailBundleIdentifier];
    }
    id v38 = +[EDConversationPersistence conversationNotificationLevelForConversationFlags:[(MFOutgoingMessageDelivery *)self->_delivery conversationFlags]];
    objc_opt_class();
    int isKindOfClass = objc_opt_isKindOfClass();
    v40 = [(MFOutgoingMessageDelivery *)self->_delivery message];
    v60 = [(MFOutgoingMessageDelivery *)self->_delivery originalMessageObjectID];
    v41 = [(MFOutgoingMessageDelivery *)self->_delivery compositionSpecification];
    v42 = [v41 objectForKeyedSubscript:MFSecureMIMECompositionSpecificationShouldEncrypt];
    uint64_t v43 = [v41 objectForKeyedSubscript:MFSecureMIMECompositionSpecificationShouldSign];
    v44 = (void *)v43;
    v59 = (void *)v43;
    if (v42)
    {
      unsigned __int8 v45 = [v42 BOOLValue];
      if (v44)
      {
LABEL_30:
        unsigned __int8 v46 = [v44 BOOLValue];
LABEL_33:
        id v47 = objc_alloc((Class)EMOutgoingMessage);
        v82[0] = _NSConcreteStackBlock;
        v82[1] = 3221225472;
        v82[2] = sub_1001A64F4;
        v82[3] = &unk_10060BB50;
        id v32 = v40;
        id v83 = v32;
        v84 = self;
        id v34 = v60;
        unsigned __int8 v87 = v46;
        unsigned __int8 v88 = v45;
        id v85 = v34;
        id v86 = v38;
        id v48 = [v47 initWithBuilder:v82];
        if (self->_sendLaterDate)
        {
          v49 = +[MFMailComposeDeliveryController log];
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v94 = v68;
            _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Draft message: %@ will be sent on a send later date", buf, 0xCu);
          }

          v50 = [v66 saveSendLaterMessage:v48 sendLaterDate:self->_sendLaterDate];
          v51 = +[EFScheduler mainThreadScheduler];
          v78[0] = _NSConcreteStackBlock;
          v78[1] = 3221225472;
          v78[2] = sub_1001A65C0;
          v78[3] = &unk_10060BB78;
          id v79 = v66;
          v80[0] = v68;
          v80[1] = self;
          id v52 = v64;
          id v81 = v52;
          [v50 onScheduler:v51 addSuccessBlock:v78];

          v76[0] = _NSConcreteStackBlock;
          v76[1] = 3221225472;
          v76[2] = sub_1001A669C;
          v76[3] = &unk_100604DB8;
          id v77 = v52;
          [v50 addFailureBlock:v76];
          v53 = &v79;
          v54 = (id *)v80;
          v55 = &v81;
          v56 = &v77;
        }
        else
        {
          v50 = [v66 deliverMessage:v48 usingMailDrop:isKindOfClass & 1 isCancelable:_os_feature_enabled_impl() & (isKindOfClass ^ 1)];
          v69[0] = _NSConcreteStackBlock;
          v69[1] = 3221225472;
          v69[2] = sub_1001A677C;
          v69[3] = &unk_10060BBE8;
          id v70 = v68;
          v71[0] = v66;
          v71[1] = self;
          id v72 = v48;
          id v73 = v67;
          v74 = v63;
          id v75 = v64;
          [v50 addSuccessBlock:v69];

          v53 = &v70;
          v54 = (id *)v71;
          v55 = &v72;
          v56 = &v73;
        }

LABEL_39:
        goto LABEL_40;
      }
    }
    else
    {
      unsigned __int8 v45 = 0;
      if (v43) {
        goto LABEL_30;
      }
    }
    unsigned __int8 v46 = 0;
    goto LABEL_33;
  }
  v27 = [(EFFuture *)self->_futureDraft result:0];
  outgoingMessage = self->_outgoingMessage;
  self->_outgoingMessage = v27;

  if (v27)
  {
    v29 = +[MFMailComposeDeliveryController log];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v94 = v68;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Creating future for outgoingMessage: %@", buf, 0xCu);
    }

    id v30 = objc_alloc((Class)EMOutgoingMessage);
    uint64_t v31 = [(MFOutgoingMessage *)self->_outgoingMessage messageData];
    id v32 = [v30 initWithMessageData:v31];

    uint64_t v33 = [(EMMessage *)self->_draftMessage objectID];
    id v34 = [v66 saveDraftMessage:v32 mailboxObjectID:v68 previousDraftObjectID:v33];

    id v35 = [v34 result:0];
    if (objc_opt_respondsToSelector()) {
      [v67 mailComposeDeliveryControllerDidAttemptToSaveDraft:self account:v61 result:1];
    }
    id backupCompletionHandler = (void (**)(id, uint64_t))self->_backupCompletionHandler;
    if (backupCompletionHandler) {
      backupCompletionHandler[2](backupCompletionHandler, 1);
    }
    ((void (*)(void))v63[2])();
    (*((void (**)(id, uint64_t))v64 + 2))(v64, 1);
    goto LABEL_39;
  }
  v57 = +[MFMailComposeDeliveryController log];
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v94 = v68;
    _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Failed to deliver draft message: %@", buf, 0xCu);
  }

  (*((void (**)(id, void))v64 + 2))(v64, 0);
LABEL_40:

  objc_destroyWeak(&v90);
  objc_destroyWeak(&location);
}

- (id)error
{
  return self->_error;
}

- (void)setPercentDone:(double)a3
{
  id v6 = +[MFActivityMonitor currentMonitor];
  id v4 = MFLookupLocalizedString();
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, 10);
  [v6 setStatusMessage:v5 percentDone:a3];
}

- (void)notifyUserDeliverySucceeded:(id)a3
{
  id v3 = +[MFActivityMonitor currentMonitor];
  [v3 reset];
}

- (MailComposeDeliveryControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MailComposeDeliveryControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)sendingAddress
{
  return self->_sendingAddress;
}

- (void)setSendingAddress:(id)a3
{
}

- (MFMailboxUid)draftMailbox
{
  return self->_draftMailbox;
}

- (void)setDraftMailbox:(id)a3
{
}

- (MFMailMessage)originalMessage
{
  return self->_originalMessage;
}

- (void)setOriginalMessage:(id)a3
{
}

- (int64_t)composeType
{
  return self->_composeType;
}

- (void)setComposeType:(int64_t)a3
{
  self->_composeType = a3;
}

- (id)backupCompletionHandler
{
  return self->_backupCompletionHandler;
}

- (void)setBackupCompletionHandler:(id)a3
{
}

- (EMMessage)draftMessage
{
  return self->_draftMessage;
}

- (void)setDraftMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_draftMessage, 0);
  objc_storeStrong(&self->_backupCompletionHandler, 0);
  objc_storeStrong((id *)&self->_originalMessage, 0);
  objc_storeStrong((id *)&self->_draftMailbox, 0);
  objc_storeStrong((id *)&self->_sendingAddress, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_futureDraft, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_sendLaterDate, 0);
  objc_storeStrong((id *)&self->_draftDocumentID, 0);
  objc_storeStrong((id *)&self->_autosaveIdentifier, 0);
  objc_storeStrong((id *)&self->_outgoingMessage, 0);

  objc_storeStrong((id *)&self->_delivery, 0);
}

@end