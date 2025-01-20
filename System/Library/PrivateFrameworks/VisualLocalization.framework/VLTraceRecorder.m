@interface VLTraceRecorder
+ (NSURL)defaultDirectory;
- (VLTraceRecorder)initWithDirectory:(id)a3;
- (void)_beginTraceIfNecessary;
- (void)_finishOnIsolationQueue;
- (void)_recordAttemptOnIsolationQueue:(id)a3;
- (void)finish;
- (void)recordAttempt:(id)a3;
- (void)start;
@end

@implementation VLTraceRecorder

+ (NSURL)defaultDirectory
{
  if (_MergedGlobals_2 == -1)
  {
    v2 = (void *)qword_26AC37578;
  }
  else
  {
    dispatch_once(&_MergedGlobals_2, &__block_literal_global_2);
    v2 = (void *)qword_26AC37578;
  }
  return (NSURL *)v2;
}

uint64_t __35__VLTraceRecorder_defaultDirectory__block_invoke()
{
  qword_26AC37578 = [NSURL fileURLWithPath:@"/var/mobile/Library/Caches/VisualLocalization/Traces" isDirectory:1];
  return MEMORY[0x270F9A758]();
}

- (VLTraceRecorder)initWithDirectory:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VLTraceRecorder;
  v5 = [(VLTraceRecorder *)&v13 init];
  if (v5)
  {
    if (([v4 isFileURL] & 1) == 0)
    {
      id v12 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Trace directory must be a file URL" userInfo:0];
      objc_exception_throw(v12);
    }
    uint64_t v6 = [v4 copy];
    destinationDirectory = v5->_destinationDirectory;
    v5->_destinationDirectory = (NSURL *)v6;

    uint64_t v8 = geo_dispatch_queue_create_with_qos();
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;

    v5->_began.lock._os_unfair_lock_opaque = 0;
    v5->_began.didRun = 0;
    v5->_finished.lock._os_unfair_lock_opaque = 0;
    v5->_finished.didRun = 0;
    v10 = v5;
  }

  return v5;
}

- (void)start
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __24__VLTraceRecorder_start__block_invoke;
  block[3] = &unk_2643BA1E8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __24__VLTraceRecorder_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginTraceIfNecessary];
}

- (void)finish
{
}

void __25__VLTraceRecorder_finish__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __25__VLTraceRecorder_finish__block_invoke_2;
  block[3] = &unk_2643BA1E8;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __25__VLTraceRecorder_finish__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishOnIsolationQueue];
}

- (void)_beginTraceIfNecessary
{
}

void __41__VLTraceRecorder__beginTraceIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F088C0];
  v3 = [MEMORY[0x263EFF910] date];
  id v4 = [MEMORY[0x263EFFA18] localTimeZone];
  v5 = [v2 stringFromDate:v3 timeZone:v4 formatOptions:371];

  uint64_t v6 = NSURL;
  v7 = NSTemporaryDirectory();
  uint64_t v8 = [v6 fileURLWithPath:v7];
  v9 = [v8 URLByAppendingPathComponent:@"com.apple.VisualLocalization"];
  uint64_t v10 = [v9 URLByAppendingPathComponent:v5];
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  objc_super v13 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 40);
  id v68 = 0;
  LODWORD(v9) = [v13 createDirectoryAtURL:v14 withIntermediateDirectories:1 attributes:0 error:&v68];
  id v15 = v68;

  if (!v9)
  {
    if (qword_26AC37588 == -1)
    {
      v63 = qword_26AC37580;
      if (!os_log_type_enabled((os_log_t)qword_26AC37580, OS_LOG_TYPE_ERROR))
      {
LABEL_10:
        uint64_t v17 = *(void *)(a1 + 32);
        v18 = *(void **)(v17 + 40);
        *(void *)(v17 + 40) = 0;

        goto LABEL_11;
      }
    }
    else
    {
      dispatch_once(&qword_26AC37588, &__block_literal_global_69);
      v63 = qword_26AC37580;
      if (!os_log_type_enabled((os_log_t)qword_26AC37580, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
    }
    *(_DWORD *)buf = 138543362;
    id v70 = v15;
    _os_log_impl(&dword_21BAD2000, v63, OS_LOG_TYPE_ERROR, "Failed to create trace directory: %{public}@", buf, 0xCu);
    goto LABEL_10;
  }
  if (qword_26AC37588 == -1)
  {
    v61 = qword_26AC37580;
    if (!os_log_type_enabled((os_log_t)qword_26AC37580, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_11;
    }
    goto LABEL_5;
  }
  dispatch_once(&qword_26AC37588, &__block_literal_global_69);
  v61 = qword_26AC37580;
  if (os_log_type_enabled((os_log_t)qword_26AC37580, OS_LOG_TYPE_DEBUG))
  {
LABEL_5:
    v16 = *(void **)(*(void *)(a1 + 32) + 40);
    *(_DWORD *)buf = 138543362;
    id v70 = v16;
    _os_log_impl(&dword_21BAD2000, v61, OS_LOG_TYPE_DEBUG, "Created temporary trace directory: %{public}@", buf, 0xCu);
  }
LABEL_11:
  uint64_t v19 = [*(id *)(*(void *)(a1 + 32) + 40) URLByAppendingPathComponent:@"images"];
  uint64_t v20 = *(void *)(a1 + 32);
  v21 = *(void **)(v20 + 48);
  *(void *)(v20 + 48) = v19;

  v22 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v23 = *(void *)(*(void *)(a1 + 32) + 48);
  id v67 = v15;
  char v24 = [v22 createDirectoryAtURL:v23 withIntermediateDirectories:1 attributes:0 error:&v67];
  id v25 = v67;

  if (v24) {
    goto LABEL_16;
  }
  if (qword_26AC37588 != -1)
  {
    dispatch_once(&qword_26AC37588, &__block_literal_global_69);
    v26 = qword_26AC37580;
    if (!os_log_type_enabled((os_log_t)qword_26AC37580, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  v26 = qword_26AC37580;
  if (os_log_type_enabled((os_log_t)qword_26AC37580, OS_LOG_TYPE_ERROR))
  {
LABEL_14:
    *(_DWORD *)buf = 138543362;
    id v70 = v25;
    _os_log_impl(&dword_21BAD2000, v26, OS_LOG_TYPE_ERROR, "Failed to create images directory: %{public}@", buf, 0xCu);
  }
LABEL_15:
  uint64_t v27 = *(void *)(a1 + 32);
  v28 = *(void **)(v27 + 40);
  *(void *)(v27 + 40) = 0;

  uint64_t v29 = *(void *)(a1 + 32);
  v30 = *(void **)(v29 + 48);
  *(void *)(v29 + 48) = 0;

LABEL_16:
  uint64_t v31 = [*(id *)(*(void *)(a1 + 32) + 40) URLByAppendingPathComponent:@"parameters"];
  uint64_t v32 = *(void *)(a1 + 32);
  v33 = *(void **)(v32 + 56);
  *(void *)(v32 + 56) = v31;

  v34 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v35 = *(void *)(*(void *)(a1 + 32) + 56);
  id v66 = v25;
  char v36 = [v34 createDirectoryAtURL:v35 withIntermediateDirectories:1 attributes:0 error:&v66];
  id v37 = v66;

  if (v36) {
    goto LABEL_21;
  }
  if (qword_26AC37588 != -1)
  {
    dispatch_once(&qword_26AC37588, &__block_literal_global_69);
    v38 = qword_26AC37580;
    if (!os_log_type_enabled((os_log_t)qword_26AC37580, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  v38 = qword_26AC37580;
  if (os_log_type_enabled((os_log_t)qword_26AC37580, OS_LOG_TYPE_ERROR))
  {
LABEL_19:
    *(_DWORD *)buf = 138543362;
    id v70 = v37;
    _os_log_impl(&dword_21BAD2000, v38, OS_LOG_TYPE_ERROR, "Failed to create parameters directory: %{public}@", buf, 0xCu);
  }
LABEL_20:
  uint64_t v39 = *(void *)(a1 + 32);
  v40 = *(void **)(v39 + 40);
  *(void *)(v39 + 40) = 0;

  uint64_t v41 = *(void *)(a1 + 32);
  v42 = *(void **)(v41 + 48);
  *(void *)(v41 + 48) = 0;

  uint64_t v43 = *(void *)(a1 + 32);
  v44 = *(void **)(v43 + 56);
  *(void *)(v43 + 56) = 0;

LABEL_21:
  uint64_t v45 = [*(id *)(*(void *)(a1 + 32) + 40) URLByAppendingPathComponent:@"results"];
  uint64_t v46 = *(void *)(a1 + 32);
  v47 = *(void **)(v46 + 64);
  *(void *)(v46 + 64) = v45;

  v48 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v49 = *(void *)(*(void *)(a1 + 32) + 64);
  id v65 = v37;
  char v50 = [v48 createDirectoryAtURL:v49 withIntermediateDirectories:1 attributes:0 error:&v65];
  id v51 = v65;

  if ((v50 & 1) == 0)
  {
    if (qword_26AC37588 == -1)
    {
      v52 = qword_26AC37580;
      if (!os_log_type_enabled((os_log_t)qword_26AC37580, OS_LOG_TYPE_ERROR))
      {
LABEL_25:
        uint64_t v53 = *(void *)(a1 + 32);
        v54 = *(void **)(v53 + 40);
        *(void *)(v53 + 40) = 0;

        uint64_t v55 = *(void *)(a1 + 32);
        v56 = *(void **)(v55 + 48);
        *(void *)(v55 + 48) = 0;

        uint64_t v57 = *(void *)(a1 + 32);
        v58 = *(void **)(v57 + 56);
        *(void *)(v57 + 56) = 0;

        uint64_t v59 = *(void *)(a1 + 32);
        v60 = *(void **)(v59 + 64);
        *(void *)(v59 + 64) = 0;

        goto LABEL_26;
      }
    }
    else
    {
      dispatch_once(&qword_26AC37588, &__block_literal_global_69);
      v52 = qword_26AC37580;
      if (!os_log_type_enabled((os_log_t)qword_26AC37580, OS_LOG_TYPE_ERROR)) {
        goto LABEL_25;
      }
    }
    *(_DWORD *)buf = 138543362;
    id v70 = v51;
    _os_log_impl(&dword_21BAD2000, v52, OS_LOG_TYPE_ERROR, "Failed to create results directory: %{public}@", buf, 0xCu);
    goto LABEL_25;
  }
LABEL_26:
}

- (void)recordAttempt:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__VLTraceRecorder_recordAttempt___block_invoke;
  v7[3] = &unk_2643BA210;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __33__VLTraceRecorder_recordAttempt___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _recordAttemptOnIsolationQueue:*(void *)(a1 + 40)];
}

- (void)_recordAttemptOnIsolationQueue:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(VLTraceRecorder *)self _beginTraceIfNecessary];
  if (self->_baseDirectory)
  {
    v5 = [MEMORY[0x263F08C38] UUID];
    id v6 = [v5 UUIDString];

    v7 = [v4 pngData];
    if (!v7) {
      goto LABEL_8;
    }
    id v8 = [(NSURL *)self->_imagesDirectory URLByAppendingPathComponent:v6];
    v9 = [v8 URLByAppendingPathExtension:@"png"];

    id v39 = 0;
    char v10 = [v7 writeToURL:v9 options:0 error:&v39];
    id v11 = v39;
    if ((v10 & 1) == 0)
    {
      if (qword_26AC37588 != -1)
      {
        dispatch_once(&qword_26AC37588, &__block_literal_global_69);
        id v12 = qword_26AC37580;
        if (!os_log_type_enabled((os_log_t)qword_26AC37580, OS_LOG_TYPE_ERROR)) {
          goto LABEL_7;
        }
        goto LABEL_6;
      }
      id v12 = qword_26AC37580;
      if (os_log_type_enabled((os_log_t)qword_26AC37580, OS_LOG_TYPE_ERROR))
      {
LABEL_6:
        *(_DWORD *)buf = 138543362;
        id v41 = v11;
        _os_log_impl(&dword_21BAD2000, v12, OS_LOG_TYPE_ERROR, "Failed to write image: %{public}@", buf, 0xCu);
      }
    }
LABEL_7:

LABEL_8:
    objc_super v13 = [v4 inputParameters];
    uint64_t v14 = (void *)[v13 mutableCopy];

    unint64_t v15 = 0x263F08000uLL;
    if (!v14) {
      goto LABEL_19;
    }
    [v14 setObject:v6 forKeyedSubscript:@"uuid"];
    id v38 = 0;
    v16 = [MEMORY[0x263F08900] dataWithJSONObject:v14 options:0 error:&v38];
    id v17 = v38;
    if (!v16)
    {
      if (qword_26AC37588 == -1)
      {
        uint64_t v23 = qword_26AC37580;
        if (!os_log_type_enabled((os_log_t)qword_26AC37580, OS_LOG_TYPE_ERROR)) {
          goto LABEL_18;
        }
      }
      else
      {
        dispatch_once(&qword_26AC37588, &__block_literal_global_69);
        uint64_t v23 = qword_26AC37580;
        if (!os_log_type_enabled((os_log_t)qword_26AC37580, OS_LOG_TYPE_ERROR)) {
          goto LABEL_18;
        }
      }
      *(_DWORD *)buf = 138543362;
      id v41 = v17;
      _os_log_impl(&dword_21BAD2000, v23, OS_LOG_TYPE_ERROR, "Failed to JSON-encode input parameters: %{public}@", buf, 0xCu);
      goto LABEL_18;
    }
    v18 = [(NSURL *)self->_parametersDirectory URLByAppendingPathComponent:v6];
    uint64_t v19 = [v18 URLByAppendingPathExtension:@"json"];

    id v37 = 0;
    char v20 = [v16 writeToURL:v19 options:0 error:&v37];
    id v21 = v37;
    if ((v20 & 1) == 0)
    {
      if (qword_26AC37588 != -1)
      {
        dispatch_once(&qword_26AC37588, &__block_literal_global_69);
        v22 = qword_26AC37580;
        if (!os_log_type_enabled((os_log_t)qword_26AC37580, OS_LOG_TYPE_ERROR)) {
          goto LABEL_14;
        }
        goto LABEL_13;
      }
      v22 = qword_26AC37580;
      if (os_log_type_enabled((os_log_t)qword_26AC37580, OS_LOG_TYPE_ERROR))
      {
LABEL_13:
        *(_DWORD *)buf = 138543362;
        id v41 = v21;
        _os_log_impl(&dword_21BAD2000, v22, OS_LOG_TYPE_ERROR, "Failed to write input parameters: %{public}@", buf, 0xCu);
      }
    }
LABEL_14:

    unint64_t v15 = 0x263F08000;
LABEL_18:

LABEL_19:
    char v24 = [v4 results];
    id v25 = (void *)[v24 mutableCopy];

    if (!v25)
    {
LABEL_30:

      goto LABEL_31;
    }
    [v25 setObject:v6 forKeyedSubscript:@"uuid"];
    v26 = *(void **)(v15 + 2304);
    id v36 = 0;
    uint64_t v27 = [v26 dataWithJSONObject:v25 options:0 error:&v36];
    id v28 = v36;
    if (!v27)
    {
      if (qword_26AC37588 == -1)
      {
        v34 = qword_26AC37580;
        if (!os_log_type_enabled((os_log_t)qword_26AC37580, OS_LOG_TYPE_ERROR)) {
          goto LABEL_29;
        }
      }
      else
      {
        dispatch_once(&qword_26AC37588, &__block_literal_global_69);
        v34 = qword_26AC37580;
        if (!os_log_type_enabled((os_log_t)qword_26AC37580, OS_LOG_TYPE_ERROR)) {
          goto LABEL_29;
        }
      }
      *(_DWORD *)buf = 138543362;
      id v41 = v28;
      _os_log_impl(&dword_21BAD2000, v34, OS_LOG_TYPE_ERROR, "Failed to JSON-encode results: %{public}@", buf, 0xCu);
      goto LABEL_29;
    }
    uint64_t v29 = [(NSURL *)self->_resultsDirectory URLByAppendingPathComponent:v6];
    v30 = [v29 URLByAppendingPathExtension:@"json"];

    id v35 = 0;
    char v31 = [v27 writeToURL:v30 options:0 error:&v35];
    id v32 = v35;
    if ((v31 & 1) == 0)
    {
      if (qword_26AC37588 != -1)
      {
        dispatch_once(&qword_26AC37588, &__block_literal_global_69);
        v33 = qword_26AC37580;
        if (!os_log_type_enabled((os_log_t)qword_26AC37580, OS_LOG_TYPE_ERROR)) {
          goto LABEL_25;
        }
        goto LABEL_24;
      }
      v33 = qword_26AC37580;
      if (os_log_type_enabled((os_log_t)qword_26AC37580, OS_LOG_TYPE_ERROR))
      {
LABEL_24:
        *(_DWORD *)buf = 138543362;
        id v41 = v32;
        _os_log_impl(&dword_21BAD2000, v33, OS_LOG_TYPE_ERROR, "Failed to write results: %{public}@", buf, 0xCu);
      }
    }
LABEL_25:

LABEL_29:
    goto LABEL_30;
  }
LABEL_31:
}

- (void)_finishOnIsolationQueue
{
  v2 = self;
  uint64_t v57 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = [MEMORY[0x263F08850] defaultManager];
  id v4 = [(NSURL *)v2->_destinationDirectory path];
  char v5 = [v3 fileExistsAtPath:v4];

  if ((v5 & 1) == 0)
  {
    id v6 = [MEMORY[0x263F08850] defaultManager];
    destinationDirectory = v2->_destinationDirectory;
    id v53 = 0;
    int v8 = [v6 createDirectoryAtURL:destinationDirectory withIntermediateDirectories:1 attributes:0 error:&v53];
    id v9 = v53;

    if (!v8)
    {
      if (qword_26AC37588 == -1)
      {
        uint64_t v42 = qword_26AC37580;
        if (!os_log_type_enabled((os_log_t)qword_26AC37580, OS_LOG_TYPE_ERROR)) {
          goto LABEL_32;
        }
      }
      else
      {
        dispatch_once(&qword_26AC37588, &__block_literal_global_69);
        uint64_t v42 = qword_26AC37580;
        if (!os_log_type_enabled((os_log_t)qword_26AC37580, OS_LOG_TYPE_ERROR)) {
          goto LABEL_32;
        }
      }
      *(_DWORD *)buf = 138543362;
      id v56 = v9;
      _os_log_impl(&dword_21BAD2000, v42, OS_LOG_TYPE_ERROR, "Failed to create trace directory: %{public}@", buf, 0xCu);
      goto LABEL_32;
    }
  }
  char v10 = v2->_destinationDirectory;
  id v11 = NSString;
  id v12 = [(NSURL *)v2->_baseDirectory lastPathComponent];
  objc_super v13 = [v11 stringWithFormat:@"VisualLocalization.%@", v12];
  uint64_t v14 = [(NSURL *)v10 URLByAppendingPathComponent:v13];
  unint64_t v15 = [v14 URLByAppendingPathExtension:@"tar.gz"];

  if (qword_26AC37588 == -1)
  {
    v16 = qword_26AC37580;
    if (!os_log_type_enabled((os_log_t)qword_26AC37580, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  dispatch_once(&qword_26AC37588, &__block_literal_global_69);
  v16 = qword_26AC37580;
  if (os_log_type_enabled((os_log_t)qword_26AC37580, OS_LOG_TYPE_INFO))
  {
LABEL_6:
    *(_DWORD *)buf = 138543362;
    id v56 = v15;
    _os_log_impl(&dword_21BAD2000, v16, OS_LOG_TYPE_INFO, "Writing trace archive to %{public}@", buf, 0xCu);
  }
LABEL_7:
  archive_write_new();
  archive_write_set_format_v7tar();
  archive_write_add_filter_gzip();
  uint64_t v43 = v15;
  id v17 = [v15 path];
  [v17 UTF8String];
  archive_write_open_filename();

  v18 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v19 = [(NSURL *)v2->_baseDirectory path];
  char v20 = [v18 subpathsAtPath:v19];

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v20;
  uint64_t v21 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v45 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v50 != v45) {
          objc_enumerationMutation(obj);
        }
        id v25 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        v26 = (void *)MEMORY[0x21D499780]();
        uint64_t v27 = v2;
        id v28 = [(NSURL *)v2->_baseDirectory URLByAppendingPathComponent:v25];
        unsigned __int8 v48 = 0;
        uint64_t v29 = [MEMORY[0x263F08850] defaultManager];
        v30 = [v28 path];
        int v31 = [v29 fileExistsAtPath:v30 isDirectory:&v48];
        int v32 = v48;

        if (v31) {
          BOOL v33 = v32 == 0;
        }
        else {
          BOOL v33 = 0;
        }
        if (v33)
        {
          id v47 = 0;
          v34 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v28 options:0 error:&v47];
          id v35 = v47;
          if (v34)
          {
            archive_entry_new();
            [v25 UTF8String];
            archive_entry_set_pathname();
            [v34 length];
            archive_entry_set_size();
            archive_entry_set_filetype();
            archive_entry_set_perm();
            archive_write_header();
            archive_entry_free();
            id v24 = v34;
            [v24 bytes];
            [v24 length];
            archive_write_data();
          }
          else if (qword_26AC37588 == -1)
          {
            id v36 = qword_26AC37580;
            if (os_log_type_enabled((os_log_t)qword_26AC37580, OS_LOG_TYPE_ERROR)) {
              goto LABEL_24;
            }
          }
          else
          {
            dispatch_once(&qword_26AC37588, &__block_literal_global_69);
            id v36 = qword_26AC37580;
            if (os_log_type_enabled((os_log_t)qword_26AC37580, OS_LOG_TYPE_ERROR))
            {
LABEL_24:
              *(_DWORD *)buf = 138543362;
              id v56 = v35;
              _os_log_impl(&dword_21BAD2000, v36, OS_LOG_TYPE_ERROR, "Failed to read data during archiving: %{public}@", buf, 0xCu);
            }
          }
        }
        v2 = v27;
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
    }
    while (v22);
  }

  archive_write_close();
  archive_write_free();
  id v37 = [MEMORY[0x263F08850] defaultManager];
  baseDirectory = v2->_baseDirectory;
  id v46 = 0;
  char v39 = [v37 removeItemAtURL:baseDirectory error:&v46];
  id v40 = v46;

  id v9 = v43;
  if (v39) {
    goto LABEL_31;
  }
  if (qword_26AC37588 != -1)
  {
    dispatch_once(&qword_26AC37588, &__block_literal_global_69);
    id v41 = qword_26AC37580;
    if (!os_log_type_enabled((os_log_t)qword_26AC37580, OS_LOG_TYPE_ERROR)) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  id v41 = qword_26AC37580;
  if (os_log_type_enabled((os_log_t)qword_26AC37580, OS_LOG_TYPE_ERROR))
  {
LABEL_30:
    *(_DWORD *)buf = 138543362;
    id v56 = v40;
    _os_log_impl(&dword_21BAD2000, v41, OS_LOG_TYPE_ERROR, "Error removing temporary directory: %{public}@", buf, 0xCu);
  }
LABEL_31:

LABEL_32:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultsDirectory, 0);
  objc_storeStrong((id *)&self->_parametersDirectory, 0);
  objc_storeStrong((id *)&self->_imagesDirectory, 0);
  objc_storeStrong((id *)&self->_baseDirectory, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_destinationDirectory, 0);
}

@end