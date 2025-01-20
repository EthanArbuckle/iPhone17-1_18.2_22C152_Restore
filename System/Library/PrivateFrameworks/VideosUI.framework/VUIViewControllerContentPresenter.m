@interface VUIViewControllerContentPresenter
- (BOOL)contentHasBeenDeleted;
- (BOOL)contentHasBeenManuallyDeleted;
- (NSString)cloudUpdateFailedMessage;
- (NSString)cloudUpdateFailedTitle;
- (NSString)deletedContentErrorMessage;
- (NSString)loadingMessage;
- (NSString)loadingTitle;
- (NSString)logName;
- (NSString)noContentErrorMessage;
- (NSString)noContentErrorTitle;
- (UIView)contentView;
- (UIView)currentView;
- (UIView)rootView;
- (id)_createAlertViewWithTitle:(id)a3 description:(id)a4;
- (id)_logNameForContentViewType:(unint64_t)a3;
- (unint64_t)currentContentViewType;
- (void)configureCurrentViewFrameForBounds:(CGRect)a3;
- (void)refreshNoContentViewIfNeeded;
- (void)setCloudUpdateFailedMessage:(id)a3;
- (void)setCloudUpdateFailedTitle:(id)a3;
- (void)setContentHasBeenDeleted:(BOOL)a3;
- (void)setContentHasBeenManuallyDeleted:(BOOL)a3;
- (void)setContentView:(id)a3;
- (void)setCurrentContentViewType:(unint64_t)a3;
- (void)setCurrentView:(id)a3;
- (void)setDeletedContentErrorMessage:(id)a3;
- (void)setLoadingMessage:(id)a3;
- (void)setLoadingTitle:(id)a3;
- (void)setLogName:(id)a3;
- (void)setNoContentErrorMessage:(id)a3;
- (void)setNoContentErrorTitle:(id)a3;
- (void)setRootView:(id)a3;
- (void)setRootViewForViewController:(id)a3;
@end

@implementation VUIViewControllerContentPresenter

- (void)setRootViewForViewController:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4FB1EB0];
  id v9 = a3;
  v5 = (UIView *)objc_alloc_init(v4);
  rootView = self->_rootView;
  self->_rootView = v5;

  v7 = self->_rootView;
  v8 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryDynamicBackgroundColor");
  [(UIView *)v7 setBackgroundColor:v8];

  [v9 setView:self->_rootView];
}

- (void)setRootView:(id)a3
{
  objc_storeStrong((id *)&self->_rootView, a3);
  id v5 = a3;
  rootView = self->_rootView;
  objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryDynamicBackgroundColor");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(UIView *)rootView setBackgroundColor:v7];
}

- (void)configureCurrentViewFrameForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = [(VUIViewControllerContentPresenter *)self currentView];
  objc_msgSend(v7, "setFrame:", x, y, width, height);
}

- (void)setCurrentContentViewType:(unint64_t)a3
{
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v6 = __63__VUIViewControllerContentPresenter_setCurrentContentViewType___block_invoke;
  id v7 = &unk_1E6DF6668;
  objc_copyWeak(v8, &location);
  v8[1] = (id)a3;
  v4 = v5;
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v6((uint64_t)v4);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v4);
  }

  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __63__VUIViewControllerContentPresenter_setCurrentContentViewType___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained currentContentViewType];
    uint64_t v5 = *(void *)(a1 + 40);
    v6 = VUIDefaultLogObject();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v4 == v5)
    {
      if (v7)
      {
        v8 = [v3 logName];
        id v9 = [v3 _logNameForContentViewType:*(void *)(a1 + 40)];
        v10 = [v3 currentView];
        *(_DWORD *)buf = 138412802;
        v32 = v8;
        __int16 v33 = 2112;
        v34 = v9;
        __int16 v35 = 2112;
        v36 = v10;
        _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "[%@] - Content view type is not changed. Current type: %@. Current view: %@", buf, 0x20u);
      }
    }
    else
    {
      if (v7)
      {
        v11 = [v3 logName];
        v12 = [v3 _logNameForContentViewType:*(void *)(a1 + 40)];
        *(_DWORD *)buf = 138412546;
        v32 = v11;
        __int16 v33 = 2112;
        v34 = v12;
        _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "[%@] - Setting content view type:%@", buf, 0x16u);
      }
      v6 = [v3 rootView];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      v13 = objc_msgSend(v3, "rootView", 0);
      v14 = [v13 subviews];

      uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v37 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v28 != v17) {
              objc_enumerationMutation(v14);
            }
            [*(id *)(*((void *)&v27 + 1) + 8 * i) removeFromSuperview];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v37 count:16];
        }
        while (v16);
      }

      uint64_t v19 = [v3 currentContentViewType];
      v3[2] = *(void *)(a1 + 40);
      switch([v3 currentContentViewType])
      {
        case 1:
          uint64_t v20 = [v3 loadingMessage];
          v21 = [v3 loadingTitle];
          v22 = [VUILoadingView alloc];
          v23 = -[VUILoadingView initWithFrame:loadingTitle:loadingMessage:](v22, "initWithFrame:loadingTitle:loadingMessage:", v21, v20, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
          [(VUILoadingView *)v23 startTimer];
          goto LABEL_22;
        case 2:
          uint64_t v20 = [v3 noContentErrorTitle];
          uint64_t v24 = [v3 noContentErrorMessage];
          goto LABEL_19;
        case 3:
          v23 = [v3 contentView];
          break;
        case 4:
          uint64_t v20 = [v3 cloudUpdateFailedTitle];
          uint64_t v24 = [v3 cloudUpdateFailedMessage];
LABEL_19:
          v21 = (void *)v24;
          if (v20 | v24)
          {
            v23 = [v3 _createAlertViewWithTitle:v20 description:v24];
          }
          else
          {
            v23 = 0;
          }
LABEL_22:

          break;
        default:
          v23 = 0;
          break;
      }
      BOOL v26 = [v3 currentContentViewType] == 2 && v19 == 3;
      [v3 setContentHasBeenDeleted:v26];
      if (v23) {
        [v6 addSubview:v23];
      }
      [v3 setCurrentView:v23];
    }
  }
}

- (void)refreshNoContentViewIfNeeded
{
  unint64_t v3 = [(VUIViewControllerContentPresenter *)self currentContentViewType];
  uint64_t v4 = [(VUIViewControllerContentPresenter *)self currentView];

  uint64_t v5 = [(VUIViewControllerContentPresenter *)self noContentErrorTitle];
  uint64_t v6 = [(VUIViewControllerContentPresenter *)self noContentErrorMessage];
  if (v3 == 2 && !v4 && v5 | v6)
  {
    objc_initWeak(&location, self);
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    v10 = __65__VUIViewControllerContentPresenter_refreshNoContentViewIfNeeded__block_invoke;
    v11 = &unk_1E6DF3F90;
    objc_copyWeak(&v14, &location);
    id v12 = (id)v5;
    id v13 = (id)v6;
    BOOL v7 = &v8;
    if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v8, v9)) {
      v10((uint64_t)v7);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], v7);
    }

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __65__VUIViewControllerContentPresenter_refreshNoContentViewIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    unint64_t v3 = [WeakRetained _createAlertViewWithTitle:*(void *)(a1 + 32) description:*(void *)(a1 + 40)];
    uint64_t v4 = [v6 rootView];
    uint64_t v5 = v4;
    if (v3) {
      [v4 addSubview:v3];
    }
    [v6 setCurrentView:v3];

    id WeakRetained = v6;
  }
}

- (id)_createAlertViewWithTitle:(id)a3 description:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = objc_alloc_init(VUILibraryAlertView);
  uint64_t v8 = [(VUILibraryAlertView *)v7 titleLabel];
  uint64_t v9 = [v8 textLayout];
  v10 = [(VUILibraryAlertView *)v7 titleLabel];
  id v11 = +[VUILabel labelWithString:v5 textLayout:v9 existingLabel:v10];

  id v12 = [(VUILibraryAlertView *)v7 subtitleLabel];
  id v13 = [v12 textLayout];
  id v14 = [(VUILibraryAlertView *)v7 subtitleLabel];
  id v15 = +[VUILabel labelWithString:v6 textLayout:v13 existingLabel:v14];

  return v7;
}

- (id)_logNameForContentViewType:(unint64_t)a3
{
  if (a3 > 4) {
    return &stru_1F3E921E0;
  }
  else {
    return off_1E6DF6688[a3];
  }
}

- (unint64_t)currentContentViewType
{
  return self->_currentContentViewType;
}

- (UIView)currentView
{
  return self->_currentView;
}

- (void)setCurrentView:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (NSString)noContentErrorTitle
{
  return self->_noContentErrorTitle;
}

- (void)setNoContentErrorTitle:(id)a3
{
}

- (NSString)noContentErrorMessage
{
  return self->_noContentErrorMessage;
}

- (void)setNoContentErrorMessage:(id)a3
{
}

- (NSString)loadingMessage
{
  return self->_loadingMessage;
}

- (void)setLoadingMessage:(id)a3
{
}

- (NSString)loadingTitle
{
  return self->_loadingTitle;
}

- (void)setLoadingTitle:(id)a3
{
}

- (NSString)cloudUpdateFailedTitle
{
  return self->_cloudUpdateFailedTitle;
}

- (void)setCloudUpdateFailedTitle:(id)a3
{
}

- (NSString)cloudUpdateFailedMessage
{
  return self->_cloudUpdateFailedMessage;
}

- (void)setCloudUpdateFailedMessage:(id)a3
{
}

- (BOOL)contentHasBeenDeleted
{
  return self->_contentHasBeenDeleted;
}

- (void)setContentHasBeenDeleted:(BOOL)a3
{
  self->_contentHasBeenDeleted = a3;
}

- (BOOL)contentHasBeenManuallyDeleted
{
  return self->_contentHasBeenManuallyDeleted;
}

- (void)setContentHasBeenManuallyDeleted:(BOOL)a3
{
  self->_contentHasBeenManuallyDeleted = a3;
}

- (NSString)deletedContentErrorMessage
{
  return self->_deletedContentErrorMessage;
}

- (void)setDeletedContentErrorMessage:(id)a3
{
}

- (NSString)logName
{
  return self->_logName;
}

- (void)setLogName:(id)a3
{
}

- (UIView)rootView
{
  return self->_rootView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootView, 0);
  objc_storeStrong((id *)&self->_logName, 0);
  objc_storeStrong((id *)&self->_deletedContentErrorMessage, 0);
  objc_storeStrong((id *)&self->_cloudUpdateFailedMessage, 0);
  objc_storeStrong((id *)&self->_cloudUpdateFailedTitle, 0);
  objc_storeStrong((id *)&self->_loadingTitle, 0);
  objc_storeStrong((id *)&self->_loadingMessage, 0);
  objc_storeStrong((id *)&self->_noContentErrorMessage, 0);
  objc_storeStrong((id *)&self->_noContentErrorTitle, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_currentView, 0);
}

@end