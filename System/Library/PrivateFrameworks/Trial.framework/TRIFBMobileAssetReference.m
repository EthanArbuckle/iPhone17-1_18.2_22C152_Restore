@interface TRIFBMobileAssetReference
- (BOOL)hasDownloadSize;
- (BOOL)hasFileType;
- (BOOL)hasIsOnDemand;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOnDemand;
- (BOOL)verifyUTF8Fields;
- (NSData)assetNameAsData;
- (NSData)specifierAsData;
- (NSData)typeAsData;
- (NSData)versionAsData;
- (NSString)assetName;
- (NSString)specifier;
- (NSString)type;
- (NSString)version;
- (TRIFBMobileAssetReference)initWithBufRef:(id)a3 cppPointer:(const MobileAssetReference *)a4;
- (const)assetNameAsCString;
- (const)specifierAsCString;
- (const)typeAsCString;
- (const)versionAsCString;
- (id)deepCopyUsingBufferBuilder:(id)a3;
- (id)deepCopyUsingBufferBuilder:(id)a3 changes:(id)a4;
- (id)initVerifiedRootObjectFromData:(id)a3;
- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4;
- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4 maxDepth:(unsigned int)a5 maxTables:(unsigned int)a6;
- (unint64_t)downloadSize;
- (unint64_t)hash;
- (unsigned)fileType;
@end

@implementation TRIFBMobileAssetReference

- (NSString)type
{
  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v5->var0 >= 5u && (uint64_t v6 = *(unsigned __int16 *)v5[4].var0) != 0)
  {
    v7 = &ptr[v6 + *(unsigned int *)ptr[v6].var0];
  }
  else
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 1899, @"Invalid parameter not satisfying: %@", @"fbs" object file lineNumber description];

    v7 = 0;
  }
  NSStringFromSelector(a2);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  v10 = makeNSString(v9, self->_br, (const char *)&v7[4]);

  return (NSString *)v10;
}

- (const)typeAsCString
{
  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v5->var0 >= 5u && (uint64_t v6 = *(unsigned __int16 *)v5[4].var0) != 0)
  {
    v7 = &ptr[v6 + *(unsigned int *)ptr[v6].var0];
  }
  else
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 1905, @"Invalid parameter not satisfying: %@", @"fbs" object file lineNumber description];

    v7 = 0;
  }
  return (const char *)&v7[4];
}

- (NSData)typeAsData
{
  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v5->var0 >= 5u && (uint64_t v6 = *(unsigned __int16 *)v5[4].var0) != 0)
  {
    var0 = (unsigned int *)ptr[v6 + *(unsigned int *)ptr[v6].var0].var0;
  }
  else
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 1911, @"Invalid parameter not satisfying: %@", @"fbs" object file lineNumber description];

    var0 = 0;
  }
  v9 = (void *)MEMORY[0x19F3AD060]();
  id v10 = [(AFBBufRef *)self->_br data];
  uint64_t v11 = (uint64_t)var0 - [v10 bytes] + 4;

  v12 = [(AFBBufRef *)self->_br data];
  v13 = objc_msgSend(v12, "subdataWithRange:", v11, *var0);

  return (NSData *)v13;
}

- (NSString)specifier
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
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 1920, @"Invalid parameter not satisfying: %@", @"fbs" object file lineNumber description];

    v7 = 0;
  }
  NSStringFromSelector(a2);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  id v10 = makeNSString(v9, self->_br, (const char *)&v7[4]);

  return (NSString *)v10;
}

- (const)specifierAsCString
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
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 1926, @"Invalid parameter not satisfying: %@", @"fbs" object file lineNumber description];

    v7 = 0;
  }
  return (const char *)&v7[4];
}

- (NSData)specifierAsData
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
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 1932, @"Invalid parameter not satisfying: %@", @"fbs" object file lineNumber description];

    var0 = 0;
  }
  v9 = (void *)MEMORY[0x19F3AD060]();
  id v10 = [(AFBBufRef *)self->_br data];
  uint64_t v11 = (uint64_t)var0 - [v10 bytes] + 4;

  v12 = [(AFBBufRef *)self->_br data];
  v13 = objc_msgSend(v12, "subdataWithRange:", v11, *var0);

  return (NSData *)v13;
}

- (NSString)version
{
  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v5->var0 >= 9u && (uint64_t v6 = *(unsigned __int16 *)v5[8].var0) != 0)
  {
    v7 = &ptr[v6 + *(unsigned int *)ptr[v6].var0];
  }
  else
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 1941, @"Invalid parameter not satisfying: %@", @"fbs" object file lineNumber description];

    v7 = 0;
  }
  NSStringFromSelector(a2);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  id v10 = makeNSString(v9, self->_br, (const char *)&v7[4]);

  return (NSString *)v10;
}

- (const)versionAsCString
{
  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v5->var0 >= 9u && (uint64_t v6 = *(unsigned __int16 *)v5[8].var0) != 0)
  {
    v7 = &ptr[v6 + *(unsigned int *)ptr[v6].var0];
  }
  else
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 1947, @"Invalid parameter not satisfying: %@", @"fbs" object file lineNumber description];

    v7 = 0;
  }
  return (const char *)&v7[4];
}

- (NSData)versionAsData
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
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 1953, @"Invalid parameter not satisfying: %@", @"fbs" object file lineNumber description];

    var0 = 0;
  }
  v9 = (void *)MEMORY[0x19F3AD060]();
  id v10 = [(AFBBufRef *)self->_br data];
  uint64_t v11 = (uint64_t)var0 - [v10 bytes] + 4;

  v12 = [(AFBBufRef *)self->_br data];
  v13 = objc_msgSend(v12, "subdataWithRange:", v11, *var0);

  return (NSData *)v13;
}

- (BOOL)hasFileType
{
  v2 = &self->_ptr[-*(int *)self->_ptr];
  return *(unsigned __int16 *)v2->var0 >= 0xBu && *(_WORD *)v2[10].var0 != 0;
}

- (unsigned)fileType
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

- (BOOL)hasIsOnDemand
{
  v2 = &self->_ptr[-*(int *)self->_ptr];
  return *(unsigned __int16 *)v2->var0 >= 0xDu && *(_WORD *)v2[12].var0 != 0;
}

- (BOOL)isOnDemand
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  return *(unsigned __int16 *)v3->var0 >= 0xDu && (uint64_t v4 = *(unsigned __int16 *)v3[12].var0) != 0 && ptr[v4].var0[0] != 0;
}

- (BOOL)hasDownloadSize
{
  v2 = &self->_ptr[-*(int *)self->_ptr];
  return *(unsigned __int16 *)v2->var0 >= 0xFu && *(_WORD *)v2[14].var0 != 0;
}

- (unint64_t)downloadSize
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xFu && (uint64_t v4 = *(unsigned __int16 *)v3[14].var0) != 0) {
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
  if (*(unsigned __int16 *)v3->var0 >= 0x11u && (uint64_t v4 = *(unsigned __int16 *)v3[16].var0) != 0)
  {
    uint64_t v6 = &ptr[v4 + *(unsigned int *)ptr[v4].var0];
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

- (const)assetNameAsCString
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x11u && (uint64_t v4 = *(unsigned __int16 *)v3[16].var0) != 0) {
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
  if (*(unsigned __int16 *)v3->var0 >= 0x11u && (uint64_t v4 = *(unsigned __int16 *)v3[16].var0) != 0)
  {
    uint64_t v6 = &ptr[v4];
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

- (id)deepCopyUsingBufferBuilder:(id)a3
{
  v3 = [(TRIFBMobileAssetReference *)self deepCopyUsingBufferBuilder:a3 changes:0];
  return v3;
}

- (id)deepCopyUsingBufferBuilder:(id)a3 changes:(id)a4
{
  id v7 = a3;
  v8 = a4;
  if (!v7)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 2017, @"Invalid parameter not satisfying: %@", @"bufferBuilder" object file lineNumber description];
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
    uint64_t v11 = [(TRIFBMobileAssetReference *)self typeAsCString];
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
      v14 = [(TRIFBMobileAssetReference *)self specifierAsCString];
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
  if (v8[16] == 1)
  {
    v15 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:*((unsigned int *)v8 + 5)];
  }
  else
  {
    if (!v8[16]) {
      goto LABEL_15;
    }
    v15 = 0;
  }
LABEL_21:
  if (v8[24] == 1)
  {
    v18 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:*((unsigned int *)v8 + 7)];
    goto LABEL_29;
  }
  if (v8[24])
  {
    v18 = 0;
    goto LABEL_29;
  }
LABEL_23:
  v16 = (void *)MEMORY[0x19F3AD060]();
  v17 = [(TRIFBMobileAssetReference *)self versionAsCString];
  if (v17)
  {
    v18 = [v7 createStringWithCString:v17];
  }
  else
  {
    v18 = 0;
  }
  if (!v8) {
    goto LABEL_31;
  }
LABEL_29:
  if (v8[48] == 1)
  {
    v21 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:*((unsigned int *)v8 + 13)];
  }
  else
  {
    if (!v8[48])
    {
LABEL_31:
      v19 = (void *)MEMORY[0x19F3AD060]();
      v20 = [(TRIFBMobileAssetReference *)self assetNameAsCString];
      if (v20)
      {
        v21 = [v7 createStringWithCString:v20];
      }
      else
      {
        v21 = 0;
      }
      goto LABEL_37;
    }
    v21 = 0;
  }
LABEL_37:
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __64__TRIFBMobileAssetReference_deepCopyUsingBufferBuilder_changes___block_invoke;
  v30[3] = &unk_1E596A578;
  id v22 = v12;
  id v31 = v22;
  id v23 = v15;
  id v32 = v23;
  id v24 = v18;
  id v33 = v24;
  v25 = v8;
  id v34 = v25;
  v35 = self;
  id v36 = v21;
  id v26 = v21;
  v27 = [v7 trifbCreateMobileAssetReferenceUsingBlock:v30];

  return v27;
}

void __64__TRIFBMobileAssetReference_deepCopyUsingBufferBuilder_changes___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (*(void *)(a1 + 32)) {
    objc_msgSend(v7, "setType:");
  }
  if (*(void *)(a1 + 40)) {
    objc_msgSend(v7, "setSpecifier:");
  }
  if (*(void *)(a1 + 48)) {
    objc_msgSend(v7, "setVersion:");
  }
  uint64_t v3 = *(void *)(a1 + 56);
  if (!v3)
  {
LABEL_10:
    uint64_t v4 = [*(id *)(a1 + 64) fileType];
    goto LABEL_12;
  }
  if (*(unsigned char *)(v3 + 32) != 1)
  {
    if (*(unsigned char *)(v3 + 32)) {
      goto LABEL_13;
    }
    goto LABEL_10;
  }
  uint64_t v4 = *(unsigned __int8 *)(v3 + 33);
LABEL_12:
  [v7 setFileType:v4];
  uint64_t v3 = *(void *)(a1 + 56);
  if (!v3) {
    goto LABEL_15;
  }
LABEL_13:
  if (*(unsigned char *)(v3 + 34) == 1)
  {
    uint64_t v5 = *(unsigned __int8 *)(v3 + 35) != 0;
LABEL_17:
    [v7 setIsOnDemand:v5];
    uint64_t v3 = *(void *)(a1 + 56);
    if (!v3) {
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  if (!*(unsigned char *)(v3 + 34))
  {
LABEL_15:
    uint64_t v5 = [*(id *)(a1 + 64) isOnDemand];
    goto LABEL_17;
  }
LABEL_18:
  if (*(unsigned char *)(v3 + 36) == 1)
  {
    uint64_t v6 = *(void *)(v3 + 40);
    goto LABEL_23;
  }
  if (*(unsigned char *)(v3 + 36)) {
    goto LABEL_24;
  }
LABEL_20:
  if (![*(id *)(a1 + 64) hasDownloadSize]) {
    goto LABEL_24;
  }
  uint64_t v6 = [*(id *)(a1 + 64) downloadSize];
LABEL_23:
  [v7 setDownloadSize:v6];
LABEL_24:
  if (*(void *)(a1 + 72)) {
    objc_msgSend(v7, "setAssetName:");
  }
}

- (TRIFBMobileAssetReference)initWithBufRef:(id)a3 cppPointer:(const MobileAssetReference *)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TRIFBMobileAssetReference;
  v8 = [(TRIFBMobileAssetReference *)&v11 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_br, a3);
    v9->_ptr = a4;
  }

  return v9;
}

- (id)initVerifiedRootObjectFromData:(id)a3
{
  return [(TRIFBMobileAssetReference *)self initVerifiedRootObjectFromData:a3 requireUTF8:1];
}

- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4
{
  return [(TRIFBMobileAssetReference *)self initVerifiedRootObjectFromData:a3 requireUTF8:a4 maxDepth:64 maxTables:1000000];
}

- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4 maxDepth:(unsigned int)a5 maxTables:(unsigned int)a6
{
  id v10 = a3;
  objc_super v11 = (void *)MEMORY[0x19F3AD060]();
  id v12 = v10;
  uint64_t v13 = [v12 bytes];
  if (v13) {
    v14 = (MobileAssetReference *)v13;
  }
  else {
    v14 = (MobileAssetReference *)&emptyCArrayStorage;
  }
  unint64_t v15 = [v12 length];
  id v24 = v14;
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
        v17 && MobileAssetReference::Verify(&v14[v16], (apple::aiml::flatbuffers2::Verifier *)&v24)))
  {
    uint64_t v18 = *(unsigned int *)v14->var0;
    id v19 = objc_alloc(MEMORY[0x1E4F4D8A0]);
    v20 = objc_msgSend(v19, "initWithData:", v12, v24, v25, v26, v27, v28, v29);
    self = [(TRIFBMobileAssetReference *)self initWithBufRef:v20 cppPointer:&v14[v18]];

    v21 = self;
    if (a4)
    {
      if ([(TRIFBMobileAssetReference *)self verifyUTF8Fields]) {
        v21 = self;
      }
      else {
        v21 = 0;
      }
    }
    id v22 = v21;
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

- (BOOL)verifyUTF8Fields
{
  ptr = self->_ptr;
  uint64_t v3 = *(int *)ptr->var0;
  unsigned int v4 = *(unsigned __int16 *)ptr[-v3].var0;
  if (v4 < 5) {
    goto LABEL_19;
  }
  if (*(_WORD *)ptr[-v3 + 4].var0)
  {
    int valid = AFBIsValidUTF8();
    if (!valid) {
      return valid;
    }
    ptr = self->_ptr;
    uint64_t v7 = *(int *)ptr->var0;
    uint64_t v8 = -v7;
    unsigned int v4 = *(unsigned __int16 *)ptr[-v7].var0;
  }
  else
  {
    uint64_t v8 = -v3;
  }
  if (v4 < 7) {
    goto LABEL_19;
  }
  if (*(_WORD *)ptr[v8 + 6].var0)
  {
    int valid = AFBIsValidUTF8();
    if (!valid) {
      return valid;
    }
    ptr = self->_ptr;
    uint64_t v9 = *(int *)ptr->var0;
    uint64_t v8 = -v9;
    unsigned int v4 = *(unsigned __int16 *)ptr[-v9].var0;
  }
  if (v4 < 9) {
    goto LABEL_19;
  }
  if (*(_WORD *)ptr[v8 + 8].var0)
  {
    int valid = AFBIsValidUTF8();
    if (!valid) {
      return valid;
    }
    ptr = self->_ptr;
    uint64_t v10 = *(int *)ptr->var0;
    uint64_t v8 = -v10;
    unsigned int v4 = *(unsigned __int16 *)ptr[-v10].var0;
  }
  if (v4 < 0x11 || !*(_WORD *)ptr[v8 + 16].var0)
  {
LABEL_19:
    LOBYTE(valid) = 1;
    return valid;
  }
  LOBYTE(valid) = AFBIsValidUTF8();
  return valid;
}

- (unint64_t)hash
{
  uint64_t v3 = (void *)MEMORY[0x19F3AD060](self, a2);
  unsigned int v4 = [(TRIFBMobileAssetReference *)self type];
  uint64_t v5 = [v4 hash];

  uint64_t v6 = [(TRIFBMobileAssetReference *)self specifier];
  uint64_t v7 = [v6 hash];

  uint64_t v8 = [(TRIFBMobileAssetReference *)self version];
  uint64_t v9 = [v8 hash];

  unsigned int v10 = [(TRIFBMobileAssetReference *)self fileType];
  BOOL v11 = [(TRIFBMobileAssetReference *)self isOnDemand];
  unint64_t v12 = [(TRIFBMobileAssetReference *)self downloadSize];
  uint64_t v13 = [(TRIFBMobileAssetReference *)self assetName];
  unint64_t v14 = [v13 hash] + 37 * (v12 + 37 * (37 * (37 * (v9 + 37 * (v7 + 37 * v5)) + v10) + v11));

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
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = (void *)MEMORY[0x19F3AD060]();
      uint64_t v8 = [(TRIFBMobileAssetReference *)self type];
      uint64_t v9 = [v6 type];
      if (v8 | v9)
      {
        int v10 = [(id)v8 isEqual:v9];

        if (!v10) {
          goto LABEL_16;
        }
      }
      uint64_t v11 = [(TRIFBMobileAssetReference *)self specifier];
      uint64_t v12 = [v6 specifier];
      if (v11 | v12)
      {
        int v13 = [(id)v11 isEqual:v12];

        if (!v13) {
          goto LABEL_16;
        }
      }
      uint64_t v14 = [(TRIFBMobileAssetReference *)self version];
      uint64_t v15 = [v6 version];
      if (v14 | v15)
      {
        int v16 = [(id)v14 isEqual:v15];

        if (!v16) {
          goto LABEL_16;
        }
      }
      int v17 = [(TRIFBMobileAssetReference *)self fileType];
      if (v17 == [v6 fileType]
        && (int v18 = [(TRIFBMobileAssetReference *)self isOnDemand],
            v18 == [v6 isOnDemand])
        && (unint64_t v19 = [(TRIFBMobileAssetReference *)self downloadSize],
            v19 == [v6 downloadSize]))
      {
        uint64_t v20 = [(TRIFBMobileAssetReference *)self assetName];
        uint64_t v21 = [v6 assetName];
        if (v20 | v21) {
          char v22 = [(id)v20 isEqual:v21];
        }
        else {
          char v22 = 1;
        }
      }
      else
      {
LABEL_16:
        char v22 = 0;
      }
    }
    else
    {
      char v22 = 0;
    }
  }
  else
  {
    char v22 = 0;
  }

  return v22;
}

- (void).cxx_destruct
{
}

@end