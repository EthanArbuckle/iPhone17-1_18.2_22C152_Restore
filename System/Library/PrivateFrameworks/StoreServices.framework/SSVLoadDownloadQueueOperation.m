@interface SSVLoadDownloadQueueOperation
+ (id)newLoadAutomaticDownloadQueueOperation;
- (BOOL)_loadDownloadsFromStart:(id)a3 toEnd:(id)a4 url:(id)a5;
- (BOOL)featureEnabledForBagKey:(id)a3 bagContext:(id)a4 error:(id *)a5;
- (BOOL)needsAuthentication;
- (NSMutableOrderedSet)downloads;
- (NSNumber)accountIdentifier;
- (NSString)powerAssertionIdentifier;
- (NSString)requestIdentifier;
- (NSString)storeCorrelationID;
- (NSURL)requestURL;
- (SSURLRequestProperties)requestProperties;
- (SSVLoadDownloadQueueOperation)init;
- (SSVLoadDownloadQueueOperation)initWithRequestProperties:(id)a3;
- (id)_account;
- (id)_newURLOperationWithStartIdentifier:(id)a3 endIdentifier:(id)a4 url:(id)a5;
- (id)gzipData:(id)a3;
- (id)resolveBagURLForKey:(id)a3 bagContext:(id)a4 error:(id *)a5;
- (int64_t)reason;
- (void)_handleResponse:(id)a3;
- (void)addGUIDToBody:(id)a3;
- (void)addKeybagSyncToBody:(id)a3;
- (void)importKeybagSync:(id)a3;
- (void)lock;
- (void)main;
- (void)setAccountIdentifier:(id)a3;
- (void)setDownloadsMetadata:(id)a3;
- (void)setNeedsAuthentication:(BOOL)a3;
- (void)setPowerAssertionIdentifier:(id)a3;
- (void)setReason:(int64_t)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setRequestURL:(id)a3;
- (void)setStoreCorrelationID:(id)a3;
- (void)unlock;
@end

@implementation SSVLoadDownloadQueueOperation

- (SSVLoadDownloadQueueOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)SSVLoadDownloadQueueOperation;
  v2 = [(SSVOperation *)&v6 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    lock = v2->_lock;
    v2->_lock = v3;
  }
  return v2;
}

- (SSVLoadDownloadQueueOperation)initWithRequestProperties:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SSVLoadDownloadQueueOperation;
  v5 = [(SSVOperation *)&v10 init];
  if (v5)
  {
    if (v4) {
      objc_super v6 = (SSURLRequestProperties *)[v4 copy];
    }
    else {
      objc_super v6 = objc_alloc_init(SSURLRequestProperties);
    }
    v7 = v6;
    objc_storeStrong((id *)&v5->_requestProperties, v6);

    [(SSVLoadDownloadQueueOperation *)v5 setPowerAssertionIdentifier:@"com.apple.storeservices.download-queue"];
    v8 = [(SSURLRequestProperties *)v5->_requestProperties URLBagKey];
    [(SSVLoadDownloadQueueOperation *)v5 setRequestIdentifier:v8];
  }
  return v5;
}

+ (id)newLoadAutomaticDownloadQueueOperation
{
  v2 = objc_alloc_init(SSMutableURLRequestProperties);
  [(SSMutableURLRequestProperties *)v2 setHTTPMethod:@"POST"];
  [(SSMutableURLRequestProperties *)v2 setURLBagURLBlock:&__block_literal_global_45];
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithRequestProperties:v2];
  [v3 setNeedsAuthentication:0];
  id v4 = [NSString stringWithFormat:@"%@.%@", @"automatic-downloads2", @"downloads-url"];
  [v3 setRequestIdentifier:v4];

  return v3;
}

id __71__SSVLoadDownloadQueueOperation_newLoadAutomaticDownloadQueueOperation__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = +[SSURLBag URLBagForContext:a2];
  v3 = [v2 valueForKey:@"automatic-downloads2"];
  if (!v3)
  {
    v3 = [v2 valueForKey:@"automatic-downloads"];
  }
  id v4 = [v3 objectForKey:@"downloads-url"];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSNumber)accountIdentifier
{
  [(SSVLoadDownloadQueueOperation *)self lock];
  v3 = self->_accountIdentifier;
  [(SSVLoadDownloadQueueOperation *)self unlock];
  return v3;
}

- (void)addKeybagSyncToBody:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  unsigned int v12 = 0;
  v5 = [(SSVLoadDownloadQueueOperation *)self accountIdentifier];
  uint64_t v6 = [v5 longLongValue];

  uint64_t v7 = SSVFairPlayContextIdentifier();
  Mt76Vq80ux(v7, v6, 0, 1, (uint64_t)&v13, (uint64_t)&v12);
  if (!v8 && v13)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    objc_super v10 = (void *)[v9 initWithBytesNoCopy:v13 length:v12 freeWhenDone:0];
    v11 = [v10 base64EncodedStringWithOptions:0];
    if (v11) {
      [v4 setObject:v11 forKey:@"kbsync"];
    }
    jEHf8Xzsv8K(v13);
  }
}

- (void)addGUIDToBody:(id)a3
{
  id v3 = a3;
  id v5 = +[SSDevice currentDevice];
  id v4 = [v5 uniqueDeviceIdentifier];
  [v3 setValue:v4 forKey:@"guid"];
}

- (NSMutableOrderedSet)downloads
{
  [(SSVLoadDownloadQueueOperation *)self lock];
  id v3 = self->_downloads;
  [(SSVLoadDownloadQueueOperation *)self unlock];
  return v3;
}

- (BOOL)featureEnabledForBagKey:(id)a3 bagContext:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v8 = +[SSURLBagContext contextWithBagType:0];
    if (v7) {
      goto LABEL_3;
    }
LABEL_11:
    char v12 = 0;
    goto LABEL_12;
  }
  if (!v7) {
    goto LABEL_11;
  }
LABEL_3:
  id v9 = +[SSURLBag URLBagForContext:v8];
  id v14 = 0;
  objc_super v10 = [v9 valueForKey:v7 error:&v14];
  id v11 = v14;
  if (!v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v12 = [v10 BOOLValue];
      if (!a5) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  char v12 = 0;
  if (a5) {
LABEL_8:
  }
    *a5 = v11;
LABEL_9:

LABEL_12:
  return v12;
}

- (id)gzipData:(id)a3
{
  id v3 = a3;
  id v4 = (Bytef *)[v3 bytes];
  uint64_t v5 = [v3 length];

  id v6 = 0;
  if (v4 && v5)
  {
    memset(&v11.avail_in, 0, 104);
    v11.avail_in = v5;
    v11.avail_out = v5;
    v11.next_in = v4;
    id v7 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:v5];
    v11.next_out = (Bytef *)objc_msgSend(v7, "mutableBytes", v11.next_in, *(void *)&v11.avail_in);
    if (v7
      && !deflateInit2_(&v11, -1, 8, 31, 8, 0, "1.2.12", 112)
      && (int v8 = deflate(&v11, 4), v9 = deflateEnd(&v11), v8 == 1))
    {
      id v6 = 0;
      if (!v9 && v5 == v11.total_in)
      {
        [v7 setLength:v11.total_out];
        id v6 = v7;
      }
    }
    else
    {
      id v6 = 0;
    }
  }
  return v6;
}

- (void)importKeybagSync:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v4)
  {
    id v4 = +[SSLogConfig sharedConfig];
  }
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  id v7 = [v4 OSLogObject];
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
    v6 &= 2u;
  }
  if (!v6) {
    goto LABEL_11;
  }
  LODWORD(v18) = 138412290;
  *(void *)((char *)&v18 + 4) = objc_opt_class();
  id v8 = *(id *)((char *)&v18 + 4);
  LODWORD(v17) = 12;
  int v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    id v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v18, v17, v18);
    free(v9);
    SSFileLog(v4, @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v7);
LABEL_11:
  }
  SSVFairPlayContextIdentifier();
  id v16 = v3;
  [v16 bytes];
  [v16 length];

  lCUad();
}

- (void)lock
{
}

- (BOOL)needsAuthentication
{
  [(SSVLoadDownloadQueueOperation *)self lock];
  BOOL needsAuthentication = self->_needsAuthentication;
  [(SSVLoadDownloadQueueOperation *)self unlock];
  return needsAuthentication;
}

- (int64_t)reason
{
  [(SSVLoadDownloadQueueOperation *)self lock];
  int64_t reason = self->_reason;
  [(SSVLoadDownloadQueueOperation *)self unlock];
  return reason;
}

- (id)resolveBagURLForKey:(id)a3 bagContext:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if (v7) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v12 = 0;
    uint64_t v11 = 0;
    goto LABEL_11;
  }
  id v8 = +[SSURLBagContext contextWithBagType:0];
  if (!v7) {
    goto LABEL_6;
  }
LABEL_3:
  int v9 = +[SSURLBag URLBagForContext:v8];
  id v15 = 0;
  uint64_t v10 = [v9 valueForKey:v7 error:&v15];
  uint64_t v11 = (uint64_t)v15;
  if (!v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v12 = [MEMORY[0x1E4F1CB10] URLWithString:v10];
      goto LABEL_9;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [v10 valueForKey:@"downloads-url"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v12 = [MEMORY[0x1E4F1CB10] URLWithString:v13];
      }
      else
      {
        uint64_t v12 = 0;
      }

      goto LABEL_10;
    }
  }
  uint64_t v12 = 0;
LABEL_9:
  uint64_t v13 = v10;
LABEL_10:

LABEL_11:
  if (!(v12 | v11))
  {
    uint64_t v11 = SSError(@"SSErrorDomain", 124, 0, 0);
  }
  if (a5) {
    *a5 = (id) v11;
  }

  return (id)v12;
}

- (NSString)requestIdentifier
{
  [(SSVLoadDownloadQueueOperation *)self lock];
  id v3 = self->_requestIdentifier;
  [(SSVLoadDownloadQueueOperation *)self unlock];
  return v3;
}

- (SSURLRequestProperties)requestProperties
{
  return self->_requestProperties;
}

- (void)setAccountIdentifier:(id)a3
{
  int v5 = (NSNumber *)a3;
  [(SSVLoadDownloadQueueOperation *)self lock];
  if (self->_accountIdentifier != v5) {
    objc_storeStrong((id *)&self->_accountIdentifier, a3);
  }
  [(SSVLoadDownloadQueueOperation *)self unlock];
}

- (void)setNeedsAuthentication:(BOOL)a3
{
  [(SSVLoadDownloadQueueOperation *)self lock];
  self->_BOOL needsAuthentication = a3;
  [(SSVLoadDownloadQueueOperation *)self unlock];
}

- (void)setDownloadsMetadata:(id)a3
{
  id v4 = a3;
  [(SSVLoadDownloadQueueOperation *)self lock];
  int v5 = (NSMutableOrderedSet *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithArray:v4];

  downloads = self->_downloads;
  self->_downloads = v5;

  [(SSVLoadDownloadQueueOperation *)self unlock];
}

- (void)setReason:(int64_t)a3
{
  [(SSVLoadDownloadQueueOperation *)self lock];
  self->_int64_t reason = a3;
  [(SSVLoadDownloadQueueOperation *)self unlock];
}

- (void)setRequestIdentifier:(id)a3
{
  int v6 = (NSString *)a3;
  [(SSVLoadDownloadQueueOperation *)self lock];
  if (self->_requestIdentifier != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copy];
    requestIdentifier = self->_requestIdentifier;
    self->_requestIdentifier = v4;
  }
  [(SSVLoadDownloadQueueOperation *)self unlock];
}

- (void)setStoreCorrelationID:(id)a3
{
  id v4 = a3;
  [(SSVLoadDownloadQueueOperation *)self lock];
  int v5 = (NSString *)[v4 copy];

  storeCorrelationID = self->_storeCorrelationID;
  self->_storeCorrelationID = v5;

  [(SSVLoadDownloadQueueOperation *)self unlock];
}

- (void)unlock
{
}

- (void)main
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = [(SSURLRequestProperties *)self->_requestProperties URLBagKey];
  id v4 = +[SSURLBagContext contextWithBagType:0];
  int v5 = [(SSVLoadDownloadQueueOperation *)self requestURL];
  if (!v5)
  {
    id v46 = 0;
    int v5 = [(SSVLoadDownloadQueueOperation *)self resolveBagURLForKey:v3 bagContext:v4 error:&v46];
    v28 = (NSMutableArray *)v46;
    if (v28)
    {
      v27 = v28;
      v29 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v29)
      {
        v29 = +[SSLogConfig sharedConfig];
      }
      int v30 = [v29 shouldLog];
      if ([v29 shouldLogToDisk]) {
        v30 |= 2u;
      }
      v31 = [v29 OSLogObject];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT)) {
        int v32 = v30;
      }
      else {
        int v32 = v30 & 2;
      }
      if (v32)
      {
        v33 = objc_opt_class();
        int v47 = 138412546;
        v48 = v33;
        __int16 v49 = 2112;
        v50 = v27;
        id v34 = v33;
        LODWORD(v43) = 22;
        v35 = (void *)_os_log_send_and_compose_impl();

        if (!v35)
        {
LABEL_31:

          [(SSVOperation *)self setError:v27];
          goto LABEL_32;
        }
        v31 = objc_msgSend(NSString, "stringWithCString:encoding:", v35, 4, &v47, v43);
        free(v35);
        SSFileLog(v29, @"%@", v36, v37, v38, v39, v40, v41, (uint64_t)v31);
      }

      goto LABEL_31;
    }
  }
  v45 = v3;
  id v6 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v7 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:0];
  id v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:0];
  int v9 = (NSMutableArray *)objc_msgSend(v6, "initWithObjects:", v7, v8, 0);
  rangesToLoad = self->_rangesToLoad;
  self->_rangesToLoad = v9;

  if ((unint64_t)[(NSMutableArray *)self->_rangesToLoad count] >= 2)
  {
    while (1)
    {
      if ([(SSVLoadDownloadQueueOperation *)self isCancelled]) {
        goto LABEL_18;
      }
      uint64_t v11 = [(NSMutableArray *)self->_rangesToLoad objectAtIndex:0];
      uint64_t v12 = [(NSMutableArray *)self->_rangesToLoad objectAtIndex:1];
      if (![(SSVLoadDownloadQueueOperation *)self _loadDownloadsFromStart:v11 toEnd:v12 url:v5])
      {
        [(NSMutableArray *)self->_rangesToLoad removeAllObjects];
        goto LABEL_17;
      }
      uint64_t v13 = v5;
      uint64_t v14 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v14)
      {
        uint64_t v14 = +[SSLogConfig sharedConfig];
      }
      int v15 = [v14 shouldLog];
      if ([v14 shouldLogToDisk]) {
        v15 |= 2u;
      }
      id v16 = [v14 OSLogObject];
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
        v15 &= 2u;
      }
      if (!v15) {
        goto LABEL_14;
      }
      uint64_t v17 = objc_opt_class();
      accountIdentifier = self->_accountIdentifier;
      int v47 = 138413058;
      v48 = v17;
      __int16 v49 = 2112;
      v50 = accountIdentifier;
      __int16 v51 = 2112;
      v52 = v11;
      __int16 v53 = 2112;
      v54 = v12;
      id v19 = v17;
      LODWORD(v44) = 42;
      v42 = &v47;
      v20 = (void *)_os_log_send_and_compose_impl();

      if (v20) {
        break;
      }
LABEL_15:

      -[NSMutableArray removeObjectsInRange:](self->_rangesToLoad, "removeObjectsInRange:", 0, 2);
      [(SSVOperation *)self setSuccess:[(NSMutableArray *)self->_rangesToLoad count] == 0];
      int v5 = v13;
LABEL_17:

      if ((unint64_t)[(NSMutableArray *)self->_rangesToLoad count] <= 1) {
        goto LABEL_18;
      }
    }
    id v16 = objc_msgSend(NSString, "stringWithCString:encoding:", v20, 4, &v47, v44);
    free(v20);
    SSFileLog(v14, @"%@", v21, v22, v23, v24, v25, v26, (uint64_t)v16);
LABEL_14:

    goto LABEL_15;
  }
LABEL_18:
  v27 = self->_rangesToLoad;
  self->_rangesToLoad = 0;
  id v3 = v45;
LABEL_32:
}

- (id)_account
{
  v2 = [(SSVLoadDownloadQueueOperation *)self accountIdentifier];
  if (!v2
    || (+[SSAccountStore defaultStore],
        id v3 = objc_claimAutoreleasedReturnValue(),
        [v3 accountWithUniqueIdentifier:v2],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v4))
  {
    int v5 = +[SSAccountStore defaultStore];
    id v4 = [v5 activeAccount];
  }
  return v4;
}

- (void)_handleResponse:(id)a3
{
  id v9 = a3;
  id v4 = [v9 rangesToLoad];
  if ([v4 count]) {
    [(NSMutableArray *)self->_rangesToLoad addObjectsFromArray:v4];
  }
  int v5 = [v9 downloads];

  if (v5)
  {
    [(SSVLoadDownloadQueueOperation *)self lock];
    downloads = self->_downloads;
    if (!downloads)
    {
      id v7 = (NSMutableOrderedSet *)objc_opt_new();
      id v8 = self->_downloads;
      self->_downloads = v7;

      downloads = self->_downloads;
    }
    [(NSMutableOrderedSet *)downloads unionOrderedSet:v5];
    [(SSVLoadDownloadQueueOperation *)self unlock];
  }
}

- (BOOL)_loadDownloadsFromStart:(id)a3 toEnd:(id)a4 url:(id)a5
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v8 = (uint64_t (*)(uint64_t, uint64_t))a3;
  id v9 = a4;
  id v53 = a5;
  uint64_t v10 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v10)
  {
    uint64_t v10 = +[SSLogConfig sharedConfig];
  }
  int v11 = [v10 shouldLog];
  if ([v10 shouldLogToDisk]) {
    v11 |= 2u;
  }
  uint64_t v12 = [v10 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
    int v13 = v11;
  }
  else {
    int v13 = v11 & 2;
  }
  if (v13)
  {
    uint64_t v14 = objc_opt_class();
    id v15 = v14;
    id v16 = [(SSVLoadDownloadQueueOperation *)self requestIdentifier];
    *(_DWORD *)v76 = 138413314;
    *(void *)&v76[4] = v14;
    *(_WORD *)&v76[12] = 2112;
    *(void *)&v76[14] = v16;
    *(_WORD *)&v76[22] = 2112;
    v77 = v8;
    *(_WORD *)v78 = 2112;
    *(void *)&v78[2] = v9;
    *(_WORD *)&v78[10] = 2048;
    *(void *)&v78[12] = [(SSVLoadDownloadQueueOperation *)self reason];
    LODWORD(v50) = 52;
    __int16 v49 = v76;
    uint64_t v17 = (void *)_os_log_send_and_compose_impl();

    if (v17)
    {
      long long v18 = objc_msgSend(NSString, "stringWithCString:encoding:", v17, 4, v76, v50);
      free(v17);
      SSFileLog(v10, @"%@", v19, v20, v21, v22, v23, v24, (uint64_t)v18);
    }
  }
  else
  {
  }
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x2020000000;
  char v71 = 0;
  *(void *)v76 = 0;
  *(void *)&v76[8] = v76;
  *(void *)&v76[16] = 0x3032000000;
  v77 = __Block_byref_object_copy__85;
  *(void *)v78 = __Block_byref_object_dispose__85;
  *(void *)&v78[8] = 0;
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__85;
  v66 = __Block_byref_object_dispose__85;
  id v67 = 0;
  objc_initWeak(&location, self);
  id v25 = [(SSVLoadDownloadQueueOperation *)self _newURLOperationWithStartIdentifier:v8 endIdentifier:v9 url:v53];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __67__SSVLoadDownloadQueueOperation__loadDownloadsFromStart_toEnd_url___block_invoke;
  v54[3] = &unk_1E5BAEAB8;
  v54[4] = self;
  __int16 v51 = v8;
  uint64_t v55 = v51;
  id v52 = v9;
  id v56 = v52;
  v57 = &v68;
  objc_copyWeak(&v60, &location);
  v58 = &v62;
  v59 = v76;
  [v25 setOutputBlock:v54];
  [(SSVOperation *)self runChildOperation:v25];
  uint64_t v26 = [v25 URLResponse];
  v27 = v26;
  if (v26)
  {
    v28 = [v26 allHeaderFields];
    v29 = [v28 objectForKey:@"x-apple-jingle-correlation-key"];

    if (![v29 length])
    {
LABEL_25:

      goto LABEL_26;
    }
    int v30 = (NSString *)[v29 copy];
    storeCorrelationID = self->_storeCorrelationID;
    self->_storeCorrelationID = v30;

    int v32 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v32)
    {
      int v32 = +[SSLogConfig sharedConfig];
    }
    int v33 = objc_msgSend(v32, "shouldLog", v49);
    int v34 = [v32 shouldLogToDisk];
    v35 = [v32 OSLogObject];
    uint64_t v36 = v35;
    if (v34) {
      v33 |= 2u;
    }
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT)) {
      v33 &= 2u;
    }
    if (v33)
    {
      uint64_t v37 = objc_opt_class();
      uint64_t v38 = self->_storeCorrelationID;
      int v72 = 138412546;
      v73 = v37;
      __int16 v74 = 2114;
      v75 = v38;
      id v39 = v37;
      LODWORD(v50) = 22;
      uint64_t v40 = (void *)_os_log_send_and_compose_impl();

      if (!v40)
      {
LABEL_24:

        goto LABEL_25;
      }
      uint64_t v36 = objc_msgSend(NSString, "stringWithCString:encoding:", v40, 4, &v72, v50);
      free(v40);
      SSFileLog(v32, @"%@", v41, v42, v43, v44, v45, v46, (uint64_t)v36);
    }

    goto LABEL_24;
  }
LABEL_26:
  if (*((unsigned char *)v69 + 24)) {
    [(SSVLoadDownloadQueueOperation *)self _handleResponse:v63[5]];
  }
  else {
    [(SSVOperation *)self setError:*(void *)(*(void *)&v76[8] + 40)];
  }
  BOOL v47 = *((unsigned char *)v69 + 24) != 0;

  objc_destroyWeak(&v60);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v62, 8);

  _Block_object_dispose(v76, 8);
  _Block_object_dispose(&v68, 8);

  return v47;
}

void __67__SSVLoadDownloadQueueOperation__loadDownloadsFromStart_toEnd_url___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a3);
    goto LABEL_26;
  }
  id v7 = +[SSLogConfig sharedWriteToDiskConfig];
  int v8 = [v7 shouldLog];

  if (v8)
  {
    uint64_t v9 = [*(id *)(a1 + 32) requestIdentifier];
    uint64_t v10 = (void *)v9;
    int v11 = @"unknown";
    if (v9) {
      int v11 = (__CFString *)v9;
    }
    uint64_t v12 = v11;

    int v13 = +[SSLogConfig sharedWriteToDiskConfig];
    if (!v13)
    {
      int v13 = +[SSLogConfig sharedConfig];
    }
    int v14 = [v13 shouldLog];
    if ([v13 shouldLogToDisk]) {
      int v15 = v14 | 2;
    }
    else {
      int v15 = v14;
    }
    id v16 = [v13 OSLogObject];
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      v15 &= 2u;
    }
    if (v15)
    {
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = *(void *)(a1 + 40);
      uint64_t v19 = *(void *)(a1 + 48);
      *(_DWORD *)uint64_t v40 = 138413058;
      *(void *)&v40[4] = v17;
      *(_WORD *)&v40[12] = 2112;
      *(void *)&v40[14] = v12;
      *(_WORD *)&v40[22] = 2112;
      uint64_t v41 = v18;
      LOWORD(v42) = 2112;
      *(void *)((char *)&v42 + 2) = v19;
      id v20 = v17;
      LODWORD(v39) = 42;
      uint64_t v21 = (void *)_os_log_send_and_compose_impl();

      if (!v21)
      {
LABEL_17:

        goto LABEL_18;
      }
      id v16 = objc_msgSend(NSString, "stringWithCString:encoding:", v21, 4, v40, v39, *(_OWORD *)v40, *(void *)&v40[16], v41, v42);
      free(v21);
      SSFileLog(v13, @"%@", v22, v23, v24, v25, v26, v27, (uint64_t)v16);
    }

    goto LABEL_17;
  }
LABEL_18:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    v29 = [v5 objectForKey:@"keybag"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v29 length]) {
      [WeakRetained importKeybagSync:v29];
    }
  }
  int v30 = [SSVStoreDownloadQueueResponse alloc];
  v31 = [*(id *)(a1 + 32) _account];
  int v32 = [v31 uniqueIdentifier];
  uint64_t v33 = [(SSVStoreDownloadQueueResponse *)v30 initWithDictionary:v5 userIdentifier:v32];
  uint64_t v34 = *(void *)(*(void *)(a1 + 64) + 8);
  v35 = *(void **)(v34 + 40);
  *(void *)(v34 + 40) = v33;

  uint64_t v36 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) storeCorrelationID];

  if (v36)
  {
    uint64_t v37 = *(void **)(a1 + 32);
    uint64_t v38 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) storeCorrelationID];
    [v37 setStoreCorrelationID:v38];
  }
LABEL_26:
}

- (id)_newURLOperationWithStartIdentifier:(id)a3 endIdentifier:(id)a4 url:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  int v11 = [(SSVLoadDownloadQueueOperation *)self _account];
  uint64_t v12 = (void *)[(SSURLRequestProperties *)self->_requestProperties mutableCopy];
  [v12 setAllowedRetryCount:0];
  [v12 setURL:v8];

  [v12 setCachePolicy:1];
  objc_msgSend(v12, "setURLBagType:", SSURLBagTypeForAccountScope(objc_msgSend(v11, "accountScope")));
  int v13 = [v12 requestParameters];
  int v14 = (void *)[v13 mutableCopy];
  int v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  uint64_t v17 = v16;

  if ([(SSVLoadDownloadQueueOperation *)self reason] != 1)
  {
    [v12 setHTTPMethod:@"POST"];
    [(SSVLoadDownloadQueueOperation *)self addGUIDToBody:v17];
  }
  uint64_t v18 = +[SSDevice currentDevice];
  uint64_t v19 = [v18 thinnedApplicationVariantIdentifier];

  if (v19) {
    [v12 setValue:v19 forHTTPHeaderField:@"X-Apple-TA-Device"];
  }
  [(SSVLoadDownloadQueueOperation *)self lock];
  mdSyncState = self->_mdSyncState;
  if (mdSyncState) {
    [v12 setValue:mdSyncState forHTTPHeaderField:@"X-Apple-MD-S"];
  }
  [(SSVLoadDownloadQueueOperation *)self unlock];
  uint64_t v21 = [v10 itemIdentifierValue];

  unint64_t v22 = [v9 itemIdentifierValue];
  if (v21 - 1 < v22)
  {
    uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", v21);
    [v17 setObject:v23 forKey:@"startId"];

    uint64_t v24 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", v22);
    [v17 setObject:v24 forKey:@"endId"];
  }
  [(SSVLoadDownloadQueueOperation *)self addKeybagSyncToBody:v17];
  if ([v17 count])
  {
    uint64_t v29 = 0;
    uint64_t v25 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v17 format:100 options:0 error:&v29];
    [v12 setHTTPBody:v25];
  }
  uint64_t v26 = [[SSVLoadURLOperation alloc] initWithURLRequestProperties:v12];
  uint64_t v27 = +[SSVURLDataConsumer consumer];
  [(SSVLoadURLOperation *)v26 setDataConsumer:v27];

  [(SSVLoadURLOperation *)v26 setITunesStoreRequest:1];
  [(SSVLoadURLOperation *)v26 setMachineDataStyle:0];

  return v26;
}

- (NSURL)requestURL
{
  return self->_requestURL;
}

- (void)setRequestURL:(id)a3
{
}

- (NSString)powerAssertionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 392, 1);
}

- (void)setPowerAssertionIdentifier:(id)a3
{
}

- (NSString)storeCorrelationID
{
  return self->_storeCorrelationID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeCorrelationID, 0);
  objc_storeStrong((id *)&self->_powerAssertionIdentifier, 0);
  objc_storeStrong((id *)&self->_requestURL, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_mdSyncState, 0);
  objc_storeStrong((id *)&self->_requestProperties, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_rangesToLoad, 0);
  objc_storeStrong((id *)&self->_downloads, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end