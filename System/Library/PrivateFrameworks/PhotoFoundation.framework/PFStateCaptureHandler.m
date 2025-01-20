@interface PFStateCaptureHandler
+ (id)stringFromDate:(id)a3;
+ (id)stringFromRelativeTimeInterval:(double)a3;
+ (id)stringFromTimestamp:(double)a3;
- (PFStateCaptureHandler)initWithProvider:(id)a3;
- (PFStateCaptureHandler)initWithProvider:(id)a3 name:(id)a4;
- (os_state_data_s)stateDataWithHints:(os_state_hints_s *)a3;
- (void)dealloc;
@end

@implementation PFStateCaptureHandler

uint64_t __47__PFStateCaptureHandler_initWithProvider_name___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = [WeakRetained stateDataWithHints:a2];
  }
  else
  {
    v7 = PFStateCaptureGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v10 = 138412290;
      uint64_t v11 = v8;
      _os_log_impl(&dword_1BC3A8000, v7, OS_LOG_TYPE_ERROR, "STATEDUMP: %@: PFStateCaptureHandler: strongSelf is nil", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v6 = 0;
  }

  return v6;
}

- (os_state_data_s)stateDataWithHints:(os_state_hints_s *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  ++self->_callCount;
  if (a3->var2 != 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
    uint64_t v11 = WeakRetained;
    if (!WeakRetained)
    {
      uint64_t v12 = PFStateCaptureGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id Property = objc_getProperty(self, v18, 56, 1);
        _os_log_impl(&dword_1BC3A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Unable to capture state because provider is nil", buf, 0xCu);
      }
      v9 = 0;
      goto LABEL_24;
    }
    uint64_t v12 = [WeakRetained stateCaptureDictionary];
    if (!v12)
    {
      v14 = PFStateCaptureGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id Property = objc_getProperty(self, v19, 56, 1);
        _os_log_impl(&dword_1BC3A8000, v14, OS_LOG_TYPE_INFO, "%{public}@: Returned nil state dictionary", buf, 0xCu);
      }
      v9 = 0;
      goto LABEL_23;
    }
    id v27 = 0;
    v13 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v12 format:200 options:0 error:&v27];
    v14 = v27;
    if (v13)
    {
      unsigned int v15 = [v13 length];
      v16 = (os_state_data_s *)malloc_type_calloc(1uLL, v15 + 200, 0xA31F2F17uLL);
      if (v16)
      {
        v9 = v16;
        v16->var0 = 1;
        v16->var1.var1 = v15;
        id v17 = [NSString stringWithFormat:@"%@ (%llu, %llu)", self->_name, self->_callCount, self->_ignoreCount];
        [v17 UTF8String];

        __strlcpy_chk();
        [v13 getBytes:v9->var4 length:v15];
LABEL_22:

LABEL_23:
LABEL_24:

        return v9;
      }
      v20 = PFStateCaptureGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        id v25 = objc_getProperty(self, v24, 56, 1);
        *(_DWORD *)buf = 138543618;
        id Property = v25;
        __int16 v30 = 2048;
        uint64_t v31 = v15 + 200;
        v23 = "%{public}@: Unable to allocate state buffer with size %zu";
        goto LABEL_20;
      }
    }
    else
    {
      v20 = PFStateCaptureGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        id v22 = objc_getProperty(self, v21, 56, 1);
        *(_DWORD *)buf = 138543618;
        id Property = v22;
        __int16 v30 = 2112;
        uint64_t v31 = (uint64_t)v14;
        v23 = "%{public}@: Unable to serialize state dictionary: %@";
LABEL_20:
        _os_log_impl(&dword_1BC3A8000, v20, OS_LOG_TYPE_ERROR, v23, buf, 0x16u);
      }
    }

    v9 = 0;
    goto LABEL_22;
  }
  v5 = PFStateCaptureGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v7 = objc_getProperty(self, v6, 56, 1);
    unsigned int var2 = a3->var2;
    *(_DWORD *)buf = 138543618;
    id Property = v7;
    __int16 v30 = 1024;
    LODWORD(v31) = var2;
    _os_log_impl(&dword_1BC3A8000, v5, OS_LOG_TYPE_INFO, "%{public}@: Ignoring state dump with API: %u", buf, 0x12u);
  }

  v9 = 0;
  ++self->_ignoreCount;
  return v9;
}

- (PFStateCaptureHandler)initWithProvider:(id)a3 name:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)PFStateCaptureHandler;
  uint64_t v8 = [(PFStateCaptureHandler *)&v25 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    uint64_t v11 = [[NSString alloc] initWithFormat:@"STATEDUMP: %@", v8->_name];
    logPrefix = v8->_logPrefix;
    v8->_logPrefix = (NSString *)v11;

    objc_storeWeak((id *)&v8->_provider, v6);
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.photos.PFStateCaptureHandler.stateHandlerQueue", v13);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v14;

    objc_initWeak(&location, v8);
    objc_copyWeak(&v23, &location);
    id v22 = v7;
    v8->_unint64_t stateHandle = os_state_add_handler();
    v16 = PFStateCaptureGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id Property = objc_getProperty(v8, v17, 56, 1);
      unint64_t stateHandle = v8->_stateHandle;
      *(_DWORD *)buf = 138543618;
      id v27 = Property;
      __int16 v28 = 2048;
      unint64_t v29 = stateHandle;
      _os_log_impl(&dword_1BC3A8000, v16, OS_LOG_TYPE_INFO, "%{public}@: Added state handler: %llu", buf, 0x16u);
    }

    v20 = v8;
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (PFStateCaptureHandler)initWithProvider:(id)a3
{
  v4 = (objc_class *)NSString;
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithFormat:@"%@-%p", objc_opt_class(), v5];
  id v7 = [(PFStateCaptureHandler *)self initWithProvider:v5 name:v6];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logPrefix, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_provider);
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = PFStateCaptureGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    if (self) {
      id Property = objc_getProperty(self, v4, 56, 1);
    }
    else {
      id Property = 0;
    }
    unint64_t stateHandle = self->_stateHandle;
    *(_DWORD *)buf = 138543618;
    id v9 = Property;
    __int16 v10 = 2048;
    unint64_t v11 = stateHandle;
    _os_log_impl(&dword_1BC3A8000, v3, OS_LOG_TYPE_DEBUG, "%{public}@: Removing state handler: %llu", buf, 0x16u);
  }

  if (self->_stateHandle) {
    os_state_remove_handler();
  }
  v7.receiver = self;
  v7.super_class = (Class)PFStateCaptureHandler;
  [(PFStateCaptureHandler *)&v7 dealloc];
}

+ (id)stringFromRelativeTimeInterval:(double)a3
{
  if (stringFromRelativeTimeInterval__sOnceToken != -1) {
    dispatch_once(&stringFromRelativeTimeInterval__sOnceToken, &__block_literal_global_4);
  }
  v4 = (void *)stringFromRelativeTimeInterval__sFormatter;
  return (id)[v4 localizedStringFromTimeInterval:a3];
}

uint64_t __56__PFStateCaptureHandler_stringFromRelativeTimeInterval___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28FE0]);
  v1 = (void *)stringFromRelativeTimeInterval__sFormatter;
  stringFromRelativeTimeInterval__sFormatter = (uint64_t)v0;

  [(id)stringFromRelativeTimeInterval__sFormatter setDateTimeStyle:0];
  v2 = (void *)stringFromRelativeTimeInterval__sFormatter;
  return [v2 setUnitsStyle:2];
}

+ (id)stringFromTimestamp:(double)a3
{
  v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a3];
  id v5 = [a1 stringFromDate:v4];

  return v5;
}

+ (id)stringFromDate:(id)a3
{
  uint64_t v3 = stringFromDate__sOnceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&stringFromDate__sOnceToken, &__block_literal_global_160);
  }
  id v5 = [(id)stringFromDate__sDateFormatter stringFromDate:v4];

  return v5;
}

uint64_t __40__PFStateCaptureHandler_stringFromDate___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28D48]);
  v1 = (void *)stringFromDate__sDateFormatter;
  stringFromDate__sDateFormatter = (uint64_t)v0;

  v2 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  [(id)stringFromDate__sDateFormatter setTimeZone:v2];

  uint64_t v3 = (void *)stringFromDate__sDateFormatter;
  return [v3 setFormatOptions:4083];
}

@end