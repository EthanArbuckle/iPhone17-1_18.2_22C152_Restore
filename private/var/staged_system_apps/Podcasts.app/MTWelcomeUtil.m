@interface MTWelcomeUtil
+ (BOOL)carPlayShouldShowWelcome;
+ (BOOL)presentWelcomeIfNeededFromViewController:(id)a3 metricsSender:(id)a4 acknowledgementCompletionBlock:(id)a5;
+ (BOOL)shouldShowWelcome;
+ (BOOL)shouldShowWelcomeIgnoringNewFeatures:(BOOL)a3;
+ (Class)welcomeViewControllerClass;
+ (void)markWelcomeAsShown;
@end

@implementation MTWelcomeUtil

+ (BOOL)presentWelcomeIfNeededFromViewController:(id)a3 metricsSender:(id)a4 acknowledgementCompletionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([a1 shouldShowWelcome])
  {
    v11 = [v8 presentedViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [v8 presentedViewController];
    }
    else
    {
      v12 = 0;
    }

    v14 = [v12 viewControllers];
    v15 = [v14 firstObject];
    v16 = v15;
    if (v15)
    {
      id v17 = v15;
    }
    else
    {
      id v17 = [v8 presentedViewController];
    }
    v18 = v17;

    [a1 welcomeViewControllerClass];
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) == 0)
    {
      v20 = [[MTWelcomeViewController alloc] initWithMetricsSender:v9];
      [(MTWelcomeViewController *)v20 setModalPresentationStyle:2];
      [(MTWelcomeViewController *)v20 setTransitioningDelegate:v20];
      objc_initWeak(&location, v20);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1001672B0;
      v22[3] = &unk_100553460;
      id v23 = v10;
      objc_copyWeak(&v24, &location);
      [(MTWelcomeViewController *)v20 addAcknowledgementCompletionBlock:v22];
      [v8 presentViewController:v20 animated:1 completion:0];
      objc_destroyWeak(&v24);

      objc_destroyWeak(&location);
    }
    char v13 = isKindOfClass ^ 1;
  }
  else
  {
    char v13 = 0;
  }

  return v13 & 1;
}

+ (BOOL)shouldShowWelcomeIgnoringNewFeatures:(BOOL)a3
{
  v4 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
  unsigned __int8 v5 = [v4 BOOLForKey:@"SuppressWelcomeScreen"];

  v6 = +[NSUserDefaults standardUserDefaults];
  unsigned int v7 = [v6 BOOLForKey:@"SuppressWelcomeScreen"];

  if ((v5 & 1) != 0 || v7)
  {
    v11 = _MTLogCategoryPrivacy();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412290;
      CFStringRef v23 = @"SuppressWelcomeScreen";
      v15 = "shouldShowWelcome = NO. Reason: %@ = YES";
      v16 = v11;
      uint32_t v17 = 12;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v22, v17);
    }
  }
  else
  {
    id v8 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
    id v9 = [v8 objectForKey:@"MTWelcomeVersion"];
    id v10 = [v9 integerValue];

    if (!a3 && v10 != (id)qword_1005F59C8)
    {
      v11 = _MTLogCategoryPrivacy();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138412546;
        CFStringRef v23 = @"MTWelcomeVersion";
        __int16 v24 = 2048;
        id v25 = v10;
        v12 = "shouldShowWelcome = YES. Reason: %@ = %ld";
        char v13 = v11;
        uint32_t v14 = 22;
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v22, v14);
      }
LABEL_19:
      BOOL v18 = 1;
      goto LABEL_20;
    }
    if (+[AMSAcknowledgePrivacyTask acknowledgementNeededForPrivacyIdentifier:kMTPodcastsPrivacyIdentifier])
    {
      v11 = _MTLogCategoryPrivacy();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      int v22 = 138412290;
      CFStringRef v23 = @"YES";
      v12 = "shouldShowWelcome = YES. Reason: +[AMSAcknowledgePrivacyTask acknowledgementNeededForPrivacyIdentifier:kMTPo"
            "dcastsPrivacyIdentifier] = %@";
LABEL_17:
      char v13 = v11;
      uint32_t v14 = 12;
      goto LABEL_18;
    }
    unsigned int v19 = +[MTPrivacyUtil shouldShowPodcastsTermsScreen];
    v11 = _MTLogCategoryPrivacy();
    BOOL v20 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v19)
    {
      if (!v20) {
        goto LABEL_19;
      }
      int v22 = 138412290;
      CFStringRef v23 = @"YES";
      v12 = "shouldShowWelcome = YES. Reason: +[MTPrivacyUtil shouldShowPodcastsTermsScreen] = %@";
      goto LABEL_17;
    }
    if (v20)
    {
      LOWORD(v22) = 0;
      v15 = "shouldShowWelcome = NO. Reason: Fell through all the checks.";
      v16 = v11;
      uint32_t v17 = 2;
      goto LABEL_9;
    }
  }
  BOOL v18 = 0;
LABEL_20:

  return v18;
}

+ (BOOL)shouldShowWelcome
{
  return _[a1 shouldShowWelcomeIgnoringNewFeatures:0];
}

+ (BOOL)carPlayShouldShowWelcome
{
  return _[a1 shouldShowWelcomeIgnoringNewFeatures:1];
}

+ (void)markWelcomeAsShown
{
  id v3 = objc_alloc((Class)AMSAcknowledgePrivacyTask);
  id v4 = [v3 initWithPrivacyIdentifier:kMTPodcastsPrivacyIdentifier];
  unsigned __int8 v5 = [v4 acknowledgePrivacy];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100167010;
  v6[3] = &unk_100553438;
  v6[4] = a1;
  [v5 addFinishBlock:v6];
}

+ (Class)welcomeViewControllerClass
{
  return (Class)objc_opt_class();
}

@end