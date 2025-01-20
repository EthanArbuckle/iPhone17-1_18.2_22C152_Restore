@interface ISOpenURLOperation
- (BOOL)_openURL:(id)a3;
- (ISOpenURLOperation)init;
- (ISOpenURLOperation)initWithOpenURLRequest:(id)a3;
- (ISOpenURLRequest)openURLRequest;
- (id)_newSortedTargetsArray;
- (void)run;
@end

@implementation ISOpenURLOperation

- (ISOpenURLOperation)init
{
  return [(ISOpenURLOperation *)self initWithOpenURLRequest:0];
}

- (ISOpenURLOperation)initWithOpenURLRequest:(id)a3
{
  id v5 = a3;
  v6 = [v5 URL];
  if (v6) {
    goto LABEL_2;
  }
  v7 = [v5 URLBagKey];

  if (!v7)
  {
    v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"ISOpenURLOperation.m" lineNumber:66 description:@"Request must be resolvable"];
LABEL_2:
  }
  v12.receiver = self;
  v12.super_class = (Class)ISOpenURLOperation;
  v8 = [(ISOperation *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v5 copy];
    request = v8->_request;
    v8->_request = (ISOpenURLRequest *)v9;
  }
  return v8;
}

- (ISOpenURLRequest)openURLRequest
{
  v2 = (void *)[(ISOpenURLRequest *)self->_request copy];

  return (ISOpenURLRequest *)v2;
}

- (void)run
{
  v2 = self;
  uint64_t v63 = *MEMORY[0x263EF8340];
  v3 = [(ISOpenURLRequest *)self->_request URLBagKey];

  if (v3)
  {
    v4 = [MEMORY[0x263F7B358] contextWithBagType:0];
    [(ISOperation *)v2 loadURLBagWithContext:v4 returningError:0];
    id v5 = +[ISURLBagCache sharedCache];
    v6 = [v5 URLBagForContext:v4];

    v7 = [(ISOpenURLRequest *)v2->_request URLBagKey];
    v8 = [v6 urlForKey:v7];

    if (v8) {
      goto LABEL_3;
    }
LABEL_43:
    v36 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v36)
    {
      v36 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v37 = [v36 shouldLog];
    if ([v36 shouldLogToDisk]) {
      int v38 = v37 | 2;
    }
    else {
      int v38 = v37;
    }
    v39 = [v36 OSLogObject];
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT)) {
      int v40 = v38;
    }
    else {
      int v40 = v38 & 2;
    }
    if (v40)
    {
      v41 = objc_opt_class();
      request = v2->_request;
      int v57 = 138412546;
      id v58 = v41;
      __int16 v59 = 2112;
      v60 = request;
      id v43 = v41;
      LODWORD(v47) = 22;
      v46 = &v57;
      v44 = (void *)_os_log_send_and_compose_impl();

      if (!v44)
      {
LABEL_55:

        goto LABEL_58;
      }
      v39 = objc_msgSend(NSString, "stringWithCString:encoding:", v44, 4, &v57, v47);
      free(v44);
      v46 = (int *)v39;
      SSFileLog();
    }

    goto LABEL_55;
  }
  v8 = [(ISOpenURLRequest *)v2->_request URL];
  if (!v8) {
    goto LABEL_43;
  }
LABEL_3:
  if (![(ISOpenURLRequest *)v2->_request isITunesStoreURL])
  {
    if ([(ISOpenURLRequest *)v8 isSafeExternalURL])
    {
      uint64_t v45 = [(ISOpenURLOperation *)v2 _openURL:v8];
      goto LABEL_62;
    }
LABEL_58:
    uint64_t v45 = 0;
    goto LABEL_62;
  }
  id v9 = [(ISOpenURLOperation *)v2 _newSortedTargetsArray];
  v10 = [OpenURLTarget alloc];
  v11 = [(ISOpenURLRequest *)v2->_request targetIdentifier];
  objc_super v12 = [(OpenURLTarget *)v10 initWithTargetIdentifier:v11];

  if (v12) {
    [v9 insertObject:v12 atIndex:0];
  }
  v13 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v13)
  {
    v13 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v14 = [v13 shouldLog];
  if ([v13 shouldLogToDisk]) {
    int v15 = v14 | 2;
  }
  else {
    int v15 = v14;
  }
  v16 = [v13 OSLogObject];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
    int v17 = v15;
  }
  else {
    int v17 = v15 & 2;
  }
  if (!v17) {
    goto LABEL_17;
  }
  int v57 = 138412802;
  id v58 = (id)objc_opt_class();
  __int16 v59 = 2112;
  v60 = v8;
  __int16 v61 = 2112;
  id v62 = v9;
  id v18 = v58;
  LODWORD(v47) = 32;
  v46 = &v57;
  v19 = (void *)_os_log_send_and_compose_impl();

  if (v19)
  {
    v16 = objc_msgSend(NSString, "stringWithCString:encoding:", v19, 4, &v57, v47);
    free(v19);
    v46 = (int *)v16;
    SSFileLog();
LABEL_17:
  }
  v51 = [MEMORY[0x263F01880] defaultWorkspace];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v9;
  uint64_t v20 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (!v20)
  {
    uint64_t v45 = 0;
    goto LABEL_61;
  }
  uint64_t v21 = v20;
  v48 = v12;
  uint64_t v50 = *(void *)v53;
  do
  {
    for (uint64_t i = 0; i != v21; ++i)
    {
      if (*(void *)v53 != v50) {
        objc_enumerationMutation(obj);
      }
      v23 = (ISOpenURLRequest *)objc_msgSend(*(id *)(*((void *)&v52 + 1) + 8 * i), "copyURLForURL:", v8, v46);
      v24 = [v51 applicationsAvailableForOpeningURL:v23];
      if (![v24 count])
      {

        continue;
      }
      v25 = v8;
      v26 = v2;
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
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO)) {
        int v31 = v29;
      }
      else {
        int v31 = v29 & 2;
      }
      if (v31)
      {
        v32 = objc_opt_class();
        int v57 = 138412546;
        id v58 = v32;
        __int16 v59 = 2112;
        v60 = v23;
        id v33 = v32;
        LODWORD(v47) = 22;
        v46 = &v57;
        v34 = (void *)_os_log_send_and_compose_impl();

        if (!v34) {
          goto LABEL_36;
        }
        v30 = objc_msgSend(NSString, "stringWithCString:encoding:", v34, 4, &v57, v47);
        free(v34);
        v46 = (int *)v30;
        SSFileLog();
      }

LABEL_36:
      v2 = v26;
      BOOL v35 = [(ISOpenURLOperation *)v26 _openURL:v23];

      v8 = v25;
      if (v35)
      {
        uint64_t v45 = 1;
        goto LABEL_59;
      }
    }
    uint64_t v21 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
  }
  while (v21);
  uint64_t v45 = 0;
LABEL_59:
  objc_super v12 = v48;
LABEL_61:

LABEL_62:
  -[ISOperation setSuccess:](v2, "setSuccess:", v45, v46);
}

- (id)_newSortedTargetsArray
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  for (uint64_t i = 0; i != 216; i += 24)
  {
    v4 = [[OpenURLTarget alloc] initWithTargetIdentifier:*(void *)((char *)&__OpenURLTargetData + i)];
    if (v4) {
      [v2 addObject:v4];
    }
  }
  [v2 sortUsingSelector:sel_compare_];
  return v2;
}

- (BOOL)_openURL:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(ISOpenURLRequest *)self->_request interruptsKeybagRefresh]) {
    SBSInterruptKeybagRefetch();
  }
  __int16 v12 = 0;
  uint64_t v5 = SBSSpringBoardServerPort();
  MEMORY[0x2166C7220](v5, (char *)&v12 + 1, &v12);
  if (HIBYTE(v12))
  {
    v6 = [MEMORY[0x263F3F808] sharedService];
    uint64_t v7 = [v6 createClientPort];

    uint64_t v13 = *MEMORY[0x263F3F5E8];
    v14[0] = MEMORY[0x263EFFA88];
    char v8 = 1;
    id v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    v10 = [MEMORY[0x263F3F808] sharedService];
    [v10 openURL:v4 application:@"com.apple.MobileStore" options:v9 clientPort:v7 withResult:0];
  }
  else
  {
    id v9 = [MEMORY[0x263F01880] defaultWorkspace];
    char v8 = [v9 openSensitiveURL:v4 withOptions:0];
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end