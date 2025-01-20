@interface MFMessageContentRequest
+ (id)databaseWriteScheduler;
+ (id)metadataWithDictionary:(id)a3;
+ (id)onScheduler:(id)a3 requestContentForObjectID:(id)a4 messagePersistence:(id)a5 legacyMessage:(id)a6 messageTransformer:(id)a7 mailDropAttachmentGenerator:(id)a8 listUnsubscribeHandler:(id)a9 clientIdentifier:(id)a10 options:(id)a11 delegate:(id)a12 completionHandler:(id)a13;
+ (id)onScheduler:(id)a3 requestID:(unint64_t)a4 requestContentForObjectID:(id)a5 messagePersistence:(id)a6 legacyMessage:(id)a7 messageTransformer:(id)a8 mailDropAttachmentGenerator:(id)a9 listUnsubscribeHandler:(id)a10 clientIdentifier:(id)a11 options:(id)a12 delegate:(id)a13 completionHandler:(id)a14;
+ (id)originalContentMessageScheduler;
- (id)_attachmentContentItemsForMailDropNodes:(id)a3 withContext:(id)a4;
- (id)_attachmentForMailDropMetaData:(id)a3 context:(id)a4;
- (id)_contentItemForAttachment:(id)a3 manager:(id)a4 managed:(BOOL)a5;
- (id)_contentRepresentationForEvent:(id)a3 contentURL:(id)a4 relatedItems:(id)a5 messageAndHTMLDataPair:(id)a6 existingRepresentation:(id)a7 invocable:(id)a8;
- (id)_contentRepresentationForLoadingEvent:(id)a3 existingRepresentation:(id)a4;
- (id)_dataHolderWithCancelationToken:(id)a3;
- (id)_generateRepresentationForLoadingContext:(id)a3 existingRepresentation:(id)a4 completion:(id)a5;
- (id)_maildropMetadataFromContext:(id)a3;
- (id)_messageContentFromLoadingContext:(id)a3 completion:(id)a4;
- (id)_messageForLegacyMessage:(id)a3;
- (id)_processContentLoadingContextEvent:(id)a3;
- (id)_requestContentForAttachment:(id)a3 manager:(id)a4 options:(id)a5 managed:(BOOL)a6 completion:(id)a7;
- (id)beginRequestWithCompletionHandler:(id)a3;
- (id)delegateWithErrorHandler:(id)a3;
- (id)requestHTMLRepresentationWithCompletionHandler:(id)a3;
- (id)requestRawRepresentationWithCompletionHandler:(id)a3;
- (void)_includeCachedMetadataJSONIfNeededForRepresentation:(id)a3 message:(id)a4;
- (void)_includeHeadersIfNeededForRepresentation:(id)a3 message:(id)a4 options:(id)a5;
- (void)_includeSuggestionItemsIfNeededForRepresentation:(id)a3 message:(id)a4;
- (void)_messageInReplyToMessage:(id)a3 libraryStore:(id)a4 completion:(id)a5;
- (void)_originalContentMessagesInReplyToLegacyMessage:(id)a3 withMessageAndHTMLDataPair:(id)a4 maximumNumberOfMessages:(unint64_t)a5 completion:(id)a6;
@end

@implementation MFMessageContentRequest

+ (id)databaseWriteScheduler
{
  if (databaseWriteScheduler_onceToken != -1) {
    dispatch_once(&databaseWriteScheduler_onceToken, &__block_literal_global_45);
  }
  v2 = (void *)databaseWriteScheduler_sInstance;
  return v2;
}

void __49__MFMessageContentRequest_databaseWriteScheduler__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.message.MFMessageContentRequest.databaseWriteScheduler"];
  v1 = (void *)databaseWriteScheduler_sInstance;
  databaseWriteScheduler_sInstance = v0;
}

+ (id)originalContentMessageScheduler
{
  if (originalContentMessageScheduler_onceToken != -1) {
    dispatch_once(&originalContentMessageScheduler_onceToken, &__block_literal_global_37_0);
  }
  v2 = (void *)originalContentMessageScheduler_sInstance;
  return v2;
}

void __58__MFMessageContentRequest_originalContentMessageScheduler__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.message.MFMessageContentRequest.originalContentMessageScheduler" qualityOfService:25];
  v1 = (void *)originalContentMessageScheduler_sInstance;
  originalContentMessageScheduler_sInstance = v0;
}

+ (id)onScheduler:(id)a3 requestContentForObjectID:(id)a4 messagePersistence:(id)a5 legacyMessage:(id)a6 messageTransformer:(id)a7 mailDropAttachmentGenerator:(id)a8 listUnsubscribeHandler:(id)a9 clientIdentifier:(id)a10 options:(id)a11 delegate:(id)a12 completionHandler:(id)a13
{
  v13 = [a1 onScheduler:a3 requestID:0 requestContentForObjectID:a4 messagePersistence:a5 legacyMessage:a6 messageTransformer:a7 mailDropAttachmentGenerator:a8 listUnsubscribeHandler:a9 clientIdentifier:a10 options:a11 delegate:a12 completionHandler:a13];
  return v13;
}

+ (id)onScheduler:(id)a3 requestID:(unint64_t)a4 requestContentForObjectID:(id)a5 messagePersistence:(id)a6 legacyMessage:(id)a7 messageTransformer:(id)a8 mailDropAttachmentGenerator:(id)a9 listUnsubscribeHandler:(id)a10 clientIdentifier:(id)a11 options:(id)a12 delegate:(id)a13 completionHandler:(id)a14
{
  id v38 = a3;
  id obj = a5;
  id v35 = a5;
  id v37 = a6;
  id v34 = a7;
  id v33 = a8;
  id v32 = a9;
  id v31 = a10;
  id v30 = a11;
  id v29 = a12;
  id v28 = a13;
  id v18 = a14;
  id v19 = objc_alloc((Class)a1);
  v20 = v19;
  if (v19)
  {
    v39.receiver = v19;
    v39.super_class = (Class)MFMessageContentRequest;
    id v21 = objc_msgSendSuper2(&v39, sel_init);

    if (v21)
    {
      v22 = -[_MFMessageContentRequestScheduler initWithScheduler:requestID:messagePersistence:]((id *)[_MFMessageContentRequestScheduler alloc], v38, (void *)a4, v37);
      v23 = (void *)*((void *)v21 + 1);
      *((void *)v21 + 1) = v22;

      objc_storeStrong((id *)v21 + 2, obj);
      objc_storeStrong((id *)v21 + 3, a6);
      objc_storeStrong((id *)v21 + 4, a7);
      objc_storeStrong((id *)v21 + 5, a8);
      objc_storeStrong((id *)v21 + 6, a11);
      objc_storeStrong((id *)v21 + 8, a9);
      objc_storeStrong((id *)v21 + 9, a10);
      objc_storeStrong((id *)v21 + 7, a12);
      objc_storeStrong((id *)v21 + 10, a13);
      v20 = v21;
    }
    else
    {
      v20 = 0;
    }
  }
  v24 = [v20 beginRequestWithCompletionHandler:v18];

  return v24;
}

- (id)delegateWithErrorHandler:(id)a3
{
  id v4 = a3;
  if (self) {
    delegate = self->_delegate;
  }
  else {
    delegate = 0;
  }
  v6 = delegate;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [(EMContentItemRequestDelegate *)v6 synchronousRemoteObjectProxyWithErrorHandler:v4];

    v6 = (EMContentItemRequestDelegate *)v7;
  }

  return v6;
}

- (id)beginRequestWithCompletionHandler:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, void *))a3;
  if (self) {
    options = self->_options;
  }
  else {
    options = 0;
  }
  v6 = options;
  uint64_t v7 = [(EMContentRequestOptions *)v6 requestedRepresentation];

  if ([v7 isEqualToString:*MEMORY[0x1E4F5FCB0]])
  {
    uint64_t v8 = [(MFMessageContentRequest *)self requestRawRepresentationWithCompletionHandler:v4];
LABEL_8:
    v9 = (void *)v8;
    goto LABEL_9;
  }
  if (([v7 isEqualToString:*MEMORY[0x1E4F5FCA0]] & 1) != 0
    || [v7 isEqualToString:*MEMORY[0x1E4F5FCA8]])
  {
    uint64_t v8 = [(MFMessageContentRequest *)self requestHTMLRepresentationWithCompletionHandler:v4];
    goto LABEL_8;
  }
  v11 = EMLogCategoryMessageLoading();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    if (self) {
      legacyMessage = self->_legacyMessage;
    }
    else {
      legacyMessage = 0;
    }
    int v14 = 138543618;
    v15 = v7;
    __int16 v16 = 2114;
    v17 = legacyMessage;
    _os_log_error_impl(&dword_1A7EFF000, v11, OS_LOG_TYPE_ERROR, "content not available for unknown representation type %{public}@ content for message %{public}@", (uint8_t *)&v14, 0x16u);
  }

  v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5FCD0] code:2048 userInfo:0];
  v4[2](v4, 0, v12);

  v9 = 0;
LABEL_9:

  return v9;
}

- (id)requestRawRepresentationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:1];
  if (self) {
    scheduler = self->_scheduler;
  }
  else {
    scheduler = 0;
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __73__MFMessageContentRequest_requestRawRepresentationWithCompletionHandler___block_invoke;
  v17[3] = &unk_1E5D3F8E8;
  v17[4] = self;
  id v7 = v5;
  id v18 = v7;
  id v8 = v4;
  id v19 = v8;
  v9 = scheduler;
  v10 = [(EFScheduler *)v9 performCancelableBlock:v17];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __73__MFMessageContentRequest_requestRawRepresentationWithCompletionHandler___block_invoke_55;
  v15[3] = &unk_1E5D3B5C0;
  __int16 v16 = v10;
  id v11 = v10;
  [v7 setCancellationHandler:v15];
  v12 = v16;
  id v13 = v7;

  return v13;
}

void __73__MFMessageContentRequest_requestRawRepresentationWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (([v3 isCanceled] & 1) == 0)
  {
    id v4 = [*(id *)(a1 + 32) _dataHolderWithCancelationToken:v3];
    if (([v3 isCanceled] & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
      if (v4)
      {
        v5 = *(void **)(a1 + 32);
        if (v5) {
          v5 = (void *)v5[4];
        }
        v6 = v5;
        id v7 = objc_alloc(MEMORY[0x1E4F60248]);
        id v8 = [v4 data];
        v9 = *(void **)(a1 + 32);
        if (v9) {
          v9 = (void *)v9[6];
        }
        v10 = v9;
        id v11 = [v6 subject];
        v12 = [v11 subjectString];
        id v13 = (void *)[v7 initWithData:v8 clientIdentifier:v10 preferredFilename:v12 extension:@"eml" relatedItems:MEMORY[0x1E4F1CBF0] securityInformation:0];

        int v14 = +[MFActivityMonitor currentMonitor];
        objc_msgSend(v13, "setTransportType:", objc_msgSend(v14, "transportType"));

        v15 = [v6 globalMessageURL];
        [v13 setPublicMessageURL:v15];

        __int16 v16 = [v6 headersIfAvailable];
        v17 = (void *)[v16 copyAddressListForReplyTo];
        [v13 setReplyToList:v17];

        id v18 = *(void **)(a1 + 32);
        if (v18) {
          uint64_t v19 = v18[7];
        }
        else {
          uint64_t v19 = 0;
        }
        [v18 _includeHeadersIfNeededForRepresentation:v13 message:v6 options:v19];
        v20 = EMLogCategoryMessageLoading();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          id v21 = objc_msgSend(v13, "ef_publicDescription");
          int v28 = 138543618;
          id v29 = v21;
          __int16 v30 = 2112;
          id v31 = v6;
          _os_log_impl(&dword_1A7EFF000, v20, OS_LOG_TYPE_DEFAULT, "returning raw representation %{public}@ for message %@", (uint8_t *)&v28, 0x16u);
        }
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      }
      else
      {
        v22 = +[MFActivityMonitor currentMonitor];
        v23 = [MEMORY[0x1E4F1CA60] dictionary];
        v24 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v22, "transportType"));
        [v23 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F5FC90]];

        v25 = [v22 error];
        if (v25) {
          [v23 setObject:v25 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
        }
        uint64_t v26 = *(void *)(a1 + 48);
        v27 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5FCD0] code:2048 userInfo:v23];
        (*(void (**)(uint64_t, void, void *))(v26 + 16))(v26, 0, v27);
      }
    }
  }
}

uint64_t __73__MFMessageContentRequest_requestRawRepresentationWithCompletionHandler___block_invoke_55(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

- (id)_dataHolderWithCancelationToken:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self) {
    options = self->_options;
  }
  else {
    options = 0;
  }
  uint64_t v6 = [(EMContentRequestOptions *)options networkUsage];
  if (self) {
    legacyMessage = self->_legacyMessage;
  }
  else {
    legacyMessage = 0;
  }
  id v8 = legacyMessage;
  v9 = EMLogCategoryMessageLoading();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = [(MFMailMessage *)v8 ef_publicDescription];
    *(_DWORD *)buf = 138543362;
    uint64_t v19 = v10;
    _os_log_impl(&dword_1A7EFF000, v9, OS_LOG_TYPE_INFO, "reading raw content for message %{public}@", buf, 0xCu);
  }
  id v11 = +[MFActivityMonitor currentMonitor];
  [v4 addCancelable:v11];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = [(MFMailMessage *)v8 messageStore];
    id v17 = 0;
    id v13 = [v12 fullBodyDataForMessage:v8 andHeaderDataIfReadilyAvailable:&v17 isComplete:0 downloadIfNecessary:v6 != 0 usePartDatas:0 didDownload:0];
    id v14 = v17;
    if (!v14)
    {
      [v12 headerDataForMessage:v8 downloadIfNecessary:v6 != 0];
      id v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = 0;
    if (v14 && v13)
    {
      v15 = [MEMORY[0x1E4F734C8] dataHolderWithData:v14];
      [v15 addData:v13];
    }
  }
  else
  {
    v15 = [(MFMailMessage *)v8 messageDataHolderIsComplete:0 downloadIfNecessary:v6 != 0];
  }

  return v15;
}

- (id)_generateRepresentationForLoadingContext:(id)a3 existingRepresentation:(id)a4 completion:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v8 = a4;
  id v31 = a5;
  v9 = EMLogCategoryMessageLoading();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [v32 message];
    id v11 = objc_msgSend(v10, "ef_publicDescription");
    *(_DWORD *)buf = 138543362;
    v44 = v11;
    _os_log_impl(&dword_1A7EFF000, v9, OS_LOG_TYPE_DEFAULT, "generate HTML representation for message: %{public}@", buf, 0xCu);
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F60D40]);
  id v13 = objc_msgSend(MEMORY[0x1E4F28F90], "discreteProgressWithTotalUnitCount:", 1, v12);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __102__MFMessageContentRequest__generateRepresentationForLoadingContext_existingRepresentation_completion___block_invoke;
  v40[3] = &unk_1E5D3B6E0;
  id v14 = v12;
  id v41 = v14;
  id v15 = v32;
  id v42 = v15;
  [v13 setCancellationHandler:v40];
  __int16 v16 = [v15 contentObservable];
  id v17 = v16;
  if (v8)
  {
    uint64_t v18 = [v16 skip:1];

    id v17 = (void *)v18;
  }
  uint64_t v19 = [MEMORY[0x1E4F60E18] promise];
  uint64_t v20 = [v19 firstResultObserverAdapter];
  id v21 = [v17 subscribe:v20];
  [v14 addCancelable:v21];

  v22 = [v19 future];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __102__MFMessageContentRequest__generateRepresentationForLoadingContext_existingRepresentation_completion___block_invoke_2;
  v38[3] = &unk_1E5D3F910;
  v38[4] = self;
  id v23 = v8;
  id v39 = v23;
  v24 = [v22 then:v38];

  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __102__MFMessageContentRequest__generateRepresentationForLoadingContext_existingRepresentation_completion___block_invoke_3;
  v35[3] = &unk_1E5D3F938;
  id v25 = v13;
  id v36 = v25;
  id v26 = v31;
  id v37 = v26;
  [v24 addSuccessBlock:v35];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __102__MFMessageContentRequest__generateRepresentationForLoadingContext_existingRepresentation_completion___block_invoke_4;
  v33[3] = &unk_1E5D3F960;
  id v27 = v26;
  id v34 = v27;
  [v24 addFailureBlock:v33];
  int v28 = v34;
  id v29 = v25;

  return v29;
}

uint64_t __102__MFMessageContentRequest__generateRepresentationForLoadingContext_existingRepresentation_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) cancel];
  v2 = *(void **)(a1 + 40);
  return [v2 cancel];
}

id __102__MFMessageContentRequest__generateRepresentationForLoadingContext_existingRepresentation_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F60CF0] + 16))())
  {
    id v4 = (void *)MEMORY[0x1E4F60D70];
    v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F5FC90];
    uint64_t v6 = (void *)MEMORY[0x1E4F28ED0];
    id v7 = +[MFActivityMonitor currentMonitor];
    id v8 = objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v7, "transportType"));
    v14[0] = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    v10 = objc_msgSend(v5, "em_internalErrorWithReason:userInfo:", @"Loading context completed without vending a result", v9);
    id v11 = [v4 futureWithError:v10];
  }
  else
  {
    id v11 = [*(id *)(a1 + 32) _contentRepresentationForLoadingEvent:v3 existingRepresentation:*(void *)(a1 + 40)];
  }

  return v11;
}

void __102__MFMessageContentRequest__generateRepresentationForLoadingContext_existingRepresentation_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) setCompletedUnitCount:1];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __102__MFMessageContentRequest__generateRepresentationForLoadingContext_existingRepresentation_completion___block_invoke_4(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    uint64_t v7 = *MEMORY[0x1E4F28A50];
    v8[0] = v3;
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  }
  else
  {
    v5 = 0;
  }
  uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5FCD0] code:2048 userInfo:v5];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_messageContentFromLoadingContext:(id)a3 completion:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v26 = a4;
  uint64_t v7 = EMLogCategoryMessageLoading();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 message];
    v9 = objc_msgSend(v8, "ef_publicDescription");
    *(_DWORD *)buf = 138543362;
    id v37 = v9;
    _os_log_impl(&dword_1A7EFF000, v7, OS_LOG_TYPE_DEFAULT, "generate original content for message: %{public}@", buf, 0xCu);
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F60D40]);
  id v11 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:1];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __72__MFMessageContentRequest__messageContentFromLoadingContext_completion___block_invoke;
  v33[3] = &unk_1E5D3B6E0;
  id v12 = v10;
  id v34 = v12;
  id v13 = v6;
  id v35 = v13;
  [v11 setCancellationHandler:v33];
  id v14 = [v13 contentObservable];
  id v15 = [MEMORY[0x1E4F60E18] promise];
  __int16 v16 = [v15 firstResultObserverAdapter];
  id v17 = [v14 subscribe:v16];
  [v12 addCancelable:v17];

  uint64_t v18 = [v15 future];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __72__MFMessageContentRequest__messageContentFromLoadingContext_completion___block_invoke_2;
  v32[3] = &unk_1E5D3F988;
  v32[4] = self;
  uint64_t v19 = [v18 then:v32];

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __72__MFMessageContentRequest__messageContentFromLoadingContext_completion___block_invoke_3;
  v29[3] = &unk_1E5D3F9B0;
  id v20 = v11;
  id v30 = v20;
  id v21 = v26;
  id v31 = v21;
  [v19 addSuccessBlock:v29];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __72__MFMessageContentRequest__messageContentFromLoadingContext_completion___block_invoke_4;
  v27[3] = &unk_1E5D3F960;
  id v22 = v21;
  id v28 = v22;
  [v19 addFailureBlock:v27];
  id v23 = v28;
  id v24 = v20;

  return v24;
}

uint64_t __72__MFMessageContentRequest__messageContentFromLoadingContext_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) cancel];
  v2 = *(void **)(a1 + 40);
  return [v2 cancel];
}

id __72__MFMessageContentRequest__messageContentFromLoadingContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F60CF0] + 16))())
  {
    id v4 = (void *)MEMORY[0x1E4F60D70];
    v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F5FC90];
    id v6 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v7 = +[MFActivityMonitor currentMonitor];
    id v8 = objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v7, "transportType"));
    v14[0] = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    id v10 = objc_msgSend(v5, "em_internalErrorWithReason:userInfo:", @"Loading context completed without vending a result", v9);
    id v11 = [v4 futureWithError:v10];
  }
  else
  {
    id v11 = [*(id *)(a1 + 32) _processContentLoadingContextEvent:v3];
  }

  return v11;
}

void __72__MFMessageContentRequest__messageContentFromLoadingContext_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) setCompletedUnitCount:1];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __72__MFMessageContentRequest__messageContentFromLoadingContext_completion___block_invoke_4(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    uint64_t v7 = *MEMORY[0x1E4F28A50];
    v8[0] = v3;
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  }
  else
  {
    v5 = 0;
  }
  id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5FCD0] code:2048 userInfo:v5];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)requestHTMLRepresentationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = _os_activity_create(&dword_1A7EFF000, "client request to generate HTML representation for message loading context", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v5, &state);
  id v6 = [MFMessageLoadingContext alloc];
  if (self) {
    legacyMessage = self->_legacyMessage;
  }
  else {
    legacyMessage = 0;
  }
  id v8 = legacyMessage;
  v9 = +[MFAttachmentManager defaultManager];
  id v10 = [(MFMessageLoadingContext *)v6 initWithMessage:v8 attachmentManager:v9];

  id v11 = [(MFMessageContentRequest *)self _generateRepresentationForLoadingContext:v10 existingRepresentation:0 completion:v4];
  if (self) {
    options = self->_options;
  }
  else {
    options = 0;
  }
  uint64_t v13 = [(EMContentRequestOptions *)options networkUsage];
  if (v13)
  {
    unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
    if (v13 == 2) {
      unint64_t v14 = 2;
    }
    BOOL v15 = v13 == 1 || v13 == 2;
    if (v13 == 1) {
      unint64_t v16 = 0;
    }
    else {
      unint64_t v16 = v14;
    }
    if (self)
    {
LABEL_15:
      scheduler = self->_scheduler;
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v19 = EMLogCategoryMessageLoading();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v20 = 0;
      _os_log_impl(&dword_1A7EFF000, v19, OS_LOG_TYPE_INFO, "Network usage is not allowed. Setting shouldDownload to NO", v20, 2u);
    }

    BOOL v15 = 0;
    unint64_t v16 = 0;
    if (self) {
      goto LABEL_15;
    }
  }
  scheduler = 0;
LABEL_16:
  [(MFMessageLoadingContext *)v10 load:v16 scheduler:scheduler shouldDownload:v15];

  os_activity_scope_leave(&state);
  return v11;
}

- (id)_processContentLoadingContextEvent:(id)a3
{
  uint64_t v164 = *MEMORY[0x1E4F143B8];
  id v101 = a3;
  uint64_t v155 = 0;
  v156 = &v155;
  uint64_t v157 = 0x2020000000;
  char v158 = 0;
  uint64_t v149 = 0;
  v150 = &v149;
  uint64_t v151 = 0x3032000000;
  v152 = __Block_byref_object_copy__16;
  v153 = __Block_byref_object_dispose__16;
  id v154 = (id)0xAAAAAAAAAAAAAAAALL;
  id v3 = objc_alloc_init(MEMORY[0x1E4F735A8]);
  __int16 v147 = -17425;
  char v148 = -65;
  id v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v147 length:3];
  [v3 appendData:v4];

  v5 = [MEMORY[0x1E4F60D70] futureWithResult:v3];

  id v154 = v5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke;
  aBlock[3] = &unk_1E5D3FA50;
  v145 = &v149;
  v146 = &v155;
  id v113 = v101;
  id v144 = v113;
  v100 = _Block_copy(aBlock);
  id v111 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v118 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v102 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v103 = [MEMORY[0x1E4F1CA60] dictionary];
  v110 = [v113 context];
  v119 = [v110 attachmentManager];
  v139[0] = MEMORY[0x1E4F143A8];
  v139[1] = 3221225472;
  v139[2] = __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke_79;
  v139[3] = &unk_1E5D3FA78;
  id v104 = v103;
  id v140 = v104;
  id v105 = v102;
  id v141 = v105;
  id v107 = v100;
  id v142 = v107;
  v108 = (void (**)(void *, void *, id))_Block_copy(v139);
  long long v137 = 0u;
  long long v138 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  id obj = [v113 content];
  uint64_t v6 = [obj countByEnumeratingWithState:&v135 objects:v163 count:16];
  if (v6)
  {
    uint64_t v116 = *(void *)v136;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v136 != v116) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v135 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x1AD0E3E00]();
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = [v119 attachmentForTextAttachment:v8 error:0];
          if (v10)
          {
            id v11 = [v113 message];
            id v12 = -[MFMessageContentRequest _contentItemForAttachment:manager:managed:](self, "_contentItemForAttachment:manager:managed:", v10, v119, [v11 sourceIsManaged]);

            [v111 addObject:v12];
            uint64_t v13 = [v10 url];
            [v118 addObject:v13];

            v108[2](v108, v12, v10);
LABEL_23:
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v10 = v8;
            id v12 = [v10 htmlData];
            if (v12)
            {
              unint64_t v14 = [v10 preferredCharacterSet];
              int v15 = MFEncodingForCharset();
              int v134 = -1;
              unint64_t v16 = (void *)MFCreateStringWithData();
              if (!v16 && v15 != -1) {
                unint64_t v16 = (void *)MFCreateStringWithData();
              }
              if (v16)
              {
                id v17 = EMLogCategoryMessageLoading();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)v160 = v15;
                  *(_WORD *)&v160[4] = 1024;
                  *(_DWORD *)&v160[6] = v134;
                  _os_log_impl(&dword_1A7EFF000, v17, OS_LOG_TYPE_INFO, "decoded HTML data with preferred encoding %x, used encoding %x", buf, 0xEu);
                }

                uint64_t v18 = [MEMORY[0x1E4F60D70] futureWithResult:v16];
                (*((void (**)(id, NSObject *))v107 + 2))(v107, v18);
              }
              else
              {
                uint64_t v18 = EMLogCategoryMessageLoading();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v19 = [v12 length];
                  *(_DWORD *)buf = 134218240;
                  *(void *)v160 = v19;
                  *(_WORD *)&v160[8] = 1024;
                  LODWORD(v161) = v15;
                  _os_log_error_impl(&dword_1A7EFF000, v18, OS_LOG_TYPE_ERROR, "failed to decode HTML data with length %lu and preferred encoding %x", buf, 0x12u);
                }
              }
            }
            goto LABEL_23;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_25;
          }
          id v10 = [MEMORY[0x1E4F60D70] futureWithResult:v8];
          (*((void (**)(id, id))v107 + 2))(v107, v10);
        }

LABEL_25:
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v135 objects:v163 count:16];
    }
    while (v6);
  }

  [v113 loadedBody];
  long long v132 = 0u;
  long long v133 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  v106 = id v20 = v110;
  id v21 = [v106 attachments];
  id v109 = v21;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v130 objects:v162 count:16];
  if (v22)
  {
    id obja = 0;
    uint64_t v117 = *(void *)v131;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v131 != v117) {
          objc_enumerationMutation(v109);
        }
        id v24 = *(void **)(*((void *)&v130 + 1) + 8 * j);
        id v25 = [v119 attachmentForTextAttachment:v24 error:0];
        id v26 = v25;
        if (v25)
        {
          id v27 = [v25 url];
          if ([v118 containsObject:v27])
          {
            id v28 = v26;
          }
          else
          {
            [v118 addObject:v27];
            id v29 = [v24 mimePart];
            id v30 = [v29 contentID];
            if (v30)
            {
              id v31 = [v20 message];
              id v32 = +[MFMailDropAttachmentPreviewDataProvider fullResolutionStorageLocationForAttachmentWithMimePart:v29 withMessage:v31];

              if (v32
                && ([MEMORY[0x1E4F28CB8] defaultManager],
                    id v33 = objc_claimAutoreleasedReturnValue(),
                    int v34 = [v33 fileExistsAtPath:v32],
                    v33,
                    v34))
              {
                id v35 = [v29 partURL];
                id v36 = +[MFMailDropAttachmentPreviewDataProvider fullResolutionAttachmentURLForAttachmentURL:v35];

                id v28 = [v119 attachmentForURL:v36 withMimeBody:v106 error:0];
                [v28 setContentID:v30];
              }
              else
              {
                id v28 = v26;
              }
            }
            else
            {
              id v28 = v26;
            }
            id v37 = [v113 message];
            uint64_t v38 = -[MFMessageContentRequest _contentItemForAttachment:manager:managed:](self, "_contentItemForAttachment:manager:managed:", v28, v119, [v37 sourceIsManaged]);

            [v111 addObject:v38];
            if (obja) {
              goto LABEL_43;
            }
            id v42 = [(id)v150[5] resultIfAvailable];
            v43 = [v42 data];

            if (!v43) {
              goto LABEL_49;
            }
            objc_msgSend(NSString, "mf_stringWithData:encoding:", v43, 4);
            id obja = (id)objc_claimAutoreleasedReturnValue();

            if (obja)
            {
LABEL_43:
              id v39 = [v27 absoluteString];
              if ([obja rangeOfString:v39] == 0x7FFFFFFFFFFFFFFFLL)
              {
                v40 = [v38 contentID];
                BOOL v41 = [obja rangeOfString:v40] == 0x7FFFFFFFFFFFFFFFLL;

                if (v41) {
                  v108[2](v108, v38, v28);
                }
              }
              else
              {
              }
            }
            else
            {
LABEL_49:
              id obja = 0;
            }
          }
          id v20 = v110;
        }
      }
      id v21 = v109;
      uint64_t v22 = [v109 countByEnumeratingWithState:&v130 objects:v162 count:16];
    }
    while (v22);
  }
  else
  {
    id obja = 0;
  }

  if ([v105 count])
  {
    v128[0] = MEMORY[0x1E4F143A8];
    v128[1] = 3221225472;
    v128[2] = __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke_86;
    v128[3] = &unk_1E5D3F348;
    id v44 = v104;
    id v129 = v44;
    uint64_t v45 = [(MFMessageContentRequest *)self delegateWithErrorHandler:v128];
    if (v45)
    {
      objectID = self;
      if (self) {
        objectID = self->_objectID;
      }
      id v47 = objectID;
      v126[0] = MEMORY[0x1E4F143A8];
      v126[1] = 3221225472;
      v126[2] = __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke_2_92;
      v126[3] = &unk_1E5D3FAC8;
      id v48 = v44;
      id v127 = v48;
      [v45 contentObjectID:v47 generateHTMLSnippetsForRelatedContentItems:v105 completionHandler:v126];

      v49 = [v48 allValues];
      v50 = objc_msgSend(MEMORY[0x1E4F28C58], "em_internalErrorWithReason:", @"delegate failed to return a snippet for attachment");
      [v49 makeObjectsPerformSelector:sel_finishWithError_ withObject:v50];

      v51 = v127;
    }
    else
    {
      v51 = [v44 allValues];
      v52 = objc_msgSend(MEMORY[0x1E4F28C58], "em_internalErrorWithReason:", @"Failed to generate snippets for attachments: nil delegate");
      [v51 makeObjectsPerformSelector:sel_finishWithError_ withObject:v52];
    }
  }
  if (*((unsigned char *)v156 + 24)) {
    goto LABEL_64;
  }
  v53 = [MEMORY[0x1E4F1CA60] dictionary];
  v70 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v113, "transportType"));
  [v53 setObject:v70 forKeyedSubscript:*MEMORY[0x1E4F5FC90]];

  v71 = [v113 error];
  [v53 setObject:v71 forKeyedSubscript:*MEMORY[0x1E4F28A50]];

  v72 = [v113 error];

  if (v72)
  {
    v73 = (void *)MEMORY[0x1E4F60D70];
    v54 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5FCD0] code:2049 userInfo:v53];
    uint64_t v74 = [v73 futureWithError:v54];
LABEL_98:
    v69 = (void *)v74;
    goto LABEL_99;
  }
  if (![v113 hasLoadedBestAlternativePart]
    || ([v113 hasLoadedCompleteBody] & 1) == 0)
  {
    v81 = EMLogCategoryMessageLoading();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      legacyMessage = self;
      if (self) {
        legacyMessage = self->_legacyMessage;
      }
      id v83 = legacyMessage;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v84 = self;
        if (self) {
          v84 = self->_legacyMessage;
        }
        id v85 = v84;
        uint64_t v86 = [v85 objectID];
      }
      else
      {
        v87 = self;
        if (self) {
          v87 = self->_legacyMessage;
        }
        id v85 = v87;
        uint64_t v86 = [v85 messageIDHeaderHash];
      }
      v88 = (void *)v86;
      *(_DWORD *)buf = 138543362;
      *(void *)v160 = v86;
      _os_log_impl(&dword_1A7EFF000, v81, OS_LOG_TYPE_DEFAULT, "Could not create a body subset from partials for message: %{public}@", buf, 0xCu);
    }
    v89 = (void *)MEMORY[0x1E4F60D70];
    v54 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5FCD0] code:2048 userInfo:v53];
    uint64_t v74 = [v89 futureWithError:v54];
    goto LABEL_98;
  }
  v75 = EMLogCategoryMessageLoading();
  if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
  {
    v76 = self;
    if (self) {
      v76 = self->_legacyMessage;
    }
    id v77 = v76;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v78 = self;
      if (self) {
        v78 = self->_legacyMessage;
      }
      id v79 = v78;
      uint64_t v80 = [v79 objectID];
    }
    else
    {
      v91 = self;
      if (self) {
        v91 = self->_legacyMessage;
      }
      id v79 = v91;
      uint64_t v80 = [v79 messageIDHeaderHash];
    }
    v92 = (void *)v80;
    *(_DWORD *)buf = 138543362;
    *(void *)v160 = v80;
    _os_log_impl(&dword_1A7EFF000, v75, OS_LOG_TYPE_DEFAULT, "Did not find any content for message: %{public}@, using placeholder html", buf, 0xCu);
  }
  v93 = [MEMORY[0x1E4F60E18] promise];
  v124[0] = MEMORY[0x1E4F143A8];
  v124[1] = 3221225472;
  v124[2] = __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke_108;
  v124[3] = &unk_1E5D3F348;
  id v94 = v93;
  id v125 = v94;
  v95 = [(MFMessageContentRequest *)self delegateWithErrorHandler:v124];
  if (v95)
  {
    v96 = self;
    if (self) {
      v96 = self->_objectID;
    }
    id v97 = v96;
    v122[0] = MEMORY[0x1E4F143A8];
    v122[1] = 3221225472;
    v122[2] = __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke_2_112;
    v122[3] = &unk_1E5D3FAF0;
    id v123 = v94;
    [v95 contentObjectID:v97 placeholderHTMLForEmptyContentWithCompletionHandler:v122];

    v98 = v123;
  }
  else
  {
    v98 = objc_msgSend(MEMORY[0x1E4F28C58], "em_internalErrorWithReason:", @"Failed to generate no content string: nil delegate");
    [v94 finishWithError:v98];
  }

  v99 = [v94 future];
  (*((void (**)(id, void *))v107 + 2))(v107, v99);

LABEL_64:
  v53 = [(id)v150[5] result:0];
  [v53 done];
  v54 = [v53 data];
  v55 = (void *)MEMORY[0x1E4F60248];
  clientIdentifier = self->_clientIdentifier;
  v57 = objc_msgSend(NSString, "ef_UUID");
  id v120 = 0;
  id v121 = 0;
  v58 = [v55 temporaryURLWithData:v54 clientIdentifier:clientIdentifier preferredFilename:v57 pathExtension:@"html" cleanupInvocable:&v121 error:&v120];
  id v59 = v121;
  id v60 = v120;

  if (v58)
  {
    v61 = EMLogCategoryMessageLoading();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
    {
      uint64_t v62 = [v54 length];
      *(_DWORD *)buf = 138412546;
      *(void *)v160 = v58;
      *(_WORD *)&v160[8] = 2048;
      uint64_t v161 = v62;
      _os_log_impl(&dword_1A7EFF000, v61, OS_LOG_TYPE_INFO, "generated initial HTML content at URL %@: %lu bytes", buf, 0x16u);
    }

    v63 = objc_opt_new();
    -[_MFLoadingContextEventResult setContentURL:]((uint64_t)v63, v58);
    -[_MFLoadingContextEventResult setCleanupInvocable:]((uint64_t)v63, v59);
    -[_MFLoadingContextEventResult setRelatedContentItems:]((uint64_t)v63, v111);
    v64 = [v113 message];
    v65 = [v64 globalMessageURL];
    -[_MFLoadingContextEventResult setPublicMessageURL:]((uint64_t)v63, v65);

    if (_os_feature_enabled_impl() && (EMIsGreymatterSupportedWithOverride() & 1) != 0
      || _os_feature_enabled_impl() && EMIsGreymatterSupportedWithOverride())
    {
      v66 = (void *)MEMORY[0x1E4F60DF0];
      v67 = [v113 message];
      v68 = [v66 pairWithFirst:v67 second:v54];
      -[_MFLoadingContextEventResult setMessageAndHTMLDataPair:]((uint64_t)v63, v68);
    }
    v69 = [MEMORY[0x1E4F60D70] futureWithResult:v63];
  }
  else
  {
    v69 = [MEMORY[0x1E4F60D70] futureWithError:v60];
  }

LABEL_99:
  _Block_object_dispose(&v149, 8);

  _Block_object_dispose(&v155, 8);
  return v69;
}

void __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke_2;
  v10[3] = &unk_1E5D3FA28;
  uint64_t v5 = *(void *)(a1 + 48);
  id v11 = v3;
  uint64_t v13 = v5;
  id v12 = *(id *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = [v4 then:v10];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

id __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke_3;
  v14[3] = &unk_1E5D3F9D8;
  id v5 = v3;
  uint64_t v6 = *(void *)(a1 + 48);
  id v15 = v5;
  uint64_t v16 = v6;
  uint64_t v7 = [v4 then:v14];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke_4;
  v11[3] = &unk_1E5D3FA00;
  id v12 = *(id *)(a1 + 40);
  id v8 = v5;
  id v13 = v8;
  v9 = [v7 recover:v11];

  return v9;
}

id __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 dataUsingEncoding:4];
  [v4 appendData:v5];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  uint64_t v6 = [MEMORY[0x1E4F60D70] futureWithResult:*(void *)(a1 + 32)];

  return v6;
}

id __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = EMLogCategoryMessageLoading();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = [*(id *)(a1 + 32) message];
    id v8 = objc_msgSend(v7, "ef_publicDescription");
    v9 = objc_msgSend(v3, "ef_publicDescription");
    int v10 = 138543618;
    id v11 = v8;
    __int16 v12 = 2114;
    id v13 = v9;
    _os_log_error_impl(&dword_1A7EFF000, v4, OS_LOG_TYPE_ERROR, "error when generating body string component for message %{public}@: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  id v5 = [MEMORY[0x1E4F60D70] futureWithResult:*(void *)(a1 + 40)];

  return v5;
}

void __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke_79(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 contentID];
  id v8 = EMLogCategoryMessageLoading();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v6 url];
    int v15 = 138412546;
    uint64_t v16 = v7;
    __int16 v17 = 2112;
    uint64_t v18 = v9;
    _os_log_impl(&dword_1A7EFF000, v8, OS_LOG_TYPE_DEFAULT, "Add attachment with contentID: %@ url: %@", (uint8_t *)&v15, 0x16u);
  }
  int v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
  BOOL v11 = v10 == 0;

  if (!v11)
  {
    __int16 v12 = EMLogCategoryMessageLoading();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke_79_cold_1((uint64_t)v7, v12);
    }
    goto LABEL_8;
  }
  __int16 v12 = [MEMORY[0x1E4F60E18] promise];
  [*(id *)(a1 + 40) addObject:v5];
  [*(id *)(a1 + 32) setObject:v12 forKeyedSubscript:v7];
  if (v12)
  {
    uint64_t v13 = *(void *)(a1 + 48);
    uint64_t v14 = [v12 future];
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);

LABEL_8:
  }
}

void __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke_86(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = *MEMORY[0x1E4F28A50];
  v9[0] = v3;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v6 = objc_msgSend(v4, "em_internalErrorWithReason:userInfo:", @"connection failure during delegate snippet request", v5);

  uint64_t v7 = [*(id *)(a1 + 32) allValues];
  [v7 makeObjectsPerformSelector:sel_finishWithError_ withObject:v6];
}

void __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke_2_92(uint64_t a1, void *a2, void *a3)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke_3_99;
    v12[3] = &unk_1E5D3FAA0;
    id v13 = *(id *)(a1 + 32);
    [v5 enumerateKeysAndObjectsUsingBlock:v12];
    uint64_t v8 = v13;
  }
  else
  {
    if (!v6)
    {
      uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28C58], "em_internalErrorWithReason:", @"nil snippets from delegate, but missing error");
    }
    v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28A50];
    v15[0] = v7;
    int v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    uint64_t v8 = objc_msgSend(v9, "em_internalErrorWithReason:userInfo:", @"failed to generate any attachment snippets", v10);

    BOOL v11 = [*(id *)(a1 + 32) allValues];
    [v11 makeObjectsPerformSelector:sel_finishWithError_ withObject:v8];
  }
}

void __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke_3_99(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  [v5 finishWithResult:v6];
}

void __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke_108(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v7 = *MEMORY[0x1E4F28A50];
  v8[0] = v3;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v6 = objc_msgSend(v4, "em_internalErrorWithReason:userInfo:", @"Failed to generate no content string: delegate connection error", v5);

  [*(id *)(a1 + 32) finishWithError:v6];
}

void __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke_2_112(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = v5;
  uint64_t v7 = *(void **)(a1 + 32);
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:");
  }
  else
  {
    uint64_t v8 = v5;
    if (!v5)
    {
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "em_internalErrorWithReason:", @"Failed to generate no content string: non-nil delegate, nil placeholderHTML and nil error");
    }
    [v7 finishWithError:v8];
    if (!v6) {
  }
    }
}

- (id)_contentRepresentationForLoadingEvent:(id)a3 existingRepresentation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MFMessageContentRequest *)self _processContentLoadingContextEvent:v6];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke;
  v18[3] = &unk_1E5D3FB68;
  v18[4] = self;
  id v9 = v6;
  id v19 = v9;
  int v10 = [v8 then:v18];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_134;
  v15[3] = &unk_1E5D3FB90;
  void v15[4] = self;
  id v11 = v9;
  id v16 = v11;
  id v12 = v7;
  id v17 = v12;
  id v13 = [v10 then:v15];

  return v13;
}

id __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F60E18] promise];
  id v5 = *(void **)(a1 + 32);
  if (v5) {
    id v5 = (void *)v5[3];
  }
  id v6 = v5;
  id v7 = *(void **)(a1 + 32);
  if (v7) {
    id v7 = (void *)v7[2];
  }
  uint64_t v8 = v7;
  id v9 = [v6 mailDropAttachmentPresentForMessage:v8];

  if (v9 && ([v9 BOOLValue] & 1) == 0)
  {
    [v4 finishWithResult:v3];
    uint64_t v22 = [v4 future];
  }
  else
  {
    int v10 = *(void **)(a1 + 32);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_2;
    v34[3] = &unk_1E5D3E220;
    id v11 = v4;
    id v35 = v11;
    id v12 = v3;
    id v36 = v12;
    id v13 = [v10 delegateWithErrorHandler:v34];
    uint64_t v14 = *(void **)(a1 + 32);
    if (v14) {
      uint64_t v14 = (void *)v14[8];
    }
    int v15 = v14;
    if (v12) {
      id v16 = (void *)v12[1];
    }
    else {
      id v16 = 0;
    }
    id v17 = v16;
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    id v26 = __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_128;
    id v27 = &unk_1E5D3FB40;
    id v18 = v9;
    uint64_t v19 = *(void *)(a1 + 32);
    id v28 = v18;
    uint64_t v29 = v19;
    id v30 = v12;
    id v31 = *(id *)(a1 + 40);
    id v20 = v13;
    id v32 = v20;
    id v21 = v11;
    id v33 = v21;
    [v15 generateMailDropMetadataForContentURL:v17 completionHandler:&v24];

    uint64_t v22 = objc_msgSend(v21, "future", v24, v25, v26, v27);
  }
  return v22;
}

void __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = EMLogCategoryMessageLoading();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v3, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_2_cold_1();
  }

  [*(id *)(a1 + 32) finishWithResult:*(void *)(a1 + 40)];
}

void __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_128(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 count];
  if (!*(void *)(a1 + 32) && (!v6 || (objc_msgSend(v6, "ef_isTimeoutError") & 1) == 0))
  {
    uint64_t v8 = [(id)objc_opt_class() databaseWriteScheduler];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_2_129;
    v26[3] = &unk_1E5D3B5E8;
    v26[4] = *(void *)(a1 + 40);
    BOOL v27 = v7 != 0;
    [v8 performBlock:v26];
  }
  if (v7)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    int v10 = v9;
    uint64_t v11 = *(void *)(a1 + 48);
    if (v11) {
      uint64_t v12 = *(void *)(v11 + 16);
    }
    else {
      uint64_t v12 = 0;
    }
    [v9 addObjectsFromArray:v12];
    id v13 = *(void **)(a1 + 40);
    uint64_t v14 = [*(id *)(a1 + 56) context];
    int v15 = [v13 _attachmentContentItemsForMailDropNodes:v5 withContext:v14];

    [v10 addObjectsFromArray:v15];
    -[_MFLoadingContextEventResult setRelatedContentItems:](*(void *)(a1 + 48), v10);
    id v16 = *(void **)(a1 + 64);
    id v17 = *(void **)(a1 + 40);
    if (v17) {
      id v17 = (void *)v17[2];
    }
    id v18 = v17;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_3;
    v22[3] = &unk_1E5D3FB18;
    id v23 = *(id *)(a1 + 72);
    id v19 = *(id *)(a1 + 48);
    uint64_t v20 = *(void *)(a1 + 40);
    id v24 = v19;
    uint64_t v25 = v20;
    [v16 contentObjectID:v18 generateHTMLSnippetsForMailDropContentItems:v15 completionHandler:v22];
  }
  else
  {
    if (!v5)
    {
      id v21 = EMLogCategoryMessageLoading();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_128_cold_1();
      }
    }
    [*(id *)(a1 + 72) finishWithResult:*(void *)(a1 + 48)];
  }
}

void __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_2_129(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2) {
    v2 = (void *)v2[3];
  }
  id v3 = v2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v5 = *(void *)(v4 + 16);
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v3;
  [v3 setIsMailDropAttachmentPresent:*(unsigned __int8 *)(a1 + 40) != 0 forMessage:v5];
}

void __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5)
  {
    if (v6)
    {
      int v10 = EMLogCategoryMessageLoading();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_3_cold_1();
      }
    }
    goto LABEL_8;
  }
  if (![v5 count])
  {
LABEL_8:
    [*(id *)(a1 + 32) finishWithResult:*(void *)(a1 + 40)];
    goto LABEL_9;
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_130;
  v12[3] = &unk_1E5D3DDF0;
  int8x16_t v11 = *(int8x16_t *)(a1 + 40);
  id v8 = (id)v11.i64[0];
  int8x16_t v13 = vextq_s8(v11, v11, 8uLL);
  id v14 = v5;
  id v15 = *(id *)(a1 + 32);
  id v9 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  [v9 performBlock:v12];

LABEL_9:
}

void __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_130(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2) {
    v2 = (void *)v2[8];
  }
  id v3 = v2;
  uint64_t v4 = *(void **)(a1 + 40);
  if (v4) {
    uint64_t v4 = (void *)v4[1];
  }
  id v5 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_2_131;
  v7[3] = &unk_1E5D3E220;
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 40);
  [v3 insertMailDropAttachmentViewForContentURL:v5 HTMLByContentID:v6 completionHandler:v7];
}

void __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_2_131(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = EMLogCategoryMessageLoading();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_2_131_cold_1();
    }
  }
  [*(id *)(a1 + 32) finishWithResult:*(void *)(a1 + 40)];
}

id __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_134(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  id v5 = (void *)a1[4];
  uint64_t v6 = a1[5];
  if (v3)
  {
    id v7 = v3[1];
    id v8 = v4[2];
    id v9 = v4[5];
    id v10 = v4[3];
  }
  else
  {
    id v9 = 0;
    id v7 = 0;
    id v8 = 0;
    id v10 = 0;
  }
  int8x16_t v11 = [v5 _contentRepresentationForEvent:v6 contentURL:v7 relatedItems:v8 messageAndHTMLDataPair:v9 existingRepresentation:a1[6] invocable:v10];

  if (v4) {
    id v12 = v4[4];
  }
  else {
    id v12 = 0;
  }
  [v11 setPublicMessageURL:v12];
  uint64_t v13 = a1[4];
  if (v13) {
    id v14 = *(void **)(v13 + 32);
  }
  else {
    id v14 = 0;
  }
  id v15 = [v14 headersIfAvailable];
  uint64_t v16 = (void *)[v15 copyAddressListForReplyTo];
  [v11 setReplyToList:v16];

  id v17 = [MEMORY[0x1E4F60D70] futureWithResult:v11];

  return v17;
}

- (id)_contentRepresentationForEvent:(id)a3 contentURL:(id)a4 relatedItems:(id)a5 messageAndHTMLDataPair:(id)a6 existingRepresentation:(id)a7 invocable:(id)a8
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v42 = a4;
  id v43 = a5;
  id v41 = a6;
  id v15 = a7;
  id v40 = a8;
  uint64_t v16 = +[MFMessageLoadingContextToEMSecurityInformationTransformer securityInformationFromMFMessageLoadingContextEvent:v14];
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F60248]) initWithContentURL:v42 relatedItems:v43 securityInformation:v16];
  objc_msgSend(v17, "setTransportType:", objc_msgSend(v14, "transportType"));
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __138__MFMessageContentRequest__contentRepresentationForEvent_contentURL_relatedItems_messageAndHTMLDataPair_existingRepresentation_invocable___block_invoke;
  v54[3] = &unk_1E5D3B5C0;
  id v18 = v40;
  id v55 = v18;
  [v17 addInvalidationHandler:v54];
  if (self) {
    legacyMessage = self->_legacyMessage;
  }
  else {
    legacyMessage = 0;
  }
  [(MFMessageContentRequest *)self _includeSuggestionItemsIfNeededForRepresentation:v17 message:legacyMessage];
  if (self) {
    uint64_t v20 = self->_legacyMessage;
  }
  else {
    uint64_t v20 = 0;
  }
  [(MFMessageContentRequest *)self _includeCachedMetadataJSONIfNeededForRepresentation:v17 message:v20];
  if (self)
  {
    id v21 = self->_legacyMessage;
    options = self->_options;
  }
  else
  {
    id v21 = 0;
    options = 0;
  }
  [(MFMessageContentRequest *)self _includeHeadersIfNeededForRepresentation:v17 message:v21 options:options];

  if ([v14 hasLoadedBestAlternativePart]) {
    uint64_t v23 = 0;
  }
  else {
    uint64_t v23 = 2;
  }
  if (![v14 hasLoadedBestAlternativePart]
    || ([v14 hasLoadedCompleteBody] & 1) == 0)
  {
    id v24 = [v14 context];
    if (!v15) {
      id v15 = v17;
    }
    [v17 setHasMoreContent:1];
    if ([v14 hasLoadedCompleteBody]) {
      uint64_t v25 = 0;
    }
    else {
      uint64_t v25 = [v14 remainingBytes];
    }
    [v17 setRemainingByteCount:v25];
    *(void *)location = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)location, v15);
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __138__MFMessageContentRequest__contentRepresentationForEvent_contentURL_relatedItems_messageAndHTMLDataPair_existingRepresentation_invocable___block_invoke_2;
    v51[3] = &unk_1E5D3FBE0;
    objc_copyWeak(v53, (id *)location);
    v51[4] = self;
    id v26 = v24;
    id v52 = v26;
    v53[1] = (id)v23;
    [v17 setRequestMoreContentBlock:v51];

    objc_destroyWeak(v53);
    objc_destroyWeak((id *)location);
  }
  BOOL v27 = [v17 unsubscribeCommand];

  if (v27)
  {
    *(void *)location = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)location, v17);
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __138__MFMessageContentRequest__contentRepresentationForEvent_contentURL_relatedItems_messageAndHTMLDataPair_existingRepresentation_invocable___block_invoke_4;
    v49[3] = &unk_1E5D3FC30;
    objc_copyWeak(&v50, (id *)location);
    v49[4] = self;
    [v17 setListUnsubscribeBlock:v49];
    objc_destroyWeak(&v50);
    objc_destroyWeak((id *)location);
  }
  if (self) {
    uint64_t v28 = self->_options;
  }
  else {
    uint64_t v28 = 0;
  }
  uint64_t v29 = [(EMContentRequestOptions *)v28 maximumNumberOfOriginalContentMessagesToRequest];
  if _os_feature_enabled_impl() && (EMIsGreymatterSupportedWithOverride())
  {
    if (!v29) {
      goto LABEL_36;
    }
  }
  else
  {
    if (!_os_feature_enabled_impl()) {
      goto LABEL_36;
    }
    char v30 = EMIsGreymatterSupportedWithOverride();
    char v31 = v29 ? v30 : 0;
    if ((v31 & 1) == 0) {
      goto LABEL_36;
    }
  }
  id v32 = EMLogCategoryMessageLoading();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)location = 138543618;
    *(void *)&location[4] = self;
    __int16 v57 = 2050;
    uint64_t v58 = v29;
    _os_log_impl(&dword_1A7EFF000, v32, OS_LOG_TYPE_DEFAULT, "[SmartReply] %{public}@ Pre-fetching a maximum of %{public}lu original-content messages", location, 0x16u);
  }

  id v33 = [MEMORY[0x1E4F60E18] promise];
  if (self) {
    int v34 = self->_legacyMessage;
  }
  else {
    int v34 = 0;
  }
  id v35 = v34;
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __138__MFMessageContentRequest__contentRepresentationForEvent_contentURL_relatedItems_messageAndHTMLDataPair_existingRepresentation_invocable___block_invoke_139;
  v47[3] = &unk_1E5D3FC58;
  v47[4] = self;
  id v36 = v33;
  id v48 = v36;
  [(MFMessageContentRequest *)self _originalContentMessagesInReplyToLegacyMessage:v35 withMessageAndHTMLDataPair:v41 maximumNumberOfMessages:v29 completion:v47];

  id v37 = [v36 future];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __138__MFMessageContentRequest__contentRepresentationForEvent_contentURL_relatedItems_messageAndHTMLDataPair_existingRepresentation_invocable___block_invoke_140;
  v44[3] = &unk_1E5D3FCA8;
  id v45 = v37;
  v46 = self;
  id v38 = v37;
  [v17 setRequestOriginalContentMessagesInReplyToContentItemBlock:v44];

LABEL_36:
  return v17;
}

uint64_t __138__MFMessageContentRequest__contentRepresentationForEvent_contentURL_relatedItems_messageAndHTMLDataPair_existingRepresentation_invocable___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invoke];
}

id __138__MFMessageContentRequest__contentRepresentationForEvent_contentURL_relatedItems_messageAndHTMLDataPair_existingRepresentation_invocable___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = _os_activity_create(&dword_1A7EFF000, "client request to load more HTML for message loading context", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v5, &state);
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __138__MFMessageContentRequest__contentRepresentationForEvent_contentURL_relatedItems_messageAndHTMLDataPair_existingRepresentation_invocable___block_invoke_3;
  id v17 = &unk_1E5D3FBB8;
  id v8 = WeakRetained;
  id v18 = v8;
  id v9 = v3;
  id v19 = v9;
  id v10 = [v6 _generateRepresentationForLoadingContext:v7 existingRepresentation:v8 completion:&v14];
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    uint64_t v12 = *(void *)(v11 + 8);
  }
  else {
    uint64_t v12 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "load:scheduler:shouldDownload:", *(void *)(a1 + 56), v12, 1, v14, v15, v16, v17);

  os_activity_scope_leave(&state);
  return v10;
}

void __138__MFMessageContentRequest__contentRepresentationForEvent_contentURL_relatedItems_messageAndHTMLDataPair_existingRepresentation_invocable___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5 && *(void *)(a1 + 32))
  {
    uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v8 = [*(id *)(a1 + 32) contentURL];
    id v9 = [v5 contentURL];
    id v15 = v6;
    char v10 = [v7 replaceItemAtURL:v8 withItemAtURL:v9 backupItemName:0 options:1 resultingItemURL:0 error:&v15];
    id v11 = v15;

    if (v10)
    {
      [*(id *)(a1 + 32) mergeUpdatedRepresentation:v5];
      uint64_t v12 = [v5 requestMoreContentBlock];
      [*(id *)(a1 + 32) setRequestMoreContentBlock:v12];
      id v6 = v11;
    }
    else
    {
      uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F28A50];
      v17[0] = v11;
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
      id v6 = [v13 errorWithDomain:*MEMORY[0x1E4F5FCD0] code:2048 userInfo:v14];

      uint64_t v12 = v5;
      id v5 = 0;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id __138__MFMessageContentRequest__contentRepresentationForEvent_contentURL_relatedItems_messageAndHTMLDataPair_existingRepresentation_invocable___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:1];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = [WeakRetained unsubscribeCommand];
  if (v8)
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __138__MFMessageContentRequest__contentRepresentationForEvent_contentURL_relatedItems_messageAndHTMLDataPair_existingRepresentation_invocable___block_invoke_5;
    id v17 = &unk_1E5D3FC08;
    id v18 = v6;
    id v19 = v5;
    id v9 = _Block_copy(&v14);
    char v10 = *(void **)(a1 + 32);
    if (v10) {
      char v10 = (void *)v10[9];
    }
    id v11 = v10;
    uint64_t v12 = v11;
    if (a2 == 1) {
      objc_msgSend(v11, "unsubscribeWithCommand:completion:", v8, v9, v14, v15, v16, v17, v18);
    }
    else {
      objc_msgSend(v11, "ignoreWithCommand:completion:", v8, v9, v14, v15, v16, v17, v18);
    }
  }
  else
  {
    [v6 setCompletedUnitCount:1];
    (*((void (**)(id, void))v5 + 2))(v5, 0);
  }

  return v6;
}

void __138__MFMessageContentRequest__contentRepresentationForEvent_contentURL_relatedItems_messageAndHTMLDataPair_existingRepresentation_invocable___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) setCompletedUnitCount:1];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __138__MFMessageContentRequest__contentRepresentationForEvent_contentURL_relatedItems_messageAndHTMLDataPair_existingRepresentation_invocable___block_invoke_139(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = EMLogCategoryMessageLoading();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138543874;
    uint64_t v10 = v8;
    __int16 v11 = 2050;
    uint64_t v12 = [v5 count];
    __int16 v13 = 2114;
    id v14 = v5;
    _os_log_impl(&dword_1A7EFF000, v7, OS_LOG_TYPE_DEFAULT, "[SmartReply] %{public}@ Finished pre-fetching %{public}lu original-content messages: %{public}@", (uint8_t *)&v9, 0x20u);
  }

  [*(id *)(a1 + 40) finishWithResult:v5 error:v6];
}

void __138__MFMessageContentRequest__contentRepresentationForEvent_contentURL_relatedItems_messageAndHTMLDataPair_existingRepresentation_invocable___block_invoke_140(uint64_t a1, void *a2)
{
  id v3 = a2;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __138__MFMessageContentRequest__contentRepresentationForEvent_contentURL_relatedItems_messageAndHTMLDataPair_existingRepresentation_invocable___block_invoke_2_141;
  v10[3] = &unk_1E5D3FC80;
  uint64_t v4 = *(void **)(a1 + 32);
  void v10[4] = *(void *)(a1 + 40);
  id v5 = v3;
  id v11 = v5;
  [v4 addSuccessBlock:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __138__MFMessageContentRequest__contentRepresentationForEvent_contentURL_relatedItems_messageAndHTMLDataPair_existingRepresentation_invocable___block_invoke_143;
  v8[3] = &unk_1E5D3FC08;
  id v6 = *(void **)(a1 + 32);
  v8[4] = *(void *)(a1 + 40);
  id v7 = v5;
  id v9 = v7;
  [v6 addFailureBlock:v8];
}

void __138__MFMessageContentRequest__contentRepresentationForEvent_contentURL_relatedItems_messageAndHTMLDataPair_existingRepresentation_invocable___block_invoke_2_141(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = EMLogCategoryMessageLoading();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543874;
    uint64_t v7 = v5;
    __int16 v8 = 2050;
    uint64_t v9 = [v3 count];
    __int16 v10 = 2114;
    id v11 = v3;
    _os_log_impl(&dword_1A7EFF000, v4, OS_LOG_TYPE_DEFAULT, "[SmartReply] %{public}@ Returning %{public}lu original-content messages: %{public}@", (uint8_t *)&v6, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __138__MFMessageContentRequest__contentRepresentationForEvent_contentURL_relatedItems_messageAndHTMLDataPair_existingRepresentation_invocable___block_invoke_143(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = EMLogCategoryMessageLoading();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = objc_msgSend(v3, "ef_publicDescription");
    int v7 = 138543618;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    __int16 v10 = v6;
    _os_log_impl(&dword_1A7EFF000, v4, OS_LOG_TYPE_DEFAULT, "[SmartReply] %{public}@ Failed to return original-content messages with error: %@{public}", (uint8_t *)&v7, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_includeSuggestionItemsIfNeededForRepresentation:(id)a3 message:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  if (self) {
    options = self->_options;
  }
  else {
    options = 0;
  }
  uint64_t v8 = [(EMContentRequestOptions *)options includeSuggestionItems];
  if (v8 == 2
    || v8 == 1
    && ([v6 mailbox],
        __int16 v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v9 isOutgoingMailboxUid],
        v9,
        (v10 & 1) == 0))
  {
    uint64_t v11 = +[MFSearchableIndexItem_iOS suggestionsSearchableItemWithMessage:v6];
    [v14 setSearchableItem:v11];

    id v12 = objc_alloc_init(MEMORY[0x1E4F602E8]);
    __int16 v13 = [v12 commandForMessage:v6];
    [v14 setUnsubscribeCommand:v13];
  }
}

- (void)_includeCachedMetadataJSONIfNeededForRepresentation:(id)a3 message:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if (self) {
    options = self->_options;
  }
  else {
    options = 0;
  }
  if ([(EMContentRequestOptions *)options includeCachedMetadataJSON])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (!self ? (messagePersistence = 0) : (messagePersistence = self->_messagePersistence),
          __int16 v9 = messagePersistence,
          -[EDMessagePersistence completeCachedMetadataJSONForGlobalMessageID:](v9, "completeCachedMetadataJSONForGlobalMessageID:", [v6 globalMessageID]), char v10 = objc_claimAutoreleasedReturnValue(), v9, v10))
    {
      int v11 = 0;
      id v12 = v10;
    }
    else
    {
      id v12 = [MEMORY[0x1E4F1C9B8] data];
      char v10 = 0;
      int v11 = 1;
    }
    [v13 setCachedMetadataJSON:v12];
    if (v11) {
  }
    }
}

- (void)_includeHeadersIfNeededForRepresentation:(id)a3 message:(id)a4 options:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v7 = a4;
  id v8 = a5;
  __int16 v9 = [v8 requestedHeaderKeys];
  char v10 = [v7 headersIfAvailable];
  if ([v8 requestAllHeaders])
  {
    uint64_t v11 = [v10 allHeaderKeys];

    __int16 v9 = (void *)v11;
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v13 = v9;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        id v18 = [v10 headersForKey:v17];
        [v12 setObject:v18 forKeyedSubscript:v17];
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }

  id v19 = (void *)[objc_alloc(MEMORY[0x1E4F60370]) initWithHeaders:v12];
  [v20 setRequestedHeaders:v19];
}

- (id)_messageForLegacyMessage:(id)a3
{
  id v4 = a3;
  if (self)
  {
    uint64_t v5 = self->_clientIdentifier;
    id v6 = self->_messageTransformer;
    id v7 = self->_scheduler;
    objectID = self->_objectID;
  }
  else
  {
    id v7 = 0;
    uint64_t v5 = 0;
    id v6 = 0;
    objectID = 0;
  }
  uint64_t v16 = objectID;
  __int16 v9 = [(EMMessageObjectID *)v16 mailboxScope];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __52__MFMessageContentRequest__messageForLegacyMessage___block_invoke;
  v17[3] = &unk_1E5D3FCD0;
  id v10 = v4;
  id v18 = v10;
  uint64_t v11 = v7;
  id v19 = v11;
  id v20 = self;
  id v12 = v6;
  long long v21 = v12;
  id v13 = v5;
  long long v22 = v13;
  uint64_t v14 = [(EDMessageTransformer *)v12 transformBaseMessage:v10 mailboxScope:v9 loaderBlock:v17];

  return v14;
}

id __52__MFMessageContentRequest__messageForLegacyMessage___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = EMLogCategoryMessageLoading();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = [v7 requestedRepresentation];
    id v12 = objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
    *(_DWORD *)buf = 138543618;
    long long v24 = v11;
    __int16 v25 = 2114;
    uint64_t v26 = v12;
    _os_log_impl(&dword_1A7EFF000, v10, OS_LOG_TYPE_INFO, "requesting %{public}@ content for message %{public}@", buf, 0x16u);
  }
  id v13 = *(void **)(a1 + 48);
  if (v13) {
    id v13 = (void *)v13[3];
  }
  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v15 = v13;
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void **)(a1 + 48);
  uint64_t v18 = *(void *)(a1 + 56);
  if (v17) {
    uint64_t v17 = (void *)v17[8];
  }
  id v19 = v17;
  uint64_t v20 = *(void *)(a1 + 48);
  if (v20) {
    uint64_t v20 = *(void *)(v20 + 72);
  }
  long long v21 = +[MFMessageContentRequest onScheduler:v14 requestContentForObjectID:0 messagePersistence:v15 legacyMessage:v16 messageTransformer:v18 mailDropAttachmentGenerator:v19 listUnsubscribeHandler:v20 clientIdentifier:*(void *)(a1 + 64) options:v7 delegate:v8 completionHandler:v9];

  return v21;
}

- (id)_requestContentForAttachment:(id)a3 manager:(id)a4 options:(id)a5 managed:(BOOL)a6 completion:(id)a7
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v35 = a7;
  uint64_t v15 = EMLogCategoryMessageLoading();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = [v12 url];
    *(_DWORD *)buf = 138412290;
    v53 = v16;
    _os_log_impl(&dword_1A7EFF000, v15, OS_LOG_TYPE_DEFAULT, "Start to request content for attachment: %@", buf, 0xCu);
  }
  uint64_t v17 = [MEMORY[0x1E4F60E18] promise];
  uint64_t v18 = [v17 future];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __91__MFMessageContentRequest__requestContentForAttachment_manager_options_managed_completion___block_invoke;
  v50[3] = &unk_1E5D3FCF8;
  id v19 = v35;
  id v51 = v19;
  [v18 addSuccessBlock:v50];

  uint64_t v20 = [v17 future];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __91__MFMessageContentRequest__requestContentForAttachment_manager_options_managed_completion___block_invoke_2;
  v48[3] = &unk_1E5D3F960;
  id v21 = v19;
  id v49 = v21;
  [v20 addFailureBlock:v48];

  uint64_t v22 = [v14 networkUsage];
  if (v22 || ([v12 isDataAvailableLocally] & 1) != 0)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __91__MFMessageContentRequest__requestContentForAttachment_manager_options_managed_completion___block_invoke_150;
    aBlock[3] = &unk_1E5D3FD70;
    long long v23 = v12;
    id v42 = v23;
    id v24 = v17;
    id v43 = v24;
    id v44 = v13;
    id v45 = self;
    id v46 = v14;
    BOOL v47 = a6;
    __int16 v25 = (void (**)(void))_Block_copy(aBlock);
    if (v22 == 1 && ([v23 isDataAvailableLocally] & 1) == 0)
    {
      uint64_t v27 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:1];
      if (self) {
        scheduler = self->_scheduler;
      }
      else {
        scheduler = 0;
      }
      uint64_t v29 = scheduler;
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __91__MFMessageContentRequest__requestContentForAttachment_manager_options_managed_completion___block_invoke_2_162;
      v36[3] = &unk_1E5D3FD98;
      id v37 = v23;
      id v40 = v25;
      id v30 = v27;
      id v38 = v30;
      id v39 = v24;
      [(EFScheduler *)v29 performBlock:v36];

      char v31 = v39;
      id v26 = v30;
    }
    else
    {
      v25[2](v25);
      id v26 = (id)objc_claimAutoreleasedReturnValue();
    }

    id v32 = v42;
  }
  else
  {
    int v34 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5FCD0] code:2048 userInfo:0];
    [v17 finishWithError:v34];

    id v32 = EMLogCategoryMessageLoading();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      [v12 url];
      objc_claimAutoreleasedReturnValue();
      -[MFMessageContentRequest _requestContentForAttachment:manager:options:managed:completion:]();
    }
    id v26 = 0;
  }

  return v26;
}

uint64_t __91__MFMessageContentRequest__requestContentForAttachment_manager_options_managed_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __91__MFMessageContentRequest__requestContentForAttachment_manager_options_managed_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __91__MFMessageContentRequest__requestContentForAttachment_manager_options_managed_completion___block_invoke_150(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) fileName];
  id v3 = [*(id *)(a1 + 32) part];
  id v4 = [*(id *)(a1 + 32) url];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, *(id *)(a1 + 32));
  [*(id *)(a1 + 32) setWantsCompletionBlockOffMainThread:1];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __91__MFMessageContentRequest__requestContentForAttachment_manager_options_managed_completion___block_invoke_2_151;
  uint64_t v16 = &unk_1E5D3FD48;
  id v17 = *(id *)(a1 + 40);
  id v5 = v4;
  id v18 = v5;
  objc_copyWeak(&v24, &location);
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  id v8 = *(void **)(a1 + 64);
  id v19 = v6;
  uint64_t v20 = v7;
  id v21 = v8;
  id v9 = v2;
  id v22 = v9;
  id v10 = v3;
  id v23 = v10;
  char v25 = *(unsigned char *)(a1 + 72);
  [*(id *)(a1 + 32) setFetchCompletionBlock:&v13];
  uint64_t v11 = objc_msgSend(*(id *)(a1 + 32), "fetchData", v13, v14, v15, v16);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  return v11;
}

void __91__MFMessageContentRequest__requestContentForAttachment_manager_options_managed_completion___block_invoke_2_151(uint64_t a1, void *a2, void *a3, void *a4)
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v9)
  {
    uint64_t v11 = *(void **)(a1 + 32);
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v35 = *MEMORY[0x1E4F28A50];
    v36[0] = v9;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
    uint64_t v14 = [v12 errorWithDomain:*MEMORY[0x1E4F5FCD0] code:2048 userInfo:v13];
    [v11 finishWithError:v14];

    id WeakRetained = EMLogCategoryMessageLoading();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v16;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v7;
      *(_WORD *)&buf[22] = 2112;
      id v32 = v10;
      _os_log_error_impl(&dword_1A7EFF000, WeakRetained, OS_LOG_TYPE_ERROR, "Failed to request content for attachment url: %@, original file URL: %@ due to error: %@", buf, 0x20u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
    if (WeakRetained)
    {
      id v17 = [*(id *)(a1 + 48) prepareAttachmentForDisplay:WeakRetained fileURL:v7];
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      id v32 = __Block_byref_object_copy__16;
      id v33 = __Block_byref_object_dispose__16;
      id v34 = (id)0xAAAAAAAAAAAAAAAALL;
      id v34 = v8;
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, WeakRetained);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __91__MFMessageContentRequest__requestContentForAttachment_manager_options_managed_completion___block_invoke_152;
      v19[3] = &unk_1E5D3FD20;
      id v18 = *(void **)(a1 + 64);
      v19[4] = *(void *)(a1 + 56);
      id v20 = v18;
      id v21 = v7;
      id v22 = *(id *)(a1 + 72);
      id v23 = *(id *)(a1 + 40);
      id v24 = *(id *)(a1 + 32);
      uint64_t v27 = buf;
      objc_copyWeak(&v28, &location);
      id v25 = *(id *)(a1 + 80);
      char v29 = *(unsigned char *)(a1 + 96);
      id v26 = *(id *)(a1 + 48);
      [v17 always:v19];

      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
      _Block_object_dispose(buf, 8);
    }
  }
}

void __91__MFMessageContentRequest__requestContentForAttachment_manager_options_managed_completion___block_invoke_152(uint64_t a1)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  if (v2) {
    v2 = (void *)v2[6];
  }
  id v3 = v2;
  id v4 = [*(id *)(a1 + 40) requestedRepresentation];
  int v5 = [(id)*MEMORY[0x1E4F5FC98] isEqualToString:v4];

  id v6 = (uint64_t *)(a1 + 48);
  if (*(void *)(a1 + 48)) {
    char v7 = v5;
  }
  else {
    char v7 = 1;
  }
  if (v7) {
    goto LABEL_40;
  }
  id v8 = objc_alloc(MEMORY[0x1E4F60248]);
  uint64_t v9 = *(void *)(a1 + 48);
  id v10 = [*(id *)(a1 + 56) stringByDeletingPathExtension];
  uint64_t v11 = [*(id *)(a1 + 56) pathExtension];
  id v12 = (void *)[v8 initWithOriginalFileURL:v9 clientIdentifier:v3 preferredFilename:v10 extension:v11 relatedItems:MEMORY[0x1E4F1CBF0] securityInformation:0];

  if (!v12)
  {
LABEL_40:
    if (*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40))
    {
LABEL_12:
      uint64_t v16 = EMLogCategoryMessageLoading();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = *(void *)(a1 + 64);
        *(_DWORD *)buf = 138543362;
        uint64_t v54 = v17;
        _os_log_impl(&dword_1A7EFF000, v16, OS_LOG_TYPE_INFO, "Processing fetched attachment using NSData for '%{public}@'", buf, 0xCu);
      }

      uint64_t v18 = *(void *)(a1 + 96);
      if (*(void *)(*(void *)(v18 + 8) + 40))
      {
        BOOL v19 = +[MFAttachmentPlaceholder isPlaceholderSerializedRepresentation:](MFAttachmentPlaceholder, "isPlaceholderSerializedRepresentation:");
        uint64_t v18 = *(void *)(a1 + 96);
        if (v19)
        {
          id v20 = +[MFAttachmentPlaceholder placeholderFromSerializedRepresentation:*(void *)(*(void *)(v18 + 8) + 40)];
          if (v20)
          {
            uint64_t v21 = +[MFAttachmentPlaceholder dataForPlaceholder:v20];
            uint64_t v22 = *(void *)(*(void *)(a1 + 96) + 8);
            id v23 = *(void **)(v22 + 40);
            *(void *)(v22 + 40) = v21;
          }
          uint64_t v18 = *(void *)(a1 + 96);
        }
      }
      if (*(void *)(*(void *)(v18 + 8) + 40))
      {
        if (v5)
        {
          id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
          id v25 = [[MFRFC822AttachmentDataProvider alloc] initWithMessageData:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) parentPart:*(void *)(a1 + 80) managed:*(unsigned __int8 *)(a1 + 112)];
          id v26 = *(void **)(a1 + 88);
          uint64_t v27 = [MEMORY[0x1E4F1CB10] URLWithString:@"x-attach-RFC822"];
          [v26 addProvider:v25 forBaseURL:v27];

          id v28 = [(MFRFC822AttachmentDataProvider *)v25 messageForAttachment:WeakRetained];
          char v29 = [*(id *)(a1 + 32) _messageForLegacyMessage:v28];
          id v30 = objc_alloc(MEMORY[0x1E4F60248]);
          uint64_t v31 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
          id v32 = [*(id *)(a1 + 56) stringByDeletingPathExtension];
          id v33 = [*(id *)(a1 + 56) pathExtension];
          id v12 = (void *)[v30 initWithContentMessage:v29 data:v31 clientIdentifier:v3 preferredFilename:v32 extension:v33];

          v47[0] = MEMORY[0x1E4F143A8];
          v47[1] = 3221225472;
          v47[2] = __91__MFMessageContentRequest__requestContentForAttachment_manager_options_managed_completion___block_invoke_159;
          v47[3] = &unk_1E5D3B6E0;
          id v48 = *(id *)(a1 + 88);
          id v34 = v25;
          id v49 = v34;
          [v12 addInvalidationHandler:v47];
        }
        else
        {
          id v40 = objc_alloc(MEMORY[0x1E4F60248]);
          uint64_t v41 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
          id WeakRetained = [*(id *)(a1 + 56) stringByDeletingPathExtension];
          id v34 = [*(id *)(a1 + 56) pathExtension];
          id v12 = (void *)[v40 initWithData:v41 clientIdentifier:v3 preferredFilename:WeakRetained extension:v34 relatedItems:MEMORY[0x1E4F1CBF0] securityInformation:0];
        }

        if (v12)
        {
          [*(id *)(a1 + 72) finishWithResult:v12];
          goto LABEL_37;
        }
      }
      id v42 = *(void **)(a1 + 72);
      id v37 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5FCD0] code:2048 userInfo:0];
      [v42 finishWithError:v37];
LABEL_36:

      id v12 = 0;
      goto LABEL_37;
    }
    uint64_t v35 = *v6;
    if (*v6)
    {
      id v50 = 0;
      uint64_t v36 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v35 options:1 error:&v50];
      id v37 = v50;
      uint64_t v38 = *(void *)(*(void *)(a1 + 96) + 8);
      id v39 = *(void **)(v38 + 40);
      *(void *)(v38 + 40) = v36;

      if (*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40))
      {

        goto LABEL_12;
      }
      if (v37)
      {
        uint64_t v51 = *MEMORY[0x1E4F28A50];
        id v52 = v37;
        id v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
      }
      else
      {
        id v43 = 0;
      }
    }
    else
    {
      id v43 = 0;
      id v37 = 0;
    }
    id v44 = *(void **)(a1 + 72);
    id v45 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5FCD0] code:2048 userInfo:v43];
    [v44 finishWithError:v45];

    id v46 = EMLogCategoryMessageLoading();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      __91__MFMessageContentRequest__requestContentForAttachment_manager_options_managed_completion___block_invoke_152_cold_1(v6, v46);
    }

    goto LABEL_36;
  }
  uint64_t v13 = EMLogCategoryMessageLoading();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = *(void *)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 138412546;
    uint64_t v54 = v14;
    __int16 v55 = 2114;
    uint64_t v56 = v15;
    _os_log_impl(&dword_1A7EFF000, v13, OS_LOG_TYPE_INFO, "Returning copy of original file url %@ for '%{public}@'", buf, 0x16u);
  }

  [*(id *)(a1 + 72) finishWithResult:v12];
LABEL_37:
}

uint64_t __91__MFMessageContentRequest__requestContentForAttachment_manager_options_managed_completion___block_invoke_159(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeProvider:*(void *)(a1 + 40)];
}

void __91__MFMessageContentRequest__requestContentForAttachment_manager_options_managed_completion___block_invoke_2_162(uint64_t a1)
{
  if ([*(id *)(a1 + 32) shouldAutoDownload])
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addChild:withPendingUnitCount:");
  }
  else
  {
    v2 = *(void **)(a1 + 48);
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5FCD0] code:2048 userInfo:0];
    objc_msgSend(v2, "finishWithError:");

    id v3 = *(void **)(a1 + 40);
    [v3 setCompletedUnitCount:1];
  }
}

- (id)_contentItemForAttachment:(id)a3 manager:(id)a4 managed:(BOOL)a5
{
  v42[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x1E4F60530]);
  uint64_t v11 = [v8 contentID];
  [v10 setContentID:v11];

  id v12 = [v8 fileUTType];
  [v10 setUniformTypeIdentifier:v12];

  uint64_t v13 = [v8 fileName];
  [v10 setDisplayName:v13];

  objc_msgSend(v10, "setIsAvailableLocally:", objc_msgSend(v8, "isDataAvailableLocally"));
  objc_msgSend(v10, "setDataTransferByteCount:", objc_msgSend(v8, "encodedFileSize"));
  objc_msgSend(v10, "setStorageByteCount:", objc_msgSend(v8, "decodedFileSize"));
  uint64_t v14 = [v8 mailDropMetadata];
  [v10 setMailDropMetadata:v14];

  uint64_t v15 = [v8 part];
  uint64_t v16 = [v15 partNumber];
  [v8 setMimePartNumber:v16];

  if (self) {
    legacyMessage = self->_legacyMessage;
  }
  else {
    legacyMessage = 0;
  }
  uint64_t v18 = [(MFMailMessage *)legacyMessage loadMeetingExternalID];
  BOOL v19 = [v10 uniformTypeIdentifier];

  int v20 = 0;
  if (v19 && v18)
  {
    uint64_t v21 = (void *)MEMORY[0x1E4F442D8];
    uint64_t v22 = [v10 uniformTypeIdentifier];
    id v23 = [v21 typeWithIdentifier:v22];
    int v24 = [v23 conformsToType:*MEMORY[0x1E4F44358]];

    if (v24)
    {
      if (self) {
        id v25 = self->_legacyMessage;
      }
      else {
        id v25 = 0;
      }
      id v26 = v25;
      uint64_t v27 = [(MFMailMessage *)v26 account];
      id v28 = [v27 meetingStorePersistentID];
      objc_msgSend(v10, "setExchangeEventUID:", MFMailGetEventUIDForUniqueIdentifierAndPersistentStoreID(v18, v28));

      int v20 = 1;
      [v10 setIsAvailableLocally:1];
    }
    else
    {
      int v20 = 0;
    }
  }
  if ([v8 isRFC822])
  {
    uint64_t v29 = *MEMORY[0x1E4F5FC98];
    v42[0] = *MEMORY[0x1E4F5FCB0];
    v42[1] = v29;
    id v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
    [v10 setAvailableRepresentations:v30];
  }
  else
  {
    uint64_t v41 = *MEMORY[0x1E4F5FCB0];
    id v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
    [v10 setAvailableRepresentations:v30];
  }

  if (v20)
  {
    BOOL v31 = [v10 exchangeEventUID] != 0;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __69__MFMessageContentRequest__contentItemForAttachment_manager_managed___block_invoke;
    v37[3] = &unk_1E5D3FDC0;
    BOOL v40 = v31;
    id v38 = v8;
    id v39 = self;
    [v10 setLoaderBlock:v37];
  }
  else
  {
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __69__MFMessageContentRequest__contentItemForAttachment_manager_managed___block_invoke_2;
    v33[3] = &unk_1E5D3FDE8;
    void v33[4] = self;
    id v34 = v8;
    id v35 = v9;
    BOOL v36 = a5;
    [v10 setLoaderBlock:v33];
  }
  return v10;
}

uint64_t __69__MFMessageContentRequest__contentItemForAttachment_manager_managed___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = [*(id *)(a1 + 32) fileName];
  if (*(unsigned char *)(a1 + 48))
  {
    id v7 = objc_alloc(MEMORY[0x1E4F60248]);
    id v8 = [MEMORY[0x1E4F1C9B8] data];
    id v9 = *(void **)(a1 + 40);
    if (v9) {
      id v9 = (void *)v9[6];
    }
    id v10 = v9;
    uint64_t v11 = [v6 stringByDeletingPathExtension];
    id v12 = [v6 pathExtension];
    uint64_t v13 = (void *)[v7 initWithData:v8 clientIdentifier:v10 preferredFilename:v11 extension:v12 relatedItems:MEMORY[0x1E4F1CBF0] securityInformation:0];

    [v13 setTransportType:1];
    v5[2](v5, v13, 0);
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5FCD0] code:2048 userInfo:0];
    ((void (**)(id, void *, void *))v5)[2](v5, 0, v13);
  }

  return 0;
}

id __69__MFMessageContentRequest__contentItemForAttachment_manager_managed___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v4 = [*(id *)(a1 + 32) _requestContentForAttachment:*(void *)(a1 + 40) manager:*(void *)(a1 + 48) options:a2 managed:*(unsigned __int8 *)(a1 + 56) completion:a4];
  return v4;
}

- (void)_originalContentMessagesInReplyToLegacyMessage:(id)a3 withMessageAndHTMLDataPair:(id)a4 maximumNumberOfMessages:(unint64_t)a5 completion:(id)a6
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, void, void *))a6;
  if (!a5)
  {
    uint64_t v17 = objc_msgSend(MEMORY[0x1E4F28C58], "em_internalErrorWithReason:", @"Should not retrieve original-content messages");
    v12[2](v12, 0, v17);
    goto LABEL_7;
  }
  if (self) {
    legacyMessage = self->_legacyMessage;
  }
  else {
    legacyMessage = 0;
  }
  uint64_t v14 = [(MFMailMessage *)legacyMessage subject];
  int v15 = [v14 hasForwardPrefix];

  if (v15)
  {
    uint64_t v17 = objc_msgSend(MEMORY[0x1E4F28C58], "em_internalErrorWithReason:", @"Should not retrieve original-content messages for forwarded message");
    v12[2](v12, 0, v17);
LABEL_7:

    goto LABEL_15;
  }
  uint64_t v18 = __136__MFMessageContentRequest__originalContentMessagesInReplyToLegacyMessage_withMessageAndHTMLDataPair_maximumNumberOfMessages_completion___block_invoke(v16, v11);
  BOOL v19 = (void *)v18;
  if (v18)
  {
    if (a5 == 1)
    {
      v30[0] = v18;
      int v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
      ((void (**)(id, void *, void *))v12)[2](v12, v20, 0);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v22 = [(id)objc_opt_class() originalContentMessageScheduler];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __136__MFMessageContentRequest__originalContentMessagesInReplyToLegacyMessage_withMessageAndHTMLDataPair_maximumNumberOfMessages_completion___block_invoke_2;
        v23[3] = &unk_1E5D3FEA0;
        id v24 = v10;
        id v25 = self;
        unint64_t v29 = a5;
        id v27 = &__block_literal_global_174;
        id v28 = v12;
        id v26 = v19;
        [v22 performBlock:v23];
      }
    }
  }
  else
  {
    uint64_t v21 = objc_msgSend(MEMORY[0x1E4F28C58], "em_internalErrorWithReason:", @"Failed to retrieve latest original-content message");
    v12[2](v12, 0, v21);
  }
LABEL_15:
}

id __136__MFMessageContentRequest__originalContentMessagesInReplyToLegacyMessage_withMessageAndHTMLDataPair_maximumNumberOfMessages_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 first];
  id v4 = [v2 second];
  id v5 = [v3 senders];
  id v6 = [v5 firstObject];

  uint64_t v7 = [v3 dateReceived];
  id v8 = (void *)v7;
  id v9 = 0;
  if (v3 && v4 && v6 && v7)
  {
    int v20 = v4;
    id v21 = v2;
    BOOL v19 = (void *)[[NSString alloc] initWithData:v4 encoding:4];
    uint64_t v18 = [MEMORY[0x1E4F608B0] snippetFromHTMLBody:v19 options:0 maxLength:0x7FFFFFFFFFFFFFFFLL preservingQuotedForwardedContent:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = [v3 searchableMessageID];
    }
    else
    {
      id v10 = 0;
    }
    id v11 = objc_alloc(MEMORY[0x1E4F60408]);
    id v12 = [v3 subject];
    uint64_t v13 = [v12 subjectString];
    uint64_t v14 = [v3 to];
    int v15 = [v3 cc];
    uint64_t v16 = [v3 flags];
    id v9 = (void *)[v11 initWithSearchableMessageID:v10 bodyText:v18 subject:v13 sender:v6 toList:v14 ccList:v15 flags:v16 date:v8];

    id v4 = v20;
    id v2 = v21;
  }

  return v9;
}

void __136__MFMessageContentRequest__originalContentMessagesInReplyToLegacyMessage_withMessageAndHTMLDataPair_maximumNumberOfMessages_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 32);
  BOOL v31 = [*(id *)(a1 + 32) messageStore];
  uint64_t v58 = 0;
  uint64_t v59 = &v58;
  uint64_t v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__16;
  uint64_t v62 = __Block_byref_object_dispose__16;
  id v63 = (id)0xAAAAAAAAAAAAAAAALL;
  id v63 = *v2;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x3032000000;
  __int16 v55 = __Block_byref_object_copy__16;
  uint64_t v56 = __Block_byref_object_dispose__16;
  id v57 = (id)0xAAAAAAAAAAAAAAAALL;
  id v57 = (id)objc_opt_new();
  while (v59[5])
  {
    if (objc_msgSend((id)v53[5], "count", v31) >= (unint64_t)(*(void *)(a1 + 72) - 1)) {
      break;
    }
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    id v4 = *(void **)(a1 + 40);
    uint64_t v5 = v59[5];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __136__MFMessageContentRequest__originalContentMessagesInReplyToLegacyMessage_withMessageAndHTMLDataPair_maximumNumberOfMessages_completion___block_invoke_3;
    v48[3] = &unk_1E5D3FE30;
    id v50 = &v58;
    uint64_t v51 = &v52;
    id v6 = v3;
    id v49 = v6;
    [v4 _messageInReplyToMessage:v5 libraryStore:v31 completion:v48];
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  }
  id v34 = objc_opt_new();
  id v33 = objc_opt_new();
  uint64_t v7 = dispatch_group_create();
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = (id)v53[5];
  uint64_t v8 = [obj countByEnumeratingWithState:&v44 objects:v67 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v45 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        id v12 = [MFMessageLoadingContext alloc];
        uint64_t v13 = +[MFAttachmentManager defaultManager];
        uint64_t v14 = [(MFMessageLoadingContext *)v12 initWithMessage:v11 attachmentManager:v13];

        int v15 = *(void **)(a1 + 40);
        if (v15) {
          int v15 = (void *)v15[1];
        }
        uint64_t v16 = v15;
        [(MFMessageLoadingContext *)v14 load:0 scheduler:v16 shouldDownload:0];

        dispatch_group_enter(v7);
        uint64_t v17 = *(void **)(a1 + 40);
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __136__MFMessageContentRequest__originalContentMessagesInReplyToLegacyMessage_withMessageAndHTMLDataPair_maximumNumberOfMessages_completion___block_invoke_4;
        v39[3] = &unk_1E5D3FE58;
        id v43 = *(id *)(a1 + 56);
        id v40 = v34;
        uint64_t v41 = v11;
        id v42 = v7;
        uint64_t v18 = [v17 _messageContentFromLoadingContext:v14 completion:v39];
        [v33 setObject:v18 forKeyedSubscript:v11];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v44 objects:v67 count:16];
    }
    while (v8);
  }

  dispatch_time_t v19 = dispatch_time(0, 1000000000);
  if (dispatch_group_wait(v7, v19))
  {
    int v20 = EMLogCategoryMessageLoading();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __136__MFMessageContentRequest__originalContentMessagesInReplyToLegacyMessage_withMessageAndHTMLDataPair_maximumNumberOfMessages_completion___block_invoke_2_cold_1();
    }

    uint64_t v21 = *(void *)(a1 + 64);
    uint64_t v66 = *(void *)(a1 + 48);
    uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v66 count:1];
    (*(void (**)(uint64_t, void *, void))(v21 + 16))(v21, v22, 0);
  }
  else
  {
    uint64_t v22 = objc_opt_new();
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v23 = (id)v53[5];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v35 objects:v65 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v36;
LABEL_19:
      uint64_t v26 = 0;
      while (1)
      {
        if (*(void *)v36 != v25) {
          objc_enumerationMutation(v23);
        }
        id v27 = objc_msgSend(v34, "objectForKeyedSubscript:", *(void *)(*((void *)&v35 + 1) + 8 * v26), v31);
        if (!v27) {
          break;
        }
        [v22 addObject:v27];

        if (v24 == ++v26)
        {
          uint64_t v24 = [v23 countByEnumeratingWithState:&v35 objects:v65 count:16];
          if (v24) {
            goto LABEL_19;
          }
          break;
        }
      }
    }

    uint64_t v64 = *(void *)(a1 + 48);
    id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
    unint64_t v29 = [v28 arrayByAddingObjectsFromArray:v22];

    id v30 = objc_msgSend(v29, "ef_filter:", &__block_literal_global_185);
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  _Block_object_dispose(&v52, 8);

  _Block_object_dispose(&v58, 8);
}

void __136__MFMessageContentRequest__originalContentMessagesInReplyToLegacyMessage_withMessageAndHTMLDataPair_maximumNumberOfMessages_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "ef_addOptionalObject:", v4);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __136__MFMessageContentRequest__originalContentMessagesInReplyToLegacyMessage_withMessageAndHTMLDataPair_maximumNumberOfMessages_completion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __136__MFMessageContentRequest__originalContentMessagesInReplyToLegacyMessage_withMessageAndHTMLDataPair_maximumNumberOfMessages_completion___block_invoke_182(uint64_t a1, void *a2)
{
  id v2 = [a2 flags];
  uint64_t v3 = [v2 draft] ^ 1;

  return v3;
}

- (void)_messageInReplyToMessage:(id)a3 libraryStore:(id)a4 completion:(id)a5
{
  uint64_t v16 = (void (**)(id, void, void *))a5;
  uint64_t v7 = [a3 headersIfAvailable];
  uint64_t v8 = v7;
  if (!v7)
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28C58], "em_internalErrorWithReason:", @"No headers available");
    v16[2](v16, 0, v9);
    goto LABEL_10;
  }
  uint64_t v9 = [v7 firstHeaderForKey:*MEMORY[0x1E4F606C8]];
  id v10 = [v8 references];
  uint64_t v11 = v10;
  if (v9)
  {
    id v12 = v9;
LABEL_6:
    if (self) {
      messagePersistence = self->_messagePersistence;
    }
    else {
      messagePersistence = 0;
    }
    uint64_t v14 = [(EDMessagePersistence *)messagePersistence persistedMessagesForForMessageIDHeader:v12 requireProtectedData:1];
    int v15 = objc_msgSend(v14, "ef_firstObjectPassingTest:", &__block_literal_global_194);

    ((void (**)(id, void *, void *))v16)[2](v16, v15, 0);
    goto LABEL_9;
  }
  id v12 = [v10 lastObject];
  if (v12) {
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "em_internalErrorWithReason:", @"Failed to retrieve in-reply-to identifier");
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  v16[2](v16, 0, v12);
LABEL_9:

LABEL_10:
}

uint64_t __76__MFMessageContentRequest__messageInReplyToMessage_libraryStore_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_attachmentContentItemsForMailDropNodes:(id)a3 withContext:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  id v34 = a4;
  id v6 = EMLogCategoryMessageLoading();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v51 = v33;
    _os_log_impl(&dword_1A7EFF000, v6, OS_LOG_TYPE_INFO, "MailDrop: Received MailDrop Nodes %@", buf, 0xCu);
  }

  if ([v33 count])
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v8 = [(MFMessageContentRequest *)self _maildropMetadataFromContext:v34];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v44 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          uint64_t v13 = objc_msgSend(v12, "UUID", v33);
          [v7 setObject:v12 forKeyedSubscript:v13];
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v9);
    }

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v14 = v33;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v39 objects:v48 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v40;
      uint64_t v17 = *MEMORY[0x1E4F5FD80];
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v40 != v16) {
            objc_enumerationMutation(v14);
          }
          dispatch_time_t v19 = *(void **)(*((void *)&v39 + 1) + 8 * j);
          int v20 = objc_msgSend(v19, "objectForKeyedSubscript:", v17, v33);
          BOOL v21 = v20 == 0;

          if (!v21)
          {
            uint64_t v22 = [(id)objc_opt_class() metadataWithDictionary:v19];
            id v23 = [v22 UUID];
            [v7 setObject:v22 forKeyedSubscript:v23];
          }
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v39 objects:v48 count:16];
      }
      while (v15);
    }

    uint64_t v24 = [MEMORY[0x1E4F1CA48] array];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v25 = [v7 allValues];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v35 objects:v47 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v36;
      do
      {
        for (uint64_t k = 0; k != v26; ++k)
        {
          if (*(void *)v36 != v27) {
            objc_enumerationMutation(v25);
          }
          unint64_t v29 = -[MFMessageContentRequest _attachmentForMailDropMetaData:context:](self, "_attachmentForMailDropMetaData:context:", *(void *)(*((void *)&v35 + 1) + 8 * k), v34, v33);
          if (v29)
          {
            id v30 = [v34 attachmentManager];
            BOOL v31 = [(MFMessageContentRequest *)self _contentItemForAttachment:v29 manager:v30 managed:0];

            [v24 addObject:v31];
          }
        }
        uint64_t v26 = [v25 countByEnumeratingWithState:&v35 objects:v47 count:16];
      }
      while (v26);
    }
  }
  else
  {
    uint64_t v24 = 0;
  }

  return v24;
}

- (id)_maildropMetadataFromContext:(id)a3
{
  id v3 = a3;
  id v4 = [v3 message];
  uint64_t v5 = [v4 headersIfAvailable];

  id v6 = [MEMORY[0x1E4F1CA48] array];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__MFMessageContentRequest__maildropMetadataFromContext___block_invoke;
  v12[3] = &unk_1E5D3FEE8;
  id v7 = v5;
  id v13 = v7;
  id v8 = v6;
  id v14 = v8;
  uint64_t v9 = (void (**)(void *, void))_Block_copy(v12);
  v9[2](v9, *MEMORY[0x1E4F606C0]);
  v9[2](v9, *MEMORY[0x1E4F60708]);
  id v10 = v8;

  return v10;
}

void __56__MFMessageContentRequest__maildropMetadataFromContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "headersForKey:", v3, 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = [MEMORY[0x1E4F602F8] parseHeaderValue:*(void *)(*((void *)&v9 + 1) + 8 * v7) forField:v3];
        if (v8) {
          [*(id *)(a1 + 40) addObject:v8];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (id)_attachmentForMailDropMetaData:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 directUrl];
  long long v9 = [v8 resourceSpecifier];
  if (self) {
    legacyMessage = self->_legacyMessage;
  }
  else {
    legacyMessage = 0;
  }
  long long v11 = [(MFMailMessage *)legacyMessage messageID];
  long long v12 = (void *)MEMORY[0x1E4F1CB10];
  id v13 = [NSString stringWithFormat:@"%@://%@%@", @"x-attach-maildrop", v11, v9];
  uint64_t v14 = [v12 URLWithString:v13];

  uint64_t v15 = [v7 attachmentManager];
  uint64_t v16 = [v15 attachmentForURL:v14 error:0];

  [v16 setMailDropMetadata:v6];
  uint64_t v17 = [v6 fileName];
  uint64_t v18 = objc_msgSend(v17, "ef_sanitizedFileName");
  [v16 setFileName:v18];

  dispatch_time_t v19 = [v6 mimeType];
  [v16 setMimeType:v19];

  objc_msgSend(v16, "setDecodedFileSize:", objc_msgSend(v6, "fileSize"));
  objc_msgSend(v16, "setEncodedFileSize:", objc_msgSend(v6, "fileSize"));
  int v20 = [v6 UUID];
  [v16 setContentID:v20];

  return v16;
}

+ (id)metadataWithDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F602F0] mailDropMetadata];
  uint64_t v5 = (void *)MEMORY[0x1E4F1CB10];
  id v6 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5FD80]];
  id v7 = [v5 URLWithString:v6];

  if (v7) {
    [MEMORY[0x1E4F602F8] parseURL:v7 intoMetadata:v4];
  }
  id v8 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5FD60]];
  if ([v8 isEqualToString:*MEMORY[0x1E4F5FD48]])
  {
    uint64_t v9 = [v4 flags] | 1;
  }
  else
  {
    if (![v8 isEqualToString:*MEMORY[0x1E4F5FD58]]) {
      goto LABEL_8;
    }
    uint64_t v9 = [v4 flags] | 4;
  }
  [v4 setFlags:v9];
LABEL_8:
  long long v10 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5FD70]];
  long long v11 = v10;
  if (v10)
  {
    long long v12 = objc_msgSend(v10, "ef_sanitizedFileName");
    [v4 setFileName:v12];
  }
  id v13 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5FD78]];
  uint64_t v14 = v13;
  if (v13) {
    objc_msgSend(v4, "setFileSize:", objc_msgSend(v13, "integerValue"));
  }
  uint64_t v15 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5FD68]];
  uint64_t v16 = v15;
  if (v15)
  {
    [v15 doubleValue];
    uint64_t v17 = objc_msgSend(MEMORY[0x1E4F602F8], "parseExpiration:");
    [v4 setExpiration:v17];
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_listUnsubscribeHandler, 0);
  objc_storeStrong((id *)&self->_mailDropAttachmentGenerator, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_messageTransformer, 0);
  objc_storeStrong((id *)&self->_legacyMessage, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
}

void __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke_79_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_ERROR, "Duplicate content IDs for content items: %@. Ignoring", (uint8_t *)&v2, 0xCu);
}

void __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_4(&dword_1A7EFF000, v3, v4, "EMContentItemRequestDelegate failed generating MailDrop attachments: %{public}@", v5);
}

void __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_128_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_4(&dword_1A7EFF000, v3, v4, "MailDrop node parsing finished with error %{public}@", v5);
}

void __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_4(&dword_1A7EFF000, v3, v4, "failed to generate snippets for mail drop attachments: %{public}@", v5);
}

void __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_2_131_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_4(&dword_1A7EFF000, v3, v4, "MailDrop node insertion to original HTML content failed with error %{public}@", v5);
}

- (void)_requestContentForAttachment:manager:options:managed:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_4(&dword_1A7EFF000, v3, v4, "Failed to request content for attachment with URL: %@, since network usage is not allowed and attachment data is unavailable locally", v5);
}

void __91__MFMessageContentRequest__requestContentForAttachment_manager_options_managed_completion___block_invoke_152_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_ERROR, "Failed to request content for attachments since attachment data is not available and we could not convert the original file url: %@ into data", (uint8_t *)&v3, 0xCu);
}

void __136__MFMessageContentRequest__originalContentMessagesInReplyToLegacyMessage_withMessageAndHTMLDataPair_maximumNumberOfMessages_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_4(&dword_1A7EFF000, v3, v4, "timed-out generating original content for message: %{public}@", v5);
}

@end