@interface UIAddToHomeScreenActivity
+ (unint64_t)_xpcAttributes;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (id)activityViewController;
- (void)prepareWithActivityItems:(id)a3;
@end

@implementation UIAddToHomeScreenActivity

+ (unint64_t)_xpcAttributes
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class()) {
    return 3;
  }
  else {
    return 0;
  }
}

- (id)activityType
{
  return @"com.apple.UIKit.activity.AddToHomeScreen";
}

- (id)activityTitle
{
  uint64_t v2 = _ShareSheetBundle();
  v3 = [v2 localizedStringForKey:@"AddToHomeScreen[Activity]" value:@"Add to Home Screen" table:@"Localizable"];

  return v3;
}

- (id)_systemImageName
{
  return @"plus.app";
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (_ShareSheetIsBrowser())
  {
    if (canPerformWithActivityItems__onceToken != -1) {
      dispatch_once(&canPerformWithActivityItems__onceToken, &__block_literal_global_3);
    }
    if (!canPerformWithActivityItems__addToHomeScreenDisabled)
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      v4 = v3;
      uint64_t v8 = [v4 countByEnumeratingWithState:&v28 objects:v34 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v29;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v29 != v10) {
              objc_enumerationMutation(v4);
            }
            v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            if (objc_opt_respondsToSelector())
            {
              v19 = [v12 URL];
              LOBYTE(v6) = [v19 isHTTPOrHTTPSURL];

              if ((v6 & 1) == 0)
              {
                v20 = share_sheet_log();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1A0AD8000, v20, OS_LOG_TYPE_DEFAULT, "UIAddToHomeScreenActivity: Activity item did not provide an eligible HTTP(S) URL", buf, 2u);
                }
              }
              goto LABEL_11;
            }
          }
          uint64_t v9 = [v4 countByEnumeratingWithState:&v28 objects:v34 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }

      Class v6 = NSClassFromString(&cfstr_Wkwebview.isa);
      if (v6)
      {
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        v13 = v4;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v33 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v25;
LABEL_23:
          uint64_t v17 = 0;
          while (1)
          {
            if (*(void *)v25 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v24 + 1) + 8 * v17);
            if (objc_opt_isKindOfClass()) {
              break;
            }
            if (v15 == ++v17)
            {
              uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v33 count:16];
              if (v15) {
                goto LABEL_23;
              }
              goto LABEL_29;
            }
          }
          v4 = v18;

          if (!v4) {
            goto LABEL_37;
          }
          v21 = [v4 URL];
          char v22 = [v21 isHTTPOrHTTPSURL];

          if (v22)
          {
            LOBYTE(v6) = 1;
            goto LABEL_11;
          }
          v23 = share_sheet_log();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A0AD8000, v23, OS_LOG_TYPE_DEFAULT, "UIAddToHomeScreenActivity: WKWebView is not currently displaying an eligible HTTP(S) URL", buf, 2u);
          }
        }
        else
        {
LABEL_29:

LABEL_37:
          v23 = share_sheet_log();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A0AD8000, v23, OS_LOG_TYPE_DEFAULT, "UIAddToHomeScreenActivity: activityItems array does not contain a WKWebView", buf, 2u);
          }
          v4 = 0;
        }

        goto LABEL_10;
      }
      v4 = share_sheet_log();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      *(_WORD *)buf = 0;
      v5 = "UIAddToHomeScreenActivity: activityItems array cannot contain a WKWebView";
      goto LABEL_9;
    }
    v4 = share_sheet_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v5 = "UIAddToHomeScreenActivity: 'Add to Home Screen' is disabled";
LABEL_9:
      _os_log_impl(&dword_1A0AD8000, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 2u);
    }
  }
  else
  {
    v4 = share_sheet_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v5 = "UIAddToHomeScreenActivity: App does not have the default browser entitlement";
      goto LABEL_9;
    }
  }
LABEL_10:
  LOBYTE(v6) = 0;
LABEL_11:

  return (char)v6;
}

void __57__UIAddToHomeScreenActivity_canPerformWithActivityItems___block_invoke()
{
  id v0 = [(objc_class *)getMCProfileConnectionClass() sharedConnection];
  canPerformWithActivityItems__addToHomeScreenDisabled = [v0 isEphemeralMultiUser];
}

- (void)prepareWithActivityItems:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v37;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v37 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        getWKWebViewClass();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v8 = [v7 URL];
          int v9 = [v8 isHTTPOrHTTPSURL];

          if (v9)
          {
            id location = 0;
            objc_initWeak(&location, self);
            id v18 = objc_alloc(getSFAddToHomeScreenViewControllerClass());
            if (objc_opt_respondsToSelector())
            {
              id v19 = v18;
              v33[0] = MEMORY[0x1E4F143A8];
              v33[1] = 3221225472;
              v33[2] = __54__UIAddToHomeScreenActivity_prepareWithActivityItems___block_invoke;
              v33[3] = &unk_1E5A218B8;
              objc_copyWeak(&v34, &location);
              v20 = (UIViewController *)[v19 initWithWebView:v7 completion:v33];
              addToHomeScreenViewController = self->_addToHomeScreenViewController;
              self->_addToHomeScreenViewController = v20;

              objc_destroyWeak(&v34);
            }

            objc_destroyWeak(&location);
            goto LABEL_28;
          }
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v10 = v3;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v40 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v30;
    while (2)
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void **)(*((void *)&v29 + 1) + 8 * j);
        if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
        {
          id v15 = v14;
          uint64_t v16 = [v15 URL];
          int v17 = [v16 isHTTPOrHTTPSURL];

          if (v17)
          {
            id v22 = objc_alloc(getSFAddToHomeScreenViewControllerClass());
            if (objc_opt_respondsToSelector())
            {
              id location = 0;
              objc_initWeak(&location, self);
              id v23 = v22;
              v27[0] = MEMORY[0x1E4F143A8];
              v27[1] = 3221225472;
              v27[2] = __54__UIAddToHomeScreenActivity_prepareWithActivityItems___block_invoke_2;
              v27[3] = &unk_1E5A218B8;
              objc_copyWeak(&v28, &location);
              long long v24 = (UIViewController *)[v23 initWithAddToHomeScreenActivityItem:v15 completion:v27];
              long long v25 = self->_addToHomeScreenViewController;
              self->_addToHomeScreenViewController = v24;

              objc_destroyWeak(&v28);
              objc_destroyWeak(&location);
            }

            goto LABEL_28;
          }
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v40 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_28:
}

void __54__UIAddToHomeScreenActivity_prepareWithActivityItems___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained activityDidFinish:a2];
}

void __54__UIAddToHomeScreenActivity_prepareWithActivityItems___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained activityDidFinish:a2];
}

- (id)activityViewController
{
  return self->_addToHomeScreenViewController;
}

- (void).cxx_destruct
{
}

@end