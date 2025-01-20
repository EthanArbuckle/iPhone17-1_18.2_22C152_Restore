@interface CarStatusBannerOverlay
- (BOOL)isHidden;
- (CarStatusBannerDelegate)delegate;
- (CarStatusBannerOverlay)initWithChromeViewController:(id)a3;
- (ChromeOverlayHosting)host;
- (NSArray)focusOrderSubItems;
- (NSArray)preferredFocusEnvironments;
- (void)_reloadContent;
- (void)_tappedLabel;
- (void)dealloc;
- (void)reloadAnimated:(BOOL)a3;
- (void)setContentView:(id)a3 layoutGuide:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setHost:(id)a3;
@end

@implementation CarStatusBannerOverlay

- (CarStatusBannerOverlay)initWithChromeViewController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CarStatusBannerOverlay;
  v5 = [(CarStatusBannerOverlay *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_chromeVC, v4);
  }

  return v6;
}

- (void)dealloc
{
  [(CarStatusBannerOverlay *)self setContentView:0 layoutGuide:0];
  v3.receiver = self;
  v3.super_class = (Class)CarStatusBannerOverlay;
  [(CarStatusBannerOverlay *)&v3 dealloc];
}

- (void)setHost:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_host, v4);
    if (v4)
    {
      v6 = [v4 overlayContentView];
      v7 = [v4 layoutGuideForOverlay:self];
      [(CarStatusBannerOverlay *)self setContentView:v6 layoutGuide:v7];

      if (!self->_titleLabel)
      {
        objc_super v8 = sub_100015DB4();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v9 = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to set up constraints for status stackView as it was nil at the time.", v9, 2u);
        }
      }
    }
    else
    {
      [(CarStatusBannerOverlay *)self setContentView:0 layoutGuide:0];
    }
  }
}

- (void)setContentView:(id)a3 layoutGuide:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CarStatusBannerLabel *)self->_titleLabel superview];
  if (v8 != v6)
  {
    [(CarStatusBannerLabel *)self->_titleLabel removeFromSuperview];
    titleLabel = self->_titleLabel;
    self->_titleLabel = 0;

    if (v6)
    {
      v49 = v8;
      v10 = sub_100015DB4();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Will create new status views container view", buf, 2u);
      }

      v11 = (UIView *)objc_alloc_init((Class)UIView);
      containerView = self->_containerView;
      self->_containerView = v11;

      [(UIView *)self->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIView *)self->_containerView setUserInteractionEnabled:1];
      [(UIView *)self->_containerView setAlpha:0.0];
      [v6 addSubview:self->_containerView];
      v13 = [CarStatusBannerLabel alloc];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeVC);
      v15 = [(CarStatusBannerLabel *)v13 initWithChromeViewController:WeakRetained];
      v16 = self->_titleLabel;
      self->_titleLabel = v15;

      [(CarStatusBannerLabel *)self->_titleLabel setHidden:1];
      [(CarStatusBannerLabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      [(CarStatusBannerLabel *)self->_titleLabel addTarget:self action:"_tappedLabel" forControlEvents:64];
      [(CarStatusBannerLabel *)self->_titleLabel setUserInteractionEnabled:1];
      [v6 addSubview:self->_titleLabel];
      v17 = [(UIView *)self->_containerView heightAnchor];
      v18 = [v17 constraintEqualToConstant:0.0];
      heightConstraint = self->_heightConstraint;
      self->_heightConstraint = v18;

      id v20 = objc_loadWeakRetained((id *)&self->_chromeVC);
      id v21 = [v20 sceneType];

      id v51 = v6;
      if (v21 == (id)1)
      {
        v22 = [v7 _maps_leftRHDAnchor];
        v23 = [(UIView *)self->_containerView _maps_leftRHDAnchor];
        LODWORD(v24) = 1148846080;
        [v22 _maps_constraintWithRHDAnchor:v23 relation:0 constant:-8.0 priority:v24];
        v25 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
        leadingConstraint = self->_leadingConstraint;
        self->_leadingConstraint = v25;
      }
      else
      {
        v27 = [v7 leadingAnchor];
        v28 = [(UIView *)self->_containerView leadingAnchor];
        v29 = [v27 constraintEqualToAnchor:v28];
        v30 = self->_leadingConstraint;
        self->_leadingConstraint = v29;

        v22 = [(UIView *)self->_containerView trailingAnchor];
        v23 = [v7 trailingAnchor];
        v31 = [v22 constraintEqualToAnchor:v23];
        leadingConstraint = self->_trailingConstraint;
        self->_trailingConstraint = v31;
      }

      v48 = [(UIView *)self->_containerView topAnchor];
      v47 = [v7 topAnchor];
      v46 = [v48 constraintEqualToAnchor:v47 constant:2.5];
      v53[0] = v46;
      v45 = [(UIView *)self->_containerView bottomAnchor];
      v44 = [v7 bottomAnchor];
      v43 = [v45 constraintEqualToAnchor:v44 constant:-2.5];
      v32 = self->_heightConstraint;
      v53[1] = v43;
      v53[2] = v32;
      v42 = [(CarStatusBannerLabel *)self->_titleLabel leadingAnchor];
      v33 = [(UIView *)self->_containerView leadingAnchor];
      v34 = [v42 constraintEqualToAnchor:v33];
      v53[3] = v34;
      [(CarStatusBannerLabel *)self->_titleLabel trailingAnchor];
      v35 = id v50 = v7;
      v36 = [(UIView *)self->_containerView trailingAnchor];
      v37 = [v35 constraintEqualToAnchor:v36];
      v53[4] = v37;
      v38 = [(CarStatusBannerLabel *)self->_titleLabel centerYAnchor];
      v39 = [(UIView *)self->_containerView centerYAnchor];
      v40 = [v38 constraintEqualToAnchor:v39];
      v53[5] = v40;
      v41 = +[NSArray arrayWithObjects:v53 count:6];
      +[NSLayoutConstraint activateConstraints:v41];

      id v7 = v50;
      [(NSLayoutConstraint *)self->_leadingConstraint setActive:1];
      [(NSLayoutConstraint *)self->_trailingConstraint setActive:1];
      [(CarStatusBannerOverlay *)self reloadAnimated:0];
      id v6 = v51;
      id v8 = v49;
    }
  }
}

- (void)reloadAnimated:(BOOL)a3
{
  if (self->_titleLabel)
  {
    [(CarStatusBannerOverlay *)self _reloadContent];
    id v5 = [(CarStatusBannerOverlay *)self host];
    [v5 setCollisionConstraintsEnabled:[self isHidden] forOverlay:self];
  }
  else
  {
    id v4 = sub_100015DB4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Will not reload status views, overlay not active", buf, 2u);
    }
  }
}

- (BOOL)isHidden
{
  [(CarStatusBannerLabel *)self->_titleLabel alpha];
  return v2 == 0.0;
}

- (void)setHidden:(BOOL)a3
{
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4
{
  if (!self->_titleLabel) {
    return;
  }
  int v4 = a3;
  if (!a4) {
    goto LABEL_12;
  }
  if (UIAccessibilityIsReduceMotionEnabled())
  {
    id v6 = sub_100015DB4();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
LABEL_11:

LABEL_12:
      int v13 = 0;
      goto LABEL_14;
    }
    id v7 = self;
    id v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    if (objc_opt_respondsToSelector())
    {
      v10 = [(CarStatusBannerOverlay *)v7 performSelector:"accessibilityIdentifier"];
      v11 = v10;
      if (v10 && ![v10 isEqualToString:v9])
      {
        v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

        goto LABEL_10;
      }
    }
    v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_10:

    *(_DWORD *)buf = 138543362;
    CFStringRef v21 = v12;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Reduce motion enabled, running status view update without animation", buf, 0xCu);

    goto LABEL_11;
  }
  int v13 = 1;
LABEL_14:
  if ([(CarStatusBannerLabel *)self->_titleLabel isHidden] != v4)
  {
    v14 = sub_100015DB4();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      CFStringRef v15 = @"show";
      if (v4) {
        CFStringRef v15 = @"hide";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v21 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Will %@ status view", buf, 0xCu);
    }

    double v16 = 0.0;
    if (v13)
    {
      unsigned int v17 = +[UIView _maps_shouldAdoptImplicitAnimationParameters];
      double v16 = 0.1;
      if (v17) {
        double v16 = 0.0;
      }
    }
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1004071A4;
    v18[3] = &unk_1012E6300;
    v18[4] = self;
    char v19 = v4;
    +[UIView animateWithDuration:4 delay:v18 options:0 animations:v16 completion:0.0];
  }
}

- (void)_tappedLabel
{
  id v2 = [(CarStatusBannerOverlay *)self delegate];
  [v2 carStatusBannerDidTapBanner];
}

- (void)_reloadContent
{
}

- (NSArray)focusOrderSubItems
{
  if ([(CarStatusBannerLabel *)self->_titleLabel isEnabled])
  {
    titleLabel = self->_titleLabel;
    objc_super v3 = +[NSArray arrayWithObjects:&titleLabel count:1];
  }
  else
  {
    objc_super v3 = &__NSArray0__struct;
  }

  return (NSArray *)v3;
}

- (NSArray)preferredFocusEnvironments
{
  if ([(CarStatusBannerLabel *)self->_titleLabel isEnabled])
  {
    titleLabel = self->_titleLabel;
    objc_super v3 = +[NSArray arrayWithObjects:&titleLabel count:1];
  }
  else
  {
    objc_super v3 = &__NSArray0__struct;
  }

  return (NSArray *)v3;
}

- (ChromeOverlayHosting)host
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);

  return (ChromeOverlayHosting *)WeakRetained;
}

- (CarStatusBannerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CarStatusBannerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_host);
  objc_destroyWeak((id *)&self->_chromeVC);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_trailingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);

  objc_storeStrong((id *)&self->_containerView, 0);
}

@end