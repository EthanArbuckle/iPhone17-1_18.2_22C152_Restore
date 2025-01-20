@interface TUIEmbeddedCollectionView
+ (id)renderModelWithUpdateController:(id)a3 uid:(id)a4 UUID:(id)a5 identifier:(id)a6 scrollIdentifier:(id)a7 ancestorScrollIdentifier:(id)a8 scrollPolicy:(id)a9 pageGap:(double)a10 gradientInsets:(UIEdgeInsets)a11 gradientFraction:(UIEdgeInsets)a12 acceptsDrop:(BOOL)a13 dropHandler:(id)a14 decelerationRate:(double)a15;
- (BOOL)acceptsDrop;
- (BOOL)visibilityProviderIsScrolling;
- (BOOL)visibilityProviderIsVisible;
- (CGRect)_leadingGradientFrame;
- (CGRect)_trailingGradientFrame;
- (CGRect)visibilityProviderVisibleBounds;
- (CGRect)visibleBounds;
- (TUIElementActionTriggerHandler)dropHandler;
- (TUIRenderUpdateCollectionController)updateController;
- (TUIReusableSubviewPool)subviewPool;
- (TUIViewFactory)factory;
- (TUIViewRegistry)registry;
- (id)_collectionRenderModel;
- (id)descendentViewWithIdentifier:(id)a3;
- (id)descendentViewWithRefId:(id)a3;
- (id)scrollView;
- (id)viewFactoryDequeueReusableSubviewWithReuseIdentifier:(id)a3 indexPath:(id)a4 host:(id)a5;
- (id)viewStateSave;
- (id)visibilityProviderHostingLayer;
- (id)visibilityProviderSections;
- (id)visibilityProviderWindowLayer;
- (void)_resetUpdateController;
- (void)_updateInsets:(id)a3;
- (void)_updateModel;
- (void)_updatePagedScrollable;
- (void)_updateScrollObserver;
- (void)_updateVisibilityCollector;
- (void)appendRenderOverrideObservers:(id)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)applyUpdate:(id)a3 controller:(id)a4 completion:(id)a5;
- (void)configureWithModel:(id)a3;
- (void)didMoveToWindow;
- (void)pagedScrollableActionChangeToPageIndex:(unint64_t)a3;
- (void)parentFeedDidUpdateTriggerStatesWithEvent:(unint64_t)a3;
- (void)prepareForReuse;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setFactory:(id)a3;
- (void)setUpdateController:(id)a3;
- (void)updateWithImpressionSnapshot:(id)a3;
- (void)viewDidEndDisplay;
- (void)viewFactoryPrepareToReuseHost:(id)a3;
- (void)viewFactoryReuseSubviews:(id)a3 host:(id)a4;
- (void)viewStateRestore:(id)a3;
- (void)viewWillDisplay;
@end

@implementation TUIEmbeddedCollectionView

- (TUIViewRegistry)registry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_factory);
  v3 = [WeakRetained registry];

  return (TUIViewRegistry *)v3;
}

+ (id)renderModelWithUpdateController:(id)a3 uid:(id)a4 UUID:(id)a5 identifier:(id)a6 scrollIdentifier:(id)a7 ancestorScrollIdentifier:(id)a8 scrollPolicy:(id)a9 pageGap:(double)a10 gradientInsets:(UIEdgeInsets)a11 gradientFraction:(UIEdgeInsets)a12 acceptsDrop:(BOOL)a13 dropHandler:(id)a14 decelerationRate:(double)a15
{
  double right = a11.right;
  double bottom = a11.bottom;
  double left = a11.left;
  double top = a11.top;
  id v25 = a14;
  id v26 = a9;
  id v27 = a8;
  id v28 = a7;
  id v29 = a6;
  id v30 = a5;
  id v31 = a4;
  id v32 = a3;
  v33 = [[TUIEmbeddedCollectionViewRenderModel alloc] initWithUpdateController:v32 uid:v31 UUID:v30];

  [(TUIEmbeddedCollectionViewRenderModel *)v33 setScrollPolicy:v26];
  [(TUIEmbeddedCollectionViewRenderModel *)v33 setPageGap:a10];
  -[TUIEmbeddedCollectionViewRenderModel setGradientInsets:](v33, "setGradientInsets:", top, left, bottom, right);
  -[TUIEmbeddedCollectionViewRenderModel setGradientFraction:](v33, "setGradientFraction:", a12.top, a12.left, a12.bottom, a12.right);
  [(TUIEmbeddedCollectionViewRenderModel *)v33 setIdentifier:v29];
  [(TUIEmbeddedCollectionViewRenderModel *)v33 setAcceptsDrop:a13];
  [(TUIEmbeddedCollectionViewRenderModel *)v33 setDropHandler:v25];

  [(TUIEmbeddedCollectionViewRenderModel *)v33 setDecelerationRate:a15];
  [(TUIEmbeddedCollectionViewRenderModel *)v33 setScrollIdentifier:v28];

  [(TUIEmbeddedCollectionViewRenderModel *)v33 setAncestorScrollIdentifier:v27];
  v34 = [[TUIRenderModelView alloc] initWithReuseIdentifier:@"TUIReuseIdentifierEmbeddedCollectionView" identifier:v29 submodel:v33];

  return v34;
}

- (void)applyLayoutAttributes:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TUIEmbeddedCollectionView;
  id v4 = a3;
  [(TUIReusableBaseView *)&v7 applyLayoutAttributes:v4];
  v5 = [v4 renderModel];

  v6 = [v5 submodel];
  [(TUIEmbeddedCollectionView *)self configureWithModel:v6];
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)TUIEmbeddedCollectionView;
  [(TUIEmbeddedCollectionView *)&v3 didMoveToWindow];
  [(TUIEmbeddedCollectionView *)self _updateVisibilityCollector];
  [(TUIVisibilityCollector *)self->_visibilityCollector updateVisible];
}

- (void)setFactory:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_factory);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_factory, obj);
    [(TUIEmbeddedCollectionView *)self _updateModel];
    v5 = obj;
  }
}

- (void)setUpdateController:(id)a3
{
  v5 = (TUIRenderUpdateCollectionController *)a3;
  p_updateController = &self->_updateController;
  updateController = self->_updateController;
  if (updateController == v5) {
    goto LABEL_12;
  }
  v20 = v5;
  [(TUIRenderUpdateCollectionController *)updateController unregisterDelegate:self];
  objc_storeStrong((id *)&self->_updateController, a3);
  v8 = [(TUIRenderUpdateCollectionController *)*p_updateController registerDelegate:self];
  v9 = [v8 first];

  v10 = [(TUIReusableBaseView *)self feedControllerHost];
  [(TUIFeedView *)self->_feedView setControllerHost:v10];

  [(TUIFeedView *)self->_feedView reloadWithRenderModel:v9];
  if ([v9 layoutDirection] == (char *)&def_141F14 + 2
    && [(TUIFeedView *)self->_feedView effectiveUserInterfaceLayoutDirection] != (char *)&def_141F14 + 1)
  {
    uint64_t v11 = 4;
  }
  else
  {
    if ([v9 layoutDirection] != (char *)&def_141F14 + 1
      || ![(TUIFeedView *)self->_feedView effectiveUserInterfaceLayoutDirection])
    {
      goto LABEL_9;
    }
    uint64_t v11 = 3;
  }
  [(TUIFeedView *)self->_feedView setSemanticContentAttribute:v11];
LABEL_9:
  double y = CGPointZero.y;
  -[TUIFeedView setContentOffset:](self->_feedView, "setContentOffset:", CGPointZero.x, y);
  [(TUIEmbeddedCollectionView *)self _updateInsets:v9];
  v13 = [(TUIEmbeddedCollectionView *)self _collectionRenderModel];
  v14 = [v13 anchorSet];

  if (v14)
  {
    feedView = self->_feedView;
    [(TUIFeedView *)feedView contentOffset];
    [v14 proposeAnchorOffsetWithScrollView:feedView velocity:CGPointZero.x, y target:v16, v17];
    -[TUIFeedView setContentOffset:](self->_feedView, "setContentOffset:");
  }
  [(TUIRenderUpdateCollectionController *)*p_updateController applyInitialUpdate];
  v18 = [(TUIFeedView *)self->_feedView controllerHost];
  v19 = [v18 triggerStateManager];
  [v19 registerEmbeddedCollectionDelegate:self];

  v5 = v20;
LABEL_12:
}

- (void)_resetUpdateController
{
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)TUIEmbeddedCollectionView;
  [(TUIReusableBaseView *)&v3 prepareForReuse];
  [(TUIEmbeddedCollectionView *)self _resetUpdateController];
  -[TUIFeedView setContentOffset:](self->_feedView, "setContentOffset:", CGPointZero.x, CGPointZero.y);
}

- (void)viewWillDisplay
{
  v14.receiver = self;
  v14.super_class = (Class)TUIEmbeddedCollectionView;
  [(TUIReusableBaseView *)&v14 viewWillDisplay];
  objc_super v3 = [(TUIReusableBaseView *)self feedControllerHost];
  [(TUIFeedView *)self->_feedView setControllerHost:v3];

  renderModel = self->_renderModel;
  if (renderModel)
  {
    v5 = [(TUIEmbeddedCollectionViewRenderModel *)renderModel identifier];
    v6 = [(TUIReusableBaseView *)self tui_querySectionUUID];
    objc_super v7 = [v5 tui_identifierByPrependingUUID:v6];

    v8 = [(TUIReusableBaseView *)self feedControllerHost];
    v9 = [v8 pagedScrollableController];
    v10 = [v9 registerPagedScrollableWithWithIdentifier:v7 action:self];
    pagedScrollable = self->_pagedScrollable;
    self->_pagedScrollable = v10;

    [(TUIEmbeddedCollectionView *)self _updatePagedScrollable];
  }
  v12 = [(TUIFeedView *)self->_feedView controllerHost];
  v13 = [v12 embeddedScrollViewCoordinator];
  [v13 registerEmbeddedScrollView:self];
}

- (void)viewDidEndDisplay
{
  if (self->_pagedScrollable)
  {
    renderModel = self->_renderModel;
    if (renderModel)
    {
      id v4 = [(TUIEmbeddedCollectionViewRenderModel *)renderModel identifier];
      v5 = [(TUIReusableBaseView *)self tui_querySectionUUID];
      v6 = [v4 tui_identifierByPrependingUUID:v5];

      objc_super v7 = [(TUIReusableBaseView *)self feedControllerHost];
      v8 = [v7 pagedScrollableController];
      [v8 unregisterPagedScrollableWithIdentifier:v6];

      pagedScrollable = self->_pagedScrollable;
      self->_pagedScrollable = 0;
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)TUIEmbeddedCollectionView;
  [(TUIReusableBaseView *)&v16 viewDidEndDisplay];
  v10 = [(TUIFeedView *)self->_feedView controllerHost];
  uint64_t v11 = [v10 triggerStateManager];
  [v11 unregisterEmbeddedCollectionDelegate:self];

  v12 = [(TUIFeedView *)self->_feedView controllerHost];
  v13 = [v12 embeddedScrollViewCoordinator];
  [v13 unregisterEmbeddedScrollView:self];

  [(TUIFeedView *)self->_feedView setControllerHost:0];
  scrollPolicdouble y = self->_scrollPolicy;
  self->_scrollPolicdouble y = 0;

  [(TUIScrollableObserverInstance *)self->_scrollObserver reset];
  scrollObserver = self->_scrollObserver;
  self->_scrollObserver = 0;

  [(TUIEmbeddedCollectionView *)self _updateVisibilityCollector];
  [(TUIEmbeddedCollectionView *)self _resetUpdateController];
}

- (void)appendRenderOverrideObservers:(id)a3
{
}

- (void)_updateInsets:(id)a3
{
  renderModel = self->_renderModel;
  id v5 = a3;
  [(TUIEmbeddedCollectionViewRenderModel *)renderModel _computedContentInsetsWithRenderModel:v5];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  p_insets = &self->_insets;
  self->_insets.double top = -v6;
  self->_insets.double left = -v8;
  self->_insets.double bottom = -v10;
  self->_insets.double right = -v12;
  v15 = (char *)[v5 layoutDirection];

  if (v15 == (unsigned char *)&def_141F14 + 2) {
    double v16 = v9;
  }
  else {
    double v16 = v13;
  }
  if (v15 == (unsigned char *)&def_141F14 + 2) {
    double v9 = v13;
  }
  [(TUIEmbeddedCollectionView *)self bounds];
  double top = p_insets->top;
  double left = self->_insets.left;
  double bottom = self->_insets.bottom;
  CGFloat v21 = p_insets->top + v20;
  double v23 = v22 - (left + self->_insets.right);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_8E38C;
  v28[3] = &unk_254290;
  v28[4] = self;
  *(double *)&v28[5] = v7;
  *(double *)&v28[6] = v9;
  *(double *)&v28[7] = v11;
  *(double *)&v28[8] = v16;
  *(double *)&v28[9] = v24 + left;
  *(CGFloat *)&v28[10] = v21;
  *(double *)&v28[11] = v23;
  *(double *)&v28[12] = v25 - (top + bottom);
  +[UIView performWithoutAnimation:v28];
  id v26 = [(TUIReusableBaseView *)self feedControllerHost];
  id v27 = [v26 viewVisibilityController];
  [v27 updatedVisibleBoundsOfScrollView:self->_feedView];
}

- (void)applyUpdate:(id)a3 controller:(id)a4 completion:(id)a5
{
  id v8 = a3;
  double v9 = (void (**)(void))a5;
  double v10 = (TUIRenderUpdateCollectionController *)a4;
  double v11 = TUIViewUpdateLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_191378(self, v8, v11);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  updateController = self->_updateController;

  if (updateController == v10)
  {
    double v13 = [v8 to];
    [(TUIEmbeddedCollectionView *)self _updateInsets:v13];

    objc_super v14 = [(TUIReusableBaseView *)self feedControllerHost];
    v15 = [v14 hostingController];

    [v15 beginViewUpdates];
    [v8 applyToFeedView:self->_feedView completion:v9];
    [v15 endViewUpdates];
    [(TUIVisibilityCollector *)self->_visibilityCollector updateSections];
    double v16 = [(TUIFeedView *)self->_feedView renderModel];
    [(TUIEmbeddedCollectionView *)self visibleBounds];
    [v16 updateVisibleBounds:];
  }
  else if (v9)
  {
    v9[2](v9);
  }
}

- (void)configureWithModel:(id)a3
{
  p_renderModel = &self->_renderModel;
  id v32 = (TUIEmbeddedCollectionViewRenderModel *)a3;
  if (*p_renderModel != v32)
  {
    [(TUIVisibilityCollector *)self->_visibilityCollector teardown];
    visibilityCollector = self->_visibilityCollector;
    self->_visibilityCollector = 0;

    if (self->_pagedScrollable && *p_renderModel)
    {
      double v7 = [(TUIEmbeddedCollectionViewRenderModel *)*p_renderModel identifier];
      id v8 = [(TUIReusableBaseView *)self tui_querySectionUUID];
      double v9 = [v7 tui_identifierByPrependingUUID:v8];

      double v10 = [(TUIReusableBaseView *)self feedControllerHost];
      double v11 = [v10 pagedScrollableController];
      [v11 unregisterPagedScrollableWithIdentifier:v9];

      pagedScrollable = self->_pagedScrollable;
      self->_pagedScrollable = 0;
    }
    objc_storeStrong((id *)&self->_renderModel, a3);
    [(TUIEmbeddedCollectionViewRenderModel *)*p_renderModel prepare];
    [(TUIEmbeddedCollectionView *)self _updateModel];
    scrollPolicdouble y = self->_scrollPolicy;
    objc_super v14 = [(TUIEmbeddedCollectionViewRenderModel *)*p_renderModel scrollPolicy];

    if (scrollPolicy != v14)
    {
      [(TUIScrollableObserverInstance *)self->_scrollObserver reset];
      scrollObserver = self->_scrollObserver;
      self->_scrollObserver = 0;

      double v16 = [(TUIEmbeddedCollectionViewRenderModel *)*p_renderModel scrollPolicy];
      double v17 = self->_scrollPolicy;
      self->_scrollPolicdouble y = v16;

      if (objc_opt_respondsToSelector())
      {
        v18 = self->_scrollPolicy;
        feedView = self->_feedView;
        double v20 = [(TUIReusableBaseView *)self feedControllerHost];
        CGFloat v21 = [(TUIEmbeddedCollectionViewRenderModel *)*p_renderModel UUID];
        double v22 = [(TUIEmbeddedCollectionViewRenderModel *)*p_renderModel uid];
        double v23 = (TUIScrollableObserverInstance *)[(TUIScrollablePolicy *)v18 newScrollableObserverInstanceWithView:feedView host:v20 uuid:v21 uid:v22];
        double v24 = self->_scrollObserver;
        self->_scrollObserver = v23;

        [(TUIEmbeddedCollectionView *)self _updateScrollObserver];
      }
    }
    [(TUIEmbeddedCollectionView *)self _updateVisibilityCollector];
    if (*p_renderModel)
    {
      double v25 = [(TUIEmbeddedCollectionViewRenderModel *)*p_renderModel identifier];
      id v26 = [(TUIReusableBaseView *)self tui_querySectionUUID];
      id v27 = [v25 tui_identifierByPrependingUUID:v26];

      id v28 = [(TUIReusableBaseView *)self feedControllerHost];
      id v29 = [v28 pagedScrollableController];
      id v30 = [v29 registerPagedScrollableWithWithIdentifier:v27 action:self];
      id v31 = self->_pagedScrollable;
      self->_pagedScrollable = v30;

      [(TUIEmbeddedCollectionView *)self _updatePagedScrollable];
    }
  }
}

- (CGRect)_leadingGradientFrame
{
  [(TUIEmbeddedCollectionView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  [(TUIEmbeddedCollectionView *)self bounds];
  double top = self->_insets.top;
  CGFloat v9 = v8 + top;
  CGFloat v11 = v10 - (top + self->_insets.bottom);
  [(TUIEmbeddedCollectionViewRenderModel *)self->_renderModel gradientInsets];
  double v13 = v12;
  [(TUIEmbeddedCollectionViewRenderModel *)self->_renderModel gradientFraction];
  double v15 = v14;
  v20.origin.x = v4;
  v20.origin.double y = v9;
  v20.size.width = v6;
  v20.size.height = v11;
  double v16 = CGRectGetMinX(v20) + fmin(v13, 0.0);
  double v17 = fabs(v13 * v15);
  double v18 = v9;
  double v19 = v11;
  result.size.height = v19;
  result.size.width = v17;
  result.origin.double y = v18;
  result.origin.x = v16;
  return result;
}

- (CGRect)_trailingGradientFrame
{
  [(TUIEmbeddedCollectionView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  [(TUIEmbeddedCollectionView *)self bounds];
  double top = self->_insets.top;
  double v9 = v8 + top;
  double v11 = v10 - (top + self->_insets.bottom);
  [(TUIEmbeddedCollectionViewRenderModel *)self->_renderModel gradientInsets];
  double v13 = v12;
  [(TUIEmbeddedCollectionViewRenderModel *)self->_renderModel gradientFraction];
  double v15 = v14;
  v22.origin.x = v4;
  v22.origin.double y = v9;
  v22.size.width = v6;
  v22.size.height = v11;
  double MaxX = CGRectGetMaxX(v22);
  double v17 = v13 * (1.0 - v15);
  if (v13 >= 0.0) {
    double v17 = v13 * v15;
  }
  double v18 = MaxX - v17;
  double v19 = fabs(v13 * v15);
  double v20 = v9;
  double v21 = v11;
  result.size.height = v21;
  result.size.width = v19;
  result.origin.double y = v20;
  result.origin.x = v18;
  return result;
}

- (void)_updateModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_factory);

  if (WeakRetained)
  {
    if (self->_renderModel)
    {
      [(TUIEmbeddedCollectionView *)self bounds];
      double top = self->_insets.top;
      double left = self->_insets.left;
      double v7 = v6 + left;
      double v9 = v8 + top;
      double v11 = v10 - (left + self->_insets.right);
      double v13 = v12 - (top + self->_insets.bottom);
      [(TUIEmbeddedCollectionViewRenderModel *)self->_renderModel gradientInsets];
      double v15 = v14;
      double v17 = v16;
      BOOL v18 = v16 != 0.0 || v14 != 0.0;
      if (!self->_feedView)
      {
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_8ED3C;
        v37[3] = &unk_2542B8;
        v37[4] = self;
        *(double *)&v37[5] = v7;
        *(double *)&v37[6] = v9;
        *(double *)&v37[7] = v11;
        *(double *)&v37[8] = v13;
        +[UIView performWithoutAnimation:v37];
      }
      if (v18)
      {
        if (!self->_leadingGradientView && v15 != 0.0)
        {
          double v19 = [_TUIEmbeddedCollectionGradientView alloc];
          [(TUIEmbeddedCollectionView *)self _leadingGradientFrame];
          double v20 = -[_TUIEmbeddedCollectionGradientView initWithFrame:](v19, "initWithFrame:");
          leadingGradientView = self->_leadingGradientView;
          self->_leadingGradientView = v20;

          [(_TUIEmbeddedCollectionGradientView *)self->_leadingGradientView configureGradientWithAxis:1 leading:1];
          [(TUIEmbeddedCollectionView *)self addSubview:self->_leadingGradientView];
        }
        [(TUIEmbeddedCollectionView *)self _leadingGradientFrame];
        -[_TUIEmbeddedCollectionGradientView setFrame:](self->_leadingGradientView, "setFrame:");
        if (!self->_trailingGradientView && v17 != 0.0)
        {
          CGRect v22 = [_TUIEmbeddedCollectionGradientView alloc];
          [(TUIEmbeddedCollectionView *)self _trailingGradientFrame];
          double v23 = -[_TUIEmbeddedCollectionGradientView initWithFrame:](v22, "initWithFrame:");
          trailingGradientView = self->_trailingGradientView;
          self->_trailingGradientView = v23;

          [(_TUIEmbeddedCollectionGradientView *)self->_trailingGradientView configureGradientWithAxis:1 leading:0];
          [(TUIEmbeddedCollectionView *)self addSubview:self->_trailingGradientView];
        }
        [(TUIEmbeddedCollectionView *)self _trailingGradientFrame];
        -[_TUIEmbeddedCollectionGradientView setFrame:](self->_trailingGradientView, "setFrame:");
      }
      double v25 = [(TUIEmbeddedCollectionView *)self layer];
      unsigned int v26 = [v25 allowsGroupBlending];

      if (v18 != v26)
      {
        id v27 = [(TUIEmbeddedCollectionView *)self layer];
        [v27 setAllowsGroupBlending:v18];
      }
      id v28 = self->_leadingGradientView;
      if (v28 && v15 == 0.0)
      {
        [(_TUIEmbeddedCollectionGradientView *)v28 removeFromSuperview];
        id v29 = self->_leadingGradientView;
        self->_leadingGradientView = 0;

        id v28 = self->_leadingGradientView;
      }
      if (v28)
      {
        if (v17 == 0.0)
        {
          [(_TUIEmbeddedCollectionGradientView *)self->_trailingGradientView removeFromSuperview];
          id v30 = self->_trailingGradientView;
          self->_trailingGradientView = 0;
        }
      }
      -[TUIFeedView setFrame:](self->_feedView, "setFrame:", v7, v9, v11, v13);
      id v31 = [(TUIReusableBaseView *)self feedControllerHost];
      id v32 = [v31 viewVisibilityController];
      [v32 updatedVisibleBoundsOfScrollView:self->_feedView];

      renderModel = self->_renderModel;
    }
    else
    {
      renderModel = 0;
    }
    v34 = [(TUIEmbeddedCollectionViewRenderModel *)renderModel uid];
    [(TUIFeedView *)self->_feedView setRenderQueryUID:v34];

    v35 = [(TUIEmbeddedCollectionViewRenderModel *)self->_renderModel UUID];
    [(TUIFeedView *)self->_feedView setRenderQueryUUID:v35];

    v36 = [(TUIEmbeddedCollectionViewRenderModel *)self->_renderModel updateController];
    [(TUIEmbeddedCollectionView *)self setUpdateController:v36];

    [(TUIEmbeddedCollectionView *)self _updateVisibilityCollector];
  }
}

- (id)_collectionRenderModel
{
  return [(TUIFeedView *)self->_feedView renderModel];
}

- (void)_updateVisibilityCollector
{
  double v3 = [(TUIFeedView *)self->_feedView controllerHost];
  id v13 = [v3 visibilityController];

  uint64_t v4 = [(TUIEmbeddedCollectionView *)self _collectionRenderModel];
  if (v4
    && (double v5 = (void *)v4,
        [(TUIEmbeddedCollectionView *)self window],
        double v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    if (!self->_visibilityCollector)
    {
      double v7 = [(TUIEmbeddedCollectionViewRenderModel *)self->_renderModel scrollIdentifier];
      double v8 = [(TUIEmbeddedCollectionViewRenderModel *)self->_renderModel ancestorScrollIdentifier];
      double v9 = (TUIVisibilityCollector *)[v13 newCollectorForProvider:self withIdentifier:v7 parentIdentifier:v8];
      visibilityCollector = self->_visibilityCollector;
      self->_visibilityCollector = v9;

      [(TUIVisibilityCollector *)self->_visibilityCollector updateSections];
      [(TUIVisibilityCollector *)self->_visibilityCollector updateVisible];
    }
  }
  else
  {
    double v11 = self->_visibilityCollector;
    if (v11)
    {
      [(TUIVisibilityCollector *)v11 teardown];
      double v12 = self->_visibilityCollector;
      self->_visibilityCollector = 0;
    }
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  id v13 = a3;
  double v9 = [(TUIEmbeddedCollectionView *)self _collectionRenderModel];
  double v10 = [v9 anchorSet];

  if (a5 && v10)
  {
    [v10 proposeAnchorOffsetWithScrollView:v13 velocity:x target:CGPointMake(a5->x, a5->y)];
    a5->double x = v11;
    a5->double y = v12;
  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  [(TUIEmbeddedCollectionView *)self _updateScrollObserver];
  [(TUIEmbeddedCollectionView *)self _updatePagedScrollable];
  visibilityCollector = self->_visibilityCollector;

  [(TUIVisibilityCollector *)visibilityCollector updateVisibleBounds];
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  [(TUIEmbeddedCollectionView *)self _updateScrollObserver];
  [(TUIEmbeddedCollectionView *)self _updatePagedScrollable];
  visibilityCollector = self->_visibilityCollector;

  [(TUIVisibilityCollector *)visibilityCollector updateVisibleBounds];
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  [(TUIEmbeddedCollectionView *)self _updateScrollObserver];
  [(TUIEmbeddedCollectionView *)self _updatePagedScrollable];
  visibilityCollector = self->_visibilityCollector;

  [(TUIVisibilityCollector *)visibilityCollector updateVisibleBounds];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
  {
    [(TUIEmbeddedCollectionView *)self _updateScrollObserver];
    [(TUIEmbeddedCollectionView *)self _updatePagedScrollable];
    visibilityCollector = self->_visibilityCollector;
    [(TUIVisibilityCollector *)visibilityCollector updateVisibleBounds];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v11 = a3;
  [(TUIVisibilityCollector *)self->_visibilityCollector updateVisibleBounds];
  [(TUIEmbeddedCollectionView *)self _updateScrollObserver];
  [(TUIEmbeddedCollectionView *)self _updatePagedScrollable];
  uint64_t v4 = [(TUIReusableBaseView *)self feedControllerHost];
  double v5 = [v4 viewVisibilityController];
  [v5 updatedVisibleBoundsOfScrollView:self->_feedView];

  double v6 = [(TUIEmbeddedCollectionView *)self _collectionRenderModel];
  double v7 = [v6 anchorSet];

  if (v7)
  {
    double v8 = [v7 computeTriggerStatesInScrollView:v11 axis:1];
    double v9 = [(TUIFeedView *)self->_feedView controllerHost];
    double v10 = [v9 triggerStateManager];
    [v10 updateEmbeddedTriggerStatesWithNewStates:v8 updateEvent:3];
  }
}

- (void)_updateScrollObserver
{
  if ([(TUIFeedView *)self->_feedView isDragging]) {
    id v3 = &def_141F14 + 1;
  }
  else {
    id v3 = [(TUIFeedView *)self->_feedView isDecelerating];
  }
  [(TUIEmbeddedCollectionView *)self visibleBounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v13 = [(TUIRenderUpdateCollectionController *)self->_updateController renderModel];
  if ([v13 layoutDirection] == (char *)&def_141F14 + 2)
  {
    [v13 size];
    double v5 = v12 - v9 - v5;
  }
  -[TUIScrollableObserverInstance updateScrollingWithVisibleBounds:active:](self->_scrollObserver, "updateScrollingWithVisibleBounds:active:", v3, v5, v7, v9, v11);
}

- (void)_updatePagedScrollable
{
  if (self->_pagedScrollable)
  {
    [(TUIFeedView *)self->_feedView contentOffset];
    double v4 = v3;
    [(TUIEmbeddedCollectionViewRenderModel *)self->_renderModel pageGap];
    double v6 = v5;
    [(TUIEmbeddedCollectionView *)self bounds];
    double v8 = v7;
    double v9 = [(TUIRenderUpdateCollectionController *)self->_updateController renderModel];
    [v9 size];
    double v11 = v10;

    double v12 = v4 - self->_insets.left;
    unint64_t v13 = vcvtpd_u64_f64((v6 + v11) / (v6 + v8));
    double v14 = v8 + v12;
    double v15 = floor(fmax(v12, 0.0) / (v6 + v8));
    if (v14 >= v11) {
      double v15 = (double)(v13 - 1);
    }
    pagedScrollable = self->_pagedScrollable;
    -[TUIPagedScrollableProviding updateWithPageIndex:pageCount:](pagedScrollable, "updateWithPageIndex:pageCount:", (unint64_t)v15);
  }
}

- (void)pagedScrollableActionChangeToPageIndex:(unint64_t)a3
{
  [(TUIFeedView *)self->_feedView contentOffset];
  double v6 = v5;
  [(TUIEmbeddedCollectionView *)self bounds];
  double v8 = v7;
  double left = self->_insets.left;
  [(TUIEmbeddedCollectionViewRenderModel *)self->_renderModel pageGap];
  double v11 = left + (double)a3 * (v8 + v10);
  [(TUIFeedView *)self->_feedView bounds];
  -[TUIFeedView tui_contentOffsetForScrollingToRect:atScrollPosition:delegate:](self->_feedView, "tui_contentOffsetForScrollingToRect:atScrollPosition:delegate:", 0, self->_feedView, v11, v6);
  feedView = self->_feedView;

  -[TUIFeedView setContentOffset:animated:](feedView, "setContentOffset:animated:", 1);
}

- (void)parentFeedDidUpdateTriggerStatesWithEvent:(unint64_t)a3
{
  double v5 = [(TUIEmbeddedCollectionView *)self _collectionRenderModel];
  id v10 = [v5 anchorSet];

  double v6 = v10;
  if (v10)
  {
    if (a3 == 1) {
      [v10 feedNotVisibleTriggerStatesForAxis:1];
    }
    else {
    double v7 = [v10 computeTriggerStatesInScrollView:self->_feedView axis:1];
    }
    if ([v7 hasUpdates])
    {
      double v8 = [(TUIFeedView *)self->_feedView controllerHost];
      double v9 = [v8 triggerStateManager];
      [v9 updateEmbeddedTriggerStatesWithNewStates:v7 updateEvent:a3];
    }
    double v6 = v10;
  }
}

- (id)viewFactoryDequeueReusableSubviewWithReuseIdentifier:(id)a3 indexPath:(id)a4 host:(id)a5
{
  p_factordouble y = &self->_factory;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_factory);
  double v12 = [WeakRetained viewFactoryDequeueReusableSubviewWithReuseIdentifier:v10 indexPath:v9 host:v8];

  return v12;
}

- (void)viewFactoryPrepareToReuseHost:(id)a3
{
  p_factordouble y = &self->_factory;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_factory);
  double v5 = [WeakRetained subviewPool];
  [v5 prepareToReuseHost:v4];
}

- (void)viewFactoryReuseSubviews:(id)a3 host:(id)a4
{
  p_factordouble y = &self->_factory;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_factory);
  id v8 = [WeakRetained subviewPool];
  [v8 reuseSubviews:v7 host:v6];
}

- (TUIReusableSubviewPool)subviewPool
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_factory);
  double v3 = [WeakRetained subviewPool];

  return (TUIReusableSubviewPool *)v3;
}

- (id)viewStateSave
{
  double v3 = objc_opt_new();
  [(TUIFeedView *)self->_feedView saveViewStateForVisibleViews];
  [(TUIFeedView *)self->_feedView contentOffset];
  [v3 setContentOffset:];
  id v4 = [(TUIFeedView *)self->_feedView currentViewState];
  id v5 = [v4 copy];
  [v3 setEmbeddedState:v5];

  return v3;
}

- (void)viewStateRestore:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [v4 contentOffset];
    double v6 = v5;
    double v8 = v7;
    [(TUIFeedView *)self->_feedView bounds];
    -[TUIFeedView tui_contentOffsetForScrollingToRect:atScrollPosition:delegate:](self->_feedView, "tui_contentOffsetForScrollingToRect:atScrollPosition:delegate:", 0, self->_feedView, v6 - self->_insets.left, v8 - self->_insets.top, v9 + self->_insets.left + self->_insets.right, v10 + self->_insets.top + self->_insets.bottom);
    -[TUIFeedView setContentOffset:](self->_feedView, "setContentOffset:");
    id v12 = [v4 embeddedState];

    id v11 = [v12 mutableCopy];
    [(TUIFeedView *)self->_feedView setCurrentViewState:v11];
  }
}

- (BOOL)acceptsDrop
{
  return [(TUIEmbeddedCollectionViewRenderModel *)self->_renderModel acceptsDrop];
}

- (TUIElementActionTriggerHandler)dropHandler
{
  return [(TUIEmbeddedCollectionViewRenderModel *)self->_renderModel dropHandler];
}

- (id)visibilityProviderHostingLayer
{
  return [(TUIFeedView *)self->_feedView layer];
}

- (id)visibilityProviderWindowLayer
{
  v2 = [(TUIFeedView *)self->_feedView window];
  double v3 = [v2 layer];

  return v3;
}

- (CGRect)visibilityProviderVisibleBounds
{
  v2 = [(TUIFeedView *)self->_feedView layer];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (id)visibilityProviderSections
{
  v2 = [(TUIEmbeddedCollectionView *)self _collectionRenderModel];
  double v3 = [v2 sections];

  return v3;
}

- (BOOL)visibilityProviderIsVisible
{
  if ([(TUIEmbeddedCollectionView *)self isHidden]) {
    return 0;
  }
  double v4 = [(TUIEmbeddedCollectionView *)self window];
  BOOL v3 = v4 != 0;

  return v3;
}

- (BOOL)visibilityProviderIsScrolling
{
  if (([(TUIFeedView *)self->_feedView isDragging] & 1) != 0
    || ([(TUIFeedView *)self->_feedView isTracking] & 1) != 0
    || ([(TUIFeedView *)self->_feedView isDecelerating] & 1) != 0)
  {
    return 1;
  }
  feedView = self->_feedView;

  return [(TUIFeedView *)feedView _isAnimatingScroll];
}

- (CGRect)visibleBounds
{
  [(TUIFeedView *)self->_feedView bounds];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (id)scrollView
{
  return self->_feedView;
}

- (void)updateWithImpressionSnapshot:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  [(TUIFeedView *)self->_feedView setImpressionSnapshot:v4];
}

- (id)descendentViewWithIdentifier:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUIEmbeddedCollectionView;
  double v5 = [(TUIReusableBaseView *)&v11 descendentViewWithIdentifier:v4];
  if (!v5)
  {
    renderModel = self->_renderModel;
    if (renderModel
      && ([(TUIEmbeddedCollectionViewRenderModel *)renderModel scrollIdentifier],
          double v7 = objc_claimAutoreleasedReturnValue(),
          unsigned int v8 = [v4 isEqual:v7],
          v7,
          v8))
    {
      double v9 = self;
    }
    else
    {
      double v9 = [(TUIFeedView *)self->_feedView descendentViewWithIdentifier:v4];
    }
    double v5 = v9;
  }

  return v5;
}

- (id)descendentViewWithRefId:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TUIEmbeddedCollectionView;
  double v5 = [(TUIReusableBaseView *)&v7 descendentViewWithRefId:v4];
  if (!v5)
  {
    double v5 = [(TUIFeedView *)self->_feedView descendentViewWithRefId:v4];
  }

  return v5;
}

- (TUIViewFactory)factory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_factory);

  return (TUIViewFactory *)WeakRetained;
}

- (TUIRenderUpdateCollectionController)updateController
{
  return self->_updateController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateController, 0);
  objc_destroyWeak((id *)&self->_factory);
  objc_storeStrong((id *)&self->_pagedScrollable, 0);
  objc_storeStrong((id *)&self->_visibilityCollector, 0);
  objc_storeStrong((id *)&self->_trailingGradientView, 0);
  objc_storeStrong((id *)&self->_leadingGradientView, 0);
  objc_storeStrong((id *)&self->_feedView, 0);
  objc_storeStrong((id *)&self->_scrollObserver, 0);
  objc_storeStrong((id *)&self->_scrollPolicy, 0);

  objc_storeStrong((id *)&self->_renderModel, 0);
}

@end