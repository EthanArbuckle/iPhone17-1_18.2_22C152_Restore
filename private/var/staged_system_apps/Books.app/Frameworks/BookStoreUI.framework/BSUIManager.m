@interface BSUIManager
- (NSArray)registeredPackages;
- (id)filterRegistry;
- (id)imageResourceCache;
- (void)registerTemplateBundlesFromPackage:(id)a3;
- (void)setFilterRegistry:(id)a3;
- (void)setImageResourceCache:(id)a3;
- (void)setRegisteredPackages:(id)a3;
@end

@implementation BSUIManager

- (id)imageResourceCache
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_imageResourceCache)
  {
    id v3 = objc_alloc((Class)TUIImageResourceCache);
    v4 = [(BSUIManager *)v2 resourceLoader];
    v5 = [(BSUIManager *)v2 filterRegistry];
    v6 = BSUIBundle();
    v7 = (TUIImageResourceCache *)[v3 initWithLoader:v4 filters:v5 customImageBundle:v6];
    imageResourceCache = v2->_imageResourceCache;
    v2->_imageResourceCache = v7;
  }
  objc_sync_exit(v2);

  v9 = v2->_imageResourceCache;

  return v9;
}

- (id)filterRegistry
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_filterRegistry)
  {
    id v3 = (TUIFilterRegistry *)objc_alloc_init((Class)TUIFilterRegistry);
    filterRegistry = v2->_filterRegistry;
    v2->_filterRegistry = v3;

    v5 = +[BCCoverEffects sharedInstance];
    v6 = v2->_filterRegistry;
    v7 = [v5 templateImageFilters];
    [(TUIFilterRegistry *)v6 registerImageFilters:v7];

    v8 = v2->_filterRegistry;
    v9 = [v5 templateImageSetFilters];
    [(TUIFilterRegistry *)v8 registerImageSetFilters:v9];
  }
  objc_sync_exit(v2);

  v10 = v2->_filterRegistry;

  return v10;
}

- (void)registerTemplateBundlesFromPackage:(id)a3
{
  id v38 = a3;
  v4 = BCSignpostLaunch();
  os_signpost_id_t spid = os_signpost_id_generate(v4);

  v5 = BCSignpostLaunch();
  v6 = v5;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v6, OS_SIGNPOST_INTERVAL_BEGIN, spid, "Register Template Bundles", "", buf, 2u);
  }

  v7 = self;
  objc_sync_enter(v7);
  oslog = os_log_create("com.apple.iBooks", "BSUIManager");
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v8 = v7->_registeredPackages;
  id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v43 objects:v56 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v44;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v44 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        v13 = +[BSUITemplate factory];
        [v13 unregisterPackage:v12];
      }
      id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v43 objects:v56 count:16];
    }
    while (v9);
  }

  v14 = +[NSFileManager defaultManager];
  v15 = NSTemporaryDirectory();
  if (([v14 fileExistsAtPath:v15] & 1) == 0)
  {
    if (+[JSADevice isInternalBuild])
    {
      CFStringRef v54 = @"tempDir";
      v55 = v15;
      v34 = +[NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
      id v35 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:@"Temp dir does not exist. Why?" userInfo:v34];

      objc_exception_throw(v35);
    }
    id v42 = 0;
    unsigned int v16 = [v14 createDirectoryAtPath:v15 withIntermediateDirectories:1 attributes:0 error:&v42];
    id v17 = v42;
    if (v16)
    {
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR)) {
        sub_2DD0FC();
      }
    }
    else if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
    {
      sub_2DD170();
    }
  }
  uint64_t v18 = [v15 stringByAppendingPathComponent:@"templates.tpkg"];
  v19 = +[NSURL fileURLWithPath:v18];

  +[TUIBinaryPackage removeCacheForURL:v19];
  v20 = [v38 dataAtPath:@"templates.tpkg"];
  id v41 = 0;
  LOBYTE(v18) = [v20 writeToURL:v19 options:1 error:&v41];
  v36 = (__CFString *)v41;
  if ((v18 & 1) == 0)
  {
    v21 = oslog;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      CFStringRef v33 = (const __CFString *)[v20 length];
      *(_DWORD *)buf = 134218498;
      CFStringRef v49 = v33;
      __int16 v50 = 2114;
      v51 = v19;
      __int16 v52 = 2114;
      v53 = v36;
      _os_log_error_impl(&dword_0, v21, OS_LOG_TYPE_ERROR, "Failed to write data (%lu bytes) to disk at '%{public}@': %{public}@", buf, 0x20u);
    }
  }
  v22 = +[NSString stringWithFormat:@"jetpack:///"];
  v23 = +[NSURL URLWithString:v22];

  id v40 = 0;
  v24 = +[TUIBinaryPackage packageWithURL:v19 baseURL:v23 error:&v40];
  v25 = (__CFString *)v40;
  if (!v24 && os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138543874;
    CFStringRef v49 = v19;
    __int16 v50 = 2114;
    v51 = v23;
    __int16 v52 = 2114;
    v53 = v25;
    _os_log_fault_impl(&dword_0, oslog, OS_LOG_TYPE_FAULT, "Fatal: Failed to get a binary package at %{public}@ (%{public}@): %{public}@", buf, 0x20u);
  }
  v26 = +[BSUITemplate factory];
  [v26 registerPackage:v24];

  v47 = v24;
  uint64_t v27 = +[NSArray arrayWithObjects:&v47 count:1];
  registeredPackages = v7->_registeredPackages;
  v7->_registeredPackages = (NSArray *)v27;

  v29 = BSUITemplateLog();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = [v38 version];
    *(_DWORD *)buf = 138543874;
    CFStringRef v49 = @"templates.tpkg";
    __int16 v50 = 2114;
    v51 = v30;
    __int16 v52 = 2114;
    v53 = v23;
    _os_log_impl(&dword_0, v29, OS_LOG_TYPE_DEFAULT, "Registered %{public}@ from JetPack %{public}@ to TUITemplateFactory with baseURL=%{public}@", buf, 0x20u);
  }
  objc_sync_exit(v7);

  v31 = BCSignpostLaunch();
  v32 = v31;
  if (spid - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v31))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v32, OS_SIGNPOST_INTERVAL_END, spid, "Register Template Bundles", "", buf, 2u);
  }
}

- (void)setFilterRegistry:(id)a3
{
}

- (void)setImageResourceCache:(id)a3
{
}

- (NSArray)registeredPackages
{
  return self->_registeredPackages;
}

- (void)setRegisteredPackages:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredPackages, 0);
  objc_storeStrong((id *)&self->_imageResourceCache, 0);

  objc_storeStrong((id *)&self->_filterRegistry, 0);
}

@end