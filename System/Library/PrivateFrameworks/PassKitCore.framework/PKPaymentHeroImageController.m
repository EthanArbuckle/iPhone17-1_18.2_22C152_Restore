@interface PKPaymentHeroImageController
+ (CGSize)cardArtSizeForWatchViewSize:(CGSize)a3;
+ (double)cardAspectRatio;
+ (id)defaultImages;
- (CGSize)cardArtSizeForSize:(CGSize)a3;
- (NSArray)featuredImages;
- (NSString)primaryImageIdentifier;
- (PKPaymentHeroImageController)initWithManifest:(id)a3 webService:(id)a4;
- (PKPaymentHeroImageControllerDelegate)delegate;
- (PKPaymentHeroImageManifest)manifest;
- (id)featuredDefaultImages;
- (id)featuredImageIdentifiers;
- (id)filterImages:(id)a3;
- (int64_t)watchSize;
- (void)downloadImages:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFeaturedImages:(id)a3;
- (void)setPrimaryImageIdentifier:(id)a3;
- (void)setWatchSize:(int64_t)a3;
@end

@implementation PKPaymentHeroImageController

+ (id)defaultImages
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v12[0] = xmmword_191656BD0;
  v12[1] = xmmword_191674C70;
  uint64_t v13 = 11;
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__PKPaymentHeroImageController_defaultImages__block_invoke;
  aBlock[3] = &unk_1E56E98B0;
  id v3 = v2;
  id v11 = v3;
  v4 = (void (**)(void *, void *, uint64_t))_Block_copy(aBlock);
  for (uint64_t i = 0; i != 40; i += 8)
  {
    uint64_t v6 = *(void *)((char *)v12 + i);
    v7 = PKPaymentNetworkNameForPaymentCredentialType(v6);
    v4[2](v4, v7, v6);
  }
  v4[2](v4, @"AppleCard", 0);
  v4[2](v4, @"AppleCash", 0);
  v8 = (void *)[v3 copy];

  return v8;
}

void __45__PKPaymentHeroImageController_defaultImages__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v17 = a2;
  v5 = [NSString stringWithFormat:@"HeroCard_%@", v17];
  uint64_t v6 = PKPassKitCoreBundle();
  v7 = +[PKImage URLForImageNamed:v5 inBundle:v6 scale:0];

  if (v7)
  {
    v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    v9 = [v7 path];
    int v10 = [v8 fileExistsAtPath:v9];

    if (v10)
    {
      id v11 = *(void **)(a1 + 32);
      v12 = [PKPaymentHeroImage alloc];
      uint64_t v13 = (void *)MEMORY[0x1E4F1C9B8];
      uint64_t v14 = [v7 path];
      v15 = [v13 dataWithContentsOfFile:v14];
      v16 = [(PKPaymentHeroImage *)v12 initWithIdentifier:v17 imageData:v15 credentialType:a3];
      [v11 addObject:v16];
    }
  }
}

- (PKPaymentHeroImageController)initWithManifest:(id)a3 webService:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentHeroImageController;
  v9 = [(PKPaymentHeroImageController *)&v12 init];
  int v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_manifest, a3);
    objc_storeStrong((id *)&v10->_webService, a4);
  }

  return v10;
}

- (NSArray)featuredImages
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(PKPaymentHeroImageController *)self featuredImageIdentifiers];
  v4 = [(PKPaymentHeroImageManifest *)self->_manifest images];
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(v4, "objectForKey:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  if ([v5 count]) {
    objc_super v12 = (void *)[v5 copy];
  }
  else {
    objc_super v12 = 0;
  }

  return (NSArray *)v12;
}

- (NSString)primaryImageIdentifier
{
  id v3 = [(PKPaymentWebService *)self->_webService targetDevice];
  v4 = [v3 deviceRegion];

  v5 = [(PKPaymentWebService *)self->_webService context];
  id v6 = [v5 configuration];
  uint64_t v7 = [v6 primaryFeaturedNetworkForRegion:v4];

  return (NSString *)v7;
}

- (id)featuredImageIdentifiers
{
  id v3 = [(PKPaymentWebService *)self->_webService targetDevice];
  v4 = [v3 deviceRegion];

  v5 = [(PKPaymentWebService *)self->_webService context];
  id v6 = [v5 configuration];
  uint64_t v7 = [v6 paymentSetupFeaturedNetworksForRegion:v4];

  return v7;
}

- (id)filterImages:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = [(PKPaymentWebService *)self->_webService targetDevice];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_super v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v12, "isSupportedByDevice:", v6, (void)v15)) {
          [v5 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  uint64_t v13 = (void *)[v5 copy];
  return v13;
}

- (id)featuredDefaultImages
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [(id)objc_opt_class() defaultImages];
  id v4 = [(PKPaymentHeroImageController *)self featuredImageIdentifiers];
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_super v12 = objc_msgSend(v11, "identifier", (void)v16);
        int v13 = [v4 containsObject:v12];

        if (v13) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  if ([v5 count]) {
    long long v14 = (void *)[v5 copy];
  }
  else {
    long long v14 = 0;
  }

  return v14;
}

- (void)downloadImages:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = PKScreenScale();
  id v6 = +[PKObjectDownloader sharedImageAssetDownloader];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (([v11 hasCachedImageWithScale:v5] & 1) == 0)
        {
          objc_initWeak(&location, self);
          v12[0] = MEMORY[0x1E4F143A8];
          v12[1] = 3221225472;
          _OWORD v12[2] = __47__PKPaymentHeroImageController_downloadImages___block_invoke;
          v12[3] = &unk_1E56E98D8;
          objc_copyWeak(&v13, &location);
          v12[4] = v11;
          [v11 downloadImageWithScale:v6 fileDownloader:v12 completion:v5];
          objc_destroyWeak(&v13);
          objc_destroyWeak(&location);
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

void __47__PKPaymentHeroImageController_downloadImages___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = objc_loadWeakRetained(WeakRetained + 5);
    if (v8 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v8 heroImageController:v7 didFinishDownloadingImageData:v5 forImage:*(void *)(a1 + 32) error:v9];
    }
  }
}

- (CGSize)cardArtSizeForSize:(CGSize)a3
{
  double width = a3.width;
  if (self->_watchSize)
  {
    double height = a3.height;
    id v5 = objc_opt_class();
    objc_msgSend(v5, "cardArtSizeForWatchViewSize:", width, height);
  }
  else if (a3.width <= 320.0)
  {
    double v7 = 113.0;
    double v6 = 180.0;
  }
  else
  {
    int IsAvailable = PKPearlIsAvailable();
    double v7 = 61.0;
    if (!IsAvailable) {
      double v7 = 53.0;
    }
    double v6 = 85.0;
    if (IsAvailable) {
      double v6 = 96.0;
    }
  }
  result.double height = v7;
  result.double width = v6;
  return result;
}

+ (CGSize)cardArtSizeForWatchViewSize:(CGSize)a3
{
  double v3 = a3.width * 0.555;
  double v4 = a3.height * 0.206;
  result.double height = v4;
  result.double width = v3;
  return result;
}

+ (double)cardAspectRatio
{
  return 1.59;
}

- (void)setPrimaryImageIdentifier:(id)a3
{
}

- (void)setFeaturedImages:(id)a3
{
}

- (PKPaymentHeroImageManifest)manifest
{
  return self->_manifest;
}

- (PKPaymentHeroImageControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PKPaymentHeroImageControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)watchSize
{
  return self->_watchSize;
}

- (void)setWatchSize:(int64_t)a3
{
  self->_watchSize = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_featuredImages, 0);
  objc_storeStrong((id *)&self->_primaryImageIdentifier, 0);
  objc_storeStrong((id *)&self->_webService, 0);
}

@end