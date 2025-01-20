@interface VSAutoAuthenticationAppDocumentController
- (BOOL)_updateAutoAuthenticationViewModel:(id)a3 error:(id *)a4;
- (BOOL)_updateAutoAuthenticationViewModel:(id)a3 withTemplate:(id)a4;
- (BOOL)_updateViewModel:(id)a3 error:(id *)a4;
- (IKViewElement)buttonLockupElement;
- (id)_autoAuthenticationViewModelWithViewModel:(id)a3;
- (id)_newViewModel;
- (void)autoAuthenticationViewModelDidManualSignInButton:(id)a3;
- (void)setButtonLockupElement:(id)a3;
@end

@implementation VSAutoAuthenticationAppDocumentController

- (id)_newViewModel
{
  v3 = objc_alloc_init(VSAutoAuthenticationViewModel);
  [(VSAutoAuthenticationViewModel *)v3 setDelegate:self];
  return v3;
}

- (BOOL)_updateViewModel:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The viewModel parameter must not be nil."];
  }
  v13.receiver = self;
  v13.super_class = (Class)VSAutoAuthenticationAppDocumentController;
  [(VSAppDocumentController *)&v13 _updateViewModel:v6 error:a4];
  v7 = [(VSAppDocumentController *)self appDocument];
  id v8 = [v7 error];

  if (!v8)
  {
    v11 = [(VSAutoAuthenticationAppDocumentController *)self _autoAuthenticationViewModelWithViewModel:v6];
    id v12 = 0;
    BOOL v9 = [(VSAutoAuthenticationAppDocumentController *)self _updateAutoAuthenticationViewModel:v11 error:&v12];
    id v8 = v12;

    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  BOOL v9 = 0;
  if (a4) {
LABEL_5:
  }
    *a4 = v8;
LABEL_6:

  return v9;
}

- (void)autoAuthenticationViewModelDidManualSignInButton:(id)a3
{
  if (!a3) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The autoAuthenticationViewModel parameter must not be nil."];
  }
  id v4 = [(VSAutoAuthenticationAppDocumentController *)self buttonLockupElement];
  [v4 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
}

- (id)_autoAuthenticationViewModelWithViewModel:(id)a3
{
  id v3 = a3;
  if (!v3) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The viewModel parameter must not be nil."];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v4 = (void *)MEMORY[0x263EFF940];
    uint64_t v5 = *MEMORY[0x263EFF4A0];
    id v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    [v4 raise:v5, @"Unexpectedly, viewModel was %@, instead of VSAutoAuthenticationViewModel.", v7 format];
  }
  return v3;
}

- (BOOL)_updateAutoAuthenticationViewModel:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The viewModel parameter must not be nil."];
  }
  v7 = [(VSAppDocumentController *)self templateElement];
  if (objc_msgSend(v7, "vs_elementType") == 162)
  {
    BOOL v8 = [(VSAutoAuthenticationAppDocumentController *)self _updateAutoAuthenticationViewModel:v6 withTemplate:v7];
    BOOL v9 = 0;
    if (!a4) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  BOOL v9 = VSPrivateError();
  BOOL v8 = 0;
  if (a4) {
LABEL_7:
  }
    *a4 = v9;
LABEL_8:

  return v8;
}

- (BOOL)_updateAutoAuthenticationViewModel:(id)a3 withTemplate:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  BOOL v8 = (uint64_t *)MEMORY[0x263EFF4A0];
  if (v5)
  {
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The viewModel parameter must not be nil."];
    if (v7) {
      goto LABEL_3;
    }
  }
  [MEMORY[0x263EFF940] raise:*v8 format:@"The templateElement parameter must not be nil."];
LABEL_3:
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v40 = v7;
  BOOL v9 = [v7 children];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v45;
    uint64_t v13 = *v8;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v45 != v12) {
          objc_enumerationMutation(v9);
        }
        v15 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend(v15, "vs_elementType");
        if (v16 == 138)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v21 = (void *)MEMORY[0x263EFF940];
            v22 = (objc_class *)objc_opt_class();
            v23 = NSStringFromClass(v22);
            [v21 raise:v13, @"Unexpectedly, childElement was %@, instead of IKTextElement.", v23 format];
          }
          id v24 = v15;
          v25 = [v24 text];
          v20 = [v25 string];

          v26 = [v24 elementName];

          if ([v26 isEqualToString:@"title"])
          {
            [v5 setMessageTitle:v20];
          }
          else if ([v26 isEqualToString:@"accountName"])
          {
            [v5 setAccountName:v20];
          }
          else if ([v26 isEqualToString:@"description"])
          {
            [v5 setMessage:v20];
          }
        }
        else
        {
          if (v16 != 49) {
            continue;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v17 = (void *)MEMORY[0x263EFF940];
            v18 = (objc_class *)objc_opt_class();
            v19 = NSStringFromClass(v18);
            [v17 raise:v13, @"Unexpectedly, childElement was %@, instead of IKImageElement.", v19 format];
          }
          v20 = [(VSAppDocumentController *)self _imageItemProviderWithImageElement:v15];
          [v5 setLogoProvider:v20];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v11);
  }

  v27 = [(VSAppDocumentController *)self filteredButtonLockupElements];
  v28 = [v27 firstObject];
  [(VSAutoAuthenticationAppDocumentController *)self setButtonLockupElement:v28];

  v29 = (objc_class *)objc_opt_class();
  v30 = NSStringFromClass(v29);
  v49 = @"title";
  v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v49 count:1];
  v43.receiver = self;
  v43.super_class = (Class)VSAutoAuthenticationAppDocumentController;
  v32 = [(VSAppDocumentController *)&v43 _getSupportedButtonTextsforTemplate:v30 andElementKeys:v31 supportedCount:1];
  v33 = [v32 firstObject];

  v34 = (objc_class *)objc_opt_class();
  v35 = NSStringFromClass(v34);
  v48 = @"text";
  v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v48 count:1];
  v42.receiver = self;
  v42.super_class = (Class)VSAutoAuthenticationAppDocumentController;
  v37 = [(VSAppDocumentController *)&v42 _getSupportedButtonTextsforTemplate:v35 andElementKeys:v36 supportedCount:1];
  v38 = [v37 firstObject];

  [v5 setManualSignInTitle:v33];
  [v5 setManualSignInButtonText:v38];

  return 1;
}

- (IKViewElement)buttonLockupElement
{
  return self->_buttonLockupElement;
}

- (void)setButtonLockupElement:(id)a3
{
}

- (void).cxx_destruct
{
}

@end