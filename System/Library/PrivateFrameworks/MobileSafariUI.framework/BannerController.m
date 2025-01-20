@interface BannerController
- (BannerControllerDelegate)delegate;
- (NSArray)topBanners;
- (NSArray)topBannersAnchoredToStatusBar;
- (NSArray)topBannersSeparableFromStatusBar;
- (SFPinnableBanner)appBanner;
- (SFPinnableBanner)crashBanner;
- (SFPinnableBanner)privateBrowsingPrivacyProtectionsBanner;
- (SFPinnableBanner)remotelyEnabledExtensionBanner;
- (SFPinnableBanner)tabGroupBanner;
- (SFPinnableBanner)webExtensionBanner;
- (SFPinnableBanner)webExtensionPermissionGrantedBanner;
- (unint64_t)indexOfFirstBannerSeparableFromStatusBar;
- (void)_updateTopBanners;
- (void)setAppBanner:(id)a3 animated:(BOOL)a4;
- (void)setCrashBanner:(id)a3 animated:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setPrivateBrowsingPrivacyProtectionsBanner:(id)a3 animated:(BOOL)a4;
- (void)setRemotelyEnabledExtensionBanner:(id)a3 animated:(BOOL)a4;
- (void)setTabGroupBanner:(id)a3 animated:(BOOL)a4;
- (void)setWebExtensionBanner:(id)a3 animated:(BOOL)a4;
- (void)setWebExtensionPermissionGrantedBanner:(id)a3 animated:(BOOL)a4;
@end

@implementation BannerController

- (void)setTabGroupBanner:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  v7 = self->_tabGroupBanner;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_tabGroupBanner, a3);
    [(BannerController *)self _updateTopBanners];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained bannerController:self didSetTabGroupBanner:v9 previousBanner:v7 animated:v4];
  }
}

- (NSArray)topBanners
{
  return self->_topBanners;
}

- (BannerControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BannerControllerDelegate *)WeakRetained;
}

- (unint64_t)indexOfFirstBannerSeparableFromStatusBar
{
  return [(NSArray *)self->_topBanners indexOfObjectPassingTest:&__block_literal_global_4];
}

- (SFPinnableBanner)tabGroupBanner
{
  return self->_tabGroupBanner;
}

- (void)setDelegate:(id)a3
{
}

- (SFPinnableBanner)crashBanner
{
  return self->_crashBanner;
}

- (void)setAppBanner:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  v7 = self->_appBanner;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_appBanner, a3);
    [(BannerController *)self _updateTopBanners];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained bannerController:self didSetAppBanner:v9 previousBanner:v7 animated:v4];
  }
}

- (void)setCrashBanner:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  v7 = self->_crashBanner;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_crashBanner, a3);
    [(BannerController *)self _updateTopBanners];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained bannerController:self didSetCrashBanner:v9 previousBanner:v7 animated:v4];
  }
}

- (void)setWebExtensionBanner:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  v7 = self->_webExtensionBanner;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_webExtensionBanner, a3);
    [(BannerController *)self _updateTopBanners];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained bannerController:self didSetWebExtensionBanner:v9 previousBanner:v7 animated:v4];
  }
}

- (void)setWebExtensionPermissionGrantedBanner:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  v7 = self->_webExtensionPermissionGrantedBanner;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_webExtensionPermissionGrantedBanner, a3);
    [(BannerController *)self _updateTopBanners];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained bannerController:self didSetWebExtensionPermissionGrantedBanner:v9 previousBanner:v7 animated:v4];
  }
}

- (void)setRemotelyEnabledExtensionBanner:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  v7 = self->_remotelyEnabledExtensionBanner;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_remotelyEnabledExtensionBanner, a3);
    [(BannerController *)self _updateTopBanners];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained bannerController:self didSetRemotelyEnabledExtensionBanner:v9 previousBanner:v7 animated:v4];
  }
}

- (void)setPrivateBrowsingPrivacyProtectionsBanner:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  v7 = self->_privateBrowsingPrivacyProtectionsBanner;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_privateBrowsingPrivacyProtectionsBanner, a3);
    [(BannerController *)self _updateTopBanners];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained bannerController:self didSetPrivateBrowsingPrivacyProtectionsBanner:v9 previousBanner:v7 animated:v4];
  }
}

- (void)_updateTopBanners
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__BannerController__updateTopBanners__block_invoke;
  v8[3] = &unk_1E6D7B7D0;
  id v9 = v3;
  id v4 = v3;
  v5 = (void (**)(void, void))MEMORY[0x1E4E42950](v8);
  ((void (**)(void, SFPinnableBanner *))v5)[2](v5, self->_tabGroupBanner);
  ((void (**)(void, SFPinnableBanner *))v5)[2](v5, self->_crashBanner);
  ((void (**)(void, SFPinnableBanner *))v5)[2](v5, self->_appBanner);
  ((void (**)(void, SFPinnableBanner *))v5)[2](v5, self->_webExtensionBanner);
  ((void (**)(void, SFPinnableBanner *))v5)[2](v5, self->_webExtensionPermissionGrantedBanner);
  ((void (**)(void, SFPinnableBanner *))v5)[2](v5, self->_remotelyEnabledExtensionBanner);
  ((void (**)(void, SFPinnableBanner *))v5)[2](v5, self->_privateBrowsingPrivacyProtectionsBanner);
  [v4 sortWithOptions:16 usingComparator:&__block_literal_global_35];
  v6 = (NSArray *)[v4 copy];
  topBanners = self->_topBanners;
  self->_topBanners = v6;
}

void __37__BannerController__updateTopBanners__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v6 = v3;
    char v5 = [v3 isHidden];
    id v4 = v6;
    if ((v5 & 1) == 0)
    {
      [*(id *)(a1 + 32) addObject:v6];
      id v4 = v6;
    }
  }
}

uint64_t __37__BannerController__updateTopBanners__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v6 = [v4 separableFromStatusBar];
  int v7 = [v5 separableFromStatusBar];
  if (v6 && !v7) {
    goto LABEL_3;
  }
  if ((v6 | v7 ^ 1) != 1)
  {
    uint64_t v8 = -1;
    goto LABEL_9;
  }
  int v9 = [v4 isPinnedToTop];
  unsigned int v10 = [v5 isPinnedToTop];
  if (((v9 ^ 1) & 1) != 0 || v10) {
    uint64_t v8 = (uint64_t)((unint64_t)((v9 ^ 1) & v10) << 63) >> 63;
  }
  else {
LABEL_3:
  }
    uint64_t v8 = 1;
LABEL_9:

  return v8;
}

- (NSArray)topBannersSeparableFromStatusBar
{
  unint64_t v3 = [(BannerController *)self indexOfFirstBannerSeparableFromStatusBar];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    unint64_t v5 = v3;
    int v6 = self->_topBanners;
    id v4 = -[NSArray subarrayWithRange:](v6, "subarrayWithRange:", v5, [(NSArray *)v6 count] - v5);
  }
  return (NSArray *)v4;
}

- (NSArray)topBannersAnchoredToStatusBar
{
  unint64_t v3 = [(BannerController *)self indexOfFirstBannerSeparableFromStatusBar];
  if (v3)
  {
    if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v4 = self->_topBanners;
    }
    else
    {
      -[NSArray subarrayWithRange:](self->_topBanners, "subarrayWithRange:", 0, v3);
      id v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v4 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v4;
}

uint64_t __60__BannerController_indexOfFirstBannerSeparableFromStatusBar__block_invoke(uint64_t a1, void *a2)
{
  return [a2 separableFromStatusBar];
}

- (SFPinnableBanner)appBanner
{
  return self->_appBanner;
}

- (SFPinnableBanner)webExtensionBanner
{
  return self->_webExtensionBanner;
}

- (SFPinnableBanner)remotelyEnabledExtensionBanner
{
  return self->_remotelyEnabledExtensionBanner;
}

- (SFPinnableBanner)webExtensionPermissionGrantedBanner
{
  return self->_webExtensionPermissionGrantedBanner;
}

- (SFPinnableBanner)privateBrowsingPrivacyProtectionsBanner
{
  return self->_privateBrowsingPrivacyProtectionsBanner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topBanners, 0);
  objc_storeStrong((id *)&self->_tabGroupBanner, 0);
  objc_storeStrong((id *)&self->_privateBrowsingPrivacyProtectionsBanner, 0);
  objc_storeStrong((id *)&self->_webExtensionPermissionGrantedBanner, 0);
  objc_storeStrong((id *)&self->_remotelyEnabledExtensionBanner, 0);
  objc_storeStrong((id *)&self->_webExtensionBanner, 0);
  objc_storeStrong((id *)&self->_crashBanner, 0);
  objc_storeStrong((id *)&self->_appBanner, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end