@interface SUScriptModalDialog
+ (id)titleForURL:(id)a3;
- (SUScriptModalDialog)initWithDialog:(id)a3;
- (SUScriptModalDialogDelegate)delegate;
- (id)_copyResponseByRunningModal;
- (id)copyResponseByRunningModal;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation SUScriptModalDialog

- (SUScriptModalDialog)initWithDialog:(id)a3
{
  v4 = [(SUScriptModalDialog *)self init];
  if (v4) {
    v4->_dialog = (ISDialog *)a3;
  }
  return v4;
}

- (void)dealloc
{
  self->_dialog = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUScriptModalDialog;
  [(SUScriptModalDialog *)&v3 dealloc];
}

+ (id)titleForURL:(id)a3
{
  if (([a3 isFileURL] & 1) == 0) {
    return (id)[MEMORY[0x263F089D8] stringWithFormat:@"%@://%@", objc_msgSend(a3, "scheme"), objc_msgSend(a3, "host")];
  }
  v4 = (void *)[a3 path];
  v5 = (void *)[v4 lastPathComponent];
  if ([v5 length]) {
    return v5;
  }
  else {
    return v4;
  }
}

- (id)copyResponseByRunningModal
{
  objc_super v3 = objc_msgSend(MEMORY[0x263EFF958], "invocationWithMethodSignature:", -[SUScriptModalDialog methodSignatureForSelector:](self, "methodSignatureForSelector:", sel__copyResponseByRunningModal));
  [v3 setSelector:sel__copyResponseByRunningModal];
  [v3 setTarget:self];
  WebThreadLockPushModal();
  WebThreadCallDelegate();
  WebThreadLockPopModal();
  v5 = 0;
  [v3 getReturnValue:&v5];
  return v5;
}

- (id)_copyResponseByRunningModal
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  objc_super v3 = objc_alloc_init(SUScriptModalDialogResponse);
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  uint64_t v53 = 0;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3052000000;
  v47 = __Block_byref_object_copy__6;
  v48 = __Block_byref_object_dispose__6;
  uint64_t v49 = 0;
  id v4 = (id)[(SUScriptModalDialogDelegate *)self->_delegate presentingViewControllerForScriptModalDialog:self];
  v5 = (void *)[v4 view];
  if ([v5 window])
  {
    v6 = +[SUScriptDialogAlertController alertControllerWithTitle:[(ISDialog *)self->_dialog title] message:[(ISDialog *)self->_dialog message] preferredStyle:1];
    v7 = (void *)[(ISDialog *)self->_dialog buttons];
    v25 = v5;
    v24 = v3;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    obuint64_t j = v7;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v40 objects:v55 count:16];
    if (v8)
    {
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v41 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = (void *)MEMORY[0x263F1C3F0];
          uint64_t v13 = [*(id *)(*((void *)&v40 + 1) + 8 * i) title];
          v39[0] = MEMORY[0x263EF8330];
          v39[1] = 3221225472;
          v39[2] = __50__SUScriptModalDialog__copyResponseByRunningModal__block_invoke;
          v39[3] = &unk_264813248;
          v39[4] = &v50;
          v39[5] = v9 + i;
          -[SUScriptDialogAlertController addAction:](v6, "addAction:", [v12 actionWithTitle:v13 style:0 handler:v39]);
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v40 objects:v55 count:16];
        v9 += i;
      }
      while (v8);
    }
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3052000000;
    v36 = __Block_byref_object_copy__6;
    v37 = __Block_byref_object_dispose__6;
    uint64_t v38 = 0;
    v14 = (void *)[(ISDialog *)self->_dialog textFields];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v54 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(v14);
          }
          uint64_t v18 = *(void *)(*((void *)&v29 + 1) + 8 * j);
          v28[0] = MEMORY[0x263EF8330];
          v28[1] = 3221225472;
          v28[2] = __50__SUScriptModalDialog__copyResponseByRunningModal__block_invoke_2;
          v28[3] = &unk_264813270;
          v28[4] = v18;
          v28[5] = &v33;
          [(SUScriptDialogAlertController *)v6 addTextFieldWithConfigurationHandler:v28];
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v54 count:16];
      }
      while (v15);
    }
    [v4 presentViewController:v6 animated:1 completion:0];
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "runModal:", v25);

    uint64_t v19 = objc_msgSend((id)objc_msgSend((id)v34[5], "text"), "copy");
    v45[5] = v19;
    _Block_object_dispose(&v33, 8);
    objc_super v3 = v24;
  }
  else
  {
    NSLog(&cfstr_WarningViewFor.isa);
    v20 = dispatch_semaphore_create(0);
    v21 = (void *)[(ISDialog *)self->_dialog copyXPCEncoding];
    v22 = (void *)[objc_alloc(MEMORY[0x263F7B3E0]) initWithEncodedDialog:v21];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __50__SUScriptModalDialog__copyResponseByRunningModal__block_invoke_3;
    v27[3] = &unk_264813298;
    v27[5] = &v50;
    v27[6] = &v44;
    v27[4] = v20;
    [v22 startWithDialogResponseBlock:v27];
    dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v20);

    xpc_release(v21);
  }

  [(SUScriptModalDialogResponse *)v3 setTextFieldValue:v45[5]];
  [(SUScriptModalDialogResponse *)v3 setButtonIndex:v51[3]];

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v50, 8);
  return v3;
}

uint64_t __50__SUScriptModalDialog__copyResponseByRunningModal__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(void *)(a1 + 40);
  v1 = (void *)[MEMORY[0x263F1C408] sharedApplication];

  return [v1 stopModal];
}

id __50__SUScriptModalDialog__copyResponseByRunningModal__block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setText:", objc_msgSend(*(id *)(a1 + 32), "value"));
  id result = (id)objc_msgSend(a2, "setPlaceholder:", objc_msgSend(*(id *)(a1 + 32), "title"));
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id result = a2;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

intptr_t __50__SUScriptModalDialog__copyResponseByRunningModal__block_invoke_3(void *a1, void *a2)
{
  *(void *)(*(void *)(a1[5] + 8) + 24) = [a2 selectedButtonIndex];
  *(void *)(*(void *)(a1[6] + 8) + 40) = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "textFieldValues"), "firstObject"), "copy");
  id v4 = a1[4];

  return dispatch_semaphore_signal(v4);
}

- (SUScriptModalDialogDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SUScriptModalDialogDelegate *)a3;
}

@end