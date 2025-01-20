@interface FCAVEphemeralAssetKeyCache
- (FCAVEphemeralAssetKeyCache)init;
- (NSData)keyServerCertificate;
- (id)assetKeyForURI:(id)a3;
- (id)interestTokenForKeyURIs:(id)a3;
- (void)clearKeyServerCertificate;
- (void)importAVAssetKey:(id)a3;
- (void)removeAllAssetKeys;
- (void)saveAssetKeyData:(id)a3 creationDate:(id)a4 expirationDate:(id)a5 forURI:(id)a6;
- (void)saveKeyServerCertificate:(id)a3;
@end

@implementation FCAVEphemeralAssetKeyCache

- (FCAVEphemeralAssetKeyCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)FCAVEphemeralAssetKeyCache;
  v2 = [(FCAVEphemeralAssetKeyCache *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(FCThreadSafeMutableDictionary);
    dictionary = v2->_dictionary;
    v2->_dictionary = v3;
  }
  return v2;
}

- (id)assetKeyForURI:(id)a3
{
  if (self) {
    self = (FCAVEphemeralAssetKeyCache *)self->_dictionary;
  }
  return (id)[(FCAVEphemeralAssetKeyCache *)self objectForKey:a3];
}

- (id)interestTokenForKeyURIs:(id)a3
{
  return +[FCInterestToken interestTokenWithRemoveInterestBlock:&__block_literal_global_48];
}

- (void)saveAssetKeyData:(id)a3 creationDate:(id)a4 expirationDate:(id)a5 forURI:(id)a6
{
  v10 = (objc_class *)MEMORY[0x1E4F82990];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v19 = objc_alloc_init(v10);
  v15 = [v11 absoluteString];
  [v19 setIdentifier:v15];

  [v19 setKeyData:v14];
  v16 = [v13 pbDate];

  [v19 setCreatedAt:v16];
  v17 = [v12 pbDate];

  [v19 setExpiresAt:v17];
  if (self) {
    dictionary = self->_dictionary;
  }
  else {
    dictionary = 0;
  }
  [(FCThreadSafeMutableDictionary *)dictionary setObject:v19 forKey:v11];
}

- (void)importAVAssetKey:(id)a3
{
  if (self) {
    dictionary = self->_dictionary;
  }
  else {
    dictionary = 0;
  }
  v5 = (void *)MEMORY[0x1E4F1CB10];
  objc_super v6 = dictionary;
  id v7 = a3;
  id v9 = [v7 identifier];
  v8 = [v5 URLWithString:v9];
  [(FCThreadSafeMutableDictionary *)v6 setObject:v7 forKey:v8];
}

- (void)removeAllAssetKeys
{
  if (self) {
    self = (FCAVEphemeralAssetKeyCache *)self->_dictionary;
  }
  [(FCAVEphemeralAssetKeyCache *)self removeAllObjects];
}

- (void)saveKeyServerCertificate:(id)a3
{
  v4 = (NSData *)[a3 copy];
  keyServerCertificate = self->_keyServerCertificate;
  self->_keyServerCertificate = v4;
  MEMORY[0x1F41817F8](v4, keyServerCertificate);
}

- (void)clearKeyServerCertificate
{
  self->_keyServerCertificate = 0;
  MEMORY[0x1F41817F8]();
}

- (NSData)keyServerCertificate
{
  return self->_keyServerCertificate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_keyServerCertificate, 0);
}

@end