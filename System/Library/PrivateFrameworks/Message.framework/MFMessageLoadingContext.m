@interface MFMessageLoadingContext
+ (id)log;
+ (unint64_t)_nextOffsetForOffset:(unint64_t)a3 totalLength:(unint64_t)a4 requestedAmount:(unint64_t)a5;
- (BOOL)hasLoadedBestAlternativePart;
- (BOOL)hasLoadedCompleteMessage;
- (BOOL)hasLoadedSomeContent;
- (BOOL)isDraftMessage;
- (BOOL)isEditableMessage;
- (BOOL)isOutgoingMessage;
- (EFObservable)contentObservable;
- (MFAttachmentManager)attachmentManager;
- (MFMailMessage)message;
- (MFMessageLoadingContext)initWithMessage:(id)a3 attachmentManager:(id)a4;
- (MFMimeBody)messageBody;
- (MFMimePart)loadedPart;
- (NSString)description;
- (id)_reallyLoad:(int64_t)a3 shouldDownload:(BOOL)a4;
- (id)addLoadObserver:(id)a3;
- (id)onScheduler:(id)a3 addLoadObserver:(id)a4;
- (unint64_t)contentOffset;
- (void)_load:(int64_t)a3 shouldDownload:(BOOL)a4;
- (void)_setAttachmentManager:(id)a3;
- (void)_setMessage:(id)a3;
- (void)_setMessageBody:(id)a3;
- (void)_setupMeetingData;
- (void)_setupObservableStreams;
- (void)assignAttachmentManagerToContent:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)load:(int64_t)a3;
- (void)load:(int64_t)a3 scheduler:(id)a4;
- (void)load:(int64_t)a3 scheduler:(id)a4 shouldDownload:(BOOL)a5;
- (void)processMeetingInvitations:(id)a3;
- (void)setContentOffset:(unint64_t)a3;
- (void)setHasLoadedBestAlternativePart:(BOOL)a3;
- (void)setHasLoadedCompleteMessage:(BOOL)a3;
- (void)setHasLoadedSomeContent:(BOOL)a3;
- (void)setLoadedPart:(id)a3;
@end

@implementation MFMessageLoadingContext

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__MFMessageLoadingContext_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_23 != -1) {
    dispatch_once(&log_onceToken_23, block);
  }
  v2 = (void *)log_log_23;
  return v2;
}

void __30__MFMessageLoadingContext_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_23;
  log_log_23 = (uint64_t)v1;
}

- (void)dealloc
{
  [(EFCancelationToken *)self->_cancelable cancel];
  v3.receiver = self;
  v3.super_class = (Class)MFMessageLoadingContext;
  [(MFMessageLoadingContext *)&v3 dealloc];
}

- (MFMessageLoadingContext)initWithMessage:(id)a3 attachmentManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MFMessageLoadingContext;
  v9 = [(MFMessageLoadingContext *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_message, a3);
    objc_storeStrong((id *)&v10->_attachmentManager, a4);
    v11 = [v7 messageStore];
    v12 = [v11 mailbox];

    uint64_t v13 = [v12 mailboxType];
    v10->_outgoingMessage = [v12 isOutgoingMailboxUid];
    v10->_draftMessage = v13 == 5;
    v10->_editableMessage = (unint64_t)(v13 - 5) < 2;
    [(MFMessageLoadingContext *)v10 _setupMeetingData];
    [(MFMessageLoadingContext *)v10 _setupObservableStreams];
  }
  return v10;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %p> %@", objc_opt_class(), self, self->_message];
}

- (void)_setupMeetingData
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_ERROR, "unable to get an event with external id %@ after it was successfully reconstituted.", (uint8_t *)&v2, 0xCu);
}

- (void)_setupObservableStreams
{
  if (self->_inputObservable)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"MFMessageLoadingContext.m" lineNumber:222 description:@"_inputObservable must not already be configured"];
  }
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v3 = [MEMORY[0x1E4F60DD8] observableObserver];
  inputObservable = self->_inputObservable;
  self->_inputObservable = v3;

  v5 = [(EFObserver *)self->_inputObservable replay:1];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __50__MFMessageLoadingContext__setupObservableStreams__block_invoke;
  v17 = &unk_1E5D400D8;
  objc_copyWeak(&v18, &location);
  v6 = [v5 filter:&v14];
  contentObservable = self->_contentObservable;
  self->_contentObservable = v6;

  id v8 = (EFCancelationToken *)objc_alloc_init(MEMORY[0x1E4F60D40]);
  cancelable = self->_cancelable;
  self->_cancelable = v8;

  v10 = self->_cancelable;
  v11 = objc_msgSend(v5, "connect", v14, v15, v16, v17);
  [(EFCancelationToken *)v10 addCancelable:v11];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

uint64_t __50__MFMessageLoadingContext__setupObservableStreams__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = [v3 content];
  [WeakRetained assignAttachmentManagerToContent:v5];

  v6 = [v3 content];
  [WeakRetained processMeetingInvitations:v6];

  return 1;
}

- (void)cancel
{
}

- (id)onScheduler:(id)a3 addLoadObserver:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__MFMessageLoadingContext_onScheduler_addLoadObserver___block_invoke;
  aBlock[3] = &unk_1E5D3F960;
  id v8 = v7;
  id v21 = v8;
  v9 = _Block_copy(aBlock);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __55__MFMessageLoadingContext_onScheduler_addLoadObserver___block_invoke_2;
  v17[3] = &unk_1E5D40100;
  id v10 = v9;
  id v18 = v10;
  id v11 = v8;
  id v19 = v11;
  v12 = _Block_copy(v17);
  uint64_t v13 = [MEMORY[0x1E4F60DE0] observerWithResultBlock:v12 completionBlock:0 failureBlock:v10];
  uint64_t v14 = [(EFObservable *)self->_contentObservable observeOn:v6];
  uint64_t v15 = [v14 subscribe:v13];

  [(EFCancelationToken *)self->_cancelable addCancelable:v15];
  return v15;
}

uint64_t __55__MFMessageLoadingContext_onScheduler_addLoadObserver___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __55__MFMessageLoadingContext_onScheduler_addLoadObserver___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 content];

  if (v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = [v6 error];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

- (id)addLoadObserver:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F60F28] immediateScheduler];
  id v6 = [(MFMessageLoadingContext *)self onScheduler:v5 addLoadObserver:v4];

  return v6;
}

- (void)load:(int64_t)a3
{
  id v5 = [MEMORY[0x1E4F60F28] globalAsyncSchedulerWithQualityOfService:25];
  -[MFMessageLoadingContext load:scheduler:](self, "load:scheduler:", a3);
}

- (void)load:(int64_t)a3 scheduler:(id)a4
{
}

- (void)load:(int64_t)a3 scheduler:(id)a4 shouldDownload:(BOOL)a5
{
  id v8 = a4;
  [(MFMessageLoadingContext *)self setHasLoadedSomeContent:1];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__MFMessageLoadingContext_load_scheduler_shouldDownload___block_invoke;
  v9[3] = &unk_1E5D40128;
  v9[4] = self;
  v9[5] = a3;
  BOOL v10 = a5;
  [v8 performVoucherPreservingBlock:v9];
}

uint64_t __57__MFMessageLoadingContext_load_scheduler_shouldDownload___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _load:*(void *)(a1 + 40) shouldDownload:*(unsigned __int8 *)(a1 + 48)];
}

+ (unint64_t)_nextOffsetForOffset:(unint64_t)a3 totalLength:(unint64_t)a4 requestedAmount:(unint64_t)a5
{
  if (!(a5 | a3)) {
    return 1;
  }
  if (a5)
  {
    unint64_t v5 = a5 + a3;
    BOOL v6 = a5 + a3 >= a4;
  }
  else
  {
    unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
    BOOL v6 = a3 >= 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v6) {
    return a4;
  }
  else {
    return v5;
  }
}

- (void)_load:(int64_t)a3 shouldDownload:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [MEMORY[0x1E4F29060] currentThread];
  id v14 = [v7 threadDictionary];

  uint64_t v8 = *MEMORY[0x1E4F73450];
  v9 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F73450]];
  BOOL v10 = [MEMORY[0x1E4F28ED0] numberWithBool:v4];
  [v14 setObject:v10 forKeyedSubscript:v8];

  id v11 = [(MFMessageLoadingContext *)self _reallyLoad:a3 shouldDownload:v4];
  char v12 = [(EFCancelationToken *)self->_cancelable isCanceled];
  if (v11) {
    char v13 = v12;
  }
  else {
    char v13 = 1;
  }
  if ((v13 & 1) == 0) {
    [(EFObserver *)self->_inputObservable observerDidReceiveResult:v11];
  }
  if (v9) {
    [v14 setObject:v9 forKey:v8];
  }
}

- (id)_reallyLoad:(int64_t)a3 shouldDownload:(BOOL)a4
{
  BOOL v104 = a4;
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  if ([(EFCancelationToken *)self->_cancelable isCanceled])
  {
    v103 = 0;
    goto LABEL_67;
  }
  v103 = objc_alloc_init(MFMessageLoadingContextEvent);
  [(MFMessageLoadingContextEvent *)v103 setContext:self];
  v106 = [(MFMessageLoadingContext *)self message];
  id v7 = [(MFMessageLoadingContext *)self messageBody];
  uint64_t v8 = +[MFActivityMonitor pushNewMonitor];
  cancelable = self->_cancelable;
  v111[0] = MEMORY[0x1E4F143A8];
  v111[1] = 3221225472;
  v111[2] = __54__MFMessageLoadingContext__reallyLoad_shouldDownload___block_invoke;
  v111[3] = &unk_1E5D3B5C0;
  id v95 = v8;
  id v112 = v95;
  [(EFCancelationToken *)cancelable addCancelationBlock:v111];
  BOOL v10 = +[MFActivityMonitor currentMonitor];
  v99 = self;
  [v10 recordTransportType:1];

  if (v7 && v104)
  {
    id v11 = v7;
    char v12 = self;
  }
  else
  {
    if (v104)
    {
      char v13 = +[MFMessageLoadingContext log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7EFF000, v13, OS_LOG_TYPE_DEFAULT, "Download supported, getting body", buf, 2u);
      }

      uint64_t v14 = [v106 messageBody];
    }
    else
    {
      uint64_t v15 = +[MFMessageLoadingContext log];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7EFF000, v15, OS_LOG_TYPE_DEFAULT, "Download not supported, getting body if available", buf, 2u);
      }

      uint64_t v14 = [v106 messageBodyIfAvailable];
    }
    v97 = (void *)v14;

    id v11 = v97;
    char v12 = self;
    if (v97)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v90 = [MEMORY[0x1E4F28B00] currentHandler];
        [v90 handleFailureInMethod:a2 object:self file:@"MFMessageLoadingContext.m" lineNumber:355 description:@"body must be a MIME body"];

        id v11 = v97;
        char v12 = self;
      }
    }
    [(MFMessageLoadingContext *)v12 _setMessageBody:v11];
    if (!v11)
    {
      v59 = +[MFMessageLoadingContext log];
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        v60 = [v106 messageID];
        -[MFMessageLoadingContext _reallyLoad:shouldDownload:](v60, buf, v59);
      }

      -[MFMessageLoadingContextEvent setTransportType:](v103, "setTransportType:", [v95 transportType]);
      v61 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5FCD0] code:2050 userInfo:0];
      [(MFMessageLoadingContextEvent *)v103 setError:v61];

      +[MFActivityMonitor destroyMonitor];
      v62 = v103;
      v98 = 0;
      goto LABEL_66;
    }
  }
  unint64_t v110 = 0;
  v98 = v11;
  uint64_t v102 = objc_msgSend((id)objc_opt_class(), "_nextOffsetForOffset:totalLength:requestedAmount:", -[MFMessageLoadingContext contentOffset](v12, "contentOffset"), objc_msgSend(v11, "totalTextSize"), 0);
  v105 = [v11 topLevelPart];
  id v16 = 0;
  v17 = 0;
  id v18 = 0;
  unsigned __int8 v109 = 0;
  uint64_t v19 = *MEMORY[0x1E4F5FCD0];
  BOOL v20 = 1;
  do
  {
    if (!v20)
    {
      uint64_t v21 = [v18 contentToOffset:v102 resultOffset:&v110 downloadIfNecessary:v104 asHTML:1 isComplete:&v109];

      id v22 = v18;
      v17 = v22;
      id v16 = (id)v21;
    }
    if (a3 < 1)
    {
      uint64_t v23 = [v106 defaultAlternativeInPart:v105];
    }
    else
    {
      uint64_t v23 = [v106 bestAlternativeInPart:v105];

      if (!v17 || (void *)v23 != v17) {
        goto LABEL_27;
      }
      if (!_contentLoadedEmptyDocument(v16, v110))
      {
        id v18 = v17;
        goto LABEL_28;
      }

      unint64_t v110 = 0;
      uint64_t v24 = [MEMORY[0x1E4F28C58] errorWithDomain:v19 code:2050 userInfo:0];
      [(MFMessageLoadingContextEvent *)v103 setError:v24];
      uint64_t v23 = 0;
      v17 = 0;
      id v16 = 0;
      a3 = -1;
      id v18 = (void *)v24;
    }

LABEL_27:
    id v18 = (void *)v23;
LABEL_28:
    BOOL v20 = v18 == 0;
  }
  while (!v18 || v18 != v17);
  [(MFMessageLoadingContext *)self setLoadedPart:v18];
  [(MFMessageLoadingContext *)self setContentOffset:v110];
  uint64_t v25 = [v18 rfc822DecodedMessageBody];
  v26 = (void *)v25;
  v27 = v98;
  if (v25) {
    v27 = (void *)v25;
  }
  id v96 = v27;

  v28 = [v96 attachments];
  v108[0] = MEMORY[0x1E4F143A8];
  v108[1] = 3221225472;
  v108[2] = __54__MFMessageLoadingContext__reallyLoad_shouldDownload___block_invoke_138;
  v108[3] = &unk_1E5D40150;
  v108[4] = self;
  v94 = objc_msgSend(v28, "ef_map:", v108);

  v29 = self;
  if ([v94 count])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v30 = _os_activity_create(&dword_1A7EFF000, "Load attachment", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
      memset(buf, 170, 16);
      os_activity_scope_enter(v30, (os_activity_scope_state_t)buf);
      v31 = [(MFMessageLoadingContext *)self attachmentManager];
      [v31 insertMessageAttachmentMetadataToPersistence:v94 forMessage:v106];

      v32 = EDAttachmentsLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        int v116 = 138543362;
        v117 = v94;
        _os_log_impl(&dword_1A7EFF000, v32, OS_LOG_TYPE_DEFAULT, "Loading attachments %{public}@", (uint8_t *)&v116, 0xCu);
      }

      os_activity_scope_leave((os_activity_scope_state_t)buf);
      v29 = self;
    }
  }
  LOBYTE(v116) = 0;
  unsigned __int8 v107 = 0;
  [v96 numberOfAttachmentsSigned:&v116 encrypted:&v107];
  uint64_t v33 = [(MFMailMessage *)v29->_message messageFlags];
  if ((_BYTE)v116 && (v33 & 0x800000) == 0 || v107 && (v33 & 8) == 0)
  {
    LOBYTE(v116) = v116 | ((v33 & 0x800000) != 0);
    v107 |= (v33 & 8) != 0;
    uint64_t v34 = [v106 numberOfAttachments];
    [v106 setNumberOfAttachments:v34 isSigned:v116 isEncrypted:v107];
  }
  if (_contentLoadedEmptyDocument(v16, v110))
  {
    [(MFMessageLoadingContextEvent *)v103 setContent:MEMORY[0x1E4F1CBF0]];
    [(MFMessageLoadingContext *)v29 setHasLoadedSomeContent:1];
    goto LABEL_46;
  }
  id v16 = v16;
  v36 = [v16 firstObject];
  if ([v16 count] == 1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v37 = [v36 error];
    int v38 = 1;
  }
  else
  {
    id v37 = 0;
    int v38 = 0;
  }

  id v93 = v37;
  if (v38)
  {
    [(MFMessageLoadingContext *)self setHasLoadedSomeContent:0];
    -[MFMessageLoadingContextEvent setTransportType:](v103, "setTransportType:", [v95 transportType]);
    [(MFMessageLoadingContextEvent *)v103 setError:v93];
    +[MFActivityMonitor destroyMonitor];
    v39 = v103;

    goto LABEL_65;
  }
  id v40 = v96;
  if ([v16 count])
  {
    id v41 = 0;
    BOOL v42 = 0;
  }
  else
  {
    id v91 = v40;
    v63 = [v40 topLevelPart];
    v64 = [v63 SMIMEError];

    v65 = [v64 domain];
    if ([@"MFMessageErrorDomain" isEqualToString:v65])
    {
      BOOL v42 = [v64 code] == 1035;

      if (v42)
      {
        id v41 = v64;
        BOOL v42 = 1;
      }
      else
      {
        id v41 = 0;
      }
    }
    else
    {

      id v41 = 0;
      BOOL v42 = 0;
    }

    id v40 = v91;
  }

  id v66 = v41;
  if (v42)
  {
    [(MFMessageLoadingContext *)self setHasLoadedSomeContent:0];
    -[MFMessageLoadingContextEvent setTransportType:](v103, "setTransportType:", [v95 transportType]);
    [(MFMessageLoadingContextEvent *)v103 setError:v66];
    +[MFActivityMonitor destroyMonitor];
    v67 = v103;

    goto LABEL_65;
  }
  int v68 = [v18 isHTML];
  if (a3 < 1) {
    int v69 = v68;
  }
  else {
    int v69 = 0;
  }
  id v92 = v66;
  if (v69 != 1 || [(MFMessageLoadingContext *)self contentOffset] >> 14 > 2 || v109) {
    goto LABEL_120;
  }
  unint64_t v100 = [v16 count];
  unint64_t v70 = 0;
  unint64_t v71 = 0;
  v101 = v16;
  while (v109 || v70 >= v100)
  {
LABEL_111:
    unint64_t v84 = +[MFMessageLoadingContext _nextOffsetForOffset:totalLength:requestedAmount:](MFMessageLoadingContext, "_nextOffsetForOffset:totalLength:requestedAmount:", -[MFMessageLoadingContext contentOffset](v99, "contentOffset", v92), [v98 totalTextSize], 0x4000);
    id v16 = [v18 contentToOffset:v84 resultOffset:&v110 downloadIfNecessary:v104 asHTML:1 isComplete:&v109];

    [(MFMessageLoadingContext *)v99 setContentOffset:v110];
    if (v102 != v84)
    {
      v101 = v16;
      uint64_t v102 = v84;
      if (v110 < 0xC000) {
        continue;
      }
    }
    goto LABEL_120;
  }
  char v73 = 0;
  while (2)
  {
    v74 = objc_msgSend(v101, "objectAtIndex:", v70, v92);
    if (objc_opt_respondsToSelector())
    {
      id v75 = [v74 htmlData];
      v76 = (char *)[v75 bytes];
      size_t v77 = [v75 length];
      if (!v76)
      {
        v80 = 0;
        goto LABEL_105;
      }
      size_t v78 = v77;
      v79 = (const char *)memchr(v76, 60, v77);
      if (v79)
      {
        v80 = v79;
        v81 = &v76[v78];
        while (1)
        {
          int v82 = *((unsigned __int8 *)v80 + 5);
          if ((v82 == 62 || v82 == 32) && !strncasecmp(v80 + 1, "body", 4uLL)) {
            break;
          }
          v80 = (const char *)memchr((void *)(v80 + 1), 60, v81 - (v80 + 1));
          if (!v80) {
            goto LABEL_101;
          }
        }
LABEL_105:
        uint64_t v83 = v80 - v76;
        char v73 = 1;
      }
      else
      {
LABEL_101:
        uint64_t v83 = [v75 length];
        char v73 = 0;
      }

      v71 += v83;
    }
    else if (objc_opt_respondsToSelector())
    {
      v71 += [v74 encodedFileSize];
    }

    ++v70;
    if ((v73 & 1) == 0 && !v109 && v70 < v100) {
      continue;
    }
    break;
  }
  if ((v73 & 1) == 0) {
    goto LABEL_111;
  }
  if (v71 < 0x401)
  {
    id v16 = v101;
  }
  else
  {
    uint64_t v85 = [(MFMessageLoadingContext *)v99 contentOffset];
    uint64_t v86 = [v98 totalTextSize];
    if (v71 <= 0x1F58) {
      uint64_t v87 = 8024;
    }
    else {
      uint64_t v87 = v71;
    }
    objc_msgSend(v18, "contentToOffset:resultOffset:downloadIfNecessary:asHTML:isComplete:", +[MFMessageLoadingContext _nextOffsetForOffset:totalLength:requestedAmount:](MFMessageLoadingContext, "_nextOffsetForOffset:totalLength:requestedAmount:", v85, v86, v87), &v110, v104, 1, &v109);
    id v16 = (id)objc_claimAutoreleasedReturnValue();

    [(MFMessageLoadingContext *)v99 setContentOffset:v110];
  }
LABEL_120:
  v88 = v92;
  -[MFMessageLoadingContextEvent setContent:](v103, "setContent:", v16, v92);
  if (v110) {
    BOOL v89 = [v16 count] != 0;
  }
  else {
    BOOL v89 = 0;
  }
  [(MFMessageLoadingContext *)v99 setHasLoadedSomeContent:v89];

  v29 = v99;
LABEL_46:
  if (v109)
  {
    int v35 = 1;
  }
  else
  {
    unint64_t v43 = [v18 totalTextSize];
    unint64_t v44 = [(MFMessageLoadingContext *)v29 contentOffset];
    if (v43 >= v44) {
      unint64_t v45 = v43 - v44;
    }
    else {
      unint64_t v45 = 0;
    }
    [(MFMessageLoadingContextEvent *)v103 setRemainingBytes:v45];
    v46 = +[MFMessageLoadingContext log];
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      v47 = [(MFMessageLoadingContext *)v99 message];
      v48 = objc_msgSend(v47, "ef_publicDescription");
      uint64_t v49 = [(MFMessageLoadingContextEvent *)v103 remainingBytes];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v48;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v49;
      _os_log_impl(&dword_1A7EFF000, v46, OS_LOG_TYPE_DEFAULT, "Body download not complete for message %{public}@. Remaining bytes: %ld", buf, 0x16u);
    }
    int v35 = v109;
  }
  [(MFMessageLoadingContextEvent *)v103 setHasLoadedCompleteBody:v35 != 0];
  v50 = [v106 bestAlternativeInPart:v105];
  [(MFMessageLoadingContextEvent *)v103 setHasLoadedBestAlternativePart:v18 == v50];

  [(MFMessageLoadingContextEvent *)v103 setLoadedPart:v18];
  [(MFMessageLoadingContextEvent *)v103 setLoadedBody:v96];
  -[MFMessageLoadingContextEvent setTransportType:](v103, "setTransportType:", [v95 transportType]);
  [(MFMessageLoadingContext *)v99 setHasLoadedCompleteMessage:v109];
  [(MFMessageLoadingContext *)v99 setHasLoadedBestAlternativePart:[(MFMessageLoadingContextEvent *)v103 hasLoadedBestAlternativePart]];
  v51 = +[MFMessageLoadingContext log];
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    v52 = [(MFMessageLoadingContext *)v99 message];
    v53 = objc_msgSend(v52, "ef_publicDescription");
    int v54 = v109;
    BOOL v55 = [(MFMessageLoadingContextEvent *)v103 hasLoadedBestAlternativePart];
    uint64_t v56 = [(MFMessageLoadingContextEvent *)v103 transportType];
    *(_DWORD *)buf = 138544130;
    *(void *)&buf[4] = v53;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v54;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v55;
    __int16 v114 = 2048;
    uint64_t v115 = v56;
    _os_log_impl(&dword_1A7EFF000, v51, OS_LOG_TYPE_DEFAULT, "MFMessageLoadingContextEvent for message:%{public}@ hasLoadedCompleteMessage %{BOOL}d, hasLoadedBestAlternativePart %{BOOL}d, transportType %ld", buf, 0x22u);
  }
  +[MFActivityMonitor destroyMonitor];
  v57 = v103;
LABEL_65:

LABEL_66:
LABEL_67:
  return v103;
}

uint64_t __54__MFMessageLoadingContext__reallyLoad_shouldDownload___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

id __54__MFMessageLoadingContext__reallyLoad_shouldDownload___block_invoke_138(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = [v3 mimePart];
  unint64_t v5 = [v4 partNumber];

  BOOL v6 = EDAttachmentsLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    id v11 = v5;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1A7EFF000, v6, OS_LOG_TYPE_DEFAULT, "Creating MFAttachment for part number %{public}@ textAttachment %@", (uint8_t *)&v10, 0x16u);
  }

  id v7 = [*(id *)(a1 + 32) attachmentManager];
  uint64_t v8 = [v7 attachmentForTextAttachment:v3 error:0];

  return v8;
}

- (void)assignAttachmentManagerToContent:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = v8;
          [v9 setAttachmentManager:self->_attachmentManager];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_11;
          }
          id v9 = [(MFMessageLoadingContext *)self attachmentManager];
          id v10 = (id)[v9 attachmentForTextAttachment:v8 error:0];
        }

LABEL_11:
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)processMeetingInvitations:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = [(MFMessageLoadingContext *)self attachmentManager];
          id v10 = [v9 attachmentForTextAttachment:v8 error:0];

          if ([v10 isCalendarFile])
          {
            if (self->_eventICSRepresentation)
            {
              objc_msgSend(v10, "setIcsRepresentation:");
            }
            else if (self->_eventUniqueID)
            {
              objc_msgSend(v10, "setEventID:");
              [v10 setMeetingStorePersistentID:self->_meetingStorePersistentID];
            }
            if (self->_meetingName) {
              objc_msgSend(v10, "setFileName:");
            }
          }
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (MFMailMessage)message
{
  return self->_message;
}

- (void)_setMessage:(id)a3
{
}

- (MFMimeBody)messageBody
{
  return self->_messageBody;
}

- (void)_setMessageBody:(id)a3
{
}

- (MFAttachmentManager)attachmentManager
{
  return self->_attachmentManager;
}

- (void)_setAttachmentManager:(id)a3
{
}

- (BOOL)hasLoadedSomeContent
{
  return self->_hasLoadedSomeContent;
}

- (void)setHasLoadedSomeContent:(BOOL)a3
{
  self->_hasLoadedSomeContent = a3;
}

- (BOOL)hasLoadedCompleteMessage
{
  return self->_hasLoadedCompleteMessage;
}

- (void)setHasLoadedCompleteMessage:(BOOL)a3
{
  self->_hasLoadedCompleteMessage = a3;
}

- (BOOL)hasLoadedBestAlternativePart
{
  return self->_hasLoadedBestAlternativePart;
}

- (void)setHasLoadedBestAlternativePart:(BOOL)a3
{
  self->_hasLoadedBestAlternativePart = a3;
}

- (BOOL)isOutgoingMessage
{
  return self->_outgoingMessage;
}

- (BOOL)isDraftMessage
{
  return self->_draftMessage;
}

- (BOOL)isEditableMessage
{
  return self->_editableMessage;
}

- (EFObservable)contentObservable
{
  return self->_contentObservable;
}

- (MFMimePart)loadedPart
{
  return self->_loadedPart;
}

- (void)setLoadedPart:(id)a3
{
}

- (unint64_t)contentOffset
{
  return self->_contentOffset;
}

- (void)setContentOffset:(unint64_t)a3
{
  self->_contentOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedPart, 0);
  objc_storeStrong((id *)&self->_contentObservable, 0);
  objc_storeStrong((id *)&self->_attachmentManager, 0);
  objc_storeStrong((id *)&self->_messageBody, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_eventICSRepresentation, 0);
  objc_storeStrong((id *)&self->_meetingStorePersistentID, 0);
  objc_storeStrong((id *)&self->_meetingName, 0);
  objc_storeStrong((id *)&self->_eventUniqueID, 0);
  objc_storeStrong((id *)&self->_inputObservable, 0);
  objc_storeStrong((id *)&self->_cancelable, 0);
}

- (void)_reallyLoad:(os_log_t)log shouldDownload:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "Failed to get the body for messageID %{public}@", buf, 0xCu);
}

@end