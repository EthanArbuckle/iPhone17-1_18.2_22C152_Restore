@interface SUPostConcernOperation
- (NSString)commentText;
- (SUConcernItem)concern;
- (SUPostConcernOperation)initWithConcern:(id)a3;
- (id)_httpBody;
- (unint64_t)itemIdentifier;
- (void)dealloc;
- (void)operation:(id)a3 finishedWithOutput:(id)a4;
- (void)run;
- (void)setCommentText:(id)a3;
- (void)setConcern:(id)a3;
- (void)setItemIdentifier:(unint64_t)a3;
@end

@implementation SUPostConcernOperation

- (SUPostConcernOperation)initWithConcern:(id)a3
{
  v4 = [(SUPostConcernOperation *)self init];
  v5 = v4;
  if (v4) {
    [(SUPostConcernOperation *)v4 setConcern:a3];
  }
  return v5;
}

- (void)dealloc
{
  [(SUPostConcernOperation *)self setCommentText:0];
  [(SUPostConcernOperation *)self setConcern:0];
  v3.receiver = self;
  v3.super_class = (Class)SUPostConcernOperation;
  [(SUPostConcernOperation *)&v3 dealloc];
}

- (void)run
{
  id v3 = objc_alloc_init(MEMORY[0x263F89528]);
  objc_msgSend(v3, "setDataProvider:", objc_msgSend(MEMORY[0x263F89500], "provider"));
  [v3 setDelegate:self];
  [v3 setNeedsAuthentication:1];
  id v4 = objc_alloc_init(MEMORY[0x263F7B290]);
  [v4 setCachePolicy:1];
  objc_msgSend(v4, "setHTTPBody:", -[SUPostConcernOperation _httpBody](self, "_httpBody"));
  [v4 setHTTPMethod:@"POST"];
  [v4 setURLBagKey:@"p2-report-concern"];
  [v3 setRequestProperties:v4];

  uint64_t v5 = 0;
  if (([(SUPostConcernOperation *)self runSubOperation:v3 returningError:&v5] & 1) == 0) {
    [(SUPostConcernOperation *)self setError:v5];
  }
  [v3 setDelegate:0];
}

- (void)operation:(id)a3 finishedWithOutput:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v6 = (void *)[a4 objectForKey:@"success"];
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v6 BOOLValue])
  {
    [(SUPostConcernOperation *)self setSuccess:1];
  }
  else if (![a4 objectForKey:*MEMORY[0x263F89580]])
  {
    v7 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    if (!os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v9 &= 2u;
    }
    if (v9)
    {
      int v13 = 138412290;
      uint64_t v14 = objc_opt_class();
      LODWORD(v12) = 12;
      uint64_t v10 = _os_log_send_and_compose_impl();
      if (v10)
      {
        v11 = (void *)v10;
        objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v13, v12);
        free(v11);
        SSFileLog();
      }
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"CONCERN_POST_FAILED_ERROR", &stru_26DB8C5F8, 0);
    [(SUPostConcernOperation *)self setError:ISError()];
  }
}

- (id)_httpBody
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = [(SUPostConcernOperation *)self commentText];
  if (v4) {
    [v3 setObject:v4 forKey:@"comments"];
  }
  if (self->_itemIdentifier) {
    [v3 setObject:objc_msgSend(NSString, "stringWithFormat:", @"%llu", self->_itemIdentifier), @"item-id" forKey];
  }
  uint64_t v5 = [(SUConcernItem *)[(SUPostConcernOperation *)self concern] identifier];
  if (v5) {
    [v3 setObject:v5 forKey:@"problem-id"];
  }
  v6 = (void *)[NSURL queryStringForDictionary:v3 escapedValues:1];

  return (id)[v6 dataUsingEncoding:4];
}

- (NSString)commentText
{
  return (NSString *)objc_getProperty(self, a2, 336, 1);
}

- (void)setCommentText:(id)a3
{
}

- (SUConcernItem)concern
{
  return (SUConcernItem *)objc_getProperty(self, a2, 344, 1);
}

- (void)setConcern:(id)a3
{
}

- (unint64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(unint64_t)a3
{
  self->_itemIdentifier = a3;
}

@end