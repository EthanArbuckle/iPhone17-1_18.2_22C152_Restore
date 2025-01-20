@interface MacMenuPresentationController
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)isDismissing;
- (BOOL)isPresented;
- (ContaineeViewController)containeeViewController;
- (GEOObserverHashTable)observers;
- (MacMenuPresentationController)initWithContaineeViewController:(id)a3;
- (NSArray)passThroughViews;
- (UILayoutGuide)anchorLayoutGuide;
- (UILayoutGuide)widthLayoutGuide;
- (UIViewController)containerViewController;
- (void)_didDismiss;
- (void)_dismissGestureFired:(id)a3;
- (void)_willDismiss;
- (void)addObserver:(id)a3;
- (void)dismissAnimated:(BOOL)a3 completion:(id)a4;
- (void)presentFromViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)removeObserver:(id)a3;
- (void)setAnchorLayoutGuide:(id)a3;
- (void)setContainerViewController:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPassThroughViews:(id)a3;
- (void)setWidthLayoutGuide:(id)a3;
@end

@implementation MacMenuPresentationController

- (MacMenuPresentationController)initWithContaineeViewController:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MacMenuPresentationController;
  v5 = [(MacMenuPresentationController *)&v13 init];
  if (v5)
  {
    v6 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___MacMenuPresentationControllerObserver queue:0];
    observers = v5->_observers;
    v5->_observers = v6;

    objc_storeWeak((id *)&v5->_containeeViewController, v4);
    v8 = (UIPanGestureRecognizer *)[objc_alloc((Class)UIPanGestureRecognizer) initWithTarget:v5 action:"_dismissGestureFired:"];
    dismissPanGesture = v5->_dismissPanGesture;
    v5->_dismissPanGesture = v8;

    [(UIPanGestureRecognizer *)v5->_dismissPanGesture setDelegate:v5];
    v10 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v5 action:"_dismissGestureFired:"];
    dismissTapGesture = v5->_dismissTapGesture;
    v5->_dismissTapGesture = v10;

    [(UITapGestureRecognizer *)v5->_dismissTapGesture setDelegate:v5];
  }

  return v5;
}

- (void)setPassThroughViews:(id)a3
{
  id v4 = a3;
  v5 = +[NSHashTable weakObjectsHashTable];
  passThroughViews = self->_passThroughViews;
  self->_passThroughViews = v5;

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[NSHashTable addObject:](self->_passThroughViews, "addObject:", *(void *)(*((void *)&v12 + 1) + 8 * (void)v11), (void)v12);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (NSArray)passThroughViews
{
  return [(NSHashTable *)self->_passThroughViews allObjects];
}

- (void)presentFromViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (!*(_WORD *)&self->_isPresented)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containeeViewController);
    v11 = [WeakRetained view];
    long long v12 = [v11 superview];

    if (!v12)
    {
      v60 = [(MacMenuPresentationController *)self anchorLayoutGuide];
      uint64_t v61 = [(MacMenuPresentationController *)self widthLayoutGuide];
      self->_isPresented = 1;
      id v13 = objc_loadWeakRetained((id *)&self->_containerViewController);
      id v14 = objc_loadWeakRetained((id *)&self->_containeeViewController);
      [v13 addChildViewController:v14];

      id v15 = objc_loadWeakRetained((id *)&self->_containeeViewController);
      v16 = [v15 view];

      [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v16 setAlpha:0.0];
      id v17 = objc_loadWeakRetained((id *)&self->_containerViewController);
      v18 = [v17 view];

      v59 = v18;
      v19 = v16;
      [v18 addSubview:v16];
      id v20 = objc_loadWeakRetained((id *)&self->_containeeViewController);
      id v21 = objc_loadWeakRetained((id *)&self->_containerViewController);
      [v20 didMoveToParentViewController:v21];

      v22 = [(UIPanGestureRecognizer *)self->_dismissPanGesture view];
      id v23 = objc_loadWeakRetained((id *)&self->_containerViewController);
      v24 = [v23 view];

      if (v22 != v24)
      {
        id v25 = objc_loadWeakRetained((id *)&self->_containerViewController);
        v26 = [v25 view];
        [v26 addGestureRecognizer:self->_dismissPanGesture];
      }
      v27 = [(UITapGestureRecognizer *)self->_dismissTapGesture view];
      id v28 = objc_loadWeakRetained((id *)&self->_containerViewController);
      v29 = [v28 view];

      if (v27 != v29)
      {
        id v30 = objc_loadWeakRetained((id *)&self->_containerViewController);
        v31 = [v30 view];
        [v31 addGestureRecognizer:self->_dismissTapGesture];
      }
      id v32 = objc_alloc_init((Class)NSMutableArray);
      generatedWidthLayoutGuide = self->_generatedWidthLayoutGuide;
      v34 = v19;
      v35 = (UILayoutGuide *)v61;
      if (v61)
      {
        v36 = v59;
        if (generatedWidthLayoutGuide)
        {
          v37 = [(UILayoutGuide *)generatedWidthLayoutGuide owningView];

          if (v37 == v59) {
            [v59 removeLayoutGuide:self->_generatedWidthLayoutGuide];
          }
        }
      }
      else
      {
        v36 = v59;
        if (!generatedWidthLayoutGuide)
        {
          v38 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
          v39 = self->_generatedWidthLayoutGuide;
          self->_generatedWidthLayoutGuide = v38;

          generatedWidthLayoutGuide = self->_generatedWidthLayoutGuide;
        }
        v40 = [(UILayoutGuide *)generatedWidthLayoutGuide owningView];

        if (v40 != v59)
        {
          [v59 addLayoutGuide:self->_generatedWidthLayoutGuide];
          v41 = [(UILayoutGuide *)self->_generatedWidthLayoutGuide widthAnchor];
          v42 = [v41 constraintEqualToConstant:282.0];
          [v32 addObject:v42];
        }
        v35 = self->_generatedWidthLayoutGuide;
      }
      v57 = [v34 widthAnchor];
      v62 = v35;
      v56 = [(UILayoutGuide *)v35 widthAnchor];
      v55 = [v57 constraintEqualToAnchor:v56];
      v67[0] = v55;
      v54 = [v34 centerXAnchor];
      v53 = [v60 centerXAnchor];
      v52 = [v54 constraintEqualToAnchor:v53];
      v67[1] = v52;
      v51 = [v34 topAnchor];
      v43 = [v60 bottomAnchor];
      v44 = [v51 constraintEqualToAnchor:v43];
      v67[2] = v44;
      v45 = [v34 heightAnchor];
      [v36 heightAnchor];
      v46 = v58 = v34;
      v47 = [v45 constraintLessThanOrEqualToAnchor:v46 constant:-150.0];
      v67[3] = v47;
      v48 = +[NSArray arrayWithObjects:v67 count:4];
      [v32 addObjectsFromArray:v48];

      +[NSLayoutConstraint activateConstraints:v32];
      v65[0] = _NSConcreteStackBlock;
      v65[1] = 3221225472;
      v65[2] = sub_1004B372C;
      v65[3] = &unk_1012E5D08;
      id v66 = v59;
      id v49 = v59;
      +[UIView performWithoutAnimation:v65];
      if (v6)
      {
        v63[0] = _NSConcreteStackBlock;
        v63[1] = 3221225472;
        v63[2] = sub_1004B3734;
        v63[3] = &unk_1012E5D08;
        id v64 = v58;
        +[UIView animateWithDuration:v63 animations:0 completion:0.1];

        v50 = v58;
      }
      else
      {
        v50 = v58;
        [v58 setAlpha:1.0];
      }
    }
  }
}

- (void)dismissAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (self->_isPresented)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    id v8 = [WeakRetained view];
    id v9 = objc_loadWeakRetained((id *)&self->_containeeViewController);
    uint64_t v10 = [v9 view];
    v11 = [v10 superview];

    if (v8 == v11)
    {
      id v12 = objc_loadWeakRetained((id *)&self->_containeeViewController);
      id v13 = [v12 view];

      id v14 = objc_loadWeakRetained((id *)&self->_containeeViewController);
      id v15 = objc_loadWeakRetained((id *)&self->_containerViewController);
      v16 = [v15 view];
      [v16 removeGestureRecognizer:self->_dismissTapGesture];

      id v17 = objc_loadWeakRetained((id *)&self->_containerViewController);
      v18 = [v17 view];
      [v18 removeGestureRecognizer:self->_dismissPanGesture];

      [(MacMenuPresentationController *)self _willDismiss];
      [v14 willMoveToParentViewController:0];
      if (v4)
      {
        objc_initWeak(&location, self);
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_1004B39DC;
        v24[3] = &unk_1012E5D08;
        id v25 = v13;
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_1004B39E8;
        v19[3] = &unk_1012EC428;
        id v20 = v25;
        id v21 = v14;
        objc_copyWeak(&v23, &location);
        id v22 = v6;
        +[UIView animateWithDuration:v24 animations:v19 completion:0.1];

        objc_destroyWeak(&v23);
        objc_destroyWeak(&location);
      }
      else
      {
        [v13 removeFromSuperview];
        [v14 removeFromParentViewController];
      }
    }
  }
}

- (void)_willDismiss
{
  v3 = [(MacMenuPresentationController *)self observers];
  [v3 macMenuPresentationControllerWillDismiss:self];

  *(_WORD *)&self->_isPresented = 256;
}

- (void)_didDismiss
{
  self->_isDismissing = 0;
  id v3 = [(MacMenuPresentationController *)self observers];
  [v3 macMenuPresentationControllerDidDismiss:self];
}

- (void)_dismissGestureFired:(id)a3
{
  BOOL v4 = (UITapGestureRecognizer *)a3;
  if ((UITapGestureRecognizer *)self->_dismissPanGesture == v4
    && (v6 = v4, v5 = [(UITapGestureRecognizer *)v4 state] == (id)1, BOOL v4 = v6, v5))
  {
    [(MacMenuPresentationController *)self dismissAnimated:1 completion:0];
    [(UITapGestureRecognizer *)v6 setEnabled:0];
    [(UITapGestureRecognizer *)v6 setEnabled:1];
  }
  else
  {
    if (self->_dismissTapGesture != v4) {
      goto LABEL_8;
    }
    id v6 = v4;
    [(MacMenuPresentationController *)self dismissAnimated:1 completion:0];
  }
  BOOL v4 = v6;
LABEL_8:
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  BOOL v5 = [a4 view];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containeeViewController);
  uint64_t v7 = [WeakRetained view];
  if (v5 == (void *)v7)
  {

    goto LABEL_14;
  }
  id v8 = (void *)v7;
  id v9 = objc_loadWeakRetained((id *)&self->_containeeViewController);
  uint64_t v10 = [v9 view];
  unsigned __int8 v11 = [v5 isDescendantOfView:v10];

  if (v11)
  {
LABEL_14:
    BOOL v17 = 0;
    goto LABEL_18;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = self->_passThroughViews;
  id v13 = [(NSHashTable *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        if (v5 == *(void **)(*((void *)&v19 + 1) + 8 * i)
          || ([v5 isDescendantOfView:(void)v19] & 1) != 0)
        {
          BOOL v17 = 0;
          goto LABEL_17;
        }
      }
      id v14 = [(NSHashTable *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      BOOL v17 = 1;
      if (v14) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v17 = 1;
  }
LABEL_17:

LABEL_18:
  return v17;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (UIPanGestureRecognizer *)a4;
  dismissTapGesture = self->_dismissTapGesture;
  dismissPanGesture = self->_dismissPanGesture;
  if (dismissTapGesture != v6 || (BOOL v10 = dismissPanGesture == v7, dismissPanGesture = v7, v10))
  {
    BOOL v10 = dismissTapGesture != (UITapGestureRecognizer *)v7 && dismissPanGesture == v6;
    BOOL v11 = v10;
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(MacMenuPresentationController *)self observers];
  [v5 registerObserver:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(MacMenuPresentationController *)self observers];
  [v5 unregisterObserver:v4];
}

- (ContaineeViewController)containeeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containeeViewController);

  return (ContaineeViewController *)WeakRetained;
}

- (UIViewController)containerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setContainerViewController:(id)a3
{
}

- (UILayoutGuide)anchorLayoutGuide
{
  return self->_anchorLayoutGuide;
}

- (void)setAnchorLayoutGuide:(id)a3
{
}

- (UILayoutGuide)widthLayoutGuide
{
  return self->_widthLayoutGuide;
}

- (void)setWidthLayoutGuide:(id)a3
{
}

- (BOOL)isPresented
{
  return self->_isPresented;
}

- (BOOL)isDismissing
{
  return self->_isDismissing;
}

- (GEOObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_widthLayoutGuide, 0);
  objc_storeStrong((id *)&self->_anchorLayoutGuide, 0);
  objc_destroyWeak((id *)&self->_containerViewController);
  objc_destroyWeak((id *)&self->_containeeViewController);
  objc_storeStrong((id *)&self->_dismissPanGesture, 0);
  objc_storeStrong((id *)&self->_dismissTapGesture, 0);
  objc_storeStrong((id *)&self->_passThroughViews, 0);

  objc_storeStrong((id *)&self->_generatedWidthLayoutGuide, 0);
}

@end