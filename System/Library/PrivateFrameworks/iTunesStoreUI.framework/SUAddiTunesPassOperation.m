@interface SUAddiTunesPassOperation
- (BOOL)addedCard;
- (OS_dispatch_semaphore)semaphore;
- (PKPass)pass;
- (PKPass)presentedPass;
- (SSAuthenticationContext)authenticationContext;
- (SUAddiTunesPassOperation)initWithViewController:(id)a3;
- (UIViewController)viewController;
- (void)addPassesViewControllerDidFinish:(id)a3;
- (void)run;
- (void)setAddedCard:(BOOL)a3;
- (void)setAuthenticationContext:(id)a3;
- (void)setPass:(id)a3;
- (void)setPresentedPass:(id)a3;
- (void)setSemaphore:(id)a3;
@end

@implementation SUAddiTunesPassOperation

- (SUAddiTunesPassOperation)initWithViewController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUAddiTunesPassOperation;
  v6 = [(SUAddiTunesPassOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_authenticationContext, a3);
  }

  return v7;
}

- (void)run
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F7B0E8] defaultStore];
  v4 = [v3 activeAccount];
  id v5 = [v4 ITunesPassSerialNumber];

  if (!v5)
  {
LABEL_11:
    id v13 = objc_alloc(MEMORY[0x263F894B0]);
    v14 = [MEMORY[0x263F7B358] contextWithBagType:0];
    id v6 = (id)[v13 initWithBagContext:v14];

    [v6 start];
    v15 = [v6 URLBag];
    v8 = v15;
    if (!v15)
    {
      objc_super v9 = [MEMORY[0x263F7B1F8] sharedConfig];
      int v38 = [v9 shouldLog];
      if ([v9 shouldLogToDisk]) {
        int v39 = v38 | 2;
      }
      else {
        int v39 = v38;
      }
      v12 = [v9 OSLogObject];
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        v39 &= 2u;
      }
      if (!v39) {
        goto LABEL_60;
      }
      goto LABEL_35;
    }
    objc_super v9 = [v15 valueForKey:@"getAddCreditPassUrl"];
    if ([v9 length])
    {
      uint64_t v16 = [NSURL URLWithString:v9];
      if (v16)
      {
        v12 = v16;
        id v17 = objc_alloc_init(MEMORY[0x263F89528]);
        v18 = [MEMORY[0x263F89470] provider];
        [v17 setDataProvider:v18];

        v19 = [(SUAddiTunesPassOperation *)self authenticationContext];
        [v17 setAuthenticationContext:v19];

        v20 = (void *)[objc_alloc(MEMORY[0x263F7B368]) initWithURL:v12];
        [v17 setRequestProperties:v20];

        id v68 = 0;
        [(SUAddiTunesPassOperation *)self runSubOperation:v17 returningError:&v68];
        id v21 = v68;
        if (v21) {
          goto LABEL_37;
        }
        v22 = [v17 dataProvider];
        v23 = [v22 output];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        id v21 = 0;
        if ((isKindOfClass & 1) == 0)
        {
LABEL_37:
          v42 = [MEMORY[0x263F7B1F8] sharedConfig];
          int v43 = [v42 shouldLog];
          if ([v42 shouldLogToDisk]) {
            v43 |= 2u;
          }
          v63 = v42;
          v27 = [v42 OSLogObject];
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            v43 &= 2u;
          }
          if (v43)
          {
            v44 = objc_opt_class();
            int v69 = 138543618;
            id v70 = v44;
            __int16 v71 = 2114;
            id v58 = v21;
            id v72 = v21;
            id v45 = v44;
            LODWORD(v55) = 22;
            v46 = (void *)_os_log_send_and_compose_impl();

            if (!v46)
            {
              id v21 = v58;
              v32 = v63;
LABEL_59:

              goto LABEL_60;
            }
            v27 = objc_msgSend(NSString, "stringWithCString:encoding:", v46, 4, &v69, v55);
            free(v46);
            v32 = v63;
            SSFileLog();
            id v21 = v58;
          }
          else
          {
            v32 = v63;
          }
LABEL_58:

          goto LABEL_59;
        }
        v25 = [v17 dataProvider];
        uint64_t v26 = [v25 output];

        id v67 = 0;
        v62 = (void *)v26;
        v27 = [objc_alloc((Class)ISWeakLinkedClassForString()) initWithData:v26 error:&v67];
        id v21 = v67;
        if (v27)
        {
          [(SUAddiTunesPassOperation *)self setPresentedPass:v27];
          dispatch_semaphore_t v28 = dispatch_semaphore_create(0);
          [(SUAddiTunesPassOperation *)self setSemaphore:v28];

          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __31__SUAddiTunesPassOperation_run__block_invoke;
          block[3] = &unk_264812290;
          v65 = v27;
          v66 = self;
          dispatch_async(MEMORY[0x263EF83A0], block);
          v29 = [(SUAddiTunesPassOperation *)self semaphore];
          dispatch_semaphore_wait(v29, 0xFFFFFFFFFFFFFFFFLL);

          if ([(SUAddiTunesPassOperation *)self addedCard])
          {
            v30 = [(SUAddiTunesPassOperation *)self presentedPass];
            [(SUAddiTunesPassOperation *)self setPass:v30];

            [(SUAddiTunesPassOperation *)self setSuccess:1];
          }
          v31 = v65;
          v32 = v62;
          goto LABEL_57;
        }
        v47 = [MEMORY[0x263F7B1F8] sharedConfig];
        int v59 = [v47 shouldLog];
        int v48 = [v47 shouldLogToDisk];
        int v49 = v59 | 2;
        if (!v48) {
          int v49 = v59;
        }
        int v60 = v49;
        v56 = v47;
        v57 = [v47 OSLogObject];
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
          int v50 = v60;
        }
        else {
          int v50 = v60 & 2;
        }
        if (v50)
        {
          id v61 = v21;
          v51 = objc_opt_class();
          int v69 = 138543362;
          id v70 = v51;
          id v52 = v51;
          LODWORD(v55) = 12;
          v53 = (void *)_os_log_send_and_compose_impl();

          if (!v53)
          {
            id v21 = v61;
            v32 = v62;
            v31 = v56;
            goto LABEL_57;
          }
          uint64_t v54 = objc_msgSend(NSString, "stringWithCString:encoding:", v53, 4, &v69, v55);
          free(v53);
          v57 = v54;
          v31 = v56;
          SSFileLog();
          id v21 = v61;
          v32 = v62;
        }
        else
        {
          v32 = v62;
          v31 = v56;
        }

LABEL_57:
        goto LABEL_58;
      }
    }
    v12 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v33 = [v12 shouldLog];
    if ([v12 shouldLogToDisk]) {
      int v34 = v33 | 2;
    }
    else {
      int v34 = v33;
    }
    v35 = [v12 OSLogObject];
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      v34 &= 2u;
    }
    if (v34)
    {
      int v69 = 138543362;
      id v70 = (id)objc_opt_class();
      id v36 = v70;
      LODWORD(v55) = 12;
      v37 = (void *)_os_log_send_and_compose_impl();

      if (!v37)
      {
LABEL_60:

        goto LABEL_61;
      }
      v35 = objc_msgSend(NSString, "stringWithCString:encoding:", v37, 4, &v69, v55);
      free(v37);
      SSFileLog();
    }

    goto LABEL_60;
  }
  id v6 = objc_alloc_init((Class)ISWeakLinkedClassForString());
  uint64_t v7 = [v6 passWithPassTypeIdentifier:@"pass.com.apple.itunes.storecredit" serialNumber:v5];
  if (!v7)
  {

    goto LABEL_11;
  }
  v8 = (void *)v7;
  objc_super v9 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v10 = [v9 shouldLog];
  if ([v9 shouldLogToDisk]) {
    int v11 = v10 | 2;
  }
  else {
    int v11 = v10;
  }
  v12 = [v9 OSLogObject];
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    v11 &= 2u;
  }
  if (!v11) {
    goto LABEL_60;
  }
LABEL_35:
  int v69 = 138543362;
  id v70 = (id)objc_opt_class();
  id v40 = v70;
  LODWORD(v55) = 12;
  v41 = (void *)_os_log_send_and_compose_impl();

  if (v41)
  {
    v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v41, 4, &v69, v55);
    free(v41);
    SSFileLog();
    goto LABEL_60;
  }
LABEL_61:
}

void __31__SUAddiTunesPassOperation_run__block_invoke(uint64_t a1)
{
  id v3 = (id)[objc_alloc((Class)ISWeakLinkedClassForString()) initWithPass:*(void *)(a1 + 32)];
  [v3 setDelegate:*(void *)(a1 + 40)];
  v2 = [*(id *)(a1 + 40) viewController];
  [v2 presentViewController:v3 animated:1 completion:0];
}

- (void)addPassesViewControllerDidFinish:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init((Class)ISWeakLinkedClassForString());
  id v6 = [(SUAddiTunesPassOperation *)self presentedPass];
  int v7 = [v5 containsPass:v6];

  if (v7)
  {
    v8 = [MEMORY[0x263F7B0E8] defaultStore];
    objc_super v9 = [v8 activeAccount];

    int v10 = [(SUAddiTunesPassOperation *)self presentedPass];
    int v11 = [v10 serialNumber];
    [v9 setITunesPassSerialNumber:v11];

    v12 = [MEMORY[0x263F7B0E8] defaultStore];
    id v24 = 0;
    [v12 saveAccount:v9 error:&v24];
    id v13 = v24;

    if (!v13)
    {
      [(SUAddiTunesPassOperation *)self setAddedCard:1];
      goto LABEL_14;
    }
    v14 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v15 = [v14 shouldLog];
    if ([v14 shouldLogToDisk]) {
      int v16 = v15 | 2;
    }
    else {
      int v16 = v15;
    }
    id v17 = [v14 OSLogObject];
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      v16 &= 2u;
    }
    if (v16)
    {
      v18 = objc_opt_class();
      int v25 = 138543618;
      uint64_t v26 = v18;
      __int16 v27 = 2114;
      id v28 = v13;
      id v19 = v18;
      LODWORD(v23) = 22;
      v22 = &v25;
      v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20)
      {
LABEL_12:

LABEL_14:
        goto LABEL_15;
      }
      id v17 = objc_msgSend(NSString, "stringWithCString:encoding:", v20, 4, &v25, v23);
      free(v20);
      v22 = (int *)v17;
      SSFileLog();
    }

    goto LABEL_12;
  }
LABEL_15:
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0, v22);
  id v21 = [(SUAddiTunesPassOperation *)self semaphore];
  dispatch_semaphore_signal(v21);
}

- (SSAuthenticationContext)authenticationContext
{
  return *(SSAuthenticationContext **)&self->_addedCard;
}

- (void)setAuthenticationContext:(id)a3
{
}

- (UIViewController)viewController
{
  return (UIViewController *)self->_authenticationContext;
}

- (PKPass)pass
{
  return (PKPass *)self->_viewController;
}

- (void)setPass:(id)a3
{
}

- (BOOL)addedCard
{
  return *(&self->super._success + 1);
}

- (void)setAddedCard:(BOOL)a3
{
  *(&self->super._success + 1) = a3;
}

- (PKPass)presentedPass
{
  return self->_pass;
}

- (void)setPresentedPass:(id)a3
{
}

- (OS_dispatch_semaphore)semaphore
{
  return (OS_dispatch_semaphore *)self->_presentedPass;
}

- (void)setSemaphore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedPass, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_authenticationContext, 0);

  objc_storeStrong((id *)&self->_addedCard, 0);
}

@end