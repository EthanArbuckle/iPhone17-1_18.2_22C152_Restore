@interface TRIFBCloudKitAssetRecordAsset
- (BOOL)isEqual:(id)a3;
- (BOOL)verifyUTF8Fields;
- (TRIFBCloudKitAssetRecordAsset)initWithBufRef:(id)a3 cppPointer:(const CloudKitAssetRecordAsset *)a4;
- (id)deepCopyUsingBufferBuilder:(id)a3;
- (id)deepCopyUsingBufferBuilder:(id)a3 changes:(id)a4;
- (id)initVerifiedRootObjectFromData:(id)a3;
- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4;
- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4 maxDepth:(unsigned int)a5 maxTables:(unsigned int)a6;
- (unint64_t)hash;
@end

@implementation TRIFBCloudKitAssetRecordAsset

- (id)deepCopyUsingBufferBuilder:(id)a3
{
  v3 = [(TRIFBCloudKitAssetRecordAsset *)self deepCopyUsingBufferBuilder:a3 changes:0];
  return v3;
}

- (id)deepCopyUsingBufferBuilder:(id)a3 changes:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 849, @"Invalid parameter not satisfying: %@", @"bufferBuilder" object file lineNumber description];
  }
  v9 = (void *)MEMORY[0x19F3AD060]();
  v10 = [v7 trifbCreateCloudKitAssetRecordAssetUsingBlock:&__block_literal_global_4];

  return v10;
}

- (TRIFBCloudKitAssetRecordAsset)initWithBufRef:(id)a3 cppPointer:(const CloudKitAssetRecordAsset *)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TRIFBCloudKitAssetRecordAsset;
  id v8 = [(TRIFBCloudKitAssetRecordAsset *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_br, a3);
    v9->_ptr = a4;
  }

  return v9;
}

- (id)initVerifiedRootObjectFromData:(id)a3
{
  return [(TRIFBCloudKitAssetRecordAsset *)self initVerifiedRootObjectFromData:a3 requireUTF8:1];
}

- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4
{
  return [(TRIFBCloudKitAssetRecordAsset *)self initVerifiedRootObjectFromData:a3 requireUTF8:a4 maxDepth:64 maxTables:1000000];
}

- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4 maxDepth:(unsigned int)a5 maxTables:(unsigned int)a6
{
  id v10 = a3;
  objc_super v11 = (void *)MEMORY[0x19F3AD060]();
  id v12 = v10;
  uint64_t v13 = [v12 bytes];
  if (v13) {
    v14 = (const unsigned __int8 *)v13;
  }
  else {
    v14 = (const unsigned __int8 *)&emptyCArrayStorage;
  }
  unint64_t v15 = [v12 length];
  v24 = v14;
  unint64_t v25 = v15;
  int v26 = 0;
  unsigned int v27 = a5;
  int v28 = 0;
  unsigned int v29 = a6;
  uint64_t v30 = 0;
  char v31 = 1;
  if (v15 >= 0x7FFFFFFF) {
    __assert_rtn("Verifier", "flatbuffers.h", 2285, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  }
  if (v15 >= 5
    && ((unint64_t v16 = *(unsigned int *)v14, (int)v16 >= 1) ? (v17 = v15 - 1 >= v16) : (v17 = 0),
        v17
     && apple::aiml::flatbuffers2::Verifier::VerifyTableStart((apple::aiml::flatbuffers2::Verifier *)&v24, &v14[v16])))
  {
    --v26;
    uint64_t v18 = *(unsigned int *)v14;
    id v19 = objc_alloc(MEMORY[0x1E4F4D8A0]);
    v20 = objc_msgSend(v19, "initWithData:", v12, v24, v25);
    self = [(TRIFBCloudKitAssetRecordAsset *)self initWithBufRef:v20 cppPointer:&v14[v18]];

    v21 = self;
    if (a4)
    {
      if ([(TRIFBCloudKitAssetRecordAsset *)self verifyUTF8Fields]) {
        v21 = self;
      }
      else {
        v21 = 0;
      }
    }
    v22 = v21;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (BOOL)verifyUTF8Fields
{
  return 1;
}

- (unint64_t)hash
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
  }
    }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void).cxx_destruct
{
}

@end