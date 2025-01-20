@interface LoadPassbookPassOperation
- (LoadPassbookPassOperation)initWithAccountIdentifier:(id)a3;
- (NSNumber)accountIdentifier;
- (id)outputBlock;
- (void)dealloc;
- (void)run;
- (void)setOutputBlock:(id)a3;
@end

@implementation LoadPassbookPassOperation

- (LoadPassbookPassOperation)initWithAccountIdentifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)LoadPassbookPassOperation;
  v4 = [(LoadPassbookPassOperation *)&v6 init];
  if (v4) {
    v4->_accountID = (NSNumber *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)LoadPassbookPassOperation;
  [(LoadPassbookPassOperation *)&v3 dealloc];
}

- (NSNumber)accountIdentifier
{
  v2 = self->_accountID;

  return v2;
}

- (id)outputBlock
{
  [(LoadPassbookPassOperation *)self lock];
  id v3 = self->_outputBlock;
  [(LoadPassbookPassOperation *)self unlock];

  return v3;
}

- (void)setOutputBlock:(id)a3
{
  [(LoadPassbookPassOperation *)self lock];
  id outputBlock = self->_outputBlock;
  if (outputBlock != a3)
  {

    self->_id outputBlock = [a3 copy];
  }

  [(LoadPassbookPassOperation *)self unlock];
}

- (void)run
{
  id v3 = objc_alloc_init((Class)ISStoreURLOperation);
  objc_msgSend(v3, "setDataProvider:", +[ISDataProvider provider](ISDataProvider, "provider"));
  id v4 = [objc_alloc((Class)SSAuthenticationContext) initWithAccountIdentifier:self->_accountID];
  [v3 setAuthenticationContext:v4];

  id v5 = objc_alloc_init((Class)SSMutableURLRequestProperties);
  [v5 setURLBagKey:@"getAddCreditPassUrl"];
  [v3 setRequestProperties:v5];

  id v6 = +[SSLogConfig sharedDaemonConfig];
  if (!v6) {
    id v6 = +[SSLogConfig sharedConfig];
  }
  unsigned int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  if (!os_log_type_enabled((os_log_t)[v6 OSLogObject], OS_LOG_TYPE_INFO)) {
    v8 &= 2u;
  }
  if (v8)
  {
    uint64_t v9 = objc_opt_class();
    accountID = self->_accountID;
    int v35 = 138412546;
    uint64_t v36 = v9;
    __int16 v37 = 2112;
    v38 = accountID;
    LODWORD(v33) = 22;
    v31 = &v35;
    uint64_t v11 = _os_log_send_and_compose_impl();
    if (v11)
    {
      v12 = (void *)v11;
      v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v35, v33);
      free(v12);
      v31 = (int *)v13;
      SSFileLog();
    }
  }
  v34 = 0;
  id v14 = -[LoadPassbookPassOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v3, &v34, v31);
  if (!v14
    || (id v15 = objc_msgSend(objc_msgSend(v3, "dataProvider"), "output"),
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) == 0)
    || (id v16 = [objc_alloc((Class)ISWeakLinkedClassForString()) initWithData:v15 error:&v34]) == 0)
  {
    id v24 = +[SSLogConfig sharedDaemonConfig];
    if (!v24) {
      id v24 = +[SSLogConfig sharedConfig];
    }
    unsigned int v25 = [v24 shouldLog];
    if ([v24 shouldLogToDisk]) {
      int v26 = v25 | 2;
    }
    else {
      int v26 = v25;
    }
    if (!os_log_type_enabled((os_log_t)[v24 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v26 &= 2u;
    }
    if (!v26)
    {
      v17 = 0;
      goto LABEL_35;
    }
    uint64_t v27 = objc_opt_class();
    v28 = self->_accountID;
    int v35 = 138412802;
    uint64_t v36 = v27;
    __int16 v37 = 2112;
    v38 = v28;
    __int16 v39 = 2112;
    v40 = v34;
    LODWORD(v33) = 32;
    v32 = &v35;
    v23 = (void *)_os_log_send_and_compose_impl();
    v17 = 0;
    if (!v23) {
      goto LABEL_35;
    }
LABEL_33:
    v29 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v23, 4, &v35, v33);
    free(v23);
    v32 = (int *)v29;
    SSFileLog();
    goto LABEL_35;
  }
  v17 = v16;
  id v18 = +[SSLogConfig sharedDaemonConfig];
  if (!v18) {
    id v18 = +[SSLogConfig sharedConfig];
  }
  unsigned int v19 = [v18 shouldLog];
  if ([v18 shouldLogToDisk]) {
    int v20 = v19 | 2;
  }
  else {
    int v20 = v19;
  }
  if (!os_log_type_enabled((os_log_t)[v18 OSLogObject], OS_LOG_TYPE_INFO)) {
    v20 &= 2u;
  }
  if (v20)
  {
    uint64_t v21 = objc_opt_class();
    v22 = self->_accountID;
    int v35 = 138412802;
    uint64_t v36 = v21;
    __int16 v37 = 2112;
    v38 = v22;
    __int16 v39 = 2112;
    v40 = v17;
    LODWORD(v33) = 32;
    v32 = &v35;
    v23 = (void *)_os_log_send_and_compose_impl();
    if (v23) {
      goto LABEL_33;
    }
  }
LABEL_35:
  v30 = [(LoadPassbookPassOperation *)self outputBlock];
  if (v30)
  {
    ((void (**)(id, void *, void *))v30)[2](v30, v17, v34);
    [(LoadPassbookPassOperation *)self setOutputBlock:0];
  }
  [(LoadPassbookPassOperation *)self setError:v34];
  [(LoadPassbookPassOperation *)self setSuccess:v14];
}

@end