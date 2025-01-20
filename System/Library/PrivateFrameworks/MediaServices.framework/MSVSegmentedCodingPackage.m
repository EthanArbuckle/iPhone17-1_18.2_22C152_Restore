@interface MSVSegmentedCodingPackage
+ (NSString)packageTypeIdentifier;
- (BOOL)deleteWithError:(id *)a3;
- (BOOL)saveWithError:(id *)a3;
- (BOOL)writeWithError:(id *)a3;
- (Class)archivedClass;
- (MSVSegmentedCodingPackage)initWithURL:(id)a3;
- (NSDictionary)allVersions;
- (NSMutableDictionary)infoDictionary;
- (NSMutableDictionary)segmentEncoderMap;
- (NSURL)packageURL;
- (id)coderTypeForSegment:(id)a3;
- (id)decodersWithError:(id *)a3;
- (id)encoderForSegment:(id)a3 version:(int64_t)a4;
- (void)reset;
- (void)setArchivedClass:(Class)a3;
- (void)setInfoDictionary:(id)a3;
- (void)setNeedsInfoDictionaryUpdate;
- (void)setPackageURL:(id)a3;
- (void)setSegmentEncoderMap:(id)a3;
@end

@implementation MSVSegmentedCodingPackage

void __40__MSVSegmentedCodingPackage_allVersions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 objectForKeyedSubscript:@"version"];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

- (NSDictionary)allVersions
{
  v2 = [(NSMutableDictionary *)self->_infoDictionary objectForKeyedSubscript:@"segments"];
  v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__MSVSegmentedCodingPackage_allVersions__block_invoke;
  v7[3] = &unk_1E5AD9800;
  id v8 = v3;
  id v4 = v3;
  [v2 enumerateKeysAndObjectsUsingBlock:v7];
  id v5 = (void *)[v4 copy];

  return (NSDictionary *)v5;
}

- (NSMutableDictionary)infoDictionary
{
  return self->_infoDictionary;
}

- (BOOL)saveWithError:(id *)a3
{
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v6 = [(NSURL *)self->_packageURL path];
  id v22 = 0;
  char v7 = [v5 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:&v22];
  id v8 = v22;

  if (v7)
  {
    id v21 = 0;
    [(MSVSegmentedCodingPackage *)self writeWithError:&v21];
    id v9 = v21;
    v10 = v9;
    if (a3 && v9)
    {
      BOOL v11 = 0;
      *a3 = v9;
LABEL_17:

      goto LABEL_18;
    }
    if (self->_needsInfoDictionaryUpdate)
    {
      v12 = [(NSURL *)self->_packageURL URLByAppendingPathComponent:@"Info.plist" isDirectory:0];
      infoDictionary = self->_infoDictionary;
      id v20 = 0;
      v14 = [MEMORY[0x1E4F28F98] dataWithPropertyList:infoDictionary format:200 options:0 error:&v20];
      id v15 = v20;
      if (v15)
      {
        id v16 = v15;
LABEL_14:
        if (a3)
        {
          id v16 = v16;
          *a3 = v16;
        }

        BOOL v11 = 0;
        goto LABEL_17;
      }
      id v19 = 0;
      char v17 = [v14 writeToURL:v12 options:0 error:&v19];
      id v16 = v19;
      if ((v17 & 1) == 0) {
        goto LABEL_14;
      }
    }
    self->_needsInfoDictionaryUpdate = 0;
    BOOL v11 = 1;
    goto LABEL_17;
  }
  BOOL v11 = 0;
  if (a3) {
    *a3 = v8;
  }
LABEL_18:

  return v11;
}

- (NSURL)packageURL
{
  return self->_packageURL;
}

- (void)setArchivedClass:(Class)a3
{
  archivedClass = self->_archivedClass;
  p_archivedClass = &self->_archivedClass;
  if (archivedClass != a3)
  {
    objc_storeStrong((id *)p_archivedClass, a3);
    id v6 = NSStringFromClass(self->_archivedClass);
    [(NSMutableDictionary *)self->_infoDictionary setObject:v6 forKeyedSubscript:@"archivedClass"];

    self->_needsInfoDictionaryUpdate = 1;
  }
}

void __44__MSVSegmentedCodingPackage_writeWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  char v7 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:@"segments"];
  id v8 = [v7 objectForKeyedSubscript:v5];
  id v9 = [v8 objectForKeyedSubscript:@"coder"];

  v10 = _MSVFileExtensionForCoderTypeAndCompressionAlgorithm(v9);
  BOOL v11 = *(void **)(*(void *)(a1 + 32) + 16);
  v12 = [v5 stringByAppendingPathExtension:v10];
  v13 = [v11 URLByAppendingPathComponent:v12 isDirectory:0];

  if ([v6 hasTopLevelData])
  {
    v14 = [v6 encodedData];
    id v15 = MSVGzipCompressData();

    if ([v15 length])
    {
      uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
      id obj = *(id *)(v16 + 40);
      [v15 writeToURL:v13 options:0 error:&obj];
      objc_storeStrong((id *)(v16 + 40), obj);
    }
  }
  else
  {
    char v17 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:@"segments"];
    v18 = [v17 objectForKeyedSubscript:v5];

    if (v18)
    {
      id v19 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:@"segments"];
      [v19 setObject:0 forKeyedSubscript:v5];

      *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
    }
    id v20 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v20 removeItemAtURL:v13 error:0];
  }
}

void __47__MSVSegmentedCodingPackage_decodersWithError___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = [v8 objectForKeyedSubscript:@"coder"];
  v10 = _MSVFileExtensionForCoderTypeAndCompressionAlgorithm(v9);
  BOOL v11 = *(void **)(*(void *)(a1 + 32) + 16);
  v12 = [v7 stringByAppendingPathExtension:v10];
  v13 = [v11 URLByAppendingPathComponent:v12 isDirectory:0];

  id v14 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v13];
  if ([v14 length])
  {
    id v15 = MSVGzipDecompressData();

    if ([v15 length])
    {
      uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
      v18 = *(void **)(v16 + 40);
      char v17 = (id *)(v16 + 40);
      v23 = a4;
      id obj = v18;
      id v19 = v9;
      id v14 = v15;
      if (([v19 isEqualToString:@"MSVOPACKCoder"] & 1) == 0)
      {
        id v21 = [MEMORY[0x1E4F28B00] currentHandler];
        id v22 = objc_msgSend(NSString, "stringWithUTF8String:", "NSCoder<MSVSegmentedSubDecoder> * _Nonnull _MSVSegmentedCodingPackageDecoderForCoderType(NSString * _Nonnull __strong, NSData * _Nonnull __strong, NSError *__autoreleasing  _Nullable * _Nullable)");
        [v21 handleFailureInFunction:v22, @"MSVSegmentedCodingPackage.m", 25, @"Unsupported coder type %@", v19 file lineNumber description];

        abort();
      }
      id v20 = [[MSVOPACKDecoder alloc] initForReadingFromData:v14 error:&obj];

      objc_storeStrong(v17, obj);
      if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
      {
        unsigned char *v23 = 1;
        [*(id *)(a1 + 40) removeAllObjects];
      }
      else
      {
        [*(id *)(a1 + 40) addObject:v20];
      }
    }
    else
    {
      id v14 = v15;
    }
  }
}

- (MSVSegmentedCodingPackage)initWithURL:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MSVSegmentedCodingPackage;
  id v5 = [(MSVSegmentedCodingPackage *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    packageURL = v5->_packageURL;
    v5->_packageURL = (NSURL *)v6;

    id v8 = [(NSURL *)v5->_packageURL URLByAppendingPathComponent:@"Info.plist" isDirectory:0];
    id v9 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v8];
    if ([v9 length])
    {
      uint64_t v10 = [MEMORY[0x1E4F28F98] propertyListWithData:v9 options:2 format:0 error:0];
      infoDictionary = v5->_infoDictionary;
      v5->_infoDictionary = (NSMutableDictionary *)v10;

      v12 = [(NSMutableDictionary *)v5->_infoDictionary objectForKeyedSubscript:@"packageType"];
      v13 = [(id)objc_opt_class() packageTypeIdentifier];
      int v14 = [v12 isEqualToString:v13];

      if (!v14)
      {

        id v21 = 0;
        goto LABEL_9;
      }
    }
    id v15 = v5->_infoDictionary;
    if (!v15)
    {
      [(MSVSegmentedCodingPackage *)v5 reset];
      id v15 = v5->_infoDictionary;
    }
    uint64_t v16 = [(NSMutableDictionary *)v15 objectForKeyedSubscript:@"archivedClass"];
    uint64_t v17 = NSClassFromString(v16);
    Class archivedClass = v5->_archivedClass;
    v5->_Class archivedClass = (Class)v17;

    uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
    segmentEncoderMap = v5->_segmentEncoderMap;
    v5->_segmentEncoderMap = (NSMutableDictionary *)v19;
  }
  id v21 = v5;
LABEL_9:

  return v21;
}

- (id)encoderForSegment:(id)a3 version:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(NSMutableDictionary *)self->_infoDictionary objectForKeyedSubscript:@"segments"];
  id v8 = [v7 objectForKeyedSubscript:v6];
  id v9 = [v8 objectForKeyedSubscript:@"version"];

  if (a4 && v9 && [v9 integerValue] >= a4)
  {
    BOOL v11 = 0;
  }
  else
  {
    id v10 = [(MSVSegmentedCodingPackage *)self coderTypeForSegment:v6];
    if (([v10 isEqualToString:@"MSVOPACKCoder"] & 1) == 0)
    {
      uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
      id v20 = [NSString stringWithUTF8String:"NSCoder<MSVSegmentedSubEncoder> * _Nonnull _MSVSegmentedCodingPackageEncoderForCoderType(NSString * _Nonnull __strong)"];
      [v19 handleFailureInFunction:v20, @"MSVSegmentedCodingPackage.m", 36, @"Unsupported coder type %@", v10 file lineNumber description];

      abort();
    }
    BOOL v11 = objc_alloc_init(MSVOPACKEncoder);

    [(NSMutableDictionary *)self->_segmentEncoderMap setObject:v11 forKeyedSubscript:v6];
    v12 = [(NSMutableDictionary *)self->_infoDictionary objectForKeyedSubscript:@"segments"];
    v13 = [v12 objectForKeyedSubscript:v6];

    if (!v13)
    {
      int v14 = [MEMORY[0x1E4F1CA60] dictionary];
      [v12 setObject:v14 forKeyedSubscript:v6];
    }
    id v15 = [NSNumber numberWithInteger:a4];
    uint64_t v16 = [v12 objectForKeyedSubscript:v6];
    [v16 setObject:v15 forKeyedSubscript:@"version"];

    uint64_t v17 = [v12 objectForKeyedSubscript:v6];
    [v17 setObject:v10 forKeyedSubscript:@"coder"];

    self->_needsInfoDictionaryUpdate = 1;
  }

  return v11;
}

- (id)decodersWithError:(id *)a3
{
  id v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [(NSMutableDictionary *)self->_infoDictionary objectForKeyedSubscript:@"segments"];
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__MSVSegmentedCodingPackage_decodersWithError___block_invoke;
  v11[3] = &unk_1E5AD97D8;
  v11[4] = self;
  v13 = &v14;
  id v7 = v5;
  id v12 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:v11];
  if (a3) {
    *a3 = (id) v15[5];
  }
  id v8 = v12;
  id v9 = v7;

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (Class)archivedClass
{
  return self->_archivedClass;
}

- (id)coderTypeForSegment:(id)a3
{
  return @"MSVOPACKCoder";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoDictionary, 0);
  objc_storeStrong((id *)&self->_segmentEncoderMap, 0);
  objc_storeStrong((id *)&self->_archivedClass, 0);
  objc_storeStrong((id *)&self->_packageURL, 0);
}

- (BOOL)writeWithError:(id *)a3
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy_;
  id v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  segmentEncoderMap = self->_segmentEncoderMap;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__MSVSegmentedCodingPackage_writeWithError___block_invoke;
  v10[3] = &unk_1E5AD97B0;
  v10[4] = self;
  v10[5] = &v11;
  [(NSMutableDictionary *)segmentEncoderMap enumerateKeysAndObjectsUsingBlock:v10];
  [(NSMutableDictionary *)self->_segmentEncoderMap removeAllObjects];
  id v6 = (void *)v12[5];
  if (a3) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  BOOL v8 = v7;
  if (!v7) {
    *a3 = v6;
  }
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (void)setInfoDictionary:(id)a3
{
}

- (void)setSegmentEncoderMap:(id)a3
{
}

- (NSMutableDictionary)segmentEncoderMap
{
  return self->_segmentEncoderMap;
}

- (void)setPackageURL:(id)a3
{
}

- (BOOL)deleteWithError:(id *)a3
{
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  LOBYTE(a3) = [v5 removeItemAtURL:self->_packageURL error:a3];

  return (char)a3;
}

- (void)setNeedsInfoDictionaryUpdate
{
  self->_needsInfoDictionaryUpdate = 1;
}

- (void)reset
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  infoDictionary = self->_infoDictionary;
  self->_infoDictionary = v3;

  id v5 = [(id)objc_opt_class() packageTypeIdentifier];
  [(NSMutableDictionary *)self->_infoDictionary setObject:v5 forKeyedSubscript:@"packageType"];

  id v6 = [(NSMutableDictionary *)self->_infoDictionary objectForKeyedSubscript:@"segments"];

  if (!v6)
  {
    BOOL v7 = [MEMORY[0x1E4F1CA60] dictionary];
    [(NSMutableDictionary *)self->_infoDictionary setObject:v7 forKeyedSubscript:@"segments"];
  }
  self->_needsInfoDictionaryUpdate = 1;
  segmentEncoderMap = self->_segmentEncoderMap;
  [(NSMutableDictionary *)segmentEncoderMap removeAllObjects];
}

+ (NSString)packageTypeIdentifier
{
  return (NSString *)@"com.apple.mediaservices.segmentedCoding";
}

@end