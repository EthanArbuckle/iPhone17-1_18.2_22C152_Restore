@interface MFTiltedTabView
- (BOOL)_gestureRecognizer:(id)a3 shouldInteractWithItem:(id)a4;
- (BOOL)_shouldContinueAnimatingItem:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isAnimating;
- (BOOL)isPresented;
- (BOOL)reorderingEnabled;
- (CGRect)_hitRectForItem:(id)a3;
- (CGSize)_contentSizeForItemCount:(double)a3;
- (MFTiltedTabView)initWithFrame:(CGRect)a3;
- (MFTiltedTabViewDelegate)delegate;
- (double)_baseOffsetForItem:(id)a3 index:(unint64_t *)a4 count:(double *)a5;
- (double)_baseOffsetForItemAtIndex:(unint64_t)a3 withItemCountForLayout:(double)a4;
- (double)_scrollingEffectFactorForTabsWithCount:(double)a3;
- (double)_spaceBetweenTabsWithCount:(double)a3;
- (double)_statusBarHeight;
- (double)_tabCloseAnimationSlideDistance;
- (double)_topAreaHeightForTabsWithCount:(double)a3;
- (double)_velocityForSpringAnimations;
- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4;
- (id)_makeReorderAnimationWithDirection:(int64_t)a3 springDuration:(double)a4 tabCount:(double)a5;
- (id)_tabItem;
- (id)_tiltedTabItemForLocation:(CGPoint)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)tabItemAtIndex:(unint64_t)a3;
- (id)visibleIndexSet;
- (int64_t)_currentOrientation;
- (unint64_t)_indexOfVisibleItem:(id)a3;
- (unint64_t)_numberOfItems;
- (unint64_t)rotationStyle;
- (void)_addSpringAnimationWithKeyPath:(id)a3 toLayer:(id)a4 fromValue:(id)a5 toValue:(id)a6;
- (void)_closeButtonPressed:(id)a3;
- (void)_closeItem:(id)a3;
- (void)_configureVelocityForSpringAnimation:(id)a3 withKeyPath:(id)a4;
- (void)_finishAnimations;
- (void)_installMotionEffectOntoScrollView;
- (void)_invalidateAllSnapshots;
- (void)_invalidateAllSnapshotsForce:(BOOL)a3;
- (void)_relinquishBorrowedViews;
- (void)_reorderScroll:(id)a3;
- (void)_resetInteractiveReorderOffsetAtLocation:(CGPoint)a3;
- (void)_resetItem:(id)a3;
- (void)_sendPresentedStateDidChangeToDelegateIfNeeded;
- (void)_setPressedItem:(id)a3 animated:(BOOL)a4;
- (void)_setReorderScrollVelocity:(double)a3;
- (void)_stopReorderingItem:(id)a3 withFinalTimeAdjustment:(double)a4 tabCount:(double)a5;
- (void)_tabCloseRecognized:(id)a3;
- (void)_tabPressUpdated:(id)a3;
- (void)_tabReorderRecognized:(id)a3;
- (void)_tabSelectionRecognized:(id)a3;
- (void)_uninstallMotionEffectOntoScrollView;
- (void)_updateCloseButtonImageForItem:(id)a3;
- (void)_updateItemsInvolvedInAnimation;
- (void)_updateReorderAnimationBeginTimeForLayer:(id)a3 withTimeAdjustment:(double)a4;
- (void)_updateReorderAnimationsForItem:(id)a3 withTimeAdjustment:(double)a4 tabCount:(double)a5 createIfNecessary:(BOOL)a6;
- (void)_updateReorderGesture;
- (void)_updateSpringAnimationForView:(id)a3 withBounds:(CGRect)a4 animated:(BOOL)a5;
- (void)_updateSpringAnimationForView:(id)a3 withFrame:(CGRect)a4 transform:(CATransform3D *)a5 userTransform:(CATransform3D *)a6 opacity:(double)a7 verticalScrollAdjustment:(double)a8 animated:(BOOL)a9;
- (void)_updateSpringAnimationForView:(id)a3 withFrame:(CGRect)a4 verticalScrollAdjustment:(double)a5 animated:(BOOL)a6;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)layoutItemsAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)scrollViewDidScroll:(id)a3;
- (void)selectItemAtIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setPresented:(BOOL)a3;
- (void)setPresented:(BOOL)a3 animated:(BOOL)a4;
- (void)setReorderingEnabled:(BOOL)a3;
- (void)setRotationStyle:(unint64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateSnapshotsIfNecessary;
@end

@implementation MFTiltedTabView

- (MFTiltedTabView)initWithFrame:(CGRect)a3
{
  v42.receiver = self;
  v42.super_class = (Class)MFTiltedTabView;
  v3 = -[MFTiltedTabView initWithFrame:](&v42, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIScrollView *)objc_alloc_init((Class)UIScrollView);
    scrollView = v3->_scrollView;
    v3->_scrollView = v4;

    [(UIScrollView *)v3->_scrollView setAlwaysBounceVertical:1];
    [(UIScrollView *)v3->_scrollView setClipsToBounds:0];
    uint64_t v6 = qword_1006910E8;
    v7 = [(UIScrollView *)v3->_scrollView layer];
    long long v8 = *(_OWORD *)&CATransform3DIdentity.m23;
    long long v35 = *(_OWORD *)&CATransform3DIdentity.m21;
    long long v36 = v8;
    long long v37 = *(_OWORD *)&CATransform3DIdentity.m31;
    CGFloat m33 = CATransform3DIdentity.m33;
    long long v9 = *(_OWORD *)&CATransform3DIdentity.m13;
    *(_OWORD *)location = *(_OWORD *)&CATransform3DIdentity.m11;
    long long v34 = v9;
    uint64_t v39 = v6;
    long long v10 = *(_OWORD *)&CATransform3DIdentity.m43;
    long long v40 = *(_OWORD *)&CATransform3DIdentity.m41;
    long long v41 = v10;
    [v7 setSublayerTransform:location];

    [(UIScrollView *)v3->_scrollView setDelegate:v3];
    [(UIScrollView *)v3->_scrollView setShowsHorizontalScrollIndicator:0];
    [(UIScrollView *)v3->_scrollView setShowsVerticalScrollIndicator:0];
    [(MFTiltedTabView *)v3 addSubview:v3->_scrollView];
    v11 = objc_alloc_init(_TabGradientView);
    statusBarGradient = v3->_statusBarGradient;
    v3->_statusBarGradient = v11;

    v13 = [(_TabGradientView *)v3->_statusBarGradient gradientLayer];
    +[MFSafariTabsClassConstants configureStatusBarGradientLayer:v13];
    [(MFTiltedTabView *)v3 insertSubview:v3->_statusBarGradient aboveSubview:v3->_scrollView];
    v14 = [[_MFTouchDownTapRecognizer alloc] initWithTarget:v3 action:"_tabPressUpdated:"];
    pressRecognizer = v3->_pressRecognizer;
    v3->_pressRecognizer = v14;

    location[0] = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(location, v3);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1001EC6B8;
    v31[3] = &unk_10060D420;
    objc_copyWeak(&v32, location);
    [(_MFTouchDownTapRecognizer *)v3->_pressRecognizer setTouchdownHandler:v31];
    [(MFTiltedTabView *)v3 addGestureRecognizer:v3->_pressRecognizer];
    v16 = (UIPanGestureRecognizer *)[objc_alloc((Class)UIPanGestureRecognizer) initWithTarget:v3 action:"_tabCloseRecognized:"];
    tabCloseRecognizer = v3->_tabCloseRecognizer;
    v3->_tabCloseRecognizer = v16;

    [(UIPanGestureRecognizer *)v3->_tabCloseRecognizer setDelegate:v3];
    [(UIPanGestureRecognizer *)v3->_tabCloseRecognizer _setHysteresis:25.0];
    [(UIPanGestureRecognizer *)v3->_tabCloseRecognizer _setCanPanVertically:0];
    [(MFTiltedTabView *)v3 addGestureRecognizer:v3->_tabCloseRecognizer];
    v18 = (UILongPressGestureRecognizer *)[objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:v3 action:"_tabReorderRecognized:"];
    tabReorderRecognizer = v3->_tabReorderRecognizer;
    v3->_tabReorderRecognizer = v18;

    [(UILongPressGestureRecognizer *)v3->_tabReorderRecognizer setDelegate:v3];
    [(MFTiltedTabView *)v3 addGestureRecognizer:v3->_tabReorderRecognizer];
    v20 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v3 action:"_tabSelectionRecognized:"];
    tabSelectionRecognizer = v3->_tabSelectionRecognizer;
    v3->_tabSelectionRecognizer = v20;

    [(UITapGestureRecognizer *)v3->_tabSelectionRecognizer setDelegate:v3];
    [(MFTiltedTabView *)v3 addGestureRecognizer:v3->_tabSelectionRecognizer];
    v22 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    itemsCurrentlyClosing = v3->_itemsCurrentlyClosing;
    v3->_itemsCurrentlyClosing = v22;

    uint64_t v24 = +[UIImage mf_systemImageNamed:MFImageGlyphXMark forView:1];
    closeButtonImage = v3->_closeButtonImage;
    v3->_closeButtonImage = (UIImage *)v24;

    v26 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    visibleItems = v3->_visibleItems;
    v3->_visibleItems = v26;

    v28 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    allTabItems = v3->_allTabItems;
    v3->_allTabItems = v28;

    v3->_animating = 0;
    [(MFTiltedTabView *)v3 setRotationStyle:2];
    [(MFTiltedTabView *)v3 setPreservesSuperviewLayoutMargins:1];
    objc_destroyWeak(&v32);
    objc_destroyWeak(location);
  }
  return v3;
}

- (void)_installMotionEffectOntoScrollView
{
  parallaxMotionEffectGroup = self->_parallaxMotionEffectGroup;
  if (!parallaxMotionEffectGroup)
  {
    id v4 = [objc_alloc((Class)UIInterpolatingMotionEffect) initWithKeyPath:@"sublayerTransform" type:0];
    long long v5 = *(_OWORD *)&CATransform3DIdentity.m13;
    long long v27 = *(_OWORD *)&CATransform3DIdentity.m11;
    long long v26 = v27;
    long long v25 = v5;
    long long v23 = *(_OWORD *)&CATransform3DIdentity.m23;
    long long v24 = *(_OWORD *)&CATransform3DIdentity.m21;
    long long v28 = v5;
    long long v29 = v24;
    long long v30 = v23;
    *(_OWORD *)id v32 = *(_OWORD *)&CATransform3DIdentity.m32;
    long long v21 = *(_OWORD *)v32;
    *(_OWORD *)&v32[16] = *(_OWORD *)&CATransform3DIdentity.m34;
    long long v19 = *(_OWORD *)&v32[16];
    *(_OWORD *)&v32[32] = *(_OWORD *)&CATransform3DIdentity.m42;
    long long v17 = *(_OWORD *)&v32[32];
    *(CGFloat *)&v32[48] = CATransform3DIdentity.m44;
    uint64_t v6 = *(void *)&v32[48];
    double m31 = -*(double *)&qword_1006910F0;
    v7 = +[NSValue valueWithCATransform3D:&v27];
    [v4 setMinimumRelativeValue:v7];

    long long v27 = v26;
    long long v28 = v25;
    long long v29 = v24;
    long long v30 = v23;
    *(_OWORD *)id v32 = v21;
    *(_OWORD *)&v32[16] = v19;
    *(_OWORD *)&v32[32] = v17;
    *(void *)&v32[48] = v6;
    double m31 = *(double *)&qword_1006910F0;
    long long v8 = +[NSValue valueWithCATransform3D:&v27];
    [v4 setMaximumRelativeValue:v8];

    id v9 = [objc_alloc((Class)UIInterpolatingMotionEffect) initWithKeyPath:@"sublayerTransform" type:1];
    long long v29 = v24;
    long long v30 = v23;
    double m31 = CATransform3DIdentity.m31;
    double v10 = m31;
    long long v27 = v26;
    long long v28 = v25;
    long long v20 = *(_OWORD *)&CATransform3DIdentity.m41;
    *(_OWORD *)&v32[8] = *(_OWORD *)&CATransform3DIdentity.m33;
    long long v22 = *(_OWORD *)&v32[8];
    *(_OWORD *)&v32[24] = v20;
    *(_OWORD *)&v32[40] = *(_OWORD *)&CATransform3DIdentity.m43;
    long long v18 = *(_OWORD *)&v32[40];
    *(double *)id v32 = -*(double *)&qword_1006910F8;
    v11 = +[NSValue valueWithCATransform3D:&v27];
    [v9 setMinimumRelativeValue:v11];

    long long v29 = v24;
    long long v30 = v23;
    double m31 = v10;
    long long v27 = v26;
    long long v28 = v25;
    *(_OWORD *)&v32[8] = v22;
    *(_OWORD *)&v32[24] = v20;
    *(_OWORD *)&v32[40] = v18;
    *(void *)id v32 = qword_1006910F8;
    v12 = +[NSValue valueWithCATransform3D:&v27];
    [v9 setMaximumRelativeValue:v12];

    v13 = (UIMotionEffectGroup *)objc_alloc_init((Class)UIMotionEffectGroup);
    v14 = self->_parallaxMotionEffectGroup;
    self->_parallaxMotionEffectGroup = v13;

    v15 = self->_parallaxMotionEffectGroup;
    v33[0] = v4;
    v33[1] = v9;
    v16 = +[NSArray arrayWithObjects:v33 count:2];
    [(UIMotionEffectGroup *)v15 setMotionEffects:v16];

    parallaxMotionEffectGroup = self->_parallaxMotionEffectGroup;
  }
  [(UIScrollView *)self->_scrollView addMotionEffect:parallaxMotionEffectGroup];
}

- (void)_uninstallMotionEffectOntoScrollView
{
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  uint64_t v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_delegate, obj);
    uint64_t v6 = obj;
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(MFTiltedTabView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)MFTiltedTabView;
  -[MFTiltedTabView setFrame:](&v13, "setFrame:", x, y, width, height);
  if (v9 != width || v11 != height) {
    [(MFTiltedTabView *)self _invalidateAllSnapshots];
  }
}

- (unint64_t)_numberOfItems
{
  visibleItems = self->_visibleItems;
  if (visibleItems)
  {
    return (unint64_t)[(NSMutableArray *)visibleItems count];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v6 = [WeakRetained numberOfItemsInTiltedTabView:self];

    return (unint64_t)v6;
  }
}

- (unint64_t)_indexOfVisibleItem:(id)a3
{
  return (unint64_t)[(NSMutableArray *)self->_visibleItems indexOfObject:a3];
}

- (double)_scrollingEffectFactorForTabsWithCount:(double)a3
{
  return fmin(fmax(a3 + -2.0, 0.0), 1.0);
}

- (double)_topAreaHeightForTabsWithCount:(double)a3
{
  [(MFTiltedTabView *)self _scrollingEffectFactorForTabsWithCount:a3];
  double v5 = (1.0 - v4) * unk_100691040 + v4 * *(double *)&qword_100691038;
  [(MFTiltedTabView *)self _statusBarHeight];
  return v6 + v5;
}

- (CGRect)_hitRectForItem:(id)a3
{
  id v4 = a3;
  double v18 = 0.0;
  [(MFTiltedTabView *)self _baseOffsetForItem:v4 index:0 count:&v18];
  double v6 = v5;
  v7 = [(NSMutableArray *)self->_visibleItems indexOfObject:v4];
  double v8 = v6;
  if (v7 != (char *)[(MFTiltedTabView *)self _numberOfItems] - 1)
  {
    [(MFTiltedTabView *)self _spaceBetweenTabsWithCount:v18];
    double v8 = v9;
  }
  [(MFTiltedTabView *)self _topAreaHeightForTabsWithCount:v18];
  double v11 = v10;
  [(MFTiltedTabView *)self _tabLayoutBounds];
  double v13 = v12;

  double v14 = 0.0;
  double v15 = v6 + v11;
  double v16 = v13;
  double v17 = v8;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (double)_statusBarHeight
{
  v2 = [(MFTiltedTabView *)self window];
  v3 = [v2 windowScene];
  id v4 = [v3 statusBarManager];
  [v4 statusBarFrame];
  double v6 = v5;

  return v6;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  -[MFTiltedTabView convertPoint:toView:](self, "convertPoint:toView:", self->_scrollView, x, y);
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  double v12 = self->_visibleItems;
  id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v23;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v12);
        }
        double v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        [v16 closeButtonHitRect];
        v28.double x = v9;
        v28.double y = v11;
        if (CGRectContainsPoint(v29, v28))
        {
          double v18 = [v16 closeButton];
          goto LABEL_13;
        }
      }
      id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  v21.receiver = self;
  v21.super_class = (Class)MFTiltedTabView;
  -[MFTiltedTabView hitTest:withEvent:](&v21, "hitTest:withEvent:", v7, x, y);
  double v12 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  scrollView = (UIScrollView *)v12;
  if (v12 == (NSMutableArray *)self) {
    scrollView = self->_scrollView;
  }
  double v18 = scrollView;
LABEL_13:
  long long v19 = v18;

  return v19;
}

- (id)_tiltedTabItemForLocation:(CGPoint)a3
{
  if (self->_presented)
  {
    CGFloat y = a3.y;
    CGFloat x = a3.x;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    double v6 = self->_visibleItems;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * v9) closeButtonHitRect];
        v27.CGFloat x = x;
        v27.CGFloat y = y;
        if (CGRectContainsPoint(v29, v27)) {
          break;
        }
        if (v7 == (id)++v9)
        {
          id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      double v6 = self->_visibleItems;
      id v10 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v17;
        while (2)
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v6);
            }
            id v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            -[MFTiltedTabView _hitRectForItem:](self, "_hitRectForItem:", v13, (void)v16);
            v28.CGFloat x = x;
            v28.CGFloat y = y;
            if (CGRectContainsPoint(v30, v28))
            {
              id v14 = v13;
              goto LABEL_21;
            }
          }
          id v10 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
    }
    id v14 = 0;
LABEL_21:
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (void)setReorderingEnabled:(BOOL)a3
{
  self->_reorderingEnabled = a3;
  -[UILongPressGestureRecognizer setEnabled:](self->_tabReorderRecognizer, "setEnabled:");
}

- (void)_setPressedItem:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (_MFTiltedTabItemView *)a3;
  if (self->_pressedItem != v7)
  {
    if (v4)
    {
      [(MFTiltedTabView *)self layoutBelowIfNeeded];
      objc_storeStrong((id *)&self->_pressedItem, a3);
      [(MFTiltedTabView *)self layoutItemsAnimated:1];
    }
    else
    {
      objc_storeStrong((id *)&self->_pressedItem, a3);
      [(MFTiltedTabView *)self setNeedsLayout];
    }
  }
}

- (void)_tabPressUpdated:(id)a3
{
  id v5 = a3;
  if ([v5 numberOfTouches] && objc_msgSend(v5, "state") != (id)5)
  {
    [v5 locationInView:self->_scrollView];
    BOOL v4 = -[MFTiltedTabView _tiltedTabItemForLocation:](self, "_tiltedTabItemForLocation:");
    [(MFTiltedTabView *)self _setPressedItem:v4 animated:1];
  }
  else
  {
    [(MFTiltedTabView *)self _setPressedItem:0 animated:1];
  }
}

- (BOOL)_gestureRecognizer:(id)a3 shouldInteractWithItem:(id)a4
{
  double v6 = (UITapGestureRecognizer *)a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (self->_tabSelectionRecognizer != v6
    && (UITapGestureRecognizer *)self->_tabCloseRecognizer != v6
    && (UITapGestureRecognizer *)self->_tabReorderRecognizer != v6)
  {
    __assert_rtn("-[MFTiltedTabView _gestureRecognizer:shouldInteractWithItem:]", "MFTiltedTabView.m", 622, "gestureRecognizer == _tabSelectionRecognizer || gestureRecognizer == _tabCloseRecognizer || gestureRecognizer == _tabReorderRecognizer");
  }
  BOOL v9 = v7
    && ((UITapGestureRecognizer *)self->_tabReorderRecognizer != v6
     || [(MFTiltedTabView *)self _numberOfItems] >= 2);

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  double v6 = (UITapGestureRecognizer *)a3;
  id v7 = a4;
  if ([(MFTiltedTabView *)self isUserInteractionEnabled])
  {
    if (self->_tabSelectionRecognizer != v6
      && (UITapGestureRecognizer *)self->_tabCloseRecognizer != v6
      && (UITapGestureRecognizer *)self->_tabReorderRecognizer != v6)
    {
      __assert_rtn("-[MFTiltedTabView gestureRecognizer:shouldReceiveTouch:]", "MFTiltedTabView.m", 635, "gestureRecognizer == _tabSelectionRecognizer || gestureRecognizer == _tabCloseRecognizer || gestureRecognizer == _tabReorderRecognizer");
    }
    [v7 locationInView:self->_scrollView];
    uint64_t v8 = -[MFTiltedTabView _tiltedTabItemForLocation:](self, "_tiltedTabItemForLocation:");
    BOOL v9 = [(MFTiltedTabView *)self _gestureRecognizer:v6 shouldInteractWithItem:v8];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  BOOL v4 = (UITapGestureRecognizer *)a3;
  id v5 = v4;
  if (self->_tabSelectionRecognizer != v4
    && (UITapGestureRecognizer *)self->_tabCloseRecognizer != v4
    && (UITapGestureRecognizer *)self->_tabReorderRecognizer != v4)
  {
    __assert_rtn("-[MFTiltedTabView gestureRecognizerShouldBegin:]", "MFTiltedTabView.m", 641, "gestureRecognizer == _tabSelectionRecognizer || gestureRecognizer == _tabCloseRecognizer || gestureRecognizer == _tabReorderRecognizer");
  }
  [(UITapGestureRecognizer *)v4 locationInView:self->_scrollView];
  double v6 = -[MFTiltedTabView _tiltedTabItemForLocation:](self, "_tiltedTabItemForLocation:");
  BOOL v7 = [(MFTiltedTabView *)self _gestureRecognizer:v5 shouldInteractWithItem:v6];

  return v7;
}

- (double)_tabCloseAnimationSlideDistance
{
  double v2 = *(double *)&qword_100691058;
  [(MFTiltedTabView *)self _tabLayoutBounds];
  return v2 + CGRectGetMaxX(v4);
}

- (void)_closeItem:(id)a3
{
  id v5 = a3;
  id v6 = [(NSMutableArray *)self->_visibleItems indexOfObject:v5];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ([WeakRetained tiltedTabView:self canCloseItemAtIndex:v6])
  {
    unint64_t v8 = [(MFTiltedTabView *)self _numberOfItems];
    [v5 setClosing:1];
    [WeakRetained tiltedTabView:closeItemAtIndex:self [_indexOfVisibleItem:v5]];
    id v9 = [WeakRetained numberOfItemsInTiltedTabView:self];
    if ((unint64_t)v9 >= v8)
    {
      uint64_t v11 = +[NSAssertionHandler currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"MFTiltedTabView.m" lineNumber:663 description:@"Number of items should be less than before when closing tabs."];
    }
    [(NSMutableArray *)self->_visibleItems removeObject:v5];
    visibleItems = self->_visibleItems;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001ED8E8;
    v12[3] = &unk_10060D440;
    v12[4] = v9;
    [(NSMutableArray *)visibleItems enumerateObjectsUsingBlock:v12];
    [(MFTiltedTabView *)self layoutItemsAnimated:1];
  }
}

- (id)tabItemAtIndex:(unint64_t)a3
{
  if ((unint64_t)[(NSMutableArray *)self->_visibleItems count] <= a3)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [(NSMutableArray *)self->_visibleItems objectAtIndexedSubscript:a3];
  }

  return v5;
}

- (void)_tabCloseRecognized:(id)a3
{
  long long v23 = (UIPanGestureRecognizer *)a3;
  if (self->_tabCloseRecognizer != v23) {
    __assert_rtn("-[MFTiltedTabView _tabCloseRecognized:]", "MFTiltedTabView.m", 684, "gestureRecognizer == _tabCloseRecognizer");
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned int v5 = 0;
  switch((unint64_t)[(UIPanGestureRecognizer *)v23 state])
  {
    case 1uLL:
      [(UIPanGestureRecognizer *)v23 locationInView:self->_scrollView];
      id v6 = -[MFTiltedTabView _tiltedTabItemForLocation:](self, "_tiltedTabItemForLocation:");
      if (!v6)
      {
        long long v21 = "tabItemForLocation";
        int v22 = 692;
        goto LABEL_29;
      }
      if (self->_interactivelyClosingItem)
      {
        long long v21 = "!_interactivelyClosingItem";
        int v22 = 693;
LABEL_29:
        __assert_rtn("-[MFTiltedTabView _tabCloseRecognized:]", "MFTiltedTabView.m", v22, v21);
      }
      objc_storeStrong((id *)&self->_interactivelyClosingItem, v6);
      self->_interactiveCloseProgress = 0.0;
      [v6 setCountForLayout:[self _numberOfItems]];
      [v6 setIndexForLayout:[self->_visibleItems indexOfObject:v6]];
LABEL_22:

LABEL_23:

      return;
    case 2uLL:
      [(UIPanGestureRecognizer *)v23 translationInView:self];
      double v13 = v12;
      [(MFTiltedTabView *)self _tabCloseAnimationSlideDistance];
      double v15 = -v13 / v14;
      self->_interactiveCloseProgress = v15;
      if (v15 >= 0.0)
      {
        if ([WeakRetained tiltedTabView:canCloseItemAtIndex:self _indexOfVisibleItem:self->_interactivelyClosingItem])goto LABEL_13; {
        double v16 = 1.0 - 1.0 / (self->_interactiveCloseProgress * 0.55 + 1.0);
        }
      }
      else
      {
        double v16 = -(1.0 - 1.0 / (v15 * -0.55 + 1.0));
      }
      self->_interactiveCloseProgress = v16;
LABEL_13:
      [(MFTiltedTabView *)self setNeedsLayout];
      goto LABEL_23;
    case 3uLL:
      [(UIPanGestureRecognizer *)v23 translationInView:self];
      double v8 = v7;
      [(UIPanGestureRecognizer *)v23 velocityInView:self];
      double v10 = v9;
      [(MFTiltedTabView *)self _tabCloseAnimationSlideDistance];
      if (v8 + v10 >= v11 * -0.75) {
        unsigned int v5 = 0;
      }
      else {
        unsigned int v5 = [WeakRetained tiltedTabView:canCloseItemAtIndex:self [_indexOfVisibleItem:self->_interactivelyClosingItem]];
      }
      goto LABEL_15;
    case 4uLL:
LABEL_15:
      [(UIPanGestureRecognizer *)v23 velocityInView:self];
      self->_interactiveCloseVelocitCGFloat y = v17;
      if (v5) {
        [(MFTiltedTabView *)self _closeItem:self->_interactivelyClosingItem];
      }
      unsigned __int8 v18 = [(_MFTiltedTabItemView *)self->_interactivelyClosingItem isClosing];
      if ((v18 & 1) == 0)
      {
        [(_MFTiltedTabItemView *)self->_interactivelyClosingItem setCountForLayout:0x7FFFFFFFFFFFFFFFLL];
        [(_MFTiltedTabItemView *)self->_interactivelyClosingItem setIndexForLayout:0x7FFFFFFFFFFFFFFFLL];
      }
      p_onlyHorizontalVelocityItem = &self->_onlyHorizontalVelocityItem;
      objc_storeStrong((id *)&self->_onlyHorizontalVelocityItem, self->_interactivelyClosingItem);
      interactivelyClosingItem = self->_interactivelyClosingItem;
      self->_interactivelyClosingItem = 0;

      if ((v18 & 1) == 0) {
        [(MFTiltedTabView *)self layoutItemsAnimated:1];
      }
      self->_interactiveCloseProgress = 0.0;
      self->_interactiveCloseVelocitCGFloat y = 0.0;
      id v6 = *p_onlyHorizontalVelocityItem;
      *p_onlyHorizontalVelocityItem = 0;
      goto LABEL_22;
    default:
      goto LABEL_23;
  }
}

- (void)_setReorderScrollVelocity:(double)a3
{
  reorderScrollDisplayLink = self->_reorderScrollDisplayLink;
  if (fabs(a3) >= 0.01)
  {
    if (!reorderScrollDisplayLink)
    {
      double v7 = +[CADisplayLink displayLinkWithTarget:self selector:"_reorderScroll:"];
      double v8 = self->_reorderScrollDisplayLink;
      self->_reorderScrollDisplayLink = v7;

      double v9 = self->_reorderScrollDisplayLink;
      double v10 = +[NSRunLoop mainRunLoop];
      [(CADisplayLink *)v9 addToRunLoop:v10 forMode:NSRunLoopCommonModes];
    }
    self->_reorderScrollVelocitCGFloat y = a3;
  }
  else
  {
    [(CADisplayLink *)reorderScrollDisplayLink invalidate];
    id v6 = self->_reorderScrollDisplayLink;
    self->_reorderScrollDisplayLink = 0;
  }
}

- (void)_reorderScroll:(id)a3
{
  [a3 duration];
  double v5 = v4;
  reorderScrollVelocitCGFloat y = self->_reorderScrollVelocity;
  double reorderScrollOffsetError = self->_reorderScrollOffsetError;
  double v8 = +[UIScreen mainScreen];
  [v8 scale];
  double v10 = v9;

  __CGFloat y = NAN;
  self->_double reorderScrollOffsetError = modf((reorderScrollOffsetError + v5 * reorderScrollVelocity) * v10, &__y) / v10;
  double v11 = __y;
  [(UIScrollView *)self->_scrollView contentOffset];
  double v13 = v12;
  double v15 = v14;
  [(UIScrollView *)self->_scrollView contentInset];
  double v17 = v16;
  double v19 = v18;
  [(UIScrollView *)self->_scrollView contentSize];
  double v21 = v20;
  [(UIScrollView *)self->_scrollView bounds];
  -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", v13, fmin(fmax(v11 / v10 + v15, -v17), v19 + v21 - v22));
  [(MFTiltedTabView *)self _updateReorderGesture];
}

- (void)_updateReorderGesture
{
  [(MFTiltedTabView *)self _spaceBetweenTabsWithCount:(double)[(MFTiltedTabView *)self _numberOfItems]];
  double v4 = v3;
  [(UILongPressGestureRecognizer *)self->_tabReorderRecognizer locationInView:self->_scrollView];
  double v6 = v5;
  if (self->_reorderOffsetNeedsReset)
  {
    -[MFTiltedTabView _resetInteractiveReorderOffsetAtLocation:](self, "_resetInteractiveReorderOffsetAtLocation:");
    self->_reorderOffsetNeedsReset = 0;
  }
  else
  {
    self->_double interactiveReorderOffset = v5 - self->_interactiveReorderOffsetDistanceFromTouch;
  }
  double v7 = v4 * ((double)[(MFTiltedTabView *)self _numberOfItems] + -0.5);
  double interactiveReorderOffset = self->_interactiveReorderOffset;
  if (interactiveReorderOffset > v7) {
    self->_double interactiveReorderOffset = v7 + (1.0 - 1.0 / ((interactiveReorderOffset - v7) / v4 * 0.55 + 1.0)) * v4;
  }
  unint64_t v9 = [(MFTiltedTabView *)self _indexOfVisibleItem:self->_interactivelyReorderingItem];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
    sub_10045D5D8();
  }
  unint64_t v10 = v9;
  unint64_t v11 = vcvtad_u64_f64(self->_interactiveReorderOffset / v4);
  if (v9 != v11 && [(MFTiltedTabView *)self _numberOfItems] > v11)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained tiltedTabView:self didMoveItemAtIndex:v10 toIndex:v11];
  }
  double v13 = *(double *)&qword_100691080;
  double v14 = unk_100691088;
  [(MFTiltedTabView *)self bounds];
  double v16 = v13 * v15;
  [(UIScrollView *)self->_scrollView bounds];
  CGFloat x = v25.origin.x;
  CGFloat y = v25.origin.y;
  CGFloat width = v25.size.width;
  CGFloat height = v25.size.height;
  if (v6 - CGRectGetMinY(v25) >= v14)
  {
    v27.origin.CGFloat x = x;
    v27.origin.CGFloat y = y;
    v27.size.CGFloat width = width;
    v27.size.CGFloat height = height;
    CGFloat v22 = CGRectGetMaxY(v27) - v6;
    double v23 = 0.0;
    if (v22 >= v14) {
      goto LABEL_15;
    }
    v28.origin.CGFloat x = x;
    v28.origin.CGFloat y = y;
    v28.size.CGFloat width = width;
    v28.size.CGFloat height = height;
    double v21 = v14 + v6 - CGRectGetMaxY(v28);
  }
  else
  {
    v26.origin.CGFloat x = x;
    v26.origin.CGFloat y = y;
    v26.size.CGFloat width = width;
    v26.size.CGFloat height = height;
    double v21 = v6 - CGRectGetMinY(v26) - v14;
  }
  double v23 = v16 * v21 / v14;
LABEL_15:
  [(MFTiltedTabView *)self _setReorderScrollVelocity:v23];
  [(MFTiltedTabView *)self setNeedsLayout];
}

- (void)_resetInteractiveReorderOffsetAtLocation:(CGPoint)a3
{
  double y = a3.y;
  [(MFTiltedTabView *)self _spaceBetweenTabsWithCount:(double)[(MFTiltedTabView *)self _numberOfItems]];
  double v6 = v5;
  unint64_t v7 = [(MFTiltedTabView *)self _indexOfVisibleItem:self->_interactivelyReorderingItem];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
    sub_10045D604();
  }
  double v8 = v6 * (double)v7;
  self->_double interactiveReorderOffset = v8;
  self->_interactiveReorderOffsetDistanceFromTouch = y - v8;
}

- (void)_tabReorderRecognized:(id)a3
{
  double v4 = (UILongPressGestureRecognizer *)a3;
  double v14 = v4;
  if (self->_tabReorderRecognizer != v4) {
    __assert_rtn("-[MFTiltedTabView _tabReorderRecognized:]", "MFTiltedTabView.m", 827, "gestureRecognizer == _tabReorderRecognizer");
  }
  double v5 = (char *)[(UILongPressGestureRecognizer *)v4 state];
  if ((unint64_t)(v5 - 3) < 2)
  {
    interactivelyReorderingItem = self->_interactivelyReorderingItem;
    self->_interactivelyReorderingItem = 0;

    self->_double interactiveReorderOffset = 0.0;
    self->_interactiveReorderOffsetDistanceFromTouch = 0.0;
    [(MFTiltedTabView *)self layoutItemsAnimated:1];
    [(MFTiltedTabView *)self _setReorderScrollVelocity:0.0];
    self->_double reorderScrollOffsetError = 0.0;
  }
  else
  {
    if (v5 != (char *)2)
    {
      if (v5 != (char *)1) {
        goto LABEL_10;
      }
      [(UILongPressGestureRecognizer *)v14 locationInView:self->_scrollView];
      double v7 = v6;
      double v9 = v8;
      unint64_t v10 = -[MFTiltedTabView _tiltedTabItemForLocation:](self, "_tiltedTabItemForLocation:");
      if (v10)
      {
        if (!self->_interactivelyReorderingItem)
        {
          objc_storeStrong((id *)&self->_interactivelyReorderingItem, v10);
          -[MFTiltedTabView _resetInteractiveReorderOffsetAtLocation:](self, "_resetInteractiveReorderOffsetAtLocation:", v7, v9);
          [(MFTiltedTabView *)self layoutItemsAnimated:1];
          self->_reorderOffsetNeedsReset = 1;

          goto LABEL_10;
        }
        double v12 = "!_interactivelyReorderingItem";
        int v13 = 833;
      }
      else
      {
        double v12 = "tabItemForLocation";
        int v13 = 832;
      }
      __assert_rtn("-[MFTiltedTabView _tabReorderRecognized:]", "MFTiltedTabView.m", v13, v12);
    }
    [(MFTiltedTabView *)self _updateReorderGesture];
  }
LABEL_10:
}

- (void)selectItemAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
  if ((unint64_t)[(NSMutableArray *)self->_visibleItems count] > a3)
  {
    double v6 = [(NSMutableArray *)self->_visibleItems objectAtIndex:a3];
    p_selectedItem = &self->_selectedItem;
    objc_storeStrong((id *)&self->_selectedItem, v6);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    double v9 = [WeakRetained tiltedTabView:self contentViewForItemAtIndex:a3];
    if (v9)
    {
      unint64_t v10 = [(_MFTiltedTabItemView *)*p_selectedItem borrowedContentView];
      [WeakRetained tiltedTabView:self relinquishSnapshotView:v10 forItemAtIndex:a3];

      long long v11 = *(_OWORD *)&CGAffineTransformIdentity.c;
      v12[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
      v12[1] = v11;
      v12[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
      [v9 setTransform:v12];
      [(_MFTiltedTabItemView *)*p_selectedItem setBorrowedContentView:v9];
      [(_MFTiltedTabItemView *)*p_selectedItem setContentViewType:0];
    }
    [WeakRetained tiltedTabView:self didSelectItemAtIndex:a3];
  }
}

- (void)_tabSelectionRecognized:(id)a3
{
  double v4 = (UITapGestureRecognizer *)a3;
  double v6 = v4;
  if (self->_tabSelectionRecognizer != v4) {
    __assert_rtn("-[MFTiltedTabView _tabSelectionRecognized:]", "MFTiltedTabView.m", 883, "gestureRecognizer == _tabSelectionRecognizer");
  }
  [(UITapGestureRecognizer *)v4 locationInView:self->_scrollView];
  double v5 = -[MFTiltedTabView _tiltedTabItemForLocation:](self, "_tiltedTabItemForLocation:");
  [(MFTiltedTabView *)self selectItemAtIndex:[(MFTiltedTabView *)self _indexOfVisibleItem:v5] animated:1];
}

- (void)_sendPresentedStateDidChangeToDelegateIfNeeded
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = WeakRetained;
  if (self->_presented)
  {
    p_sentDidPresentToDelegate = &self->_sentDidPresentToDelegate;
    if (!self->_sentDidPresentToDelegate) {
      [WeakRetained tiltedTabViewDidPresent:self];
    }
  }
  else
  {
    p_sentDidPresentToDelegate = &self->_sentDidDismissToDelegate;
    if (!self->_sentDidDismissToDelegate) {
      [WeakRetained tiltedTabViewDidDismiss:self];
    }
  }
  BOOL *p_sentDidPresentToDelegate = 1;
}

- (void)_relinquishBorrowedViews
{
  visibleItems = self->_visibleItems;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1001EE7F4;
  v3[3] = &unk_10060D468;
  v3[4] = self;
  [(NSMutableArray *)visibleItems enumerateObjectsUsingBlock:v3];
}

- (void)_finishAnimations
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  double v3 = self->_visibleItems;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v19;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * i) setShadowOpacity:0.0];
      }
      id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v4);
  }

  if (!self->_presented)
  {
    [(MFTiltedTabView *)self _relinquishBorrowedViews];
    [(NSMutableSet *)self->_itemsCurrentlyClosing addObjectsFromArray:self->_visibleItems];
    [(NSMutableArray *)self->_visibleItems removeAllObjects];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v7 = self->_itemsCurrentlyClosing;
  id v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      for (j = 0; j != v8; j = (char *)j + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        long long v11 = *(void **)(*((void *)&v14 + 1) + 8 * (void)j);
        [v11 uninstallMaskCutoutView];
        [v11 setFinishedClosing:1];
      }
      id v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v8);
  }

  [(MFTiltedTabView *)self _updateItemsInvolvedInAnimation];
  if (self->_presented && [(NSMutableSet *)self->_itemsCurrentlyClosing count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained tiltedTabViewDidScroll:self];
  }
  [(NSMutableSet *)self->_itemsCurrentlyClosing removeAllObjects];
  selectedItem = self->_selectedItem;
  self->_selectedItem = 0;

  self->_animating = 0;
  [(MFTiltedTabView *)self _sendPresentedStateDidChangeToDelegateIfNeeded];
  if (!self->_presented)
  {
    [(NSMutableSet *)self->_allTabItems makeObjectsPerformSelector:"removeFromSuperview"];
    [(NSMutableSet *)self->_allTabItems removeAllObjects];
    [(MFTiltedTabView *)self setHidden:1];
  }
}

- (id)_tabItem
{
  double v3 = objc_alloc_init(_MFTiltedTabItemView);
  [(NSMutableSet *)self->_allTabItems addObject:v3];

  return v3;
}

- (void)setPresented:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v38 = a4;
  uint64_t v37 = 8;
  if (((!self->_presented ^ a3) & 1) == 0)
  {
    BOOL v4 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    BOOL v7 = v4;
    id v8 = WeakRetained;
    BOOL v39 = v7;
    if (v7)
    {
      [(MFTiltedTabView *)self setHidden:0];
      [(MFTiltedTabView *)self _installMotionEffectOntoScrollView];
      selectedItem = self->_selectedItem;
      self->_selectedItem = 0;

      self->_sentDidPresentToDelegate = 0;
      [(MFTiltedTabView *)self _relinquishBorrowedViews];
      [(NSMutableArray *)self->_visibleItems removeAllObjects];
      unint64_t v40 = [(MFTiltedTabView *)self rotationStyle];
      unint64_t v10 = (char *)[v8 numberOfItemsInTiltedTabView:self];
      if (v10)
      {
        for (i = 0; i != v10; ++i)
        {
          double v12 = [v8 tiltedTabView:self snapshotViewForItemAtIndex:i v37];
          int v13 = [(MFTiltedTabView *)self _tabItem];
          [v13 setIndexForLayout:i];
          [v13 setCountForLayout:v10];
          [v13 setBorrowedContentView:v12];
          [v13 setContentViewType:1];
          [v13 setCapturedInterfaceOrientation:[self _currentOrientation]];
          [v13 setAutoresizesContentView:v40 == 2];
          long long v14 = [v13 contentClipperView];
          [v12 bounds];
          [v14 setBounds:];

          [v13 setClipsToBounds:[v12 clipsToBounds]];
          [v12 _continuousCornerRadius];
          [v13 _setContinuousCornerRadius:];
          location[0] = (id)0xAAAAAAAAAAAAAAAALL;
          objc_initWeak(location, self);
          id v15 = objc_alloc((Class)UISpringLoadedInteraction);
          v42[0] = _NSConcreteStackBlock;
          v42[1] = 3221225472;
          v42[2] = sub_1001EF260;
          v42[3] = &unk_10060D490;
          objc_copyWeak(v43, location);
          v43[1] = i;
          id v16 = [v15 initWithActivationHandler:v42];
          [v13 addInteraction:v16];

          if (i)
          {
            long long v17 = v8;
            long long v18 = [v8 tiltedTabView:self headerViewForItemAtIndex:i];
            long long v19 = [v13 headerView];
            [v19 frame];
            double v21 = v20;
            double v23 = v22;
            double v25 = v24;

            [v18 frame];
            double Height = CGRectGetHeight(v45);
            CGRect v27 = [v13 headerView];
            [v27 setFrame:v21, v23, v25, Height];

            CGRect v28 = [v18 title];
            CGRect v29 = [v13 headerView];
            [v29 setTitle:v28];

            [v18 bottomInset];
            double v31 = v30;
            id v32 = [v13 headerView];
            [v32 setBottomInset:v31];

            id v8 = v17;
          }
          [(NSMutableArray *)self->_visibleItems addObject:v13];
          objc_destroyWeak(v43);
          objc_destroyWeak(location);
        }
      }
      [v8 tiltedTabViewWillPresent:self v37];
      [(MFTiltedTabView *)self _updateItemsInvolvedInAnimation];
    }
    else
    {
      [(MFTiltedTabView *)self _uninstallMotionEffectOntoScrollView];
      self->_sentDidDismissToDelegate = 0;
      [v8 tiltedTabViewWillDismiss:self];
    }
    if (v38)
    {
      self->_animating = 1;
      [(MFTiltedTabView *)self setNeedsLayout];
      [(MFTiltedTabView *)self layoutBelowIfNeeded];
    }
    if ((!self->_selectedItem || !-[MFTiltedTabView _indexOfVisibleItem:](self, "_indexOfVisibleItem:")) && !v39)
    {
      visibleItems = self->_visibleItems;
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_1001EF2E4;
      v41[3] = &unk_10060D468;
      v41[4] = self;
      [(NSMutableArray *)visibleItems enumerateObjectsUsingBlock:v41];
    }
    *((unsigned char *)&self->super.super.super.isa + v37) = v39;
    [v8 tiltedTabViewDidLayoutItems:self v37];
    if (v39)
    {
      long long v34 = v8;
      long long v35 = [v8 tiltedTabView:self maskCutoutViewForItemAtIndex:0];
      if (v35)
      {
        long long v36 = [(NSMutableArray *)self->_visibleItems firstObject];
        [v36 installMaskCutoutView:v35];
      }
      id v8 = v34;
    }
    [(MFTiltedTabView *)self layoutItemsAnimated:v38];
    if (!self->_activeAnimationCount) {
      [(MFTiltedTabView *)self _finishAnimations];
    }
    [(_MFTouchDownTapRecognizer *)self->_pressRecognizer setEnabled:v39];
    [(UIPanGestureRecognizer *)self->_tabCloseRecognizer setEnabled:v39];
    [(UILongPressGestureRecognizer *)self->_tabReorderRecognizer setEnabled:self->_reorderingEnabled];
    [(UITapGestureRecognizer *)self->_tabSelectionRecognizer setEnabled:v39];
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v17 = a3;
  uint64_t v5 = [v17 valueForKey:@"reordering-item"];
  if (v5)
  {
    double v6 = [v17 valueForKey:@"being-replaced"];
    unsigned __int8 v7 = [v6 BOOLValue];

    if ((v7 & 1) == 0)
    {
      id v8 = [v17 valueForKey:@"base-begin-time"];
      [v8 doubleValue];
      double v10 = v9;

      [v17 beginTime];
      double v12 = v11;
      double v13 = *(double *)&qword_100691030;
      long long v14 = [v17 valueForKey:@"tab-count"];
      [v14 doubleValue];
      [(MFTiltedTabView *)self _stopReorderingItem:v5 withFinalTimeAdjustment:(v10 - v12) / v13 tabCount:v15];
    }
  }
  else
  {
    unint64_t v16 = self->_activeAnimationCount - 1;
    self->_activeAnimationCount = v16;
    if (v16 <= 2 && self->_animating) {
      [(MFTiltedTabView *)self _finishAnimations];
    }
  }
}

- (void)setPresented:(BOOL)a3
{
}

- (BOOL)_shouldContinueAnimatingItem:(id)a3
{
  return [a3 isFinishedClosing] ^ 1;
}

- (void)_resetItem:(id)a3
{
  id v3 = a3;
  [v3 setClosing:0];
  [v3 setFinishedClosing:0];
  [v3 setCountForLayout:0x7FFFFFFFFFFFFFFFLL];
  [v3 setIndexForLayout:0x7FFFFFFFFFFFFFFFLL];
  [v3 setVerticalScrollAdjustment:0.0];
}

- (void)_updateItemsInvolvedInAnimation
{
  long long v18 = self->_itemsInvolvedInAnimation;
  id v3 = +[NSMutableArray arrayWithArray:self->_visibleItems];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  BOOL v4 = v18;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v24;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v3 indexOfObject:v8] == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          if (![(MFTiltedTabView *)self _shouldContinueAnimatingItem:v8])
          {
            [v8 removeFromSuperview];
            double v9 = [v8 closeButton];
            [v9 removeTarget:self action:"_closeButtonPressed:" forControlEvents:64];
          }
        }
        else
        {
          [v3 removeObject:v8];
        }
      }
      id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v5);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v3;
  id v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v20;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v10);
        }
        long long v14 = *(void **)(*((void *)&v19 + 1) + 8 * (void)j);
        [(UIScrollView *)self->_scrollView addSubview:v14];
        double v15 = [v14 closeButton];
        [v15 addTarget:self action:"_closeButtonPressed:" forControlEvents:64];
      }
      id v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v11);
  }

  unint64_t v16 = (NSArray *)[(NSMutableArray *)self->_visibleItems copy];
  itemsInvolvedInAnimation = self->_itemsInvolvedInAnimation;
  self->_itemsInvolvedInAnimation = v16;
}

- (void)_updateCloseButtonImageForItem:(id)a3
{
  id v8 = a3;
  BOOL v4 = self->_closeButtonImage;
  id v5 = [v8 closeButton];
  [v5 setImage:v4 forState:0];

  uint64_t v6 = +[UIColor mailTiltedTabCloseButtonTintColor];
  unsigned __int8 v7 = [v8 closeButton];
  [v7 setTintColor:v6];
}

- (void)_closeButtonPressed:(id)a3
{
  id v4 = a3;
  visibleItems = self->_visibleItems;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001EFA64;
  v7[3] = &unk_10060D4B8;
  id v8 = v4;
  double v9 = self;
  id v6 = v4;
  [(NSMutableArray *)visibleItems enumerateObjectsUsingBlock:v7];
}

- (void)_updateSpringAnimationForView:(id)a3 withFrame:(CGRect)a4 verticalScrollAdjustment:(double)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = a3;
  long long v14 = [v13 layer];
  double v15 = v14;
  if (v14) {
    [v14 transform];
  }
  else {
    memset(v21, 0, sizeof(v21));
  }
  long long v16 = *(_OWORD *)&CATransform3DIdentity.m33;
  v20[4] = *(_OWORD *)&CATransform3DIdentity.m31;
  v20[5] = v16;
  long long v17 = *(_OWORD *)&CATransform3DIdentity.m43;
  v20[6] = *(_OWORD *)&CATransform3DIdentity.m41;
  v20[7] = v17;
  long long v18 = *(_OWORD *)&CATransform3DIdentity.m13;
  v20[0] = *(_OWORD *)&CATransform3DIdentity.m11;
  v20[1] = v18;
  long long v19 = *(_OWORD *)&CATransform3DIdentity.m23;
  v20[2] = *(_OWORD *)&CATransform3DIdentity.m21;
  v20[3] = v19;
  -[MFTiltedTabView _updateSpringAnimationForView:withFrame:transform:userTransform:opacity:verticalScrollAdjustment:animated:](self, "_updateSpringAnimationForView:withFrame:transform:userTransform:opacity:verticalScrollAdjustment:animated:", v13, v21, v20, v6, x, y, width, height, 1.0, a5);
}

- (double)_velocityForSpringAnimations
{
  [(MFTiltedTabView *)self _tabCloseAnimationSlideDistance];
  double v4 = v3;
  unsigned int v5 = [(_MFTiltedTabItemView *)self->_interactivelyClosingItem isClosing];
  double v6 = -v4;
  double result = 0.0;
  if (!v5) {
    double v6 = 0.0;
  }
  double v8 = -(v4 * self->_interactiveCloseProgress);
  if (v6 != v8) {
    return self->_interactiveCloseVelocity / (v6 - v8);
  }
  return result;
}

- (void)_configureVelocityForSpringAnimation:(id)a3 withKeyPath:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  [(MFTiltedTabView *)self _velocityForSpringAnimations];
  double v8 = v7;
  if (v7 != 0.0)
  {
    if (([v6 isEqualToString:@"position.x"] & 1) == 0)
    {
      if (self->_applyVelocityOnlyToHorizontalPosition) {
        goto LABEL_6;
      }
      double v8 = v8 + v8;
    }
    [v9 setVelocity:v8];
  }
LABEL_6:
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init((Class)MFSpringAnimation);
  [v6 setKeyPath:v5];
  [(MFTiltedTabView *)self _configureVelocityForSpringAnimation:v6 withKeyPath:v5];

  return v6;
}

- (void)_addSpringAnimationWithKeyPath:(id)a3 toLayer:(id)a4 fromValue:(id)a5 toValue:(id)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = +[MFSpringAnimation springAnimationWithKeyPath:v14 fromValue:a5 toValue:a6];
  [(MFTiltedTabView *)self _velocityForSpringAnimations];
  if (v12 != 0.0)
  {
    id v13 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [v11 setTimingFunction:v13];

    [(MFTiltedTabView *)self _configureVelocityForSpringAnimation:v11 withKeyPath:v14];
  }
  [v11 setDelegate:self];
  ++self->_activeAnimationCount;
  [v10 addAnimation:v11 forKey:0];
}

- (void)_updateSpringAnimationForView:(id)a3 withFrame:(CGRect)a4 transform:(CATransform3D *)a5 userTransform:(CATransform3D *)a6 opacity:(double)a7 verticalScrollAdjustment:(double)a8 animated:(BOOL)a9
{
  BOOL v9 = a9;
  double rect = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v16 = a3;
  long long v17 = [v16 layer];
  [v17 anchorPoint];
  [v17 position];
  double v84 = v18;
  double v20 = v19;
  *(void *)&long long v21 = -1;
  *((void *)&v21 + 1) = -1;
  *(_OWORD *)&v95.c = v21;
  *(_OWORD *)&v95.tCGFloat x = v21;
  *(_OWORD *)&v95.CATransform3D a = v21;
  long long v22 = *(_OWORD *)&a6->m33;
  *(_OWORD *)&v94.double m31 = *(_OWORD *)&a6->m31;
  *(_OWORD *)&v94.CGFloat m33 = v22;
  long long v23 = *(_OWORD *)&a6->m43;
  *(_OWORD *)&v94.m41 = *(_OWORD *)&a6->m41;
  *(_OWORD *)&v94.m43 = v23;
  long long v24 = *(_OWORD *)&a6->m13;
  *(_OWORD *)&v94.m11 = *(_OWORD *)&a6->m11;
  *(_OWORD *)&v94.m13 = v24;
  long long v25 = *(_OWORD *)&a6->m23;
  *(_OWORD *)&v94.m21 = *(_OWORD *)&a6->m21;
  *(_OWORD *)&v94.m23 = v25;
  CATransform3DGetAffineTransform(&v95, &v94);
  [v16 bounds];
  double v26 = CGRectGetWidth(v96);
  double v27 = 0.0;
  if (v26 > 0.0) {
    double v27 = v95.tx / v26;
  }
  v95.tCGFloat x = v27;
  [v16 bounds];
  double Height = CGRectGetHeight(v97);
  double v29 = 0.0;
  if (Height > 0.0) {
    double v29 = v95.ty / Height;
  }
  double v82 = v20;
  v95.tCGFloat y = v29;
  long long v30 = *(_OWORD *)&a6->m33;
  *(_OWORD *)&v94.double m31 = *(_OWORD *)&a6->m31;
  *(_OWORD *)&v94.CGFloat m33 = v30;
  long long v31 = *(_OWORD *)&a6->m43;
  *(_OWORD *)&v94.m41 = *(_OWORD *)&a6->m41;
  *(_OWORD *)&v94.m43 = v31;
  long long v32 = *(_OWORD *)&a6->m13;
  *(_OWORD *)&v94.m11 = *(_OWORD *)&a6->m11;
  *(_OWORD *)&v94.m13 = v32;
  long long v33 = *(_OWORD *)&a6->m23;
  *(_OWORD *)&v94.m21 = *(_OWORD *)&a6->m21;
  *(_OWORD *)&v94.m23 = v33;
  CATransform3DGetAffineTransform(&v93, &v94);
  v98.origin.CGFloat x = x;
  v98.origin.CGFloat y = y;
  double v88 = width;
  v98.size.CGFloat width = width;
  v98.size.double height = rect;
  CGRectApplyAffineTransform(v98, &v93);
  long long v34 = +[UIScreen mainScreen];
  [v34 scale];
  uint64_t v81 = v35;
  UIRectCenteredIntegralRectScale();

  UIPointRoundToViewScale();
  double v87 = v36;
  double v38 = v37;
  *(void *)&long long v39 = -1;
  *((void *)&v39 + 1) = -1;
  *(_OWORD *)&v94.m41 = v39;
  *(_OWORD *)&v94.m43 = v39;
  *(_OWORD *)&v94.double m31 = v39;
  *(_OWORD *)&v94.CGFloat m33 = v39;
  *(_OWORD *)&v94.m21 = v39;
  *(_OWORD *)&v94.m23 = v39;
  *(_OWORD *)&v94.m11 = v39;
  *(_OWORD *)&v94.m13 = v39;
  if (v17) {
    [v17 transform:v81];
  }
  else {
    memset(&v94, 0, sizeof(v94));
  }
  [v17 opacity:v81];
  float v41 = v40;
  [v17 bounds];
  double v43 = v42;
  double v45 = v44;
  CGFloat v47 = v46;
  CGFloat v49 = v48;
  double v83 = v82 + a8;
  BOOL v50 = v83 != v87 || v84 != v38;
  CATransform3D a = v94;
  long long v51 = *(_OWORD *)&a5->m33;
  *(_OWORD *)&b.double m31 = *(_OWORD *)&a5->m31;
  *(_OWORD *)&b.CGFloat m33 = v51;
  long long v52 = *(_OWORD *)&a5->m43;
  *(_OWORD *)&b.m41 = *(_OWORD *)&a5->m41;
  *(_OWORD *)&b.m43 = v52;
  long long v53 = *(_OWORD *)&a5->m13;
  *(_OWORD *)&b.m11 = *(_OWORD *)&a5->m11;
  *(_OWORD *)&b.m13 = v53;
  long long v54 = *(_OWORD *)&a5->m23;
  *(_OWORD *)&b.m21 = *(_OWORD *)&a5->m21;
  *(_OWORD *)&b.m23 = v54;
  BOOL v55 = CATransform3DEqualToTransform(&a, &b);
  v99.origin.CGFloat x = v43;
  v99.origin.CGFloat y = v45;
  v99.size.CGFloat width = v47;
  v99.size.double height = v49;
  v100.origin.CGFloat x = v43;
  v100.origin.CGFloat y = v45;
  v100.size.CGFloat width = v88;
  v100.size.double height = rect;
  BOOL v56 = CGRectEqualToRect(v99, v100);
  double v57 = v41;
  if (v50 || !v55 || v57 != a7 || !v56)
  {
    if (!v56) {
      -[MFTiltedTabView _updateSpringAnimationForView:withBounds:animated:](self, "_updateSpringAnimationForView:withBounds:animated:", v16, v9, v43, v45, v88, rect);
    }
    [v17 setPosition:v38, v87];
    long long v58 = *(_OWORD *)&a5->m33;
    *(_OWORD *)&a.double m31 = *(_OWORD *)&a5->m31;
    *(_OWORD *)&a.CGFloat m33 = v58;
    long long v59 = *(_OWORD *)&a5->m43;
    *(_OWORD *)&a.m41 = *(_OWORD *)&a5->m41;
    *(_OWORD *)&a.m43 = v59;
    long long v60 = *(_OWORD *)&a5->m13;
    *(_OWORD *)&a.m11 = *(_OWORD *)&a5->m11;
    *(_OWORD *)&a.m13 = v60;
    long long v61 = *(_OWORD *)&a5->m23;
    *(_OWORD *)&a.m21 = *(_OWORD *)&a5->m21;
    *(_OWORD *)&a.m23 = v61;
    [v17 setTransform:&a];
    HIDWORD(v62) = HIDWORD(a7);
    *(float *)&double v62 = a7;
    [v17 setOpacity:v62];
    if (v9)
    {
      if (v50)
      {
        double v63 = v84 - v38;
        double v64 = v83 - v87;
        if (!self->_applyVelocityOnlyToHorizontalPosition
          || ([(MFTiltedTabView *)self _velocityForSpringAnimations], v65 == 0.0))
        {
          v67 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v63, v64);
          v68 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", CGPointZero.x, CGPointZero.y);
          [(MFTiltedTabView *)self _addSpringAnimationWithKeyPath:@"position" toLayer:v17 fromValue:v67 toValue:v68];
        }
        else
        {
          v66 = +[NSNumber numberWithDouble:v63];
          [(MFTiltedTabView *)self _addSpringAnimationWithKeyPath:@"position.x" toLayer:v17 fromValue:v66 toValue:&off_10062AB78];

          v67 = +[NSNumber numberWithDouble:v64];
          [(MFTiltedTabView *)self _addSpringAnimationWithKeyPath:@"position.y" toLayer:v17 fromValue:v67 toValue:&off_10062AB78];
        }
      }
      if (!v55)
      {
        *(void *)&long long v69 = -1;
        *((void *)&v69 + 1) = -1;
        *(_OWORD *)&a.m41 = v69;
        *(_OWORD *)&a.m43 = v69;
        *(_OWORD *)&a.double m31 = v69;
        *(_OWORD *)&a.CGFloat m33 = v69;
        *(_OWORD *)&a.m21 = v69;
        *(_OWORD *)&a.m23 = v69;
        *(_OWORD *)&a.m11 = v69;
        *(_OWORD *)&a.m13 = v69;
        long long v70 = *(_OWORD *)&a5->m33;
        *(_OWORD *)&b.double m31 = *(_OWORD *)&a5->m31;
        *(_OWORD *)&b.CGFloat m33 = v70;
        long long v71 = *(_OWORD *)&a5->m43;
        *(_OWORD *)&b.m41 = *(_OWORD *)&a5->m41;
        *(_OWORD *)&b.m43 = v71;
        long long v72 = *(_OWORD *)&a5->m13;
        *(_OWORD *)&b.m11 = *(_OWORD *)&a5->m11;
        *(_OWORD *)&b.m13 = v72;
        long long v73 = *(_OWORD *)&a5->m23;
        *(_OWORD *)&b.m21 = *(_OWORD *)&a5->m21;
        *(_OWORD *)&b.m23 = v73;
        CATransform3DInvert(&v90, &b);
        CATransform3D b = v94;
        CATransform3DConcat(&a, &b, &v90);
        CATransform3D b = a;
        v74 = +[NSValue valueWithCATransform3D:&b];
        long long v75 = *(_OWORD *)&CATransform3DIdentity.m33;
        *(_OWORD *)&b.double m31 = *(_OWORD *)&CATransform3DIdentity.m31;
        *(_OWORD *)&b.CGFloat m33 = v75;
        long long v76 = *(_OWORD *)&CATransform3DIdentity.m43;
        *(_OWORD *)&b.m41 = *(_OWORD *)&CATransform3DIdentity.m41;
        *(_OWORD *)&b.m43 = v76;
        long long v77 = *(_OWORD *)&CATransform3DIdentity.m13;
        *(_OWORD *)&b.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
        *(_OWORD *)&b.m13 = v77;
        long long v78 = *(_OWORD *)&CATransform3DIdentity.m23;
        *(_OWORD *)&b.m21 = *(_OWORD *)&CATransform3DIdentity.m21;
        *(_OWORD *)&b.m23 = v78;
        v79 = +[NSValue valueWithCATransform3D:&b];
        [(MFTiltedTabView *)self _addSpringAnimationWithKeyPath:@"transform" toLayer:v17 fromValue:v74 toValue:v79];
      }
      if (v57 != a7)
      {
        v80 = +[NSNumber numberWithDouble:v57 - a7];
        [(MFTiltedTabView *)self _addSpringAnimationWithKeyPath:@"opacity" toLayer:v17 fromValue:v80 toValue:&off_10062AB78];
      }
    }
  }
  else if (a8 != 0.0)
  {
    [v17 setPosition:v38, v87];
  }
}

- (void)_updateSpringAnimationForView:(id)a3 withBounds:(CGRect)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v21 = a3;
  [v21 bounds];
  double v11 = v23.origin.x;
  double v12 = v23.origin.y;
  double v13 = v23.size.width;
  double v14 = v23.size.height;
  v24.origin.double x = x;
  v24.origin.double y = y;
  v24.size.double width = width;
  v24.size.double height = height;
  if (!CGRectEqualToRect(v23, v24))
  {
    [v21 setBounds:x, y, width, height];
    if (v5)
    {
      double v15 = [v21 layer];
      id v16 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v11 - x, v12 - y);
      long long v17 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", CGPointZero.x, CGPointZero.y);
      [(MFTiltedTabView *)self _addSpringAnimationWithKeyPath:@"bounds.origin" toLayer:v15 fromValue:v16 toValue:v17];

      double v18 = [v21 layer];
      double v19 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v13 - width, v14 - height);
      double v20 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", CGSizeZero.width, CGSizeZero.height);
      [(MFTiltedTabView *)self _addSpringAnimationWithKeyPath:@"bounds.size" toLayer:v18 fromValue:v19 toValue:v20];
    }
  }
}

- (id)_makeReorderAnimationWithDirection:(int64_t)a3 springDuration:(double)a4 tabCount:(double)a5
{
  double v7 = sub_1001DB3D4(a5);
  __double2 v8 = __sincos_stret(v7 * 3.14159265 / 180.0);
  double v9 = *(double *)&qword_100691078;
  id v10 = +[CASpringAnimation animationWithKeyPath:@"position"];
  [v10 setMass:1.0];
  [v10 setStiffness:300.0];
  [v10 setDamping:400.0];
  double v11 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
  [v10 setTimingFunction:v11];

  double v12 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", 0.0, v9 * v8.__cosval);
  double v13 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", CGPointZero.x, CGPointZero.y);
  sub_1001F0C2C(v10, v12, v13, a3);

  [v10 setDuration:a4];
  [v10 setFillMode:kCAFillModeBoth];
  [v10 setAdditive:1];
  double v14 = +[CASpringAnimation animationWithKeyPath:@"zPosition"];
  [v14 setMass:1.0];
  [v14 setStiffness:300.0];
  [v14 setDamping:400.0];
  double v15 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
  [v14 setTimingFunction:v15];

  id v16 = +[NSNumber numberWithDouble:-(v8.__sinval * v9)];
  sub_1001F0C2C(v14, v16, &off_10062AB78, a3);

  [v14 setDuration:a4];
  [v14 setFillMode:kCAFillModeBoth];
  [v14 setAdditive:1];
  long long v17 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
  sub_1001F0C2C(v17, &off_10062AB90, &off_10062AB78, a3);
  if (a3 < 1) {
    +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
  }
  else {
  double v18 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
  }
  [v17 setTimingFunction:v18];

  [v17 setDuration:*(double *)&qword_100691030];
  [v17 setFillMode:kCAFillModeBoth];
  [v17 setAdditive:1];
  double v19 = +[CAAnimationGroup animation];
  v24[0] = v10;
  v24[1] = v14;
  v24[2] = v17;
  double v20 = +[NSArray arrayWithObjects:v24 count:3];
  [v19 setAnimations:v20];

  [v19 setDuration:a4];
  UIAnimationDragCoefficient();
  *(float *)&double v22 = 1.0 / v21;
  [v19 setSpeed:v22];
  [v19 setFillMode:kCAFillModeBoth];

  return v19;
}

- (void)_stopReorderingItem:(id)a3 withFinalTimeAdjustment:(double)a4 tabCount:(double)a5
{
  id v13 = a3;
  [v13 setReordering:0];
  [v13 setIndexForLayout:0x7FFFFFFFFFFFFFFFLL];
  __double2 v8 = [v13 layer];
  [v8 removeAnimationForKey:@"reorder-animation"];
  [(MFTiltedTabView *)self setNeedsLayout];
  double v9 = 1.0 - a4;
  if (a4 > 1.0) {
    double v9 = 0.0;
  }
  double v10 = fmin(*(double *)&qword_100691020 / *(double *)&qword_100691030 + v9 * 2.0, 1.0);
  if (v10 > 0.001)
  {
    double v11 = [(MFTiltedTabView *)self _makeReorderAnimationWithDirection:1 springDuration:*(double *)&qword_100691028 tabCount:a5];
    double v12 = 1.0 / v10;
    *(float *)&double v12 = 1.0 / v10;
    [v11 setSpeed:v12];
    [v8 addAnimation:v11 forKey:0];
  }
}

- (void)_updateReorderAnimationBeginTimeForLayer:(id)a3 withTimeAdjustment:(double)a4
{
  id v13 = a3;
  BOOL v5 = [v13 animationForKey:@"reorder-animation"];
  id v6 = [v5 valueForKey:@"base-begin-time"];
  [v6 doubleValue];
  double v8 = v7;

  double v9 = *(double *)&qword_100691030;
  [v5 beginTime];
  double v11 = v8 - a4 * v9;
  if (v10 == 0.0 || v11 < v10)
  {
    [v5 setValue:&__kCFBooleanTrue forKey:@"being-replaced"];
    id v12 = [v5 mutableCopy];

    [v12 setValue:&__kCFBooleanFalse forKey:@"being-replaced"];
    [v12 setBeginTime:v11];
    [v13 addAnimation:v12 forKey:@"reorder-animation"];
  }
  else
  {
    id v12 = v5;
  }
}

- (void)_updateReorderAnimationsForItem:(id)a3 withTimeAdjustment:(double)a4 tabCount:(double)a5 createIfNecessary:(BOOL)a6
{
  id v11 = a3;
  double v8 = [v11 layer];
  double v9 = [v8 animationForKey:@"reorder-animation"];
  if (v9)
  {
    double v10 = 0.0;
    if (a4 >= 0.0 && (double v10 = a4, a4 >= 1.0))
    {
      -[MFTiltedTabView _stopReorderingItem:withFinalTimeAdjustment:tabCount:](self, "_stopReorderingItem:withFinalTimeAdjustment:tabCount:", v11);
    }
    else
    {
      CACurrentMediaTime();
      [(MFTiltedTabView *)self _updateReorderAnimationBeginTimeForLayer:v8 withTimeAdjustment:v10];
    }
  }
}

- (double)_spaceBetweenTabsWithCount:(double)a3
{
  [(MFTiltedTabView *)self _tabLayoutBounds];
  double v6 = v5 * 0.07 + 77.0;
  if (a3 >= 1.0)
  {
    double v7 = v5;
    [(MFTiltedTabView *)self _topAreaHeightForTabsWithCount:a3];
    double v9 = (v7 - v8 - *(double *)&qword_1006910C0 + unk_1006910C8) / a3;
    if (v9 >= v6) {
      return v9;
    }
  }
  return v6;
}

- (CGSize)_contentSizeForItemCount:(double)a3
{
  [(MFTiltedTabView *)self _tabLayoutBounds];
  double v6 = v5;
  [(MFTiltedTabView *)self _spaceBetweenTabsWithCount:a3];
  double v8 = v7;
  [(MFTiltedTabView *)self _topAreaHeightForTabsWithCount:a3];
  double v10 = v9 + v8 * a3 + *(double *)&qword_1006910C0;
  double v11 = v6;
  result.double height = v10;
  result.double width = v11;
  return result;
}

- (double)_baseOffsetForItemAtIndex:(unint64_t)a3 withItemCountForLayout:(double)a4
{
  [(MFTiltedTabView *)self _spaceBetweenTabsWithCount:fmax(a4, 1.0)];
  return v5 * (double)a3;
}

- (double)_baseOffsetForItem:(id)a3 index:(unint64_t *)a4 count:(double *)a5
{
  double v8 = (_MFTiltedTabItemView *)a3;
  id v9 = [(_MFTiltedTabItemView *)v8 indexForLayout];
  if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = [(MFTiltedTabView *)self _indexOfVisibleItem:v8];
    if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v9 = [(MFTiltedTabView *)self _numberOfItems];
      if (v9 == (id)0x7FFFFFFFFFFFFFFFLL) {
        __assert_rtn("-[MFTiltedTabView _baseOffsetForItem:index:count:]", "MFTiltedTabView.m", 1513, "itemIndex != NSNotFound");
      }
    }
  }
  if ([(_MFTiltedTabItemView *)v8 countForLayout] == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v10 = [(MFTiltedTabView *)self _numberOfItems];
  }
  else {
    unint64_t v10 = [(_MFTiltedTabItemView *)v8 countForLayout];
  }
  double v11 = (double)v10;
  if (self->_interactivelyReorderingItem != v8)
  {
    [(MFTiltedTabView *)self _baseOffsetForItemAtIndex:v9 withItemCountForLayout:v11];
    double interactiveReorderOffset = v12;
    if (!a4) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  double interactiveReorderOffset = self->_interactiveReorderOffset;
  if (a4) {
LABEL_9:
  }
    *a4 = (unint64_t)v9;
LABEL_10:
  if (a5) {
    *a5 = v11;
  }

  return interactiveReorderOffset;
}

- (void)_invalidateAllSnapshots
{
}

- (void)_invalidateAllSnapshotsForce:(BOOL)a3
{
  if (self->_presented)
  {
    BOOL v3 = a3;
    if ([(NSArray *)self->_itemsInvolvedInAnimation count])
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      double v5 = self->_itemsInvolvedInAnimation;
      id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v21;
        do
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v21 != v7) {
              objc_enumerationMutation(v5);
            }
            id v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            unint64_t v10 = -[MFTiltedTabView _indexOfVisibleItem:](self, "_indexOfVisibleItem:", v9, (void)v20);
            [v9 frame];
            double v12 = v11;
            id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            [WeakRetained tiltedTabView:self frameForItemAtIndex:v10];
            double v15 = v14;

            if (v15 != v12 || v3)
            {
              if ([(MFTiltedTabView *)self rotationStyle])
              {
                long long v17 = [v9 borrowedContentView];
                [v17 setAlpha:0.0];

                double v18 = +[UIColor systemBackgroundColor];
                double v19 = [v9 contentClipperView];
                [v19 setBackgroundColor:v18];
              }
            }
          }
          id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v6);
      }
    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFTiltedTabView;
  [(MFTiltedTabView *)&v9 traitCollectionDidChange:v4];
  double v5 = [(MFTiltedTabView *)self traitCollection];
  unsigned int v6 = [v5 mf_traitDifferenceAffectsTextLayout:v4];

  uint64_t v7 = [(MFTiltedTabView *)self traitCollection];
  unsigned int v8 = [v7 hasDifferentColorAppearanceComparedToTraitCollection:v4];

  if ((v6 | v8) == 1)
  {
    [(MFTiltedTabView *)self _invalidateAllSnapshotsForce:1];
    [(MFTiltedTabView *)self updateSnapshotsIfNecessary];
  }
}

- (int64_t)_currentOrientation
{
  id v4 = [(MFTiltedTabView *)self window];

  if (!v4)
  {
    objc_super v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"MFTiltedTabView.m" lineNumber:1575 description:@"Asking for currentOrientation without a window is not supported."];
  }
  double v5 = [(MFTiltedTabView *)self window];
  unsigned int v6 = [v5 windowScene];
  id v7 = [v6 interfaceOrientation];

  return (int64_t)v7;
}

- (id)visibleIndexSet
{
  BOOL v3 = +[NSMutableIndexSet indexSet];
  [(UIScrollView *)self->_scrollView contentOffset];
  double v5 = v4;
  [(UIScrollView *)self->_scrollView bounds];
  unint64_t v6 = 0;
  double v8 = v5 + v7;
  while (v6 < [(MFTiltedTabView *)self _numberOfItems])
  {
    [(MFTiltedTabView *)self _baseOffsetForItemAtIndex:v6 withItemCountForLayout:(double)[(MFTiltedTabView *)self _numberOfItems]];
    if (v9 + 200.0 > v5 && v9 < v8) {
      [v3 addIndex:v6];
    }
    ++v6;
  }

  return v3;
}

- (void)updateSnapshotsIfNecessary
{
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = self->_itemsInvolvedInAnimation;
  id v3 = [(NSArray *)obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v3)
  {
    uint64_t v21 = *(void *)v36;
    CGPoint origin = CGRectZero.origin;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v36 != v21) {
          objc_enumerationMutation(obj);
        }
        double v5 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        unint64_t v6 = [v5 contentClipperView];
        double v7 = [v6 snapshotViewAfterScreenUpdates:0];

        double v8 = [v5 contentClipperView];
        double v9 = v8;
        if (v8)
        {
          [v8 transform];
        }
        else
        {
          long long v33 = 0u;
          long long v34 = 0u;
          long long v32 = 0u;
        }
        v31[0] = v32;
        v31[1] = v33;
        v31[2] = v34;
        [v7 setTransform:v31];

        unint64_t v10 = [v5 contentClipperView];
        [v10 frame];
        [v7 setFrame:];

        double v11 = [v5 contentClipperView];
        [v5 insertSubview:v7 aboveSubview:v11];

        unint64_t v12 = [(MFTiltedTabView *)self _indexOfVisibleItem:v5];
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_1001F1BEC;
        v30[3] = &unk_100604E58;
        v30[4] = self;
        v30[5] = v5;
        v30[6] = v12;
        +[UIView performWithoutAnimation:v30];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained tiltedTabView:self frameForItemAtIndex:v12];
        uint64_t v15 = v14;
        uint64_t v17 = v16;

        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_1001F1FC8;
        void v24[3] = &unk_100605ED0;
        id v25 = v7;
        double v26 = v5;
        CGPoint v27 = origin;
        uint64_t v28 = v15;
        uint64_t v29 = v17;
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_1001F20F0;
        v22[3] = &unk_100604550;
        id v18 = v25;
        id v23 = v18;
        +[UIView animateWithDuration:v24 animations:v22 completion:0.22];
      }
      id v3 = [(NSArray *)obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v3);
  }

  [(MFTiltedTabView *)self layoutItemsAnimated:0];
}

- (void)layoutItemsAnimated:(BOOL)a3
{
  BOOL v215 = a3;
  [(MFTiltedTabView *)self bounds];
  if (self->_suppressingScrollViewDidScroll) {
    sub_10045D630();
  }
  double v8 = v4;
  double v9 = v5;
  double v10 = v7;
  self->_suppressingScrollViewDidScroll = 1;
  double v11 = v6;
  [(UIScrollView *)self->_scrollView frame];
  v249.origin.double x = v12;
  v249.origin.double y = v13;
  v249.size.double width = v14;
  v249.size.CGFloat height = v15;
  v241.origin.double x = v8;
  v241.origin.double y = v9;
  double v178 = v11;
  v241.size.double width = v11;
  double v190 = v10;
  v241.size.CGFloat height = v10;
  if (!CGRectEqualToRect(v241, v249)) {
    -[UIScrollView setFrame:](self->_scrollView, "setFrame:", v8, v9, v11, v10);
  }
  unint64_t v16 = [(MFTiltedTabView *)self _numberOfItems];
  [(UIScrollView *)self->_scrollView contentOffset];
  double v18 = v17;
  scrollView = self->_scrollView;
  double v177 = (double)v16;
  -[MFTiltedTabView _contentSizeForItemCount:](self, "_contentSizeForItemCount:");
  -[UIScrollView setContentSize:](scrollView, "setContentSize:");
  [(UIScrollView *)self->_scrollView contentOffset];
  double v192 = v20;
  [(UIScrollView *)self->_scrollView setScrollEnabled:self->_presented];
  self->_suppressingScrollViewDidScroll = 0;
  if (self->_selectedItem) {
    unint64_t v180 = -[MFTiltedTabView _indexOfVisibleItem:](self, "_indexOfVisibleItem:");
  }
  else {
    unint64_t v180 = 0x7FFFFFFFFFFFFFFFLL;
  }
  long long v239 = 0u;
  long long v238 = 0u;
  long long v237 = 0u;
  long long v236 = 0u;
  id obj = self->_itemsInvolvedInAnimation;
  id v21 = [(NSArray *)obj countByEnumeratingWithState:&v236 objects:v240 count:16];
  if (v21)
  {
    char v197 = 0;
    double v194 = v192 - v18;
    uint64_t v189 = *(void *)v237;
    CGFloat left = UIEdgeInsetsZero.left;
    CGFloat right = UIEdgeInsetsZero.right;
    CGFloat bottom = UIEdgeInsetsZero.bottom;
    double y = CGPointZero.y;
    double v193 = fmax(-v192, 0.0);
    double v181 = v10 + v192;
    double v185 = CGRectNull.origin.y;
    CGFloat height = CGRectNull.size.height;
    double width = CGRectNull.size.width;
    double v182 = CGRectZero.origin.y;
    do
    {
      id v191 = v21;
      for (i = 0; i != v191; i = (char *)i + 1)
      {
        if (*(void *)v237 != v189) {
          objc_enumerationMutation(obj);
        }
        id v23 = *(_MFTiltedTabItemView **)(*((void *)&v236 + 1) + 8 * i);
        self->_applyVelocityOnlyToHorizontalPosition = v23 == self->_onlyHorizontalVelocityItem;
        BOOL v211 = ![(_MFTiltedTabItemView *)v23 isClosing]
            && [(MFTiltedTabView *)self _indexOfVisibleItem:v23] == 0x7FFFFFFFFFFFFFFFLL;
        unint64_t v24 = [(MFTiltedTabView *)self _indexOfVisibleItem:v23];
        unint64_t v235 = 0xAAAAAAAAAAAAAAAALL;
        double v234 = NAN;
        [(MFTiltedTabView *)self _baseOffsetForItem:v23 index:&v235 count:&v234];
        double v26 = v25;
        long long v206 = *(_OWORD *)&CATransform3DIdentity.m33;
        long long v207 = *(_OWORD *)&CATransform3DIdentity.m31;
        *(_OWORD *)&v233.double m31 = v207;
        *(_OWORD *)&v233.CGFloat m33 = v206;
        long long v204 = *(_OWORD *)&CATransform3DIdentity.m43;
        long long v205 = *(_OWORD *)&CATransform3DIdentity.m41;
        *(_OWORD *)&v233.m41 = v205;
        *(_OWORD *)&v233.m43 = v204;
        long long v202 = *(_OWORD *)&CATransform3DIdentity.m13;
        long long v203 = *(_OWORD *)&CATransform3DIdentity.m11;
        *(_OWORD *)&v233.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
        *(_OWORD *)&v233.m13 = v202;
        long long v200 = *(_OWORD *)&CATransform3DIdentity.m23;
        long long v201 = *(_OWORD *)&CATransform3DIdentity.m21;
        *(_OWORD *)&v233.m21 = v201;
        *(_OWORD *)&v233.m23 = v200;
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        double v28 = left;
        double top = UIEdgeInsetsZero.top;
        double v30 = right;
        double v29 = bottom;
        if (![(_MFTiltedTabItemView *)v23 isClosing])
        {
          [WeakRetained tiltedTabView:self expanded:self->_presented edgeInsetsForItemAtIndex:v24];
          double top = v31;
          double v28 = v32;
          double v29 = v33;
          double v30 = v34;
          if (WeakRetained) {
            [WeakRetained tiltedTabView:self expanded:self->_presented layerTransformForItemAtIndex:v24];
          }
          else {
            memset(&v232, 0, sizeof(v232));
          }
          CATransform3D v233 = v232;
        }
        -[_MFTiltedTabItemView setContentClippingInsets:](v23, "setContentClippingInsets:", top, v28, v29, v30);
        double v198 = 0.0;
        if (!v211 && self->_presented)
        {
          [(MFTiltedTabView *)self _scrollingEffectFactorForTabsWithCount:v234];
          double v198 = v35;
        }
        if ([(_MFTiltedTabItemView *)v23 isClosing])
        {
          [(_MFTiltedTabItemView *)v23 bounds];
          double v213 = v36;
          double rect = v37;
          CGFloat v39 = v38;
          CGFloat v41 = v40;
        }
        else
        {
          double v42 = [(_MFTiltedTabItemView *)v23 superview];
          [WeakRetained tiltedTabView:self frameForItemAtIndex:v24];
          double v44 = v43;
          double v46 = v45;
          double v48 = v47;
          double v50 = v49;
          long long v51 = [(MFTiltedTabView *)self superview];
          [v42 convertRect:v51 fromView:v44];
          double v213 = v52;
          double rect = v53;
          CGFloat v39 = v54;
          CGFloat v41 = v55;
        }
        if ((id)[(MFTiltedTabView *)self rotationStyle] != (id)2)
        {
          id v57 = [(_MFTiltedTabItemView *)v23 capturedInterfaceOrientation];
          id v58 = [(MFTiltedTabView *)self _currentOrientation];
          uint64_t v59 = 0;
          uint64_t v60 = 0;
          for (double j = 0.0; ; double j = j + v62)
          {
            if (qword_1005A8388[v59] == v57)
            {
              if (qword_1005A8388[v60] == v58)
              {
                *(void *)&long long v63 = -1;
                *((void *)&v63 + 1) = -1;
                *(_OWORD *)&v232.m43 = v63;
                *(_OWORD *)&v232.m41 = v63;
                *(_OWORD *)&v232.CGFloat m33 = v63;
                *(_OWORD *)&v232.double m31 = v63;
                *(_OWORD *)&v232.m23 = v63;
                *(_OWORD *)&v232.m21 = v63;
                *(_OWORD *)&v232.m13 = v63;
                *(_OWORD *)&v232.m11 = v63;
                CATransform3DMakeRotation(&v232, j, 0.0, 0.0, 1.0);
                CATransform3D v231 = v232;
                [(_MFTiltedTabItemView *)v23 setContentTransform:&v231];
                CATransform3D v231 = v232;
                CATransform3DGetAffineTransform(&v230, &v231);
                v242.origin.double x = v39;
                v242.origin.double y = v41;
                v242.size.double width = v213;
                v242.size.CGFloat height = rect;
                *(CGRect *)&double v56 = CGRectApplyAffineTransform(v242, &v230);
                CGFloat v41 = v64;
                double v213 = v65;
                double rect = v66;
                break;
              }
              uint64_t v60 = ((_BYTE)v60 + 1) & 3;
              double v62 = 1.57079633;
            }
            else
            {
              uint64_t v59 = ((_BYTE)v59 + 1) & 3;
              double v62 = -1.57079633;
            }
          }
        }
        [(MFTiltedTabView *)self bounds];
        double v208 = (v67 - v213) * 0.5;
        if (self->_presented)
        {
          double v68 = v26;
        }
        else
        {
          [(_MFTiltedTabItemView *)v23 contentClippingInsets];
          double v70 = v69;
          [(_MFTiltedTabItemView *)v23 contentClippingInsets];
          double v208 = v208 + v70;
          double v68 = v26 + v71;
        }
        long long v72 = [(_MFTiltedTabItemView *)v23 borrowedContentView];
        long long v73 = [v72 layer];

        v74 = [(_MFTiltedTabItemView *)v23 borrowedContentView];
        [v74 bounds];
        double MidX = CGRectGetMidX(v243);
        long long v76 = [(_MFTiltedTabItemView *)v23 borrowedContentView];
        [v76 bounds];
        double MidY = CGRectGetMidY(v244);

        [(_MFTiltedTabItemView *)v23 contentClippingInsets];
        double v79 = v78;
        [(_MFTiltedTabItemView *)v23 contentClippingInsets];
        double v81 = v80;
        [v73 position];
        double v83 = v82;
        [v73 position];
        double v84 = MidX - v79;
        double v85 = MidY - v81;
        double v87 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v83 - v84, v86 - v85);
        double v88 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", CGPointZero.x, y);
        [(MFTiltedTabView *)self _addSpringAnimationWithKeyPath:@"position" toLayer:v73 fromValue:v87 toValue:v88];

        [v73 setPosition:v84, v85];
        v209 = [(_MFTiltedTabItemView *)v23 contentClipperView];
        [(_MFTiltedTabItemView *)v23 bounds];
        double v90 = v89;
        double v92 = v91;
        [(_MFTiltedTabItemView *)v23 contentClippingInsets];
        -[MFTiltedTabView _updateSpringAnimationForView:withBounds:animated:](self, "_updateSpringAnimationForView:withBounds:animated:", v209, v215, CGPointZero.x, y, v90 - (v93 + v94), v92 - (v95 + v96));
        CGRect v97 = [(_MFTiltedTabItemView *)v23 maskCutoutView];
        if (v97)
        {
          [v209 frame];
          [v97 setFrame:];
          if (v215)
          {
            CGRect v98 = +[MFSpringAnimation springAnimationWithKeyPath:@"path" fromValue:0 toValue:0];
            [v98 setAdditive:0];
            CGRect v99 = [v97 layer];
            [v99 addAnimation:v98 forKey:0];
          }
        }
        [WeakRetained tiltedTabView:self alphaValueForItemAtIndex:v24];
        -[_MFTiltedTabItemView setAlpha:](v23, "setAlpha:");
        if ([(_MFTiltedTabItemView *)v23 isReordering])
        {
          unint64_t v100 = [(MFTiltedTabView *)self _indexOfVisibleItem:v23];
          double v101 = 0.0;
          if (v100 < v235) {
            double v101 = -1.0;
          }
          if (v100 > v235) {
            double v101 = 1.0;
          }
          [(MFTiltedTabView *)self _updateReorderAnimationsForItem:v23 withTimeAdjustment:v215 tabCount:1.0 - (self->_interactiveReorderOffset - v68) * v101 / *(double *)&qword_100691070 createIfNecessary:v234];
          char v197 = 1;
        }
        else
        {
          v197 |= v23 == self->_interactivelyReorderingItem;
        }
        if (self->_presented || (double v102 = v192, [(_MFTiltedTabItemView *)v23 isClosing]))
        {
          double v103 = v181;
          if (!v211)
          {
            [(MFTiltedTabView *)self _topAreaHeightForTabsWithCount:v234];
            double v103 = v68 + v104;
          }
          double v102 = v103 * (v193 * *(double *)&qword_1006910D8 + 1.0);
        }
        if (v211) {
          double v105 = *(double *)&qword_1006910D0;
        }
        else {
          double v105 = sub_1001DB3D4(v234);
        }
        double v106 = *(double *)&qword_100691060;
        if (!self->_presented) {
          double v106 = 0.0;
        }
        double v212 = v106;
        if (v23 == self->_pressedItem
          || v23 == self->_interactivelyClosingItem
          || v23 == self->_interactivelyReorderingItem
          || [(_MFTiltedTabItemView *)v23 isClosing])
        {
          double v105 = v105 + -2.0;
          double v102 = v102 + -10.0;
        }
        if (self->_presented) {
          double v212 = v212 + v198 * 0.2 * sub_1001DB57C((v26 - v192) / v190, v190);
        }
        if ([(_MFTiltedTabItemView *)v23 isClosing])
        {
          [(MFTiltedTabView *)self _tabCloseAnimationSlideDistance];
          double v108 = v107;
          [(_MFTiltedTabItemView *)v23 verticalScrollAdjustment];
          double v110 = v194 + v109;
          [(_MFTiltedTabItemView *)v23 setVerticalScrollAdjustment:v194 + v109];
          [(NSMutableSet *)self->_itemsCurrentlyClosing addObject:v23];
          double v208 = -(v213 + v108);
          double v102 = v102 + v110;
        }
        else if (v23 == self->_interactivelyClosingItem)
        {
          [(MFTiltedTabView *)self _tabCloseAnimationSlideDistance];
          double v208 = -(v111 * self->_interactiveCloseProgress);
        }
        BOOL presented = self->_presented;
        if (self->_presented) {
          CGFloat v113 = v102;
        }
        else {
          CGFloat v113 = v41;
        }
        double v195 = v113;
        CATransform3D v232 = v233;
        if (presented)
        {
          double v114 = v198 * sub_1001DB52C((v26 - v192) / v190)
               + (v105 + v193 * *(double *)&qword_1006910E0) * -3.14159265 / 180.0;
          if (v114 != 0.00000011920929)
          {
            *(void *)&long long v115 = -1;
            *((void *)&v115 + 1) = -1;
            *(_OWORD *)&v231.m43 = v115;
            *(_OWORD *)&v231.m41 = v115;
            *(_OWORD *)&v231.CGFloat m33 = v115;
            *(_OWORD *)&v231.double m31 = v115;
            *(_OWORD *)&v231.m23 = v115;
            *(_OWORD *)&v231.m21 = v115;
            *(_OWORD *)&v231.m13 = v115;
            *(_OWORD *)&v231.m11 = v115;
            CATransform3DMakeRotation(&v231, v114, 1.0, 0.0, 0.0);
            CATransform3D a = v233;
            CATransform3D b = v231;
            CATransform3DConcat(&v229, &a, &b);
            CATransform3D v232 = v229;
          }
        }
        selectedItem = self->_selectedItem;
        if (selectedItem && v180)
        {
          if (v235) {
            BOOL v117 = v23 == selectedItem;
          }
          else {
            BOOL v117 = 1;
          }
          double v118 = v212 + -20.0;
          if (v117) {
            double v118 = v212;
          }
          if (v23 == selectedItem) {
            double v118 = 1.0;
          }
          double v212 = v118;
          char v197 = 1;
        }
        if (self->_presented)
        {
          [(MFTiltedTabView *)self frame];
          double v120 = v119;
          double v122 = v121;
          double v124 = v123;
          double v126 = v125;
          [(MFTiltedTabView *)self safeAreaInsets];
          double v128 = v127;
          double v130 = v129;
          double v132 = v131;
          double v134 = v133;
          v245.origin.double x = v120;
          v245.origin.double y = v122;
          v245.size.double width = v124;
          v245.size.CGFloat height = v126;
          double v199 = CGRectGetWidth(v245);
          v246.origin.double x = v120 + v130;
          v246.origin.double y = v122 + v128;
          v246.size.double width = v124 - (v130 + v134);
          v246.size.CGFloat height = v126 - (v128 + v132);
          double v135 = CGRectGetWidth(v246);
          v136 = [(UIScrollView *)self->_scrollView layer];
          v137 = v136;
          if (v136)
          {
            [v136 sublayerTransform];
            double v138 = *((double *)&v224 + 1);
          }
          else
          {
            long long v225 = 0u;
            long long v226 = 0u;
            long long v223 = 0u;
            long long v224 = 0u;
            long long v221 = 0u;
            long long v222 = 0u;
            double v138 = 0.0;
            long long v219 = 0u;
            long long v220 = 0u;
          }

          double v139 = v212 + -1.0 / v138 - v199 * (-1.0 / v138) / v135;
        }
        else
        {
          double v139 = v212;
        }
        if (v139 != 0.0)
        {
          *(void *)&long long v140 = -1;
          *((void *)&v140 + 1) = -1;
          *(_OWORD *)&v231.m43 = v140;
          *(_OWORD *)&v231.m41 = v140;
          *(_OWORD *)&v231.CGFloat m33 = v140;
          *(_OWORD *)&v231.double m31 = v140;
          *(_OWORD *)&v231.m23 = v140;
          *(_OWORD *)&v231.m21 = v140;
          *(_OWORD *)&v231.m13 = v140;
          *(_OWORD *)&v231.m11 = v140;
          CATransform3DMakeTranslation(&v231, 0.0, 0.0, v139);
          CATransform3D a = v232;
          CATransform3D b = v231;
          CATransform3DConcat(&v229, &a, &b);
          CATransform3D v232 = v229;
        }
        CATransform3D v231 = v232;
        CATransform3D v229 = v233;
        -[MFTiltedTabView _updateSpringAnimationForView:withFrame:transform:userTransform:opacity:verticalScrollAdjustment:animated:](self, "_updateSpringAnimationForView:withFrame:transform:userTransform:opacity:verticalScrollAdjustment:animated:", v23, &v231, &v229, v215, v208, v195, v213, rect, 1.0, v194);
        [(_MFTiltedTabItemView *)v23 layoutSubviews];
        [WeakRetained tiltedTabView:self headerHeightForItemAtIndex:v24];
        double v142 = v141;
        -[_MFTiltedTabItemView setTopBackdropHeight:](v23, "setTopBackdropHeight:");
        [(_MFTiltedTabItemView *)v23 setTopBackdropScaled:self->_presented];
        [(MFTiltedTabView *)self _updateCloseButtonImageForItem:v23];
        v143 = [(_MFTiltedTabItemView *)v23 closeButtonWrapperView];
        v144 = [v143 superview];
        [v144 bounds];
        double v146 = v145;
        double v147 = sub_1001DB3B0();

        double v148 = 0.8;
        if (self->_presented) {
          double v148 = v142 / v147;
        }
        double v149 = 0.0;
        if (!self->_presented) {
          double v149 = v142 / 1.6 + v147 * -0.5;
        }
        CATransform3DMakeScale(&v218, 1.0, v148, 1.0);
        *(_OWORD *)&v231.double m31 = v207;
        *(_OWORD *)&v231.CGFloat m33 = v206;
        *(_OWORD *)&v231.m41 = v205;
        *(_OWORD *)&v231.m43 = v204;
        *(_OWORD *)&v231.m11 = v203;
        *(_OWORD *)&v231.m13 = v202;
        *(_OWORD *)&v231.m21 = v201;
        *(_OWORD *)&v231.m23 = v200;
        -[MFTiltedTabView _updateSpringAnimationForView:withFrame:transform:userTransform:opacity:verticalScrollAdjustment:animated:](self, "_updateSpringAnimationForView:withFrame:transform:userTransform:opacity:verticalScrollAdjustment:animated:", v143, &v218, &v231, v215, 0.0, v149, v146, v147, 1.0, 0.0);
        if (self->_presented) {
          id v150 = [WeakRetained tiltedTabView:self canCloseItemAtIndex:v24];
        }
        else {
          id v150 = 0;
        }
        [(_MFTiltedTabItemView *)v23 layoutHeaderViewAnimated:v215 closeButton:v150];
        double v152 = height;
        double v151 = width;
        double v154 = v185;
        double x = CGRectNull.origin.x;
        if (v150)
        {
          v155 = [(_MFTiltedTabItemView *)v23 closeButton];
          [v155 bounds];
          UIRectGetCenter();
          [v155 convertPoint:self->_scrollView toView:];
          double v157 = v156;
          double v159 = v158;
          double v152 = *(double *)&qword_100691050;

          double x = v157 - v152 * 0.5;
          double v154 = v159 - v152 * 0.5;
          double v151 = v152;
        }
        -[_MFTiltedTabItemView setCloseButtonHitRect:](v23, "setCloseButtonHitRect:", x, v154, v151, v152);
        [(_MFTiltedTabItemView *)v23 contentClippingInsets];
        double v161 = v160;
        v162 = [(_MFTiltedTabItemView *)v23 contentShadowView];
        if (self->_presented)
        {
          sub_1001DB4B4();
          double v164 = v163;
        }
        else
        {
          double v164 = 0.0;
        }
        *(_OWORD *)&v231.double m31 = v207;
        *(_OWORD *)&v231.CGFloat m33 = v206;
        *(_OWORD *)&v231.m41 = v205;
        *(_OWORD *)&v231.m43 = v204;
        *(_OWORD *)&v231.m11 = v203;
        *(_OWORD *)&v231.m13 = v202;
        *(_OWORD *)&v231.m21 = v201;
        *(_OWORD *)&v231.m23 = v200;
        *(_OWORD *)&v229.double m31 = v207;
        *(_OWORD *)&v229.CGFloat m33 = v206;
        *(_OWORD *)&v229.m41 = v205;
        *(_OWORD *)&v229.m43 = v204;
        *(_OWORD *)&v229.m11 = v203;
        *(_OWORD *)&v229.m13 = v202;
        *(_OWORD *)&v229.m21 = v201;
        *(_OWORD *)&v229.m23 = v200;
        -[MFTiltedTabView _updateSpringAnimationForView:withFrame:transform:userTransform:opacity:verticalScrollAdjustment:animated:](self, "_updateSpringAnimationForView:withFrame:transform:userTransform:opacity:verticalScrollAdjustment:animated:", v162, &v231, &v229, v215, CGRectZero.origin.x, v182, v213, rect - v161, v164, 0.0);
        if (v24)
        {
          v165 = [(DockedPlaceholderView *)v23 headerView];
          [(_MFTiltedTabItemView *)v23 bringSubviewToFront:v165];

          v166 = [(_MFTiltedTabItemView *)v23 closeButtonWrapperView];
          [(_MFTiltedTabItemView *)v23 bringSubviewToFront:v166];

          v217[0] = _NSConcreteStackBlock;
          v217[1] = 3221225472;
          v217[2] = sub_1001F37D8;
          v217[3] = &unk_100604618;
          v217[4] = self;
          v217[5] = v23;
          v167 = objc_retainBlock(v217);
          v168 = v167;
          if (v215) {
            +[UIView animateWithDuration:327680 delay:v167 options:0 animations:0.22 completion:0.0];
          }
          else {
            ((void (*)(void *))v167[2])(v167);
          }
        }
      }
      id v21 = [(NSArray *)obj countByEnumeratingWithState:&v236 objects:v240 count:16];
    }
    while (v21);
  }
  else
  {
    char v197 = 0;
  }

  self->_applyVelocityOnlyToHorizontalPosition = 0;
  if (self->_presented)
  {
    [(MFTiltedTabView *)self _topAreaHeightForTabsWithCount:v177];
    double v170 = *(double *)&qword_1006910B0 * fmax(fmin(v192 / v169, 1.0), 0.0);
  }
  else
  {
    double v170 = 0.0;
  }
  v216[0] = _NSConcreteStackBlock;
  v216[1] = 3221225472;
  v216[2] = sub_1001F3890;
  v216[3] = &unk_1006048E0;
  v216[4] = self;
  *(double *)&v216[5] = v170;
  v171 = objc_retainBlock(v216);
  v172 = v171;
  if (v215) {
    +[UIView animateWithDuration:v171 animations:0.25];
  }
  else {
    ((void (*)(void *))v171[2])(v171);
  }
  [(MFTiltedTabView *)self _statusBarHeight];
  v247.size.CGFloat height = v190;
  v247.origin.double y = -(v190 + v173 - *(double *)&qword_1006910B8);
  v247.size.double width = v178;
  v247.origin.double x = 0.0;
  CGRect v248 = CGRectInset(v247, -v178, 0.0);
  double v174 = v248.size.height;
  -[_TabGradientView setFrame:](self->_statusBarGradient, "setFrame:", v248.origin.x, v248.origin.y, v248.size.width);
  v175 = [(_TabGradientView *)self->_statusBarGradient gradientLayer];
  [v175 setStartPoint:0.5, 1.0 - *(double *)&qword_1006910B8 / v174];
  [v175 setEndPoint:0.5, 1.0];
  v176 = [(UIScrollView *)self->_scrollView layer];
  [v176 setSortsSublayers:v197 & 1];

  sub_1001F38AC((uint64_t)self);
}

- (void)scrollViewDidScroll:(id)a3
{
  if (!self->_suppressingScrollViewDidScroll)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained tiltedTabViewDidScroll:self];

    [(MFTiltedTabView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
}

- (MFTiltedTabViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFTiltedTabViewDelegate *)WeakRetained;
}

- (BOOL)reorderingEnabled
{
  return self->_reorderingEnabled;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (BOOL)isPresented
{
  return self->_presented;
}

- (unint64_t)rotationStyle
{
  return self->_rotationStyle;
}

- (void)setRotationStyle:(unint64_t)a3
{
  self->_rotationStyle = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_parallaxMotionEffectGroup, 0);
  objc_storeStrong((id *)&self->_closeButtonImage, 0);
  objc_storeStrong((id *)&self->_itemsCurrentlyClosing, 0);
  objc_storeStrong((id *)&self->_itemsInvolvedInAnimation, 0);
  objc_storeStrong((id *)&self->_reorderScrollDisplayLink, 0);
  objc_storeStrong((id *)&self->_interactivelyReorderingItem, 0);
  objc_storeStrong((id *)&self->_selectedItem, 0);
  objc_storeStrong((id *)&self->_pressRecognizer, 0);
  objc_storeStrong((id *)&self->_pressedItem, 0);
  objc_storeStrong((id *)&self->_onlyHorizontalVelocityItem, 0);
  objc_storeStrong((id *)&self->_interactivelyClosingItem, 0);
  objc_storeStrong((id *)&self->_statusBarGradient, 0);
  objc_storeStrong((id *)&self->_allTabItems, 0);
  objc_storeStrong((id *)&self->_visibleItems, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_tabSelectionRecognizer, 0);
  objc_storeStrong((id *)&self->_tabReorderRecognizer, 0);

  objc_storeStrong((id *)&self->_tabCloseRecognizer, 0);
}

@end