@interface PLTaggedPointerDataStoreKey
+ (id)keyWithKeyStruct:(const void *)a3 keyLength:(unint64_t)a4 forStoreClassID:(unsigned __int16)a5 inLibraryWithID:(id)a6;
- (BOOL)isDerivative;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToKey:(id)a3;
- (BOOL)representsSquareResource;
- (PLTaggedPointerDataStoreKey)initWithKeyStruct:(const void *)a3;
- (id)_heapAllocatedRepresentationInLibraryWithID:(id)a3;
- (id)descriptionForAssetID:(id)a3;
- (id)fileURLForAssetID:(id)a3;
- (id)keyData;
- (id)uniformTypeIdentifier;
- (id)validateForAssetID:(id)a3 resourceIdentity:(id)a4;
- (unsigned)recipeIDForAssetID:(id)a3;
- (unsigned)resourceType;
- (unsigned)resourceVersion;
- (void)tableType:(unsigned int *)a3 index:(int *)a4;
@end

@implementation PLTaggedPointerDataStoreKey

- (BOOL)representsSquareResource
{
  unint64_t v2 = [(PLTaggedPointer *)self payload] & 0x3FFFFFFFFFFFFLL;
  return +[PLThumbnailResourceDataStoreKey representsSquareResourceForPayloadKeyData:v2];
}

- (BOOL)isDerivative
{
  unint64_t v4 = [(PLTaggedPointer *)self payload] >> 50;
  if (v4 == 1)
  {
    LOBYTE(v5) = 1;
  }
  else if (v4)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PLTaggedPointerDataStoreKey.m", 261, @"Unsupported store type: %ld", v4);

    LOBYTE(v5) = 0;
  }
  else
  {
    return ([(PLTaggedPointer *)self payload] >> 36) & 1;
  }
  return v5;
}

- (void)tableType:(unsigned int *)a3 index:(int *)a4
{
  unint64_t v6 = [(PLTaggedPointer *)self payload];
  if (a3) {
    *a3 = (v6 >> 2) & 7;
  }
  if (a4) {
    *a4 = (v6 >> 6) & 0x7FFFFFF;
  }
}

- (id)fileURLForAssetID:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PLTaggedPointer *)self payload];
  if ([(PLTaggedPointer *)self payload] >> 50)
  {
    v7 = 0;
  }
  else
  {
    int v6 = v5;
    if ((v5 & 0xF0) != 0) {
      int v6 = 16;
    }
    if (v6 == 3 || v6 == 4 || v6 == 16) {
      v8 = objc_opt_class();
    }
    else {
      v8 = 0;
    }
    v7 = [v8 fileURLForPayloadKeyData:v5 & 0x3FFFFFFFFFFFFLL assetID:v4];
  }

  return v7;
}

- (unsigned)resourceVersion
{
  unint64_t v4 = [(PLTaggedPointer *)self payload] >> 50;
  if (v4 != 1)
  {
    if (!v4) {
      return ([(PLTaggedPointer *)self payload] >> 10) & 3;
    }
    int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PLTaggedPointerDataStoreKey.m", 244, @"Unsupported store type: %ld", v4);
  }
  return 3;
}

- (unsigned)resourceType
{
  unint64_t v4 = [(PLTaggedPointer *)self payload] >> 50;
  unsigned int v5 = [(PLTaggedPointer *)self payload];
  if (v4 == 1) {
    return 0;
  }
  if (!v4) {
    return (v5 >> 12) & 0x1F;
  }
  v7 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PLTaggedPointerDataStoreKey.m", 227, @"Unsupported store type: %ld", v4);

  return 31;
}

- (unsigned)recipeIDForAssetID:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PLTaggedPointer *)self payload] >> 50;
  unint64_t v6 = [(PLTaggedPointer *)self payload];
  unsigned int v7 = v6;
  if (v5)
  {
    if (v5 == 2)
    {
      if (((v6 >> 17) & 0x7F) > 4) {
        unsigned int v11 = 65741;
      }
      else {
        unsigned int v11 = dword_19BA9A8D8[BYTE2(v6)];
      }
    }
    else if (v5 == 1 {
           && ([v4 libraryID], v8 = objc_claimAutoreleasedReturnValue(), v8, v8))
    }
    {
      v9 = [v4 libraryID];
      v10 = PLDataStoreForClassIDAndLibraryID(1, v9);

      unsigned int v11 = +[PLThumbnailResourceDataStoreKey recipeIDForTableType:(v7 >> 2) & 7 inStore:v10];
    }
    else
    {
      unsigned int v11 = 0;
    }
  }
  else
  {
    int v12 = v6;
    if ((v6 & 0xF0) != 0) {
      int v12 = 16;
    }
    if (v12 == 3) {
      unsigned int v11 = (v6 >> 20) & 0xFFFE | ((v6 & 0x1E0000) >> 1) | (v6 >> 36) & 1;
    }
    else {
      unsigned int v11 = 0;
    }
  }

  return v11;
}

+ (id)keyWithKeyStruct:(const void *)a3 keyLength:(unint64_t)a4 forStoreClassID:(unsigned __int16)a5 inLibraryWithID:(id)a6
{
  uint64_t v6 = a5;
  id v11 = a6;
  int v12 = v11;
  if (!a3)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"PLTaggedPointerDataStoreKey.m", 133, @"Invalid parameter not satisfying: %@", @"keyStruct" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
LABEL_10:
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"PLTaggedPointerDataStoreKey.m", 134, @"Invalid parameter not satisfying: %@", @"libraryID" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v11) {
    goto LABEL_10;
  }
LABEL_3:
  if (a4 > 6 || (__memcpy_chk(), (v13 = (void *)[a1 newInstanceWithPayload:v6 << 50]) == 0))
  {
    v14 = PLDataStoreForClassIDAndLibraryID(v6, v12);
    v13 = [v14 keyFromKeyStruct:a3];
  }
  return v13;
}

- (id)descriptionForAssetID:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 libraryID];
  uint64_t v6 = [(PLTaggedPointerDataStoreKey *)self _heapAllocatedRepresentationInLibraryWithID:v5];

  unint64_t v7 = [(PLTaggedPointer *)self payload] >> 50;
  unint64_t v8 = [(PLTaggedPointer *)self payload] & 0x3FFFFFFFFFFFFLL;
  v9 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)PLTaggedPointerDataStoreKey;
  v10 = [(PLTaggedPointerDataStoreKey *)&v14 description];
  id v11 = [v6 descriptionForAssetID:v4];

  int v12 = [v9 stringWithFormat:@"<%@>, storeID: %d, keyPayload: %llu, interpreted: %@", v10, v7, v8, v11];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PLTaggedPointerDataStoreKey *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) == 0
      && (objc_opt_respondsToSelector() & 1) != 0
      && [(PLTaggedPointerDataStoreKey *)self isEqualToKey:v4];
  }

  return v5;
}

- (BOOL)isEqualToKey:(id)a3
{
  return PLResourceDataStoreKeyIsEqual(self, a3);
}

- (id)uniformTypeIdentifier
{
  unint64_t v4 = [(PLTaggedPointer *)self payload];
  unint64_t v5 = [(PLTaggedPointer *)self payload] >> 50;
  if (v5)
  {
    if (v5 == 1)
    {
      uint64_t v6 = [(id)*MEMORY[0x1E4F44400] identifier];
    }
    else
    {
      unint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PLTaggedPointerDataStoreKey.m", 122, @"Unsupported store type: %ld", v5);

      uint64_t v6 = 0;
    }
  }
  else
  {
    unint64_t v7 = PLUTTypeFromUniformFileType((v4 >> 39));
    uint64_t v6 = [v7 identifier];
  }
  return v6;
}

- (id)keyData
{
  unint64_t v3 = [(PLTaggedPointer *)self payload];
  unsigned __int8 v4 = v3;
  uint64_t v8 = v3 & 0x3FFFFFFFFFFFFLL;
  unint64_t v5 = PLDataStoreClassForID([(PLTaggedPointer *)self payload] >> 50);
  if (v5)
  {
    unsigned int v6 = [v5 keyLengthWithDataPreview:v4];
    unint64_t v5 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v8 length:v6];
  }
  return v5;
}

- (PLTaggedPointerDataStoreKey)initWithKeyStruct:(const void *)a3
{
  unint64_t v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"PLTaggedPointerDataStoreKey.m" lineNumber:70 description:@"initing a tagged pointer key class directly is not supported."];

  return 0;
}

- (id)validateForAssetID:(id)a3 resourceIdentity:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 libraryID];
  v9 = [(PLTaggedPointerDataStoreKey *)self _heapAllocatedRepresentationInLibraryWithID:v8];

  v10 = [v9 validateForAssetID:v7 resourceIdentity:v6];

  return v10;
}

- (id)_heapAllocatedRepresentationInLibraryWithID:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PLTaggedPointer *)self payload] >> 50;
  id v6 = [(PLTaggedPointerDataStoreKey *)self keyData];
  id v7 = PLDataStoreForClassIDAndLibraryID(v5, v4);

  id v8 = v6;
  v9 = objc_msgSend(v7, "keyFromKeyStruct:", objc_msgSend(v8, "bytes"));

  return v9;
}

@end