@interface CloudArtworkOperationQueue
- (BOOL)_hasValidUserIdentity:(id)a3 forSourceType:(int64_t)a4;
- (CloudArtworkOperationQueue)initWithSourceType:(int64_t)a3 configuration:(id)a4;
- (ICConnectionConfiguration)configuration;
- (id)_artworkURLForInfoDictionary:(id)a3;
- (int64_t)sourceType;
- (void)addOperation:(id)a3;
- (void)addOperations:(id)a3;
@end

@implementation CloudArtworkOperationQueue

- (void).cxx_destruct
{
}

- (ICConnectionConfiguration)configuration
{
  return self->_configuration;
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (BOOL)_hasValidUserIdentity:(id)a3 forSourceType:(int64_t)a4
{
  v6 = [(CloudArtworkOperationQueue *)self configuration];
  v7 = [v6 userIdentityStore];
  v8 = [(CloudArtworkOperationQueue *)self configuration];
  v9 = [v8 userIdentity];
  id v16 = 0;
  v10 = [v7 getPropertiesForUserIdentity:v9 error:&v16];
  id v11 = v16;

  if (v11)
  {
    v12 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_msgSend(v11, "msv_description");
      *(_DWORD *)buf = 138543618;
      v18 = self;
      __int16 v19 = 2114;
      v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load identity properties error=%{public}@", buf, 0x16u);
    }
  }
  if (a4 == 600 || a4 == 200) {
    unsigned __int8 v14 = [v10 isActiveLocker];
  }
  else {
    unsigned __int8 v14 = v10 != 0;
  }

  return v14;
}

- (id)_artworkURLForInfoDictionary:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:ICArtworkInfoKeyArtworkDictionary];
  v4 = [v3 objectForKeyedSubscript:ICArtworkInfoKeyArtworkDictionaryCoverArtworkJSON];
  if ([v4 length])
  {
    v5 = [v4 dataUsingEncoding:4];
    v6 = +[NSJSONSerialization JSONObjectWithData:v5 options:0 error:0];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [objc_alloc((Class)ICStoreArtworkInfo) initWithArtworkResponseDictionary:v6];
      goto LABEL_14;
    }
  }
  v6 = [v3 objectForKeyedSubscript:ICArtworkInfoKeyArtworkDictionaryTemplateJSON];
  if (![v6 length]) {
    goto LABEL_9;
  }
  v8 = [v6 dataUsingEncoding:4];
  v9 = +[NSJSONSerialization JSONObjectWithData:v8 options:0 error:0];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_9:
    v9 = [v3 objectForKeyedSubscript:ICArtworkInfoKeyArtworkDictionaryTemplateURL];
    if ([v9 length])
    {
      id v10 = objc_alloc((Class)ICStoreArtworkInfo);
      CFStringRef v28 = @"url";
      v29 = v9;
      id v11 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      id v7 = [v10 initWithArtworkResponseDictionary:v11];
    }
    else
    {
      id v11 = [v3 objectForKeyedSubscript:ICArtworkInfoKeyArtworkDictionaryFullURL];
      id v12 = objc_alloc((Class)ICStoreArtworkInfo);
      v13 = +[NSURL URLWithString:v11];
      id v7 = [v12 initWithArtworkURL:v13];
    }
    goto LABEL_13;
  }
  id v7 = [objc_alloc((Class)ICStoreArtworkInfo) initWithArtworkResponseDictionary:v9];
LABEL_13:

LABEL_14:
  MSVGetMaximumScreenSize();
  double v15 = v14;
  double v17 = v16;
  v18 = [v7 sizeInfo];
  [v18 maxSupportedSize];
  double v20 = v19;
  double v22 = v21;

  if (v20 != CGSizeZero.width || v22 != CGSizeZero.height)
  {
    MSVImageUtilitiesMakeBoundingBoxSize();
    double v15 = v24;
    double v17 = v25;
  }
  v26 = objc_msgSend(v7, "artworkURLWithSize:cropStyle:format:preferP3ColorSpace:", ICStoreArtworkInfoCropStyleBoundedBox, ICStoreArtworkInfoImageFormatJPEG, MSVDeviceSupportsExtendedColorDisplay(), v15, v17);

  return v26;
}

- (void)addOperations:(id)a3
{
  id v5 = a3;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = sub_1000604E0;
  v23[4] = sub_1000604F0;
  id v24 = +[NSMutableDictionary dictionary];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  double v20 = sub_1000604E0;
  double v21 = sub_1000604F0;
  id v22 = +[NSMutableDictionary dictionary];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000604F8;
  v16[3] = &unk_1001BB080;
  v16[4] = self;
  v16[5] = &v17;
  v16[6] = v23;
  v16[7] = &v25;
  v16[8] = a2;
  [v5 enumerateObjectsUsingBlock:v16];
  if (v26[3])
  {
    v6 = [(CloudArtworkOperationQueue *)self configuration];
    id v7 = [v6 userIdentity];
    unsigned int v8 = [(CloudArtworkOperationQueue *)self _hasValidUserIdentity:v7 forSourceType:[(CloudArtworkOperationQueue *)self sourceType]];

    if (v8)
    {
      v9 = (void *)v18[5];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100060698;
      v15[3] = &unk_1001BB0D0;
      v15[4] = self;
      v15[5] = v23;
      v15[6] = a2;
      [v9 enumerateKeysAndObjectsUsingBlock:v15];
    }
    else
    {
      id v10 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int64_t sourceType = self->_sourceType;
        uint64_t v12 = v26[3];
        *(_DWORD *)buf = 134218240;
        int64_t v30 = sourceType;
        __int16 v31 = 2048;
        uint64_t v32 = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No store account for source_type %ld, canceling %lu requests", buf, 0x16u);
      }

      v13 = (void *)v18[5];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100060C44;
      v14[3] = &unk_1001BB120;
      v14[4] = self;
      v14[5] = v23;
      [v13 enumerateKeysAndObjectsUsingBlock:v14];
    }
  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v25, 8);
}

- (void)addOperation:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"CloudArtworkOperationQueue.m" lineNumber:38 description:@"Only operations of type CloudArtworkImportOperation are supported"];
  }
  v7.receiver = self;
  v7.super_class = (Class)CloudArtworkOperationQueue;
  [(CloudArtworkOperationQueue *)&v7 addOperation:v5];
}

- (CloudArtworkOperationQueue)initWithSourceType:(int64_t)a3 configuration:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CloudArtworkOperationQueue;
  unsigned int v8 = [(CloudArtworkOperationQueue *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_int64_t sourceType = a3;
    objc_storeStrong((id *)&v8->_configuration, a4);
  }

  return v9;
}

@end