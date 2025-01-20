@interface NCCarPlayBannerSource
+ (void)initialize;
- (BOOL)_isPresentableSticky:(id)a3;
- (BOOL)_setSuspended:(BOOL)a3 forReason:(id)a4 revokingCurrent:(BOOL)a5;
- (BOOL)_shouldPresentableBorrowCarPlayScreen:(id)a3;
- (BOOL)isValid;
- (BOOL)postPresentable:(id)a3 options:(unint64_t)a4 userInfo:(id)a5 error:(id *)a6;
- (BOOL)setSuspended:(BOOL)a3 forReason:(id)a4 revokingCurrent:(BOOL)a5 error:(id *)a6;
- (NSTimer)_dismissTimer;
- (NSTimer)_replaceTimer;
- (id)_bannerSource;
- (id)_peekPostedPresentable;
- (id)_postedPresentablesWithIdentification:(id)a3;
- (id)_pullPostedPresentableAtIndex:(unint64_t)a3;
- (id)delegate;
- (id)keyWindowForScreen:(id)a3;
- (id)layoutDescriptionWithError:(id *)a3;
- (id)requesterIdentifier;
- (id)revokeAllPresentablesWithReason:(id)a3 userInfo:(id)a4 error:(id *)a5;
- (id)revokePresentableWithIdentification:(id)a3 reason:(id)a4 animated:(BOOL)a5 userInfo:(id)a6 error:(id *)a7;
- (id)revokePresentableWithRequestIdentifier:(id)a3 reason:(id)a4 animated:(BOOL)a5 userInfo:(id)a6 error:(id *)a7;
- (int64_t)destination;
- (unint64_t)_indexOfPostedPresentable:(id)a3;
- (unint64_t)_postedPresentableCount;
- (void)_allPresentablesDidDisappear;
- (void)_cancelDismissTimer;
- (void)_cancelReplaceTimer;
- (void)_enqueuePostedPresentable:(id)a3;
- (void)_presentableDidDisappear:(id)a3;
- (void)_presentableWithIdentificationDidDisappear:(id)a3;
- (void)_revokePreviouslyPostedPresentableIfPossible;
- (void)_setDismissTimer:(id)a3;
- (void)_setReplaceTimer:(id)a3;
- (void)_startAnnounceDismissalTimer;
- (void)_startDismissTimer;
- (void)_startDismissTimerWithTimeInterval:(double)a3;
- (void)_startReplaceTimer;
- (void)bannerSourceDidInvalidate:(id)a3;
- (void)didBeginAnnounceForNotificationRequest:(id)a3;
- (void)didFinishAnnounceForNotificationRequest:(id)a3;
- (void)invalidate;
- (void)presentableDidAppearAsBanner:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation NCCarPlayBannerSource

+ (void)initialize
{
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    NCRegisterUserNotificationsUILogging();
  }
}

- (int64_t)destination
{
  v2 = [(NCCarPlayBannerSource *)self _bannerSource];
  int64_t v3 = [v2 destination];

  return v3;
}

- (id)requesterIdentifier
{
  v2 = [(NCCarPlayBannerSource *)self _bannerSource];
  int64_t v3 = [v2 requesterIdentifier];

  return v3;
}

- (BOOL)isValid
{
  v2 = [(NCCarPlayBannerSource *)self _bannerSource];
  char v3 = [v2 isValid];

  return v3;
}

- (id)layoutDescriptionWithError:(id *)a3
{
  v4 = [(NCCarPlayBannerSource *)self _bannerSource];
  v5 = [v4 layoutDescriptionWithError:a3];

  return v5;
}

- (BOOL)postPresentable:(id)a3 options:(unint64_t)a4 userInfo:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  if (![(NCCarPlayBannerSource *)self _postedPresentableCount]) {
    [(NCCarPlayBannerSource *)self _setSuspended:0 forReason:@"NCCarPlayBannerSourceSuspensionReasonBannerPresented" revokingCurrent:0];
  }
  unint64_t v12 = *MEMORY[0x1E4F4F5A0] | a4;
  v13 = (void *)[v11 mutableCopy];
  v14 = v13;
  if (v13) {
    id v15 = v13;
  }
  else {
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  v16 = v15;

  [v16 setObject:@"NCCarPlayBannerSourceSuspensionReasonBannerPresented" forKey:*MEMORY[0x1E4F4F5F8]];
  v17 = objc_msgSend(NSNumber, "numberWithBool:", -[NCCarPlayBannerSource _shouldPresentableBorrowCarPlayScreen:](self, "_shouldPresentableBorrowCarPlayScreen:", v10));
  [v16 setObject:v17 forKey:*MEMORY[0x1E4F57F40]];

  id v18 = v16;
  v19 = [(NCCarPlayBannerSource *)self _bannerSource];
  id v23 = 0;
  int v20 = [v19 postPresentable:v10 options:v12 userInfo:v18 error:&v23];
  id v21 = v23;

  if (!v20)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_ERROR))
    {
      -[NCCarPlayBannerSource postPresentable:options:userInfo:error:]();
      if (!a6) {
        goto LABEL_13;
      }
    }
    else if (!a6)
    {
      goto LABEL_13;
    }
    *a6 = v21;
    goto LABEL_13;
  }
  if (objc_opt_respondsToSelector()) {
    [v10 addPresentableObserver:self];
  }
  [(NCCarPlayBannerSource *)self _enqueuePostedPresentable:v10];
  [(NCCarPlayBannerSource *)self _revokePreviouslyPostedPresentableIfPossible];
LABEL_13:

  return v20;
}

- (id)revokePresentableWithRequestIdentifier:(id)a3 reason:(id)a4 animated:(BOOL)a5 userInfo:(id)a6 error:(id *)a7
{
  BOOL v9 = a5;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = [(NCCarPlayBannerSource *)self _bannerSource];
  v16 = [v15 revokePresentableWithRequestIdentifier:v12 reason:v13 animated:v9 userInfo:v14 error:a7];

  if (v16)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v17 = v16;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v24 != v20) {
            objc_enumerationMutation(v17);
          }
          -[NCCarPlayBannerSource _presentableWithIdentificationDidDisappear:](self, "_presentableWithIdentificationDidDisappear:", *(void *)(*((void *)&v23 + 1) + 8 * i), (void)v23);
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v19);
    }
  }

  return v16;
}

- (id)revokeAllPresentablesWithReason:(id)a3 userInfo:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(NCCarPlayBannerSource *)self _bannerSource];
  id v11 = [v10 revokeAllPresentablesWithReason:v9 userInfo:v8 error:a5];

  if (v11) {
    [(NCCarPlayBannerSource *)self _allPresentablesDidDisappear];
  }

  return v11;
}

- (void)invalidate
{
  [(NCCarPlayBannerSource *)self _cancelDismissTimer];
  [(NCCarPlayBannerSource *)self _cancelReplaceTimer];
  bannerSource = self->_bannerSource;
  self->_bannerSource = 0;
}

- (id)revokePresentableWithIdentification:(id)a3 reason:(id)a4 animated:(BOOL)a5 userInfo:(id)a6 error:(id *)a7
{
  BOOL v9 = a5;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = [(NCCarPlayBannerSource *)self _bannerSource];
  v16 = [v15 revokePresentableWithIdentification:v12 reason:v13 animated:v9 userInfo:v14 error:a7];

  if (v16)
  {
    id v25 = v14;
    long long v26 = v16;
    id v27 = v13;
    id v28 = v12;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v17 = v16;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v31 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          long long v23 = -[NCCarPlayBannerSource _postedPresentablesWithIdentification:](self, "_postedPresentablesWithIdentification:", v22, v25, v26, v27, v28);
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __92__NCCarPlayBannerSource_revokePresentableWithIdentification_reason_animated_userInfo_error___block_invoke;
          v29[3] = &unk_1E6A952E8;
          v29[4] = v22;
          v29[5] = self;
          [v23 enumerateObjectsWithOptions:2 usingBlock:v29];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v19);
    }

    id v13 = v27;
    id v12 = v28;
    id v14 = v25;
    v16 = v26;
  }

  return v16;
}

void __92__NCCarPlayBannerSource_revokePresentableWithIdentification_reason_animated_userInfo_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (BNIsPresentableIdentifiedByIdentification()) {
    [*(id *)(a1 + 40) _presentableDidDisappear:v3];
  }
}

- (id)keyWindowForScreen:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    v5 = [(BNBannerSource *)self->_bannerSource keyWindowForScreen:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)setSuspended:(BOOL)a3 forReason:(id)a4 revokingCurrent:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a3;
  id v10 = a4;
  if ([v10 isEqualToString:@"PresentingAlertController"])
  {
    if (v8) {
      [(NCCarPlayBannerSource *)self _cancelDismissTimer];
    }
    else {
      [(NCCarPlayBannerSource *)self _startDismissTimer];
    }
  }
  id v11 = [(NCCarPlayBannerSource *)self _bannerSource];
  char v12 = [v11 setSuspended:v8 forReason:v10 revokingCurrent:v7 error:a6];

  return v12;
}

- (void)presentableDidAppearAsBanner:(id)a3
{
  id v4 = a3;
  [(NCCarPlayBannerSource *)self _cancelDismissTimer];
  BOOL v5 = [(NCCarPlayBannerSource *)self _isPresentableSticky:v4];

  if (v5)
  {
    [(NCCarPlayBannerSource *)self _setSuspended:1 forReason:@"NCCarPlayBannerSourceSuspensionReasonSticky" revokingCurrent:0];
  }
  else
  {
    [(NCCarPlayBannerSource *)self _startDismissTimer];
    [(NCCarPlayBannerSource *)self _startReplaceTimer];
  }
}

- (void)bannerSourceDidInvalidate:(id)a3
{
  bannerSource = self->_bannerSource;
  self->_bannerSource = 0;
}

- (id)_bannerSource
{
  bannerSource = self->_bannerSource;
  if (!bannerSource)
  {
    id v4 = (void *)MEMORY[0x1E4F4F5B8];
    BOOL v5 = [MEMORY[0x1E4FB37F0] requesterIdentifier];
    v6 = [v4 bannerSourceForDestination:1 forRequesterIdentifier:v5];
    BOOL v7 = self->_bannerSource;
    self->_bannerSource = v6;

    [(BNBannerSource *)self->_bannerSource setDelegate:self];
    bannerSource = self->_bannerSource;
  }

  return bannerSource;
}

- (BOOL)_isPresentableSticky:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = UNSafeCast();

  if (v4)
  {
    BOOL v5 = [v4 notificationRequest];
    v6 = [v5 options];
    int v7 = [v6 dismissAutomaticallyForCarPlay] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)_shouldPresentableBorrowCarPlayScreen:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = UNSafeCast();

  if (v4)
  {
    BOOL v5 = [v4 notificationRequest];
    char v6 = [v5 isCriticalAlert];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)_setSuspended:(BOOL)a3 forReason:(id)a4 revokingCurrent:(BOOL)a5
{
  id v9 = 0;
  BOOL v5 = [(NCCarPlayBannerSource *)self setSuspended:a3 forReason:a4 revokingCurrent:a5 error:&v9];
  id v6 = v9;
  if (!v5)
  {
    int v7 = *MEMORY[0x1E4FB3750];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_ERROR)) {
      -[NCCarPlayBannerSource _setSuspended:forReason:revokingCurrent:]((uint64_t)v6, v7);
    }
  }

  return v5;
}

- (void)_enqueuePostedPresentable:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    BOOL v5 = self;
    objc_sync_enter(v5);
    postedPresentables = v5->_postedPresentables;
    if (!postedPresentables)
    {
      uint64_t v7 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
      BOOL v8 = v5->_postedPresentables;
      v5->_postedPresentables = (NSPointerArray *)v7;

      postedPresentables = v5->_postedPresentables;
    }
    [(NSPointerArray *)postedPresentables addPointer:v9];
    objc_sync_exit(v5);

    id v4 = v9;
  }
}

- (id)_peekPostedPresentable
{
  v2 = self;
  objc_sync_enter(v2);
  [(NSPointerArray *)v2->_postedPresentables unui_compact];
  if ([(NSPointerArray *)v2->_postedPresentables count])
  {
    id v3 = [(NSPointerArray *)v2->_postedPresentables pointerAtIndex:0];
  }
  else
  {
    id v3 = 0;
  }
  objc_sync_exit(v2);

  return v3;
}

- (id)_postedPresentablesWithIdentification:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = self;
  objc_sync_enter(v6);
  [(NSPointerArray *)v6->_postedPresentables unui_compact];
  for (unint64_t i = 0; i < [(NSPointerArray *)v6->_postedPresentables count]; ++i)
  {
    BOOL v8 = [(NSPointerArray *)v6->_postedPresentables pointerAtIndex:i];
    if (BNIsPresentableIdentifiedByIdentification()) {
      [v5 addObject:v8];
    }
  }
  objc_sync_exit(v6);

  return v5;
}

- (unint64_t)_indexOfPostedPresentable:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  [(NSPointerArray *)v5->_postedPresentables unui_compact];
  for (unint64_t i = 0; i < [(NSPointerArray *)v5->_postedPresentables count]; ++i)
  {
    id v7 = [(NSPointerArray *)v5->_postedPresentables pointerAtIndex:i];

    if (v7 == v4) {
      goto LABEL_6;
    }
  }
  unint64_t i = 0x7FFFFFFFFFFFFFFFLL;
LABEL_6:
  objc_sync_exit(v5);

  return i;
}

- (id)_pullPostedPresentableAtIndex:(unint64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v3 = 0;
  }
  else
  {
    id v5 = self;
    objc_sync_enter(v5);
    [(NSPointerArray *)v5->_postedPresentables unui_compact];
    id v3 = [(NSPointerArray *)v5->_postedPresentables pointerAtIndex:a3];
    [(NSPointerArray *)v5->_postedPresentables removePointerAtIndex:a3];
    if (![(NSPointerArray *)v5->_postedPresentables count])
    {
      postedPresentables = v5->_postedPresentables;
      v5->_postedPresentables = 0;
    }
    objc_sync_exit(v5);
  }

  return v3;
}

- (unint64_t)_postedPresentableCount
{
  v2 = self;
  objc_sync_enter(v2);
  [(NSPointerArray *)v2->_postedPresentables unui_compact];
  unint64_t v3 = [(NSPointerArray *)v2->_postedPresentables count];
  objc_sync_exit(v2);

  return v3;
}

- (void)_presentableDidDisappear:(id)a3
{
  id v8 = a3;
  unint64_t v4 = [(NCCarPlayBannerSource *)self _indexOfPostedPresentable:v8];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v5 = v4;
    if (objc_opt_respondsToSelector()) {
      [v8 removePresentableObserver:self];
    }
    id v6 = [(NCCarPlayBannerSource *)self _peekPostedPresentable];

    id v7 = [(NCCarPlayBannerSource *)self _pullPostedPresentableAtIndex:v5];
    if (v6 == v8)
    {
      [(NCCarPlayBannerSource *)self _setSuspended:0 forReason:@"NCCarPlayBannerSourceSuspensionReasonBannerPresented" revokingCurrent:0];
      if ([(NCCarPlayBannerSource *)self _isPresentableSticky:v8]) {
        [(NCCarPlayBannerSource *)self _setSuspended:0 forReason:@"NCCarPlayBannerSourceSuspensionReasonSticky" revokingCurrent:0];
      }
    }
  }

  MEMORY[0x1F4181820]();
}

- (void)_presentableWithIdentificationDidDisappear:(id)a3
{
  unint64_t v4 = [(NCCarPlayBannerSource *)self _postedPresentablesWithIdentification:a3];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__NCCarPlayBannerSource__presentableWithIdentificationDidDisappear___block_invoke;
  v5[3] = &unk_1E6A95310;
  v5[4] = self;
  [v4 enumerateObjectsWithOptions:2 usingBlock:v5];
}

uint64_t __68__NCCarPlayBannerSource__presentableWithIdentificationDidDisappear___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _presentableDidDisappear:a2];
}

- (void)_allPresentablesDidDisappear
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = [(NSPointerArray *)v2->_postedPresentables allObjects];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__NCCarPlayBannerSource__allPresentablesDidDisappear__block_invoke;
  v4[3] = &unk_1E6A95310;
  v4[4] = v2;
  [v3 enumerateObjectsWithOptions:2 usingBlock:v4];

  objc_sync_exit(v2);
}

uint64_t __53__NCCarPlayBannerSource__allPresentablesDidDisappear__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _presentableDidDisappear:a2];
}

- (void)_startDismissTimer
{
}

- (void)_startDismissTimerWithTimeInterval:(double)a3
{
  if (!self->_dismissTimer)
  {
    objc_initWeak(&location, self);
    unint64_t v5 = (void *)MEMORY[0x1E4F1CB00];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60__NCCarPlayBannerSource__startDismissTimerWithTimeInterval___block_invoke;
    v8[3] = &unk_1E6A938E8;
    objc_copyWeak(&v9, &location);
    id v6 = [v5 scheduledTimerWithTimeInterval:0 repeats:v8 block:a3];
    dismissTimer = self->_dismissTimer;
    self->_dismissTimer = v6;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __60__NCCarPlayBannerSource__startDismissTimerWithTimeInterval___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained _dismissTimer];

  if (v5 == v3) {
    [WeakRetained _setDismissTimer:0];
  }
  id v6 = [WeakRetained _peekPostedPresentable];
  if (v6)
  {
    id v7 = [MEMORY[0x1E4F4F5E8] uniqueIdentificationForPresentable:v6];
    id v10 = 0;
    id v8 = [WeakRetained revokePresentableWithIdentification:v7 reason:@"NCCarPlayBannerRevocationReasonAutomaticDismissal" animated:1 userInfo:0 error:&v10];
    id v9 = v10;

    if (!v8 && os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_ERROR)) {
      __60__NCCarPlayBannerSource__startDismissTimerWithTimeInterval___block_invoke_cold_1();
    }
  }
}

- (void)_cancelDismissTimer
{
  [(NSTimer *)self->_dismissTimer invalidate];
  dismissTimer = self->_dismissTimer;
  self->_dismissTimer = 0;
}

- (void)_revokePreviouslyPostedPresentableIfPossible
{
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_5(&dword_1D7C04000, v0, v1, "Error attempting to revoke presentable: presentable: %{public}@; error: %{public}@");
}

- (void)_startReplaceTimer
{
  if (!self->_replaceTimer)
  {
    objc_initWeak(&location, self);
    id v3 = (void *)MEMORY[0x1E4F1CB00];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __43__NCCarPlayBannerSource__startReplaceTimer__block_invoke;
    v6[3] = &unk_1E6A938E8;
    objc_copyWeak(&v7, &location);
    unint64_t v4 = [v3 scheduledTimerWithTimeInterval:0 repeats:v6 block:4.0];
    replaceTimer = self->_replaceTimer;
    self->_replaceTimer = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __43__NCCarPlayBannerSource__startReplaceTimer__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [WeakRetained _replaceTimer];

  if (v4 == v3)
  {
    [WeakRetained _setReplaceTimer:0];
    [WeakRetained _revokePreviouslyPostedPresentableIfPossible];
  }
}

- (void)_cancelReplaceTimer
{
  [(NSTimer *)self->_replaceTimer invalidate];
  replaceTimer = self->_replaceTimer;
  self->_replaceTimer = 0;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSTimer)_dismissTimer
{
  return self->_dismissTimer;
}

- (void)_setDismissTimer:(id)a3
{
}

- (NSTimer)_replaceTimer
{
  return self->_replaceTimer;
}

- (void)_setReplaceTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replaceTimer, 0);
  objc_storeStrong((id *)&self->_dismissTimer, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_postedPresentables, 0);

  objc_storeStrong((id *)&self->_bannerSource, 0);
}

- (void)didBeginAnnounceForNotificationRequest:(id)a3
{
  [(NCCarPlayBannerSource *)self _cancelReplaceTimer];

  [(NCCarPlayBannerSource *)self _cancelDismissTimer];
}

- (void)didFinishAnnounceForNotificationRequest:(id)a3
{
  id v4 = [(NCCarPlayBannerSource *)self _peekPostedPresentable];
  if (v4)
  {
    id v6 = v4;
    BOOL v5 = [(NCCarPlayBannerSource *)self _isPresentableSticky:v4];
    id v4 = v6;
    if (!v5)
    {
      [(NCCarPlayBannerSource *)self _startReplaceTimer];
      [(NCCarPlayBannerSource *)self _cancelDismissTimer];
      [(NCCarPlayBannerSource *)self _startAnnounceDismissalTimer];
      id v4 = v6;
    }
  }
}

- (void)_startAnnounceDismissalTimer
{
}

- (void)postPresentable:options:userInfo:error:.cold.1()
{
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_5(&dword_1D7C04000, v0, v1, "Error attempting to post presentable: presentable: %{public}@; error: %{public}@");
}

- (void)_setSuspended:(uint64_t)a1 forReason:(NSObject *)a2 revokingCurrent:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D7C04000, a2, OS_LOG_TYPE_ERROR, "Error attempting to suspend: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __60__NCCarPlayBannerSource__startDismissTimerWithTimeInterval___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_5(&dword_1D7C04000, v0, v1, "Error attempting to revoke posted presentable: presentable: %{public}@; error: %{public}@");
}

@end