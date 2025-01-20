@interface PLPrimaryResourceDataStoreReferenceFileKey
+ (id)fileURLForPayloadKeyData:(unint64_t)a3 assetID:(id)a4;
+ (unsigned)keyLengthWithDataPreview:(unsigned __int8)a3;
- (PLPrimaryResourceDataStoreReferenceFileKey)initWithKeyStruct:(const void *)a3;
- (PLPrimaryResourceDataStoreReferenceFileKey)initWithResourceType:(unsigned int)a3;
- (id)fileURLForAssetID:(id)a3;
- (id)fileURLForAssetID:(id)a3 inContext:(id)a4;
- (id)initFromExistingLocationOfExternalResource:(id)a3 asset:(id)a4;
- (id)keyData;
- (id)uniformTypeIdentifier;
@end

@implementation PLPrimaryResourceDataStoreReferenceFileKey

- (void).cxx_destruct
{
}

- (id)uniformTypeIdentifier
{
  return 0;
}

- (PLPrimaryResourceDataStoreReferenceFileKey)initWithKeyStruct:(const void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PLPrimaryResourceDataStoreReferenceFileKey;
  result = -[PLPrimaryResourceDataStoreKey _initWithKeyStruct:](&v5, sel__initWithKeyStruct_);
  if (result) {
    *(_WORD *)&result->_keyStruct = *(_WORD *)a3;
  }
  return result;
}

- (id)keyData
{
  return (id)[MEMORY[0x1E4F1C9B8] dataWithBytes:&self->_keyStruct length:2];
}

- (id)fileURLForAssetID:(id)a3
{
  return [(PLPrimaryResourceDataStoreReferenceFileKey *)self fileURLForAssetID:a3 inContext:0];
}

- (id)fileURLForAssetID:(id)a3 inContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&fileURLForAssetID_inContext__cacheUrlLock);
  if (!self->_cachedUrl)
  {
    _urlForKeyStruct((unsigned __int16 *)&self->_keyStruct, v6, v7);
    v8 = (NSURL *)objc_claimAutoreleasedReturnValue();
    cachedUrl = self->_cachedUrl;
    self->_cachedUrl = v8;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&fileURLForAssetID_inContext__cacheUrlLock);
  v10 = self->_cachedUrl;

  return v10;
}

- (id)initFromExistingLocationOfExternalResource:(id)a3 asset:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLPrimaryResourceDataStoreReferenceFileKey;
  id v7 = [(PLPrimaryResourceDataStoreKey *)&v11 _initFromExistingLocationOfExternalResource:v6 asset:a4];
  if (v7)
  {
    v8 = v7;
    if ([v6 resourceType] > 0x1F) {
      v9 = 0;
    }
    else {
      v9 = -[PLPrimaryResourceDataStoreReferenceFileKey initWithResourceType:]([PLPrimaryResourceDataStoreReferenceFileKey alloc], "initWithResourceType:", [v6 resourceType]);
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (PLPrimaryResourceDataStoreReferenceFileKey)initWithResourceType:(unsigned int)a3
{
  if (a3 >= 0x20) {
    __assert_rtn("-[PLPrimaryResourceDataStoreReferenceFileKey initWithResourceType:]", "PLPrimaryResourceDataStoreReferenceFileKey.m", 105, "resourceType <= kPLResourceTypeMax");
  }
  __int16 v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PLPrimaryResourceDataStoreReferenceFileKey;
  result = [(PLPrimaryResourceDataStoreKey *)&v5 _init];
  if (result) {
    *(_WORD *)&result->_keyStruct = *(_WORD *)&result->_keyStruct & 0x8000 | (v3 << 10) | 4;
  }
  return result;
}

+ (id)fileURLForPayloadKeyData:(unint64_t)a3 assetID:(id)a4
{
  unint64_t v6 = a3;
  v4 = _urlForKeyStruct((unsigned __int16 *)&v6, a4, 0);
  return v4;
}

+ (unsigned)keyLengthWithDataPreview:(unsigned __int8)a3
{
  return 2;
}

@end