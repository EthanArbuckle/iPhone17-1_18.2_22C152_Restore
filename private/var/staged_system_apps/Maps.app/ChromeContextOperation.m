@interface ChromeContextOperation
- (BOOL)isAsynchronous;
- (BOOL)isConcurrent;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (ChromeContextOperation)initWithChromeViewController:(id)a3 fallbackCoordinationBlock:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_completeOperation;
- (void)addCompletionBlock:(id)a3;
- (void)addContextCoordinationBlock:(id)a3;
- (void)dealloc;
- (void)setExecuting:(BOOL)a3;
- (void)setFallbackCoordinationBlock:(id)a3;
- (void)setFinished:(BOOL)a3;
- (void)start;
@end

@implementation ChromeContextOperation

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong(&self->_fallbackBlock, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);

  objc_storeStrong((id *)&self->_coordinationBlocks, 0);
}

- (void)setExecuting:(BOOL)a3
{
  if (self->_executing != a3)
  {
    BOOL v3 = a3;
    v5 = sub_100078CB4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
      int v7 = 134349570;
      v8 = self;
      __int16 v9 = 2112;
      id v10 = WeakRetained;
      __int16 v11 = 1024;
      BOOL v12 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] [%@] setExecuting:%d", (uint8_t *)&v7, 0x1Cu);
    }
    [(ChromeContextOperation *)self willChangeValueForKey:@"isExecuting"];
    self->_executing = v3;
    [(ChromeContextOperation *)self didChangeValueForKey:@"isExecuting"];
  }
}

- (void)_completeOperation
{
  BOOL v3 = sub_100078CB4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
    int v5 = 134349314;
    v6 = self;
    __int16 v7 = 2112;
    id v8 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] [%@] setComplete", (uint8_t *)&v5, 0x16u);
  }
  [(ChromeContextOperation *)self willChangeValueForKey:@"isFinished"];
  [(ChromeContextOperation *)self willChangeValueForKey:@"isExecuting"];
  self->_executing = 0;
  self->_finished = 1;
  [(ChromeContextOperation *)self didChangeValueForKey:@"isExecuting"];
  [(ChromeContextOperation *)self didChangeValueForKey:@"isFinished"];
}

- (void)dealloc
{
  BOOL v3 = sub_100078CB4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
    *(_DWORD *)buf = 134349314;
    __int16 v7 = self;
    __int16 v8 = 2112;
    id v9 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] [%@] deallocating", buf, 0x16u);
  }
  v5.receiver = self;
  v5.super_class = (Class)ChromeContextOperation;
  [(ChromeContextOperation *)&v5 dealloc];
}

- (void)addCompletionBlock:(id)a3
{
  id v4 = a3;
  if ([(ChromeContextOperation *)self isExecuting])
  {
    id v9 = sub_1005762E4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
      __int16 v11 = +[NSString stringWithFormat:@"[%p][%@] you should not try to add completion blocks to a locked coordination operation", self, WeakRetained];
      *(_DWORD *)buf = 136316162;
      v15 = (ChromeContextOperation *)"-[ChromeContextOperation addCompletionBlock:]";
      __int16 v16 = 2080;
      v17 = "ChromeContextCoordinationScheduler.m";
      __int16 v18 = 1024;
      int v19 = 203;
      __int16 v20 = 2080;
      v21 = "!self.isExecuting";
      __int16 v22 = 2112;
      v23 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);
    }
    if (sub_100BB36BC())
    {
      BOOL v12 = sub_1005762E4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v15 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (v4 && ![(ChromeContextOperation *)self isExecuting])
  {
    objc_super v5 = sub_100078CB4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = (char *)objc_loadWeakRetained((id *)&self->_chromeViewController);
      *(_DWORD *)buf = 134349314;
      v15 = self;
      __int16 v16 = 2112;
      v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] [%@] will add completion block", buf, 0x16u);
    }
    completionBlocks = self->_completionBlocks;
    id v8 = [v4 copy];
    [(NSMutableArray *)completionBlocks addObject:v8];
  }
}

- (void)addContextCoordinationBlock:(id)a3
{
  id v4 = a3;
  if ([(ChromeContextOperation *)self isExecuting])
  {
    id v9 = sub_1005762E4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
      __int16 v11 = +[NSString stringWithFormat:@"[%p][%@] you should not try to add coordination blocks to a locked coordination operation", self, WeakRetained];
      *(_DWORD *)buf = 136316162;
      v15 = (ChromeContextOperation *)"-[ChromeContextOperation addContextCoordinationBlock:]";
      __int16 v16 = 2080;
      v17 = "ChromeContextCoordinationScheduler.m";
      __int16 v18 = 1024;
      int v19 = 186;
      __int16 v20 = 2080;
      v21 = "!self.isExecuting";
      __int16 v22 = 2112;
      v23 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);
    }
    if (sub_100BB36BC())
    {
      BOOL v12 = sub_1005762E4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v15 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (v4 && ![(ChromeContextOperation *)self isExecuting])
  {
    objc_super v5 = sub_100078CB4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = (char *)objc_loadWeakRetained((id *)&self->_chromeViewController);
      *(_DWORD *)buf = 134349314;
      v15 = self;
      __int16 v16 = 2112;
      v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] [%@] will add coordination block", buf, 0x16u);
    }
    coordinationBlocks = self->_coordinationBlocks;
    id v8 = [v4 copy];
    [(NSMutableArray *)coordinationBlocks addObject:v8];
  }
}

- (BOOL)isExecuting
{
  return self->_executing;
}

- (ChromeContextOperation)initWithChromeViewController:(id)a3 fallbackCoordinationBlock:(id)a4
{
  v6 = (char *)a3;
  id v7 = a4;
  if (!v6)
  {
    v17 = sub_1005762E4();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      __int16 v22 = "-[ChromeContextOperation initWithChromeViewController:fallbackCoordinationBlock:]";
      __int16 v23 = 2080;
      v24 = "ChromeContextCoordinationScheduler.m";
      __int16 v25 = 1024;
      int v26 = 57;
      __int16 v27 = 2080;
      v28 = "chromeViewController";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      __int16 v18 = sub_1005762E4();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v19 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        __int16 v22 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)ChromeContextOperation;
  id v8 = [(ChromeContextOperation *)&v20 init];
  if (v8)
  {
    id v9 = sub_100078CB4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349314;
      __int16 v22 = (const char *)v8;
      __int16 v23 = 2112;
      v24 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] [%@] initializing", buf, 0x16u);
    }

    objc_storeWeak((id *)&v8->_chromeViewController, v6);
    id v10 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:2];
    coordinationBlocks = v8->_coordinationBlocks;
    v8->_coordinationBlocks = v10;

    BOOL v12 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:2];
    completionBlocks = v8->_completionBlocks;
    v8->_completionBlocks = v12;

    id v14 = [v7 copy];
    id fallbackBlock = v8->_fallbackBlock;
    v8->_id fallbackBlock = v14;
  }
  return v8;
}

- (void)start
{
  id WeakRetained = (char *)objc_loadWeakRetained((id *)&self->_chromeViewController);
  id v4 = sub_100078CB4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349314;
    v58 = self;
    __int16 v59 = 2112;
    v60 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] [%@] starting", buf, 0x16u);
  }

  if (!WeakRetained)
  {
    objc_super v5 = sub_100078CB4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349314;
      v58 = self;
      __int16 v59 = 2112;
      v60 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] [%@] will not process coordination blocks, no chrome", buf, 0x16u);
    }
    goto LABEL_14;
  }
  if ([(ChromeContextOperation *)self isCancelled])
  {
    objc_super v5 = sub_100078CB4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349314;
      v58 = self;
      __int16 v59 = 2112;
      v60 = WeakRetained;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] [%@] will not process coordination blocks, cancelled", buf, 0x16u);
    }
LABEL_14:

    [(ChromeContextOperation *)self setFinished:1];
    goto LABEL_57;
  }
  if ([(ChromeContextOperation *)self isExecuting])
  {
    objc_super v5 = sub_100078CB4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349314;
      v58 = self;
      __int16 v59 = 2112;
      v60 = WeakRetained;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] [%@] will not process coordination blocks, already locked", buf, 0x16u);
    }
    goto LABEL_14;
  }
  unsigned __int8 v56 = 1;
  v6 = [WeakRetained contexts];
  id v7 = [v6 copy];

  do
  {
    id v8 = [(NSMutableArray *)self->_coordinationBlocks copy];
    [(NSMutableArray *)self->_coordinationBlocks removeAllObjects];
    id v9 = sub_100078CB4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = [v8 count];
      *(_DWORD *)buf = 134349570;
      v58 = self;
      __int16 v59 = 2112;
      v60 = WeakRetained;
      __int16 v61 = 2048;
      *(void *)v62 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] [%@] will process %lu coordination blocks", buf, 0x20u);
    }

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v11 = v8;
    id v12 = [v11 countByEnumeratingWithState:&v52 objects:v63 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v53;
      do
      {
        id v14 = 0;
        v15 = v7;
        do
        {
          if (*(void *)v53 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = (*(void (**)(void))(*(void *)(*((void *)&v52 + 1) + 8 * (void)v14) + 16))();
          v17 = (void *)v16;
          if (v16) {
            __int16 v18 = (void *)v16;
          }
          else {
            __int16 v18 = v15;
          }
          id v7 = v18;

          id v14 = (char *)v14 + 1;
          v15 = v7;
        }
        while (v12 != v14);
        id v12 = [v11 countByEnumeratingWithState:&v52 objects:v63 count:16];
      }
      while (v12);
    }
  }
  while ([(NSMutableArray *)self->_coordinationBlocks count]);
  int v19 = sub_100078CB4();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349314;
    v58 = self;
    __int16 v59 = 2112;
    v60 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[%{public}p] [%@] finished processing coordination blocks", buf, 0x16u);
  }

  [(ChromeContextOperation *)self setExecuting:1];
  id v44 = [(NSMutableArray *)self->_completionBlocks copy];
  coordinationBlocks = self->_coordinationBlocks;
  self->_coordinationBlocks = 0;

  completionBlocks = self->_completionBlocks;
  self->_completionBlocks = 0;

  if (![v7 count] && self->_fallbackBlock)
  {
    __int16 v22 = sub_100078CB4();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349314;
      v58 = self;
      __int16 v59 = 2112;
      v60 = WeakRetained;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "[%{public}p] [%@] no contexts from coordination blocks, using fallback block", buf, 0x16u);
    }

    uint64_t v23 = (*((void (**)(void))self->_fallbackBlock + 2))();

    id v7 = (id)v23;
  }
  id fallbackBlock = self->_fallbackBlock;
  self->_id fallbackBlock = 0;

  if (![v7 count])
  {
    v40 = sub_1005762E4();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v58 = (ChromeContextOperation *)"-[ChromeContextOperation start]";
      __int16 v59 = 2080;
      v60 = "ChromeContextCoordinationScheduler.m";
      __int16 v61 = 1024;
      *(_DWORD *)v62 = 154;
      *(_WORD *)&v62[4] = 2080;
      *(void *)&v62[6] = "contexts.count > 0";
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v41 = sub_1005762E4();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        v42 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v58 = v42;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if ([v7 count])
  {
    objc_initWeak(&location, self);
    __int16 v25 = sub_1000C49B4();
    if (os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "\"ContextOperation\", ", buf, 2u);
    }

    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_10005CE94;
    v45[3] = &unk_1012E7B88;
    objc_copyWeak(&v49, &location);
    int v26 = WeakRetained;
    v46 = v26;
    id v47 = v44;
    id v27 = v7;
    id v48 = v27;
    unsigned __int8 v50 = v56;
    v28 = objc_retainBlock(v45);
    v29 = [v26 contexts];
    unsigned int v30 = [v27 isEqualToArray:v29];

    v31 = sub_100078CB4();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_INFO);
    if (v30)
    {
      if (v32)
      {
        *(_DWORD *)buf = 134349314;
        v58 = self;
        __int16 v59 = 2112;
        v60 = WeakRetained;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "[%{public}p] [%@] contexts after coordination identical to existing contexts, just stop here", buf, 0x16u);
      }

      ((void (*)(void *))v28[2])(v28);
    }
    else
    {
      if (v32)
      {
        id v43 = [v27 count];
        id v34 = v27;
        v35 = v34;
        if (v34)
        {
          if ([v34 count])
          {
            uint64_t v36 = [v35 componentsJoinedByString:@", "];
            uint64_t v37 = +[NSString stringWithFormat:@"<%p> [%@]", v35, v36];
            v38 = (void *)v36;
            v39 = (__CFString *)v37;
          }
          else
          {
            v39 = +[NSString stringWithFormat:@"<%p> (empty)", v35];
          }
        }
        else
        {
          v39 = @"<nil>";
        }

        *(_DWORD *)buf = 134349826;
        v58 = self;
        __int16 v59 = 2112;
        v60 = WeakRetained;
        __int16 v61 = 2048;
        *(void *)v62 = v43;
        *(_WORD *)&v62[8] = 2114;
        *(void *)&v62[10] = v39;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "[%{public}p] [%@] will set %lu contexts on chrome (%{public}@)", buf, 0x2Au);
      }
      [v26 _setContexts:v27 animated:v56 completion:v28];
    }

    objc_destroyWeak(&v49);
    objc_destroyWeak(&location);
  }
  else
  {
    v33 = sub_100078CB4();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134349314;
      v58 = self;
      __int16 v59 = 2112;
      v60 = WeakRetained;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_FAULT, "[%{public}p] [%@] no contexts after coordination", buf, 0x16u);
    }

    [(ChromeContextOperation *)self _completeOperation];
  }

LABEL_57:
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (id)copyWithZone:(_NSZone *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v5 = [(id)objc_opt_class() allocWithZone:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  id v7 = [v5 initWithChromeViewController:WeakRetained fallbackCoordinationBlock:self->_fallbackBlock];

  id v8 = [+[NSMutableArray allocWithZone:a3] initWithArray:self->_coordinationBlocks copyItems:1];
  id v9 = (void *)v7[1];
  v7[1] = v8;

  id v10 = [+[NSMutableArray allocWithZone:a3] initWithArray:self->_completionBlocks copyItems:1];
  id v11 = (void *)v7[2];
  v7[2] = v10;

  *((unsigned char *)v7 + 40) = self->_executing;
  *((unsigned char *)v7 + 41) = self->_finished;
  return v7;
}

- (BOOL)isConcurrent
{
  return 0;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)setFallbackCoordinationBlock:(id)a3
{
  id v4 = a3;
  id v5 = sub_100078CB4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
    int v9 = 134349314;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] [%@] will add fallback coordination block", (uint8_t *)&v9, 0x16u);
  }
  id v7 = [v4 copy];

  id fallbackBlock = self->_fallbackBlock;
  self->_id fallbackBlock = v7;
}

- (void)setFinished:(BOOL)a3
{
  if (self->_finished != a3)
  {
    BOOL v3 = a3;
    id v5 = sub_100078CB4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
      int v7 = 134349570;
      id v8 = self;
      __int16 v9 = 2112;
      id v10 = WeakRetained;
      __int16 v11 = 1024;
      BOOL v12 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] [%@] setFinished:%d", (uint8_t *)&v7, 0x1Cu);
    }
    [(ChromeContextOperation *)self willChangeValueForKey:@"isFinished"];
    self->_finished = v3;
    [(ChromeContextOperation *)self didChangeValueForKey:@"isFinished"];
  }
}

@end