@interface WFSmartPromptDialogRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldCenterPrompt;
- (NSData)archivedSourceContentCollection;
- (NSString)secondaryText;
- (WFContentCollection)cachedSourceContentCollection;
- (WFDialogButton)allowAlwaysButton;
- (WFDialogButton)allowOnceButton;
- (WFDialogButton)denyButton;
- (WFDialogButton)previewButton;
- (WFSmartPromptConfiguration)configuration;
- (WFSmartPromptDialogRequest)initWithCoder:(id)a3;
- (WFSmartPromptDialogRequest)initWithConfiguration:(id)a3 attribution:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)getContentCollectionWithCompletionHandler:(id)a3;
- (void)setArchivedSourceContentCollection:(id)a3;
- (void)setCachedSourceContentCollection:(id)a3;
@end

@implementation WFSmartPromptDialogRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSourceContentCollection, 0);
  objc_storeStrong((id *)&self->_archivedSourceContentCollection, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_denyButton, 0);
  objc_storeStrong((id *)&self->_allowAlwaysButton, 0);
  objc_storeStrong((id *)&self->_allowOnceButton, 0);
  objc_storeStrong((id *)&self->_previewButton, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)setCachedSourceContentCollection:(id)a3
{
}

- (WFContentCollection)cachedSourceContentCollection
{
  return self->_cachedSourceContentCollection;
}

- (void)setArchivedSourceContentCollection:(id)a3
{
}

- (NSData)archivedSourceContentCollection
{
  return self->_archivedSourceContentCollection;
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (WFDialogButton)denyButton
{
  return self->_denyButton;
}

- (WFDialogButton)allowAlwaysButton
{
  return self->_allowAlwaysButton;
}

- (WFDialogButton)allowOnceButton
{
  return self->_allowOnceButton;
}

- (WFDialogButton)previewButton
{
  return self->_previewButton;
}

- (WFSmartPromptConfiguration)configuration
{
  return self->_configuration;
}

- (void)getContentCollectionWithCompletionHandler:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WFSmartPromptDialogRequest.m", 112, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__WFSmartPromptDialogRequest_getContentCollectionWithCompletionHandler___block_invoke;
  aBlock[3] = &unk_1E65553C8;
  id v6 = v5;
  id v17 = v6;
  v7 = (void (**)(void *, void *))_Block_copy(aBlock);
  v8 = [(WFSmartPromptDialogRequest *)self cachedSourceContentCollection];

  if (v8)
  {
    v9 = [(WFSmartPromptDialogRequest *)self cachedSourceContentCollection];
    v7[2](v7, v9);
  }
  else
  {
    v10 = (void *)MEMORY[0x1E4F28DC0];
    v11 = [(WFSmartPromptDialogRequest *)self archivedSourceContentCollection];
    v12 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __72__WFSmartPromptDialogRequest_getContentCollectionWithCompletionHandler___block_invoke_3;
    v15[3] = &unk_1E65553F0;
    v15[4] = self;
    v15[5] = v7;
    id v13 = (id)objc_msgSend(v10, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v11, v12, v15);
  }
}

void __72__WFSmartPromptDialogRequest_getContentCollectionWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  label = dispatch_queue_get_label(MEMORY[0x1E4F14428]);
  if (label == dispatch_queue_get_label(0))
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __72__WFSmartPromptDialogRequest_getContentCollectionWithCompletionHandler___block_invoke_2;
    v6[3] = &unk_1E65572A0;
    id v8 = *(id *)(a1 + 32);
    id v7 = v3;
    id v5 = (void *)MEMORY[0x1E4F14428];
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

void __72__WFSmartPromptDialogRequest_getContentCollectionWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3)
  {
    v4 = getWFGeneralLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      int v5 = 136315138;
      id v6 = "-[WFSmartPromptDialogRequest getContentCollectionWithCompletionHandler:]_block_invoke_3";
      _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_FAULT, "%s Unable to unarchive smart prompt content collection.", (uint8_t *)&v5, 0xCu);
    }
  }
  [*(id *)(a1 + 32) setCachedSourceContentCollection:v3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __72__WFSmartPromptDialogRequest_getContentCollectionWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)encodeWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)WFSmartPromptDialogRequest;
  id v4 = a3;
  [(WFDialogRequest *)&v12 encodeWithCoder:v4];
  int v5 = [(WFSmartPromptDialogRequest *)self configuration];
  [v4 encodeObject:v5 forKey:@"configuration"];

  id v6 = [(WFSmartPromptDialogRequest *)self secondaryText];
  [v4 encodeObject:v6 forKey:@"secondaryText"];

  uint64_t v7 = [(WFSmartPromptDialogRequest *)self archivedSourceContentCollection];
  [v4 encodeObject:v7 forKey:@"archivedSourceContentCollection"];

  id v8 = [(WFSmartPromptDialogRequest *)self previewButton];
  [v4 encodeObject:v8 forKey:@"previewButton"];

  v9 = [(WFSmartPromptDialogRequest *)self allowOnceButton];
  [v4 encodeObject:v9 forKey:@"allowOnceButton"];

  v10 = [(WFSmartPromptDialogRequest *)self allowAlwaysButton];
  [v4 encodeObject:v10 forKey:@"allowAlwaysButton"];

  v11 = [(WFSmartPromptDialogRequest *)self denyButton];
  [v4 encodeObject:v11 forKey:@"denyButton"];
}

- (WFSmartPromptDialogRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)WFSmartPromptDialogRequest;
  int v5 = [(WFDialogRequest *)&v22 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"configuration"];
    configuration = v5->_configuration;
    v5->_configuration = (WFSmartPromptConfiguration *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secondaryText"];
    secondaryText = v5->_secondaryText;
    v5->_secondaryText = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"archivedSourceContentCollection"];
    archivedSourceContentCollection = v5->_archivedSourceContentCollection;
    v5->_archivedSourceContentCollection = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"previewButton"];
    previewButton = v5->_previewButton;
    v5->_previewButton = (WFDialogButton *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"allowOnceButton"];
    allowOnceButton = v5->_allowOnceButton;
    v5->_allowOnceButton = (WFDialogButton *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"allowAlwaysButton"];
    allowAlwaysButton = v5->_allowAlwaysButton;
    v5->_allowAlwaysButton = (WFDialogButton *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"denyButton"];
    denyButton = v5->_denyButton;
    v5->_denyButton = (WFDialogButton *)v18;

    v20 = v5;
  }

  return v5;
}

- (BOOL)shouldCenterPrompt
{
  return 1;
}

- (WFSmartPromptDialogRequest)initWithConfiguration:(id)a3 attribution:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 localizedPrompt];
  v55.receiver = self;
  v55.super_class = (Class)WFSmartPromptDialogRequest;
  uint64_t v10 = [(WFDialogRequest *)&v55 initWithAttribution:v8 prompt:v9];

  if (v10)
  {
    objc_storeStrong((id *)&v10->_configuration, a3);
    uint64_t v11 = [v7 localizedSubtitle];
    secondaryText = v10->_secondaryText;
    v10->_secondaryText = (NSString *)v11;

    uint64_t v13 = [v7 archivedSourceContentCollection];
    archivedSourceContentCollection = v10->_archivedSourceContentCollection;
    v10->_archivedSourceContentCollection = (NSData *)v13;

    if (v10->_archivedSourceContentCollection)
    {
      v15 = [v7 cachedSourceContentCollection];
      uint64_t v16 = [v15 copy];
      cachedSourceContentCollection = v10->_cachedSourceContentCollection;
      v10->_cachedSourceContentCollection = (WFContentCollection *)v16;

      unint64_t v18 = [(WFContentCollection *)v10->_cachedSourceContentCollection numberOfItems];
      unint64_t v19 = v18;
      if (v18 > 1
        || v18 == 1
        && ([v7 requestSource],
            v27 = objc_claimAutoreleasedReturnValue(),
            int v28 = [v27 isEqualToString:@"Siri"],
            v27,
            v28))
      {
        v20 = NSString;
        v21 = WFLocalizedString(@"Show All %d");
        objc_super v22 = objc_msgSend(v20, "localizedStringWithFormat:", v21, v19);

        uint64_t v23 = [objc_alloc(MEMORY[0x1E4FB46C8]) initWithIdentifier:@"Handoff" title:v22 style:0];
        previewButton = v10->_previewButton;
        v10->_previewButton = (WFDialogButton *)v23;
      }
      else
      {
        objc_super v22 = v10->_previewButton;
        v10->_previewButton = 0;
      }

      v29 = [v7 requestType];

      if (v29 == @"SmartPrompt")
      {
        if ([v7 isSpecialRequest])
        {
          allowOnceButton = v10->_allowOnceButton;
          v10->_allowOnceButton = 0;
        }
        else
        {
          id v40 = objc_alloc(MEMORY[0x1E4FB46C8]);
          allowOnceButton = WFLocalizedString(@"Allow Once");
          uint64_t v41 = [v40 initWithIdentifier:@"AllowOnce" title:allowOnceButton style:0];
          v42 = v10->_allowOnceButton;
          v10->_allowOnceButton = (WFDialogButton *)v41;
        }
        char v43 = [v7 isSpecialRequest];
        id v44 = objc_alloc(MEMORY[0x1E4FB46C8]);
        if (v43) {
          v45 = @"Allow";
        }
        else {
          v45 = @"Always Allow";
        }
        v46 = WFLocalizedString(v45);
        uint64_t v47 = [v44 initWithIdentifier:@"AllowAlways" title:v46 style:0];
        allowAlwaysButton = v10->_allowAlwaysButton;
        v10->_allowAlwaysButton = (WFDialogButton *)v47;

        id v49 = objc_alloc(MEMORY[0x1E4FB46C8]);
        v50 = WFLocalizedString(@"Don’t Allow");
        v51 = @"Deny";
      }
      else
      {
        v30 = [v7 requestType];

        if (v30 != @"DeletionAuthorization")
        {
LABEL_26:
          v26 = v10;
          goto LABEL_27;
        }
        id v31 = objc_alloc(MEMORY[0x1E4FB46C8]);
        v32 = WFLocalizedString(@"Delete");
        uint64_t v33 = [v31 initWithIdentifier:@"AllowOnce" title:v32 style:2];
        v34 = v10->_allowOnceButton;
        v10->_allowOnceButton = (WFDialogButton *)v33;

        if (+[WFShortcutsSecuritySettings allowsDeletingWithoutConfirmation])
        {
          id v35 = objc_alloc(MEMORY[0x1E4FB46C8]);
          v36 = WFLocalizedString(@"Delete Always");
          uint64_t v37 = [v35 initWithIdentifier:@"AllowAlways" title:v36 style:2];
          v38 = v10->_allowAlwaysButton;
          v10->_allowAlwaysButton = (WFDialogButton *)v37;
        }
        else
        {
          v36 = v10->_allowAlwaysButton;
          v10->_allowAlwaysButton = 0;
        }

        id v49 = objc_alloc(MEMORY[0x1E4FB46C8]);
        v50 = WFLocalizedString(@"Don’t Delete");
        v51 = @"DontDelete";
      }
      uint64_t v52 = [v49 initWithIdentifier:v51 title:v50 style:1];
      denyButton = v10->_denyButton;
      v10->_denyButton = (WFDialogButton *)v52;

      goto LABEL_26;
    }
    v25 = getWFGeneralLogObject();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v57 = "-[WFSmartPromptDialogRequest initWithConfiguration:attribution:]";
      _os_log_impl(&dword_1C7F0A000, v25, OS_LOG_TYPE_FAULT, "%s Unable to archive smart prompt source content collection", buf, 0xCu);
    }
  }
  v26 = 0;
LABEL_27:

  return v26;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end