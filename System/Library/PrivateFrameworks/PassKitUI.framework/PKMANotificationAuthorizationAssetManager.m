@interface PKMANotificationAuthorizationAssetManager
+ (id)sharedInstance;
- (CGImage)notificationAuthorizationImageForLocale:(id)a3;
- (PKMANotificationAuthorizationAssetManager)init;
- (id)_notificationAuthorizationImageFilenameForLocale:(id)a3;
- (id)notificationAuthorizationString:(id)a3;
- (void)downloadNotificationAuthorizationImage:(id)a3 completion:(id)a4;
@end

@implementation PKMANotificationAuthorizationAssetManager

+ (id)sharedInstance
{
  if (_MergedGlobals_685 != -1) {
    dispatch_once(&_MergedGlobals_685, &__block_literal_global_154);
  }
  v2 = (void *)qword_1EB545C88;

  return v2;
}

void __59__PKMANotificationAuthorizationAssetManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(PKMANotificationAuthorizationAssetManager);
  v1 = (void *)qword_1EB545C88;
  qword_1EB545C88 = (uint64_t)v0;
}

- (PKMANotificationAuthorizationAssetManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)PKMANotificationAuthorizationAssetManager;
  v2 = [(PKMANotificationAuthorizationAssetManager *)&v7 init];
  if (v2
    && ([MEMORY[0x1E4F847F8] sharedInstance],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        mobileAssetManager = v2->_mobileAssetManager,
        v2->_mobileAssetManager = (PKMobileAssetManager *)v3,
        mobileAssetManager,
        !v2->_mobileAssetManager))
  {
    v5 = 0;
  }
  else
  {
    v5 = v2;
  }

  return v5;
}

- (id)notificationAuthorizationString:(id)a3
{
  v4 = (NSString *)a3;
  v5 = [(PKMobileAssetManager *)self->_mobileAssetManager cachedStringsBundleWithIdentifier:*MEMORY[0x1E4F87490]];
  v6 = PKLocalizedStringInMobileAssetsStringsBundle(v4, v5);
  if (!v6)
  {
    v6 = PKLocalizedString(v4);
  }

  return v6;
}

- (void)downloadNotificationAuthorizationImage:(id)a3 completion:(id)a4
{
  id v6 = a4;
  objc_super v7 = [(PKMANotificationAuthorizationAssetManager *)self _notificationAuthorizationImageFilenameForLocale:a3];
  mobileAssetManager = self->_mobileAssetManager;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __95__PKMANotificationAuthorizationAssetManager_downloadNotificationAuthorizationImage_completion___block_invoke;
  v10[3] = &unk_1E59D8C88;
  id v11 = v6;
  id v9 = v6;
  [(PKMobileAssetManager *)mobileAssetManager dynamicAssetWithIdentifier:v7 parameters:0 timeout:20 completion:v10];
}

uint64_t __95__PKMANotificationAuthorizationAssetManager_downloadNotificationAuthorizationImage_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a3 == 0);
  }
  return result;
}

- (CGImage)notificationAuthorizationImageForLocale:(id)a3
{
  v4 = [(PKMANotificationAuthorizationAssetManager *)self _notificationAuthorizationImageFilenameForLocale:a3];
  v5 = [(PKMobileAssetManager *)self->_mobileAssetManager cachedDynamicAssetWithIdentifier:v4 parameters:0];
  id v6 = [v4 stringByAppendingFormat:@"_%@", @"Light"];
  objc_super v7 = [v4 stringByAppendingFormat:@"_%@", @"Dark"];
  if (!v5)
  {
    v10 = 0;
LABEL_6:
    v8 = PKUIImageNamed(v6);
    if (v10) {
      goto LABEL_4;
    }
LABEL_7:
    v10 = PKUIImageNamed(v7);
    goto LABEL_4;
  }
  v8 = [MEMORY[0x1E4FB1818] imageNamed:v6 inBundle:v5];
  uint64_t v9 = [MEMORY[0x1E4FB1818] imageNamed:v7 inBundle:v5];
  v10 = (void *)v9;
  if (!v8) {
    goto LABEL_6;
  }
  if (!v9) {
    goto LABEL_7;
  }
LABEL_4:
  PKUIDynamicImage(v8, v10);
  id v11 = objc_claimAutoreleasedReturnValue();
  v12 = (CGImage *)[v11 CGImage];

  return v12;
}

- (id)_notificationAuthorizationImageFilenameForLocale:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"Notification"];
  if (PKIsVision())
  {
    v5 = @"Vision";
  }
  else
  {
    int v6 = PKIsPad();
    objc_super v7 = @"Phone";
    if (v6) {
      objc_super v7 = @"Pad";
    }
    [v4 appendFormat:@"_%@", v7];
    int v8 = PKLocaleIs24HourMode();
    uint64_t v9 = @"12hr";
    if (v8) {
      uint64_t v9 = @"24hr";
    }
    [v4 appendFormat:@"_%@", v9];
    v10 = (void *)MEMORY[0x1E4F1CA20];
    id v11 = [v3 languageCode];
    uint64_t v12 = [v10 characterDirectionForLanguage:v11];

    v13 = @"LTR";
    if (v12 == 2) {
      v13 = @"RTL";
    }
    [v4 appendFormat:@"_%@", v13];
    uint64_t v14 = PKNumberingSystemForLocale();
    if (v14 == 1)
    {
      v5 = @"Arabic";
    }
    else
    {
      if (v14 != 2) {
        goto LABEL_14;
      }
      v5 = @"Devanagari";
    }
  }
  [v4 appendFormat:@"_%@", v5];
LABEL_14:
  v15 = (void *)[v4 copy];

  return v15;
}

- (void).cxx_destruct
{
}

@end