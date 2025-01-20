id STStorageDeviceKey()
{
  void *v0;
  uint64_t vars8;

  if (STStorageDeviceKey_onceToken != -1) {
    dispatch_once(&STStorageDeviceKey_onceToken, &__block_literal_global);
  }
  v0 = (void *)STStorageDeviceKey_deviceKey;

  return v0;
}

void __STStorageDeviceKey_block_invoke()
{
  id v3 = (id)MGCopyAnswer();
  unsigned int v0 = [v3 intValue] - 1;
  if (v0 > 2) {
    v1 = @"OTHER";
  }
  else {
    v1 = off_2643022F0[v0];
  }
  v2 = (void *)STStorageDeviceKey_deviceKey;
  STStorageDeviceKey_deviceKey = (uint64_t)v1;
}

id STColorForCategoryKey(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (STColorForCategoryKey_onceToken == -1)
  {
    if (v1) {
      goto LABEL_3;
    }
  }
  else
  {
    dispatch_once(&STColorForCategoryKey_onceToken, &__block_literal_global_0);
    if (v2)
    {
LABEL_3:
      id v3 = [(id)STColorForCategoryKey_gCategoryColors objectForKeyedSubscript:v2];
      if (v3) {
        goto LABEL_5;
      }
    }
  }
  id v3 = [MEMORY[0x263F1C550] redColor];
LABEL_5:

  return v3;
}

void __STColorForCategoryKey_block_invoke()
{
  v11[8] = *MEMORY[0x263EF8340];
  v10[0] = *MEMORY[0x263F7B018];
  unsigned int v0 = [MEMORY[0x263F1C550] systemPinkColor];
  v11[0] = v0;
  v10[1] = *MEMORY[0x263F7B048];
  id v1 = [MEMORY[0x263F1C550] systemYellowColor];
  v11[1] = v1;
  v10[2] = *MEMORY[0x263F7B040];
  v2 = [MEMORY[0x263F1C550] systemGreenColor];
  v11[2] = v2;
  v10[3] = *MEMORY[0x263F7B020];
  id v3 = [MEMORY[0x263F1C550] systemOrangeColor];
  v11[3] = v3;
  v10[4] = *MEMORY[0x263F7B038];
  v4 = [MEMORY[0x263F1C550] systemPurpleColor];
  v11[4] = v4;
  v10[5] = *MEMORY[0x263F7B030];
  v5 = [MEMORY[0x263F1C550] systemBlueColor];
  v11[5] = v5;
  v10[6] = *MEMORY[0x263F7B028];
  v6 = [MEMORY[0x263F1C550] systemTealColor];
  v11[6] = v6;
  v10[7] = *MEMORY[0x263F7B050];
  v7 = [MEMORY[0x263F1C550] systemDarkMidGrayColor];
  v11[7] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:8];
  v9 = (void *)STColorForCategoryKey_gCategoryColors;
  STColorForCategoryKey_gCategoryColors = v8;
}

id STColorForCategory()
{
  unsigned int v0 = STKeyForCategory();
  id v1 = STColorForCategoryKey(v0);

  return v1;
}

uint64_t __LastUsedFormatString_block_invoke()
{
  LastUsedFormatString__lastUsedFormat = STFrameworkLocStr(@"ST_LAST_USED_FMT %@");

  return MEMORY[0x270F9A758]();
}

void STLoadHeaderIconForAppID(void *a1, void *a2)
{
  id v3 = a2;
  id v5 = a1;
  char IsClip = AppIsClip(v5);
  _STLoadHeaderIconForAppID(v5, v3, IsClip);
}

void _STLoadHeaderIconForAppID(void *a1, void *a2, char a3)
{
  id v5 = a1;
  v6 = a2;
  if (_STLoadHeaderIconForAppID_onceToken != -1) {
    dispatch_once(&_STLoadHeaderIconForAppID_onceToken, &__block_literal_global_2);
  }
  uint64_t v7 = _CachedIconForAppID((void *)_gHeaderIconsByID, v5);
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v6[2](v6, v7);
  }
  else
  {
    if (_gTableIconsByID)
    {
      uint64_t v8 = _CachedIconForAppID((void *)_gTableIconsByID, v5);
      if (v8) {
        v6[2](v6, (uint64_t)v8);
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
    v9 = getIconLoaderQueue();
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = ___STLoadHeaderIconForAppID_block_invoke_2;
    v10[3] = &unk_2643023F0;
    id v11 = v5;
    char v13 = a3;
    v12 = v6;
    [v9 addOperationWithBlock:v10];
  }
}

BOOL AppIsClip(void *a1)
{
  id v1 = (objc_class *)MEMORY[0x263F01878];
  id v2 = a1;
  id v3 = (void *)[[v1 alloc] initWithBundleIdentifier:v2 allowPlaceholder:1 error:0];

  v4 = [v3 appClipMetadata];
  BOOL v5 = v4 != 0;

  return v5;
}

void STLoadHeaderIconForApp(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v6 = [v4 appIdentifier];
  char v5 = [v4 isAppClip];

  _STLoadHeaderIconForAppID(v6, v3, v5);
}

void STLoadTableIconForAppID(void *a1, void *a2)
{
  id v3 = a2;
  id v5 = a1;
  char IsClip = AppIsClip(v5);
  _STLoadTableIconForAppID(v5, v3, IsClip);
}

void _STLoadTableIconForAppID(void *a1, void *a2, char a3)
{
  id v5 = a1;
  id v6 = a2;
  if (_STLoadTableIconForAppID_onceToken != -1) {
    dispatch_once(&_STLoadTableIconForAppID_onceToken, &__block_literal_global_47);
  }
  uint64_t v7 = _CachedIconForAppID((void *)_gTableIconsByID, v5);
  if (v7)
  {
    v6[2](v6, v7);
  }
  else
  {
    uint64_t v8 = getIconLoaderQueue();
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ___STLoadTableIconForAppID_block_invoke_2;
    v9[3] = &unk_2643023F0;
    id v10 = v5;
    char v12 = a3;
    id v11 = v6;
    [v8 addOperationWithBlock:v9];
  }
}

void STLoadTableIconForApp(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v6 = [v4 appIdentifier];
  char v5 = [v4 isAppClip];

  _STLoadTableIconForAppID(v6, v3, v5);
}

id _CachedIconForAppID(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v4 length])
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_iconsLock);
    char v5 = [v3 objectForKey:v4];
    os_unfair_lock_unlock((os_unfair_lock_t)&_iconsLock);
  }
  else
  {
    char v5 = PSBlankIconImage();
  }

  return v5;
}

id getIconLoaderQueue()
{
  if (getIconLoaderQueue_onceToken != -1) {
    dispatch_once(&getIconLoaderQueue_onceToken, &__block_literal_global_2);
  }
  unsigned int v0 = (void *)getIconLoaderQueue__iconLoaderQueue;

  return v0;
}

id _LoadIconForAppID(void *a1, void *a2, int a3, int a4)
{
  id v7 = a1;
  id v8 = a2;
  if (![v8 hasPrefix:@"com.apple."]) {
    goto LABEL_11;
  }
  if ([v8 isEqualToString:*MEMORY[0x263F7B058]])
  {
    v9 = @"Calendar";
LABEL_9:
    uint64_t v10 = STFrameworkImage(v9);
    goto LABEL_10;
  }
  if ([v8 isEqualToString:@"com.apple.VideosUsage"])
  {
    v9 = @"Videos";
    goto LABEL_9;
  }
  if (([v8 isEqualToString:*MEMORY[0x263F7B070]] & 1) != 0
    || [v8 isEqualToString:*MEMORY[0x263F7B068]])
  {
    v9 = @"iCloudDriveIcon";
    goto LABEL_9;
  }
  if ([v8 isEqualToString:*MEMORY[0x263F7B078]])
  {
    v23 = [MEMORY[0x263F1D920] _typeOfCurrentDevice];
    v24 = [v23 identifier];
    uint64_t v42 = 0;
    v25 = [MEMORY[0x263F4B560] symbolForTypeIdentifier:v24 error:&v42];
    v26 = (void *)MEMORY[0x263F1C6B0];
    v27 = [v25 name];
    id v11 = [v26 systemImageNamed:v27];

    if (!v11)
    {
      int v28 = MGGetSInt32Answer();
      v29 = [MEMORY[0x263F1C5C0] currentDevice];
      uint64_t v30 = [v29 userInterfaceIdiom];

      v31 = @"LocalStorageOldPhoneIcon";
      if (v28 == 2) {
        v31 = @"LocalStoragePhoneIcon";
      }
      v32 = @"LocalStoragePadIcon";
      if (v28 != 2) {
        v32 = @"LocalStorageOldPadIcon";
      }
      if (v30 == 1) {
        v31 = v32;
      }
      v33 = v31;
      STFrameworkImage(v33);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (v11) {
      goto LABEL_23;
    }
  }
  else
  {
    if ([v8 isEqualToString:@"com.apple.ToneSettingsUsage"])
    {
      uint64_t v10 = [MEMORY[0x263F1C6B0] systemImageNamed:@"speaker.wave.2.circle.fill"];
LABEL_10:
      id v11 = (id)v10;
      if (!v10) {
        goto LABEL_11;
      }
LABEL_23:
      os_unfair_lock_lock((os_unfair_lock_t)&_iconsLock);
      [v7 setObject:v11 forKey:v8];
      os_unfair_lock_unlock((os_unfair_lock_t)&_iconsLock);
      goto LABEL_24;
    }
    if ([v8 isEqualToString:*MEMORY[0x263F7B080]])
    {
      id v34 = (id)*MEMORY[0x263F7B060];

      id v8 = v34;
    }
  }
LABEL_11:
  ScreenScale();
  if (a3) {
    double v12 = 58.0;
  }
  else {
    double v12 = 29.0;
  }
  id v13 = objc_alloc(MEMORY[0x263F4B558]);
  ScreenScale();
  v15 = objc_msgSend(v13, "initWithSize:scale:", v12, v12, v14);
  v16 = v15;
  if (a4) {
    uint64_t v17 = 5;
  }
  else {
    uint64_t v17 = 0;
  }
  [v15 setShape:v17];
  [v16 setDrawBorder:1];
  v18 = (void *)[objc_alloc(MEMORY[0x263F4B540]) initWithBundleIdentifier:v8];
  if (v18
    || ([MEMORY[0x263F4B540] genericApplicationIcon],
        (v18 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x2020000000;
    uint64_t v41 = 0;
    dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = ___LoadIconForAppID_block_invoke;
    v35[3] = &unk_264302418;
    v37 = &v38;
    v20 = v19;
    v36 = v20;
    [v18 getCGImageForImageDescriptor:v16 completion:v35];
    dispatch_time_t v21 = dispatch_time(0, 10000000000);
    dispatch_semaphore_wait(v20, v21);
    if (v39[3])
    {
      objc_msgSend(MEMORY[0x263F1C6B0], "imageWithCGImage:");
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      CGImageRelease((CGImageRef)v39[3]);
    }
    else
    {
      id v11 = 0;
    }

    _Block_object_dispose(&v38, 8);
    if (!v11) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }

  id v11 = 0;
LABEL_24:

  return v11;
}

void sub_21811085C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __getIconLoaderQueue_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A48]);
  id v1 = (void *)getIconLoaderQueue__iconLoaderQueue;
  getIconLoaderQueue__iconLoaderQueue = (uint64_t)v0;

  [(id)getIconLoaderQueue__iconLoaderQueue setMaxConcurrentOperationCount:3];
  id v2 = (void *)getIconLoaderQueue__iconLoaderQueue;

  return [v2 setQualityOfService:25];
}

id STFrameworkLocStr(void *a1)
{
  id v1 = a1;
  id v2 = _FrameworkBundle();
  id v3 = [v2 localizedStringForKey:v1 value:v1 table:0];

  return v3;
}

id _FrameworkBundle()
{
  if (_FrameworkBundle_onceToken != -1) {
    dispatch_once(&_FrameworkBundle_onceToken, &__block_literal_global_3);
  }
  id v0 = (void *)_FrameworkBundle_bundle;

  return v0;
}

id STFrameworkImage(void *a1)
{
  id v1 = (void *)MEMORY[0x263F1C6B0];
  id v2 = a1;
  id v3 = _FrameworkBundle();
  id v4 = [v1 imageNamed:v2 inBundle:v3];

  return v4;
}

uint64_t __PercentString_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A30]);
  id v1 = (void *)PercentString__formatter;
  PercentString__formatter = (uint64_t)v0;

  id v2 = (void *)PercentString__formatter;

  return [v2 setNumberStyle:3];
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x270EE6908](image);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

uint64_t PSBlankIconImage()
{
  return MEMORY[0x270F551E0]();
}

uint64_t STFormattedShortDate()
{
  return MEMORY[0x270F78DE8]();
}

uint64_t STFormattedSize()
{
  return MEMORY[0x270F78DF0]();
}

uint64_t STKeyForCategory()
{
  return MEMORY[0x270F78DF8]();
}

uint64_t STSharedConcurrentQueue()
{
  return MEMORY[0x270F78E00]();
}

uint64_t ScreenScale()
{
  return MEMORY[0x270F55380]();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x270F05FC8](category);
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F06030]();
}

void UIGraphicsPopContext(void)
{
}

void UIGraphicsPushContext(CGContextRef context)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x270EF2C98](commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}