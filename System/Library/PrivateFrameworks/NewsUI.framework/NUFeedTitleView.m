@interface NUFeedTitleView
- (BOOL)useCompactTitleViewUpdates;
- (NSMutableArray)titleViewUpdateStack;
- (NUFeedTitleView)initWithFrame:(CGRect)a3;
- (NUFeedTitleViewDelegate)delegate;
- (NUTitleView)titleView;
- (NUTitleViewStyler)styler;
- (NUTitleViewUpdate)lastQueuedTitleViewUpdate;
- (id)titleViewUpdateForFeedTitleViewUpdate:(id)a3 force:(BOOL)a4;
- (unint64_t)titleViewAnimationForAnimation:(unint64_t)a3;
- (void)applyFeedTitleViewUpdate:(id)a3 animation:(unint64_t)a4;
- (void)applyFeedTitleViewUpdate:(id)a3 animation:(unint64_t)a4 force:(BOOL)a5;
- (void)applyTitleViewUpdate:(id)a3 animation:(unint64_t)a4;
- (void)layoutSubviews;
- (void)popApplyFeedTitleViewUpdateWithAnimation:(unint64_t)a3;
- (void)popApplyFeedTitleViewUpdateWithAnimation:(unint64_t)a3 force:(BOOL)a4;
- (void)pushApplyFeedTitleViewUpdate:(id)a3 animation:(unint64_t)a4;
- (void)pushApplyFeedTitleViewUpdate:(id)a3 animation:(unint64_t)a4 force:(BOOL)a5;
- (void)relayoutWithAnimation:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setLastQueuedTitleViewUpdate:(id)a3;
- (void)setStyler:(id)a3;
- (void)titleViewDidTapOnTitleView:(id)a3;
@end

@implementation NUFeedTitleView

- (void)applyFeedTitleViewUpdate:(id)a3 animation:(unint64_t)a4
{
}

- (void)applyFeedTitleViewUpdate:(id)a3 animation:(unint64_t)a4 force:(BOOL)a5
{
  id v7 = [(NUFeedTitleView *)self titleViewUpdateForFeedTitleViewUpdate:a3 force:a5];
  [(NUFeedTitleView *)self applyTitleViewUpdate:v7 animation:a4];
}

- (void)applyTitleViewUpdate:(id)a3 animation:(unint64_t)a4
{
  id v11 = a3;
  uint64_t v6 = [(NUFeedTitleView *)self lastQueuedTitleViewUpdate];
  if (!v6
    || (id v7 = (void *)v6,
        [(NUFeedTitleView *)self lastQueuedTitleViewUpdate],
        v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 isEqual:v11],
        v8,
        v7,
        (v9 & 1) == 0))
  {
    [(NUFeedTitleView *)self setLastQueuedTitleViewUpdate:v11];
    v10 = [(NUFeedTitleView *)self titleView];
    objc_msgSend(v10, "applyTitleViewUpdate:animation:", v11, -[NUFeedTitleView titleViewAnimationForAnimation:](self, "titleViewAnimationForAnimation:", a4));
  }
}

- (NUTitleViewUpdate)lastQueuedTitleViewUpdate
{
  return self->_lastQueuedTitleViewUpdate;
}

- (void)setLastQueuedTitleViewUpdate:(id)a3
{
}

- (void)setStyler:(id)a3
{
  id v4 = a3;
  v5 = [(NUFeedTitleView *)self titleView];
  [v5 setStyler:v4];

  [(NUFeedTitleView *)self setLastQueuedTitleViewUpdate:0];
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)NUFeedTitleView;
  [(NUFeedTitleView *)&v12 layoutSubviews];
  [(NUFeedTitleView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(NUFeedTitleView *)self titleView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (NUTitleView)titleView
{
  return self->_titleView;
}

- (NUFeedTitleView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NUFeedTitleView;
  double v3 = -[NUFeedTitleView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = objc_alloc_init(NUTitleViewStyler);
    double v5 = [[NUTitleView alloc] initWithStyler:v4];
    titleView = v3->_titleView;
    v3->_titleView = v5;

    [(NUTitleView *)v3->_titleView setDelegate:v3];
    double v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    titleViewUpdateStack = v3->_titleViewUpdateStack;
    v3->_titleViewUpdateStack = v7;

    [(NUFeedTitleView *)v3 addSubview:v3->_titleView];
  }
  return v3;
}

- (unint64_t)titleViewAnimationForAnimation:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return 0;
  }
  else {
    return qword_2222016A0[a3 - 1];
  }
}

- (id)titleViewUpdateForFeedTitleViewUpdate:(id)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = objc_msgSend(v6, "convertToTitleViewUpdateWithCompact:", -[NUFeedTitleView useCompactTitleViewUpdates](self, "useCompactTitleViewUpdates"));
  [v7 setCancelPendingUpdates:v4];
  double v8 = [v6 accessibilityTitle];

  [v7 setAccessibilityTitle:v8];

  return v7;
}

- (BOOL)useCompactTitleViewUpdates
{
  v2 = [(NUFeedTitleView *)self traitCollection];
  BOOL v3 = [v2 horizontalSizeClass] == 1;

  return v3;
}

- (void)setDelegate:(id)a3
{
}

- (void)pushApplyFeedTitleViewUpdate:(id)a3 animation:(unint64_t)a4
{
}

- (void)pushApplyFeedTitleViewUpdate:(id)a3 animation:(unint64_t)a4 force:(BOOL)a5
{
  BOOL v5 = a5;
  id v12 = a3;
  double v8 = [(NUFeedTitleView *)self lastQueuedTitleViewUpdate];

  if (v8)
  {
    double v9 = [(NUFeedTitleView *)self titleViewUpdateStack];
    objc_super v10 = [(NUFeedTitleView *)self lastQueuedTitleViewUpdate];
    [v9 addObject:v10];
  }
  id v11 = [(NUFeedTitleView *)self titleViewUpdateForFeedTitleViewUpdate:v12 force:v5];
  [(NUFeedTitleView *)self applyTitleViewUpdate:v11 animation:a4];
}

- (void)popApplyFeedTitleViewUpdateWithAnimation:(unint64_t)a3
{
}

- (void)popApplyFeedTitleViewUpdateWithAnimation:(unint64_t)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = [(NUFeedTitleView *)self titleViewUpdateStack];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    double v9 = [(NUFeedTitleView *)self titleViewUpdateStack];
    objc_msgSend(v9, "fc_popLastObject");
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    [v10 setCancelPendingUpdates:v4];
    [(NUFeedTitleView *)self applyTitleViewUpdate:v10 animation:a3];
  }
}

- (NUTitleViewStyler)styler
{
  v2 = [(NUFeedTitleView *)self titleView];
  BOOL v3 = [v2 styler];

  return (NUTitleViewStyler *)v3;
}

- (void)relayoutWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NUFeedTitleView *)self titleView];
  [v4 relayoutWithAnimation:v3];
}

- (void)titleViewDidTapOnTitleView:(id)a3
{
  id v4 = [(NUFeedTitleView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(NUFeedTitleView *)self delegate];
    [v6 feedTitleViewDidTapOnTitleView:self];
  }
}

- (NUFeedTitleViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NUFeedTitleViewDelegate *)WeakRetained;
}

- (NSMutableArray)titleViewUpdateStack
{
  return self->_titleViewUpdateStack;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleViewUpdateStack, 0);
  objc_storeStrong((id *)&self->_lastQueuedTitleViewUpdate, 0);
  objc_storeStrong((id *)&self->_titleView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end