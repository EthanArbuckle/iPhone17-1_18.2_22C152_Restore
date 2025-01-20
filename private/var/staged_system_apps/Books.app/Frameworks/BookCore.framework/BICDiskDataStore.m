@interface BICDiskDataStore
- (BICDataStoringDelegate)delegate;
- (BICDiskDataStore)initWithCachePath:(id)a3;
- (BICWorkQueue)readWorkQueue;
- (BICWorkQueue)writeWorkQueue;
- (BOOL)canStoreDescribedImage:(id)a3;
- (BOOL)deviceSupportsASTC;
- (BOOL)deviceSupportsHEIC;
- (CGImage)_readCachedImageFromPath:(id)a3;
- (NSString)cachePath;
- (NSString)identifier;
- (OS_dispatch_queue)readQ;
- (id)_filePathFromEntryLocation:(id)a3;
- (id)_writeCachedImage:(CGImage *)a3 unprocessed:(BOOL)a4 toRelativePath:(id)a5;
- (id)imageForEntryLocation:(id)a3;
- (int64_t)costFor:(signed __int16)a3;
- (signed)storingMedium;
- (void)_clean:(id)a3;
- (void)_inventoryLevel:(signed __int16)a3 addLevelID:(BOOL)a4 completion:(id)a5;
- (void)_removeFileAtPath:(id)a3;
- (void)afterAllStoreOperationsCompletedPerformBlock:(id)a3;
- (void)deleteImageForEntryLocation:(id)a3;
- (void)deleteRemovedEntries:(id)a3 deletingCompletedHandler:(id)a4;
- (void)fetchImagesForEntry:(id)a3 forRequest:(id)a4 completion:(id)a5;
- (void)setCachePath:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceSupportsASTC:(BOOL)a3;
- (void)setDeviceSupportsHEIC:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setReadQ:(id)a3;
- (void)setReadWorkQueue:(id)a3;
- (void)setWriteWorkQueue:(id)a3;
- (void)storeAddedEntries:(id)a3 forRequest:(id)a4 storingCompletedHandler:(id)a5;
@end

@implementation BICDiskDataStore

- (BICDiskDataStore)initWithCachePath:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BICDiskDataStore;
  v5 = [(BICDiskDataStore *)&v18 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v8 = dispatch_queue_create("DiskDataStore-Read/Write", v7);
    readQ = v5->_readQ;
    v5->_readQ = (OS_dispatch_queue *)v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v12 = dispatch_queue_create("DiskDataStore-Read/Write", v11);

    uint64_t v13 = +[BICWorkQueue workQueueWithHighPriorityTargetQueue:v5->_readQ backgroundTargetQueue:v12 numConcurrentWorkItems:1];
    readWorkQueue = v5->_readWorkQueue;
    v5->_readWorkQueue = (BICWorkQueue *)v13;

    [(BICWorkQueue *)v5->_readWorkQueue setIdentifier:@"DiskDataStore-Read/Write"];
    objc_storeStrong((id *)&v5->_writeWorkQueue, v5->_readWorkQueue);
    v15 = [v4 stringByAppendingPathComponent:@"BICDiskDataStore"];
    [(BICDiskDataStore *)v5 setCachePath:v15];
    v5->_deviceSupportsASTC = MGGetBoolAnswer();
    CFArrayRef v16 = CGImageDestinationCopyTypeIdentifiers();
    v5->_deviceSupportsHEIC = [(__CFArray *)v16 containsObject:AVFileTypeHEIC];
  }
  return v5;
}

- (void)setCachePath:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    cachePath = self->_cachePath;
    p_cachePath = &self->_cachePath;
    if (![(NSString *)cachePath isEqualToString:v5])
    {
      dispatch_queue_t v8 = +[NSFileManager defaultManager];
      unsigned __int8 v9 = [v8 fileExistsAtPath:v5];

      if ((v9 & 1) == 0)
      {
        v10 = +[NSFileManager defaultManager];
        id v14 = 0;
        unsigned __int8 v11 = [v10 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:&v14];
        id v12 = v14;

        if ((v11 & 1) == 0)
        {
          uint64_t v13 = BCImageCacheLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            sub_1F0738();
          }
        }
      }
      objc_storeStrong((id *)p_cachePath, a3);
    }
  }
}

- (signed)storingMedium
{
  return 1;
}

- (BOOL)canStoreDescribedImage:(id)a3
{
  id v3 = a3;
  id v4 = [v3 identifier];
  if (v4)
  {
    id v5 = [v3 image];
    if ([v5 CGImage])
    {
      char v6 = 1;
    }
    else
    {
      v7 = [v3 filePath];
      char v6 = [v7 length] != 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)deleteRemovedEntries:(id)a3 deletingCompletedHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v6;
  id v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v20;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v12 = [v11 imageDescription];
        objc_initWeak(&location, self);
        uint64_t v13 = [(BICDiskDataStore *)self writeWorkQueue];
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_183474;
        v15[3] = &unk_2CAD48;
        objc_copyWeak(&v17, &location);
        v15[4] = v11;
        id v16 = v7;
        [v13 addWorkItemWithPriority:v12 description:@"DiskDataStore delete removed entries" block:v15];

        objc_destroyWeak(&v17);
        objc_destroyWeak(&location);
      }
      id v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }
}

- (void)afterAllStoreOperationsCompletedPerformBlock:(id)a3
{
  id v4 = a3;
  id v5 = +[BICDescribedImage describedImageWithPriority:3];
  id v6 = [(BICDiskDataStore *)self writeWorkQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1836E0;
  v8[3] = &unk_2CAD70;
  id v9 = v4;
  id v7 = v4;
  [v6 addWorkItemWithPriority:v5 description:@"DiskDataStore after all ops" block:v8];
}

- (void)fetchImagesForEntry:(id)a3 forRequest:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned __int8 v11 = +[BICDescribedImage describedImageFromImageEntry:v8];
  [v11 setExpiry:0];
  id v12 = [v8 dataStoreInformation];
  if (v12
    && ([(BICDiskDataStore *)self cachePath],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        [v13 stringByAppendingPathComponent:v12],
        id v14 = objc_claimAutoreleasedReturnValue(),
        v13,
        v14))
  {
    [v11 imageSize];
    double v16 = v15;
    double v18 = v17;
    [v9 imageSize];
    BOOL v20 = 1;
    if (v16 == v21 && v18 == v19)
    {
      unsigned int v22 = [v11 processingOptions];
      BOOL v20 = v22 != [v9 processingOptions];
    }
    if (([v9 persistanceOptions] & 2) == 0 || v20)
    {
      +[BICCacheStats logOperation:BICCacheStatsOperationDiskReadQueueStart[0] forRequest:v9];
      objc_initWeak(&location, self);
      v27 = [(BICDiskDataStore *)self readWorkQueue];
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_183A4C;
      v29[3] = &unk_2CAD98;
      id v30 = v9;
      objc_copyWeak(&v34, &location);
      id v28 = v14;
      id v31 = v28;
      id v32 = v11;
      id v33 = v10;
      [v27 addWorkItemWithPriority:v30 description:@"DiskDataStore read" block:v29];

      objc_destroyWeak(&v34);
      objc_destroyWeak(&location);
    }
    else
    {
      [v11 setFilePath:v14];
      v23 = (void (**)(id, void *))objc_retainBlock(v10);
      if (v23)
      {
        v36 = v11;
        v24 = +[NSArray arrayWithObjects:&v36 count:1];
        v23[2](v23, v24);
      }
    }
  }
  else
  {
    id v25 = objc_retainBlock(v10);
    v26 = v25;
    if (v25) {
      (*((void (**)(id, void))v25 + 2))(v25, 0);
    }
  }
}

- (id)imageForEntryLocation:(id)a3
{
  return 0;
}

- (void)deleteImageForEntryLocation:(id)a3
{
  id v10 = [(BICDiskDataStore *)self _filePathFromEntryLocation:a3];
  id v4 = [v10 stringByAppendingPathExtension:@"jpg"];
  id v5 = [v10 stringByAppendingPathExtension:@"astc"];
  id v6 = [v10 stringByAppendingPathExtension:@"heic"];
  id v7 = [v10 stringByAppendingPathExtension:@"png"];
  [(BICDiskDataStore *)self _removeFileAtPath:v4];
  [(BICDiskDataStore *)self _removeFileAtPath:v5];
  id v8 = [v5 stringByAppendingPathComponent:@"path"];
  [(BICDiskDataStore *)self _removeFileAtPath:v8];

  [(BICDiskDataStore *)self _removeFileAtPath:v6];
  [(BICDiskDataStore *)self _removeFileAtPath:v7];
  id v9 = [v7 stringByAppendingPathComponent:@"path"];
  [(BICDiskDataStore *)self _removeFileAtPath:v9];
}

- (id)_filePathFromEntryLocation:(id)a3
{
  id v4 = a3;
  id v5 = +[BICDescribedImage identifierFromEntryLocation:v4];
  id v6 = [(BICDiskDataStore *)self cachePath];
  id v7 = [v6 stringByAppendingPathComponent:v5];

  id v8 = [v7 stringByAppendingPathComponent:v4];

  return v8;
}

- (void)_removeFileAtPath:(id)a3
{
  id v3 = a3;
  id v4 = +[NSFileManager defaultManager];
  unsigned int v5 = [v4 fileExistsAtPath:v3];

  if (v5)
  {
    id v6 = +[NSFileManager defaultManager];
    id v10 = 0;
    unsigned __int8 v7 = [v6 removeItemAtPath:v3 error:&v10];
    id v8 = v10;

    if ((v7 & 1) == 0)
    {
      id v9 = BCImageCacheLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1F0878();
      }
    }
  }
  else
  {
    id v8 = 0;
  }
}

- (void)storeAddedEntries:(id)a3 forRequest:(id)a4 storingCompletedHandler:(id)a5
{
  id v8 = a3;
  id v25 = a4;
  id v21 = a5;
  id v9 = dispatch_group_create();
  unsigned int v22 = +[NSMutableArray array];
  v23 = +[NSMutableArray array];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v8;
  id v10 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v41;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v40 + 1) + 8 * (void)v12);
        dispatch_group_enter(v9);
        id v14 = [v13 imageDescription];
        if ([(BICDiskDataStore *)self canStoreDescribedImage:v14])
        {
          objc_initWeak(&location, self);
          [v14 setPriority:3];
          +[BICCacheStats logOperation:BICCacheStatsOperationDiskWriteQueueStart[0] forRequest:v25];
          double v15 = [(BICDiskDataStore *)self writeWorkQueue];
          v30[0] = _NSConcreteStackBlock;
          v30[1] = 3221225472;
          v30[2] = sub_18437C;
          v30[3] = &unk_2CADC0;
          id v31 = v25;
          id v32 = self;
          id v16 = v14;
          id v33 = v16;
          id v34 = v13;
          id v35 = v23;
          v36 = v9;
          objc_copyWeak(&v38, &location);
          id v37 = v22;
          [v15 addWorkItemWithPriority:v16 description:@"DiskDataStore write" block:v30];

          objc_destroyWeak(&v38);
          objc_destroyWeak(&location);
        }
        else
        {
          dispatch_group_leave(v9);
        }

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v10);
  }

  double v17 = [(BICDiskDataStore *)self readQ];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_184A10;
  block[3] = &unk_2C70D8;
  id v27 = v22;
  id v28 = v23;
  id v29 = v21;
  id v18 = v23;
  id v19 = v22;
  id v20 = v21;
  dispatch_group_notify(v9, v17, block);
}

- (int64_t)costFor:(signed __int16)a3
{
  if (a3 != 1) {
    return 0;
  }
  id v4 = +[NSFileManager defaultManager];
  unsigned int v5 = [(BICDiskDataStore *)self cachePath];
  id v6 = [v4 contentsOfDirectoryAtPath:v5 error:0];

  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_184B90;
  v9[3] = &unk_2CADE8;
  v9[4] = self;
  v9[5] = &v10;
  [v6 enumerateObjectsUsingBlock:v9];
  int64_t v7 = v11[3];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (CGImage)_readCachedImageFromPath:(id)a3
{
  id v3 = a3;
  kdebug_trace();
  id v4 = +[NSURL fileURLWithPath:v3];

  if (qword_349610 != -1) {
    dispatch_once(&qword_349610, &stru_2CAE08);
  }
  unsigned int v5 = +[NSFileManager defaultManager];
  id v6 = [v4 path];
  unsigned int v7 = [v5 fileExistsAtPath:v6];

  if (!v7)
  {
    uint64_t v10 = BCImageCacheLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1F0BD0();
    }
    goto LABEL_12;
  }
  id v8 = +[NSFileManager defaultManager];
  id v9 = [v4 path];
  uint64_t v10 = [v8 attributesOfItemAtPath:v9 error:0];

  unint64_t v11 = (unint64_t)[v10 fileSize];
  +[BICCacheStats addToCounter:kBICCacheStatsCounterDiskBytesRead[0] amount:v11 >> 10];
  uint64_t v12 = CGImageSourceCreateWithURL((CFURLRef)v4, 0);
  if (!v12)
  {
    id v16 = BCImageCacheLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1F0B00();
    }

LABEL_12:
    double v15 = 0;
    goto LABEL_17;
  }
  uint64_t v13 = v12;
  CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v12, 0, (CFDictionaryRef)qword_349608);
  double v15 = ImageAtIndex;
  if (ImageAtIndex)
  {
    CFAutorelease(ImageAtIndex);
  }
  else
  {
    double v17 = BCImageCacheLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1F0B68();
    }
  }
  CFRelease(v13);
LABEL_17:

  kdebug_trace();
  return v15;
}

- (id)_writeCachedImage:(CGImage *)a3 unprocessed:(BOOL)a4 toRelativePath:(id)a5
{
  id v7 = a5;
  kdebug_trace();
  if (a3)
  {
    if (qword_349648 != -1) {
      dispatch_once(&qword_349648, &stru_2CAE28);
    }
    id v8 = [v7 pathExtension];
    if ([v8 isEqualToString:@"heic"])
    {
      id v9 = (__CFString *)qword_349620;
      CFDictionaryRef v10 = (const __CFDictionary *)qword_349638;
    }
    else if ([v8 isEqualToString:@"astc"])
    {
      id v9 = (__CFString *)qword_349618;
      CFDictionaryRef v10 = (const __CFDictionary *)qword_349630;
    }
    else if ([v8 isEqualToString:@"png"])
    {
      id v9 = [UTTypePNG identifier];

      CFDictionaryRef v10 = 0;
    }
    else
    {
      id v9 = (__CFString *)qword_349628;
      CFDictionaryRef v10 = (const __CFDictionary *)qword_349640;
    }
    unint64_t v11 = [(BICDiskDataStore *)self cachePath];
    uint64_t v12 = [v11 stringByAppendingPathComponent:v7];

    CFURLRef v13 = +[NSURL fileURLWithPath:v12];
    id v14 = CGImageDestinationCreateWithURL(v13, v9, 1uLL, 0);
    if (v14)
    {
      double v15 = v14;
      CGImageDestinationAddImage(v14, a3, v10);
      CGImageDestinationFinalize(v15);
      CFRelease(v15);
      id v16 = +[NSFileManager defaultManager];
      double v17 = [(__CFURL *)v13 path];
      id v18 = [v16 attributesOfItemAtPath:v17 error:0];

      unint64_t v19 = (unint64_t)[v18 fileSize];
      +[BICCacheStats addToCounter:kBICCacheStatsCounterDiskBytesWritten[0] amount:v19 >> 10];
    }
    else
    {
      id v20 = BCImageCacheLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_1F0CA0();
      }
    }
  }
  else
  {
    id v8 = BCImageCacheLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1F0C38();
    }
  }

  kdebug_trace();

  return v7;
}

- (void)_inventoryLevel:(signed __int16)a3 addLevelID:(BOOL)a4 completion:(id)a5
{
  id v5 = objc_retainBlock(a5);
  if (v5)
  {
    id v6 = v5;
    (*((void (**)(id, void *))v5 + 2))(v5, &__NSArray0__struct);
    id v5 = v6;
  }
}

- (void)_clean:(id)a3
{
  id v4 = a3;
  id v8 = [(BICDiskDataStore *)self cachePath];
  cachePath = self->_cachePath;
  self->_cachePath = (NSString *)&stru_2CE418;

  id v6 = +[NSFileManager defaultManager];
  [v6 removeItemAtPath:v8 error:0];

  [(BICDiskDataStore *)self setCachePath:v8];
  id v7 = (void (**)(void))objc_retainBlock(v4);

  if (v7) {
    v7[2](v7);
  }
}

- (BICDataStoringDelegate)delegate
{
  return self->delegate;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)identifier
{
  return self->identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)cachePath
{
  return self->_cachePath;
}

- (BICWorkQueue)readWorkQueue
{
  return self->_readWorkQueue;
}

- (void)setReadWorkQueue:(id)a3
{
}

- (BICWorkQueue)writeWorkQueue
{
  return self->_writeWorkQueue;
}

- (void)setWriteWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)readQ
{
  return self->_readQ;
}

- (void)setReadQ:(id)a3
{
}

- (BOOL)deviceSupportsASTC
{
  return self->_deviceSupportsASTC;
}

- (void)setDeviceSupportsASTC:(BOOL)a3
{
  self->_deviceSupportsASTC = a3;
}

- (BOOL)deviceSupportsHEIC
{
  return self->_deviceSupportsHEIC;
}

- (void)setDeviceSupportsHEIC:(BOOL)a3
{
  self->_deviceSupportsHEIC = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readQ, 0);
  objc_storeStrong((id *)&self->_writeWorkQueue, 0);
  objc_storeStrong((id *)&self->_readWorkQueue, 0);
  objc_storeStrong((id *)&self->_cachePath, 0);
  objc_storeStrong((id *)&self->identifier, 0);

  objc_storeStrong((id *)&self->delegate, 0);
}

@end