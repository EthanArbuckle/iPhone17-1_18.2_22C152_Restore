@interface MessageContentRepresentationRequest
+ (OS_os_log)log;
+ (OS_os_log)signpostLog;
+ (id)defaultScheduler;
- (BOOL)hasStarted;
- (BOOL)isFinished;
- (EFFuture)contentRepresentationFuture;
- (EFFuture)messageFuture;
- (EMCollectionItemID)itemID;
- (EMMessage)message;
- (MessageContentRepresentationRequest)initWithMessage:(id)a3;
- (MessageContentRepresentationRequest)initWithMessage:(id)a3 includeSuggestions:(int64_t)a4;
- (MessageContentRepresentationRequest)initWithMessage:(id)a3 includeSuggestions:(int64_t)a4 representationType:(id)a5 delegate:(id)a6;
- (MessageContentRepresentationRequest)initWithMessageList:(id)a3 itemIdentifier:(id)a4 includeSuggestions:(int64_t)a5;
- (MessageContentRepresentationRequest)initWithMessageList:(id)a3 itemIdentifier:(id)a4 includeSuggestions:(int64_t)a5 representationType:(id)a6 delegate:(id)a7;
- (NSString)ef_publicDescription;
- (id)addLoadObserver:(id)a3;
- (id)onScheduler:(id)a3 addLoadObserver:(id)a4;
- (id)resultIfAvailable;
- (id)waitForResult;
- (unint64_t)signpostID;
- (unint64_t)state;
- (void)_commonInitWithIncludeSuggestionItems:(id)obj delegate:;
- (void)_issueMessageContentRepresentationRequest;
- (void)_resetFuture:(uint64_t)a1;
- (void)cancel;
- (void)dealloc;
- (void)retry;
- (void)updateItemID:(id)a3 messageList:(id)a4;
@end

@implementation MessageContentRepresentationRequest

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__MessageContentRepresentationRequest_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_2 != -1) {
    dispatch_once(&log_onceToken_2, block);
  }
  v2 = (void *)log_log_2;
  return (OS_os_log *)v2;
}

void __42__MessageContentRepresentationRequest_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.mobilemail", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_2;
  log_log_2 = (uint64_t)v1;
}

+ (OS_os_log)signpostLog
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__MessageContentRepresentationRequest_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken != -1) {
    dispatch_once(&signpostLog_onceToken, block);
  }
  v2 = (void *)signpostLog_log;
  return (OS_os_log *)v2;
}

void __50__MessageContentRepresentationRequest_signpostLog__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email.signposts", (const char *)[v3 UTF8String]);
  v2 = (void *)signpostLog_log;
  signpostLog_log = (uint64_t)v1;
}

- (unint64_t)signpostID
{
  id v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

+ (id)defaultScheduler
{
  self;
  if (defaultScheduler_onceToken != -1) {
    dispatch_once(&defaultScheduler_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)defaultScheduler_scheduler;
  return v0;
}

void __55__MessageContentRepresentationRequest_defaultScheduler__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.mobilemail.MessageContentRepresentationRequest" qualityOfService:25];
  os_log_t v1 = (void *)defaultScheduler_scheduler;
  defaultScheduler_scheduler = v0;
}

- (MessageContentRepresentationRequest)initWithMessage:(id)a3
{
  return [(MessageContentRepresentationRequest *)self initWithMessage:a3 includeSuggestions:0 representationType:*MEMORY[0x1E4F5FCA0] delegate:0];
}

- (MessageContentRepresentationRequest)initWithMessage:(id)a3 includeSuggestions:(int64_t)a4
{
  return [(MessageContentRepresentationRequest *)self initWithMessage:a3 includeSuggestions:a4 representationType:*MEMORY[0x1E4F5FCA0] delegate:0];
}

- (MessageContentRepresentationRequest)initWithMessage:(id)a3 includeSuggestions:(int64_t)a4 representationType:(id)a5 delegate:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)MessageContentRepresentationRequest;
  v13 = [(MessageContentRepresentationRequest *)&v19 init];
  if (v13)
  {
    uint64_t v14 = [v10 itemID];
    itemID = v13->_itemID;
    v13->_itemID = (EMCollectionItemID *)v14;

    uint64_t v16 = [MEMORY[0x1E4F60D70] futureWithResult:v10];
    messageFuture = v13->_messageFuture;
    v13->_messageFuture = (EFFuture *)v16;

    objc_storeStrong((id *)&v13->_contentRepresentationType, a5);
    -[MessageContentRepresentationRequest _commonInitWithIncludeSuggestionItems:delegate:]((uint64_t)v13, a4 != 0, v12);
  }

  return v13;
}

- (void)_commonInitWithIncludeSuggestionItems:(id)obj delegate:
{
  if (a1)
  {
    objc_storeWeak((id *)(a1 + 8), obj);
    *(unsigned char *)(a1 + 64) = a2;
    uint64_t v5 = [MEMORY[0x1E4F60DD8] observableObserver];
    v6 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = v5;

    id v7 = objc_alloc_init(MEMORY[0x1E4F60D40]);
    v8 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = v7;

    id v13 = [*(id *)(a1 + 24) replay:1];
    uint64_t v9 = [v13 filter:&__block_literal_global_68];
    id v10 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = v9;

    id v11 = *(void **)(a1 + 16);
    id v12 = [v13 connect];
    [v11 addCancelable:v12];
  }
}

- (MessageContentRepresentationRequest)initWithMessageList:(id)a3 itemIdentifier:(id)a4 includeSuggestions:(int64_t)a5
{
  return [(MessageContentRepresentationRequest *)self initWithMessageList:a3 itemIdentifier:a4 includeSuggestions:a5 representationType:*MEMORY[0x1E4F5FCA0] delegate:0];
}

- (MessageContentRepresentationRequest)initWithMessageList:(id)a3 itemIdentifier:(id)a4 includeSuggestions:(int64_t)a5 representationType:(id)a6 delegate:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)MessageContentRepresentationRequest;
  uint64_t v16 = [(MessageContentRepresentationRequest *)&v22 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_itemID, a4);
    v18 = [v12 messageListItemForItemID:v13];
    uint64_t v19 = [v18 then:&__block_literal_global_61];
    messageFuture = v17->_messageFuture;
    v17->_messageFuture = (EFFuture *)v19;

    objc_storeStrong((id *)&v17->_contentRepresentationType, a6);
    -[MessageContentRepresentationRequest _commonInitWithIncludeSuggestionItems:delegate:]((uint64_t)v17, a5 != 0, v15);
  }

  return v17;
}

id __121__MessageContentRepresentationRequest_initWithMessageList_itemIdentifier_includeSuggestions_representationType_delegate___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 displayMessage];
  return v2;
}

- (void)updateItemID:(id)a3 messageList:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  if (([(EMCollectionItemID *)self->_itemID isEqual:v11] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_itemID, a3);
    v8 = [v7 messageListItemForItemID:v11];
    uint64_t v9 = [v8 then:&__block_literal_global_63];
    messageFuture = self->_messageFuture;
    self->_messageFuture = v9;
  }
}

id __64__MessageContentRepresentationRequest_updateItemID_messageList___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 displayMessage];
  return v2;
}

uint64_t __86__MessageContentRepresentationRequest__commonInitWithIncludeSuggestionItems_delegate___block_invoke()
{
  return 1;
}

- (NSString)ef_publicDescription
{
  unint64_t v3 = [(MessageContentRepresentationRequest *)self state];
  if (v3 > 3) {
    os_signpost_id_t v4 = 0;
  }
  else {
    os_signpost_id_t v4 = off_1E6D1AD50[v3];
  }
  uint64_t v5 = NSString;
  v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  v8 = [(MessageContentRepresentationRequest *)self itemID];
  uint64_t v9 = [v5 stringWithFormat:@"<%@: %p> itemID: %@ state:%@", v7, self, v8, v4];

  return (NSString *)v9;
}

- (void)dealloc
{
  [(MessageContentRepresentationRequest *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)MessageContentRepresentationRequest;
  [(MessageContentRepresentationRequest *)&v3 dealloc];
}

- (void)cancel
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  objc_super v3 = +[MessageContentRepresentationRequest log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = [(MessageContentRepresentationRequest *)self itemID];
    int v6 = 138412802;
    uint64_t v7 = v4;
    __int16 v8 = 2048;
    uint64_t v9 = self;
    __int16 v10 = 2114;
    id v11 = v5;
    _os_log_impl(&dword_1DDF5A000, v3, OS_LOG_TYPE_DEFAULT, "<%@: %p> Content request for message %{public}@ being cancelled.", (uint8_t *)&v6, 0x20u);
  }
  [(EFCancelationToken *)self->_cancelationToken cancel];
}

- (EMMessage)message
{
  v2 = [(MessageContentRepresentationRequest *)self messageFuture];
  objc_super v3 = [v2 result];

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F60CE8] + 16))()) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = v4;

  return v5;
}

- (void)_issueMessageContentRepresentationRequest
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    atomic_store(0, (unsigned __int8 *)(a1 + 48));
    v2 = (os_unfair_lock_s *)(a1 + 68);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 68));
    if (*(void *)(a1 + 40))
    {
      os_unfair_lock_unlock(v2);
    }
    else
    {
      objc_super v3 = [MEMORY[0x1E4F60E18] promise];
      uint64_t v6 = [v3 future];
      uint64_t v7 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v6;

      os_unfair_lock_unlock(v2);
      if (v3)
      {
        __int16 v8 = +[MessageContentRepresentationRequest signpostLog];
        os_signpost_id_t v9 = [(id)a1 signpostID];
        if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
        {
          __int16 v10 = [(id)a1 itemID];
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v10;
          _os_signpost_emit_with_name_impl(&dword_1DDF5A000, v8, OS_SIGNPOST_EVENT, v9, "MessageContentRepresentationRequest", "itemID=%{signpost.description:attribute,public}@", buf, 0xCu);
        }
        id v11 = +[MessageContentRepresentationRequest signpostLog];
        os_signpost_id_t v12 = [(id)a1 signpostID];
        if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
        {
          id v13 = [(id)a1 itemID];
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v13;
          _os_signpost_emit_with_name_impl(&dword_1DDF5A000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v12, "MessageContentRepresentationRequest", "itemID=%{signpost.description:attribute,public}@", buf, 0xCu);
        }
        id v14 = +[MessageContentRepresentationRequest signpostLog];
        os_signpost_id_t v15 = [(id)a1 signpostID];
        if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
        {
          uint64_t v16 = [(id)a1 itemID];
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v16;
          _os_signpost_emit_with_name_impl(&dword_1DDF5A000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v15, "MessageContentRepresentationRequestFailed", "itemID=%{signpost.description:attribute,public}@", buf, 0xCu);
        }
        v17 = [(id)a1 messageFuture];
        v18 = [v17 resultIfAvailable];
        BOOL v19 = v18 == 0;

        if (v19)
        {
          v20 = +[MessageContentRepresentationRequest log];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            uint64_t v27 = objc_opt_class();
            v28 = [(id)a1 itemID];
            *(_DWORD *)buf = 138412802;
            *(void *)&buf[4] = v27;
            __int16 v42 = 2048;
            uint64_t v43 = a1;
            __int16 v44 = 2114;
            v45 = v28;
            _os_log_error_impl(&dword_1DDF5A000, v20, OS_LOG_TYPE_ERROR, "<%@: %p> Issuing content request for message with unavailable message future %{public}@", buf, 0x20u);
          }
        }
        else
        {
          v20 = +[MessageContentRepresentationRequest log];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v21 = objc_opt_class();
            objc_super v22 = [(id)a1 itemID];
            *(_DWORD *)buf = 138412802;
            *(void *)&buf[4] = v21;
            __int16 v42 = 2048;
            uint64_t v43 = a1;
            __int16 v44 = 2114;
            v45 = v22;
            _os_log_impl(&dword_1DDF5A000, v20, OS_LOG_TYPE_DEFAULT, "<%@: %p> Issuing content request for message %{public}@", buf, 0x20u);
          }
        }

        v23 = +[MessageContentRepresentationRequest defaultScheduler]();
        v24 = [(id)a1 itemID];
        *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
        objc_initWeak((id *)buf, (id)a1);
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __80__MessageContentRepresentationRequest__issueMessageContentRepresentationRequest__block_invoke;
        v38[3] = &unk_1E6D1AC90;
        objc_copyWeak(&v40, (id *)buf);
        id v25 = v24;
        id v39 = v25;
        v26 = [v17 onScheduler:v23 then:v38];
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __80__MessageContentRepresentationRequest__issueMessageContentRepresentationRequest__block_invoke_3;
        v36[3] = &unk_1E6D1ACB8;
        objc_copyWeak(&v37, (id *)buf);
        [v26 addSuccessBlock:v36];
        id location = (id)0xAAAAAAAAAAAAAAAALL;
        objc_initWeak(&location, v3);
        uint64_t v29 = MEMORY[0x1E4F143A8];
        uint64_t v30 = 3221225472;
        v31 = __80__MessageContentRepresentationRequest__issueMessageContentRepresentationRequest__block_invoke_94;
        v32 = &unk_1E6D1ACE0;
        objc_copyWeak(&v33, (id *)buf);
        objc_copyWeak(&v34, &location);
        [v26 addFailureBlock:&v29];
        -[NSObject finishWithFuture:](v3, "finishWithFuture:", v26, v29, v30, v31, v32);
        [*(id *)(a1 + 16) addCancelable:v3];
        objc_destroyWeak(&v34);
        objc_destroyWeak(&v33);
        objc_destroyWeak(&location);
        objc_destroyWeak(&v37);

        objc_destroyWeak(&v40);
        objc_destroyWeak((id *)buf);

        goto LABEL_22;
      }
    }
    objc_super v3 = +[MessageContentRepresentationRequest log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = objc_opt_class();
      uint64_t v5 = [(id)a1 itemID];
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v4;
      __int16 v42 = 2048;
      uint64_t v43 = a1;
      __int16 v44 = 2114;
      v45 = v5;
      _os_log_impl(&dword_1DDF5A000, v3, OS_LOG_TYPE_DEFAULT, "<%@: %p> Content request for message %{public}@ already issued", buf, 0x20u);
    }
LABEL_22:
  }
}

id __80__MessageContentRepresentationRequest__issueMessageContentRepresentationRequest__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v5 = [MEMORY[0x1E4F60E18] promise];
    uint64_t v6 = (MessageContentRepresentationRequestDelegate *)objc_loadWeakRetained(WeakRetained + 1);
    if (!v6) {
      uint64_t v6 = objc_alloc_init(MessageContentRepresentationRequestDelegate);
    }
    id v7 = objc_alloc(MEMORY[0x1E4F60250]);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __80__MessageContentRepresentationRequest__issueMessageContentRepresentationRequest__block_invoke_2;
    v14[3] = &unk_1E6D1AC68;
    v14[4] = WeakRetained;
    __int16 v8 = (void *)[v7 initWithBuilder:v14];
    os_signpost_id_t v9 = [v5 completionHandlerAdapter];
    __int16 v10 = [v3 requestRepresentationWithOptions:v8 delegate:v6 completionHandler:v9];

    [WeakRetained[2] addCancelable:v10];
    id v11 = [v5 future];
  }
  else
  {
    os_signpost_id_t v12 = (void *)MEMORY[0x1E4F60D70];
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28C58], "em_itemNotFoundErrorWithItemID:", *(void *)(a1 + 32));
    id v11 = [v12 futureWithError:v5];
  }

  return v11;
}

void __80__MessageContentRepresentationRequest__issueMessageContentRepresentationRequest__block_invoke_2(uint64_t a1, void *a2)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 setRequestedRepresentation:*(void *)(*(void *)(a1 + 32) + 72)];
  [v3 setNetworkUsage:1];
  [v3 setIncludeSuggestionItems:*(unsigned __int8 *)(*(void *)(a1 + 32) + 64)];
  uint64_t v4 = *MEMORY[0x1E4F606A0];
  v9[0] = *MEMORY[0x1E4F606B0];
  v9[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  [v3 setRequestedHeaderKeys:v5];

  [v3 setIncludeCachedMetadataJSON:1];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 56);
  uint64_t v7 = 1;
  if (v6 != 1) {
    uint64_t v7 = 2;
  }
  if (v6) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  [v3 setCacheBehavior:v8];
}

void __80__MessageContentRepresentationRequest__issueMessageContentRepresentationRequest__block_invoke_3(uint64_t a1, void *a2)
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = +[MessageContentRepresentationRequest signpostLog];
    os_signpost_id_t v6 = [WeakRetained signpostID];
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      LOWORD(v12) = 0;
      _os_signpost_emit_with_name_impl(&dword_1DDF5A000, v5, OS_SIGNPOST_INTERVAL_END, v6, "MessageContentRepresentationRequest", " enableTelemetry=YES ", (uint8_t *)&v12, 2u);
    }

    v18[0] = v3;
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
    v18[1] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];

    os_signpost_id_t v9 = +[MessageContentRepresentationRequest log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = objc_opt_class();
      id v11 = [WeakRetained itemID];
      int v12 = 138412802;
      uint64_t v13 = v10;
      __int16 v14 = 2048;
      os_signpost_id_t v15 = WeakRetained;
      __int16 v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_1DDF5A000, v9, OS_LOG_TYPE_DEFAULT, "<%@: %p> Content request for message %{public}@ loaded successfully", (uint8_t *)&v12, 0x20u);
    }
    [WeakRetained[3] observerDidReceiveResult:v8];
  }
}

void __80__MessageContentRepresentationRequest__issueMessageContentRepresentationRequest__block_invoke_94(uint64_t a1, void *a2)
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  os_signpost_id_t v6 = v5;
  if (WeakRetained)
  {
    uint64_t v7 = [v5 future];
    -[MessageContentRepresentationRequest _resetFuture:]((uint64_t)WeakRetained, v7);

    uint64_t v8 = +[MessageContentRepresentationRequest signpostLog];
    os_signpost_id_t v9 = [WeakRetained signpostID];
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      LOWORD(v19) = 0;
      _os_signpost_emit_with_name_impl(&dword_1DDF5A000, v8, OS_SIGNPOST_INTERVAL_END, v9, "MessageContentRepresentationRequestFailed", " enableTelemetry=YES ", (uint8_t *)&v19, 2u);
    }

    uint64_t v10 = [v3 userInfo];
    id v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];
    if (!v11)
    {
      if (v3)
      {
        id v12 = v3;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "em_internalErrorWithReason:", @"MessageContentRepresentationRequest failed without reason");
        id v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v11 = v12;
    }
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
    v27[0] = v13;
    v27[1] = v11;
    __int16 v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];

    if (v11) {
      atomic_store(1u, (unsigned __int8 *)WeakRetained + 48);
    }
    os_signpost_id_t v15 = +[MessageContentRepresentationRequest log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = objc_opt_class();
      v17 = [WeakRetained itemID];
      v18 = objc_msgSend(v11, "ef_publicDescription");
      int v19 = 138413058;
      uint64_t v20 = v16;
      __int16 v21 = 2048;
      id v22 = WeakRetained;
      __int16 v23 = 2114;
      v24 = v17;
      __int16 v25 = 2114;
      v26 = v18;
      _os_log_impl(&dword_1DDF5A000, v15, OS_LOG_TYPE_DEFAULT, "<%@: %p> Content request for message %{public}@ failed to load with error: %{public}@", (uint8_t *)&v19, 0x2Au);
    }
    [*((id *)WeakRetained + 3) observerDidReceiveResult:v14];
  }
}

- (void)_resetFuture:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = v3;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 68));
    if (*(id *)(a1 + 40) == v4)
    {
      *(void *)(a1 + 40) = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 68));
    id v3 = v4;
  }
}

- (EFFuture)contentRepresentationFuture
{
  p_contentRepresentationLock = &self->_contentRepresentationLock;
  os_unfair_lock_lock(&self->_contentRepresentationLock);
  id v4 = self->_futureContentRepresentation;
  os_unfair_lock_unlock(p_contentRepresentationLock);
  return v4;
}

- (void)retry
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  ++self->_retryAttempt;
  id v3 = +[MessageContentRepresentationRequest signpostLog];
  os_signpost_id_t v4 = [(MessageContentRepresentationRequest *)self signpostID];
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    int retryAttempt_low = LOBYTE(self->_retryAttempt);
    v6[0] = 67240192;
    v6[1] = retryAttempt_low;
    _os_signpost_emit_with_name_impl(&dword_1DDF5A000, v3, OS_SIGNPOST_EVENT, v4, "MessageContentRepresentationRequest", "retry-attempt=%{signpost.description:attribute,public}hhu", (uint8_t *)v6, 8u);
  }

  [(MessageContentRepresentationRequest *)self start];
}

- (id)resultIfAvailable
{
  v2 = [(MessageContentRepresentationRequest *)self contentRepresentationFuture];
  id v3 = [v2 resultIfAvailable:0];

  return v3;
}

- (id)waitForResult
{
  [(MessageContentRepresentationRequest *)self start];
  id v3 = [(MessageContentRepresentationRequest *)self contentRepresentationFuture];
  os_signpost_id_t v4 = [v3 result:0];

  return v4;
}

- (BOOL)hasStarted
{
  v2 = [(MessageContentRepresentationRequest *)self contentRepresentationFuture];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isFinished
{
  v2 = [(MessageContentRepresentationRequest *)self resultIfAvailable];
  BOOL v3 = v2 != 0;

  return v3;
}

- (unint64_t)state
{
  BOOL v3 = [(MessageContentRepresentationRequest *)self resultIfAvailable];

  if (v3) {
    return 2;
  }
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_hasError);
  if (v5) {
    return 3;
  }
  else {
    return [(MessageContentRepresentationRequest *)self hasStarted];
  }
}

- (id)onScheduler:(id)a3 addLoadObserver:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__MessageContentRepresentationRequest_onScheduler_addLoadObserver___block_invoke;
  aBlock[3] = &unk_1E6D1AD08;
  id v8 = v7;
  id v22 = v8;
  os_signpost_id_t v9 = _Block_copy(aBlock);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __67__MessageContentRepresentationRequest_onScheduler_addLoadObserver___block_invoke_2;
  int v19 = &unk_1E6D1AD30;
  id v10 = v8;
  id v20 = v10;
  id v11 = _Block_copy(&v16);
  id v12 = objc_msgSend(MEMORY[0x1E4F60DE0], "observerWithResultBlock:completionBlock:failureBlock:", v11, 0, v9, v16, v17, v18, v19);
  uint64_t v13 = [(EFObservable *)self->_contentObservable observeOn:v6];
  __int16 v14 = [v13 subscribe:v12];

  [(EFCancelationToken *)self->_cancelationToken addCancelable:v14];
  return v14;
}

uint64_t __67__MessageContentRepresentationRequest_onScheduler_addLoadObserver___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67__MessageContentRepresentationRequest_onScheduler_addLoadObserver___block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  BOOL v3 = [v9 objectAtIndexedSubscript:0];
  os_signpost_id_t v4 = [MEMORY[0x1E4F1CA98] null];
  if (v3 == v4)
  {
    unsigned __int8 v5 = 0;
  }
  else
  {
    unsigned __int8 v5 = [v9 objectAtIndexedSubscript:0];
  }

  id v6 = [v9 objectAtIndexedSubscript:1];
  id v7 = [MEMORY[0x1E4F1CA98] null];
  if (v6 == v7)
  {
    id v8 = 0;
  }
  else
  {
    id v8 = [v9 objectAtIndexedSubscript:1];
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)addLoadObserver:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [MEMORY[0x1E4F60F28] immediateScheduler];
  id v6 = [(MessageContentRepresentationRequest *)self onScheduler:v5 addLoadObserver:v4];

  return v6;
}

- (EMCollectionItemID)itemID
{
  return self->_itemID;
}

- (EFFuture)messageFuture
{
  return self->_messageFuture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageFuture, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_contentRepresentationType, 0);
  objc_storeStrong((id *)&self->_futureContentRepresentation, 0);
  objc_storeStrong((id *)&self->_contentObservable, 0);
  objc_storeStrong((id *)&self->_inputObservable, 0);
  objc_storeStrong((id *)&self->_cancelationToken, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end