@interface WFFileProviderLocation
+ (BOOL)canRepresentURL:(id)a3;
+ (BOOL)canRepresentURL:(id)a3 item:(id)a4 parentItems:(id)a5;
+ (BOOL)supportsSecureCoding;
+ (Class)supportedClassForURL:(id)a3;
+ (id)locationWithSerializedRepresentation:(id)a3;
+ (id)subpathFromURL:(id)a3;
+ (id)subpathFromURL:(id)a3 item:(id)a4;
- (BOOL)isSupportedOnCurrentPlatform;
- (BOOL)shouldShowUsersDuringDisplay:(id)a3;
- (NSString)appContainerBundleIdentifier;
- (NSString)crossDeviceItemID;
- (NSString)fileProviderDomainID;
- (WFFileProviderLocation)initWithCoder:(id)a3;
- (WFFileProviderLocation)initWithFileProviderDomainID:(id)a3 crossDeviceItemID:(id)a4 appContainerBundleIdentifier:(id)a5 relativeSubpath:(id)a6;
- (WFFileProviderLocation)initWithURL:(id)a3;
- (id)resolveCrossDeviceItemIDWithError:(id *)a3;
- (id)resolveLocationFromProviderDomainID;
- (id)resolveLocationWithError:(id *)a3;
- (id)serializedRepresentation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFFileProviderLocation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appContainerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_crossDeviceItemID, 0);
  objc_storeStrong((id *)&self->_fileProviderDomainID, 0);
}

- (NSString)appContainerBundleIdentifier
{
  return self->_appContainerBundleIdentifier;
}

- (NSString)crossDeviceItemID
{
  return self->_crossDeviceItemID;
}

- (NSString)fileProviderDomainID
{
  return self->_fileProviderDomainID;
}

- (id)serializedRepresentation
{
  v10.receiver = self;
  v10.super_class = (Class)WFFileProviderLocation;
  v3 = [(WFFileLocation *)&v10 serializedRepresentation];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  id v5 = v4;

  v6 = [(WFFileProviderLocation *)self fileProviderDomainID];
  [v5 setValue:v6 forKey:@"fileProviderDomainID"];

  v7 = [(WFFileProviderLocation *)self crossDeviceItemID];
  [v5 setValue:v7 forKey:@"crossDeviceItemID"];

  v8 = [(WFFileProviderLocation *)self appContainerBundleIdentifier];
  [v5 setValue:v8 forKey:@"appContainerBundleIdentifier"];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFFileProviderLocation;
  id v4 = a3;
  [(WFFileLocation *)&v7 encodeWithCoder:v4];
  id v5 = [(WFFileProviderLocation *)self fileProviderDomainID];
  [v4 encodeObject:v5 forKey:@"fileProviderDomainID"];

  v6 = [(WFFileProviderLocation *)self crossDeviceItemID];
  [v4 encodeObject:v6 forKey:@"crossDeviceItemID"];
}

- (WFFileProviderLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFFileProviderLocation;
  id v5 = [(WFFileLocation *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fileProviderDomainID"];
    fileProviderDomainID = v5->_fileProviderDomainID;
    v5->_fileProviderDomainID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"crossDeviceItemID"];
    crossDeviceItemID = v5->_crossDeviceItemID;
    v5->_crossDeviceItemID = (NSString *)v8;

    objc_super v10 = v5;
  }

  return v5;
}

- (BOOL)shouldShowUsersDuringDisplay:(id)a3
{
  return 0;
}

- (BOOL)isSupportedOnCurrentPlatform
{
  return 1;
}

- (id)resolveLocationFromProviderDomainID
{
  v3 = [(WFFileProviderLocation *)self fileProviderDomainID];
  id v4 = +[WFFileLocationUtilities fetchRootItemURLForDomainWithID:v3];

  if (v4)
  {
    id v5 = [(WFFileLocation *)self relativeSubpath];
    uint64_t v6 = [v4 URLByAppendingPathComponent:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)resolveLocationWithError:(id *)a3
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__41058;
  v21 = __Block_byref_object_dispose__41059;
  id v22 = [(WFFileProviderLocation *)self resolveCrossDeviceItemIDWithError:a3];
  id v4 = (void *)v18[5];
  if (v4) {
    goto LABEL_4;
  }
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v6 = [WFFPItemResolver alloc];
  objc_super v7 = [(WFFileProviderLocation *)self fileProviderDomainID];
  uint64_t v8 = [(WFFileLocation *)self relativeSubpath];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51__WFFileProviderLocation_resolveLocationWithError___block_invoke;
  v14[3] = &unk_1E65531C8;
  v16 = &v17;
  v9 = v5;
  v15 = v9;
  objc_super v10 = [(WFFPItemResolver *)v6 initWithDomainID:v7 relativeSubpath:v8 completionHandler:v14];

  if (v10)
  {
    dispatch_time_t v11 = dispatch_time(0, 10000000000);
    dispatch_semaphore_wait(v9, v11);

    id v4 = (void *)v18[5];
LABEL_4:
    id v12 = v4;
    goto LABEL_5;
  }

  id v12 = 0;
LABEL_5:
  _Block_object_dispose(&v17, 8);

  return v12;
}

void __51__WFFileProviderLocation_resolveLocationWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4FB4540] standardClient];
    id v10 = 0;
    dispatch_semaphore_t v5 = [v4 fetchURLForFPItem:v3 error:&v10];
    id v6 = v10;

    if (!v5)
    {
      objc_super v7 = getWFFilesLogObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v12 = "-[WFFileProviderLocation resolveLocationWithError:]_block_invoke";
        __int16 v13 = 2112;
        id v14 = v6;
        _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_ERROR, "%s Could not fetch URL for FPItem with error: %@", buf, 0x16u);
      }
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v5);
    uint64_t v8 = getWFFilesLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      id v12 = "-[WFFileProviderLocation resolveLocationWithError:]_block_invoke";
      __int16 v13 = 2112;
      id v14 = v3;
      __int16 v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_DEBUG, "%s Found item: %@ with fetched URL: %@", buf, 0x20u);
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else
  {
    v9 = getWFFilesLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v12 = "-[WFFileProviderLocation resolveLocationWithError:]_block_invoke";
      _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_ERROR, "%s WFFPItemResolver found no item", buf, 0xCu);
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

- (id)resolveCrossDeviceItemIDWithError:(id *)a3
{
  dispatch_semaphore_t v5 = [(WFFileProviderLocation *)self crossDeviceItemID];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4FB4540] standardClient];
    objc_super v7 = [(WFFileProviderLocation *)self crossDeviceItemID];
    uint64_t v8 = [v6 resolveCrossDeviceItemID:v7 error:a3];
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

- (WFFileProviderLocation)initWithURL:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"WFFileProviderLocation.m", 70, @"Invalid parameter not satisfying: %@", @"URL" object file lineNumber description];
  }
  v22.receiver = self;
  v22.super_class = (Class)WFFileProviderLocation;
  id v6 = [(WFFileLocation *)&v22 initWithURL:v5];
  if (v6)
  {
    int v7 = [v5 startAccessingSecurityScopedResource];
    FPCreateCrossDeviceItemIDForItemAtURL();
    uint64_t v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v9 = 0;
    if (!v8)
    {
      id v10 = getWFFilesLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v24 = "-[WFFileProviderLocation initWithURL:]";
        __int16 v25 = 2112;
        id v26 = v9;
        _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_ERROR, "%s Could not create cross device item id with error: %@", buf, 0x16u);
      }
    }
    dispatch_time_t v11 = [MEMORY[0x1E4F25D38] defaultManager];
    id v12 = [v11 itemForURL:v5 error:0];

    if (v7) {
      [v5 stopAccessingSecurityScopedResource];
    }
    crossDeviceItemID = v6->_crossDeviceItemID;
    v6->_crossDeviceItemID = v8;
    id v14 = v8;

    uint64_t v15 = [v12 providerDomainID];
    fileProviderDomainID = v6->_fileProviderDomainID;
    v6->_fileProviderDomainID = (NSString *)v15;

    uint64_t v17 = +[WFFileLocationUtilities bundleIdentifierForItem:v12];
    appContainerBundleIdentifier = v6->_appContainerBundleIdentifier;
    v6->_appContainerBundleIdentifier = (NSString *)v17;

    uint64_t v19 = v6;
  }

  return v6;
}

- (WFFileProviderLocation)initWithFileProviderDomainID:(id)a3 crossDeviceItemID:(id)a4 appContainerBundleIdentifier:(id)a5 relativeSubpath:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)WFFileProviderLocation;
  id v14 = [(WFFileLocation *)&v18 initWithRelativeSubpath:a6];
  uint64_t v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_fileProviderDomainID, a3);
    objc_storeStrong((id *)&v15->_crossDeviceItemID, a4);
    objc_storeStrong((id *)&v15->_appContainerBundleIdentifier, a5);
    v16 = v15;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)subpathFromURL:(id)a3 item:(id)a4
{
  if (a4)
  {
    id v4 = a4;
    id v5 = +[WFFileLocationUtilities parentItemsForItem:v4];
    id v6 = [v5 reverseObjectEnumerator];
    int v7 = [v6 allObjects];
    uint64_t v8 = (void *)[v7 mutableCopy];

    id v9 = [v8 arrayByAddingObject:v4];

    id v10 = objc_msgSend(v9, "if_compactMap:", &__block_literal_global_41091);
    id v11 = [v10 componentsJoinedByString:@"/"];
    id v12 = [v11 stringByStandardizingPath];
  }
  else
  {
    id v12 = 0;
  }
  return v12;
}

uint64_t __46__WFFileProviderLocation_subpathFromURL_item___block_invoke(uint64_t a1, void *a2)
{
  return [a2 filename];
}

+ (id)subpathFromURL:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F25D38];
  id v5 = a3;
  id v6 = [v4 defaultManager];
  int v7 = [v6 itemForURL:v5 error:0];

  uint64_t v8 = [a1 subpathFromURL:v5 item:v7];

  return v8;
}

+ (BOOL)canRepresentURL:(id)a3 item:(id)a4 parentItems:(id)a5
{
  return a4 != 0;
}

+ (BOOL)canRepresentURL:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 startAccessingSecurityScopedResource];
  id v6 = [MEMORY[0x1E4F25D38] defaultManager];
  id v13 = 0;
  int v7 = [v6 itemForURL:v4 error:&v13];
  id v8 = v13;

  if (v5) {
    [v4 stopAccessingSecurityScopedResource];
  }
  if (!v7)
  {
    id v9 = getWFFilesLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v15 = "+[WFFileProviderLocation canRepresentURL:]";
      __int16 v16 = 2112;
      id v17 = v4;
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_DEBUG, "%s Could not create item from URL: %@ with error: %@", buf, 0x20u);
    }
  }
  id v10 = +[WFFileLocationUtilities parentItemsForItem:v7];
  char v11 = [a1 canRepresentURL:v4 item:v7 parentItems:v10];

  return v11;
}

+ (Class)supportedClassForURL:(id)a3
{
  v25[7] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  v25[2] = objc_opt_class();
  v25[3] = objc_opt_class();
  v25[4] = objc_opt_class();
  v25[5] = objc_opt_class();
  v25[6] = objc_opt_class();
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:7];
  id v18 = 0;
  int v5 = +[WFFileLocationUtilities itemForURL:v3 error:&v18];
  id v6 = v18;
  if (!v5)
  {
    int v7 = getWFFilesLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v20 = "+[WFFileProviderLocation supportedClassForURL:]";
      __int16 v21 = 2112;
      id v22 = v3;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_DEBUG, "%s Could not create item from URL: %@ with error: %@", buf, 0x20u);
    }
  }
  id v8 = +[WFFileLocationUtilities parentItemsForItem:v5];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47__WFFileProviderLocation_supportedClassForURL___block_invoke;
  v14[3] = &unk_1E65531A0;
  id v15 = v3;
  id v16 = v5;
  id v17 = v8;
  id v9 = v8;
  id v10 = v5;
  id v11 = v3;
  id v12 = objc_msgSend(v4, "if_firstObjectPassingTest:", v14);

  return (Class)v12;
}

uint64_t __47__WFFileProviderLocation_supportedClassForURL___block_invoke(void *a1, void *a2)
{
  return [a2 canRepresentURL:a1[4] item:a1[5] parentItems:a1[6]];
}

+ (id)locationWithSerializedRepresentation:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int v5 = [v4 objectForKey:@"fileProviderDomainID"];
    id v6 = [v4 objectForKey:@"crossDeviceItemID"];
    int v7 = [v4 objectForKey:@"relativeSubpath"];
    id v8 = [v4 objectForKey:@"appContainerBundleIdentifier"];
    id v9 = (void *)[objc_alloc((Class)a1) initWithFileProviderDomainID:v5 crossDeviceItemID:v6 appContainerBundleIdentifier:v8 relativeSubpath:v7];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

@end