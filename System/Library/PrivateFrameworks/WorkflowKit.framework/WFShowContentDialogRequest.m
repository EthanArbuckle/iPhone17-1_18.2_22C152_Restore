@interface WFShowContentDialogRequest
+ (BOOL)supportsSecureCoding;
- (NSData)archivedContentCollection;
- (WFContentCollection)cachedContentCollection;
- (WFDialogButton)cancelButton;
- (WFDialogButton)doneButton;
- (WFShowContentDialogRequest)initWithCoder:(id)a3;
- (WFShowContentDialogRequest)initWithContentCollection:(id)a3 attribution:(id)a4 prompt:(id)a5;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)getContentCollectionWithCompletionHandler:(id)a3;
- (void)setArchivedContentCollection:(id)a3;
- (void)setCachedContentCollection:(id)a3;
@end

@implementation WFShowContentDialogRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedContentCollection, 0);
  objc_storeStrong((id *)&self->_archivedContentCollection, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
}

- (void)setCachedContentCollection:(id)a3
{
}

- (WFContentCollection)cachedContentCollection
{
  return self->_cachedContentCollection;
}

- (void)setArchivedContentCollection:(id)a3
{
}

- (NSData)archivedContentCollection
{
  return self->_archivedContentCollection;
}

- (WFDialogButton)cancelButton
{
  return self->_cancelButton;
}

- (WFDialogButton)doneButton
{
  return self->_doneButton;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFShowContentDialogRequest;
  id v4 = a3;
  [(WFDialogRequest *)&v8 encodeWithCoder:v4];
  v5 = [(WFShowContentDialogRequest *)self archivedContentCollection];
  [v4 encodeObject:v5 forKey:@"archivedContentCollection"];

  v6 = [(WFShowContentDialogRequest *)self doneButton];
  [v4 encodeObject:v6 forKey:@"doneButton"];

  v7 = [(WFShowContentDialogRequest *)self cancelButton];
  [v4 encodeObject:v7 forKey:@"cancelButton"];
}

- (WFShowContentDialogRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFShowContentDialogRequest;
  v5 = [(WFDialogRequest *)&v14 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"archivedContentCollection"];
    archivedContentCollection = v5->_archivedContentCollection;
    v5->_archivedContentCollection = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"doneButton"];
    doneButton = v5->_doneButton;
    v5->_doneButton = (WFDialogButton *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cancelButton"];
    cancelButton = v5->_cancelButton;
    v5->_cancelButton = (WFDialogButton *)v10;

    v12 = v5;
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(WFDialogRequest *)self attribution];
  v7 = [v6 title];
  uint64_t v8 = [(WFDialogRequest *)self prompt];
  v9 = [(WFShowContentDialogRequest *)self cachedContentCollection];
  uint64_t v10 = [v3 stringWithFormat:@"<%@: %p, title: %@, prompt: %@, contentCollection (if loaded): %@>", v5, self, v7, v8, v9];

  return v10;
}

- (void)getContentCollectionWithCompletionHandler:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    objc_super v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WFShowContentDialogRequest.m", 41, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__WFShowContentDialogRequest_getContentCollectionWithCompletionHandler___block_invoke;
  aBlock[3] = &unk_1E65553C8;
  id v6 = v5;
  id v17 = v6;
  v7 = (void (**)(void *, void *))_Block_copy(aBlock);
  uint64_t v8 = [(WFShowContentDialogRequest *)self cachedContentCollection];

  if (v8)
  {
    v9 = [(WFShowContentDialogRequest *)self cachedContentCollection];
    v7[2](v7, v9);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F28DC0];
    v11 = [(WFShowContentDialogRequest *)self archivedContentCollection];
    v12 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __72__WFShowContentDialogRequest_getContentCollectionWithCompletionHandler___block_invoke_3;
    v15[3] = &unk_1E65553F0;
    v15[4] = self;
    v15[5] = v7;
    id v13 = (id)objc_msgSend(v10, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v11, v12, v15);
  }
}

void __72__WFShowContentDialogRequest_getContentCollectionWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __72__WFShowContentDialogRequest_getContentCollectionWithCompletionHandler___block_invoke_2;
    v4[3] = &unk_1E65572A0;
    id v6 = *(id *)(a1 + 32);
    id v5 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v4);
  }
}

void __72__WFShowContentDialogRequest_getContentCollectionWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3)
  {
    id v4 = getWFGeneralLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      int v5 = 136315138;
      id v6 = "-[WFShowContentDialogRequest getContentCollectionWithCompletionHandler:]_block_invoke_3";
      _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_FAULT, "%s Unable to unarchive content collection.", (uint8_t *)&v5, 0xCu);
    }
  }
  [*(id *)(a1 + 32) setCachedContentCollection:v3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __72__WFShowContentDialogRequest_getContentCollectionWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (WFShowContentDialogRequest)initWithContentCollection:(id)a3 attribution:(id)a4 prompt:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v21.receiver = self;
  v21.super_class = (Class)WFShowContentDialogRequest;
  v9 = [(WFDialogRequest *)&v21 initWithAttribution:a4 prompt:a5];
  if (!v9)
  {
LABEL_7:
    v18 = 0;
    goto LABEL_8;
  }
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28DB0], "wf_securelyArchivedDataWithRootObject:", v8);
  archivedContentCollection = v9->_archivedContentCollection;
  v9->_archivedContentCollection = (NSData *)v10;

  if (!v9->_archivedContentCollection)
  {
    v19 = getWFGeneralLogObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[WFShowContentDialogRequest initWithContentCollection:attribution:prompt:]";
      __int16 v24 = 2114;
      uint64_t v25 = 0;
      _os_log_impl(&dword_1C7F0A000, v19, OS_LOG_TYPE_FAULT, "%s Unable to archive content collection: %{public}@", buf, 0x16u);
    }

    goto LABEL_7;
  }
  uint64_t v12 = [v8 copy];
  cachedContentCollection = v9->_cachedContentCollection;
  v9->_cachedContentCollection = (WFContentCollection *)v12;

  uint64_t v14 = [MEMORY[0x1E4FB46C8] doneButton];
  doneButton = v9->_doneButton;
  v9->_doneButton = (WFDialogButton *)v14;

  uint64_t v16 = [MEMORY[0x1E4FB46C8] cancelButton];
  cancelButton = v9->_cancelButton;
  v9->_cancelButton = (WFDialogButton *)v16;

  v18 = v9;
LABEL_8:

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end