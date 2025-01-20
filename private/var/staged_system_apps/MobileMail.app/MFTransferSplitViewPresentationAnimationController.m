@interface MFTransferSplitViewPresentationAnimationController
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation MFTransferSplitViewPresentationAnimationController

- (double)transitionDuration:(id)a3
{
  return 0.3;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  v63 = v4;
  v5 = [v4 viewControllerForKey:UITransitionContextToViewControllerKey];
  v61 = [v4 viewControllerForKey:UITransitionContextFromViewControllerKey];
  v6 = [v61 rootViewController];
  v62 = v6;
  v60 = objc_opt_new();
  v7 = +[UIColor clearColor];
  [v60 setBorderColor:v7];

  [v5 setConfiguration:v60];
  v59 = [v4 containerView];
  v8 = [v5 view];
  [v59 addSubview:v8];

  v58 = [v6 viewControllerForColumn:0];
  v9 = [v58 view];
  uint64_t v10 = [v9 snapshotViewAfterScreenUpdates:0];

  v57 = (void *)v10;
  v11 = [v5 viewControllerForColumn:0];
  v12 = [v11 view];

  v67 = v12;
  v13 = [v12 superview];
  [v13 insertSubview:v10 below:v12];

  v14 = [v12 superview];
  [v14 setClipsToBounds:1];

  v56 = [v6 viewControllerForColumn:1];
  v15 = [v56 view];
  v66 = [v15 snapshotViewAfterScreenUpdates:0];

  v16 = [v5 viewControllerForColumn:1];
  v17 = [v16 view];

  v18 = [v17 superview];
  [v18 insertSubview:v66 below:v17];

  v19 = [v17 superview];
  [v19 setClipsToBounds:1];

  unsigned int v20 = [v59 _shouldReverseLayoutDirection];
  sub_1001F4508(v17, v20 ^ 1);
  [v12 frame];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  [v17 frame];
  double v64 = v30;
  double v65 = v29;
  double v32 = v31;
  double v34 = v33;
  double v35 = -v26;
  if (v20) {
    double v35 = v26;
  }
  [v12 setFrame:v22 + v35, v24, v26, v28];
  double v36 = v26 + v34;
  if (!v20) {
    double v36 = -(v26 + v34);
  }
  [v17 setFrame:v32 + v36, v65, v34, v64];
  v37 = [v6 messageDetailNavController];
  v38 = [v37 view];
  [v38 setAlpha:0.0];
  double v39 = v22;

  id v40 = objc_alloc((Class)UIViewPropertyAnimator);
  [(MFTransferSplitViewPresentationAnimationController *)self transitionDuration:v4];
  double v42 = v41;
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472;
  v80[2] = sub_1001F46A0;
  v80[3] = &unk_10060D4E0;
  id v55 = v67;
  id v81 = v55;
  double v83 = v39;
  double v84 = v24;
  double v85 = v26;
  double v86 = v28;
  id v43 = v17;
  id v82 = v43;
  double v87 = v32;
  double v88 = v65;
  double v89 = v34;
  double v90 = v64;
  id v44 = [v40 initWithDuration:v80 dampingRatio:v42 animations:1.0];
  id v45 = objc_alloc((Class)UIViewPropertyAnimator);
  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472;
  v78[2] = sub_1001F46EC;
  v78[3] = &unk_1006047A0;
  id v46 = v43;
  id v79 = v46;
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472;
  v76[2] = sub_1001F4750;
  v76[3] = &unk_10060D508;
  id v47 = [v45 initWithDuration:2 curve:v78 animations:0.2];
  id v77 = v47;
  [v44 addCompletion:v76];
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472;
  v68[2] = sub_1001F4758;
  v68[3] = &unk_10060D530;
  id v48 = v57;
  id v69 = v48;
  id v49 = v66;
  id v70 = v49;
  id v50 = v46;
  id v71 = v50;
  id v51 = v62;
  id v72 = v51;
  id v52 = v60;
  id v73 = v52;
  id v53 = v5;
  id v74 = v53;
  id v54 = v63;
  id v75 = v54;
  [v47 addCompletion:v68];
  [v44 startAnimation];
}

@end