@interface TRIFBTrialManagedAsset
- (BOOL)hasDownloadSize;
- (BOOL)hasFileType;
- (BOOL)hasHasOnDemandFlag;
- (BOOL)hasIsOnDemand;
- (BOOL)hasOnDemandFlag;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOnDemand;
- (BOOL)verifyUTF8Fields;
- (NSData)assetIdAsData;
- (NSData)assetNameAsData;
- (NSData)pathAsData;
- (NSString)assetId;
- (NSString)assetName;
- (NSString)path;
- (TRIFBCloudKitAssetRecordAsset)cloudKitMetadataAsAsset;
- (TRIFBCloudKitTreatmentRecordAsset)cloudKitMetadataAsTreatment;
- (TRIFBTrialManagedAsset)initWithBufRef:(id)a3 cppPointer:(const TrialManagedAsset *)a4;
- (const)assetIdAsCString;
- (const)assetNameAsCString;
- (const)pathAsCString;
- (id)deepCopyUsingBufferBuilder:(id)a3;
- (id)deepCopyUsingBufferBuilder:(id)a3 changes:(id)a4;
- (id)initVerifiedRootObjectFromData:(id)a3;
- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4;
- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4 maxDepth:(unsigned int)a5 maxTables:(unsigned int)a6;
- (unint64_t)downloadSize;
- (unint64_t)hash;
- (unsigned)cloudKitMetadataType;
- (unsigned)fileType;
@end

@implementation TRIFBTrialManagedAsset

- (NSString)path
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (uint64_t v4 = *(unsigned __int16 *)v3[4].var0) != 0)
  {
    v6 = &ptr[v4 + *(unsigned int *)ptr[v4].var0];
    NSStringFromSelector(a2);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = makeNSString(v7, self->_br, (const char *)&v6[4]);
  }
  else
  {
    v8 = 0;
  }
  return (NSString *)v8;
}

- (const)pathAsCString
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (uint64_t v4 = *(unsigned __int16 *)v3[4].var0) != 0) {
    return (const char *)&ptr[v4 + 4 + *(unsigned int *)ptr[v4].var0];
  }
  else {
    return 0;
  }
}

- (NSData)pathAsData
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (uint64_t v4 = *(unsigned __int16 *)v3[4].var0) != 0)
  {
    v6 = &ptr[v4];
    uint64_t v7 = *(unsigned int *)ptr[v4].var0;
    v8 = (void *)MEMORY[0x19F3AD060]();
    id v9 = [(AFBBufRef *)self->_br data];
    var0 = (unsigned int *)v6[v7].var0;
    uint64_t v11 = (uint64_t)var0 - [v9 bytes] + 4;

    v12 = [(AFBBufRef *)self->_br data];
    v13 = objc_msgSend(v12, "subdataWithRange:", v11, *var0);
  }
  else
  {
    v13 = 0;
  }
  return (NSData *)v13;
}

- (BOOL)hasFileType
{
  v2 = &self->_ptr[-*(int *)self->_ptr];
  return *(unsigned __int16 *)v2->var0 >= 7u && *(_WORD *)v2[6].var0 != 0;
}

- (unsigned)fileType
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (uint64_t v4 = *(unsigned __int16 *)v3[6].var0) != 0) {
    return ptr[v4].var0[0];
  }
  else {
    return 0;
  }
}

- (NSString)assetId
{
  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v5->var0 >= 9u && (uint64_t v6 = *(unsigned __int16 *)v5[8].var0) != 0)
  {
    uint64_t v7 = &ptr[v6 + *(unsigned int *)ptr[v6].var0];
  }
  else
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 1109, @"Invalid parameter not satisfying: %@", @"fbs" object file lineNumber description];

    uint64_t v7 = 0;
  }
  NSStringFromSelector(a2);
  id v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  v10 = makeNSString(v9, self->_br, (const char *)&v7[4]);

  return (NSString *)v10;
}

- (const)assetIdAsCString
{
  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v5->var0 >= 9u && (uint64_t v6 = *(unsigned __int16 *)v5[8].var0) != 0)
  {
    uint64_t v7 = &ptr[v6 + *(unsigned int *)ptr[v6].var0];
  }
  else
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 1115, @"Invalid parameter not satisfying: %@", @"fbs" object file lineNumber description];

    uint64_t v7 = 0;
  }
  return (const char *)&v7[4];
}

- (NSData)assetIdAsData
{
  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v5->var0 >= 9u && (uint64_t v6 = *(unsigned __int16 *)v5[8].var0) != 0)
  {
    var0 = (unsigned int *)ptr[v6 + *(unsigned int *)ptr[v6].var0].var0;
  }
  else
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 1121, @"Invalid parameter not satisfying: %@", @"fbs" object file lineNumber description];

    var0 = 0;
  }
  id v9 = (void *)MEMORY[0x19F3AD060]();
  id v10 = [(AFBBufRef *)self->_br data];
  uint64_t v11 = (uint64_t)var0 - [v10 bytes] + 4;

  v12 = [(AFBBufRef *)self->_br data];
  v13 = objc_msgSend(v12, "subdataWithRange:", v11, *var0);

  return (NSData *)v13;
}

- (unsigned)cloudKitMetadataType
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xBu && (uint64_t v4 = *(unsigned __int16 *)v3[10].var0) != 0) {
    return ptr[v4].var0[0];
  }
  else {
    return 0;
  }
}

- (TRIFBCloudKitTreatmentRecordAsset)cloudKitMetadataAsTreatment
{
  if ([(TRIFBTrialManagedAsset *)self cloudKitMetadataType] != 1)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 1138, @"Accessed union field \"TRIFBTrialManagedAsset.cloudKitMetadataAsTreatment\", but the value stored in the union does not match this type." object file lineNumber description];
  }
  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  unsigned int v6 = *(unsigned __int16 *)v5->var0;
  if (v6 >= 0xB
    && *(_WORD *)v5[10].var0
    && (v6 >= 0xD ? (BOOL v7 = ptr[*(unsigned __int16 *)v5[10].var0].var0[0] == 1) : (BOOL v7 = 0),
        v7 && (uint64_t v8 = *(unsigned __int16 *)v5[12].var0) != 0))
  {
    id v9 = &ptr[v8 + *(unsigned int *)ptr[v8].var0];
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 1140, @"Invalid parameter not satisfying: %@", @"nested" object file lineNumber description];

    id v9 = 0;
  }
  uint64_t v11 = [[TRIFBCloudKitTreatmentRecordAsset alloc] initWithBufRef:self->_br cppPointer:v9];
  return v11;
}

- (TRIFBCloudKitAssetRecordAsset)cloudKitMetadataAsAsset
{
  if ([(TRIFBTrialManagedAsset *)self cloudKitMetadataType] != 2)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 1148, @"Accessed union field \"TRIFBTrialManagedAsset.cloudKitMetadataAsAsset\", but the value stored in the union does not match this type." object file lineNumber description];
  }
  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  unsigned int v6 = *(unsigned __int16 *)v5->var0;
  if (v6 >= 0xB
    && *(_WORD *)v5[10].var0
    && (v6 >= 0xD ? (BOOL v7 = ptr[*(unsigned __int16 *)v5[10].var0].var0[0] == 2) : (BOOL v7 = 0),
        v7 && (uint64_t v8 = *(unsigned __int16 *)v5[12].var0) != 0))
  {
    id v9 = &ptr[v8 + *(unsigned int *)ptr[v8].var0];
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 1150, @"Invalid parameter not satisfying: %@", @"nested" object file lineNumber description];

    id v9 = 0;
  }
  uint64_t v11 = [[TRIFBCloudKitAssetRecordAsset alloc] initWithBufRef:self->_br cppPointer:v9];
  return v11;
}

- (BOOL)hasIsOnDemand
{
  v2 = &self->_ptr[-*(int *)self->_ptr];
  return *(unsigned __int16 *)v2->var0 >= 0xFu && *(_WORD *)v2[14].var0 != 0;
}

- (BOOL)isOnDemand
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  return *(unsigned __int16 *)v3->var0 >= 0xFu && (uint64_t v4 = *(unsigned __int16 *)v3[14].var0) != 0 && ptr[v4].var0[0] != 0;
}

- (BOOL)hasDownloadSize
{
  v2 = &self->_ptr[-*(int *)self->_ptr];
  return *(unsigned __int16 *)v2->var0 >= 0x11u && *(_WORD *)v2[16].var0 != 0;
}

- (unint64_t)downloadSize
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x11u && (uint64_t v4 = *(unsigned __int16 *)v3[16].var0) != 0) {
    return *(void *)ptr[v4].var0;
  }
  else {
    return 0;
  }
}

- (NSString)assetName
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x13u && (uint64_t v4 = *(unsigned __int16 *)v3[18].var0) != 0)
  {
    unsigned int v6 = &ptr[v4 + *(unsigned int *)ptr[v4].var0];
    NSStringFromSelector(a2);
    BOOL v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = makeNSString(v7, self->_br, (const char *)&v6[4]);
  }
  else
  {
    uint64_t v8 = 0;
  }
  return (NSString *)v8;
}

- (const)assetNameAsCString
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x13u && (uint64_t v4 = *(unsigned __int16 *)v3[18].var0) != 0) {
    return (const char *)&ptr[v4 + 4 + *(unsigned int *)ptr[v4].var0];
  }
  else {
    return 0;
  }
}

- (NSData)assetNameAsData
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x13u && (uint64_t v4 = *(unsigned __int16 *)v3[18].var0) != 0)
  {
    unsigned int v6 = &ptr[v4];
    uint64_t v7 = *(unsigned int *)ptr[v4].var0;
    uint64_t v8 = (void *)MEMORY[0x19F3AD060]();
    id v9 = [(AFBBufRef *)self->_br data];
    var0 = (unsigned int *)v6[v7].var0;
    uint64_t v11 = (uint64_t)var0 - [v9 bytes] + 4;

    v12 = [(AFBBufRef *)self->_br data];
    v13 = objc_msgSend(v12, "subdataWithRange:", v11, *var0);
  }
  else
  {
    v13 = 0;
  }
  return (NSData *)v13;
}

- (BOOL)hasHasOnDemandFlag
{
  v2 = &self->_ptr[-*(int *)self->_ptr];
  return *(unsigned __int16 *)v2->var0 >= 0x15u && *(_WORD *)v2[20].var0 != 0;
}

- (BOOL)hasOnDemandFlag
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x15u && (uint64_t v4 = *(unsigned __int16 *)v3[20].var0) != 0 && ptr[v4].var0[0] != 0;
}

- (id)deepCopyUsingBufferBuilder:(id)a3
{
  v3 = [(TRIFBTrialManagedAsset *)self deepCopyUsingBufferBuilder:a3 changes:0];
  return v3;
}

- (id)deepCopyUsingBufferBuilder:(id)a3 changes:(id)a4
{
  id v7 = a3;
  uint64_t v8 = a4;
  if (!v7)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 1210, @"Invalid parameter not satisfying: %@", @"bufferBuilder" object file lineNumber description];
  }
  id v9 = (void *)MEMORY[0x19F3AD060]();
  if (!v8) {
    goto LABEL_6;
  }
  if (v8[8] == 1)
  {
    v12 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:*((unsigned int *)v8 + 3)];
    goto LABEL_13;
  }
  if (v8[8])
  {
    v12 = 0;
  }
  else
  {
LABEL_6:
    id v10 = (void *)MEMORY[0x19F3AD060]();
    uint64_t v11 = [(TRIFBTrialManagedAsset *)self pathAsCString];
    if (v11)
    {
      v12 = [v7 createStringWithCString:v11];
    }
    else
    {
      v12 = 0;
    }
    if (!v8)
    {
LABEL_15:
      v13 = (void *)MEMORY[0x19F3AD060]();
      v14 = [(TRIFBTrialManagedAsset *)self assetIdAsCString];
      if (v14)
      {
        v15 = [v7 createStringWithCString:v14];
      }
      else
      {
        v15 = 0;
      }
      if (!v8) {
        goto LABEL_23;
      }
      goto LABEL_21;
    }
  }
LABEL_13:
  if (v8[18] == 1)
  {
    v15 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:*((unsigned int *)v8 + 5)];
  }
  else
  {
    if (!v8[18]) {
      goto LABEL_15;
    }
    v15 = 0;
  }
LABEL_21:
  if (v8[25] == 1)
  {
    v19 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:*((unsigned int *)v8 + 7)];
    goto LABEL_32;
  }
  if (v8[25])
  {
    v19 = 0;
    goto LABEL_32;
  }
LABEL_23:
  int v16 = [(TRIFBTrialManagedAsset *)self cloudKitMetadataType];
  if (v16 == 1)
  {
    v17 = [(TRIFBTrialManagedAsset *)self cloudKitMetadataAsTreatment];
    uint64_t v18 = [v17 deepCopyUsingBufferBuilder:v7];
LABEL_29:
    v19 = (void *)v18;

    if (!v8) {
      goto LABEL_34;
    }
    goto LABEL_32;
  }
  if (v16 == 2)
  {
    v17 = [(TRIFBTrialManagedAsset *)self cloudKitMetadataAsAsset];
    uint64_t v18 = [v17 deepCopyUsingBufferBuilder:v7];
    goto LABEL_29;
  }
  v19 = 0;
  if (!v8)
  {
LABEL_34:
    v20 = (void *)MEMORY[0x19F3AD060]();
    v21 = [(TRIFBTrialManagedAsset *)self assetNameAsCString];
    if (v21)
    {
      v22 = [v7 createStringWithCString:v21];
    }
    else
    {
      v22 = 0;
    }
    goto LABEL_40;
  }
LABEL_32:
  if (v8[48] == 1)
  {
    v22 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:*((unsigned int *)v8 + 13)];
  }
  else
  {
    if (!v8[48]) {
      goto LABEL_34;
    }
    v22 = 0;
  }
LABEL_40:
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __61__TRIFBTrialManagedAsset_deepCopyUsingBufferBuilder_changes___block_invoke;
  v31[3] = &unk_1E596A550;
  id v23 = v12;
  id v32 = v23;
  v24 = v8;
  id v33 = v24;
  v34 = self;
  id v25 = v15;
  id v35 = v25;
  id v26 = v19;
  id v36 = v26;
  id v37 = v22;
  id v27 = v22;
  v28 = [v7 trifbCreateTrialManagedAssetUsingBlock:v31];

  return v28;
}

void __61__TRIFBTrialManagedAsset_deepCopyUsingBufferBuilder_changes___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  if (*(void *)(a1 + 32)) {
    objc_msgSend(v12, "setPath:");
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (!v3) {
    goto LABEL_6;
  }
  if (*(unsigned char *)(v3 + 16) == 1)
  {
    uint64_t v4 = *(unsigned __int8 *)(v3 + 17);
    goto LABEL_8;
  }
  if (!*(unsigned char *)(v3 + 16))
  {
LABEL_6:
    uint64_t v4 = [*(id *)(a1 + 48) fileType];
LABEL_8:
    [v12 setFileType:v4];
  }
  if (*(void *)(a1 + 56)) {
    objc_msgSend(v12, "setAssetId:");
  }
  if (*(void *)(a1 + 64))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5 && *(unsigned char *)(v5 + 25) == 1) {
      int v6 = *(unsigned __int8 *)(v5 + 24);
    }
    else {
      int v6 = [*(id *)(a1 + 48) cloudKitMetadataType];
    }
    if (v6 == 1)
    {
      [v12 setCloudKitMetadataWithTreatment:*(void *)(a1 + 64)];
    }
    else if (v6 == 2)
    {
      [v12 setCloudKitMetadataWithAsset:*(void *)(a1 + 64)];
    }
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (!v7) {
    goto LABEL_23;
  }
  if (*(unsigned char *)(v7 + 32) == 1)
  {
    uint64_t v8 = *(unsigned __int8 *)(v7 + 33) != 0;
LABEL_25:
    [v12 setIsOnDemand:v8];
    uint64_t v7 = *(void *)(a1 + 40);
    if (!v7) {
      goto LABEL_28;
    }
    goto LABEL_26;
  }
  if (!*(unsigned char *)(v7 + 32))
  {
LABEL_23:
    uint64_t v8 = [*(id *)(a1 + 48) isOnDemand];
    goto LABEL_25;
  }
LABEL_26:
  if (*(unsigned char *)(v7 + 34) == 1)
  {
    uint64_t v9 = *(void *)(v7 + 40);
    goto LABEL_31;
  }
  if (*(unsigned char *)(v7 + 34)) {
    goto LABEL_32;
  }
LABEL_28:
  if (![*(id *)(a1 + 48) hasDownloadSize]) {
    goto LABEL_32;
  }
  uint64_t v9 = [*(id *)(a1 + 48) downloadSize];
LABEL_31:
  [v12 setDownloadSize:v9];
LABEL_32:
  if (*(void *)(a1 + 72)) {
    objc_msgSend(v12, "setAssetName:");
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10)
  {
    if (*(unsigned char *)(v10 + 56) == 1)
    {
      uint64_t v11 = *(unsigned __int8 *)(v10 + 57) != 0;
      goto LABEL_39;
    }
    if (*(unsigned char *)(v10 + 56)) {
      goto LABEL_40;
    }
  }
  uint64_t v11 = [*(id *)(a1 + 48) hasOnDemandFlag];
LABEL_39:
  [v12 setHasOnDemandFlag:v11];
LABEL_40:
}

- (TRIFBTrialManagedAsset)initWithBufRef:(id)a3 cppPointer:(const TrialManagedAsset *)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TRIFBTrialManagedAsset;
  uint64_t v8 = [(TRIFBTrialManagedAsset *)&v11 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_br, a3);
    v9->_ptr = a4;
  }

  return v9;
}

- (id)initVerifiedRootObjectFromData:(id)a3
{
  return [(TRIFBTrialManagedAsset *)self initVerifiedRootObjectFromData:a3 requireUTF8:1];
}

- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4
{
  return [(TRIFBTrialManagedAsset *)self initVerifiedRootObjectFromData:a3 requireUTF8:a4 maxDepth:64 maxTables:1000000];
}

- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4 maxDepth:(unsigned int)a5 maxTables:(unsigned int)a6
{
  id v10 = a3;
  objc_super v11 = (void *)MEMORY[0x19F3AD060]();
  id v12 = v10;
  uint64_t v13 = [v12 bytes];
  if (v13) {
    v14 = (TrialManagedAsset *)v13;
  }
  else {
    v14 = (TrialManagedAsset *)&emptyCArrayStorage;
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
        v17 && TrialManagedAsset::Verify(&v14[v16], (apple::aiml::flatbuffers2::Verifier *)&v24)))
  {
    uint64_t v18 = *(unsigned int *)v14->var0;
    id v19 = objc_alloc(MEMORY[0x1E4F4D8A0]);
    v20 = objc_msgSend(v19, "initWithData:", v12, v24, v25, v26, v27, v28, v29);
    self = [(TRIFBTrialManagedAsset *)self initWithBufRef:v20 cppPointer:&v14[v18]];

    v21 = self;
    if (a4)
    {
      if ([(TRIFBTrialManagedAsset *)self verifyUTF8Fields]) {
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
  int v3 = [(TRIFBTrialManagedAsset *)self cloudKitMetadataType];
  if (v3 == 2)
  {
    uint64_t v4 = [(TRIFBTrialManagedAsset *)self cloudKitMetadataAsAsset];
    char v5 = [v4 verifyUTF8Fields];
LABEL_5:
    char v6 = v5;

    if ((v6 & 1) == 0)
    {
      LOBYTE(valid) = 0;
      return valid;
    }
    goto LABEL_6;
  }
  if (v3 == 1)
  {
    uint64_t v4 = [(TRIFBTrialManagedAsset *)self cloudKitMetadataAsTreatment];
    char v5 = [v4 verifyUTF8Fields];
    goto LABEL_5;
  }
LABEL_6:
  ptr = self->_ptr;
  uint64_t v8 = *(int *)ptr->var0;
  unsigned int v9 = *(unsigned __int16 *)ptr[-v8].var0;
  if (v9 < 5) {
    goto LABEL_21;
  }
  if (*(_WORD *)ptr[-v8 + 4].var0)
  {
    int valid = AFBIsValidUTF8();
    if (!valid) {
      return valid;
    }
    ptr = self->_ptr;
    uint64_t v11 = *(int *)ptr->var0;
    uint64_t v12 = -v11;
    unsigned int v9 = *(unsigned __int16 *)ptr[-v11].var0;
  }
  else
  {
    uint64_t v12 = -v8;
  }
  if (v9 < 9) {
    goto LABEL_21;
  }
  if (*(_WORD *)ptr[v12 + 8].var0)
  {
    int valid = AFBIsValidUTF8();
    if (!valid) {
      return valid;
    }
    ptr = self->_ptr;
    uint64_t v13 = *(int *)ptr->var0;
    uint64_t v12 = -v13;
    unsigned int v9 = *(unsigned __int16 *)ptr[-v13].var0;
  }
  if (v9 < 0x13 || !*(_WORD *)ptr[v12 + 18].var0)
  {
LABEL_21:
    LOBYTE(valid) = 1;
    return valid;
  }
  LOBYTE(valid) = AFBIsValidUTF8();
  return valid;
}

- (unint64_t)hash
{
  int v3 = (void *)MEMORY[0x19F3AD060](self, a2);
  uint64_t v4 = [(TRIFBTrialManagedAsset *)self path];
  uint64_t v5 = [v4 hash];

  unsigned int v6 = [(TRIFBTrialManagedAsset *)self fileType];
  id v7 = [(TRIFBTrialManagedAsset *)self assetId];
  uint64_t v8 = [v7 hash];

  unsigned int v9 = [(TRIFBTrialManagedAsset *)self cloudKitMetadataType];
  BOOL v10 = [(TRIFBTrialManagedAsset *)self isOnDemand];
  unint64_t v11 = [(TRIFBTrialManagedAsset *)self downloadSize];
  uint64_t v12 = [(TRIFBTrialManagedAsset *)self assetName];
  uint64_t v13 = [v12 hash] + 37 * (v11 + 37 * (37 * (37 * (v8 + 37 * (37 * v5 + v6)) + v9) + v10));

  unint64_t v14 = 37 * v13 + [(TRIFBTrialManagedAsset *)self hasOnDemandFlag];
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      LOBYTE(v12) = 0;
LABEL_24:

      goto LABEL_25;
    }
    id v7 = (void *)MEMORY[0x19F3AD060]();
    int v8 = [(TRIFBTrialManagedAsset *)self cloudKitMetadataType];
    if (v8 != [v6 cloudKitMetadataType]) {
      goto LABEL_22;
    }
    int v9 = [(TRIFBTrialManagedAsset *)self cloudKitMetadataType];
    if (v9 == 2)
    {
      uint64_t v10 = [(TRIFBTrialManagedAsset *)self cloudKitMetadataAsAsset];
      uint64_t v11 = [v6 cloudKitMetadataAsAsset];
      if (v10 | v11) {
        goto LABEL_11;
      }
    }
    else if (v9 == 1)
    {
      uint64_t v10 = [(TRIFBTrialManagedAsset *)self cloudKitMetadataAsTreatment];
      uint64_t v11 = [v6 cloudKitMetadataAsTreatment];
      if (v10 | v11)
      {
LABEL_11:
        char v13 = [(id)v10 isEqual:v11];

        if ((v13 & 1) == 0) {
          goto LABEL_22;
        }
      }
    }
    uint64_t v14 = [(TRIFBTrialManagedAsset *)self path];
    uint64_t v15 = [v6 path];
    if (!(v14 | v15)
      || (int v16 = [(id)v14 isEqual:v15], (id)v15, (id)v14, v16))
    {
      int v17 = [(TRIFBTrialManagedAsset *)self fileType];
      if (v17 == [v6 fileType])
      {
        uint64_t v18 = [(TRIFBTrialManagedAsset *)self assetId];
        uint64_t v19 = [v6 assetId];
        if (!(v18 | v19)
          || (int v20 = [(id)v18 isEqual:v19], (id)v19, (id)v18, v20))
        {
          int v21 = [(TRIFBTrialManagedAsset *)self isOnDemand];
          if (v21 == [v6 isOnDemand])
          {
            unint64_t v22 = [(TRIFBTrialManagedAsset *)self downloadSize];
            if (v22 == [v6 downloadSize])
            {
              uint64_t v23 = [(TRIFBTrialManagedAsset *)self assetName];
              uint64_t v24 = [v6 assetName];
              if (!(v23 | v24)
                || (int v25 = [(id)v23 isEqual:v24], (id)v24, (id)v23, v25))
              {
                BOOL v26 = [(TRIFBTrialManagedAsset *)self hasOnDemandFlag];
                int v12 = v26 ^ [v6 hasOnDemandFlag] ^ 1;
LABEL_23:
                goto LABEL_24;
              }
            }
          }
        }
      }
    }
LABEL_22:
    LOBYTE(v12) = 0;
    goto LABEL_23;
  }
  LOBYTE(v12) = 0;
LABEL_25:

  return v12;
}

- (void).cxx_destruct
{
}

@end