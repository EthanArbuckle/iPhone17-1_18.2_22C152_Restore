@interface PKDiscoveryMedia
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)urls;
- (NSString)passKitUIImageName;
- (NSURL)localAssetURL;
- (PKColor)backgroundColor;
- (PKDiscoveryMedia)initWithCoder:(id)a3;
- (PKDiscoveryMedia)initWithDictionary:(id)a3;
- (double)height;
- (double)width;
- (id)_remoteAssetForScale:(double)a3;
- (id)description;
- (id)imageDataFromCacheWithScale:(double)a3;
- (int64_t)type;
- (unint64_t)hash;
- (void)downloadImageDataWithScale:(double)a3 shouldWriteData:(BOOL)a4 completion:(id)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKDiscoveryMedia

- (PKDiscoveryMedia)initWithDictionary:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)PKDiscoveryMedia;
  v5 = [(PKDiscoveryMedia *)&v32 init];
  if (v5)
  {
    id v6 = [v4 PKStringForKey:@"type"];
    if ([@"image" isEqualToString:v6])
    {
      uint64_t v7 = 1;
    }
    else if ([@"video" isEqualToString:v6])
    {
      uint64_t v7 = 2;
    }
    else if ([@"bundleAsset" isEqualToString:v6])
    {
      uint64_t v7 = 3;
    }
    else if ([@"localAsset" isEqualToString:v6])
    {
      uint64_t v7 = 4;
    }
    else
    {
      uint64_t v7 = 0;
    }

    v5->_type = v7;
    [v4 PKDoubleForKey:@"width"];
    v5->_width = v8;
    [v4 PKDoubleForKey:@"height"];
    v5->_height = v9;
    uint64_t v10 = [v4 PKColorForKey:@"backgroundColor"];
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (PKColor *)v10;

    uint64_t v12 = [v4 PKStringForKey:@"bundleAssetFilename"];
    passKitUIImageName = v5->_passKitUIImageName;
    v5->_passKitUIImageName = (NSString *)v12;

    uint64_t v14 = [v4 PKURLForKey:@"localAssetURL"];
    localAssetURL = v5->_localAssetURL;
    v5->_localAssetURL = (NSURL *)v14;

    v16 = [v4 PKDictionaryForKey:@"urls"];
    v17 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v16, "count"));
    if (v16)
    {
      uint64_t v26 = 0;
      v27 = &v26;
      uint64_t v28 = 0x3032000000;
      v29 = __Block_byref_object_copy__13;
      v30 = __Block_byref_object_dispose__13;
      id v31 = objc_alloc_init(MEMORY[0x1E4F28E78]);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __39__PKDiscoveryMedia_initWithDictionary___block_invoke;
      v22[3] = &unk_1E56DED28;
      v23 = v17;
      v25 = &v26;
      v24 = v5;
      [v16 enumerateKeysAndObjectsUsingBlock:v22];
      if ([(id)v27[5] length])
      {
        v18 = PKLogFacilityTypeGetObject(0x10uLL);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = v27[5];
          *(_DWORD *)buf = 138412290;
          uint64_t v34 = v19;
          _os_log_impl(&dword_190E10000, v18, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
        }
      }
      _Block_object_dispose(&v26, 8);
    }
    urls = v5->_urls;
    v5->_urls = v17;
  }
  return v5;
}

void __39__PKDiscoveryMedia_initWithDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [[PKDiscoveryMediaRemoteAsset alloc] initWithDictionary:v5];
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v11];
  }
  else
  {
    uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    double v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    id v6 = (PKDiscoveryMediaRemoteAsset *)objc_claimAutoreleasedReturnValue();
    double v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    [v7 appendFormat:@"Malformed %@: expected dictionary and received %@", v6, v10];
  }
}

- (id)imageDataFromCacheWithScale:(double)a3
{
  v3 = [(PKDiscoveryMedia *)self _remoteAssetForScale:a3];
  if (v3)
  {
    id v4 = +[PKObjectDownloader sharedImageAssetDownloader];
    id v5 = [v3 url];
    id v6 = [v4 cachedDataForURL:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)downloadImageDataWithScale:(double)a3 shouldWriteData:(BOOL)a4 completion:(id)a5
{
  double v8 = (void (**)(id, void, uint64_t))a5;
  if (v8)
  {
    double v9 = [(PKDiscoveryMedia *)self _remoteAssetForScale:a3];
    uint64_t v10 = [v9 url];
    id v11 = (void *)v10;
    if (self->_type != 1 || v10 == 0)
    {
      v8[2](v8, 0, 1);
    }
    else
    {
      v13 = +[PKObjectDownloader sharedImageAssetDownloader];
      uint64_t v14 = [v13 cachedDataForURL:v11];
      v15 = [v9 sha1Hex];
      v16 = v15;
      if (v14)
      {
        ((void (**)(id, void *, uint64_t))v8)[2](v8, v14, 1);
      }
      else if (v15 && PKCachedFileForSHA1Exists(v15))
      {
        v17 = PKCachedFileForSHA1(v16);
        ((void (**)(id, void *, uint64_t))v8)[2](v8, v17, 1);
      }
      else
      {
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __74__PKDiscoveryMedia_downloadImageDataWithScale_shouldWriteData_completion___block_invoke;
        v18[3] = &unk_1E56DED50;
        id v19 = v11;
        v20 = v8;
        BOOL v21 = a4;
        [v13 downloadFromUrl:v19 completionHandler:v18];
      }
    }
  }
}

void __74__PKDiscoveryMedia_downloadImageDataWithScale_shouldWriteData_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_4;
  }
  id v10 = v8;
  if ([v10 statusCode] == 200)
  {

LABEL_4:
    if (v7)
    {
      if (*(unsigned char *)(a1 + 48))
      {
        id v11 = [v7 SHA1Hash];
        uint64_t v12 = [v11 hexEncoding];

        PKCacheFile(v7, v12);
      }
    }
    else
    {
      v13 = PKLogFacilityTypeGetObject(0x10uLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 32);
        int v18 = 138412546;
        uint64_t v19 = v14;
        __int16 v20 = 2112;
        id v21 = v9;
        _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Failed to download card image from %@ due to %@", (uint8_t *)&v18, 0x16u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_16;
  }
  v15 = PKLogFacilityTypeGetObject(0x10uLL);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = *(void *)(a1 + 32);
    int v18 = 138412546;
    uint64_t v19 = v16;
    __int16 v20 = 1024;
    LODWORD(v21) = [v10 statusCode];
    _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Could not download image asset from %@ http status %d", (uint8_t *)&v18, 0x12u);
  }

  uint64_t v17 = *(void *)(a1 + 40);
  if (v17) {
    (*(void (**)(uint64_t, void, void))(v17 + 16))(v17, 0, 0);
  }

LABEL_16:
}

- (id)_remoteAssetForScale:(double)a3
{
  if (a3 <= 2.0) {
    id v5 = @"2x";
  }
  else {
    id v5 = @"3x";
  }
  id v6 = v5;
  uint64_t v7 = [(NSDictionary *)self->_urls objectForKey:v6];
  if (v7)
  {
    id v8 = (void *)v7;
  }
  else
  {
    if (a3 >= 3.0) {
      id v9 = @"2x";
    }
    else {
      id v9 = @"3x";
    }
    id v10 = v9;

    id v8 = [(NSDictionary *)self->_urls objectForKey:v10];
    id v6 = v10;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->_type != *((void *)v4 + 1)) {
    goto LABEL_18;
  }
  urls = self->_urls;
  id v6 = (NSDictionary *)*((void *)v4 + 2);
  if (urls && v6)
  {
    if ((-[NSDictionary isEqual:](urls, "isEqual:") & 1) == 0) {
      goto LABEL_18;
    }
  }
  else if (urls != v6)
  {
    goto LABEL_18;
  }
  if (self->_width != *((double *)v4 + 3)
    || self->_height != *((double *)v4 + 4)
    || !CGColorEqualToColor(-[PKColor CGColor](self->_backgroundColor, "CGColor"), (CGColorRef)[*((id *)v4 + 5) CGColor]))
  {
    goto LABEL_18;
  }
  passKitUIImageName = self->_passKitUIImageName;
  id v8 = (NSString *)*((void *)v4 + 6);
  if (!passKitUIImageName || !v8)
  {
    if (passKitUIImageName == v8) {
      goto LABEL_14;
    }
LABEL_18:
    char v11 = 0;
    goto LABEL_19;
  }
  if ((-[NSString isEqual:](passKitUIImageName, "isEqual:") & 1) == 0) {
    goto LABEL_18;
  }
LABEL_14:
  localAssetURL = self->_localAssetURL;
  id v10 = (NSURL *)*((void *)v4 + 7);
  if (localAssetURL && v10) {
    char v11 = -[NSURL isEqual:](localAssetURL, "isEqual:");
  }
  else {
    char v11 = localAssetURL == v10;
  }
LABEL_19:

  return v11;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_urls];
  [v3 safelyAddObject:self->_backgroundColor];
  [v3 safelyAddObject:self->_passKitUIImageName];
  [v3 safelyAddObject:self->_localAssetURL];
  uint64_t v4 = PKCombinedHash(17, v3);
  int64_t v5 = self->_type - v4 + 32 * v4;
  unint64_t v6 = (unint64_t)self->_width - v5 + 32 * v5;
  unint64_t v7 = (unint64_t)self->_height - v6 + 32 * v6;

  return v7;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"%@: '%ld'; ", @"type", self->_type];
  [v3 appendFormat:@"%@: '%@'; ", @"urls", self->_urls];
  [v3 appendFormat:@"%@: '%f'; ", @"width", *(void *)&self->_width];
  [v3 appendFormat:@"%@: '%f'; ", @"height", *(void *)&self->_height];
  [v3 appendFormat:@"%@: '%@'; ", @"backgroundColor", self->_backgroundColor];
  [v3 appendFormat:@"%@: '%@'; ", @"bundleAssetFilename", self->_passKitUIImageName];
  [v3 appendFormat:@"%@: '%@'; ", @"localAssetURL", self->_localAssetURL];
  [v3 appendFormat:@">"];
  uint64_t v4 = (void *)[v3 copy];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeObject:self->_urls forKey:@"urls"];
  [v5 encodeDouble:@"width" forKey:self->_width];
  [v5 encodeDouble:@"height" forKey:self->_height];
  [v5 encodeObject:self->_backgroundColor forKey:@"backgroundColor"];
  [v5 encodeObject:self->_passKitUIImageName forKey:@"bundleAssetFilename"];
  [v5 encodeObject:self->_localAssetURL forKey:@"localAssetURL"];
}

- (PKDiscoveryMedia)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKDiscoveryMedia;
  id v5 = [(PKDiscoveryMedia *)&v21 init];
  if (v5)
  {
    v5->_int64_t type = [v4 decodeIntegerForKey:@"type"];
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    id v9 = objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"urls"];
    urls = v5->_urls;
    v5->_urls = (NSDictionary *)v10;

    [v4 decodeDoubleForKey:@"width"];
    v5->_width = v12;
    [v4 decodeDoubleForKey:@"height"];
    v5->_height = v13;
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backgroundColor"];
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (PKColor *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleAssetFilename"];
    passKitUIImageName = v5->_passKitUIImageName;
    v5->_passKitUIImageName = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localAssetURL"];
    localAssetURL = v5->_localAssetURL;
    v5->_localAssetURL = (NSURL *)v18;
  }
  return v5;
}

- (int64_t)type
{
  return self->_type;
}

- (NSDictionary)urls
{
  return self->_urls;
}

- (double)width
{
  return self->_width;
}

- (double)height
{
  return self->_height;
}

- (PKColor)backgroundColor
{
  return self->_backgroundColor;
}

- (NSString)passKitUIImageName
{
  return self->_passKitUIImageName;
}

- (NSURL)localAssetURL
{
  return self->_localAssetURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localAssetURL, 0);
  objc_storeStrong((id *)&self->_passKitUIImageName, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_urls, 0);
}

@end