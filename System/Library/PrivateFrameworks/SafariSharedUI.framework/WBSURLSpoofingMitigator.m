@interface WBSURLSpoofingMitigator
+ (BOOL)automaticallyNotifiesObserversOfUIShouldReflectCommittedURLInsteadOfCurrentURL;
- (BOOL)UIShouldReflectCommittedURLInsteadOfCurrentURL;
- (int64_t)navigationSource;
- (void)_determineIfPageIsTryingToSpoofAddressFieldWhenInterruptingProvisionalNavigation;
- (void)_setUIShouldReflectCommittedURLInsteadOfCurrentURL:(BOOL)a3;
- (void)_stopTrackingInterruptedProvisionalNavigations;
- (void)didCommitNavigation;
- (void)didFailProvisionalNavigationWithError:(id)a3;
- (void)didStartProvisionalNavigationWithUserInitiatedAction:(id)a3;
- (void)setNavigationSource:(int64_t)a3;
- (void)willStartNewBrowserChromeInitiatedNavigation;
@end

@implementation WBSURLSpoofingMitigator

- (BOOL)UIShouldReflectCommittedURLInsteadOfCurrentURL
{
  return self->_UIShouldReflectCommittedURLInsteadOfCurrentURL;
}

+ (BOOL)automaticallyNotifiesObserversOfUIShouldReflectCommittedURLInsteadOfCurrentURL
{
  return 0;
}

- (void)didStartProvisionalNavigationWithUserInitiatedAction:(id)a3
{
  v5 = (_WKUserInitiatedAction *)a3;
  objc_initWeak(&location, self);
  if (self->_navigationSource)
  {
    if (!v5 || self->_userInitiatedAction != v5)
    {
      objc_storeStrong((id *)&self->_userInitiatedAction, a3);
      if (!self->_userInitiatedAction)
      {
        [(WBSURLSpoofingMitigator *)self _setUIShouldReflectCommittedURLInsteadOfCurrentURL:1];
        goto LABEL_11;
      }
      v6 = (void *)MEMORY[0x1E4F1CB00];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __80__WBSURLSpoofingMitigator_didStartProvisionalNavigationWithUserInitiatedAction___block_invoke_2;
      v14[3] = &unk_1E5E41668;
      v7 = &v15;
      objc_copyWeak(&v15, &location);
      v8 = [v6 timerWithTimeInterval:0 repeats:v14 block:2.0];
      timerForRevertingToCommittedURL = self->_timerForRevertingToCommittedURL;
      self->_timerForRevertingToCommittedURL = v8;

      v10 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      [v10 addTimer:self->_timerForRevertingToCommittedURL forMode:*MEMORY[0x1E4F1C4B0]];
      goto LABEL_9;
    }
  }
  else if (self->_hasCommittedChromeInitiatedLoad && !self->_timerForRevertingToCommittedURL)
  {
    v11 = (void *)MEMORY[0x1E4F1CB00];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __80__WBSURLSpoofingMitigator_didStartProvisionalNavigationWithUserInitiatedAction___block_invoke;
    v16[3] = &unk_1E5E41668;
    v7 = &v17;
    objc_copyWeak(&v17, &location);
    v12 = [v11 timerWithTimeInterval:0 repeats:v16 block:2.0];
    v13 = self->_timerForRevertingToCommittedURL;
    self->_timerForRevertingToCommittedURL = v12;

    v10 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [v10 addTimer:self->_timerForRevertingToCommittedURL forMode:*MEMORY[0x1E4F1C4B0]];
LABEL_9:

    objc_destroyWeak(v7);
  }
LABEL_11:
  objc_destroyWeak(&location);
}

void __80__WBSURLSpoofingMitigator_didStartProvisionalNavigationWithUserInitiatedAction___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setUIShouldReflectCommittedURLInsteadOfCurrentURL:1];
}

void __80__WBSURLSpoofingMitigator_didStartProvisionalNavigationWithUserInitiatedAction___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setUIShouldReflectCommittedURLInsteadOfCurrentURL:1];
}

- (void)didFailProvisionalNavigationWithError:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F46810];
  v9[0] = *MEMORY[0x1E4F289A0];
  v9[1] = v4;
  v10[0] = &unk_1F03420F8;
  v10[1] = &unk_1F0342110;
  v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a3;
  v7 = [v5 dictionaryWithObjects:v10 forKeys:v9 count:2];
  int v8 = objc_msgSend(v6, "safari_matchesErrorDomainsAndCodes:", v7);

  if (v8) {
    [(WBSURLSpoofingMitigator *)self _determineIfPageIsTryingToSpoofAddressFieldWhenInterruptingProvisionalNavigation];
  }
  else {
    [(WBSURLSpoofingMitigator *)self _stopTrackingInterruptedProvisionalNavigations];
  }
}

- (void)didCommitNavigation
{
  if (!self->_navigationSource) {
    self->_hasCommittedChromeInitiatedLoad = 1;
  }
  [(WBSURLSpoofingMitigator *)self _stopTrackingInterruptedProvisionalNavigations];
}

- (void)willStartNewBrowserChromeInitiatedNavigation
{
  self->_hasCommittedChromeInitiatedLoad = 0;
}

- (void)_determineIfPageIsTryingToSpoofAddressFieldWhenInterruptingProvisionalNavigation
{
  v3 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v4 = v3;
  if (self->_dateOfLastSuspiciousProvisionalNavigationInterruption)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    double v6 = v5;
  }
  else
  {
    double v6 = 0.0;
  }
  dateOfLastSuspiciousProvisionalNavigationInterruption = self->_dateOfLastSuspiciousProvisionalNavigationInterruption;
  self->_dateOfLastSuspiciousProvisionalNavigationInterruption = v4;

  unint64_t v8 = self->_recentlyInterruptedNavigationCount + 1;
  self->_recentlyInterruptedNavigationCount = v8;
  if (v8 == 2)
  {
    if (v6 > 30.0)
    {
      [(WBSURLSpoofingMitigator *)self _stopTrackingInterruptedProvisionalNavigations];
    }
  }
  else if (v8 >= 5)
  {
    [(WBSURLSpoofingMitigator *)self _setUIShouldReflectCommittedURLInsteadOfCurrentURL:1];
  }
}

- (void)_stopTrackingInterruptedProvisionalNavigations
{
  dateOfLastSuspiciousProvisionalNavigationInterruption = self->_dateOfLastSuspiciousProvisionalNavigationInterruption;
  self->_dateOfLastSuspiciousProvisionalNavigationInterruption = 0;
  self->_recentlyInterruptedNavigationCount = 0;

  [(WBSURLSpoofingMitigator *)self _setUIShouldReflectCommittedURLInsteadOfCurrentURL:0];
  [(NSTimer *)self->_timerForRevertingToCommittedURL invalidate];
  timerForRevertingToCommittedURL = self->_timerForRevertingToCommittedURL;
  self->_timerForRevertingToCommittedURL = 0;

  userInitiatedAction = self->_userInitiatedAction;
  self->_userInitiatedAction = 0;

  self->_navigationSource = 0;
}

- (void)_setUIShouldReflectCommittedURLInsteadOfCurrentURL:(BOOL)a3
{
  if (self->_UIShouldReflectCommittedURLInsteadOfCurrentURL != a3)
  {
    [(WBSURLSpoofingMitigator *)self willChangeValueForKey:@"UIShouldReflectCommittedURLInsteadOfCurrentURL"];
    self->_UIShouldReflectCommittedURLInsteadOfCurrentURL = a3;
    [(WBSURLSpoofingMitigator *)self didChangeValueForKey:@"UIShouldReflectCommittedURLInsteadOfCurrentURL"];
  }
}

- (int64_t)navigationSource
{
  return self->_navigationSource;
}

- (void)setNavigationSource:(int64_t)a3
{
  self->_navigationSource = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerForRevertingToCommittedURL, 0);
  objc_storeStrong((id *)&self->_userInitiatedAction, 0);
  objc_storeStrong((id *)&self->_dateOfLastSuspiciousProvisionalNavigationInterruption, 0);
}

@end