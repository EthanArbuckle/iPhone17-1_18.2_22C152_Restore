@interface SFDeviceAssetTask
- (BOOL)completeIfPossible;
- (BOOL)downloadCompletionCalled;
- (BOOL)queryResultCalled;
- (BOOL)updateTaskWithAssetBundleURL:(id)a3 error:(id)a4 isFallback:(BOOL)a5 isImperfectMatch:(BOOL)a6 isCached:(BOOL)a7;
- (BOOL)updateTaskWithAssetURL:(id)a3 error:(id)a4 isFallback:(BOOL)a5 isImperfectMatch:(BOOL)a6 isCached:(BOOL)a7;
- (BOOL)updateTaskWithBundle:(id)a3 error:(id)a4 isFallback:(BOOL)a5 isImperfectMatch:(BOOL)a6 isCached:(BOOL)a7;
- (BOOL)useProcessLocalCache;
- (NSBundle)cachedBundle;
- (NSBundle)fallbackBundle;
- (NSBundle)imperfectMatchBundle;
- (NSBundle)matchBundle;
- (NSError)error;
- (NSMutableArray)deviceQueryParameters;
- (OS_dispatch_queue)dispatchQueue;
- (OS_dispatch_source)timer;
- (SFDeviceAssetQuery)deviceAssetQuery;
- (SFDeviceAssetRequestConfiguration)configuration;
- (SFDeviceAssetTask)initWithDeviceQuery:(id)a3 requestConfiguration:(id)a4 dispatchQueue:(id)a5 useProcessLocalCache:(BOOL)a6;
- (id)bundleAtURL:(id)a3 error:(id *)a4;
- (id)bundleURLFromAssetURL:(id)a3;
- (void)cancelTimeout;
- (void)completeWithBundle:(id)a3 isFallback:(BOOL)a4 isCached:(BOOL)a5;
- (void)createQueryParameters;
- (void)setDownloadCompletionCalled:(BOOL)a3;
- (void)setQueryResultCalled:(BOOL)a3;
@end

@implementation SFDeviceAssetTask

- (SFDeviceAssetTask)initWithDeviceQuery:(id)a3 requestConfiguration:(id)a4 dispatchQueue:(id)a5 useProcessLocalCache:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v27.receiver = self;
  v27.super_class = (Class)SFDeviceAssetTask;
  v14 = [(SFDeviceAssetTask *)&v27 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_deviceAssetQuery, a3);
    objc_storeStrong((id *)&v15->_dispatchQueue, a5);
    v15->_useProcessLocalCache = a6;
    objc_storeStrong((id *)&v15->_configuration, a4);
    [(SFDeviceAssetRequestConfiguration *)v15->_configuration timeout];
    if (fabs(v16) >= 0.00000011920929)
    {
      dispatch_source_t v17 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)v15->_dispatchQueue);
      timer = v15->_timer;
      v15->_timer = (OS_dispatch_source *)v17;

      [(SFDeviceAssetRequestConfiguration *)v15->_configuration timeout];
      unint64_t v20 = (unint64_t)(v19 * 1000000000.0);
      v21 = v15->_timer;
      dispatch_time_t v22 = dispatch_time(0, v20);
      dispatch_source_set_timer(v21, v22, v20, v20 >> 2);
      v23 = v15->_timer;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __97__SFDeviceAssetTask_initWithDeviceQuery_requestConfiguration_dispatchQueue_useProcessLocalCache___block_invoke;
      handler[3] = &unk_1E5BBC870;
      v26 = v15;
      dispatch_source_set_event_handler(v23, handler);
      dispatch_resume((dispatch_object_t)v15->_timer);
    }
    [(SFDeviceAssetTask *)v15 createQueryParameters];
  }

  return v15;
}

uint64_t __97__SFDeviceAssetTask_initWithDeviceQuery_requestConfiguration_dispatchQueue_useProcessLocalCache___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) deviceAssetQuery];
  if (*(int *)[v2 ucat] <= 50)
  {
    v3 = [*(id *)(a1 + 32) deviceAssetQuery];
    if (*(_DWORD *)[v3 ucat] == -1)
    {
      v4 = [*(id *)(a1 + 32) deviceAssetQuery];
      [v4 ucat];
      int v5 = _LogCategory_Initialize();

      if (!v5) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    v2 = [*(id *)(a1 + 32) deviceAssetQuery];
    [v2 ucat];
    LogPrintF();
  }

LABEL_7:
  [*(id *)(a1 + 32) cancelTimeout];
  [*(id *)(a1 + 32) completeIfPossible];
  v6 = *(void **)(a1 + 32);

  return [v6 completeWithBundle:0 isFallback:0 isCached:0];
}

- (void)createQueryParameters
{
  v3 = (NSMutableArray *)objc_opt_new();
  deviceQueryParameters = self->_deviceQueryParameters;
  self->_deviceQueryParameters = v3;

  int v5 = [[SFDeviceQueryParameters alloc] initWithDeviceAssetQuery:self->_deviceAssetQuery installedOnly:1 imperfectMatch:0 fallback:0];
  [(NSMutableArray *)self->_deviceQueryParameters addObject:v5];
  deviceAssetQuery = self->_deviceAssetQuery;
  v7 = [(SFDeviceQueryParameters *)v5 maQuery];
  SFDeviceAssetAddKeyValuePairsForStrictMatch(deviceAssetQuery, v7);

  v8 = [[SFDeviceQueryParameters alloc] initWithDeviceAssetQuery:self->_deviceAssetQuery installedOnly:1 imperfectMatch:0 fallback:1];
  v9 = [(SFDeviceAssetTask *)self timer];

  v10 = self->_deviceQueryParameters;
  if (v9) {
    [(NSMutableArray *)v10 insertObject:v8 atIndex:0];
  }
  else {
    [(NSMutableArray *)v10 addObject:v8];
  }
  id v13 = [[SFDeviceQueryParameters alloc] initWithDeviceAssetQuery:self->_deviceAssetQuery installedOnly:0 imperfectMatch:0 fallback:0];

  id v11 = self->_deviceAssetQuery;
  id v12 = [(SFDeviceQueryParameters *)v13 maQuery];
  SFDeviceAssetAddKeyValuePairsForStrictMatch(v11, v12);

  [(NSMutableArray *)self->_deviceQueryParameters addObject:v13];
}

- (BOOL)updateTaskWithAssetURL:(id)a3 error:(id)a4 isFallback:(BOOL)a5 isImperfectMatch:(BOOL)a6 isCached:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a4;
  id v13 = [(SFDeviceAssetTask *)self bundleURLFromAssetURL:a3];
  LOBYTE(v7) = [(SFDeviceAssetTask *)self updateTaskWithAssetBundleURL:v13 error:v12 isFallback:v9 isImperfectMatch:v8 isCached:v7];

  return v7;
}

- (BOOL)updateTaskWithAssetBundleURL:(id)a3 error:(id)a4 isFallback:(BOOL)a5 isImperfectMatch:(BOOL)a6 isCached:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v16 = a4;
  id v12 = a4;
  id v13 = [(SFDeviceAssetTask *)self bundleAtURL:a3 error:&v16];
  id v14 = v16;

  LOBYTE(v7) = [(SFDeviceAssetTask *)self updateTaskWithBundle:v13 error:v14 isFallback:v9 isImperfectMatch:v8 isCached:v7];
  return v7;
}

- (BOOL)updateTaskWithBundle:(id)a3 error:(id)a4 isFallback:(BOOL)a5 isImperfectMatch:(BOOL)a6 isCached:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = (NSBundle *)a3;
  id v13 = (NSError *)a4;
  if (v12)
  {
    if (v7)
    {
      p_cachedBundle = &self->_cachedBundle;
    }
    else
    {
      if (!v9)
      {
        id v16 = v12;
        if (v8) {
          p_cachedBundle = &self->_imperfectMatchBundle;
        }
        else {
          p_cachedBundle = &self->_matchBundle;
        }
        goto LABEL_10;
      }
      p_cachedBundle = &self->_fallbackBundle;
    }
    v15 = v12;
LABEL_10:
    dispatch_source_t v17 = *p_cachedBundle;
    *p_cachedBundle = v12;
  }
  if (v13)
  {
    v18 = [(SFDeviceAssetTask *)self deviceAssetQuery];
    if (*(int *)[v18 ucat] > 90)
    {
LABEL_17:

      goto LABEL_18;
    }
    double v19 = [(SFDeviceAssetTask *)self deviceAssetQuery];
    if (*(_DWORD *)[v19 ucat] != -1)
    {

LABEL_16:
      v18 = [(SFDeviceAssetTask *)self deviceAssetQuery];
      [v18 ucat];
      LogPrintF();
      goto LABEL_17;
    }
    unint64_t v20 = [(SFDeviceAssetTask *)self deviceAssetQuery];
    [v20 ucat];
    int v21 = _LogCategory_Initialize();

    if (v21) {
      goto LABEL_16;
    }
  }
LABEL_18:
  error = self->_error;
  self->_error = v13;

  return v12 != 0;
}

- (void)cancelTimeout
{
  timer = self->_timer;
  if (timer)
  {
    int v5 = timer;
    dispatch_source_cancel(v5);
    v4 = self->_timer;
    self->_timer = 0;
  }
}

- (BOOL)completeIfPossible
{
  v3 = [(SFDeviceAssetTask *)self matchBundle];

  if (!v3)
  {
    v6 = [(SFDeviceAssetTask *)self fallbackBundle];

    if (!v6)
    {
      id v11 = [(SFDeviceAssetTask *)self imperfectMatchBundle];

      if (!v11)
      {
        dispatch_time_t v22 = [(SFDeviceAssetTask *)self cachedBundle];

        if (!v22) {
          return v3 == 0;
        }
        BOOL v8 = [(SFDeviceAssetTask *)self cachedBundle];
        id v16 = self;
        dispatch_source_t v17 = v8;
        uint64_t v18 = 0;
        uint64_t v19 = 1;
        goto LABEL_18;
      }
      uint64_t v12 = [(SFDeviceAssetTask *)self imperfectMatchBundle];
      goto LABEL_16;
    }
    BOOL v7 = [(SFDeviceAssetTask *)self timer];

    BOOL v8 = [(SFDeviceAssetTask *)self deviceAssetQuery];
    int v9 = *(_DWORD *)[v8 ucat];
    if (v7)
    {
      if (v9 <= 50)
      {
        v10 = [(SFDeviceAssetTask *)self deviceAssetQuery];
        if (*(_DWORD *)[v10 ucat] == -1)
        {
          v23 = [(SFDeviceAssetTask *)self deviceAssetQuery];
          [v23 ucat];
          int v24 = _LogCategory_Initialize();

          if (!v24) {
            return v3 == 0;
          }
        }
        else
        {
        }
        BOOL v8 = [(SFDeviceAssetTask *)self deviceAssetQuery];
        [v8 ucat];
        LogPrintF();
      }
      goto LABEL_19;
    }
    if (v9 <= 50)
    {
      int v21 = [(SFDeviceAssetTask *)self deviceAssetQuery];
      if (*(_DWORD *)[v21 ucat] == -1)
      {
        v25 = [(SFDeviceAssetTask *)self deviceAssetQuery];
        [v25 ucat];
        int v26 = _LogCategory_Initialize();

        if (!v26)
        {
LABEL_31:
          BOOL v8 = [(SFDeviceAssetTask *)self fallbackBundle];
          id v16 = self;
          dispatch_source_t v17 = v8;
          uint64_t v18 = 1;
          goto LABEL_17;
        }
      }
      else
      {
      }
      BOOL v8 = [(SFDeviceAssetTask *)self deviceAssetQuery];
      [v8 ucat];
      LogPrintF();
    }

    goto LABEL_31;
  }
  v4 = [(SFDeviceAssetTask *)self deviceAssetQuery];
  if (*(int *)[v4 ucat] > 50)
  {
LABEL_14:

    goto LABEL_15;
  }
  int v5 = [(SFDeviceAssetTask *)self deviceAssetQuery];
  if (*(_DWORD *)[v5 ucat] != -1)
  {

LABEL_13:
    v4 = [(SFDeviceAssetTask *)self deviceAssetQuery];
    [v4 ucat];
    v15 = [(SFDeviceAssetTask *)self matchBundle];
    objc_super v27 = [v15 bundlePath];
    LogPrintF();

    goto LABEL_14;
  }
  id v13 = [(SFDeviceAssetTask *)self deviceAssetQuery];
  [v13 ucat];
  int v14 = _LogCategory_Initialize();

  if (v14) {
    goto LABEL_13;
  }
LABEL_15:
  uint64_t v12 = [(SFDeviceAssetTask *)self matchBundle];
LABEL_16:
  BOOL v8 = (void *)v12;
  id v16 = self;
  dispatch_source_t v17 = v8;
  uint64_t v18 = 0;
LABEL_17:
  uint64_t v19 = 0;
LABEL_18:
  [(SFDeviceAssetTask *)v16 completeWithBundle:v17 isFallback:v18 isCached:v19];
LABEL_19:

  return v3 == 0;
}

- (void)completeWithBundle:(id)a3 isFallback:(BOOL)a4 isCached:(BOOL)a5
{
  id v8 = a3;
  [(SFDeviceAssetTask *)self cancelTimeout];
  int v9 = [(SFDeviceAssetTask *)self deviceAssetQuery];
  v10 = [v9 effectiveProductType];

  id v11 = [(SFDeviceAssetTask *)self dispatchQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__SFDeviceAssetTask_completeWithBundle_isFallback_isCached___block_invoke;
  v14[3] = &unk_1E5BBEB20;
  BOOL v17 = a5;
  BOOL v18 = a4;
  v14[4] = self;
  id v15 = v8;
  id v16 = v10;
  id v12 = v10;
  id v13 = v8;
  dispatch_async(v11, v14);
}

void __60__SFDeviceAssetTask_completeWithBundle_isFallback_isCached___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    v2 = @"cached";
  }
  else if (*(unsigned char *)(a1 + 57))
  {
    v2 = @"fallback";
  }
  else
  {
    v2 = @"matching";
  }
  v29 = v2;
  if (([*(id *)(a1 + 32) queryResultCalled] & 1) == 0)
  {
    v3 = [*(id *)(a1 + 32) configuration];
    v4 = [v3 queryResultHandler];

    if (v4)
    {
      [*(id *)(a1 + 32) setQueryResultCalled:1];
      int v5 = [*(id *)(a1 + 32) deviceAssetQuery];
      if (*(int *)[v5 ucat] <= 50)
      {
        v6 = [*(id *)(a1 + 32) deviceAssetQuery];
        if (*(_DWORD *)[v6 ucat] == -1)
        {
          id v16 = [*(id *)(a1 + 32) deviceAssetQuery];
          [v16 ucat];
          int v17 = _LogCategory_Initialize();

          if (!v17)
          {
LABEL_29:
            int v9 = objc_msgSend(*(id *)(a1 + 32), "configuration", v27, v28);
            uint64_t v18 = [v9 queryResultHandler];
            uint64_t v19 = (void (**)(void, void, void, void, void))v18;
            uint64_t v20 = *(void *)(a1 + 48);
            if (*(void *)(a1 + 40))
            {
              (*(void (**)(uint64_t))(v18 + 16))(v18);
LABEL_33:

              goto LABEL_34;
            }
            BOOL v21 = *(unsigned __int8 *)(a1 + 57) != 0;
            dispatch_time_t v22 = [*(id *)(a1 + 32) error];
            ((void (**)(void, void, uint64_t, BOOL, void *))v19)[2](v19, 0, v20, v21, v22);
LABEL_32:

            goto LABEL_33;
          }
        }
        else
        {
        }
        int v5 = [*(id *)(a1 + 32) deviceAssetQuery];
        [v5 ucat];
        if (*(void *)(a1 + 40))
        {
          objc_super v27 = v29;
          v28 = *(void **)(a1 + 40);
          LogPrintF();
        }
        else
        {
          v28 = [*(id *)(a1 + 32) error];
          objc_super v27 = v29;
          LogPrintF();
        }
      }

      goto LABEL_29;
    }
  }
  if (([*(id *)(a1 + 32) downloadCompletionCalled] & 1) == 0)
  {
    BOOL v7 = [*(id *)(a1 + 32) configuration];
    id v8 = [v7 downloadCompletionHandler];
    if (!v8 || *(unsigned char *)(a1 + 57))
    {

      goto LABEL_15;
    }
    int v13 = *(unsigned __int8 *)(a1 + 56);

    if (!v13)
    {
      int v14 = [*(id *)(a1 + 32) deviceAssetQuery];
      if (*(int *)[v14 ucat] <= 50)
      {
        id v15 = [*(id *)(a1 + 32) deviceAssetQuery];
        if (*(_DWORD *)[v15 ucat] == -1)
        {
          v23 = [*(id *)(a1 + 32) deviceAssetQuery];
          [v23 ucat];
          int v24 = _LogCategory_Initialize();

          if (!v24)
          {
LABEL_43:
            int v9 = objc_msgSend(*(id *)(a1 + 32), "configuration", v27);
            uint64_t v25 = [v9 downloadCompletionHandler];
            uint64_t v19 = (void (**)(void, void, void, void, void))v25;
            uint64_t v26 = *(void *)(a1 + 40);
            if (v26)
            {
              (*(void (**)(uint64_t, uint64_t, void))(v25 + 16))(v25, v26, 0);
              goto LABEL_33;
            }
            dispatch_time_t v22 = [*(id *)(a1 + 32) error];
            ((void (*)(void (**)(void, void, void, void, void), void, void *))v19[2])(v19, 0, v22);
            goto LABEL_32;
          }
        }
        else
        {
        }
        int v14 = [*(id *)(a1 + 32) deviceAssetQuery];
        [v14 ucat];
        if (*(void *)(a1 + 40))
        {
          objc_super v27 = *(void **)(a1 + 40);
          LogPrintF();
        }
        else
        {
          objc_super v27 = [*(id *)(a1 + 32) error];
          LogPrintF();
        }
      }

      goto LABEL_43;
    }
  }
LABEL_15:
  int v9 = [*(id *)(a1 + 32) deviceAssetQuery];
  if (*(int *)[v9 ucat] <= 50)
  {
    v10 = [*(id *)(a1 + 32) deviceAssetQuery];
    if (*(_DWORD *)[v10 ucat] == -1)
    {
      id v11 = [*(id *)(a1 + 32) deviceAssetQuery];
      [v11 ucat];
      int v12 = _LogCategory_Initialize();

      if (!v12) {
        goto LABEL_35;
      }
    }
    else
    {
    }
    int v9 = [*(id *)(a1 + 32) deviceAssetQuery];
    [v9 ucat];
    LogPrintF();
  }
LABEL_34:

LABEL_35:
}

- (id)bundleURLFromAssetURL:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v10 = 0;
    id v9 = 0;
    goto LABEL_13;
  }
  int v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v6 = *MEMORY[0x1E4F1C668];
  v19[0] = *MEMORY[0x1E4F1C628];
  v19[1] = v6;
  BOOL v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  id v18 = 0;
  id v8 = [v5 contentsOfDirectoryAtURL:v4 includingPropertiesForKeys:v7 options:7 error:&v18];
  id v9 = v18;

  if (![v8 count])
  {
    id v11 = [(SFDeviceAssetTask *)self deviceAssetQuery];
    if (*(int *)[v11 ucat] >= 91)
    {
    }
    else
    {
      int v12 = [(SFDeviceAssetTask *)self deviceAssetQuery];
      if (*(_DWORD *)[v12 ucat] != -1)
      {

LABEL_10:
        id v15 = [(SFDeviceAssetTask *)self deviceAssetQuery];
        [v15 ucat];
        int v17 = [v4 path];
        LogPrintF();

        goto LABEL_11;
      }
      int v13 = [(SFDeviceAssetTask *)self deviceAssetQuery];
      [v13 ucat];
      int v14 = _LogCategory_Initialize();

      if (v14) {
        goto LABEL_10;
      }
    }
LABEL_11:
    v10 = 0;
    goto LABEL_12;
  }
  v10 = [v8 firstObject];
LABEL_12:

LABEL_13:

  return v10;
}

- (id)bundleAtURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6)
  {
    int v13 = 0;
    goto LABEL_18;
  }
  BOOL v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v8 = [v7 contentsOfDirectoryAtURL:v6 includingPropertiesForKeys:0 options:0 error:0];
  id v9 = [v8 firstObject];

  if (v9)
  {
    id v21 = 0;
    int CanAccessURL = SFDeviceAssetProcessCanAccessURL(v9, (uint64_t)&v21);
    id v11 = v21;
    if (CanAccessURL)
    {
      uint64_t v12 = [MEMORY[0x1E4F28B50] bundleWithURL:v6];
      if (v12)
      {
        int v13 = (void *)v12;
        if (a4) {
          *a4 = 0;
        }
        goto LABEL_17;
      }
      id v14 = *a4;

      id v11 = v14;
    }
  }
  else
  {
    id v11 = 0;
  }
  id v15 = [(SFDeviceAssetTask *)self deviceAssetQuery];
  if (*(int *)[v15 ucat] > 90) {
    goto LABEL_15;
  }
  id v16 = [(SFDeviceAssetTask *)self deviceAssetQuery];
  if (*(_DWORD *)[v16 ucat] != -1)
  {

LABEL_14:
    id v15 = [(SFDeviceAssetTask *)self deviceAssetQuery];
    [v15 ucat];
    uint64_t v20 = [v6 path];
    LogPrintF();

LABEL_15:
    goto LABEL_16;
  }
  int v17 = [(SFDeviceAssetTask *)self deviceAssetQuery];
  [v17 ucat];
  int v18 = _LogCategory_Initialize();

  if (v18) {
    goto LABEL_14;
  }
LABEL_16:
  int v13 = 0;
LABEL_17:

LABEL_18:

  return v13;
}

- (SFDeviceAssetQuery)deviceAssetQuery
{
  return self->_deviceAssetQuery;
}

- (SFDeviceAssetRequestConfiguration)configuration
{
  return self->_configuration;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (BOOL)useProcessLocalCache
{
  return self->_useProcessLocalCache;
}

- (NSMutableArray)deviceQueryParameters
{
  return self->_deviceQueryParameters;
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (NSBundle)matchBundle
{
  return self->_matchBundle;
}

- (NSBundle)imperfectMatchBundle
{
  return self->_imperfectMatchBundle;
}

- (NSBundle)fallbackBundle
{
  return self->_fallbackBundle;
}

- (NSBundle)cachedBundle
{
  return self->_cachedBundle;
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)queryResultCalled
{
  return self->_queryResultCalled;
}

- (void)setQueryResultCalled:(BOOL)a3
{
  self->_queryResultCalled = a3;
}

- (BOOL)downloadCompletionCalled
{
  return self->_downloadCompletionCalled;
}

- (void)setDownloadCompletionCalled:(BOOL)a3
{
  self->_downloadCompletionCalled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_cachedBundle, 0);
  objc_storeStrong((id *)&self->_fallbackBundle, 0);
  objc_storeStrong((id *)&self->_imperfectMatchBundle, 0);
  objc_storeStrong((id *)&self->_matchBundle, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_deviceQueryParameters, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_deviceAssetQuery, 0);
}

@end