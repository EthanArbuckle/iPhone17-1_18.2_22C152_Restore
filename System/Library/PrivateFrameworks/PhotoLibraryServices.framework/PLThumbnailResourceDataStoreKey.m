@interface PLThumbnailResourceDataStoreKey
+ (BOOL)representsSquareResourceForPayloadKeyData:(unint64_t)a3;
+ (id)fileURLForPayloadKeyData:(unint64_t)a3 assetID:(id)a4;
+ (unsigned)recipeIDForTableType:(unsigned int)a3 inStore:(id)a4;
- (BOOL)isDerivative;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToKey:(id)a3;
- (BOOL)representsSquareResource;
- (PLThumbnailDataStoreKeyStruct_V1)keyStruct;
- (PLThumbnailResourceDataStoreKey)initWithKeyStruct:(const void *)a3;
- (id)descriptionForAssetID:(id)a3;
- (id)fileURLForAssetID:(id)a3;
- (id)keyData;
- (id)uniformTypeIdentifier;
- (id)validateForAssetID:(id)a3 resourceIdentity:(id)a4;
- (int)index;
- (unsigned)resourceType;
- (unsigned)resourceVersion;
- (unsigned)tableType;
- (void)setKeyStruct:(PLThumbnailDataStoreKeyStruct_V1)a3;
- (void)tableType:(unsigned int *)a3 index:(int *)a4;
@end

@implementation PLThumbnailResourceDataStoreKey

+ (BOOL)representsSquareResourceForPayloadKeyData:(unint64_t)a3
{
  return (a3 & 0x18) == 0;
}

+ (unsigned)recipeIDForTableType:(unsigned int)a3 inStore:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v5 = [a4 thumbnailFormatsByTableType];
  v6 = [NSNumber numberWithUnsignedInt:v4];
  v7 = [v5 objectForKeyedSubscript:v6];

  if (v7) {
    unsigned int v8 = (2 * [v7 formatID]) | 0x30001;
  }
  else {
    unsigned int v8 = 0;
  }

  return v8;
}

- (void)setKeyStruct:(PLThumbnailDataStoreKeyStruct_V1)a3
{
  *(_DWORD *)&self->_keyStruct = a3;
  *((unsigned char *)&self->_keyStruct + 4) = *((unsigned char *)&a3 + 4);
}

- (PLThumbnailDataStoreKeyStruct_V1)keyStruct
{
  return (PLThumbnailDataStoreKeyStruct_V1)(*(_DWORD *)&self->_keyStruct | ((unint64_t)*((unsigned __int8 *)&self->_keyStruct
                                                                                              + 4) << 32));
}

- (id)descriptionForAssetID:(id)a3
{
  unsigned int v4 = (*(_DWORD *)&self->_keyStruct >> 2) & 7;
  if (v4 > 3) {
    v5 = 0;
  }
  else {
    v5 = off_1E5875F78[v4];
  }
  v6 = NSString;
  v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  v9 = (void *)v8;
  v10 = @"v1";
  if ((*(_DWORD *)&self->_keyStruct & 3) != 0) {
    v10 = 0;
  }
  v11 = [v6 stringWithFormat:@"<%@> type: %@, %@, index: %ld", v8, v5, v10, ((*(_DWORD *)&self->_keyStruct | ((unint64_t)*((unsigned __int8 *)&self->_keyStruct + 4) << 32)) >> 6) & 0x7FFFFFF];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v4 = (PLThumbnailResourceDataStoreKey *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = (((*(_DWORD *)&self->_keyStruct | ((unint64_t)*((unsigned __int8 *)&self->_keyStruct + 4) << 32)) ^ [(PLThumbnailResourceDataStoreKey *)v4 keyStruct]) & 0x1FFFFFFDFLL) == 0;
    }
    else {
      BOOL v5 = (objc_opt_respondsToSelector() & 1) != 0
    }
        && [(PLThumbnailResourceDataStoreKey *)self isEqualToKey:v4];
  }

  return v5;
}

- (BOOL)isEqualToKey:(id)a3
{
  return PLResourceDataStoreKeyIsEqual(self, a3);
}

- (unsigned)tableType
{
  return (*(_DWORD *)&self->_keyStruct >> 2) & 7;
}

- (int)index
{
  return ((*(_DWORD *)&self->_keyStruct | ((unint64_t)*((unsigned __int8 *)&self->_keyStruct + 4) << 32)) >> 6) & 0x7FFFFFF;
}

- (BOOL)isDerivative
{
  return 1;
}

- (unsigned)resourceVersion
{
  return 3;
}

- (unsigned)resourceType
{
  return 0;
}

- (void)tableType:(unsigned int *)a3 index:(int *)a4
{
  if (a3) {
    *a3 = (*(_DWORD *)&self->_keyStruct >> 2) & 7;
  }
  if (a4) {
    *a4 = ((*(_DWORD *)&self->_keyStruct | ((unint64_t)*((unsigned __int8 *)&self->_keyStruct + 4) << 32)) >> 6) & 0x7FFFFFF;
  }
}

- (BOOL)representsSquareResource
{
  return (*(_DWORD *)&self->_keyStruct & 0x18) == 0;
}

- (id)uniformTypeIdentifier
{
  return (id)[(id)*MEMORY[0x1E4F44400] identifier];
}

- (id)fileURLForAssetID:(id)a3
{
  return 0;
}

- (id)keyData
{
  return (id)[MEMORY[0x1E4F1C9B8] dataWithBytes:&self->_keyStruct length:5];
}

- (PLThumbnailResourceDataStoreKey)initWithKeyStruct:(const void *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PLThumbnailResourceDataStoreKey;
  result = [(PLThumbnailResourceDataStoreKey *)&v6 init];
  if (result)
  {
    int v5 = *(_DWORD *)a3;
    *((unsigned char *)&result->_keyStruct + 4) = *((unsigned char *)a3 + 4);
    *(_DWORD *)&result->_keyStruct = v5;
  }
  return result;
}

- (id)validateForAssetID:(id)a3 resourceIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((*(_DWORD *)&self->_keyStruct & 0x10) != 0)
  {
    v9 = +[PLResourceModelValidationError malformedTableThumbnailKeyErrorForKey:self assetID:v6];
    uint64_t v8 = [MEMORY[0x1E4F1CBF0] arrayByAddingObject:v9];
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v10 = [v6 libraryID];
  v11 = PLDataStoreForClassIDAndLibraryID(1, v10);

  v12 = (CGImage *)[v11 newTableThumbImageForKey:self];
  if (v12)
  {
    if ([v11 thumbnailForKey:self matchesAssetID:v6]) {
      goto LABEL_9;
    }
    uint64_t v13 = +[PLResourceModelValidationError tableThumbUUIDMistmatchErrorForKey:self indexFromKey:((*(_DWORD *)&self->_keyStruct | ((unint64_t)*((unsigned __int8 *)&self->_keyStruct + 4) << 32)) >> 6) & 0x7FFFFFF assetID:v6];
  }
  else
  {
    uint64_t v13 = +[PLResourceModelValidationError unreachableTableThumbnailErrorForKey:self assetID:v6];
  }
  v14 = (void *)v13;
  uint64_t v15 = [v8 arrayByAddingObject:v13];

  uint64_t v8 = (void *)v15;
LABEL_9:
  CGImageRelease(v12);

  return v8;
}

+ (id)fileURLForPayloadKeyData:(unint64_t)a3 assetID:(id)a4
{
  id v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  [v6 handleFailureInMethod:a2 object:a1 file:@"PLThumbnailResourceDataStoreKey.m" lineNumber:45 description:@"This store does not support returning resource URLs."];

  return 0;
}

@end