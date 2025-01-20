@interface TSPData
+ (BOOL)updateDigest:(void *)a3 withProtobufString:(const void *)a4;
+ (id)cullingListeners;
+ (id)cullingListenersQueue;
+ (id)dataFromDataRep:(id)a3 filename:(id)a4 context:(id)a5;
+ (id)dataFromNSData:(id)a3 filename:(id)a4 context:(id)a5;
+ (id)dataFromReadChannel:(id)a3 filename:(id)a4 context:(id)a5;
+ (id)dataFromURL:(id)a3 context:(id)a4;
+ (id)dataFromURL:(id)a3 useExternalReferenceIfAllowed:(BOOL)a4 context:(id)a5;
+ (id)dataFromURL:(id)a3 useExternalReferenceIfAllowed:(BOOL)a4 useFileCoordination:(BOOL)a5 context:(id)a6;
+ (id)null;
+ (id)readOnlyDataFromDataRep:(id)a3 filename:(id)a4 context:(id)a5;
+ (id)readOnlyDataFromNSData:(id)a3 filename:(id)a4 context:(id)a5;
+ (id)readOnlyDataFromURL:(id)a3 context:(id)a4;
+ (id)readOnlyDataWithoutDataDigestFromURL:(id)a3 context:(id)a4;
+ (id)requiredAVAssetOptions;
+ (void)addCullingListener:(id)a3;
+ (void)removeCullingListener:(id)a3;
- (BOOL)isApplicationData;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExternalData;
- (BOOL)isLengthLikelyToBeGreaterThan:(unint64_t)a3;
- (BOOL)isReadable;
- (BOOL)isStorageInPackage:(id)a3;
- (BOOL)needsDownload;
- (BOOL)writeToURL:(id)a3 error:(id *)a4;
- (CGDataProvider)newCGDataProvider;
- (CGImage)newCGImage;
- (CGImageSource)newCGImageSource;
- (NSString)documentResourceLocator;
- (NSString)filename;
- (NSString)packageLocator;
- (NSString)type;
- (NSString)uniqueName;
- (TSPData)initWithIdentifier:(int64_t)a3 digest:(const void *)a4 filename:(id)a5 storage:(id)a6 manager:(id)a7;
- (TSPDataStorage)storage;
- (TSPObjectContext)context;
- (const)digest;
- (id)AVAsset;
- (id)AVAssetWithOptions:(id)a3;
- (id)NSData;
- (id)bookmarkData;
- (id)copyWithContext:(id)a3;
- (id)description;
- (id)preferredFilename;
- (int64_t)identifier;
- (unint64_t)encodedLength;
- (unint64_t)hash;
- (unsigned)packageIdentifier;
- (void)addDownloadObserver:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)performIOChannelReadWithAccessor:(id)a3;
- (void)performInputStreamReadWithAccessor:(id)a3;
- (void)setFilename:(id)a3 storage:(id)a4;
- (void)setStorage:(id)a3;
- (void)willCull;
@end

@implementation TSPData

+ (id)dataFromURL:(id)a3 context:(id)a4
{
  v4 = [a1 dataFromURL:a3 useExternalReferenceIfAllowed:0 context:a4];

  return v4;
}

+ (id)dataFromURL:(id)a3 useExternalReferenceIfAllowed:(BOOL)a4 context:(id)a5
{
  v5 = [a1 dataFromURL:a3 useExternalReferenceIfAllowed:a4 useFileCoordination:1 context:a5];

  return v5;
}

+ (id)dataFromURL:(id)a3 useExternalReferenceIfAllowed:(BOOL)a4 useFileCoordination:(BOOL)a5 context:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v9 = a3;
  id v10 = a6;
  v11 = v10;
  if (v8 && [v10 areNewExternalReferencesToDataAllowed])
  {
    v12 = [v11 dataManager];
    uint64_t v13 = [v12 dataFromExternalReferenceURL:v9 useFileCoordination:v7];
  }
  else
  {
    v12 = [v11 dataManager];
    uint64_t v13 = [v12 dataFromURL:v9 useFileCoordination:v7];
  }
  v14 = (void *)v13;

  return v14;
}

+ (id)dataFromNSData:(id)a3 filename:(id)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [a5 dataManager];
  id v10 = [v9 dataFromNSData:v7 filename:v8];

  return v10;
}

+ (id)dataFromDataRep:(id)a3 filename:(id)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [[TSPDataRepReadChannel alloc] initWithRepresentation:v7];
  v11 = [v9 dataManager];
  v12 = [v11 dataFromReadChannel:v10 filename:v8];

  return v12;
}

+ (id)dataFromReadChannel:(id)a3 filename:(id)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [a5 dataManager];
  id v10 = [v9 dataFromReadChannel:v7 filename:v8];

  return v10;
}

+ (id)readOnlyDataFromURL:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [[TSPReadOnlyFileDataStorage alloc] initWithURL:v5];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  id v8 = (void *)[objc_alloc(MEMORY[0x263F7C830]) initForReadingURL:v5];
  if (v8)
  {
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __39__TSPData_readOnlyDataFromURL_context___block_invoke;
    v18[3] = &unk_2646B0018;
    v20 = &v21;
    id v10 = v9;
    v19 = v10;
    +[TSPDataManager readWithChannel:v8 handler:v18];
    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    [v8 close];
  }
  if (!v22[3])
  {
    TSULogErrorInFunction();
    operator new();
  }
  v11 = [TSPData alloc];
  uint64_t v12 = v22[3];
  uint64_t v13 = [v5 lastPathComponent];
  v14 = [v6 dataManager];
  v15 = [(TSPData *)v11 initWithIdentifier:0 digest:v12 filename:v13 storage:v7 manager:v14];

  uint64_t v16 = v22[3];
  if (v16) {
    MEMORY[0x223CB8F20](v16, 0x1000C40A86A77D5);
  }

  _Block_object_dispose(&v21, 8);

  return v15;
}

void __39__TSPData_readOnlyDataFromURL_context___block_invoke(uint64_t a1, int a2, void *a3, void *a4, uint64_t a5)
{
  id v10 = a3;
  id v9 = a4;
  if (a2)
  {
    if (a5) {
      operator new();
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

+ (id)readOnlyDataFromNSData:(id)a3 filename:(id)a4 context:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [[TSPReadOnlyMemoryDataStorage alloc] initWithNSData:v7];
  CC_SHA1_Init(&c);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __51__TSPData_readOnlyDataFromNSData_filename_context___block_invoke;
  v15[3] = &__block_descriptor_40_e29_v40__0r_v8__NSRange_QQ_16_B32l;
  v15[4] = &c;
  [v7 enumerateByteRangesUsingBlock:v15];
  CC_SHA1_Final(md, &c);
  v11 = [TSPData alloc];
  uint64_t v12 = [v9 dataManager];
  uint64_t v13 = [(TSPData *)v11 initWithIdentifier:0 digest:md filename:v8 storage:v10 manager:v12];

  return v13;
}

uint64_t __51__TSPData_readOnlyDataFromNSData_filename_context___block_invoke(uint64_t a1, const void *a2, int a3, CC_LONG len)
{
  return CC_SHA1_Update(*(CC_SHA1_CTX **)(a1 + 32), a2, len);
}

+ (id)readOnlyDataFromDataRep:(id)a3 filename:(id)a4 context:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [[TSPReadOnlyProvidedDataStorage alloc] initWithDataRepresentation:v7];
  LODWORD(v16) = 0;
  v11 = [TSPData alloc];
  uint64_t v12 = objc_msgSend(v9, "dataManager", 0, 0, v16, v17);
  uint64_t v13 = [(TSPData *)v11 initWithIdentifier:0 digest:&v15 filename:v8 storage:v10 manager:v12];

  return v13;
}

+ (id)readOnlyDataWithoutDataDigestFromURL:(id)a3 context:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [[TSPReadOnlyFileDataStorage alloc] initWithURL:v5];
  LODWORD(v14) = 0;
  id v8 = [TSPData alloc];
  id v9 = objc_msgSend(v5, "lastPathComponent", 0, 0, v14, v15);
  id v10 = [v6 dataManager];
  v11 = [(TSPData *)v8 initWithIdentifier:0 digest:&v13 filename:v9 storage:v7 manager:v10];

  return v11;
}

+ (id)null
{
  if (+[TSPData null]::onceToken != -1) {
    dispatch_once(&+[TSPData null]::onceToken, &__block_literal_global_7);
  }
  v2 = (void *)+[TSPData null]::nullData;

  return v2;
}

void __15__TSPData_null__block_invoke()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v2[0] = 0;
  v2[1] = 0;
  int v3 = 0;
  v0 = [[TSPData alloc] initWithIdentifier:0 digest:v2 filename:&stru_26D688A48 storage:0 manager:0];
  v1 = (void *)+[TSPData null]::nullData;
  +[TSPData null]::nullData = (uint64_t)v0;
}

+ (id)cullingListenersQueue
{
  if (+[TSPData cullingListenersQueue]::onceToken != -1) {
    dispatch_once(&+[TSPData cullingListenersQueue]::onceToken, &__block_literal_global_15);
  }
  v2 = (void *)sCullingListenersQueue;

  return v2;
}

uint64_t __32__TSPData_cullingListenersQueue__block_invoke()
{
  sCullingListenersQueue = (uint64_t)dispatch_queue_create("TSPData.Culling", 0);

  return MEMORY[0x270F9A758]();
}

+ (void)addCullingListener:(id)a3
{
  id v4 = a3;
  if (+[TSPData addCullingListener:]::onceToken != -1) {
    dispatch_once(&+[TSPData addCullingListener:]::onceToken, &__block_literal_global_18);
  }
  id v5 = [a1 cullingListenersQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__TSPData_addCullingListener___block_invoke_2;
  block[3] = &unk_2646AFA00;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

uint64_t __30__TSPData_addCullingListener___block_invoke()
{
  sCullingListeners = [objc_alloc(MEMORY[0x263F088B0]) initWithOptions:517 capacity:0];

  return MEMORY[0x270F9A758]();
}

uint64_t __30__TSPData_addCullingListener___block_invoke_2(uint64_t a1)
{
  return [(id)sCullingListeners addObject:*(void *)(a1 + 32)];
}

+ (void)removeCullingListener:(id)a3
{
  id v4 = a3;
  id v5 = [a1 cullingListenersQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__TSPData_removeCullingListener___block_invoke;
  block[3] = &unk_2646AFA00;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

uint64_t __33__TSPData_removeCullingListener___block_invoke(uint64_t a1)
{
  return [(id)sCullingListeners removeObject:*(void *)(a1 + 32)];
}

+ (id)cullingListeners
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__3;
  id v10 = __Block_byref_object_dispose__3;
  id v11 = 0;
  v2 = [a1 cullingListenersQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__TSPData_cullingListeners__block_invoke;
  block[3] = &unk_2646B0060;
  void block[4] = &v6;
  dispatch_sync(v2, block);

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __27__TSPData_cullingListeners__block_invoke(uint64_t a1)
{
  uint64_t v2 = [(id)sCullingListeners count];
  if (v2) {
    id v3 = (void *)[(id)sCullingListeners copy];
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v3);
  if (v2)
  {
  }
}

- (void)dealloc
{
  self->_isDeallocating = 1;
  [(TSPData *)self willCull];
  v3.receiver = self;
  v3.super_class = (Class)TSPData;
  [(TSPData *)&v3 dealloc];
}

- (void)willCull
{
  int v2 = 0;
  uint64_t v13 = *MEMORY[0x263EF8340];
  atomic_compare_exchange_strong(&self->_didCull, (unsigned int *)&v2, 1u);
  if (!v2)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v4 = objc_msgSend((id)objc_opt_class(), "cullingListeners", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * v7++) willCullData:self];
        }
        while (v5 != v7);
        uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (id)bookmarkData
{
  int v2 = [(TSPData *)self storage];
  objc_super v3 = [v2 bookmarkDataWithOptions:0];

  return v3;
}

- (id)NSData
{
  int v2 = [(TSPData *)self storage];
  objc_super v3 = [v2 NSDataWithOptions:0];

  return v3;
}

- (CGDataProvider)newCGDataProvider
{
  int v2 = [(TSPData *)self storage];
  objc_super v3 = (CGDataProvider *)[v2 newCGDataProvider];

  return v3;
}

- (CGImageSource)newCGImageSource
{
  int v2 = [(TSPData *)self storage];
  objc_super v3 = (CGImageSource *)[v2 newCGImageSource];

  return v3;
}

- (CGImage)newCGImage
{
  result = [(TSPData *)self newCGImageSource];
  if (result)
  {
    objc_super v3 = result;
    ImageAtIndex = CGImageSourceCreateImageAtIndex(result, 0, 0);
    CFRelease(v3);
    return ImageAtIndex;
  }
  return result;
}

- (id)AVAsset
{
  return [(TSPData *)self AVAssetWithOptions:0];
}

- (id)AVAssetWithOptions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() requiredAVAssetOptions];
  uint64_t v6 = (void *)[v5 mutableCopy];

  if (v4) {
    [v6 addEntriesFromDictionary:v4];
  }
  uint64_t v7 = [(TSPData *)self storage];
  long long v8 = [(TSPData *)self type];
  long long v9 = [v7 AVAssetWithOptions:v6 contentTypeUTI:v8];

  return v9;
}

+ (id)requiredAVAssetOptions
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = *MEMORY[0x263EFA2A8];
  v5[0] = &unk_26D739CA8;
  int v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (NSString)filename
{
  if (self->_isDeallocating)
  {
    id v2 = [(TSPData *)self preferredFilename];
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = &v6;
    uint64_t v8 = 0x3032000000;
    long long v9 = __Block_byref_object_copy__3;
    long long v10 = __Block_byref_object_dispose__3;
    id v11 = 0;
    accessQueue = self->_accessQueue;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    void v5[2] = __19__TSPData_filename__block_invoke;
    v5[3] = &unk_2646AFA78;
    v5[4] = self;
    v5[5] = &v6;
    dispatch_sync(accessQueue, v5);
    id v2 = (id)v7[5];
    _Block_object_dispose(&v6, 8);
  }

  return (NSString *)v2;
}

uint64_t __19__TSPData_filename__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) preferredFilename];

  return MEMORY[0x270F9A758]();
}

- (NSString)type
{
  id v2 = [(TSPData *)self filename];
  objc_super v3 = [v2 pathExtension];
  if (v3) {
    PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x263F01910], v3, 0);
  }
  else {
    PreferredIdentifierForTag = 0;
  }

  return (NSString *)PreferredIdentifierForTag;
}

- (BOOL)isReadable
{
  return [(TSPData *)self isLengthLikelyToBeGreaterThan:0];
}

- (BOOL)isApplicationData
{
  id v2 = [(TSPData *)self documentResourceLocator];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isExternalData
{
  id v2 = [(TSPData *)self storage];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (NSString)documentResourceLocator
{
  id v2 = [(TSPData *)self storage];
  BOOL v3 = [v2 documentResourceLocator];

  return (NSString *)v3;
}

- (NSString)packageLocator
{
  id v2 = [(TSPData *)self storage];
  BOOL v3 = [v2 packageLocator];

  return (NSString *)v3;
}

- (unsigned)packageIdentifier
{
  id v2 = [(TSPData *)self storage];
  unsigned __int8 v3 = [v2 packageIdentifier];

  return v3;
}

- (TSPObjectContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  unsigned __int8 v3 = [WeakRetained context];

  return (TSPObjectContext *)v3;
}

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend(NSString, "tsp_stringForDigest:length:", &self->_digest, 20);
}

- (id)copyWithContext:(id)a3
{
  uint64_t v4 = [a3 dataManager];
  uint64_t v5 = (void *)[v4 copyData:self];

  return v5;
}

- (void)performIOChannelReadWithAccessor:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(TSPData *)self storage];
  [v4 performIOChannelReadWithAccessor:v5];
}

- (void)performInputStreamReadWithAccessor:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __46__TSPData_performInputStreamReadWithAccessor___block_invoke;
    v6[3] = &unk_2646B0088;
    v6[4] = self;
    id v7 = v4;
    [(TSPData *)self performIOChannelReadWithAccessor:v6];
  }
}

void __46__TSPData_performInputStreamReadWithAccessor___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    unsigned __int8 v3 = (void *)[objc_alloc(MEMORY[0x263F7C8B0]) initWithReadChannel:v6];
  }
  else
  {
    id v4 = objc_alloc(MEMORY[0x263F7C7E0]);
    id v5 = [*(id *)(a1 + 32) NSData];
    unsigned __int8 v3 = (void *)[v4 initWithData:v5];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)needsDownload
{
  id v2 = [(TSPData *)self storage];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 needsDownload];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (void)addDownloadObserver:(id)a3 completionHandler:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(TSPData *)self storage];
  if (objc_opt_respondsToSelector()) {
    [v7 addDownloadObserver:v8 forData:self completionHandler:v6];
  }
}

- (unint64_t)hash
{
  return *(void *)[(TSPData *)self digest];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TSPData *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [(TSPData *)self context];
      id v7 = [(TSPData *)v5 context];

      if (v6 == v7)
      {
        long long v9 = [(TSPData *)self digest];
        uint64_t v10 = [(TSPData *)v5 digest];
        BOOL v8 = *v9 == *(void *)v10
          && v9[1] == *(void *)(v10 + 8)
          && *((_DWORD *)v9 + 4) == (unint64_t)*(unsigned int *)(v10 + 16);
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (id)description
{
  v13.receiver = self;
  v13.super_class = (Class)TSPData;
  char v3 = [(TSPData *)&v13 description];
  id v4 = [(TSPData *)self preferredFilename];
  if ([v4 length])
  {
    uint64_t v5 = [v3 stringByAppendingFormat:@" \"%@\"", v4];

    char v3 = (void *)v5;
  }
  id v6 = [(TSPDataStorage *)self->_storage documentResourceLocator];

  int v7 = [(TSPDataStorage *)self->_storage readOnly];
  int v8 = v7;
  if (v6) {
    int v9 = 1;
  }
  else {
    int v9 = v7;
  }
  if (v9 == 1)
  {
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithCapacity:32];
    objc_msgSend(v10, "appendString:", @"(");
    if (v6)
    {
      [v10 appendString:@"application data"];
      if (v8)
      {
        [v10 appendString:@", "];
LABEL_11:
        [v10 appendString:@"read only"];
      }
    }
    else if (v8)
    {
      goto LABEL_11;
    }
    [v10 appendString:@""]);
    uint64_t v11 = [v3 stringByAppendingString:v10];

    char v3 = (void *)v11;
  }

  return v3;
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (([v6 isFileURL] & 1) == 0)
  {
    BOOL v14 = 0;
    goto LABEL_7;
  }
  [v6 path];
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 1;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__3;
  v28 = __Block_byref_object_dispose__3;
  id v29 = 0;
  id v7 = objc_claimAutoreleasedReturnValue();
  unlink((const char *)[v7 fileSystemRepresentation]);
  int v8 = [v6 path];
  int v9 = TSUOpen();

  if (v9 < 0)
  {
    *((unsigned char *)v31 + 24) = 0;
    uint64_t v16 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
    uint64_t v17 = (void *)v25[5];
    v25[5] = v16;

    if (!a4) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  dispatch_queue_t v10 = dispatch_queue_create("TSPData.WriteToURL", 0);
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __28__TSPData_writeToURL_error___block_invoke;
  v18[3] = &unk_2646B0100;
  int v23 = v9;
  uint64_t v21 = &v30;
  v22 = &v24;
  dispatch_queue_t v19 = v10;
  dispatch_semaphore_t v20 = v11;
  uint64_t v12 = v11;
  objc_super v13 = v10;
  [(TSPData *)self performIOChannelReadWithAccessor:v18];
  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);

  close(v9);
  if (a4) {
LABEL_4:
  }
    *a4 = (id) v25[5];
LABEL_5:
  BOOL v14 = *((unsigned char *)v31 + 24) != 0;
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
LABEL_7:

  return v14;
}

void __28__TSPData_writeToURL_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __28__TSPData_writeToURL_error___block_invoke_2;
    v7[3] = &unk_2646B00D8;
    int v10 = *(_DWORD *)(a1 + 64);
    uint64_t v9 = *(void *)(a1 + 56);
    long long v6 = *(_OWORD *)(a1 + 40);
    id v5 = (id)v6;
    long long v8 = v6;
    [v3 readFromOffset:0 length:-1 queue:v4 handler:v7];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

void __28__TSPData_writeToURL_error___block_invoke_2(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    if (*(unsigned char *)(v9 + 24))
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __28__TSPData_writeToURL_error___block_invoke_3;
      v11[3] = &unk_2646B00B0;
      int v12 = *(_DWORD *)(a1 + 56);
      v11[4] = *(void *)(a1 + 48);
      BOOL v10 = dispatch_data_apply(v7, v11);
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    }
    else
    {
      BOOL v10 = 0;
    }
    *(unsigned char *)(v9 + 24) = v10;
  }
  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a4);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  if (a2) {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

uint64_t __28__TSPData_writeToURL_error___block_invoke_3(uint64_t a1, int a2, int a3, void *__buf, size_t __nbyte)
{
  ssize_t v7 = write(*(_DWORD *)(a1 + 40), __buf, __nbyte);
  if (v7 < 0)
  {
    uint64_t v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    dispatch_semaphore_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  else
  {
    if (v7 == __nbyte) {
      return 1;
    }
    dispatch_semaphore_t v11 = [MEMORY[0x263F7C7F0] currentHandler];
    int v12 = [NSString stringWithUTF8String:"-[TSPData writeToURL:error:]_block_invoke_3"];
    objc_super v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPData.mm"];
    [v11 handleFailureInFunction:v12 file:v13 lineNumber:566 description:@"Didn't write as many bytes as we wanted to"];
  }
  return 0;
}

- (BOOL)isLengthLikelyToBeGreaterThan:(unint64_t)a3
{
  uint64_t v4 = [(TSPData *)self storage];
  LOBYTE(a3) = [v4 encodedLength] > a3;

  return a3;
}

- (unint64_t)encodedLength
{
  id v2 = [(TSPData *)self storage];
  unint64_t v3 = [v2 encodedLength];

  return v3;
}

- (TSPData)initWithIdentifier:(int64_t)a3 digest:(const void *)a4 filename:(id)a5 storage:(id)a6 manager:(id)a7
{
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v23.receiver = self;
  v23.super_class = (Class)TSPData;
  uint64_t v16 = [(TSPData *)&v23 init];
  uint64_t v17 = (TSPData *)v16;
  if (v16)
  {
    *((void *)v16 + 2) = a3;
    long long v18 = *(_OWORD *)a4;
    *((_DWORD *)v16 + 18) = *((_DWORD *)a4 + 4);
    *(_OWORD *)(v16 + 56) = v18;
    objc_storeStrong((id *)v16 + 5, a5);
    objc_storeStrong((id *)&v17->_storage, a6);
    objc_storeWeak((id *)&v17->_manager, v15);
    dispatch_queue_t v19 = dispatch_queue_create("TSPData.Access", MEMORY[0x263EF83A8]);
    accessQueue = v17->_accessQueue;
    v17->_accessQueue = (OS_dispatch_queue *)v19;

    uint64_t v21 = v17;
  }

  return v17;
}

- (TSPDataStorage)storage
{
  if (self->_isDeallocating)
  {
    id v2 = self->_storage;
  }
  else
  {
    uint64_t v6 = 0;
    ssize_t v7 = &v6;
    uint64_t v8 = 0x3032000000;
    uint64_t v9 = __Block_byref_object_copy__3;
    uint64_t v10 = __Block_byref_object_dispose__3;
    id v11 = 0;
    accessQueue = self->_accessQueue;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    void v5[2] = __18__TSPData_storage__block_invoke;
    v5[3] = &unk_2646AFA78;
    v5[4] = self;
    v5[5] = &v6;
    dispatch_sync(accessQueue, v5);
    id v2 = (TSPDataStorage *)(id)v7[5];
    _Block_object_dispose(&v6, 8);
  }

  return v2;
}

void __18__TSPData_storage__block_invoke(uint64_t a1)
{
}

- (void)setStorage:(id)a3
{
  id v4 = a3;
  if (self->_isDeallocating)
  {
    id v5 = [MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSPData setStorage:]"];
    ssize_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPData.mm"];
    [v5 handleFailureInFunction:v6 file:v7 lineNumber:662 description:@"Storage should not be modified while TSPData is being deallocated"];
  }
  accessQueue = self->_accessQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __22__TSPData_setStorage___block_invoke;
  v10[3] = &unk_2646AFAA0;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_barrier_async(accessQueue, v10);
}

void __22__TSPData_setStorage___block_invoke(uint64_t a1)
{
}

- (void)setFilename:(id)a3 storage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_isDeallocating)
  {
    uint64_t v8 = [MEMORY[0x263F7C7F0] currentHandler];
    id v9 = [NSString stringWithUTF8String:"-[TSPData setFilename:storage:]"];
    uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPData.mm"];
    [v8 handleFailureInFunction:v9 file:v10 lineNumber:671 description:@"Filename and storage should not be modified while TSPData is being deallocated"];
  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__TSPData_setFilename_storage___block_invoke;
  block[3] = &unk_2646AFF70;
  void block[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v12 = v7;
  id v13 = v6;
  dispatch_barrier_async(accessQueue, block);
}

void __31__TSPData_setFilename_storage___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
  id v2 = *(void **)(a1 + 48);
  unint64_t v3 = (id *)(*(void *)(a1 + 32) + 32);

  objc_storeStrong(v3, v2);
}

- (id)preferredFilename
{
  storage = self->_storage;
  filename = self->_filename;
  if (storage)
  {
    id v5 = [(TSPDataStorage *)storage filenameForPreferredFilename:filename];
  }
  else
  {
    id v5 = filename;
  }

  return v5;
}

- (const)digest
{
  return &self->_digest;
}

- (BOOL)isStorageInPackage:(id)a3
{
  id v4 = a3;
  id v5 = [(TSPData *)self storage];
  char v6 = [v5 isInPackage:v4];

  return v6;
}

+ (BOOL)updateDigest:(void *)a3 withProtobufString:(const void *)a4
{
  int v4 = *((char *)a4 + 23);
  if ((v4 & 0x80000000) == 0)
  {
    if (v4 != 20) {
      goto LABEL_7;
    }
LABEL_6:
    long long v5 = *(_OWORD *)a4;
    *((_DWORD *)a3 + 4) = *((_DWORD *)a4 + 4);
    *(_OWORD *)a3 = v5;
    return 1;
  }
  if (*((void *)a4 + 1) == 20)
  {
    a4 = *(const void **)a4;
    goto LABEL_6;
  }
LABEL_7:
  TSULogErrorInFunction();
  return 0;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_storage, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end