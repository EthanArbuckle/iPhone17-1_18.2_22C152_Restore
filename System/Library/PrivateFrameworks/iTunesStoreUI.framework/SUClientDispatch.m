@interface SUClientDispatch
+ (BOOL)composeReviewWithViewController:(id)a3 animated:(BOOL)a4;
+ (BOOL)enterAccountFlowWithViewController:(id)a3 animated:(BOOL)a4;
+ (BOOL)hidePreviewOverlayAnimated:(BOOL)a3;
+ (BOOL)isTabBarControllerLoaded;
+ (BOOL)matchesClientApplication:(id)a3;
+ (BOOL)presentOverlayBackgroundViewController:(id)a3;
+ (BOOL)sendActionForDialog:(id)a3 button:(id)a4;
+ (BOOL)showPreviewOverlayAnimated:(BOOL)a3;
+ (BOOL)wasLaunchedFromLibrary;
+ (id)clientInterface;
+ (id)exitStoreButtonTitle;
+ (id)imageCache;
+ (id)imagePool;
+ (id)newScriptInterface;
+ (id)overlayBackgroundViewController;
+ (id)overlayConfigurationForStorePage:(id)a3;
+ (id)previewOverlayViewController;
+ (id)scriptExecutionContext;
+ (id)tabBarController;
+ (void)composeEmailWithSubject:(id)a3 body:(id)a4;
+ (void)dismissOverlayBackgroundViewController;
+ (void)setClientBridge:(id)a3;
@end

@implementation SUClientDispatch

+ (id)clientInterface
{
  id v2 = (id)__LegacyBridge;
  if (!__LegacyBridge)
  {
    id v2 = +[SUClient sharedClient];
    if (!v2) {
      id v2 = +[SUClientController sharedController];
    }
  }

  return (id)[v2 clientInterface];
}

+ (void)composeEmailWithSubject:(id)a3 body:(id)a4
{
  v6 = (SUStoreController *)__LegacyBridge;
  if (!__LegacyBridge)
  {
    v6 = +[SUStoreController sharedInstance];
    if (!v6) {
      v6 = +[SUClientController sharedController];
    }
  }

  [(SUStoreController *)v6 composeEmailWithSubject:a3 body:a4];
}

+ (BOOL)composeReviewWithViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (id)__LegacyBridge;
  if (!__LegacyBridge)
  {
    id v6 = +[SUClient sharedClient];
    if (!v6) {
      id v6 = +[SUClientController sharedController];
    }
  }

  return [v6 composeReviewWithViewController:a3 animated:v4];
}

+ (void)dismissOverlayBackgroundViewController
{
  id v2 = (SUStoreController *)__LegacyBridge;
  if (!__LegacyBridge)
  {
    id v2 = +[SUStoreController sharedInstance];
    if (!v2) {
      id v2 = +[SUClientController sharedController];
    }
  }

  [(SUStoreController *)v2 dismissOverlayBackgroundViewController];
}

+ (BOOL)enterAccountFlowWithViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (id)__LegacyBridge;
  if (__LegacyBridge || (id v6 = +[SUClient sharedClient]) != 0)
  {
    return [v6 enterAccountFlowWithViewController:a3 animated:v4];
  }
  else
  {
    id v8 = +[SUClientController sharedController];
    return [v8 presentAccountViewController:a3 animated:v4];
  }
}

+ (id)exitStoreButtonTitle
{
  if (__LegacyBridge) {
    return 0;
  }
  id v2 = +[SUClientApplicationController sharedController];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return (id)[v2 exitStoreButtonTitle];
}

+ (BOOL)hidePreviewOverlayAnimated:(BOOL)a3
{
  uint64_t v3 = __LegacyBridge;
  if (__LegacyBridge) {
    [(id)__LegacyBridge hidePreviewOverlayAnimated:a3];
  }
  return v3 != 0;
}

+ (id)imageCache
{
  id v2 = +[SUClient sharedClient];
  if (!v2) {
    id v2 = +[SUClientController sharedController];
  }

  return (id)[v2 imageCache];
}

+ (id)imagePool
{
  id v2 = +[SUClient sharedClient];
  if (v2)
  {
    return (id)[v2 imagePool];
  }
  else
  {
    id v4 = +[SUClientController sharedController];
    return (id)[v4 imageOperationPool];
  }
}

+ (BOOL)isTabBarControllerLoaded
{
  if (__LegacyBridge) {
    return 1;
  }
  uint64_t v3 = +[SUStoreController sharedInstance];
  if (!v3)
  {
    id v4 = +[SUClientApplicationController sharedController];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
    uint64_t v3 = v4;
  }

  return [(SUStoreController *)v3 isTabBarControllerLoaded];
}

+ (BOOL)matchesClientApplication:(id)a3
{
  if (__LegacyBridge)
  {
    id v4 = (id)[(id)__LegacyBridge clientInterface];
LABEL_3:
    v5 = (void *)[v4 clientIdentifier];
    return [v5 isEqualToString:a3];
  }
  v7 = +[SUStoreController sharedInstance];
  if (!v7)
  {
    id v4 = +[SUClientController sharedController];
    goto LABEL_3;
  }

  return [(SUStoreController *)v7 matchesClientApplication:a3];
}

+ (id)newScriptInterface
{
  if (__LegacyBridge)
  {
    return objc_alloc_init(SUScriptInterface);
  }
  else
  {
    uint64_t v3 = +[SUStoreController sharedInstance];
    if (!v3) {
      uint64_t v3 = +[SUClientController sharedController];
    }
    return [(SUStoreController *)v3 newScriptInterface];
  }
}

+ (id)overlayBackgroundViewController
{
  id v2 = (SUStoreController *)__LegacyBridge;
  if (!__LegacyBridge)
  {
    id v2 = +[SUStoreController sharedInstance];
    if (!v2) {
      id v2 = +[SUClientController sharedController];
    }
  }

  return [(SUStoreController *)v2 overlayBackgroundViewController];
}

+ (id)overlayConfigurationForStorePage:(id)a3
{
  if (__LegacyBridge) {
    return 0;
  }
  v5 = +[SUStoreController sharedInstance];
  if (!v5) {
    v5 = +[SUClientController sharedController];
  }

  return [(SUStoreController *)v5 overlayConfigurationForStorePage:a3];
}

+ (BOOL)presentOverlayBackgroundViewController:(id)a3
{
  id v4 = (SUStoreController *)__LegacyBridge;
  if (!__LegacyBridge)
  {
    id v4 = +[SUStoreController sharedInstance];
    if (!v4) {
      id v4 = +[SUClientController sharedController];
    }
  }

  return [(SUStoreController *)v4 presentOverlayBackgroundViewController:a3];
}

+ (id)previewOverlayViewController
{
  return (id)[(id)__LegacyBridge previewOverlayViewController];
}

+ (id)scriptExecutionContext
{
  if (__LegacyBridge) {
    return 0;
  }
  id v3 = +[SUClient sharedClient];
  if (!v3) {
    id v3 = +[SUClientController sharedController];
  }

  return (id)[v3 scriptExecutionContext];
}

+ (BOOL)sendActionForDialog:(id)a3 button:(id)a4
{
  id v6 = (id)__LegacyBridge;
  if (__LegacyBridge)
  {
LABEL_2:
    return [v6 performActionForDialog:a3 button:a4];
  }
  id v8 = +[SUClient sharedClient];
  if (!v8)
  {
    id v6 = +[SUClientController sharedController];
    goto LABEL_2;
  }

  return [v8 sendActionForDialog:a3 button:a4];
}

+ (void)setClientBridge:(id)a3
{
  if ((id)__LegacyBridge != a3)
  {

    __LegacyBridge = (uint64_t)a3;
  }
}

+ (BOOL)showPreviewOverlayAnimated:(BOOL)a3
{
  uint64_t v3 = __LegacyBridge;
  if (__LegacyBridge) {
    [(id)__LegacyBridge showPreviewOverlayAnimated:a3];
  }
  return v3 != 0;
}

+ (id)tabBarController
{
  id v2 = +[SUStoreController sharedInstance];
  if (!v2)
  {
    uint64_t v3 = +[SUClientApplicationController sharedController];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
    id v2 = v3;
  }

  return [(SUStoreController *)v2 tabBarController];
}

+ (BOOL)wasLaunchedFromLibrary
{
  if (__LegacyBridge) {
    return 0;
  }
  id v2 = +[SUClientApplicationController sharedController];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return [v2 wasLaunchedFromLibrary];
}

@end