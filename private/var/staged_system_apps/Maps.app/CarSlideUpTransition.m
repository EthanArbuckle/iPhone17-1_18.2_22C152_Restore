@interface CarSlideUpTransition
- (double)transitionDuration:(id)a3;
- (int64_t)operation;
- (void)_animateTransitionForPop:(id)a3;
- (void)_animateTransitionForPush:(id)a3;
- (void)_bringNavigationBarToFront:(id)a3;
- (void)_sendNavigationBarToBack:(id)a3;
- (void)animateTransition:(id)a3;
- (void)setOperation:(int64_t)a3;
@end

@implementation CarSlideUpTransition

- (double)transitionDuration:(id)a3
{
  int64_t v3 = [(CarSlideUpTransition *)self operation];
  double result = 0.3;
  if (v3 != 1) {
    double result = 0.0;
  }
  if (v3 == 2) {
    return 0.2;
  }
  return result;
}

- (void)animateTransition:(id)a3
{
  id v5 = a3;
  -[CarSlideUpTransition _sendNavigationBarToBack:](self, "_sendNavigationBarToBack:");
  int64_t v4 = [(CarSlideUpTransition *)self operation];
  if (v4 == 1)
  {
    [(CarSlideUpTransition *)self _animateTransitionForPush:v5];
  }
  else if (v4 == 2)
  {
    [(CarSlideUpTransition *)self _animateTransitionForPop:v5];
  }
}

- (void)_sendNavigationBarToBack:(id)a3
{
  int64_t v4 = [a3 containerView];
  uint64_t v5 = [v4 superview];
  if (v5)
  {
    v6 = (void *)v5;
    p_navigationBar = &self->_navigationBar;
    do
    {
      id WeakRetained = objc_loadWeakRetained((id *)p_navigationBar);

      if (WeakRetained) {
        break;
      }
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      v9 = [v6 subviews];
      id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v20;
        while (2)
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v15 = objc_storeWeak((id *)p_navigationBar, v14);
              v16 = [v14 superview];
              id v17 = objc_loadWeakRetained((id *)p_navigationBar);
              [v16 sendSubviewToBack:v17];

              goto LABEL_14;
            }
          }
          id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
LABEL_14:

      uint64_t v18 = [v6 superview];

      v6 = (void *)v18;
    }
    while (v18);
  }
}

- (void)_bringNavigationBarToFront:(id)a3
{
  p_navigationBar = &self->_navigationBar;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationBar);

  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)p_navigationBar);
    uint64_t v5 = [v7 superview];
    id v6 = objc_loadWeakRetained((id *)p_navigationBar);
    [v5 bringSubviewToFront:v6];
  }
}

- (void)_animateTransitionForPush:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 containerView];
  id v6 = [v4 viewControllerForKey:UITransitionContextFromViewControllerKey];
  id v7 = [v6 view];
  [v5 addSubview:v7];
  v8 = [v4 viewControllerForKey:UITransitionContextToViewControllerKey];
  v9 = [v8 view];
  [v5 addSubview:v9];
  [v4 finalFrameForViewController:v8];
  double v11 = v10;
  uint64_t v13 = v12;
  double v15 = v14;
  double v17 = v16;
  [v5 bounds];
  [v9 setFrame:v11, CGRectGetHeight(v34), v15, v17];
  [(CarSlideUpTransition *)self transitionDuration:v4];
  double v19 = v18;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100BCF40C;
  v27[3] = &unk_1012EE7E0;
  id v28 = v7;
  id v29 = v9;
  double v30 = v11;
  uint64_t v31 = v13;
  double v32 = v15;
  double v33 = v17;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100BCF454;
  v23[3] = &unk_101319950;
  id v24 = v28;
  v25 = self;
  id v26 = v4;
  id v20 = v4;
  id v21 = v28;
  id v22 = v9;
  +[UIView animateWithDuration:0x20000 delay:v27 options:v23 animations:v19 completion:0.0];
}

- (void)_animateTransitionForPop:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 containerView];
  id v6 = [v4 viewControllerForKey:UITransitionContextToViewControllerKey];
  id v7 = [v6 view];
  [v5 addSubview:v7];
  v8 = [v4 viewControllerForKey:UITransitionContextFromViewControllerKey];
  v9 = [v8 view];
  [v5 addSubview:v9];
  [v4 finalFrameForViewController:v6];
  [v7 setFrame:];
  [v7 setAlpha:0.0];
  [v9 frame];
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  [v5 bounds];
  CGFloat Height = CGRectGetHeight(v31);
  [(CarSlideUpTransition *)self transitionDuration:v4];
  double v18 = v17;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100BCF6CC;
  v24[3] = &unk_1012EE7E0;
  id v25 = v7;
  id v26 = v9;
  uint64_t v27 = v11;
  CGFloat v28 = Height;
  uint64_t v29 = v13;
  uint64_t v30 = v15;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100BCF714;
  v22[3] = &unk_1012E6160;
  v22[4] = self;
  id v23 = v4;
  id v19 = v4;
  id v20 = v9;
  id v21 = v7;
  +[UIView animateWithDuration:0x20000 delay:v24 options:v22 animations:v18 completion:0.0];
}

- (int64_t)operation
{
  return self->_operation;
}

- (void)setOperation:(int64_t)a3
{
  self->_operation = a3;
}

- (void).cxx_destruct
{
}

@end