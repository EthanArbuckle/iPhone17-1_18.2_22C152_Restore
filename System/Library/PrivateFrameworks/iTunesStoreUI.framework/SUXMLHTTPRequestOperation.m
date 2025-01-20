@interface SUXMLHTTPRequestOperation
- (BOOL)_isAllowedURL:(id)a3 withURLBag:(id)a4;
- (SUXMLHTTPRequestOperation)initWithRequestProperties:(id)a3;
- (id)outputBlock;
- (void)run;
- (void)setOutputBlock:(id)a3;
@end

@implementation SUXMLHTTPRequestOperation

- (SUXMLHTTPRequestOperation)initWithRequestProperties:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUXMLHTTPRequestOperation;
  v5 = [(SUXMLHTTPRequestOperation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    requestProperties = v5->_requestProperties;
    v5->_requestProperties = (SSURLRequestProperties *)v6;
  }
  return v5;
}

- (id)outputBlock
{
  [(SUXMLHTTPRequestOperation *)self lock];
  v3 = (void *)[self->_outputBlock copy];
  [(SUXMLHTTPRequestOperation *)self unlock];
  id v4 = (void *)MEMORY[0x22A680AE0](v3);

  return v4;
}

- (void)setOutputBlock:(id)a3
{
  id v6 = a3;
  [(SUXMLHTTPRequestOperation *)self lock];
  if (self->_outputBlock != v6)
  {
    id v4 = (void *)[v6 copy];
    id outputBlock = self->_outputBlock;
    self->_id outputBlock = v4;
  }
  [(SUXMLHTTPRequestOperation *)self unlock];
}

- (void)run
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F7B358] contextWithBagType:0];
  id v29 = 0;
  id v4 = [(SUXMLHTTPRequestOperation *)self loadedURLBagWithContext:v3 returningError:&v29];
  id v5 = v29;
  if (!v4)
  {
    uint64_t v10 = 0;
    v14 = 0;
    v13 = 0;
    goto LABEL_16;
  }
  id v6 = [(SSURLRequestProperties *)self->_requestProperties URL];
  BOOL v7 = [(SUXMLHTTPRequestOperation *)self _isAllowedURL:v6 withURLBag:v4];

  if (!v7)
  {
    v15 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v16 = [v15 shouldLog];
    if ([v15 shouldLogToDisk]) {
      int v17 = v16 | 2;
    }
    else {
      int v17 = v16;
    }
    v18 = [v15 OSLogObject];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      v17 &= 2u;
    }
    if (v17)
    {
      v19 = objc_opt_class();
      requestProperties = self->_requestProperties;
      id v21 = v19;
      v22 = [(SSURLRequestProperties *)requestProperties URL];
      int v30 = 138412546;
      v31 = v19;
      __int16 v32 = 2112;
      v33 = v22;
      LODWORD(v27) = 22;
      v26 = &v30;
      v23 = (void *)_os_log_send_and_compose_impl();

      if (!v23)
      {
LABEL_14:

        SSError();
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v10 = 0;
        v14 = 0;
        v13 = 0;
        goto LABEL_15;
      }
      v18 = objc_msgSend(NSString, "stringWithCString:encoding:", v23, 4, &v30, v27);
      free(v23);
      v26 = (int *)v18;
      SSFileLog();
    }

    goto LABEL_14;
  }
  id v8 = objc_alloc_init(MEMORY[0x263F89550]);
  objc_super v9 = [MEMORY[0x263F89470] provider];
  [v8 setDataProvider:v9];

  [v8 setRequestProperties:self->_requestProperties];
  id v28 = v5;
  uint64_t v10 = [(SUXMLHTTPRequestOperation *)self runSubOperation:v8 returningError:&v28];
  id v11 = v28;

  v12 = [v8 dataProvider];
  v13 = [v12 output];

  v14 = [v8 response];
  id v5 = v8;
LABEL_15:

  id v5 = v11;
LABEL_16:
  uint64_t v24 = [(SUXMLHTTPRequestOperation *)self outputBlock];
  v25 = (void *)v24;
  if (v24)
  {
    (*(void (**)(uint64_t, uint64_t, id, void *, void *))(v24 + 16))(v24, v10, v5, v14, v13);
    [(SUXMLHTTPRequestOperation *)self setOutputBlock:0];
  }
}

- (BOOL)_isAllowedURL:(id)a3 withURLBag:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v16 = 0;
  int v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  if ([v5 isFileURL])
  {
    BOOL v7 = 0;
  }
  else
  {
    id v8 = [v6 valueForKey:@"p2-client-options"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = [v8 objectForKey:@"origin-access-whitelist"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = [v5 host];
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __54__SUXMLHTTPRequestOperation__isAllowedURL_withURLBag___block_invoke;
        v13[3] = &unk_264812D60;
        id v11 = v10;
        id v14 = v11;
        v15 = &v16;
        [v9 enumerateKeysAndObjectsUsingBlock:v13];
      }
    }
    BOOL v7 = *((unsigned char *)v17 + 24) != 0;
  }
  _Block_object_dispose(&v16, 8);

  return v7;
}

void __54__SUXMLHTTPRequestOperation__isAllowedURL_withURLBag___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v6, 0);
    }
    else {
      id v7 = 0;
    }
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        if ([*(id *)(*((void *)&v13 + 1) + 8 * i) isEqualToString:*(void *)(a1 + 32)])
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
          *a4 = 1;
          goto LABEL_16;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_16:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestProperties, 0);

  objc_storeStrong(&self->_outputBlock, 0);
}

@end