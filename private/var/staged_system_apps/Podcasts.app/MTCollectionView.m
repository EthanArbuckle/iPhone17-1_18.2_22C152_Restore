@interface MTCollectionView
- (BOOL)disableRefreshControlWhileEditing;
- (BOOL)isEditing;
- (BOOL)lockContentOffset;
- (CGPoint)appliedContentOffset;
- (MTCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (NSIndexPath)swipedCellIndexPath;
- (UIEdgeInsets)appliedInsets;
- (UIPanGestureRecognizer)swipeGesture;
- (id)cellForItemAtIndexPath:(id)a3;
- (void)_sendDidEndEditingForIndexPath:(id)a3;
- (void)_sendWillBeginEditingForIndexPath:(id)a3;
- (void)disablePullToRefresh;
- (void)enablePullToRefresh;
- (void)layoutSubviews;
- (void)setAllowsMultipleSelection:(BOOL)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setContentOffset:(CGPoint)a3;
- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4;
- (void)setDisableRefreshControlWhileEditing:(BOOL)a3;
- (void)setEditing:(BOOL)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setLockContentOffset:(BOOL)a3;
- (void)setRefreshControl:(id)a3;
- (void)setSwipeGesture:(id)a3;
- (void)setSwipedCellIndexPath:(id)a3;
- (void)swipeBegan:(id)a3;
- (void)swipeEnded:(id)a3;
- (void)updateRefreshEnabledState;
@end

@implementation MTCollectionView

- (MTCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MTCollectionView;
  v4 = -[MTCollectionView initWithFrame:collectionViewLayout:](&v7, "initWithFrame:collectionViewLayout:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4) {
    [(MTCollectionView *)v4 setScrollsToTop:1];
  }
  return v5;
}

- (void)setEditing:(BOOL)a3
{
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_editing != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_editing = a3;
    if (!a3
      || ([(MTCollectionView *)self swipedCellIndexPath],
          objc_super v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          !v7))
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      v8 = [(MTCollectionView *)self visibleCells];
      id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v14;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v14 != v11) {
              objc_enumerationMutation(v8);
            }
            [*(id *)(*((void *)&v13 + 1) + 8 * i) setEditing:v5 animated:v4];
          }
          id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v10);
      }
    }
    [(MTCollectionView *)self updateRefreshEnabledState];
  }
}

- (void)setAllowsMultipleSelection:(BOOL)a3
{
  BOOL v3 = a3;
  if (([(MTCollectionView *)self allowsMultipleSelection] & 1) == 0 && v3) {
    [(MTCollectionView *)self selectItemAtIndexPath:0 animated:0 scrollPosition:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)MTCollectionView;
  [(MTCollectionView *)&v5 setAllowsMultipleSelection:v3];
}

- (void)setDisableRefreshControlWhileEditing:(BOOL)a3
{
  self->_disableRefreshControlWhileEditing = a3;
  [(MTCollectionView *)self updateRefreshEnabledState];
}

- (void)setRefreshControl:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_refreshControl, a3);
  if (![(MTCollectionView *)self isEditing] || !self->_disableRefreshControlWhileEditing)
  {
    v6.receiver = self;
    v6.super_class = (Class)MTCollectionView;
    [(MTCollectionView *)&v6 setRefreshControl:v5];
  }
}

- (UIEdgeInsets)appliedInsets
{
  [(MTCollectionView *)self contentInset];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(MTCollectionView *)self refreshControl];

  if (v11)
  {
    v12 = [(MTCollectionView *)self refreshControl];
    [v12 _appliedInsets];
    double v14 = v13;

    double v4 = v4 - v14;
  }
  double v15 = v4;
  double v16 = v6;
  double v17 = v8;
  double v18 = v10;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (CGPoint)appliedContentOffset
{
  [(MTCollectionView *)self appliedInsets];
  double v4 = v3;
  [(MTCollectionView *)self contentOffset];
  double v7 = v4 + v6;
  result.y = v7;
  result.x = v5;
  return result;
}

- (void)updateRefreshEnabledState
{
  if (self->_disableRefreshControlWhileEditing)
  {
    if ([(MTCollectionView *)self isEditing])
    {
      [(MTCollectionView *)self disablePullToRefresh];
    }
    else
    {
      refreshControl = self->_refreshControl;
      if (refreshControl)
      {
        double v4 = [(UIRefreshControl *)refreshControl superview];

        if (!v4)
        {
          [(MTCollectionView *)self enablePullToRefresh];
        }
      }
    }
  }
}

- (void)disablePullToRefresh
{
  v2.receiver = self;
  v2.super_class = (Class)MTCollectionView;
  [(MTCollectionView *)&v2 setRefreshControl:0];
}

- (void)enablePullToRefresh
{
  if (![(MTCollectionView *)self disableRefreshControlWhileEditing]
    || ![(MTCollectionView *)self isEditing])
  {
    refreshControl = self->_refreshControl;
    if (refreshControl)
    {
      double v4 = [(UIRefreshControl *)refreshControl superview];

      if (!v4)
      {
        double v5 = self->_refreshControl;
        [(MTCollectionView *)self setRefreshControl:v5];
      }
    }
  }
}

- (void)setSwipedCellIndexPath:(id)a3
{
  double v5 = (NSIndexPath *)a3;
  p_swipedCellIndexPath = &self->_swipedCellIndexPath;
  swipedCellIndexPath = self->_swipedCellIndexPath;
  if (swipedCellIndexPath != v5)
  {
    double v9 = v5;
    swipedCellIndexPath = (NSIndexPath *)[(NSIndexPath *)swipedCellIndexPath isEqual:v5];
    double v5 = v9;
    if ((swipedCellIndexPath & 1) == 0)
    {
      if (*p_swipedCellIndexPath)
      {
        double v8 = -[MTCollectionView cellForItemAtIndexPath:](self, "cellForItemAtIndexPath:");
        [v8 setEditing:0];
        if (!v9)
        {
          [(MTCollectionView *)self setEditing:0];
          [(MTCollectionView *)self _sendDidEndEditingForIndexPath:*p_swipedCellIndexPath];
        }
      }
      objc_storeStrong((id *)&self->_swipedCellIndexPath, a3);
      double v5 = v9;
      if (v9)
      {
        [(MTCollectionView *)self _sendWillBeginEditingForIndexPath:v9];
        swipedCellIndexPath = (NSIndexPath *)[(MTCollectionView *)self setEditing:1];
        double v5 = v9;
      }
    }
  }

  _objc_release_x1(swipedCellIndexPath, v5);
}

- (void)setSwipeGesture:(id)a3
{
  double v5 = (UIPanGestureRecognizer *)a3;
  swipeGesture = self->_swipeGesture;
  if (swipeGesture != v5)
  {
    double v7 = v5;
    if (swipeGesture)
    {
      -[MTCollectionView removeGestureRecognizer:](self, "removeGestureRecognizer:");
      double v5 = v7;
    }
    if (v5) {
      [(MTCollectionView *)self addGestureRecognizer:v7];
    }
    objc_storeStrong((id *)&self->_swipeGesture, a3);
    double v5 = v7;
  }
}

- (void)_sendWillBeginEditingForIndexPath:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    double v5 = [(MTCollectionView *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    id v4 = v8;
    if (v6)
    {
      double v7 = [(MTCollectionView *)self delegate];
      [v7 collectionView:self willBeginEditingItemAtIndexPath:v8];

      id v4 = v8;
    }
  }
}

- (void)_sendDidEndEditingForIndexPath:(id)a3
{
  id v7 = a3;
  id v4 = [(MTCollectionView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(MTCollectionView *)self delegate];
    [v6 collectionView:self didEndEditingItemAtIndexPath:v7];
  }
}

- (void)swipeBegan:(id)a3
{
  id v4 = [(MTCollectionView *)self indexPathForCell:a3];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
    id v4 = [(MTCollectionView *)self setSwipedCellIndexPath:v4];
    id v5 = v6;
  }

  _objc_release_x1(v4, v5);
}

- (void)swipeEnded:(id)a3
{
}

- (void)setContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (![(MTCollectionView *)self lockContentOffset])
  {
    v6.receiver = self;
    v6.super_class = (Class)MTCollectionView;
    -[MTCollectionView setContentOffset:](&v6, "setContentOffset:", x, y);
  }
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  if (![(MTCollectionView *)self lockContentOffset])
  {
    v8.receiver = self;
    v8.super_class = (Class)MTCollectionView;
    -[MTCollectionView setContentOffset:animated:](&v8, "setContentOffset:animated:", v4, x, y);
  }
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  v16.receiver = self;
  v16.super_class = (Class)MTCollectionView;
  [(MTCollectionView *)&v16 contentInset];
  if (left != v11 || top != v8 || right != v10 || bottom != v9)
  {
    v15.receiver = self;
    v15.super_class = (Class)MTCollectionView;
    -[MTCollectionView setContentInset:](&v15, "setContentInset:", top, left, bottom, right);
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)MTCollectionView;
  [(MTCollectionView *)&v4 layoutSubviews];
  double v3 = [(MTCollectionView *)self refreshControl];
  [(MTCollectionView *)self sendSubviewToBack:v3];
}

- (id)cellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MTCollectionView;
  id v5 = [(MTCollectionView *)&v7 cellForItemAtIndexPath:v4];

  return v5;
}

- (BOOL)disableRefreshControlWhileEditing
{
  return self->_disableRefreshControlWhileEditing;
}

- (BOOL)lockContentOffset
{
  return self->_lockContentOffset;
}

- (void)setLockContentOffset:(BOOL)a3
{
  self->_lockContentOffset = a3;
}

- (NSIndexPath)swipedCellIndexPath
{
  return self->_swipedCellIndexPath;
}

- (UIPanGestureRecognizer)swipeGesture
{
  return self->_swipeGesture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swipeGesture, 0);
  objc_storeStrong((id *)&self->_swipedCellIndexPath, 0);

  objc_storeStrong((id *)&self->_refreshControl, 0);
}

@end