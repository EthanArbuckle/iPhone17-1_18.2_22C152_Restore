@interface TRIFBCloudKitTreatmentRecordAsset
- (BOOL)hasAssetIndex;
- (BOOL)hasCkIndex;
- (BOOL)hasContainer;
- (BOOL)hasHasCkIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)verifyUTF8Fields;
- (NSData)treatmentIdAsData;
- (NSString)treatmentId;
- (TRIFBCloudKitTreatmentRecordAsset)initWithBufRef:(id)a3 cppPointer:(const CloudKitTreatmentRecordAsset *)a4;
- (const)treatmentIdAsCString;
- (id)deepCopyUsingBufferBuilder:(id)a3;
- (id)deepCopyUsingBufferBuilder:(id)a3 changes:(id)a4;
- (id)initVerifiedRootObjectFromData:(id)a3;
- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4;
- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4 maxDepth:(unsigned int)a5 maxTables:(unsigned int)a6;
- (unint64_t)hash;
- (unsigned)assetIndex;
- (unsigned)container;
@end

@implementation TRIFBCloudKitTreatmentRecordAsset

- (BOOL)hasContainer
{
  v2 = &self->_ptr[-*(int *)self->_ptr];
  return *(unsigned __int16 *)v2->var0 >= 5u && *(_WORD *)v2[4].var0 != 0;
}

- (unsigned)container
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (uint64_t v4 = *(unsigned __int16 *)v3[4].var0) != 0) {
    return ptr[v4].var0[0];
  }
  else {
    return 0;
  }
}

- (NSString)treatmentId
{
  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v5->var0 >= 7u && (uint64_t v6 = *(unsigned __int16 *)v5[6].var0) != 0)
  {
    v7 = &ptr[v6 + *(unsigned int *)ptr[v6].var0];
  }
  else
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 397, @"Invalid parameter not satisfying: %@", @"fbs" object file lineNumber description];

    v7 = 0;
  }
  NSStringFromSelector(a2);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  v10 = makeNSString(v9, self->_br, (const char *)&v7[4]);

  return (NSString *)v10;
}

- (const)treatmentIdAsCString
{
  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v5->var0 >= 7u && (uint64_t v6 = *(unsigned __int16 *)v5[6].var0) != 0)
  {
    v7 = &ptr[v6 + *(unsigned int *)ptr[v6].var0];
  }
  else
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 403, @"Invalid parameter not satisfying: %@", @"fbs" object file lineNumber description];

    v7 = 0;
  }
  return (const char *)&v7[4];
}

- (NSData)treatmentIdAsData
{
  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v5->var0 >= 7u && (uint64_t v6 = *(unsigned __int16 *)v5[6].var0) != 0)
  {
    var0 = (unsigned int *)ptr[v6 + *(unsigned int *)ptr[v6].var0].var0;
  }
  else
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 409, @"Invalid parameter not satisfying: %@", @"fbs" object file lineNumber description];

    var0 = 0;
  }
  v9 = (void *)MEMORY[0x19F3AD060]();
  id v10 = [(AFBBufRef *)self->_br data];
  uint64_t v11 = (uint64_t)var0 - [v10 bytes] + 4;

  v12 = [(AFBBufRef *)self->_br data];
  v13 = objc_msgSend(v12, "subdataWithRange:", v11, *var0);

  return (NSData *)v13;
}

- (BOOL)hasAssetIndex
{
  v2 = &self->_ptr[-*(int *)self->_ptr];
  return *(unsigned __int16 *)v2->var0 >= 9u && *(_WORD *)v2[8].var0 != 0;
}

- (unsigned)assetIndex
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 9u && (uint64_t v4 = *(unsigned __int16 *)v3[8].var0) != 0) {
    return *(_DWORD *)ptr[v4].var0;
  }
  else {
    return 0;
  }
}

- (BOOL)hasHasCkIndex
{
  v2 = &self->_ptr[-*(int *)self->_ptr];
  return *(unsigned __int16 *)v2->var0 >= 0xBu && *(_WORD *)v2[10].var0 != 0;
}

- (BOOL)hasCkIndex
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  return *(unsigned __int16 *)v3->var0 >= 0xBu && (uint64_t v4 = *(unsigned __int16 *)v3[10].var0) != 0 && ptr[v4].var0[0] != 0;
}

- (id)deepCopyUsingBufferBuilder:(id)a3
{
  v3 = [(TRIFBCloudKitTreatmentRecordAsset *)self deepCopyUsingBufferBuilder:a3 changes:0];
  return v3;
}

- (id)deepCopyUsingBufferBuilder:(id)a3 changes:(id)a4
{
  id v7 = a3;
  v8 = a4;
  if (!v7)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 440, @"Invalid parameter not satisfying: %@", @"bufferBuilder" object file lineNumber description];
  }
  v9 = (void *)MEMORY[0x19F3AD060]();
  if (!v8) {
    goto LABEL_6;
  }
  if (v8[10] == 1)
  {
    v12 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:*((unsigned int *)v8 + 3)];
  }
  else
  {
    if (!v8[10])
    {
LABEL_6:
      id v10 = (void *)MEMORY[0x19F3AD060]();
      uint64_t v11 = [(TRIFBCloudKitTreatmentRecordAsset *)self treatmentIdAsCString];
      if (v11)
      {
        v12 = [v7 createStringWithCString:v11];
      }
      else
      {
        v12 = 0;
      }
      goto LABEL_12;
    }
    v12 = 0;
  }
LABEL_12:
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __72__TRIFBCloudKitTreatmentRecordAsset_deepCopyUsingBufferBuilder_changes___block_invoke;
  v18[3] = &unk_1E596A4E8;
  v13 = v8;
  id v19 = v13;
  v20 = self;
  id v21 = v12;
  id v14 = v12;
  v15 = [v7 trifbCreateCloudKitTreatmentRecordAssetUsingBlock:v18];

  return v15;
}

void __72__TRIFBCloudKitTreatmentRecordAsset_deepCopyUsingBufferBuilder_changes___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  if (!v3) {
    goto LABEL_4;
  }
  if (*(unsigned char *)(v3 + 8) == 1)
  {
    uint64_t v4 = *(unsigned __int8 *)(v3 + 9);
    goto LABEL_6;
  }
  if (!*(unsigned char *)(v3 + 8))
  {
LABEL_4:
    uint64_t v4 = [*(id *)(a1 + 40) container];
LABEL_6:
    [v8 setContainer:v4];
  }
  if (*(void *)(a1 + 48)) {
    objc_msgSend(v8, "setTreatmentId:");
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (!v5) {
    goto LABEL_12;
  }
  if (*(unsigned char *)(v5 + 16) == 1)
  {
    uint64_t v6 = *(unsigned int *)(v5 + 20);
LABEL_14:
    [v8 setAssetIndex:v6];
    uint64_t v5 = *(void *)(a1 + 32);
    if (!v5) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  if (!*(unsigned char *)(v5 + 16))
  {
LABEL_12:
    uint64_t v6 = [*(id *)(a1 + 40) assetIndex];
    goto LABEL_14;
  }
LABEL_15:
  if (*(unsigned char *)(v5 + 24) == 1)
  {
    uint64_t v7 = *(unsigned __int8 *)(v5 + 25) != 0;
    goto LABEL_19;
  }
  if (*(unsigned char *)(v5 + 24)) {
    goto LABEL_20;
  }
LABEL_17:
  uint64_t v7 = [*(id *)(a1 + 40) hasCkIndex];
LABEL_19:
  [v8 setHasCkIndex:v7];
LABEL_20:
}

- (TRIFBCloudKitTreatmentRecordAsset)initWithBufRef:(id)a3 cppPointer:(const CloudKitTreatmentRecordAsset *)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TRIFBCloudKitTreatmentRecordAsset;
  id v8 = [(TRIFBCloudKitTreatmentRecordAsset *)&v11 init];
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
  return [(TRIFBCloudKitTreatmentRecordAsset *)self initVerifiedRootObjectFromData:a3 requireUTF8:1];
}

- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4
{
  return [(TRIFBCloudKitTreatmentRecordAsset *)self initVerifiedRootObjectFromData:a3 requireUTF8:a4 maxDepth:64 maxTables:1000000];
}

- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4 maxDepth:(unsigned int)a5 maxTables:(unsigned int)a6
{
  id v10 = a3;
  objc_super v11 = (void *)MEMORY[0x19F3AD060]();
  id v12 = v10;
  uint64_t v13 = [v12 bytes];
  if (v13) {
    id v14 = (CloudKitTreatmentRecordAsset *)v13;
  }
  else {
    id v14 = (CloudKitTreatmentRecordAsset *)&emptyCArrayStorage;
  }
  unint64_t v15 = [v12 length];
  v24 = v14;
  unint64_t v25 = v15;
  LODWORD(v26) = 0;
  HIDWORD(v26) = a5;
  LODWORD(v27) = 0;
  HIDWORD(v27) = a6;
  uint64_t v28 = 0;
  LOBYTE(v29) = 1;
  if (v15 >= 0x7FFFFFFF) {
    __assert_rtn("Verifier", "flatbuffers.h", 2285, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  }
  if (v15 >= 5
    && ((unint64_t v16 = *(unsigned int *)v14->var0, (int)v16 >= 1) ? (v17 = v15 - 1 >= v16) : (v17 = 0),
        v17 && CloudKitTreatmentRecordAsset::Verify(&v14[v16], (apple::aiml::flatbuffers2::Verifier *)&v24)))
  {
    uint64_t v18 = *(unsigned int *)v14->var0;
    id v19 = objc_alloc(MEMORY[0x1E4F4D8A0]);
    v20 = objc_msgSend(v19, "initWithData:", v12, v24, v25, v26, v27, v28, v29);
    self = [(TRIFBCloudKitTreatmentRecordAsset *)self initWithBufRef:v20 cppPointer:&v14[v18]];

    id v21 = self;
    if (a4)
    {
      if ([(TRIFBCloudKitTreatmentRecordAsset *)self verifyUTF8Fields]) {
        id v21 = self;
      }
      else {
        id v21 = 0;
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
  v2 = &self->_ptr[-*(int *)self->_ptr];
  if (*(unsigned __int16 *)v2->var0 >= 7u && *(_WORD *)v2[6].var0) {
    return AFBIsValidUTF8();
  }
  else {
    return 1;
  }
}

- (unint64_t)hash
{
  uint64_t v3 = (void *)MEMORY[0x19F3AD060](self, a2);
  unsigned int v4 = [(TRIFBCloudKitTreatmentRecordAsset *)self container];
  uint64_t v5 = [(TRIFBCloudKitTreatmentRecordAsset *)self treatmentId];
  uint64_t v6 = [v5 hash] + 37 * v4;

  uint64_t v7 = 37 * (37 * v6 + [(TRIFBCloudKitTreatmentRecordAsset *)self assetIndex]);
  unint64_t v8 = v7 + [(TRIFBCloudKitTreatmentRecordAsset *)self hasCkIndex];
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = (void *)MEMORY[0x19F3AD060]();
      int v8 = [(TRIFBCloudKitTreatmentRecordAsset *)self container];
      if (v8 != [v6 container]) {
        goto LABEL_10;
      }
      uint64_t v9 = [(TRIFBCloudKitTreatmentRecordAsset *)self treatmentId];
      uint64_t v10 = [v6 treatmentId];
      if (v9 | v10)
      {
        int v11 = [(id)v9 isEqual:v10];

        if (!v11) {
          goto LABEL_10;
        }
      }
      unsigned int v12 = [(TRIFBCloudKitTreatmentRecordAsset *)self assetIndex];
      if (v12 == [v6 assetIndex])
      {
        BOOL v13 = [(TRIFBCloudKitTreatmentRecordAsset *)self hasCkIndex];
        int v14 = v13 ^ [v6 hasCkIndex] ^ 1;
      }
      else
      {
LABEL_10:
        LOBYTE(v14) = 0;
      }
    }
    else
    {
      LOBYTE(v14) = 0;
    }
  }
  else
  {
    LOBYTE(v14) = 0;
  }

  return v14;
}

- (void).cxx_destruct
{
}

@end