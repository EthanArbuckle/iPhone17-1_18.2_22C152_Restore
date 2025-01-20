@interface ICAccountCryptoStrategyProxy
- (BOOL)authenticateWithPassphrase:(id)a3;
- (BOOL)canAuthenticate;
- (BOOL)encryptFileFromURL:(id)a3 toURL:(id)a4;
- (BOOL)encryptSidecarFileFromURL:(id)a3 toURL:(id)a4;
- (BOOL)hasPassphraseSet;
- (BOOL)hasSameKeyAsObject:(id)a3;
- (BOOL)isAuthenticated;
- (BOOL)isPassphraseCorrect:(id)a3;
- (BOOL)loadDecryptedValuesIfNecessary;
- (BOOL)mainKeyDecryptsPrimaryData:(id)a3;
- (BOOL)mergeEncryptedDataFromRecord:(id)a3;
- (BOOL)recordHasChangedPassphrase:(id)a3;
- (BOOL)rewrapDataAtURL:(id)a3 withMainKey:(id)a4;
- (BOOL)rewrapWithMainKey:(id)a3;
- (BOOL)saveEncryptedJSON;
- (BOOL)setPassphrase:(id)a3 hint:(id)a4;
- (ICAccountCryptoStrategy)customPasswordStrategy;
- (ICAccountCryptoStrategyProxy)initWithCloudSyncingObject:(id)a3;
- (ICAccountCryptoStrategyV1)v1Strategy;
- (ICAccountCryptoStrategyV1Neo)v1NeoStrategy;
- (ICAccountCryptoStrategyV2)v2Strategy;
- (NSString)passphraseHint;
- (id)currentStrategy;
- (id)decryptSidecarData:(id)a3;
- (id)encryptSidecarData:(id)a3;
- (id)encryptedData:(id)a3 rewrappedWithMainKey:(id)a4;
- (id)mainKeyForPassphrase:(id)a3;
- (int64_t)intrinsicNotesVersion;
- (void)initializeCryptoPropertiesFromObject:(id)a3;
- (void)removePassphrase;
@end

@implementation ICAccountCryptoStrategyProxy

- (int64_t)intrinsicNotesVersion
{
  return 0;
}

- (ICAccountCryptoStrategy)customPasswordStrategy
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__25;
  v9 = __Block_byref_object_dispose__25;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__ICAccountCryptoStrategyProxy_customPasswordStrategy__block_invoke;
  v4[3] = &unk_1E64A6770;
  v4[4] = self;
  v4[5] = &v5;
  [(ICCryptoStrategyBase *)self performBlockIfAccountExists:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (ICAccountCryptoStrategy *)v2;
}

void __54__ICAccountCryptoStrategyProxy_customPasswordStrategy__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 accountData];
  if ([v3 supportsV1Neo])
  {
    v4 = [*(id *)(a1 + 32) v1NeoStrategy];
    int v5 = [v4 hasPassphraseSet];

    if (v5)
    {
      uint64_t v6 = [*(id *)(a1 + 32) v1NeoStrategy];
      goto LABEL_6;
    }
  }
  else
  {
  }
  uint64_t v6 = [*(id *)(a1 + 32) v1Strategy];
LABEL_6:
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)currentStrategy
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__25;
  v9 = __Block_byref_object_dispose__25;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__ICAccountCryptoStrategyProxy_currentStrategy__block_invoke;
  v4[3] = &unk_1E64A6798;
  v4[4] = self;
  v4[5] = &v5;
  [(ICCryptoStrategyBase *)self performBlockIfAccountExists:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __47__ICAccountCryptoStrategyProxy_currentStrategy__block_invoke(uint64_t a1, void *a2)
{
  unsigned int v3 = [a2 resolvedLockedNotesMode];
  if (v3 >= 2)
  {
    if (v3 != 2) {
      return;
    }
    uint64_t v4 = [*(id *)(a1 + 32) devicePasswordStrategy];
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 32) customPasswordStrategy];
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (ICAccountCryptoStrategyProxy)initWithCloudSyncingObject:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICAccountCryptoStrategyProxy;
  uint64_t v5 = [(ICCryptoStrategyBase *)&v13 initWithCloudSyncingObject:v4];
  if (v5)
  {
    uint64_t v6 = [(ICCryptoStrategyBase *)[ICAccountCryptoStrategyV1 alloc] initWithCloudSyncingObject:v4];
    v1Strategy = v5->_v1Strategy;
    v5->_v1Strategy = v6;

    if (ICInternalSettingsIsLockedNotesV1NeoEnabled())
    {
      v8 = [(ICCryptoStrategyBase *)[ICAccountCryptoStrategyV1Neo alloc] initWithCloudSyncingObject:v4];
      v1NeoStrategy = v5->_v1NeoStrategy;
      v5->_v1NeoStrategy = v8;
    }
    id v10 = [(ICCryptoStrategyBase *)[ICAccountCryptoStrategyV2 alloc] initWithCloudSyncingObject:v4];
    v2Strategy = v5->_v2Strategy;
    v5->_v2Strategy = v10;
  }
  return v5;
}

- (void)initializeCryptoPropertiesFromObject:(id)a3
{
}

- (BOOL)canAuthenticate
{
  id v2 = [(ICAccountCryptoStrategyProxy *)self currentStrategy];
  char v3 = [v2 canAuthenticate];

  return v3;
}

- (BOOL)isAuthenticated
{
  id v2 = [(ICAccountCryptoStrategyProxy *)self currentStrategy];
  char v3 = [v2 isAuthenticated];

  return v3;
}

- (BOOL)hasSameKeyAsObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICAccountCryptoStrategyProxy *)self v1Strategy];
  if ([v5 hasSameKeyAsObject:v4])
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v7 = [(ICAccountCryptoStrategyProxy *)self v1NeoStrategy];
    if ([v7 hasSameKeyAsObject:v4])
    {
      char v6 = 1;
    }
    else
    {
      v8 = [(ICAccountCryptoStrategyProxy *)self v2Strategy];
      char v6 = [v8 hasSameKeyAsObject:v4];
    }
  }

  return v6;
}

- (BOOL)encryptFileFromURL:(id)a3 toURL:(id)a4
{
  return 0;
}

- (id)encryptSidecarData:(id)a3
{
  return 0;
}

- (BOOL)encryptSidecarFileFromURL:(id)a3 toURL:(id)a4
{
  return 0;
}

- (BOOL)saveEncryptedJSON
{
  return 0;
}

- (BOOL)mainKeyDecryptsPrimaryData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 metadata];
  uint64_t v6 = [v5 cipherVersion];

  if (v6 == 2)
  {
    uint64_t v7 = [(ICAccountCryptoStrategyProxy *)self v1NeoStrategy];
  }
  else if (v6 == 1)
  {
    uint64_t v7 = [(ICAccountCryptoStrategyProxy *)self v2Strategy];
  }
  else
  {
    if (v6)
    {
      char v9 = 0;
      goto LABEL_9;
    }
    uint64_t v7 = [(ICAccountCryptoStrategyProxy *)self v1Strategy];
  }
  v8 = v7;
  char v9 = [v7 mainKeyDecryptsPrimaryData:v4];

LABEL_9:
  return v9;
}

- (id)decryptSidecarData:(id)a3
{
  return 0;
}

- (BOOL)loadDecryptedValuesIfNecessary
{
  return 0;
}

- (BOOL)mergeEncryptedDataFromRecord:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICAccountCryptoStrategyProxy *)self v1Strategy];
  if ([v5 mergeEncryptedDataFromRecord:v4])
  {
    uint64_t v6 = [(ICAccountCryptoStrategyProxy *)self v1NeoStrategy];
    if ([v6 mergeEncryptedDataFromRecord:v4])
    {
      uint64_t v7 = [(ICAccountCryptoStrategyProxy *)self v2Strategy];
      char v8 = [v7 mergeEncryptedDataFromRecord:v4];
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)encryptedData:(id)a3 rewrappedWithMainKey:(id)a4
{
  return 0;
}

- (BOOL)rewrapDataAtURL:(id)a3 withMainKey:(id)a4
{
  return 0;
}

- (BOOL)rewrapWithMainKey:(id)a3
{
  return 0;
}

- (BOOL)hasPassphraseSet
{
  id v2 = [(ICAccountCryptoStrategyProxy *)self customPasswordStrategy];
  char v3 = [v2 hasPassphraseSet];

  return v3;
}

- (NSString)passphraseHint
{
  id v2 = [(ICAccountCryptoStrategyProxy *)self customPasswordStrategy];
  char v3 = [v2 passphraseHint];

  return (NSString *)v3;
}

- (BOOL)setPassphrase:(id)a3 hint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__ICAccountCryptoStrategyProxy_setPassphrase_hint___block_invoke;
  v11[3] = &unk_1E64A67C0;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  id v9 = v7;
  id v13 = v9;
  v14 = &v15;
  [(ICCryptoStrategyBase *)self performBlockIfAccountExists:v11];
  LOBYTE(self) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)self;
}

void __51__ICAccountCryptoStrategyProxy_setPassphrase_hint___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  char v3 = [*(id *)(a1 + 32) v1Strategy];
  int v4 = [v3 setPassphrase:*(void *)(a1 + 40) hint:*(void *)(a1 + 48)];

  if (v4) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  uint64_t v5 = [*(id *)(a1 + 32) v1NeoStrategy];

  if (v5)
  {
    id v6 = [v11 accountDataCreateIfNecessary];
    [v6 updateSupportsV1Neo:0];
    id v7 = [*(id *)(a1 + 32) v1NeoStrategy];
    int v8 = [v7 setPassphrase:*(void *)(a1 + 40) hint:*(void *)(a1 + 48)];
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    if (v8) {
      BOOL v10 = *(unsigned char *)(v9 + 24) != 0;
    }
    else {
      BOOL v10 = 0;
    }
    *(unsigned char *)(v9 + 24) = v10;
  }
}

- (void)removePassphrase
{
  char v3 = [(ICAccountCryptoStrategyProxy *)self v1Strategy];
  [v3 removePassphrase];

  id v4 = [(ICAccountCryptoStrategyProxy *)self v1NeoStrategy];
  [v4 removePassphrase];
}

- (id)mainKeyForPassphrase:(id)a3
{
  return 0;
}

- (BOOL)isPassphraseCorrect:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICAccountCryptoStrategyProxy *)self customPasswordStrategy];
  char v6 = [v5 isPassphraseCorrect:v4];

  return v6;
}

- (BOOL)authenticateWithPassphrase:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__ICAccountCryptoStrategyProxy_authenticateWithPassphrase___block_invoke;
  v7[3] = &unk_1E64A67E8;
  v7[4] = self;
  id v5 = v4;
  id v8 = v5;
  uint64_t v9 = &v10;
  [(ICCryptoStrategyBase *)self performBlockIfAccountExists:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __59__ICAccountCryptoStrategyProxy_authenticateWithPassphrase___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) v1Strategy];
  int v3 = [v2 authenticateWithPassphrase:*(void *)(a1 + 40)];

  if (v3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    id v4 = [*(id *)(a1 + 32) v1NeoStrategy];
    char v5 = [v4 hasPassphraseSet];

    if ((v5 & 1) == 0)
    {
      char v6 = [*(id *)(a1 + 32) v1NeoStrategy];
      uint64_t v7 = *(void *)(a1 + 40);
      id v8 = [*(id *)(a1 + 32) v1Strategy];
      uint64_t v9 = [v8 passphraseHint];
      [v6 setPassphrase:v7 hint:v9];
    }
  }
  uint64_t v10 = [*(id *)(a1 + 32) v1NeoStrategy];
  int v11 = [v10 authenticateWithPassphrase:*(void *)(a1 + 40)];

  if (v11) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (BOOL)recordHasChangedPassphrase:(id)a3
{
  return 0;
}

- (ICAccountCryptoStrategyV1)v1Strategy
{
  return self->_v1Strategy;
}

- (ICAccountCryptoStrategyV1Neo)v1NeoStrategy
{
  return self->_v1NeoStrategy;
}

- (ICAccountCryptoStrategyV2)v2Strategy
{
  return self->_v2Strategy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_v2Strategy, 0);
  objc_storeStrong((id *)&self->_v1NeoStrategy, 0);
  objc_storeStrong((id *)&self->_v1Strategy, 0);
}

@end