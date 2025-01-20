@interface LookAroundChromeOverlay
- (BOOL)isHidden;
- (ChromeOverlayHosting)host;
- (LookAroundChromeOverlayDelegate)delegate;
- (double)alpha;
- (id)view;
- (unint64_t)containerStyle;
- (void)_installInContentView:(id)a3;
- (void)_invalidateConstraints;
- (void)_updateAlpha;
- (void)_updateConstraintsIfNeeded;
- (void)_updateLayout;
- (void)enterLookAroundForMapItem:(id)a3 isMarkedLocation:(BOOL)a4 lookAroundView:(id)a5;
- (void)enterLookAroundPIP:(id)a3;
- (void)setAlpha:(double)a3;
- (void)setContainerStyle:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setHost:(id)a3;
- (void)showLookAroundPreviewForMapItem:(id)a3 isMarkedLocation:(BOOL)a4 willChangeHidden:(BOOL)a5 animated:(BOOL)a6;
@end

@implementation LookAroundChromeOverlay

- (void)_updateLayout
{
  v3 = +[UIDevice currentDevice];
  BOOL v4 = [v3 userInterfaceIdiom] != (id)5;

  if (self->_hasLeadingEdgeLayout != v4)
  {
    self->_hasLeadingEdgeLayout = v4;
    [(LookAroundChromeOverlay *)self _invalidateConstraints];
  }

  [(LookAroundChromeOverlay *)self _updateConstraintsIfNeeded];
}

- (void)setHost:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);

  v5 = obj;
  if (WeakRetained != obj)
  {
    lookAroundController = self->_lookAroundController;
    if (lookAroundController)
    {
      v7 = [(LookAroundButtonContainerViewController *)lookAroundController parentViewController];

      if (v7)
      {
        [(LookAroundButtonContainerViewController *)self->_lookAroundController willMoveToParentViewController:0];
        if ([(LookAroundButtonContainerViewController *)self->_lookAroundController isViewLoaded])
        {
          v8 = [(LookAroundButtonContainerViewController *)self->_lookAroundController view];
          [v8 removeFromSuperview];
        }
        [(LookAroundButtonContainerViewController *)self->_lookAroundController removeFromParentViewController];
        [(LookAroundChromeOverlay *)self _invalidateConstraints];
      }
    }
    objc_storeWeak((id *)&self->_host, obj);
    v5 = obj;
    if (obj)
    {
      if (!self->_lookAroundController)
      {
        v9 = objc_alloc_init(LookAroundButtonContainerViewController);
        v10 = self->_lookAroundController;
        self->_lookAroundController = v9;

        [(LookAroundButtonContainerViewController *)self->_lookAroundController setDelegate:self];
      }
      v11 = [obj containingViewController];
      [(LookAroundButtonContainerViewController *)self->_lookAroundController willMoveToParentViewController:v11];
      v12 = [obj overlayContentView];
      [(LookAroundChromeOverlay *)self _installInContentView:v12];

      [(LookAroundButtonContainerViewController *)self->_lookAroundController didMoveToParentViewController:v11];
      v5 = obj;
    }
  }
}

- (void)_updateConstraintsIfNeeded
{
  if (!self->_constraints)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
    BOOL v4 = [WeakRetained layoutGuideForOverlay:self];

    if (v4)
    {
      BOOL hasLeadingEdgeLayout = self->_hasLeadingEdgeLayout;
      v6 = [(LookAroundChromeOverlay *)self view];
      v7 = v6;
      if (hasLeadingEdgeLayout)
      {
        v8 = [v6 leadingAnchor];
        v9 = [v4 leadingAnchor];
        v10 = [v8 constraintEqualToAnchor:v9];
        v19[0] = v10;
        v11 = [(LookAroundChromeOverlay *)self view];
        v12 = [v11 bottomAnchor];
        v13 = [v4 bottomAnchor];
        v14 = [v12 constraintEqualToAnchor:v13];
        v19[1] = v14;
        v15 = v19;
      }
      else
      {
        v8 = [v6 trailingAnchor];
        v9 = [v4 trailingAnchor];
        v10 = [v8 constraintEqualToAnchor:v9];
        v18[0] = v10;
        v11 = [(LookAroundChromeOverlay *)self view];
        v12 = [v11 bottomAnchor];
        v13 = [v4 bottomAnchor];
        v14 = [v12 constraintEqualToAnchor:v13];
        v18[1] = v14;
        v15 = v18;
      }
      v16 = +[NSArray arrayWithObjects:v15 count:2];
      constraints = self->_constraints;
      self->_constraints = v16;

      +[NSLayoutConstraint activateConstraints:self->_constraints];
    }
  }
}

- (void)_installInContentView:(id)a3
{
  id v8 = a3;
  BOOL v4 = [(LookAroundChromeOverlay *)self view];
  id v5 = [v4 superview];

  if (v5 != v8)
  {
    v6 = [(LookAroundChromeOverlay *)self view];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

    v7 = [(LookAroundChromeOverlay *)self view];
    [v8 addSubview:v7];

    [(LookAroundChromeOverlay *)self _updateLayout];
  }
}

- (void)_updateAlpha
{
  double overlayAlpha = 0.0;
  if (!self->_overlayHidden) {
    double overlayAlpha = self->_overlayAlpha;
  }
  id v3 = [(LookAroundChromeOverlay *)self view];
  [v3 setAlpha:overlayAlpha];
}

- (id)view
{
  return [(LookAroundButtonContainerViewController *)self->_lookAroundController view];
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_overlayHidden != a3)
  {
    BOOL v4 = a4;
    self->_overlayHidden = a3;
    v7 = [(LookAroundChromeOverlay *)self view];
    id v8 = objc_alloc_init(GroupAnimation);
    [(GroupAnimation *)v8 setAnimated:v4];
    [(GroupAnimation *)v8 setDuration:0.3];
    [(GroupAnimation *)v8 setOptions:4];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100108C18;
    v16[3] = &unk_1012E5CE0;
    v16[4] = self;
    BOOL v18 = a3;
    id v9 = v7;
    id v17 = v9;
    [(GroupAnimation *)v8 addPreparation:v16];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100108C10;
    v15[3] = &unk_1012E5D08;
    v15[4] = self;
    [(GroupAnimation *)v8 addAnimations:v15];
    objc_initWeak(&location, self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100108B9C;
    v11[3] = &unk_1012E5D30;
    objc_copyWeak(&v13, &location);
    id v10 = v9;
    id v12 = v10;
    [(GroupAnimation *)v8 addCompletion:v11];
    [(GroupAnimation *)v8 runWithCurrentOptions];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (void)setContainerStyle:(unint64_t)a3
{
  if (self->_containerStyle != a3)
  {
    self->_containerStyle = a3;
    -[LookAroundButtonContainerViewController setContainerStyle:](self->_lookAroundController, "setContainerStyle:");
    [(LookAroundChromeOverlay *)self _updateLayout];
  }
}

- (BOOL)isHidden
{
  return self->_overlayHidden;
}

- (void)setAlpha:(double)a3
{
  if (self->_overlayAlpha != a3)
  {
    self->_double overlayAlpha = a3;
    [(LookAroundChromeOverlay *)self _updateAlpha];
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)_invalidateConstraints
{
  if (self->_constraints)
  {
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
    constraints = self->_constraints;
    self->_constraints = 0;
  }
}

- (void)setHidden:(BOOL)a3
{
}

- (double)alpha
{
  return self->_overlayAlpha;
}

- (void)showLookAroundPreviewForMapItem:(id)a3 isMarkedLocation:(BOOL)a4 willChangeHidden:(BOOL)a5 animated:(BOOL)a6
{
}

- (void)enterLookAroundForMapItem:(id)a3 isMarkedLocation:(BOOL)a4 lookAroundView:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  +[GEOAPPortal captureLookAroundUserAction:6060 onTarget:201 eventValue:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained enterLookAroundForMapItem:v9 isMarkedLocation:v5 lookAroundView:v8];
}

- (void)enterLookAroundPIP:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained enterLookAroundPIP:v4];
}

- (ChromeOverlayHosting)host
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);

  return (ChromeOverlayHosting *)WeakRetained;
}

- (LookAroundChromeOverlayDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (LookAroundChromeOverlayDelegate *)WeakRetained;
}

- (unint64_t)containerStyle
{
  return self->_containerStyle;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_host);
  objc_storeStrong((id *)&self->_constraints, 0);

  objc_storeStrong((id *)&self->_lookAroundController, 0);
}

@end