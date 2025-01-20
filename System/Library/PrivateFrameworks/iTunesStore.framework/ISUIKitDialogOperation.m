@interface ISUIKitDialogOperation
- (void)_cleanupAlert;
- (void)_showAlertWithCompletion:(id)a3;
- (void)handleButtonSelected:(int64_t)a3 withResponseDictionary:(id)a4;
- (void)run;
@end

@implementation ISUIKitDialogOperation

- (void)run
{
  v2 = self;
  uint64_t v70 = *MEMORY[0x263EF8340];
  v3 = [(ISDialogOperation *)self dialog];
  v4 = v3;
  if (v3 && ([v3 isDisplayable] & 1) != 0)
  {
    dispatch_semaphore_t v47 = dispatch_semaphore_create(0);
    Class UIAlertControllerClass = getUIAlertControllerClass();
    v6 = [v4 title];
    v7 = [v4 message];
    uint64_t v8 = [(objc_class *)UIAlertControllerClass alertControllerWithTitle:v6 message:v7 preferredStyle:1];
    alert = v2->_alert;
    v2->_alert = (UIAlertController *)v8;

    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    v46 = v4;
    v10 = [v4 textFields];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v62 objects:v67 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v63 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v62 + 1) + 8 * i);
          v16 = v2->_alert;
          v61[0] = MEMORY[0x263EF8330];
          v61[1] = 3221225472;
          v61[2] = __29__ISUIKitDialogOperation_run__block_invoke;
          v61[3] = &unk_264261140;
          v61[4] = v15;
          [(UIAlertController *)v16 addTextFieldWithConfigurationHandler:v61];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v62 objects:v67 count:16];
      }
      while (v12);
    }

    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    v4 = v46;
    v17 = [v46 buttons];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v57 objects:v66 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      int v20 = 0;
      v21 = 0;
      uint64_t v22 = *(void *)v58;
      obuint64_t j = v17;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          v24 = v2;
          if (*(void *)v58 != v22) {
            objc_enumerationMutation(obj);
          }
          v25 = *(void **)(*((void *)&v57 + 1) + 8 * j);
          v26 = [v25 title];
          v27 = [v26 lowercaseString];
          int v28 = [v27 isEqualToString:@"cancel"];

          if (v28)
          {
            id v29 = v25;

            v21 = v29;
            v2 = v24;
          }
          else
          {
            Class UIAlertActionClass = getUIAlertActionClass();
            v31 = [v25 title];
            v54[0] = MEMORY[0x263EF8330];
            v54[1] = 3221225472;
            v54[2] = __29__ISUIKitDialogOperation_run__block_invoke_2;
            v54[3] = &unk_264261168;
            v2 = v24;
            v54[4] = v24;
            int v56 = v20;
            v55 = v47;
            v32 = [(objc_class *)UIAlertActionClass actionWithTitle:v31 style:0 handler:v54];

            [(UIAlertController *)v24->_alert addAction:v32];
            ++v20;
          }
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v57 objects:v66 count:16];
      }
      while (v19);

      if (v21)
      {
        Class v33 = getUIAlertActionClass();
        v34 = [v21 title];
        v51[0] = MEMORY[0x263EF8330];
        v51[1] = 3221225472;
        v51[2] = __29__ISUIKitDialogOperation_run__block_invoke_3;
        v51[3] = &unk_264261168;
        v51[4] = v2;
        int v53 = v20;
        dispatch_semaphore_t v35 = v47;
        v52 = v47;
        v36 = [(objc_class *)v33 actionWithTitle:v34 style:1 handler:v51];

        [(UIAlertController *)v2->_alert addAction:v36];
        v4 = v46;
LABEL_38:
        v49[0] = MEMORY[0x263EF8330];
        v49[1] = 3221225472;
        v49[2] = __29__ISUIKitDialogOperation_run__block_invoke_4;
        v49[3] = &unk_264261190;
        dispatch_semaphore_t v50 = v35;
        v44 = v35;
        [(ISUIKitDialogOperation *)v2 _showAlertWithCompletion:v49];
        dispatch_semaphore_wait(v44, 0xFFFFFFFFFFFFFFFFLL);

        goto LABEL_39;
      }
      v4 = v46;
    }
    else
    {

      v21 = 0;
    }
    dispatch_semaphore_t v35 = v47;
    goto LABEL_38;
  }
  v37 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v37)
  {
    v37 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v38 = [v37 shouldLog];
  if ([v37 shouldLogToDisk]) {
    int v39 = v38 | 2;
  }
  else {
    int v39 = v38;
  }
  v40 = [v37 OSLogObject];
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO)) {
    int v41 = v39;
  }
  else {
    int v41 = v39 & 2;
  }
  if (!v41) {
    goto LABEL_33;
  }
  int v68 = 138412290;
  id v69 = (id)objc_opt_class();
  id v42 = v69;
  LODWORD(v45) = 12;
  v43 = (void *)_os_log_send_and_compose_impl();

  if (v43)
  {
    v40 = objc_msgSend(NSString, "stringWithCString:encoding:", v43, 4, &v68, v45);
    free(v43);
    SSFileLog();
LABEL_33:
  }
  [(ISOperation *)v2 setSuccess:1];
LABEL_39:
}

void __29__ISUIKitDialogOperation_run__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 keyboardType];
  uint64_t v6 = 4;
  if (v5 != 4) {
    uint64_t v6 = v5 == 0;
  }
  if (v5 == 7) {
    uint64_t v7 = 7;
  }
  else {
    uint64_t v7 = v6;
  }
  [v4 setKeyboardType:v7];
  objc_msgSend(v4, "setSecureTextEntry:", objc_msgSend(*(id *)(a1 + 32), "isSecure"));
  uint64_t v8 = [*(id *)(a1 + 32) title];
  [v4 setPlaceholder:v8];

  id v9 = [*(id *)(a1 + 32) value];
  [v4 setText:v9];
}

intptr_t __29__ISUIKitDialogOperation_run__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) handleButtonSelected:*(int *)(a1 + 48) withResponseDictionary:0];
  v2 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v2);
}

intptr_t __29__ISUIKitDialogOperation_run__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) handleButtonSelected:*(int *)(a1 + 48) withResponseDictionary:0];
  v2 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v2);
}

intptr_t __29__ISUIKitDialogOperation_run__block_invoke_4(intptr_t result, char a2)
{
  if ((a2 & 1) == 0) {
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(result + 32));
  }
  return result;
}

- (void)_cleanupAlert
{
  [(UIWindow *)self->_window setHidden:1];
  window = self->_window;
  self->_window = 0;
}

- (void)_showAlertWithCompletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void (**)(void, void))v4;
  if (!self->_alert)
  {
    uint64_t v6 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v6)
    {
      uint64_t v6 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    id v9 = [v6 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      v8 &= 2u;
    }
    if (v8)
    {
      int v15 = 138412290;
      id v16 = (id)objc_opt_class();
      id v10 = v16;
      LODWORD(v12) = 12;
      uint64_t v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11)
      {
LABEL_14:

        v5[2](v5, 0);
        goto LABEL_15;
      }
      id v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v15, v12);
      free(v11);
      SSFileLog();
    }

    goto LABEL_14;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__ISUIKitDialogOperation__showAlertWithCompletion___block_invoke;
  block[3] = &unk_2642611B8;
  block[4] = self;
  id v14 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);

LABEL_15:
}

void __51__ISUIKitDialogOperation__showAlertWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(getUIWindowClass());
  v3 = [(objc_class *)getUIScreenClass() mainScreen];
  [v3 bounds];
  uint64_t v4 = objc_msgSend(v2, "initWithFrame:");
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 384);
  *(void *)(v5 + 384) = v4;

  int v7 = *(void **)(*(void *)(a1 + 32) + 384);
  id v8 = objc_alloc_init(getUIViewControllerClass());
  [v7 setRootViewController:v8];

  id v9 = [(objc_class *)getUIApplicationClass() sharedApplication];
  id v10 = [v9 delegate];

  if (objc_opt_respondsToSelector())
  {
    uint64_t v11 = *(void **)(*(void *)(a1 + 32) + 384);
    uint64_t v12 = [v10 window];
    uint64_t v13 = [v12 tintColor];
    [v11 setTintColor:v13];
  }
  id v14 = [(objc_class *)getUIApplicationClass() sharedApplication];
  int v15 = [v14 windows];
  id v16 = [v15 lastObject];

  if (v16)
  {
    uint64_t v17 = *(void **)(*(void *)(a1 + 32) + 384);
    [v16 windowLevel];
    [v17 setWindowLevel:v18 + 1.0];
    [*(id *)(*(void *)(a1 + 32) + 384) makeKeyAndVisible];
    uint64_t v19 = [*(id *)(*(void *)(a1 + 32) + 384) rootViewController];
    if (v19)
    {
      uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 376);
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __51__ISUIKitDialogOperation__showAlertWithCompletion___block_invoke_8;
      v34[3] = &unk_264260B30;
      id v35 = *(id *)(a1 + 40);
      [v19 presentViewController:v20 animated:1 completion:v34];

LABEL_30:
      goto LABEL_31;
    }
    v27 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v27)
    {
      v27 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v28 = [v27 shouldLog];
    if ([v27 shouldLogToDisk]) {
      int v29 = v28 | 2;
    }
    else {
      int v29 = v28;
    }
    v30 = [v27 OSLogObject];
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      v29 &= 2u;
    }
    if (v29)
    {
      int v36 = 138412290;
      id v37 = (id)objc_opt_class();
      id v31 = v37;
      LODWORD(v33) = 12;
      v32 = (void *)_os_log_send_and_compose_impl();

      if (!v32)
      {
LABEL_29:

        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        goto LABEL_30;
      }
      v30 = objc_msgSend(NSString, "stringWithCString:encoding:", v32, 4, &v36, v33);
      free(v32);
      SSFileLog();
    }

    goto LABEL_29;
  }
  v21 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v21)
  {
    v21 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v22 = [v21 shouldLog];
  if ([v21 shouldLogToDisk]) {
    int v23 = v22 | 2;
  }
  else {
    int v23 = v22;
  }
  v24 = [v21 OSLogObject];
  if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    v23 &= 2u;
  }
  if (!v23) {
    goto LABEL_16;
  }
  int v36 = 138412290;
  id v37 = (id)objc_opt_class();
  id v25 = v37;
  LODWORD(v33) = 12;
  v26 = (void *)_os_log_send_and_compose_impl();

  if (v26)
  {
    v24 = objc_msgSend(NSString, "stringWithCString:encoding:", v26, 4, &v36, v33);
    free(v26);
    SSFileLog();
LABEL_16:
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_31:
}

uint64_t __51__ISUIKitDialogOperation__showAlertWithCompletion___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleButtonSelected:(int64_t)a3 withResponseDictionary:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v6 = [(ISDialogOperation *)self dialog];
  int v7 = [v6 buttons];

  if (a3 < 0
    || [v7 count] <= (unint64_t)a3
    || ([v7 objectAtIndexedSubscript:a3], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v9 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v9)
    {
      id v9 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v11 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    uint64_t v13 = [v9 OSLogObject];
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      v12 &= 2u;
    }
    if (v12)
    {
      int v34 = 138412546;
      id v35 = (id)objc_opt_class();
      __int16 v36 = 2048;
      int64_t v37 = a3;
      id v14 = v35;
      LODWORD(v27) = 22;
      int v15 = (void *)_os_log_send_and_compose_impl();

      if (v15)
      {
        id v16 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v34, v27);
        free(v15);
        SSFileLog();
      }
    }
    else
    {
    }
  }
  else
  {
    id v9 = (void *)v8;
    id v10 = [(ISOperation *)self delegate];
    int v28 = v10;
    if (objc_opt_respondsToSelector())
    {
      [v10 operation:self selectedButton:v9];
    }
    else if ([(ISDialogOperation *)self performDefaultActions])
    {
      uint64_t v17 = [(ISDialogOperation *)self dialog];
      [v9 performDefaultActionForDialog:v17];
    }
    [(ISDialogOperation *)self setSelectedButton:v9];
    [(ISOperation *)self lock];
    textFieldValues = self->super._textFieldValues;
    self->super._textFieldValues = 0;

    uint64_t v19 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v20 = [(UIAlertController *)self->_alert textFields];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v30 != v23) {
            objc_enumerationMutation(v20);
          }
          id v25 = [*(id *)(*((void *)&v29 + 1) + 8 * i) text];
          [(NSArray *)v19 addObject:v25];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v22);
    }

    v26 = self->super._textFieldValues;
    self->super._textFieldValues = v19;

    [(ISOperation *)self unlock];
    [(ISOperation *)self setSuccess:1];
    [(ISUIKitDialogOperation *)self _cleanupAlert];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);

  objc_storeStrong((id *)&self->_alert, 0);
}

@end