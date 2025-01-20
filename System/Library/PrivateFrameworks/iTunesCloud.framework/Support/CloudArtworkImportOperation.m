@interface CloudArtworkImportOperation
- (BOOL)allowsCellularData;
- (CloudArtworkImportOperation)initWithURLSession:(id)a3 configuration:(id)a4 cloudID:(unint64_t)a5 artworkToken:(id)a6 artworkType:(int64_t)a7 sourceType:(int64_t)a8 clientIdentity:(id)a9;
- (ICURLSession)URLSession;
- (NSString)artworkToken;
- (NSURL)assetURL;
- (id)_resizedImageDataFromLocation:(id)a3;
- (id)description;
- (int64_t)artworkType;
- (int64_t)sourceType;
- (unint64_t)cloudID;
- (unsigned)mediaType;
- (void)addCompletionHandler:(id)a3;
- (void)callCompletionHandlers;
- (void)cancel;
- (void)setAllowsCellularData:(BOOL)a3;
- (void)setAssetURL:(id)a3;
- (void)setMediaType:(unsigned int)a3;
- (void)start;
@end

@implementation CloudArtworkImportOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_sourceType + 2), 0);
  objc_storeStrong((id *)((char *)&self->_cloudID + 2), 0);
  objc_storeStrong((id *)(&self->_allowsCellularData + 2), 0);
  objc_storeStrong((id *)((char *)&self->_completionHandlers + 2), 0);

  objc_storeStrong((id *)(&self->super._finished + 1), 0);
}

- (void)setAllowsCellularData:(BOOL)a3
{
  BYTE2(self->_urlRequest) = a3;
}

- (BOOL)allowsCellularData
{
  return BYTE2(self->_urlRequest);
}

- (void)setAssetURL:(id)a3
{
}

- (NSURL)assetURL
{
  return *(NSURL **)((char *)&self->_sourceType + 2);
}

- (void)setMediaType:(unsigned int)a3
{
  *(_DWORD *)((char *)&self->_urlRequest + 6) = a3;
}

- (unsigned)mediaType
{
  return *(_DWORD *)((char *)&self->_urlRequest + 6);
}

- (int64_t)sourceType
{
  return *(int64_t *)((char *)&self->_artworkType + 2);
}

- (int64_t)artworkType
{
  return *(int64_t *)((char *)&self->_artworkToken + 2);
}

- (NSString)artworkToken
{
  return *(NSString **)((char *)&self->_cloudID + 2);
}

- (unint64_t)cloudID
{
  return *(unint64_t *)((char *)&self->_URLSession + 2);
}

- (ICURLSession)URLSession
{
  return *(ICURLSession **)(&self->_allowsCellularData + 2);
}

- (id)_resizedImageDataFromLocation:(id)a3
{
  id v3 = a3;
  v4 = +[ICDeviceInfo currentDeviceInfo];
  if (![v4 isWatch])
  {
    v14 = 0;
    goto LABEL_25;
  }
  v5 = +[NSFileManager defaultManager];
  v6 = [v3 path];
  v7 = [v5 attributesOfItemAtPath:v6 error:0];
  id v8 = [v7 fileSize];

  uint64_t ImageSource = MSVImageUtilitiesCreateImageSource();
  if (!ImageSource)
  {
    v11 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138543362;
      id v20 = v3;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "failed to create image source for resizing image at '%{public}@'", (uint8_t *)&v19, 0xCu);
    }
    v14 = 0;
    goto LABEL_24;
  }
  v10 = (const void *)ImageSource;
  v11 = +[NSMutableData data];
  uint64_t DataImageDestination = MSVImageUtilitiesCreateDataImageDestination();
  if (!DataImageDestination)
  {
    v15 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138543362;
      id v20 = v3;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "failed to create image destination for resizing image at '%{public}@'", (uint8_t *)&v19, 0xCu);
    }

    v14 = 0;
    goto LABEL_23;
  }
  v13 = (CGImageDestination *)DataImageDestination;
  [v4 mainScreenSize];
  if (!MSVImageUtilitiesResizeSourceImageToJPEGDestination())
  {
    v16 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138543362;
      id v20 = v3;
      v17 = "failed to resize image at '%{public}@'";
LABEL_19:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v19, 0xCu);
    }
LABEL_20:

    goto LABEL_21;
  }
  if (!CGImageDestinationFinalize(v13))
  {
    v16 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138543362;
      id v20 = v3;
      v17 = "failed to finalize resized image at '%{public}@'";
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  if ([v11 length] >= v8)
  {
LABEL_21:
    v14 = 0;
    goto LABEL_22;
  }
  v14 = v11;
LABEL_22:
  CFRelease(v13);
LABEL_23:
  CFRelease(v10);
LABEL_24:

LABEL_25:

  return v14;
}

- (void)cancel
{
  if (*(NSMutableArray **)((char *)&self->_completionHandlers + 2)) {
    objc_msgSend(*(id *)(&self->_allowsCellularData + 2), "cancelRequest:");
  }
  v3.receiver = self;
  v3.super_class = (Class)CloudArtworkImportOperation;
  [(CloudArtworkImportOperation *)&v3 cancel];
}

- (void)start
{
  v83.receiver = self;
  v83.super_class = (Class)CloudArtworkImportOperation;
  [(CloudLibraryConcurrentOperation *)&v83 start];
  unsigned int v3 = [(CloudArtworkImportOperation *)self isCancelled];
  v4 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (!v3)
  {
    if (v5)
    {
      v6 = [(CloudArtworkImportOperation *)self artworkToken];
      *(_DWORD *)buf = 138543618;
      v88 = self;
      __int16 v89 = 2114;
      *(void *)v90 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting artwork import using token '%{public}@'", buf, 0x16u);
    }
    v7 = +[NSMutableDictionary dictionary];
    id v8 = +[NSDate date];
    v9 = +[ICStorageManager sharedManager];
    unsigned int v10 = [v9 cachingEnabled];
    unint64_t v11 = (unint64_t)[v9 storageSpaceAvailable];
    unint64_t v12 = v11;
    if (!v10 || v11 >> 12 <= 0x18)
    {
      v28 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v88 = self;
        __int16 v89 = 1024;
        *(_DWORD *)v90 = v10;
        *(_WORD *)&v90[4] = 2048;
        *(void *)&v90[6] = v12;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%{public}@ Not enough free space to download artwork. cachingEnabled=%d, storageSpaceAvailable=%lld", buf, 0x1Cu);
      }

      [(CloudLibraryConcurrentOperation *)self finish];
      v74 = _NSConcreteStackBlock;
      uint64_t v75 = 3221225472;
      v76 = sub_1000C736C;
      v77 = &unk_1001BCC28;
      id v78 = v7;
      v79 = self;
      char v82 = v10;
      id v80 = v8;
      unint64_t v81 = v12;
      AnalyticsSendEventLazy();

      int v19 = v78;
      goto LABEL_41;
    }
    v13 = [(CloudArtworkImportOperation *)self artworkToken];
    id v14 = [v13 length];

    if (!v14)
    {
      v29 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v88 = self;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%{public}@ Cannot import artwork without artwork token.", buf, 0xCu);
      }

      [(CloudLibraryConcurrentOperation *)self finish];
      v67 = _NSConcreteStackBlock;
      uint64_t v68 = 3221225472;
      v69 = sub_1000C7480;
      v70 = &unk_1001BCC50;
      id v71 = v7;
      v72 = self;
      id v73 = v8;
      AnalyticsSendEventLazy();

      int v19 = v71;
      goto LABEL_41;
    }
    v15 = [(CloudArtworkImportOperation *)self assetURL];

    if (!v15)
    {
      v30 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v88 = self;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%{public}@ Cannot import artwork without an asset URL.", buf, 0xCu);
      }

      [(CloudLibraryConcurrentOperation *)self finish];
      v60 = _NSConcreteStackBlock;
      uint64_t v61 = 3221225472;
      v62 = sub_1000C754C;
      v63 = &unk_1001BCC50;
      id v64 = v7;
      v65 = self;
      id v66 = v8;
      AnalyticsSendEventLazy();

      int v19 = v64;
      goto LABEL_41;
    }
    v16 = +[ICDeviceInfo currentDeviceInfo];
    if ([v16 isWatch])
    {
      v17 = +[ICEnvironmentMonitor sharedMonitor];
      if (![v17 isCharging])
      {
        char v34 = _os_feature_enabled_impl();

        if ((v34 & 1) == 0)
        {
          v35 = sub_1000EFCD4();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v88 = self;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%{public}@ Cannot import artwork on the watch while its not plugged in", buf, 0xCu);
          }

          [(CloudLibraryConcurrentOperation *)self finish];
          v53 = _NSConcreteStackBlock;
          uint64_t v54 = 3221225472;
          v55 = sub_1000C7618;
          v56 = &unk_1001BCC50;
          id v57 = v7;
          v58 = self;
          id v59 = v8;
          AnalyticsSendEventLazy();

          int v19 = v57;
          goto LABEL_41;
        }
LABEL_15:
        v18 = [(CloudArtworkImportOperation *)self artworkToken];
        int v19 = +[ML3MusicLibrary artworkRelativePathFromToken:v18];

        id v20 = [(CloudLibraryOperation *)self musicLibrary];
        unsigned int v21 = [v20 hasOriginalArtworkForRelativePath:v19];

        if (v21)
        {
          v22 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v88 = self;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ Already have original on disk, attempting to import into database...", buf, 0xCu);
          }

          v23 = [(CloudLibraryOperation *)self musicLibrary];
          v24 = [(CloudArtworkImportOperation *)self artworkToken];
          unsigned __int8 v25 = objc_msgSend(v23, "importExistingOriginalArtworkWithArtworkToken:artworkType:sourceType:mediaType:", v24, -[CloudArtworkImportOperation artworkType](self, "artworkType"), -[CloudArtworkImportOperation sourceType](self, "sourceType"), -[CloudArtworkImportOperation mediaType](self, "mediaType"));

          if ((v25 & 1) == 0)
          {
            NSErrorUserInfoKey v85 = NSLocalizedDescriptionKey;
            CFStringRef v86 = @"Original artwork found, but failed to import.";
            v26 = +[NSDictionary dictionaryWithObjects:&v86 forKeys:&v85 count:1];
            v27 = +[NSError ic_cloudClientErrorWithCode:2002 userInfo:v26];
            [(CloudLibraryOperation *)self setError:v27];
          }
        }
        else
        {
          unsigned int v31 = [(CloudArtworkImportOperation *)self isCancelled];
          v32 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
          BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
          if (!v31)
          {
            if (v33)
            {
              v36 = [(CloudArtworkImportOperation *)self assetURL];
              *(_DWORD *)buf = 138543618;
              v88 = self;
              __int16 v89 = 2114;
              *(void *)v90 = v36;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ Downloading artwork from '%{public}@'", buf, 0x16u);
            }
            v37 = [(CloudArtworkImportOperation *)self assetURL];
            v38 = +[NSMutableURLRequest requestWithURL:v37];

            objc_msgSend(v38, "setAllowsCellularAccess:", -[CloudArtworkImportOperation allowsCellularData](self, "allowsCellularData"));
            id v39 = objc_alloc((Class)ICRequestContext);
            v40 = +[ICClientInfo defaultInfo];
            id v49 = [v39 initWithClientInfo:v40];

            v41 = (NSMutableArray *)[objc_alloc((Class)ICURLRequest) initWithURLRequest:v38 requestContext:v49];
            v42 = *(NSMutableArray **)((char *)&self->_completionHandlers + 2);
            *(NSMutableArray **)((char *)&self->_completionHandlers + 2) = v41;

            v43 = sub_1000D4924();
            v84[0] = v43;
            v44 = MSVNanoIDCreateTaggedPointer();
            v84[1] = v44;
            v45 = +[NSArray arrayWithObjects:v84 count:2];
            v46 = +[NSURL fileURLWithPathComponents:v45];

            v47 = *(void **)(&self->_allowsCellularData + 2);
            uint64_t v48 = *(uint64_t *)((char *)&self->_completionHandlers + 2);
            v50[0] = _NSConcreteStackBlock;
            v50[1] = 3221225472;
            v50[2] = sub_1000C76E4;
            v50[3] = &unk_1001BD700;
            v50[4] = self;
            id v51 = v7;
            id v52 = v8;
            [v47 enqueueDownloadRequest:v48 toDestination:v46 withCompletionHandler:v50];

            goto LABEL_41;
          }
          if (v33)
          {
            *(_DWORD *)buf = 134217984;
            v88 = self;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Not running CloudArtworkImportOperation (%p) as it's is cancelled", buf, 0xCu);
          }
        }
        [(CloudLibraryConcurrentOperation *)self finish];
LABEL_41:

        return;
      }
    }
    goto LABEL_15;
  }
  if (v5)
  {
    *(_DWORD *)buf = 138543362;
    v88 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Not running CloudArtworkImportOperation as it's is cancelled", buf, 0xCu);
  }

  [(CloudLibraryConcurrentOperation *)self finish];
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@: %p [cloud_id=%llu, artworkType=%lld, sourceType=%lld]>", objc_opt_class(), self, [(CloudArtworkImportOperation *)self cloudID], [(CloudArtworkImportOperation *)self artworkType], [(CloudArtworkImportOperation *)self sourceType]];
}

- (void)callCompletionHandlers
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = *(id *)(&self->super._finished + 1);
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v7);
        v9 = [(CloudLibraryOperation *)self error];
        (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  unsigned int v10 = *(void **)(&self->super._finished + 1);
  *(void *)(&self->super._finished + 1) = 0;
}

- (void)addCompletionHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = *(void **)(&self->super._finished + 1);
    id v9 = v4;
    if (!v5)
    {
      uint64_t v6 = +[NSMutableArray array];
      v7 = *(void **)(&self->super._finished + 1);
      *(void *)(&self->super._finished + 1) = v6;

      id v5 = *(void **)(&self->super._finished + 1);
    }
    id v8 = [v9 copy];
    [v5 addObject:v8];

    id v4 = v9;
  }
}

- (CloudArtworkImportOperation)initWithURLSession:(id)a3 configuration:(id)a4 cloudID:(unint64_t)a5 artworkToken:(id)a6 artworkType:(int64_t)a7 sourceType:(int64_t)a8 clientIdentity:(id)a9
{
  id v16 = a3;
  id v17 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CloudArtworkImportOperation;
  v18 = [(CloudLibraryOperation *)&v22 initWithConfiguration:a4 clientIdentity:a9];
  int v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)(v18 + 114), a3);
    *(void *)(v19 + 122) = a5;
    objc_storeStrong((id *)(v19 + 130), a6);
    *(void *)(v19 + 138) = a7;
    *(void *)(v19 + 146) = a8;
    v19[106] = 1;
    id v20 = +[CloudArtworkImportSetupOperation sharedSetupOperation];
    [v19 addDependency:v20];
  }
  return (CloudArtworkImportOperation *)v19;
}

@end