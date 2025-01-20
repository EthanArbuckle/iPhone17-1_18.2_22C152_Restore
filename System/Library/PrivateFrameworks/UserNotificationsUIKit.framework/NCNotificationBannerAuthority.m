@interface NCNotificationBannerAuthority
+ (NSString)requesterIdentifier;
- (id)delegate;
- (int64_t)shouldOverlapPresentable:(id)a3 withPresentable:(id)a4;
- (int64_t)shouldPresentPresentable:(id)a3 withPresentedPresentables:(id)a4 responsiblePresentable:(id *)a5;
- (void)setDelegate:(id)a3;
@end

@implementation NCNotificationBannerAuthority

+ (NSString)requesterIdentifier
{
  return (NSString *)[MEMORY[0x1E4FB37F0] requesterIdentifier];
}

- (int64_t)shouldPresentPresentable:(id)a3 withPresentedPresentables:(id)a4 responsiblePresentable:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = objc_opt_class();
  id v11 = v8;
  if (v10)
  {
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }
  id v13 = v12;

  if (v13 && ([v13 isStaticContentLoadingComplete] & 1) == 0)
  {
    if (a5) {
      *a5 = v11;
    }
    objc_initWeak(&location, self);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __107__NCNotificationBannerAuthority_shouldPresentPresentable_withPresentedPresentables_responsiblePresentable___block_invoke;
    v16[3] = &unk_1E6A93EC8;
    objc_copyWeak(&v18, &location);
    v16[4] = self;
    id v17 = v11;
    [v17 loadStaticContentWithCompletion:v16];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    int64_t v14 = -1;
  }
  else
  {
    int64_t v14 = 0;
  }

  return v14;
}

void __107__NCNotificationBannerAuthority_shouldPresentPresentable_withPresentedPresentables_responsiblePresentable___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = [WeakRetained delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 bannerAuthority:*(void *)(a1 + 32) mayChangeDecisionForResponsiblePresentable:*(void *)(a1 + 40)];
  }
}

- (int64_t)shouldOverlapPresentable:(id)a3 withPresentable:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4FB37F0] requesterIdentifier];
  id v8 = [v5 requesterIdentifier];
  int v9 = [v8 isEqualToString:v7];

  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      int64_t v10 = 1;
    }
    else
    {
      v12 = [v5 viewController];
      uint64_t v13 = objc_opt_class();
      id v14 = v12;
      if (v13)
      {
        if (objc_opt_isKindOfClass()) {
          v15 = v14;
        }
        else {
          v15 = 0;
        }
      }
      else
      {
        v15 = 0;
      }
      id v16 = v15;

      id v17 = [v16 notificationViewController];

      LODWORD(v16) = [v17 hasCommittedToPresentingCustomContentProvidingViewController];
      int64_t v10 = v16;
    }
  }
  else
  {
    int64_t v10 = 0;
  }

  return v10;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end