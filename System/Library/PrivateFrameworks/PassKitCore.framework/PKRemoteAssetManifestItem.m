@interface PKRemoteAssetManifestItem
+ (BOOL)supportsSecureCoding;
+ (id)itemWithLocalURL:(id)a3 passURL:(id)a4 dictionary:(id)a5 error:(id *)a6;
+ (id)sharedURLSession;
- (BOOL)isRequired;
- (BOOL)isZipFile;
- (NSDictionary)manifest;
- (NSNumber)size;
- (NSString)encryptionScheme;
- (NSString)ephemeralPublicKey;
- (NSString)publicKeyHash;
- (NSString)relativeEncryptedContentsLocalPath;
- (NSString)relativeLocalPath;
- (NSString)seid;
- (NSString)sha1Hex;
- (NSURL)encryptedContentsLocalURL;
- (NSURL)localURL;
- (NSURL)passURL;
- (NSURL)remoteURL;
- (PKRemoteAssetManifestItem)initWithCoder:(id)a3;
- (PKRemoteAssetManifestItem)initWithLocalURL:(id)a3 passURL:(id)a4 dictionary:(id)a5 error:(id *)a6;
- (int64_t)encryptionSource;
- (unint64_t)itemType;
- (void)downloadAssetWithCloudStoreCoordinatorDelegate:(id)a3 completion:(id)a4;
- (void)downloadAssetWithCloudStoreCoordinatorDelegate:(id)a3 tryCount:(unint64_t)a4 completion:(id)a5;
- (void)downloadAssetWithCompletion:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setEncryptedContentsLocalURL:(id)a3;
- (void)setEncryptionScheme:(id)a3;
- (void)setEncryptionSource:(int64_t)a3;
- (void)setEphemeralPublicKey:(id)a3;
- (void)setLocalURL:(id)a3;
- (void)setManifest:(id)a3;
- (void)setPassURL:(id)a3;
- (void)setPublicKeyHash:(id)a3;
- (void)setRemoteURL:(id)a3;
- (void)setRequired:(BOOL)a3;
- (void)setSeid:(id)a3;
- (void)setSha1Hex:(id)a3;
- (void)setSize:(id)a3;
@end

@implementation PKRemoteAssetManifestItem

- (PKRemoteAssetManifestItem)initWithLocalURL:(id)a3 passURL:(id)a4 dictionary:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v70.receiver = self;
  v70.super_class = (Class)PKRemoteAssetManifestItem;
  v14 = [(PKRemoteAssetManifestItem *)&v70 init];
  if (!v14) {
    goto LABEL_29;
  }
  v22 = [v13 objectForKey:@"url"];
  id v69 = v12;
  if (v22
    && ([MEMORY[0x1E4F1CB10] URLWithString:v22], (uint64_t v23 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v24 = (void *)v23;
  }
  else
  {
    if (a6)
    {
      PKValidationErrorWithReason(@"Remote Asset %@ is missing or invalid url value", v15, v16, v17, v18, v19, v20, v21, (uint64_t)v11);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

    v24 = 0;
    v14 = 0;
  }
  uint64_t v25 = [v13 objectForKey:@"sha1"];
  v33 = (void *)v25;
  if (v14 && !v25)
  {
    if (a6)
    {
      PKValidationErrorWithReason(@"Remote Asset %@ is missing sha1 value", v26, v27, v28, v29, v30, v31, v32, (uint64_t)v11);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

    v14 = 0;
  }
  uint64_t v34 = [v13 objectForKey:@"size"];
  v42 = (void *)v34;
  if (v14 && !v34)
  {
    if (a6)
    {
      PKValidationErrorWithReason(@"Remote Asset %@ is missing size value", v35, v36, v37, v38, v39, v40, v41, (uint64_t)v11);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

    v14 = 0;
    goto LABEL_28;
  }
  if (v14)
  {
    objc_storeStrong((id *)&v14->_remoteURL, v24);
    objc_storeStrong((id *)&v14->_sha1Hex, v33);
    objc_storeStrong((id *)&v14->_size, v42);
    objc_storeStrong((id *)&v14->_localURL, a3);
    objc_storeStrong((id *)&v14->_passURL, a4);
    uint64_t v43 = [v13 objectForKey:@"manifest"];
    manifest = v14->_manifest;
    v14->_manifest = (NSDictionary *)v43;

    v14->_required = [v13 PKBoolForKey:@"required"];
    uint64_t v45 = [v13 PKStringForKey:@"seid"];
    seid = v14->_seid;
    v14->_seid = (NSString *)v45;

    uint64_t v47 = [v13 PKStringForKey:@"ephemeralPublicKey"];
    ephemeralPublicKey = v14->_ephemeralPublicKey;
    v14->_ephemeralPublicKey = (NSString *)v47;

    uint64_t v49 = [v13 PKStringForKey:@"publicKeyHash"];
    publicKeyHash = v14->_publicKeyHash;
    v14->_publicKeyHash = (NSString *)v49;

    uint64_t v51 = [v13 PKStringForKey:@"version"];
    encryptionScheme = v14->_encryptionScheme;
    v14->_encryptionScheme = (NSString *)v51;

    v60 = v14->_publicKeyHash;
    if ((v14->_ephemeralPublicKey == 0) == (v60 != 0) || (v60 != 0) == (v14->_encryptionScheme == 0))
    {
      if (a6)
      {
        uint64_t v68 = (uint64_t)v14->_ephemeralPublicKey;
        v67 = @"Missing required encryption keys (%@ %@ %@)";
LABEL_33:
        PKValidationErrorWithReason(v67, v53, v54, v55, v56, v57, v58, v59, v68);
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v61 = [(NSURL *)v14->_localURL pathExtension];
      int v62 = [v61 isEqualToString:@"encrypted"];

      if (v62)
      {
        objc_storeStrong((id *)&v14->_encryptedContentsLocalURL, v14->_localURL);
        uint64_t v63 = [(NSURL *)v14->_localURL URLByDeletingPathExtension];
        localURL = v14->_localURL;
        v14->_localURL = (NSURL *)v63;

        v14->_encryptionSource = 3;
      }
      if (!v14->_ephemeralPublicKey || !v14->_publicKeyHash || !v14->_encryptionScheme) {
        goto LABEL_28;
      }
      if (v62)
      {
        v14->_encryptionSource = encryptionSourceFromManifestItemDictionary(v13);
        goto LABEL_28;
      }
      if (a6)
      {
        v67 = @"Encrypted asset with invalid filename.";
        goto LABEL_33;
      }
    }

    v65 = 0;
    id v12 = v69;
    goto LABEL_30;
  }
LABEL_28:

  id v12 = v69;
LABEL_29:
  v14 = v14;
  v65 = v14;
LABEL_30:

  return v65;
}

- (PKRemoteAssetManifestItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PKRemoteAssetManifestItem *)self init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localURL"];
    [(PKRemoteAssetManifestItem *)v5 setLocalURL:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remoteURL"];
    [(PKRemoteAssetManifestItem *)v5 setRemoteURL:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passURL"];
    [(PKRemoteAssetManifestItem *)v5 setPassURL:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sha1Hex"];
    [(PKRemoteAssetManifestItem *)v5 setSha1Hex:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"size"];
    [(PKRemoteAssetManifestItem *)v5 setSize:v10];

    id v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    id v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v14 = [v4 decodeObjectOfClasses:v13 forKey:@"manifest"];
    [(PKRemoteAssetManifestItem *)v5 setManifest:v14];

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"seid"];
    [(PKRemoteAssetManifestItem *)v5 setSeid:v15];

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ephemeralPublicKey"];
    [(PKRemoteAssetManifestItem *)v5 setEphemeralPublicKey:v16];

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publicKeyHash"];
    [(PKRemoteAssetManifestItem *)v5 setPublicKeyHash:v17];

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"encryptionScheme"];
    [(PKRemoteAssetManifestItem *)v5 setEncryptionScheme:v18];

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"encryptionSource"];
    -[PKRemoteAssetManifestItem setEncryptionSource:](v5, "setEncryptionSource:", [v19 integerValue]);

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"encryptedContentsLocalURL"];
    [(PKRemoteAssetManifestItem *)v5 setEncryptedContentsLocalURL:v20];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PKRemoteAssetManifestItem *)self localURL];
  [v4 encodeObject:v5 forKey:@"localURL"];

  v6 = [(PKRemoteAssetManifestItem *)self remoteURL];
  [v4 encodeObject:v6 forKey:@"remoteURL"];

  v7 = [(PKRemoteAssetManifestItem *)self passURL];
  [v4 encodeObject:v7 forKey:@"passURL"];

  v8 = [(PKRemoteAssetManifestItem *)self sha1Hex];
  [v4 encodeObject:v8 forKey:@"sha1Hex"];

  v9 = [(PKRemoteAssetManifestItem *)self size];
  [v4 encodeObject:v9 forKey:@"size"];

  v10 = [(PKRemoteAssetManifestItem *)self manifest];
  [v4 encodeObject:v10 forKey:@"manifest"];

  id v11 = [(PKRemoteAssetManifestItem *)self seid];
  [v4 encodeObject:v11 forKey:@"seid"];

  uint64_t v12 = [(PKRemoteAssetManifestItem *)self ephemeralPublicKey];
  [v4 encodeObject:v12 forKey:@"ephemeralPublicKey"];

  id v13 = [(PKRemoteAssetManifestItem *)self publicKeyHash];
  [v4 encodeObject:v13 forKey:@"publicKeyHash"];

  v14 = [(PKRemoteAssetManifestItem *)self encryptionScheme];
  [v4 encodeObject:v14 forKey:@"encryptionScheme"];

  uint64_t v15 = objc_msgSend(NSNumber, "numberWithInteger:", -[PKRemoteAssetManifestItem encryptionSource](self, "encryptionSource"));
  [v4 encodeObject:v15 forKey:@"encryptionSource"];

  id v16 = [(PKRemoteAssetManifestItem *)self encryptedContentsLocalURL];
  [v4 encodeObject:v16 forKey:@"encryptedContentsLocalURL"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)itemWithLocalURL:(id)a3 passURL:(id)a4 dictionary:(id)a5 error:(id *)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLocalURL:v11 passURL:v10 dictionary:v9 error:a6];

  return v12;
}

- (NSString)relativeLocalPath
{
  return (NSString *)PKRelativePathAfterResolvingSymlinks(self->_passURL, self->_localURL);
}

- (NSString)relativeEncryptedContentsLocalPath
{
  encryptedContentsLocalURL = self->_encryptedContentsLocalURL;
  if (encryptedContentsLocalURL)
  {
    v3 = PKRelativePathAfterResolvingSymlinks(self->_passURL, encryptedContentsLocalURL);
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (BOOL)isZipFile
{
  v2 = [(PKRemoteAssetManifestItem *)self localURL];
  v3 = [v2 pathExtension];
  char v4 = [v3 isEqualToString:@"zip"];

  return v4;
}

- (unint64_t)itemType
{
  return 0;
}

- (void)downloadAssetWithCloudStoreCoordinatorDelegate:(id)a3 completion:(id)a4
{
}

- (void)downloadAssetWithCloudStoreCoordinatorDelegate:(id)a3 tryCount:(unint64_t)a4 completion:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    id v10 = [(id)objc_opt_class() sharedURLSession];
    id v11 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      remoteURL = self->_remoteURL;
      *(_DWORD *)buf = 138412290;
      v24 = remoteURL;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Downloading %@", buf, 0xCu);
    }

    id v13 = self->_remoteURL;
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __96__PKRemoteAssetManifestItem_downloadAssetWithCloudStoreCoordinatorDelegate_tryCount_completion___block_invoke;
    uint64_t v18 = &unk_1E56F48C8;
    uint64_t v19 = self;
    unint64_t v22 = a4;
    id v20 = v8;
    id v21 = v9;
    v14 = [v10 dataTaskWithURL:v13 completionHandler:&v15];
    objc_msgSend(v14, "resume", v15, v16, v17, v18, v19);
  }
}

void __96__PKRemoteAssetManifestItem_downloadAssetWithCloudStoreCoordinatorDelegate_tryCount_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 16);
    *(_DWORD *)buf = 138413058;
    uint64_t v42 = v11;
    __int16 v43 = 2048;
    uint64_t v44 = [v7 length];
    __int16 v45 = 2112;
    id v46 = v8;
    __int16 v47 = 2112;
    id v48 = v9;
    _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Downloaded %@ with data size:%lu, URLResponse:%@ error:%@", buf, 0x2Au);
  }

  if (v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v14 = [v8 statusCode];
    id v12 = [v9 localizedDescription];
    uint64_t v15 = [v8 URL];
    uint64_t v16 = [v15 absoluteString];
    PKValidationErrorWithReason(@"Couldn't download remote asset. HTTP Status: %ld, Error: %@ URL: %@", v17, v18, v19, v20, v21, v22, v23, v14);
  }
  else
  {
    id v12 = v8;
    if ([v12 statusCode] == 200)
    {
      if (v7)
      {

        id v13 = 0;
LABEL_13:
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        goto LABEL_14;
      }
      uint64_t v33 = [v12 statusCode];
      uint64_t v15 = [v12 URL];
      uint64_t v16 = [v15 absoluteString];
      PKValidationErrorWithReason(@"Empty data received. HTTP Status: %ld URL: %@", v34, v35, v36, v37, v38, v39, v40, v33);
    }
    else
    {
      uint64_t v25 = [v12 statusCode];
      uint64_t v15 = [v12 URL];
      uint64_t v16 = [v15 absoluteString];
      PKValidationErrorWithReason(@"Couldn't download remote asset. HTTP Status: %ld URL: %@", v26, v27, v28, v29, v30, v31, v32, v25);
    }
  id v13 = };

  if (!v13) {
    goto LABEL_13;
  }
  if (![*(id *)(a1 + 32) isRequired]) {
    goto LABEL_13;
  }
  unint64_t v24 = *(void *)(a1 + 56);
  if (v24 > 2) {
    goto LABEL_13;
  }
  [*(id *)(a1 + 32) downloadAssetWithCloudStoreCoordinatorDelegate:*(void *)(a1 + 40) tryCount:v24 + 1 completion:*(void *)(a1 + 48)];
LABEL_14:
}

+ (id)sharedURLSession
{
  if (qword_1EB4034B8 != -1) {
    dispatch_once(&qword_1EB4034B8, &__block_literal_global_207);
  }
  v2 = (void *)_MergedGlobals_281;
  return v2;
}

void __45__PKRemoteAssetManifestItem_sharedURLSession__block_invoke()
{
  id v5 = [MEMORY[0x1E4F18DD0] defaultSessionConfiguration];
  [v5 setTimeoutIntervalForRequest:120.0];
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  v1 = [v0 bundleIdentifier];

  v2 = (void *)[objc_alloc(MEMORY[0x1E4F4EF78]) initWithIdentifier:v1];
  objc_msgSend(v5, "set_appleIDContext:", v2);
  uint64_t v3 = [MEMORY[0x1E4F18DC0] sessionWithConfiguration:v5];
  char v4 = (void *)_MergedGlobals_281;
  _MergedGlobals_281 = v3;
}

- (NSURL)localURL
{
  return self->_localURL;
}

- (void)setLocalURL:(id)a3
{
}

- (NSURL)passURL
{
  return self->_passURL;
}

- (void)setPassURL:(id)a3
{
}

- (NSString)sha1Hex
{
  return self->_sha1Hex;
}

- (void)setSha1Hex:(id)a3
{
}

- (NSNumber)size
{
  return self->_size;
}

- (void)setSize:(id)a3
{
}

- (NSURL)remoteURL
{
  return self->_remoteURL;
}

- (void)setRemoteURL:(id)a3
{
}

- (NSDictionary)manifest
{
  return self->_manifest;
}

- (void)setManifest:(id)a3
{
}

- (NSURL)encryptedContentsLocalURL
{
  return self->_encryptedContentsLocalURL;
}

- (void)setEncryptedContentsLocalURL:(id)a3
{
}

- (NSString)ephemeralPublicKey
{
  return self->_ephemeralPublicKey;
}

- (void)setEphemeralPublicKey:(id)a3
{
}

- (NSString)publicKeyHash
{
  return self->_publicKeyHash;
}

- (void)setPublicKeyHash:(id)a3
{
}

- (NSString)seid
{
  return self->_seid;
}

- (void)setSeid:(id)a3
{
}

- (NSString)encryptionScheme
{
  return self->_encryptionScheme;
}

- (void)setEncryptionScheme:(id)a3
{
}

- (int64_t)encryptionSource
{
  return self->_encryptionSource;
}

- (void)setEncryptionSource:(int64_t)a3
{
  self->_encryptionSource = a3;
}

- (BOOL)isRequired
{
  return self->_required;
}

- (void)setRequired:(BOOL)a3
{
  self->_required = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionScheme, 0);
  objc_storeStrong((id *)&self->_seid, 0);
  objc_storeStrong((id *)&self->_publicKeyHash, 0);
  objc_storeStrong((id *)&self->_ephemeralPublicKey, 0);
  objc_storeStrong((id *)&self->_encryptedContentsLocalURL, 0);
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_sha1Hex, 0);
  objc_storeStrong((id *)&self->_passURL, 0);
  objc_storeStrong((id *)&self->_remoteURL, 0);
  objc_storeStrong((id *)&self->_localURL, 0);
}

- (void)downloadAssetWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__PKRemoteAssetManifestItem_PKDeprecated__downloadAssetWithCompletion___block_invoke;
  v6[3] = &unk_1E56F4918;
  id v7 = v4;
  id v5 = v4;
  [(PKRemoteAssetManifestItem *)self downloadAssetWithCloudStoreCoordinatorDelegate:0 completion:v6];
}

uint64_t __71__PKRemoteAssetManifestItem_PKDeprecated__downloadAssetWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  }
  return result;
}

@end