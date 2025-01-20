@interface _OfflineMapSubscriptionTwoLinesContentViewModel
- (MUCircleProgressObservingView)progressView;
- (MapDataSubscriptionInfo)subscriptionInfo;
- (_OfflineMapSubscriptionTwoLinesContentViewModel)initWithTitleText:(id)a3 subtitleText:(id)a4 cancelableImageCreationBlock:(id)a5;
- (id)cancelDownloadBlock;
- (id)resumeDownloadBlock;
- (void)_updateModelWithSubscriptionState:(id)a3 pairedDeviceState:(id)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCancelDownloadBlock:(id)a3;
- (void)setProgressView:(id)a3;
- (void)setResumeDownloadBlock:(id)a3;
- (void)setSubscriptionInfo:(id)a3;
@end

@implementation _OfflineMapSubscriptionTwoLinesContentViewModel

- (_OfflineMapSubscriptionTwoLinesContentViewModel)initWithTitleText:(id)a3 subtitleText:(id)a4 cancelableImageCreationBlock:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)_OfflineMapSubscriptionTwoLinesContentViewModel;
  v5 = [(_BasicTwoLinesContentViewModel *)&v11 initWithTitleText:a3 subtitleText:a4 cancelableImageCreationBlock:a5];
  if (v5)
  {
    v6 = (MUCircleProgressObservingView *)objc_alloc_init((Class)MUCircleProgressObservingView);
    progressView = v5->_progressView;
    v5->_progressView = v6;

    v8 = +[UIImageSymbolConfiguration configurationWithPointSize:10.0];
    v9 = +[UIImage systemImageNamed:@"stop.fill" withConfiguration:v8];
    [(MUCircleProgressObservingView *)v5->_progressView setImage:v9];
  }
  return v5;
}

- (void)dealloc
{
  [(_OfflineMapSubscriptionTwoLinesContentViewModel *)self setSubscriptionInfo:0];
  [(_OfflineMapSubscriptionTwoLinesContentViewModel *)self setProgressView:0];
  [(_OfflineMapSubscriptionTwoLinesContentViewModel *)self setCancelDownloadBlock:0];
  [(_OfflineMapSubscriptionTwoLinesContentViewModel *)self setResumeDownloadBlock:0];
  v3.receiver = self;
  v3.super_class = (Class)_OfflineMapSubscriptionTwoLinesContentViewModel;
  [(_BasicTwoLinesContentViewModel *)&v3 dealloc];
}

- (void)setSubscriptionInfo:(id)a3
{
  v5 = (MapDataSubscriptionInfo *)a3;
  p_subscriptionInfo = &self->_subscriptionInfo;
  subscriptionInfo = self->_subscriptionInfo;
  if (subscriptionInfo != v5 && ![(MapDataSubscriptionInfo *)subscriptionInfo isEqual:v5])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    if (qword_101610490 != -1) {
      dispatch_once(&qword_101610490, &stru_101314650);
    }
    id v8 = (id)qword_101610498;
    id v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v25;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(v8);
          }
          [(MapDataSubscriptionInfo *)*p_subscriptionInfo removeObserver:self forKeyPath:*(void *)(*((void *)&v24 + 1) + 8 * i) context:off_1015F2918];
        }
        id v10 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v10);
    }

    objc_storeStrong((id *)&self->_subscriptionInfo, a3);
    v13 = [(MapDataSubscriptionInfo *)*p_subscriptionInfo state];
    v14 = [(MapDataSubscriptionInfo *)*p_subscriptionInfo pairedDeviceState];
    [(_OfflineMapSubscriptionTwoLinesContentViewModel *)self _updateModelWithSubscriptionState:v13 pairedDeviceState:v14];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    if (qword_101610490 != -1) {
      dispatch_once(&qword_101610490, &stru_101314650);
    }
    id v15 = (id)qword_101610498;
    id v16 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v21;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v21 != v18) {
            objc_enumerationMutation(v15);
          }
          -[MapDataSubscriptionInfo addObserver:forKeyPath:options:context:](*p_subscriptionInfo, "addObserver:forKeyPath:options:context:", self, *(void *)(*((void *)&v20 + 1) + 8 * (void)j), 0, off_1015F2918, (void)v20);
        }
        id v17 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v17);
    }
  }
}

- (void)_updateModelWithSubscriptionState:(id)a3 pairedDeviceState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    if (qword_101610488 != -1) {
      dispatch_once(&qword_101610488, &stru_1013145E0);
    }
    id v8 = [v6 downloadProgress];

    if (v8)
    {
      if (![v6 loadState]) {
        goto LABEL_10;
      }
      if ([v6 loadState] == (id)1 || objc_msgSend(v6, "loadState") == (id)3)
      {
        id v9 = [v6 downloadProgress];
        id v10 = [v9 userInfo];
        uint64_t v11 = [v10 objectForKeyedSubscript:GEOMapDataSubscriptionDownloadReasonKey];

        if (v11)
        {
          unsigned int v12 = [v11 isEqualToString:GEOMapDataSubscriptionProgressDownloadReasonForcedUpdate];

          if (v12)
          {
LABEL_10:
            objc_initWeak(&location, self);
            id v13 = [v6 downloadState];
            if (v13 == (id)1)
            {
              v14 = +[NSBundle mainBundle];
              id v15 = [v14 localizedStringForKey:@"Waiting [subscription cell subtitle]" value:@"localized string not found" table:@"Offline"];

              id v16 = +[UIColor systemFillColor];
            }
            else
            {
              v41 = [v6 downloadProgress];
              id v15 = [v41 localizedAdditionalDescription];

              id v16 = 0;
            }
            v42 = [(_OfflineMapSubscriptionTwoLinesContentViewModel *)self progressView];
            [v42 setTintColor:v16];

            if (v13 == (id)1) {
            v43 = [v6 downloadProgress];
            }
            v44 = [(_OfflineMapSubscriptionTwoLinesContentViewModel *)self progressView];
            [v44 setProgress:v43];

            v63[0] = _NSConcreteStackBlock;
            v63[1] = 3221225472;
            v63[2] = sub_100A13D40;
            v63[3] = &unk_1012E6708;
            objc_copyWeak(&v64, &location);
            v45 = [(_OfflineMapSubscriptionTwoLinesContentViewModel *)self progressView];
            [v45 setPrimaryAction:v63];

            id v46 = objc_alloc((Class)UICellAccessoryCustomView);
            v47 = [(_OfflineMapSubscriptionTwoLinesContentViewModel *)self progressView];
            id v48 = [v46 initWithCustomView:v47 placement:1];

            id v69 = v48;
            v49 = +[NSArray arrayWithObjects:&v69 count:1];
            [(_BasicTwoLinesContentViewModel *)self setCellAccessories:v49];

            objc_destroyWeak(&v64);
            objc_destroyWeak(&location);
            goto LABEL_45;
          }
        }
      }
    }
    if (![v6 loadState] || objc_msgSend(v6, "loadState") == (id)3)
    {
      objc_initWeak(&location, self);
      if ([v6 loadState] == (id)3)
      {
        id v17 = +[NSBundle mainBundle];
        [v17 localizedStringForKey:@"Update required [subscription cell subtitle]" value:@"localized string not found" table:@"Offline"];
      }
      else
      {
        id v17 = +[NSBundle mainBundle];
        [v17 localizedStringForKey:@"Download offline map [subscription cell subtitle]" value:@"localized string not found" table:@"Offline"];
      uint64_t v18 = };

      id v19 = [v6 downloadState];
      if (v19 == (id)5)
      {
        if (MGGetBoolAnswer())
        {
          long long v20 = +[NSBundle mainBundle];
          [v20 localizedStringForKey:@"Waiting for WLAN [subscription cell subtitle]" value:@"localized string not found" table:@"Offline"];
        }
        else
        {
          long long v20 = +[NSBundle mainBundle];
          [v20 localizedStringForKey:@"Waiting for Wi-Fi [subscription cell subtitle]" value:@"localized string not found" table:@"Offline"];
        uint64_t v21 = };
      }
      else if (v19 == (id)4)
      {
        long long v20 = +[NSBundle mainBundle];
        uint64_t v21 = [v20 localizedStringForKey:@"Failed [subscription cell subtitle]" value:@"localized string not found" table:@"Offline"];
      }
      else
      {
        if (v19 != (id)3)
        {
          id v15 = v18;
LABEL_44:
          v61[0] = _NSConcreteStackBlock;
          v61[1] = 3221225472;
          v61[2] = sub_100A13DC0;
          v61[3] = &unk_1012E8CD0;
          objc_copyWeak(&v62, &location);
          v52 = +[UIAction actionWithHandler:v61];
          v53 = +[UIButton buttonWithType:0 primaryAction:v52];

          v54 = +[UIImageSymbolConfiguration configurationWithPointSize:30.0];
          v55 = +[UIImage systemImageNamed:@"arrow.down.circle" withConfiguration:v54];
          [v53 setImage:v55 forState:0];

          id v56 = [objc_alloc((Class)UICellAccessoryCustomView) initWithCustomView:v53 placement:1];
          id v68 = v56;
          v57 = +[NSArray arrayWithObjects:&v68 count:1];
          [(_BasicTwoLinesContentViewModel *)self setCellAccessories:v57];

          objc_destroyWeak(&v62);
          objc_destroyWeak(&location);
LABEL_45:
          long long v24 = 0;
          goto LABEL_46;
        }
        long long v20 = +[NSBundle mainBundle];
        uint64_t v21 = [v20 localizedStringForKey:@"Paused [subscription cell subtitle]" value:@"localized string not found" table:@"Offline"];
      }
      id v15 = (void *)v21;

      goto LABEL_44;
    }
    objc_msgSend((id)qword_101610480, "stringFromByteCount:", objc_msgSend(v6, "downloadedDataSize"));
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    int IsEnabled_StandaloneWatchOffline = MapsFeature_IsEnabled_StandaloneWatchOffline();
    long long v24 = 0;
    if (v7)
    {
      id v15 = v22;
      if (!IsEnabled_StandaloneWatchOffline)
      {
LABEL_41:
        id v50 = objc_alloc_init((Class)UICellAccessoryDisclosureIndicator);
        id v66 = v50;
        v51 = +[NSArray arrayWithObjects:&v66 count:1];
        [(_BasicTwoLinesContentViewModel *)self setCellAccessories:v51];

LABEL_46:
        [(_BasicTwoLinesContentViewModel *)self setSubtitleText:v15];
        [(_BasicTwoLinesContentViewModel *)self setAttributedSubtitleText:v24];

        goto LABEL_47;
      }
      id v25 = [v7 loadState];
      if (v25 == (id)3 || !v25)
      {
        id v26 = [v7 downloadState];
        if ((unint64_t)v26 <= 5)
        {
          if (v26 == (id)2)
          {
            long long v27 = +[NSBundle mainBundle];
            [v27 localizedStringForKey:@"OFFLINE_REGION_CELL_SUBTITLE_PAIRED_DEVICE_STATUS_LOADING" value:@"localized string not found" table:@"Offline"];
          }
          else
          {
            long long v27 = +[NSBundle mainBundle];
            [v27 localizedStringForKey:@"OFFLINE_REGION_CELL_SUBTITLE_PAIRED_DEVICE_STATUS_WAITING" value:@"localized string not found" table:@"Offline"];
          v60 = };

          if (v60)
          {
            id v28 = objc_alloc((Class)NSAttributedString);
            v29 = +[NSBundle mainBundle];
            v30 = [v29 localizedStringForKey:@"OFFLINE_REGION_CELL_SUBTITLE_SEPARATOR" value:@"localized string not found" table:@"Offline"];
            id v58 = [v28 initWithString:v30];

            v59 = +[UIImageSymbolConfiguration configurationWithScale:1];
            id v31 = objc_alloc_init((Class)NSTextAttachment);
            v32 = +[UIImage systemImageNamed:@"arrow.down.applewatch" withConfiguration:v59];
            v33 = [v32 imageWithRenderingMode:2];
            [v31 setImage:v33];

            v34 = +[NSAttributedString attributedStringWithAttachment:v31];
            id v35 = [objc_alloc((Class)NSMutableAttributedString) initWithAttributedString:v34];
            id v36 = [objc_alloc((Class)NSAttributedString) initWithString:@" "];
            [v35 appendAttributedString:v36];

            id v37 = [objc_alloc((Class)NSAttributedString) initWithString:v60];
            [v35 appendAttributedString:v37];

            id v38 = [objc_alloc((Class)NSAttributedString) initWithString:v22];
            v67[0] = v38;
            v67[1] = v35;
            v39 = +[NSArray arrayWithObjects:v67 count:2];
            v40 = +[MKMultiPartAttributedString multiPartAttributedStringWithComponents:v39 repeatedSeparator:v58];

            long long v24 = [v40 attributedString];

            id v15 = 0;
            goto LABEL_41;
          }
        }
      }
      long long v24 = 0;
    }
    id v15 = v22;
    goto LABEL_41;
  }
LABEL_47:
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1015F2918 == a6)
  {
    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100A13F1C;
    block[3] = &unk_1012E6690;
    objc_copyWeak(&v9, &location);
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_OfflineMapSubscriptionTwoLinesContentViewModel;
    -[_OfflineMapSubscriptionTwoLinesContentViewModel observeValueForKeyPath:ofObject:change:context:](&v7, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (MapDataSubscriptionInfo)subscriptionInfo
{
  return self->_subscriptionInfo;
}

- (MUCircleProgressObservingView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
}

- (id)cancelDownloadBlock
{
  return self->_cancelDownloadBlock;
}

- (void)setCancelDownloadBlock:(id)a3
{
}

- (id)resumeDownloadBlock
{
  return self->_resumeDownloadBlock;
}

- (void)setResumeDownloadBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resumeDownloadBlock, 0);
  objc_storeStrong(&self->_cancelDownloadBlock, 0);
  objc_storeStrong((id *)&self->_progressView, 0);

  objc_storeStrong((id *)&self->_subscriptionInfo, 0);
}

@end