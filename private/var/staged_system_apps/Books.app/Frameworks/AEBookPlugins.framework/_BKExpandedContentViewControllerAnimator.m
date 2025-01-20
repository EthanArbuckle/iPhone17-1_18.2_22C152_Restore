@interface _BKExpandedContentViewControllerAnimator
- (CGRect)sourceRect;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
- (void)setSourceRect:(CGRect)a3;
@end

@implementation _BKExpandedContentViewControllerAnimator

- (double)transitionDuration:(id)a3
{
  return 0.4;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  v5 = [v4 viewControllerForKey:UITransitionContextFromViewControllerKey];
  v6 = [v4 viewControllerForKey:UITransitionContextToViewControllerKey];
  v7 = [v4 containerView];
  v8 = [v5 view];
  v9 = [v8 snapshotViewAfterScreenUpdates:0];

  [v7 bounds];
  UIRectGetCenter();
  [v9 setCenter:];
  [v9 setUserInteractionEnabled:0];
  [v7 addSubview:v9];
  [v4 finalFrameForViewController:v6];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v18 = [v6 view];
  [v18 setFrame:v11, v13, v15, v17];
  [v18 setAlpha:0.0];
  _UIScaleTransformForAspectFitOfSizeInTargetSize();
  v36[0] = v36[3];
  v36[1] = v36[4];
  v36[2] = v36[5];
  [v18 setTransform:v36];
  UIRectGetCenter();
  [v18 setCenter:];
  [v7 addSubview:v18];
  v19 = [v5 view];
  [v19 setUserInteractionEnabled:0];

  [(_BKExpandedContentViewControllerAnimator *)self transitionDuration:v4];
  double v21 = v20;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_72A80;
  v30[3] = &unk_1DC7A0;
  id v31 = v18;
  double v32 = v11;
  double v33 = v13;
  double v34 = v15;
  double v35 = v17;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_72AEC;
  v26[3] = &unk_1DC7C8;
  id v27 = v5;
  id v28 = v9;
  id v29 = v4;
  id v22 = v4;
  id v23 = v9;
  id v24 = v5;
  id v25 = v18;
  +[UIView animateWithDuration:262145 delay:v30 options:v26 animations:v21 completion:0.0];
}

- (CGRect)sourceRect
{
  double x = self->_sourceRect.origin.x;
  double y = self->_sourceRect.origin.y;
  double width = self->_sourceRect.size.width;
  double height = self->_sourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

@end