@interface PXSharedLibraryCameraSharingBannerStatusProvider
- (BOOL)shouldShowBanner;
- (PXSharedLibraryCameraSharingBannerStatusProvider)init;
- (void)_updateShouldShowBanner;
- (void)setShouldShowBanner:(BOOL)a3;
@end

@implementation PXSharedLibraryCameraSharingBannerStatusProvider

uint64_t __75__PXSharedLibraryCameraSharingBannerStatusProvider__updateShouldShowBanner__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShouldShowBanner:*(unsigned __int8 *)(a1 + 40)];
}

- (PXSharedLibraryCameraSharingBannerStatusProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXSharedLibraryCameraSharingBannerStatusProvider;
  v2 = [(PXSharedLibraryCameraSharingBannerStatusProvider *)&v6 init];
  v3 = v2;
  if (v2)
  {
    PXRegisterPreferencesObserver(v2);
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel__significantTimeChange_ name:*MEMORY[0x1E4FB2708] object:0];

    [(PXSharedLibraryCameraSharingBannerStatusProvider *)v3 _updateShouldShowBanner];
  }
  return v3;
}

- (void)_updateShouldShowBanner
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"CameraSharingPreferencesState", @"com.apple.mobileslideshow", &keyExistsAndHasValidFormat);
  BOOL v4 = 0;
  if (keyExistsAndHasValidFormat) {
    BOOL v5 = (unint64_t)(AppIntegerValue - 3) > 0xFFFFFFFFFFFFFFFDLL;
  }
  else {
    BOOL v5 = 0;
  }
  if (!v5)
  {
    objc_super v6 = PXPreferencesFirstCheckDateForCameraSharingPreferences();
    if (v6)
    {
      v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      v8 = [MEMORY[0x1E4F1C9C8] now];
      v9 = [v7 components:16 fromDate:v6 toDate:v8 options:0];
      unint64_t v10 = [v9 day];

      v11 = +[PXSharedLibrarySettings sharedInstance];
      unint64_t v12 = [v11 sharingSuggestionsBannerFirstCheckThreshold];

      if (v10 < v12)
      {
        BOOL v4 = 0;
LABEL_13:

        goto LABEL_14;
      }
      v13 = PXPreferencesPromptDateForCameraSharingPreferences();
      if (v13)
      {
        v14 = [MEMORY[0x1E4F1C9C8] now];
        [v14 timeIntervalSinceDate:v13];
        double v16 = v15;

        BOOL v4 = v16 <= 604800.0;
      }
      else
      {
        BOOL v4 = 1;
      }
    }
    else
    {
      v13 = [MEMORY[0x1E4F1C9C8] now];
      PXPreferencesSetValue(@"FirstCheckDateForCameraSharingPreferences", v13);
      BOOL v4 = 0;
    }

    goto LABEL_13;
  }
LABEL_14:
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __75__PXSharedLibraryCameraSharingBannerStatusProvider__updateShouldShowBanner__block_invoke;
  v17[3] = &unk_1E5DCEB78;
  v17[4] = self;
  BOOL v18 = v4;
  [(PXSharedLibraryCameraSharingBannerStatusProvider *)self performChanges:v17];
}

- (void)setShouldShowBanner:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_shouldShowBanner != a3)
  {
    BOOL v3 = a3;
    self->_shouldShowBanner = a3;
    BOOL v5 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543874;
      uint64_t v7 = objc_opt_class();
      __int16 v8 = 2048;
      v9 = self;
      __int16 v10 = 1024;
      BOOL v11 = v3;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Should show banner: %d", (uint8_t *)&v6, 0x1Cu);
    }

    [(PXSharedLibraryCameraSharingBannerStatusProvider *)self signalChange:1];
  }
}

- (BOOL)shouldShowBanner
{
  return self->_shouldShowBanner;
}

@end