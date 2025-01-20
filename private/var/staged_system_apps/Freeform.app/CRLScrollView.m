@interface CRLScrollView
- (BOOL)p_optOutOfUIScrollViewContentOffsetAnimation;
- (void)safeAreaInsetsDidChange;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setContentOffset:(CGPoint)a3;
- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4;
- (void)setContentOffset:(CGPoint)a3 relativeToOriginalSize:(CGSize)a4;
- (void)setContentSize:(CGSize)a3;
@end

@implementation CRLScrollView

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  if (a4)
  {
    [(CRLScrollView *)self contentOffset];
    if (x != v9 || y != v8)
    {
      v11 = [(CRLScrollView *)self delegate];
      char v12 = objc_opt_respondsToSelector();

      if (v12)
      {
        v13 = [(CRLScrollView *)self delegate];
        [v13 scrollView:self willAnimateToContentOffset:x, y];
      }
    }
  }
  if ([(CRLScrollView *)self p_optOutOfUIScrollViewContentOffsetAnimation])
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100051D60;
    v18[3] = &unk_1014CD898;
    v18[4] = self;
    *(double *)&v18[5] = x;
    *(double *)&v18[6] = y;
    v14 = objc_retainBlock(v18);
    v15 = v14;
    if (v4)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100051D6C;
      v17[3] = &unk_1014CE260;
      v17[4] = self;
      +[UIView animateWithDuration:v14 animations:v17 completion:0.3];
    }
    else
    {
      ((void (*)(void *))v14[2])(v14);
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)CRLScrollView;
    -[CRLScrollView setContentOffset:animated:](&v16, "setContentOffset:animated:", v4, x, y);
  }
}

- (void)setContentOffset:(CGPoint)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CRLScrollView;
  -[CRLScrollView setContentOffset:](&v3, "setContentOffset:", a3.x, a3.y);
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  [(CRLScrollView *)self contentInset];
  if (v11 != left || v8 != top || v10 != right || v9 != bottom)
  {
    v16.receiver = self;
    v16.super_class = (Class)CRLScrollView;
    -[CRLScrollView setContentInset:](&v16, "setContentInset:", top, left, bottom, right);
    v15 = +[NSNotificationCenter defaultCenter];
    [v15 postNotificationName:@"CRLScrollViewContentInsetDidChangeNotification" object:self];
  }
}

- (void)setContentOffset:(CGPoint)a3 relativeToOriginalSize:(CGSize)a4
{
  double width = a4.width;
  double y = a3.y;
  double x = a3.x;
  double v8 = [(CRLScrollView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    double v9 = [(CRLScrollView *)self delegate];
    unsigned int v10 = [v9 scrollViewShouldAnchorToRightEdge:self];

    int v11 = v10 ^ 1;
  }
  else
  {
    int v11 = 1;
  }

  char v12 = [(CRLScrollView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v13 = [(CRLScrollView *)self delegate];
    unsigned int v14 = [v13 contentViewCanResizeToFitScrollView:self];

    if (((v11 | v14 ^ 1) & 1) == 0)
    {
      [(CRLScrollView *)self contentSize];
      double x = x - (width - v15);
    }
  }
  else
  {
  }

  -[CRLScrollView setContentOffset:](self, "setContentOffset:", x, y);
}

- (void)safeAreaInsetsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)CRLScrollView;
  [(CRLScrollView *)&v4 safeAreaInsetsDidChange];
  objc_super v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"CRLScrollViewSafeAreaInsetsDidChangeNotification" object:self];
}

- (void)setContentSize:(CGSize)a3
{
  if (a3.height > 0.0 && a3.width > 0.0)
  {
    uint64_t v6 = v3;
    uint64_t v7 = v4;
    v5.receiver = self;
    v5.super_class = (Class)CRLScrollView;
    -[CRLScrollView setContentSize:](&v5, "setContentSize:");
  }
}

- (BOOL)p_optOutOfUIScrollViewContentOffsetAnimation
{
  uint64_t v3 = [(CRLScrollView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  objc_super v5 = [(CRLScrollView *)self delegate];
  unsigned __int8 v6 = [v5 scrollViewShouldOptOutOfUIScrollViewContentOffsetAnimationForScrollView:self];

  return v6;
}

@end