@interface VUIDownloadButtonActionHandler
- (BOOL)_shouldShowRenewalOption;
- (BOOL)ignoreDownloadActionIfInRetailDemoMode;
- (UIView)parentView;
- (UIViewController)presentingViewController;
- (VUIAlertController)deleteConfirmationAlertController;
- (VUIDownloadButtonActionHandler)initWithViewModel:(id)a3;
- (VUIDownloadButtonViewModel)viewModel;
- (id)_localize:(id)a3 token:(id)a4 value:(id)a5;
- (id)_renewalAlertAction;
- (id)acknowledgementDownloadCancelledBlock;
- (id)acknowledgementDownloadDeletedBlock;
- (id)presentAlertBlock;
- (id)topPresentedViewController;
- (void)_askUserAndDeleteIfNeeded;
- (void)_checkForAccountSignInWithCompletionHandler:(id)a3;
- (void)_dismissConfirmationAlertController;
- (void)_handleAppDidEnterBackgroundNotification:(id)a3;
- (void)_presentSeasonsDownloadList;
- (void)_showDownloadingInfoDialog;
- (void)_startDownloadIfPossibleRemovingFromUIOnCancellationOrFailure:(BOOL)a3 prefer3DOrImmersiveDownload:(BOOL)a4;
- (void)performAction:(BOOL)a3 confirmBeforeStopDownloading:(BOOL)a4;
- (void)performAction:(BOOL)a3 confirmBeforeStopDownloading:(BOOL)a4 prefer3DOrImmersiveDownload:(BOOL)a5;
- (void)setAcknowledgementDownloadCancelledBlock:(id)a3;
- (void)setAcknowledgementDownloadDeletedBlock:(id)a3;
- (void)setDeleteConfirmationAlertController:(id)a3;
- (void)setParentView:(id)a3;
- (void)setPresentAlertBlock:(id)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation VUIDownloadButtonActionHandler

- (VUIDownloadButtonActionHandler)initWithViewModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIDownloadButtonActionHandler;
  v6 = [(VUIDownloadButtonActionHandler *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_viewModel, a3);
  }

  return v7;
}

- (void)performAction:(BOOL)a3 confirmBeforeStopDownloading:(BOOL)a4
{
}

- (void)performAction:(BOOL)a3 confirmBeforeStopDownloading:(BOOL)a4 prefer3DOrImmersiveDownload:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v41[4] = *MEMORY[0x1E4F143B8];
  if (![(VUIDownloadButtonActionHandler *)self ignoreDownloadActionIfInRetailDemoMode])
  {
    if (a3)
    {
      objc_super v9 = @"LibraryButton_Download";
    }
    else
    {
      v10 = [(VUIDownloadButtonActionHandler *)self viewModel];
      v11 = [v10 videosPlayable];
      uint64_t v12 = [v11 canonicalID];
      v13 = (void *)v12;
      v14 = @"BannerButton_Download";
      if (v12) {
        v14 = (__CFString *)v12;
      }
      objc_super v9 = v14;
    }
    v40[0] = @"actionType";
    v40[1] = @"targetType";
    v41[0] = @"Download";
    v41[1] = @"DownloadButton";
    v41[2] = v9;
    v40[2] = @"targetId";
    v40[3] = @"actionDetails";
    v38 = @"CurrentState";
    v15 = [(VUIDownloadButtonActionHandler *)self viewModel];
    v16 = [v15 downloadStateStringValue];
    v39 = v16;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    v41[3] = v17;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:4];

    v19 = [(VUIDownloadButtonActionHandler *)self viewModel];
    v20 = [v19 locationPosition];

    if (v20)
    {
      v21 = (void *)[v18 mutableCopy];
      [v21 setObject:v20 forKeyedSubscript:@"locationPosition"];
      uint64_t v22 = [v21 copy];

      v18 = (void *)v22;
    }
    v23 = +[VUIMetricsController sharedInstance];
    [v23 recordClick:v18];

    v24 = [(VUIDownloadButtonActionHandler *)self viewModel];
    uint64_t v25 = [v24 downloadType];

    if (v25 == 1)
    {
      v26 = VUIDefaultLogObject();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v37 = 0;
        _os_log_impl(&dword_1E2BD7000, v26, OS_LOG_TYPE_DEFAULT, "Showing seasons list.", v37, 2u);
      }

      [(VUIDownloadButtonActionHandler *)self _presentSeasonsDownloadList];
      goto LABEL_29;
    }
    v27 = [(VUIDownloadButtonActionHandler *)self viewModel];
    uint64_t v28 = [v27 downloadType];

    if (v28 == 2)
    {
      v29 = VUIDefaultLogObject();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
LABEL_28:

        goto LABEL_29;
      }
      *(_WORD *)v37 = 0;
      v30 = "Requested to show episode list but this is an error condition.";
LABEL_16:
      _os_log_impl(&dword_1E2BD7000, v29, OS_LOG_TYPE_DEFAULT, v30, v37, 2u);
      goto LABEL_28;
    }
    v31 = [(VUIDownloadButtonActionHandler *)self viewModel];
    unint64_t v32 = [v31 downloadState];

    if (v32 <= 5)
    {
      if (((1 << v32) & 0x26) == 0)
      {
        if (((1 << v32) & 9) != 0)
        {
          v33 = [(VUIDownloadButtonActionHandler *)self viewModel];
          v34 = [v33 downloadExpirationDate];

          if (v34 && (objc_msgSend(v34, "vui_isInThePast") & 1) != 0) {
            [(VUIDownloadButtonActionHandler *)self _askUserAndDeleteIfNeeded];
          }
          else {
            [(VUIDownloadButtonActionHandler *)self _startDownloadIfPossibleRemovingFromUIOnCancellationOrFailure:1 prefer3DOrImmersiveDownload:v5];
          }

          goto LABEL_29;
        }
        if (!+[VUIUtilities isInRetailDemoMode])
        {
          [(VUIDownloadButtonActionHandler *)self _askUserAndDeleteIfNeeded];
          goto LABEL_29;
        }
        v29 = VUIDefaultLogObject();
        if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_28;
        }
        *(_WORD *)v37 = 0;
        v30 = "application running in demo mode so not showing delete menu from download button.";
        goto LABEL_16;
      }
      if (!v6)
      {
        v35 = [(VUIDownloadButtonActionHandler *)self acknowledgementDownloadCancelledBlock];

        if (v35)
        {
          v36 = [(VUIDownloadButtonActionHandler *)self acknowledgementDownloadCancelledBlock];
          v36[2]();
        }
        v29 = [(VUIDownloadButtonActionHandler *)self viewModel];
        [v29 stopDownload];
        goto LABEL_28;
      }
      [(VUIDownloadButtonActionHandler *)self _showDownloadingInfoDialog];
    }
LABEL_29:
  }
}

- (BOOL)ignoreDownloadActionIfInRetailDemoMode
{
  if (+[VUIUtilities isInRetailDemoMode])
  {
    v3 = [(VUIDownloadButtonActionHandler *)self viewModel];
    v4 = [v3 videosPlayable];

    if (v4)
    {
      v4 = [(VUIDownloadButtonActionHandler *)self viewModel];
      BOOL v5 = [v4 videosPlayable];
      BOOL v6 = [v5 channelName];

      uint64_t v7 = [v6 length];
      LOBYTE(v4) = v7 != 0;
      if (v7)
      {
        v8 = +[VUILocalizationManager sharedInstance];
        objc_super v9 = [v8 localizedStringForKey:@"TV.StoreDemo.DownloadAlertTitle"];
        v10 = [(VUIDownloadButtonActionHandler *)self _localize:v9 token:@"channel" value:v6];

        v11 = +[VUILocalizationManager sharedInstance];
        uint64_t v12 = [v11 localizedStringForKey:@"TV.StoreDemo.DownloadAlertDescription"];
        v13 = [(VUIDownloadButtonActionHandler *)self _localize:v12 token:@"channel" value:v6];

        v14 = +[VUIAlertController vui_alertControllerWithTitle:v10 message:v13 preferredStyle:1];
        v15 = +[VUILocalizationManager sharedInstance];
        v16 = [v15 localizedStringForKey:@"OK"];
        v17 = +[VUIAlertAction vui_actionWithTitle:v16 style:1 handler:0];

        objc_msgSend(v14, "vui_addAction:", v17);
        v18 = +[VUIApplicationRouter topPresentedViewController];
        [v18 presentViewController:v14 animated:1 completion:0];
      }
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

- (void)_askUserAndDeleteIfNeeded
{
  v3 = +[VUIAlertController vui_alertControllerWithTitle:&stru_1F3E921E0 message:&stru_1F3E921E0 preferredStyle:0];
  int v4 = [MEMORY[0x1E4FB3C90] isPad];
  BOOL v5 = @"REMOVE_DOWNLOAD_ALERT_TITLE_IPHONE";
  if (v4) {
    BOOL v5 = @"REMOVE_DOWNLOAD_ALERT_TITLE_IPAD";
  }
  BOOL v6 = v5;
  uint64_t v7 = +[VUILocalizationManager sharedInstance];
  v54 = [v7 localizedStringForKey:v6];

  v8 = +[VUILocalizationManager sharedInstance];
  objc_super v9 = [v8 localizedStringForKey:@"CANCEL"];
  uint64_t v10 = +[VUIAlertAction vui_actionWithTitle:v9 style:1 handler:0];

  v53 = (void *)v10;
  objc_msgSend(v3, "vui_addAction:", v10);
  objc_initWeak(&location, self);
  if ([(VUIDownloadButtonActionHandler *)self _shouldShowRenewalOption])
  {
    v11 = [(VUIDownloadButtonActionHandler *)self viewModel];
    uint64_t v12 = [v11 downloadExpirationDate];

    if (!v12)
    {
LABEL_22:

      goto LABEL_23;
    }
    if (objc_msgSend(v12, "vui_isInThePast"))
    {
      if ([MEMORY[0x1E4FB3C90] isVision])
      {
        v13 = @"DOWNLOAD_RENEW_TO_KEEP_THIS_DOWNLOAD_MESSAGE_VISION_PRO";
      }
      else
      {
        int v20 = [MEMORY[0x1E4FB3C90] isPad];
        v13 = @"DOWNLOAD_RENEW_TO_KEEP_THIS_DOWNLOAD_MESSAGE_IPHONE";
        if (v20) {
          v13 = @"DOWNLOAD_RENEW_TO_KEEP_THIS_DOWNLOAD_MESSAGE_IPAD";
        }
      }
      v19 = v13;

      v21 = [(VUIDownloadButtonActionHandler *)self viewModel];
      v15 = [v21 brandName];

      uint64_t v22 = NSString;
      v23 = +[VUILocalizationManager sharedInstance];
      v24 = [v23 localizedStringForKey:v19];
      uint64_t v25 = [v22 stringWithValidatedFormat:v24, @"%@", 0, v15 validFormatSpecifiers error];

      v18 = [(VUIDownloadButtonActionHandler *)self _renewalAlertAction];
      objc_msgSend(v3, "vui_addAction:", v18);
      v54 = (void *)v25;
    }
    else
    {
      v14 = [(VUIDownloadButtonActionHandler *)self viewModel];
      v15 = [v14 brandID];

      if (![v15 length])
      {
LABEL_21:

        goto LABEL_22;
      }
      v16 = +[VUIFeaturesConfiguration sharedInstance];
      v17 = [v16 downloadConfig];
      v18 = [v17 blacklistedEarlyRenewalBrands];

      if (v18 && ([v18 containsObject:v15] & 1) != 0)
      {
        v19 = v6;
      }
      else
      {
        if ([MEMORY[0x1E4FB3C90] isVision])
        {
          v26 = @"DOWNLOAD_RENEW_TO_KEEP_THIS_DOWNLOAD_MESSAGE_VISION_PRO";
        }
        else
        {
          int v27 = [MEMORY[0x1E4FB3C90] isPad];
          v26 = @"DOWNLOAD_RENEW_TO_KEEP_THIS_DOWNLOAD_MESSAGE_IPHONE";
          if (v27) {
            v26 = @"DOWNLOAD_RENEW_TO_KEEP_THIS_DOWNLOAD_MESSAGE_IPAD";
          }
        }
        v19 = v26;

        uint64_t v28 = [(VUIDownloadButtonActionHandler *)self viewModel];
        v52 = [v28 brandName];

        v29 = NSString;
        v30 = +[VUILocalizationManager sharedInstance];
        v31 = [v30 localizedStringForKey:v19];
        uint64_t v32 = [v29 stringWithValidatedFormat:v31, @"%@", 0, v52 validFormatSpecifiers error];

        v33 = [(VUIDownloadButtonActionHandler *)self _renewalAlertAction];
        objc_msgSend(v3, "vui_addAction:", v33);

        v54 = (void *)v32;
      }
    }

    BOOL v6 = v19;
    goto LABEL_21;
  }
LABEL_23:
  v34 = +[VUILocalizationManager sharedInstance];
  v35 = [v34 localizedStringForKey:@"REMOVE_DOWNLOAD"];
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __59__VUIDownloadButtonActionHandler__askUserAndDeleteIfNeeded__block_invoke;
  v55[3] = &unk_1E6DFA338;
  objc_copyWeak(&v56, &location);
  v36 = +[VUIAlertAction vui_actionWithTitle:v35 style:2 handler:v55];

  objc_msgSend(v3, "vui_addAction:", v36);
  [v3 setVuiTitle:v54];
  v37 = [(VUIDownloadButtonActionHandler *)self parentView];
  [v37 bounds];
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  v46 = [v3 popoverPresentationController];
  [v46 setSourceView:v37];
  objc_msgSend(v46, "setSourceRect:", v39, v41, v43, v45);
  v47 = [MEMORY[0x1E4FB1618] colorWithDynamicProvider:&__block_literal_global_152];
  [v46 setBackgroundColor:v47];
  [v46 setPermittedArrowDirections:15];
  v48 = [(VUIDownloadButtonActionHandler *)self topPresentedViewController];
  [(VUIDownloadButtonActionHandler *)self setDeleteConfirmationAlertController:v3];
  v49 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v49 addObserver:self selector:sel__handleAppDidEnterBackgroundNotification_ name:*MEMORY[0x1E4FB3D78] object:0];

  if (_os_feature_enabled_impl()
    && ([(VUIDownloadButtonActionHandler *)self presentAlertBlock],
        v50 = objc_claimAutoreleasedReturnValue(),
        v50,
        v50))
  {
    v51 = [(VUIDownloadButtonActionHandler *)self presentAlertBlock];
    ((void (**)(void, void *))v51)[2](v51, v3);
  }
  else
  {
    objc_msgSend(v3, "vui_presentAlertFromPresentingController:animated:completion:", v48, 1, 0);
  }

  objc_destroyWeak(&v56);
  objc_destroyWeak(&location);
}

void __59__VUIDownloadButtonActionHandler__askUserAndDeleteIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    v2 = [WeakRetained acknowledgementDownloadDeletedBlock];

    if (v2)
    {
      v3 = [v5 acknowledgementDownloadDeletedBlock];
      v3[2]();
    }
    int v4 = [v5 viewModel];
    [v4 deleteDownload];

    id WeakRetained = v5;
  }
}

id __59__VUIDownloadButtonActionHandler__askUserAndDeleteIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2) {
    [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  }
  else {
  v2 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  }
  return v2;
}

- (void)_showDownloadingInfoDialog
{
  objc_initWeak(&location, self);
  v3 = +[VUILocalizationManager sharedInstance];
  int v4 = [v3 localizedStringForKey:@"DOWNLOADING"];

  id v5 = +[VUIAlertController vui_alertControllerWithTitle:v4 message:&stru_1F3E921E0 preferredStyle:1];
  BOOL v6 = +[VUILocalizationManager sharedInstance];
  uint64_t v7 = [v6 localizedStringForKey:@"REMOVE_DOWNLOAD"];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __60__VUIDownloadButtonActionHandler__showDownloadingInfoDialog__block_invoke;
  v17 = &unk_1E6DFA338;
  objc_copyWeak(&v18, &location);
  v8 = +[VUIAlertAction vui_actionWithTitle:v7 style:2 handler:&v14];

  objc_msgSend(v5, "vui_addAction:", v8, v14, v15, v16, v17);
  objc_super v9 = +[VUILocalizationManager sharedInstance];
  uint64_t v10 = [v9 localizedStringForKey:@"CANCEL"];
  v11 = +[VUIAlertAction vui_actionWithTitle:v10 style:1 handler:0];

  objc_msgSend(v5, "vui_addAction:", v11);
  if (_os_feature_enabled_impl()
    && ([(VUIDownloadButtonActionHandler *)self presentAlertBlock],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        v12))
  {
    v13 = [(VUIDownloadButtonActionHandler *)self presentAlertBlock];
    ((void (**)(void, void *))v13)[2](v13, v5);
  }
  else
  {
    v13 = [(VUIDownloadButtonActionHandler *)self topPresentedViewController];
    objc_msgSend(v5, "vui_presentAlertFromPresentingController:animated:completion:", v13, 1, 0);
  }

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __60__VUIDownloadButtonActionHandler__showDownloadingInfoDialog__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    v2 = [WeakRetained acknowledgementDownloadDeletedBlock];

    if (v2)
    {
      v3 = [v5 acknowledgementDownloadDeletedBlock];
      v3[2]();
    }
    int v4 = [v5 viewModel];
    [v4 deleteDownload];

    id WeakRetained = v5;
  }
}

- (id)_renewalAlertAction
{
  v3 = [(VUIDownloadButtonActionHandler *)self viewModel];
  int v4 = [v3 allowsManualDownloadRenewal];

  id v5 = +[VUILocalizationManager sharedInstance];
  BOOL v6 = v5;
  if (v4) {
    uint64_t v7 = @"RENEW_DOWNLOAD";
  }
  else {
    uint64_t v7 = @"DOWNLOAD_AGAIN_BUTTON_TITLE";
  }
  v8 = [v5 localizedStringForKey:v7];

  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__VUIDownloadButtonActionHandler__renewalAlertAction__block_invoke;
  v11[3] = &unk_1E6DFD0D8;
  objc_copyWeak(&v12, &location);
  char v13 = v4;
  objc_super v9 = +[VUIAlertAction vui_actionWithTitle:v8 style:0 handler:v11];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v9;
}

void __53__VUIDownloadButtonActionHandler__renewalAlertAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    if (*(unsigned char *)(a1 + 40))
    {
      v3 = [WeakRetained viewModel];
      [v3 fetchNewKeysForDownloadedVideo];
    }
    else
    {
      [WeakRetained _startDownloadIfPossibleRemovingFromUIOnCancellationOrFailure:0 prefer3DOrImmersiveDownload:1];
    }
    id WeakRetained = v4;
  }
}

- (BOOL)_shouldShowRenewalOption
{
  v2 = [(VUIDownloadButtonActionHandler *)self viewModel];
  int v3 = [v2 renewsOfflineKeysAutomatically];
  id v4 = [v2 downloadExpirationDate];
  id v5 = [v2 availabilityEndDate];
  if (v4)
  {
    int v6 = objc_msgSend(v4, "vui_isInThePast");
    if (!v3) {
      goto LABEL_6;
    }
  }
  else
  {
    int v6 = 0;
    if (!v3) {
      goto LABEL_6;
    }
  }
  if (!v6)
  {
LABEL_9:
    BOOL v7 = 0;
    goto LABEL_10;
  }
LABEL_6:
  if (v5 && !objc_msgSend(v5, "vui_isInTheFuture")) {
    goto LABEL_9;
  }
  BOOL v7 = 1;
LABEL_10:

  return v7;
}

- (void)_startDownloadIfPossibleRemovingFromUIOnCancellationOrFailure:(BOOL)a3 prefer3DOrImmersiveDownload:(BOOL)a4
{
  BOOL v7 = [(VUIDownloadButtonActionHandler *)self presentingViewController];
  if (v7) {
    goto LABEL_4;
  }
  v8 = +[VUIInterfaceFactory sharedInstance];
  BOOL v7 = [v8 controllerPresenter];

  if (v7) {
    goto LABEL_4;
  }
  objc_super v9 = +[VUITVAppLauncher sharedInstance];
  uint64_t v10 = [v9 appController];

  BOOL v7 = [v10 navigationController];

  if (v7)
  {
LABEL_4:
    objc_initWeak(&location, self);
    v11 = [(VUIDownloadButtonActionHandler *)self viewModel];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __124__VUIDownloadButtonActionHandler__startDownloadIfPossibleRemovingFromUIOnCancellationOrFailure_prefer3DOrImmersiveDownload___block_invoke;
    v12[3] = &unk_1E6DFD100;
    objc_copyWeak(&v13, &location);
    BOOL v14 = a3;
    BOOL v15 = a4;
    [v11 preflightPresentingViewController:v7 completion:v12];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __124__VUIDownloadButtonActionHandler__startDownloadIfPossibleRemovingFromUIOnCancellationOrFailure_prefer3DOrImmersiveDownload___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2)
  {
    id v10 = WeakRetained;
    objc_super v9 = [WeakRetained viewModel];
    [v9 startDownloadAllowingCellular:a3 shouldMarkAsDeletedOnCancellationOrFailure:*(unsigned __int8 *)(a1 + 40) quality:a4 prefer3DOrImmersiveDownload:*(unsigned __int8 *)(a1 + 41)];

    id WeakRetained = v10;
  }
}

- (void)_checkForAccountSignInWithCompletionHandler:(id)a3
{
  int v3 = (void (**)(id, uint64_t))a3;
  if (+[VUIAuthenticationManager userHasActiveAccount])
  {
    v3[2](v3, 1);
  }
  else
  {
    id v4 = VUIDefaultLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "User not logged in, asking to Auth before downloading", buf, 2u);
    }

    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __78__VUIDownloadButtonActionHandler__checkForAccountSignInWithCompletionHandler___block_invoke;
    v5[3] = &unk_1E6DF49E8;
    int v6 = v3;
    +[VUIAuthenticationManager requestAuthenticationAlwaysPrompt:1 withCompletionHandler:v5];
  }
}

void __78__VUIDownloadButtonActionHandler__checkForAccountSignInWithCompletionHandler___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  v2 = __78__VUIDownloadButtonActionHandler__checkForAccountSignInWithCompletionHandler___block_invoke_2;
  int v3 = &unk_1E6DF3DD0;
  id v4 = *(id *)(a1 + 32);
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v2((uint64_t)block);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __78__VUIDownloadButtonActionHandler__checkForAccountSignInWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_presentSeasonsDownloadList
{
  id v9 = [(VUIDownloadButtonActionHandler *)self parentView];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v9;
  }
  else {
    id v3 = 0;
  }
  id v4 = [v3 seasonDownloadDataSourceProvider];
  id v5 = +[VUIInterfaceFactory sharedInstance];
  int v6 = [v5 seasonsControllerCreator];

  if (v4 && v6)
  {
    BOOL v7 = [v6 seasonsDownloadViewControllerWith:v4];
    if (v7)
    {
      v8 = [(VUIDownloadButtonActionHandler *)self topPresentedViewController];
      [v8 presentViewController:v7 animated:1 completion:0];
    }
  }
}

- (void)_handleAppDidEnterBackgroundNotification:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  [v4 removeObserver:self name:*MEMORY[0x1E4FB3D78] object:0];

  [(VUIDownloadButtonActionHandler *)self _dismissConfirmationAlertController];
}

- (void)_dismissConfirmationAlertController
{
  id v3 = [(VUIDownloadButtonActionHandler *)self deleteConfirmationAlertController];

  if (v3)
  {
    id v4 = [(VUIDownloadButtonActionHandler *)self deleteConfirmationAlertController];
    objc_msgSend(v4, "vui_dismissViewControllerAnimated:completion:", 1, 0);

    [(VUIDownloadButtonActionHandler *)self setDeleteConfirmationAlertController:0];
  }
}

- (id)_localize:(id)a3 token:(id)a4 value:(id)a5
{
  BOOL v7 = NSString;
  id v8 = a5;
  id v9 = a3;
  id v10 = [v7 stringWithFormat:@"@@%@@@", a4];
  v11 = [v9 stringByReplacingOccurrencesOfString:v10 withString:v8];

  return v11;
}

- (id)topPresentedViewController
{
  v2 = [(VUIDownloadButtonActionHandler *)self presentingViewController];
  if (!v2)
  {
    v2 = +[VUIApplicationRouter topPresentedViewController];
  }
  return v2;
}

- (VUIDownloadButtonViewModel)viewModel
{
  return self->_viewModel;
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (UIView)parentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentView);
  return (UIView *)WeakRetained;
}

- (void)setParentView:(id)a3
{
}

- (id)acknowledgementDownloadDeletedBlock
{
  return self->_acknowledgementDownloadDeletedBlock;
}

- (void)setAcknowledgementDownloadDeletedBlock:(id)a3
{
}

- (id)presentAlertBlock
{
  return self->_presentAlertBlock;
}

- (void)setPresentAlertBlock:(id)a3
{
}

- (id)acknowledgementDownloadCancelledBlock
{
  return self->_acknowledgementDownloadCancelledBlock;
}

- (void)setAcknowledgementDownloadCancelledBlock:(id)a3
{
}

- (VUIAlertController)deleteConfirmationAlertController
{
  return self->_deleteConfirmationAlertController;
}

- (void)setDeleteConfirmationAlertController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleteConfirmationAlertController, 0);
  objc_storeStrong(&self->_acknowledgementDownloadCancelledBlock, 0);
  objc_storeStrong(&self->_presentAlertBlock, 0);
  objc_storeStrong(&self->_acknowledgementDownloadDeletedBlock, 0);
  objc_destroyWeak((id *)&self->_parentView);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end