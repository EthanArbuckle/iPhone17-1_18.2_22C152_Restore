@interface CRLImageProviderPool
+ (CRLImageProviderPool)sharedPool;
+ (Class)p_providerClassForData:(id)a3;
- (BOOL)isBitmapAsset:(id)a3;
- (BOOL)p_rngSaysToFlush;
- (CRLImageProviderPool)init;
- (id)p_providerForData:(id)a3 temporary:(BOOL)a4 shouldValidate:(BOOL)a5;
- (id)providerForAsset:(id)a3 shouldValidate:(BOOL)a4;
- (id)temporaryProviderForAsset:(id)a3 shouldValidate:(BOOL)a4;
- (unint64_t)p_estimatedSizeOfAllProviders;
- (unint64_t)p_imageProviderMemoryThreshold;
- (unint64_t)p_providerLimitForFileDescriptorLimit:(unint64_t)a3;
- (unint64_t)p_removeProvidersWithZeroInterest;
- (void)addInterestInProviderForAsset:(id)a3;
- (void)flushImageProviders;
- (void)flushProvidersToFreeMemoryIfNecessaryExcludingProvider:(id)a3;
- (void)p_applicationDidEnterBackground:(id)a3;
- (void)p_didReceiveMemoryWarning:(id)a3;
- (void)p_flushProvidersWithNoOneActivelyHoldingAReference;
- (void)p_flushRandomImageProvidersExcludingProvider:(id)a3;
- (void)p_freeFileDescriptorsWithProviderCount:(unint64_t)a3;
- (void)p_updateFileDescriptorLimit;
- (void)removeInterestInProviderForAsset:(id)a3;
- (void)willCloseBoardDataStoreForAssets:(id)a3;
- (void)willCloseContainerForAssets:(id)a3;
- (void)willCullAssets:(id)a3;
@end

@implementation CRLImageProviderPool

+ (CRLImageProviderPool)sharedPool
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018A96C;
  block[3] = &unk_1014CC6D8;
  block[4] = a1;
  if (qword_1016A9190 != -1) {
    dispatch_once(&qword_1016A9190, block);
  }
  v2 = (void *)qword_1016A9188;

  return (CRLImageProviderPool *)v2;
}

- (CRLImageProviderPool)init
{
  v9.receiver = self;
  v9.super_class = (Class)CRLImageProviderPool;
  v2 = [(CRLImageProviderPool *)&v9 init];
  if (v2)
  {
    v3 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:5 valueOptions:0 capacity:0];
    mImageDataToImageProviderMap = v2->mImageDataToImageProviderMap;
    v2->mImageDataToImageProviderMap = v3;

    [(CRLImageProviderPool *)v2 p_updateFileDescriptorLimit];
    v5 = +[NSNotificationCenter defaultCenter];
    v6 = +[UIApplication sharedApplication];
    [v5 addObserver:v2 selector:"p_didReceiveMemoryWarning:" name:UIApplicationDidReceiveMemoryWarningNotification object:v6];

    v7 = +[UIApplication sharedApplication];
    [v5 addObserver:v2 selector:"p_applicationDidEnterBackground:" name:UIApplicationDidEnterBackgroundNotification object:v7];

    +[CRLAssetManager addCullingListener:v2];
  }
  return v2;
}

- (id)providerForAsset:(id)a3 shouldValidate:(BOOL)a4
{
  return [(CRLImageProviderPool *)self p_providerForData:a3 temporary:0 shouldValidate:a4];
}

- (id)temporaryProviderForAsset:(id)a3 shouldValidate:(BOOL)a4
{
  return [(CRLImageProviderPool *)self p_providerForData:a3 temporary:1 shouldValidate:a4];
}

- (BOOL)isBitmapAsset:(id)a3
{
  id v3 = a3;
  v4 = [v3 type];
  v5 = sub_1000304C8();
  unsigned __int8 v6 = [v4 conformsToType:v5];

  if (v6)
  {
    unsigned __int8 v7 = 0;
  }
  else
  {
    id v8 = [objc_opt_class() p_providerClassForData:v3];
    unsigned __int8 v7 = [v8 isSubclassOfClass:objc_opt_class()];
  }

  return v7;
}

+ (Class)p_providerClassForData:(id)a3
{
  id v3 = a3;
  v4 = [v3 type];
  v5 = [v4 identifier];
  unsigned __int8 v6 = sub_1000304C8();
  unsigned int v7 = [v4 conformsToType:v6];

  if (v7)
  {
    if (qword_101719C90 != -1) {
      dispatch_once(&qword_101719C90, &stru_1014DC398);
    }
    id v8 = off_10166C3B0;
    if (os_log_type_enabled((os_log_t)off_10166C3B0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Attempting to render PICT, returning error provider.", buf, 2u);
    }
    goto LABEL_30;
  }
  if (objc_msgSend(v5, "crl_conformsToUTI:", @"com.adobe.illustrator.ai-image")
    || [v4 conformsToType:UTTypeImage]
    || [v4 conformsToType:UTTypePDF])
  {
    objc_super v9 = (objc_class *)objc_opt_class();
    if (!v9) {
      goto LABEL_30;
    }
  }
  else
  {
    char v23 = 0;
    int v22 = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v25) = 0;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10018B1E4;
    v21[3] = &unk_1014DC3C0;
    v21[4] = buf;
    v21[5] = &v22;
    [v3 performInputStreamReadWithAccessor:v21];
    if (*(unsigned char *)(*(void *)&buf[8] + 24) && (v22 == 1178882085 ? (BOOL v14 = v23 == 45) : (BOOL v14 = 0), v14))
    {
      objc_super v9 = (objc_class *)objc_opt_class();
    }
    else
    {
      v15 = (CGImage *)[v3 newCGImage];
      if (v15)
      {
        objc_super v9 = (objc_class *)objc_opt_class();
        CGImageRelease(v15);
      }
      else
      {
        objc_super v9 = 0;
      }
    }
    _Block_object_dispose(buf, 8);
    if (!v9)
    {
LABEL_30:
      if (qword_101719C90 != -1) {
        dispatch_once(&qword_101719C90, &stru_1014DC400);
      }
      v10 = off_10166C3B0;
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
        sub_1010813C8(v3, v10);
      }
      objc_super v9 = 0;
      goto LABEL_35;
    }
  }
  if (qword_101719C90 != -1) {
    dispatch_once(&qword_101719C90, &stru_1014DC3E0);
  }
  v10 = off_10166C3B0;
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_INFO))
  {
    NSStringFromClass(v9);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = @"Nil";
    }
    v16 = [v3 filename];
    v17 = [v3 assetUUID];
    v18 = [v17 UUIDString];
    *(_DWORD *)buf = 138544130;
    *(void *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2112;
    v25 = v16;
    __int16 v26 = 2114;
    v27 = v18;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_INFO, "Returning provider of class %{public}@ for <%{public}@: filename=%@, assetUUID=%{public}@> ", buf, 0x2Au);

    if (v3) {
  }
    }
LABEL_35:

  v19 = v9;
  return v19;
}

- (id)p_providerForData:(id)a3 temporary:(BOOL)a4 shouldValidate:(BOOL)a5
{
  BOOL v5 = a5;
  unsigned int v7 = (__CFString *)a3;
  id v8 = v7;
  if (!v7 || ([(__CFString *)v7 needsDownload] & 1) != 0)
  {
    if ([(__CFString *)v8 needsDownload])
    {
      if (qword_101719C90 != -1) {
        dispatch_once(&qword_101719C90, &stru_1014DC420);
      }
      objc_super v9 = off_10166C3B0;
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
      {
        if (v8)
        {
          v10 = (objc_class *)objc_opt_class();
          NSStringFromClass(v10);
          id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v11 = @"Nil";
        }
        v15 = [(__CFString *)v8 filename];
        v16 = [(__CFString *)v8 assetUUID];
        v17 = [v16 UUIDString];
        *(_DWORD *)buf = 138543874;
        v49 = v11;
        __int16 v50 = 2112;
        v51 = v15;
        __int16 v52 = 2114;
        v53 = v17;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v9, OS_LOG_TYPE_DEFAULT, "Skipping provider for image data needing download <%{public}@: filename=%@, assetUUID=%{public}@> ", buf, 0x20u);

        if (v8) {
      }
        }
    }
    id v45 = 0;
    unint64_t mOpenFileDescriptorLimit = 0;
    goto LABEL_22;
  }
  v12 = self;
  objc_sync_enter(v12);
  unint64_t mOpenFileDescriptorLimit = v12->mOpenFileDescriptorLimit;
  id v13 = [(NSMapTable *)v12->mImageDataToImageProviderMap objectForKeyedSubscript:v8];
  if (v13)
  {
    id v45 = [(NSMapTable *)v12->mImageDataToImageProviderMap count];
    objc_sync_exit(v12);

    if (!v5) {
      goto LABEL_37;
    }
    goto LABEL_31;
  }
  objc_sync_exit(v12);

  BOOL v14 = v12;
  objc_sync_enter(v14);
  id v13 = [(NSMapTable *)v12->mImageDataToImageProviderMap objectForKeyedSubscript:v8];
  if (v13) {
    goto LABEL_13;
  }
  v36 = [objc_opt_class() p_providerClassForData:v8];
  if (v36)
  {
    id v13 = [[v36 alloc] initWithImageData:v8];
    if (v13)
    {
      if (!a4) {
        [(NSMapTable *)v12->mImageDataToImageProviderMap setObject:v13 forKeyedSubscript:v8];
      }
LABEL_13:
      id v45 = [(NSMapTable *)v12->mImageDataToImageProviderMap count];
      goto LABEL_14;
    }
    id v45 = 0;
  }
  else
  {
    id v45 = 0;
    id v13 = 0;
  }
LABEL_14:
  objc_sync_exit(v14);

  if (v13)
  {
    if (!v5) {
      goto LABEL_37;
    }
    goto LABEL_31;
  }
LABEL_22:
  if (qword_101719C90 != -1) {
    dispatch_once(&qword_101719C90, &stru_1014DC440);
  }
  v18 = off_10166C3B0;
  if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
  {
    if (v8)
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = @"Nil";
    }
    v21 = [(__CFString *)v8 filename];
    int v22 = [(__CFString *)v8 assetUUID];
    char v23 = [v22 UUIDString];
    *(_DWORD *)buf = 138543874;
    v49 = v20;
    __int16 v50 = 2112;
    v51 = v21;
    __int16 v52 = 2114;
    v53 = v23;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v18, OS_LOG_TYPE_DEFAULT, "No provider found or determinable for data. Falling back to error. <%{public}@: filename=%@, assetUUID=%{public}@> ", buf, 0x20u);

    if (v8) {
  }
    }

  id v13 = +[CRLErrorImageProvider sharedInstance];
  if (v5)
  {
LABEL_31:
    if (([v13 isError] & 1) == 0 && (objc_msgSend(v13, "isValid") & 1) == 0)
    {
      if (qword_101719C90 != -1) {
        dispatch_once(&qword_101719C90, &stru_1014DC460);
      }
      v24 = off_10166C3B0;
      if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR))
      {
        v37 = (objc_class *)objc_opt_class();
        NSStringFromClass(v37);
        v38 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v40 = (objc_class *)objc_opt_class();
          NSStringFromClass(v40);
          v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v39 = @"Nil";
        }
        v41 = [(__CFString *)v8 filename];
        v42 = [(__CFString *)v8 assetUUID];
        v43 = [v42 UUIDString];
        *(_DWORD *)buf = 138544130;
        v49 = v38;
        __int16 v50 = 2114;
        v51 = v39;
        __int16 v52 = 2112;
        v53 = v41;
        __int16 v54 = 2114;
        *(void *)v55 = v43;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v24, OS_LOG_TYPE_ERROR, "Provider of type %{public}@ says data is not valid <%{public}@: filename=%@, assetUUID=%{public}@> ", buf, 0x2Au);

        if (v8) {
      }
        }

      uint64_t v25 = +[CRLErrorImageProvider sharedInstance];

      id v13 = (id)v25;
    }
  }
LABEL_37:
  if ([v13 isError])
  {
    if (qword_101719C90 != -1) {
      dispatch_once(&qword_101719C90, &stru_1014DC480);
    }
    __int16 v26 = off_10166C3B0;
    if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEFAULT))
    {
      if (v8)
      {
        v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v44 = @"Nil";
      }
      v28 = [(__CFString *)v8 filename];
      unsigned int v29 = [(__CFString *)v8 needsDownload];
      v30 = [(__CFString *)v8 type];
      v31 = [(__CFString *)v8 assetUUID];
      v32 = [v31 UUIDString];
      v33 = +[NSNumber numberWithUnsignedLongLong:[(__CFString *)v8 length]];
      v34 = [v33 stringValue];
      *(_DWORD *)buf = 138544898;
      v49 = v44;
      __int16 v50 = 2050;
      v51 = v8;
      __int16 v52 = 2112;
      v53 = v28;
      __int16 v54 = 1024;
      *(_DWORD *)v55 = v29;
      *(_WORD *)&v55[4] = 2114;
      *(void *)&v55[6] = v30;
      __int16 v56 = 2114;
      v57 = v32;
      __int16 v58 = 2112;
      v59 = v34;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v26, OS_LOG_TYPE_DEFAULT, "Returning error provider. <%{public}@: %{public}p filename=%@, needsDownload=%i, type=%{public}@, assetUUID=%{public}@, length=%@> ", buf, 0x44u);

      if (v8) {
    }
      }
  }
  if (v45 > (id)-[CRLImageProviderPool p_providerLimitForFileDescriptorLimit:](self, "p_providerLimitForFileDescriptorLimit:", mOpenFileDescriptorLimit))-[CRLImageProviderPool p_freeFileDescriptorsWithProviderCount:](self, "p_freeFileDescriptorsWithProviderCount:"); {

  }
  return v13;
}

- (void)addInterestInProviderForAsset:(id)a3
{
  if (a3)
  {
    id v6 = [(CRLImageProviderPool *)self providerForAsset:a3 shouldValidate:0];
    [v6 addInterest];
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DC4A0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010814EC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DC4C0);
    }
    id v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v3);
    }
    v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageProviderPool addInterestInProviderForAsset:]");
    BOOL v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageProviderPool.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 252, 0, "invalid nil value for '%{public}s'", "imageData");
  }
}

- (void)removeInterestInProviderForAsset:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = self;
    objc_sync_enter(v5);
    id v6 = [(NSMapTable *)v5->mImageDataToImageProviderMap objectForKeyedSubscript:v4];
    [v6 removeInterest];

    objc_sync_exit(v5);
  }
  else
  {
    int v7 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DC4E0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101081650();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DC500);
    }
    id v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101081588(v8, v7);
    }
    objc_super v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageProviderPool removeInterestInProviderForAsset:]");
    v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageProviderPool.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 260, 0, "invalid nil value for '%{public}s'", "imageData");
  }
}

- (BOOL)p_rngSaysToFlush
{
  return sub_100407E74() < 0.5;
}

- (void)p_flushRandomImageProvidersExcludingProvider:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  objc_sync_enter(v5);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(NSMapTable *)v5->mImageDataToImageProviderMap objectEnumerator];
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v7)
  {
    uint64_t v9 = *(void *)v15;
    *(void *)&long long v8 = 134217984;
    long long v13 = v8;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(id *)(*((void *)&v14 + 1) + 8 * (void)v10);
        if (v11 != v4 && [(CRLImageProviderPool *)v5 p_rngSaysToFlush])
        {
          if (qword_101719C90 != -1) {
            dispatch_once(&qword_101719C90, &stru_1014DC520);
          }
          v12 = off_10166C3B0;
          if (os_log_type_enabled((os_log_t)off_10166C3B0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v13;
            id v19 = v11;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Flushing image provider %p at random.", buf, 0xCu);
          }
          [v11 flush:v13];
        }
        v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)flushImageProviders
{
  if (qword_101719C90 != -1) {
    dispatch_once(&qword_101719C90, &stru_1014DC540);
  }
  id v3 = off_10166C3B0;
  if (os_log_type_enabled((os_log_t)off_10166C3B0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Flushing all image providers.", buf, 2u);
  }
  id v4 = self;
  objc_sync_enter(v4);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v5 = [(NSMapTable *)v4->mImageDataToImageProviderMap objectEnumerator];
  id v6 = [v5 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) flush];
      }
      id v6 = [v5 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }

  [(NSMapTable *)v4->mImageDataToImageProviderMap removeAllObjects];
  objc_sync_exit(v4);
}

- (void)willCullAssets:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  objc_sync_enter(v5);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      long long v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        -[NSMapTable removeObjectForKey:](v5->mImageDataToImageProviderMap, "removeObjectForKey:", *(void *)(*((void *)&v10 + 1) + 8 * (void)v9), (void)v10);
        long long v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)willCloseContainerForAssets:(id)a3
{
}

- (void)willCloseBoardDataStoreForAssets:(id)a3
{
}

- (unint64_t)p_providerLimitForFileDescriptorLimit:(unint64_t)a3
{
  return a3 >> 2;
}

- (void)p_freeFileDescriptorsWithProviderCount:(unint64_t)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  obj = v4;
  [(CRLImageProviderPool *)v4 p_updateFileDescriptorLimit];
  unint64_t v5 = [(CRLImageProviderPool *)v4 p_providerLimitForFileDescriptorLimit:v4->mOpenFileDescriptorLimit];
  if (v5 < a3)
  {
    unint64_t v6 = a3;
    if (qword_101719C88 != -1) {
      dispatch_once(&qword_101719C88, &stru_1014DC560);
    }
    id v7 = off_10166C3A8;
    if (os_log_type_enabled((os_log_t)off_10166C3A8, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t mOpenFileDescriptorLimit = v4->mOpenFileDescriptorLimit;
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = mOpenFileDescriptorLimit;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "1st stage of fd grief. %tu providers and %tu fds allowed. Freeing 0-interest providers.", buf, 0x16u);
    }
    unint64_t v9 = [(CRLImageProviderPool *)v4 p_removeProvidersWithZeroInterest];
    unint64_t v10 = v6 - v9;
    if (qword_101719C88 != -1) {
      dispatch_once(&qword_101719C88, &stru_1014DC580);
    }
    long long v11 = off_10166C3A8;
    if (os_log_type_enabled((os_log_t)off_10166C3A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "1st stage of fd grief. Freed %tu providers.", buf, 0xCu);
    }
    a3 = v10;
  }
  if (a3 > v5)
  {
    if (v4->mHaveRaisedFileDescriptorLimit)
    {
      unint64_t v12 = a3;
      if (qword_101719C88 != -1) {
        dispatch_once(&qword_101719C88, &stru_1014DC5A0);
      }
      long long v13 = off_10166C3A8;
      if (os_log_type_enabled((os_log_t)off_10166C3A8, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v14 = obj->mOpenFileDescriptorLimit;
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = v12;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v14;
        long long v15 = "2nd stage of fd grief. %tu providers and %tu fds allowed. Already raised the limit, skipping.";
        long long v16 = v13;
        a3 = v12;
        uint32_t v17 = 22;
LABEL_39:
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
        goto LABEL_41;
      }
      goto LABEL_40;
    }
    if (v4->mOpenFileDescriptorLimit > 0x7FF)
    {
      unint64_t v12 = a3;
      if (qword_101719C88 != -1) {
        dispatch_once(&qword_101719C88, &stru_1014DC600);
      }
      v24 = off_10166C3A8;
      if (!os_log_type_enabled((os_log_t)off_10166C3A8, OS_LOG_TYPE_DEFAULT))
      {
LABEL_40:
        a3 = v12;
        goto LABEL_41;
      }
      unint64_t v25 = obj->mOpenFileDescriptorLimit;
      *(_DWORD *)buf = 134218496;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v25;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&unsigned char buf[24] = 2048;
      long long v15 = "2nd stage of fd grief. %tu providers and %tu fds allowed. Limit already at least %tu.";
      long long v16 = v24;
      a3 = v12;
LABEL_38:
      uint32_t v17 = 32;
      goto LABEL_39;
    }
    unint64_t v18 = a3;
    if (qword_101719C88 != -1) {
      dispatch_once(&qword_101719C88, &stru_1014DC5C0);
    }
    id v19 = off_10166C3A8;
    if (os_log_type_enabled((os_log_t)off_10166C3A8, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v20 = v4->mOpenFileDescriptorLimit;
      *(_DWORD *)buf = 134218496;
      *(void *)&uint8_t buf[4] = v18;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v20;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&unsigned char buf[24] = 2048;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "2nd stage of fd grief. %tu providers and %tu fds allowed. Will raise limit to %tu.", buf, 0x20u);
    }
    if (v4->mOpenFileDescriptorLimit <= 0x7FF)
    {
      unint64_t v21 = 2048;
      do
      {
        *(void *)buf = 0;
        *(void *)&uint8_t buf[8] = 0;
        if (getrlimit(8, (rlimit *)buf) || *(void *)buf >= v21) {
          break;
        }
        *(void *)buf = 2048;
        if (setrlimit(8, (const rlimit *)buf))
        {
          v21 -= 256;
        }
        else
        {
          v4->unint64_t mOpenFileDescriptorLimit = *(void *)buf;
          unint64_t v5 = -[CRLImageProviderPool p_providerLimitForFileDescriptorLimit:](v4, "p_providerLimitForFileDescriptorLimit:");
        }
      }
      while (v4->mOpenFileDescriptorLimit < v21);
    }
    v4->mHaveRaisedFileDescriptorLimit = 1;
    if (qword_101719C88 != -1) {
      dispatch_once(&qword_101719C88, &stru_1014DC5E0);
    }
    int v22 = off_10166C3A8;
    if (os_log_type_enabled((os_log_t)off_10166C3A8, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v23 = v4->mOpenFileDescriptorLimit;
      *(_DWORD *)buf = 134218496;
      *(void *)&uint8_t buf[4] = v18;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v23;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&unsigned char buf[24] = 2048;
      long long v15 = "2nd stage of fd grief. %tu providers and %tu fds allowed. Limit now %tu.";
      long long v16 = v22;
      a3 = v18;
      goto LABEL_38;
    }
    a3 = v18;
  }
LABEL_41:
  if (a3 > v5)
  {
    if (qword_101719C88 != -1) {
      dispatch_once(&qword_101719C88, &stru_1014DC620);
    }
    unint64_t v57 = a3;
    unint64_t v26 = a3 - ((3 * v5) >> 2);
    v27 = off_10166C3A8;
    if (os_log_type_enabled((os_log_t)off_10166C3A8, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v28 = obj->mOpenFileDescriptorLimit;
      *(_DWORD *)buf = 134218496;
      *(void *)&uint8_t buf[4] = v57;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v28;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&unsigned char buf[24] = v26;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "3rd stage of fd grief. %tu providers and %tu fds allowed. Freeing the least interesting %tu providers.", buf, 0x20u);
    }
    id v29 = objc_alloc_init((Class)NSMutableArray);
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    v30 = [(NSMapTable *)obj->mImageDataToImageProviderMap objectEnumerator];
    id v31 = [v30 countByEnumeratingWithState:&v67 objects:v75 count:16];
    if (v31)
    {
      uint64_t v61 = *(void *)v68;
      __int16 v58 = v30;
      unint64_t v59 = v26;
      do
      {
        id v62 = v31;
        for (i = 0; i != v62; i = (char *)i + 1)
        {
          if (*(void *)v68 != v61) {
            objc_enumerationMutation(v30);
          }
          v33 = *(void **)(*((void *)&v67 + 1) + 8 * i);
          v34 = (char *)[v29 count];
          if ((unint64_t)v34 >= v26)
          {
            unsigned int v35 = [v33 interest];
            if (v34)
            {
              int v36 = v35;
              v37 = 0;
              uint64_t v38 = 0x7FFFFFFFFFFFFFFFLL;
              do
              {
                uint64_t v39 = objc_opt_class();
                v40 = [v29 objectAtIndexedSubscript:v37];
                v41 = sub_1002469D0(v39, v40);

                if ((int)[v41 interest] > v36)
                {
                  int v36 = [v41 interest];
                  uint64_t v38 = (uint64_t)v37;
                }

                ++v37;
              }
              while (v34 != v37);
              v30 = v58;
              unint64_t v26 = v59;
              if (v38 != 0x7FFFFFFFFFFFFFFFLL) {
                [v29 replaceObjectAtIndex:v38 withObject:v33];
              }
            }
          }
          else
          {
            [v29 addObject:v33];
          }
        }
        id v31 = [v30 countByEnumeratingWithState:&v67 objects:v75 count:16];
      }
      while (v31);
    }

    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v42 = v29;
    id v43 = [v42 countByEnumeratingWithState:&v63 objects:v74 count:16];
    if (v43)
    {
      uint64_t v44 = *(void *)v64;
      do
      {
        id v45 = 0;
        do
        {
          if (*(void *)v64 != v44) {
            objc_enumerationMutation(v42);
          }
          v46 = [*(id *)(*((void *)&v63 + 1) + 8 * (void)v45) imageData];
          if (v46)
          {
            [(NSMapTable *)obj->mImageDataToImageProviderMap removeObjectForKey:v46];
          }
          else
          {
            unsigned int v47 = +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014DC640);
            }
            v48 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67110146;
              *(_DWORD *)&uint8_t buf[4] = v47;
              *(_WORD *)&uint8_t buf[8] = 2082;
              *(void *)&buf[10] = "-[CRLImageProviderPool p_freeFileDescriptorsWithProviderCount:]";
              *(_WORD *)&buf[18] = 2082;
              *(void *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageProviderPool.m";
              *(_WORD *)&buf[28] = 1024;
              *(_DWORD *)&buf[30] = 416;
              __int16 v72 = 2082;
              v73 = "imageData";
              _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
            }
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014DC660);
            }
            v49 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)v49, OS_LOG_TYPE_ERROR))
            {
              __int16 v52 = +[CRLAssertionHandler packedBacktraceString];
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)&uint8_t buf[4] = v47;
              *(_WORD *)&uint8_t buf[8] = 2114;
              *(void *)&buf[10] = v52;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v49, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
            }
            __int16 v50 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageProviderPool p_freeFileDescriptorsWithProviderCount:]");
            v51 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageProviderPool.m"];
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v50, v51, 416, 0, "invalid nil value for '%{public}s'", "imageData");
          }
          id v45 = (char *)v45 + 1;
        }
        while (v43 != v45);
        id v43 = [v42 countByEnumeratingWithState:&v63 objects:v74 count:16];
      }
      while (v43);
    }

    id v53 = [v42 count];
    if (qword_101719C88 != -1) {
      dispatch_once(&qword_101719C88, &stru_1014DC680);
    }
    __int16 v54 = off_10166C3A8;
    if (os_log_type_enabled((os_log_t)v54, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v55 = obj->mOpenFileDescriptorLimit;
      id v56 = [v42 count];
      *(_DWORD *)buf = 134218496;
      *(void *)&uint8_t buf[4] = v57 - (void)v53;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v55;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&unsigned char buf[24] = v56;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v54, OS_LOG_TYPE_DEFAULT, "3rd stage of fd grief. %tu providers and %tu fds allowed. Freed %tu providers.", buf, 0x20u);
    }
  }
  objc_sync_exit(obj);
}

- (unint64_t)p_imageProviderMemoryThreshold
{
  v2 = +[CRLCapabilities currentCapabilities];
  unsigned int v3 = [v2 isRendererH5OrBelow];

  if (v3) {
    return 0x4000000;
  }
  else {
    return 0x10000000;
  }
}

- (unint64_t)p_estimatedSizeOfAllProviders
{
  v2 = self;
  objc_sync_enter(v2);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unsigned int v3 = [(NSMapTable *)v2->mImageDataToImageProviderMap objectEnumerator];
  unint64_t v4 = 0;
  id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v4 += (unint64_t)[*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) i_flushableMemoryEstimate];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  objc_sync_exit(v2);
  return v4;
}

- (void)flushProvidersToFreeMemoryIfNecessaryExcludingProvider:(id)a3
{
  id v5 = a3;
  unint64_t v4 = [(CRLImageProviderPool *)self p_estimatedSizeOfAllProviders];
  if (v4 > [(CRLImageProviderPool *)self p_imageProviderMemoryThreshold]) {
    [(CRLImageProviderPool *)self p_flushRandomImageProvidersExcludingProvider:v5];
  }
}

- (void)p_didReceiveMemoryWarning:(id)a3
{
  [(CRLImageProviderPool *)self p_removeProvidersWithZeroInterest];

  [(CRLImageProviderPool *)self p_flushProvidersWithNoOneActivelyHoldingAReference];
}

- (void)p_applicationDidEnterBackground:(id)a3
{
  unint64_t v4 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018D498;
  block[3] = &unk_1014CBBB0;
  block[4] = self;
  dispatch_async(v4, block);
}

- (unint64_t)p_removeProvidersWithZeroInterest
{
  v2 = self;
  objc_sync_enter(v2);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  unsigned int v3 = [(NSMapTable *)v2->mImageDataToImageProviderMap objectEnumerator];
  id v4 = 0;
  id v5 = [v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v23;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ((int)[v8 interest] >= 1)
        {
          long long v9 = [v8 imageData];
          unsigned __int8 v10 = [v9 hasOwners];

          if (v10) {
            continue;
          }
        }
        if (!v4) {
          id v4 = objc_alloc_init((Class)NSMutableArray);
        }
        [v4 addObject:v8];
      }
      id v5 = [v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v5);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = v4;
  id v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v19;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v11);
        }
        long long v15 = [*(id *)(*((void *)&v18 + 1) + 8 * (void)j) imageData:v18];
        if (v15) {
          [(NSMapTable *)v2->mImageDataToImageProviderMap removeObjectForKey:v15];
        }
      }
      id v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v12);
  }

  id v16 = [v11 count];
  objc_sync_exit(v2);

  return (unint64_t)v16;
}

- (void)p_flushProvidersWithNoOneActivelyHoldingAReference
{
  v2 = self;
  objc_sync_enter(v2);
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  unsigned int v3 = [(NSMapTable *)v2->mImageDataToImageProviderMap objectEnumerator];
  id v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) i_flushIfNoOneUsing];
        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

- (void)p_updateFileDescriptorLimit
{
  v9.rlim_t rlim_cur = 0;
  v9.rlim_max = 0;
  if (getrlimit(8, &v9))
  {
    int v3 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DC6A0);
    }
    id v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010816EC(v4, v3);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DC6C0);
    }
    uint64_t v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v5);
    }
    uint64_t v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageProviderPool p_updateFileDescriptorLimit]");
    long long v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageProviderPool.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 522, 0, "Failed to get fd limit: getrlimit set errno to %d. Assuming limit of 256.", *__error());

    rlim_t rlim_cur = 256;
  }
  else
  {
    rlim_t rlim_cur = v9.rlim_cur;
  }
  self->unint64_t mOpenFileDescriptorLimit = rlim_cur;
}

- (void).cxx_destruct
{
}

@end