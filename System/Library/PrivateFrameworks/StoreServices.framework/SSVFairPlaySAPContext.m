@interface SSVFairPlaySAPContext
- (BOOL)isComplete;
- (BOOL)verifyPrimeSignature:(id)a3 error:(id *)a4;
- (BOOL)verifySignature:(id)a3 forData:(id)a4 error:(id *)a5;
- (SSVFairPlaySAPContext)initWithSAPVersion:(int64_t)a3;
- (id)exchangeData:(id)a3 error:(id *)a4;
- (id)primingSignatureForData:(id)a3 error:(id *)a4;
- (id)signData:(id)a3 error:(id *)a4;
- (void)_teardownSession;
- (void)dealloc;
@end

@implementation SSVFairPlaySAPContext

- (SSVFairPlaySAPContext)initWithSAPVersion:(int64_t)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)SSVFairPlaySAPContext;
  v4 = [(SSVFairPlaySAPContext *)&v28 init];
  v5 = v4;
  if (v4)
  {
    if (SSVFairPlayGetHardwareInfo(&v4->_hardwareInfo.IDLength))
    {
      cp2g1b9ro((uint64_t)&v5->_context, (uint64_t)&v5->_hardwareInfo);
      if (!v6 || (cp2g1b9ro((uint64_t)&v5->_context, (uint64_t)&v5->_hardwareInfo), (int v8 = v7) == 0))
      {
        if (v5->_context)
        {
LABEL_29:
          v5->_version = a3;
          return v5;
        }
        int v8 = 0;
      }
      v9 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v9)
      {
        v9 = +[SSLogConfig sharedConfig];
      }
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
        goto LABEL_27;
      }
      v13 = objc_opt_class();
      int v29 = 138543618;
      v30 = v13;
      __int16 v31 = 2048;
      uint64_t v32 = v8;
      id v14 = v13;
      LODWORD(v27) = 22;
      v15 = (void *)_os_log_send_and_compose_impl();
    }
    else
    {
      v9 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v9)
      {
        v9 = +[SSLogConfig sharedConfig];
      }
      int v16 = [v9 shouldLog];
      if ([v9 shouldLogToDisk]) {
        int v17 = v16 | 2;
      }
      else {
        int v17 = v16;
      }
      v12 = [v9 OSLogObject];
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        v17 &= 2u;
      }
      if (!v17) {
        goto LABEL_27;
      }
      v18 = objc_opt_class();
      int v29 = 138543362;
      v30 = v18;
      id v19 = v18;
      LODWORD(v27) = 12;
      v15 = (void *)_os_log_send_and_compose_impl();
    }
    if (!v15)
    {
LABEL_28:

      goto LABEL_29;
    }
    v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v29, v27);
    free(v15);
    SSFileLog(v9, @"%@", v20, v21, v22, v23, v24, v25, (uint64_t)v12);
LABEL_27:

    goto LABEL_28;
  }
  return v5;
}

- (void)dealloc
{
  context = self->_context;
  if (context) {
    IPaI1oem5iL((uint64_t)context);
  }
  v4.receiver = self;
  v4.super_class = (Class)SSVFairPlaySAPContext;
  [(SSVFairPlaySAPContext *)&v4 dealloc];
}

- (id)exchangeData:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = v6;
  context = self->_context;
  if (!context)
  {
    v26 = SSError(@"SSErrorDomain", 122, 0, 0);
    if (!a4) {
      goto LABEL_24;
    }
    goto LABEL_22;
  }
  uint64_t v31 = 0;
  unsigned int v30 = 0;
  char v29 = -1;
  if (self->_version == 1) {
    uint64_t v9 = 210;
  }
  else {
    uint64_t v9 = 200;
  }
  id v10 = v6;
  Mib5yocT(v9, (uint64_t)&self->_hardwareInfo, (uint64_t)context, [v10 bytes], objc_msgSend(v10, "length"), (uint64_t)&v31, (uint64_t)&v30, (uint64_t)&v29);
  if (v11)
  {
    int v12 = v11;
    v13 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v13)
    {
      v13 = +[SSLogConfig sharedConfig];
    }
    int v14 = [v13 shouldLog];
    if ([v13 shouldLogToDisk]) {
      int v15 = v14 | 2;
    }
    else {
      int v15 = v14;
    }
    int v16 = [v13 OSLogObject];
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      v15 &= 2u;
    }
    if (v15)
    {
      int v17 = objc_opt_class();
      int v32 = 138412546;
      uint64_t v33 = v17;
      __int16 v34 = 2048;
      uint64_t v35 = v12;
      id v18 = v17;
      LODWORD(v28) = 22;
      id v19 = (void *)_os_log_send_and_compose_impl();

      if (!v19)
      {
LABEL_17:

        context = 0;
        goto LABEL_21;
      }
      int v16 = objc_msgSend(NSString, "stringWithCString:encoding:", v19, 4, &v32, v28);
      free(v19);
      SSFileLog(v13, @"%@", v20, v21, v22, v23, v24, v25, (uint64_t)v16);
    }

    goto LABEL_17;
  }
  self->_complete = v29 == 0;
  context = (void *)SSVCreateDataWithFairPlayBytes(v31, v30);
LABEL_21:
  v26 = 0;
  if (!a4) {
    goto LABEL_24;
  }
LABEL_22:
  if (!context) {
    *a4 = v26;
  }
LABEL_24:

  return context;
}

- (id)primingSignatureForData:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v28 = 0;
  unsigned int v27 = 0;
  context = self->_context;
  id v6 = a3;
  uint64_t v7 = [v6 bytes];
  uint64_t v8 = [v6 length];

  jfkdDAjba3jd((uint64_t)context, 100, v7, v8, &v28, &v27);
  if (v9)
  {
    int v10 = v9;
    int v11 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v11)
    {
      int v11 = +[SSLogConfig sharedConfig];
    }
    int v12 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v13 = v12 | 2;
    }
    else {
      int v13 = v12;
    }
    int v14 = [v11 OSLogObject];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      v13 &= 2u;
    }
    if (v13)
    {
      int v15 = objc_opt_class();
      int v29 = 138412546;
      unsigned int v30 = v15;
      __int16 v31 = 2048;
      uint64_t v32 = v10;
      id v16 = v15;
      LODWORD(v26) = 22;
      int v17 = (void *)_os_log_send_and_compose_impl();

      if (!v17) {
        goto LABEL_13;
      }
      int v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v17, 4, &v29, v26);
      free(v17);
      SSFileLog(v11, @"%@", v18, v19, v20, v21, v22, v23, (uint64_t)v14);
    }

LABEL_13:
    uint64_t v24 = 0;
    if (!a4) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  uint64_t v24 = (void *)SSVCreateDataWithFairPlayBytes(v28, v27);
  if (!a4) {
    goto LABEL_18;
  }
LABEL_16:
  if (!v24) {
    *a4 = 0;
  }
LABEL_18:
  return v24;
}

- (id)signData:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = v6;
  context = self->_context;
  if (!context)
  {
    unsigned int v27 = SSError(@"SSErrorDomain", 122, @"No SAP context for signing", 0);
    goto LABEL_20;
  }
  uint64_t v31 = 0;
  unsigned int v30 = 0;
  id v9 = v6;
  Fc3vhtJDvr((uint64_t)context, [v9 bytes], objc_msgSend(v9, "length"), (uint64_t)&v31, (uint64_t)&v30);
  if (!v10)
  {
    context = (void *)SSVCreateDataWithFairPlayBytes(v31, v30);
    unsigned int v27 = 0;
    goto LABEL_20;
  }
  int v11 = v10;
  int v12 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v12)
  {
    int v12 = +[SSLogConfig sharedConfig];
  }
  int v13 = [v12 shouldLog];
  if ([v12 shouldLogToDisk]) {
    int v14 = v13 | 2;
  }
  else {
    int v14 = v13;
  }
  int v15 = [v12 OSLogObject];
  if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
    v14 &= 2u;
  }
  if (!v14) {
    goto LABEL_13;
  }
  id v16 = objc_opt_class();
  int v32 = 138412546;
  uint64_t v33 = v16;
  __int16 v34 = 2048;
  uint64_t v35 = v11;
  id v17 = v16;
  LODWORD(v29) = 22;
  uint64_t v18 = (void *)_os_log_send_and_compose_impl();

  if (v18)
  {
    int v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v18, 4, &v32, v29);
    free(v18);
    SSFileLog(v12, @"%@", v19, v20, v21, v22, v23, v24, (uint64_t)v15);
LABEL_13:
  }
  if (v11 == -42186)
  {
    uint64_t v25 = @"Bad SAP session for signing";
    uint64_t v26 = 148;
  }
  else
  {
    uint64_t v25 = @"Bad SAP signature";
    uint64_t v26 = 122;
  }
  unsigned int v27 = SSError(@"SSErrorDomain", v26, (uint64_t)v25, 0);
  context = 0;
LABEL_20:
  if (a4 && !context) {
    *a4 = v27;
  }

  return context;
}

- (BOOL)verifyPrimeSignature:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = v6;
  if (!self->_context)
  {
    id v23 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SSErrorDomain" code:122 userInfo:0];
    if (a4) {
      goto LABEL_15;
    }
LABEL_17:
    BOOL v24 = 0;
    goto LABEL_19;
  }
  id v8 = v6;
  [v8 bytes];
  [v8 length];
  gLg1CWr7p();
  if (!v9)
  {
    id v23 = 0;
    BOOL v24 = 1;
    goto LABEL_19;
  }
  int v10 = v9;
  int v11 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v11)
  {
    int v11 = +[SSLogConfig sharedConfig];
  }
  int v12 = [v11 shouldLog];
  if ([v11 shouldLogToDisk]) {
    int v13 = v12 | 2;
  }
  else {
    int v13 = v12;
  }
  int v14 = [v11 OSLogObject];
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
    v13 &= 2u;
  }
  if (v13)
  {
    *(_DWORD *)unsigned int v27 = 138412546;
    *(void *)&v27[4] = objc_opt_class();
    *(_WORD *)&v27[12] = 2048;
    *(void *)&v27[14] = v10;
    id v15 = *(id *)&v27[4];
    LODWORD(v26) = 22;
    id v16 = (void *)_os_log_send_and_compose_impl();

    if (!v16) {
      goto LABEL_14;
    }
    int v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, v27, v26, *(_OWORD *)v27, *(void *)&v27[16], v28);
    free(v16);
    SSFileLog(v11, @"%@", v17, v18, v19, v20, v21, v22, (uint64_t)v14);
  }

LABEL_14:
  [(SSVFairPlaySAPContext *)self _teardownSession];
  id v23 = 0;
  if (!a4) {
    goto LABEL_17;
  }
LABEL_15:
  id v23 = v23;
  BOOL v24 = 0;
  *a4 = v23;
LABEL_19:

  return v24;
}

- (BOOL)verifySignature:(id)a3 forData:(id)a4 error:(id *)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!self->_context)
  {
    uint64_t v26 = @"No SAP context for signature verification";
    goto LABEL_19;
  }
  id v10 = v8;
  [v10 bytes];
  [v10 length];
  id v11 = v9;
  [v11 mutableBytes];
  [v11 length];
  gLg1CWr7p();
  if (!v12)
  {
    id v28 = 0;
    BOOL v29 = 1;
    goto LABEL_23;
  }
  int v13 = v12;
  int v14 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v14)
  {
    int v14 = +[SSLogConfig sharedConfig];
  }
  int v15 = [v14 shouldLog];
  if ([v14 shouldLogToDisk]) {
    int v16 = v15 | 2;
  }
  else {
    int v16 = v15;
  }
  uint64_t v17 = [v14 OSLogObject];
  if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
    v16 &= 2u;
  }
  if (!v16) {
    goto LABEL_13;
  }
  *(_DWORD *)int v32 = 138412546;
  *(void *)&v32[4] = objc_opt_class();
  *(_WORD *)&v32[12] = 2048;
  *(void *)&v32[14] = v13;
  id v18 = *(id *)&v32[4];
  LODWORD(v31) = 22;
  uint64_t v19 = (void *)_os_log_send_and_compose_impl();

  if (v19)
  {
    uint64_t v17 = objc_msgSend(NSString, "stringWithCString:encoding:", v19, 4, v32, v31, *(_OWORD *)v32, *(void *)&v32[16], v33);
    free(v19);
    SSFileLog(v14, @"%@", v20, v21, v22, v23, v24, v25, (uint64_t)v17);
LABEL_13:
  }
  if (v13 == -42186)
  {
    uint64_t v26 = @"Bad SAP session for signature verification";
    uint64_t v27 = 148;
    goto LABEL_20;
  }
  uint64_t v26 = @"Bad SAP signature verification";
LABEL_19:
  uint64_t v27 = 122;
LABEL_20:
  SSError(@"SSErrorDomain", v27, (uint64_t)v26, 0);
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  if (a5)
  {
    id v28 = v28;
    BOOL v29 = 0;
    *a5 = v28;
  }
  else
  {
    BOOL v29 = 0;
  }
LABEL_23:

  return v29;
}

- (void)_teardownSession
{
  context = self->_context;
  if (context)
  {
    IPaI1oem5iL((uint64_t)context);
    self->_context = 0;
  }
  self->_complete = 0;
}

- (BOOL)isComplete
{
  return self->_complete;
}

@end