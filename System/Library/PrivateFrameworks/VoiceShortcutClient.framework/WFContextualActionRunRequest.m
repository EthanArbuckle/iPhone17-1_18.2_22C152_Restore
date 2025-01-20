@interface WFContextualActionRunRequest
+ (BOOL)supportsSecureCoding;
- (WFContentCollection)input;
- (WFContextualAction)action;
- (WFContextualActionContext)actionContext;
- (WFContextualActionRunRequest)initWithAction:(id)a3 actionContext:(id)a4;
- (WFContextualActionRunRequest)initWithCoder:(id)a3;
- (id)queueIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)getInputWithCompletionHandler:(id)a3;
- (void)setInput:(id)a3;
@end

@implementation WFContextualActionRunRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_actionContext, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

- (void)setInput:(id)a3
{
}

- (WFContentCollection)input
{
  return self->_input;
}

- (WFContextualActionContext)actionContext
{
  return self->_actionContext;
}

- (WFContextualAction)action
{
  return self->_action;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFContextualActionRunRequest;
  id v4 = a3;
  [(WFWorkflowRunRequest *)&v7 encodeWithCoder:v4];
  v5 = [(WFContextualActionRunRequest *)self actionContext];
  [v4 encodeObject:v5 forKey:@"actionContext"];

  v6 = [(WFContextualActionRunRequest *)self action];
  [v4 encodeObject:v6 forKey:@"action"];
}

- (WFContextualActionRunRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  v6 = [v4 decodeObjectOfClasses:v5 forKey:@"actionContext"];

  objc_super v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"action"];
  if (v6
    && (v11.receiver = self,
        v11.super_class = (Class)WFContextualActionRunRequest,
        v8 = [(WFWorkflowRunRequest *)&v11 initWithCoder:v4],
        (self = v8) != 0))
  {
    objc_storeStrong((id *)&v8->_action, v7);
    objc_storeStrong((id *)&self->_actionContext, v6);
    self = self;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)queueIdentifier
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(WFContextualActionRunRequest *)self actionContext];
  v5 = [v4 files];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) fileURL];
        objc_super v11 = [v10 absoluteString];
        [v3 addObject:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  v12 = (void *)[v3 copy];
  return v12;
}

- (void)getInputWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, id, void))a3;
  v5 = [(WFContextualActionRunRequest *)self input];

  if (v5)
  {
    id v6 = [(WFContextualActionRunRequest *)self input];
    v4[2](v4, v6, 0);
  }
  else
  {
    uint64_t v7 = [(WFContextualActionRunRequest *)self action];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __62__WFContextualActionRunRequest_getInputWithCompletionHandler___block_invoke;
    v8[3] = &unk_1E6077748;
    v8[4] = self;
    id v9 = v7;
    v10 = v4;
    id v6 = v7;
    [v6 getInputWithCompletionHandler:v8];
  }
}

void __62__WFContextualActionRunRequest_getInputWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  v43 = v5;
  if (v5)
  {
    [*(id *)(a1 + 32) setInput:v5];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v42 = v6;
    if (v6)
    {
      uint64_t v8 = getWFVoiceShortcutClientLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 136315650;
        *(void *)&buf[4] = "-[WFContextualActionRunRequest getInputWithCompletionHandler:]_block_invoke";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v9;
        *(_WORD *)&buf[22] = 2112;
        v61 = v42;
        _os_log_impl(&dword_1B3C5C000, v8, OS_LOG_TYPE_ERROR, "%s %@ tried to self-populate its input, but it failed: %@", buf, 0x20u);
      }
    }
    v10 = [*(id *)(a1 + 32) actionContext];
    objc_super v11 = [v10 files];

    v45 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    obuint64_t j = v11;
    uint64_t v12 = [obj countByEnumeratingWithState:&v50 objects:v59 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v51;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v51 != v13) {
            objc_enumerationMutation(obj);
          }
          long long v15 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          long long v16 = [v15 type];

          if (v16)
          {
            uint64_t v54 = 0;
            v55 = &v54;
            uint64_t v56 = 0x2050000000;
            long long v17 = (void *)getWFFileTypeClass_softClass;
            uint64_t v57 = getWFFileTypeClass_softClass;
            if (!getWFFileTypeClass_softClass)
            {
              *(void *)buf = MEMORY[0x1E4F143A8];
              *(void *)&buf[8] = 3221225472;
              *(void *)&buf[16] = __getWFFileTypeClass_block_invoke;
              v61 = &unk_1E6079C28;
              v62 = &v54;
              __getWFFileTypeClass_block_invoke((uint64_t)buf);
              long long v17 = (void *)v55[3];
            }
            id v18 = v17;
            _Block_object_dispose(&v54, 8);
            uint64_t v19 = [v15 type];
            long long v16 = [v18 typeWithUTType:v19];
          }
          uint64_t v54 = 0;
          v55 = &v54;
          uint64_t v56 = 0x2050000000;
          v20 = (void *)getWFFileRepresentationClass_softClass;
          uint64_t v57 = getWFFileRepresentationClass_softClass;
          if (!getWFFileRepresentationClass_softClass)
          {
            *(void *)buf = MEMORY[0x1E4F143A8];
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = __getWFFileRepresentationClass_block_invoke;
            v61 = &unk_1E6079C28;
            v62 = &v54;
            __getWFFileRepresentationClass_block_invoke((uint64_t)buf);
            v20 = (void *)v55[3];
          }
          id v21 = v20;
          _Block_object_dispose(&v54, 8);
          v22 = [v15 fileURL];
          v23 = [v21 fileWithURL:v22 options:29 ofType:v16];

          if (!v23)
          {
            v38 = getWFVoiceShortcutClientLogObject();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
            {
              v39 = [v15 fileURL];
              *(_DWORD *)buf = 136315650;
              *(void *)&buf[4] = "-[WFContextualActionRunRequest getInputWithCompletionHandler:]_block_invoke";
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v15;
              *(_WORD *)&buf[22] = 2112;
              v61 = v39;
              _os_log_impl(&dword_1B3C5C000, v38, OS_LOG_TYPE_FAULT, "%s Couldn't represent contextual action file: %@ (%@)", buf, 0x20u);
            }
            uint64_t v40 = *(void *)(a1 + 48);
            v41 = [*(id *)(a1 + 32) unableToDecodeInputError];
            (*(void (**)(uint64_t, void, void *))(v40 + 16))(v40, 0, v41);

            id v37 = obj;
            goto LABEL_39;
          }
          [v45 addObject:v23];
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v50 objects:v59 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    uint64_t v54 = 0;
    v55 = &v54;
    uint64_t v56 = 0x2050000000;
    v24 = (void *)getWFContentCollectionClass_softClass;
    uint64_t v57 = getWFContentCollectionClass_softClass;
    if (!getWFContentCollectionClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getWFContentCollectionClass_block_invoke;
      v61 = &unk_1E6079C28;
      v62 = &v54;
      __getWFContentCollectionClass_block_invoke((uint64_t)buf);
      v24 = (void *)v55[3];
    }
    v25 = v24;
    _Block_object_dispose(&v54, 8);
    id v26 = objc_alloc_init(v25);
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v27 = v45;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v46 objects:v58 count:16];
    if (v28)
    {
      uint64_t v29 = *(void *)v47;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v47 != v29) {
            objc_enumerationMutation(v27);
          }
          uint64_t v31 = *(void *)(*((void *)&v46 + 1) + 8 * j);
          uint64_t v54 = 0;
          v55 = &v54;
          uint64_t v56 = 0x2050000000;
          v32 = (void *)getWFContentLocationClass_softClass;
          uint64_t v57 = getWFContentLocationClass_softClass;
          if (!getWFContentLocationClass_softClass)
          {
            *(void *)buf = MEMORY[0x1E4F143A8];
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = __getWFContentLocationClass_block_invoke;
            v61 = &unk_1E6079C28;
            v62 = &v54;
            __getWFContentLocationClass_block_invoke((uint64_t)buf);
            v32 = (void *)v55[3];
          }
          id v33 = v32;
          _Block_object_dispose(&v54, 8);
          v34 = [v33 contentLocationForFile:v31];
          if (v34) {
            [v26 addFile:v31 origin:v34 disclosureLevel:1];
          }
          else {
            [v26 addFile:v31];
          }
        }
        uint64_t v28 = [v27 countByEnumeratingWithState:&v46 objects:v58 count:16];
      }
      while (v28);
    }

    uint64_t v35 = *(void *)(a1 + 32);
    v36 = *(void **)(v35 + 136);
    *(void *)(v35 + 136) = v26;
    id v37 = v26;

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_39:

    uint64_t v7 = v42;
  }
}

- (WFContextualActionRunRequest)initWithAction:(id)a3 actionContext:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"WFContextualActionRunRequest.m", 73, @"Invalid parameter not satisfying: %@", @"actionContext" object file lineNumber description];
  }
  int v10 = [v8 showsUserInterfaceWhenRunning];
  if ([v9 surface] == 5 || (!v10 ? (uint64_t v11 = 3) : (uint64_t v11 = 0), objc_msgSend(v9, "surface") == 16)) {
    uint64_t v11 = 1;
  }
  v20.receiver = self;
  v20.super_class = (Class)WFContextualActionRunRequest;
  uint64_t v12 = [(WFWorkflowRunRequest *)&v20 initWithInput:0 presentationMode:v11];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_action, a3);
    objc_storeStrong((id *)&v13->_actionContext, a4);
    unint64_t v14 = [v9 surface];
    if (v14 > 0x12) {
      long long v15 = 0;
    }
    else {
      long long v15 = *off_1E6077780[v14];
    }
    BOOL v16 = [v9 surface] == 5
       || [v9 surface] == 6
       || [v9 surface] == 16
       || [v9 surface] == 10
       || [v9 surface] == 11
       || [v9 surface] == 15
       || [v9 surface] == 12
       || [v9 surface] == 13
       || [v9 surface] == 18;
    [(WFWorkflowRunRequest *)v13 setRunSource:v15];
    [(WFWorkflowRunRequest *)v13 setAllowsDialogNotifications:v16];
    [(WFWorkflowRunRequest *)v13 setOutputBehavior:2];
    long long v17 = v13;
  }
  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end