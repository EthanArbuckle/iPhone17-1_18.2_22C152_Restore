@interface VSWebAuthenticationAppDocumentController
- (BOOL)_updateViewModel:(id)a3 error:(id *)a4;
- (BOOL)_updateWebAuthenticationViewModel:(id)a3 error:(id *)a4;
- (BOOL)_updateWebAuthenticationViewModel:(id)a3 withTemplate:(id)a4 error:(id *)a5;
- (VSWebAuthenticationAppDocumentController)initWithAppDocument:(id)a3;
- (id)_newViewModel;
- (id)_webAuthenticationViewModelWithViewModel:(id)a3;
- (void)_sendMessage:(id)a3;
- (void)_startObservingViewModel:(id)a3;
- (void)_stopObservingViewModel:(id)a3;
- (void)didAddMessagesToMessageQueue:(id)a3;
- (void)messagePort:(id)a3 didReceiveMessage:(id)a4;
@end

@implementation VSWebAuthenticationAppDocumentController

- (VSWebAuthenticationAppDocumentController)initWithAppDocument:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)VSWebAuthenticationAppDocumentController;
  v3 = [(VSAppDocumentController *)&v12 initWithAppDocument:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(VSAppDocumentController *)v3 templateElement];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v6 = (void *)MEMORY[0x263EFF940];
        uint64_t v7 = *MEMORY[0x263EFF4A0];
        v8 = (objc_class *)objc_opt_class();
        v9 = NSStringFromClass(v8);
        [v6 raise:v7, @"Unexpectedly, template was %@, instead of VSWebAuthenticationTemplateElement.", v9 format];
      }
      v10 = [v5 messagePort];
      [v10 setDelegate:v4];
    }
  }
  return v4;
}

- (id)_webAuthenticationViewModelWithViewModel:(id)a3
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
    uint64_t v7 = NSStringFromClass(v6);
    [v4 raise:v5, @"Unexpectedly, viewModel was %@, instead of VSWebAuthenticationViewModel.", v7 format];
  }
  return v3;
}

- (BOOL)_updateWebAuthenticationViewModel:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(VSAppDocumentController *)self templateElement];
  if (objc_msgSend(v7, "vs_elementType") == 163)
  {
    id v11 = 0;
    BOOL v8 = [(VSWebAuthenticationAppDocumentController *)self _updateWebAuthenticationViewModel:v6 withTemplate:v7 error:&v11];
    id v9 = v11;
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  VSPrivateError();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v8 = 0;
  if (a4) {
LABEL_5:
  }
    *a4 = v9;
LABEL_6:

  return v8;
}

- (BOOL)_updateWebAuthenticationViewModel:(id)a3 withTemplate:(id)a4 error:(id *)a5
{
  id v7 = a3;
  BOOL v8 = [a4 attributes];
  id v9 = [v8 objectForKey:@"src"];

  if (v9
    && (v10 = (objc_class *)NSURL,
        id v11 = v9,
        objc_super v12 = (void *)[[v10 alloc] initWithString:v11],
        v11,
        v12))
  {
    [v7 setSourceURL:v12];

    BOOL v13 = 1;
  }
  else if (a5)
  {
    VSPrivateError();
    BOOL v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (void)_sendMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23F9AB000, v5, OS_LOG_TYPE_DEFAULT, "Will dispatch message event.", buf, 2u);
  }

  id v6 = [(VSAppDocumentController *)self templateElement];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    BOOL v8 = (void *)MEMORY[0x263EFF940];
    uint64_t v9 = *MEMORY[0x263EFF4A0];
    v10 = [(VSAppDocumentController *)self templateElement];
    id v11 = (objc_class *)objc_opt_class();
    objc_super v12 = NSStringFromClass(v11);
    [v8 raise:v9, @"Unexpectedly, [self templateElement] was %@, instead of VSWebAuthenticationTemplateElement.", v12 format];
  }
  BOOL v13 = [(VSAppDocumentController *)self templateElement];
  v14 = [v13 messagePort];
  v15 = [v14 appContext];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __57__VSWebAuthenticationAppDocumentController__sendMessage___block_invoke;
  v18[3] = &unk_265077438;
  id v19 = v4;
  id v16 = v4;
  [v15 evaluate:v18 completionBlock:&__block_literal_global_14];
  v17 = VSDefaultLogObject();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23F9AB000, v17, OS_LOG_TYPE_DEFAULT, "Did dispatch message event.", buf, 2u);
  }
}

void __57__VSWebAuthenticationAppDocumentController__sendMessage___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = VSScriptMessageDispatchInjection(*(void **)(a1 + 32));
  id v4 = (id)[v5 evaluateScript:v3];
}

void __57__VSWebAuthenticationAppDocumentController__sendMessage___block_invoke_2()
{
  v0 = VSDefaultLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_23F9AB000, v0, OS_LOG_TYPE_DEFAULT, "Did finish message event.", v1, 2u);
  }
}

- (void)messagePort:(id)a3 didReceiveMessage:(id)a4
{
  id v5 = a4;
  id v6 = [(VSAppDocumentController *)self viewModel];

  if (!v6) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The [self viewModel] parameter must not be nil."];
  }
  id v9 = [(VSAppDocumentController *)self viewModel];
  id v7 = [(VSWebAuthenticationAppDocumentController *)self _webAuthenticationViewModelWithViewModel:v9];
  BOOL v8 = [v7 messagesToWeb];
  [v8 addMessage:v5];
}

- (void)didAddMessagesToMessageQueue:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23F9AB000, v5, OS_LOG_TYPE_DEFAULT, "Messages from web did change.", buf, 2u);
  }

  id v6 = objc_alloc_init(VSScriptSecurityOrigin);
  id v7 = [(VSAppDocumentController *)self templateElement];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v9 = (void *)MEMORY[0x263EFF940];
    uint64_t v10 = *MEMORY[0x263EFF4A0];
    id v11 = [(VSAppDocumentController *)self templateElement];
    objc_super v12 = (objc_class *)objc_opt_class();
    BOOL v13 = NSStringFromClass(v12);
    [v9 raise:v10, @"Unexpectedly, [self templateElement] was %@, instead of VSWebAuthenticationTemplateElement.", v13 format];
  }
  v35 = [(VSAppDocumentController *)self templateElement];
  v34 = [v35 messagePort];
  v14 = [v34 appContext];
  id v15 = objc_alloc(MEMORY[0x263F08BA0]);
  v33 = v14;
  id v16 = [v14 app];
  v17 = [v16 appJSURL];
  v18 = (void *)[v15 initWithURL:v17 resolvingAgainstBaseURL:1];

  id v19 = [v18 scheme];
  [(VSScriptSecurityOrigin *)v6 setScheme:v19];

  v20 = [v18 host];
  [(VSScriptSecurityOrigin *)v6 setHost:v20];

  v32 = v18;
  v21 = [v18 port];
  -[VSScriptSecurityOrigin setPort:](v6, "setPort:", [v21 integerValue]);

  v36 = v4;
  v22 = [v4 removeAllMessages];
  v23 = VSDefaultLogObject();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v24 = [v22 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v42 = v24;
    _os_log_impl(&dword_23F9AB000, v23, OS_LOG_TYPE_DEFAULT, "Will process %lld messages", buf, 0xCu);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v25 = v22;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v38 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        if (VSShouldSendScriptMessageToContextWithOrigin(v30, v6))
        {
          [(VSWebAuthenticationAppDocumentController *)self _sendMessage:v30];
        }
        else
        {
          v31 = VSErrorLogObject();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v42 = (uint64_t)v30;
            __int16 v43 = 2112;
            v44 = v6;
            _os_log_error_impl(&dword_23F9AB000, v31, OS_LOG_TYPE_ERROR, "Discarding message %@ to origin %@", buf, 0x16u);
          }
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v27);
  }
}

- (void)_startObservingViewModel:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VSWebAuthenticationAppDocumentController;
  id v4 = a3;
  [(VSAppDocumentController *)&v7 _startObservingViewModel:v4];
  id v5 = -[VSWebAuthenticationAppDocumentController _webAuthenticationViewModelWithViewModel:](self, "_webAuthenticationViewModelWithViewModel:", v4, v7.receiver, v7.super_class);

  id v6 = [v5 messagesFromWeb];
  [v6 setDelegate:self];
}

- (void)_stopObservingViewModel:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VSWebAuthenticationAppDocumentController;
  id v4 = a3;
  [(VSAppDocumentController *)&v7 _stopObservingViewModel:v4];
  id v5 = -[VSWebAuthenticationAppDocumentController _webAuthenticationViewModelWithViewModel:](self, "_webAuthenticationViewModelWithViewModel:", v4, v7.receiver, v7.super_class);

  id v6 = [v5 messagesFromWeb];
  [v6 setDelegate:0];
}

- (id)_newViewModel
{
  return objc_alloc_init(VSWebAuthenticationViewModel);
}

- (BOOL)_updateViewModel:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VSWebAuthenticationAppDocumentController;
  [(VSAppDocumentController *)&v13 _updateViewModel:v6 error:a4];
  objc_super v7 = [(VSAppDocumentController *)self appDocument];
  id v8 = [v7 error];

  if (!v8)
  {
    id v11 = [(VSWebAuthenticationAppDocumentController *)self _webAuthenticationViewModelWithViewModel:v6];
    id v12 = 0;
    BOOL v9 = [(VSWebAuthenticationAppDocumentController *)self _updateWebAuthenticationViewModel:v11 error:&v12];
    id v8 = v12;

    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  BOOL v9 = 0;
  if (a4) {
LABEL_3:
  }
    *a4 = v8;
LABEL_4:

  return v9;
}

@end