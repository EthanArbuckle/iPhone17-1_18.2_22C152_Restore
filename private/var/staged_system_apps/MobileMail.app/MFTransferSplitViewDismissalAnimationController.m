@interface MFTransferSplitViewDismissalAnimationController
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation MFTransferSplitViewDismissalAnimationController

- (double)transitionDuration:(id)a3
{
  return 0.3;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  v52 = [v4 viewControllerForKey:UITransitionContextToViewControllerKey];
  v51 = [v4 viewControllerForKey:UITransitionContextFromViewControllerKey];
  v5 = [v4 containerView];
  v6 = [v52 view];
  [v5 addSubview:v6];

  [v4 finalFrameForViewController:v52];
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  v15 = [v51 viewControllerForColumn:0];
  v16 = [v15 view];

  v53 = [v16 snapshotViewAfterScreenUpdates:0];
  [v5 addSubview:];
  v17 = [v51 viewControllerForColumn:1];
  v18 = [v17 view];

  v19 = [v18 snapshotViewAfterScreenUpdates:0];
  [v5 addSubview:v19];
  unsigned int v20 = [v5 _shouldReverseLayoutDirection];
  sub_1001F4508(v19, v20 ^ 1);
  [v16 bounds];
  [v16 convertRect:v5 toView:];
  double v22 = v21;
  uint64_t v24 = v23;
  double v26 = v25;
  uint64_t v28 = v27;
  [v53 setFrame:];
  uint64_t v45 = v28;
  uint64_t v46 = v24;
  uint64_t v47 = v14;
  uint64_t v48 = v12;
  uint64_t v49 = v10;
  uint64_t v50 = v8;
  [v18 bounds];
  [v18 convertRect:v5 toView:];
  double v30 = v29;
  uint64_t v32 = v31;
  double v34 = v33;
  uint64_t v36 = v35;
  [v19 setFrame:];
  if (v20) {
    double v37 = v26;
  }
  else {
    double v37 = -v26;
  }
  if (v20) {
    double v38 = v26 + v34;
  }
  else {
    double v38 = -(v26 + v34);
  }
  [v16 setAlpha:0.0];
  [v18 setAlpha:0.0];
  [(MFTransferSplitViewDismissalAnimationController *)self transitionDuration:v4];
  double v44 = v39;
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_1001F4D1C;
  v58[3] = &unk_10060D558;
  id v59 = v53;
  double v62 = v22 + v37;
  uint64_t v63 = v46;
  double v64 = v26;
  uint64_t v65 = v45;
  id v60 = v19;
  double v66 = v30 + v38;
  uint64_t v67 = v32;
  double v68 = v34;
  uint64_t v69 = v36;
  id v40 = v52;
  id v61 = v40;
  uint64_t v70 = v50;
  uint64_t v71 = v49;
  uint64_t v72 = v48;
  uint64_t v73 = v47;
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_1001F4DC8;
  v54[3] = &unk_100607890;
  id v41 = v59;
  id v55 = v41;
  id v42 = v60;
  id v56 = v42;
  id v43 = v4;
  id v57 = v43;
  +[UIView animateWithDuration:0 delay:v58 usingSpringWithDamping:v54 initialSpringVelocity:v44 options:0.0 animations:1.0 completion:0.0];
}

@end