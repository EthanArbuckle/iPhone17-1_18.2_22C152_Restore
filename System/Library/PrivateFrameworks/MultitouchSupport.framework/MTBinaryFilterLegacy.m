@interface MTBinaryFilterLegacy
- (MTBinaryFilterLegacy)initWithInfo:(id)a3;
- (NSURL)bundleURL;
- (_MTBinaryFilter)legacyFilter;
- (id)cfBundle;
- (id)initFromURL:(id)a3 device:(__MTDevice *)a4;
- (id)mtDevice;
- (unsigned)maxFrameSize;
- (void)createBinaryFilter;
- (void)dealloc;
- (void)filterFrame:(char *)a3 size:(unsigned int *)a4 maxSize:(unsigned int *)a5 extraFrame:(id)a6;
- (void)reset;
- (void)setBundleURL:(id)a3;
- (void)setCfBundle:(id)a3;
- (void)setCreateBinaryFilter:(void *)a3;
- (void)setLegacyFilter:(_MTBinaryFilter *)a3;
- (void)setMtDevice:(id)a3;
@end

@implementation MTBinaryFilterLegacy

- (id)initFromURL:(id)a3 device:(__MTDevice *)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  CFURLRef v10 = (const __CFURL *)a3;
  v28.receiver = self;
  v28.super_class = (Class)MTBinaryFilterLegacy;
  v11 = [(MTBinaryFilterLegacy *)&v28 init];
  v12 = v11;
  if (!v11) {
    goto LABEL_18;
  }
  objc_storeStrong((id *)&v11->_bundleURL, a3);
  CFBundleRef v13 = CFBundleCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v10);
  id cfBundle = v12->_cfBundle;
  v12->_id cfBundle = v13;

  if (!v12->_cfBundle)
  {
    if (a4)
    {
      if (a4->var37) {
        mt_CachePropertiesForDevice((uint64_t)a4);
      }
      v17 = MTLoggingFramework();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      unint64_t var13 = a4->var13;
      *(_DWORD *)buf = 138543618;
      v30 = (const char *)v10;
      __int16 v31 = 2048;
      unint64_t v32 = var13;
      v19 = "Could not create bundle %{public}@ (deviceID 0x%llX)";
      v20 = v17;
      uint32_t v21 = 22;
      goto LABEL_16;
    }
    v24 = MTLoggingFramework();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v30 = (const char *)v10;
      v25 = "Could not create bundle %{public}@";
      v26 = v24;
      uint32_t v27 = 12;
LABEL_24:
      _os_log_impl(&dword_2262CF000, v26, OS_LOG_TYPE_ERROR, v25, buf, v27);
    }
LABEL_25:

    goto LABEL_18;
  }
  objc_storeWeak(&v12->_mtDevice, a4);
  FunctionPointerForName = CFBundleGetFunctionPointerForName((CFBundleRef)v12->_cfBundle, @"MTCreateBinaryFilter");
  v12->_createBinaryFilter = FunctionPointerForName;
  if (!FunctionPointerForName)
  {
    if (a4)
    {
      if (a4->var37) {
        mt_CachePropertiesForDevice((uint64_t)a4);
      }
      v17 = MTLoggingFramework();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      unint64_t v22 = a4->var13;
      *(_DWORD *)buf = 136446722;
      v30 = "MTCreateBinaryFilter";
      __int16 v31 = 2114;
      unint64_t v32 = (unint64_t)v10;
      __int16 v33 = 2048;
      unint64_t v34 = v22;
      v19 = "Did not find function pointer %{public}s in bundle %{public}@ (deviceID 0x%llX)";
      v20 = v17;
      uint32_t v21 = 32;
LABEL_16:
      _os_log_impl(&dword_2262CF000, v20, OS_LOG_TYPE_ERROR, v19, buf, v21);
LABEL_17:

      goto LABEL_18;
    }
    v24 = MTLoggingFramework();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v30 = "MTCreateBinaryFilter";
      __int16 v31 = 2114;
      unint64_t v32 = (unint64_t)v10;
      v25 = "Did not find function pointer %{public}s in bundle %{public}@";
      v26 = v24;
      uint32_t v27 = 22;
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  [(MTBinaryFilterLegacy *)v12 reset];
  if (!v12->_legacyFilter)
  {
LABEL_18:
    v16 = 0;
    goto LABEL_19;
  }
  v16 = v12;
LABEL_19:

  return v16;
}

- (MTBinaryFilterLegacy)initWithInfo:(id)a3
{
  return 0;
}

- (void)filterFrame:(char *)a3 size:(unsigned int *)a4 maxSize:(unsigned int *)a5 extraFrame:(id)a6
{
  a6;
  legacyFilter = self->_legacyFilter;
  if (legacyFilter)
  {
    v11 = *a3;
    ((void (*)(_MTBinaryFilter *, char **, unsigned int *, void))legacyFilter->var1)(legacyFilter, a3, a4, *a5);
    if (*a3 != v11) {
      *a5 = *a4;
    }
  }
  MEMORY[0x270F9A758]();
}

- (void)reset
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  legacyFilter = self->_legacyFilter;
  if (legacyFilter) {
    ((void (*)(_MTBinaryFilter *, SEL))legacyFilter->var2)(self->_legacyFilter, a2);
  }
  id WeakRetained = objc_loadWeakRetained(&self->_mtDevice);

  v5 = (_MTBinaryFilter *)((uint64_t (*)(void))self->_createBinaryFilter)();
  self->_legacyFilter = v5;
  if (!v5)
  {
    if (WeakRetained)
    {
      if (*((unsigned char *)WeakRetained + 133)) {
        mt_CachePropertiesForDevice((uint64_t)WeakRetained);
      }
      v6 = MTLoggingFramework();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      bundleURL = self->_bundleURL;
      uint64_t v14 = *((void *)WeakRetained + 8);
      *(_DWORD *)buf = 138543618;
      *(void *)v36 = bundleURL;
      *(_WORD *)&v36[8] = 2048;
      *(void *)&v36[10] = v14;
      v9 = "Could not create binary filter from bundle %{public}@ (deviceID 0x%llX)";
      CFURLRef v10 = buf;
      v11 = v6;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      goto LABEL_16;
    }
    uint32_t v21 = MTLoggingFramework();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_33;
    }
    unint64_t v22 = self->_bundleURL;
    *(_DWORD *)buf = 138543362;
    *(void *)v36 = v22;
    v23 = "Could not create binary filter from bundle %{public}@";
    v24 = buf;
    v25 = v21;
    os_log_type_t v26 = OS_LOG_TYPE_ERROR;
    goto LABEL_32;
  }
  int v30 = -1431655766;
  MTDeviceGetFamilyID((uint64_t)WeakRetained, &v30);
  *(_DWORD *)buf = v30;
  *(_DWORD *)v36 = MTDeviceGetDriverMaxPacketSize((uint64_t)WeakRetained);
  *(void *)&v36[4] = WeakRetained;
  *(void *)&v36[12] = 0;
  unsigned int v29 = *(_DWORD *)v36;
  if ((((uint64_t (*)(void))self->_legacyFilter->var0)() & 1) == 0)
  {
    if (WeakRetained)
    {
      if (*((unsigned char *)WeakRetained + 133)) {
        mt_CachePropertiesForDevice((uint64_t)WeakRetained);
      }
      v15 = MTLoggingFramework();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      v16 = self->_bundleURL;
      uint64_t v17 = *((void *)WeakRetained + 8);
      *(_DWORD *)__int16 v31 = 138543618;
      unint64_t v32 = v16;
      __int16 v33 = 2048;
      uint64_t v34 = v17;
      v18 = "Could not initialize binary filter from bundle %{public}@ (deviceID 0x%llX)";
      v19 = v15;
      uint32_t v20 = 22;
    }
    else
    {
      v15 = MTLoggingFramework();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      uint32_t v27 = self->_bundleURL;
      *(_DWORD *)__int16 v31 = 138543362;
      unint64_t v32 = v27;
      v18 = "Could not initialize binary filter from bundle %{public}@";
      v19 = v15;
      uint32_t v20 = 12;
    }
    _os_log_impl(&dword_2262CF000, v19, OS_LOG_TYPE_ERROR, v18, v31, v20);
LABEL_24:

    ((void (*)(void))self->_legacyFilter->var2)();
    self->_legacyFilter = 0;
    return;
  }
  self->_maxFrameSize = v29;
  if (legacyFilter)
  {
    if (WeakRetained)
    {
      if (*((unsigned char *)WeakRetained + 133)) {
        mt_CachePropertiesForDevice((uint64_t)WeakRetained);
      }
      v6 = MTLoggingFramework();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_17;
      }
      v7 = self->_bundleURL;
      uint64_t v8 = *((void *)WeakRetained + 8);
      *(_DWORD *)__int16 v31 = 138543618;
      unint64_t v32 = v7;
      __int16 v33 = 2048;
      uint64_t v34 = v8;
      v9 = "Reloaded binary filter from bundle %{public}@ (deviceID 0x%llX)";
      CFURLRef v10 = v31;
      v11 = v6;
      os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
LABEL_16:
      _os_log_impl(&dword_2262CF000, v11, v12, v9, v10, 0x16u);
LABEL_17:

      return;
    }
    uint32_t v21 = MTLoggingFramework();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_33;
    }
    objc_super v28 = self->_bundleURL;
    *(_DWORD *)__int16 v31 = 138543362;
    unint64_t v32 = v28;
    v23 = "Reloaded binary filter from bundle %{public}@";
    v24 = v31;
    v25 = v21;
    os_log_type_t v26 = OS_LOG_TYPE_DEBUG;
LABEL_32:
    _os_log_impl(&dword_2262CF000, v25, v26, v23, v24, 0xCu);
LABEL_33:
  }
}

- (void)dealloc
{
  legacyFilter = self->_legacyFilter;
  if (legacyFilter) {
    ((void (*)(_MTBinaryFilter *, SEL))legacyFilter->var2)(legacyFilter, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)MTBinaryFilterLegacy;
  [(MTBinaryFilterLegacy *)&v4 dealloc];
}

- (unsigned)maxFrameSize
{
  return self->_maxFrameSize;
}

- (_MTBinaryFilter)legacyFilter
{
  return self->_legacyFilter;
}

- (void)setLegacyFilter:(_MTBinaryFilter *)a3
{
  self->_legacyFilter = a3;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (void)setBundleURL:(id)a3
{
}

- (id)cfBundle
{
  return self->_cfBundle;
}

- (void)setCfBundle:(id)a3
{
}

- (id)mtDevice
{
  id WeakRetained = objc_loadWeakRetained(&self->_mtDevice);
  return WeakRetained;
}

- (void)setMtDevice:(id)a3
{
}

- (void)createBinaryFilter
{
  return self->_createBinaryFilter;
}

- (void)setCreateBinaryFilter:(void *)a3
{
  self->_createBinaryFilter = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_mtDevice);
  objc_storeStrong(&self->_cfBundle, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
}

@end