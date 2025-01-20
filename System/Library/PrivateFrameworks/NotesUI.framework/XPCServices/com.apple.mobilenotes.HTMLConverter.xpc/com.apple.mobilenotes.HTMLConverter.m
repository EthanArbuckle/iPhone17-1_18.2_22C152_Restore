int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  id v11;
  int v12;
  int *v13;
  char *v14;
  id v15;
  int v16;
  int *v17;
  char *v18;
  void *v19;
  void *v20;
  id v22;
  id v23;

  v3 = ICNotesAppBundleIdentifier();
  v23 = 0;
  v4 = +[LSBundleRecord bundleRecordWithApplicationIdentifier:v3 error:&v23];
  v5 = v23;

  if (v5) {
  v6 = [v4 dataContainerURL];
  }
  v7 = [v6 URLByAppendingPathComponent:@"tmp" isDirectory:1];
  if (!v7)
  {
    v10 = 0;
    if (!v6) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  v8 = +[NSFileManager defaultManager];
  v22 = 0;
  v9 = [v8 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:&v22];
  v10 = v22;

  if ((v9 & 1) == 0) {
    NSLog(@"Error creating temporary directory: %@", v10);
  }
  if (v6)
  {
LABEL_9:
    v11 = [v6 path];
    v12 = setenv("HOME", (const char *)[v11 fileSystemRepresentation], 1);

    if (v12)
    {
      v13 = __error();
      v14 = strerror(*v13);
      NSLog(@"setenv HOME %@ failed because %s", v6, v14);
    }
  }
LABEL_11:
  if (v7)
  {
    v15 = [v7 path];
    v16 = setenv("TMPDIR", (const char *)[v15 fileSystemRepresentation], 1);

    if (v16)
    {
      v17 = __error();
      v18 = strerror(*v17);
      NSLog(@"setenv TMPDIR %@ failed because %s", v7, v18);
    }
  }
  v19 = objc_opt_new();
  v20 = +[NSXPCListener serviceListener];
  [v20 setDelegate:v19];
  [v20 resume];

  return 0;
}

void sub_100002CC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100002CE4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100002CF4(uint64_t a1)
{
}

void sub_100002CFC(uint64_t a1)
{
  id v3 = objc_alloc_init((Class)WebPreferences);
  [v3 setDefaultFontSize:12];
  [v3 setDefaultFixedFontSize:12];
  [v3 setUserStyleSheetEnabled:0];
  [v3 setJavaEnabled:0];
  [v3 setJavaScriptEnabled:0];
  [v3 setJavaScriptCanOpenWindowsAutomatically:0];
  [v3 setPlugInsEnabled:0];
  [v3 setAllowsAnimatedImages:0];
  [v3 setAllowsAnimatedImageLooping:0];
  [v3 setLoadsImagesAutomatically:0];
  [v3 setAutosaves:0];
  [v3 setUsesPageCache:0];
  [v3 setStorageTrackerEnabled:0];
  [v3 setOfflineWebApplicationCacheEnabled:0];
  [v3 setLocalStorageEnabled:0];
  [v3 setDatabasesEnabled:0];
  [v3 setWebAudioEnabled:0];
  [v3 setAcceleratedDrawingEnabled:0];
  [v3 setAcceleratedCompositingEnabled:0];
  [v3 setCanvasUsesAcceleratedDrawing:0];
  [v3 setRequestAnimationFrameEnabled:0];
  [v3 setCacheModel:0];
  [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:@"WebPreferences"];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:@"BaseURL"];
  }
  id v5 = objc_alloc((Class)NSAttributedString);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(*(void *)(a1 + 72) + 8);
  id obj = *(id *)(v8 + 40);
  id v9 = [v5 initWithData:v6 options:v7 documentAttributes:0 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  if (*(void *)(a1 + 56))
  {
    id v12 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
    [v12 encodeObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) forKey:NSKeyedArchiveRootObjectKey];
    v13 = [v12 encodedData];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t ICNotesAppBundleIdentifier()
{
  return _ICNotesAppBundleIdentifier();
}

void NSLog(NSString *format, ...)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return _setenv(__name, __value, __overwrite);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_dataContainerURL(void *a1, const char *a2, ...)
{
  return [a1 dataContainerURL];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return [a1 encodedData];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}