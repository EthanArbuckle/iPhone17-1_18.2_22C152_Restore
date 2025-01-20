@interface ICDocumentAction
- (NSArray)fileTypes;
- (id)fileTypeForOpeningItem:(id)a3;
- (id)identifier;
- (id)inputContentClasses;
- (id)localizedNameWithContext:(id)a3;
- (void)performActionWithInput:(id)a3 parameters:(id)a4 userInterface:(id)a5 successHandler:(id)a6 errorHandler:(id)a7;
@end

@implementation ICDocumentAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileTypes, 0);
  objc_storeStrong((id *)&self->_inputContentClasses, 0);
}

- (void)performActionWithInput:(id)a3 parameters:(id)a4 userInterface:(id)a5 successHandler:(id)a6 errorHandler:(id)a7
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a7;
  v13 = [v10 items];
  v14 = [v13 firstObject];

  if (v14)
  {
    v15 = [(ICDocumentAction *)self fileTypeForOpeningItem:v14];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __96__ICDocumentAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke;
    v16[3] = &unk_1E65542D0;
    v16[4] = self;
    id v17 = v12;
    id v18 = v11;
    [v10 getFileRepresentation:v16 forType:v15];
  }
  else
  {
    (*((void (**)(id, void, void))v11 + 2))(v11, 0, 0);
  }
}

void __96__ICDocumentAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = [a1[4] app];
    v5 = [v3 fileURL];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __96__ICDocumentAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke_2;
    v6[3] = &unk_1E65548B0;
    id v7 = a1[6];
    id v8 = a1[5];
    [v4 openFile:v5 completionHandler:v6];
  }
  else
  {
    (*((void (**)(void))a1[5] + 2))();
  }
}

uint64_t __96__ICDocumentAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke_2(uint64_t a1, int a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)fileTypeForOpeningItem:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 preferredFileType];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v6 = [(ICDocumentAction *)self fileTypes];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v51 objects:v59 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v52;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v52 != v9) {
          objc_enumerationMutation(v6);
        }
        if ([v5 conformsToType:*(void *)(*((void *)&v51 + 1) + 8 * i)])
        {
          id v20 = v5;
          goto LABEL_44;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v51 objects:v59 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v6 = [(ICDocumentAction *)self fileTypes];
  uint64_t v32 = [v6 countByEnumeratingWithState:&v47 objects:v58 count:16];
  if (v32)
  {
    uint64_t v11 = *(void *)v48;
    id v34 = v4;
    uint64_t v31 = *(void *)v48;
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v48 != v11) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void *)(*((void *)&v47 + 1) + 8 * j);
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        v14 = [v4 supportedTypes];
        uint64_t v15 = [v14 countByEnumeratingWithState:&v43 objects:v57 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v44;
          while (2)
          {
            for (uint64_t k = 0; k != v16; ++k)
            {
              if (*(void *)v44 != v17) {
                objc_enumerationMutation(v14);
              }
              v19 = *(void **)(*((void *)&v43 + 1) + 8 * k);
              if ([v19 conformsToType:v13])
              {
                id v20 = v19;

LABEL_43:
                id v4 = v34;
                goto LABEL_44;
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v43 objects:v57 count:16];
            if (v16) {
              continue;
            }
            break;
          }
        }

        id v4 = v34;
        uint64_t v11 = v31;
      }
      uint64_t v32 = [v6 countByEnumeratingWithState:&v47 objects:v58 count:16];
    }
    while (v32);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v6 = [(ICDocumentAction *)self fileTypes];
  id v20 = (id)[v6 countByEnumeratingWithState:&v39 objects:v56 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v40;
    uint64_t v33 = *(void *)v40;
    id v34 = v4;
    do
    {
      for (m = 0; m != v20; m = (char *)m + 1)
      {
        if (*(void *)v40 != v21) {
          objc_enumerationMutation(v6);
        }
        uint64_t v23 = *(void *)(*((void *)&v39 + 1) + 8 * (void)m);
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        v24 = [v4 allSupportedTypes];
        uint64_t v25 = [v24 countByEnumeratingWithState:&v35 objects:v55 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v36;
          while (2)
          {
            for (uint64_t n = 0; n != v26; ++n)
            {
              if (*(void *)v36 != v27) {
                objc_enumerationMutation(v24);
              }
              v29 = *(void **)(*((void *)&v35 + 1) + 8 * n);
              if ([v29 conformsToType:v23])
              {
                id v20 = v29;

                goto LABEL_43;
              }
            }
            uint64_t v26 = [v24 countByEnumeratingWithState:&v35 objects:v55 count:16];
            if (v26) {
              continue;
            }
            break;
          }
        }

        uint64_t v21 = v33;
        id v4 = v34;
      }
      id v20 = (id)[v6 countByEnumeratingWithState:&v39 objects:v56 count:16];
    }
    while (v20);
  }
LABEL_44:

  return v20;
}

- (id)inputContentClasses
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  inputContentClasses = self->_inputContentClasses;
  if (!inputContentClasses)
  {
    id v4 = [MEMORY[0x1E4F5A858] sharedRegistry];
    v5 = objc_opt_new();
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v6 = [(ICDocumentAction *)self fileTypes];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [v4 contentItemClassForType:*(void *)(*((void *)&v16 + 1) + 8 * v10)];
          if (v11) {
            [v5 addObject:v11];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }

    id v12 = [v5 array];
    uint64_t v13 = (NSArray *)[v12 copy];
    v14 = self->_inputContentClasses;
    self->_inputContentClasses = v13;

    inputContentClasses = self->_inputContentClasses;
  }
  return inputContentClasses;
}

- (NSArray)fileTypes
{
  fileTypes = self->_fileTypes;
  if (!fileTypes)
  {
    id v4 = (void *)MEMORY[0x1E4FB4718];
    v5 = [(ICAction *)self definition];
    v6 = [v5 objectForKey:@"FileTypes"];
    uint64_t v7 = [v4 typesFromStrings:v6];
    uint64_t v8 = (NSArray *)[v7 copy];
    uint64_t v9 = self->_fileTypes;
    self->_fileTypes = v8;

    fileTypes = self->_fileTypes;
  }
  return fileTypes;
}

- (id)identifier
{
  v10.receiver = self;
  v10.super_class = (Class)ICDocumentAction;
  id v3 = [(ICAction *)&v10 identifier];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = NSString;
    uint64_t v7 = [(ICAction *)self app];
    uint64_t v8 = [v7 bundleIdentifier];
    id v5 = [v6 stringWithFormat:@"%@.openin", v8];
  }
  return v5;
}

- (id)localizedNameWithContext:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICDocumentAction;
  id v5 = [(ICAction *)&v12 localizedNameWithContext:v4];
  if (!v5)
  {
    v6 = WFLocalizedStringResourceWithKey(@"Open in %@ (Action Name - Open In)", @"Open in %@");
    uint64_t v7 = [v4 localize:v6];

    uint64_t v8 = NSString;
    uint64_t v9 = [(ICAction *)self app];
    objc_super v10 = [v9 localizedName];
    id v5 = objc_msgSend(v8, "localizedStringWithFormat:", v7, v10);
  }
  return v5;
}

@end