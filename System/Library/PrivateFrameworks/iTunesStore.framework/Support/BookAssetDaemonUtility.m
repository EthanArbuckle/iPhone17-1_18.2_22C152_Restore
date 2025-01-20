@interface BookAssetDaemonUtility
+ (void)checkAutomaticDownloads;
+ (void)sendBookDownloads:(id)a3 withReason:(id)a4;
+ (void)sendBookStoreDownloads:(id)a3 withReason:(id)a4;
+ (void)sendRestoreDownloads:(id)a3 withReason:(id)a4;
@end

@implementation BookAssetDaemonUtility

+ (void)sendBookDownloads:(id)a3 withReason:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (![v5 count]) {
    goto LABEL_28;
  }
  id v25 = v6;
  v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v26 = v5;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (!v9) {
    goto LABEL_25;
  }
  id v10 = v9;
  uint64_t v11 = *(void *)v28;
  do
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v28 != v11) {
        objc_enumerationMutation(v8);
      }
      v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
      id v14 = objc_msgSend(v13, "copyStoreDownloadMetadata", v23, v24);
      if (v14)
      {
        v15 = [v13 downloadPolicy];
        if (v15) {
          [v14 setDownloadPolicy:v15];
        }
        [v7 addObject:v14];
      }
      else
      {
        v15 = +[SSLogConfig sharedDaemonConfig];
        if (!v15)
        {
          v15 = +[SSLogConfig sharedConfig];
        }
        unsigned int v16 = [v15 shouldLog];
        if ([v15 shouldLogToDisk]) {
          int v17 = v16 | 2;
        }
        else {
          int v17 = v16;
        }
        v18 = [v15 OSLogObject];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
          int v19 = v17;
        }
        else {
          int v19 = v17 & 2;
        }
        if (v19)
        {
          v20 = objc_opt_class();
          int v31 = 138543362;
          v32 = v20;
          id v21 = v20;
          LODWORD(v24) = 12;
          v23 = &v31;
          v22 = (void *)_os_log_send_and_compose_impl();

          if (!v22) {
            goto LABEL_23;
          }
          v18 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v22, 4, &v31, v24);
          free(v22);
          v23 = (int *)v18;
          SSFileLog();
        }
      }
LABEL_23:
    }
    id v10 = [v8 countByEnumeratingWithState:&v27 objects:v33 count:16];
  }
  while (v10);
LABEL_25:

  id v6 = v25;
  if (v7) {
    +[BookAssetDaemonUtility sendBookStoreDownloads:v7 withReason:v25];
  }

  id v5 = v26;
LABEL_28:
}

+ (void)sendBookStoreDownloads:(id)a3 withReason:(id)a4
{
  id v5 = a3;
  id v6 = (void *)ISWeakLinkedClassForString();
  if (!v6)
  {
    v7 = +[SSLogConfig sharedDaemonConfig];
    if (!v7)
    {
      v7 = +[SSLogConfig sharedConfig];
    }
    unsigned int v40 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v41 = v40 | 2;
    }
    else {
      int v41 = v40;
    }
    v42 = [v7 OSLogObject];
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT)) {
      int v43 = v41;
    }
    else {
      int v43 = v41 & 2;
    }
    if (v43)
    {
      int v70 = 138543362;
      id v71 = (id)objc_opt_class();
      id v44 = v71;
      LODWORD(v56) = 12;
      v45 = (void *)_os_log_send_and_compose_impl();

      if (!v45) {
        goto LABEL_87;
      }
      v42 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v45, 4, &v70, v56);
      free(v45);
      SSFileLog();
    }

    goto LABEL_87;
  }
  v7 = [v6 sharedInstance];
  uint64_t v8 = +[SSLogConfig sharedDaemonConfig];
  id v9 = (void *)v8;
  if (v7)
  {
    v57 = v5;
    if (!v8)
    {
      id v9 = +[SSLogConfig sharedConfig];
    }
    unsigned int v10 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v11 = v10 | 2;
    }
    else {
      int v11 = v10;
    }
    v12 = [v9 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      int v13 = v11;
    }
    else {
      int v13 = v11 & 2;
    }
    if (v13)
    {
      int v70 = 138543362;
      id v71 = (id)objc_opt_class();
      id v14 = v71;
      LODWORD(v56) = 12;
      v55 = &v70;
      v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_15:

        long long v67 = 0u;
        long long v68 = 0u;
        long long v66 = 0u;
        long long v65 = 0u;
        id v16 = v57;
        id v17 = [v16 countByEnumeratingWithState:&v65 objects:v69 count:16];
        if (!v17) {
          goto LABEL_60;
        }
        id v18 = v17;
        uint64_t v61 = *(void *)v66;
        id v60 = v16;
        v58 = v7;
        id v59 = a1;
        while (1)
        {
          int v19 = 0;
          do
          {
            if (*(void *)v66 != v61) {
              objc_enumerationMutation(v16);
            }
            v20 = *(void **)(*((void *)&v65 + 1) + 8 * (void)v19);
            if (v20)
            {
              id v21 = [*(id *)(*((void *)&v65 + 1) + 8 * (void)v19) redownloadActionParameters];
              id v22 = [v21 copy];

              v23 = [v20 downloadPermalink];
              if (v23
                || (v55 = 0,
                    [v20 valueForFirstAvailableKey:@"download_permalink"],
                    (v23 = objc_claimAutoreleasedReturnValue()) != 0))
              {
                uint64_t v24 = +[NSURL URLWithString:](NSURL, "URLWithString:", v23, v55);
              }
              else
              {
                uint64_t v24 = 0;
              }
              if (([v20 isRedownloadDownload] & 1) != 0 || v24)
              {
                if (v22)
                {
                  v63[0] = _NSConcreteStackBlock;
                  v63[1] = 3221225472;
                  v63[2] = sub_10017C3F0;
                  v63[3] = &unk_1003A8498;
                  v63[4] = a1;
                  [v7 addDownloadWithPurchaseParameters:v22 completion:v63];
                }
                else if (v24)
                {
                  int v31 = [v20 title];
                  id v32 = [v31 copy];

                  v62[0] = _NSConcreteStackBlock;
                  v62[1] = 3221225472;
                  v62[2] = sub_10017C5A8;
                  v62[3] = &unk_1003A8498;
                  v62[4] = a1;
                  [v7 addDownloadWithPermlink:v24 title:v32 completion:v62];

                  id v16 = v60;
                }
              }
              else
              {
                id v25 = [v20 dictionary];
                id v26 = [v25 copy];

                if (v26)
                {
                  v64[0] = _NSConcreteStackBlock;
                  v64[1] = 3221225472;
                  v64[2] = sub_10017C238;
                  v64[3] = &unk_1003A8498;
                  v64[4] = a1;
                  [v7 addDownloadWithMetadata:v26 completion:v64];
                  goto LABEL_52;
                }
                v33 = +[SSLogConfig sharedDaemonConfig];
                if (!v33)
                {
                  v33 = +[SSLogConfig sharedConfig];
                }
                unsigned int v34 = [v33 shouldLog];
                if ([v33 shouldLogToDisk]) {
                  v34 |= 2u;
                }
                v35 = [v33 OSLogObject];
                if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT)) {
                  v34 &= 2u;
                }
                if (v34)
                {
                  v36 = objc_opt_class();
                  int v70 = 138543362;
                  id v71 = v36;
                  id v37 = v36;
                  LODWORD(v56) = 12;
                  v55 = &v70;
                  v38 = (void *)_os_log_send_and_compose_impl();

                  id v16 = v60;
                  if (v38)
                  {
                    v35 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v38, 4, &v70, v56);
                    free(v38);
                    v55 = (int *)v35;
                    SSFileLog();
                    goto LABEL_50;
                  }
                }
                else
                {
LABEL_50:
                }
                v7 = v58;
                a1 = v59;
LABEL_52:
              }
              goto LABEL_54;
            }
            id v22 = +[SSLogConfig sharedDaemonConfig];
            if (!v22)
            {
              id v22 = +[SSLogConfig sharedConfig];
            }
            unsigned int v27 = objc_msgSend(v22, "shouldLog", v55, v56);
            if ([v22 shouldLogToDisk]) {
              v27 |= 2u;
            }
            v23 = [v22 OSLogObject];
            if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
              v27 &= 2u;
            }
            if (!v27) {
              goto LABEL_54;
            }
            long long v28 = objc_opt_class();
            int v70 = 138543362;
            id v71 = v28;
            id v29 = v28;
            LODWORD(v56) = 12;
            v55 = &v70;
            long long v30 = (void *)_os_log_send_and_compose_impl();

            if (v30)
            {
              v23 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v30, 4, &v70, v56);
              free(v30);
              v55 = (int *)v23;
              SSFileLog();
              id v16 = v60;
LABEL_54:

              goto LABEL_55;
            }
            id v16 = v60;
LABEL_55:

            int v19 = (char *)v19 + 1;
          }
          while (v18 != v19);
          id v39 = [v16 countByEnumeratingWithState:&v65 objects:v69 count:16];
          id v18 = v39;
          if (!v39)
          {
LABEL_60:
            id v5 = v57;
            goto LABEL_86;
          }
        }
      }
      v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4, &v70, v56);
      free(v15);
      v55 = (int *)v12;
      SSFileLog();
    }

    goto LABEL_15;
  }
  v46 = (void *)v8;
  id v47 = v5;
  if (!v8)
  {
    v46 = +[SSLogConfig sharedConfig];
  }
  unsigned int v48 = [v46 shouldLog];
  if ([v46 shouldLogToDisk]) {
    int v49 = v48 | 2;
  }
  else {
    int v49 = v48;
  }
  v50 = v46;
  v51 = [v46 OSLogObject];
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT)) {
    int v52 = v49;
  }
  else {
    int v52 = v49 & 2;
  }
  if (v52)
  {
    int v70 = 138543362;
    id v71 = (id)objc_opt_class();
    id v53 = v71;
    LODWORD(v56) = 12;
    v54 = (void *)_os_log_send_and_compose_impl();

    if (!v54) {
      goto LABEL_85;
    }
    v51 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v54, 4, &v70, v56);
    free(v54);
    SSFileLog();
  }

LABEL_85:
  id v5 = v47;
  id v16 = v50;
LABEL_86:

LABEL_87:
}

+ (void)sendRestoreDownloads:(id)a3 withReason:(id)a4
{
  id v5 = a3;
  id v6 = (void *)ISWeakLinkedClassForString();
  if (!v6)
  {
    v7 = +[SSLogConfig sharedDaemonConfig];
    if (!v7)
    {
      v7 = +[SSLogConfig sharedConfig];
    }
    unsigned int v22 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v23 = v22 | 2;
    }
    else {
      int v23 = v22;
    }
    uint64_t v24 = [v7 OSLogObject];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
      int v25 = v23;
    }
    else {
      int v25 = v23 & 2;
    }
    if (v25)
    {
      int v72 = 138543362;
      id v73 = (id)objc_opt_class();
      id v26 = v73;
      LODWORD(v63) = 12;
      unsigned int v27 = (void *)_os_log_send_and_compose_impl();

      if (!v27) {
        goto LABEL_76;
      }
      uint64_t v24 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v27, 4, &v72, v63);
      free(v27);
      SSFileLog();
    }

    goto LABEL_76;
  }
  v7 = [v6 sharedInstance];
  uint64_t v8 = +[SSLogConfig sharedDaemonConfig];
  id v9 = (void *)v8;
  if (v7)
  {
    if (!v8)
    {
      id v9 = +[SSLogConfig sharedConfig];
    }
    unsigned int v10 = [v9 shouldLog];
    BOOL v11 = [v9 shouldLogToDisk] == 0;
    v12 = v9;
    if (v11) {
      int v13 = v10;
    }
    else {
      int v13 = v10 | 2;
    }
    id v14 = v12;
    v15 = [v12 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      int v16 = v13;
    }
    else {
      int v16 = v13 & 2;
    }
    if (v16)
    {
      int v72 = 138543362;
      id v73 = (id)objc_opt_class();
      id v17 = v5;
      id v18 = v73;
      LODWORD(v63) = 12;
      v62 = &v72;
      int v19 = (void *)_os_log_send_and_compose_impl();

      id v5 = v17;
      v20 = v14;
      if (v19)
      {
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19, 4, &v72, v63);
        id v21 = (int *)objc_claimAutoreleasedReturnValue();
        free(v19);
        v62 = v21;
        SSFileLog();
      }
    }
    else
    {

      v20 = v14;
    }

    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v38 = v5;
    id v39 = [v38 countByEnumeratingWithState:&v67 objects:v71 count:16];
    unsigned int v40 = &syslog_ptr;
    if (v39)
    {
      id v41 = v39;
      id v64 = v5;
      uint64_t v42 = *(void *)v68;
      id v65 = a1;
      while (1)
      {
        for (i = 0; i != v41; i = (char *)i + 1)
        {
          if (*(void *)v68 != v42) {
            objc_enumerationMutation(v38);
          }
          id v44 = *(void **)(*((void *)&v67 + 1) + 8 * i);
          if (v44)
          {
            v45 = [v44 dictionary];
            id v46 = [v45 copy];

            if (v46)
            {
              v66[0] = _NSConcreteStackBlock;
              v66[1] = 3221225472;
              v66[2] = sub_10017CF14;
              v66[3] = &unk_1003A8498;
              v66[4] = a1;
              [v7 addRestoreDownloadWithMetadata:v46 completion:v66];
              goto LABEL_70;
            }
            id v53 = v40;
            id v54 = v38;
            v55 = v7;
            uint64_t v56 = [v53[405] sharedDaemonConfig];
            if (!v56)
            {
              uint64_t v56 = +[SSLogConfig sharedConfig];
            }
            unsigned int v57 = objc_msgSend(v56, "shouldLog", v62);
            if ([v56 shouldLogToDisk]) {
              v57 |= 2u;
            }
            v58 = [v56 OSLogObject];
            if (!os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT)) {
              v57 &= 2u;
            }
            if (v57)
            {
              id v59 = objc_opt_class();
              int v72 = 138543362;
              id v73 = v59;
              id v60 = v59;
              LODWORD(v63) = 12;
              v62 = &v72;
              uint64_t v61 = (void *)_os_log_send_and_compose_impl();

              a1 = v65;
              if (v61)
              {
                v58 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v61, 4, &v72, v63);
                free(v61);
                v62 = (int *)v58;
                SSFileLog();
                goto LABEL_67;
              }
            }
            else
            {
LABEL_67:
            }
            v7 = v55;
            id v38 = v54;
            unsigned int v40 = &syslog_ptr;
            goto LABEL_70;
          }
          id v46 = [v40[405] sharedDaemonConfig];
          if (!v46)
          {
            id v46 = [v40[405] sharedConfig];
          }
          unsigned int v47 = objc_msgSend(v46, "shouldLog", v62, v63);
          if ([v46 shouldLogToDisk]) {
            int v48 = v47 | 2;
          }
          else {
            int v48 = v47;
          }
          int v49 = [v46 OSLogObject];
          if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT)) {
            v48 &= 2u;
          }
          if (!v48) {
            goto LABEL_57;
          }
          v50 = objc_opt_class();
          int v72 = 138543362;
          id v73 = v50;
          id v51 = v50;
          LODWORD(v63) = 12;
          v62 = &v72;
          int v52 = (void *)_os_log_send_and_compose_impl();

          if (v52)
          {
            int v49 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v52, 4, &v72, v63);
            free(v52);
            v62 = (int *)v49;
            SSFileLog();
            a1 = v65;
LABEL_57:

            goto LABEL_70;
          }
          a1 = v65;
LABEL_70:
        }
        id v41 = [v38 countByEnumeratingWithState:&v67 objects:v71 count:16];
        if (!v41)
        {
          id v5 = v64;
          break;
        }
      }
    }
  }
  else
  {
    if (!v8)
    {
      id v9 = +[SSLogConfig sharedConfig];
    }
    unsigned int v28 = [v9 shouldLog];
    BOOL v11 = [v9 shouldLogToDisk] == 0;
    id v29 = v9;
    if (v11) {
      int v30 = v28;
    }
    else {
      int v30 = v28 | 2;
    }
    int v31 = v29;
    id v32 = [v29 OSLogObject];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
      int v33 = v30;
    }
    else {
      int v33 = v30 & 2;
    }
    if (v33)
    {
      id v34 = v5;
      int v72 = 138543362;
      id v73 = (id)objc_opt_class();
      id v35 = v73;
      LODWORD(v63) = 12;
      v36 = (void *)_os_log_send_and_compose_impl();

      if (v36)
      {
        id v37 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v36, 4, &v72, v63);
        free(v36);
        SSFileLog();
      }
      id v5 = v34;
    }
    else
    {
    }
    id v38 = v31;
  }

LABEL_76:
}

+ (void)checkAutomaticDownloads
{
  v3 = (void *)ISWeakLinkedClassForString();
  if (!v3)
  {
    v4 = +[SSLogConfig sharedDaemonConfig];
    if (!v4)
    {
      v4 = +[SSLogConfig sharedConfig];
    }
    unsigned int v12 = [v4 shouldLog];
    if ([v4 shouldLogToDisk]) {
      int v13 = v12 | 2;
    }
    else {
      int v13 = v12;
    }
    id v6 = [v4 OSLogObject];
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      v13 &= 2u;
    }
    if (v13)
    {
      int v23 = 138543362;
      id v24 = (id)objc_opt_class();
      id v14 = v24;
      LODWORD(v21) = 12;
      v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15) {
        goto LABEL_37;
      }
      id v6 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4, &v23, v21);
      free(v15);
      SSFileLog();
    }
    goto LABEL_36;
  }
  v4 = [v3 sharedInstance];
  uint64_t v5 = +[SSLogConfig sharedDaemonConfig];
  id v6 = v5;
  if (!v4)
  {
    if (!v5)
    {
      id v6 = +[SSLogConfig sharedConfig];
    }
    unsigned int v16 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v17 = v16 | 2;
    }
    else {
      int v17 = v16;
    }
    id v18 = [v6 OSLogObject];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      v17 &= 2u;
    }
    if (!v17) {
      goto LABEL_35;
    }
    int v23 = 138543362;
    id v24 = (id)objc_opt_class();
    id v19 = v24;
    LODWORD(v21) = 12;
    v20 = (void *)_os_log_send_and_compose_impl();

    if (v20)
    {
      id v18 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4, &v23, v21);
      free(v20);
      SSFileLog();
LABEL_35:
    }
LABEL_36:

    goto LABEL_37;
  }
  if (!v5)
  {
    id v6 = +[SSLogConfig sharedConfig];
  }
  unsigned int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  id v9 = [v6 OSLogObject];
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
    v8 &= 2u;
  }
  if (!v8) {
    goto LABEL_13;
  }
  int v23 = 138543362;
  id v24 = (id)objc_opt_class();
  id v10 = v24;
  LODWORD(v21) = 12;
  BOOL v11 = (void *)_os_log_send_and_compose_impl();

  if (v11)
  {
    id v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v23, v21);
    free(v11);
    SSFileLog();
LABEL_13:
  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10017D4EC;
  v22[3] = &unk_1003A84B8;
  v22[4] = a1;
  [v4 processAutomaticDownloadsWithReply:v22];
LABEL_37:
}

@end