@interface SSVPlaybackSubscriptionLeaseRequest
- (id)_URLBagKey;
- (id)_actionParameterValue;
- (id)_copyBodyDictionaryWithFairPlaySession:(void *)a3;
- (unsigned)_transactionType;
@end

@implementation SSVPlaybackSubscriptionLeaseRequest

- (id)_actionParameterValue
{
  int64_t v3 = [(SSVPlaybackLeaseRequest *)self _actionType];
  if (v3 == 2) {
    return @"lease-renew";
  }
  v4 = @"lease-start";
  if (v3 == 1 && ![(SSVPlaybackLeaseRequest *)self startsLeaseSession]) {
    return @"lease-renew";
  }
  return v4;
}

- (id)_copyBodyDictionaryWithFairPlaySession:(void *)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v43.receiver = self;
  v43.super_class = (Class)SSVPlaybackSubscriptionLeaseRequest;
  id v4 = [(SSVPlaybackLeaseRequest *)&v43 _copyBodyDictionaryWithFairPlaySession:a3];
  v5 = +[SSAccountStore defaultStore];
  v6 = [v5 activeAccount];

  uint64_t v7 = [(SSVPlaybackLeaseRequest *)self _certificateData];
  v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    v10 = [v6 uniqueIdentifier];
    uint64_t v11 = [v10 unsignedLongLongValue];

    v12 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:"lease" length:5 freeWhenDone:0];
    uint64_t v42 = 0;
    unsigned int v41 = 0;
    uint64_t v40 = 0;
    unsigned int v39 = 0;
    uint64_t v13 = SSVFairPlayContextIdentifier();
    uint64_t v14 = [(SSVPlaybackSubscriptionLeaseRequest *)self _transactionType];
    id v15 = v8;
    uint64_t v16 = [v15 bytes];
    uint64_t v17 = [v15 length];
    id v18 = v12;
    PhUojZmspd(v13, v11, v14, v16, v17, [v18 bytes], objc_msgSend(v18, "length"), (uint64_t)&v42, (uint64_t)&v41, (uint64_t)&v40, (uint64_t)&v39);
    if (v19)
    {
      int v20 = v19;
      v21 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v21)
      {
        v21 = +[SSLogConfig sharedConfig];
      }
      int v22 = [v21 shouldLog];
      if ([v21 shouldLogToDisk]) {
        int v23 = v22 | 2;
      }
      else {
        int v23 = v22;
      }
      v24 = [v21 OSLogObject];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
        int v25 = v23;
      }
      else {
        int v25 = v23 & 2;
      }
      if (v25)
      {
        int v44 = 134217984;
        uint64_t v45 = v20;
        LODWORD(v38) = 12;
        v26 = (void *)_os_log_send_and_compose_impl();

        if (!v26)
        {
LABEL_22:

LABEL_23:
          goto LABEL_24;
        }
        v24 = objc_msgSend(NSString, "stringWithCString:encoding:", v26, 4, &v44, v38);
        free(v26);
        SSFileLog(v21, @"%@", v27, v28, v29, v30, v31, v32, (uint64_t)v24);
      }
    }
    else
    {
      if (v39)
      {
        id v33 = objc_alloc(MEMORY[0x1E4F1C9B8]);
        v34 = (void *)[v33 initWithBytesNoCopy:v40 length:v39 deallocator:&__block_literal_global_44];
        v35 = [v34 base64EncodedStringWithOptions:0];
        [v4 setObject:v35 forKey:@"sbsync"];
      }
      if (!v41) {
        goto LABEL_23;
      }
      id v36 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      v21 = (void *)[v36 initWithBytesNoCopy:v42 length:v41 deallocator:&__block_literal_global_16];
      v24 = [v21 base64EncodedStringWithOptions:0];
      [v4 setObject:v24 forKey:@"spc"];
    }

    goto LABEL_22;
  }
LABEL_24:

  return v4;
}

void __78__SSVPlaybackSubscriptionLeaseRequest__copyBodyDictionaryWithFairPlaySession___block_invoke(uint64_t a1, uint64_t a2)
{
}

void __78__SSVPlaybackSubscriptionLeaseRequest__copyBodyDictionaryWithFairPlaySession___block_invoke_2(uint64_t a1, uint64_t a2)
{
}

- (id)_URLBagKey
{
  return @"subDownload";
}

- (unsigned)_transactionType
{
  int64_t v3 = [(SSVPlaybackLeaseRequest *)self _actionType];
  if (v3 == 2) {
    return 310;
  }
  if (v3 == 1)
  {
    if ([(SSVPlaybackLeaseRequest *)self startsLeaseSession]) {
      return 308;
    }
    else {
      return 310;
    }
  }
  else if (v3)
  {
    return 0;
  }
  else
  {
    return 308;
  }
}

@end