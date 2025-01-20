@interface UIKeyboardCache
+ (BOOL)enabled;
+ (BOOL)enabledForTraitCollection:(id)a3;
+ (id)sharedInstance;
- (CGImage)cachedCompositeImageForCacheKeys:(id)a3 fromLayout:(id)a4 opacities:(id)a5;
- (CGImage)cachedImageForKey:(id)a3 fromLayout:(id)a4;
- (CGImage)cachedImageForKey:(id)a3 fromLayout:(id)a4 traitCollection:(id)a5;
- (UIKeyboardCache)init;
- (_UIActionWhenIdle)idleAction;
- (id)displayImagesForView:(id)a3 fromLayout:(id)a4 imageFlags:(id)a5;
- (id)uniqueLayoutsFromInputModes:(id)a3;
- (void)_didIdle;
- (void)_didIdleAndShouldWait;
- (void)clearNonPersistentCache;
- (void)commitTransaction;
- (void)dealloc;
- (void)decrementExpectedRender:(id)a3;
- (void)drawCachedImage:(id)a3 alpha:(double)a4 inContext:(CGContext *)a5;
- (void)incrementExpectedRender:(id)a3;
- (void)purge;
- (void)setIdleAction:(id)a3;
- (void)updateCacheForInputModes:(id)a3;
@end

@implementation UIKeyboardCache

+ (id)sharedInstance
{
  v2 = (void *)__cache;
  if (!__cache)
  {
    v3 = objc_alloc_init(UIKeyboardCache);
    v4 = (void *)__cache;
    __cache = (uint64_t)v3;

    v2 = (void *)__cache;
  }
  return v2;
}

+ (BOOL)enabled
{
  if (pthread_main_np() != 1)
  {
    if (os_variant_has_internal_diagnostics())
    {
      v8 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v8, OS_LOG_TYPE_FAULT, "Unsupported use of +[UIKeyboardCache enabled] off the main thread", buf, 2u);
      }
    }
    else
    {
      v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &enabled___s_category) + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Unsupported use of +[UIKeyboardCache enabled] off the main thread", v9, 2u);
      }
    }
  }
  v3 = +[UIKeyboard activeKeyboard];
  v4 = [v3 traitCollection];
  char v5 = [a1 enabledForTraitCollection:v4];

  return v5;
}

+ (BOOL)enabledForTraitCollection:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3 && [v3 userInterfaceIdiom] == 3)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    if (TIGetKeyboardCachingDisabledValue_onceToken != -1) {
      dispatch_once(&TIGetKeyboardCachingDisabledValue_onceToken, &__block_literal_global_331);
    }
    v6 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
    v7 = [v6 valueForPreferenceKey:@"KeyboardCachingDisabled"];

    int v5 = [v7 BOOLValue] ^ 1;
  }

  return v5;
}

- (UIKeyboardCache)init
{
  v10.receiver = self;
  v10.super_class = (Class)UIKeyboardCache;
  v2 = [(UIKeyboardCache *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4FAE2C0]) initWithLocalAccess:1];
    store = v2->_store;
    v2->_store = (TIImageCacheClient *)v3;

    if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UIKeyboardCachingLockOnRead, @"UIKeyboardCachingLockOnRead") & 1) == 0&& byte_1EB257694)
    {
      -[TIImageCacheClient setLockOnRead:](v2->_store, "setLockOnRead:", [(id)UIApp launchedToTest]);
    }
    [(TIImageCacheClient *)v2->_store setCacheItemLimit:80];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)AXSSensitiveSettingChanged, (CFStringRef)*MEMORY[0x1E4FB9128], 0, (CFNotificationSuspensionBehavior)0);
    v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v6, v2, (CFNotificationCallback)AXSSensitiveSettingChanged, (CFStringRef)*MEMORY[0x1E4FB9118], 0, (CFNotificationSuspensionBehavior)0);
    if ([(id)UIApp launchedToTest])
    {
      v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      activeRenderers = v2->_activeRenderers;
      v2->_activeRenderers = v7;
    }
  }
  return v2;
}

- (void)dealloc
{
  idleAction = self->_idleAction;
  self->_idleAction = 0;

  activeRenderers = self->_activeRenderers;
  self->_activeRenderers = 0;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E4FB9128], 0);
  store = self->_store;
  self->_store = 0;

  layouts = self->_layouts;
  self->_layouts = 0;

  v8.receiver = self;
  v8.super_class = (Class)UIKeyboardCache;
  [(UIKeyboardCache *)&v8 dealloc];
}

- (void)commitTransaction
{
}

- (void)clearNonPersistentCache
{
}

- (void)purge
{
}

- (CGImage)cachedImageForKey:(id)a3 fromLayout:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (pthread_main_np() != 1)
  {
    if (os_variant_has_internal_diagnostics())
    {
      v13 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v13, OS_LOG_TYPE_FAULT, "Unsupported use of -[UIKeyboardCache cachedImageForKey:fromLayout:] off the main thread", buf, 2u);
      }
    }
    else
    {
      v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &cachedImageForKey_fromLayout____s_category) + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "Unsupported use of -[UIKeyboardCache cachedImageForKey:fromLayout:] off the main thread", v14, 2u);
      }
    }
  }
  objc_super v8 = +[UIKeyboard activeKeyboard];
  v9 = [v8 traitCollection];
  objc_super v10 = [(UIKeyboardCache *)self cachedImageForKey:v7 fromLayout:v6 traitCollection:v9];

  return v10;
}

- (CGImage)cachedImageForKey:(id)a3 fromLayout:(id)a4 traitCollection:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8
    && +[UIKeyboardCache enabledForTraitCollection:v10])
  {
    v11 = self;
    objc_sync_enter(v11);
    v12 = (CGImage *)[(TIImageCacheClient *)v11->_store copyImageForKey:v8 inGroup:v9];
    objc_sync_exit(v11);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (CGImage)cachedCompositeImageForCacheKeys:(id)a3 fromLayout:(id)a4 opacities:(id)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![v8 count] || !+[UIKeyboardCache enabled](UIKeyboardCache, "enabled"))
  {
    CGImageRef Image = 0;
    goto LABEL_36;
  }
  v50 = v10;
  v11 = [MEMORY[0x1E4F28E78] string];
  uint64_t v12 = [v8 count];
  if (v12)
  {
    uint64_t v13 = v12;
    for (uint64_t i = 0; i != v13; ++i)
    {
      v15 = [v8 objectAtIndex:i];
      objc_msgSend(v11, "appendFormat:", @"%lul:", objc_msgSend(v15, "hash"));
    }
  }
  v16 = (CGImage *)_nonPersistentCacheForKey(v11, 0);
  if (v16)
  {
    CGImageRef Image = CGImageRetain(v16);
    id v10 = v50;
    goto LABEL_35;
  }
  v48 = v11;
  v51 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v49 = v8;
  id v18 = v8;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (!v19)
  {
    uint64_t v22 = 1;
    goto LABEL_27;
  }
  uint64_t v20 = v19;
  uint64_t v21 = *(void *)v53;
  uint64_t v22 = 1;
  do
  {
    uint64_t v23 = 0;
    do
    {
      if (*(void *)v53 != v21) {
        objc_enumerationMutation(v18);
      }
      v24 = [(UIKeyboardCache *)self cachedImageForKey:*(void *)(*((void *)&v52 + 1) + 8 * v23) fromLayout:v9];
      v25 = [(UIImage *)[UIKBCachedImage alloc] initWithCGImage:v24];
      CGImageRelease(v24);
      if (!v22) {
        goto LABEL_18;
      }
      ColorSpace = CGImageGetColorSpace(v24);
      if (CGColorSpaceGetNumberOfComponents(ColorSpace) == 4
        || ([(UIKBCachedImage *)v25 formatColor],
            id v27 = objc_claimAutoreleasedReturnValue(),
            BOOL v28 = UIKBColorUsesRGB([v27 CGColor]),
            v27,
            v28))
      {
        uint64_t v22 = 0;
LABEL_18:
        if (!v25) {
          goto LABEL_20;
        }
LABEL_19:
        [v51 addObject:v25];
        goto LABEL_20;
      }
      uint64_t v22 = 1;
      if (v25) {
        goto LABEL_19;
      }
LABEL_20:

      ++v23;
    }
    while (v20 != v23);
    uint64_t v29 = [v18 countByEnumeratingWithState:&v52 objects:v56 count:16];
    uint64_t v20 = v29;
  }
  while (v29);
LABEL_27:

  v30 = v51;
  uint64_t v31 = [v51 count];
  if (v31)
  {
    uint64_t v32 = v31;
    id v10 = v50;
    uint64_t v33 = [v50 count];
    v34 = [v51 firstObject];
    [v34 size];
    double v36 = v35;
    double v38 = v37;
    v47 = v34;
    [v34 scale];
    v40 = +[UIKBRenderer imageContextWithSize:scale:colorFormat:opaque:invert:](UIKBRenderer, "imageContextWithSize:scale:colorFormat:opaque:invert:", v22, 0, 0, v36, v38, v39);
    uint64_t v41 = 0;
    id v8 = v49;
    do
    {
      v42 = [v30 objectAtIndex:v41];
      double v43 = 1.0;
      if (v32 == v33)
      {
        v44 = [v50 objectAtIndex:v41];
        [v44 floatValue];
        double v43 = v45;

        v30 = v51;
      }
      [(UIKeyboardCache *)self drawCachedImage:v42 alpha:v40 inContext:v43];

      ++v41;
    }
    while (v32 != v41);
    CGImageRef Image = CGBitmapContextCreateImage(v40);
    CGContextRelease(v40);
    v11 = v48;
    _nonPersistentCacheForKey(v48, Image);
  }
  else
  {
    CGImageRef Image = 0;
    id v10 = v50;
    v11 = v48;
  }

LABEL_35:
LABEL_36:

  return Image;
}

- (void)drawCachedImage:(id)a3 alpha:(double)a4 inContext:(CGContext *)a5
{
  id v7 = a3;
  if (v7)
  {
    id v17 = v7;
    CGContextSaveGState(a5);
    CGContextSetAlpha(a5, a4);
    CGFloat v9 = *MEMORY[0x1E4F1DAD8];
    CGFloat v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [v17 size];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    if ([v17 hasFormatColor])
    {
      id v14 = [v17 formatColor];
      CGContextSetFillColorWithColor(a5, (CGColorRef)[v14 CGColor]);

      v15 = (CGImage *)[v17 CGImage];
      v19.origin.x = v9;
      v19.origin.y = v8;
      v19.size.width = v11;
      v19.size.height = v13;
      CGContextClipToMask(a5, v19, v15);
      v20.origin.x = v9;
      v20.origin.y = v8;
      v20.size.width = v11;
      v20.size.height = v13;
      CGContextFillRect(a5, v20);
    }
    else
    {
      v16 = (CGImage *)[v17 CGImage];
      v21.origin.x = v9;
      v21.origin.y = v8;
      v21.size.width = v11;
      v21.size.height = v13;
      CGContextDrawImage(a5, v21, v16);
    }
    CGContextRestoreGState(a5);
    id v7 = v17;
  }
}

- (id)displayImagesForView:(id)a3 fromLayout:(id)a4 imageFlags:(id)a5
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v89 = a4;
  id v8 = a5;
  if (![v8 count])
  {

    id v8 = &unk_1ED3F0220;
  }
  CGFloat v9 = [v7 cacheKeysForRenderFlags:v8];
  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  id v87 = (id)objc_claimAutoreleasedReturnValue();
  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  obuint64_t j = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v113 objects:v120 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v114;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v114 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v113 + 1) + 8 * i);
        id v14 = [v9 objectForKey:v13];
        if ([v7 keepNonPersistent]
          && (v15 = (CGImage *)_nonPersistentCacheForKey(v14, 0), (v16 = CGImageRetain(v15)) != 0)
          || (v16 = [(UIKeyboardCache *)self cachedImageForKey:v14 fromLayout:v89]) != 0)
        {
          size_t Width = CGImageGetWidth(v16);
          [v7 bounds];
          double v19 = v18;
          [v7 contentScaleFactor];
          if (vabdd_f64((double)Width, v20 * v19) <= 1.0)
          {
            CGRect v21 = [UIKBCachedImage alloc];
            [v7 contentScaleFactor];
            uint64_t v22 = -[UIImage initWithCGImage:scale:orientation:](v21, "initWithCGImage:scale:orientation:", v16, 0);
            [v87 setObject:v22 forKey:v13];

            if ([v7 keepNonPersistent]) {
              _nonPersistentCacheForKey(v14, v16);
            }
          }
          CGImageRelease(v16);
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v113 objects:v120 count:16];
    }
    while (v10);
  }

  [v7 cachedWidth];
  double v24 = v23;
  [v7 bounds];
  double v26 = v25;
  uint64_t v27 = [v87 count];
  if (v27 != [obj count] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v123.origin.x = *(CGFloat *)MEMORY[0x1E4F1DAD8];
    v123.origin.y = *(CGFloat *)(MEMORY[0x1E4F1DAD8] + 8);
    v123.size.width = v24;
    v123.size.height = v26;
    if (!CGRectIsEmpty(v123))
    {
      int v28 = _UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UIKeyboardGrayscaleCachingEnabled, @"UIKeyboardGrayscaleCachingEnabled");
      if (byte_1EB25768C) {
        int v29 = 1;
      }
      else {
        int v29 = v28;
      }
      if (v29 == 1) {
        unsigned int v79 = [v7 displaysColorImage] ^ 1;
      }
      else {
        unsigned int v79 = 0;
      }
      context = (void *)MEMORY[0x18C108260]();
      v84 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(obj, "count"));
      uint64_t v82 = [v7 assetIdiom];
      long long v111 = 0u;
      long long v112 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      id v30 = obj;
      uint64_t v31 = [v30 countByEnumeratingWithState:&v109 objects:v119 count:16];
      if (v31)
      {
        uint64_t v32 = *(void *)v110;
        do
        {
          for (uint64_t j = 0; j != v31; ++j)
          {
            if (*(void *)v110 != v32) {
              objc_enumerationMutation(v30);
            }
            v34 = *(void **)(*((void *)&v109 + 1) + 8 * j);
            double v35 = [v87 objectForKey:v34];

            if (!v35)
            {
              [v7 contentScaleFactor];
              double v37 = +[UIKBRenderer rendererWithContext:withSize:withScale:opaque:renderFlags:assetIdiom:](UIKBRenderer, "rendererWithContext:withSize:withScale:opaque:renderFlags:assetIdiom:", 0, [v7 isOpaque], objc_msgSend(v34, "integerValue"), v82, v24, v26, v36);
              double v38 = [v9 objectForKey:v34];
              [v37 setCacheKey:v38];

              if ([v7 displaysColorImage]) {
                [v37 forceColorFormat:0];
              }
              else {
                [v37 setColorDetectMode:v79];
              }
              [v84 addObject:v37];
            }
          }
          uint64_t v31 = [v30 countByEnumeratingWithState:&v109 objects:v119 count:16];
        }
        while (v31);
      }

      if (v79)
      {
        [v7 drawContentsOfRenderers:v84];
        long long v107 = 0u;
        long long v108 = 0u;
        long long v105 = 0u;
        long long v106 = 0u;
        id v39 = v84;
        uint64_t v40 = [v39 countByEnumeratingWithState:&v105 objects:v118 count:16];
        if (v40)
        {
          uint64_t v41 = *(void *)v106;
          do
          {
            for (uint64_t k = 0; k != v40; ++k)
            {
              if (*(void *)v106 != v41) {
                objc_enumerationMutation(v39);
              }
              double v43 = *(void **)(*((void *)&v105 + 1) + 8 * k);
              objc_msgSend(v43, "forceColorFormat:", objc_msgSend(v43, "contentColorFormat"));
              [v43 setColorDetectMode:0];
            }
            uint64_t v40 = [v39 countByEnumeratingWithState:&v105 objects:v118 count:16];
          }
          while (v40);
        }
      }
      [v7 drawContentsOfRenderers:v84];
      if (objc_opt_respondsToSelector()) {
        uint64_t v80 = [v7 cacheDeferPriority];
      }
      else {
        uint64_t v80 = [v7 cacheDeferable];
      }
      long long v103 = 0u;
      long long v104 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      id v81 = v84;
      uint64_t v85 = [v81 countByEnumeratingWithState:&v101 objects:v117 count:16];
      if (v85)
      {
        uint64_t v83 = *(void *)v102;
        do
        {
          for (uint64_t m = 0; m != v85; ++m)
          {
            if (*(void *)v102 != v83) {
              objc_enumerationMutation(v81);
            }
            float v45 = *(void **)(*((void *)&v101 + 1) + 8 * m);
            v46 = [v45 renderedImage];
            if (v46)
            {
              v47 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v45, "renderFlags"));
              [v87 setObject:v46 forKey:v47];
            }
            if ([v7 keepNonPersistent])
            {
              v48 = [v45 cacheKey];
              _nonPersistentCacheForKey(v48, (const void *)[v46 CGImage]);
            }
            if (+[UIKeyboardCache enabled])
            {
              BOOL v49 = v80 == 0;
              v50 = [v45 cacheKey];
              if (!v50) {
                BOOL v49 = 0;
              }

              if (v49)
              {
                if (v79)
                {
                  if ([v45 contentColorFormat] == 2)
                  {
                    unsigned __int8 v51 = 5;
LABEL_71:
                    v99[0] = 0;
                    v99[1] = v99;
                    v99[2] = 0x3032000000;
                    v99[3] = __Block_byref_object_copy__125;
                    v99[4] = __Block_byref_object_dispose__125;
                    id v52 = v45;
                    id v100 = v52;
                    long long v53 = (void *)MEMORY[0x1E4FAE2C8];
                    [v52 size];
                    double v55 = v54;
                    double v57 = v56;
                    id v58 = [v52 singleColor];
                    uint64_t v59 = [v58 CGColor];
                    [v52 scale];
                    double v61 = v60;
                    v62 = [v52 contextData];
                    v98[0] = MEMORY[0x1E4F143A8];
                    v98[1] = 3221225472;
                    v98[2] = __62__UIKeyboardCache_displayImagesForView_fromLayout_imageFlags___block_invoke;
                    v98[3] = &unk_1E52D9900;
                    v98[4] = v99;
                    v63 = objc_msgSend(v53, "cacheItemWithSize:format:formatColor:scale:data:dataReleaseHandler:", v51, v59, v62, v98, v55, v57, v61);

                    store = self->_store;
                    v65 = [v52 cacheKey];
                    [(TIImageCacheClient *)store storeImageDataForKey:v65 inGroup:v89 item:v63];

                    _Block_object_dispose(v99, 8);
                    goto LABEL_72;
                  }
                  if ([v45 contentColorFormat] == 1)
                  {
                    if ([v7 isOpaque]) {
                      unsigned __int8 v51 = 4;
                    }
                    else {
                      unsigned __int8 v51 = 3;
                    }
                    goto LABEL_71;
                  }
                }
                unsigned __int8 v51 = [v7 isOpaque];
                goto LABEL_71;
              }
            }
LABEL_72:
          }
          uint64_t v85 = [v81 countByEnumeratingWithState:&v101 objects:v117 count:16];
        }
        while (v85);
      }

      BOOL v66 = +[UIKeyboardCache enabled];
      uint64_t v67 = v80;
      if (v80) {
        BOOL v68 = v66;
      }
      else {
        BOOL v68 = 0;
      }
      if (v68)
      {
        if (v80 == 2)
        {
          v69 = (void *)UIApp;
          v70 = (objc_class *)objc_opt_class();
          v71 = NSStringFromClass(v70);
          uint64_t v72 = [v69 _beginBackgroundTaskWithName:v71 expirationHandler:0];

          uint64_t v67 = 2;
        }
        else
        {
          uint64_t v72 = 0;
        }
        dispatch_time_t v76 = dispatch_time(0, 100000000);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __62__UIKeyboardCache_displayImagesForView_fromLayout_imageFlags___block_invoke_2;
        block[3] = &unk_1E52FA3D8;
        id v91 = v81;
        char v97 = v79;
        id v92 = v7;
        v93 = self;
        id v94 = v89;
        uint64_t v95 = v67;
        uint64_t v96 = v72;
        dispatch_after(v76, MEMORY[0x1E4F14428], block);

        v75 = v91;
      }
      else
      {
        v73 = [(UIKeyboardCache *)self idleAction];
        BOOL v74 = v73 == 0;

        if (!v74)
        {
LABEL_85:

          goto LABEL_86;
        }
        v75 = +[_UIActionWhenIdle actionWhenIdleWithTarget:self selector:sel__didIdleAndShouldWait object:0];
        [(UIKeyboardCache *)self setIdleAction:v75];
      }

      goto LABEL_85;
    }
  }
LABEL_86:

  return v87;
}

void __62__UIKeyboardCache_displayImagesForView_fromLayout_imageFlags___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

void __62__UIKeyboardCache_displayImagesForView_fromLayout_imageFlags___block_invoke_2(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v31 != v3) {
          objc_enumerationMutation(obj);
        }
        int v5 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v6 = [v5 cacheKey];
        BOOL v7 = v6 == 0;

        if (!v7)
        {
          if (*(unsigned char *)(a1 + 80))
          {
            if ([v5 contentColorFormat] == 2)
            {
              unsigned __int8 v8 = 5;
LABEL_16:
              v28[0] = 0;
              v28[1] = v28;
              v28[2] = 0x3032000000;
              v28[3] = __Block_byref_object_copy__125;
              v28[4] = __Block_byref_object_dispose__125;
              id v9 = v5;
              id v29 = v9;
              uint64_t v10 = (void *)MEMORY[0x1E4FAE2C8];
              [v9 size];
              double v12 = v11;
              double v14 = v13;
              id v15 = [v9 singleColor];
              uint64_t v16 = [v15 CGColor];
              [v9 scale];
              double v18 = v17;
              double v19 = [v9 contextData];
              v27[0] = MEMORY[0x1E4F143A8];
              v27[1] = 3221225472;
              v27[2] = __62__UIKeyboardCache_displayImagesForView_fromLayout_imageFlags___block_invoke_3;
              v27[3] = &unk_1E52D9900;
              v27[4] = v28;
              double v20 = objc_msgSend(v10, "cacheItemWithSize:format:formatColor:scale:data:dataReleaseHandler:", v8, v16, v19, v27, v12, v14, v18);

              CGRect v21 = *(void **)(*(void *)(a1 + 48) + 8);
              uint64_t v22 = [v9 cacheKey];
              [v21 storeImageDataForKey:v22 inGroup:*(void *)(a1 + 56) item:v20];

              _Block_object_dispose(v28, 8);
              continue;
            }
            if (*(unsigned char *)(a1 + 80) && [v5 contentColorFormat] == 1)
            {
              if ([*(id *)(a1 + 40) isOpaque]) {
                unsigned __int8 v8 = 4;
              }
              else {
                unsigned __int8 v8 = 3;
              }
              goto LABEL_16;
            }
          }
          unsigned __int8 v8 = [*(id *)(a1 + 40) isOpaque];
          goto LABEL_16;
        }
      }
      uint64_t v2 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v2);
  }

  double v23 = [*(id *)(a1 + 48) idleAction];
  BOOL v24 = v23 == 0;

  if (v24)
  {
    double v25 = +[_UIActionWhenIdle actionWhenIdleWithTarget:*(void *)(a1 + 48) selector:sel__didIdle object:0];
    [*(id *)(a1 + 48) setIdleAction:v25];
  }
  if (*(void *)(a1 + 64) == 2) {
    [(id)UIApp _endBackgroundTask:*(void *)(a1 + 72)];
  }
}

void __62__UIKeyboardCache_displayImagesForView_fromLayout_imageFlags___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (void)_didIdle
{
  [(UIKeyboardCache *)self setIdleAction:0];
  store = self->_store;
  [(TIImageCacheClient *)store setIdleWhenDone];
}

- (void)_didIdleAndShouldWait
{
  dispatch_time_t v3 = dispatch_time(0, 150000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__UIKeyboardCache__didIdleAndShouldWait__block_invoke;
  block[3] = &unk_1E52D9F70;
  void block[4] = self;
  dispatch_after(v3, MEMORY[0x1E4F14428], block);
}

uint64_t __40__UIKeyboardCache__didIdleAndShouldWait__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didIdle];
}

- (id)uniqueLayoutsFromInputModes:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA80] set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (UIKeyboardInputModeUsesKBStar(v10))
        {
          double v11 = KBStarLayoutString(v10);
          objc_msgSend(v4, "addObject:", v11, (void)v13);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)updateCacheForInputModes:(id)a3
{
  id v4 = a3;
  if (+[UIKeyboardCache enabled])
  {
    id v5 = [(UIKeyboardCache *)self uniqueLayoutsFromInputModes:v4];
    if (![(NSSet *)self->_layouts isEqualToSet:v5])
    {
      uint64_t v6 = (void *)[(NSSet *)self->_layouts mutableCopy];
      [v6 minusSet:v5];
      uint64_t v7 = (void *)UIApp;
      uint64_t v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      uint64_t v10 = [v7 _beginBackgroundTaskWithName:v9 expirationHandler:0];

      store = self->_store;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __44__UIKeyboardCache_updateCacheForInputModes___block_invoke;
      v12[3] = &__block_descriptor_40_e5_v8__0l;
      v12[4] = v10;
      [(TIImageCacheClient *)store removeImagesInGroups:v6 completion:v12];
    }
  }
}

uint64_t __44__UIKeyboardCache_updateCacheForInputModes___block_invoke(uint64_t a1)
{
  return [(id)UIApp _endBackgroundTask:*(void *)(a1 + 32)];
}

- (void)incrementExpectedRender:(id)a3
{
  if (self->_activeRenderers)
  {
    id v4 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:a3];
    if ((-[NSMutableSet containsObject:](self->_activeRenderers, "containsObject:") & 1) == 0) {
      [(NSMutableSet *)self->_activeRenderers addObject:v4];
    }
  }
}

- (void)decrementExpectedRender:(id)a3
{
  if (self->_activeRenderers)
  {
    id v6 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:a3];
    if (-[NSMutableSet containsObject:](self->_activeRenderers, "containsObject:"))
    {
      [(NSMutableSet *)self->_activeRenderers removeObject:v6];
      if (![(NSMutableSet *)self->_activeRenderers count])
      {
        activeRenderers = self->_activeRenderers;
        self->_activeRenderers = 0;

        id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v5 postNotificationName:@"UIKeyboardRenderDidFinishNotification" object:0];
      }
    }
  }
}

- (_UIActionWhenIdle)idleAction
{
  return self->_idleAction;
}

- (void)setIdleAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleAction, 0);
  objc_storeStrong((id *)&self->_activeRenderers, 0);
  objc_storeStrong((id *)&self->_layouts, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

@end