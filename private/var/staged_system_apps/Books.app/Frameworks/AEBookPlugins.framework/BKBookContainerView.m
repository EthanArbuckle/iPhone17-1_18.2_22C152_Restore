@interface BKBookContainerView
+ (Class)_textRangeViewClass;
- (BKBookContainerView)initWithCoder:(id)a3;
- (BKBookContainerView)initWithFrame:(CGRect)a3;
- (BKBookContainerViewDelegate)delegate;
- (BOOL)_shouldIgnoreNavigationTouch:(id)a3;
- (BOOL)_tapLocationIsInTextOverlapArea:(CGPoint)a3;
- (BOOL)_touchIsNoNoClassOrMediaElement:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)ignoreNextGesture;
- (BOOL)inManualCurl;
- (BOOL)internalGestureRecognizersSet;
- (BOOL)shouldHandleSwipeGesture:(id)a3;
- (BOOL)unhandledClickAtPoint:(CGPoint)a3;
- (CGPoint)_startLocationInViewWithGesture:(id)a3;
- (NSArray)gestureRecognizers;
- (int)_tapLocationForTouchLocation:(CGPoint)a3;
- (int64_t)spineLocation;
- (unint64_t)externalGestureRecognizerCount;
- (void)_commonInit;
- (void)_setupGestureRecognizers;
- (void)_setupManualCurlForIndirectRecognizerForTranslation:(CGPoint)a3;
- (void)_startedManualCurlAnimation:(id)a3 isRightSide:(BOOL)a4;
- (void)_turnPendingPagesAfterFinishing;
- (void)addGestureRecognizer:(id)a3;
- (void)cancelTapTimer:(id)a3;
- (void)dealloc;
- (void)killCurl;
- (void)layoutSubviews;
- (void)leftChapterGesture:(id)a3;
- (void)leftPageGesture:(id)a3;
- (void)manualCurlFinished:(id)a3;
- (void)manualCurlGesture:(id)a3;
- (void)removeGestureRecognizer:(id)a3;
- (void)rightChapterGesture:(id)a3;
- (void)rightPageGesture:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExternalGestureRecognizerCount:(unint64_t)a3;
- (void)setIgnoreNextGesture:(BOOL)a3;
- (void)setInternalGestureRecognizersSet:(BOOL)a3;
- (void)setSpineLocation:(int64_t)a3;
- (void)tapGesture:(id)a3;
@end

@implementation BKBookContainerView

- (void)_commonInit
{
  [(BKBookContainerView *)self _setupGestureRecognizers];
  [(BKBookContainerView *)self setExclusiveTouch:1];
  id v3 = +[NSUserDefaults standardUserDefaults];
  self->_usePageCurlAnimation = [v3 BOOLForKey:@"BKUseLegacyCurlAnimation"];
}

- (BKBookContainerView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BKBookContainerView;
  id v3 = -[BKBookContainerView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(BKBookContainerView *)v3 _commonInit];
  }
  return v4;
}

- (BKBookContainerView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BKBookContainerView;
  id v3 = [(BKBookContainerView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(BKBookContainerView *)v3 _commonInit];
  }
  return v4;
}

- (void)dealloc
{
  [(UITapGestureRecognizer *)self->_leftTapRecognizer setDelegate:0];
  [(UITapGestureRecognizer *)self->_leftTapRecognizer removeTarget:0 action:0];
  [(UITapGestureRecognizer *)self->_rightTapRecognizer setDelegate:0];
  [(UITapGestureRecognizer *)self->_rightTapRecognizer removeTarget:0 action:0];
  [(BKPanGestureRecognizer *)self->_manualCurlRecognizer setDelegate:0];
  [(BKPanGestureRecognizer *)self->_manualCurlRecognizer removeTarget:0 action:0];
  [(BKIndirectPanGestureRecognizer *)self->_indirectManualCurlRecognizer setDelegate:0];
  [(BKIndirectPanGestureRecognizer *)self->_indirectManualCurlRecognizer removeTarget:0 action:0];
  [(BKSwipeGestureRecognizer *)self->_previousPageSwipeRecognizer setDelegate:0];
  [(BKSwipeGestureRecognizer *)self->_previousPageSwipeRecognizer removeTarget:0 action:0];
  [(BKSwipeGestureRecognizer *)self->_nextPageSwipeRecognizer setDelegate:0];
  [(BKSwipeGestureRecognizer *)self->_nextPageSwipeRecognizer removeTarget:0 action:0];
  [(BKSwipeGestureRecognizer *)self->_previousChapterSwipeRecognizer setDelegate:0];
  [(BKSwipeGestureRecognizer *)self->_previousChapterSwipeRecognizer removeTarget:0 action:0];
  [(BKSwipeGestureRecognizer *)self->_nextChapterSwipeRecognizer setDelegate:0];
  [(BKSwipeGestureRecognizer *)self->_nextChapterSwipeRecognizer removeTarget:0 action:0];
  [(NSTimer *)self->_cancelLeftTapTimer invalidate];
  [(NSTimer *)self->_cancelRightTapTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BKBookContainerView;
  [(BKBookContainerView *)&v3 dealloc];
}

- (void)layoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)BKBookContainerView;
  [(BKBookContainerView *)&v2 layoutSubviews];
}

- (void)_setupGestureRecognizers
{
  if (!self->_leftTapRecognizer)
  {
    objc_super v3 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"tapGesture:"];
    leftTapRecognizer = self->_leftTapRecognizer;
    self->_leftTapRecognizer = v3;

    [(UITapGestureRecognizer *)self->_leftTapRecognizer setDelegate:self];
    [(UITapGestureRecognizer *)self->_leftTapRecognizer setCancelsTouchesInView:0];
    [(BKBookContainerView *)self addGestureRecognizer:self->_leftTapRecognizer];
  }
  if (!self->_rightTapRecognizer)
  {
    v5 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"tapGesture:"];
    rightTapRecognizer = self->_rightTapRecognizer;
    self->_rightTapRecognizer = v5;

    [(UITapGestureRecognizer *)self->_rightTapRecognizer setDelegate:self];
    [(UITapGestureRecognizer *)self->_rightTapRecognizer setCancelsTouchesInView:0];
    [(BKBookContainerView *)self addGestureRecognizer:self->_rightTapRecognizer];
  }
  if (!self->_indirectManualCurlRecognizer)
  {
    v7 = [[BKIndirectPanGestureRecognizer alloc] initWithTarget:self action:"manualCurlGesture:"];
    indirectManualCurlRecognizer = self->_indirectManualCurlRecognizer;
    self->_indirectManualCurlRecognizer = v7;

    [(BKIndirectPanGestureRecognizer *)self->_indirectManualCurlRecognizer setAllowedTouchTypes:&off_1E9628];
    [(BKIndirectPanGestureRecognizer *)self->_indirectManualCurlRecognizer setAllowedScrollTypesMask:3];
    [(BKIndirectPanGestureRecognizer *)self->_indirectManualCurlRecognizer setDelegate:self];
    [(BKIndirectPanGestureRecognizer *)self->_indirectManualCurlRecognizer setCancelsTouchesInView:0];
    [(BKBookContainerView *)self addGestureRecognizer:self->_indirectManualCurlRecognizer];
  }
  if (!self->_manualCurlRecognizer)
  {
    v9 = [[BKPanGestureRecognizer alloc] initWithTarget:self action:"manualCurlGesture:"];
    manualCurlRecognizer = self->_manualCurlRecognizer;
    self->_manualCurlRecognizer = v9;

    [(BKPanGestureRecognizer *)self->_manualCurlRecognizer setAllowedTouchTypes:&off_1E9640];
    [(BKPanGestureRecognizer *)self->_manualCurlRecognizer setDelegate:self];
    [(BKPanGestureRecognizer *)self->_manualCurlRecognizer setCancelsTouchesInView:0];
    [(BKPanGestureRecognizer *)self->_manualCurlRecognizer setAllowedScrollTypesMask:3];
    [(BKPanGestureRecognizer *)self->_manualCurlRecognizer requireGestureRecognizerToFail:self->_indirectManualCurlRecognizer];
    [(BKBookContainerView *)self addGestureRecognizer:self->_manualCurlRecognizer];
  }
  if (!self->_previousPageSwipeRecognizer)
  {
    v11 = (BKSwipeGestureRecognizer *)[objc_alloc((Class)BKSwipeGestureRecognizer) initWithTarget:self action:"leftPageGesture:"];
    previousPageSwipeRecognizer = self->_previousPageSwipeRecognizer;
    self->_previousPageSwipeRecognizer = v11;

    [(BKSwipeGestureRecognizer *)self->_previousPageSwipeRecognizer setAllowedTouchTypes:&off_1E9658];
    [(BKSwipeGestureRecognizer *)self->_previousPageSwipeRecognizer setDelegate:self];
    [(BKSwipeGestureRecognizer *)self->_previousPageSwipeRecognizer setDirection:1];
    [(BKSwipeGestureRecognizer *)self->_previousPageSwipeRecognizer setCancelsTouchesInView:0];
    [(BKSwipeGestureRecognizer *)self->_previousPageSwipeRecognizer setNumberOfTouchesRequired:1];
    [(BKBookContainerView *)self addGestureRecognizer:self->_previousPageSwipeRecognizer];
  }
  if (!self->_nextPageSwipeRecognizer)
  {
    v13 = (BKSwipeGestureRecognizer *)[objc_alloc((Class)BKSwipeGestureRecognizer) initWithTarget:self action:"rightPageGesture:"];
    nextPageSwipeRecognizer = self->_nextPageSwipeRecognizer;
    self->_nextPageSwipeRecognizer = v13;

    [(BKSwipeGestureRecognizer *)self->_nextPageSwipeRecognizer setAllowedTouchTypes:&off_1E9670];
    [(BKSwipeGestureRecognizer *)self->_nextPageSwipeRecognizer setDelegate:self];
    [(BKSwipeGestureRecognizer *)self->_nextPageSwipeRecognizer setDirection:2];
    [(BKSwipeGestureRecognizer *)self->_nextPageSwipeRecognizer setCancelsTouchesInView:0];
    [(BKSwipeGestureRecognizer *)self->_nextPageSwipeRecognizer setNumberOfTouchesRequired:1];
    [(BKBookContainerView *)self addGestureRecognizer:self->_nextPageSwipeRecognizer];
  }
  if (!self->_previousChapterSwipeRecognizer)
  {
    v15 = (BKSwipeGestureRecognizer *)[objc_alloc((Class)BKSwipeGestureRecognizer) initWithTarget:self action:"leftChapterGesture:"];
    previousChapterSwipeRecognizer = self->_previousChapterSwipeRecognizer;
    self->_previousChapterSwipeRecognizer = v15;

    [(BKSwipeGestureRecognizer *)self->_previousChapterSwipeRecognizer setAllowedTouchTypes:&off_1E9688];
    [(BKSwipeGestureRecognizer *)self->_previousChapterSwipeRecognizer setDelegate:self];
    [(BKSwipeGestureRecognizer *)self->_previousChapterSwipeRecognizer setDirection:1];
    [(BKSwipeGestureRecognizer *)self->_previousChapterSwipeRecognizer setCancelsTouchesInView:0];
    [(BKSwipeGestureRecognizer *)self->_previousChapterSwipeRecognizer setNumberOfTouchesRequired:3];
    [(BKBookContainerView *)self addGestureRecognizer:self->_previousChapterSwipeRecognizer];
  }
  if (!self->_nextChapterSwipeRecognizer)
  {
    v17 = (BKSwipeGestureRecognizer *)[objc_alloc((Class)BKSwipeGestureRecognizer) initWithTarget:self action:"rightChapterGesture:"];
    nextChapterSwipeRecognizer = self->_nextChapterSwipeRecognizer;
    self->_nextChapterSwipeRecognizer = v17;

    [(BKSwipeGestureRecognizer *)self->_nextChapterSwipeRecognizer setAllowedTouchTypes:&off_1E96A0];
    [(BKSwipeGestureRecognizer *)self->_nextChapterSwipeRecognizer setDelegate:self];
    [(BKSwipeGestureRecognizer *)self->_nextChapterSwipeRecognizer setDirection:2];
    [(BKSwipeGestureRecognizer *)self->_nextChapterSwipeRecognizer setCancelsTouchesInView:0];
    [(BKSwipeGestureRecognizer *)self->_nextChapterSwipeRecognizer setNumberOfTouchesRequired:3];
    [(BKBookContainerView *)self addGestureRecognizer:self->_nextChapterSwipeRecognizer];
  }

  [(BKBookContainerView *)self setInternalGestureRecognizersSet:1];
}

- (void)manualCurlFinished:(id)a3
{
  id v4 = a3;
  v5 = _AESwipeLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Finished manual curl: %@", (uint8_t *)&v7, 0xCu);
  }

  self->_finishingManualCurl = 0;
  self->_trackingManualCurl = 0;
  id manualCurl = self->_manualCurl;
  self->_id manualCurl = 0;

  [(BKBookContainerView *)self _turnPendingPagesAfterFinishing];
}

- (void)_turnPendingPagesAfterFinishing
{
  int64_t pagesToTurnAfterFinishing = self->_pagesToTurnAfterFinishing;
  if (pagesToTurnAfterFinishing)
  {
    int64_t v4 = 0;
    if (pagesToTurnAfterFinishing < 0)
    {
      do
      {
        int v7 = _AESwipeLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Swiping Direction Reverse after delay", buf, 2u);
        }

        id v8 = [(BKBookContainerView *)self delegate];
        [v8 bookContainerView:self turnPages:1];

        --v4;
      }
      while (self->_pagesToTurnAfterFinishing < v4);
    }
    else
    {
      do
      {
        v5 = _AESwipeLog();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v9 = 0;
          _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Swiping Direction Forward after delay", v9, 2u);
        }

        objc_super v6 = [(BKBookContainerView *)self delegate];
        [v6 bookContainerView:self turnPages:0];

        ++v4;
      }
      while (self->_pagesToTurnAfterFinishing > v4);
    }
    self->_int64_t pagesToTurnAfterFinishing = 0;
  }
}

- (void)setSpineLocation:(int64_t)a3
{
  self->_spineLocation = a3;
  if (a3 == 2)
  {
    p_manualCurlRecognizer = &self->_manualCurlRecognizer;
    double v5 = 20.0;
    [(BKPanGestureRecognizer *)self->_manualCurlRecognizer setLeftSideMovementThreshold:20.0];
  }
  else
  {
    double v5 = 100.0;
    if (a3 == 3) {
      double v6 = 20.0;
    }
    else {
      double v6 = 100.0;
    }
    p_manualCurlRecognizer = &self->_manualCurlRecognizer;
    [(BKPanGestureRecognizer *)self->_manualCurlRecognizer setLeftSideMovementThreshold:v6];
    if (self->_spineLocation != 3) {
      double v5 = 20.0;
    }
  }
  int v7 = *p_manualCurlRecognizer;

  [(BKPanGestureRecognizer *)v7 setRightSideMovementThreshold:v5];
}

- (BOOL)inManualCurl
{
  return self->_manualCurl != 0;
}

- (BOOL)unhandledClickAtPoint:(CGPoint)a3
{
  unsigned int v4 = -[BKBookContainerView _tapLocationForTouchLocation:](self, "_tapLocationForTouchLocation:", a3.x, a3.y);
  switch(v4)
  {
    case 3u:
      goto LABEL_7;
    case 2u:
      v11 = [(BKBookContainerView *)self delegate];
      unsigned int v12 = [v11 bookContainerViewShouldTurnPage:self];

      if (!v12) {
        return 0;
      }
LABEL_7:
      int v7 = [(BKBookContainerView *)self delegate];
      id v8 = v7;
      v9 = self;
      uint64_t v10 = 0;
      goto LABEL_8;
    case 1u:
      double v5 = [(BKBookContainerView *)self delegate];
      unsigned int v6 = [v5 bookContainerViewShouldTurnPage:self];

      if (v6)
      {
        int v7 = [(BKBookContainerView *)self delegate];
        id v8 = v7;
        v9 = self;
        uint64_t v10 = 1;
LABEL_8:
        [v7 bookContainerView:v9 tapToTurnPages:v10];

        return 1;
      }
      break;
  }
  return 0;
}

- (void)killCurl
{
  if (self->_manualCurl)
  {
    objc_super v3 = _AESwipeLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id manualCurl = self->_manualCurl;
      int v6 = 138412290;
      id v7 = manualCurl;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Killing curl: %@", (uint8_t *)&v6, 0xCu);
    }

    self->_trackingManualCurl = 0;
    double v5 = [(BKBookContainerView *)self delegate];
    [v5 bookContainerView:self cancelManualCurl:self->_manualCurl];

    [(BKPanGestureRecognizer *)self->_manualCurlRecognizer cancelRecognizing];
    [(BKIndirectPanGestureRecognizer *)self->_indirectManualCurlRecognizer setState:4];
  }
}

- (int)_tapLocationForTouchLocation:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(BKBookContainerView *)self bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  if (isPad())
  {
    int v14 = isPortrait();
    double v15 = 70.0;
    if (!v14) {
      double v15 = 30.0;
    }
    uint64_t v31 = *(void *)&v15;
  }
  else
  {
    uint64_t v31 = 0x4054000000000000;
  }
  if (isPad())
  {
    int v16 = isPortrait();
    double v17 = 50.0;
    if (v16) {
      double v17 = 70.0;
    }
  }
  else
  {
    [(BKBookContainerView *)self safeAreaInsets];
    double v17 = v18 + 44.0;
  }
  double v34 = v17;
  double v35 = y;
  CGFloat v19 = v9;
  double v20 = x;
  if (isPad())
  {
    int v21 = isPortrait();
    double v22 = 82.0;
    if (v21) {
      double v22 = 110.0;
    }
    double v33 = v22;
  }
  else
  {
    double v33 = 80.0;
  }
  v23 = [(BKBookContainerView *)self delegate];
  [v23 bookmarkHotspotDimensionForBookContainerView:self];
  double v25 = v24;

  v37.origin.CGFloat x = v7;
  v37.origin.CGFloat y = v9;
  v37.size.width = v11;
  v37.size.height = v13;
  CGFloat v26 = v7;
  CGFloat v27 = CGRectGetMaxX(v37) - v25;
  v38.origin.CGFloat x = v26;
  v38.origin.CGFloat y = v19;
  v38.size.width = v11;
  v38.size.height = v13;
  double MinY = CGRectGetMinY(v38);
  [(BKBookContainerView *)self safeAreaInsets];
  v39.origin.CGFloat y = MinY + v29;
  v39.origin.CGFloat x = v27;
  v39.size.width = v25;
  v39.size.height = v25;
  v36.CGFloat x = v20;
  v36.CGFloat y = v35;
  if (CGRectContainsPoint(v39, v36)) {
    return 3;
  }
  v40.origin.CGFloat x = v26;
  v40.origin.CGFloat y = v19;
  v40.size.width = v11;
  v40.size.height = v13;
  if (v35 < v34 + CGRectGetMinY(v40))
  {
    v41.origin.CGFloat x = v26;
    v41.origin.CGFloat y = v19;
    v41.size.width = v11;
    v41.size.height = v13;
    if (v20 < CGRectGetMaxX(v41) - v32)
    {
      v42.origin.CGFloat x = v26;
      v42.origin.CGFloat y = v19;
      v42.size.width = v11;
      v42.size.height = v13;
      if (v20 > v32 + CGRectGetMinX(v42)) {
        return 0;
      }
    }
  }
  v43.origin.CGFloat x = v26;
  v43.origin.CGFloat y = v19;
  v43.size.width = v11;
  v43.size.height = v13;
  if (v20 > CGRectGetMaxX(v43) - v33) {
    return 2;
  }
  v44.origin.CGFloat x = v26;
  v44.origin.CGFloat y = v19;
  v44.size.width = v11;
  v44.size.height = v13;
  return v20 < v33 + CGRectGetMinX(v44);
}

- (BOOL)_tapLocationIsInTextOverlapArea:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ((isPad() & 1) != 0
    || -[BKBookContainerView _tapLocationForTouchLocation:](self, "_tapLocationForTouchLocation:", x, y)
     - 4 < 0xFFFFFFFD)
  {
    return 0;
  }
  CGFloat v7 = [(BKBookContainerView *)self delegate];
  [v7 pageContentBoundsForBookContainerView:self];
  v9.double x = x;
  v9.double y = y;
  BOOL v8 = CGRectContainsPoint(v10, v9);

  return v8;
}

- (void)tapGesture:(id)a3
{
  unsigned int v4 = (UITapGestureRecognizer *)a3;
  if (v4 && !self->_manualCurl)
  {
    if (!self->_cancelLeftTap && self->_leftTapRecognizer == v4)
    {
      CGPoint v9 = v4;
      [(UITapGestureRecognizer *)v4 locationInView:self];
      unsigned __int8 v5 = -[BKBookContainerView unhandledClickAtPoint:](self, "unhandledClickAtPoint:");
      [(NSTimer *)self->_cancelLeftTapTimer invalidate];
      cancelLeftTapTimer = self->_cancelLeftTapTimer;
      self->_cancelLeftTapTimer = 0;

      unsigned int v4 = v9;
    }
    else
    {
      unsigned __int8 v5 = 0;
    }
    if (!self->_cancelRightTap && self->_rightTapRecognizer == v4)
    {
      BOOL v8 = v4;
      if ((v5 & 1) == 0)
      {
        [(UITapGestureRecognizer *)v4 locationInView:self];
        -[BKBookContainerView unhandledClickAtPoint:](self, "unhandledClickAtPoint:");
      }
      [(NSTimer *)self->_cancelRightTapTimer invalidate];
      cancelRightTapTimer = self->_cancelRightTapTimer;
      self->_cancelRightTapTimer = 0;

      unsigned int v4 = v8;
    }
  }
}

- (CGPoint)_startLocationInViewWithGesture:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 startLocationInView:self];
  }
  else {
    [v4 locationInView:self];
  }
  double v7 = v5;
  double v8 = v6;

  double v9 = v7;
  double v10 = v8;
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (void)_startedManualCurlAnimation:(id)a3 isRightSide:(BOOL)a4
{
  p_id manualCurl = &self->_manualCurl;
  objc_storeStrong(&self->_manualCurl, a3);
  self->_manualCurlIsRightSide = a4;
  if (*p_manualCurl && self->_swipeBeforeManualCurl)
  {
    double v7 = _AESwipeLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v8 = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "started so not swiping", v8, 2u);
    }

    self->_swipeBeforeManualCurl = 0;
  }
}

- (void)manualCurlGesture:(id)a3
{
  id v4 = (BKIndirectPanGestureRecognizer *)a3;
  if ([(BKBookContainerView *)self ignoreNextGesture])
  {
    double v5 = _AESwipeLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Ignoring gesture for manual curl", buf, 2u);
    }
LABEL_4:

    goto LABEL_5;
  }
  if ([(BKIndirectPanGestureRecognizer *)v4 state] != (char *)&dword_0 + 1)
  {
    if ([(BKIndirectPanGestureRecognizer *)v4 state] == (char *)&dword_0 + 2)
    {
      if (self->_finishingManualCurl || !self->_manualCurl && self->_indirectManualCurlRecognizer != v4) {
        goto LABEL_5;
      }
      [(BKIndirectPanGestureRecognizer *)v4 locationInView:self];
      double v12 = v11;
      double v14 = v13;
      if (self->_indirectManualCurlRecognizer == v4)
      {
        [(BKIndirectPanGestureRecognizer *)v4 translationInView:self];
        double v56 = v55;
        double v58 = v57;
        [(BKBookContainerView *)self bounds];
        float v59 = CGRectGetWidth(v111) * 0.05;
        if (fabs(v56) < fmaxf(fminf(v59, 10.0), 3.0))
        {
          v60 = _AESwipeLog();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            *(double *)v101 = v12;
            *(double *)&v101[1] = v14;
            v61 = +[NSValue valueWithBytes:v101 objCType:"{CGPoint=dd}"];
            *(double *)v100 = v56;
            *(double *)&v100[1] = v58;
            v62 = +[NSValue valueWithBytes:v100 objCType:"{CGPoint=dd}"];
            *(_DWORD *)buf = 138412546;
            *(void *)v107 = v61;
            *(_WORD *)&v107[8] = 2112;
            v108 = v62;
            _os_log_impl(&dword_0, v60, OS_LOG_TYPE_DEFAULT, "indirect translation/location was insufficient to update curl location:%@ translation:%@", buf, 0x16u);
          }
          goto LABEL_5;
        }
        if (!self->_manualCurl) {
          -[BKBookContainerView _setupManualCurlForIndirectRecognizerForTranslation:](self, "_setupManualCurlForIndirectRecognizerForTranslation:", v56, v58);
        }
        if (self->_manualCurlIsRightSide)
        {
          [(BKBookContainerView *)self bounds];
          double v69 = v68;
        }
        else
        {
          double v69 = 0.0;
        }
        [(BKBookContainerView *)self bounds];
        if (self->_manualCurlIsRightSide && v56 > 0.0)
        {
          double v5 = _AESwipeLog();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Swiping left, capping right translation", buf, 2u);
          }
          goto LABEL_4;
        }
        if (!self->_manualCurlIsRightSide && v56 < 0.0)
        {
          double v5 = _AESwipeLog();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Swiping right, capping left translation", buf, 2u);
          }
          goto LABEL_4;
        }
        double v12 = v56 + v69;
        double v14 = v58 + v74 * 0.5;
      }
      double v15 = _AESwipeLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v109.double x = v12;
        v109.double y = v14;
        int v16 = NSStringFromCGPoint(v109);
        *(_DWORD *)buf = 138412290;
        *(void *)v107 = v16;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Update toLocation:%@", buf, 0xCu);
      }
      kdebug_trace();
      double v17 = [(BKBookContainerView *)self delegate];
      [v17 bookContainerView:self updateManualCurl:self->_manualCurl toLocation:v12 v14];

      goto LABEL_5;
    }
    if ([(BKIndirectPanGestureRecognizer *)v4 state] != (char *)&dword_0 + 3
      && [(BKIndirectPanGestureRecognizer *)v4 state] != &dword_4
      && [(BKIndirectPanGestureRecognizer *)v4 state] != (char *)&dword_4 + 1)
    {
      goto LABEL_5;
    }
    double v18 = _AESwipeLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v19 = self->_manualCurl != 0;
      BOOL trackingManualCurl = self->_trackingManualCurl;
      BOOL swipeBeforeManualCurl = self->_swipeBeforeManualCurl;
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v107 = v19;
      *(_WORD *)&v107[4] = 1024;
      *(_DWORD *)&v107[6] = trackingManualCurl;
      LOWORD(v108) = 1024;
      *(_DWORD *)((char *)&v108 + 2) = swipeBeforeManualCurl;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Ended curl gesture.  Have manual Curl? %d. tracking? %d. _swipeBeforeManual? %d", buf, 0x14u);
    }

    if (self->_swipeBeforeManualCurl)
    {
      double v22 = _AESwipeLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "swiping before curl", buf, 2u);
      }

      self->_BOOL swipeBeforeManualCurl = 0;
      self->_BOOL trackingManualCurl = 0;
      if ([(BKIndirectPanGestureRecognizer *)v4 state] == (char *)&dword_0 + 3)
      {
        BOOL v23 = !self->_chapterTurn;
        double v24 = [(BKBookContainerView *)self delegate];
        double v25 = v24;
        int64_t swipeDirection = self->_swipeDirection;
        if (v23) {
          [v24 bookContainerView:self turnPages:swipeDirection];
        }
        else {
          [v24 bookContainerView:self turnChapter:swipeDirection];
        }
      }
      goto LABEL_5;
    }
    if (self->_startedWhilePreviousFinishing)
    {
      double v34 = _AESwipeLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v34, OS_LOG_TYPE_DEFAULT, "Started another curl while previous was finishing", buf, 2u);
      }

      self->_startedWhilePreviousFinishing = 0;
      unsigned int v35 = -[BKBookContainerView _tapLocationForTouchLocation:](self, "_tapLocationForTouchLocation:", self->_startPoint.x, self->_startPoint.y);
      if (v35 == 1) {
        uint64_t v36 = -1;
      }
      else {
        uint64_t v36 = 0;
      }
      if (v35 == 2) {
        uint64_t v36 = 1;
      }
      self->_pagesToTurnAfterFinishing += v36;
      if (!self->_finishingManualCurl)
      {
        CGRect v37 = _AESwipeLog();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v37, OS_LOG_TYPE_DEFAULT, "finished curl before ending previous curl", buf, 2u);
        }

        if (self->_pagesToTurnAfterFinishing)
        {
          [(BKBookContainerView *)self _turnPendingPagesAfterFinishing];
        }
        else
        {
          v73 = [(BKBookContainerView *)self delegate];
          [v73 bookContainerView:self cancelManualCurl:self->_manualCurl];
        }
      }
      goto LABEL_5;
    }
    id manualCurl = self->_manualCurl;
    if (!self->_trackingManualCurl)
    {
      if (!manualCurl) {
        goto LABEL_5;
      }
      v70 = _AESwipeLog();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v70, OS_LOG_TYPE_ERROR, "Not tracking but we have a manual curl, cancelling", buf, 2u);
      }
      goto LABEL_95;
    }
    if (!manualCurl)
    {
      v72 = _AESwipeLog();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v72, OS_LOG_TYPE_ERROR, "Tracking a manual curl but no manual curl created when gesture recognizer hit an ending state. No longer tracking manual curl", buf, 2u);
      }

      self->_BOOL trackingManualCurl = 0;
      goto LABEL_5;
    }
    if ((BKIndirectPanGestureRecognizer *)self->_manualCurlRecognizer == v4)
    {
      [(BKIndirectPanGestureRecognizer *)v4 locationInView:self];
      double v76 = v75;
      double v78 = v77;
      unsigned int v79 = -[BKBookContainerView _tapLocationForTouchLocation:](self, "_tapLocationForTouchLocation:", self->_startPoint.x, self->_startPoint.y);
      [(BKBookContainerView *)self bounds];
      BOOL v81 = v79 == 2 && v80 * 0.5 > v76;
      [(BKBookContainerView *)self bounds];
      BOOL v83 = v79 == 1 && v82 * 0.5 < v76;
      -[BKIndirectPanGestureRecognizer velocityInView:](v4, "velocityInView:", self, v82 * 0.5);
      double v86 = v85;
      BOOL v87 = v84 > 300.0 && v79 == 1;
      BOOL v88 = v84 < -300.0 && v79 == 2;
      if (v87 || v88 || v83 || v81)
      {
        BOOL v54 = 1;
        goto LABEL_145;
      }
      unsigned int v91 = -[BKBookContainerView _tapLocationForTouchLocation:](self, "_tapLocationForTouchLocation:", v76, v78);
      if (v91)
      {
        BOOL v54 = v86 > 300.0 && v91 == v79;
        goto LABEL_145;
      }
    }
    else if (self->_indirectManualCurlRecognizer == v4)
    {
      [(BKIndirectPanGestureRecognizer *)v4 velocityInView:self];
      BOOL v90 = v89 > 300.0 && !self->_manualCurlIsRightSide || v89 < -300.0 && self->_manualCurlIsRightSide;
      [(BKIndirectPanGestureRecognizer *)v4 translationInView:self];
      double v94 = v93;
      [(BKBookContainerView *)self bounds];
      double v95 = CGRectGetWidth(v112) * 0.4;
      if (v94 > v95 && !self->_manualCurlIsRightSide || v94 < -v95 && self->_manualCurlIsRightSide) {
        BOOL v90 = 1;
      }
      BOOL v54 = v90;
      goto LABEL_145;
    }
    BOOL v54 = 0;
LABEL_145:
    self->_finishingManualCurl = 1;
    BOOL v96 = [(BKIndirectPanGestureRecognizer *)v4 state] == (char *)&dword_0 + 3 && v54;
    v70 = _AESwipeLog();
    BOOL v97 = os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT);
    if (v96)
    {
      if (v97)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v70, OS_LOG_TYPE_DEFAULT, "finishing manual curl gesture", buf, 2u);
      }

      v98 = [(BKBookContainerView *)self delegate];
      [v98 bookContainerView:self finishManualCurl:self->_manualCurl];

      goto LABEL_5;
    }
    if (v97)
    {
      v99 = +[NSNumber numberWithBool:v54];
      *(_DWORD *)buf = 138412290;
      *(void *)v107 = v99;
      _os_log_impl(&dword_0, v70, OS_LOG_TYPE_DEFAULT, "Cancelling manual curl. Valid location? %@", buf, 0xCu);
    }
LABEL_95:

    v71 = [(BKBookContainerView *)self delegate];
    [v71 bookContainerView:self cancelManualCurl:self->_manualCurl];

    goto LABEL_5;
  }
  double v6 = [(BKBookContainerView *)self delegate];
  unsigned int v7 = [v6 bookContainerViewShouldBeginManualCurl:self];

  if (v7)
  {
    if (self->_finishingManualCurl)
    {
      self->_startedWhilePreviousFinishing = 1;
      double v8 = _AESwipeLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "began while previous finishing", buf, 2u);
      }

      [(BKBookContainerView *)self _startLocationInViewWithGesture:v4];
      self->_lastPoint.double x = v9;
      self->_lastPoint.double y = v10;
      self->_startPoint = self->_lastPoint;
      goto LABEL_59;
    }
    p_startPoint = &self->_startPoint;
    [(BKBookContainerView *)self _startLocationInViewWithGesture:v4];
    self->_lastPoint.double x = v28;
    self->_lastPoint.double y = v29;
    self->_startPoint = self->_lastPoint;
    v30 = _AESwipeLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v110.double x = p_startPoint->x;
      v110.double y = self->_startPoint.y;
      uint64_t v31 = NSStringFromCGPoint(v110);
      *(_DWORD *)buf = 138412290;
      *(void *)v107 = v31;
      _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "curl began with start %@", buf, 0xCu);
    }
    unsigned int v32 = -[BKBookContainerView _tapLocationForTouchLocation:](self, "_tapLocationForTouchLocation:", p_startPoint->x, self->_startPoint.y);
    if (self->_indirectManualCurlRecognizer == v4)
    {
      p_BOOL trackingManualCurl = &self->_trackingManualCurl;
      self->_BOOL trackingManualCurl = 1;
    }
    else
    {
      p_BOOL trackingManualCurl = &self->_trackingManualCurl;
      self->_BOOL trackingManualCurl = v32 - 1 < 2;
      if (v32 - 1 > 1) {
        goto LABEL_53;
      }
    }
    CGRect v38 = +[AETestDriver shared];
    [v38 postEvent:kBETestDriverPageTurnStart sender:self];

    CGRect v39 = +[AETestDriver shared];
    [v39 postEvent:kBETestDriverPageTurnSetupStart sender:self];

LABEL_53:
    CGRect v40 = _AESwipeLog();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      if (*p_trackingManualCurl) {
        CFStringRef v41 = &stru_1DF0D8;
      }
      else {
        CFStringRef v41 = @" but not tracking";
      }
      *(_DWORD *)buf = 138412290;
      *(void *)v107 = v41;
      _os_log_impl(&dword_0, v40, OS_LOG_TYPE_DEFAULT, "began new manual curl%@", buf, 0xCu);
    }
  }
LABEL_59:
  if (!self->_trackingManualCurl) {
    goto LABEL_5;
  }
  [(BKIndirectPanGestureRecognizer *)v4 translationInView:self];
  double v44 = v42;
  double v45 = v43;
  p_lastPoint = &self->_lastPoint;
  if (v42 == self->_lastPoint.x && v43 == self->_lastPoint.y)
  {
    double v5 = _AESwipeLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v52 = NSStringFromCGPoint(*p_lastPoint);
      *(_DWORD *)buf = 138412290;
      *(void *)v107 = v52;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Tracking manual curl - translation was the same as _lastPoint - %@", buf, 0xCu);
    }
    goto LABEL_4;
  }
  p_lastPoint->double x = v42;
  self->_lastPoint.double y = v43;
  if (!self->_manualCurl && self->_indirectManualCurlRecognizer != v4)
  {
    unsigned int v48 = -[BKBookContainerView _tapLocationForTouchLocation:](self, "_tapLocationForTouchLocation:", self->_startPoint.x, self->_startPoint.y);
    double x = self->_startPoint.x;
    double y = self->_startPoint.y;
    if (v48 == 2)
    {
      [(BKBookContainerView *)self bounds];
      double v63 = v51 - x + 20.0;
    }
    else
    {
      double v63 = -(x + 20.0);
    }
    v64 = _AESwipeLog();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      if (v48 == 2) {
        CFStringRef v65 = @"Right";
      }
      else {
        CFStringRef v65 = @"Left";
      }
      *(double *)v105 = v44;
      *(double *)&v105[1] = v45;
      v66 = +[NSValue valueWithBytes:v105 objCType:"{CGPoint=dd}"];
      *(_DWORD *)buf = 138412546;
      *(void *)v107 = v65;
      *(_WORD *)&v107[8] = 2112;
      v108 = v66;
      _os_log_impl(&dword_0, v64, OS_LOG_TYPE_DEFAULT, "started on %@, with translation:%@", buf, 0x16u);
    }
    kdebug_trace();
    objc_initWeak((id *)buf, self);
    v67 = [(BKBookContainerView *)self delegate];
    v102[0] = _NSConcreteStackBlock;
    v102[1] = 3221225472;
    v102[2] = sub_3657C;
    v102[3] = &unk_1DB728;
    objc_copyWeak(&v103, (id *)buf);
    BOOL v104 = v48 == 2;
    [v67 bookContainerView:self beginManualCurl:v48 == 2 atLocation:v102 completion:x + v63, y];

    objc_destroyWeak(&v103);
    objc_destroyWeak((id *)buf);
  }
LABEL_5:
}

- (void)_setupManualCurlForIndirectRecognizerForTranslation:(CGPoint)a3
{
  if (!self->_manualCurl)
  {
    double x = a3.x;
    BOOL v5 = a3.x < 0.0;
    double v6 = 0.0;
    if (a3.x < 0.0)
    {
      [(BKBookContainerView *)self bounds];
      double v6 = v7;
    }
    [(BKBookContainerView *)self bounds];
    double v9 = v8;
    if (self->_usePageCurlAnimation)
    {
      if (x >= 0.0)
      {
        double v11 = -(v6 + 20.0);
      }
      else
      {
        [(BKBookContainerView *)self bounds];
        double v11 = v10 - v6 + 20.0;
      }
      double v6 = v6 + v11;
    }
    double v12 = _AESwipeLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v13 = @"Left";
      if (x < 0.0) {
        CFStringRef v13 = @"Right";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v19 = v13;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Indirect started on %@", buf, 0xCu);
    }

    kdebug_trace();
    objc_initWeak((id *)buf, self);
    double v14 = [(BKBookContainerView *)self delegate];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_3684C;
    v15[3] = &unk_1DB728;
    objc_copyWeak(&v16, (id *)buf);
    BOOL v17 = v5;
    [v14 bookContainerView:self beginManualCurl:x < 0.0 atLocation:v15 completion:v9 * 0.5];

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
}

- (void)leftPageGesture:(id)a3
{
  if ([(BKBookContainerView *)self shouldHandleSwipeGesture:a3])
  {
    id v4 = _AESwipeLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "swiping page reverse", v6, 2u);
    }

    BOOL v5 = [(BKBookContainerView *)self delegate];
    [v5 bookContainerView:self turnPages:1];
  }
}

- (void)rightPageGesture:(id)a3
{
  if ([(BKBookContainerView *)self shouldHandleSwipeGesture:a3])
  {
    id v4 = _AESwipeLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "swiping page forward", v6, 2u);
    }

    BOOL v5 = [(BKBookContainerView *)self delegate];
    [v5 bookContainerView:self turnPages:0];
  }
}

- (void)leftChapterGesture:(id)a3
{
  if ([(BKBookContainerView *)self shouldHandleSwipeGesture:a3])
  {
    id v4 = _AESwipeLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "swiping chapter reverse", v6, 2u);
    }

    BOOL v5 = [(BKBookContainerView *)self delegate];
    [v5 bookContainerView:self turnChapter:1];
  }
}

- (void)rightChapterGesture:(id)a3
{
  if ([(BKBookContainerView *)self shouldHandleSwipeGesture:a3])
  {
    id v4 = _AESwipeLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "swiping chapter forward", v6, 2u);
    }

    BOOL v5 = [(BKBookContainerView *)self delegate];
    [v5 bookContainerView:self turnChapter:0];
  }
}

+ (Class)_textRangeViewClass
{
  if (qword_22B528 != -1) {
    dispatch_once(&qword_22B528, &stru_1DB748);
  }
  objc_super v2 = (void *)qword_22B520;

  return (Class)v2;
}

- (BOOL)_touchIsNoNoClassOrMediaElement:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 view];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (+[BKBookContainerView _textRangeViewClass],
        (objc_opt_isKindOfClass() & 1) != 0))
  {
    unsigned __int8 v6 = 1;
  }
  else
  {
    double v8 = [(BKBookContainerView *)self delegate];
    unsigned __int8 v6 = [v8 bookContainerView:self hasMediaElementUnderTouch:v4];
  }
  return v6;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  unsigned __int8 v6 = (BKIndirectPanGestureRecognizer *)a3;
  id v7 = a4;
  double v8 = [(BKBookContainerView *)self delegate];
  unsigned int v9 = [v8 isShowingContent];

  if (!v9
    || [(BKBookContainerView *)self externalGestureRecognizerCount]
    || [(BKBookContainerView *)self _shouldIgnoreNavigationTouch:v7]
    || self->_indirectManualCurlRecognizer == v6
    && [(BKBookContainerView *)self _touchIsNoNoClassOrMediaElement:v7])
  {
    goto LABEL_32;
  }
  if ((BKIndirectPanGestureRecognizer *)self->_leftTapRecognizer != v6
    && (BKIndirectPanGestureRecognizer *)self->_rightTapRecognizer != v6
    && (BKIndirectPanGestureRecognizer *)self->_manualCurlRecognizer != v6)
  {
    goto LABEL_9;
  }
  [v7 locationInView:self];
  unsigned int v11 = -[BKBookContainerView _tapLocationForTouchLocation:](self, "_tapLocationForTouchLocation:");
  double v12 = [v7 view];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

LABEL_32:
    LOBYTE(v10) = 0;
    goto LABEL_33;
  }
  CFStringRef v13 = [v7 view];
  double v14 = [v13 superview];
  double v15 = [v14 superview];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    goto LABEL_32;
  }
  if (!v11)
  {
    CFStringRef v19 = _AESwipeLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      double v20 = (objc_class *)objc_opt_class();
      int v21 = NSStringFromClass(v20);
      int v26 = 138412290;
      CGFloat v27 = v21;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Location for (%@) began in 'center'. Blocking touch events to gesture", (uint8_t *)&v26, 0xCu);
    }
    goto LABEL_32;
  }
  if ((BKIndirectPanGestureRecognizer *)self->_leftTapRecognizer == v6 && v11 == 1)
  {
    BOOL v17 = &OBJC_IVAR___BKBookContainerView__cancelLeftTap;
    double v18 = &OBJC_IVAR___BKBookContainerView__cancelLeftTapTimer;
  }
  else
  {
    if ((BKIndirectPanGestureRecognizer *)self->_rightTapRecognizer != v6 || v11 != 2)
    {
      if ((BKIndirectPanGestureRecognizer *)self->_manualCurlRecognizer == v6)
      {
        unsigned int v10 = ![(BKBookContainerView *)self _touchIsNoNoClassOrMediaElement:v7];
        goto LABEL_33;
      }
      goto LABEL_32;
    }
    BOOL v17 = &OBJC_IVAR___BKBookContainerView__cancelRightTap;
    double v18 = &OBJC_IVAR___BKBookContainerView__cancelRightTapTimer;
  }
  if ((BKIndirectPanGestureRecognizer *)self->_manualCurlRecognizer != v6)
  {
    uint64_t v22 = *v18;
    if (!*(Class *)((char *)&self->super.super.super.isa + v22))
    {
      *((unsigned char *)&self->super.super.super.isa + *v17) = 0;
      BOOL v23 = +[NSTimer scheduledTimerWithTimeInterval:self target:"cancelTapTimer:" selector:0 userInfo:0 repeats:0.3];
      double v24 = *(Class *)((char *)&self->super.super.super.isa + v22);
      *(Class *)((char *)&self->super.super.super.isa + v22) = v23;
    }
  }
LABEL_9:
  if (((BKIndirectPanGestureRecognizer *)self->_previousPageSwipeRecognizer == v6
     || (BKIndirectPanGestureRecognizer *)self->_nextPageSwipeRecognizer == v6
     || (BKIndirectPanGestureRecognizer *)self->_previousChapterSwipeRecognizer == v6
     || (BKIndirectPanGestureRecognizer *)self->_nextChapterSwipeRecognizer == v6)
    && [(BKBookContainerView *)self _touchIsNoNoClassOrMediaElement:v7])
  {
    goto LABEL_32;
  }
  LOBYTE(v10) = 1;
LABEL_33:

  return v10;
}

- (BOOL)_shouldIgnoreNavigationTouch:(id)a3
{
  [a3 locationInView:self];
  [(BKBookContainerView *)self bounds];
  CGFloat x = v11.origin.x;
  CGFloat y = v11.origin.y;
  CGFloat width = v11.size.width;
  CGFloat height = v11.size.height;
  CGRectGetMinX(v11);
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  CGRectGetMaxY(v12);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  CGRectGetMaxX(v13);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  CGRectGetMaxY(v14);
  CGPointSquaredDistanceFromPoint();
  BOOL result = 1;
  if (v8 >= 2025.0)
  {
    CGPointSquaredDistanceFromPoint();
    if (v9 >= 2025.0) {
      return 0;
    }
  }
  return result;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = (UITapGestureRecognizer *)a3;
  BOOL v5 = [(BKBookContainerView *)self delegate];
  unsigned int v6 = [v5 isShowingContent];

  if (!v6) {
    goto LABEL_7;
  }
  [(UITapGestureRecognizer *)v4 locationInView:self];
  double v9 = v7;
  double v10 = v8;
  if (self->_leftTapRecognizer == v4 || self->_rightTapRecognizer == v4)
  {
    if (-[BKBookContainerView _tapLocationForTouchLocation:](self, "_tapLocationForTouchLocation:", v7, v8))
    {
      unsigned int v11 = !-[BKBookContainerView _tapLocationIsInTextOverlapArea:](self, "_tapLocationIsInTextOverlapArea:", v9, v10);
      goto LABEL_8;
    }
LABEL_7:
    LOBYTE(v11) = 0;
    goto LABEL_8;
  }
  LOBYTE(v11) = 1;
LABEL_8:

  return v11;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  unsigned int v6 = (BKPanGestureRecognizer *)a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || self->_manualCurlRecognizer == v6
    || (BKPanGestureRecognizer *)self->_leftTapRecognizer == v6
    || (BKPanGestureRecognizer *)self->_rightTapRecognizer == v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || sub_37360(v7)) {
      goto LABEL_12;
    }
  }
  double v8 = [(BKBookContainerView *)self gestureRecognizers];
  if ([v8 indexOfObject:v6] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
  }
  else
  {
    double v9 = [(BKBookContainerView *)self gestureRecognizers];
    id v10 = [v9 indexOfObject:v7];

    if (v10 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      char v13 = 1;
      goto LABEL_13;
    }
  }
  unsigned int v11 = [(BKBookContainerView *)self gestureRecognizers];
  id v12 = [v11 indexOfObject:v7];

  if (v12 != (id)0x7FFFFFFFFFFFFFFFLL) {
LABEL_12:
  }
    char v13 = 0;
  else {
    char v13 = !self->_trackingManualCurl;
  }
LABEL_13:

  return v13;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  unsigned int v6 = (BKPanGestureRecognizer *)a3;
  id v7 = a4;
  objc_opt_class();
  BOOL v8 = (objc_opt_isKindOfClass() & 1) != 0
    || self->_manualCurlRecognizer == v6
    || (BKPanGestureRecognizer *)self->_leftTapRecognizer == v6
    || self->_rightTapRecognizer == (UITapGestureRecognizer *)v6;
  BOOL v9 = sub_37360(v7);
  if (v9)
  {
    [v7 locationInView:self];
    BOOL v10 = -[BKBookContainerView _tapLocationForTouchLocation:](self, "_tapLocationForTouchLocation:") != 0;
    if (!v8)
    {
LABEL_8:
      unsigned __int8 v11 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    BOOL v10 = 0;
    if (!v8) {
      goto LABEL_8;
    }
  }
  if (!v9 || v10)
  {
    id v12 = [(BKBookContainerView *)self delegate];
    unsigned __int8 v11 = [v12 bookContainerView:self pageTurnShouldRequireFailureOf:v7];
  }
  else
  {
    unsigned __int8 v11 = 1;
  }
LABEL_13:
  if (qword_22B538 != -1) {
    dispatch_once(&qword_22B538, &stru_1DB768);
  }
  char v13 = v11 & ~objc_opt_isKindOfClass();

  return v13;
}

- (void)cancelTapTimer:(id)a3
{
  id v4 = (NSTimer *)a3;
  p_cancelLeftTapTimer = &self->_cancelLeftTapTimer;
  if (self->_cancelLeftTapTimer == v4)
  {
    BOOL v8 = v4;
    unsigned int v6 = &OBJC_IVAR___BKBookContainerView__cancelLeftTap;
  }
  else
  {
    p_cancelLeftTapTimer = &self->_cancelRightTapTimer;
    if (self->_cancelRightTapTimer != v4) {
      goto LABEL_6;
    }
    BOOL v8 = v4;
    unsigned int v6 = &OBJC_IVAR___BKBookContainerView__cancelRightTap;
  }
  *((unsigned char *)&self->super.super.super.isa + *v6) = 1;
  [(NSTimer *)*p_cancelLeftTapTimer invalidate];
  id v7 = *p_cancelLeftTapTimer;
  *p_cancelLeftTapTimer = 0;

  id v4 = v8;
LABEL_6:
}

- (BOOL)shouldHandleSwipeGesture:(id)a3
{
  id v4 = a3;
  if ([(BKBookContainerView *)self ignoreNextGesture])
  {
    [(BKBookContainerView *)self setIgnoreNextGesture:0];
    BOOL v5 = _AESwipeLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v19 = 0;
      unsigned int v6 = "Swipe Gesture was ignored";
      id v7 = (uint8_t *)&v19;
LABEL_24:
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
      goto LABEL_25;
    }
    goto LABEL_25;
  }
  if (self->_trackingManualCurl)
  {
    if (self->_manualCurl) {
      goto LABEL_22;
    }
    BOOL v8 = _AESwipeLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "swipe before curl", buf, 2u);
    }

    self->_BOOL swipeBeforeManualCurl = 1;
    if ([v4 direction] == (char *)&dword_0 + 2)
    {
      int64_t v9 = 0;
    }
    else
    {
      if ([v4 direction] != (char *)&dword_0 + 1)
      {
LABEL_21:
        self->_chapterTurn = (unint64_t)[v4 numberOfTouchesRequired] > 1;
LABEL_22:
        BOOL v5 = _AESwipeLog();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)BOOL v17 = 0;
          unsigned int v6 = "Tracking manual curl -- won't swipe";
          id v7 = v17;
          goto LABEL_24;
        }
        goto LABEL_25;
      }
      int64_t v9 = 1;
    }
    self->_int64_t swipeDirection = v9;
    goto LABEL_21;
  }
  [v4 locationInView:self];
  if (-[BKBookContainerView _tapLocationForTouchLocation:](self, "_tapLocationForTouchLocation:"))
  {
    BOOL v10 = _AESwipeLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v16 = 0;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "swipe in the gutter", v16, 2u);
    }

    if ((unint64_t)[v4 numberOfTouchesRequired] < 2) {
      goto LABEL_26;
    }
  }
  unsigned __int8 v11 = [(BKBookContainerView *)self delegate];
  unsigned __int8 v12 = [v11 bookContainerViewShouldTurnPage:self];

  if ((v12 & 1) == 0)
  {
    BOOL v5 = _AESwipeLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = 0;
      unsigned int v6 = "Delegate told us to not swipe";
      id v7 = (uint8_t *)&v15;
      goto LABEL_24;
    }
LABEL_25:

LABEL_26:
    BOOL v13 = 0;
    goto LABEL_27;
  }
  BOOL v13 = 1;
LABEL_27:

  return v13;
}

- (void)addGestureRecognizer:(id)a3
{
  id v4 = a3;
  if (v4 && [(BKBookContainerView *)self internalGestureRecognizersSet]) {
    [(BKBookContainerView *)self setExternalGestureRecognizerCount:(char *)[(BKBookContainerView *)self externalGestureRecognizerCount] + 1];
  }
  v5.receiver = self;
  v5.super_class = (Class)BKBookContainerView;
  [(BKBookContainerView *)&v5 addGestureRecognizer:v4];
}

- (void)removeGestureRecognizer:(id)a3
{
  id v4 = a3;
  if (v4 && [(BKBookContainerView *)self internalGestureRecognizersSet]) {
    [(BKBookContainerView *)self setExternalGestureRecognizerCount:(char *)[(BKBookContainerView *)self externalGestureRecognizerCount] - 1];
  }
  v5.receiver = self;
  v5.super_class = (Class)BKBookContainerView;
  [(BKBookContainerView *)&v5 removeGestureRecognizer:v4];
}

- (NSArray)gestureRecognizers
{
  return +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", self->_leftTapRecognizer, self->_rightTapRecognizer, self->_manualCurlRecognizer, self->_indirectManualCurlRecognizer, self->_previousPageSwipeRecognizer, self->_nextPageSwipeRecognizer, self->_previousChapterSwipeRecognizer, self->_nextChapterSwipeRecognizer, 0);
}

- (BKBookContainerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKBookContainerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)spineLocation
{
  return self->_spineLocation;
}

- (BOOL)internalGestureRecognizersSet
{
  return self->_internalGestureRecognizersSet;
}

- (void)setInternalGestureRecognizersSet:(BOOL)a3
{
  self->_internalGestureRecognizersSet = a3;
}

- (unint64_t)externalGestureRecognizerCount
{
  return self->_externalGestureRecognizerCount;
}

- (void)setExternalGestureRecognizerCount:(unint64_t)a3
{
  self->_externalGestureRecognizerCount = a3;
}

- (BOOL)ignoreNextGesture
{
  return self->_ignoreNextGesture;
}

- (void)setIgnoreNextGesture:(BOOL)a3
{
  self->_ignoreNextGesture = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cancelRightTapTimer, 0);
  objc_storeStrong((id *)&self->_cancelLeftTapTimer, 0);
  objc_storeStrong(&self->_manualCurl, 0);
  objc_storeStrong((id *)&self->_nextChapterSwipeRecognizer, 0);
  objc_storeStrong((id *)&self->_previousChapterSwipeRecognizer, 0);
  objc_storeStrong((id *)&self->_nextPageSwipeRecognizer, 0);
  objc_storeStrong((id *)&self->_previousPageSwipeRecognizer, 0);
  objc_storeStrong((id *)&self->_indirectManualCurlRecognizer, 0);
  objc_storeStrong((id *)&self->_manualCurlRecognizer, 0);
  objc_storeStrong((id *)&self->_rightTapRecognizer, 0);

  objc_storeStrong((id *)&self->_leftTapRecognizer, 0);
}

@end