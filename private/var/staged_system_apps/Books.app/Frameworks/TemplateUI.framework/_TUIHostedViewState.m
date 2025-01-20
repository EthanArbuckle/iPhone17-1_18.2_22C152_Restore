@interface _TUIHostedViewState
- (BOOL)isAvailable;
- (BOOL)needsLayout;
- (BOOL)previouslyAppeared;
- (BOOL)visible;
- (CGPoint)anchorPoint;
- (TUIHostedViewProviding)provider;
- (TUIHostingController)controller;
- (TUIHostingIdentifier)identifier;
- (TUIVisibilityOptions)visibilityOptions;
- (UIView)view;
- (UIViewController)viewController;
- (_TUIHostedViewState)initWithController:(id)a3 provider:(id)a4 identifier:(id)a5;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (unint64_t)flags;
- (void)_updateAnchorPoint;
- (void)dealloc;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)presentationDidDismiss;
- (void)recycleViewWithController:(id)a3;
- (void)setAnchorPoint:(CGPoint)a3;
- (void)setPreviouslyAppeared:(BOOL)a3;
- (void)setVisible:(BOOL)a3;
@end

@implementation _TUIHostedViewState

- (_TUIHostedViewState)initWithController:(id)a3 provider:(id)a4 identifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_TUIHostedViewState;
  v11 = [(_TUIHostedViewState *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_controller, v8);
    objc_storeStrong((id *)&v12->_provider, a4);
    objc_storeStrong((id *)&v12->_identifier, a5);
    v12->_anchorPoint = (CGPoint)vdupq_n_s64(0x7FF8000000000000uLL);
  }

  return v12;
}

- (void)dealloc
{
  [(_TUIHostedViewState *)self setVisible:0];
  viewController = self->_viewController;
  if (viewController)
  {
    v4 = [(UIViewController *)viewController parentViewController];

    v5 = self->_viewController;
    if (v4)
    {
      if ([(UIViewController *)v5 _appearState] == 2)
      {
        [(UIViewController *)self->_viewController beginAppearanceTransition:0 animated:0];
        v6 = [(UIViewController *)self->_viewController viewIfLoaded];
        [v6 removeFromSuperview];

        [(UIViewController *)self->_viewController endAppearanceTransition];
      }
      [(UIViewController *)self->_viewController removeFromParentViewController];
    }
    else
    {
      v7 = [(UIViewController *)v5 presentingViewController];

      if (v7)
      {
        id v8 = self->_viewController;
        id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_C9774;
        v12[3] = &unk_251990;
        v13 = v8;
        id v10 = v8;
        [WeakRetained _finishOngoingModalTransitionAnimationsWithCompletion:v12];

        [(_TUIHostedViewState *)self presentationDidDismiss];
      }
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)_TUIHostedViewState;
  [(_TUIHostedViewState *)&v11 dealloc];
}

- (void)recycleViewWithController:(id)a3
{
  id v3 = [(_TUIHostedViewState *)self view];
  [v3 removeFromSuperview];
}

- (BOOL)needsLayout
{
  v2 = [(_TUIHostedViewState *)self viewController];
  id v3 = [v2 viewIfLoaded];
  unsigned __int8 v4 = [v3 isHidden];

  return v4;
}

- (BOOL)isAvailable
{
  v2 = [(_TUIHostedViewState *)self viewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setVisible:(BOOL)a3
{
  if (self->_visible != a3)
  {
    BOOL v3 = a3;
    self->_visible = a3;
    if (objc_opt_respondsToSelector())
    {
      provider = self->_provider;
      viewController = self->_viewController;
      [(TUIHostedViewProviding *)provider hostedViewProviderDidChangeVisibility:v3 viewController:viewController];
    }
  }
}

- (UIViewController)viewController
{
  viewController = self->_viewController;
  if (!viewController)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    v5 = [WeakRetained _groupIdentifierForIdentifier:self->_identifier];

    if (!v5
      || (id v6 = objc_loadWeakRetained((id *)&self->_controller),
          unsigned int v7 = [v6 _shouldVendViewForIdentifier:self->_identifier inGroup:v5],
          v6,
          v7))
    {
      if (self->_viewController
        || ([(TUIHostedViewProviding *)self->_provider hostedViewProviderCreateViewController], id v8 = (UIViewController *)objc_claimAutoreleasedReturnValue(), v9 = self->_viewController, self->_viewController = v8, v9, self->_viewController))
      {
        id v10 = objc_loadWeakRetained((id *)&self->_controller);
        objc_super v11 = [v10 _propertiesForIdentifier:self->_identifier];
        id v12 = [v11 presentation];

        if (!v12)
        {
          id v13 = objc_loadWeakRetained((id *)&self->_controller);
          objc_super v14 = [v13 viewController];
          [v14 addChildViewController:self->_viewController];
        }
        if (v5)
        {
          id v15 = objc_loadWeakRetained((id *)&self->_controller);
          [v15 _activateGroup:v5];
        }
        [(_TUIHostedViewState *)self _updateAnchorPoint];
      }
    }

    viewController = self->_viewController;
  }

  return viewController;
}

- (UIView)view
{
  v2 = [(_TUIHostedViewState *)self viewController];
  BOOL v3 = [v2 view];

  return (UIView *)v3;
}

- (unint64_t)flags
{
  return (unint64_t)[(TUIHostedViewProviding *)self->_provider hostedViewProviderFlags];
}

- (TUIVisibilityOptions)visibilityOptions
{
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [(TUIHostedViewProviding *)self->_provider hostedViewProviderVisibilityOptions];
  }
  else
  {
    BOOL v3 = 0;
  }

  return (TUIVisibilityOptions *)v3;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  [(_TUIHostedViewState *)self setVisible:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  [WeakRetained _removeProviderForViewState:self];
}

- (void)presentationDidDismiss
{
  [(_TUIHostedViewState *)self setVisible:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  [WeakRetained _removeProviderForViewState:self];
}

- (void)setAnchorPoint:(CGPoint)a3
{
  if (self->_anchorPoint.x != a3.x || self->_anchorPoint.y != a3.y)
  {
    self->_anchorPoint = a3;
    [(_TUIHostedViewState *)self _updateAnchorPoint];
  }
}

- (void)_updateAnchorPoint
{
  if (objc_opt_respondsToSelector())
  {
    provider = self->_provider;
    viewController = self->_viewController;
    double x = self->_anchorPoint.x;
    double y = self->_anchorPoint.y;
    -[TUIHostedViewProviding hostedViewProviderCustomizeViewController:withAnchorPoint:](provider, "hostedViewProviderCustomizeViewController:withAnchorPoint:", viewController, x, y);
  }
}

- (CGPoint)anchorPoint
{
  double x = self->_anchorPoint.x;
  double y = self->_anchorPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)visible
{
  return self->_visible;
}

- (BOOL)previouslyAppeared
{
  return self->_previouslyAppeared;
}

- (void)setPreviouslyAppeared:(BOOL)a3
{
  self->_previouslyAppeared = a3;
}

- (TUIHostingController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return (TUIHostingController *)WeakRetained;
}

- (TUIHostedViewProviding)provider
{
  return self->_provider;
}

- (TUIHostingIdentifier)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_destroyWeak((id *)&self->_controller);

  objc_storeStrong((id *)&self->_viewController, 0);
}

@end