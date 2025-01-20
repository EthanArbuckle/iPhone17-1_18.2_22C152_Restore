@interface PKPaymentHeroImageManifest
+ (BOOL)manifestFileExistsForRegion:(id)a3;
+ (id)manifestFileForRegion:(id)a3;
+ (id)manifestForRegion:(id)a3;
+ (void)downloadManifestForRegion:(id)a3 url:(id)a4 fileDownloader:(id)a5 completion:(id)a6;
+ (void)removeManifestFileForRegion:(id)a3;
+ (void)saveManifestDataToDeviceForRegion:(id)a3 data:(id)a4;
- (NSDictionary)images;
- (PKPaymentHeroImageManifest)initWithDictionary:(id)a3;
@end

@implementation PKPaymentHeroImageManifest

+ (BOOL)manifestFileExistsForRegion:(id)a3
{
  v3 = [a1 manifestFileForRegion:a3];
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  v5 = [v3 path];
  char v6 = [v4 fileExistsAtPath:v5];

  return v6;
}

+ (id)manifestFileForRegion:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = a3;
  v5 = PKPassAssetDownloadCachePath();
  char v6 = [NSString stringWithFormat:@"hero_image_manifest_%@.json", v4, v5];

  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  v8 = [v3 fileURLWithPathComponents:v7];

  return v8;
}

+ (void)removeManifestFileForRegion:(id)a3
{
  id v8 = [a1 manifestFileForRegion:a3];
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [v8 path];
  int v5 = [v3 fileExistsAtPath:v4];

  if (v5)
  {
    char v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    v7 = [v8 path];
    [v6 removeItemAtPath:v7 error:0];
  }
}

- (PKPaymentHeroImageManifest)initWithDictionary:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(PKPaymentHeroImageManifest *)self init];
  if (v5)
  {
    char v6 = [v4 objectForKey:@"cards"];

    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (v6)
    {
      id v8 = [v4 PKArrayContaining:objc_opt_class() forKey:@"cards"];
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v32 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = [[PKPaymentHeroImage alloc] initWithDictionary:*(void *)(*((void *)&v31 + 1) + 8 * i)];
            uint64_t v14 = [(PKPaymentHeroImage *)v13 identifier];
            v15 = (void *)v14;
            if (v13) {
              BOOL v16 = v14 == 0;
            }
            else {
              BOOL v16 = 1;
            }
            if (!v16) {
              [v7 setValue:v13 forKey:v14];
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v39 count:16];
        }
        while (v10);
      }
    }
    else
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v8 = v4;
      uint64_t v17 = [v8 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v36;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v36 != v19) {
              objc_enumerationMutation(v8);
            }
            uint64_t v21 = *(void *)(*((void *)&v35 + 1) + 8 * j);
            v22 = [PKPaymentHeroImage alloc];
            v23 = [v8 PKDictionaryForKey:v21];
            v24 = [(PKPaymentHeroImage *)v22 initWithLegacyDictionary:v23 identifier:v21];

            uint64_t v25 = [(PKPaymentHeroImage *)v24 identifier];
            v26 = (void *)v25;
            if (v24) {
              BOOL v27 = v25 == 0;
            }
            else {
              BOOL v27 = 1;
            }
            if (!v27) {
              [v7 setValue:v24 forKey:v25];
            }
          }
          uint64_t v18 = [v8 countByEnumeratingWithState:&v35 objects:v40 count:16];
        }
        while (v18);
      }
    }

    uint64_t v28 = [v7 copy];
    images = v5->_images;
    v5->_images = (NSDictionary *)v28;
  }
  return v5;
}

+ (id)manifestForRegion:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [a1 manifestFileForRegion:v4];
  char v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v7 = [v5 path];
  char v8 = [v6 fileExistsAtPath:v7];

  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v5 options:0 error:0];
    if (v9)
    {
      id v16 = 0;
      uint64_t v10 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v9 options:0 error:&v16];
      uint64_t v11 = v16;
      v12 = v11;
      if (v10 && !v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v13 = [[PKPaymentHeroImageManifest alloc] initWithDictionary:v10];
      }
      else
      {
        uint64_t v14 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v18 = v12;
          __int16 v19 = 2112;
          v20 = v4;
          _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Unable to parse hero manifest (%@) for region %@", buf, 0x16u);
        }

        v13 = 0;
      }
    }
    else
    {
      v12 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v18 = v4;
        _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Unable to read hero manifest file for region %@", buf, 0xCu);
      }
      v13 = 0;
    }
  }
  else
  {
    uint64_t v9 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v4;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Unable to find hero manifest file for region %@", buf, 0xCu);
    }
    v13 = 0;
  }

  return v13;
}

+ (void)downloadManifestForRegion:(id)a3 url:(id)a4 fileDownloader:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __86__PKPaymentHeroImageManifest_downloadManifestForRegion_url_fileDownloader_completion___block_invoke;
  v14[3] = &unk_1E56E0EF0;
  id v16 = v11;
  id v17 = a1;
  id v15 = v10;
  id v12 = v10;
  id v13 = v11;
  [a5 downloadFromUrl:a4 completionHandler:v14];
}

void __86__PKPaymentHeroImageManifest_downloadManifestForRegion_url_fileDownloader_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v7 || v9)
  {
    if (!v9)
    {
      id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:0];
    }
    id v16 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v10;
      _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Failed downloading hero manifest %@", buf, 0xCu);
    }

    uint64_t v17 = *(void *)(a1 + 40);
    if (v17) {
      (*(void (**)(uint64_t, void *, void))(v17 + 16))(v17, v10, 0);
    }
  }
  else
  {
    id v20 = 0;
    id v11 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:&v20];
    id v12 = v20;
    id v10 = v12;
    if (v11
      && !v12
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (id v13 = [[PKPaymentHeroImageManifest alloc] initWithDictionary:v11]) != 0)
    {
      uint64_t v14 = v13;
      [*(id *)(a1 + 48) saveManifestDataToDeviceForRegion:*(void *)(a1 + 32) data:v7];
      uint64_t v15 = *(void *)(a1 + 40);
      if (v15) {
        (*(void (**)(uint64_t, void, PKPaymentHeroImageManifest *))(v15 + 16))(v15, 0, v14);
      }
    }
    else
    {
      uint64_t v18 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v10;
        _os_log_impl(&dword_190E10000, v18, OS_LOG_TYPE_DEFAULT, "Unable to parse hero manifest %@", buf, 0xCu);
      }

      uint64_t v19 = *(void *)(a1 + 40);
      if (v19) {
        (*(void (**)(uint64_t, void *, void))(v19 + 16))(v19, v10, 0);
      }
      uint64_t v14 = 0;
    }
  }
}

+ (void)saveManifestDataToDeviceForRegion:(id)a3 data:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = PKPassAssetDownloadCachePath();
  id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v10 = [v9 fileExistsAtPath:v8];

  if ((v10 & 1) == 0)
  {
    id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8];
    id v17 = 0;
    char v13 = [v11 createDirectoryAtURL:v12 withIntermediateDirectories:1 attributes:0 error:&v17];
    id v14 = v17;

    if ((v13 & 1) == 0 && v14)
    {
      uint64_t v15 = PKLogFacilityTypeGetObject(0);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v19 = v8;
        _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Could not create download cache at %@", buf, 0xCu);
      }
    }
  }
  id v16 = [a1 manifestFileForRegion:v6];
  [v7 writeToURL:v16 atomically:1];
}

- (NSDictionary)images
{
  return self->_images;
}

- (void).cxx_destruct
{
}

@end