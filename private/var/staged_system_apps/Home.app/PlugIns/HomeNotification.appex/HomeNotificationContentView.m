@interface HomeNotificationContentView
+ (BOOL)requiresConstraintBasedLayout;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (HUCameraView)cameraView;
- (HULayeredVisualEffectView)statusBarView;
- (HomeNotificationContent)content;
- (HomeNotificationContentView)initWithContent:(id)a3;
- (HomeNotificationStatusView)statusView;
- (NACancelable)statusTextOverrideCancellationToken;
- (NSArray)constraints;
- (UIActivityIndicatorView)spinner;
- (void)_updateStatusText:(id)a3 accessoryImage:(id)a4 animated:(BOOL)a5;
- (void)dealloc;
- (void)setCameraView:(id)a3;
- (void)setConstraints:(id)a3;
- (void)setContent:(id)a3;
- (void)setContent:(id)a3 animated:(BOOL)a4;
- (void)setSpinner:(id)a3;
- (void)setStatusBarView:(id)a3;
- (void)setStatusTextOverrideCancellationToken:(id)a3;
- (void)setStatusView:(id)a3;
- (void)updateConstraints;
@end

@implementation HomeNotificationContentView

- (HomeNotificationContentView)initWithContent:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)HomeNotificationContentView;
  v5 = [(HomeNotificationContentView *)&v38 init];
  if (v5)
  {
    id v6 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    [(HomeNotificationContentView *)v5 setSpinner:v6];

    v7 = [(HomeNotificationContentView *)v5 spinner];
    [v7 setHidesWhenStopped:1];

    v8 = [(HomeNotificationContentView *)v5 spinner];
    [v8 stopAnimating];

    id v9 = objc_alloc_init((Class)HULayeredVisualEffectView);
    [(HomeNotificationContentView *)v5 setStatusBarView:v9];

    v10 = objc_alloc_init(HomeNotificationStatusView);
    [(HomeNotificationContentView *)v5 setStatusView:v10];

    v11 = [(HomeNotificationContentView *)v5 statusBarView];
    v12 = [v11 contentView];
    v13 = [(HomeNotificationContentView *)v5 statusView];
    [v12 addSubview:v13];

    id v14 = objc_alloc((Class)HUCameraView);
    id v15 = [objc_alloc((Class)HUCameraBadgeView) initWithSize:0];
    id v16 = [v14 initWithBadgeView:v15];
    [(HomeNotificationContentView *)v5 setCameraView:v16];

    v17 = +[UIColor colorWithWhite:0.7 alpha:1.0];
    v18 = [(HomeNotificationContentView *)v5 cameraView];
    [v18 setTintColor:v17];

    v19 = [(HomeNotificationContentView *)v5 cameraView];
    [v19 setBadgeOffset:16.0, 16.0];

    v20 = [(HomeNotificationContentView *)v5 statusBarView];
    v40[0] = v20;
    v21 = [(HomeNotificationContentView *)v5 statusView];
    v40[1] = v21;
    v22 = [(HomeNotificationContentView *)v5 cameraView];
    v40[2] = v22;
    v23 = [(HomeNotificationContentView *)v5 spinner];
    v40[3] = v23;
    v24 = +[NSArray arrayWithObjects:v40 count:4];

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v25 = v24;
    id v26 = [v25 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v35;
      do
      {
        v29 = 0;
        do
        {
          if (*(void *)v35 != v28) {
            objc_enumerationMutation(v25);
          }
          [*(id *)(*((void *)&v34 + 1) + 8 * (void)v29) setTranslatesAutoresizingMaskIntoConstraints:0, (void)v34];
          v29 = (char *)v29 + 1;
        }
        while (v27 != v29);
        id v27 = [v25 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v27);
    }

    v30 = [(HomeNotificationContentView *)v5 cameraView];
    [(HomeNotificationContentView *)v5 addSubview:v30];

    v31 = [(HomeNotificationContentView *)v5 statusBarView];
    [(HomeNotificationContentView *)v5 addSubview:v31];

    v32 = [(HomeNotificationContentView *)v5 spinner];
    [(HomeNotificationContentView *)v5 addSubview:v32];

    [(HomeNotificationContentView *)v5 setContent:v4];
  }

  return v5;
}

- (void)dealloc
{
  v3 = [(HomeNotificationContentView *)self statusTextOverrideCancellationToken];
  [v3 cancel];

  v4.receiver = self;
  v4.super_class = (Class)HomeNotificationContentView;
  [(HomeNotificationContentView *)&v4 dealloc];
}

- (void)setContent:(id)a3
{
}

- (void)setContent:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = (HomeNotificationContent *)a3;
  if (self->_content == v7) {
    goto LABEL_19;
  }
  objc_storeStrong((id *)&self->_content, a3);
  v8 = [(HomeNotificationContentView *)self statusTextOverrideCancellationToken];
  [v8 cancel];

  [(HomeNotificationContentView *)self setStatusTextOverrideCancellationToken:0];
  BOOL v9 = (id)[(HomeNotificationContent *)v7 mode] != (id)1
    && (id)[(HomeNotificationContent *)v7 mode] != (id)2;
  v10 = [(HomeNotificationContent *)v7 cameraSource];
  v11 = [(HomeNotificationContentView *)self cameraView];
  [v11 setCameraSource:v10];

  v12 = [(HomeNotificationContentView *)self cameraView];
  [v12 setHidden:v9];

  id v13 = [(HomeNotificationContent *)v7 statusDisplayStyle];
  if (!v13)
  {
    v18 = [(HomeNotificationContentView *)self statusBarView];
    [v18 setHidden:1];
    goto LABEL_11;
  }
  if (v13 == (id)1)
  {
    v19 = [(HomeNotificationContentView *)self statusBarView];
    [v19 setHidden:0];

    v18 = +[UIBlurEffect effectWithStyle:1];
    v20 = +[HULayeredBackgroundEffect backgroundWithBlurEffect:v18];
    v21 = [(HomeNotificationContentView *)self statusBarView];
    [v21 setBackgroundEffect:v20];

    v22 = +[UIVibrancyEffect effectForBlurEffect:v18];
    v23 = +[HULayeredContentEffect contentWithVibrancyEffect:v22];
    v24 = [(HomeNotificationContentView *)self statusBarView];
    [v24 setContentEffect:v23];

    goto LABEL_11;
  }
  if (v13 == (id)2)
  {
    id v14 = [(HomeNotificationContentView *)self statusBarView];
    [v14 setHidden:0];

    id v15 = +[UIColor hf_keyColor];
    id v16 = +[HULayeredBackgroundEffect backgroundWithFillColor:v15];
    v17 = [(HomeNotificationContentView *)self statusBarView];
    [v17 setBackgroundEffect:v16];

    v18 = [(HomeNotificationContentView *)self statusBarView];
    [v18 setContentEffect:0];
LABEL_11:
  }
  objc_initWeak(&location, self);
  long long v34 = _NSConcreteStackBlock;
  uint64_t v35 = 3221225472;
  long long v36 = sub_10000C7F8;
  long long v37 = &unk_100018CD0;
  objc_copyWeak(&v39, &location);
  id v25 = v7;
  objc_super v38 = v25;
  BOOL v40 = v4;
  id v26 = objc_retainBlock(&v34);
  id v27 = [(HomeNotificationContent *)v25 actionResultText];

  if (v27)
  {
    uint64_t v28 = [(HomeNotificationContent *)v25 actionResultText];
    [(HomeNotificationContentView *)self _updateStatusText:v28 accessoryImage:0 animated:v4];

    v29 = +[NAScheduler mainThreadScheduler];
    v30 = [v29 afterDelay:v26 performBlock:2.0];
    [(HomeNotificationContentView *)self setStatusTextOverrideCancellationToken:v30];
  }
  else
  {
    ((void (*)(void ***))v26[2])(v26);
  }
  v31 = [(HomeNotificationContentView *)self cameraView];
  v32 = [(HomeNotificationContent *)v25 errorContent];
  [v31 setErrorContent:v32 animated:v4];

  if ([(HomeNotificationContent *)v25 mode])
  {
    v33 = [(HomeNotificationContentView *)self spinner];
    [v33 stopAnimating];
  }
  else
  {
    v33 = [(HomeNotificationContentView *)self spinner];
    [v33 startAnimating];
  }

  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);
LABEL_19:
}

- (void)_updateStatusText:(id)a3 accessoryImage:(id)a4 animated:(BOOL)a5
{
  id v7 = a4;
  id v8 = a3;
  BOOL v9 = [(HomeNotificationContentView *)self statusView];
  [v9 setStatusText:v8];

  id v10 = [(HomeNotificationContentView *)self statusView];
  [v10 setAccessoryImage:v7];
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (void)updateConstraints
{
  v3 = [(HomeNotificationContentView *)self constraints];

  if (!v3)
  {
    v66 = [(HomeNotificationContentView *)self cameraView];
    v65 = [v66 topAnchor];
    v64 = [(HomeNotificationContentView *)self topAnchor];
    v63 = [v65 constraintEqualToAnchor:v64];
    v68[0] = v63;
    v62 = [(HomeNotificationContentView *)self cameraView];
    v61 = [v62 bottomAnchor];
    v60 = [(HomeNotificationContentView *)self bottomAnchor];
    v59 = [v61 constraintEqualToAnchor:v60];
    v68[1] = v59;
    v58 = [(HomeNotificationContentView *)self cameraView];
    v57 = [v58 leadingAnchor];
    v56 = [(HomeNotificationContentView *)self leadingAnchor];
    v55 = [v57 constraintEqualToAnchor:v56];
    v68[2] = v55;
    v54 = [(HomeNotificationContentView *)self cameraView];
    v53 = [v54 trailingAnchor];
    v52 = [(HomeNotificationContentView *)self trailingAnchor];
    v51 = [v53 constraintEqualToAnchor:v52];
    v68[3] = v51;
    v50 = [(HomeNotificationContentView *)self spinner];
    v48 = [v50 centerXAnchor];
    v49 = [(HomeNotificationContentView *)self cameraView];
    v47 = [v49 centerXAnchor];
    v46 = [v48 constraintEqualToAnchor:v47];
    v68[4] = v46;
    v45 = [(HomeNotificationContentView *)self spinner];
    v43 = [v45 centerYAnchor];
    v44 = [(HomeNotificationContentView *)self cameraView];
    v42 = [v44 centerYAnchor];
    v41 = [v43 constraintEqualToAnchor:v42];
    v68[5] = v41;
    BOOL v40 = [(HomeNotificationContentView *)self statusBarView];
    objc_super v38 = [v40 leadingAnchor];
    id v39 = [(HomeNotificationContentView *)self cameraView];
    long long v37 = [v39 leadingAnchor];
    long long v36 = [v38 constraintEqualToAnchor:v37];
    v68[6] = v36;
    uint64_t v35 = [(HomeNotificationContentView *)self statusBarView];
    v33 = [v35 trailingAnchor];
    long long v34 = [(HomeNotificationContentView *)self cameraView];
    v32 = [v34 trailingAnchor];
    v31 = [v33 constraintEqualToAnchor:v32];
    v68[7] = v31;
    v30 = [(HomeNotificationContentView *)self statusBarView];
    uint64_t v28 = [v30 bottomAnchor];
    v29 = [(HomeNotificationContentView *)self cameraView];
    id v27 = [v29 bottomAnchor];
    id v26 = [v28 constraintEqualToAnchor:v27];
    v68[8] = v26;
    id v25 = [(HomeNotificationContentView *)self statusView];
    v23 = [v25 centerXAnchor];
    v24 = [(HomeNotificationContentView *)self statusBarView];
    v22 = [v24 centerXAnchor];
    v21 = [v23 constraintEqualToAnchor:v22];
    v68[9] = v21;
    v20 = [(HomeNotificationContentView *)self statusView];
    v18 = [v20 centerYAnchor];
    v19 = [(HomeNotificationContentView *)self statusBarView];
    v17 = [v19 centerYAnchor];
    id v16 = [v18 constraintEqualToAnchor:v17];
    v68[10] = v16;
    id v15 = [(HomeNotificationContentView *)self statusView];
    id v14 = [v15 widthAnchor];
    BOOL v4 = [(HomeNotificationContentView *)self statusBarView];
    v5 = [v4 widthAnchor];
    id v6 = [v14 constraintLessThanOrEqualToAnchor:v5];
    v68[11] = v6;
    id v7 = [(HomeNotificationContentView *)self statusView];
    id v8 = [v7 heightAnchor];
    BOOL v9 = [(HomeNotificationContentView *)self statusBarView];
    id v10 = [v9 heightAnchor];
    v11 = [v8 constraintEqualToAnchor:v10];
    v68[12] = v11;
    v12 = +[NSArray arrayWithObjects:v68 count:13];
    [(HomeNotificationContentView *)self setConstraints:v12];

    id v13 = [(HomeNotificationContentView *)self constraints];
    +[NSLayoutConstraint activateConstraints:v13];
  }
  v67.receiver = self;
  v67.super_class = (Class)HomeNotificationContentView;
  [(HomeNotificationContentView *)&v67 updateConstraints];
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  v7.receiver = self;
  v7.super_class = (Class)HomeNotificationContentView;
  -[HomeNotificationContentView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v7, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3.width, a3.height);
  if (v6 >= v5 * 16.0 / 9.0) {
    double v6 = v5 * 16.0 / 9.0;
  }
  result.height = v6;
  result.width = v5;
  return result;
}

- (HomeNotificationContent)content
{
  return self->_content;
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (HULayeredVisualEffectView)statusBarView
{
  return self->_statusBarView;
}

- (void)setStatusBarView:(id)a3
{
}

- (HomeNotificationStatusView)statusView
{
  return self->_statusView;
}

- (void)setStatusView:(id)a3
{
}

- (HUCameraView)cameraView
{
  return self->_cameraView;
}

- (void)setCameraView:(id)a3
{
}

- (NACancelable)statusTextOverrideCancellationToken
{
  return self->_statusTextOverrideCancellationToken;
}

- (void)setStatusTextOverrideCancellationToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusTextOverrideCancellationToken, 0);
  objc_storeStrong((id *)&self->_cameraView, 0);
  objc_storeStrong((id *)&self->_statusView, 0);
  objc_storeStrong((id *)&self->_statusBarView, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_constraints, 0);

  objc_storeStrong((id *)&self->_content, 0);
}

@end