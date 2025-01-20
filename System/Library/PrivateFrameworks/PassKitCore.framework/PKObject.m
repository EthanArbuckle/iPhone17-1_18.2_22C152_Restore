@interface PKObject
+ (BOOL)isValidObjectWithFileDataAccessor:(id)a3 validationOptions:(unint64_t)a4 warnings:(id *)a5 error:(id *)a6 signingDate:(id *)a7 passDictionary:(id)a8;
+ (BOOL)supportsSecureCoding;
+ (Class)classForDictionary:(id)a3 bundle:(id)a4;
+ (Class)resolvingClass;
+ (id)_createWithFileDataAccessor:(id)a3 validationOptions:(unint64_t)a4 warnings:(id *)a5 error:(id *)a6;
+ (id)createWithData:(id)a3 warnings:(id *)a4 error:(id *)a5;
+ (id)createWithFileDataAccessor:(id)a3 warnings:(id *)a4 error:(id *)a5;
+ (id)createWithFileURL:(id)a3 warnings:(id *)a4 error:(id *)a5;
+ (id)createWithValidatedFileDataAccessor:(id)a3;
+ (id)dataTypeIdentifier;
+ (id)fetchSigningDateForObjectWithFileDataAccessor:(id)a3 passDictionary:(id)a4;
+ (unint64_t)defaultSettings;
- (BOOL)initializedViaInitWithCoder;
- (BOOL)isContentLoaded;
- (BOOL)isImageSetLoaded:(int64_t)a3;
- (BOOL)isImageSetType:(int64_t)a3 equalToImageSetTypeFromObject:(id)a4;
- (BOOL)remoteAssetsDownloadedForSEIDs:(id)a3;
- (NSData)manifestHash;
- (NSDate)signingDate;
- (NSString)authenticationToken;
- (NSString)preferredImageSuffix;
- (NSString)uniqueID;
- (NSURL)webServiceURL;
- (PKDataAccessor)dataAccessor;
- (PKDisplayProfile)displayProfile;
- (PKDisplayTraitCollection)preferredDisplayTraits;
- (PKObject)init;
- (PKObject)initWithCoder:(id)a3;
- (PKObject)initWithData:(id)a3 error:(id *)a4;
- (PKObject)initWithDictionary:(id)a3 bundle:(id)a4;
- (PKObject)initWithFileURL:(id)a3 error:(id *)a4;
- (double)preferredImageScale;
- (id)archiveData;
- (id)content;
- (id)contentLoadedIfNeeded;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataForBundleResourceNamed:(id)a3 withExtension:(id)a4;
- (id)dataForBundleResources:(id)a3;
- (id)imageSetLoadedIfNeeded:(int64_t)a3;
- (id)localizedString:(id)a3;
- (id)modificationDate;
- (id)passLocalizedStringForKey:(id)a3;
- (id)serializedFileWrapper;
- (int64_t)shareCount;
- (unint64_t)settings;
- (void)_lock_flushLoadedImageSets;
- (void)dealloc;
- (void)downloadRemoteAssetsForSEIDS:(id)a3 completion:(id)a4;
- (void)downloadRemoteAssetsWithCloudStoreCoordinatorDelegate:(id)a3 seids:(id)a4 completion:(id)a5;
- (void)downloadRemoteAssetsWithCompletion:(id)a3;
- (void)downloadRemoteAssetsWithConfiguration:(id)a3 completion:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)flushFormattedFieldValues;
- (void)flushLoadedContent;
- (void)flushLoadedImageSets;
- (void)loadCachedImageSet:(int64_t)a3;
- (void)loadContentAsyncWithCompletion:(id)a3;
- (void)loadContentSync;
- (void)loadImageSetAsync:(int64_t)a3 preheat:(BOOL)a4 withCompletion:(id)a5;
- (void)loadImageSetSync:(int64_t)a3 preheat:(BOOL)a4;
- (void)noteShared;
- (void)reloadDisplayProfileOfType:(int64_t)a3;
- (void)requestUpdateWithCompletion:(id)a3;
- (void)revocationStatusWithCompletion:(id)a3;
- (void)setAuthenticationToken:(id)a3;
- (void)setContent:(id)a3;
- (void)setDataAccessor:(id)a3;
- (void)setDisplayProfile:(id)a3;
- (void)setImageSet:(id)a3 forImageSetType:(int64_t)a4;
- (void)setManifestHash:(id)a3;
- (void)setMissingImageSetsFromObject:(id)a3;
- (void)setPreferredDisplayTraits:(id)a3;
- (void)setPreferredImageScale:(double)a3;
- (void)setPreferredImageSuffix:(id)a3;
- (void)setSettings:(unint64_t)a3;
- (void)setSettingsWithoutUpdatingDataAccessor:(unint64_t)a3;
- (void)setShareCount:(int64_t)a3;
- (void)setSigningDate:(id)a3;
- (void)setUniqueID:(id)a3;
- (void)setWebServiceURL:(id)a3;
@end

@implementation PKObject

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredImageSuffix, 0);
  objc_storeStrong((id *)&self->_signingDate, 0);
  objc_storeStrong((id *)&self->_authenticationToken, 0);
  objc_storeStrong((id *)&self->_webServiceURL, 0);
  objc_storeStrong((id *)&self->_displayProfile, 0);
  objc_storeStrong((id *)&self->_dataAccessor, 0);
  objc_storeStrong((id *)&self->_manifestHash, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_preferredDisplayTraits, 0);
  for (uint64_t i = 88; i != 16; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_content, 0);
}

- (PKObject)init
{
  return [(PKObject *)self initWithDictionary:0 bundle:0];
}

- (void)encodeWithCoder:(id)a3
{
  id v15 = a3;
  v4 = (void *)MEMORY[0x192FDC630]();
  v5 = [(PKObject *)self uniqueID];
  [v15 encodeObject:v5 forKey:@"uniqueID"];

  v6 = [(PKObject *)self manifestHash];
  [v15 encodeObject:v6 forKey:@"manifestHash"];

  v7 = [(PKObject *)self content];
  [v15 encodeObject:v7 forKey:@"content"];

  v8 = [(PKObject *)self webServiceURL];
  [v15 encodeObject:v8 forKey:@"webServiceURL"];

  v9 = [(PKObject *)self authenticationToken];
  [v15 encodeObject:v9 forKey:@"authenticationToken"];

  v10 = [(PKObject *)self displayProfile];
  [v15 encodeObject:v10 forKey:@"displayProfile"];

  objc_msgSend(v15, "encodeInteger:forKey:", -[PKObject settings](self, "settings"), @"settings");
  objc_msgSend(v15, "encodeInteger:forKey:", -[PKObject shareCount](self, "shareCount"), @"shareCount");
  v11 = [(PKObject *)self signingDate];
  [v15 encodeObject:v11 forKey:@"signingDate"];

  for (uint64_t i = 0; i != 9; ++i)
  {
    v13 = self->_imageSets[i];
    v14 = objc_msgSend(NSString, "stringWithFormat:", @"images_%ld", i);
    [v15 encodeObject:v13 forKey:v14];
  }
}

- (id)content
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_content;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (PKDisplayProfile)displayProfile
{
  return self->_displayProfile;
}

- (NSURL)webServiceURL
{
  return self->_webServiceURL;
}

- (NSDate)signingDate
{
  return self->_signingDate;
}

- (int64_t)shareCount
{
  return self->_shareCount;
}

- (unint64_t)settings
{
  return self->_settings;
}

- (NSData)manifestHash
{
  return self->_manifestHash;
}

- (PKObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)PKObject;
  v5 = [(PKObject *)&v38 init];
  if (v5)
  {
    v37 = (void *)MEMORY[0x192FDC630]();
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueID"];
    [(PKObject *)v5 setUniqueID:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"manifestHash"];
    [(PKObject *)v5 setManifestHash:v7];

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v11 = [v4 decodeObjectOfClasses:v10 forKey:@"content"];
    [(PKObject *)v5 setContent:v11];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"webServiceURL"];
    [(PKObject *)v5 setWebServiceURL:v12];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authenticationToken"];
    [(PKObject *)v5 setAuthenticationToken:v13];

    v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v17 = [v4 decodeObjectOfClasses:v16 forKey:@"displayProfile"];
    [(PKObject *)v5 setDisplayProfile:v17];

    -[PKObject setShareCount:](v5, "setShareCount:", [v4 decodeIntegerForKey:@"shareCount"]);
    -[PKObject setSettingsWithoutUpdatingDataAccessor:](v5, "setSettingsWithoutUpdatingDataAccessor:", [v4 decodeIntegerForKey:@"settings"]);
    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signingDate"];
    [(PKObject *)v5 setSigningDate:v18];

    v36 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v35 = objc_opt_class();
    uint64_t v34 = objc_opt_class();
    uint64_t v33 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = objc_opt_class();
    v26 = objc_msgSend(v36, "setWithObjects:", v35, v34, v33, v19, v20, v21, v22, v23, v24, v25, objc_opt_class(), 0);
    uint64_t v27 = 0;
    imageSets = v5->_imageSets;
    do
    {
      v29 = objc_msgSend(NSString, "stringWithFormat:", @"images_%ld", v27);
      uint64_t v30 = [v4 decodeObjectOfClasses:v26 forKey:v29];
      v31 = imageSets[v27];
      imageSets[v27] = (PKImageSet *)v30;

      ++v27;
    }
    while (v27 != 9);
    v5->_initializedViaInitWithCoder = 1;
  }

  return v5;
}

- (void)setWebServiceURL:(id)a3
{
}

- (void)setUniqueID:(id)a3
{
}

- (void)setDisplayProfile:(id)a3
{
}

- (void)setAuthenticationToken:(id)a3
{
}

- (void)setSigningDate:(id)a3
{
}

- (void)setShareCount:(int64_t)a3
{
  self->_shareCount = a3;
}

- (void)setSettingsWithoutUpdatingDataAccessor:(unint64_t)a3
{
  self->_settings = a3;
}

- (void)setManifestHash:(id)a3
{
}

- (void)setContent:(id)a3
{
  id v4 = (PKContent *)a3;
  os_unfair_lock_lock(&self->_lock);
  content = self->_content;
  self->_content = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)authenticationToken
{
  return self->_authenticationToken;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (id)contentLoadedIfNeeded
{
  [(PKObject *)self loadContentSync];
  return [(PKObject *)self content];
}

- (void)loadContentSync
{
  if (![(PKObject *)self isContentLoaded])
  {
    id v4 = [(PKObject *)self dataAccessor];
    v3 = [v4 content];
    [(PKObject *)self setContent:v3];
  }
}

- (BOOL)isContentLoaded
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_content != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)imageSetLoadedIfNeeded:(int64_t)a3
{
  [(PKObject *)self loadImageSetSync:a3 preheat:0];
  v5 = self->_imageSets[a3];
  return v5;
}

- (void)loadImageSetSync:(int64_t)a3 preheat:(BOOL)a4
{
  BOOL v4 = a4;
  if (!-[PKObject isImageSetLoaded:](self, "isImageSetLoaded:"))
  {
    v7 = [(PKObject *)self dataAccessor];
    [(PKObject *)self preferredImageScale];
    double v9 = v8;
    v10 = [(PKObject *)self preferredImageSuffix];
    v11 = [(PKObject *)self displayProfile];
    id v12 = [v7 imageSetForType:a3 screenScale:v10 suffix:v11 displayProfile:v4 preheat:v9];

    [(PKObject *)self setImageSet:v12 forImageSetType:a3];
  }
}

- (BOOL)isImageSetLoaded:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(a3) = self->_imageSets[a3] != 0;
  os_unfair_lock_unlock(p_lock);
  return a3;
}

- (PKDataAccessor)dataAccessor
{
  return self->_dataAccessor;
}

- (void)setImageSet:(id)a3 forImageSetType:(int64_t)a4
{
  v6 = (objc_class *)a3;
  os_unfair_lock_lock(&self->_lock);
  v7 = &self->super.isa + a4;
  Class v8 = v7[3];
  v7[3] = v6;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)preferredImageSuffix
{
  return self->_preferredImageSuffix;
}

- (double)preferredImageScale
{
  return self->_preferredImageScale;
}

- (void)dealloc
{
  for (uint64_t i = 24; i != 96; i += 8)
  {
    BOOL v4 = *(Class *)((char *)&self->super.isa + i);
    *(Class *)((char *)&self->super.isa + i) = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)PKObject;
  [(PKObject *)&v5 dealloc];
}

- (PKObject)initWithDictionary:(id)a3 bundle:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PKObject;
  BOOL v4 = [(PKObject *)&v6 init];
  if (v4)
  {
    v4->_settings = [(id)objc_opt_class() defaultSettings];
    v4->_lock._os_unfair_lock_opaque = 0;
  }
  return v4;
}

+ (id)createWithValidatedFileDataAccessor:(id)a3
{
  return (id)[a1 _createWithFileDataAccessor:a3 validationOptions:1 warnings:0 error:0];
}

+ (id)_createWithFileDataAccessor:(id)a3 validationOptions:(unint64_t)a4 warnings:(id *)a5 error:(id *)a6
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  if (v18)
  {
    uint64_t v19 = (objc_class *)[a1 resolvingClass];
    if (v19 != a1)
    {
      uint64_t v20 = v19;
      uint64_t v21 = PKLogFacilityTypeGetObject(0);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = NSStringFromClass((Class)a1);
        uint64_t v23 = NSStringFromClass(v20);
        *(_DWORD *)buf = 138412546;
        v67 = v22;
        __int16 v68 = 2112;
        v69 = v23;
        _os_log_impl(&dword_190E10000, v21, OS_LOG_TYPE_DEFAULT, "PKObject: unable to use subclass %@ to create an automatically typed object instead of root resolving class %@.", buf, 0x16u);
      }
      if (a6)
      {
        uint64_t v24 = NSStringFromClass((Class)a1);
        v59 = NSStringFromClass(v20);
        PKValidationErrorWithReason(@"forbidden to use subclass %@ to create an automatically typed object instead of root resolving class %@.", v25, v26, v27, v28, v29, v30, v31, (uint64_t)v24);
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_9;
    }
    uint64_t v33 = (void *)MEMORY[0x192FDC630]();
    uint64_t v34 = [v18 dictionary];
    uint64_t v35 = [v18 bundle];
    v43 = (void *)v35;
    if (v34 && v35)
    {
      v44 = (void *)[a1 classForDictionary:v34 bundle:v35];
      if (a5) {
        v45 = &v65;
      }
      else {
        v45 = 0;
      }
      if (a5) {
        id v65 = 0;
      }
      if (a6) {
        v46 = &v64;
      }
      else {
        v46 = 0;
      }
      if (a6) {
        id v64 = 0;
      }
      id v63 = 0;
      v60 = v44;
      int v47 = [v44 isValidObjectWithFileDataAccessor:v18 validationOptions:a4 warnings:v45 error:v46 signingDate:&v63 passDictionary:v34];
      if (a5) {
        id v48 = v65;
      }
      else {
        id v48 = 0;
      }
      v62 = v33;
      if (a6) {
        id v49 = v64;
      }
      else {
        id v49 = 0;
      }
      id v52 = v63;
      id v61 = v63;
      if (v47)
      {
        v53 = [v60 dataTypeIdentifier];
        [v18 setExplicitDataTypeIdentifier:v53];

        uint64_t v54 = [objc_alloc((Class)v60) initWithDictionary:v34 bundle:v43];
        uint64_t v50 = v54;
        if (v54)
        {
          objc_storeStrong((id *)(v54 + 128), a3);
          uint64_t v55 = [v18 manifestHash];
          v56 = *(void **)(v50 + 120);
          *(void *)(v50 + 120) = v55;

          objc_storeStrong((id *)(v50 + 160), v52);
        }
      }
      else
      {
        uint64_t v50 = 0;
      }
      v51 = v61;
      uint64_t v33 = v62;
    }
    else
    {
      PKValidationErrorWithReason(0, v36, v37, v38, v39, v40, v41, v42, v58);
      id v49 = (id)objc_claimAutoreleasedReturnValue();
      id v48 = 0;
      uint64_t v50 = 0;
      v51 = 0;
    }

    if (a5 && v48) {
      *a5 = v48;
    }
    if (a6 && v49) {
      *a6 = v49;
    }
    id v32 = (id)v50;
  }
  else
  {
    if (!a6)
    {
LABEL_9:
      id v32 = 0;
      goto LABEL_41;
    }
    PKValidationErrorWithReason(0, v11, v12, v13, v14, v15, v16, v17, v58);
    id v32 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_41:

  return v32;
}

- (void)setDataAccessor:(id)a3
{
}

- (PKObject)initWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (PKObject *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "resolvingClass"), "createWithData:warnings:error:", v6, 0, a4);

  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    return 0;
  }
  return v7;
}

- (PKObject)initWithFileURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (PKObject *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "resolvingClass"), "createWithFileURL:warnings:error:", v6, 0, a4);

  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    return 0;
  }
  return v7;
}

+ (id)createWithData:(id)a3 warnings:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  id v14 = 0;
  double v9 = [[PKSerializedDataAccessor alloc] initWithData:v8 error:&v14];

  id v10 = v14;
  uint64_t v11 = v10;
  if (v10)
  {
    uint64_t v12 = 0;
    if (a5) {
      *a5 = v10;
    }
  }
  else
  {
    uint64_t v12 = (void *)[a1 createWithFileDataAccessor:v9 warnings:a4 error:a5];
  }

  return v12;
}

+ (id)createWithFileURL:(id)a3 warnings:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  id v14 = 0;
  double v9 = [[PKFileDataAccessor alloc] initWithFileURL:v8 error:&v14];

  id v10 = v14;
  uint64_t v11 = v10;
  if (v10)
  {
    uint64_t v12 = 0;
    if (a5) {
      *a5 = v10;
    }
  }
  else
  {
    uint64_t v12 = (void *)[a1 createWithFileDataAccessor:v9 warnings:a4 error:a5];
  }

  return v12;
}

+ (id)createWithFileDataAccessor:(id)a3 warnings:(id *)a4 error:(id *)a5
{
  return (id)[a1 _createWithFileDataAccessor:a3 validationOptions:14 warnings:a4 error:a5];
}

- (void)loadContentAsyncWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(PKObject *)self isContentLoaded])
  {
    objc_super v5 = dispatch_get_global_queue(0, 0);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __43__PKObject_loadContentAsyncWithCompletion___block_invoke_4;
    v11[3] = &unk_1E56D8360;
    id v12 = v4;
    id v6 = v11;
    id block = (id)MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    uint64_t v20 = __dispatch_async_ar_block_invoke_12;
    uint64_t v21 = &unk_1E56D8360;
    id v22 = v6;
    dispatch_async(v5, &block);

    v7 = v12;
  }
  else
  {
    uint64_t v8 = [(PKObject *)self dataAccessor];
    if (v8)
    {
      v7 = (void *)v8;
      objc_initWeak(&block, self);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __43__PKObject_loadContentAsyncWithCompletion___block_invoke;
      v15[3] = &unk_1E56ED120;
      objc_copyWeak(&v17, &block);
      id v16 = v4;
      [v7 contentWithCompletion:v15];

      objc_destroyWeak(&v17);
      objc_destroyWeak(&block);
    }
    else
    {
      double v9 = dispatch_get_global_queue(0, 0);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __43__PKObject_loadContentAsyncWithCompletion___block_invoke_3;
      v13[3] = &unk_1E56D8360;
      id v14 = v4;
      id v10 = v13;
      id block = (id)MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      uint64_t v20 = __dispatch_async_ar_block_invoke_12;
      uint64_t v21 = &unk_1E56D8360;
      id v22 = v10;
      dispatch_async(v9, &block);

      v7 = 0;
    }
  }
}

void __43__PKObject_loadContentAsyncWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setContent:v4];

  id v6 = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__PKObject_loadContentAsyncWithCompletion___block_invoke_2;
  v8[3] = &unk_1E56D8360;
  id v9 = *(id *)(a1 + 32);
  v7 = v8;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_12;
  block[3] = &unk_1E56D8360;
  id v11 = v7;
  dispatch_async(v6, block);
}

uint64_t __43__PKObject_loadContentAsyncWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __43__PKObject_loadContentAsyncWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __43__PKObject_loadContentAsyncWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)flushLoadedContent
{
}

- (void)flushFormattedFieldValues
{
  id v2 = [(PKObject *)self content];
  [v2 flushFormattedFieldValues];
}

- (PKDisplayTraitCollection)preferredDisplayTraits
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  preferredDisplayTraits = self->_preferredDisplayTraits;
  p_preferredDisplayTraits = &self->_preferredDisplayTraits;
  id v6 = preferredDisplayTraits;
  if (!v6)
  {
    id v6 = [[PKDisplayTraitCollection alloc] initWithDefaultTraits];
    objc_storeStrong((id *)p_preferredDisplayTraits, v6);
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)setPreferredDisplayTraits:(id)a3
{
  id v4 = (PKDisplayTraitCollection *)a3;
  os_unfair_lock_lock(&self->_lock);
  preferredDisplayTraits = self->_preferredDisplayTraits;
  self->_preferredDisplayTraits = v4;

  [(PKObject *)self _lock_flushLoadedImageSets];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)loadCachedImageSet:(int64_t)a3
{
  if (!-[PKObject isImageSetLoaded:](self, "isImageSetLoaded:"))
  {
    dataAccessor = self->_dataAccessor;
    displayProfile = self->_displayProfile;
    v7 = [(PKObject *)self preferredDisplayTraits];
    id v9 = [(PKDataAccessor *)dataAccessor cachedImageSetForType:a3 withDisplayProfile:displayProfile displayTraits:v7];

    uint64_t v8 = v9;
    if (v9)
    {
      [(PKObject *)self setImageSet:v9 forImageSetType:a3];
      uint64_t v8 = v9;
    }
  }
}

- (void)loadImageSetAsync:(int64_t)a3 preheat:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v5 = a4;
  uint64_t v8 = (void (**)(void))a5;
  if ([(PKObject *)self isImageSetLoaded:a3])
  {
    id v9 = dispatch_get_global_queue(0, 0);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __53__PKObject_loadImageSetAsync_preheat_withCompletion___block_invoke_2;
    v17[3] = &unk_1E56D8360;
    id v18 = v8;
    id v10 = v17;
    block[0] = (id)MEMORY[0x1E4F143A8];
    block[1] = (id)3221225472;
    block[2] = __dispatch_async_ar_block_invoke_12;
    block[3] = &unk_1E56D8360;
    id v23 = v10;
    dispatch_async(v9, block);

    id v11 = v18;
  }
  else
  {
    uint64_t v12 = [(PKObject *)self dataAccessor];
    if (v12)
    {
      id v11 = (void *)v12;
      objc_initWeak(block, self);
      [(PKObject *)self preferredImageScale];
      double v14 = v13;
      uint64_t v15 = [(PKObject *)self preferredImageSuffix];
      id v16 = [(PKObject *)self displayProfile];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __53__PKObject_loadImageSetAsync_preheat_withCompletion___block_invoke;
      v19[3] = &unk_1E56ED148;
      objc_copyWeak(v21, block);
      v21[1] = (id)a3;
      uint64_t v20 = v8;
      [v11 imageSetForType:a3 screenScale:v15 suffix:v16 displayProfile:v5 preheat:v19 withCompletion:v14];

      objc_destroyWeak(v21);
      objc_destroyWeak(block);
    }
    else
    {
      if (v8) {
        v8[2](v8);
      }
      id v11 = 0;
    }
  }
}

void __53__PKObject_loadImageSetAsync_preheat_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained setImageSet:v6 forImageSetType:*(void *)(a1 + 48)];
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

uint64_t __53__PKObject_loadImageSetAsync_preheat_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)flushLoadedImageSets
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(PKObject *)self _lock_flushLoadedImageSets];
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_flushLoadedImageSets
{
  for (uint64_t i = 24; i != 96; i += 8)
  {
    id v4 = *(Class *)((char *)&self->super.isa + i);
    *(Class *)((char *)&self->super.isa + i) = 0;
  }
}

- (void)revocationStatusWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(PKObject *)self dataAccessor];
  [v5 revocationStatusWithCompletion:v4];
}

- (void)requestUpdateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(PKObject *)self dataAccessor];
  [v5 requestUpdateWithCompletion:v4];
}

- (void)noteShared
{
  [(PKObject *)self setShareCount:[(PKObject *)self shareCount] + 1];
  id v3 = [(PKObject *)self dataAccessor];
  [v3 noteShared];
}

- (BOOL)remoteAssetsDownloadedForSEIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(PKObject *)self dataAccessor];
  char v6 = [v5 remoteAssetsDownloadedForSEIDs:v4];

  return v6;
}

- (void)downloadRemoteAssetsWithCompletion:(id)a3
{
}

- (void)downloadRemoteAssetsForSEIDS:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_alloc_init(PKDownloadRemoteAssetConfiguration);
  [(PKDownloadRemoteAssetConfiguration *)v8 setSeids:v7];

  [(PKObject *)self downloadRemoteAssetsWithConfiguration:v8 completion:v6];
}

- (void)downloadRemoteAssetsWithCloudStoreCoordinatorDelegate:(id)a3 seids:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(PKDownloadRemoteAssetConfiguration);
  [(PKDownloadRemoteAssetConfiguration *)v11 setCloudStoreCoordinatorDelegate:v10];

  [(PKDownloadRemoteAssetConfiguration *)v11 setSeids:v9];
  [(PKObject *)self downloadRemoteAssetsWithConfiguration:v11 completion:v8];
}

- (void)downloadRemoteAssetsWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PKObject *)self dataAccessor];
  [v8 downloadRemoteAssetsWithConfiguration:v7 completion:v6];
}

- (id)localizedString:(id)a3
{
  id v4 = a3;
  id v5 = [(PKObject *)self dataAccessor];
  id v6 = [v5 bundle];

  id v7 = PKLocalizedPassStringForPassBundle(v4, v6, 0);

  return v7;
}

- (id)archiveData
{
  id v2 = [(PKObject *)self dataAccessor];
  id v3 = [v2 archiveData];

  return v3;
}

- (id)serializedFileWrapper
{
  id v2 = [(PKObject *)self dataAccessor];
  id v3 = [v2 serializedFileWrapper];

  return v3;
}

- (id)modificationDate
{
  id v2 = [(PKObject *)self dataAccessor];
  id v3 = [v2 resourceValueForKey:*MEMORY[0x1E4F1C530]];

  return v3;
}

- (void)setSettings:(unint64_t)a3
{
  if (self->_settings != a3)
  {
    self->_settings = a3;
    id v4 = [(PKObject *)self dataAccessor];
    [v4 updateSettings:a3];
  }
}

- (void)reloadDisplayProfileOfType:(int64_t)a3
{
  id v5 = [(PKObject *)self dataAccessor];
  id v7 = [v5 displayProfileOfType:a3];

  id v6 = v7;
  if (v7)
  {
    [(PKObject *)self setDisplayProfile:v7];
    id v6 = v7;
  }
}

- (id)dataForBundleResourceNamed:(id)a3 withExtension:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PKObject *)self dataAccessor];
  id v9 = [v8 dataForBundleResourceNamed:v7 withExtension:v6];

  return v9;
}

- (id)dataForBundleResources:(id)a3
{
  id v4 = a3;
  id v5 = [(PKObject *)self dataAccessor];
  id v6 = [v5 dataForBundleResources:v4];

  return v6;
}

- (id)passLocalizedStringForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(PKObject *)self dataAccessor];
  id v6 = [v5 passLocalizedStringForKey:v4];

  return v6;
}

+ (Class)resolvingClass
{
  return (Class)objc_opt_class();
}

+ (Class)classForDictionary:(id)a3 bundle:(id)a4
{
  return (Class)objc_opt_class();
}

+ (id)dataTypeIdentifier
{
  return 0;
}

+ (BOOL)isValidObjectWithFileDataAccessor:(id)a3 validationOptions:(unint64_t)a4 warnings:(id *)a5 error:(id *)a6 signingDate:(id *)a7 passDictionary:(id)a8
{
  return 1;
}

+ (id)fetchSigningDateForObjectWithFileDataAccessor:(id)a3 passDictionary:(id)a4
{
  return 0;
}

- (BOOL)isImageSetType:(int64_t)a3 equalToImageSetTypeFromObject:(id)a4
{
  id v6 = a4;
  id v7 = [(PKObject *)self imageSetLoadedIfNeeded:a3];
  id v8 = [v6 imageSetLoadedIfNeeded:a3];

  LOBYTE(v6) = [v7 isEqual:v8];
  return (char)v6;
}

- (void)setMissingImageSetsFromObject:(id)a3
{
  id v4 = (PKObject *)a3;
  if (v4 && self != v4)
  {
    if (self >= v4) {
      id v5 = v4;
    }
    else {
      id v5 = self;
    }
    id v10 = v4;
    if (self >= v4) {
      id v6 = self;
    }
    else {
      id v6 = v4;
    }
    p_lock = &v5->_lock;
    os_unfair_lock_lock(&v5->_lock);
    id v8 = &v6->_lock;
    os_unfair_lock_lock(v8);
    for (uint64_t i = 24; i != 96; i += 8)
    {
      if (!*(Class *)((char *)&self->super.isa + i)) {
        objc_storeStrong((id *)((char *)&self->super.isa + i), *(id *)((char *)&v10->super.isa + i));
      }
    }
    os_unfair_lock_unlock(v8);
    os_unfair_lock_unlock(p_lock);
    id v4 = v10;
  }
}

+ (unint64_t)defaultSettings
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_uniqueID copyWithZone:a3];
  id v7 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v6;

  uint64_t v8 = [(NSData *)self->_manifestHash copyWithZone:a3];
  id v9 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v8;

  uint64_t v10 = [(PKObject *)self content];
  id v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  uint64_t v12 = [(NSURL *)self->_webServiceURL copyWithZone:a3];
  double v13 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v12;

  uint64_t v14 = [(NSString *)self->_authenticationToken copyWithZone:a3];
  uint64_t v15 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v14;

  id v16 = [(PKDisplayProfile *)self->_displayProfile copyWithZone:a3];
  id v17 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v16;

  uint64_t v18 = [(NSString *)self->_preferredImageSuffix copyWithZone:a3];
  uint64_t v19 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v18;

  *(void *)(v5 + 176) = self->_shareCount;
  *(void *)(v5 + 168) = self->_settings;
  objc_storeStrong((id *)(v5 + 160), self->_signingDate);
  for (uint64_t i = 24; i != 96; i += 8)
    objc_storeStrong((id *)(v5 + i), *(id *)((char *)&self->super.isa + i));
  return (id)v5;
}

- (BOOL)initializedViaInitWithCoder
{
  return self->_initializedViaInitWithCoder;
}

- (void)setPreferredImageScale:(double)a3
{
  self->_preferredImageScale = a3;
}

- (void)setPreferredImageSuffix:(id)a3
{
}

@end