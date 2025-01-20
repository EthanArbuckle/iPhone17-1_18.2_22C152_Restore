@interface WCDRetrieveActiveComplicationsOperation
- (void)doWorkWithCompletionHandler:(id)a3;
@end

@implementation WCDRetrieveActiveComplicationsOperation

- (void)doWorkWithCompletionHandler:(id)a3
{
  id v26 = a3;
  v4 = wc_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = "-[WCDRetrieveActiveComplicationsOperation doWorkWithCompletionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  id v5 = objc_initWeak(&location, self);
  unsigned int v6 = [(WCDRetrieveActiveComplicationsOperation *)self isCancelled];

  if (v6)
  {
    id v7 = objc_loadWeakRetained(&location);
    [v7 finish];
  }
  else
  {
    v8 = CLKActiveComplicationsFromActivePairedDevice();
    v9 = wc_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Retrieved app bundle IDs for active complications %{public}@", (uint8_t *)&buf, 0xCu);
    }

    v27 = objc_opt_new();
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = v8;
    id v10 = [obj countByEnumeratingWithState:&v35 objects:v47 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v36;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(void *)v36 != v11) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v35 + 1) + 8 * (void)v12);
          id v14 = objc_loadWeakRetained(&location);
          unsigned int v15 = [v14 isCancelled];

          if (v15)
          {
            id v25 = objc_loadWeakRetained(&location);
            [v25 finish];

            goto LABEL_30;
          }
          if ([v13 length])
          {
            *(void *)&long long buf = 0;
            *((void *)&buf + 1) = &buf;
            uint64_t v43 = 0x3032000000;
            v44 = sub_10000DC78;
            v45 = sub_10000DC88;
            id v46 = 0;
            dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
            v17 = +[ACXDeviceConnection sharedDeviceConnection];
            v32[0] = _NSConcreteStackBlock;
            v32[1] = 3221225472;
            v32[2] = sub_10000DC90;
            v32[3] = &unk_100044DE8;
            p_long long buf = &buf;
            v32[4] = v13;
            v18 = v16;
            v33 = v18;
            [v17 fetchInfoForApplicationWithBundleID:v13 forPairedDevice:0 completion:v32];

            dispatch_time_t v19 = dispatch_time(0, 3000000000);
            if (dispatch_semaphore_wait(v18, v19))
            {
              v20 = wc_log();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v40 = 138543362;
                v41 = v13;
                _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Timeout requesting appInfo for active complication %{public}@", v40, 0xCu);
              }
            }
            if (*(void *)(*((void *)&buf + 1) + 40))
            {
              [v27 addObject:];
            }
            else
            {
              v21 = wc_log();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v40 = 138543362;
                v41 = v13;
                _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "iOS App bundle ID is nil for active complication %{public}@", v40, 0xCu);
              }
            }
            _Block_object_dispose(&buf, 8);
          }
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [obj countByEnumeratingWithState:&v35 objects:v47 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    id v22 = objc_loadWeakRetained(&location);
    unsigned int v23 = [v22 isCancelled];

    if (v23)
    {
      id v24 = objc_loadWeakRetained(&location);
      [v24 finish];
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000DD34;
      block[3] = &unk_100044D20;
      objc_copyWeak(&v31, &location);
      id v30 = v27;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      objc_destroyWeak(&v31);
    }
LABEL_30:

    id v7 = obj;
  }

  objc_destroyWeak(&location);
}

@end