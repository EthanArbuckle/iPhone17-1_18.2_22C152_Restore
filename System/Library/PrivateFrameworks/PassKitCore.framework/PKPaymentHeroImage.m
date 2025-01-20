@interface PKPaymentHeroImage
- (BOOL)hasCachedImageWithScale:(double)a3;
- (BOOL)isBeta;
- (BOOL)isSupportedByDevice:(id)a3;
- (NSArray)requiredDeviceFeatures;
- (NSString)identifier;
- (PKOSVersionRequirementRange)versionRequirement;
- (PKPaymentHeroImage)imageWithScale:(double)a3;
- (PKPaymentHeroImage)initWithDictionary:(id)a3;
- (PKPaymentHeroImage)initWithIdentifier:(id)a3 imageData:(id)a4 credentialType:(int64_t)a5;
- (PKPaymentHeroImage)initWithLegacyDictionary:(id)a3 identifier:(id)a4;
- (id)URLForImageWithScale:(double)a3;
- (id)imageFilePathForImageModel:(id)a3;
- (id)imageFilePathOnDiskForPreferredLanguages:(id)a3 scale:(double)a4;
- (id)imageForPreferredLanguages:(id)a3 scale:(double)a4;
- (int64_t)cardType;
- (int64_t)credentialType;
- (void)downloadImageForPreferredLanguages:(id)a3 scale:(double)a4 fileDownloader:(id)a5 completion:(id)a6;
- (void)downloadImageWithScale:(double)a3 fileDownloader:(id)a4 completion:(id)a5;
@end

@implementation PKPaymentHeroImage

- (PKPaymentHeroImage)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(PKPaymentHeroImage *)self init];
  if (!v5) {
    goto LABEL_11;
  }
  uint64_t v6 = [v4 PKStringForKey:@"identifier"];
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  if (!v5->_identifier)
  {
    v20 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v25 = 0;
      v21 = "Invalid hero image identifier";
      v22 = (uint8_t *)&v25;
LABEL_9:
      _os_log_impl(&dword_190E10000, v20, OS_LOG_TYPE_DEFAULT, v21, v22, 2u);
    }
LABEL_10:

LABEL_11:
    v19 = 0;
    goto LABEL_12;
  }
  v8 = [PKOSVersionRequirementRange alloc];
  v9 = [v4 PKDictionaryForKey:@"deviceVersionRequirement"];
  uint64_t v10 = [(PKOSVersionRequirementRange *)v8 initWithDictionary:v9];
  versionRequirement = v5->_versionRequirement;
  v5->_versionRequirement = (PKOSVersionRequirementRange *)v10;

  uint64_t v12 = [v4 PKArrayContaining:objc_opt_class() forKey:@"requiredDeviceFeatures"];
  requiredDeviceFeatures = v5->_requiredDeviceFeatures;
  v5->_requiredDeviceFeatures = (NSArray *)v12;

  v5->_credentialType = [v4 PKIntegerForKey:@"credentialType"];
  v14 = [v4 PKStringForKey:@"cardType"];
  v5->_cardType = PKWebServicesPaymentCardTypeFromString(v14);

  v5->_isBeta = [v4 PKIntegerForKey:@"isBeta"] > 0;
  v15 = [PKPaymentHeroImageSet alloc];
  v16 = [v4 PKDictionaryForKey:@"images"];
  uint64_t v17 = [(PKPaymentHeroImageSet *)v15 initWithDictionary:v16];
  images = v5->_images;
  v5->_images = (PKPaymentHeroImageSet *)v17;

  if (!v5->_images)
  {
    v20 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v24 = 0;
      v21 = "Invalid hero image list";
      v22 = (uint8_t *)&v24;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  v19 = v5;
LABEL_12:

  return v19;
}

- (PKPaymentHeroImage)initWithLegacyDictionary:(id)a3 identifier:(id)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(PKPaymentHeroImage *)self init];
  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    uint64_t v10 = [v9 numberFromString:v7];
    uint64_t v11 = [v10 integerValue];

    uint64_t v12 = PKPaymentNetworkNameForPaymentCredentialType(v11);
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v12;

    v8->_credentialType = v11;
    if (v11)
    {
      v14 = [[PKPaymentHeroImageSet alloc] initWithDictionary:v6];
      images = v8->_images;
      v8->_images = v14;

      if (v8->_images)
      {
        v16 = [v6 PKDictionaryForKey:@"requirements"];
        uint64_t v17 = [v16 PKArrayContaining:objc_opt_class() forKey:@"hardware"];

        if ([v17 containsObject:@"typef"])
        {
          v25[0] = @"type_f";
          uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
          requiredDeviceFeatures = v8->_requiredDeviceFeatures;
          v8->_requiredDeviceFeatures = (NSArray *)v18;
        }
        goto LABEL_7;
      }
      v21 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v24 = 0;
        v22 = "Invalid hero image list";
        goto LABEL_12;
      }
    }
    else
    {
      v21 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v24 = 0;
        v22 = "Invalid hero image identifier";
LABEL_12:
        _os_log_impl(&dword_190E10000, v21, OS_LOG_TYPE_DEFAULT, v22, v24, 2u);
      }
    }

    v20 = 0;
    goto LABEL_14;
  }
LABEL_7:
  v20 = v8;
LABEL_14:

  return v20;
}

- (PKPaymentHeroImage)initWithIdentifier:(id)a3 imageData:(id)a4 credentialType:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = [(PKPaymentHeroImage *)self init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifier, a3);
    objc_storeStrong((id *)&v12->_imageData, a4);
    v12->_credentialType = a5;
  }

  return v12;
}

- (BOOL)hasCachedImageWithScale:(double)a3
{
  if (self->_imageData) {
    return 1;
  }
  id v6 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  id v7 = [(PKPaymentHeroImage *)self imageFilePathOnDiskForPreferredLanguages:v6 scale:a3];

  v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v9 = [v7 path];
  char v10 = [v8 fileExistsAtPath:v9];

  return v10;
}

- (PKPaymentHeroImage)imageWithScale:(double)a3
{
  v5 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  id v6 = [(PKPaymentHeroImage *)self imageForPreferredLanguages:v5 scale:a3];

  return (PKPaymentHeroImage *)v6;
}

- (id)URLForImageWithScale:(double)a3
{
  images = self->_images;
  v5 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  id v6 = [(PKPaymentHeroImageSet *)images imageForPreferredLanguages:v5 scale:a3];

  id v7 = [v6 url];

  return v7;
}

- (id)imageForPreferredLanguages:(id)a3 scale:(double)a4
{
  imageData = self->_imageData;
  if (imageData)
  {
    v5 = imageData;
  }
  else
  {
    id v6 = [(PKPaymentHeroImage *)self imageFilePathOnDiskForPreferredLanguages:a3 scale:a4];
    id v7 = (void *)MEMORY[0x1E4F1C9B8];
    v8 = [v6 path];
    v5 = [v7 dataWithContentsOfFile:v8];
  }
  return v5;
}

- (void)downloadImageWithScale:(double)a3 fileDownloader:(id)a4 completion:(id)a5
{
  v8 = (void *)MEMORY[0x1E4F1CA20];
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 preferredLanguages];
  [(PKPaymentHeroImage *)self downloadImageForPreferredLanguages:v11 scale:v10 fileDownloader:v9 completion:a3];
}

- (void)downloadImageForPreferredLanguages:(id)a3 scale:(double)a4 fileDownloader:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = (void (**)(void, void, void))v12;
  if (self->_imageData)
  {
    if (v12) {
      (*((void (**)(id, void))v12 + 2))(v12, 0);
    }
  }
  else
  {
    v14 = [(PKPaymentHeroImageSet *)self->_images imageForPreferredLanguages:v10 scale:a4];
    v15 = v14;
    if (v14)
    {
      v16 = [v14 url];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __89__PKPaymentHeroImage_downloadImageForPreferredLanguages_scale_fileDownloader_completion___block_invoke;
      v18[3] = &unk_1E56E0EC8;
      id v19 = v15;
      v20 = v13;
      [v11 downloadFromUrl:v16 completionHandler:v18];
    }
    else if (v13)
    {
      uint64_t v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPaymentErrorDomain" code:-1 userInfo:0];
      ((void (**)(void, void *, void))v13)[2](v13, v17, 0);
    }
  }
}

void __89__PKPaymentHeroImage_downloadImageForPreferredLanguages_scale_fileDownloader_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  v8 = [*(id *)(a1 + 32) imageSha];
  if (v7)
  {
    id v9 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412546;
      id v19 = v8;
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Downloading hero image %@ failed: %@", (uint8_t *)&v18, 0x16u);
    }

    uint64_t v10 = *(void *)(a1 + 40);
    if (v10) {
      (*(void (**)(uint64_t, id, void))(v10 + 16))(v10, v7, 0);
    }
  }
  else
  {
    id v11 = [v6 SHA1Hash];
    id v12 = [v11 hexEncoding];

    if ([v12 isEqualToString:v8])
    {
      PKCacheFile(v6, v12);
      v13 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412290;
        id v19 = v8;
        _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Downloaded hero image %@", (uint8_t *)&v18, 0xCu);
      }

      uint64_t v14 = *(void *)(a1 + 40);
      if (v14) {
        (*(void (**)(uint64_t, void, id))(v14 + 16))(v14, 0, v6);
      }
    }
    else
    {
      v15 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412290;
        id v19 = v8;
        _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Downloaded hero image with conflicting sha %@", (uint8_t *)&v18, 0xCu);
      }

      uint64_t v16 = *(void *)(a1 + 40);
      if (v16)
      {
        uint64_t v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:0];
        (*(void (**)(uint64_t, void *, void))(v16 + 16))(v16, v17, 0);
      }
    }
  }
}

- (id)imageFilePathOnDiskForPreferredLanguages:(id)a3 scale:(double)a4
{
  v5 = [(PKPaymentHeroImageSet *)self->_images imageForPreferredLanguages:a3 scale:a4];
  id v6 = [(PKPaymentHeroImage *)self imageFilePathForImageModel:v5];

  return v6;
}

- (id)imageFilePathForImageModel:(id)a3
{
  v3 = [a3 imageSha];
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F1CB10];
    v5 = PKPassAssetDownloadCachePath();
    id v6 = [v5 stringByAppendingPathComponent:v3];
    id v7 = [v4 fileURLWithPath:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)isSupportedByDevice:(id)a3
{
  id v4 = a3;
  v5 = [v4 deviceClass];
  id v6 = [v4 deviceVersion];
  versionRequirement = self->_versionRequirement;
  if (versionRequirement) {
    BOOL v8 = v5 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if ((v8
     || -[PKOSVersionRequirementRange versionMeetsRequirements:deviceClass:](versionRequirement, "versionMeetsRequirements:deviceClass:", v6, v5))&& (!-[NSArray containsObject:](self->_requiredDeviceFeatures, "containsObject:", @"type_f")|| [v4 felicaSecureElementIsAvailable]))
  {
    char v9 = objc_msgSend(v4, "supportsCredentialType:", -[PKPaymentHeroImage credentialType](self, "credentialType"));
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (PKOSVersionRequirementRange)versionRequirement
{
  return self->_versionRequirement;
}

- (NSArray)requiredDeviceFeatures
{
  return self->_requiredDeviceFeatures;
}

- (int64_t)credentialType
{
  return self->_credentialType;
}

- (int64_t)cardType
{
  return self->_cardType;
}

- (BOOL)isBeta
{
  return self->_isBeta;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredDeviceFeatures, 0);
  objc_storeStrong((id *)&self->_versionRequirement, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_images, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
}

@end