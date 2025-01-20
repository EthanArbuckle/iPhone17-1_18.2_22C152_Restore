@interface MFDADelivery
+ (OS_os_log)log;
- (id)deliverSynchronously;
- (id)newMessageWriter;
- (void)_updateBasedOnOriginalMessage:(id)a3;
- (void)setDAMailAccount:(id)a3;
@end

@implementation MFDADelivery

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __19__MFDADelivery_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken != -1) {
    dispatch_once(&log_onceToken, block);
  }
  v2 = (void *)log_log;
  return (OS_os_log *)v2;
}

void __19__MFDADelivery_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log;
  log_log = (uint64_t)v1;
}

- (void)setDAMailAccount:(id)a3
{
}

- (id)newMessageWriter
{
  v4.receiver = self;
  v4.super_class = (Class)MFDADelivery;
  id v2 = [(MFMailDelivery *)&v4 newMessageWriter];
  [v2 setAllowsQuotedPrintable:0];
  return v2;
}

- (id)deliverSynchronously
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  v37 = objc_alloc_init(MFDADeliveryConsumer);
  v34 = +[MFActivityMonitor currentMonitor];
  id v3 = MFUserAgent();
  [v3 networkActivityStarted:self];

  objc_super v4 = [(MFMailDelivery *)self message];
  v36 = [v4 messageIDHeaderInFortyBytesOrLess];

  v5 = [(MFMailDelivery *)self originalMessage];

  if (v5)
  {
    v6 = [(MFMailDelivery *)self originalMessage];
    [(MFDADelivery *)self _updateBasedOnOriginalMessage:v6];
  }
  if ([(MFMailDelivery *)self action])
  {
    if ([(MFMailDelivery *)self action] == 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 2;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  if ([(MFMailDelivery *)self shouldSign]) {
    int v8 = 0;
  }
  else {
    int v8 = ![(MFMailDelivery *)self shouldEncrypt];
  }
  double Current = CFAbsoluteTimeGetCurrent();
  v10 = [(MFMailDelivery *)self message];
  v35 = [v10 messageDataHolder];

  v11 = +[MFDADelivery log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    folderID = self->_folderID;
    originalMessageID = self->_originalMessageID;
    originalLongID = self->_originalLongID;
    *(_DWORD *)buf = 67241218;
    int v42 = v7;
    __int16 v43 = 2114;
    v44 = folderID;
    __int16 v45 = 2114;
    v46 = originalMessageID;
    __int16 v47 = 2114;
    v48 = originalLongID;
    __int16 v49 = 1026;
    int v50 = v8;
    _os_log_impl(&dword_1A7EFF000, v11, OS_LOG_TYPE_DEFAULT, "Sending message with type: %{public}u, folderID: %{public}@, originalMessageID: %{public}@, originalLongID: %{public}@, useSmartTask: %{public}d", buf, 0x2Cu);
  }

  v15 = [self->_DAMailAccount accountConduit];
  v16 = [v35 data];
  v17 = self->_folderID;
  v18 = self->_originalMessageID;
  v19 = self->_originalLongID;
  accountID = self->_accountID;
  BYTE1(v33) = [(MFMailDelivery *)self isUserRequested];
  LOBYTE(v33) = v8;
  objc_msgSend(v15, "sendMessageWithRFC822Data:messageID:outgoingMessageType:originalMessageFolderID:originalMessageItemID:originalMessageLongID:originalAccountID:useSmartTasksIfPossible:isUserRequested:consumer:context:", v16, v36, v7, v17, v18, v19, accountID, v33, v37, 0);

  [(MFDAMailAccountConsumer *)v37 waitUntilDone];
  double v21 = CFAbsoluteTimeGetCurrent();
  v22 = [(MFDADeliveryConsumer *)v37 error];
  [v34 setError:v22];

  v23 = MFUserAgent();
  [v23 networkActivityEnded:self];

  v24 = [[MFDeliveryResult alloc] initWithStatus:[(MFDADeliveryConsumer *)v37 status]];
  v25 = self->super._result;
  self->super._result = v24;

  [(MFDeliveryResult *)self->super._result setDuration:v21 - Current];
  [(MFDeliveryResult *)self->super._result setBytesSent:[(MFDADeliveryConsumer *)v37 bytesWritten]];
  if (!v7
    && [self->_DAMailAccount supportsThreadOperations]
    && [(MFMailDelivery *)self conversationFlags])
  {
    v26 = [self->_DAMailAccount mailboxUidOfType:4 createIfNeeded:0];
    v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
    DAMailAccount = self->_DAMailAccount;
    v38 = v26;
    v39 = @"MailAccountContentsDidChangeUids";
    v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
    v40 = v29;
    v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    [v27 postNotificationName:@"MailAccountContentsDidChange" object:DAMailAccount userInfo:v30];
  }
  v31 = self->super._result;

  return v31;
}

- (void)_updateBasedOnOriginalMessage:(id)a3
{
  id v24 = a3;
  objc_super v4 = [v24 messageStore];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v24;
    v6 = [v5 DAMailMessage];
    uint64_t v7 = [v6 longID];
    originalLongID = self->_originalLongID;
    self->_originalLongID = v7;

    v9 = [v5 DAMailMessage];
    v10 = [v9 remoteID];
    originalMessageID = self->_originalMessageID;
    self->_originalMessageID = v10;

    id v12 = [v5 DAMailMessage];
    v13 = [v12 folderID];
    goto LABEL_3;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v15 = v24;
  if (isKindOfClass)
  {
    id v17 = v24;
    if ([v17 isSearchResultWithBogusRemoteId])
    {
      v18 = [v17 remoteID];
      id v12 = self->_originalLongID;
      self->_originalLongID = v18;
      goto LABEL_4;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_5;
    }
    id v12 = v4;
    v22 = [v17 remoteID];
    v23 = self->_originalMessageID;
    self->_originalMessageID = v22;

    v13 = [v12 folderIDForFetching];
LABEL_3:
    folderID = self->_folderID;
    self->_folderID = v13;

LABEL_4:
LABEL_5:

    v15 = v24;
  }
  v19 = [v15 account];
  v20 = [v19 uniqueID];
  accountID = self->_accountID;
  self->_accountID = v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalLongID, 0);
  objc_storeStrong((id *)&self->_originalMessageID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_folderID, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_DAMailAccount, 0);
}

@end