@interface CAIssuerDelegate
- (BOOL)fetchNext:(id)a3 context:(id)a4;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
@end

@implementation CAIssuerDelegate

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v7 = a5;
  v8 = [a4 originalRequest];
  v9 = [v8 taskId];

  v10 = [(TrustURLSessionDelegate *)self contextForTask:v9];
  v11 = v10;
  if (!v10)
  {
    v14 = sub_10001CB28("http");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "failed to find context for %@", (uint8_t *)&v16, 0xCu);
    }
    goto LABEL_7;
  }
  v12 = [v10 context];
  if (v12)
  {
    uint64_t v13 = v12[34];
    if (v13)
    {
      v14 = [v7 taskInterval];
      [v14 duration];
      *(void *)(v13 + 32) += (unint64_t)(v15 * 1000000000.0);
LABEL_7:
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v63.receiver = self;
  v63.super_class = (Class)CAIssuerDelegate;
  [(TrustURLSessionDelegate *)&v63 URLSession:v8 task:v9 didCompleteWithError:v10];
  v11 = [v9 originalRequest];
  v12 = [v11 taskId];

  uint64_t v13 = [(TrustURLSessionDelegate *)self contextForTask:v12];
  v14 = v13;
  if (v13)
  {
    uint64_t v59 = 0;
    v60 = &v59;
    uint64_t v61 = 0x2020000000;
    id v62 = (id)0xAAAAAAAAAAAAAAAALL;
    id v62 = [v13 context];
    uint64_t v15 = v60[3];
    if (!v15)
    {
      [(TrustURLSessionDelegate *)self removeTask:v12];
LABEL_37:
      _Block_object_dispose(&v59, 8);
      goto LABEL_38;
    }
    double v39 = *(double *)(v15 + 272);
    uint64_t v53 = 0;
    v54 = &v53;
    uint64_t v55 = 0x3032000000;
    v56 = sub_100037FB0;
    v57 = sub_100037FC0;
    id v58 = 0;
    if (v10)
    {
      int v16 = sub_10001CB28("caissuer");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = [v9 originalRequest];
        v18 = [v17 URL];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v18;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v10;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Failed to download issuer %@, with error %@", buf, 0x16u);
      }
      if (v39 != 0.0) {
        ++*(_DWORD *)(*(void *)&v39 + 40);
      }
      goto LABEL_23;
    }
    v20 = [v14 response];

    if (!v20) {
      goto LABEL_23;
    }
    CFDataRef v21 = [v14 response];
    uint64_t v22 = (uint64_t)SecCertificateCreateWithData(0, v21);
    v23 = (const void *)v22;
    if (v22) {
      goto LABEL_14;
    }
    uint64_t v24 = SecCMSCertificatesOnlyMessageCopyCertificates();
    if (!v24)
    {
      uint64_t v22 = SecCertificateCreateWithPEM();
      v23 = (const void *)v22;
      if (v22)
      {
LABEL_14:
        *(void *)buf = v22;
        uint64_t v24 = +[NSArray arrayWithObjects:buf count:1];
        CFRelease(v23);
        goto LABEL_18;
      }
      uint64_t v24 = 0;
    }
LABEL_18:

    v25 = (void *)v54[5];
    v54[5] = v24;

    if (v39 != 0.0)
    {
      v26 = (void *)v54[5];
      if (v26)
      {
        if ((unint64_t)[v26 count] >= 2) {
          *(unsigned char *)(*(void *)&v39 + 45) = 1;
        }
      }
      else
      {
        *(unsigned char *)(*(void *)&v39 + 44) = 1;
      }
    }
LABEL_23:
    uint64_t v27 = v54[5];
    if (v27)
    {
      v28 = [v9 originalRequest];
      v29 = [v28 URL];
      [v14 maxAge];
      double v31 = v30;
      double Current = CFAbsoluteTimeGetCurrent();
      if (qword_10008ACE8 != -1)
      {
        double v39 = Current;
        dispatch_once(&qword_10008ACE8, &stru_10007EAF8);
        double Current = v39;
      }
      if (qword_10008ACF0)
      {
        v33 = *(NSObject **)qword_10008ACF0;
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 0x40000000;
        *(void *)&buf[16] = sub_100036B7C;
        v65 = &unk_10007EB18;
        uint64_t v66 = v27;
        v67 = v29;
        double v68 = v31 + Current;
        dispatch_sync(v33, buf);
      }

      v34 = (void *)v60[3];
      if (v34) {
        v34 = (void *)v34[2];
      }
      v35 = v34;
      v46 = _NSConcreteStackBlock;
      uint64_t v47 = 3221225472;
      v48 = sub_100037FC8;
      v49 = &unk_10007EC88;
      v36 = &v50;
      id v50 = v14;
      v51 = &v59;
      v52 = &v53;
      p_block = &v46;
    }
    else
    {
      if (![(CAIssuerDelegate *)self fetchNext:v8 context:v14])
      {
LABEL_36:
        -[TrustURLSessionDelegate removeTask:](self, "removeTask:", v12, *(void *)&v39, block, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53);
        _Block_object_dispose(&v53, 8);

        goto LABEL_37;
      }
      v38 = (void *)v60[3];
      if (v38) {
        v38 = (void *)v38[2];
      }
      v35 = v38;
      block = _NSConcreteStackBlock;
      uint64_t v41 = 3221225472;
      v42 = sub_100038018;
      v43 = &unk_10007ECB0;
      v36 = &v44;
      id v44 = v14;
      v45 = &v59;
      p_block = &block;
    }
    dispatch_async(v35, p_block);

    goto LABEL_36;
  }
  v19 = sub_10001CB28("http");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v12;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "failed to find context for %@", buf, 0xCu);
  }

LABEL_38:
}

- (BOOL)fetchNext:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 context];
  if (v8) {
    uint64_t v9 = v8[34];
  }
  else {
    uint64_t v9 = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)CAIssuerDelegate;
  BOOL v10 = [(TrustURLSessionDelegate *)&v12 fetchNext:v7 context:v6];

  if (!v10 && v9) {
    ++*(_DWORD *)(v9 + 24);
  }
  return v10;
}

@end