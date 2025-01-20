@interface SHUDBannerManager
- (BNBannerSource)bannerSource;
- (BOOL)bannerDismissed;
- (NSDictionary)bannerUserInfo;
- (OS_dispatch_source)dismissalTimer;
- (SHUDBannerManager)init;
- (SHUDBannerPresentable)bannerPresentable;
- (id)bannerButtonDidTap;
- (id)bannerDidDismissHandler;
- (void)cancelDismissalTimer;
- (void)dismissBanner;
- (void)postBannerWithModel:(id)a3;
- (void)setBannerButtonDidTap:(id)a3;
- (void)setBannerDidDismissHandler:(id)a3;
- (void)setBannerDismissed:(BOOL)a3;
- (void)setBannerPresentable:(id)a3;
- (void)setBannerUserInfo:(id)a3;
- (void)setDismissalTimer:(id)a3;
- (void)setUpDismissalTimer;
@end

@implementation SHUDBannerManager

- (SHUDBannerManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)SHUDBannerManager;
  v2 = [(SHUDBannerManager *)&v8 init];
  uint64_t v3 = +[BNBannerSource bannerSourceForDestination:0 forRequesterIdentifier:@"com.apple.Sharing.SharingHUDService"];
  bannerSource = v2->_bannerSource;
  v2->_bannerSource = (BNBannerSource *)v3;

  uint64_t v9 = kSBUIPresentableSystemApertureSupportingUserInfoKey;
  v10 = &__kCFBooleanTrue;
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  bannerUserInfo = v2->_bannerUserInfo;
  v2->_bannerUserInfo = (NSDictionary *)v5;

  return v2;
}

- (void)postBannerWithModel:(id)a3
{
  id v4 = a3;
  if ([v4 type]) {
    goto LABEL_5;
  }
  uint64_t v5 = [(SHUDBannerManager *)self bannerPresentable];
  v6 = [v5 model];
  if ([v6 type] || objc_msgSend(v4, "needsUpdate"))
  {

LABEL_5:
    v7 = sharingHUDLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v8 = +[SFHUDBannerModel descriptionForType:](SFHUDBannerModel, "descriptionForType:", [v4 type]);
      *(_DWORD *)buf = 138412290;
      v63 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Showing banner of type %@", buf, 0xCu);
    }
    uint64_t v9 = [[SHUDBannerPresentable alloc] initWithModel:v4];
    id location = 0;
    objc_initWeak(&location, self);
    [(SHUDBannerManager *)self setBannerDismissed:0];
    id v10 = [v4 type];
    if (v10)
    {
      if (v10 == (id)1)
      {
        v57[0] = _NSConcreteStackBlock;
        v57[1] = 3221225472;
        v57[2] = sub_100005058;
        v57[3] = &unk_1000143F8;
        objc_copyWeak(&v58, &location);
        v11 = [(SHUDBannerPresentable *)v9 bannerViewController];
        [v11 setViewDidAppearHandler:v57];

        objc_destroyWeak(&v58);
      }
      else
      {
        v13 = sharingHUDLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = +[SFHUDBannerModel descriptionForType:](SFHUDBannerModel, "descriptionForType:", [v4 type]);
          *(_DWORD *)buf = 138412290;
          v63 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Banner type is not handled: %@", buf, 0xCu);
        }
      }
    }
    else if (([v4 needsUpdate] & 1) == 0)
    {
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472;
      v59[2] = sub_100005018;
      v59[3] = &unk_1000143F8;
      objc_copyWeak(&v60, &location);
      v12 = [(SHUDBannerPresentable *)v9 bannerViewController];
      [v12 setViewDidAppearHandler:v59];

      objc_destroyWeak(&v60);
    }
    v15 = [(SHUDBannerPresentable *)v9 bannerViewController];
    [v15 setViewDidDisappearHandler:&stru_100014438];

    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_100005100;
    v54[3] = &unk_100014460;
    objc_copyWeak(&v56, &location);
    id v16 = v4;
    id v55 = v16;
    v17 = [(SHUDBannerPresentable *)v9 bannerViewController];
    [v17 setButtonTapped:v54];

    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_10000519C;
    v51[3] = &unk_1000144B0;
    v51[4] = self;
    objc_copyWeak(&v53, &location);
    id v18 = v16;
    id v52 = v18;
    [(SHUDBannerPresentable *)v9 setBannerDidDisappearHandler:v51];
    v19 = [(SHUDBannerPresentable *)v9 bannerViewController];
    [v19 loadViewIfNeeded];

    if (_os_feature_enabled_impl())
    {
      v20 = +[UIScreen mainScreen];
      [v20 bounds];
      double v22 = v21;

      v23 = [(SHUDBannerPresentable *)v9 bannerViewController];
      v24 = [v23 contentSizeProvidingView];
      [v24 intrinsicContentSize];
      double v26 = v25;
      double v28 = v27;

      v29 = [(SHUDBannerPresentable *)v9 bannerViewController];
      v30 = v29;
      double v31 = v22 * 0.8;
      if (v22 * 0.8 <= v26) {
        double v31 = v26;
      }
      objc_msgSend(v29, "setPreferredContentSize:", v31, v28);
    }
    else
    {
      v30 = [(SHUDBannerPresentable *)v9 bannerViewController];
      v32 = [v30 contentSizeProvidingView];
      [v32 intrinsicContentSize];
      double v34 = v33;
      double v36 = v35;
      v37 = [(SHUDBannerPresentable *)v9 bannerViewController];
      objc_msgSend(v37, "setPreferredContentSize:", v34, v36);
    }
    [(SHUDBannerManager *)self setBannerPresentable:v9];
    v38 = [(SHUDBannerManager *)self bannerSource];
    v39 = [(SHUDBannerManager *)self bannerUserInfo];
    id v50 = 0;
    [v38 postPresentable:v9 options:1 userInfo:v39 error:&v50];
    id v40 = v50;

    if (v40)
    {
      v41 = sharingHUDLog();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        v42 = +[SFHUDBannerModel descriptionForType:](SFHUDBannerModel, "descriptionForType:", [v18 type]);
        sub_10000BB84(v42, (uint64_t)v40, buf, v41);
      }
    }
    objc_destroyWeak(&v53);

    objc_destroyWeak(&v56);
    objc_destroyWeak(&location);
    goto LABEL_25;
  }
  v43 = [(SHUDBannerManager *)self bannerPresentable];
  v44 = [v43 model];
  unsigned int v45 = [v44 needsUpdate];

  if (!v45) {
    goto LABEL_5;
  }
  v46 = sharingHUDLog();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Updating paired unlock banner", buf, 2u);
  }

  v47 = [(SHUDBannerManager *)self bannerPresentable];
  uint64_t v9 = [v47 bannerViewController];

  [(SHUDBannerPresentable *)v9 setNeedsUpdate:0];
  v48 = [(SHUDBannerManager *)self bannerPresentable];
  v49 = [v48 bannerViewController];
  [v49 updateUI];

  [(SHUDBannerManager *)self setUpDismissalTimer];
LABEL_25:
}

- (void)dismissBanner
{
  uint64_t v3 = [(SHUDBannerManager *)self bannerPresentable];
  id v4 = [v3 model];
  id v5 = [v4 type];

  v6 = sharingHUDLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = +[SFHUDBannerModel descriptionForType:v5];
    *(_DWORD *)buf = 138412290;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Dismissing banner of type %@", buf, 0xCu);
  }
  [(SHUDBannerManager *)self setBannerDismissed:1];
  objc_super v8 = [(SHUDBannerManager *)self bannerSource];
  uint64_t v9 = +[SHUDBannerPresentable requestIdentifier];
  id v13 = 0;
  id v10 = [v8 revokePresentableWithRequestIdentifier:v9 reason:@"SHUDBannerDismissedReason" animated:1 userInfo:&__NSDictionary0__struct error:&v13];
  id v11 = v13;

  if (v11)
  {
    v12 = sharingHUDLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10000BC8C((uint64_t)v5);
    }
  }
}

- (void)setUpDismissalTimer
{
  dispatch_time_t v3 = dispatch_time(0, 4000000000);
  id v4 = [(SHUDBannerManager *)self dismissalTimer];

  if (v4)
  {
    id v5 = [(SHUDBannerManager *)self dismissalTimer];
    dispatch_source_set_timer(v5, v3, 0xFFFFFFFFFFFFFFFFLL, 0);

    v6 = sharingHUDLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "Dismissal timer already exists";
      objc_super v8 = v6;
      uint32_t v9 = 2;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
    }
  }
  else
  {
    dispatch_source_t v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
    [(SHUDBannerManager *)self setDismissalTimer:v10];

    id v11 = [(SHUDBannerManager *)self dismissalTimer];

    if (v11)
    {
      v12 = [(SHUDBannerManager *)self dismissalTimer];
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_1000059C8;
      handler[3] = &unk_1000144D8;
      handler[4] = self;
      dispatch_source_set_event_handler(v12, handler);

      id v13 = [(SHUDBannerManager *)self dismissalTimer];
      dispatch_source_set_timer(v13, v3, 0xFFFFFFFFFFFFFFFFLL, 0);

      v14 = [(SHUDBannerManager *)self dismissalTimer];
      dispatch_resume(v14);

      v6 = sharingHUDLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v17 = 0x4010000000000000;
        v7 = "Restarting dismissal timer with timout of %f sec";
        objc_super v8 = v6;
        uint32_t v9 = 12;
        goto LABEL_7;
      }
    }
    else
    {
      v6 = sharingHUDLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10000BD28(v6);
      }
    }
  }
}

- (void)cancelDismissalTimer
{
  dispatch_time_t v3 = [(SHUDBannerManager *)self dismissalTimer];

  if (v3)
  {
    id v4 = [(SHUDBannerManager *)self dismissalTimer];
    dispatch_source_cancel(v4);

    id v5 = sharingHUDLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Dismissal timer cancelled", v6, 2u);
    }
  }
}

- (id)bannerDidDismissHandler
{
  return self->_bannerDidDismissHandler;
}

- (void)setBannerDidDismissHandler:(id)a3
{
}

- (id)bannerButtonDidTap
{
  return self->_bannerButtonDidTap;
}

- (void)setBannerButtonDidTap:(id)a3
{
}

- (BNBannerSource)bannerSource
{
  return self->_bannerSource;
}

- (SHUDBannerPresentable)bannerPresentable
{
  return self->_bannerPresentable;
}

- (void)setBannerPresentable:(id)a3
{
}

- (OS_dispatch_source)dismissalTimer
{
  return self->_dismissalTimer;
}

- (void)setDismissalTimer:(id)a3
{
}

- (BOOL)bannerDismissed
{
  return self->_bannerDismissed;
}

- (void)setBannerDismissed:(BOOL)a3
{
  self->_bannerDismissed = a3;
}

- (NSDictionary)bannerUserInfo
{
  return self->_bannerUserInfo;
}

- (void)setBannerUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerUserInfo, 0);
  objc_storeStrong((id *)&self->_dismissalTimer, 0);
  objc_storeStrong((id *)&self->_bannerPresentable, 0);
  objc_storeStrong((id *)&self->_bannerSource, 0);
  objc_storeStrong(&self->_bannerButtonDidTap, 0);
  objc_storeStrong(&self->_bannerDidDismissHandler, 0);
}

@end