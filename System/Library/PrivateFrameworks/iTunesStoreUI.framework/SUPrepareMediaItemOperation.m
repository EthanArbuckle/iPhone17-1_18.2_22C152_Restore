@interface SUPrepareMediaItemOperation
- (BOOL)_runHEADRequest:(id *)a3;
- (SUMediaPlayerItem)mediaPlayerItem;
- (SUPrepareMediaItemOperation)init;
- (SUPrepareMediaItemOperation)initWithMediaPlayerItem:(id)a3;
- (void)dealloc;
- (void)run;
@end

@implementation SUPrepareMediaItemOperation

- (SUPrepareMediaItemOperation)init
{
  return [(SUPrepareMediaItemOperation *)self initWithMediaPlayerItem:0];
}

- (SUPrepareMediaItemOperation)initWithMediaPlayerItem:(id)a3
{
  if (![a3 URL]) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Must have a URL to prepare a media item"];
  }
  v7.receiver = self;
  v7.super_class = (Class)SUPrepareMediaItemOperation;
  v5 = [(SUPrepareMediaItemOperation *)&v7 init];
  if (v5) {
    v5->_mediaItem = (SUMediaPlayerItem *)[a3 copy];
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUPrepareMediaItemOperation;
  [(SUPrepareMediaItemOperation *)&v3 dealloc];
}

- (void)run
{
  uint64_t v4 = 0;
  BOOL v3 = [(SUPrepareMediaItemOperation *)self _runHEADRequest:&v4];
  [(SUPrepareMediaItemOperation *)self setError:v4];
  [(SUPrepareMediaItemOperation *)self setSuccess:v3];
}

- (BOOL)_runHEADRequest:(id *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v17 = 0;
  id v5 = objc_alloc_init(MEMORY[0x263F89550]);
  v6 = objc_msgSend(objc_alloc(MEMORY[0x263F7B290]), "initWithURL:", -[SUMediaPlayerItem URL](self->_mediaItem, "URL"));
  [v6 setAllowedRetryCount:0];
  [v6 setHTTPMethod:@"HEAD"];
  [v5 setRequestProperties:v6];
  objc_super v7 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  if (!os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_DEBUG)) {
    v9 &= 2u;
  }
  if (v9)
  {
    int v18 = 138412546;
    uint64_t v19 = objc_opt_class();
    __int16 v20 = 2112;
    uint64_t v21 = [v6 URL];
    LODWORD(v16) = 22;
    v15 = &v18;
    uint64_t v10 = _os_log_send_and_compose_impl();
    if (v10)
    {
      v11 = (void *)v10;
      uint64_t v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v18, v16);
      free(v11);
      v15 = (int *)v12;
      SSFileLog();
    }
  }
  char v13 = -[SUPrepareMediaItemOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v5, &v17, v15);

  if (a3) {
    *a3 = v17;
  }
  return v13;
}

- (SUMediaPlayerItem)mediaPlayerItem
{
  return self->_mediaItem;
}

@end