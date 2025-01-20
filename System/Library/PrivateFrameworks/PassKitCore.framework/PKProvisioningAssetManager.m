@interface PKProvisioningAssetManager
+ (id)sharedInstance;
- (PKProvisioningAssetManager)init;
- (id)_assetNameWithScreenScalingSuffix:(id)a3;
- (id)_carPairingImageFromBundle:(id)a3 darkMode:(BOOL)a4;
- (id)provisioningString:(id)a3 templateIdentifier:(id)a4;
- (void)_defaultCarPairingImage:(unint64_t)a3 darkMode:(BOOL)a4 completion:(id)a5;
- (void)_defaultCardArtwork:(id)a3;
- (void)carPairingImageForRadioTechnology:(unint64_t)a3 templateIdentifier:(id)a4 darkMode:(BOOL)a5 completion:(id)a6;
- (void)cardArtworkForTemplateIdentifier:(id)a3 completion:(id)a4;
@end

@implementation PKProvisioningAssetManager

+ (id)sharedInstance
{
  if (_MergedGlobals_222 != -1) {
    dispatch_once(&_MergedGlobals_222, &__block_literal_global_76);
  }
  v2 = (void *)qword_1EB402D88;
  return v2;
}

void __44__PKProvisioningAssetManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(PKProvisioningAssetManager);
  v1 = (void *)qword_1EB402D88;
  qword_1EB402D88 = (uint64_t)v0;
}

- (PKProvisioningAssetManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKProvisioningAssetManager;
  v2 = [(PKProvisioningAssetManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[PKMobileAssetManager sharedInstance];
    v4 = (void *)_mobileAssetManager;
    _mobileAssetManager = v3;
  }
  return v2;
}

- (void)carPairingImageForRadioTechnology:(unint64_t)a3 templateIdentifier:(id)a4 darkMode:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a6;
  if (v10)
  {
    if ((a3 & 2) != 0) {
      v12 = @"CarPairingUWB";
    }
    else {
      v12 = @"CarPairingNFC";
    }
    v13 = [(__CFString *)v12 stringByAppendingString:@"_"];
    v14 = (void *)_mobileAssetManager;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __103__PKProvisioningAssetManager_carPairingImageForRadioTechnology_templateIdentifier_darkMode_completion___block_invoke;
    v15[3] = &unk_1E56E38B8;
    v15[4] = self;
    BOOL v18 = v7;
    id v16 = v11;
    unint64_t v17 = a3;
    [v14 dynamicAssetWithIdentifier:v10 mappedIdentifierPrefix:v13 parameters:0 timeout:10 completion:v15];
  }
  else
  {
    [(PKProvisioningAssetManager *)self _defaultCarPairingImage:a3 darkMode:v7 completion:v11];
  }
}

void __103__PKProvisioningAssetManager_carPairingImageForRadioTechnology_templateIdentifier_darkMode_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _carPairingImageFromBundle:a2 darkMode:*(unsigned __int8 *)(a1 + 56)];
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    [*(id *)(a1 + 32) _defaultCarPairingImage:*(void *)(a1 + 48) darkMode:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 40)];
  }
}

- (void)cardArtworkForTemplateIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    BOOL v7 = [@"CardArtwork" stringByAppendingFormat:@"_%@", a3];
    v8 = (void *)_mobileAssetManager;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __74__PKProvisioningAssetManager_cardArtworkForTemplateIdentifier_completion___block_invoke;
    v9[3] = &unk_1E56DC070;
    v9[4] = self;
    id v10 = v6;
    [v8 dynamicAssetWithIdentifier:v7 parameters:0 timeout:10 completion:v9];
  }
  else
  {
    [(PKProvisioningAssetManager *)self _defaultCardArtwork:v6];
  }
}

void __74__PKProvisioningAssetManager_cardArtworkForTemplateIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = [a2 URLForResource:@"image" withExtension:@"png"];
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4)
    {
      BOOL v7 = v3;
      (*(void (**)(void))(v4 + 16))();
      id v3 = v7;
    }
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    [v5 _defaultCardArtwork:v6];
  }
}

- (id)provisioningString:(id)a3 templateIdentifier:(id)a4
{
  v5 = (NSString *)a3;
  id v6 = a4;
  if (v5)
  {
    BOOL v7 = [(id)_mobileAssetManager cachedStringsBundleWithIdentifier:@"Provisioning"];
    if (!v6
      || ([(NSString *)v5 stringByAppendingFormat:@"_%@", v6],
          v8 = (NSString *)objc_claimAutoreleasedReturnValue(),
          PKLocalizedStringInMobileAssetsStringsBundle(v8, v7, 0),
          v9 = objc_claimAutoreleasedReturnValue(),
          v8,
          !v9))
    {
      v9 = PKLocalizedStringInMobileAssetsStringsBundle(v5, v7, 0);
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_defaultCarPairingImage:(unint64_t)a3 darkMode:(BOOL)a4 completion:(id)a5
{
  char v6 = a3;
  id v8 = a5;
  v9 = (void *)_mobileAssetManager;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__PKProvisioningAssetManager__defaultCarPairingImage_darkMode_completion___block_invoke;
  v12[3] = &unk_1E56E38E0;
  BOOL v14 = a4;
  if ((v6 & 2) != 0) {
    id v10 = @"CarPairingUWB";
  }
  else {
    id v10 = @"CarPairingNFC";
  }
  v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [v9 dynamicAssetWithIdentifier:v10 parameters:0 timeout:10 completion:v12];
}

void __74__PKProvisioningAssetManager__defaultCarPairingImage_darkMode_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _carPairingImageFromBundle:a2 darkMode:*(unsigned __int8 *)(a1 + 48)];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    id v3 = v5;
  }
}

- (void)_defaultCardArtwork:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)_mobileAssetManager;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__PKProvisioningAssetManager__defaultCardArtwork___block_invoke;
  v6[3] = &unk_1E56E3908;
  id v7 = v3;
  id v5 = v3;
  [v4 dynamicAssetWithIdentifier:@"GenericCardArtwork" parameters:0 timeout:10 completion:v6];
}

void __50__PKProvisioningAssetManager__defaultCardArtwork___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v9)
  {
    char v6 = [v9 URLForResource:@"image" withExtension:@"png"];
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v6);
    }
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8) {
      (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
    }
  }
}

- (id)_carPairingImageFromBundle:(id)a3 darkMode:(BOOL)a4
{
  if (a3)
  {
    if (a4) {
      id v5 = @"dark";
    }
    else {
      id v5 = @"light";
    }
    id v6 = a3;
    uint64_t v7 = [(PKProvisioningAssetManager *)self _assetNameWithScreenScalingSuffix:v5];
    uint64_t v8 = [v6 URLForResource:v7 withExtension:@"png"];
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

- (id)_assetNameWithScreenScalingSuffix:(id)a3
{
  id v3 = a3;
  double v4 = PKScreenScale();
  id v5 = @"@2x";
  if (v4 < 2.0) {
    id v5 = @"@1x";
  }
  if (v4 >= 3.0) {
    id v6 = @"@3x";
  }
  else {
    id v6 = v5;
  }
  uint64_t v7 = [v3 stringByAppendingString:v6];

  return v7;
}

@end