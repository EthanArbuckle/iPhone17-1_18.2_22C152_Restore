@interface ISTouchIDDialog
- (BOOL)isDualAction;
- (BOOL)isFree;
- (ISTouchIDDialog)initWithDialogDictionary:(id)a3;
- (NSString)body;
- (NSString)fallbackExplanation;
- (NSString)fallbackMessage;
- (NSString)username;
- (id)buttonForButtonType:(int64_t)a3;
- (id)paymentSheet;
- (void)_init;
- (void)_parseDialogDictionary:(id)a3;
- (void)setBody:(id)a3;
- (void)setFallbackExplanation:(id)a3;
- (void)setFallbackMessage:(id)a3;
- (void)setIsFree:(BOOL)a3;
- (void)setUsername:(id)a3;
@end

@implementation ISTouchIDDialog

- (ISTouchIDDialog)initWithDialogDictionary:(id)a3
{
  id v4 = a3;
  __ISRecordSPIClassUsage(self);
  v8.receiver = self;
  v8.super_class = (Class)ISTouchIDDialog;
  v5 = [(ISDialog *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(ISTouchIDDialog *)v5 _init];
    [(ISTouchIDDialog *)v6 _parseDialogDictionary:v4];
  }

  return v6;
}

- (void)_init
{
  self->_isDualAction = 0;
  self->_lock = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);

  MEMORY[0x270F9A758]();
}

- (NSString)fallbackExplanation
{
  [(NSLock *)self->_lock lock];
  v3 = [(SSPaymentSheet *)self->_paymentSheet explanation];
  [(NSLock *)self->_lock unlock];

  return (NSString *)v3;
}

- (NSString)fallbackMessage
{
  [(NSLock *)self->_lock lock];
  v3 = [(SSPaymentSheet *)self->_paymentSheet message];
  [(NSLock *)self->_lock unlock];

  return (NSString *)v3;
}

- (void)setFallbackExplanation:(id)a3
{
  lock = self->_lock;
  id v5 = a3;
  [(NSLock *)lock lock];
  [(SSPaymentSheet *)self->_paymentSheet setExplanation:v5];

  v6 = self->_lock;

  [(NSLock *)v6 unlock];
}

- (void)setFallbackMessage:(id)a3
{
  lock = self->_lock;
  id v5 = a3;
  [(NSLock *)lock lock];
  [(SSPaymentSheet *)self->_paymentSheet setMessage:v5];

  v6 = self->_lock;

  [(NSLock *)v6 unlock];
}

- (id)buttonForButtonType:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(ISDialog *)self buttons];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 buttonType] == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (void)_parseDialogDictionary:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v4 = (objc_class *)MEMORY[0x263F7B2D0];
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithDictionary:v5];

  uint64_t v7 = [v6 dictionaryByEvaluatingConditions];
  objc_super v8 = [v7 objectForKey:@"explanation"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(ISTouchIDDialog *)self setBody:v8];
  }
  v9 = [v7 objectForKey:@"isFree"];

  if (objc_opt_respondsToSelector()) {
    -[ISTouchIDDialog setIsFree:](self, "setIsFree:", [v9 BOOLValue]);
  }
  id v10 = [v7 objectForKey:@"message"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(ISDialog *)self setTitle:v10];
  }
  v11 = [v7 objectForKey:@"username"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(ISTouchIDDialog *)self setUsername:v11];
  }
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v13 = [v7 objectForKey:@"cancelButtonString"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v14 = objc_alloc_init(ISTouchIDDialogButton);
    [(ISTouchIDDialogButton *)v14 setButtonType:0];
    [(ISDialogButton *)v14 setTitle:v13];
    long long v15 = [v7 objectForKey:@"cancelButtonAction"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(ISDialogButton *)v14 loadFromDictionary:v15];
    }
    [v12 addObject:v14];
  }
  else
  {
    long long v15 = v13;
  }
  v16 = [v7 objectForKey:@"passwordButtonString"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v17 = objc_alloc_init(ISTouchIDDialogButton);
    [(ISTouchIDDialogButton *)v17 setButtonType:1];
    [(ISDialogButton *)v17 setTitle:v16];
    v18 = [v7 objectForKey:@"passwordButtonAction"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(ISDialogButton *)v17 loadFromDictionary:v18];
    }
    [v12 addObject:v17];
  }
  else
  {
    v18 = v16;
  }
  id v19 = [v7 objectForKey:@"touchIDButtonAction"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v20 = objc_alloc_init(ISTouchIDDialogButton);
    [(ISTouchIDDialogButton *)v20 setButtonType:2];
    [(ISDialogButton *)v20 loadFromDictionary:v19];
    [v12 addObject:v20];
  }
  [(ISDialog *)self setButtons:v12];
  if (SSDebugShouldUseFileBasedPaymentSheetProxy())
  {
    v21 = +[ISBiometricStore diskBasedPaymentSheet];
    paymentSheet = self->_paymentSheet;
    self->_paymentSheet = v21;
  }
  else
  {
    v23 = [v7 objectForKey:@"paymentSheetInfo"];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_26;
    }
    id v19 = v23;
    paymentSheet = [(ISDialog *)self buyParams];
    v24 = (SSPaymentSheet *)[objc_alloc(MEMORY[0x263F7B2A8]) initWithServerResponse:v19 buyParams:paymentSheet];

    v25 = self->_paymentSheet;
    self->_paymentSheet = v24;
  }
  v23 = v19;
LABEL_26:
  v26 = [v7 objectForKey:@"applePayPaymentSession"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v27 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v26 options:0];
    id v47 = 0;
    v28 = [MEMORY[0x263F08900] JSONObjectWithData:v27 options:1 error:&v47];
    id v46 = v47;
    if (v46)
    {
      v45 = v27;
      v29 = v6;
      v30 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
      if (!v30)
      {
        v30 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v31 = [v30 shouldLog];
      if ([v30 shouldLogToDisk]) {
        int v32 = v31 | 2;
      }
      else {
        int v32 = v31;
      }
      v33 = [v30 OSLogObject];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        int v34 = v32;
      }
      else {
        int v34 = v32 & 2;
      }
      if (!v34) {
        goto LABEL_61;
      }
      v35 = objc_opt_class();
      int v48 = 138543618;
      v49 = v35;
      __int16 v50 = 2114;
      id v51 = v46;
      id v36 = v35;
      LODWORD(v44) = 22;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v37 = self->_paymentSheet;
        if (v37)
        {
          [(SSPaymentSheet *)v37 setMerchantSession:v28];
          self->_isDualAction = 1;
LABEL_63:

          goto LABEL_64;
        }
        v45 = v27;
        v29 = v6;
        v30 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
        if (!v30)
        {
          v30 = [MEMORY[0x263F7B1F8] sharedConfig];
        }
        int v40 = [v30 shouldLog];
        if ([v30 shouldLogToDisk]) {
          v40 |= 2u;
        }
        v33 = [v30 OSLogObject];
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          int v41 = v40;
        }
        else {
          int v41 = v40 & 2;
        }
        if (!v41) {
          goto LABEL_61;
        }
      }
      else
      {
        v45 = v27;
        v29 = v6;
        v30 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
        if (!v30)
        {
          v30 = [MEMORY[0x263F7B1F8] sharedConfig];
        }
        int v38 = [v30 shouldLog];
        if ([v30 shouldLogToDisk]) {
          v38 |= 2u;
        }
        v33 = [v30 OSLogObject];
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          int v39 = v38;
        }
        else {
          int v39 = v38 & 2;
        }
        if (!v39) {
          goto LABEL_61;
        }
      }
      v42 = objc_opt_class();
      int v48 = 138543362;
      v49 = v42;
      id v36 = v42;
      LODWORD(v44) = 12;
    }
    v43 = (void *)_os_log_send_and_compose_impl();

    if (!v43)
    {
LABEL_62:

      uint64_t v6 = v29;
      v27 = v45;
      goto LABEL_63;
    }
    v33 = objc_msgSend(NSString, "stringWithCString:encoding:", v43, 4, &v48, v44);
    free(v43);
    SSFileLog();
LABEL_61:

    goto LABEL_62;
  }
LABEL_64:
}

- (id)paymentSheet
{
  return objc_getProperty(self, a2, 184, 1);
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (BOOL)isDualAction
{
  return self->_isDualAction;
}

- (BOOL)isFree
{
  return self->_isFree;
}

- (void)setIsFree:(BOOL)a3
{
  self->_isFree = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_paymentSheet, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

@end