@interface ChromeContextCoordinationScheduler
- (ChromeContextCoordinationScheduler)initWithChromeViewController:(id)a3;
- (void)commit;
- (void)scheduleBlock:(id)a3;
- (void)scheduleBlock:(id)a3 completionHandler:(id)a4;
- (void)setFallbackBlock:(id)a3;
@end

@implementation ChromeContextCoordinationScheduler

- (ChromeContextCoordinationScheduler)initWithChromeViewController:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(ChromeContextCoordinationScheduler *)self init];
    p_isa = (id *)&v5->super.isa;
    if (!v5)
    {
LABEL_28:
      self = p_isa;
      v9 = self;
      goto LABEL_29;
    }
    objc_storeWeak((id *)&v5->_chromeViewController, v4);
    if (GEOConfigGetBOOL())
    {
      id v7 = objc_alloc_init((Class)NSOperationQueue);
      id v8 = p_isa[1];
      p_isa[1] = v7;

      [p_isa[1] setUnderlyingQueue:&_dispatch_main_q];
      [p_isa[1] setMaxConcurrentOperationCount:1];
    }
    else
    {
      uint64_t v10 = +[NSOperationQueue mainQueue];
      id v11 = p_isa[1];
      p_isa[1] = (id)v10;
    }
    v12 = sub_100078CB4();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
LABEL_27:

      goto LABEL_28;
    }
    v13 = p_isa;
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    if (objc_opt_respondsToSelector())
    {
      v16 = [v13 performSelector:"accessibilityIdentifier"];
      v17 = v16;
      if (v16 && ![v16 isEqualToString:v15])
      {
        v18 = +[NSString stringWithFormat:@"%@<%p, %@>", v15, v13, v17];

LABEL_13:
        id v19 = v18;
        id v20 = v4;
        v21 = (objc_class *)objc_opt_class();
        v22 = NSStringFromClass(v21);
        if (objc_opt_respondsToSelector())
        {
          id v35 = v19;
          v23 = [v20 performSelector:"accessibilityIdentifier"];
          v24 = v23;
          if (v23 && ![v23 isEqualToString:v22])
          {
            v25 = +[NSString stringWithFormat:@"%@<%p, %@>", v22, v20, v24];

            id v19 = v35;
LABEL_18:

            id v26 = v25;
            id v27 = v13[1];
            if (!v27)
            {
              v33 = @"<nil>";
              goto LABEL_26;
            }
            v28 = (objc_class *)objc_opt_class();
            v29 = NSStringFromClass(v28);
            if (objc_opt_respondsToSelector())
            {
              id v30 = v19;
              v31 = [v27 performSelector:"accessibilityIdentifier"];
              v32 = v31;
              if (v31 && ![v31 isEqualToString:v29])
              {
                v33 = +[NSString stringWithFormat:@"%@<%p, %@>", v29, v27, v32];

                id v19 = v30;
                goto LABEL_24;
              }

              id v19 = v30;
            }
            v33 = +[NSString stringWithFormat:@"%@<%p>", v29, v27];
LABEL_24:

LABEL_26:
            *(_DWORD *)buf = 138543874;
            id v37 = v19;
            __int16 v38 = 2114;
            id v39 = v26;
            __int16 v40 = 2114;
            v41 = v33;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}@] initialising for %{public}@ with queue %{public}@", buf, 0x20u);

            goto LABEL_27;
          }

          id v19 = v35;
        }
        v25 = +[NSString stringWithFormat:@"%@<%p>", v22, v20];
        goto LABEL_18;
      }
    }
    v18 = +[NSString stringWithFormat:@"%@<%p>", v15, v13];
    goto LABEL_13;
  }
  v9 = 0;
LABEL_29:

  return v9;
}

- (void)scheduleBlock:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  if (!WeakRetained)
  {
    v31 = sub_1005762E4();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = +[NSString stringWithFormat:@"You must set a chromeViewController before you can schedule coordination blocks"];
      *(_DWORD *)buf = 136316162;
      __int16 v40 = "-[ChromeContextCoordinationScheduler scheduleBlock:completionHandler:]";
      __int16 v41 = 2080;
      v42 = "ChromeContextCoordinationScheduler.m";
      __int16 v43 = 1024;
      int v44 = 283;
      __int16 v45 = 2080;
      v46 = "_chromeViewController != nil";
      __int16 v47 = 2112;
      v48 = v32;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);
    }
    if (sub_100BB36BC())
    {
      v33 = sub_1005762E4();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        __int16 v40 = v34;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v9 = sub_1000C49B4();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  id v11 = sub_1000C49B4();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "\"CoordinatedContextChange\", ", buf, 2u);
  }

  id v13 = objc_loadWeakRetained((id *)&self->_deferredOperation);
  if (!v13
    || (v14 = v13,
        id v15 = objc_loadWeakRetained((id *)&self->_deferredOperation),
        unsigned int v16 = [v15 isExecuting],
        v15,
        v14,
        v16))
  {
    v17 = [ChromeContextOperation alloc];
    id v18 = objc_loadWeakRetained((id *)&self->_chromeViewController);
    id v19 = [(ChromeContextOperation *)v17 initWithChromeViewController:v18 fallbackCoordinationBlock:self->_fallbackBlock];

    [(ChromeContextOperation *)v19 addContextCoordinationBlock:v6];
    id v20 = objc_loadWeakRetained((id *)&self->_deferredOperation);

    if (v20)
    {
      id v21 = objc_loadWeakRetained((id *)&self->_deferredOperation);
      [(ChromeContextOperation *)v19 addDependency:v21];
    }
    objc_storeWeak((id *)&self->_deferredOperation, v19);
    v22 = sub_100078CB4();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_20;
    }
    id v23 = objc_loadWeakRetained((id *)&self->_chromeViewController);
    if (!v23)
    {
      v28 = @"<nil>";
      goto LABEL_19;
    }
    id v35 = v6;
    v24 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v24);
    if (objc_opt_respondsToSelector())
    {
      id v26 = [v23 performSelector:"accessibilityIdentifier"];
      id v27 = v26;
      if (v26 && ![v26 isEqualToString:v25])
      {
        v28 = +[NSString stringWithFormat:@"%@<%p, %@>", v25, v23, v27];

        goto LABEL_16;
      }
    }
    v28 = +[NSString stringWithFormat:@"%@<%p>", v25, v23];
LABEL_16:

    id v6 = v35;
LABEL_19:

    *(_DWORD *)buf = 138543362;
    __int16 v40 = (const char *)v28;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "[%{public}@] Scheduling coordination block operation", buf, 0xCu);

LABEL_20:
    [(NSOperationQueue *)self->_queue addOperation:v19];
    goto LABEL_21;
  }
  id v19 = (ChromeContextOperation *)objc_loadWeakRetained((id *)&self->_deferredOperation);
  [(ChromeContextOperation *)v19 addContextCoordinationBlock:v6];
LABEL_21:

  id v29 = objc_loadWeakRetained((id *)&self->_deferredOperation);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1000276B0;
  v36[3] = &unk_1012E7BB0;
  id v37 = v7;
  os_signpost_id_t v38 = v10;
  id v30 = v7;
  [v29 addCompletionBlock:v36];
}

- (void)scheduleBlock:(id)a3
{
}

- (void)setFallbackBlock:(id)a3
{
  id v4 = a3;
  id v5 = [v4 copy];
  id fallbackBlock = self->_fallbackBlock;
  self->_id fallbackBlock = v5;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_deferredOperation);
  [WeakRetained setFallbackCoordinationBlock:v4];
}

- (void)commit
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  p_deferredOperation = &self->_deferredOperation;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deferredOperation);
  id v5 = WeakRetained;
  if (!WeakRetained)
  {
    id v7 = sub_100078CB4();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_36;
    }
    id v9 = objc_loadWeakRetained((id *)&self->_chromeViewController);
    if (!v9)
    {
      v14 = @"<nil>";
      goto LABEL_28;
    }
    id v15 = (objc_class *)objc_opt_class();
    unsigned int v16 = NSStringFromClass(v15);
    if (objc_opt_respondsToSelector())
    {
      v17 = [v9 performSelector:"accessibilityIdentifier"];
      id v18 = v17;
      if (v17 && ![v17 isEqualToString:v16])
      {
        v14 = +[NSString stringWithFormat:@"%@<%p, %@>", v16, v9, v18];

        goto LABEL_18;
      }
    }
    v14 = +[NSString stringWithFormat:@"%@<%p>", v16, v9];
LABEL_18:

LABEL_28:
    *(_DWORD *)buf = 138543362;
    id v27 = v14;
    v25 = "[%{public}@] Nothing to commit: no deferred operation";
LABEL_31:
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, v25, buf, 0xCu);

    goto LABEL_36;
  }
  unsigned int v6 = [WeakRetained isExecuting];
  id v7 = sub_100078CB4();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (!v6)
  {
    if (!v8) {
      goto LABEL_34;
    }
    id v19 = objc_loadWeakRetained((id *)&self->_chromeViewController);
    if (!v19)
    {
      v24 = @"<nil>";
      goto LABEL_33;
    }
    id v20 = (objc_class *)objc_opt_class();
    id v21 = NSStringFromClass(v20);
    if (objc_opt_respondsToSelector())
    {
      v22 = [v19 performSelector:"accessibilityIdentifier"];
      id v23 = v22;
      if (v22 && ![v22 isEqualToString:v21])
      {
        v24 = +[NSString stringWithFormat:@"%@<%p, %@>", v21, v19, v23];

        goto LABEL_26;
      }
    }
    v24 = +[NSString stringWithFormat:@"%@<%p>", v21, v19];
LABEL_26:

LABEL_33:
    *(_DWORD *)buf = 138543362;
    id v27 = v24;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%{public}@] Committing deferred operation immediately", buf, 0xCu);

LABEL_34:
    id v7 = [v5 copy];
    objc_storeWeak((id *)p_deferredOperation, 0);
    if (v7)
    {
      [v5 cancel];
      objc_storeWeak((id *)p_deferredOperation, v7);
      [v7 start];
    }
    goto LABEL_36;
  }
  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_chromeViewController);
    if (!v9)
    {
      v14 = @"<nil>";
      goto LABEL_30;
    }
    os_signpost_id_t v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    if (objc_opt_respondsToSelector())
    {
      v12 = [v9 performSelector:"accessibilityIdentifier"];
      id v13 = v12;
      if (v12 && ![v12 isEqualToString:v11])
      {
        v14 = +[NSString stringWithFormat:@"%@<%p, %@>", v11, v9, v13];

        goto LABEL_10;
      }
    }
    v14 = +[NSString stringWithFormat:@"%@<%p>", v11, v9];
LABEL_10:

LABEL_30:
    *(_DWORD *)buf = 138543362;
    id v27 = v14;
    v25 = "[%{public}@] Nothing to commit: deferred operation is already locked";
    goto LABEL_31;
  }
LABEL_36:
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fallbackBlock, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_destroyWeak((id *)&self->_deferredOperation);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end