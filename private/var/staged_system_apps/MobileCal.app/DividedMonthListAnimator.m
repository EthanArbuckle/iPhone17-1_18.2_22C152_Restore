@interface DividedMonthListAnimator
- (id)_animateView:(id)a3 toPosition:(CGPoint)a4;
- (void)animateToListWithCompletion:(id)a3 inContext:(id)a4;
- (void)animateToMonthWithCompletion:(id)a3 inContext:(id)a4;
@end

@implementation DividedMonthListAnimator

- (void)animateToMonthWithCompletion:(id)a3 inContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CompactMonthListAnimator *)self animating]) {
    [(CompactMonthListAnimator *)self _haltAnimations];
  }
  v8 = [v7 containerView];
  v9 = [(CompactMonthListAnimator *)self monthViewController];
  v10 = [v9 view];
  [v10 frame];
  uint64_t v12 = v11;
  uint64_t v14 = v13;

  v15 = [(CompactMonthListAnimator *)self monthViewController];
  [v15 frameOfListView];
  CGFloat v16 = CGRectGetMinY(v116) + -63.0 + -17.0;

  [(CompactMonthListAnimator *)self setAnimating:1];
  v17 = [(CompactMonthListAnimator *)self paletteView];
  v18 = [v17 dateLabel];
  [v18 setHidden:1];

  v19 = [(CompactMonthListAnimator *)self paletteView];
  v20 = [v19 animatableDateLabel];
  [v20 setAlpha:0.0];

  v21 = [(CompactMonthListAnimator *)self paletteView];
  v22 = [v21 dayInitialsHeaderView];
  [v22 setAlpha:0.0];

  [(CompactMonthListAnimator *)self weekDayInitialsMonth];
  double v24 = v23;
  [(CompactMonthListAnimator *)self weekDayInitialsMonth];
  double v26 = v25;
  [(CompactMonthListAnimator *)self weekDayInitialsMonth];
  double v28 = v27;
  v29 = [(CompactMonthListAnimator *)self paletteView];
  v30 = [v29 dayInitialsHeaderView];
  [v30 setFrame:v24, 0.0, v26, v28];

  v31 = [(CompactMonthListAnimator *)self paletteView];
  LOBYTE(v29) = [v31 dividerLineVisible];

  v32 = [(CompactMonthListAnimator *)self paletteView];
  [v32 setDividerLineVisible:0];

  v33 = [(CompactMonthListAnimator *)self paletteView];
  [v33 setSuppressLayout:1];

  springAnimationDuration();
  double v35 = v34;
  v36 = +[SpringFactory sharedFactory];
  v111 = _NSConcreteStackBlock;
  uint64_t v112 = 3221225472;
  v113 = sub_10007551C;
  v114 = &unk_1001D2740;
  v115 = self;
  v37 = navigationAnimationsPreferringFRR();
  v108[0] = _NSConcreteStackBlock;
  v108[1] = 3221225472;
  v108[2] = sub_100075614;
  v108[3] = &unk_1001D3688;
  char v110 = (char)v29;
  v108[4] = self;
  id v109 = v6;
  id v38 = v6;
  +[UIView _animateWithDuration:393216 delay:v36 options:v37 factory:v108 animations:v35 completion:0.0];

  v39 = [(CompactMonthListAnimator *)self monthViewController];
  v40 = [v39 view];
  [v40 frame];
  double v42 = v41;
  double v44 = v43;

  v45 = [(CompactMonthListAnimator *)self monthViewController];
  v46 = [v45 view];
  [v46 setFrame:CGRectMake(0.0, -v16, v42, v44)];

  springAnimationDuration();
  double v48 = v47;
  v49 = +[SpringFactory sharedFactory];
  v101 = _NSConcreteStackBlock;
  uint64_t v102 = 3221225472;
  v103 = sub_100075720;
  v104 = &unk_1001D2A18;
  v105 = self;
  uint64_t v106 = v12;
  uint64_t v107 = v14;
  v50 = navigationAnimationsPreferringFRR();
  +[UIView _animateWithDuration:393216 delay:v49 options:v50 factory:0 animations:v48 completion:0.0];

  v51 = [(CompactMonthListAnimator *)self listViewController];
  v52 = [v51 view];
  [v52 setHidden:1];

  v53 = [(CompactMonthListAnimator *)self listViewController];
  v54 = [v53 view];
  [v54 frame];
  double v56 = v55;
  v57 = [(CompactMonthListAnimator *)self listViewController];
  v58 = [v57 view];
  [v58 frame];
  double v60 = v59;
  v61 = [(CompactMonthListAnimator *)self listViewController];
  v62 = [v61 view];
  [v62 setFrame:0.0, 0.0, v56, v60];

  v63 = [(CompactMonthListAnimator *)self listViewController];
  v64 = [v63 view];
  v65 = [v64 snapshotViewAfterScreenUpdates:0];

  v66 = [(CompactMonthListAnimator *)self listViewController];
  v67 = [v66 view];
  [v8 insertSubview:v65 aboveSubview:v67];

  [v65 frame];
  double v69 = v68;
  double v71 = v70;
  double v73 = v72;
  double v75 = v74;
  v76 = [(CompactMonthListAnimator *)self listViewController];
  v77 = [v76 view];
  v78 = [v77 superview];
  [v8 convertRect:v78 fromView:v69];
  double v80 = v79;
  double v82 = v81;
  double v84 = v83;
  double v86 = v85;

  [v65 setFrame:v80, v82, v84, v86];
  springAnimationDuration();
  double v88 = v87;
  v89 = +[SpringFactory sharedFactory];
  v95 = _NSConcreteStackBlock;
  uint64_t v96 = 3221225472;
  v97 = sub_1000757DC;
  v98 = &unk_1001D28A8;
  v99 = self;
  id v100 = v65;
  v90 = navigationAnimationsPreferringFRR();
  v92[0] = _NSConcreteStackBlock;
  v92[1] = 3221225472;
  v92[2] = sub_1000758FC;
  v92[3] = &unk_1001D3188;
  id v93 = v100;
  v94 = self;
  id v91 = v100;
  +[UIView _animateWithDuration:393216 delay:v89 options:v90 factory:v92 animations:v88 completion:0.0];
}

- (id)_animateView:(id)a3 toPosition:(CGPoint)a4
{
  v4 = springAnimateViewPosition();
  preferredNavigationAnimationFrameRateRange();
  [v4 setPreferredFrameRateRange:];

  return v4;
}

- (void)animateToListWithCompletion:(id)a3 inContext:(id)a4
{
  id v91 = a3;
  id v6 = a4;
  if ([(CompactMonthListAnimator *)self animating]) {
    [(CompactMonthListAnimator *)self _haltAnimations];
  }
  v90 = [v6 containerView];
  id v7 = [(CompactMonthListAnimator *)self monthViewController];
  v8 = [v7 view];
  [v8 frame];
  double v10 = v9;

  uint64_t v11 = [(CompactMonthListAnimator *)self monthViewController];
  [v11 frameOfListView];
  CGFloat v12 = CGRectGetMinY(v123) + -63.0 + -17.0;

  uint64_t v13 = [(CompactMonthListAnimator *)self monthViewController];
  uint64_t v14 = [v13 view];
  [v14 setAlpha:1.0];

  dispatch_time_t v15 = dispatch_time(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100076260;
  block[3] = &unk_1001D2740;
  block[4] = self;
  dispatch_after(v15, (dispatch_queue_t)&_dispatch_main_q, block);
  CGFloat v16 = [(CompactMonthListAnimator *)self monthViewController];
  v17 = [v16 view];
  v18 = [v17 snapshotViewAfterScreenUpdates:0];

  [v90 addSubview:v18];
  [v18 setAlpha:1.0];
  v19 = [(CompactMonthListAnimator *)self monthViewController];
  v20 = [v19 view];
  [v20 frame];
  double v22 = v21;
  double v24 = v23;

  [v18 setFrame:v10, 0.0, v22, v24];
  [(CompactMonthListAnimator *)self setAnimating:1];
  [(CompactMonthListAnimator *)self weekDayInitialsMonth];
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  v33 = [(CompactMonthListAnimator *)self paletteView];
  double v34 = [v33 dayInitialsHeaderView];
  [v34 setFrame:v26, v28, v30, v32];

  double v35 = [(CompactMonthListAnimator *)self paletteView];
  v36 = [v35 dayInitialsHeaderView];
  [v36 setAlpha:1.0];

  v37 = [(CompactMonthListAnimator *)self paletteView];
  id v38 = [v37 dateLabel];
  [v38 setHidden:1];

  v39 = [(CompactMonthListAnimator *)self paletteView];
  v40 = [v39 animatableDateLabel];
  [v40 setAlpha:1.0];

  double v41 = [(CompactMonthListAnimator *)self paletteView];
  LOBYTE(v39) = [v41 dividerLineVisible];

  double v42 = [(CompactMonthListAnimator *)self paletteView];
  [v42 setDividerLineVisible:0];

  double v43 = [(CompactMonthListAnimator *)self paletteView];
  [v43 setSuppressLayout:1];

  springAnimationDuration();
  double v45 = v44;
  v46 = +[SpringFactory sharedFactory];
  v117 = _NSConcreteStackBlock;
  uint64_t v118 = 3221225472;
  v119 = sub_1000762C0;
  v120 = &unk_1001D2740;
  v121 = self;
  double v47 = navigationAnimationsPreferringFRR();
  v114[0] = _NSConcreteStackBlock;
  v114[1] = 3221225472;
  v114[2] = sub_1000763C4;
  v114[3] = &unk_1001D3688;
  char v116 = (char)v39;
  v114[4] = self;
  id v115 = v91;
  id v92 = v91;
  +[UIView _animateWithDuration:393216 delay:v46 options:v47 factory:v114 animations:v45 completion:0.0];

  springAnimationDuration();
  double v49 = v48;
  v50 = +[SpringFactory sharedFactory];
  v108 = _NSConcreteStackBlock;
  uint64_t v109 = 3221225472;
  char v110 = sub_1000764FC;
  v111 = &unk_1001D2A40;
  id v112 = v18;
  CGFloat v113 = v12;
  v51 = navigationAnimationsPreferringFRR();
  v105[0] = _NSConcreteStackBlock;
  v105[1] = 3221225472;
  v105[2] = sub_100076550;
  v105[3] = &unk_1001D3188;
  id v106 = v112;
  uint64_t v107 = self;
  id v52 = v112;
  +[UIView _animateWithDuration:393216 delay:v50 options:v51 factory:v105 animations:v49 completion:0.0];

  v53 = [(CompactMonthListAnimator *)self listViewController];
  v54 = [v53 view];
  [v54 setHidden:0];

  dispatch_time_t v55 = dispatch_time(0, 0);
  v104[0] = _NSConcreteStackBlock;
  v104[1] = 3221225472;
  v104[2] = sub_1000765BC;
  v104[3] = &unk_1001D2740;
  v104[4] = self;
  dispatch_after(v55, (dispatch_queue_t)&_dispatch_main_q, v104);

  double v56 = [(CompactMonthListAnimator *)self listViewController];
  v57 = [v56 view];
  v58 = [v57 snapshotViewAfterScreenUpdates:1];

  [v90 addSubview:v58];
  [v58 frame];
  double v60 = v59;
  double v62 = v61;
  double v64 = v63;
  double v66 = v65;
  v67 = [(CompactMonthListAnimator *)self listViewController];
  double v68 = [v67 view];
  double v69 = [v68 superview];
  [v90 convertRect:v69 fromView:v60 toView:v62];
  double v71 = v70;
  double v73 = v72;
  double v75 = v74;
  double v77 = v76;

  [v58 setFrame:v71, v73, v75, v77];
  v78 = [(CompactMonthListAnimator *)self monthViewController];
  [v78 frameOfListView];
  double MinY = CGRectGetMinY(v124);
  double v80 = [(CompactMonthListAnimator *)self monthViewController];
  double v81 = [v80 view];
  [v81 frame];
  CGFloat v82 = MinY / CGRectGetHeight(v125);

  [v58 frame];
  CGFloat Height = CGRectGetHeight(v126);
  CATransform3DMakeTranslation(&a, 0.0, Height * 0.5, 0.0);
  CATransform3DMakeScale(&b, 1.0, v82, 1.0);
  CATransform3DConcat(&v103, &a, &b);
  double v84 = [v58 layer];
  CATransform3D v100 = v103;
  [v84 setTransform:&v100];

  [v58 setAlpha:0.0];
  springAnimationDuration();
  double v86 = v85;
  double v87 = +[SpringFactory sharedFactory];
  v95 = _NSConcreteStackBlock;
  uint64_t v96 = 3221225472;
  v97 = sub_1000766C8;
  v98 = &unk_1001D2740;
  id v99 = v58;
  double v88 = navigationAnimationsPreferringFRR();
  v93[0] = _NSConcreteStackBlock;
  v93[1] = 3221225472;
  v93[2] = sub_100076740;
  v93[3] = &unk_1001D3188;
  v93[4] = self;
  id v94 = v99;
  id v89 = v99;
  +[UIView _animateWithDuration:393216 delay:v87 options:v88 factory:v93 animations:v86 completion:0.0];
}

@end