@interface VSOnscreenCodeAuthenticationAppDocumentController
- (BOOL)_updateOnscreenCodeViewModel:(id)a3 error:(id *)a4;
- (BOOL)_updateOnscreenCodeViewModel:(id)a3 withTemplate:(id)a4;
- (BOOL)_updateViewModel:(id)a3 error:(id *)a4;
- (IKViewElement)buttonLockupViewElement;
- (id)_newViewModel;
- (id)_onscreenCodeViewModelWithViewModel:(id)a3;
- (void)onscreenCodeViewModelButtonLockupPressed;
- (void)setButtonLockupViewElement:(id)a3;
@end

@implementation VSOnscreenCodeAuthenticationAppDocumentController

- (id)_onscreenCodeViewModelWithViewModel:(id)a3
{
  id v3 = a3;
  if (!v3) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The viewModel parameter must not be nil."];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = (void *)MEMORY[0x263EFF940];
    uint64_t v5 = *MEMORY[0x263EFF4A0];
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    [v4 raise:v5, @"Unexpectedly, viewModel was %@, instead of VSOnscreenCodeViewModel.", v7 format];
  }
  return v3;
}

- (BOOL)_updateOnscreenCodeViewModel:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The viewModel parameter must not be nil."];
  }
  v7 = [(VSAppDocumentController *)self templateElement];
  if (objc_msgSend(v7, "vs_elementType") == 164)
  {
    BOOL v8 = [(VSOnscreenCodeAuthenticationAppDocumentController *)self _updateOnscreenCodeViewModel:v6 withTemplate:v7];
    v9 = 0;
    if (!a4) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  v9 = VSPrivateError();
  BOOL v8 = 0;
  if (a4) {
LABEL_7:
  }
    *a4 = v9;
LABEL_8:

  return v8;
}

- (BOOL)_updateOnscreenCodeViewModel:(id)a3 withTemplate:(id)a4
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = (uint64_t *)MEMORY[0x263EFF4A0];
  if (!v5) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The viewModel parameter must not be nil."];
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v41 = v6;
  BOOL v8 = [v6 children];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v45;
    uint64_t v12 = *v7;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v45 != v11) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend(v14, "vs_elementType");
        if (v15 == 157)
        {
          v26 = [v14 attributes];
          v19 = [v26 objectForKey:@"label"];

          if (v19 && ([v19 isEqualToString:&stru_26F361E90] & 1) == 0) {
            [v5 setWebPageLabel:v19];
          }
          v27 = [v14 attributes];
          v25 = [v27 objectForKey:@"src"];

          if (v25)
          {
            v28 = objc_msgSend(NSURL, "vs_URLWithString:", v25);
            if (v28) {
              [v5 setWebPageURL:v28];
            }
          }
          goto LABEL_25;
        }
        if (v15 == 138)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v20 = (void *)MEMORY[0x263EFF940];
            v21 = (objc_class *)objc_opt_class();
            v22 = NSStringFromClass(v21);
            [v20 raise:v12, @"Unexpectedly, childElement was %@, instead of IKTextElement.", v22 format];
          }
          id v23 = v14;
          v24 = [v23 text];
          v19 = [v24 string];

          v25 = [v23 elementName];

          if ([v25 isEqualToString:@"onscreenCode"]) {
            [v5 setOnscreenCode:v19];
          }
LABEL_25:

          goto LABEL_26;
        }
        if (v15 != 49) {
          continue;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v16 = (void *)MEMORY[0x263EFF940];
          v17 = (objc_class *)objc_opt_class();
          v18 = NSStringFromClass(v17);
          [v16 raise:v12, @"Unexpectedly, childElement was %@, instead of IKImageElement.", v18 format];
        }
        v19 = [(VSAppDocumentController *)self _imageItemProviderWithImageElement:v14];
        [v5 setLogoProvider:v19];
LABEL_26:
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v10);
  }

  v29 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
  v30 = [v29 localizedStringForKey:@"ONSCREEN_CODE_REGENERATION_BUTTON_TITLE" value:0 table:0];

  v31 = [(VSAppDocumentController *)self filteredButtonLockupElements];
  uint64_t v32 = [v31 count];

  if (v32)
  {
    v33 = [(VSAppDocumentController *)self filteredButtonLockupElements];
    v34 = [v33 firstObject];
    [(VSOnscreenCodeAuthenticationAppDocumentController *)self setButtonLockupViewElement:v34];

    v35 = (objc_class *)objc_opt_class();
    v36 = NSStringFromClass(v35);
    v48[0] = @"title";
    v48[1] = @"text";
    v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:2];
    v43.receiver = self;
    v43.super_class = (Class)VSOnscreenCodeAuthenticationAppDocumentController;
    v38 = [(VSAppDocumentController *)&v43 _getSupportedButtonTextsforTemplate:v36 andElementKeys:v37 supportedCount:1];
    uint64_t v39 = [v38 firstObject];

    v30 = (void *)v39;
  }
  [v5 setButtonLockupTitle:v30];
  [v5 setShowButtonLockup:v32 != 0];

  return 1;
}

- (void)onscreenCodeViewModelButtonLockupPressed
{
  id v2 = [(VSOnscreenCodeAuthenticationAppDocumentController *)self buttonLockupViewElement];
  [v2 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
}

- (id)_newViewModel
{
  id v3 = objc_alloc_init(VSOnscreenCodeViewModel);
  [(VSOnscreenCodeViewModel *)v3 setDelegate:self];
  return v3;
}

- (BOOL)_updateViewModel:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The viewModel parameter must not be nil."];
  }
  v13.receiver = self;
  v13.super_class = (Class)VSOnscreenCodeAuthenticationAppDocumentController;
  [(VSAppDocumentController *)&v13 _updateViewModel:v6 error:a4];
  v7 = [(VSAppDocumentController *)self appDocument];
  id v8 = [v7 error];

  if (!v8)
  {
    uint64_t v11 = [(VSOnscreenCodeAuthenticationAppDocumentController *)self _onscreenCodeViewModelWithViewModel:v6];
    id v12 = 0;
    BOOL v9 = [(VSOnscreenCodeAuthenticationAppDocumentController *)self _updateOnscreenCodeViewModel:v11 error:&v12];
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

- (IKViewElement)buttonLockupViewElement
{
  return self->_buttonLockupViewElement;
}

- (void)setButtonLockupViewElement:(id)a3
{
}

- (void).cxx_destruct
{
}

@end