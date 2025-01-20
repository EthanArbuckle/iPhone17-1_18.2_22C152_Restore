@interface RouteLibraryOfflineDownloadStateView
- (MapDataSubscriptionInfo)subscriptionInfo;
- (RouteLibraryOfflineDownloadStateView)initWithFrame:(CGRect)a3;
- (void)_updateIfNeeded;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setSubscriptionInfo:(id)a3;
@end

@implementation RouteLibraryOfflineDownloadStateView

- (RouteLibraryOfflineDownloadStateView)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)RouteLibraryOfflineDownloadStateView;
  v3 = -[RouteLibraryOfflineDownloadStateView initWithFrame:](&v19, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    imageView = v3->_imageView;
    v3->_imageView = v4;

    [(UIImageView *)v3->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = +[UIImage systemImageNamed:@"arrow.down.circle.fill"];
    [(UIImageView *)v3->_imageView setImage:v6];

    [(UIImageView *)v3->_imageView setContentMode:1];
    v7 = +[UIColor tertiaryLabelColor];
    [(UIImageView *)v3->_imageView setTintColor:v7];

    v8 = +[UIImageSymbolConfiguration configurationWithPointSize:7 weight:13.0];
    [(UIImageView *)v3->_imageView setPreferredSymbolConfiguration:v8];

    [(UIImageView *)v3->_imageView setHidden:1];
    [(RouteLibraryOfflineDownloadStateView *)v3 addSubview:v3->_imageView];
    v9 = (MUCircleProgressObservingView *)objc_alloc_init((Class)MUCircleProgressObservingView);
    progressView = v3->_progressView;
    v3->_progressView = v9;

    [(MUCircleProgressObservingView *)v3->_progressView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MUCircleProgressObservingView *)v3->_progressView setHidden:1];
    LODWORD(v11) = 1132068864;
    [(MUCircleProgressObservingView *)v3->_progressView setContentCompressionResistancePriority:0 forAxis:v11];
    LODWORD(v12) = 1132068864;
    [(MUCircleProgressObservingView *)v3->_progressView setContentCompressionResistancePriority:1 forAxis:v12];
    [(RouteLibraryOfflineDownloadStateView *)v3 addSubview:v3->_progressView];
    LODWORD(v13) = 1148846080;
    v14 = [(UIImageView *)v3->_imageView _maps_constraintsEqualToEdgesOfView:v3 priority:v13];
    v15 = [v14 allConstraints];
    +[NSLayoutConstraint activateConstraints:v15];

    v16 = -[MUCircleProgressObservingView _maps_constraintsForCenteringInView:edgeInsets:](v3->_progressView, "_maps_constraintsForCenteringInView:edgeInsets:", v3, 1.0, 1.0, 1.0, 1.0);
    +[NSLayoutConstraint activateConstraints:v16];

    v17 = v3;
  }

  return v3;
}

- (void)dealloc
{
  if (self->_subscriptionInfo)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v3 = [&off_1013ADD58 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(&off_1013ADD58);
          }
          [(MapDataSubscriptionInfo *)self->_subscriptionInfo removeObserver:self forKeyPath:*(void *)(*((void *)&v8 + 1) + 8 * (void)v6) context:off_1015E91D8];
          v6 = (char *)v6 + 1;
        }
        while (v4 != v6);
        id v4 = [&off_1013ADD58 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)RouteLibraryOfflineDownloadStateView;
  [(RouteLibraryOfflineDownloadStateView *)&v7 dealloc];
}

- (void)setSubscriptionInfo:(id)a3
{
  uint64_t v5 = (MapDataSubscriptionInfo *)a3;
  p_subscriptionInfo = &self->_subscriptionInfo;
  subscriptionInfo = self->_subscriptionInfo;
  if (subscriptionInfo != v5)
  {
    if (subscriptionInfo)
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v8 = [&off_1013ADD58 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v21;
        do
        {
          long long v11 = 0;
          do
          {
            if (*(void *)v21 != v10) {
              objc_enumerationMutation(&off_1013ADD58);
            }
            [(MapDataSubscriptionInfo *)*p_subscriptionInfo removeObserver:self forKeyPath:*(void *)(*((void *)&v20 + 1) + 8 * (void)v11) context:off_1015E91D8];
            long long v11 = (char *)v11 + 1;
          }
          while (v9 != v11);
          id v9 = [&off_1013ADD58 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v9);
      }
    }
    objc_storeStrong((id *)&self->_subscriptionInfo, a3);
    if (*p_subscriptionInfo)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v12 = [&off_1013ADD58 countByEnumeratingWithState:&v16 objects:v24 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v17;
        do
        {
          v15 = 0;
          do
          {
            if (*(void *)v17 != v14) {
              objc_enumerationMutation(&off_1013ADD58);
            }
            [(MapDataSubscriptionInfo *)*p_subscriptionInfo addObserver:self forKeyPath:*(void *)(*((void *)&v16 + 1) + 8 * (void)v15) options:0 context:off_1015E91D8];
            v15 = (char *)v15 + 1;
          }
          while (v13 != v15);
          id v13 = [&off_1013ADD58 countByEnumeratingWithState:&v16 objects:v24 count:16];
        }
        while (v13);
      }
    }
    [(RouteLibraryOfflineDownloadStateView *)self _updateIfNeeded];
  }
}

- (void)_updateIfNeeded
{
  subscriptionInfo = self->_subscriptionInfo;
  if (subscriptionInfo)
  {
    id v4 = [(MapDataSubscriptionInfo *)subscriptionInfo state];
    uint64_t v5 = (char *)[v4 loadState];

    if ((unint64_t)(v5 - 1) < 2)
    {
      uint64_t v9 = 0;
      id v15 = 0;
      uint64_t v10 = 0;
LABEL_17:
      [(UIImageView *)self->_imageView setHidden:v9];
      [(MUCircleProgressObservingView *)self->_progressView setProgress:v15];
      [(MUCircleProgressObservingView *)self->_progressView setTintColor:v10];
      [(MUCircleProgressObservingView *)self->_progressView setHidden:v15 == 0];

      return;
    }
    if (v5 == (char *)3 || v5 == 0)
    {
      objc_super v7 = [(MapDataSubscriptionInfo *)self->_subscriptionInfo state];
      unint64_t v8 = (unint64_t)[v7 downloadState];

      uint64_t v9 = 1;
      if (v8 > 5)
      {
        uint64_t v10 = 0;
        id v15 = 0;
        goto LABEL_17;
      }
      if (((1 << v8) & 0x33) != 0)
      {
        id v15 = +[NSProgress progressWithTotalUnitCount:-1];
        uint64_t v10 = +[UIColor systemFillColor];
LABEL_16:
        uint64_t v9 = 1;
        goto LABEL_17;
      }
      uint64_t v10 = 0;
      id v15 = 0;
      if (v8 != 2) {
        goto LABEL_17;
      }
      id v12 = [(MapDataSubscriptionInfo *)self->_subscriptionInfo state];
      id v13 = [v12 downloadProgress];

      if (v13)
      {
        uint64_t v14 = [(MapDataSubscriptionInfo *)self->_subscriptionInfo state];
        id v15 = [v14 downloadProgress];
      }
      else
      {
        id v15 = +[NSProgress progressWithTotalUnitCount:-1];
      }
    }
    else
    {
      id v15 = 0;
    }
    uint64_t v10 = 0;
    goto LABEL_16;
  }
  [(UIImageView *)self->_imageView setHidden:1];
  progressView = self->_progressView;

  [(MUCircleProgressObservingView *)progressView setHidden:1];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1015E91D8 == a6)
  {
    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1006C4594;
    block[3] = &unk_1012E6708;
    objc_copyWeak(&v8, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)RouteLibraryOfflineDownloadStateView;
    -[RouteLibraryOfflineDownloadStateView observeValueForKeyPath:ofObject:change:context:](&v6, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (MapDataSubscriptionInfo)subscriptionInfo
{
  return self->_subscriptionInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionInfo, 0);
  objc_storeStrong((id *)&self->_progressView, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end