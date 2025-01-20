@interface ChromeOverlayController
- (BOOL)_canHostOverlays;
- (BOOL)_checkIfAnyConstraints:(id)a3 match:(BOOL)a4;
- (BOOL)_setConstraintsEnabled:(BOOL)a3 container:(id)a4 overlay:(id)a5;
- (ChromeOverlayController)init;
- (ChromeOverlayControllerDelegate)delegate;
- (UILayoutGuide)contentLayoutGuide;
- (UILayoutGuide)mapInsetsLayoutGuide;
- (UILayoutGuide)viewportLayoutGuide;
- (UIView)overlayContentView;
- (UIView)parentView;
- (UIView)passThroughView;
- (UIViewController)containingViewController;
- (id)_addCollisionGuideAlongAxis:(int64_t)a3;
- (id)collisionGuideForEdge:(unint64_t)a3;
- (id)layoutGuideForOverlay:(id)a3;
- (void)_activateHosting;
- (void)_deactivateHosting;
- (void)_setConstraints:(id)a3 view:(id)a4 container:(id)a5 forOverlay:(id)a6;
- (void)_setupIfNeeded;
- (void)_teardownIfNeeded;
- (void)addOverlay:(id)a3;
- (void)addOverlay:(id)a3 inLayoutGuide:(id)a4;
- (void)enumerateOverlaysUsingBlock:(id)a3;
- (void)installInView:(id)a3 containingViewController:(id)a4 contentLayoutGuide:(id)a5 mapInsetsLayoutGuide:(id)a6 viewportLayoutGuide:(id)a7;
- (void)overlayDidUpdateExistingMapInsetConstraints:(id)a3;
- (void)removeAllOverlays;
- (void)removeOverlay:(id)a3;
- (void)setCollisionConstraints:(id)a3 forOverlay:(id)a4;
- (void)setCollisionConstraintsEnabled:(BOOL)a3 forOverlay:(id)a4;
- (void)setConstraints:(id)a3 forHidingOverlay:(id)a4;
- (void)setConstraints:(id)a3 forShowingOverlay:(id)a4;
- (void)setContainingViewController:(id)a3;
- (void)setContentLayoutGuide:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMapInsetsConstraints:(id)a3 forOverlay:(id)a4;
- (void)setMapInsetsConstraintsEnabled:(BOOL)a3 forOverlay:(id)a4;
- (void)setMapInsetsLayoutGuide:(id)a3;
- (void)setParentView:(id)a3;
- (void)setShowingConstraintsEnabled:(BOOL)a3 forOverlay:(id)a4;
- (void)setViewportConstraints:(id)a3 forOverlay:(id)a4;
- (void)setViewportConstraintsEnabled:(BOOL)a3 forOverlay:(id)a4;
- (void)setViewportLayoutGuide:(id)a3;
@end

@implementation ChromeOverlayController

- (UIViewController)containingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containingViewController);

  return (UIViewController *)WeakRetained;
}

- (ChromeOverlayController)init
{
  v8.receiver = self;
  v8.super_class = (Class)ChromeOverlayController;
  v2 = [(ChromeOverlayController *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableOrderedSet orderedSet];
    overlays = v2->_overlays;
    v2->_overlays = (NSMutableOrderedSet *)v3;

    uint64_t v5 = +[NSMapTable weakToStrongObjectsMapTable];
    layoutGuidesByOverlay = v2->_layoutGuidesByOverlay;
    v2->_layoutGuidesByOverlay = (NSMapTable *)v5;
  }
  return v2;
}

- (void)installInView:(id)a3 containingViewController:(id)a4 contentLayoutGuide:(id)a5 mapInsetsLayoutGuide:(id)a6 viewportLayoutGuide:(id)a7
{
  id v17 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [(ChromeOverlayController *)self parentView];

  if (v16 != v17)
  {
    [(ChromeOverlayController *)self _teardownIfNeeded];
    [(ChromeOverlayController *)self setParentView:v17];
    [(ChromeOverlayController *)self setContainingViewController:v12];
    [(ChromeOverlayController *)self setContentLayoutGuide:v13];
    [(ChromeOverlayController *)self setMapInsetsLayoutGuide:v14];
    [(ChromeOverlayController *)self setViewportLayoutGuide:v15];
    [(ChromeOverlayController *)self _setupIfNeeded];
  }
}

- (id)layoutGuideForOverlay:(id)a3
{
  id v4 = a3;
  if (!v4
    || ([(NSMapTable *)self->_layoutGuidesByOverlay objectForKey:v4],
        (uint64_t v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v5 = [(ChromeOverlayController *)self contentLayoutGuide];
  }

  return v5;
}

- (void)_teardownIfNeeded
{
  [(ChromeOverlayController *)self _deactivateHosting];
  [(UIView *)self->_passThroughView removeFromSuperview];
  passThroughView = self->_passThroughView;
  self->_passThroughView = 0;

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v4 = [(NSMapTable *)self->_viewportConstraintsByOverlay objectEnumerator];
  id v5 = [v4 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v29;
    do
    {
      objc_super v8 = 0;
      do
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v28 + 1) + 8 * (void)v8);
        v10 = [(ChromeOverlayController *)self parentView];
        [v10 removeConstraints:v9];

        objc_super v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v6);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v11 = [(NSMapTable *)self->_mapInsetsConstraintsByOverlay objectEnumerator];
  id v12 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * (void)v15);
        id v17 = [(ChromeOverlayController *)self parentView];
        [v17 removeConstraints:v16];

        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v13);
  }

  collisionGuidesByEdge = self->_collisionGuidesByEdge;
  self->_collisionGuidesByEdge = 0;

  mapInsetsConstraintsByOverlay = self->_mapInsetsConstraintsByOverlay;
  self->_mapInsetsConstraintsByOverlay = 0;

  viewportConstraintsByOverlay = self->_viewportConstraintsByOverlay;
  self->_viewportConstraintsByOverlay = 0;

  collisionConstraintsByOverlay = self->_collisionConstraintsByOverlay;
  self->_collisionConstraintsByOverlay = 0;

  hidingConstraintsByOverlay = self->_hidingConstraintsByOverlay;
  self->_hidingConstraintsByOverlay = 0;

  showingConstraintsByOverlay = self->_showingConstraintsByOverlay;
  self->_showingConstraintsByOverlay = 0;

  [(ChromeOverlayController *)self setContentLayoutGuide:0];
  [(ChromeOverlayController *)self setMapInsetsLayoutGuide:0];
  [(ChromeOverlayController *)self setViewportLayoutGuide:0];
}

- (void)enumerateOverlaysUsingBlock:(id)a3
{
}

- (void)_setupIfNeeded
{
  uint64_t v3 = [(UIView *)self->_passThroughView superview];
  id v4 = [(ChromeOverlayController *)self parentView];

  if (v3 != v4 && [(ChromeOverlayController *)self _canHostOverlays])
  {
    id v5 = [(ChromeOverlayController *)self parentView];
    id v6 = [PassThroughView alloc];
    [v5 bounds];
    uint64_t v7 = -[PassThroughView initWithFrame:](v6, "initWithFrame:");
    passThroughView = self->_passThroughView;
    self->_passThroughView = v7;

    [(UIView *)self->_passThroughView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_passThroughView setClipsToBounds:1];
    [(UIView *)self->_passThroughView setAccessibilityIdentifier:@"ChromeOverlayController"];
    [v5 addSubview:self->_passThroughView];
    uint64_t v9 = +[MKSystemController sharedInstance];
    unsigned int v10 = [v9 isInternalInstall];

    if (v10)
    {
      id v12 = +[NSUserDefaults standardUserDefaults];
      -[UIView setHidden:](self->_passThroughView, "setHidden:", [v12 BOOLForKey:@"__internal__DisableChrome"]);
    }
    LODWORD(v11) = 1148846080;
    id v13 = [(UIView *)self->_passThroughView _maps_constraintsEqualToEdgesOfView:v5 priority:v11];
    uint64_t v14 = [v13 allConstraints];
    [v5 addConstraints:v14];

    id v15 = +[NSMapTable weakToStrongObjectsMapTable];
    hidingConstraintsByOverlay = self->_hidingConstraintsByOverlay;
    self->_hidingConstraintsByOverlay = v15;

    id v17 = +[NSMapTable weakToStrongObjectsMapTable];
    showingConstraintsByOverlay = self->_showingConstraintsByOverlay;
    self->_showingConstraintsByOverlay = v17;

    v19 = +[NSMapTable weakToStrongObjectsMapTable];
    mapInsetsConstraintsByOverlay = self->_mapInsetsConstraintsByOverlay;
    self->_mapInsetsConstraintsByOverlay = v19;

    v21 = +[NSMapTable weakToStrongObjectsMapTable];
    viewportConstraintsByOverlay = self->_viewportConstraintsByOverlay;
    self->_viewportConstraintsByOverlay = v21;

    v23 = +[NSMapTable weakToStrongObjectsMapTable];
    collisionConstraintsByOverlay = self->_collisionConstraintsByOverlay;
    self->_collisionConstraintsByOverlay = v23;

    long long v25 = [(ChromeOverlayController *)self _addCollisionGuideAlongAxis:0];
    [v25 setIdentifier:@"card.collision.top"];
    long long v26 = self->_passThroughView;
    long long v27 = [v25 topAnchor];
    long long v28 = [(UIView *)self->_passThroughView topAnchor];
    long long v29 = [v27 constraintEqualToAnchor:v28];
    [(UIView *)v26 addConstraint:v29];

    long long v30 = [(ChromeOverlayController *)self _addCollisionGuideAlongAxis:1];
    [v30 setIdentifier:@"card.collision.left"];
    long long v31 = self->_passThroughView;
    v32 = [v30 leftAnchor];
    v33 = [(UIView *)self->_passThroughView leftAnchor];
    v34 = [v32 constraintEqualToAnchor:v33];
    [(UIView *)v31 addConstraint:v34];

    v35 = [(ChromeOverlayController *)self _addCollisionGuideAlongAxis:0];
    [v35 setIdentifier:@"card.collision.bottom"];
    v36 = self->_passThroughView;
    v37 = [v35 bottomAnchor];
    v38 = [(UIView *)self->_passThroughView bottomAnchor];
    v39 = [v37 constraintEqualToAnchor:v38];
    [(UIView *)v36 addConstraint:v39];

    v40 = [(ChromeOverlayController *)self _addCollisionGuideAlongAxis:1];
    [v40 setIdentifier:@"card.collision.right"];
    v41 = self->_passThroughView;
    v42 = [v40 rightAnchor];
    v43 = [(UIView *)self->_passThroughView rightAnchor];
    v44 = [v42 constraintEqualToAnchor:v43];
    [(UIView *)v41 addConstraint:v44];

    v47[0] = &off_1013AA0D8;
    v47[1] = &off_1013AA0F0;
    v48[0] = v25;
    v48[1] = v30;
    v47[2] = &off_1013AA108;
    v47[3] = &off_1013AA120;
    v48[2] = v35;
    v48[3] = v40;
    v45 = +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:4];
    collisionGuidesByEdge = self->_collisionGuidesByEdge;
    self->_collisionGuidesByEdge = v45;

    [(ChromeOverlayController *)self _activateHosting];
  }
}

- (id)_addCollisionGuideAlongAxis:(int64_t)a3
{
  id v5 = objc_alloc_init((Class)UILayoutGuide);
  [(UIView *)self->_passThroughView addLayoutGuide:v5];
  if (a3)
  {
    if (a3 != 1) {
      goto LABEL_6;
    }
    passThroughView = self->_passThroughView;
    id v6 = [v5 topAnchor];
    v20 = [(UIView *)self->_passThroughView topAnchor];
    v21 = v6;
    uint64_t v7 = [v6 constraintGreaterThanOrEqualToAnchor:v20];
    v23[0] = v7;
    objc_super v8 = [v5 bottomAnchor];
    uint64_t v9 = [(UIView *)self->_passThroughView bottomAnchor];
    unsigned int v10 = [v8 constraintLessThanOrEqualToAnchor:v9];
    v23[1] = v10;
    double v11 = [v5 heightAnchor];
    id v12 = [v11 constraintGreaterThanOrEqualToConstant:8.0];
    v23[2] = v12;
    id v13 = [v5 widthAnchor];
    uint64_t v14 = [v13 constraintEqualToConstant:0.0];
    v23[3] = v14;
    id v15 = v23;
  }
  else
  {
    passThroughView = self->_passThroughView;
    uint64_t v16 = [v5 leadingAnchor];
    v20 = [(UIView *)self->_passThroughView leadingAnchor];
    v21 = v16;
    uint64_t v7 = [v16 constraintGreaterThanOrEqualToAnchor:v20];
    v22[0] = v7;
    objc_super v8 = [v5 trailingAnchor];
    uint64_t v9 = [(UIView *)self->_passThroughView trailingAnchor];
    unsigned int v10 = [v8 constraintLessThanOrEqualToAnchor:v9];
    v22[1] = v10;
    double v11 = [v5 widthAnchor];
    id v12 = [v11 constraintGreaterThanOrEqualToConstant:8.0];
    v22[2] = v12;
    id v13 = [v5 heightAnchor];
    uint64_t v14 = [v13 constraintEqualToConstant:0.0];
    v22[3] = v14;
    id v15 = v22;
  }
  id v17 = +[NSArray arrayWithObjects:v15 count:4];
  [(UIView *)passThroughView addConstraints:v17];

LABEL_6:

  return v5;
}

- (void)addOverlay:(id)a3 inLayoutGuide:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  [(NSMutableOrderedSet *)self->_overlays addObject:v8];
  layoutGuidesByOverlay = self->_layoutGuidesByOverlay;
  if (v6) {
    [(NSMapTable *)layoutGuidesByOverlay setObject:v6 forKey:v8];
  }
  else {
    [(NSMapTable *)layoutGuidesByOverlay removeObjectForKey:v8];
  }
  if ([(ChromeOverlayController *)self _canHostOverlays]) {
    [v8 setHost:self];
  }
}

- (BOOL)_canHostOverlays
{
  uint64_t v3 = [(ChromeOverlayController *)self parentView];
  if (v3)
  {
    id v4 = [(ChromeOverlayController *)self contentLayoutGuide];
    if (v4)
    {
      id v5 = [(ChromeOverlayController *)self mapInsetsLayoutGuide];
      if (v5)
      {
        id v6 = [(ChromeOverlayController *)self viewportLayoutGuide];
        BOOL v7 = v6 != 0;
      }
      else
      {
        BOOL v7 = 0;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (UIView)parentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentView);

  return (UIView *)WeakRetained;
}

- (UILayoutGuide)contentLayoutGuide
{
  return self->_contentLayoutGuide;
}

- (UILayoutGuide)viewportLayoutGuide
{
  return self->_viewportLayoutGuide;
}

- (UILayoutGuide)mapInsetsLayoutGuide
{
  return self->_mapInsetsLayoutGuide;
}

- (void)setViewportConstraintsEnabled:(BOOL)a3 forOverlay:(id)a4
{
}

- (void)setMapInsetsConstraintsEnabled:(BOOL)a3 forOverlay:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  if (-[ChromeOverlayController _setConstraintsEnabled:container:overlay:](self, "_setConstraintsEnabled:container:overlay:", v4, self->_mapInsetsConstraintsByOverlay))
  {
    id v6 = [(ChromeOverlayController *)self delegate];
    [v6 overlayControllerDidUpdateMapInsets:self fromOverlay:v7];
  }
}

- (BOOL)_setConstraintsEnabled:(BOOL)a3 container:(id)a4 overlay:(id)a5
{
  if (a5)
  {
    BOOL v5 = a3;
    id v7 = [a4 objectForKey:a5];
    if (v7)
    {
      id v8 = self;
      if (v5)
      {
        BOOL v9 = 0;
        if (![(ChromeOverlayController *)v8 _checkIfAnyConstraints:v7 match:0])
        {
LABEL_11:

          return v9;
        }
        +[NSLayoutConstraint activateConstraints:v7];
LABEL_9:
        BOOL v9 = 1;
        goto LABEL_11;
      }
      if ([(ChromeOverlayController *)self _checkIfAnyConstraints:v7 match:1])
      {
        +[NSLayoutConstraint deactivateConstraints:v7];
        goto LABEL_9;
      }
    }
    BOOL v9 = 0;
    goto LABEL_11;
  }
  return 0;
}

- (BOOL)_checkIfAnyConstraints:(id)a3 match:(BOOL)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000C5CB8;
  v5[3] = &unk_101315690;
  BOOL v6 = a4;
  return [a3 indexOfObjectWithOptions:1 passingTest:v5] != (id)0x7FFFFFFFFFFFFFFFLL;
}

- (ChromeOverlayControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ChromeOverlayControllerDelegate *)WeakRetained;
}

- (void)_setConstraints:(id)a3 view:(id)a4 container:(id)a5 forOverlay:(id)a6
{
  id v11 = a3;
  id v8 = a5;
  id v9 = a6;
  if (v9)
  {
    unsigned int v10 = [v8 objectForKey:v9];
    +[NSLayoutConstraint deactivateConstraints:v10];
    if (v11)
    {
      +[NSLayoutConstraint activateConstraints:v11];
      [v8 setObject:v11 forKey:v9];
    }
    else
    {
      [v8 removeObjectForKey:v9];
    }
  }
}

- (void)setViewportConstraints:(id)a3 forOverlay:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ChromeOverlayController *)self parentView];
  [(ChromeOverlayController *)self _setConstraints:v7 view:v8 container:self->_viewportConstraintsByOverlay forOverlay:v6];
}

- (void)setMapInsetsConstraints:(id)a3 forOverlay:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ChromeOverlayController *)self parentView];
  [(ChromeOverlayController *)self _setConstraints:v7 view:v8 container:self->_mapInsetsConstraintsByOverlay forOverlay:v6];

  id v9 = [(ChromeOverlayController *)self delegate];
  [v9 overlayControllerDidUpdateMapInsets:self fromOverlay:v6];
}

- (UIView)overlayContentView
{
  return self->_passThroughView;
}

- (void)setViewportLayoutGuide:(id)a3
{
}

- (void)setParentView:(id)a3
{
}

- (void)setMapInsetsLayoutGuide:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (void)setContentLayoutGuide:(id)a3
{
}

- (void)setContainingViewController:(id)a3
{
}

- (void)addOverlay:(id)a3
{
}

- (void)_deactivateHosting
{
}

- (void)_activateHosting
{
  if ([(ChromeOverlayController *)self _canHostOverlays])
  {
    overlays = self->_overlays;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100A5F580;
    v4[3] = &unk_101315630;
    v4[4] = self;
    [(NSMutableOrderedSet *)overlays enumerateObjectsUsingBlock:v4];
  }
}

- (void)removeOverlay:(id)a3
{
  id v4 = a3;
  [v4 setHost:0];
  [(NSMutableOrderedSet *)self->_overlays removeObject:v4];
  [(NSMapTable *)self->_layoutGuidesByOverlay removeObjectForKey:v4];
  [(NSMapTable *)self->_hidingConstraintsByOverlay removeObjectForKey:v4];
  [(NSMapTable *)self->_showingConstraintsByOverlay removeObjectForKey:v4];
  [(NSMapTable *)self->_collisionConstraintsByOverlay removeObjectForKey:v4];
  [(NSMapTable *)self->_mapInsetsConstraintsByOverlay removeObjectForKey:v4];
  [(NSMapTable *)self->_viewportConstraintsByOverlay removeObjectForKey:v4];
}

- (void)removeAllOverlays
{
  [(ChromeOverlayController *)self _deactivateHosting];
  overlays = self->_overlays;

  [(NSMutableOrderedSet *)overlays removeAllObjects];
}

- (void)setConstraints:(id)a3 forHidingOverlay:(id)a4
{
}

- (void)setConstraints:(id)a3 forShowingOverlay:(id)a4
{
}

- (void)setShowingConstraintsEnabled:(BOOL)a3 forOverlay:(id)a4
{
  BOOL v4 = a3;
  BOOL v6 = !a3;
  hidingConstraintsByOverlay = self->_hidingConstraintsByOverlay;
  id v8 = a4;
  [(ChromeOverlayController *)self _setConstraintsEnabled:v6 container:hidingConstraintsByOverlay overlay:v8];
  [(ChromeOverlayController *)self _setConstraintsEnabled:v4 container:self->_showingConstraintsByOverlay overlay:v8];
}

- (void)overlayDidUpdateExistingMapInsetConstraints:(id)a3
{
  id v4 = a3;
  id v5 = [(ChromeOverlayController *)self delegate];
  [v5 overlayControllerDidUpdateMapInsets:self fromOverlay:v4];
}

- (void)setCollisionConstraints:(id)a3 forOverlay:(id)a4
{
}

- (void)setCollisionConstraintsEnabled:(BOOL)a3 forOverlay:(id)a4
{
}

- (id)collisionGuideForEdge:(unint64_t)a3
{
  collisionGuidesByEdge = self->_collisionGuidesByEdge;
  id v4 = +[NSNumber numberWithUnsignedInteger:a3];
  id v5 = [(NSDictionary *)collisionGuidesByEdge objectForKeyedSubscript:v4];

  return v5;
}

- (UIView)passThroughView
{
  v2 = [(ChromeOverlayController *)self delegate];
  uint64_t v3 = [v2 passThroughView];

  return (UIView *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportLayoutGuide, 0);
  objc_storeStrong((id *)&self->_mapInsetsLayoutGuide, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
  objc_destroyWeak((id *)&self->_containingViewController);
  objc_destroyWeak((id *)&self->_parentView);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_collisionGuidesByEdge, 0);
  objc_storeStrong((id *)&self->_overlays, 0);
  objc_storeStrong((id *)&self->_passThroughView, 0);
  objc_storeStrong((id *)&self->_layoutGuidesByOverlay, 0);
  objc_storeStrong((id *)&self->_collisionConstraintsByOverlay, 0);
  objc_storeStrong((id *)&self->_viewportConstraintsByOverlay, 0);
  objc_storeStrong((id *)&self->_mapInsetsConstraintsByOverlay, 0);
  objc_storeStrong((id *)&self->_showingConstraintsByOverlay, 0);

  objc_storeStrong((id *)&self->_hidingConstraintsByOverlay, 0);
}

@end