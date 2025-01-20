@interface MFTextSelectionScrollHandler
- (BOOL)isListeningForTouches;
- (BOOL)isMovingCursor;
- (MFTextSelectionScrollHandler)initWithScrollView:(id)a3;
- (UIScrollView)scrollView;
- (UITouch)textSelectionTouch;
- (double)_maxScrollOffset;
- (double)_minScrollOffset;
- (double)scrollOffsetIncrement;
- (id)window;
- (void)_reset;
- (void)_scrollForTouchLocation:(CGPoint)a3;
- (void)_setContentOffsetY:(double)a3;
- (void)dealloc;
- (void)handleTextSelectionChanged:(id)a3;
- (void)handleTouchEvents:(id)a3;
- (void)setIsListeningForTouches:(BOOL)a3;
- (void)setIsMovingCursor:(BOOL)a3;
- (void)setScrollOffsetIncrement:(double)a3;
- (void)setScrollView:(id)a3;
- (void)setTextSelectionTouch:(id)a3;
@end

@implementation MFTextSelectionScrollHandler

- (MFTextSelectionScrollHandler)initWithScrollView:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFTextSelectionScrollHandler;
  v6 = [(MFTextSelectionScrollHandler *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_scrollView, a3);
  }

  return v7;
}

- (void)dealloc
{
  [(MFTextSelectionScrollHandler *)self _reset];
  v3.receiver = self;
  v3.super_class = (Class)MFTextSelectionScrollHandler;
  [(MFTextSelectionScrollHandler *)&v3 dealloc];
}

- (void)handleTextSelectionChanged:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    if (self->_isListeningForTouches)
    {
      self->_isMovingCursor = 1;
    }
    else
    {
      self->_isListeningForTouches = 1;
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      objc_copyWeak(&v7, &location);
      id v5 = [(MFTextSelectionScrollHandler *)self window];
      [v5 setTouchEventListener:&v6];

      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    [(MFTextSelectionScrollHandler *)self _reset];
  }
}

- (void)handleTouchEvents:(id)a3
{
  id v14 = a3;
  p_textSelectionTouch = (id *)&self->_textSelectionTouch;
  textSelectionTouch = self->_textSelectionTouch;
  if (textSelectionTouch) {
    goto LABEL_8;
  }
  if ([v14 count] == (id)1)
  {
    uint64_t v6 = [v14 anyObject];
    if ([v6 tapCount]) {
      objc_storeStrong((id *)&self->_textSelectionTouch, v6);
    }
  }
  textSelectionTouch = (UITouch *)*p_textSelectionTouch;
  if (*p_textSelectionTouch)
  {
LABEL_8:
    if ((id)[(UITouch *)textSelectionTouch phase] == (id)4
      || [*p_textSelectionTouch phase] == (id)3)
    {
      self->_isMovingCursor = 0;
      id v7 = self->_textSelectionTouch;
      self->_textSelectionTouch = 0;
    }
    id v8 = *p_textSelectionTouch;
    if (*p_textSelectionTouch && self->_isMovingCursor)
    {
      objc_super v9 = [(MFTextSelectionScrollHandler *)self scrollView];
      [v8 locationInView:v9];
      double v11 = v10;
      double v13 = v12;

      -[MFTextSelectionScrollHandler _scrollForTouchLocation:](self, "_scrollForTouchLocation:", v11, v13);
    }
  }
}

- (void)_scrollForTouchLocation:(CGPoint)a3
{
  double y = a3.y;
  self->_scrollOffsetIncrement = self->_scrollOffsetIncrement + 0.2;
  id v5 = [(MFTextSelectionScrollHandler *)self scrollView];
  [v5 contentOffset];
  double v7 = v6;

  if (y + -100.0 <= v7)
  {
    id v14 = [(MFTextSelectionScrollHandler *)self scrollView];
    [v14 contentOffset];
    double v16 = v15 - self->_scrollOffsetIncrement;

    [(MFTextSelectionScrollHandler *)self _minScrollOffset];
    if (v16 >= v17) {
      double v17 = v16;
    }
  }
  else
  {
    id v8 = [(MFTextSelectionScrollHandler *)self scrollView];
    [v8 contentOffset];
    double v10 = v9;
    double v11 = [(MFTextSelectionScrollHandler *)self scrollView];
    [v11 bounds];
    double v13 = v10 + v12;

    if (y + 100.0 < v13)
    {
      self->_scrollOffsetIncrement = 0.0;
      return;
    }
    v18 = [(MFTextSelectionScrollHandler *)self scrollView];
    [v18 contentOffset];
    double v20 = v19 + self->_scrollOffsetIncrement;

    [(MFTextSelectionScrollHandler *)self _maxScrollOffset];
    if (v20 < v17) {
      double v17 = v20;
    }
  }

  [(MFTextSelectionScrollHandler *)self _setContentOffsetY:v17];
}

- (void)_setContentOffsetY:(double)a3
{
  id v4 = [(MFTextSelectionScrollHandler *)self scrollView];
  id v5 = [(MFTextSelectionScrollHandler *)self scrollView];
  [v5 contentOffset];
  [v4 setContentOffset:0 animated:YES];

  dispatch_time_t v6 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001EAD34;
  block[3] = &unk_1006047A0;
  block[4] = self;
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (double)_maxScrollOffset
{
  objc_super v3 = [(MFTextSelectionScrollHandler *)self scrollView];
  [v3 contentSize];
  double v5 = v4;
  dispatch_time_t v6 = [(MFTextSelectionScrollHandler *)self scrollView];
  [v6 contentInset];
  double v8 = v7;
  double v9 = [(MFTextSelectionScrollHandler *)self scrollView];
  [v9 bounds];
  double v11 = v5 + v8 - v10;

  return v11;
}

- (double)_minScrollOffset
{
  v2 = [(MFTextSelectionScrollHandler *)self scrollView];
  [v2 contentInset];
  double v4 = -v3;

  return v4;
}

- (id)window
{
  v2 = [(MFTextSelectionScrollHandler *)self scrollView];
  double v3 = [v2 window];

  return v3;
}

- (void)_reset
{
  double v3 = [(MFTextSelectionScrollHandler *)self window];
  [v3 setTouchEventListener:0];

  textSelectionTouch = self->_textSelectionTouch;
  self->_textSelectionTouch = 0;

  *(_WORD *)&self->_isListeningForTouches = 0;
  self->_scrollOffsetIncrement = 0.0;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (BOOL)isListeningForTouches
{
  return self->_isListeningForTouches;
}

- (void)setIsListeningForTouches:(BOOL)a3
{
  self->_isListeningForTouches = a3;
}

- (BOOL)isMovingCursor
{
  return self->_isMovingCursor;
}

- (void)setIsMovingCursor:(BOOL)a3
{
  self->_isMovingCursor = a3;
}

- (UITouch)textSelectionTouch
{
  return self->_textSelectionTouch;
}

- (void)setTextSelectionTouch:(id)a3
{
}

- (double)scrollOffsetIncrement
{
  return self->_scrollOffsetIncrement;
}

- (void)setScrollOffsetIncrement:(double)a3
{
  self->_scrollOffsetIncrement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textSelectionTouch, 0);

  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end