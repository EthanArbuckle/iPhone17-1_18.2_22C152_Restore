@interface TUIFeedView
+ (BOOL)areFeedUpdatesAnimated;
+ (void)performAnimatedFeedUpdates:(id)a3;
- (BOOL)_accessibilityScrollingEnabled;
- (BOOL)_shouldExtendVisibleBounds:(CGRect)a3;
- (BOOL)touchesShouldCancelInContentView:(id)a3;
- (CGPoint)contentOffsetFromProposedContentOffset:(CGPoint)a3 atScrollPosition:(unint64_t)a4;
- (CGRect)_visibleBounds;
- (NSArray)overrides;
- (NSString)renderQueryUID;
- (NSUUID)renderQueryUUID;
- (OS_dispatch_group)animatedUpdateCompletionGroup;
- (TUIFeedControllerHosting)controllerHost;
- (TUIFeedView)initWithCoder:(id)a3;
- (TUIFeedView)initWithFrame:(CGRect)a3;
- (TUIFeedViewRectScrollingDelegate)rectScrollingDelegate;
- (TUIFeedViewScrollDelegate)scrollingDelegate;
- (TUIFeedViewSubviewsDelegate)subviewsDelegate;
- (TUIImpressionSnapshot)impressionSnapshot;
- (TUILiveFloatingLayoutController)liveFloatingLayoutController;
- (TUILiveOverscrollingLayoutController)liveOverscrollingLayoutController;
- (TUILivePinningLayoutController)livePinningLayoutController;
- (TUIMutableViewState)currentViewState;
- (TUIRenderModelCollection)renderModel;
- (TUIRenderUpdateCollection)currentUpdateCollection;
- (TUIStatsFeed)stats;
- (TUIViewFactory)viewFactory;
- (UIEdgeInsets)contentInsetsForScrollingToRectWithContentInsets:(UIEdgeInsets)a3;
- (double)_contentBottomForScrollObservation;
- (double)contentHeightFactorForScrollingGuess;
- (id)descendentViewWithIdentifier:(id)a3;
- (id)descendentViewWithRefId:(id)a3;
- (id)liveLayoutAttributesForRenderModel:(id)a3;
- (id)viewAtIndexPath:(id)a3;
- (id)visibleViews;
- (unint64_t)applyPhase;
- (void)_invalidateImpressionsWithContext:(id)a3;
- (void)_invalidateIndexPaths:(id)a3;
- (void)_scrollViewDidEndDeceleration:(id)a3;
- (void)_tui_commonInit;
- (void)_updateHasOverlays;
- (void)_updateInvalidatedSubviews;
- (void)_updateLayoutAttributes:(id)a3;
- (void)_updateVisibleOverlays;
- (void)_updateVisibleSubviews;
- (void)addSectionView:(id)a3 respectingZIndex:(BOOL)a4;
- (void)appendRenderOverrideObservers:(id)a3;
- (void)applyUpdateCollection:(id)a3 updates:(id)a4;
- (void)deleteSections:(id)a3;
- (void)insertSections:(id)a3;
- (void)invalidateRenderReferenceOverride:(id)a3;
- (void)invalidateWithContext:(id)a3;
- (void)layoutSubviews;
- (void)moveSection:(unint64_t)a3 toSection:(unint64_t)a4;
- (void)performBatchUpdatesWithRenderModel:(id)a3 flags:(unint64_t)a4 block:(id)a5 completion:(id)a6;
- (void)reloadWithRenderModel:(id)a3;
- (void)renderReferenceOverridesChanged;
- (void)restoreViewStateForVisibleViews;
- (void)resumeReuseOfView:(id)a3;
- (void)saveViewStateForVisibleViews;
- (void)scrollToItemsMatchingQuery:(id)a3 atScrollPosition:(unint64_t)a4 animated:(BOOL)a5 skipVoiceOverFocus:(BOOL)a6;
- (void)setApplyPhase:(unint64_t)a3;
- (void)setBounds:(CGRect)a3;
- (void)setContentHeightFactorForScrollingGuess:(double)a3;
- (void)setControllerHost:(id)a3;
- (void)setCurrentViewState:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setImpressionSnapshot:(id)a3;
- (void)setLiveFloatingLayoutController:(id)a3;
- (void)setLiveOverscrollingLayoutController:(id)a3;
- (void)setLivePinningLayoutController:(id)a3;
- (void)setRectScrollingDelegate:(id)a3;
- (void)setRenderModel:(id)a3;
- (void)setRenderQueryUID:(id)a3;
- (void)setRenderQueryUUID:(id)a3;
- (void)setScrollingDelegate:(id)a3;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)setStats:(id)a3;
- (void)setSubviewsDelegate:(id)a3;
- (void)setViewFactory:(id)a3;
- (void)suspendReuseOfView:(id)a3;
- (void)updateLiveTransformsIfNecessaryWithViewSize:(double)a3 contentOffset:(double)a4 contentInsets:(double)a5 safeAreaInsets:(double)a6 hasTabBar:(double)a7;
@end

@implementation TUIFeedView

- (TUIFeedView)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TUIFeedView;
  v5 = [(TUIFeedView *)&v8 initWithCoder:v4];
  v6 = v5;
  if (v5) {
    [(TUIFeedView *)v5 _tui_commonInit];
  }

  return v6;
}

- (TUIFeedView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TUIFeedView;
  v3 = -[TUIFeedView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3) {
    [(TUIFeedView *)v3 _tui_commonInit];
  }
  return v4;
}

- (void)_tui_commonInit
{
  CGSize size = CGRectNull.size;
  self->_previousVisibleBounds.origin = CGRectNull.origin;
  self->_previousVisibleBounds.CGSize size = size;
  sub_12A6F4(self);
  id v4 = objc_alloc_init(TUILiveFloatingLayoutController);
  liveFloatingLayoutController = self->_liveFloatingLayoutController;
  self->_liveFloatingLayoutController = v4;

  objc_super v6 = objc_alloc_init(TUILivePinningLayoutController);
  livePinningLayoutController = self->_livePinningLayoutController;
  self->_livePinningLayoutController = v6;

  objc_super v8 = objc_alloc_init(TUILiveOverscrollingLayoutController);
  liveOverscrollingLayoutController = self->_liveOverscrollingLayoutController;
  self->_liveOverscrollingLayoutController = v8;

  v10 = objc_alloc_init(TUIMutableViewState);
  currentViewState = self->_currentViewState;
  self->_currentViewState = v10;

  id v12 = +[NSNotificationCenter defaultCenter];
  [v12 addObserver:self selector:"_scrollViewDidEndDeceleration:" name:_UIScrollViewDidEndDeceleratingNotification object:self];
}

- (void)addSectionView:(id)a3 respectingZIndex:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  objc_super v6 = [v5 renderModel];
  v7 = v6;
  if (v6)
  {
    [v6 config];
    uint64_t v8 = v37;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v35 = 0;
    uint64_t v36 = 0;
    uint64_t v37 = 0;
  }

  v9 = [(TUIFeedView *)self subviews];
  v10 = v9;
  if (v4 && [v9 count])
  {
    v29 = v10;
    uint64_t v11 = objc_opt_class();
    id v12 = [v10 lastObject];
    v13 = TUIDynamicCast(v11, v12);

    if (!v13) {
      goto LABEL_12;
    }
    v14 = [v13 renderModel];
    v15 = v14;
    if (v14)
    {
      [v14 config];
      uint64_t v16 = v37;
    }
    else
    {
      uint64_t v16 = 0;
      uint64_t v35 = 0;
      uint64_t v36 = 0;
      uint64_t v37 = 0;
    }
    BOOL v17 = v16 > v8;

    if (!v17)
    {
      [(TUIFeedView *)self addSubview:v5];
    }
    else
    {
LABEL_12:
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v18 = v29;
      id v19 = [v18 countByEnumeratingWithState:&v31 objects:v38 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v32;
        while (2)
        {
          for (i = 0; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v32 != v20) {
              objc_enumerationMutation(v18);
            }
            v22 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            uint64_t v23 = objc_opt_class();
            TUIDynamicCast(v23, v22);
            id v24 = (id)objc_claimAutoreleasedReturnValue();

            v13 = v24;
            if (v24) {
              BOOL v25 = v24 == v5;
            }
            else {
              BOOL v25 = 1;
            }
            if (!v25)
            {
              v26 = [v24 renderModel];
              v27 = v26;
              if (v26)
              {
                [v26 config];
                uint64_t v28 = v37;
              }
              else
              {
                uint64_t v28 = 0;
                uint64_t v35 = 0;
                uint64_t v36 = 0;
                uint64_t v37 = 0;
              }

              if (v8 < v28)
              {
                [(TUIFeedView *)self insertSubview:v5 belowSubview:v22];
LABEL_32:

                goto LABEL_33;
              }
              if (v8 == v28)
              {
                [(TUIFeedView *)self insertSubview:v5 aboveSubview:v13];
                goto LABEL_32;
              }
            }
          }
          id v19 = [v18 countByEnumeratingWithState:&v31 objects:v38 count:16];
          if (v19) {
            continue;
          }
          break;
        }
      }

      [(TUIFeedView *)self addSubview:v5];
    }
LABEL_33:

    v10 = v29;
  }
  else
  {
    [(TUIFeedView *)self addSubview:v5];
  }
}

- (void)setCurrentViewState:(id)a3
{
  BOOL v4 = (TUIMutableViewState *)a3;
  id v5 = v4;
  if (self->_currentViewState != v4)
  {
    if (!v4) {
      id v5 = objc_alloc_init(TUIMutableViewState);
    }
    objc_storeStrong((id *)&self->_currentViewState, v5);
    sectionModels = self->_sectionModels;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_12BB7C;
    v7[3] = &unk_255DD0;
    id v5 = v5;
    uint64_t v8 = v5;
    [(NSArray *)sectionModels enumerateObjectsUsingBlock:v7];
  }
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  id v5 = [(TUIFeedView *)self semanticContentAttribute];
  v8.receiver = self;
  v8.super_class = (Class)TUIFeedView;
  [(TUIFeedView *)&v8 setSemanticContentAttribute:a3];
  if (v5 != (id)a3)
  {
    sectionModels = self->_sectionModels;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_12BC64;
    v7[3] = &unk_255DF0;
    void v7[4] = a3;
    [(NSArray *)sectionModels enumerateObjectsUsingBlock:v7];
    sub_12A6F4(self);
    [(TUIFeedView *)self reloadWithRenderModel:self->_renderModel];
  }
}

- (void)renderReferenceOverridesChanged
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controllerHost);
  v3 = [WeakRetained renderOverrideProvider];
  BOOL v4 = [v3 renderOverrides];
  overrides = self->_overrides;
  self->_overrides = v4;
}

- (void)setControllerHost:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controllerHost);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    id v6 = objc_storeWeak((id *)&self->_controllerHost, obj);
    v7 = [obj renderOverrideProvider];
    objc_super v8 = [v7 renderOverrides];
    overrides = self->_overrides;
    self->_overrides = v8;

    id v5 = obj;
  }
}

- (void)invalidateRenderReferenceOverride:(id)a3
{
  id v6 = a3;
  renderModel = self->_renderModel;
  id v5 = [(TUIRenderModelCollection *)renderModel uids];
  [(TUIRenderModelCollection *)renderModel invalidateRenderOverride:v6 flags:0 feedView:self uids:v5];
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(TUIFeedView *)self bounds];
  v10.origin.double x = x;
  v10.origin.double y = y;
  v10.size.double width = width;
  v10.size.double height = height;
  if (!CGRectEqualToRect(v9, v10))
  {
    v8.receiver = self;
    v8.super_class = (Class)TUIFeedView;
    -[TUIFeedView setBounds:](&v8, "setBounds:", x, y, width, height);
    if ((*(unsigned char *)&self->_flags & 1) == 0)
    {
      *(unsigned char *)&self->_flags |= 1u;
      [(TUIFeedView *)self setNeedsLayout];
    }
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(TUIFeedView *)self frame];
  v27.origin.double x = v8;
  v27.origin.double y = v9;
  v27.size.double width = v10;
  v27.size.double height = v11;
  v25.origin.double x = x;
  v25.origin.double y = y;
  v25.size.double width = width;
  v25.size.double height = height;
  if (!CGRectEqualToRect(v25, v27))
  {
    [(TUIFeedView *)self bounds];
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    v24.receiver = self;
    v24.super_class = (Class)TUIFeedView;
    -[TUIFeedView setFrame:](&v24, "setFrame:", x, y, width, height);
    [(TUIFeedView *)self bounds];
    v28.origin.double x = v20;
    v28.origin.double y = v21;
    v28.size.double width = v22;
    v28.size.double height = v23;
    v26.origin.double x = v13;
    v26.origin.double y = v15;
    v26.size.double width = v17;
    v26.size.double height = v19;
    if (!CGRectEqualToRect(v26, v28) && (*(unsigned char *)&self->_flags & 1) == 0)
    {
      *(unsigned char *)&self->_flags |= 1u;
      [(TUIFeedView *)self setNeedsLayout];
    }
  }
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)TUIFeedView;
  [(TUIFeedView *)&v5 layoutSubviews];
  char flags = (char)self->_flags;
  if (flags)
  {
    *(unsigned char *)&self->_char flags = flags & 0xFE;
    [(TUIFeedView *)self _updateVisibleSubviews];
    renderModel = self->_renderModel;
    [(TUIFeedView *)self bounds];
    -[TUIRenderModelCollection updateVisibleBounds:](renderModel, "updateVisibleBounds:");
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        return;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)&self->_char flags = flags & 0xFD;
  [(TUIFeedView *)self _updateInvalidatedSubviews];
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    return;
  }
LABEL_4:
  [(TUIFeedView *)self _updateVisibleOverlays];
}

- (void)_scrollViewDidEndDeceleration:(id)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  [(TUIFeedView *)self setNeedsLayout];
}

- (BOOL)_shouldExtendVisibleBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  unsigned __int8 v9 = +[UIView _isInAnimationBlock];
  if ((v9 & 1) != 0
    || ([(TUIFeedView *)self window],
        v3 = objc_claimAutoreleasedReturnValue(),
        [v3 isRotating]))
  {
    v12.origin.CGFloat x = x;
    v12.origin.CGFloat y = y;
    v12.size.CGFloat width = width;
    v12.size.CGFloat height = height;
    BOOL v10 = CGRectIntersectsRect(v12, self->_previousVisibleBounds);
    if (v9) {
      return v10;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (CGRect)_visibleBounds
{
  [(TUIFeedView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  if (qword_2DF748 != -1) {
    dispatch_once(&qword_2DF748, &stru_256010);
  }
  double v11 = *(double *)&qword_2DE390;
  v22.origin.CGFloat x = v4;
  v22.origin.CGFloat y = v6;
  v22.size.CGFloat width = v8;
  v22.size.CGFloat height = v10;
  CGFloat v12 = -(v11 * CGRectGetWidth(v22));
  v23.origin.CGFloat x = v4;
  v23.origin.CGFloat y = v6;
  v23.size.CGFloat width = v8;
  v23.size.CGFloat height = v10;
  CGFloat v13 = -(v11 * CGRectGetHeight(v23));
  v24.origin.CGFloat x = v4;
  v24.origin.CGFloat y = v6;
  v24.size.CGFloat width = v8;
  v24.size.CGFloat height = v10;
  CGRect v25 = CGRectInset(v24, v12, v13);
  CGFloat x = v25.origin.x;
  CGFloat y = v25.origin.y;
  CGFloat width = v25.size.width;
  CGFloat height = v25.size.height;
  if (-[TUIFeedView _shouldExtendVisibleBounds:](self, "_shouldExtendVisibleBounds:"))
  {
    v26.origin.CGFloat x = x;
    v26.origin.CGFloat y = y;
    v26.size.CGFloat width = width;
    v26.size.CGFloat height = height;
    CGRect v27 = CGRectUnion(v26, self->_previousVisibleBounds);
    CGFloat x = v27.origin.x;
    CGFloat y = v27.origin.y;
    CGFloat width = v27.size.width;
    CGFloat height = v27.size.height;
  }
  double v18 = x;
  double v19 = y;
  double v20 = width;
  double v21 = height;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (void)_updateVisibleSubviews
{
  [(TUIFeedView *)self _visibleBounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  self->_previousVisibleBounds.origin.CGFloat x = v3;
  self->_previousVisibleBounds.origin.CGFloat y = v5;
  self->_previousVisibleBounds.size.CGFloat width = v7;
  self->_previousVisibleBounds.size.CGFloat height = v9;
  double v11 = [(TUIRenderModelCollection *)self->_renderModel sections];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_12C40C;
  v12[3] = &unk_255E18;
  v12[4] = self;
  *(CGFloat *)&v12[5] = v4;
  *(CGFloat *)&v12[6] = v6;
  *(CGFloat *)&v12[7] = v8;
  *(CGFloat *)&v12[8] = v10;
  [v11 enumerateObjectsUsingBlock:v12];
}

- (void)_updateInvalidatedSubviews
{
  CGFloat v3 = [(TUIRenderModelCollection *)self->_renderModel sections];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_12C648;
  v4[3] = &unk_255E40;
  v4[4] = self;
  [v3 enumerateObjectsUsingBlock:v4];
}

- (void)setRenderModel:(id)a3
{
  CGFloat v5 = (TUIRenderModelCollection *)a3;
  p_renderModel = &self->_renderModel;
  if (self->_renderModel != v5)
  {
    CGFloat v10 = v5;
    objc_storeStrong((id *)&self->_renderModel, a3);
    CGFloat v7 = objc_alloc_init(TUIFeedViewInvalidationContext);
    [(TUILiveFloatingLayoutController *)self->_liveFloatingLayoutController setRenderModel:*p_renderModel withInvalidationContext:v7];
    [(TUILivePinningLayoutController *)self->_livePinningLayoutController setRenderModel:*p_renderModel withInvalidationContext:v7];
    [(TUILiveOverscrollingLayoutController *)self->_liveOverscrollingLayoutController setRenderModel:*p_renderModel withInvalidationContext:v7];
    CGFloat v8 = [(TUIFeedViewInvalidationContext *)v7 invalidatedIndexPaths];
    id v9 = [v8 count];

    if (v9) {
      [(TUIFeedView *)self invalidateWithContext:v7];
    }

    CGFloat v5 = v10;
  }
}

- (void)reloadWithRenderModel:(id)a3
{
  id v4 = a3;
  renderModel = self->_renderModel;
  self->_renderModel = 0;

  double v18 = objc_opt_new();
  CGFloat v6 = objc_opt_new();
  CGFloat v7 = [v4 matchingSectionUUID];
  CGFloat v8 = [v4 matchingSectionUID];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_12CA8C;
  v19[3] = &unk_255E90;
  v19[4] = self;
  id v9 = v4;
  id v20 = v9;
  id v10 = v7;
  id v21 = v10;
  id v11 = v8;
  id v22 = v11;
  id v12 = v18;
  id v23 = v12;
  id v13 = v6;
  id v24 = v13;
  +[UIView performWithoutAnimation:v19];
  double v14 = (NSArray *)[v12 copy];
  sectionViews = self->_sectionViews;
  self->_sectionViews = v14;

  double v16 = (NSArray *)[v13 copy];
  sectionModels = self->_sectionModels;
  self->_sectionModels = v16;

  *(unsigned char *)&self->_flags |= 1u;
  [(TUIFeedView *)self setNeedsLayout];
}

- (id)liveLayoutAttributesForRenderModel:(id)a3
{
  id v4 = a3;
  CGFloat v5 = [v4 liveTransform];
  id v6 = [v5 kind];
  if (v6 == (id)objc_opt_class())
  {
    id v10 = &OBJC_IVAR___TUIFeedView__liveFloatingLayoutController;
  }
  else
  {
    id v7 = [v5 kind];
    if (v7 == (id)objc_opt_class())
    {
      id v10 = &OBJC_IVAR___TUIFeedView__livePinningLayoutController;
    }
    else
    {
      id v8 = [v5 kind];
      if (v8 != (id)objc_opt_class())
      {
        id v9 = 0;
        goto LABEL_9;
      }
      id v10 = &OBJC_IVAR___TUIFeedView__liveOverscrollingLayoutController;
    }
  }
  id v9 = [*(id *)((char *)&self->super.super.super.super.isa + *v10) liveAttributesForRenderModel:v4];
LABEL_9:

  return v9;
}

- (void)updateLiveTransformsIfNecessaryWithViewSize:(double)a3 contentOffset:(double)a4 contentInsets:(double)a5 safeAreaInsets:(double)a6 hasTabBar:(double)a7
{
  long long v32 = objc_alloc_init(TUIFeedViewInvalidationContext);
  CGRect v26 = (char *)[a1 contentInsetAdjustmentBehavior];
  if (v26 == (unsigned char *)&def_141F14 + 2) {
    top = UIEdgeInsetsZero.top;
  }
  double bottom = UIEdgeInsetsZero.bottom;
  [a1[23] didUpdateContentOffset:v32 withInvalidationContext:a4, a5 + top];
  if (v26 == (unsigned char *)&def_141F14 + 2) {
    a14 = bottom;
  }
  if (a8 > a14) {
    a14 = a8;
  }
  [a1[24] updatePinningTransformsWithViewBounds:v32 adjustedViewBounds:a10 invalidationContext:a4 hasTabBar:a5];
  [a1[25] updateOverscrollingTransformsWithContentOffset:v32 invalidationContext:a4, a5];
  v29 = [(TUIFeedViewInvalidationContext *)v32 invalidatedIndexPaths];
  id v30 = [v29 count];

  if (v30)
  {
    [a1 invalidateWithContext:v32];
    [a1 layoutIfNeeded];
  }
}

- (void)scrollToItemsMatchingQuery:(id)a3 atScrollPosition:(unint64_t)a4 animated:(BOOL)a5 skipVoiceOverFocus:(BOOL)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  [(TUIFeedView *)self saveViewStateForVisibleViews];
  [(TUIRenderModelCollection *)self->_renderModel boundingRectForMatchingQuery:v10 viewState:self->_currentViewState];
  double x = v22.origin.x;
  double y = v22.origin.y;
  double width = v22.size.width;
  double height = v22.size.height;
  v23.origin.double x = CGRectNull.origin.x;
  v23.origin.double y = CGRectNull.origin.y;
  v23.size.double width = CGRectNull.size.width;
  v23.size.double height = CGRectNull.size.height;
  if (!CGRectEqualToRect(v22, v23))
  {
    -[TUIFeedView tui_scrollToRect:atScrollPosition:animated:delegate:](self, "tui_scrollToRect:atScrollPosition:animated:delegate:", a4, v7, self, x, y, width, height);
    CGFloat v15 = [(TUIFeedView *)self scrollingDelegate];
    [v15 didScrollToQuery:v10];

    if (UIAccessibilityIsVoiceOverRunning() && !a6)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_12D550;
      v21[3] = &unk_255EB8;
      *(double *)&v21[5] = x;
      *(double *)&v21[6] = y;
      *(double *)&v21[7] = width;
      *(double *)&v21[8] = height;
      v21[4] = self;
      double v16 = objc_retainBlock(v21);
      CGFloat v17 = v16;
      if (v7)
      {
        dispatch_time_t v18 = dispatch_time(0, 1000000000);
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_12D6EC;
        v19[3] = &unk_253338;
        id v20 = v17;
        dispatch_after(v18, (dispatch_queue_t)&_dispatch_main_q, v19);
      }
      else
      {
        ((void (*)(void *))v16[2])(v16);
      }
    }
  }
}

- (UIEdgeInsets)contentInsetsForScrollingToRectWithContentInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  id v8 = [(TUIFeedView *)self rectScrollingDelegate];
  if (v8)
  {
    id v9 = [(TUIFeedView *)self rectScrollingDelegate];
    [v9 contentInsetsForScrollingToRectWithContentInsets:top, left, bottom, right];
    double top = v10;
    double left = v11;
    double bottom = v12;
    double right = v13;
  }
  double v14 = top;
  double v15 = left;
  double v16 = bottom;
  double v17 = right;
  result.double right = v17;
  result.double bottom = v16;
  result.double left = v15;
  result.double top = v14;
  return result;
}

- (CGPoint)contentOffsetFromProposedContentOffset:(CGPoint)a3 atScrollPosition:(unint64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  BOOL v7 = [(TUIRenderModelCollection *)self->_renderModel anchorSet];
  if (v7)
  {
    id v8 = [(TUIRenderModelCollection *)self->_renderModel anchorSet];
    [v8 proposeAnchorOffsetWithScrollView:self velocity:CGPointZero.x target:CGPointZero.y x:x y:y];
    double x = v9;
    double y = v10;
  }
  double v11 = x;
  double v12 = y;
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (void)_updateLayoutAttributes:(id)a3
{
  id v20 = a3;
  CGRect v22 = [(TUIRenderModelCollection *)self->_renderModel sections];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v20;
  id v24 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v38;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v38 != v23) {
          objc_enumerationMutation(obj);
        }
        long long v31 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        CGRect v25 = [v31 indexPath];
        id v3 = [v25 tui_section];
        renderQueryUUID = self->_renderQueryUUID;
        if (renderQueryUUID)
        {
          long long v32 = renderQueryUUID;
        }
        else
        {
          CGFloat v5 = [v22 objectAtIndexedSubscript:v3];
          id v6 = [v5 entry];
          long long v32 = [v6 uuid];
        }
        renderQueryUID = self->_renderQueryUID;
        if (renderQueryUID)
        {
          id v8 = renderQueryUID;
        }
        else
        {
          double v9 = [v22 objectAtIndexedSubscript:v3];
          double v10 = [v9 entry];
          id v8 = [v10 uid];
        }
        v29 = [v31 refId];
        id v30 = [v31 refInstance];
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        CGRect v28 = self->_overrides;
        id v11 = [(NSArray *)v28 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v34;
          do
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v34 != v12) {
                objc_enumerationMutation(v28);
              }
              double v14 = *(void **)(*((void *)&v33 + 1) + 8 * (void)j);
              double v15 = [v14 query];
              if ([(TUIRenderReferenceIdentifier *)v15 matchesUUID:v32 uid:v8])
              {
                double v16 = [v14 query];
                double v17 = [v31 renderModel];
                dispatch_time_t v18 = [v17 identifier];
                unsigned int v19 = [v16 matchesRefId:v29 refInstance:v30 identifier:v18];

                if (!v19) {
                  continue;
                }
                double v15 = [[TUIRenderReferenceIdentifier alloc] initWithUUID:v32 uid:v8 refId:v29 refInstance:v30];
                [v14 updateLayoutAttributes:v31 forIdentifier:v15];
              }
            }
            id v11 = [(NSArray *)v28 countByEnumeratingWithState:&v33 objects:v41 count:16];
          }
          while (v11);
        }
      }
      id v24 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v24);
  }
}

- (void)setImpressionSnapshot:(id)a3
{
  CGFloat v5 = (TUIImpressionSnapshot *)a3;
  if (self->_impressionSnapshot != v5)
  {
    double v9 = v5;
    id v6 = objc_alloc_init(TUIFeedViewInvalidationContext);
    [(TUIFeedView *)self _invalidateImpressionsWithContext:v6];
    objc_storeStrong((id *)&self->_impressionSnapshot, a3);
    [(TUIFeedView *)self _invalidateImpressionsWithContext:v6];
    [(TUIFeedView *)self _updateHasOverlays];
    [(TUIFeedView *)self _updateVisibleOverlays];
    BOOL v7 = [(TUIFeedViewInvalidationContext *)v6 invalidatedIndexPaths];
    id v8 = [v7 count];

    if (v8)
    {
      *(unsigned char *)&self->_flags |= 1u;
      [(TUIFeedView *)self setNeedsLayout];
      [(TUIFeedView *)self invalidateWithContext:v6];
    }

    CGFloat v5 = v9;
  }
}

- (void)_invalidateImpressionsWithContext:(id)a3
{
  id v4 = a3;
  if (self->_impressionSnapshot)
  {
    CGFloat v5 = objc_opt_new();
    -[TUIRenderModelCollection appendImpressionLayoutAttributes:forElementsInRect:snapshot:](self->_renderModel, "appendImpressionLayoutAttributes:forElementsInRect:snapshot:", v5, self->_impressionSnapshot, CGRectInfinite.origin.x, CGRectInfinite.origin.y, CGRectInfinite.size.width, CGRectInfinite.size.height);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = v5;
    id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
      do
      {
        double v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v6);
          }
          double v10 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) indexPath:(void)v11];
          [v4 invalidateIndexPath:v10];

          double v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (void)setStats:(id)a3
{
  p_stats = &self->_stats;
  long long v36 = (TUIStatsFeed *)a3;
  if (*p_stats != v36)
  {
    objc_storeStrong((id *)&self->_stats, a3);
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v6 = [(NSDictionary *)self->_statsIndicatorViews allValues];
    id v7 = [v6 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v43;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v43 != v8) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v42 + 1) + 8 * i) removeFromSuperview];
        }
        id v7 = [v6 countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v7);
    }

    statsIndicatorViews = self->_statsIndicatorViews;
    self->_statsIndicatorViews = 0;

    [(TUIFeedView *)self bounds];
    CGFloat Width = CGRectGetWidth(v48);
    BOOL v12 = Width > 320.0;
    double v13 = Width + -10.0;
    if (v12) {
      double v14 = 310.0;
    }
    else {
      double v14 = v13;
    }
    double v15 = objc_opt_new();
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = [(TUIStatsFeed *)*p_stats currentEntriesUID];
    id v16 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v16)
    {
      uint64_t v17 = 0;
      uint64_t v18 = *(void *)v39;
      double v19 = 0.0;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v39 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void *)(*((void *)&v38 + 1) + 8 * (void)j);
          CGRect v22 = [(TUIRenderModelCollection *)self->_renderModel sections];
          uint64_t v23 = [v22 objectAtIndexedSubscript:(char *)j + v17];

          [v23 offset];
          double v26 = v25;
          if (v24 <= v19) {
            double v27 = v19;
          }
          else {
            double v27 = v24;
          }
          double v28 = v27;
          v29 = +[TUIStatsIndicatorView renderModelWithIdentifier:&off_267C10 stats:*p_stats uid:v21];
          id v30 = [[TUIRenderModelTransform alloc] initWithSubmodel:v29];
          [(TUIRenderModelTransform *)v30 setZIndex:1000];
          [(TUIRenderModelTransform *)v30 size];
          [(TUIRenderModelTransform *)v30 setSize:v14];
          [(TUIRenderModelTransform *)v30 size];
          double v32 = v31;
          [(TUIRenderModelTransform *)v30 size];
          -[TUIRenderModelTransform setCenter:](v30, "setCenter:", v26 + v32 * 0.5 + 5.0, v28 + v33 * 0.5 + 5.0);
          [v15 addObject:v30];
          [v29 size];
          double v35 = v34;

          double v19 = v28 + v35 + 5.0;
        }
        id v16 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
        v17 += (uint64_t)j;
      }
      while (v16);
    }

    objc_storeStrong((id *)&self->_statsIndicatorModels, v15);
    [(TUIFeedView *)self _updateHasOverlays];
    [(TUIFeedView *)self _updateVisibleOverlays];
  }
}

- (void)_updateHasOverlays
{
  if (self->_impressionSnapshot) {
    char v2 = 4;
  }
  else {
    char v2 = 4 * (self->_stats != 0);
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFB | v2;
}

- (void)_updateVisibleOverlays
{
  [(TUIFeedView *)self _visibleBounds];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  id v11 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:self->_statsIndicatorViews];
  statsIndicatorModels = self->_statsIndicatorModels;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_12E560;
  v16[3] = &unk_255EE0;
  v16[4] = self;
  uint64_t v18 = v4;
  uint64_t v19 = v6;
  uint64_t v20 = v8;
  uint64_t v21 = v10;
  double v13 = (NSDictionary *)v11;
  uint64_t v17 = v13;
  [(NSArray *)statsIndicatorModels enumerateObjectsUsingBlock:v16];
  statsIndicatorViews = self->_statsIndicatorViews;
  self->_statsIndicatorViews = v13;
  double v15 = v13;
}

- (void)applyUpdateCollection:(id)a3 updates:(id)a4
{
  id v10 = a3;
  uint64_t v7 = (void (**)(void))a4;
  if (v7)
  {
    p_currentUpdateCollection = &self->_currentUpdateCollection;
    objc_storeStrong((id *)p_currentUpdateCollection, a3);
    v7[2](v7);
    uint64_t v9 = *p_currentUpdateCollection;
    *p_currentUpdateCollection = 0;
  }
}

- (void)performBatchUpdatesWithRenderModel:(id)a3 flags:(unint64_t)a4 block:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = (void (**)(void))a5;
  double v28 = (void (**)(void))a6;
  BOOL v12 = [TUIIndexMapper alloc];
  double v13 = [(TUIRenderModelCollection *)self->_renderModel sections];
  double v14 = -[TUIIndexMapper initWithCount:](v12, "initWithCount:", [v13 count]);
  sectionIndexMapper = self->_sectionIndexMapper;
  self->_sectionIndexMapper = v14;

  v11[2](v11);
  id v16 = +[_TUIAnimationState currentState];
  unsigned int v17 = [v16 shouldCaptureCALayerAnimations];
  if (v17) {
    dispatch_group_t v18 = dispatch_group_create();
  }
  else {
    dispatch_group_t v18 = 0;
  }
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_12EC50;
  v31[3] = &unk_255FA0;
  v31[4] = self;
  id v19 = v10;
  id v32 = v19;
  unint64_t v35 = a4;
  uint64_t v20 = v18;
  double v33 = v20;
  char v36 = v17;
  id v21 = v16;
  id v34 = v21;
  CGRect v22 = objc_retainBlock(v31);
  uint64_t v23 = v22;
  if (v17)
  {
    objc_storeStrong((id *)&self->_animatedUpdateCompletionGroup, v18);
    dispatch_group_enter(v20);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_12FCF4;
    v29[3] = &unk_255FC8;
    double v24 = v20;
    id v30 = v24;
    +[UIView animateWithDuration:0 delay:v23 options:v29 animations:0.0 completion:0.0];
    animatedUpdateCompletionGroup = self->_animatedUpdateCompletionGroup;
    self->_animatedUpdateCompletionGroup = 0;

    double v26 = v28;
    if (v28) {
      TUIDispatchGroupNotifyViaRunloopIfMain(v24, &_dispatch_main_q, v28);
    }
  }
  else
  {
    double v26 = v28;
    ((void (*)(void *))v22[2])(v22);
    if (v28) {
      v28[2](v28);
    }
  }
  double v27 = self->_sectionIndexMapper;
  self->_sectionIndexMapper = 0;
}

- (void)insertSections:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_12FD74;
  v3[3] = &unk_255FF0;
  v3[4] = self;
  [a3 enumerateIndexesUsingBlock:v3];
}

- (void)deleteSections:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_12FE04;
  v3[3] = &unk_255FF0;
  v3[4] = self;
  [a3 enumerateIndexesUsingBlock:v3];
}

- (void)moveSection:(unint64_t)a3 toSection:(unint64_t)a4
{
}

- (void)_invalidateIndexPaths:(id)a3
{
  id v18 = a3;
  NSUInteger v4 = [(NSArray *)self->_sectionModels count];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v18;
  id v5 = [obj countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v5)
  {
    char v6 = 0;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v10 = [v9 tui_section];
        if ((unint64_t)v10 >= v4)
        {
          if (_TUIDeviceHasInternalInstall())
          {
            BOOL v12 = TUIDefaultLog();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              sectionModels = self->_sectionModels;
              *(_DWORD *)buf = 134218498;
              id v27 = v10;
              __int16 v28 = 2048;
              NSUInteger v29 = v4;
              __int16 v30 = 2112;
              double v31 = sectionModels;
              _os_log_error_impl(&def_141F14, v12, OS_LOG_TYPE_ERROR, "invalid section addressed: %lu (of %lu) with _sectionModels: %@", buf, 0x20u);
            }

            if (_TUIDeviceHasInternalInstall())
            {
              id v15 = objc_alloc((Class)NSException);
              CFStringRef v24 = @"indexPath";
              double v25 = v9;
              id v16 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
              id v17 = [v15 initWithName:@"InvalidSection" reason:@"An invalid indexPath was used" userInfo:v16];

              objc_exception_throw(v17);
            }
          }
          id v11 = 0;
        }
        else
        {
          id v11 = [(NSArray *)self->_sectionModels objectAtIndexedSubscript:v10];
        }
        unsigned __int8 v13 = [v11 invalidateViewAtIndexPath:v9];

        v6 |= v13;
      }
      id v5 = [obj countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v5);

    if ((v6 & 1) != 0 && (*(unsigned char *)&self->_flags & 2) == 0)
    {
      *(unsigned char *)&self->_flags |= 2u;
      [(TUIFeedView *)self setNeedsLayout];
    }
  }
  else
  {
  }
}

- (id)viewAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [v4 tui_section];
  if (v5 >= (id)[(NSArray *)self->_sectionModels count])
  {
    uint64_t v7 = 0;
  }
  else
  {
    char v6 = [(NSArray *)self->_sectionModels objectAtIndexedSubscript:v5];
    uint64_t v7 = [v6 visibleViewAtIndexPath:v4];
  }

  return v7;
}

- (void)invalidateWithContext:(id)a3
{
  id v4 = [a3 invalidatedIndexPaths];
  -[TUIFeedView _invalidateIndexPaths:](self, "_invalidateIndexPaths:");
}

+ (BOOL)areFeedUpdatesAnimated
{
  if (qword_2DF740) {
    return [(id)qword_2DF740 BOOLValue];
  }
  else {
    return +[UIView areAnimationsEnabled];
  }
}

+ (void)performAnimatedFeedUpdates:(id)a3
{
  uint64_t v3 = (void (**)(void))a3;
  if (v3)
  {
    uint64_t v9 = v3;
    id v4 = (id)qword_2DF740;
    if (!qword_2DF740)
    {
      uint64_t v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[UIView areAnimationsEnabled]);
      char v6 = (void *)qword_2DF740;
      qword_2DF740 = v5;
    }
    BOOL v7 = +[UIView areAnimationsEnabled];
    +[UIView setAnimationsEnabled:1];
    v9[2]();
    +[UIView setAnimationsEnabled:v7];
    uint64_t v8 = (void *)qword_2DF740;
    qword_2DF740 = (uint64_t)v4;

    uint64_t v3 = v9;
  }
}

- (void)suspendReuseOfView:(id)a3
{
  id v8 = a3;
  id v4 = [v8 layoutAttributes];
  uint64_t v5 = [v4 indexPath];
  id v6 = [v5 tui_section];

  if (v6 < (id)[(NSArray *)self->_sectionModels count])
  {
    BOOL v7 = [(NSArray *)self->_sectionModels objectAtIndexedSubscript:v6];
    [v7 suspendReuseOfView:v8];
  }
}

- (void)resumeReuseOfView:(id)a3
{
  id v8 = a3;
  id v4 = [v8 layoutAttributes];
  uint64_t v5 = [v4 indexPath];
  id v6 = [v5 tui_section];

  if (v6 < (id)[(NSArray *)self->_sectionModels count])
  {
    BOOL v7 = [(NSArray *)self->_sectionModels objectAtIndexedSubscript:v6];
    [v7 resumeReuseOfView:v8];
  }
}

- (id)visibleViews
{
  uint64_t v3 = objc_opt_new();
  sectionModels = self->_sectionModels;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1305FC;
  v8[3] = &unk_255DD0;
  id v5 = v3;
  id v9 = v5;
  [(NSArray *)sectionModels enumerateObjectsUsingBlock:v8];
  id v6 = [v5 copy];

  return v6;
}

- (void)appendRenderOverrideObservers:(id)a3
{
  id v4 = a3;
  [v4 addObject:self];
  sectionModels = self->_sectionModels;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1306DC;
  v7[3] = &unk_255DD0;
  id v6 = v4;
  id v8 = v6;
  [(NSArray *)sectionModels enumerateObjectsUsingBlock:v7];
}

- (void)saveViewStateForVisibleViews
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id obj = [(TUIFeedView *)self visibleViews];
  id v3 = [obj countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v13;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        BOOL v7 = [v6 viewStateSave];
        if (v7)
        {
          id v8 = [v6 layoutAttributes];
          id v9 = [v8 indexPath];
          id v10 = [(TUIRenderModelCollection *)self->_renderModel identifierForViewAtIndexPath:v9];
          [(TUIMutableViewState *)self->_currentViewState setViewState:v7 forIdentifier:v10];
        }
      }
      id v3 = [obj countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v3);
  }
}

- (void)restoreViewStateForVisibleViews
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id obj = [(TUIFeedView *)self visibleViews];
  id v3 = [obj countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v13;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        BOOL v7 = [v6 layoutAttributes];
        id v8 = [v7 indexPath];
        id v9 = [(TUIRenderModelCollection *)self->_renderModel identifierForViewAtIndexPath:v8];
        id v10 = [(TUIViewState *)self->_currentViewState viewStateForIdentifier:v9];
        [v6 viewStateRestore:v10];
      }
      id v3 = [obj countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v3);
  }
}

- (id)descendentViewWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [v4 tui_identifierUUID];

  if (v5)
  {
    long long v47 = 0uLL;
    long long v48 = 0uLL;
    long long v45 = 0uLL;
    long long v46 = 0uLL;
    id obj = self->_sectionModels;
    id v6 = [(NSArray *)obj countByEnumeratingWithState:&v45 objects:v52 count:16];
    if (v6)
    {
      BOOL v7 = 0;
      uint64_t v8 = *(void *)v46;
      uint64_t v30 = *(void *)v46;
      while (1)
      {
        id v32 = v6;
        for (i = 0; i != v32; i = (char *)i + 1)
        {
          if (*(void *)v46 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          id v11 = [v10 renderModel];
          long long v12 = [v11 UUID];
          long long v13 = [v4 tui_identifierUUID];
          unsigned int v14 = [v12 isEqual:v13];

          if (v14)
          {
            long long v15 = objc_opt_new();
            [v10 appendVisibleView:v15];
            long long v43 = 0u;
            long long v44 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            id v16 = v15;
            id v17 = [v16 countByEnumeratingWithState:&v41 objects:v51 count:16];
            if (v17)
            {
              uint64_t v18 = *(void *)v42;
              while (2)
              {
                for (j = 0; j != v17; j = (char *)j + 1)
                {
                  if (*(void *)v42 != v18) {
                    objc_enumerationMutation(v16);
                  }
                  uint64_t v20 = [*(id *)(*((void *)&v41 + 1) + 8 * (void)j) descendentViewWithIdentifier:v4];

                  if (v20)
                  {
                    long long v21 = v16;
                    BOOL v7 = (void *)v20;
                    goto LABEL_29;
                  }
                  BOOL v7 = 0;
                }
                id v17 = [v16 countByEnumeratingWithState:&v41 objects:v51 count:16];
                BOOL v7 = 0;
                if (v17) {
                  continue;
                }
                break;
              }

LABEL_19:
              long long v21 = [v4 tui_identifierWithoutUUID];
              long long v39 = 0u;
              long long v40 = 0u;
              long long v37 = 0u;
              long long v38 = 0u;
              id v22 = v16;
              id v23 = [v22 countByEnumeratingWithState:&v37 objects:v50 count:16];
              if (v23)
              {
                uint64_t v24 = *(void *)v38;
LABEL_21:
                uint64_t v25 = 0;
                while (1)
                {
                  if (*(void *)v38 != v24) {
                    objc_enumerationMutation(v22);
                  }
                  BOOL v7 = [*(id *)(*((void *)&v37 + 1) + 8 * v25) descendentViewWithIdentifier:v21];
                  if (v7) {
                    break;
                  }
                  if (v23 == (id)++v25)
                  {
                    id v23 = [v22 countByEnumeratingWithState:&v37 objects:v50 count:16];
                    if (v23) {
                      goto LABEL_21;
                    }
                    goto LABEL_27;
                  }
                }
              }
              else
              {
LABEL_27:
                BOOL v7 = 0;
              }

              uint64_t v8 = v30;
LABEL_29:
            }
            else
            {

              if (!v7) {
                goto LABEL_19;
              }
            }

            continue;
          }
        }
        id v6 = [(NSArray *)obj countByEnumeratingWithState:&v45 objects:v52 count:16];
        if (!v6) {
          goto LABEL_43;
        }
      }
    }
LABEL_42:
    BOOL v7 = 0;
    goto LABEL_43;
  }
  long long v35 = 0uLL;
  long long v36 = 0uLL;
  long long v33 = 0uLL;
  long long v34 = 0uLL;
  id obj = [(TUIFeedView *)self visibleViews];
  id v26 = [(NSArray *)obj countByEnumeratingWithState:&v33 objects:v49 count:16];
  if (!v26) {
    goto LABEL_42;
  }
  uint64_t v27 = *(void *)v34;
LABEL_36:
  uint64_t v28 = 0;
  while (1)
  {
    if (*(void *)v34 != v27) {
      objc_enumerationMutation(obj);
    }
    BOOL v7 = [*(id *)(*((void *)&v33 + 1) + 8 * v28) descendentViewWithIdentifier:v4];
    if (v7) {
      break;
    }
    if (v26 == (id)++v28)
    {
      id v26 = [(NSArray *)obj countByEnumeratingWithState:&v33 objects:v49 count:16];
      if (!v26) {
        goto LABEL_42;
      }
      goto LABEL_36;
    }
  }
LABEL_43:

  return v7;
}

- (id)descendentViewWithRefId:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(TUIFeedView *)self visibleViews];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v5);
      }
      id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * v8) descendentViewWithRefId:v4];
      if (v9) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    id v9 = 0;
  }

  return v9;
}

- (BOOL)touchesShouldCancelInContentView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = TUIDynamicCast(v5, v4);

  if (v6)
  {
    BOOL v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)TUIFeedView;
    BOOL v7 = [(TUIFeedView *)&v9 touchesShouldCancelInContentView:v4];
  }

  return v7;
}

- (double)_contentBottomForScrollObservation
{
  v5.receiver = self;
  v5.super_class = (Class)TUIFeedView;
  [(TUIFeedView *)&v5 _contentBottomForScrollObservation];
  [(TUIFeedView *)self bounds];
  return self->_contentHeightFactorForScrollingGuess * v3;
}

- (BOOL)_accessibilityScrollingEnabled
{
  return 1;
}

- (TUIFeedViewSubviewsDelegate)subviewsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_subviewsDelegate);

  return (TUIFeedViewSubviewsDelegate *)WeakRetained;
}

- (void)setSubviewsDelegate:(id)a3
{
}

- (TUIFeedViewRectScrollingDelegate)rectScrollingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rectScrollingDelegate);

  return (TUIFeedViewRectScrollingDelegate *)WeakRetained;
}

- (void)setRectScrollingDelegate:(id)a3
{
}

- (TUIFeedViewScrollDelegate)scrollingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollingDelegate);

  return (TUIFeedViewScrollDelegate *)WeakRetained;
}

- (void)setScrollingDelegate:(id)a3
{
}

- (TUIStatsFeed)stats
{
  return self->_stats;
}

- (TUIRenderModelCollection)renderModel
{
  return self->_renderModel;
}

- (TUIViewFactory)viewFactory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewFactory);

  return (TUIViewFactory *)WeakRetained;
}

- (void)setViewFactory:(id)a3
{
}

- (TUIImpressionSnapshot)impressionSnapshot
{
  return self->_impressionSnapshot;
}

- (TUIFeedControllerHosting)controllerHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controllerHost);

  return (TUIFeedControllerHosting *)WeakRetained;
}

- (TUILiveFloatingLayoutController)liveFloatingLayoutController
{
  return self->_liveFloatingLayoutController;
}

- (void)setLiveFloatingLayoutController:(id)a3
{
}

- (TUILivePinningLayoutController)livePinningLayoutController
{
  return self->_livePinningLayoutController;
}

- (void)setLivePinningLayoutController:(id)a3
{
}

- (TUILiveOverscrollingLayoutController)liveOverscrollingLayoutController
{
  return self->_liveOverscrollingLayoutController;
}

- (void)setLiveOverscrollingLayoutController:(id)a3
{
}

- (NSUUID)renderQueryUUID
{
  return self->_renderQueryUUID;
}

- (void)setRenderQueryUUID:(id)a3
{
}

- (NSString)renderQueryUID
{
  return self->_renderQueryUID;
}

- (void)setRenderQueryUID:(id)a3
{
}

- (TUIMutableViewState)currentViewState
{
  return self->_currentViewState;
}

- (unint64_t)applyPhase
{
  return self->_applyPhase;
}

- (void)setApplyPhase:(unint64_t)a3
{
  self->_applyPhase = a3;
}

- (double)contentHeightFactorForScrollingGuess
{
  return self->_contentHeightFactorForScrollingGuess;
}

- (void)setContentHeightFactorForScrollingGuess:(double)a3
{
  self->_contentHeightFactorForScrollingGuess = a3;
}

- (NSArray)overrides
{
  return self->_overrides;
}

- (TUIRenderUpdateCollection)currentUpdateCollection
{
  return self->_currentUpdateCollection;
}

- (OS_dispatch_group)animatedUpdateCompletionGroup
{
  return self->_animatedUpdateCompletionGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedUpdateCompletionGroup, 0);
  objc_storeStrong((id *)&self->_currentUpdateCollection, 0);
  objc_storeStrong((id *)&self->_overrides, 0);
  objc_storeStrong((id *)&self->_currentViewState, 0);
  objc_storeStrong((id *)&self->_renderQueryUID, 0);
  objc_storeStrong((id *)&self->_renderQueryUUID, 0);
  objc_storeStrong((id *)&self->_liveOverscrollingLayoutController, 0);
  objc_storeStrong((id *)&self->_livePinningLayoutController, 0);
  objc_storeStrong((id *)&self->_liveFloatingLayoutController, 0);
  objc_destroyWeak((id *)&self->_controllerHost);
  objc_storeStrong((id *)&self->_impressionSnapshot, 0);
  objc_destroyWeak((id *)&self->_viewFactory);
  objc_storeStrong((id *)&self->_renderModel, 0);
  objc_storeStrong((id *)&self->_stats, 0);
  objc_destroyWeak((id *)&self->_scrollingDelegate);
  objc_destroyWeak((id *)&self->_rectScrollingDelegate);
  objc_destroyWeak((id *)&self->_subviewsDelegate);
  objc_storeStrong((id *)&self->_sectionIndexMapper, 0);
  objc_storeStrong((id *)&self->_sectionViews, 0);
  objc_storeStrong((id *)&self->_sectionModels, 0);
  objc_storeStrong((id *)&self->_statsIndicatorViews, 0);

  objc_storeStrong((id *)&self->_statsIndicatorModels, 0);
}

@end