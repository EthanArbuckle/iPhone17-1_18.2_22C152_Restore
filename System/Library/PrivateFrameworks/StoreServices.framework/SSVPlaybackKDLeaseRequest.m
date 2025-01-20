@interface SSVPlaybackKDLeaseRequest
- (id)_URLBagKey;
- (id)_actionParameterValue;
- (id)_copyBodyDictionaryWithFairPlaySession:(void *)a3;
@end

@implementation SSVPlaybackKDLeaseRequest

- (id)_actionParameterValue
{
  int64_t v2 = [(SSVPlaybackLeaseRequest *)self _actionType];
  v3 = @"init";
  if (v2 == 1) {
    v3 = @"lease";
  }
  if (v2 == 2) {
    return @"init+lease";
  }
  else {
    return v3;
  }
}

- (id)_copyBodyDictionaryWithFairPlaySession:(void *)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v46.receiver = self;
  v46.super_class = (Class)SSVPlaybackKDLeaseRequest;
  id v5 = -[SSVPlaybackLeaseRequest _copyBodyDictionaryWithFairPlaySession:](&v46, sel__copyBodyDictionaryWithFairPlaySession_);
  v6 = [(SSVPlaybackLeaseRequest *)self _certificateData];
  unint64_t v7 = [(SSVPlaybackLeaseRequest *)self _KDMovieIdentifier];
  unint64_t v45 = v7;
  if (!v7 && v6)
  {
    LODWORD(v44[0]) = 1;
    id v8 = v6;
    int v9 = Qhl17oSYJtCJIxM([v8 bytes], objc_msgSend(v8, "length"), (uint64_t)v44, 1, (uint64_t)&v45);
    if (!v9)
    {
      [(SSVPlaybackLeaseRequest *)self _setKDMovieIdentifier:v45];
      goto LABEL_18;
    }
    int v10 = v9;
    v11 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v11)
    {
      v11 = +[SSLogConfig sharedConfig];
    }
    int v12 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v13 = v12 | 2;
    }
    else {
      int v13 = v12;
    }
    v14 = [v11 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      int v15 = v13;
    }
    else {
      int v15 = v13 & 2;
    }
    if (v15)
    {
      LODWORD(v49) = 134217984;
      *(void *)((char *)&v49 + 4) = v10;
      LODWORD(v40) = 12;
      v39 = &v49;
      v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16)
      {
LABEL_16:

LABEL_18:
        unint64_t v7 = v45;
        goto LABEL_19;
      }
      v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, &v49, v40);
      free(v16);
      SSFileLog(v11, @"%@", v17, v18, v19, v20, v21, v22, (uint64_t)v14);
    }

    goto LABEL_16;
  }
LABEL_19:
  long long v50 = 0u;
  long long v51 = 0u;
  *(void *)&long long v49 = 1;
  *((void *)&v49 + 1) = v7;
  id v23 = v6;
  *(void *)&long long v50 = [v23 bytes];
  DWORD2(v50) = [v23 length];
  *(void *)&long long v51 = 0;
  DWORD2(v51) = 0;
  uint64_t v52 = 0;
  unint64_t v53 = [(SSVPlaybackLeaseRequest *)self KDChannelIdentifier];
  uint64_t v43 = 0;
  v44[0] = 1;
  v44[1] = &v49;
  v44[2] = 1;
  uint64_t v41 = 0;
  uint64_t v42 = 0;
  MpP1bcydEGt61uk5lIIoLR((uint64_t)v44, (uint64_t)&v41);
  if (v24)
  {
    int v25 = v24;
    v26 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v26)
    {
      v26 = +[SSLogConfig sharedConfig];
    }
    int v27 = objc_msgSend(v26, "shouldLog", v39);
    if ([v26 shouldLogToDisk]) {
      int v28 = v27 | 2;
    }
    else {
      int v28 = v27;
    }
    v29 = [v26 OSLogObject];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
      int v30 = v28;
    }
    else {
      int v30 = v28 & 2;
    }
    if (v30)
    {
      int v47 = 134217984;
      uint64_t v48 = v25;
      LODWORD(v40) = 12;
      v31 = (void *)_os_log_send_and_compose_impl();

      if (!v31)
      {
LABEL_36:

        goto LABEL_37;
      }
      v29 = objc_msgSend(NSString, "stringWithCString:encoding:", v31, 4, &v47, v40);
      free(v31);
      SSFileLog(v26, @"%@", v32, v33, v34, v35, v36, v37, (uint64_t)v29);
    }
    v31 = 0;
LABEL_35:

    goto LABEL_36;
  }
  if (!v43)
  {
    v31 = 0;
    if (!a3) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
  v31 = *(void **)(v42 + 16);
  if (*(void *)v42)
  {
    v26 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:*(void *)v42 length:*(unsigned int *)(v42 + 8) freeWhenDone:0];
    v29 = [v26 base64EncodedStringWithOptions:0];
    [v5 setObject:v29 forKey:@"spc"];
    goto LABEL_35;
  }
LABEL_37:
  if (a3) {
LABEL_38:
  }
    *a3 = v31;
LABEL_39:

  return v5;
}

- (id)_URLBagKey
{
  return @"ottLease";
}

@end