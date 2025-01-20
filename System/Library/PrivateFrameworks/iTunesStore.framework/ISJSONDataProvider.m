@interface ISJSONDataProvider
- (BOOL)parseData:(id)a3 returningError:(id *)a4;
- (ISJSONDataProvider)init;
- (unint64_t)parserOptions;
- (void)setParserOptions:(unint64_t)a3;
@end

@implementation ISJSONDataProvider

- (ISJSONDataProvider)init
{
  __ISRecordSPIClassUsage(self);
  v4.receiver = self;
  v4.super_class = (Class)ISJSONDataProvider;
  return [(ISDataProvider *)&v4 init];
}

- (BOOL)parseData:(id)a3 returningError:(id *)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v15 = 0;
  uint64_t v6 = objc_msgSend(MEMORY[0x263F08900], "JSONObjectWithData:options:error:", a3, -[ISJSONDataProvider parserOptions](self, "parserOptions"), &v15);
  if (v6)
  {
    [(ISDataProvider *)self setOutput:v6];
  }
  else
  {
    v8 = (void *)[MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v8) {
      v8 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    if (!os_log_type_enabled((os_log_t)[v8 OSLogObject], OS_LOG_TYPE_ERROR)) {
      v10 &= 2u;
    }
    if (v10)
    {
      uint64_t v11 = objc_opt_class();
      int v16 = 138412546;
      uint64_t v17 = v11;
      __int16 v18 = 2112;
      v19 = v15;
      LODWORD(v14) = 22;
      uint64_t v12 = _os_log_send_and_compose_impl();
      if (v12)
      {
        v13 = (void *)v12;
        objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v16, v14);
        free(v13);
        SSFileLog();
      }
    }
  }
  if (a4) {
    *a4 = v15;
  }
  return v6 != 0;
}

- (unint64_t)parserOptions
{
  return self->_options;
}

- (void)setParserOptions:(unint64_t)a3
{
  self->_options = a3;
}

@end