@interface FairPlayDecryptSession
- (FairPlayDecryptSession)initWithDPInfo:(id)a3;
- (id)decryptBytes:(id)a3 error:(id *)a4;
- (id)identifier;
- (void)dealloc;
@end

@implementation FairPlayDecryptSession

- (FairPlayDecryptSession)initWithDPInfo:(id)a3
{
  v4 = [(FairPlayDecryptSession *)self init];
  if (v4)
  {
    if ([a3 length])
    {
      v4->_dpInfo = (NSData *)a3;
      v4->_identifier = (NSString *)[objc_alloc((Class)NSString) initWithFormat:@"com.apple.itunesstored.fairplay.decryptfile.%@", -[NSUUID UUIDString](+[NSUUID UUID](NSUUID, "UUID"), "UUIDString")];
    }
    else
    {
      id v5 = +[SSLogConfig sharedDaemonConfig];
      if (!v5) {
        id v5 = +[SSLogConfig sharedConfig];
      }
      unsigned int v6 = [v5 shouldLog];
      if ([v5 shouldLogToDisk]) {
        int v7 = v6 | 2;
      }
      else {
        int v7 = v6;
      }
      if (!os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v7 &= 2u;
      }
      if (v7)
      {
        int v12 = 138412290;
        uint64_t v13 = objc_opt_class();
        LODWORD(v11) = 12;
        uint64_t v8 = _os_log_send_and_compose_impl();
        if (v8)
        {
          v9 = (void *)v8;
          +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v8, 4, &v12, v11);
          free(v9);
          SSFileLog();
        }
      }

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  decryptSession = self->_decryptSession;
  if (decryptSession)
  {
    sub_10002E180((uint64_t)decryptSession);
    self->_decryptSession = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)FairPlayDecryptSession;
  [(FairPlayDecryptSession *)&v4 dealloc];
}

- (id)decryptBytes:(id)a3 error:(id *)a4
{
  id v24 = 0;
  p_decryptSession = &self->_decryptSession;
  decryptSession = self->_decryptSession;
  if (decryptSession) {
    goto LABEL_16;
  }
  if (!sub_10002E0F0(self->_dpInfo, p_decryptSession))
  {
    id v9 = +[SSLogConfig sharedDaemonConfig];
    if (!v9) {
      id v9 = +[SSLogConfig sharedConfig];
    }
    unsigned int v10 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v11 = v10 | 2;
    }
    else {
      int v11 = v10;
    }
    if (!os_log_type_enabled((os_log_t)[v9 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v11 &= 2u;
    }
    if (v11)
    {
      int v25 = 138412290;
      uint64_t v26 = objc_opt_class();
      LODWORD(v23) = 12;
      v22 = &v25;
      uint64_t v12 = _os_log_send_and_compose_impl();
      if (v12)
      {
        uint64_t v13 = (void *)v12;
        v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v25, v23);
        free(v13);
        v22 = (int *)v14;
        SSFileLog();
      }
    }
    if (a4) {
      *a4 = (id)ISError();
    }
  }

  self->_dpInfo = 0;
  decryptSession = self->_decryptSession;
  if (decryptSession)
  {
LABEL_16:
    if ((sub_10002E1A0((uint64_t)decryptSession, a3, &v24) & 1) == 0)
    {
      id v15 = +[SSLogConfig sharedDaemonConfig];
      if (!v15) {
        id v15 = +[SSLogConfig sharedConfig];
      }
      unsigned int v16 = objc_msgSend(v15, "shouldLog", v22);
      if ([v15 shouldLogToDisk]) {
        int v17 = v16 | 2;
      }
      else {
        int v17 = v16;
      }
      if (!os_log_type_enabled((os_log_t)[v15 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v17 &= 2u;
      }
      if (v17)
      {
        uint64_t v18 = objc_opt_class();
        int v25 = 138412290;
        uint64_t v26 = v18;
        LODWORD(v23) = 12;
        uint64_t v19 = _os_log_send_and_compose_impl();
        if (v19)
        {
          v20 = (void *)v19;
          +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19, 4, &v25, v23);
          free(v20);
          SSFileLog();
        }
      }
      if (a4) {
        *a4 = (id)ISError();
      }
    }
  }
  return v24;
}

- (id)identifier
{
  v2 = self->_identifier;

  return v2;
}

@end