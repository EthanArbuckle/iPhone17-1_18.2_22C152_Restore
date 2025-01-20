@interface IMViewControllerTransition
- (CATransform3D)fillBoundsScaleTransformFromTransform:(SEL)a3 sourceRect:(CATransform3D *)a4;
- (CGRect)fillBoundsTargetRect;
- (IMViewControllerContaining)fromViewController;
- (IMViewControllerContaining)toViewController;
- (IMViewControllerTransition)init;
- (UIImageView)fromViewSnapshot;
- (UIImageView)toViewSnapshot;
- (UIView)fromView;
- (UIView)toView;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)parentView;
- (int)roleForViewController:(id)a3;
- (void)_updateParentViewBackgroundColorForToView:(id)a3;
- (void)beginAppearanceTransition;
- (void)beginTransition;
- (void)cleanupTransition;
- (void)endAppearanceTransition;
- (void)loadToView;
- (void)p_setFrame:(CGRect)a3 onViewController:(id)a4;
- (void)performNonAnimatedTransition;
- (void)prepareTransition;
- (void)setFromViewController:(id)a3;
- (void)setFromViewSnapshot:(id)a3;
- (void)setReverse:(BOOL)a3;
- (void)setToViewController:(id)a3;
- (void)setToViewSnapshot:(id)a3;
- (void)transitionDidEnd;
@end

@implementation IMViewControllerTransition

- (IMViewControllerTransition)init
{
  v5.receiver = self;
  v5.super_class = (Class)IMViewControllerTransition;
  v2 = [(IMTransition *)&v5 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_class();
    if (v3 == objc_opt_class()) {
      [(IMTransition *)v2 setAnimated:0];
    }
  }
  return v2;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)IMViewControllerTransition;
  uint64_t v3 = [(IMViewControllerTransition *)&v8 description];
  v4 = [(IMViewControllerTransition *)self fromViewController];
  objc_super v5 = [(IMViewControllerTransition *)self toViewController];
  v6 = +[NSString stringWithFormat:@"%@\nfromViewController:%@\ntoViewController:%@", v3, v4, v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)IMViewControllerTransition;
  id v4 = [(IMTransition *)&v7 copyWithZone:a3];
  objc_super v5 = v4;
  if (v4)
  {
    [v4 setFromViewController:self->_fromViewController];
    [v5 setToViewController:self->_toViewController];
    [v5 setFromViewSnapshot:self->_fromViewSnapshot];
    [v5 setToViewSnapshot:self->_toViewSnapshot];
  }
  return v5;
}

- (void)beginTransition
{
  v2.receiver = self;
  v2.super_class = (Class)IMViewControllerTransition;
  [(IMTransition *)&v2 beginTransition];
}

- (void)p_setFrame:(CGRect)a3 onViewController:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v14 = a4;
  v9 = [(IMTransition *)self parentViewController];
  char v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) == 0
    || ([(IMTransition *)self parentViewController],
        v11 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v12 = [v11 setFrameOnViewController:v14 forTransition:self],
        v11,
        (v12 & 1) == 0))
  {
    v13 = [v14 view];
    [v13 setFrame:CGRectMake(x, y, width, height)];
  }
}

- (id)parentView
{
  uint64_t v3 = [(IMTransition *)self parentViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    objc_super v5 = [(IMTransition *)self parentViewController];
    v6 = [v5 containerViewForIMTransition:self];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)IMViewControllerTransition;
    v6 = [(IMTransition *)&v8 parentView];
  }

  return v6;
}

- (void)prepareTransition
{
  v67.receiver = self;
  v67.super_class = (Class)IMViewControllerTransition;
  [(IMTransition *)&v67 prepareTransition];
  uint64_t v3 = [(IMViewControllerTransition *)self fromView];
  char v4 = [v3 superview];
  objc_super v5 = [(IMViewControllerTransition *)self parentView];

  if (v4 == v5)
  {
    v6 = [(IMViewControllerTransition *)self parentView];
    objc_super v7 = [(IMTransition *)self view];
    objc_super v8 = [(IMViewControllerTransition *)self fromView];
    [v6 insertSubview:v7 aboveSubview:v8];
  }
  [(IMViewControllerTransition *)self loadToView];
  v9 = [(IMTransition *)self parentViewController];
  char v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) == 0
    || ([(IMTransition *)self parentViewController],
        v11 = objc_claimAutoreleasedReturnValue(),
        [(IMTransition *)self view],
        unsigned __int8 v12 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v13 = [v11 setFrameOnTransitioningView:v12 forTransition:self],
        v12,
        v11,
        (v13 & 1) == 0))
  {
    id v14 = [(IMViewControllerTransition *)self fromViewController];
    v15 = [v14 view];
    [v15 frame];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    v24 = [(IMTransition *)self view];
    [v24 setFrame:v17, v19, v21, v23];
  }
  v25 = [(IMTransition *)self parentViewController];
  v26 = [v25 view];
  [v26 frame];
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  v35 = [(IMTransition *)self view];
  [v35 setFrame:v28, v30, v32, v34];

  v36 = [(IMViewControllerTransition *)self parentView];
  v37 = [(IMViewControllerTransition *)self fromViewController];
  v38 = [v37 view];
  [v38 frame];
  double v40 = v39;
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;
  v47 = [(IMTransition *)self view];
  [v36 convertRect:v47 toView:v40];
  double v49 = v48;
  double v51 = v50;
  double v53 = v52;
  double v55 = v54;

  v56 = [(IMViewControllerTransition *)self fromViewController];
  -[IMViewControllerTransition p_setFrame:onViewController:](self, "p_setFrame:onViewController:", v56, v49, v51, v53, v55);

  v57 = [(IMViewControllerTransition *)self toViewController];
  -[IMViewControllerTransition p_setFrame:onViewController:](self, "p_setFrame:onViewController:", v57, v49, v51, v53, v55);

  [(IMViewControllerTransition *)self beginAppearanceTransition];
  v58 = [(IMViewControllerTransition *)self fromView];
  v59 = [(IMViewControllerTransition *)self fromViewController];
  v60 = [v59 view];

  if (v58 != v60)
  {
    v61 = [(IMViewControllerTransition *)self fromViewController];
    v62 = [v61 view];
    [v62 removeFromSuperview];
  }
  v63 = [(IMTransition *)self view];
  v64 = [(IMViewControllerTransition *)self fromView];
  [v63 addSubview:v64];

  v65 = [(IMTransition *)self view];
  v66 = [(IMViewControllerTransition *)self toView];
  [v65 addSubview:v66];
}

- (void)cleanupTransition
{
  uint64_t v3 = [(IMViewControllerTransition *)self toViewController];
  char v4 = [v3 view];

  objc_super v5 = [(IMViewControllerTransition *)self parentView];
  v6 = [(IMTransition *)self view];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v15 = [(IMTransition *)self view];
  [v5 convertRect:v15 fromView:v8];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  v24 = [(IMViewControllerTransition *)self toViewController];
  -[IMViewControllerTransition p_setFrame:onViewController:](self, "p_setFrame:onViewController:", v24, v17, v19, v21, v23);

  [(UIImageView *)self->_fromViewSnapshot removeFromSuperview];
  [(UIImageView *)self->_toViewSnapshot removeFromSuperview];
  v25 = [(IMTransition *)self view];
  v26 = [v25 superview];
  double v27 = [(IMViewControllerTransition *)self parentView];

  double v28 = [(IMViewControllerTransition *)self parentView];
  double v29 = v28;
  if (v26 == v27)
  {
    double v30 = [(IMTransition *)self view];
    [v29 insertSubview:v4 aboveSubview:v30];
  }
  else
  {
    [v28 addSubview:v4];
  }

  [(IMViewControllerTransition *)self _updateParentViewBackgroundColorForToView:v4];
  v31.receiver = self;
  v31.super_class = (Class)IMViewControllerTransition;
  [(IMTransition *)&v31 cleanupTransition];
  [(IMViewControllerTransition *)self endAppearanceTransition];
}

- (void)performNonAnimatedTransition
{
  uint64_t v3 = [(IMTransition *)self parentViewController];
  unsigned int v4 = [v3 isViewLoaded];

  if (v4)
  {
    objc_super v5 = [(IMViewControllerTransition *)self fromViewController];
    v6 = [v5 view];

    double v7 = [(IMViewControllerTransition *)self toViewController];
    double v8 = [v7 view];

    [(IMViewControllerTransition *)self beginAppearanceTransition];
    [v6 frame];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v17 = [(IMViewControllerTransition *)self toViewController];
    -[IMViewControllerTransition p_setFrame:onViewController:](self, "p_setFrame:onViewController:", v17, v10, v12, v14, v16);

    double v18 = [v6 superview];
    double v19 = [(IMViewControllerTransition *)self parentView];

    double v20 = [(IMViewControllerTransition *)self parentView];
    double v21 = v20;
    if (v18 == v19)
    {
      double v22 = [(IMViewControllerTransition *)self parentView];
      [v21 insertSubview:v8 aboveSubview:v22];
    }
    else
    {
      [v20 addSubview:v8];
    }

    [(IMViewControllerTransition *)self _updateParentViewBackgroundColorForToView:v8];
    [v6 removeFromSuperview];
    [(IMViewControllerTransition *)self endAppearanceTransition];
  }
  v23.receiver = self;
  v23.super_class = (Class)IMViewControllerTransition;
  [(IMTransition *)&v23 performNonAnimatedTransition];
}

- (void)transitionDidEnd
{
  v3.receiver = self;
  v3.super_class = (Class)IMViewControllerTransition;
  [(IMTransition *)&v3 transitionDidEnd];
  [(IMViewControllerTransition *)self setFromViewController:0];
  [(IMViewControllerTransition *)self setToViewController:0];
  [(IMViewControllerTransition *)self setFromViewSnapshot:0];
  [(IMViewControllerTransition *)self setToViewSnapshot:0];
}

- (int)roleForViewController:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(IMViewControllerTransition *)self fromViewController];

    if (v5 == v4)
    {
      int v7 = 2;
    }
    else
    {
      id v6 = [(IMViewControllerTransition *)self toViewController];

      if (v6 == v4)
      {
        int v7 = 1;
      }
      else
      {
        v9.receiver = self;
        v9.super_class = (Class)IMViewControllerTransition;
        int v7 = [(IMTransition *)&v9 roleForViewController:v4];
      }
    }
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

- (CGRect)fillBoundsTargetRect
{
  objc_super v2 = [(IMTransition *)self view];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (CATransform3D)fillBoundsScaleTransformFromTransform:(SEL)a3 sourceRect:(CATransform3D *)a4
{
  CGFloat rect = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  [(IMViewControllerTransition *)self fillBoundsTargetRect];
  CGFloat v10 = v25.origin.x;
  CGFloat v11 = v25.origin.y;
  CGFloat v12 = v25.size.width;
  CGFloat height = v25.size.height;
  double v14 = CGRectGetWidth(v25);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = rect;
  CGFloat v15 = v14 / CGRectGetWidth(v26);
  v27.origin.CGFloat x = v10;
  v27.origin.CGFloat y = v11;
  v27.size.CGFloat width = v12;
  v27.size.CGFloat height = height;
  double v16 = CGRectGetHeight(v27);
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = rect;
  CGFloat v17 = CGRectGetHeight(v28);
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  long long v18 = *(_OWORD *)&a4->m33;
  *(_OWORD *)&v24.m31 = *(_OWORD *)&a4->m31;
  *(_OWORD *)&v24.m33 = v18;
  long long v19 = *(_OWORD *)&a4->m43;
  *(_OWORD *)&v24.m41 = *(_OWORD *)&a4->m41;
  *(_OWORD *)&v24.m43 = v19;
  long long v20 = *(_OWORD *)&a4->m13;
  *(_OWORD *)&v24.m11 = *(_OWORD *)&a4->m11;
  *(_OWORD *)&v24.m13 = v20;
  long long v21 = *(_OWORD *)&a4->m23;
  *(_OWORD *)&v24.m21 = *(_OWORD *)&a4->m21;
  *(_OWORD *)&v24.m23 = v21;
  return CATransform3DScale(retstr, &v24, v15, v16 / v17, 1.0);
}

- (UIView)fromView
{
  if ([(IMTransition *)self useSnapshots])
  {
    double v3 = [(IMViewControllerTransition *)self fromViewSnapshot];
  }
  else
  {
    double v4 = [(IMViewControllerTransition *)self fromViewController];
    double v3 = [v4 view];
  }

  return (UIView *)v3;
}

- (UIView)toView
{
  if ([(IMTransition *)self useSnapshots])
  {
    double v3 = [(IMViewControllerTransition *)self toViewSnapshot];
  }
  else
  {
    double v4 = [(IMViewControllerTransition *)self toViewController];
    double v3 = [v4 view];
  }

  return (UIView *)v3;
}

- (UIImageView)fromViewSnapshot
{
  fromViewSnapshot = self->_fromViewSnapshot;
  if (!fromViewSnapshot)
  {
    double v4 = [(IMViewControllerTransition *)self fromViewController];
    double v5 = [v4 view];
    double v6 = [v5 im_snapshotInContext];

    if (v6)
    {
      double v7 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v6];
      double v8 = self->_fromViewSnapshot;
      self->_fromViewSnapshot = v7;

      double v9 = [(IMViewControllerTransition *)self fromViewController];
      CGFloat v10 = [v9 view];
      [v10 frame];
      -[UIImageView setFrame:](self->_fromViewSnapshot, "setFrame:");
    }
    fromViewSnapshot = self->_fromViewSnapshot;
  }

  return fromViewSnapshot;
}

- (UIImageView)toViewSnapshot
{
  toViewSnapshot = self->_toViewSnapshot;
  if (!toViewSnapshot)
  {
    double v4 = [(IMViewControllerTransition *)self toViewController];
    double v5 = [v4 view];
    double v6 = [v5 im_snapshotInContext];

    if (v6)
    {
      double v7 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v6];
      double v8 = self->_toViewSnapshot;
      self->_toViewSnapshot = v7;

      double v9 = [(IMViewControllerTransition *)self toViewController];
      CGFloat v10 = [v9 view];
      [v10 frame];
      -[UIImageView setFrame:](self->_toViewSnapshot, "setFrame:");
    }
    toViewSnapshot = self->_toViewSnapshot;
  }

  return toViewSnapshot;
}

- (void)setReverse:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(IMTransition *)self reverse];
  v6.receiver = self;
  v6.super_class = (Class)IMViewControllerTransition;
  [(IMTransition *)&v6 setReverse:v3];
  if (v5 != [(IMTransition *)self reverse])
  {
    if (self->_toViewSnapshot) {
      [(IMViewControllerTransition *)self setToViewSnapshot:0];
    }
    if (self->_fromViewSnapshot) {
      [(IMViewControllerTransition *)self setFromViewSnapshot:0];
    }
  }
}

- (void)loadToView
{
  objc_super v2 = [(IMViewControllerTransition *)self toViewController];
  id v3 = [v2 view];
}

- (void)beginAppearanceTransition
{
  id v11 = [(IMTransition *)self parentViewController];
  if ([v11 isViewLoaded])
  {
    id v3 = [(IMTransition *)self parentViewController];
    double v4 = [v3 view];
    unsigned int v5 = [v4 window];

    if (!v5) {
      return;
    }
    BOOL v6 = [(IMTransition *)self animated];
    double v7 = [(IMTransition *)self parentViewController];
    unsigned __int8 v8 = [v7 shouldAutomaticallyForwardAppearanceMethods];

    double v9 = [(IMViewControllerTransition *)self fromViewController];
    CGFloat v10 = v9;
    if (v8)
    {
      [v9 beginAppearanceTransition:0 animated:v6];

      id v11 = [(IMViewControllerTransition *)self toViewController];
      [v11 beginAppearanceTransition:1 animated:v6];
    }
    else
    {
      [v9 viewWillDisappear:v6];

      id v11 = [(IMViewControllerTransition *)self toViewController];
      [v11 viewWillAppear:v6];
    }
  }
}

- (void)endAppearanceTransition
{
  id v11 = [(IMTransition *)self parentViewController];
  if ([v11 isViewLoaded])
  {
    id v3 = [(IMTransition *)self parentViewController];
    double v4 = [v3 view];
    unsigned int v5 = [v4 window];

    if (!v5) {
      return;
    }
    BOOL v6 = [(IMTransition *)self parentViewController];
    unsigned __int8 v7 = [v6 shouldAutomaticallyForwardAppearanceMethods];

    if (v7)
    {
      unsigned __int8 v8 = [(IMViewControllerTransition *)self fromViewController];
      [v8 endAppearanceTransition];

      id v11 = [(IMViewControllerTransition *)self toViewController];
      [v11 endAppearanceTransition];
    }
    else
    {
      BOOL v9 = [(IMTransition *)self animated];
      CGFloat v10 = [(IMViewControllerTransition *)self fromViewController];
      [v10 viewDidDisappear:v9];

      id v11 = [(IMViewControllerTransition *)self toViewController];
      [v11 viewDidAppear:v9];
    }
  }
}

- (void)_updateParentViewBackgroundColorForToView:(id)a3
{
  id v6 = [a3 backgroundColor];
  double v4 = [(IMTransition *)self parentViewController];
  unsigned int v5 = [v4 view];
  [v5 setBackgroundColor:v6];
}

- (void)setFromViewSnapshot:(id)a3
{
}

- (void)setToViewSnapshot:(id)a3
{
}

- (IMViewControllerContaining)fromViewController
{
  return self->_fromViewController;
}

- (void)setFromViewController:(id)a3
{
}

- (IMViewControllerContaining)toViewController
{
  return self->_toViewController;
}

- (void)setToViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toViewSnapshot, 0);
  objc_storeStrong((id *)&self->_fromViewSnapshot, 0);
  objc_storeStrong((id *)&self->_toViewController, 0);

  objc_storeStrong((id *)&self->_fromViewController, 0);
}

@end