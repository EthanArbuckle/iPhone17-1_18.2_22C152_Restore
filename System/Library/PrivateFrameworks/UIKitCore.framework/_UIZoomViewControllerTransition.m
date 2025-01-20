@interface _UIZoomViewControllerTransition
+ (id)zoomWithOptions:(id)a3 sourceViewProvider:(id)a4;
- (BOOL)_isSupportedGivenTraits:(id)a3;
- (UIViewController)_associatedViewController;
- (UIZoomTransitionOptions)_options;
- (id)_transitionControllerForViewController:(id)a3 traits:(id)a4 isAppearing:(BOOL)a5;
- (id)_viewProvider;
- (int64_t)_preferredModalPresentationStyle;
- (void)_wasAssignedToViewController:(id)a3;
- (void)set_associatedViewController:(id)a3;
- (void)set_options:(id)a3;
- (void)set_viewProvider:(id)a3;
@end

@implementation _UIZoomViewControllerTransition

- (void)_wasAssignedToViewController:(id)a3
{
  id v18 = a3;
  v4 = [(_UIZoomViewControllerTransition *)self _associatedViewController];

  if (v4)
  {
    v5 = [(_UIZoomViewControllerTransition *)self _associatedViewController];
    v6 = [v5 _zoomTransitionController];

    if (v6)
    {
      v7 = [v6 dismissInteraction];
      v8 = [v7 view];
      v9 = [v6 dismissInteraction];
      [v8 removeInteraction:v9];
    }
    [(_UIZoomViewControllerTransition *)self set_associatedViewController:0];
  }
  v10 = v18;
  if (v18)
  {
    [(_UIZoomViewControllerTransition *)self set_associatedViewController:v18];
    v11 = [v18 _zoomTransitionController];
    v12 = [v11 dismissInteraction];
    [v12 setDelegate:v11];

    v13 = [v18 traitCollection];
    BOOL v14 = [(_UIZoomViewControllerTransition *)self _isSupportedGivenTraits:v13];
    v15 = [v11 dismissInteraction];
    [v15 setIsEnabled:v14];

    [v11 setClientTransition:self];
    [v11 setOwningViewController:v18];
    v16 = [v18 view];
    v17 = [v11 dismissInteraction];
    [v16 addInteraction:v17];

    v10 = v18;
  }
}

- (void)set_associatedViewController:(id)a3
{
}

- (BOOL)_isSupportedGivenTraits:(id)a3
{
  id v3 = a3;
  if (+[UIView _uip_transitionEnabled]()) {
    BOOL v4 = [v3 userInterfaceIdiom] == 1 || objc_msgSend(v3, "userInterfaceIdiom") == 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (UIViewController)_associatedViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__associatedViewController);
  return (UIViewController *)WeakRetained;
}

+ (id)zoomWithOptions:(id)a3 sourceViewProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[objc_alloc((Class)a1) _init];
  objc_msgSend(v8, "set_viewProvider:", v7);

  if (v6)
  {
    objc_msgSend(v8, "set_options:", v6);
  }
  else
  {
    v9 = objc_opt_new();
    objc_msgSend(v8, "set_options:", v9);
  }
  return v8;
}

- (void)set_viewProvider:(id)a3
{
}

- (void)set_options:(id)a3
{
}

- (id)_transitionControllerForViewController:(id)a3 traits:(id)a4 isAppearing:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if (![(_UIZoomViewControllerTransition *)self _isSupportedGivenTraits:a4]
    || ([v8 _overrideUseCustomPresentation] & 1) != 0
    || ([v8 _overrideTransitioningDelegate],
        v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    v10 = 0;
  }
  else
  {
    v10 = [v8 _zoomTransitionController];
    [v10 setIsZoomingIn:v5];
  }

  return v10;
}

- (int64_t)_preferredModalPresentationStyle
{
  return 0;
}

- (id)_viewProvider
{
  return self->__viewProvider;
}

- (UIZoomTransitionOptions)_options
{
  return self->__options;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__associatedViewController);
  objc_storeStrong((id *)&self->__options, 0);
  objc_storeStrong(&self->__viewProvider, 0);
}

@end