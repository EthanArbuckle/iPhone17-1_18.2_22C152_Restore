@interface SagaUploadPlaylistArtworkOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isPersistent;
- (NSNumber)containerCloudID;
- (NSNumber)dsid;
- (NSString)cuid;
- (NSString)troveID;
- (NSString)userArtworkToken;
- (NSURL)assetURL;
- (SagaUploadPlaylistArtworkOperation)initWithClientIdentity:(id)a3 playlistPersistentID:(int64_t)a4;
- (SagaUploadPlaylistArtworkOperation)initWithCoder:(id)a3;
- (SagaUploadPlaylistArtworkOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 playlistPersistentID:(int64_t)a5;
- (id)_bodyDataWithAdditionalBodyFields:(id)a3;
- (id)_requestWithURL:(id)a3 URLBagKey:(id)a4 timeoutInterval:(double)a5 additionalBodyFields:(id)a6;
- (id)_responseBodyForRequest:(id)a3 retryTimeout:(double)a4 debugName:(id)a5;
- (id)_standardBodyDictionaryWithAdditionalFields:(id)a3;
- (int64_t)playlistPersistentID;
- (unint64_t)assetFileSize;
- (void)_downloadRequestsFromURL:(id)a3 uploadResponsesURL:(id)a4;
- (void)_initiateArtworkUpload;
- (void)_uploadArtworkAssetWithInfo:(id)a3 completionHandler:(id)a4;
- (void)_uploadArtworkAssetWithInfo:(id)a3 uploadResponsesURL:(id)a4 uploadResponseData:(id)a5 postUploadBackOffDelay:(unsigned int)a6 followupDownloadRequestsURL:(id)a7;
- (void)encodeWithCoder:(id)a3;
- (void)main;
- (void)setAssetFileSize:(unint64_t)a3;
- (void)setAssetURL:(id)a3;
- (void)setContainerCloudID:(id)a3;
- (void)setCuid:(id)a3;
- (void)setDsid:(id)a3;
- (void)setPlaylistPersistentID:(int64_t)a3;
- (void)setTroveID:(id)a3;
- (void)setUserArtworkToken:(id)a3;
@end

@implementation SagaUploadPlaylistArtworkOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetURL, 0);
  objc_storeStrong((id *)&self->_containerCloudID, 0);
  objc_storeStrong((id *)&self->_userArtworkToken, 0);
  objc_storeStrong((id *)&self->_troveID, 0);
  objc_storeStrong((id *)&self->_cuid, 0);

  objc_storeStrong((id *)&self->_dsid, 0);
}

- (void)setAssetFileSize:(unint64_t)a3
{
  self->_assetFileSize = a3;
}

- (unint64_t)assetFileSize
{
  return self->_assetFileSize;
}

- (void)setAssetURL:(id)a3
{
}

- (NSURL)assetURL
{
  return self->_assetURL;
}

- (void)setContainerCloudID:(id)a3
{
}

- (NSNumber)containerCloudID
{
  return self->_containerCloudID;
}

- (void)setUserArtworkToken:(id)a3
{
}

- (NSString)userArtworkToken
{
  return self->_userArtworkToken;
}

- (void)setTroveID:(id)a3
{
}

- (NSString)troveID
{
  return self->_troveID;
}

- (void)setCuid:(id)a3
{
}

- (NSString)cuid
{
  return self->_cuid;
}

- (void)setDsid:(id)a3
{
}

- (NSNumber)dsid
{
  return self->_dsid;
}

- (void)setPlaylistPersistentID:(int64_t)a3
{
  self->_playlistPersistentID = a3;
}

- (int64_t)playlistPersistentID
{
  return self->_playlistPersistentID;
}

- (id)_bodyDataWithAdditionalBodyFields:(id)a3
{
  v3 = [(SagaUploadPlaylistArtworkOperation *)self _standardBodyDictionaryWithAdditionalFields:a3];
  v4 = +[NSPropertyListSerialization dataWithPropertyList:v3 format:100 options:0 error:0];
  if ([v4 length])
  {
    v5 = NSTemporaryDirectory();
    v6 = [v5 stringByAppendingPathComponent:@"updateplaylistasset.XXXXXX"];

    v7 = MSVCreateTemporaryFileHandle();
    id v8 = 0;
    [v7 writeData:v4];
    [v7 closeFile];

    v9 = +[NSURL fileURLWithPath:v8];
    v10 = [v9 URLByAppendingPathExtension:@"gz"];
    v11 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = [v10 path];
      *(_DWORD *)buf = 138543362;
      v17 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Compressing items to upload to path: %{public}@", buf, 0xCu);
    }
    MSVGzipCompressFile();
    id v13 = [v9 path];
    unlink((const char *)[v13 UTF8String]);

    id v14 = [objc_alloc((Class)NSData) initWithContentsOfURL:v10 options:1 error:0];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)_requestWithURL:(id)a3 URLBagKey:(id)a4 timeoutInterval:(double)a5 additionalBodyFields:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = objc_alloc((Class)ICStoreRequestContext);
  id v14 = [(CloudLibraryOperation *)self userIdentity];
  id v15 = [v13 initWithIdentity:v14];

  if (!v10 && v11)
  {
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x3032000000;
    v39 = sub_1000E9428;
    v40 = sub_1000E9438;
    id v41 = 0;
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x3032000000;
    v33 = sub_1000E9428;
    v34 = sub_1000E9438;
    id v35 = 0;
    dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
    v17 = +[ICURLBagProvider sharedBagProvider];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000E9440;
    v26[3] = &unk_1001BD9F0;
    v28 = &v30;
    v29 = &v36;
    v18 = v16;
    v27 = v18;
    [v17 getBagForRequestContext:v15 withCompletionHandler:v26];

    dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
    v19 = [(id)v31[5] stringForBagKey:v11];
    if (v19)
    {
      id v10 = +[NSURL URLWithString:v19];
    }
    else
    {
      v20 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = v37[5];
        *(_DWORD *)buf = 138543618;
        id v43 = v11;
        __int16 v44 = 2114;
        uint64_t v45 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "failed to fetch bag key '%{public}@. err=%{public}@", buf, 0x16u);
      }

      id v10 = 0;
    }

    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v36, 8);
  }
  if (v10)
  {
    v22 = +[NSMutableURLRequest requestWithURL:v10];
    [v22 setHTTPMethod:@"POST"];
    [v22 setTimeoutInterval:a5];
    v23 = [(SagaUploadPlaylistArtworkOperation *)self _bodyDataWithAdditionalBodyFields:v12];
    if (v23)
    {
      [v22 setValue:@"application/x-apple-plist" forHTTPHeaderField:@"Content-Type"];
      [v22 setValue:@"gzip" forHTTPHeaderField:@"Content-Encoding"];
      [v22 setHTTPBody:v23];
    }
    id v24 = [objc_alloc((Class)ICStoreURLRequest) initWithURLRequest:v22 requestContext:v15];
    [v24 setShouldUseMescalSigning:1];
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

- (id)_standardBodyDictionaryWithAdditionalFields:(id)a3
{
  id v3 = a3;
  if ([v3 count]) {
    id v4 = [v3 mutableCopy];
  }
  else {
    id v4 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
  }
  v5 = v4;
  [v4 setObject:&off_1001CC320 forKey:@"min-compatible-version"];
  [v5 setObject:&off_1001CC320 forKey:@"protocol-version"];

  return v5;
}

- (id)_responseBodyForRequest:(id)a3 retryTimeout:(double)a4 debugName:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = sub_1000E9428;
  uint64_t v32 = sub_1000E9438;
  id v33 = 0;
  v9 = +[NSDate date];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  do
  {
    id v10 = +[NSDate date];
    [v10 timeIntervalSinceDate:v9];
    double v12 = v11;

    if (v12 >= a4) {
      break;
    }
    dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
    id v14 = +[ICURLSessionManager defaultSession];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000E97BC;
    v18[3] = &unk_1001BD9C8;
    id v19 = v8;
    uint64_t v21 = &v24;
    v22 = &v28;
    double v23 = a4;
    id v15 = v13;
    v20 = v15;
    [v14 enqueueDataRequest:v7 withCompletionHandler:v18];

    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  }
  while (!*((unsigned char *)v25 + 24));
  id v16 = (id)v29[5];
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v28, 8);

  return v16;
}

- (void)_uploadArtworkAssetWithInfo:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [a3 objectForKey:@"operations"];
  if (_NSIsNSArray() && [v7 count])
  {
    id v8 = [v7 objectAtIndex:0];
    if (_NSIsNSDictionary())
    {
      id v49 = v6;
      v50 = self;
      v48 = v7;
      uint64_t v46 = [v8 objectForKey:@"endpoint"];
      v9 = +[NSURL URLWithString:](NSURL, "URLWithString:");
      id v10 = +[NSMutableURLRequest requestWithURL:v9];

      uint64_t v45 = [v8 objectForKey:@"method"];
      objc_msgSend(v10, "setHTTPMethod:");
      v47 = v8;
      [v8 objectForKey:@"requiredHeaders"];
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue();
      id v11 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
      v51 = v10;
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v56;
        do
        {
          id v14 = 0;
          do
          {
            if (*(void *)v56 != v13) {
              objc_enumerationMutation(obj);
            }
            id v15 = *(void **)(*((void *)&v55 + 1) + 8 * (void)v14);
            id v16 = [v15 objectForKey:@"key"];
            v17 = [v15 objectForKey:@"clientGenerated"];
            v18 = v17;
            if (v17 && ![v17 compare:@"true" options:1])
            {
              if ([v16 compare:@"date" options:1])
              {
                v20 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
                if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v62 = v16;
                  _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "Unknown required client generated header: %{public}@", buf, 0xCu);
                }

                id v19 = 0;
              }
              else
              {
                id v21 = objc_alloc_init((Class)NSDateFormatter);
                v22 = +[NSLocale localeWithLocaleIdentifier:@"en_US"];
                [v21 setLocale:v22];

                double v23 = +[NSTimeZone timeZoneWithAbbreviation:@"GMT"];
                [v21 setTimeZone:v23];

                [v21 setDateFormat:@"EEE',' dd MMM yyyy HH':'mm':'ss 'GMT'"];
                uint64_t v24 = +[NSDate date];
                id v19 = [v21 stringFromDate:v24];

                id v10 = v51;
              }
            }
            else
            {
              id v19 = [v15 objectForKey:@"value"];
            }
            if ([v16 length] && objc_msgSend(v19, "length")) {
              [v10 setValue:v19 forHTTPHeaderField:v16];
            }

            id v14 = (char *)v14 + 1;
          }
          while (v12 != v14);
          id v25 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
          id v12 = v25;
        }
        while (v25);
      }
      uint64_t v26 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
      char v27 = +[ICCloudAvailabilityController sharedController];
      objc_msgSend(v26, "setAllowsCellularAccess:", objc_msgSend(v27, "isCellularDataRestrictedForMusic") ^ 1);

      uint64_t v28 = +[NSURLSession sessionWithConfiguration:v26];
      v29 = [(SagaUploadPlaylistArtworkOperation *)v50 assetURL];
      uint64_t v30 = +[NSData dataWithContentsOfURL:v29 options:1 error:0];

      v31 = v47;
      uint64_t v32 = [v47 objectForKey:@"content"];
      id v33 = [v32 objectForKey:@"type"];
      id v34 = [v33 compare:@"byterange" options:1];

      if (v34)
      {
        id v6 = v49;
      }
      else
      {
        v37 = [v32 objectForKey:@"offset"];
        uint64_t v38 = [v32 objectForKey:@"length"];
        id v39 = [v37 longLongValue];
        id v40 = [v38 longLongValue];
        if (v39 || v40 != (id)[(SagaUploadPlaylistArtworkOperation *)v50 assetFileSize])
        {
          uint64_t v41 = objc_msgSend(v30, "subdataWithRange:", v39, v40);

          uint64_t v30 = (void *)v41;
        }
        id v6 = v49;
      }
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_1000EA294;
      v53[3] = &unk_1001BD9A0;
      id v54 = v6;
      v42 = objc_msgSend(v28, "msv_uploadTaskWithRequest:fromData:completionHandler:", v51, v30, v53);
      ct_green_tea_logger_create();
      id v43 = getCTGreenTeaOsLogHandle();
      __int16 v44 = v43;
      if (v43 && os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "Transmitting image", buf, 2u);
      }

      ct_green_tea_logger_destroy();
      [v42 resume];

      id v7 = v48;
      uint64_t v36 = (void *)v46;
      goto LABEL_29;
    }
  }
  id v35 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_FAULT, "Not enough information to upload artwork asset.", buf, 2u);
  }

  NSErrorUserInfoKey v59 = NSLocalizedDescriptionKey;
  CFStringRef v60 = @"Not enough information to upload artwork asset.";
  v31 = +[NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
  uint64_t v36 = +[NSError ic_cloudClientErrorWithCode:2014 userInfo:v31];
  (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v36);
LABEL_29:
}

- (void)_uploadArtworkAssetWithInfo:(id)a3 uploadResponsesURL:(id)a4 uploadResponseData:(id)a5 postUploadBackOffDelay:(unsigned int)a6 followupDownloadRequestsURL:(id)a7
{
  id v12 = a3;
  id v54 = a4;
  id v56 = a5;
  id v55 = a7;
  LODWORD(a5) = [(SagaUploadPlaylistArtworkOperation *)self isCancelled];
  uint64_t v13 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (!a5)
  {
    if (v14)
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Uploading artwork asset using info: %{public}@", (uint8_t *)&buf, 0xCu);
    }

    dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v86 = 0x3032000000;
    v87 = sub_1000E9428;
    v88 = sub_1000E9438;
    id v89 = 0;
    uint64_t v61 = 0;
    v62 = &v61;
    uint64_t v63 = 0x3032000000;
    v64 = sub_1000E9428;
    v65 = sub_1000E9438;
    id v66 = 0;
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_1000EAF00;
    v57[3] = &unk_1001BD978;
    p_long long buf = &buf;
    CFStringRef v60 = &v61;
    id v16 = v15;
    long long v58 = v16;
    [(SagaUploadPlaylistArtworkOperation *)self _uploadArtworkAssetWithInfo:v12 completionHandler:v57];
    dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
    if (v62[5])
    {
      v17 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        uint64_t v18 = v62[5];
        *(_DWORD *)v83 = 138543362;
        uint64_t v84 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "Artwork upload failed with error: %{public}@", v83, 0xCu);
      }

      [(CloudLibraryOperation *)self setStatus:2];
      uint64_t v19 = v62[5];
      NSErrorUserInfoKey v81 = NSUnderlyingErrorKey;
      uint64_t v82 = v19;
      id v53 = +[NSDictionary dictionaryWithObjects:&v82 forKeys:&v81 count:1];
      v20 = +[NSError ic_cloudClientErrorWithCode:2014 userInfo:v53];
      [(CloudLibraryOperation *)self setError:v20];
      goto LABEL_44;
    }
    id v53 = *(id *)(*((void *)&buf + 1) + 40);
    uint64_t v21 = (uint64_t)[v53 statusCode];
    if ((v21 & 0xFFFFFFFFFFFFFFFELL) == 0xC8)
    {
      if (a6)
      {
        v22 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v83 = 67109120;
          LODWORD(v84) = a6;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Backing off before sending uploadResponsesRequest for %u ms", v83, 8u);
        }

        usleep(1000 * a6);
      }
      v20 = [v12 objectForKey:@"token"];
      v79[0] = @"dsid";
      v51 = [(SagaUploadPlaylistArtworkOperation *)self dsid];
      v80[0] = v51;
      v79[1] = @"cuid";
      id v49 = [(SagaUploadPlaylistArtworkOperation *)self cuid];
      v80[1] = v49;
      v79[2] = @"troveid";
      v48 = [(SagaUploadPlaylistArtworkOperation *)self troveID];
      v80[2] = v48;
      v79[3] = @"payload";
      v76[0] = @"cloud-id";
      v47 = [(SagaUploadPlaylistArtworkOperation *)self containerCloudID];
      v76[1] = @"actions";
      v77[0] = v47;
      v74[0] = @"upload-playlist";
      v73[0] = @"action";
      v73[1] = @"assets";
      CFStringRef v71 = @"artwork";
      CFStringRef v69 = @"response-code";
      uint64_t v46 = +[NSString stringWithFormat:@"%ld", v21];
      v70 = v46;
      double v23 = +[NSDictionary dictionaryWithObjects:&v70 forKeys:&v69 count:1];
      v72 = v23;
      uint64_t v24 = +[NSDictionary dictionaryWithObjects:&v72 forKeys:&v71 count:1];
      v73[2] = @"response-data";
      v74[1] = v24;
      v74[2] = v56;
      id v25 = +[NSDictionary dictionaryWithObjects:v74 forKeys:v73 count:3];
      v75 = v25;
      uint64_t v26 = +[NSArray arrayWithObjects:&v75 count:1];
      v77[1] = v26;
      char v27 = +[NSDictionary dictionaryWithObjects:v77 forKeys:v76 count:2];
      v78 = v27;
      uint64_t v28 = +[NSArray arrayWithObjects:&v78 count:1];
      v80[3] = v28;
      uint64_t v45 = +[NSDictionary dictionaryWithObjects:v80 forKeys:v79 count:4];

      v29 = [(SagaUploadPlaylistArtworkOperation *)self _requestWithURL:v54 URLBagKey:0 timeoutInterval:v45 additionalBodyFields:60.0];
      v52 = [(SagaUploadPlaylistArtworkOperation *)self _responseBodyForRequest:v29 retryTimeout:@"upload responses (report work item responses)" debugName:180.0];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v30 = [v52 objectForKey:@"back-off-delay-in-ms"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unsigned int v31 = [v30 unsignedIntValue];

          if (v31)
          {
            uint64_t v32 = sub_1000EFD0C();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v83 = 67109120;
              LODWORD(v84) = v31;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Backing off before sending second downloadRequestsRequest for %u ms", v83, 8u);
            }

            usleep(1000 * v31);
          }
        }
        else
        {
        }
      }
      v67[0] = @"dsid";
      id v35 = [(SagaUploadPlaylistArtworkOperation *)self dsid];
      v68[0] = v35;
      v67[1] = @"cuid";
      uint64_t v36 = [(SagaUploadPlaylistArtworkOperation *)self cuid];
      v68[1] = v36;
      v67[2] = @"troveid";
      v37 = [(SagaUploadPlaylistArtworkOperation *)self troveID];
      v68[2] = v37;
      v50 = +[NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:3];

      uint64_t v38 = [(SagaUploadPlaylistArtworkOperation *)self _requestWithURL:v55 URLBagKey:0 timeoutInterval:v50 additionalBodyFields:60.0];
      id v39 = [(SagaUploadPlaylistArtworkOperation *)self _responseBodyForRequest:v38 retryTimeout:@"download requests phase 2 (fetch work items)" debugName:180.0];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v40 = [v39 objectForKey:@"all-work-completed"];
        unsigned int v41 = [v40 BOOLValue];

        if (v41)
        {
          [(CloudLibraryOperation *)self setStatus:1];
          v42 = [(CloudLibraryOperation *)self musicLibrary];
          id v43 = [(SagaUploadPlaylistArtworkOperation *)self userArtworkToken];
          [v42 migrateExistingArtworkToken:v43 newArtworkToken:v20 newSourceType:200];

LABEL_41:
LABEL_44:

          _Block_object_dispose(&v61, 8);
          _Block_object_dispose(&buf, 8);

          goto LABEL_45;
        }
        __int16 v44 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v83 = 138543362;
          uint64_t v84 = (uint64_t)v39;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "Download request phase 2 did not have all-work-completed=true: %{public}@", v83, 0xCu);
        }
      }
      else
      {
        __int16 v44 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v83 = 138543362;
          uint64_t v84 = (uint64_t)v39;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "Received unknown response for download request phase 2: %{public}@", v83, 0xCu);
        }
      }

      [(CloudLibraryOperation *)self setStatus:2];
      v42 = +[NSError ic_cloudClientErrorWithCode:2014 userInfo:0];
      [(CloudLibraryOperation *)self setError:v42];
      goto LABEL_41;
    }
    id v33 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v83 = 134217984;
      uint64_t v84 = v21;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Received http %ld response when uploading artwork asset.", v83, 0xCu);
    }

    if (v21 > 399)
    {
      if (v21 == 404 || v21 == 400)
      {
        uint64_t v34 = 3;
LABEL_43:
        [(CloudLibraryOperation *)self setStatus:v34];
        v20 = +[NSError ic_cloudClientErrorWithCode:2014 userInfo:0];
        [(CloudLibraryOperation *)self setError:v20];
        goto LABEL_44;
      }
    }
    else
    {
      uint64_t v34 = 1;
      if (v21 == 200 || v21 == 204) {
        goto LABEL_43;
      }
    }
    uint64_t v34 = 2;
    goto LABEL_43;
  }
  if (v14)
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "SagaUploadPlaylistArtworkOperation cancelled -- After downloading work items", (uint8_t *)&buf, 2u);
  }

  [(CloudLibraryOperation *)self setStatus:4];
LABEL_45:
}

- (void)_downloadRequestsFromURL:(id)a3 uploadResponsesURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(SagaUploadPlaylistArtworkOperation *)self isCancelled])
  {
    v45[0] = @"dsid";
    v9 = [(SagaUploadPlaylistArtworkOperation *)self dsid];
    v46[0] = v9;
    v45[1] = @"cuid";
    id v10 = [(SagaUploadPlaylistArtworkOperation *)self cuid];
    v46[1] = v10;
    v45[2] = @"troveid";
    id v11 = [(SagaUploadPlaylistArtworkOperation *)self troveID];
    v46[2] = v11;
    id v12 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:3];

    uint64_t v13 = [(SagaUploadPlaylistArtworkOperation *)self _requestWithURL:v6 URLBagKey:0 timeoutInterval:v12 additionalBodyFields:60.0];
    BOOL v14 = [(SagaUploadPlaylistArtworkOperation *)self _responseBodyForRequest:v13 retryTimeout:@"download requests phase 1 (fetch work items)" debugName:180.0];
    id v15 = 0;
    id v16 = 0;
    if (!_NSIsNSDictionary()) {
      goto LABEL_34;
    }
    v17 = [v14 objectForKey:@"back-off-delay-in-ms"];
    if (_NSIsNSNumber()) {
      unsigned int v42 = [v17 unsignedIntValue];
    }
    else {
      unsigned int v42 = 0;
    }
    uint64_t v18 = [v14 objectForKey:@"payload"];
    if (!_NSIsNSArray() || ![v18 count])
    {
      id v16 = 0;
      id v15 = 0;
LABEL_31:

      if (v15 && v16)
      {
        [(SagaUploadPlaylistArtworkOperation *)self _uploadArtworkAssetWithInfo:v15 uploadResponsesURL:v7 uploadResponseData:v16 postUploadBackOffDelay:v42 followupDownloadRequestsURL:v6];
LABEL_37:

        goto LABEL_38;
      }
LABEL_34:
      unsigned int v31 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_FAULT, "Work item did not include upload-info and response-data, failing upload", buf, 2u);
      }

      [(CloudLibraryOperation *)self setStatus:2];
      uint64_t v32 = +[NSError ic_cloudClientErrorWithCode:2014 userInfo:0];
      [(CloudLibraryOperation *)self setError:v32];

      goto LABEL_37;
    }
    unsigned int v41 = v17;
    uint64_t v19 = [v18 objectAtIndex:0];
    id v16 = 0;
    id v15 = 0;
    if (!_NSIsNSDictionary())
    {
LABEL_30:

      v17 = v41;
      goto LABEL_31;
    }
    id v40 = v19;
    v20 = [v19 objectForKey:@"cloud-id"];
    if (!_NSIsNSNumber())
    {
      id v16 = 0;
      id v15 = 0;
LABEL_29:

      uint64_t v19 = v40;
      goto LABEL_30;
    }
    uint64_t v21 = [(SagaUploadPlaylistArtworkOperation *)self containerCloudID];
    unsigned int v22 = [v20 isEqualToNumber:v21];

    if (v22)
    {
      double v23 = [v40 objectForKey:@"actions"];
      id v39 = v23;
      if (_NSIsNSArray() && [v23 count])
      {
        uint64_t v38 = [v23 objectAtIndex:0];
        uint64_t v24 = [v38 objectForKey:@"action"];
        int v25 = _NSIsNSString();
        uint64_t v26 = (void *)v24;
        id v16 = 0;
        id v15 = 0;
        if (v25)
        {
          char v27 = v26;
          if ([v26 isEqualToString:@"upload-playlist"])
          {
            uint64_t v28 = [v38 objectForKey:@"assets"];
            uint64_t v36 = v28;
            v37 = v27;
            if (_NSIsNSDictionary())
            {
              id v35 = [v28 objectForKey:@"artwork"];
              if (_NSIsNSDictionary())
              {
                v29 = [v35 objectForKey:@"upload-info"];
                [v38 objectForKey:@"response-data"];
                id v33 = v34 = v29;
                if (_NSIsNSDictionary() && _NSIsNSDictionary())
                {
                  id v15 = v29;
                  id v16 = v33;
                }
                else
                {
                  id v16 = 0;
                  id v15 = 0;
                }
              }
              else
              {
                id v16 = 0;
                id v15 = 0;
              }
            }
            else
            {
              id v16 = 0;
              id v15 = 0;
            }

            uint64_t v26 = v37;
          }
          else
          {
            id v16 = 0;
            uint64_t v26 = v27;
            id v15 = 0;
          }
        }

        goto LABEL_28;
      }
    }
    else
    {
      uint64_t v30 = sub_1000EFD0C();
      id v39 = v30;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 134217984;
        id v44 = [v20 unsignedLongLongValue];
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Received cloudID that does not match the one we initiated the asset upload for: %llu", buf, 0xCu);
      }
    }
    id v16 = 0;
    id v15 = 0;
LABEL_28:

    goto LABEL_29;
  }
  id v8 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "SagaUploadPlaylistArtworkOperation cancelled -- After initiating artwork upload", buf, 2u);
  }

  [(CloudLibraryOperation *)self setStatus:4];
LABEL_38:
}

- (void)_initiateArtworkUpload
{
  if ([(SagaUploadPlaylistArtworkOperation *)self isCancelled])
  {
    id v3 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SagaUploadPlaylistArtworkOperation cancelled -- After preparing to initiate artwork upload", buf, 2u);
    }

    [(CloudLibraryOperation *)self setStatus:4];
  }
  else
  {
    *(void *)long long buf = 0;
    v9 = buf;
    uint64_t v10 = 0xF810000000;
    memset(v13, 0, sizeof(v13));
    id v11 = &unk_10017E44F;
    uint64_t v12 = 4000;
    CC_MD5_Init((CC_MD5_CTX *)v13);
    v6[0] = 0;
    v6[1] = v6;
    v6[2] = 0xF810000000;
    memset(v7, 0, sizeof(v7));
    v6[3] = &unk_10017E44F;
    v6[4] = 4256;
    CC_SHA256_Init(v7);
    id v4 = [(SagaUploadPlaylistArtworkOperation *)self assetURL];
    id v5 = (id)MSVHasherDigestDataBlocksFromURL();

    _Block_object_dispose(v6, 8);
    _Block_object_dispose(buf, 8);
  }
}

- (void)main
{
  if (![(SagaUploadPlaylistArtworkOperation *)self isCancelled])
  {
    id v3 = [(CloudLibraryOperation *)self musicLibrary];
    id v4 = [(CloudLibraryOperation *)self clientIdentity];
    [v3 setClientIdentity:v4];

    int64_t playlistPersistentID = self->_playlistPersistentID;
    id v6 = [(CloudLibraryOperation *)self musicLibrary];
    id v7 = +[ML3Container newWithPersistentID:playlistPersistentID inLibrary:v6];

    if ([v7 existsInLibrary])
    {
      id v8 = [v7 valueForProperty:ML3ContainerPropertyStoreCloudID];
      [(SagaUploadPlaylistArtworkOperation *)self setContainerCloudID:v8];

      v9 = [(SagaUploadPlaylistArtworkOperation *)self containerCloudID];
      unsigned int v10 = [v9 unsignedIntValue];

      if (v10)
      {
        id v11 = [objc_alloc((Class)ML3ArtworkTokenSet) initWithEntity:v7 artworkType:5];
        uint64_t v12 = [v11 artworkTokenForSource:100];
        [(SagaUploadPlaylistArtworkOperation *)self setUserArtworkToken:v12];

        uint64_t v13 = [(SagaUploadPlaylistArtworkOperation *)self userArtworkToken];

        if (!v13)
        {
          unsigned int v41 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            int64_t v42 = self->_playlistPersistentID;
            *(_DWORD *)uint64_t v61 = 134217984;
            *(void *)&v61[4] = v42;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Playlist with pid = %lld does not have user set playlist artwork in the database, skipping upload of playlist artwork to cloud library.", v61, 0xCu);
          }

          [(CloudLibraryOperation *)self setStatus:1];
          id v17 = [(CloudLibraryOperation *)self musicLibrary];
          uint64_t v19 = MSVTCCIdentityForCurrentProcess();
          [v17 setClientIdentity:v19];
          goto LABEL_30;
        }
        id v14 = objc_alloc((Class)ML3Artwork);
        id v15 = [(SagaUploadPlaylistArtworkOperation *)self userArtworkToken];
        id v16 = [(CloudLibraryOperation *)self musicLibrary];
        id v17 = [v14 initWithToken:v15 artworkType:5 musicLibrary:v16];

        uint64_t v18 = [v17 originalFileURL];
        [(SagaUploadPlaylistArtworkOperation *)self setAssetURL:v18];

        uint64_t v19 = +[NSFileManager defaultManager];
        v20 = [(SagaUploadPlaylistArtworkOperation *)self assetURL];
        uint64_t v21 = [v20 path];
        unsigned __int8 v22 = [v19 fileExistsAtPath:v21];

        if (v22)
        {
          double v23 = [(SagaUploadPlaylistArtworkOperation *)self assetURL];
          uint64_t v24 = [v23 path];
          int v25 = [v19 attributesOfItemAtPath:v24 error:0];
          -[SagaUploadPlaylistArtworkOperation setAssetFileSize:](self, "setAssetFileSize:", [v25 fileSize]);

          if ([(SagaUploadPlaylistArtworkOperation *)self assetFileSize])
          {
            uint64_t v26 = [(CloudLibraryOperation *)self musicLibrary];
            char v27 = [v26 sagaAccountID];
            [(SagaUploadPlaylistArtworkOperation *)self setDsid:v27];

            uint64_t v28 = [(SagaUploadPlaylistArtworkOperation *)self dsid];
            id v29 = [v28 longLongValue];

            if (!v29)
            {
              id v43 = sub_1000EFD0C();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)uint64_t v61 = 0;
                _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_FAULT, "SagaUploadPlaylistArtworkOperation failed -- Missing DSID", v61, 2u);
              }
              goto LABEL_28;
            }
            uint64_t v30 = [(CloudLibraryOperation *)self musicLibrary];
            unsigned int v31 = [v30 sagaCloudLibraryCUID];
            [(SagaUploadPlaylistArtworkOperation *)self setCuid:v31];

            uint64_t v32 = [(CloudLibraryOperation *)self musicLibrary];
            id v33 = [v32 sagaCloudLibraryTroveID];
            [(SagaUploadPlaylistArtworkOperation *)self setTroveID:v33];

            uint64_t v34 = [(SagaUploadPlaylistArtworkOperation *)self cuid];
            if ([v34 length])
            {
              id v35 = [(SagaUploadPlaylistArtworkOperation *)self troveID];
              id v36 = [v35 length];

              if (v36)
              {
LABEL_37:
                id v56 = [(SagaUploadPlaylistArtworkOperation *)self cuid];
                if ([v56 length])
                {
                  long long v57 = [(SagaUploadPlaylistArtworkOperation *)self troveID];
                  id v58 = [v57 length];

                  if (v58)
                  {
                    [(SagaUploadPlaylistArtworkOperation *)self _initiateArtworkUpload];
                    goto LABEL_29;
                  }
                }
                else
                {
                }
                id v43 = sub_1000EFD0C();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
                {
                  NSErrorUserInfoKey v59 = [(SagaUploadPlaylistArtworkOperation *)self cuid];
                  CFStringRef v60 = [(SagaUploadPlaylistArtworkOperation *)self troveID];
                  *(_DWORD *)uint64_t v61 = 138543618;
                  *(void *)&v61[4] = v59;
                  *(_WORD *)&v61[12] = 2114;
                  *(void *)&v61[14] = v60;
                  _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_FAULT, "SagaUploadPlaylistArtworkOperation failed -- Missing one required parameter: CUID (%{public}@) / TroveID (%{public}@)", v61, 0x16u);
                }
LABEL_28:

                [(CloudLibraryOperation *)self setStatus:3];
                v47 = +[NSError ic_cloudClientErrorWithCode:2014 userInfo:0];
                [(CloudLibraryOperation *)self setError:v47];

LABEL_29:
                v48 = [(CloudLibraryOperation *)self musicLibrary];
                id v49 = MSVTCCIdentityForCurrentProcess();
                [v48 setClientIdentity:v49];

LABEL_30:
                goto LABEL_31;
              }
            }
            else
            {
            }
            v50 = [(CloudLibraryOperation *)self configuration];
            BOOL v51 = sub_1000D4EBC(v50, 0, 0);

            if (v51)
            {
              v52 = [(CloudLibraryOperation *)self musicLibrary];
              id v53 = [v52 sagaCloudLibraryCUID];
              [(SagaUploadPlaylistArtworkOperation *)self setCuid:v53];

              id v54 = [(CloudLibraryOperation *)self musicLibrary];
              id v55 = [v54 sagaCloudLibraryTroveID];
              [(SagaUploadPlaylistArtworkOperation *)self setTroveID:v55];
            }
            goto LABEL_37;
          }
          id v43 = sub_1000EFD0C();
          if (!os_log_type_enabled(v43, OS_LOG_TYPE_FAULT)) {
            goto LABEL_28;
          }
          id v44 = [(SagaUploadPlaylistArtworkOperation *)self assetURL];
          uint64_t v45 = [v44 path];
          *(_DWORD *)uint64_t v61 = 138543362;
          *(void *)&v61[4] = v45;
          uint64_t v46 = "SagaUploadPlaylistArtworkOperation failed -- Artwork is zero bytes at: %{public}@";
        }
        else
        {
          id v43 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
          if (!os_log_type_enabled(v43, OS_LOG_TYPE_FAULT)) {
            goto LABEL_28;
          }
          id v44 = [(SagaUploadPlaylistArtworkOperation *)self assetURL];
          uint64_t v45 = [v44 path];
          *(_DWORD *)uint64_t v61 = 138543362;
          *(void *)&v61[4] = v45;
          uint64_t v46 = "SagaUploadPlaylistArtworkOperation failed -- No artwork exists at: %{public}@";
        }
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_FAULT, v46, v61, 0xCu);

        goto LABEL_28;
      }
      v37 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v40 = self->_playlistPersistentID;
        *(_DWORD *)uint64_t v61 = 134217984;
        *(void *)&v61[4] = v40;
        id v39 = "Playlist with pid = %lld does not have a cloud_id in the database, skipping upload of playlist artwork to cloud library.";
        goto LABEL_18;
      }
    }
    else
    {
      v37 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v38 = self->_playlistPersistentID;
        *(_DWORD *)uint64_t v61 = 134217984;
        *(void *)&v61[4] = v38;
        id v39 = "Playlist with pid = %lld is not in the database, skipping upload of playlist artwork to cloud library.";
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, v39, v61, 0xCu);
      }
    }

    [(CloudLibraryOperation *)self setStatus:1];
    id v11 = [(CloudLibraryOperation *)self musicLibrary];
    MSVTCCIdentityForCurrentProcess();
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    [v11 setClientIdentity:v17];
LABEL_31:

    return;
  }

  [(CloudLibraryOperation *)self setStatus:4];
}

- (BOOL)isPersistent
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SagaUploadPlaylistArtworkOperation;
  id v4 = a3;
  [(CloudLibraryOperation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", self->_playlistPersistentID, @"SagaUploadPlaylistArtworkOperationPlaylistPersistentIDKey", v5.receiver, v5.super_class);
}

- (SagaUploadPlaylistArtworkOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SagaUploadPlaylistArtworkOperation;
  objc_super v5 = [(CloudLibraryOperation *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_int64_t playlistPersistentID = (int64_t)[v4 decodeInt64ForKey:@"SagaUploadPlaylistArtworkOperationPlaylistPersistentIDKey"];
  }

  return v5;
}

- (SagaUploadPlaylistArtworkOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 playlistPersistentID:(int64_t)a5
{
  v7.receiver = self;
  v7.super_class = (Class)SagaUploadPlaylistArtworkOperation;
  result = [(CloudLibraryOperation *)&v7 initWithConfiguration:a3 clientIdentity:a4];
  if (result) {
    result->_int64_t playlistPersistentID = a5;
  }
  return result;
}

- (SagaUploadPlaylistArtworkOperation)initWithClientIdentity:(id)a3 playlistPersistentID:(int64_t)a4
{
  id v6 = a3;
  objc_super v7 = objc_opt_new();
  id v8 = [(SagaUploadPlaylistArtworkOperation *)self initWithConfiguration:v7 clientIdentity:v6 playlistPersistentID:a4];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end