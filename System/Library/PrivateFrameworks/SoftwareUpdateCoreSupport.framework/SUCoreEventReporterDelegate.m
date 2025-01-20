@interface SUCoreEventReporterDelegate
- (SUCoreEventReporter)reporter;
- (SUCoreEventReporterDelegate)initWithReporter:(id)a3;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)setReporter:(id)a3;
@end

@implementation SUCoreEventReporterDelegate

- (SUCoreEventReporterDelegate)initWithReporter:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SUCoreEventReporterDelegate;
  v5 = [(SUCoreEventReporterDelegate *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_reporter, v4);
  }

  return v6;
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v26 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v23 = [(SUCoreEventReporterDelegate *)self reporter];
    v14 = v23;
    v24 = @"task nil or not NSURLSessionTask";
LABEL_18:
    [v23 handleSendFinishedInvalidFileUUID:v24 withError:v9];
    goto LABEL_19;
  }
  uint64_t v10 = [v8 taskDescription];
  if (!v10
    || (v11 = (void *)v10,
        [v8 taskDescription],
        v12 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v12,
        v11,
        (isKindOfClass & 1) == 0))
  {
    v23 = [(SUCoreEventReporterDelegate *)self reporter];
    v14 = v23;
    v24 = @"task description nil or not NSString";
    goto LABEL_18;
  }
  v14 = [v8 taskDescription];
  if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v15 = [v8 response];

    if (v15)
    {
      v16 = [v8 response];
      objc_opt_class();
      char v17 = objc_opt_isKindOfClass();

      if (v17)
      {
        v18 = [v8 response];
        uint64_t v19 = [v18 statusCode];
        uint64_t v20 = v19;
        BOOL v22 = v19 == 200 || v19 == 206;
      }
      else
      {
        BOOL v22 = 0;
        uint64_t v20 = 8206;
      }
    }
    else
    {
      BOOL v22 = 0;
      uint64_t v20 = 8205;
    }
    v25 = [(SUCoreEventReporterDelegate *)self reporter];
    [v25 handleSendFinishedWithFileUUID:v14 sendSucceeded:v22 withStatusCode:v20 withError:v9];
  }
  else
  {
    v25 = [(SUCoreEventReporterDelegate *)self reporter];
    [v25 handleSendFinishedInvalidFileUUID:@"task descriptor nil or not NSString (after get)" withError:v9];
  }

LABEL_19:
}

- (SUCoreEventReporter)reporter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_reporter);
  return (SUCoreEventReporter *)WeakRetained;
}

- (void)setReporter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end