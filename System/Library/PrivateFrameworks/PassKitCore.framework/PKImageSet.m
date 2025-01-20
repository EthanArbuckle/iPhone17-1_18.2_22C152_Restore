@interface PKImageSet
+ (BOOL)shouldCache;
+ (BOOL)shouldCacheForDisplayProfile:(id)a3 imageSetType:(int64_t)a4;
+ (BOOL)supportsSecureCoding;
+ (Class)classForDisplayProfile:(id)a3 imageSetType:(int64_t)a4;
+ (Class)classForImageSetType:(int64_t)a3;
+ (id)_archiveImageSetIfAppropriate:(id)a3 screenScale:(double)a4 screenSize:(CGSize)a5 archiveURL:(id)a6 cacheURL:(id)a7;
+ (id)_archiveURL:(id)a3;
+ (id)_createXPCContainerForImageSetWithType:(int64_t)a3 displayProfile:(id)a4 screenScale:(double)a5 screenSize:(CGSize)a6 suffix:(id)a7 fileURL:(id)a8 cacheURL:(id)a9 imageSetOut:(id *)a10;
+ (id)archiveName;
+ (id)cachedXPCContainerForImageSetWithType:(int64_t)a3 displayProfile:(id)a4 displayTraits:(id)a5 cacheURL:(id)a6;
+ (id)createXPCContainerForImageSet:(id)a3 screenScale:(double)a4 screenSize:(CGSize)a5 cacheURL:(id)a6;
+ (id)createXPCContainerForImageSetWithType:(int64_t)a3 displayProfile:(id)a4 screenScale:(double)a5 screenSize:(CGSize)a6 suffix:(id)a7 fileURL:(id)a8 cacheURL:(id)a9;
+ (id)imageSetForType:(int64_t)a3 screenScale:(double)a4 suffix:(id)a5 displayProfile:(id)a6 fileURL:(id)a7;
+ (int64_t)imageSetType;
+ (unsigned)currentVersion;
- (BOOL)_isSetImage:(id)a3 equalToImage:(id)a4;
- (NSURL)originCacheURL;
- (PKImageSet)initWithCoder:(id)a3;
- (PKImageSet)initWithDisplayProfile:(id)a3 fileURL:(id)a4 screenScale:(double)a5 suffix:(id)a6;
- (int64_t)version;
- (void)encodeWithCoder:(id)a3;
- (void)setOriginCacheURL:(id)a3;
- (void)setVersion:(int64_t)a3;
@end

@implementation PKImageSet

+ (id)createXPCContainerForImageSetWithType:(int64_t)a3 displayProfile:(id)a4 screenScale:(double)a5 screenSize:(CGSize)a6 suffix:(id)a7 fileURL:(id)a8 cacheURL:(id)a9
{
  return (id)objc_msgSend(a1, "_createXPCContainerForImageSetWithType:displayProfile:screenScale:screenSize:suffix:fileURL:cacheURL:imageSetOut:", a3, a4, a7, a8, a9, 0, a5, a6.width, a6.height);
}

- (PKImageSet)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKImageSet;
  v5 = [(PKImageSet *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originCacheURL"];
    originCacheURL = v5->_originCacheURL;
    v5->_originCacheURL = (NSURL *)v6;

    v5->_version = [v4 decodeIntegerForKey:@"version"];
  }

  return v5;
}

- (void).cxx_destruct
{
}

+ (BOOL)shouldCache
{
  return 1;
}

+ (id)_createXPCContainerForImageSetWithType:(int64_t)a3 displayProfile:(id)a4 screenScale:(double)a5 screenSize:(CGSize)a6 suffix:(id)a7 fileURL:(id)a8 cacheURL:(id)a9 imageSetOut:(id *)a10
{
  double height = a6.height;
  double width = a6.width;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v19 = a4;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  if (a5 == 0.0) {
    a5 = PKScreenScale();
  }
  if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    double width = PKScreenSize();
    double height = v24;
  }
  v25 = objc_alloc_init(PKDisplayTraitCollection);
  -[PKDisplayTraitCollection setCanvasSize:](v25, "setCanvasSize:", width, height);
  [(PKDisplayTraitCollection *)v25 setCanvasScale:a5];
  v26 = (void *)[a1 cachedXPCContainerForImageSetWithType:a3 displayProfile:v19 displayTraits:v25 cacheURL:v22];
  if (!v26)
  {
    if (!v21) {
      goto LABEL_18;
    }
    v30 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v21 path];
    v31 = id v43 = v20;
    int v32 = [v30 fileExistsAtPath:v31];

    id v20 = v43;
    if (!v32)
    {
LABEL_18:
      v36 = PKLogFacilityTypeGetObject(0);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v21;
        _os_log_impl(&dword_190E10000, v36, OS_LOG_TYPE_DEFAULT, "Attempting to create container for image set with missing pass bundle: %@", buf, 0xCu);
      }

      goto LABEL_21;
    }
    context = (void *)MEMORY[0x192FDC630]();
    v33 = (objc_class *)[a1 classForDisplayProfile:v19 imageSetType:a3];
    if (v22 && v33 == (objc_class *)objc_opt_class())
    {
      v38 = (void *)MEMORY[0x192FDC630]();
      *(void *)buf = 0;

      if (!*(void *)buf) {
        goto LABEL_28;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v39 = *(void **)buf;
        *(void *)buf = 0;
      }
      if (*(void *)buf)
      {
        v40 = [PKPassPlaceHolderImageSet alloc];
        uint64_t v41 = [(PKPassPlaceHolderImageSet *)v40 _initWithDisplayProfile:v19 fileURL:v21 screenScale:v43 suffix:*(void *)buf frontFaceImageSet:a5];
      }
      else
      {
LABEL_28:
        uint64_t v41 = [[v33 alloc] initWithDisplayProfile:v19 fileURL:v21 screenScale:v43 suffix:a5];
      }
      v34 = (void *)v41;
    }
    else
    {
      v34 = (void *)[[v33 alloc] initWithDisplayProfile:v19 fileURL:v21 screenScale:v43 suffix:a5];
      if (!v22)
      {
        v35 = 0;
LABEL_31:
        v27 = objc_msgSend(a1, "_archiveImageSetIfAppropriate:screenScale:screenSize:archiveURL:cacheURL:", v34, v35, v22, a5, width, height);
        if (a10)
        {
          objc_storeStrong(a10, v34);

          v27 = 0;
        }

        id v20 = v43;
        goto LABEL_22;
      }
    }
    v35 = [(id)objc_opt_class() _archiveURL:v22];
    goto LABEL_31;
  }
  v27 = v26;
  if (a10)
  {
    v28 = (void *)[v26 consumeImageSet];
    id v29 = *a10;
    *a10 = v28;

LABEL_21:
    v27 = 0;
  }
LABEL_22:

  return v27;
}

+ (id)cachedXPCContainerForImageSetWithType:(int64_t)a3 displayProfile:(id)a4 displayTraits:(id)a5 cacheURL:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v12 = (void *)[a1 classForDisplayProfile:a4 imageSetType:a3];
  int v13 = [v12 shouldCache];
  v14 = 0;
  if (v11 && v13)
  {
    [v10 canvasScale];
    if (v15 == 0.0) {
      double v15 = PKScreenScale();
    }
    double v16 = v15;
    [v10 canvasSize];
    double v19 = v18;
    double v20 = v17;
    if (v18 == *MEMORY[0x1E4F1DB30] && v17 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      double v19 = PKScreenSize();
      double v20 = v22;
    }
    v23 = [v12 _archiveURL:v11];
    v14 = PKLoadXPCDataWithURL(v23, [v12 currentVersion], v16, v19, v20);
  }
  return v14;
}

+ (BOOL)shouldCacheForDisplayProfile:(id)a3 imageSetType:(int64_t)a4
{
  id v4 = (void *)[a1 classForDisplayProfile:a3 imageSetType:a4];
  return [v4 shouldCache];
}

+ (Class)classForDisplayProfile:(id)a3 imageSetType:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    if ([v5 type]) {
      id v5 = 0;
    }
    else {
      id v5 = (id)objc_opt_class();
    }
  }
  v7 = [v5 classForImageSetType:a4];

  return (Class)v7;
}

+ (id)_archiveURL:(id)a3
{
  id v4 = a3;
  id v5 = [a1 archiveName];
  if (v5)
  {
    uint64_t v6 = [v4 URLByAppendingPathComponent:v5 isDirectory:0];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)_archiveImageSetIfAppropriate:(id)a3 screenScale:(double)a4 screenSize:(CGSize)a5 archiveURL:(id)a6 cacheURL:(id)a7
{
  double height = a5.height;
  double width = a5.width;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  if (v12
    && ([MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v12 requiringSecureCoding:1 error:0],
        (uint64_t v15 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v16 = (void *)v15;
    int v17 = [(id)objc_opt_class() shouldCache];
    if (!v13) {
      goto LABEL_6;
    }
    if (!v17) {
      goto LABEL_6;
    }
    double v18 = [v16 SHA256Hash];
    unsigned int v19 = [(id)objc_opt_class() currentVersion];
    double v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithCapacity:", objc_msgSend(v16, "length") + 48);
    long long v32 = 0u;
    long long v31 = 0u;
    v30[0] = bswap32(v19);
    v30[1] = bswap32(a4);
    double v21 = (double)a4;
    v30[2] = bswap32((width * v21));
    v30[3] = bswap32((height * v21));
    id v22 = v18;
    [v22 bytes];
    [v22 length];
    __memcpy_chk();
    [v20 appendBytes:v30 length:48];
    [v20 appendData:v16];
    v23 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v23 createDirectoryAtURL:v14 withIntermediateDirectories:1 attributes:0 error:0];
    [v20 writeToURL:v13 atomically:1];
    double v24 = PKLoadXPCDataWithURL(v13, v19, a4, width, height);

    if (!v24)
    {
LABEL_6:
      id v25 = v16;
      xpc_object_t v26 = xpc_data_create((const void *)[v25 bytes], objc_msgSend(v25, "length"));
      if (v26)
      {
        v27 = v26;
        v28 = [v25 SHA256Hash];
        double v24 = [[PKImageSetXPCContainer alloc] initWithWithXPCObject:v27 hash:v28];
      }
      else
      {
        double v24 = 0;
      }
    }
  }
  else
  {
    double v24 = 0;
  }

  return v24;
}

- (PKImageSet)initWithDisplayProfile:(id)a3 fileURL:(id)a4 screenScale:(double)a5 suffix:(id)a6
{
  v8.receiver = self;
  v8.super_class = (Class)PKImageSet;
  uint64_t v6 = [(PKImageSet *)&v8 init];
  if (v6) {
    v6->_version = [(id)objc_opt_class() currentVersion];
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  originCacheURL = self->_originCacheURL;
  id v5 = a3;
  [v5 encodeObject:originCacheURL forKey:@"originCacheURL"];
  [v5 encodeInteger:self->_version forKey:@"version"];
}

+ (id)imageSetForType:(int64_t)a3 screenScale:(double)a4 suffix:(id)a5 displayProfile:(id)a6 fileURL:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if (a4 == 0.0) {
    a4 = PKScreenScale();
  }
  uint64_t v15 = objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "classForDisplayProfile:imageSetType:", v13, a3)), "initWithDisplayProfile:fileURL:screenScale:suffix:", v13, v14, v12, a4);

  return v15;
}

+ (id)createXPCContainerForImageSet:(id)a3 screenScale:(double)a4 screenSize:(CGSize)a5 cacheURL:(id)a6
{
  double height = a5.height;
  double width = a5.width;
  id v11 = a3;
  id v12 = a6;
  if (v12)
  {
    id v13 = [(id)objc_opt_class() _archiveURL:v12];
  }
  else
  {
    id v13 = 0;
  }
  id v14 = objc_msgSend(a1, "_archiveImageSetIfAppropriate:screenScale:screenSize:archiveURL:cacheURL:", v11, v13, v12, a4, width, height);

  return v14;
}

- (BOOL)_isSetImage:(id)a3 equalToImage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5 == v6)
  {
    char v10 = 1;
  }
  else if (v6)
  {
    objc_super v8 = [v5 imageHash];
    objc_super v9 = [v7 imageHash];
    char v10 = [v8 isEqual:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int64_t)imageSetType
{
  return -1;
}

+ (Class)classForImageSetType:(int64_t)a3
{
  return 0;
}

+ (id)archiveName
{
  return 0;
}

+ (unsigned)currentVersion
{
  return 0;
}

- (NSURL)originCacheURL
{
  return self->_originCacheURL;
}

- (void)setOriginCacheURL:(id)a3
{
}

- (int64_t)version
{
  return self->_version;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

@end