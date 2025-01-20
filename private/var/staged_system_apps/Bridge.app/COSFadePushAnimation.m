@interface COSFadePushAnimation
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation COSFadePushAnimation

- (double)transitionDuration:(id)a3
{
  return 0.5;
}

- (void)animateTransition:(id)a3
{
  id v3 = a3;
  v4 = [v3 viewForKey:UITransitionContextFromViewKey];
  v5 = [v3 viewForKey:UITransitionContextToViewKey];
  v6 = [v3 containerView];
  [v4 setAlpha:1.0];
  [v5 setAlpha:0.0];
  [v6 bounds];
  [v5 setFrame:];
  [v6 addSubview:v5];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100081474;
  v13[3] = &unk_100243908;
  id v14 = v4;
  id v15 = v5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000814B8;
  v10[3] = &unk_1002453D0;
  id v11 = v14;
  id v12 = v3;
  id v7 = v3;
  id v8 = v14;
  id v9 = v5;
  +[UIView animateWithDuration:v13 animations:v10 completion:0.5];
}

@end